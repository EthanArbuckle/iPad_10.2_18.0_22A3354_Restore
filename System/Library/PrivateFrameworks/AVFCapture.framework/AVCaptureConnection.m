@implementation AVCaptureConnection

- (id)figCaptureConnectionConfigurationForSessionPreset:(id)a3 allConnections:(id)a4
{
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  id v11;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  AVCaptureConnection *v23;
  void *v24;
  void *v25;
  AVCaptureOutput *v26;
  uint64_t v27;
  int v28;
  int v29;
  AVCaptureOutput *v30;
  void *v31;
  NSMutableArray *inputPorts;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFAllocator *v36;
  uint64_t j;
  const opaqueCMFormatDescription *v38;
  const opaqueCMFormatDescription *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  _BOOL8 enabled;
  void *v44;
  uint64_t v45;
  _BOOL4 v46;
  const opaqueCMFormatDescription *v47;
  const opaqueCMFormatDescription *v48;
  const opaqueCMFormatDescription *v49;
  AVCaptureConnectionInternal *internal;
  id v51;
  AVCaptureOutput *v52;
  id v53;
  uint64_t v54;
  AVCaptureVideoPreviewLayer *v55;
  int64_t activeVideoStabilizationMode;
  int64_t v57;
  BOOL v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  int v69;
  int v70;
  int v71;
  double v72;
  double v73;
  int64_t v74;
  uint64_t v75;
  const opaqueCMFormatDescription *v76;
  unint64_t Dimensions;
  uint64_t v78;
  unint64_t v79;
  uint64_t MediaSubType;
  int64_t v81;
  _BOOL4 v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  int64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  objc_class *v92;
  int64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t i;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t k;
  void *v107;
  void *v108;
  uint64_t v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  double v115;
  double v116;
  double v117;
  uint64_t v118;
  void *v119;
  unint64_t v120;
  unint64_t v121;
  uint64_t v122;
  id v123;
  void *v124;
  double v125;
  double v126;
  void *v127;
  id v128;
  void *v129;
  void *v130;
  uint64_t v131;
  AVCaptureOutput *v132;
  id v133;
  id obj;
  id obja;
  uint64_t v136;
  __int128 v137;
  uint64_t v138;
  __int128 v139;
  uint64_t v140;
  CMTime v141;
  CMTime time;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  uint64_t v148;
  __int128 v149;
  uint64_t v150;
  __int128 v151;
  uint64_t v152;
  __int128 v153;
  uint64_t v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  double v171[15];
  CMMetadataFormatDescriptionRef formatDescriptionOut[18];

  formatDescriptionOut[15] = *(CMMetadataFormatDescriptionRef *)MEMORY[0x1E0C80C00];
  if (!-[AVCaptureConnection isActive](self, "isActive"))
    return 0;
  v7 = -[AVCaptureConnection mediaType](self, "mediaType");
  v8 = (void *)-[NSMutableArray firstObject](self->_internal->inputPorts, "firstObject");
  objc_msgSend(v8, "input");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v10 = (void *)objc_msgSend((id)objc_msgSend(v8, "input"), "device");
    if (!objc_msgSend(v10, "isConnected") || (objc_msgSend(v10, "isSoonToBeDisconnected") & 1) != 0)
      return 0;
  }
  else
  {
    v10 = 0;
  }
  obj = (id)*MEMORY[0x1E0CF2B90];
  v133 = a3;
  if (objc_msgSend(v7, "isEqualToString:"))
  {
    v13 = objc_alloc_init(MEMORY[0x1E0D03C80]);
    v14 = v13;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
LABEL_54:
    v11 = v13;
    goto LABEL_55;
  }
  v131 = *MEMORY[0x1E0CF2B68];
  if (objc_msgSend(v7, "isEqualToString:"))
  {
    v13 = objc_alloc_init(MEMORY[0x1E0D03B70]);
    if ((isKindOfClass & 1) != 0)
    {
      v127 = v13;
      v128 = v7;
      v129 = v8;
      -[AVCaptureConnection output](self, "output");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v165 = 0u;
        v166 = 0u;
        v163 = 0u;
        v164 = 0u;
        v19 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v163, v170, 16);
        if (!v19)
          return 0;
        v20 = v19;
        v21 = *(_QWORD *)v164;
LABEL_15:
        v22 = 0;
        while (1)
        {
          if (*(_QWORD *)v164 != v21)
            objc_enumerationMutation(a4);
          v23 = *(AVCaptureConnection **)(*((_QWORD *)&v163 + 1) + 8 * v22);
          if (v23 != self)
          {
            v24 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v163 + 1) + 8 * v22), "inputPorts"), "firstObject");
            objc_msgSend(v24, "input");
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v25 = (void *)objc_msgSend((id)objc_msgSend(v24, "input"), "device");
              v26 = -[AVCaptureConnection output](self, "output");
              v27 = -[AVCaptureConnection output](v23, "output");
              v28 = objc_msgSend(-[AVCaptureConnection mediaType](v23, "mediaType"), "isEqualToString:", obj);
              v29 = objc_msgSend(v25, "isConnected");
              if (v26 == (AVCaptureOutput *)v27 && v28 && v29)
                break;
            }
          }
          if (v20 == ++v22)
          {
            v20 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v163, v170, 16);
            v11 = 0;
            if (v20)
              goto LABEL_15;
            return v11;
          }
        }
      }
      v8 = v129;
      v41 = (void *)objc_msgSend(v129, "input");
      -[AVCaptureOutput session](-[AVCaptureConnection output](self, "output"), "session");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v41, "setAudioCaptureMode:", 6);
      objc_msgSend(v127, "setAudioCaptureMode:", objc_msgSend(v10, "fallbackAudioCaptureModeIfApplicableForCurrentRoute:", objc_msgSend(v41, "audioCaptureMode")));
      objc_msgSend(v127, "setWindNoiseRemovalEnabled:", objc_msgSend(v41, "isWindNoiseRemovalEnabled"));
      if (objc_msgSend(v127, "audioCaptureMode") == 6)
      {
        v42 = objc_msgSend(v129, "sourceDevicePosition");
      }
      else
      {
        objc_msgSend(v127, "setBuiltInMicrophonePosition:", 0);
        if (objc_msgSend(v127, "audioCaptureMode") != 3)
        {
          v7 = v128;
          if (objc_msgSend(v127, "audioCaptureMode") != 4)
          {
            v161 = 0u;
            v162 = 0u;
            v159 = 0u;
            v160 = 0u;
            v95 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v159, v169, 16);
            if (v95)
            {
              v96 = v95;
              v97 = *(_QWORD *)v160;
              while (2)
              {
                for (i = 0; i != v96; ++i)
                {
                  if (*(_QWORD *)v160 != v97)
                    objc_enumerationMutation(a4);
                  v99 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * i);
                  if ((objc_msgSend((id)objc_msgSend(v99, "mediaType"), "isEqual:", v131) & 1) == 0)
                  {
                    v100 = (void *)objc_msgSend((id)objc_msgSend(v99, "inputPorts"), "firstObject");
                    objc_msgSend(v100, "input");
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v101 = (void *)objc_msgSend((id)objc_msgSend(v100, "input"), "device");
                      if (objc_msgSend(v101, "isConnected"))
                      {
                        v42 = objc_msgSend(v101, "position");
                        v8 = v129;
                        goto LABEL_110;
                      }
                    }
                  }
                }
                v96 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v159, v169, 16);
                v8 = v129;
                if (v96)
                  continue;
                break;
              }
            }
            goto LABEL_111;
          }
          v42 = 2;
LABEL_110:
          objc_msgSend(v127, "setBuiltInMicrophonePosition:", v42);
LABEL_111:
          if (objc_msgSend(-[AVCaptureConnection session](self, "session"), "likelyToRecordProResMovies"))
            objc_msgSend(v127, "setBuiltInMicrophoneRequiredSampleRate:", 48000.0);
          v15 = 0;
          v11 = v127;
LABEL_158:
          v16 = 0;
          v17 = 0;
          v18 = 0;
          v14 = 0;
          goto LABEL_55;
        }
        v42 = 1;
      }
      v7 = v128;
      goto LABEL_110;
    }
    v15 = 0;
    goto LABEL_31;
  }
  if (objc_msgSend(v7, "isEqualToString:", AVMediaTypeForMetadataObjects()))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0D03C68]);
    -[AVCaptureConnection output](self, "output");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = -[AVCaptureConnection output](self, "output");
      objc_msgSend(v11, "setMetadataIdentifiers:", -[AVCaptureOutput _metadataIdentifiers](v30, "_metadataIdentifiers"));
      -[AVCaptureOutput rectOfInterest](v30, "rectOfInterest");
      objc_msgSend(v11, "setMetadataRectOfInterest:");
      objc_msgSend(v11, "setFaceTrackingMaxFaces:", -[AVCaptureOutput faceTrackingMaxFaces](v30, "faceTrackingMaxFaces"));
      objc_msgSend(v11, "setFaceTrackingUsesFaceRecognition:", -[AVCaptureOutput isFaceTrackingUsingFaceRecognition](v30, "isFaceTrackingUsingFaceRecognition"));
      objc_msgSend(v11, "setFaceTrackingPlusEnabled:", -[AVCaptureOutput isFaceTrackingPlusEnabled](v30, "isFaceTrackingPlusEnabled"));
      -[AVCaptureOutput faceTrackingNetworkFailureThresholdMultiplier](v30, "faceTrackingNetworkFailureThresholdMultiplier");
      objc_msgSend(v11, "setFaceTrackingNetworkFailureThresholdMultiplier:");
      -[AVCaptureOutput faceTrackingFailureFieldOfViewModifier](v30, "faceTrackingFailureFieldOfViewModifier");
      objc_msgSend(v11, "setFaceTrackingFailureFieldOfViewModifier:");
      objc_msgSend(v11, "setAttentionDetectionEnabled:", -[AVCaptureOutput isAttentionDetectionEnabled](v30, "isAttentionDetectionEnabled"));
    }
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v14 = 0;
    v7 = (id)*MEMORY[0x1E0CF2B80];
    goto LABEL_55;
  }
  if (AVMediaTypeMetadataObjectAndAVMediaTypeMetadataAreDefined()
    && objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CF2B78]))
  {
    v31 = v8;
    v11 = objc_alloc_init(MEMORY[0x1E0D03C60]);
    formatDescriptionOut[0] = 0;
    v155 = 0u;
    v156 = 0u;
    v157 = 0u;
    v158 = 0u;
    inputPorts = self->_internal->inputPorts;
    v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputPorts, "countByEnumeratingWithState:objects:count:", &v155, v168, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v156;
      v36 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v156 != v35)
            objc_enumerationMutation(inputPorts);
          v38 = formatDescriptionOut[0];
          v39 = (const opaqueCMFormatDescription *)objc_msgSend(*(id *)(*((_QWORD *)&v155 + 1) + 8 * j), "formatDescription");
          if (v38)
          {
            CMMetadataFormatDescriptionCreateByMergingMetadataFormatDescriptions(v36, v38, v39, formatDescriptionOut);
            CFRelease(v38);
          }
          else
          {
            formatDescriptionOut[0] = (CMMetadataFormatDescriptionRef)CFRetain(v39);
          }
        }
        v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputPorts, "countByEnumeratingWithState:objects:count:", &v155, v168, 16);
      }
      while (v34);
    }
    objc_msgSend(v11, "setFormatDescription:", formatDescriptionOut[0]);
    v8 = v31;
    objc_msgSend(v11, "setClock:", objc_msgSend((id)objc_msgSend(v31, "input"), "clock"));
    objc_msgSend(v31, "input");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = 1;
    }
    else
    {
      objc_msgSend(v31, "input");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v31, "input"), "ports"), "firstObject"), "mediaType") != obj)
      {
        goto LABEL_155;
      }
      v40 = 3;
    }
    objc_msgSend(v11, "setSourceSubType:", v40);
LABEL_155:
    if (formatDescriptionOut[0])
      CFRelease(formatDescriptionOut[0]);
    v15 = 0;
    goto LABEL_158;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CF2B70]))
  {
    v13 = objc_alloc_init(MEMORY[0x1E0D03C58]);
    v18 = v13;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    goto LABEL_53;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("visn")))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0D03C88]);
    v15 = 0;
    v16 = 0;
    v18 = 0;
    v14 = 0;
    v17 = v11;
    goto LABEL_55;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("pcld")))
  {
    v16 = objc_alloc_init(MEMORY[0x1E0D03C78]);
    objc_msgSend(v16, "setProjectorMode:", objc_msgSend(v10, "timeOfFlightProjectorMode"));
    v15 = 0;
    v17 = 0;
    v18 = 0;
    v14 = 0;
    v11 = v16;
    goto LABEL_55;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("cacd")))
  {
    v13 = objc_alloc_init(MEMORY[0x1E0D03B78]);
    v15 = v13;
LABEL_31:
    v16 = 0;
    v17 = 0;
    v18 = 0;
LABEL_53:
    v14 = 0;
    goto LABEL_54;
  }
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v14 = 0;
  v11 = 0;
