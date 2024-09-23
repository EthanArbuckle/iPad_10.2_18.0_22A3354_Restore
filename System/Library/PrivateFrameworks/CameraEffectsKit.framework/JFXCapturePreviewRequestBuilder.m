@implementation JFXCapturePreviewRequestBuilder

- (JFXCapturePreviewRequestBuilder)initWithPreviewProperties:(id)a3 outputColorSpace:(id)a4
{
  id v6;
  id v7;
  char *v8;
  void *v9;
  id v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)JFXCapturePreviewRequestBuilder;
  v8 = -[JFXCapturePreviewRequestBuilder init](&v17, sel_init);
  v9 = (void *)*((_QWORD *)v8 + 3);
  *((_QWORD *)v8 + 3) = v6;
  v10 = v6;

  PVTransformAnimationInfoIdentity();
  *(_OWORD *)(v8 + 40) = v13;
  *(_OWORD *)(v8 + 56) = v14;
  *(_OWORD *)(v8 + 72) = v15;
  *((_QWORD *)v8 + 11) = v16;
  *((_WORD *)v8 + 8) = 0;
  v11 = (void *)*((_QWORD *)v8 + 4);
  *((_QWORD *)v8 + 4) = v7;

  return (JFXCapturePreviewRequestBuilder *)v8;
}

