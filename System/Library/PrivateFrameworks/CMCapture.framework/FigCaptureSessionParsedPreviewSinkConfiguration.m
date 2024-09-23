@implementation FigCaptureSessionParsedPreviewSinkConfiguration

- (_DWORD)initWithParsedCameraSourceConfiguration:(int)a3 sourceDeviceType:
{
  _DWORD *v5;
  _DWORD *v6;
  void *v7;
  void *v8;
  _DWORD *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t i;
  void *v18;
  int v19;
  _QWORD *v20;
  int v21;
  id v22;
  void *v24;
  _DWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v33.receiver = a1;
  v33.super_class = (Class)FigCaptureSessionParsedPreviewSinkConfiguration;
  v5 = objc_msgSendSuper2(&v33, sel_init);
  if (!v5)
    return 0;
  v6 = v5;
  v5[20] = a3;
  v7 = FigCaptureConnectionConfigurationWithUnderlyingDeviceType((void *)objc_msgSend(a2, "metadataObjectConnectionConfigurations"), a3);
  *((_QWORD *)v6 + 7) = v7;
  v28 = FigCaptureMetadataObjectConfigurationRequiresFaceTracking(v7);
  if (objc_msgSend((id)objc_msgSend(a2, "stillImageConnectionConfiguration"), "underlyingDeviceType") == a3)
    v8 = (void *)objc_msgSend(a2, "stillImageConnectionConfiguration");
  else
    v8 = 0;
  v24 = a2;
  v25 = v6;
  *((_QWORD *)v6 + 8) = v8;
  v10 = (void *)FigCaptureConnectionConfigurationsFilterWithUnderlyingDeviceType((void *)objc_msgSend(a2, "previewDerivedConnectionConfigurations"), a3);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v11)
  {
    v12 = v11;
    v26 = v6 + 12;
    v27 = v6 + 10;
    v13 = *(_QWORD *)v30;
    v14 = v6 + 8;
    v15 = v6 + 6;
    v16 = v6 + 4;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v19 = objc_msgSend((id)objc_msgSend(v18, "sinkConfiguration"), "sinkType");
        if (v19 > 11)
        {
          if (v19 == 14)
          {
            v21 = objc_msgSend((id)objc_msgSend(v18, "sinkConfiguration"), "subType");
            v20 = v14;
            if (!v21)
              goto LABEL_25;
            if (v21 == 3)
            {
              v20 = v26;
LABEL_25:
              *v20 = v18;
              continue;
            }
            v20 = v27;
            if (v21 == 1)
              goto LABEL_25;
          }
          else
          {
            v20 = v16;
            if (v19 == 12)
              goto LABEL_25;
          }
        }
        else
        {
          v20 = v25 + 2;
          if (v19 == 1)
            goto LABEL_25;
          if (v19 == 11)
          {
            v20 = v15;
            if ((v28 & 1) == 0)
              goto LABEL_25;
          }
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v12);
  }
  v22 = (id)objc_msgSend(v24, "cameraConfiguration");
  v9 = v25;
  *((_QWORD *)v25 + 9) = v22;
  return v9;
}

- (FigVideoCaptureConnectionConfiguration)videoPreviewSinkConnectionConfiguration
{
  return self->_videoPreviewSinkConnectionConfiguration;
}

- (FigVideoCaptureConnectionConfiguration)videoThumbnailConnectionConfiguration
{
  return self->_videoThumbnailConnectionConfiguration;
}

- (FigVideoCaptureConnectionConfiguration)sceneClassifierConnectionConfiguration
{
  return self->_sceneClassifierConnectionConfiguration;
}

- (FigMetadataObjectCaptureConnectionConfiguration)metadataObjectConnectionConfiguration
{
  return self->_metadataObjectConnectionConfiguration;
}

- (FigVideoCaptureConnectionConfiguration)previewTimeMachineConnectionConfiguration
{
  return self->_previewTimeMachineConnectionConfiguration;
}

- (FigDepthDataCaptureConnectionConfiguration)depthDataConnectionConfiguration
{
  return self->_depthDataConnectionConfiguration;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionParsedPreviewSinkConfiguration;
  -[FigCaptureSessionParsedPreviewSinkConfiguration dealloc](&v3, sel_dealloc);
}

- (FigCaptureSourceConfiguration)cameraConfiguration
{
  return self->_cameraConfiguration;
}

- (FigVideoCaptureConnectionConfiguration)stillImageConnectionConfiguration
{
  return self->_stillImageConnectionConfiguration;
}

- (int)sourceDeviceType
{
  return self->_sourceDeviceType;
}

- (FigVideoCaptureConnectionConfiguration)previewSmartStyleCoefficientsTimeMachineConnectionConfiguration
{
  return self->_previewSmartStyleCoefficientsTimeMachineConnectionConfiguration;
}

@end