LABEL_55:
  objc_msgSend(v11, "setConnectionID:", self->_internal->connectionID);
  objc_msgSend(v11, "setMediaType:", AVOSTypeForString());
  if (objc_msgSend(v8, "isEnabled"))
    enabled = self->_internal->enabled;
  else
    enabled = 0;
  objc_msgSend(v11, "setEnabled:", enabled);
  objc_msgSend(v11, "setSourceConfiguration:", objc_msgSend(v8, "figCaptureSourceConfigurationForSessionPreset:", v133));
  v44 = v8;
  v45 = objc_msgSend(v8, "sourceDeviceType");
  v46 = -[AVCaptureDevice wideAngleCameraSourcesFromUltraWide](self->_internal->sourceDevice, "wideAngleCameraSourcesFromUltraWide");
  v47 = (const opaqueCMFormatDescription *)&unk_1E424CE10;
  if (v46)
    v47 = (const opaqueCMFormatDescription *)&unk_1E424CDF8;
  *(_QWORD *)&v171[0] = CFSTR("AVCaptureDeviceTypeBuiltInWideAngleCamera");
  *(_QWORD *)&v171[1] = CFSTR("AVCaptureDeviceTypeBuiltInTelephotoCamera");
  formatDescriptionOut[0] = v47;
  formatDescriptionOut[1] = (CMMetadataFormatDescriptionRef)&unk_1E424CE28;
  *(_QWORD *)&v171[2] = CFSTR("AVCaptureDeviceTypeBuiltInDualCamera");
  *(_QWORD *)&v171[3] = CFSTR("AVCaptureDeviceTypeBuiltInUltraWideCamera");
  formatDescriptionOut[2] = (CMMetadataFormatDescriptionRef)&unk_1E424CE40;
  formatDescriptionOut[3] = (CMMetadataFormatDescriptionRef)&unk_1E424CE58;
  *(_QWORD *)&v171[4] = CFSTR("AVCaptureDeviceTypeBuiltInDualWideCamera");
  *(_QWORD *)&v171[5] = CFSTR("AVCaptureDeviceTypeBuiltInTripleCamera");
  formatDescriptionOut[4] = (CMMetadataFormatDescriptionRef)&unk_1E424CE70;
  formatDescriptionOut[5] = (CMMetadataFormatDescriptionRef)&unk_1E424CE88;
  v48 = (const opaqueCMFormatDescription *)&unk_1E424CEB8;
  if (v46)
    v48 = (const opaqueCMFormatDescription *)&unk_1E424CEA0;
  *(_QWORD *)&v171[6] = CFSTR("AVCaptureDeviceTypeBuiltInTrueDepthCamera");
  *(_QWORD *)&v171[7] = CFSTR("AVCaptureDeviceTypeBuiltInTimeOfFlightCamera");
  formatDescriptionOut[6] = v48;
  formatDescriptionOut[7] = (CMMetadataFormatDescriptionRef)&unk_1E424CED0;
  *(_QWORD *)&v171[8] = CFSTR("AVCaptureDeviceTypeBuiltInLiDARDepthCamera");
  *(_QWORD *)&v171[9] = CFSTR("AVCaptureDeviceTypeDeskViewCamera");
  formatDescriptionOut[8] = (CMMetadataFormatDescriptionRef)&unk_1E424CEE8;
  formatDescriptionOut[9] = (CMMetadataFormatDescriptionRef)&unk_1E424CF00;
  v49 = (const opaqueCMFormatDescription *)&unk_1E424CF30;
  if (v46)
    v49 = (const opaqueCMFormatDescription *)&unk_1E424CF18;
  *(_QWORD *)&v171[10] = CFSTR("AVCaptureDeviceTypeBuiltInWideAngleMetadataCamera");
  *(_QWORD *)&v171[11] = CFSTR("AVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCamera");
  formatDescriptionOut[10] = v49;
  formatDescriptionOut[11] = (CMMetadataFormatDescriptionRef)&unk_1E424CF48;
  *(_QWORD *)&v171[12] = CFSTR("AVCaptureDeviceTypeBuiltInInfraredMetadataCamera");
  *(_QWORD *)&v171[13] = CFSTR("AVCaptureDeviceTypeExternal");
  formatDescriptionOut[12] = (CMMetadataFormatDescriptionRef)&unk_1E424CF60;
  formatDescriptionOut[13] = (CMMetadataFormatDescriptionRef)&unk_1E424CF78;
  *(_QWORD *)&v171[14] = CFSTR("AVCaptureDeviceTypeContinuityCamera");
  formatDescriptionOut[14] = (CMMetadataFormatDescriptionRef)&unk_1E424CF90;
  objc_msgSend(v11, "setUnderlyingDeviceType:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", formatDescriptionOut, v171, 15), "objectForKeyedSubscript:", v45), "intValue"));
  internal = self->_internal;
  if (!internal->outputWeakReference)
  {
    if (internal->videoPreviewLayerWeakReference)
    {
      v55 = -[AVCaptureConnection videoPreviewLayer](self, "videoPreviewLayer");
      v53 = objc_alloc_init(MEMORY[0x1E0D03C40]);
      objc_msgSend(v53, "setSinkID:", -[AVCaptureVideoPreviewLayer sinkID](v55, "sinkID"));
      objc_msgSend(v53, "setDepthDataDeliveryEnabled:", -[AVCaptureVideoPreviewLayer isDepthDataDeliveryEnabled](v55, "isDepthDataDeliveryEnabled"));
      objc_msgSend(v53, "setFilterRenderingEnabled:", -[AVCaptureVideoPreviewLayer isFilterRenderingEnabled](v55, "isFilterRenderingEnabled"));
      objc_msgSend(v53, "setFilters:", -[AVCaptureVideoPreviewLayer videoPreviewFilters](v55, "videoPreviewFilters"));
      objc_msgSend(v53, "setPortraitAutoSuggestEnabled:", -[AVCaptureVideoPreviewLayer isPortraitAutoSuggestEnabled](v55, "isPortraitAutoSuggestEnabled"));
      objc_msgSend(v14, "setMirroringEnabled:", self->_internal->videoMirrored);
      activeVideoStabilizationMode = self->_internal->activeVideoStabilizationMode;
      if ((objc_msgSend((id)objc_msgSend(v11, "sourceConfiguration"), "cinematicFramingEnabled") & 1) != 0)
      {
        v60 = 0;
        v59 = v44;
      }
      else
      {
        v57 = activeVideoStabilizationMode + 1;
        v58 = (unint64_t)(activeVideoStabilizationMode + 1) > 6;
        v59 = v44;
        if (v58)
          v60 = 0;
        else
          v60 = dword_19EEEA6AC[v57];
      }
      objc_msgSend(v14, "setVideoStabilizationMethod:", v60);
      objc_msgSend(v59, "input");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v66 = (void *)objc_msgSend(v59, "input");
        objc_msgSend(v66, "simulatedAperture");
        objc_msgSend(v53, "setSimulatedAperture:");
        objc_msgSend(v66, "portraitLightingEffectStrength");
        objc_msgSend(v53, "setPortraitLightingEffectStrength:");
      }
      objc_msgSend(v53, "setSemanticStyleRenderingEnabled:", -[AVCaptureVideoPreviewLayer isSemanticStyleRenderingEnabled](v55, "isSemanticStyleRenderingEnabled"));
      if (-[AVCaptureVideoPreviewLayer semanticStyle](v55, "semanticStyle"))
      {
        v67 = -[AVCaptureVideoPreviewLayer semanticStyle](v55, "semanticStyle");
        v68 = (void *)MEMORY[0x1E0D03BF8];
        objc_msgSend(v67, "toneBias");
        v70 = v69;
        objc_msgSend(v67, "warmthBias");
        LODWORD(v72) = v71;
        LODWORD(v73) = v70;
        objc_msgSend(v53, "setSemanticStyle:", objc_msgSend(v68, "semanticStyleWithToneBias:warmthBias:", v73, v72));
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v53, "setPrimaryCaptureRectModificationEnabled:", 1);
        *(_OWORD *)formatDescriptionOut = *MEMORY[0x1E0C9D538];
        v171[0] = 0.0;
        v136 = 0;
        -[AVCaptureVideoPreviewLayer getPrimaryCaptureRectCenter:aspectRatio:uniqueID:](v55, "getPrimaryCaptureRectCenter:aspectRatio:uniqueID:", formatDescriptionOut, v171, &v136);
        objc_msgSend(v53, "setPrimaryCaptureRectCenter:", *(double *)formatDescriptionOut, *(double *)&formatDescriptionOut[1]);
        objc_msgSend(v53, "setPrimaryCaptureRectAspectRatio:", v171[0]);
        objc_msgSend(v53, "setPrimaryCaptureRectUniqueID:", v136);
      }
      objc_msgSend(v53, "setZoomPIPOverlayEnabled:", -[AVCaptureVideoPreviewLayer isZoomPictureInPictureOverlayEnabled](v55, "isZoomPictureInPictureOverlayEnabled"));
    }
    else
    {
      v53 = 0;
    }
    goto LABEL_148;
  }
  v51 = v7;
  v52 = -[AVCaptureConnection output](self, "output");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v53 = objc_alloc_init(MEMORY[0x1E0D03C30]);
    if (-[AVCaptureDeviceFormat supportsQuadraHighResolutionStillImageOutput](-[AVCaptureDevice activeFormat](self->_internal->sourceDevice, "activeFormat"), "supportsQuadraHighResolutionStillImageOutput"))
    {
      v54 = -[AVCaptureOutput isHighResolutionStillImageOutputEnabled](v52, "isHighResolutionStillImageOutputEnabled");
    }
    else
    {
      v54 = 0;
    }
    objc_msgSend(v53, "setQuadraHighResCaptureEnabled:", v54);
    if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureZeroShutterLagAutomaticallyEnabled"))
      && -[AVCaptureDeviceFormat isZeroShutterLagSupported](-[AVCaptureDevice activeFormat](self->_internal->sourceDevice, "activeFormat"), "isZeroShutterLagSupported"))
    {
      objc_msgSend(v53, "setZeroShutterLagEnabled:", 1);
    }
    goto LABEL_147;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v133, "isEqualToString:", CFSTR("AVCaptureSessionPresetVoicemailGreeting")))
    {
      v53 = objc_alloc_init(MEMORY[0x1E0D03B98]);
      v61 = 0;
    }
    else
    {
      v53 = objc_alloc_init(MEMORY[0x1E0D03BE8]);
      v74 = self->_internal->activeVideoStabilizationMode;
      if ((objc_msgSend((id)objc_msgSend(v11, "sourceConfiguration"), "cinematicFramingEnabled") & 1) != 0
        || (unint64_t)(v74 + 1) > 6)
      {
        v75 = 0;
      }
      else
      {
        v75 = dword_19EEEA6AC[v74 + 1];
      }
      objc_msgSend(v14, "setVideoStabilizationMethod:", v75);
      v61 = v53;
    }
    objc_msgSend(v14, "setLivePhotoMetadataWritingEnabled:", self->_internal->livePhotoMetadataWritingEnabled);
    if (v51 == obj)
    {
      if (v14)
      {
        v88 = (void *)-[AVCaptureOutput outputSettingsForConnection:](v52, "outputSettingsForConnection:", self);
        v89 = (void *)objc_msgSend(v88, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2D08]);
        v90 = objc_msgSend(v88, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2CB8]);
        if (v89)
        {
          v91 = (void *)v90;
          if (v90)
          {
            objc_msgSend(v14, "setOutputWidth:", objc_msgSend(v89, "intValue"));
            objc_msgSend(v14, "setOutputHeight:", objc_msgSend(v91, "intValue"));
          }
        }
      }
    }
    if (avcc_frontCameraPhysicalMirroringFollowsCameraAppPreference_onceToken != -1)
      dispatch_once(&avcc_frontCameraPhysicalMirroringFollowsCameraAppPreference_onceToken, &__block_literal_global_6);
    objc_msgSend(v14, "setPhysicalMirroringForMovieRecordingEnabled:", self->_internal->videoMirroringMethodForMovieRecording == 2);
    objc_msgSend(v14, "setZoomSmoothingEnabled:", -[AVCaptureConnection isVideoZoomSmoothingEnabled](self, "isVideoZoomSmoothingEnabled"));
    objc_msgSend(v14, "setVideoGreenGhostMitigationEnabled:", -[AVCaptureConnection isVideoGreenGhostMitigationEnabled](self, "isVideoGreenGhostMitigationEnabled"));
    objc_msgSend(v14, "setStereoVideoCaptureEnabled:", -[AVCaptureOutput isSpatialVideoCaptureEnabled](v52, "isSpatialVideoCaptureEnabled"));
    if (objc_msgSend(v14, "stereoVideoCaptureEnabled"))
      objc_msgSend(v14, "setVideoGreenGhostMitigationEnabled:", 0);
    objc_msgSend(v61, "setTrueVideoCaptureEnabled:", -[AVCaptureOutput isTrueVideoCaptureEnabled](v52, "isTrueVideoCaptureEnabled"));
    goto LABEL_147;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v62 = (void *)-[AVCaptureOutput videoSettings](v52, "videoSettings");
    v53 = objc_alloc_init(MEMORY[0x1E0D03C38]);
    objc_msgSend(v14, "setOutputWidth:", objc_msgSend((id)objc_msgSend(v62, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90E0]), "intValue"));
    objc_msgSend(v14, "setOutputHeight:", objc_msgSend((id)objc_msgSend(v62, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]), "intValue"));
    v63 = objc_msgSend(v62, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9040]);
    if (!v63)
      goto LABEL_135;
    v64 = (void *)v63;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v65 = v64;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_135;
      v65 = (void *)objc_msgSend(v64, "firstObject");
    }
    objc_msgSend(v14, "setOutputFormat:", objc_msgSend(v65, "unsignedIntValue"));
LABEL_135:
    objc_msgSend(v14, "setOrientation:", -[AVCaptureConnection _videoOrientation](self, "_videoOrientation"));
    objc_msgSend(v14, "setMirroringEnabled:", self->_internal->videoMirrored);
    v93 = self->_internal->activeVideoStabilizationMode;
    if ((objc_msgSend((id)objc_msgSend(v11, "sourceConfiguration"), "cinematicFramingEnabled") & 1) != 0
      || (unint64_t)(v93 + 1) > 6)
    {
      v94 = 0;
    }
    else
    {
      v94 = dword_19EEEA6AC[v93 + 1];
    }
    objc_msgSend(v14, "setVideoStabilizationMethod:", v94);
    objc_msgSend(v14, "setDeviceOrientationCorrectionEnabled:", -[AVCaptureConnection isVideoDeviceOrientationCorrectionEnabled](self, "isVideoDeviceOrientationCorrectionEnabled"));
    objc_msgSend(v14, "setZoomSmoothingEnabled:", -[AVCaptureConnection isVideoZoomSmoothingEnabled](self, "isVideoZoomSmoothingEnabled"));
    objc_msgSend(v14, "setRetainedBufferCount:", -[AVCaptureConnection clientRetainedBufferCount](self, "clientRetainedBufferCount"));
    objc_msgSend(v14, "setCameraIntrinsicMatrixDeliveryEnabled:", self->_internal->cameraIntrinsicMatrixDeliveryEnabled);
    objc_msgSend(v53, "setDiscardsLateVideoFrames:", -[AVCaptureOutput alwaysDiscardsLateVideoFrames](v52, "alwaysDiscardsLateVideoFrames"));
    objc_msgSend(v53, "setOptimizedForPreview:", -[AVCaptureOutput deliversPreviewSizedOutputBuffers](v52, "deliversPreviewSizedOutputBuffers"));
    objc_msgSend(v53, "setSceneStabilityMetadataEnabled:", -[AVCaptureOutput isSceneStabilityMetadataEnabled](v52, "isSceneStabilityMetadataEnabled"));
    objc_msgSend(v53, "setRequestedBufferAttachments:", -[AVCaptureOutput requestedBufferAttachments](v52, "requestedBufferAttachments"));
    goto LABEL_147;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v53 = objc_alloc_init(MEMORY[0x1E0D03BB0]);
    v76 = -[AVCaptureDeviceFormat formatDescription](-[AVCaptureDevice activeDepthDataFormat](self->_internal->sourceDevice, "activeDepthDataFormat"), "formatDescription");
    Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(v76);
    LODWORD(v78) = Dimensions;
    v79 = HIDWORD(Dimensions);
    MediaSubType = CMFormatDescriptionGetMediaSubType(v76);
    v81 = -[AVCaptureConnection _videoOrientation](self, "_videoOrientation");
    -[AVCaptureConnection sourcesFromExternalCamera](self, "sourcesFromExternalCamera");
    v82 = AVCapturePlatformMountsCamerasInLandscapeOrientation();
    v83 = -3;
    if (v82)
      v83 = -1;
    v84 = v83 + v81;
    if (v84 >= 2)
      v85 = v78;
    else
      v85 = v79;
    if (v84 >= 2)
      v78 = v79;
    else
      v78 = v78;
    objc_msgSend(v18, "setOutputWidth:", v85);
    objc_msgSend(v18, "setOutputHeight:", v78);
    objc_msgSend(v18, "setOutputFormat:", MediaSubType);
    objc_msgSend(v18, "setOrientation:", v81);
    objc_msgSend(v18, "setMirroringEnabled:", self->_internal->videoMirrored);
    v86 = self->_internal->activeVideoStabilizationMode;
    if ((objc_msgSend((id)objc_msgSend(v11, "sourceConfiguration"), "cinematicFramingEnabled") & 1) != 0
      || (unint64_t)(v86 + 1) > 6)
    {
      v87 = 0;
    }
    else
    {
      v87 = dword_19EEEA6AC[v86 + 1];
    }
    objc_msgSend(v18, "setVideoStabilizationMethod:", v87);
    objc_msgSend(v18, "setRetainedBufferCount:", -[AVCaptureConnection clientRetainedBufferCount](self, "clientRetainedBufferCount"));
    objc_msgSend(v53, "setDiscardsLateDepthData:", -[AVCaptureOutput alwaysDiscardsLateDepthData](v52, "alwaysDiscardsLateDepthData"));
    objc_msgSend(v53, "setFilteringEnabled:", -[AVCaptureOutput isFilteringEnabled](v52, "isFilteringEnabled"));
    goto LABEL_147;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v92 = (objc_class *)MEMORY[0x1E0D03B88];