- (id)createPVRenderRequestUsingAnimojiRenderer:(id)a3 metadataValidator:(id)a4 additionalTransform:(CGAffineTransform *)a5 effectStack:(id)a6 animojiTapPoint:(BOOL)a7 animojiUsesInterfaceOrientation:(BOOL)a8 requestHandler:(id *)a9
{
  _BOOL4 v9;
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  JFXCapturePreviewRequestBuilder *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  int v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD *v59;
  _QWORD *v60;
  void *v61;
  void *v62;
  id v63;
  JFXFaceTrackingTransformCalculator *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t i;
  id v70;
  void *v71;
  JFXEffectsPreviewGenerationRequest *v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t k;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  __int128 v95;
  void *v96;
  int v97;
  void *v98;
  JFXEffectsPreviewRequestHandler *v99;
  void *v100;
  id v102;
  uint64_t v103;
  JFXCapturePreviewRequestBuilder *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t j;
  id v108;
  void *v109;
  uint64_t v110;
  NSObject *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  JFXEffectsPreviewGenerationRequest *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  CGAffineTransform *v125;
  void *v126;
  void *v127;
  void *v128;
  JFXCapturePreviewRequestBuilder *v129;
  _OWORD v130[3];
  uint64_t v131;
  _OWORD v132[3];
  uint64_t v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  uint64_t v137;
  _OWORD v138[3];
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _QWORD v143[3];
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  _QWORD v152[2];
  _QWORD v153[2];
  _QWORD v154[2];
  uint8_t buf[32];
  __int128 v156;
  uint64_t v157;
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  _QWORD v161[5];
  _QWORD v162[5];
  _QWORD v163[5];
  _QWORD v164[5];
  _QWORD v165[4];
  _QWORD v166[7];

  v9 = a8;
  v10 = a7;
  v166[4] = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a6;
  -[JFXCapturePreviewRequestBuilder previewProperties](self, "previewProperties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "cameraFrameSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
    goto LABEL_18;
  v125 = a5;
  objc_msgSend(v19, "metadataDict");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", CFSTR("PVFrameSetMetadataOriginalBufferSizeKey"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "CGSizeValue");
  v23 = v22;
  v25 = v24;

  if (v23 == *MEMORY[0x24BDBF148] && v25 == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
LABEL_18:
    v51 = 0;
    goto LABEL_62;
  }
  v122 = v16;
  objc_msgSend(v19, "colorImageBuffer");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "metadataDict");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKey:", CFSTR("PVFrameSetMetadataARMetadataKey"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "faceAnchor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = v28;
  objc_msgSend(v28, "arFrame");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXCapturePreviewRequestBuilder previewProperties](self, "previewProperties");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "renderOutputSize");
  v31 = v30;
  v33 = v32;

  objc_msgSend(v19, "metadataObjectForKey:", *MEMORY[0x24BE79580]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = self;
  v36 = objc_msgSend(v34, "captureVideoOrientation");
  v117 = v34;
  v37 = objc_msgSend(v34, "interfaceOrientation");
  objc_msgSend(v19, "metadataObjectForKey:", CFSTR("PVFrameSetMetadataDeviceOrientationkey"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "integerValue");

  v123 = (void *)objc_opt_new();
  v129 = v35;
  -[JFXCapturePreviewRequestBuilder JFX_getEffectsOfType:ofType:](v35, "JFX_getEffectsOfType:ofType:", v17, 7);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "firstObject");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v118 = v19;
  v116 = v41;
  if (v15 && v41)
  {
    if (v124)
    {
      if (v9)
        v42 = v37;
      else
        v42 = v39;
      v43 = ((unint64_t)(v36 - 5) < 0xFFFFFFFFFFFFFFFELL) ^ ((unint64_t)(v42 - 3) < 2);
      if (v43)
        v44 = v25;
      else
        v44 = v23;
      if (!v43)
        v23 = v25;
      objc_msgSend(v122, "validateFaceTrackedARFrame:");
      v166[0] = v127;
      v165[0] = CFSTR("JFXAnimojiRendererMetadata_JFXARMetadata");
      v165[1] = CFSTR("JFXAnimojiRendererMetadata_RenderSize");
      *(double *)v154 = v23;
      *(double *)&v154[1] = v44;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v154, "{CGSize=dd}");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v166[1] = v45;
      v165[2] = CFSTR("JFXAnimojiRendererMetadata_AVCaptureVideoOrientation");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v36);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v166[2] = v46;
      v165[3] = CFSTR("JFXAnimojiRendererMetadata_UIInterfaceOrientation");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v42);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v166[3] = v47;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v166, v165, 4);
      v48 = v37;
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      v50 = +[JFXCustomRenderProperties newCustomRenderProperties:metadata:](JFXCustomRenderProperties, "newCustomRenderProperties:metadata:", v15, v49);
      objc_msgSend(v50, "setAnimojiTapPoint:", v10);
      objc_msgSend(v123, "setObject:forKeyedSubscript:", v50, CFSTR("JFXCustomRenderingPropertiesKey_Animoji"));
      v129->_logged_render_request_failure_animoji = 0;

      v37 = v48;
    }
    else if (!v129->_logged_render_request_failure_animoji)
    {
      JFXLog_animoji();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        -[JFXCapturePreviewRequestBuilder createPVRenderRequestUsingAnimojiRenderer:metadataValidator:additionalTransform:effectStack:animojiTapPoint:animojiUsesInterfaceOrientation:requestHandler:].cold.1(v41, v52);

      v129->_logged_render_request_failure_animoji = 1;
    }
  }
  -[JFXCapturePreviewRequestBuilder JFX_getEffectsOfType:ofType:](v129, "JFX_getEffectsOfType:ofType:", v17, 2);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = v53;
  v119 = v15;
  v128 = v17;
  if (objc_msgSend(v53, "count"))
  {
    if (!objc_msgSend(v127, "hasTrackedFace"))
    {
      v61 = 0;
LABEL_32:
      v146 = 0u;
      v147 = 0u;
      v144 = 0u;
      v145 = 0u;
      v65 = v53;
      v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v144, v159, 16);
      if (v66)
      {
        v67 = v66;
        v68 = *(_QWORD *)v145;
        do
        {
          for (i = 0; i != v67; ++i)
          {
            if (*(_QWORD *)v145 != v68)
              objc_enumerationMutation(v65);
            v70 = *(id *)(*((_QWORD *)&v144 + 1) + 8 * i);
            if ((objc_msgSend(v70, "isEditingFaceTrackingTransforms") & 1) == 0)
              objc_msgSend(v70, "setFaceTrackingTransform:", v61);

          }
          v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v144, v159, 16);
        }
        while (v67);
      }

      v17 = v128;
      goto LABEL_42;
    }
    if (v124)
    {
      objc_msgSend(v122, "validateFaceTrackedARFrame:", v124);
      v164[0] = v124;
      v163[0] = CFSTR("JFXFaceTrackingRendererMetadata_ARFrame");
      v163[1] = CFSTR("JFXFaceTrackingRendererMetadata_OriginalBufferSize");
      *(double *)v153 = v31;
      *(double *)&v153[1] = v33;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v153, "{CGSize=dd}");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v164[1] = v54;
      v163[2] = CFSTR("JFXFaceTrackingRendererMetadata_AVCaptureVideoOrientation");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v36);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v164[2] = v55;
      v163[3] = CFSTR("JFXFaceTrackingRendererMetadata_UIInterfaceOrientation");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v37);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v164[3] = v56;
      v163[4] = CFSTR("JFXFaceTrackingRendererMetadata_DeviceInterfaceOrientation");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v39);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v164[4] = v57;
      v58 = (void *)MEMORY[0x24BDBCE70];
      v59 = v164;
      v60 = v163;
    }
    else
    {
      if (!v120)
      {
        v150 = 0u;
        v151 = 0u;
        v148 = 0u;
        v149 = 0u;
        v102 = v53;
        v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v148, v160, 16);
        v104 = v129;
        if (v103)
        {
          v105 = v103;
          v106 = *(_QWORD *)v149;
          v114 = 138543618;
          do
          {
            for (j = 0; j != v105; ++j)
            {
              if (*(_QWORD *)v149 != v106)
                objc_enumerationMutation(v102);
              v108 = *(id *)(*((_QWORD *)&v148 + 1) + 8 * j);
              objc_msgSend(v108, "trackingProps");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              v110 = objc_msgSend(v109, "currentTrackingType");

              if ((unint64_t)(v110 - 1) <= 1 && !v104->_logged_render_request_failure_facetracking)
              {
                JFXLog_facetracking();
                v111 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
                {
                  NSStringFromJFXEffectType(objc_msgSend(v108, "type"));
                  v112 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v108, "displayName");
                  v113 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)&buf[4] = v112;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v113;
                  _os_log_error_impl(&dword_2269A9000, v111, OS_LOG_TYPE_ERROR, "Unable to build render request with effect - type: %{public}@, name: %{public}@", buf, 0x16u);

                  v104 = v129;
                }

              }
            }
            v105 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v148, v160, 16);
          }
          while (v105);
        }

        v104->_logged_render_request_failure_facetracking = 1;
        goto LABEL_31;
      }
      v162[0] = v120;
      v161[0] = CFSTR("JFXFaceTrackingRendererMetadata_JFXFaceAnchor");
      v161[1] = CFSTR("JFXFaceTrackingRendererMetadata_OriginalBufferSize");
      *(double *)v152 = v31;
      *(double *)&v152[1] = v33;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v152, "{CGSize=dd}");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v162[1] = v54;
      v161[2] = CFSTR("JFXFaceTrackingRendererMetadata_AVCaptureVideoOrientation");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v36);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v162[2] = v55;
      v161[3] = CFSTR("JFXFaceTrackingRendererMetadata_UIInterfaceOrientation");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v37);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v162[3] = v56;
      v161[4] = CFSTR("JFXFaceTrackingRendererMetadata_DeviceInterfaceOrientation");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v39);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v162[4] = v57;
      v58 = (void *)MEMORY[0x24BDBCE70];
      v59 = v162;
      v60 = v161;
    }
    objc_msgSend(v58, "dictionaryWithObjects:forKeys:count:", v59, v60, 5);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = +[JFXCustomRenderProperties newCustomRenderProperties:metadata:](JFXCustomRenderProperties, "newCustomRenderProperties:metadata:", 0, v62);

    objc_msgSend(v123, "setObject:forKeyedSubscript:", v63, CFSTR("JFXCustomRenderingPropertiesKey_FaceTracking"));
    v129->_logged_render_request_failure_facetracking = 0;

