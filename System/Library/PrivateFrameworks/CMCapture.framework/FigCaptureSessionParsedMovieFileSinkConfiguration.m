@implementation FigCaptureSessionParsedMovieFileSinkConfiguration

- (_QWORD)initWithCaptureConnectionConfigurations:(void *)a3 stillImageConnectionConfiguration:(void *)a4 sceneClassifierConnectionConfigurationsBySourceID:
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  CFArrayRef Identifiers;
  _QWORD *v15;
  _QWORD *v16;
  id v17;
  void *v18;
  int v19;
  void *v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v30.receiver = a1;
  v30.super_class = (Class)FigCaptureSessionParsedMovieFileSinkConfiguration;
  v7 = objc_msgSendSuper2(&v30, sel_init);
  if (!v7)
    return 0;
  v21 = a4;
  v22 = a3;
  v23 = v7;
  v24 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (!v8)
    goto LABEL_26;
  v9 = v8;
  v10 = *(_QWORD *)v27;
  v25 = *MEMORY[0x1E0CA4BE0];
  while (2)
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v27 != v10)
        objc_enumerationMutation(a2);
      v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      v13 = objc_msgSend(v12, "mediaType");
      if (v13 > 1936684397)
      {
        v15 = v23 + 1;
        if (v13 == 1986618469)
          goto LABEL_23;
        v15 = v23 + 2;
        if (v13 == 1936684398)
          goto LABEL_23;
      }
      else
      {
        if (v13 == 1685091432)
        {
          v15 = v23 + 5;
LABEL_23:
          *v15 = v12;
          continue;
        }
        if (v13 == 1835365473
          && objc_msgSend((id)objc_msgSend(v12, "sourceConfiguration"), "sourceType") == 1)
        {
          if (!objc_msgSend(v12, "formatDescription")
            || (Identifiers = CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)objc_msgSend(v12, "formatDescription")),
                !-[__CFArray count](Identifiers, "count")))
          {
LABEL_30:
            fig_log_get_emitter();
            FigDebugAssert3();
            FigSignalErrorAt();

            return 0;
          }
          if (FigMetadataItemConnectionConfigurationRequiresObjectDetection(v12))
            objc_msgSend(v24, "addObject:", v12);
          if (-[__CFArray containsObject:](Identifiers, "containsObject:", v25))
          {
            v15 = v23 + 3;
            if (v23[3])
              goto LABEL_30;
            goto LABEL_23;
          }
        }
      }
    }
    v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v9)
      continue;
    break;
  }
LABEL_26:
  v16 = v23;
  v23[6] = v22;
  v17 = (id)objc_msgSend(v24, "count");
  if (v17)
    v17 = v24;
  v23[4] = v17;
  v18 = (void *)objc_msgSend(v21, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)v23[1], "sourceConfiguration"), "sourceID"));
  v19 = objc_msgSend(v18, "underlyingDeviceType");
  if (v19 == objc_msgSend((id)v23[1], "underlyingDeviceType"))
    v23[7] = v18;
  return v16;
}

- (FigVideoCaptureConnectionConfiguration)videoConnectionConfiguration
{
  return self->_videoConnectionConfiguration;
}

- (FigVideoCaptureConnectionConfiguration)stillImageConnectionConfiguration
{
  return self->_stillImageConnectionConfiguration;
}

- (NSArray)detectedObjectMetadataConnectionConfigurations
{
  return self->_detectedObjectMetadataConnectionConfigurations;
}

- (FigAudioCaptureConnectionConfiguration)audioConnectionConfiguration
{
  return self->_audioConnectionConfiguration;
}

- (FigVideoCaptureConnectionConfiguration)sceneClassifierConnectionConfiguration
{
  return self->_sceneClassifierConnectionConfiguration;
}

- (FigDepthDataCaptureConnectionConfiguration)depthDataConnectionConfiguration
{
  return self->_depthDataConnectionConfiguration;
}

- (FigMetadataItemCaptureConnectionConfiguration)cameraDebugInfoMetadataConnectionConfiguration
{
  return self->_cameraDebugInfoMetadataConnectionConfiguration;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionParsedMovieFileSinkConfiguration;
  -[FigCaptureSessionParsedMovieFileSinkConfiguration dealloc](&v3, sel_dealloc);
}

@end