LABEL_146:
    v53 = objc_alloc_init(v92);
    goto LABEL_147;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v92 = (objc_class *)MEMORY[0x1E0D03BD8];
    goto LABEL_146;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v53 = objc_alloc_init(MEMORY[0x1E0D03BC0]);
    objc_msgSend(v53, "setIrisMovieCaptureEnabled:", -[AVCaptureOutput isLivePhotoCaptureEnabled](v52, "isLivePhotoCaptureEnabled"));
    if (objc_msgSend(v53, "irisMovieCaptureEnabled"))
    {
      objc_msgSend(v53, "setIrisMovieCaptureSuspended:", -[AVCaptureOutput isLivePhotoCaptureSuspended](v52, "isLivePhotoCaptureSuspended"));
      objc_msgSend(v53, "setPreservesIrisMovieCaptureSuspendedOnSessionStop:", -[AVCaptureOutput preservesLivePhotoCaptureSuspendedOnSessionStop](v52, "preservesLivePhotoCaptureSuspendedOnSessionStop"));
      if (v52)
      {
        -[AVCaptureOutput livePhotoMovieDuration](v52, "livePhotoMovieDuration");
        v151 = v153;
        v152 = v154;
        objc_msgSend(v53, "setIrisMovieDuration:", &v151);
        -[AVCaptureOutput livePhotoMovieVideoFrameDuration](v52, "livePhotoMovieVideoFrameDuration");
      }
      else
      {
        v153 = 0uLL;
        v154 = 0;
        v152 = 0;
        v151 = 0uLL;
        objc_msgSend(v53, "setIrisMovieDuration:", &v151);
        v149 = 0uLL;
        v150 = 0;
      }
      v147 = v149;
      v148 = v150;
      objc_msgSend(v53, "setIrisMovieVideoFrameDuration:", &v147);
      objc_msgSend(v53, "setIrisMovieAutoTrimMethod:", -[AVCaptureOutput isLivePhotoAutoTrimmingEnabled](v52, "isLivePhotoAutoTrimmingEnabled"));
      if (v14)
      {
        v120 = -[AVCaptureOutput livePhotoMovieDimensions](v52, "livePhotoMovieDimensions");
        v121 = HIDWORD(v120);
        objc_msgSend(v14, "setOutputWidth:", v120);
        objc_msgSend(v14, "setOutputHeight:", v121);
        objc_msgSend((id)objc_msgSend(v11, "sourceConfiguration"), "cinematicFramingEnabled");
        objc_msgSend(v14, "setVideoStabilizationMethod:", 0);
      }
    }
    if ((objc_msgSend(v51, "isEqual:", obj) & 1) == 0 && (objc_msgSend(v53, "irisMovieCaptureEnabled") & 1) == 0)
      objc_msgSend(v11, "setEnabled:", 0);
    objc_msgSend(v53, "setIrisPreparedSettings:", -[AVCaptureOutput figCaptureIrisPreparedSettings](v52, "figCaptureIrisPreparedSettings"));
    objc_msgSend(v53, "setOptimizesImagesForOfflineVideoStabilization:", -[AVCaptureOutput optimizesImagesForOfflineVideoStabilization](v52, "optimizesImagesForOfflineVideoStabilization"));
    objc_msgSend(v53, "setQuadraHighResCaptureEnabled:", -[AVCaptureOutput maxPhotoDimensionsAreHighResolution](v52, "maxPhotoDimensionsAreHighResolution"));
    objc_msgSend(v53, "setDepthDataDeliveryEnabled:", -[AVCaptureOutput isDepthDataDeliveryEnabled](v52, "isDepthDataDeliveryEnabled"));
    objc_msgSend(v53, "setPortraitEffectsMatteDeliveryEnabled:", -[AVCaptureOutput isPortraitEffectsMatteDeliveryEnabled](v52, "isPortraitEffectsMatteDeliveryEnabled"));
    if (objc_msgSend((id)-[AVCaptureOutput enabledSemanticSegmentationMatteTypes](v52, "enabledSemanticSegmentationMatteTypes"), "count"))
    {
      objc_msgSend(v53, "setEnabledSemanticSegmentationMatteURNs:", AVSemanticSegmentationCMPhotoURNsForMatteTypes((void *)-[AVCaptureOutput enabledSemanticSegmentationMatteTypes](v52, "enabledSemanticSegmentationMatteTypes")));
    }
    objc_msgSend(v53, "setFilterRenderingEnabled:", -[AVCaptureOutput isFilterRenderingEnabled](v52, "isFilterRenderingEnabled"));
    objc_msgSend(v53, "setBravoConstituentPhotoDeliveryEnabled:", -[AVCaptureOutput isVirtualDeviceConstituentPhotoDeliveryEnabled](v52, "isVirtualDeviceConstituentPhotoDeliveryEnabled"));
    objc_msgSend(v53, "setMomentCaptureMovieRecordingEnabled:", -[AVCaptureOutput isMovieRecordingEnabled](v52, "isMovieRecordingEnabled"));
    objc_msgSend(v53, "setSpatialOverCaptureEnabled:", -[AVCaptureOutput isSpatialOverCaptureEnabled](v52, "isSpatialOverCaptureEnabled"));
    objc_msgSend(v53, "setDeferredProcessingEnabled:", -[AVCaptureOutput isAutoDeferredPhotoDeliveryEnabled](v52, "isAutoDeferredPhotoDeliveryEnabled"));
    objc_msgSend(v53, "setDigitalFlashCaptureEnabled:", -[AVCaptureOutput isDigitalFlashCaptureEnabled](v52, "isDigitalFlashCaptureEnabled"));
    objc_msgSend(v53, "setFocusPixelBlurScoreEnabled:", -[AVCaptureOutput isFocusPixelBlurScoreEnabled](v52, "isFocusPixelBlurScoreEnabled"));
    objc_msgSend(v53, "setPreviewQualityAdjustedPhotoFilterRenderingEnabled:", -[AVCaptureOutput isPreviewQualityAdjustedPhotoFilterRenderingEnabled](v52, "isPreviewQualityAdjustedPhotoFilterRenderingEnabled"));
    objc_msgSend(v53, "setIntelligentDistortionCorrectionEnabled:", -[AVCaptureOutput isContentAwareDistortionCorrectionEnabled](v52, "isContentAwareDistortionCorrectionEnabled"));
    objc_msgSend(v53, "setDemosaicedRawEnabled:", -[AVCaptureOutput isAppleProRAWEnabled](v52, "isAppleProRAWEnabled"));
    v122 = -[AVCaptureOutput maxPhotoQualityPrioritization](v52, "maxPhotoQualityPrioritization");
    if (-[AVCaptureOutput isDepthDataDeliveryEnabled](v52, "isDepthDataDeliveryEnabled")
      && (_DWORD)v122 == 3)
    {
      if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureDepthWithDeepFusionSupported")))
        v122 = 3;
      else
        v122 = 2;
    }
    objc_msgSend(v53, "setMaxQualityPrioritization:", v122);
    objc_msgSend(v53, "setFastCapturePrioritizationEnabled:", -[AVCaptureOutput isFastCapturePrioritizationEnabled](v52, "isFastCapturePrioritizationEnabled"));
    objc_msgSend(v53, "setZeroShutterLagEnabled:", -[AVCaptureOutput isZeroShutterLagEnabled](v52, "isZeroShutterLagEnabled"));
    objc_msgSend(v53, "setUltraHighResolutionZeroShutterLagSupportEnabled:", -[AVCaptureOutput isUltraHighResolutionZeroShutterLagSupportEnabled](v52, "isUltraHighResolutionZeroShutterLagSupportEnabled"));
    objc_msgSend(v53, "setResponsiveCaptureEnabled:", -[AVCaptureOutput isResponsiveCaptureEnabled](v52, "isResponsiveCaptureEnabled"));
    objc_msgSend(v53, "setSemanticStyleRenderingEnabled:", -[AVCaptureOutput isSemanticStyleRenderingEnabled](v52, "isSemanticStyleRenderingEnabled"));
    objc_msgSend(v53, "setConstantColorEnabled:", -[AVCaptureOutput isConstantColorEnabled](v52, "isConstantColorEnabled"));
    objc_msgSend(v53, "setConstantColorClippingRecoveryEnabled:", -[AVCaptureOutput isConstantColorClippingRecoveryEnabled](v52, "isConstantColorClippingRecoveryEnabled"));
    objc_msgSend(v53, "setConstantColorSaturationBoostEnabled:", -[AVCaptureOutput isConstantColorSaturationBoostEnabled](v52, "isConstantColorSaturationBoostEnabled"));
    if (avcc_frontCameraPhysicalMirroringFollowsCameraAppPreference_onceToken != -1)
      dispatch_once(&avcc_frontCameraPhysicalMirroringFollowsCameraAppPreference_onceToken, &__block_literal_global_6);
    objc_msgSend(v14, "setPhysicalMirroringForMovieRecordingEnabled:", self->_internal->videoMirroringMethodForMovieRecording == 2);
    objc_msgSend(v53, "setMaxPhotoDimensions:", -[AVCaptureOutput maxPhotoDimensions](v52, "maxPhotoDimensions"));
    objc_msgSend(v53, "setExifFocalLengthsByZoomFactor:", -[AVCaptureOutput exifFocalLengthsByZoomFactor](v52, "exifFocalLengthsByZoomFactor"));
    objc_msgSend(v53, "setStereoPhotoCaptureEnabled:", -[AVCaptureOutput isSpatialPhotoCaptureEnabled](v52, "isSpatialPhotoCaptureEnabled"));
    goto LABEL_147;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v53 = objc_alloc_init(MEMORY[0x1E0D03C48]);
    objc_msgSend(v53, "setFilters:", -[AVCaptureOutput filters](v52, "filters"));
    if (-[AVCaptureOutput smartStyles](v52, "smartStyles"))
    {
      v130 = v53;
      v102 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)-[AVCaptureOutput smartStyles](v52, "smartStyles"), "count"));
      v143 = 0u;
      v144 = 0u;
      v145 = 0u;
      v146 = 0u;
      v132 = v52;
      obja = (id)-[AVCaptureOutput smartStyles](v52, "smartStyles");
      v103 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v143, v167, 16);
      if (v103)
      {
        v104 = v103;
        v105 = *(_QWORD *)v144;
        do
        {
          for (k = 0; k != v104; ++k)
          {
            if (*(_QWORD *)v144 != v105)
              objc_enumerationMutation(obja);
            v107 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * k);
            v108 = (void *)MEMORY[0x1E0D03C10];
            v109 = objc_msgSend(v107, "cast");
            objc_msgSend(v107, "intensity");
            v111 = v110;
            objc_msgSend(v107, "toneBias");
            v113 = v112;
            objc_msgSend(v107, "colorBias");
            LODWORD(v115) = v114;
            LODWORD(v116) = v111;
            LODWORD(v117) = v113;
            objc_msgSend(v102, "addObject:", objc_msgSend(v108, "styleWithCast:intensity:toneBias:colorBias:", v109, v116, v117, v115));
          }
          v104 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v143, v167, 16);
        }
        while (v104);
      }
      v53 = v130;
      objc_msgSend(v130, "setSmartStyles:", v102);
      v52 = v132;
    }
    -[AVCaptureOutput thumbnailSize](v52, "thumbnailSize");
    objc_msgSend(v53, "setThumbnailSize:");
    goto LABEL_147;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v53 = objc_alloc_init(MEMORY[0x1E0D03C50]);
    if (v52)
      -[AVCaptureOutput minFrameDuration](v52, "minFrameDuration");
    else
      memset(&time, 0, sizeof(time));
    v125 = 1.0 / CMTimeGetSeconds(&time);
    *(float *)&v125 = v125;
    objc_msgSend(v53, "setMaxFrameRate:", v125);
    if (v52)
      -[AVCaptureOutput minBurstFrameDuration](v52, "minBurstFrameDuration");
    else
      memset(&v141, 0, sizeof(v141));
    v126 = 1.0 / CMTimeGetSeconds(&v141);
    *(float *)&v126 = v126;
    objc_msgSend(v53, "setMaxBurstFrameRate:", v126);
    if (v52)
    {
      -[AVCaptureOutput maxBurstDuration](v52, "maxBurstDuration");
    }
    else
    {
      v139 = 0uLL;
      v140 = 0;
    }
    v137 = v139;
    v138 = v140;
    objc_msgSend(v53, "setMaxBurstDuration:", &v137);
    objc_msgSend(v53, "setGaussianPyramidOctavesCount:", -[AVCaptureOutput gaussianPyramidOctavesCount](v52, "gaussianPyramidOctavesCount"));
    -[AVCaptureOutput gaussianPyramidBaseOctaveDownscalingFactor](v52, "gaussianPyramidBaseOctaveDownscalingFactor");
    objc_msgSend(v53, "setGaussianPyramidBaseOctaveDownscalingFactor:");
    objc_msgSend(v53, "setMaxKeypointsCount:", -[AVCaptureOutput maxKeypointsCount](v52, "maxKeypointsCount"));
    -[AVCaptureOutput keypointDetectionThreshold](v52, "keypointDetectionThreshold");
    objc_msgSend(v53, "setKeypointDetectionThreshold:");
    objc_msgSend(v53, "setFeatureBinningEnabled:", -[AVCaptureOutput isFeatureBinningEnabled](v52, "isFeatureBinningEnabled"));
    objc_msgSend(v53, "setFeatureOrientationAssignmentEnabled:", -[AVCaptureOutput isFeatureOrientationAssignmentEnabled](v52, "isFeatureOrientationAssignmentEnabled"));
    objc_msgSend(v53, "setDynamicThresholdingEnabled:", -[AVCaptureOutput isDynamicThresholdingEnabled](v52, "isDynamicThresholdingEnabled"));
    objc_msgSend(v53, "setKeypointDetectionFlowType:", -[AVCaptureOutput keypointDetectionFlowType](v52, "keypointDetectionFlowType"));
    objc_msgSend(v53, "setSubPixelThreshold:", -[AVCaptureOutput subPixelThreshold](v52, "subPixelThreshold"));
    objc_msgSend(v53, "setFeatureMatchingEnabled:", -[AVCaptureOutput isFeatureMatchingEnabled](v52, "isFeatureMatchingEnabled"));
    objc_msgSend(v53, "setFeatureMatchingDescriptorSize:", -[AVCaptureOutput featureMatchingDescriptorSize](v52, "featureMatchingDescriptorSize"));
    -[AVCaptureOutput orientationDistanceThreshold](v52, "orientationDistanceThreshold");
    objc_msgSend(v53, "setOrientationDistanceThreshold:");
    -[AVCaptureOutput sigmaDistanceThreshold](v52, "sigmaDistanceThreshold");
    objc_msgSend(v53, "setSigmaDistanceThreshold:");
    -[AVCaptureOutput squareDistanceDisparityFraction](v52, "squareDistanceDisparityFraction");
    objc_msgSend(v53, "setSquareDistanceDisparityFraction:");
    objc_msgSend(v53, "setHammingDistanceThreshold:", -[AVCaptureOutput hammingDistanceThreshold](v52, "hammingDistanceThreshold"));
    objc_msgSend(v53, "setLaccConfigAndMetadata:", -[AVCaptureOutput laccConfigAndMetadata](v52, "laccConfigAndMetadata"));
    v118 = -[AVCaptureConnection clientRetainedBufferCount](self, "clientRetainedBufferCount");
    v119 = v17;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v123 = objc_alloc_init(MEMORY[0x1E0D03BA0]);
        objc_msgSend(v123, "setDiscardsLateCameraCalibrationData:", -[AVCaptureOutput alwaysDiscardsLateCameraCalibrationData](v52, "alwaysDiscardsLateCameraCalibrationData"));
        objc_msgSend(v15, "setOrientation:", -[AVCaptureConnection _videoOrientation](self, "_videoOrientation"));
        v124 = v15;
        v53 = v123;
        objc_msgSend(v124, "setMirroringEnabled:", self->_internal->videoMirrored);
      }
      else
      {
        v53 = 0;
      }
      goto LABEL_147;
    }
    v53 = objc_alloc_init(MEMORY[0x1E0D03BF0]);
    objc_msgSend(v53, "setDiscardsLatePointCloudData:", -[AVCaptureOutput alwaysDiscardsLatePointCloudData](v52, "alwaysDiscardsLatePointCloudData"));
    v118 = -[AVCaptureConnection clientRetainedBufferCount](self, "clientRetainedBufferCount");
    v119 = v16;
  }
  objc_msgSend(v119, "setRetainedBufferCount:", v118);
LABEL_147:
  objc_msgSend(v53, "setSinkID:", -[AVCaptureOutput sinkID](v52, "sinkID"));
LABEL_148:
  objc_msgSend(v11, "setSinkConfiguration:", v53);
  if (objc_msgSend((id)objc_msgSend(v11, "sourceConfiguration"), "videoStabilizationStrength") == 2)
  {
    -[AVCaptureConnection output](self, "output");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (-[AVCaptureConnection output](self, "output"), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v14, "setVideoStabilizationMethod:", 5);
    }
    objc_msgSend((id)objc_msgSend(v11, "sourceConfiguration"), "setVideoStabilizationStrength:", 0);
  }
  return v11;
}

- (unsigned)clientRetainedBufferCount
{
  AVCaptureOutput *v3;
  AVCaptureConnectionInternal *internal;
  unsigned int result;
  CMVideoDimensions Dimensions;
  double Seconds;
  float v9;
  float v10;
  void *v11;
  float v12;
  float v13;
  CMVideoDimensions v14;
  BOOL v15;
  float v16;
  CMTime v17;
  CMTime time;

  if (!self->_internal->outputWeakReference)
    return 0;
  v3 = -[AVCaptureConnection output](self, "output");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    internal = self->_internal;
    result = internal->videoRetainedBufferCountHint;
    if (!result)
    {
      Dimensions = CMVideoFormatDescriptionGetDimensions(-[AVCaptureDeviceFormat formatDescription](-[AVCaptureDevice activeFormat](internal->sourceDevice, "activeFormat"), "formatDescription"));
      if (Dimensions.height <= 3023 || Dimensions.width <= 4031)
        return 12;
      else
        return 5;
    }
    return result;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  result = self->_internal->videoRetainedBufferCountHint;
  if (!result)
  {
    if (v3)
    {
      -[AVCaptureOutput minBurstFrameDuration](v3, "minBurstFrameDuration");
      Seconds = CMTimeGetSeconds(&time);
      -[AVCaptureOutput minFrameDuration](v3, "minFrameDuration");
    }
    else
    {
      memset(&time, 0, sizeof(time));
      Seconds = CMTimeGetSeconds(&time);
      memset(&v17, 0, sizeof(v17));
    }
    v9 = 1.0 / Seconds;
    v10 = 1.0 / CMTimeGetSeconds(&v17);
    v11 = (void *)objc_msgSend(-[NSArray firstObject](-[AVCaptureConnection inputPorts](self, "inputPorts"), "firstObject"), "figCaptureSourceConfigurationForSessionPreset:", objc_msgSend(-[AVCaptureOutput session](v3, "session"), "sessionPreset"));
    if (v9 == 0.0)
      v9 = v10;
    objc_msgSend(v11, "requiredMaxFrameRate", v17.value, *(_QWORD *)&v17.timescale, v17.epoch);
    v13 = v9 / v12;
    v14 = CMVideoFormatDescriptionGetDimensions(-[AVCaptureDeviceFormat formatDescription](-[AVCaptureDevice activeFormat](self->_internal->sourceDevice, "activeFormat"), "formatDescription"));
    v15 = v14.height <= 3023 || v14.width <= 4031;
    v16 = 12.0;
    if (!v15)
      v16 = 5.0;
    return (int)((float)(v13 * v16) + 0.5);
  }
  return result;
}