LABEL_31:
    v64 = -[JFXFaceTrackingTransformCalculator initWithARMetaData:outputSize:playableInterfaceOrientation:]([JFXFaceTrackingTransformCalculator alloc], "initWithARMetaData:outputSize:playableInterfaceOrientation:", v127, v39, v31, v33);
    -[JFXFaceTrackingTransformCalculator calculateFaceTrackingTransform](v64, "calculateFaceTrackingTransform");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = v121;
    goto LABEL_32;
  }
LABEL_42:
  -[JFXCapturePreviewRequestBuilder JFX_visibleEffects:](v129, "JFX_visibleEffects:", v17, v114);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = [JFXEffectsPreviewGenerationRequest alloc];
  -[JFXCapturePreviewRequestBuilder previewProperties](v129, "previewProperties");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "renderOutputSize");
  v75 = v74;
  v77 = v76;
  -[JFXCapturePreviewRequestBuilder previewProperties](v129, "previewProperties");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "frameSize");
  v80 = v79;
  v82 = v81;
  -[JFXCapturePreviewRequestBuilder previewProperties](v129, "previewProperties");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v83;
  if (v83)
    objc_msgSend(v83, "renderTime");
  else
    memset(v143, 0, sizeof(v143));
  v115 = -[JFXEffectsPreviewGenerationRequest initWithInput:effectStack:outputSize:frameSize:renderTime:](v72, "initWithInput:effectStack:outputSize:frameSize:renderTime:", v126, v71, v143, v75, v77, v80, v82);

  v141 = 0u;
  v142 = 0u;
  v139 = 0u;
  v140 = 0u;
  v85 = v128;
  v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v139, v158, 16);
  if (v86)
  {
    v87 = v86;
    v88 = *(_QWORD *)v140;
    v89 = *MEMORY[0x24BE79658];
    do
    {
      for (k = 0; k != v87; ++k)
      {
        if (*(_QWORD *)v140 != v88)
          objc_enumerationMutation(v85);
        v91 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * k);
        objc_msgSend(v91, "parameterForKey:", v89, v115);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(v91, "setRenderSize:", v31, v33);
          objc_msgSend(v91, "setPlayableAspectRatio:", aspectRatioForSize(v31, v33));
        }
        if (objc_msgSend(v91, "type") == 1)
        {
          -[JFXCapturePreviewRequestBuilder outputColorSpace](v129, "outputColorSpace");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = objc_msgSend(v93, "isHDRSpace");

          if (v94)
            objc_msgSend(v91, "setHDR:", 1);
        }

      }
      v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v139, v158, 16);
    }
    while (v87);
  }

  -[JFXEffectsPreviewGenerationRequest setCustomRenderingProperties:](v115, "setCustomRenderingProperties:", v123);
  v95 = *(_OWORD *)&v125->c;
  v138[0] = *(_OWORD *)&v125->a;
  v138[1] = v95;
  v138[2] = *(_OWORD *)&v125->tx;
  -[JFXEffectsPreviewGenerationRequest setUserSourceTransform:](v115, "setUserSourceTransform:", v138);
  -[JFXCapturePreviewRequestBuilder requestTransformAnimation](v129, "requestTransformAnimation");
  v132[0] = v134;
  v132[1] = v135;
  v132[2] = v136;
  v133 = v137;
  -[JFXEffectsPreviewGenerationRequest setAnimationTransformInfo:](v115, "setAnimationTransformInfo:", v132);
  -[JFXCapturePreviewRequestBuilder previewProperties](v129, "previewProperties");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(v96, "renderRequiresCrop");

  if (v97)
  {
    -[JFXCapturePreviewRequestBuilder previewProperties](v129, "previewProperties");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "frameSize");

    v157 = 0;
    v156 = 0u;
    memset(buf, 0, sizeof(buf));
    PVTransformAnimationInfoForLiveCapture();
    v130[0] = *(_OWORD *)buf;
    v130[1] = *(_OWORD *)&buf[16];
    v130[2] = v156;
    v131 = v157;
    -[JFXEffectsPreviewGenerationRequest setTransformAnimationInfo:scaleToOutput:](v115, "setTransformAnimationInfo:scaleToOutput:", v130, 0);
  }
  v99 = -[JFXEffectsPreviewRequestHandler initWithRequest:]([JFXEffectsPreviewRequestHandler alloc], "initWithRequest:", v115);
  -[JFXCapturePreviewRequestBuilder outputColorSpace](v129, "outputColorSpace");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXEffectsPreviewRequestHandler buildPVRenderRequestWithOutputColorSpace:](v99, "buildPVRenderRequestWithOutputColorSpace:", v100);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v118;
  objc_msgSend(v51, "setUserContext:", v118);
  v15 = v119;
  v16 = v122;
  v17 = v128;
  if (a9)
    *a9 = objc_retainAutorelease(v99);