- (id)session
{
  AVCaptureOutput *v2;

  if (self->_internal->outputWeakReference)
    v2 = -[AVCaptureConnection output](self, "output");
  else
    v2 = -[AVCaptureConnection videoPreviewLayer](self, "videoPreviewLayer");
  return -[AVCaptureOutput session](v2, "session");
}

- (BOOL)isVideoZoomSmoothingEnabled
{
  return self->_internal->videoZoomSmoothingEnabled;
}

- (void)_setActive:(BOOL)a3
{
  self->_internal->active = a3;
}

- (id)sourceDevice
{
  return self->_internal->sourceDevice;
}

- (BOOL)isVideoMinFrameDurationSet
{
  return self->_internal->videoMinFrameDuration.timescale & 1;
}

- (BOOL)isVideoMaxFrameDurationSet
{
  return self->_internal->videoMaxFrameDuration.timescale & 1;
}

- (NSArray)inputPorts
{
  return (NSArray *)self->_internal->inputPorts;
}

- (BOOL)isTrulyDisabled
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!-[AVCaptureConnection isActive](self, "isActive"))
    return 1;
  if (-[AVCaptureConnection isEnabled](self, "isEnabled")
    && (objc_msgSend(-[NSArray firstObject](-[AVCaptureConnection inputPorts](self, "inputPorts"), "firstObject"), "isEnabled") & 1) != 0)
  {
    return 0;
  }
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 3);
  -[AVCaptureConnection output](self, "output", v5, v6);
  return objc_msgSend(v4, "containsObject:", objc_opt_class());
}

- (BOOL)isEnabled
{
  return self->_internal->enabled;
}

- (AVCaptureOutput)output
{
  return (AVCaptureOutput *)-[AVWeakReference referencedObject](self->_internal->outputWeakReference, "referencedObject");
}

- (id)mediaType
{
  AVCaptureConnectionInternal *internal;
  id result;

  internal = self->_internal;
  result = internal->videoInputPort;
  if (result)
    return (id)objc_msgSend(result, "mediaType");
  result = internal->audioInputPort;
  if (result)
    return (id)objc_msgSend(result, "mediaType");
  result = internal->metadataInputPort;
  if (result)
    return (id)objc_msgSend(result, "mediaType");
  result = internal->metadataItemInputPort;
  if (result)
    return (id)objc_msgSend(result, "mediaType");
  result = internal->depthDataInputPort;
  if (result)
    return (id)objc_msgSend(result, "mediaType");
  result = internal->visionDataInputPort;
  if (result)
    return (id)objc_msgSend(result, "mediaType");
  result = internal->pointCloudDataInputPort;
  if (result)
    return (id)objc_msgSend(result, "mediaType");
  result = internal->cameraCalibrationDataInputPort;
  if (result)
    return (id)objc_msgSend(result, "mediaType");
  return result;
}

- (BOOL)isActive
{
  return self->_internal->active;
}

- (void)setupInternalStorage
{
  NSMutableArray *inputPorts;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  AVCaptureOutput *v20;
  AVCaptureVideoPreviewLayer *v21;
  char v22;
  id v23;
  uint64_t v24;
  id v25;
  double v26;
  char v27;
  double v28;
  AVCaptureConnectionInternal *internal;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  AVCaptureConnectionInternal *v33;
  AVCaptureInput *v34;
  CMVideoDimensions Dimensions;
  float v36;
  AVCaptureConnectionInternal *v37;
  id v38;
  uint64_t v39;
  objc_class *v40;
  NSString *v41;
  uint64_t v42;
  NSString *v43;
  AVCaptureConnectionInternal *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  inputPorts = self->_internal->inputPorts;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputPorts, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v51;
    v7 = *MEMORY[0x1E0CF2B68];
    v8 = *MEMORY[0x1E0CF2B90];
    v45 = *MEMORY[0x1E0CF2B78];
    v9 = *MEMORY[0x1E0CF2B70];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v51 != v6)
          objc_enumerationMutation(inputPorts);
        v11 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_msgSend(v11, "mediaType"), "isEqualToString:", v7) & 1) != 0)
        {
          v12 = 56;
        }
        else if ((objc_msgSend((id)objc_msgSend(v11, "mediaType"), "isEqualToString:", v8) & 1) != 0)
        {
          v12 = 88;
        }
        else if ((objc_msgSend((id)objc_msgSend(v11, "mediaType"), "isEqualToString:", AVMediaTypeForMetadataObjects()) & 1) != 0)
        {
          v12 = 96;
        }
        else if (AVMediaTypeMetadataObjectAndAVMediaTypeMetadataAreDefined()
               && (objc_msgSend((id)objc_msgSend(v11, "mediaType"), "isEqualToString:", v45) & 1) != 0)
        {
          v12 = 104;
        }
        else if ((objc_msgSend((id)objc_msgSend(v11, "mediaType"), "isEqualToString:", v9) & 1) != 0)
        {
          v12 = 112;
        }
        else if ((objc_msgSend((id)objc_msgSend(v11, "mediaType"), "isEqualToString:", CFSTR("visn")) & 1) != 0)
        {
          v12 = 120;
        }
        else if ((objc_msgSend((id)objc_msgSend(v11, "mediaType"), "isEqualToString:", CFSTR("pcld")) & 1) != 0)
        {
          v12 = 128;
        }
        else
        {
          if (!objc_msgSend((id)objc_msgSend(v11, "mediaType"), "isEqualToString:", CFSTR("cacd")))
            continue;
          v12 = 136;
        }
        *(Class *)((char *)&self->_internal->super.isa + v12) = (Class)v11;
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputPorts, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v5);
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v13 = -[AVCaptureConnection inputPorts](self, "inputPorts");
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v47;
    while (2)
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v47 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "input");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = (void *)objc_msgSend(v18, "device");
          goto LABEL_36;
        }
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      if (v15)
        continue;
      break;
    }
  }
  v19 = 0;
  v18 = 0;
LABEL_36:
  self->_internal->sourceDeviceInput = (AVCaptureDeviceInput *)v18;
  self->_internal->sourceDevice = (AVCaptureDevice *)v19;
  self->_internal->enabled = 1;
  self->_internal->active = 1;
  v20 = -[AVCaptureConnection output](self, "output");
  v21 = -[AVCaptureConnection videoPreviewLayer](self, "videoPreviewLayer");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_internal->videoInputPort
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v22 = 1;
  }
  else
  {
    objc_opt_class();
    v22 = objc_opt_isKindOfClass() | (v21 != 0);
  }
  self->_internal->videoMirroringSupported = v22 & 1;
  self->_internal->videoMirrored = 0;
  self->_internal->automaticallyAdjustsVideoMirroring = 0;
  if (v21)
  {
    self->_internal->automaticallyAdjustsVideoMirroring = 1;
    self->_internal->videoMirrored = -[AVCaptureConnection sourcesFromFrontFacingCamera](self, "sourcesFromFrontFacingCamera");
    self->_internal->videoMirrored |= -[AVCaptureConnection sourcesFromExternalCamera](self, "sourcesFromExternalCamera");
  }
  self->_internal->supportedVideoMirroringMethodsForMovieRecording = (NSArray *)&unk_1E424D870;
  self->_internal->videoMirroringMethodForMovieRecording = 0;
  self->_internal->videoRotationSupported = self->_internal->videoMirroringSupported;
  v23 = -[AVCaptureConnection mediaType](self, "mediaType");
  v24 = *MEMORY[0x1E0CF2B90];
  if (((objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0CF2B90]) & 1) != 0
     || (v25 = -[AVCaptureConnection mediaType](self, "mediaType"),
         objc_msgSend(v25, "isEqualToString:", *MEMORY[0x1E0CF2B70])))
    && (-[AVCaptureConnection sourcesFromExternalCamera](self, "sourcesFromExternalCamera"),
        AVCapturePlatformMountsCamerasInLandscapeOrientation()))
  {
    v26 = 90.0;
  }
  else
  {
    v26 = 0.0;
  }
  self->_internal->videoRotationAngle = v26;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v27 = objc_msgSend(v19, "hasMediaType:", v24);
  else
    v27 = 0;
  self->_internal->videoDeviceOrientationCorrectionSupported = v27;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[AVCaptureConnection sourcesFromExternalCamera](self, "sourcesFromExternalCamera");
    if (AVCapturePlatformMountsCamerasInLandscapeOrientation())
    {
      if (-[AVCaptureConnection sourcesFromFrontFacingCamera](self, "sourcesFromFrontFacingCamera")
        && (-[AVCaptureConnection sourcesFromFrontFacingCamera](self, "sourcesFromFrontFacingCamera"),
            -[AVCaptureConnection sourcesFromExternalCamera](self, "sourcesFromExternalCamera"),
            !FigCaptureCameraRequires180DegreesRotation()))
      {
        v28 = 180.0;
      }
      else
      {
        v28 = 0.0;
      }
      self->_internal->videoRotationAngle = v28;
    }
  }
  self->_internal->clientUsesVideoRotationAngleAPI = 0;
  internal = self->_internal;
  v30 = MEMORY[0x1E0CA2E18];
  v31 = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)(&internal->clientUsesVideoRotationAngleAPI + 4) = *MEMORY[0x1E0CA2E18];
  v32 = *(_QWORD *)(v30 + 16);
  *(_QWORD *)&internal->videoMinFrameDuration.flags = v32;
  v33 = self->_internal;
  *(_OWORD *)((char *)&v33->videoMinFrameDuration.epoch + 4) = v31;
  *(_QWORD *)&v33->videoMaxFrameDuration.flags = v32;
  self->_internal->videoScaleAndCropFactor = 1.0;
  self->_internal->videoMaxScaleAndCropFactor = 1.0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v34 = -[AVCaptureInputPort input](self->_internal->videoInputPort, "input");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend((id)objc_msgSend((id)-[AVCaptureInput device](v34, "device"), "activeFormat"), "formatDescription"));
      v36 = (float)Dimensions.width * 0.0625;
      if (v36 >= (float)((float)Dimensions.height * 0.0625))
        v36 = (float)Dimensions.height * 0.0625;
      self->_internal->videoMaxScaleAndCropFactor = v36;
    }
  }
  self->_internal->videoRetainedBufferCountHint = 0;
  self->_internal->preferredVideoStabilizationMode = 0;
  v37 = self->_internal;
  if (v37->audioInputPort)
  {
    self->_internal->audioChannels = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    -[AVCaptureConnection updateAudioChannelsArray](self, "updateAudioChannelsArray");
    goto LABEL_73;
  }
  if (v37->videoInputPort)
  {
    if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureMFOStabilizationIsAlwaysOn")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (-[AVCaptureConnection isVideoStabilizationSupported](self, "isVideoStabilizationSupported"))
        {
          self->_internal->preferredVideoStabilizationMode = 1;
          if (-[AVCaptureDeviceFormat isVideoStabilizationModeSupported:](-[AVCaptureDevice activeFormat](self->_internal->sourceDevice, "activeFormat"), "isVideoStabilizationModeSupported:", 1))
          {
            self->_internal->activeVideoStabilizationMode = 1;
          }
        }
      }
    }
    v44 = self->_internal;
    if (!v44->preferredVideoStabilizationMode)
    {
      if (!v44->videoPreviewLayerWeakReference)
      {
        if (!-[AVCaptureConnection _outputIsPreviewSizedVideoDataOutput](self, "_outputIsPreviewSizedVideoDataOutput"))
          goto LABEL_73;
        v44 = self->_internal;
      }
      if (-[AVCaptureDeviceFormat isVideoStabilizationModeSupported:](-[AVCaptureDevice activeFormat](v44->sourceDevice, "activeFormat"), "isVideoStabilizationModeSupported:", 4))
      {
        -[AVCaptureConnection setPreferredVideoStabilizationMode:](self, "setPreferredVideoStabilizationMode:", 4);
      }
    }
  }
LABEL_73:
  self->_internal->cameraIntrinsicMatrixDeliverySupported = 0;
  self->_internal->cameraIntrinsicMatrixDeliveryEnabled = 0;
  self->_internal->livePhotoMetadataWritingEnabled = 0;
  self->_internal->debugMetadataSidecarFileEnabled = 0;
  self->_internal->videoZoomSmoothingSupported = 0;
  self->_internal->videoZoomSmoothingEnabled = 0;
  self->_internal->videoGreenGhostMitigationSupported = 0;
  self->_internal->videoGreenGhostMitigationEnabled = 0;
  if (AVCaptureSessionIsLaunchPrewarmingEnabled())
  {
    v38 = objc_alloc(MEMORY[0x1E0CB3940]);
    v39 = objc_msgSend(-[NSArray firstObject](-[AVCaptureConnection inputPorts](self, "inputPorts"), "firstObject"), "sourceID");
    v40 = (objc_class *)objc_opt_class();
    v41 = NSStringFromClass(v40);
    v42 = -[AVCaptureOutput sinkID](v20, "sinkID");
    if (!v42)
      v42 = -[AVCaptureVideoPreviewLayer sinkID](v21, "sinkID");
    v43 = (NSString *)objc_msgSend(v38, "initWithFormat:", CFSTR("(%@ -> <%@> -> %@)"), v39, v41, v42);
  }
  else
  {
    v43 = (NSString *)AVIdentifierForObject((uint64_t)self);
  }
  self->_internal->connectionID = v43;
}

- (AVCaptureVideoPreviewLayer)videoPreviewLayer
{
  return (AVCaptureVideoPreviewLayer *)-[AVWeakReference referencedObject](self->_internal->videoPreviewLayerWeakReference, "referencedObject");
}

- (BOOL)sourcesFromExternalCamera
{
  return -[NSString isEqualToString:](-[AVCaptureDevice deviceType](self->_internal->sourceDevice, "deviceType"), "isEqualToString:", CFSTR("AVCaptureDeviceTypeExternal"))|| -[NSString isEqualToString:](-[AVCaptureDevice deviceType](self->_internal->sourceDevice, "deviceType"), "isEqualToString:", CFSTR("AVCaptureDeviceTypeContinuityCamera"));
}

- (BOOL)_outputIsPreviewSizedVideoDataOutput
{
  AVCaptureOutput *v2;

  v2 = -[AVCaptureConnection output](self, "output");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[AVCaptureOutput deliversPreviewSizedOutputBuffers](v2, "deliversPreviewSizedOutputBuffers");
  else
    return 0;
}

- (void)setPreferredVideoStabilizationMode:(AVCaptureVideoStabilizationMode)preferredVideoStabilizationMode
{
  AVCaptureConnectionInternal *internal;
  void *v4;

  if ((unint64_t)(preferredVideoStabilizationMode + 1) >= 7)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0, preferredVideoStabilizationMode);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  }
  else
  {
    internal = self->_internal;
    if (internal->preferredVideoStabilizationMode != preferredVideoStabilizationMode)
    {
      internal->preferredVideoStabilizationMode = preferredVideoStabilizationMode;
      -[AVCaptureConnection _updateActiveVideoStabilizationMode:bumpChangeSeed:](self, "_updateActiveVideoStabilizationMode:bumpChangeSeed:", -[AVCaptureConnection _resolveActiveVideoStabilizationMode:format:](self, "_resolveActiveVideoStabilizationMode:format:", preferredVideoStabilizationMode, -[AVCaptureDevice activeFormat](self->_internal->sourceDevice, "activeFormat")), 1);
    }
  }
}

- (int)changeSeed
{
  return self->_internal->changeSeed;
}

- (void)dealloc
{
  AVCaptureConnectionInternal *internal;
  AVCaptureConnectionInternal *v4;
  NSMutableArray *audioChannels;
  objc_super v6;

  internal = self->_internal;
  if (internal->hasActiveObservers)
  {
    -[AVCaptureConnection teardownObservers](self, "teardownObservers");
    internal = self->_internal;
  }

  v4 = self->_internal;
  audioChannels = v4->audioChannels;
  if (audioChannels)
  {
    -[NSMutableArray makeObjectsPerformSelector:](audioChannels, "makeObjectsPerformSelector:", sel_invalidate);

    v4 = self->_internal;
  }

  v6.receiver = self;
  v6.super_class = (Class)AVCaptureConnection;
  -[AVCaptureConnection dealloc](&v6, sel_dealloc);
}

+ (AVCaptureConnection)connectionWithInputPort:(AVCaptureInputPort *)port videoPreviewLayer:(AVCaptureVideoPreviewLayer *)layer
{
  return (AVCaptureConnection *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInputPort:videoPreviewLayer:", port, layer);
}

- (AVCaptureConnection)initWithInputPort:(AVCaptureInputPort *)port videoPreviewLayer:(AVCaptureVideoPreviewLayer *)layer
{
  AVCaptureConnection *v6;
  AVCaptureConnectionInternal *v7;

  v6 = -[AVCaptureConnection init](self, "init");
  if (v6)
  {
    v7 = objc_alloc_init(AVCaptureConnectionInternal);
    v6->_internal = v7;
    if (port && layer && v7)
    {
      v6->_internal->inputPorts = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", port, 0);
      v6->_internal->videoPreviewLayerWeakReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", layer);
      -[AVCaptureConnection setupInternalStorage](v6, "setupInternalStorage");
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

+ (AVCaptureConnection)connectionWithInputPorts:(NSArray *)ports output:(AVCaptureOutput *)output
{
  return (AVCaptureConnection *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInputPorts:output:", ports, output);
}

- (AVCaptureConnection)initWithInputPorts:(NSArray *)ports output:(AVCaptureOutput *)output
{
  AVCaptureConnection *v6;
  AVCaptureConnectionInternal *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVCaptureConnection;
  v6 = -[AVCaptureConnection init](&v9, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(AVCaptureConnectionInternal);
    v6->_internal = v7;
    if (ports && output && v7)
    {
      v6->_internal->inputPorts = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", ports);
      v6->_internal->outputWeakReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", output);
      -[AVCaptureConnection setupInternalStorage](v6, "setupInternalStorage");
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)setupObservers
{
  AVCaptureConnectionInternal *internal;
  AVCaptureConnectionInternal *v4;
  AVCaptureOutput *v5;
  AVCaptureDevice *sourceDevice;

  internal = self->_internal;
  if (!internal->hasActiveObservers)
  {
    internal->hasActiveObservers = 1;
    v4 = self->_internal;
    if (v4->audioInputPort)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel_inputPortFormatDescriptionChanged_, CFSTR("AVCaptureInputPortFormatDescriptionDidChangeNotification"), self->_internal->audioInputPort);
      -[AVCaptureConnection updateAudioChannelsArray](self, "updateAudioChannelsArray");
    }
    else if (v4->videoInputPort && v4->sourceDevice)
    {
      v5 = -[AVCaptureConnection output](self, "output");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[AVCaptureOutput addObserver:forKeyPath:options:context:](v5, "addObserver:forKeyPath:options:context:", self, CFSTR("livePhotoCaptureEnabled"), 3, AVCaptureConnectionLivePhotoEnabledChangedContext);
      -[AVCaptureConnection _updatePropertiesForFormat:](self, "_updatePropertiesForFormat:", -[AVCaptureDevice activeFormat](self->_internal->sourceDevice, "activeFormat"));
    }
    else if (v4->pointCloudDataInputPort)
    {
      sourceDevice = v4->sourceDevice;
      if (sourceDevice)
        -[AVCaptureDevice addObserver:forKeyPath:options:context:](sourceDevice, "addObserver:forKeyPath:options:context:", self, CFSTR("timeOfFlightProjectorMode"), 3, AVCaptureConnectionDeviceTimeOfFlightProjectorModeChangedContext);
    }
  }
}

- (void)updateAudioChannelsArray
{
  AVCaptureConnectionInternal *internal;
  const opaqueCMFormatDescription *v4;
  unint64_t mChannelsPerFrame;
  AVCaptureAudioChannel *v6;

  internal = self->_internal;
  objc_sync_enter(internal);
  v4 = -[AVCaptureInputPort formatDescription](self->_internal->audioInputPort, "formatDescription");
  if (v4)
    mChannelsPerFrame = CMAudioFormatDescriptionGetStreamBasicDescription(v4)->mChannelsPerFrame;
  else
    mChannelsPerFrame = 1;
  if (-[NSMutableArray count](self->_internal->audioChannels, "count") != mChannelsPerFrame)
  {
    -[AVCaptureConnection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("audioChannels"));
    while (-[NSMutableArray count](self->_internal->audioChannels, "count") < mChannelsPerFrame)
    {
      v6 = -[AVCaptureAudioChannel initWithConnection:]([AVCaptureAudioChannel alloc], "initWithConnection:", self);
      -[NSMutableArray addObject:](self->_internal->audioChannels, "addObject:", v6);

    }
    while (-[NSMutableArray count](self->_internal->audioChannels, "count") > mChannelsPerFrame)
    {
      objc_msgSend((id)-[NSMutableArray lastObject](self->_internal->audioChannels, "lastObject"), "invalidate");
      -[NSMutableArray removeLastObject](self->_internal->audioChannels, "removeLastObject");
    }
    -[AVCaptureConnection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("audioChannels"));
  }
  objc_sync_exit(internal);
}

- (void)_updateActiveVideoStabilizationMode:(int64_t)a3 bumpChangeSeed:(BOOL)a4
{
  AVCaptureConnectionInternal *internal;
  unint64_t activeVideoStabilizationMode;
  _BOOL4 v8;
  BOOL v9;
  uint64_t v10;
  BOOL v11;

  if (a3 != -1)
  {
    internal = self->_internal;
    activeVideoStabilizationMode = internal->activeVideoStabilizationMode;
    if (activeVideoStabilizationMode != a3)
    {
      v8 = a4;
      if ((unint64_t)a3 <= 5 && ((1 << a3) & 0x2C) != 0)
      {
        if (internal->hasActiveObservers && !internal->hasVideoMinFrameDurationObserver)
        {
          internal->hasVideoMinFrameDurationObserver = 1;
          -[AVCaptureDevice addObserver:forKeyPath:options:context:](self->_internal->sourceDevice, "addObserver:forKeyPath:options:context:", self, CFSTR("activeVideoMinFrameDuration"), 3, AVCaptureConnectionDeviceActiveMinFrameDurationChangedContext);
        }
      }
      else
      {
        v9 = activeVideoStabilizationMode > 5;
        v10 = (1 << activeVideoStabilizationMode) & 0x2C;
        v11 = v9 || v10 == 0;
        if (!v11 && internal->hasVideoMinFrameDurationObserver)
        {
          internal->hasVideoMinFrameDurationObserver = 0;
          -[AVCaptureDevice removeObserver:forKeyPath:context:](self->_internal->sourceDevice, "removeObserver:forKeyPath:context:", self, CFSTR("activeVideoMinFrameDuration"), AVCaptureConnectionDeviceActiveMinFrameDurationChangedContext);
        }
      }
      -[AVCaptureConnection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoStabilizationEnabled"));
      self->_internal->videoStabilizationEnabled = a3 != 0;
      -[AVCaptureConnection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("videoStabilizationEnabled"));
      -[AVCaptureConnection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activeVideoStabilizationMode"));
      self->_internal->activeVideoStabilizationMode = a3;
      -[AVCaptureConnection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("activeVideoStabilizationMode"));
      -[AVCaptureConnection _updateCameraIntrinsicMatrixDeliverySupported](self, "_updateCameraIntrinsicMatrixDeliverySupported");
      -[AVCaptureConnection _updateSupportedVideoMirroringMethodsForMovieRecording](self, "_updateSupportedVideoMirroringMethodsForMovieRecording");
      -[AVCaptureConnection _updateZoomSmoothingSupported](self, "_updateZoomSmoothingSupported");
      -[AVCaptureConnection _updateVideoGreenGhostMitigationSupported](self, "_updateVideoGreenGhostMitigationSupported");
      -[AVCaptureOutput handleVideoStabilizationModeChangedForConnection:](-[AVCaptureConnection output](self, "output"), "handleVideoStabilizationModeChangedForConnection:", self);
      if (v8)
      {
        if (-[AVCaptureConnection isLive](self, "isLive"))
          -[AVCaptureOutput bumpChangeSeed](-[AVCaptureConnection output](self, "output"), "bumpChangeSeed");
      }
    }
  }
}

- (void)_updatePropertiesForFormat:(id)a3
{
  -[AVCaptureConnection _updateMaxScaleAndCropFactorForFormat:](self, "_updateMaxScaleAndCropFactorForFormat:");
  if (-[AVCaptureConnection isVideoStabilizationSupported](self, "isVideoStabilizationSupported"))
    -[AVCaptureConnection _updateActiveVideoStabilizationMode:bumpChangeSeed:](self, "_updateActiveVideoStabilizationMode:bumpChangeSeed:", -[AVCaptureConnection _resolveActiveVideoStabilizationMode:format:](self, "_resolveActiveVideoStabilizationMode:format:", self->_internal->preferredVideoStabilizationMode, a3), 0);
  -[AVCaptureConnection _updateCameraIntrinsicMatrixDeliverySupported](self, "_updateCameraIntrinsicMatrixDeliverySupported");
  -[AVCaptureConnection _updateSupportedVideoMirroringMethodsForMovieRecording](self, "_updateSupportedVideoMirroringMethodsForMovieRecording");
  -[AVCaptureConnection _updateZoomSmoothingSupported](self, "_updateZoomSmoothingSupported");
  -[AVCaptureConnection _updateVideoGreenGhostMitigationSupported](self, "_updateVideoGreenGhostMitigationSupported");
}

- (void)_updateSupportedVideoMirroringMethodsForMovieRecording
{
  void *v3;
  AVCaptureOutput *v4;
  AVCaptureOutput *v5;
  int v6;
  _BOOL4 v7;
  uint64_t videoMirroringMethodForMovieRecording;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = -[AVCaptureConnection output](self, "output");
  if (self->_internal->videoMirroringSupported)
  {
    v5 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "addObject:", &unk_1E424CDC8);
      if ((self->_internal->activeVideoStabilizationMode & 0xFFFFFFFFFFFFFFFBLL) == 0)
        goto LABEL_9;
LABEL_8:
      objc_msgSend(v3, "addObject:", &unk_1E424CDE0);
      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "addObject:", &unk_1E424CDC8);
      v6 = -[AVCaptureOutput isLivePhotoCaptureEnabled](v5, "isLivePhotoCaptureEnabled");
      v7 = -[AVCaptureDeviceFormat isIrisVideoStabilizationSupported](-[AVCaptureDevice activeFormat](self->_internal->sourceDevice, "activeFormat"), "isIrisVideoStabilizationSupported");
      if (v6)
      {
        if (v7)
          goto LABEL_8;
      }
    }
  }
LABEL_9:
  if (!objc_msgSend(v3, "count"))
    objc_msgSend(v3, "addObject:", &unk_1E424CDB0);
  if ((objc_msgSend(v3, "isEqual:", self->_internal->supportedVideoMirroringMethodsForMovieRecording) & 1) == 0)
  {
    if (objc_msgSend(v3, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_internal->videoMirroringMethodForMovieRecording)))videoMirroringMethodForMovieRecording = self->_internal->videoMirroringMethodForMovieRecording;
    else
      videoMirroringMethodForMovieRecording = objc_msgSend((id)objc_msgSend(v3, "firstObject"), "integerValue");
    -[AVCaptureConnection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("supportedVideoMirroringMethodsForMovieRecording"));

    self->_internal->supportedVideoMirroringMethodsForMovieRecording = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v3);
    if (videoMirroringMethodForMovieRecording != self->_internal->videoMirroringMethodForMovieRecording)
    {
      -[AVCaptureConnection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoMirroringMethodForMovieRecording"));
      self->_internal->videoMirroringMethodForMovieRecording = videoMirroringMethodForMovieRecording;
      -[AVCaptureConnection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("videoMirroringMethodForMovieRecording"));
    }
    -[AVCaptureConnection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("supportedVideoMirroringMethodsForMovieRecording"));
  }
}

- (void)_updateZoomSmoothingSupported
{
  int isKindOfClass;
  int64_t activeVideoStabilizationMode;
  int v6;
  id v7;
  int v8;
  _BOOL4 v9;

  -[AVCaptureConnection output](self, "output");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    -[AVCaptureConnection output](self, "output");
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  activeVideoStabilizationMode = self->_internal->activeVideoStabilizationMode;
  if (activeVideoStabilizationMode == 3 || activeVideoStabilizationMode == 5)
    v6 = isKindOfClass;
  else
    v6 = 0;
  v7 = -[AVCaptureConnection mediaType](self, "mediaType");
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CF2B90]);
  v9 = -[AVCaptureDevice isVideoZoomSmoothingSupported](self->_internal->sourceDevice, "isVideoZoomSmoothingSupported") & v6 & v8;
  if (self->_internal->videoZoomSmoothingSupported != v9)
  {
    -[AVCaptureConnection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoZoomSmoothingSupported"));
    self->_internal->videoZoomSmoothingSupported = v9;
    if (!v9 && self->_internal->videoZoomSmoothingEnabled)
    {
      -[AVCaptureConnection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoZoomSmoothingEnabled"));
      self->_internal->videoZoomSmoothingEnabled = 0;
      -[AVCaptureConnection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("videoZoomSmoothingEnabled"));
    }
    -[AVCaptureConnection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("videoZoomSmoothingSupported"));
  }
}

- (void)_updateVideoGreenGhostMitigationSupported
{
  int v3;
  int64_t activeVideoStabilizationMode;
  int v6;
  id v7;
  int v8;
  _BOOL4 v9;

  -[AVCaptureConnection output](self, "output");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = -[AVCaptureOutput isSpatialVideoCaptureEnabled](-[AVCaptureConnection output](self, "output"), "isSpatialVideoCaptureEnabled") ^ 1;
  else
    v3 = 0;
  activeVideoStabilizationMode = self->_internal->activeVideoStabilizationMode;
  if (activeVideoStabilizationMode == 3 || activeVideoStabilizationMode == 5)
    v6 = v3;
  else
    v6 = 0;
  v7 = -[AVCaptureConnection mediaType](self, "mediaType");
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CF2B90]);
  v9 = -[AVCaptureDeviceFormat isVideoGreenGhostMitigationSupported](-[AVCaptureDevice activeFormat](self->_internal->sourceDevice, "activeFormat"), "isVideoGreenGhostMitigationSupported") & v8 & v6;
  if (self->_internal->videoGreenGhostMitigationSupported != v9)
  {
    -[AVCaptureConnection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoGreenGhostMitigationSupported"));
    self->_internal->videoGreenGhostMitigationSupported = v9;
    if (!v9 && self->_internal->videoGreenGhostMitigationEnabled)
    {
      -[AVCaptureConnection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoGreenGhostMitigationEnabled"));
      self->_internal->videoGreenGhostMitigationEnabled = 0;
      -[AVCaptureConnection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("videoGreenGhostMitigationEnabled"));
    }
    -[AVCaptureConnection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("videoGreenGhostMitigationSupported"));
  }
}

- (BOOL)_updateCameraIntrinsicMatrixDeliverySupported
{
  int isKindOfClass;
  int v4;
  id v5;
  int v6;
  _BOOL4 v7;
  double v8;
  _BOOL4 v9;
  int v10;
  BOOL v11;

  -[AVCaptureConnection output](self, "output");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((self->_internal->activeVideoStabilizationMode | 4) == 4)
    v4 = isKindOfClass;
  else
    v4 = 0;
  v5 = -[AVCaptureConnection mediaType](self, "mediaType");
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CF2B90]);
  v7 = -[AVCaptureDevice isCameraIntrinsicMatrixDeliverySupported](self->_internal->sourceDevice, "isCameraIntrinsicMatrixDeliverySupported");
  objc_msgSend(-[NSArray lastObject](-[AVCaptureDeviceFormat videoSupportedFrameRateRanges](-[AVCaptureDevice activeFormat](self->_internal->sourceDevice, "activeFormat"), "videoSupportedFrameRateRanges"), "lastObject"), "maxFrameRate");
  v9 = v8 <= 120.0 && v7;
  v10 = v9 & v6 & v4;
  if (self->_internal->cameraIntrinsicMatrixDeliverySupported == v10)
    return 0;
  -[AVCaptureConnection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("cameraIntrinsicMatrixDeliverySupported"));
  self->_internal->cameraIntrinsicMatrixDeliverySupported = v10;
  if ((v10 & 1) != 0 || !self->_internal->cameraIntrinsicMatrixDeliveryEnabled)
  {
    v11 = 0;
  }
  else
  {
    -[AVCaptureConnection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("cameraIntrinsicMatrixDeliveryEnabled"));
    self->_internal->cameraIntrinsicMatrixDeliveryEnabled = 0;
    -[AVCaptureConnection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("cameraIntrinsicMatrixDeliveryEnabled"));
    v11 = 1;
  }
  -[AVCaptureConnection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("cameraIntrinsicMatrixDeliverySupported"));
  return v11;
}

- (BOOL)isVideoStabilizationSupported
{
  AVCaptureConnectionInternal *internal;
  int v3;
  id v5;

  internal = self->_internal;
  if (internal->videoPreviewLayerWeakReference)
  {
    LOBYTE(v3) = -[AVCaptureDeviceFormat isVideoStabilizationModeSupported:](-[AVCaptureDevice activeFormat](internal->sourceDevice, "activeFormat"), "isVideoStabilizationModeSupported:", 4);
  }
  else
  {
    v5 = -[AVCaptureConnection mediaType](self, "mediaType");
    v3 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CF2B90]);
    if (v3)
      LOBYTE(v3) = -[AVCaptureDevice isVideoStabilizationSupported](self->_internal->sourceDevice, "isVideoStabilizationSupported");
  }
  return v3;
}