LABEL_62:
  return v51;
}

- (id)JFX_getEffectsOfType:(id)a3 ofType:(int)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  int v11;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__JFXCapturePreviewRequestBuilder_JFX_getEffectsOfType_ofType___block_invoke;
  v9[3] = &unk_24EE58B38;
  v11 = a4;
  v7 = v6;
  v10 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  return v7;
}

void __63__JFXCapturePreviewRequestBuilder_JFX_getEffectsOfType_ofType___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "type") == *(_DWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)JFX_visibleEffects:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = a3;
  objc_msgSend(v3, "predicateWithBlock:", &__block_literal_global_15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __54__JFXCapturePreviewRequestBuilder_JFX_visibleEffects___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHidden") ^ 1;
}

- (JFXCapturePreviewProperties)previewProperties
{
  return self->_previewProperties;
}

- (PVTransformAnimationInfo)requestTransformAnimation
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].time.value;
  *(_OWORD *)&retstr->time.value = *(_OWORD *)&self->scale;
  *(_OWORD *)&retstr->time.epoch = v3;
  *(_OWORD *)&retstr->translation.y = *(_OWORD *)&self[1].time.epoch;
  retstr->rotation = self[1].translation.y;
  return self;
}

- (void)setRequestTransformAnimation:(PVTransformAnimationInfo *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->time.value;
  v4 = *(_OWORD *)&a3->time.epoch;
  v5 = *(_OWORD *)&a3->translation.y;
  self->_requestTransformAnimation.rotation = a3->rotation;
  *(_OWORD *)&self->_requestTransformAnimation.translation.y = v5;
  *(_OWORD *)&self->_requestTransformAnimation.time.epoch = v4;
  *(_OWORD *)&self->_requestTransformAnimation.time.value = v3;
}

- (PVColorSpace)outputColorSpace
{
  return self->_outputColorSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputColorSpace, 0);
  objc_storeStrong((id *)&self->_previewProperties, 0);
  objc_storeStrong((id *)&self->_selfieBGLoadQ, 0);
}

- (void)createPVRenderRequestUsingAnimojiRenderer:(void *)a1 metadataValidator:(NSObject *)a2 additionalTransform:effectStack:animojiTapPoint:animojiUsesInterfaceOrientation:requestHandler:.cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  NSStringFromJFXEffectType(objc_msgSend(a1, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_2269A9000, a2, OS_LOG_TYPE_ERROR, "Unable to build render request with effect - type: %{public}@, name: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