- (void)_updateMaxScaleAndCropFactorForFormat:(id)a3
{
  CMVideoDimensions Dimensions;
  float v6;
  double v7;

  -[AVCaptureConnection output](self, "output");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (-[AVCaptureConnection output](self, "output"), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(a3, "formatDescription"));
    v6 = (float)Dimensions.width * 0.0625;
    if (v6 >= (float)((float)Dimensions.height * 0.0625))
      v6 = (float)Dimensions.height * 0.0625;
    v7 = v6;
    if (self->_internal->videoMaxScaleAndCropFactor != v6)
    {
      -[AVCaptureConnection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoMaxScaleAndCropFactor"));
      self->_internal->videoMaxScaleAndCropFactor = v7;
      -[AVCaptureConnection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("videoMaxScaleAndCropFactor"));
      if (self->_internal->videoScaleAndCropFactor > self->_internal->videoMaxScaleAndCropFactor)
      {
        -[AVCaptureConnection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoScaleAndCropFactor"));
        self->_internal->videoScaleAndCropFactor = self->_internal->videoMaxScaleAndCropFactor;
        -[AVCaptureConnection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("videoScaleAndCropFactor"));
      }
    }
  }
}

- (int64_t)_resolveActiveVideoStabilizationMode:(int64_t)a3 format:(id)a4
{
  int64_t v7;
  CMVideoDimensions Dimensions;
  CMVideoDimensions v9;
  unsigned __int8 BoolAnswer;
  unsigned __int8 v12;

  -[AVCaptureConnection output](self, "output");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && !self->_internal->videoPreviewLayerWeakReference)
    {
      a3 = 0;
      goto LABEL_16;
    }
  }
  if (a3 != -1)
  {
    if (self->_internal->videoPreviewLayerWeakReference)
    {
      if (a3 != 4)
        return 0;
      goto LABEL_9;
    }
LABEL_16:
    if (objc_msgSend(a4, "isVideoStabilizationModeSupported:", a3))
      return a3;
    else
      return 0;
  }
  Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(a4, "formatDescription"));
  if (self->_internal->videoPreviewLayerWeakReference)
  {
LABEL_9:
    v7 = 4;
    if (!objc_msgSend(a4, "isVideoStabilizationModeSupported:", 4))
      return 0;
    return v7;
  }
  v9 = Dimensions;
  if (objc_msgSend(a4, "isVideoStabilizationModeSupported:", 5)
    && (objc_msgSend(-[AVCaptureConnection sourceDevice](self, "sourceDevice"), "isStabilizationAutoSelectionCinematicExtendedEnhancedEnabled") & 1) != 0)
  {
    return 5;
  }
  v7 = 3;
  if ((objc_msgSend(a4, "isVideoStabilizationModeSupported:", 3) & 1) == 0)
  {
    if (objc_msgSend(a4, "isVideoStabilizationModeSupported:", 2))
    {
      BoolAnswer = AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureConnectionAlwaysSelectsStandardVISFor720p30"));
      if (v9.width == 1280)
        v12 = BoolAnswer;
      else
        v12 = 0;
      if ((v12 & (HIDWORD(*(unint64_t *)&v9) == 720)) != 0)
        return 1;
      else
        return 2;
    }
    else
    {
      return objc_msgSend(a4, "isVideoStabilizationModeSupported:", 1);
    }
  }
  return v7;
}

- (BOOL)isLive
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = -[AVCaptureConnection inputPorts](self, "inputPorts", 0);
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(v3);
      v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "isEnabled");
      if (!v8)
        break;
      if (v5 == ++v7)
      {
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v8 = -[AVCaptureConnection isEnabled](self, "isEnabled");
    if (v8)
      LOBYTE(v8) = -[AVCaptureConnection isActive](self, "isActive");
  }
  return v8;
}

- (AVCaptureVideoOrientation)videoOrientation
{
  int v3;
  _BOOL4 v4;
  AVCaptureConnectionInternal *internal;
  double videoRotationAngle;
  BOOL v7;
  AVCaptureVideoOrientation v8;
  BOOL v10;
  AVCaptureVideoOrientation v11;

  -[AVCaptureConnection sourcesFromFrontFacingCamera](self, "sourcesFromFrontFacingCamera");
  -[AVCaptureConnection sourcesFromExternalCamera](self, "sourcesFromExternalCamera");
  v3 = FigCaptureCameraRequires180DegreesRotation();
  -[AVCaptureConnection sourcesFromExternalCamera](self, "sourcesFromExternalCamera");
  v4 = AVCapturePlatformMountsCamerasInLandscapeOrientation();
  internal = self->_internal;
  videoRotationAngle = internal->videoRotationAngle;
  if (v4)
  {
    if (videoRotationAngle == 90.0)
    {
      if (internal->clientUsesVideoRotationAngleAPI
        && -[AVCaptureConnection sourcesFromFrontFacingCamera](self, "sourcesFromFrontFacingCamera"))
      {
        v7 = (-[AVCaptureConnection sourcesFromExternalCamera](self, "sourcesFromExternalCamera") | v3) == 0;
        v8 = AVCaptureVideoOrientationPortrait;
        goto LABEL_20;
      }
      return 1;
    }
    if (videoRotationAngle == 270.0)
    {
      if (internal->clientUsesVideoRotationAngleAPI
        && -[AVCaptureConnection sourcesFromFrontFacingCamera](self, "sourcesFromFrontFacingCamera"))
      {
        v10 = (-[AVCaptureConnection sourcesFromExternalCamera](self, "sourcesFromExternalCamera") | v3) == 0;
        v11 = AVCaptureVideoOrientationPortrait;
        goto LABEL_29;
      }
      return 2;
    }
    if (videoRotationAngle == 180.0)
    {
      v7 = v3 == 0;
LABEL_19:
      v8 = AVCaptureVideoOrientationLandscapeRight;
LABEL_20:
      if (v7)
        return v8 + 1;
      else
        return v8;
    }
    if (videoRotationAngle != 0.0)
      return 1;
    v10 = v3 == 0;
  }
  else
  {
    if (videoRotationAngle == 0.0)
      return 1;
    if (videoRotationAngle == 180.0)
      return 2;
    if (videoRotationAngle == 270.0)
    {
      if (!-[AVCaptureConnection sourcesFromFrontFacingCamera](self, "sourcesFromFrontFacingCamera"))
        return 3;
      v7 = !-[AVCaptureConnection sourcesFromExternalCamera](self, "sourcesFromExternalCamera");
      goto LABEL_19;
    }
    if (videoRotationAngle != 90.0)
      return 1;
    if (!-[AVCaptureConnection sourcesFromFrontFacingCamera](self, "sourcesFromFrontFacingCamera"))
      return 4;
    v10 = !-[AVCaptureConnection sourcesFromExternalCamera](self, "sourcesFromExternalCamera");
  }
  v11 = AVCaptureVideoOrientationLandscapeRight;
LABEL_29:
  if (v10)
    return v11;
  else
    return v11 + 1;
}

- (BOOL)sourcesFromFrontFacingCamera
{
  return -[AVCaptureDevice position](self->_internal->sourceDevice, "position") == AVCaptureDevicePositionFront;
}

- (BOOL)isVideoMirrored
{
  return self->_internal->videoMirrored;
}

- (BOOL)isVideoDeviceOrientationCorrectionEnabled
{
  return self->_internal->videoDeviceOrientationCorrectionEnabled;
}

- (CGFloat)videoScaleAndCropFactor
{
  return self->_internal->videoScaleAndCropFactor;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (id)supportedVideoMirroringMethodsForMovieRecording
{
  return self->_internal->supportedVideoMirroringMethodsForMovieRecording;
}

- (void)setEnabled:(BOOL)enabled
{
  AVCaptureConnectionInternal *internal;

  internal = self->_internal;
  if (internal->enabled != enabled)
  {
    internal->enabled = enabled;
    -[AVCaptureConnection bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (void)bumpChangeSeed
{
  -[AVCaptureConnection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("changeSeed"));
  ++self->_internal->changeSeed;
  -[AVCaptureConnection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("changeSeed"));
}

- (int)videoRetainedBufferCountHint
{
  void *v4;

  if (-[AVCaptureConnection isVideoRetainedBufferCountHintSupported](self, "isVideoRetainedBufferCountHintSupported"))
    return self->_internal->videoRetainedBufferCountHint;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v4);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  return 0;
}

- (void)setVideoRetainedBufferCountHint:(int)a3
{
  AVCaptureConnectionInternal *internal;
  void *v6;

  if (-[AVCaptureConnection isVideoRetainedBufferCountHintSupported](self, "isVideoRetainedBufferCountHintSupported"))
  {
    internal = self->_internal;
    if (internal->videoRetainedBufferCountHint != a3)
    {
      internal->videoRetainedBufferCountHint = a3;
      if (-[AVCaptureConnection isLive](self, "isLive"))
        -[AVCaptureOutput bumpChangeSeed](-[AVCaptureConnection output](self, "output"), "bumpChangeSeed");
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

- (BOOL)isVideoRetainedBufferCountHintSupported
{
  char isKindOfClass;

  -[AVCaptureConnection output](self, "output");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (void)setVideoMirrored:(BOOL)videoMirrored
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  AVCaptureConnectionInternal *internal;
  AVCaptureOutput *v9;
  _QWORD v10[5];
  BOOL v11;

  v3 = videoMirrored;
  if (!-[AVCaptureConnection isVideoMirroringSupported](self, "isVideoMirroringSupported"))
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    goto LABEL_5;
  }
  if (-[AVCaptureConnection automaticallyAdjustsVideoMirroring](self, "automaticallyAdjustsVideoMirroring"))
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
LABEL_5:
    v7 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
    return;
  }
  internal = self->_internal;
  if (internal->videoMirrored != v3)
  {
    internal->videoMirrored = v3;
    v9 = -[AVCaptureConnection output](self, "output");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[AVCaptureOutput bumpChangeSeed](v9, "bumpChangeSeed");
    }
    else if (AVMediaTypeMetadataObjectAndAVMediaTypeMetadataAreDefined())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (-[AVCaptureOutput _recordingInProgress](v9, "_recordingInProgress"))
        {
          v10[0] = MEMORY[0x1E0C809B0];
          v10[1] = 3221225472;
          v10[2] = __40__AVCaptureConnection_setVideoMirrored___block_invoke;
          v10[3] = &unk_1E4216820;
          v10[4] = self;
          v11 = v3;
          -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](v9, "performFigCaptureSessionOperationSafelyUsingBlock:", v10);
        }
      }
    }
  }
}

- (BOOL)isVideoMirroringSupported
{
  return self->_internal->videoMirroringSupported;
}

- (BOOL)automaticallyAdjustsVideoMirroring
{
  return self->_internal->automaticallyAdjustsVideoMirroring;
}

- (void)setAutomaticallyAdjustsVideoMirroring:(BOOL)automaticallyAdjustsVideoMirroring
{
  self->_internal->automaticallyAdjustsVideoMirroring = automaticallyAdjustsVideoMirroring;
}

- (void)setVideoOrientation:(AVCaptureVideoOrientation)videoOrientation
{
  int v5;
  double v6;
  void *v7;
  BOOL v8;
  double v9;

  if (-[AVCaptureConnection isVideoOrientationSupported](self, "isVideoOrientationSupported"))
  {
    self->_internal->clientUsesVideoRotationAngleAPI = 0;
    -[AVCaptureConnection sourcesFromFrontFacingCamera](self, "sourcesFromFrontFacingCamera");
    -[AVCaptureConnection sourcesFromExternalCamera](self, "sourcesFromExternalCamera");
    v5 = FigCaptureCameraRequires180DegreesRotation();
    -[AVCaptureConnection sourcesFromExternalCamera](self, "sourcesFromExternalCamera");
    if (AVCapturePlatformMountsCamerasInLandscapeOrientation())
    {
      switch(videoOrientation)
      {
        case AVCaptureVideoOrientationPortrait:
          v6 = 90.0;
          break;
        case AVCaptureVideoOrientationPortraitUpsideDown:
          v6 = 270.0;
          break;
        case AVCaptureVideoOrientationLandscapeRight:
          v6 = 180.0;
          if (!v5)
            v6 = 0.0;
          break;
        case AVCaptureVideoOrientationLandscapeLeft:
          v8 = v5 == 0;
          v6 = 180.0;
          v9 = 0.0;
          goto LABEL_21;
        default:
          v6 = 0.0;
          break;
      }
      goto LABEL_26;
    }
    if (videoOrientation == AVCaptureVideoOrientationLandscapeLeft)
    {
      if (-[AVCaptureConnection sourcesFromFrontFacingCamera](self, "sourcesFromFrontFacingCamera"))
      {
        v8 = !-[AVCaptureConnection sourcesFromExternalCamera](self, "sourcesFromExternalCamera");
        v6 = 270.0;
        v9 = 90.0;
LABEL_21:
        if (!v8)
          v6 = v9;
        goto LABEL_26;
      }
      v6 = 90.0;
    }
    else
    {
      if (videoOrientation != AVCaptureVideoOrientationLandscapeRight)
      {
        v6 = 0.0;
        if (videoOrientation == AVCaptureVideoOrientationPortraitUpsideDown)
          v6 = 180.0;
        goto LABEL_26;
      }
      if (-[AVCaptureConnection sourcesFromFrontFacingCamera](self, "sourcesFromFrontFacingCamera"))
      {
        v8 = !-[AVCaptureConnection sourcesFromExternalCamera](self, "sourcesFromExternalCamera");
        v6 = 90.0;
        v9 = 270.0;
        goto LABEL_21;
      }
      v6 = 270.0;
    }
LABEL_26:
    -[AVCaptureConnection _setVideoRotationAngle:](self, "_setVideoRotationAngle:", v6);
    return;
  }
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v7);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
}

- (BOOL)isVideoOrientationSupported
{
  return self->_internal->videoRotationSupported;
}

- (BOOL)isVideoRotationAngleSupported:(CGFloat)videoRotationAngle
{
  BOOL v4;

  if (videoRotationAngle == 0.0)
    return 1;
  if (!self->_internal->videoRotationSupported)
    return 0;
  v4 = videoRotationAngle == 90.0;
  if (videoRotationAngle == 180.0)
    v4 = 1;
  return videoRotationAngle == 270.0 || v4;
}

- (void)setCameraIntrinsicMatrixDeliveryEnabled:(BOOL)cameraIntrinsicMatrixDeliveryEnabled
{
  _BOOL4 v3;
  AVCaptureConnectionInternal *internal;
  void *v6;

  v3 = cameraIntrinsicMatrixDeliveryEnabled;
  if (cameraIntrinsicMatrixDeliveryEnabled
    && !-[AVCaptureConnection isCameraIntrinsicMatrixDeliverySupported](self, "isCameraIntrinsicMatrixDeliverySupported"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->cameraIntrinsicMatrixDeliveryEnabled != v3)
    {
      internal->cameraIntrinsicMatrixDeliveryEnabled = v3;
      if (-[AVCaptureConnection isLive](self, "isLive"))
        -[AVCaptureConnection bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
}

- (BOOL)isCameraIntrinsicMatrixDeliverySupported
{
  return self->_internal->cameraIntrinsicMatrixDeliverySupported;
}

- (id)sourceDeviceInput
{
  return self->_internal->sourceDeviceInput;
}

- (void)setVideoMirroringMethodForMovieRecording:(int64_t)a3
{
  AVCaptureConnectionInternal *internal;
  void *v6;

  if (-[NSArray containsObject:](self->_internal->supportedVideoMirroringMethodsForMovieRecording, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:")))
  {
    internal = self->_internal;
    if (internal->videoMirroringMethodForMovieRecording != a3)
    {
      internal->videoMirroringMethodForMovieRecording = a3;
      -[AVCaptureConnection bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v9;
  void *v10;
  unint64_t activeVideoStabilizationMode;
  BOOL v12;
  uint64_t v13;
  CMTime v15;
  CMTime time1;
  CMTime v17;
  CMTime v18;

  v9 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8], a4);
  v10 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  if ((void *)AVCaptureConnectionDeviceActiveMinFrameDurationChangedContext == a6)
  {
    memset(&v18, 0, sizeof(v18));
    memset(&v17, 0, sizeof(v17));
    objc_msgSend(v10, "getValue:", &v18);
    objc_msgSend(v9, "getValue:", &v17);
    activeVideoStabilizationMode = self->_internal->activeVideoStabilizationMode;
    v12 = activeVideoStabilizationMode > 5;
    v13 = (1 << activeVideoStabilizationMode) & 0x2C;
    if (!v12 && v13 != 0)
    {
      time1 = v18;
      v15 = v17;
      if (CMTimeCompare(&time1, &v15))
      {
        if (-[AVCaptureDevice isActiveVideoMinFrameDurationSet](self->_internal->sourceDevice, "isActiveVideoMinFrameDurationSet"))
        {
          -[AVCaptureConnection bumpChangeSeed](self, "bumpChangeSeed");
        }
      }
    }
  }
  else if ((void *)AVCaptureConnectionLivePhotoEnabledChangedContext == a6)
  {
    if ((objc_msgSend(v10, "isEqual:", v9) & 1) == 0)
      -[AVCaptureConnection _updateSupportedVideoMirroringMethodsForMovieRecording](self, "_updateSupportedVideoMirroringMethodsForMovieRecording");
  }
  else if ((void *)AVCaptureConnectionDeviceTimeOfFlightProjectorModeChangedContext == a6
         && (objc_msgSend(v10, "isEqual:", v9) & 1) == 0)
  {
    -[AVCaptureConnection bumpChangeSeed](self, "bumpChangeSeed");
  }
}

+ (id)keyPathsForValuesAffectingVideoOrientation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("videoRotationAngle"));
}

+ (id)keyPathsForValuesAffectingVideoRotationAngle
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("videoOrientation"));
}

- (id)description
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  NSString *v13;
  AVCaptureOutput *v14;
  objc_class *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v2 = -[AVCaptureConnection inputPorts](self, "inputPorts");
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (!v5)
          v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
        v9 = (void *)objc_msgSend(v8, "input");
        v10 = (objc_class *)objc_opt_class();
        objc_msgSend(v5, "appendFormat:", CFSTR("(%@: %p"), NSStringFromClass(v10), v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v5, "appendFormat:", CFSTR(" %@"), objc_msgSend((id)objc_msgSend(v9, "device"), "localizedName"));
        objc_msgSend(v5, "appendString:", CFSTR(")"));
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  if (-[AVCaptureConnection output](self, "output"))
  {
    v11 = (void *)MEMORY[0x1E0CB37A0];
    -[AVCaptureConnection output](self, "output");
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v14 = -[AVCaptureConnection output](self, "output");
  }
  else
  {
    if (!-[AVCaptureConnection videoPreviewLayer](self, "videoPreviewLayer"))
    {
      v16 = 0;
      goto LABEL_19;
    }
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[AVCaptureConnection videoPreviewLayer](self, "videoPreviewLayer");
    v15 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v15);
    v14 = -[AVCaptureConnection videoPreviewLayer](self, "videoPreviewLayer");
  }
  v16 = objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: %p"), v13, v14);
LABEL_19:
  v17 = (void *)MEMORY[0x1E0CB3940];
  v18 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@: %p %@ -> (%@) [type:%@][enabled:%u][active:%u]>"), NSStringFromClass(v18), self, v5, v16, -[AVCaptureConnection mediaType](self, "mediaType"), -[AVCaptureConnection isEnabled](self, "isEnabled"), -[AVCaptureConnection isActive](self, "isActive"));
}

- (void)teardownObservers
{
  AVCaptureConnectionInternal *internal;
  AVCaptureConnectionInternal *v4;
  AVCaptureOutput *v5;
  uint64_t v6;
  const __CFString *v7;
  void *sourceDevice;

  internal = self->_internal;
  if (internal->hasActiveObservers)
  {
    internal->hasActiveObservers = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
    v4 = self->_internal;
    if (v4->videoInputPort && v4->sourceDevice)
    {
      if (v4->hasVideoMinFrameDurationObserver)
      {
        v4->hasVideoMinFrameDurationObserver = 0;
        -[AVCaptureDevice removeObserver:forKeyPath:context:](self->_internal->sourceDevice, "removeObserver:forKeyPath:context:", self, CFSTR("activeVideoMinFrameDuration"), AVCaptureConnectionDeviceActiveMinFrameDurationChangedContext);
      }
      v5 = -[AVCaptureConnection output](self, "output");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = AVCaptureConnectionLivePhotoEnabledChangedContext;
        v7 = CFSTR("livePhotoCaptureEnabled");
        sourceDevice = v5;
LABEL_11:
        objc_msgSend(sourceDevice, "removeObserver:forKeyPath:context:", self, v7, v6);
      }
    }
    else if (v4->pointCloudDataInputPort)
    {
      sourceDevice = v4->sourceDevice;
      if (sourceDevice)
      {
        v6 = AVCaptureConnectionDeviceTimeOfFlightProjectorModeChangedContext;
        v7 = CFSTR("timeOfFlightProjectorMode");
        goto LABEL_11;
      }
    }
  }
}

- (NSArray)audioChannels
{
  AVCaptureConnectionInternal *internal;
  NSArray *v4;

  internal = self->_internal;
  objc_sync_enter(internal);
  v4 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_internal->audioChannels);
  objc_sync_exit(internal);
  return v4;
}

- (void)updateAudioLevelsArray
{
  uint64_t UpTimeNanoseconds;
  int64_t v4;
  uint64_t v5;
  AVCaptureOutput *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  if (UpTimeNanoseconds > self->_internal->lastGetAudioLevelsTime + 10000000)
  {
    v4 = UpTimeNanoseconds;
    v8 = 0;
    v9 = &v8;
    v10 = 0x3052000000;
    v11 = __Block_byref_object_copy__2;
    v12 = __Block_byref_object_dispose__2;
    v13 = 0;
    v5 = objc_msgSend(-[NSArray firstObject](-[AVCaptureConnection inputPorts](self, "inputPorts"), "firstObject"), "sourceID");
    v6 = -[AVCaptureConnection output](self, "output");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__AVCaptureConnection_updateAudioLevelsArray__block_invoke;
    v7[3] = &unk_1E42163E0;
    v7[4] = v5;
    v7[5] = &v8;
    -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](v6, "performFigCaptureSessionOperationSafelyUsingBlock:", v7);

    self->_internal->audioChannelLevels = (NSArray *)v9[5];
    self->_internal->lastGetAudioLevelsTime = v4;
    _Block_object_dispose(&v8, 8);
  }
}

_QWORD *__45__AVCaptureConnection_updateAudioLevelsArray__block_invoke(_QWORD *result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t);

  if (a2)
  {
    v3 = result[4];
    v4 = *(_QWORD *)(result[5] + 8);
    result = (_QWORD *)CMBaseObjectGetVTable();
    v5 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t))(result[2] + 16);
    if (v5)
      return (_QWORD *)v5(a2, v3, *MEMORY[0x1E0D04178], *MEMORY[0x1E0C9AE00], v4 + 40);
  }
  return result;
}

- (float)getAvgAudioLevelForChannel:(id)a3
{
  AVCaptureConnectionInternal *internal;
  AVCaptureConnectionInternal *v6;
  unint64_t v7;
  float v8;
  float v9;

  internal = self->_internal;
  objc_sync_enter(internal);
  if (!self->_internal->audioChannels)
    goto LABEL_6;
  -[AVCaptureConnection updateAudioLevelsArray](self, "updateAudioLevelsArray");
  v6 = self->_internal;
  if (!v6->audioChannelLevels)
    goto LABEL_6;
  v7 = -[NSMutableArray indexOfObject:](v6->audioChannels, "indexOfObject:", a3);
  if (v7 >= -[NSMutableArray count](self->_internal->audioChannels, "count"))
  {
    FigDebugAssert3();
LABEL_6:
    v9 = -120.0;
    goto LABEL_7;
  }
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_internal->audioChannelLevels, "objectAtIndexedSubscript:", 2 * v7), "floatValue");
  v9 = v8;
LABEL_7:
  objc_sync_exit(internal);
  return v9;
}

- (float)getPeakAudioLevelForChannel:(id)a3
{
  AVCaptureConnectionInternal *internal;
  AVCaptureConnectionInternal *v6;
  unint64_t v7;
  float v8;
  float v9;

  internal = self->_internal;
  objc_sync_enter(internal);
  if (!self->_internal->audioChannels)
    goto LABEL_6;
  -[AVCaptureConnection updateAudioLevelsArray](self, "updateAudioLevelsArray");
  v6 = self->_internal;
  if (!v6->audioChannelLevels)
    goto LABEL_6;
  v7 = -[NSMutableArray indexOfObject:](v6->audioChannels, "indexOfObject:", a3);
  if (v7 >= -[NSMutableArray count](self->_internal->audioChannels, "count"))
  {
    FigDebugAssert3();
LABEL_6:
    v9 = -120.0;
    goto LABEL_7;
  }
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_internal->audioChannelLevels, "objectAtIndexedSubscript:", (2 * v7) | 1), "floatValue");
  v9 = v8;
LABEL_7:
  objc_sync_exit(internal);
  return v9;
}

uint64_t __40__AVCaptureConnection_setVideoMirrored___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, _QWORD, uint64_t);

  if (a2)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 272);
    v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(result + 40));
    result = CMBaseObjectGetVTable();
    v5 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 16) + 8);
    if (v5)
      return v5(a2, v3, *MEMORY[0x1E0D04578], v4);
  }
  return result;
}

- (void)_setVideoMirrored:(BOOL)a3
{
  -[AVCaptureConnection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoMirrored"));
  self->_internal->videoMirrored = a3;
  -[AVCaptureConnection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("videoMirrored"));
}

- (CGFloat)videoRotationAngle
{
  return self->_internal->videoRotationAngle;
}

- (void)setVideoRotationAngle:(CGFloat)videoRotationAngle
{
  self->_internal->clientUsesVideoRotationAngleAPI = 1;
  -[AVCaptureConnection _setVideoRotationAngle:](self, "_setVideoRotationAngle:", videoRotationAngle);
}

- (void)_setVideoRotationAngle:(double)a3
{
  AVCaptureConnectionInternal *internal;
  int64_t v6;
  AVCaptureOutput *v7;
  void *v8;
  _QWORD v9[6];

  if (-[AVCaptureConnection isVideoRotationAngleSupported:](self, "isVideoRotationAngleSupported:"))
  {
    internal = self->_internal;
    if (internal->videoRotationAngle != a3)
    {
      internal->videoRotationAngle = a3;
      v6 = -[AVCaptureConnection _videoOrientation](self, "_videoOrientation");
      v7 = -[AVCaptureConnection output](self, "output");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        -[AVCaptureOutput updateVideoSettingsForConnection:](v7, "updateVideoSettingsForConnection:", self);
        -[AVCaptureOutput bumpChangeSeed](v7, "bumpChangeSeed");
      }
      else if (AVMediaTypeMetadataObjectAndAVMediaTypeMetadataAreDefined())
      {
        if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && (-[AVCaptureOutput _recordingInProgress](v7, "_recordingInProgress") & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v9[0] = MEMORY[0x1E0C809B0];
          v9[1] = 3221225472;
          v9[2] = __46__AVCaptureConnection__setVideoRotationAngle___block_invoke;
          v9[3] = &unk_1E4216C78;
          v9[4] = self;
          v9[5] = v6;
          -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](v7, "performFigCaptureSessionOperationSafelyUsingBlock:", v9);
        }
      }
    }
  }
  else
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0, *(_QWORD *)&a3);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  }
}

_QWORD *__46__AVCaptureConnection__setVideoRotationAngle___block_invoke(_QWORD *result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, _QWORD, uint64_t);

  if (a2)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 272);
    v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", result[5]);
    result = (_QWORD *)CMBaseObjectGetVTable();
    v5 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(result[2] + 8);
    if (v5)
      return (_QWORD *)v5(a2, v3, *MEMORY[0x1E0D04580], v4);
  }
  return result;
}

- (BOOL)isVideoMinFrameDurationSupported
{
  void *v4;
  uint64_t v5;
  NSString *v6;

  if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureConnectionFrameRatePropertiesAreDeprecated")))
  {
    v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKeyedSubscript:", CFSTR("SKIP_DEPRECATED_LOG"));
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("YES")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("yes")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("1")) & 1) == 0)
    {
      v5 = objc_opt_class();
      v6 = NSStringFromSelector(a2);
      NSLog(CFSTR("WARNING: -[<%@: 0x%x> %@] is deprecated. Please use %@"), v5, self, v6, CFSTR("AVCaptureDevice activeFormat.videoSupportedFrameRateRanges"));
    }
  }
  return self->_internal->videoInputPort != 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_videoMinFrameDuration
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __int128 v7;

  v4 = *(_QWORD *)&self->var1;
  if (*(_QWORD *)(v4 + 88))
  {
    if ((*(_BYTE *)(v4 + 176) & 1) != 0)
    {
      v7 = *(_OWORD *)(v4 + 164);
      retstr->var3 = *(_QWORD *)(v4 + 180);
      *(_OWORD *)&retstr->var0 = v7;
    }
    else
    {
      self = *($3CC8671D27C23BF42ADDB32F2B5E48AE **)(v4 + 24);
      if (self)
      {
        return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE activeVideoMinFrameDuration](self, "activeVideoMinFrameDuration");
      }
      else
      {
        retstr->var0 = 0;
        *(_QWORD *)&retstr->var1 = 0;
        retstr->var3 = 0;
      }
    }
  }
  else
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
    v6 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
    retstr->var3 = *(_QWORD *)(v6 + 16);
  }
  return self;
}

- (CMTime)videoMinFrameDuration
{
  CMTime *result;
  void *v7;
  uint64_t v8;
  NSString *v9;

  result = (CMTime *)AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureConnectionFrameRatePropertiesAreDeprecated"));
  if ((_DWORD)result)
  {
    v7 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKeyedSubscript:", CFSTR("SKIP_DEPRECATED_LOG"));
    result = (CMTime *)objc_msgSend(v7, "isEqualToString:", CFSTR("YES"));
    if ((result & 1) == 0)
    {
      result = (CMTime *)objc_msgSend(v7, "isEqualToString:", CFSTR("yes"));
      if ((result & 1) == 0)
      {
        result = (CMTime *)objc_msgSend(v7, "isEqualToString:", CFSTR("1"));
        if ((result & 1) == 0)
        {
          v8 = objc_opt_class();
          v9 = NSStringFromSelector(a3);
          NSLog(CFSTR("WARNING: -[<%@: 0x%x> %@] is deprecated. Please use %@"), v8, self, v9, CFSTR("AVCaptureDevice activeVideoMinFrameDuration"));
        }
      }
    }
  }
  if (self)
    return (CMTime *)-[AVCaptureConnection _videoMinFrameDuration](self, "_videoMinFrameDuration");
  retstr->value = 0;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (void)_setVideoMinFrameDuration:(id *)a3
{
  AVCaptureConnectionInternal *internal;
  __int128 v6;
  AVCaptureDeviceFormat *v7;
  uint64_t v8;
  void *v9;
  AVCaptureDeviceFormat *v10;
  CMTimeEpoch epoch;
  AVCaptureDeviceFormat *v12;
  AVCaptureDevice *sourceDevice;
  AVCaptureDevice *v14;
  CMTime v15;
  CMTime time2;
  CMTime time1;
  CMTime v18;

  internal = self->_internal;
  if (internal->videoInputPort)
  {
    v6 = *(_OWORD *)&a3->var0;
    *(_QWORD *)&internal->videoMinFrameDuration.flags = a3->var3;
    *(_OWORD *)(&internal->clientUsesVideoRotationAngleAPI + 4) = v6;
    if ((a3->var2 & 1) != 0)
    {
      memset(&v18, 0, sizeof(v18));
      v10 = -[AVCaptureDevice activeFormat](self->_internal->sourceDevice, "activeFormat");
      if (v10)
        -[AVCaptureDeviceFormat lowestSupportedVideoFrameDuration](v10, "lowestSupportedVideoFrameDuration");
      else
        memset(&v18, 0, sizeof(v18));
      time1 = (CMTime)*a3;
      time2 = v18;
      if (CMTimeCompare(&time1, &time2) < 0)
        *(CMTime *)a3 = v18;
      memset(&time1, 0, sizeof(time1));
      v12 = -[AVCaptureDevice activeFormat](self->_internal->sourceDevice, "activeFormat");
      if (v12)
        -[AVCaptureDeviceFormat highestSupportedVideoFrameDuration](v12, "highestSupportedVideoFrameDuration");
      else
        memset(&time1, 0, sizeof(time1));
      time2 = (CMTime)*a3;
      v15 = time1;
      if (CMTimeCompare(&time2, &v15) < 1)
        goto LABEL_20;
      *(_OWORD *)&a3->var0 = *(_OWORD *)&time1.value;
      epoch = time1.epoch;
    }
    else
    {
      v7 = -[AVCaptureDevice activeFormat](self->_internal->sourceDevice, "activeFormat");
      v8 = objc_msgSend(-[AVCaptureOutput session](-[AVCaptureConnection output](self, "output"), "session"), "sessionPreset");
      if (v7)
        -[AVCaptureDeviceFormat defaultActiveMinFrameDurationForSessionPreset:](v7, "defaultActiveMinFrameDurationForSessionPreset:", v8);
      else
        memset(&v18, 0, sizeof(v18));
      *(_OWORD *)&a3->var0 = *(_OWORD *)&v18.value;
      epoch = v18.epoch;
    }
    a3->var3 = epoch;
LABEL_20:
    memset(&v18, 0, sizeof(v18));
    sourceDevice = self->_internal->sourceDevice;
    if (sourceDevice)
      -[AVCaptureDevice activeVideoMinFrameDuration](sourceDevice, "activeVideoMinFrameDuration");
    time1 = v18;
    time2 = (CMTime)*a3;
    if (CMTimeCompare(&time1, &time2))
    {
      v14 = self->_internal->sourceDevice;
      time1 = (CMTime)*a3;
      -[AVCaptureDevice _setActiveVideoMinFrameDuration:](v14, "_setActiveVideoMinFrameDuration:", &time1);
    }
    return;
  }
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v9);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v9);
}

- (void)setVideoMinFrameDuration:(CMTime *)videoMinFrameDuration
{
  void *v6;
  uint64_t v7;
  NSString *v8;
  __int128 v9;
  CMTimeEpoch epoch;

  if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureConnectionFrameRatePropertiesAreDeprecated")))
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKeyedSubscript:", CFSTR("SKIP_DEPRECATED_LOG"));
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("YES")) & 1) == 0
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("yes")) & 1) == 0
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("1")) & 1) == 0)
    {
      v7 = objc_opt_class();
      v8 = NSStringFromSelector(a2);
      NSLog(CFSTR("WARNING: -[<%@: 0x%x> %@] is deprecated. Please use %@"), v7, self, v8, CFSTR("AVCaptureDevice setActiveVideoMinFrameDuration"));
    }
  }
  v9 = *(_OWORD *)&videoMinFrameDuration->value;
  epoch = videoMinFrameDuration->epoch;
  -[AVCaptureConnection _setVideoMinFrameDuration:](self, "_setVideoMinFrameDuration:", &v9);
}

- (BOOL)isVideoMaxFrameDurationSupported
{
  void *v4;
  uint64_t v5;
  NSString *v6;

  if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureConnectionFrameRatePropertiesAreDeprecated")))
  {
    v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKeyedSubscript:", CFSTR("SKIP_DEPRECATED_LOG"));
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("YES")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("yes")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("1")) & 1) == 0)
    {
      v5 = objc_opt_class();
      v6 = NSStringFromSelector(a2);
      NSLog(CFSTR("WARNING: -[<%@: 0x%x> %@] is deprecated. Please use %@"), v5, self, v6, CFSTR("AVCaptureDevice activeFormat.videoSupportedFrameRateRanges"));
    }
  }
  return self->_internal->videoInputPort != 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_videoMaxFrameDuration
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __int128 v7;

  v4 = *(_QWORD *)&self->var1;
  if (*(_QWORD *)(v4 + 88))
  {
    if ((*(_BYTE *)(v4 + 200) & 1) != 0)
    {
      v7 = *(_OWORD *)(v4 + 188);
      retstr->var3 = *(_QWORD *)(v4 + 204);
      *(_OWORD *)&retstr->var0 = v7;
    }
    else
    {
      self = *($3CC8671D27C23BF42ADDB32F2B5E48AE **)(v4 + 24);
      if (self)
      {
        return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE activeVideoMaxFrameDuration](self, "activeVideoMaxFrameDuration");
      }
      else
      {
        retstr->var0 = 0;
        *(_QWORD *)&retstr->var1 = 0;
        retstr->var3 = 0;
      }
    }
  }
  else
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
    v6 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
    retstr->var3 = *(_QWORD *)(v6 + 16);
  }
  return self;
}

- (CMTime)videoMaxFrameDuration
{
  CMTime *result;
  void *v7;
  uint64_t v8;
  NSString *v9;

  result = (CMTime *)AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureConnectionFrameRatePropertiesAreDeprecated"));
  if ((_DWORD)result)
  {
    v7 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKeyedSubscript:", CFSTR("SKIP_DEPRECATED_LOG"));
    result = (CMTime *)objc_msgSend(v7, "isEqualToString:", CFSTR("YES"));
    if ((result & 1) == 0)
    {
      result = (CMTime *)objc_msgSend(v7, "isEqualToString:", CFSTR("yes"));
      if ((result & 1) == 0)
      {
        result = (CMTime *)objc_msgSend(v7, "isEqualToString:", CFSTR("1"));
        if ((result & 1) == 0)
        {
          v8 = objc_opt_class();
          v9 = NSStringFromSelector(a3);
          NSLog(CFSTR("WARNING: -[<%@: 0x%x> %@] is deprecated. Please use %@"), v8, self, v9, CFSTR("AVCaptureDevice activeVideoMaxFrameDuration"));
        }
      }
    }
  }
  if (self)
    return (CMTime *)-[AVCaptureConnection _videoMaxFrameDuration](self, "_videoMaxFrameDuration");
  retstr->value = 0;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (void)setVideoMaxFrameDuration:(CMTime *)videoMaxFrameDuration
{
  void *v6;
  uint64_t v7;
  NSString *v8;
  AVCaptureConnectionInternal *internal;
  __int128 v10;
  AVCaptureDeviceFormat *v11;
  uint64_t v12;
  void *v13;
  AVCaptureDeviceFormat *v14;
  CMTimeEpoch epoch;
  AVCaptureDeviceFormat *v16;
  AVCaptureDevice *sourceDevice;
  AVCaptureDevice *v18;
  CMTime v19;
  CMTime time2;
  CMTime time1;
  CMTime v22;

  if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureConnectionFrameRatePropertiesAreDeprecated")))
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKeyedSubscript:", CFSTR("SKIP_DEPRECATED_LOG"));
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("YES")) & 1) == 0
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("yes")) & 1) == 0
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("1")) & 1) == 0)
    {
      v7 = objc_opt_class();
      v8 = NSStringFromSelector(a2);
      NSLog(CFSTR("WARNING: -[<%@: 0x%x> %@] is deprecated. Please use %@"), v7, self, v8, CFSTR("AVCaptureDevice setActiveVideoMaxFrameDuration"));
    }
  }
  internal = self->_internal;
  if (internal->videoInputPort)
  {
    v10 = *(_OWORD *)&videoMaxFrameDuration->value;
    *(_QWORD *)&internal->videoMaxFrameDuration.flags = videoMaxFrameDuration->epoch;
    *(_OWORD *)((char *)&internal->videoMinFrameDuration.epoch + 4) = v10;
    if ((videoMaxFrameDuration->flags & 1) != 0)
    {
      memset(&v22, 0, sizeof(v22));
      v14 = -[AVCaptureDevice activeFormat](self->_internal->sourceDevice, "activeFormat");
      if (v14)
        -[AVCaptureDeviceFormat highestSupportedVideoFrameDuration](v14, "highestSupportedVideoFrameDuration");
      else
        memset(&v22, 0, sizeof(v22));
      time1 = *videoMaxFrameDuration;
      time2 = v22;
      if (CMTimeCompare(&time1, &time2) >= 1)
        *videoMaxFrameDuration = v22;
      memset(&time1, 0, sizeof(time1));
      v16 = -[AVCaptureDevice activeFormat](self->_internal->sourceDevice, "activeFormat");
      if (v16)
        -[AVCaptureDeviceFormat lowestSupportedVideoFrameDuration](v16, "lowestSupportedVideoFrameDuration");
      else
        memset(&time1, 0, sizeof(time1));
      time2 = *videoMaxFrameDuration;
      v19 = time1;
      if ((CMTimeCompare(&time2, &v19) & 0x80000000) == 0)
        goto LABEL_25;
      *(_OWORD *)&videoMaxFrameDuration->value = *(_OWORD *)&time1.value;
      epoch = time1.epoch;
    }
    else
    {
      v11 = -[AVCaptureDevice activeFormat](self->_internal->sourceDevice, "activeFormat");
      v12 = objc_msgSend(-[AVCaptureOutput session](-[AVCaptureConnection output](self, "output"), "session"), "sessionPreset");
      if (v11)
        -[AVCaptureDeviceFormat defaultActiveMaxFrameDurationForSessionPreset:](v11, "defaultActiveMaxFrameDurationForSessionPreset:", v12);
      else
        memset(&v22, 0, sizeof(v22));
      *(_OWORD *)&videoMaxFrameDuration->value = *(_OWORD *)&v22.value;
      epoch = v22.epoch;
    }
    videoMaxFrameDuration->epoch = epoch;
LABEL_25:
    memset(&v22, 0, sizeof(v22));
    sourceDevice = self->_internal->sourceDevice;
    if (sourceDevice)
      -[AVCaptureDevice activeVideoMaxFrameDuration](sourceDevice, "activeVideoMaxFrameDuration");
    time1 = v22;
    time2 = *videoMaxFrameDuration;
    if (CMTimeCompare(&time1, &time2))
    {
      v18 = self->_internal->sourceDevice;
      time1 = *videoMaxFrameDuration;
      -[AVCaptureDevice _setActiveVideoMaxFrameDuration:](v18, "_setActiveVideoMaxFrameDuration:", &time1);
    }
    return;
  }
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v13);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v13);
}

- (CGFloat)videoMaxScaleAndCropFactor
{
  return self->_internal->videoMaxScaleAndCropFactor;
}

- (void)setVideoScaleAndCropFactor:(CGFloat)videoScaleAndCropFactor
{
  void *v5;
  uint64_t v6;
  CGFloat v7;
  void *v8;

  if (videoScaleAndCropFactor >= 1.0)
  {
    -[AVCaptureConnection videoMaxScaleAndCropFactor](self, "videoMaxScaleAndCropFactor");
    if (v7 >= videoScaleAndCropFactor)
    {
      self->_internal->videoScaleAndCropFactor = videoScaleAndCropFactor;
      return;
    }
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
  }
  v8 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
}

- (BOOL)isVideoStabilizationEnabled
{
  void *v4;
  uint64_t v5;
  NSString *v6;

  if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureConnectionCinematicVISAwareAPIsAreAvailable")))
  {
    v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKeyedSubscript:", CFSTR("SKIP_DEPRECATED_LOG"));
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("YES")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("yes")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("1")) & 1) == 0)
    {
      v5 = objc_opt_class();
      v6 = NSStringFromSelector(a2);
      NSLog(CFSTR("WARNING: -[<%@: 0x%x> %@] is deprecated. Please use %@"), v5, self, v6, CFSTR("-[AVCaptureConnnection activeVideoStabilizationMode]"));
    }
  }
  return self->_internal->videoStabilizationEnabled;
}

- (BOOL)enablesVideoStabilizationWhenAvailable
{
  void *v4;
  uint64_t v5;
  NSString *v6;

  if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureConnectionCinematicVISAwareAPIsAreAvailable")))
  {
    v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKeyedSubscript:", CFSTR("SKIP_DEPRECATED_LOG"));
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("YES")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("yes")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("1")) & 1) == 0)
    {
      v5 = objc_opt_class();
      v6 = NSStringFromSelector(a2);
      NSLog(CFSTR("WARNING: -[<%@: 0x%x> %@] is deprecated. Please use %@"), v5, self, v6, CFSTR("-[AVCaptureConnnection preferredVideoStabilizationMode]"));
    }
  }
  return self->_internal->preferredVideoStabilizationMode == 1;
}

- (void)setEnablesVideoStabilizationWhenAvailable:(BOOL)enablesVideoStabilizationWhenAvailable
{
  unsigned int v3;
  void *v6;
  uint64_t v7;
  NSString *v8;
  AVCaptureConnectionInternal *internal;
  _BOOL4 v10;
  AVCaptureConnectionInternal *v11;
  _BOOL4 v12;
  void *v13;

  v3 = enablesVideoStabilizationWhenAvailable;
  if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureConnectionCinematicVISAwareAPIsAreAvailable")))
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKeyedSubscript:", CFSTR("SKIP_DEPRECATED_LOG"));
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("YES")) & 1) == 0
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("yes")) & 1) == 0
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("1")) & 1) == 0)
    {
      v7 = objc_opt_class();
      v8 = NSStringFromSelector(a2);
      NSLog(CFSTR("WARNING: -[<%@: 0x%x> %@] is deprecated. Please use %@"), v7, self, v8, CFSTR("-[AVCaptureConnnection setPreferredVideoStabilizationMode:]"));
    }
  }
  if (-[AVCaptureConnection isVideoStabilizationSupported](self, "isVideoStabilizationSupported"))
  {
    internal = self->_internal;
    if (internal->preferredVideoStabilizationMode != v3)
    {
      internal->preferredVideoStabilizationMode = v3;
      v10 = -[AVCaptureDeviceFormat isVideoStabilizationModeSupported:](-[AVCaptureDevice activeFormat](self->_internal->sourceDevice, "activeFormat"), "isVideoStabilizationModeSupported:", 1);
      v11 = self->_internal;
      v12 = v10 && v11->preferredVideoStabilizationMode == 1;
      if (v11->videoStabilizationEnabled != v12)
      {
        if (-[AVCaptureConnection isLive](self, "isLive"))
          -[AVCaptureOutput bumpChangeSeed](-[AVCaptureConnection output](self, "output"), "bumpChangeSeed");
        -[AVCaptureConnection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoStabilizationEnabled"));
        self->_internal->videoStabilizationEnabled = v12;
        -[AVCaptureConnection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("videoStabilizationEnabled"));
        -[AVCaptureConnection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activeVideoStabilizationMode"));
        self->_internal->activeVideoStabilizationMode = v3;
        -[AVCaptureConnection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("activeVideoStabilizationMode"));
        -[AVCaptureConnection _updateCameraIntrinsicMatrixDeliverySupported](self, "_updateCameraIntrinsicMatrixDeliverySupported");
      }
    }
  }
  else
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v13);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v13);
  }
}

- (AVCaptureVideoStabilizationMode)preferredVideoStabilizationMode
{
  return self->_internal->preferredVideoStabilizationMode;
}

- (AVCaptureVideoStabilizationMode)activeVideoStabilizationMode
{
  return self->_internal->activeVideoStabilizationMode;
}

- (BOOL)isCameraIntrinsicMatrixDeliveryEnabled
{
  return self->_internal->cameraIntrinsicMatrixDeliveryEnabled;
}

- (BOOL)isLivePhotoMetadataWritingSupported
{
  id v3;
  int v4;

  v3 = -[AVCaptureConnection mediaType](self, "mediaType");
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CF2B90]);
  if (v4)
  {
    -[AVCaptureConnection output](self, "output");
    objc_opt_class();
    LOBYTE(v4) = objc_opt_isKindOfClass();
  }
  return v4 & 1;
}

- (BOOL)livePhotoMetadataWritingEnabled
{
  return self->_internal->livePhotoMetadataWritingEnabled;
}

- (void)setLivePhotoMetadataWritingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  AVCaptureConnectionInternal *internal;
  void *v6;

  v3 = a3;
  if (-[AVCaptureConnection isLivePhotoMetadataWritingSupported](self, "isLivePhotoMetadataWritingSupported"))
  {
    internal = self->_internal;
    if (internal->livePhotoMetadataWritingEnabled != v3)
    {
      internal->livePhotoMetadataWritingEnabled = v3;
      if (-[AVCaptureConnection isLive](self, "isLive"))
        -[AVCaptureOutput bumpChangeSeed](-[AVCaptureConnection output](self, "output"), "bumpChangeSeed");
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

- (BOOL)isDebugMetadataSidecarFileEnabled
{
  return self->_internal->debugMetadataSidecarFileEnabled;
}

- (void)setDebugMetadataSidecarFileEnabled:(BOOL)a3
{
  self->_internal->debugMetadataSidecarFileEnabled = a3;
}

- (int64_t)videoMirroringMethodForMovieRecording
{
  return self->_internal->videoMirroringMethodForMovieRecording;
}

- (BOOL)isVideoZoomSmoothingSupported
{
  return self->_internal->videoZoomSmoothingSupported;
}

- (void)setVideoZoomSmoothingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  AVCaptureConnectionInternal *internal;
  void *v6;

  v3 = a3;
  if (-[AVCaptureConnection isVideoZoomSmoothingSupported](self, "isVideoZoomSmoothingSupported"))
  {
    internal = self->_internal;
    if (internal->videoZoomSmoothingEnabled != v3)
    {
      internal->videoZoomSmoothingEnabled = v3;
      -[AVCaptureConnection bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

- (BOOL)isVideoGreenGhostMitigationSupported
{
  return self->_internal->videoGreenGhostMitigationSupported;
}

- (BOOL)isVideoGreenGhostMitigationEnabled
{
  return self->_internal->videoGreenGhostMitigationEnabled;
}

- (void)setVideoGreenGhostMitigationEnabled:(BOOL)a3
{
  _BOOL4 v3;
  AVCaptureConnectionInternal *internal;
  void *v6;

  v3 = a3;
  if (a3 && !-[AVCaptureConnection isVideoGreenGhostMitigationSupported](self, "isVideoGreenGhostMitigationSupported"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->videoGreenGhostMitigationEnabled != v3)
    {
      internal->videoGreenGhostMitigationEnabled = v3;
      -[AVCaptureConnection bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
}

- (BOOL)isVideoDeviceOrientationCorrectionSupported
{
  return self->_internal->videoDeviceOrientationCorrectionSupported;
}

- (void)setVideoDeviceOrientationCorrectionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  AVCaptureConnectionInternal *internal;
  void *v6;

  v3 = a3;
  if (a3
    && !-[AVCaptureConnection isVideoDeviceOrientationCorrectionSupported](self, "isVideoDeviceOrientationCorrectionSupported"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->videoDeviceOrientationCorrectionEnabled != v3)
    {
      internal->videoDeviceOrientationCorrectionEnabled = v3;
      -[AVCaptureConnection bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
}

- (BOOL)isVideoFieldModeSupported
{
  return self->_supportsVideoFieldMode;
}

- (AVVideoFieldMode)videoFieldMode
{
  return self->_videoFieldMode;
}

- (void)setVideoFieldMode:(AVVideoFieldMode)videoFieldMode
{
  self->_videoFieldMode = videoFieldMode;
}

@end
