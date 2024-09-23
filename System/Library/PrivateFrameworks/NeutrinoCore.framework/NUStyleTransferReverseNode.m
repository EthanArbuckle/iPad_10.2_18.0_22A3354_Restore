@implementation NUStyleTransferReverseNode

- (id)_evaluateImage:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  char v36;
  unint64_t v37;
  unint64_t v38;
  unsigned int *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v48;
  _QWORD v49[2];
  _QWORD v50[3];
  CGRect v51;
  CGRect v52;

  v50[2] = *MEMORY[0x1E0C80C00];
  -[NUStyleTransferReverseNode inputNode](self, "inputNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputImage:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NUStyleTransferReverseNode thumbnailNode](self, "thumbnailNode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "outputImage:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8
      && (-[NUStyleTransferReverseNode deltaNode](self, "deltaNode"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "outputImage:", a3),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          v10))
    {
      objc_msgSend(v10, "extent");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      objc_msgSend(v6, "extent");
      v52.origin.x = v19;
      v52.origin.y = v20;
      v52.size.width = v21;
      v52.size.height = v22;
      v51.origin.x = v12;
      v51.origin.y = v14;
      v51.size.width = v16;
      v51.size.height = v18;
      if (!CGRectEqualToRect(v51, v52))
      {
        objc_msgSend(v10, "imageByClampingToExtent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "extent");
        objc_msgSend(v23, "imageByCroppingToRect:");
        v24 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v24;
      }
      -[NUStyleTransferNode tuningParameters](self, "tuningParameters");
      v48 = objc_claimAutoreleasedReturnValue();
      -[NUStyleTransferReverseNode styleData](self, "styleData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NURenderNode settings](self, "settings");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("useFloat16"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "BOOLValue");

      -[NUStyleTransferNode configuration](self, "configuration");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v29, "mutableCopy");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v28);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKeyedSubscript:", v31, CFSTR("useFloat16"));

      +[_NUStyleEngineConfiguration coefficientTextureSizeForConfigurationDictionary:](_NUStyleEngineConfiguration, "coefficientTextureSizeForConfigurationDictionary:", v30);
      v34 = v32;
      v35 = v33;
      v36 = 1;
      if (!(_DWORD)v28)
        v36 = 2;
      v37 = (unint64_t)v32 << v36;
      v38 = v37 * (unint64_t)v33;
      if (objc_msgSend(v25, "length") == v38)
      {
        v39 = (unsigned int *)MEMORY[0x1E0C9E098];
        if (!(_DWORD)v28)
          v39 = (unsigned int *)MEMORY[0x1E0C9E090];
        objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v25, v37, *v39, 0, v34, v35);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[NUGlobalSettings semanticStyleDisableDeltaMap](NUGlobalSettings, "semanticStyleDisableDeltaMap"))
        {

          v10 = 0;
        }
        v41 = (void *)v48;
        -[NUStyleTransferNode targetColorSpace](self, "targetColorSpace");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        +[_NUStyleTransferApplyProcessor applyStyle:toImage:thumbnail:target:deltaMap:colorSpace:configuration:tuningParameters:noiseModel:error:](_NUStyleTransferApplyProcessor, "applyStyle:toImage:thumbnail:target:deltaMap:colorSpace:configuration:tuningParameters:noiseModel:error:", v40, v6, v8, 0, v10, v42, v30, v48, 0, a3);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v49[0] = CFSTR("expected");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v38);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v49[1] = CFSTR("actual");
        v50[0] = v44;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v25, "length"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v50[1] = v45;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("Unexpected style data length"), v46);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        v43 = 0;
        v41 = (void *)v48;
      }

    }
    else
    {
      v43 = 0;
    }

  }
  else
  {
    v43 = 0;
  }

  return v43;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  NUStyleTransferThumbnailNode *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v43;
  void *v44;
  void *specific;
  NSObject *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  id v66[2];
  uint64_t v67;
  uint64_t v68;
  objc_super v69;
  _BYTE buf[24];
  const __CFString *v71;
  _QWORD v72[3];

  v72[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "evaluationMode"))
  {
    -[NUStyleTransferReverseNode inputNode](self, "inputNode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v9, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (objc_msgSend(v9, "auxiliaryImageType") != 1)
      {
        v13 = v11;
LABEL_48:

        goto LABEL_49;
      }
      if (objc_msgSend(v9, "evaluationMode") == 2)
      {
        v71 = CFSTR("input");
        v72[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, &v71, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NURenderNode resolvedNodeWithCachedInputs:cache:pipelineState:error:](self, "resolvedNodeWithCachedInputs:cache:pipelineState:error:", v12, v8, v9, a5);
        v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_47:

        goto LABEL_48;
      }
      if (objc_msgSend(v9, "evaluationMode") == 1)
      {
        if (v9)
        {
          objc_msgSend(v9, "time");
          v14 = BYTE4(v67);
        }
        else
        {
          v14 = 0;
          v66[1] = 0;
          v67 = 0;
          v68 = 0;
        }
        v15 = v14 & 1;
      }
      else
      {
        v15 = 0;
      }
      if (objc_msgSend(v9, "evaluationMode") != 3 && !v15)
        goto LABEL_23;
      -[NUStyleTransferReverseNode inputNode](self, "inputNode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "videoProperties:", a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v12, "metadataItemForKey:", CFSTR("com.apple.quicktime.smartstyle.bypassed"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "numberValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "BOOLValue");

        if ((v19 & 1) != 0)
        {
          NULogger_24828();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A6553000, v20, OS_LOG_TYPE_INFO, "Bypassing revert for video frame", buf, 2u);
          }

          v13 = v11;
          goto LABEL_46;
        }

LABEL_23:
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("input"));
        v17 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(v17, "setAuxiliaryImageType:", 12);
        objc_msgSend(v17, "setSampleMode:", 2);
        -[NUStyleTransferReverseNode inputNode](self, "inputNode");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v17, a5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          v13 = 0;
LABEL_45:

LABEL_46:
          goto LABEL_47;
        }
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, CFSTR("delta"));
        objc_msgSend(v11, "outputImageGeometry:", a5);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v23)
        {
          v13 = 0;
LABEL_44:

          goto LABEL_45;
        }
        v64 = v12;
        if (objc_msgSend(v9, "evaluationMode") == 3)
        {
          objc_msgSend(v9, "videoMetadataSamples");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", NUSourceIdentifierSmartStyleVideoMetadata);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "metadataGroup");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            v60 = v23;
            v63 = v25;
            objc_msgSend(v25, "metadataGroup");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v66[0] = 0;
            *(_OWORD *)buf = *MEMORY[0x1E0CA2E18];
            *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
            +[NUVideoUtilities semanticStylePropertiesFromMetadataGroup:keyTime:error:](NUVideoUtilities, "semanticStylePropertiesFromMetadataGroup:keyTime:error:", v27, buf, v66);
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = v66[0];

            if (!v28)
            {
              v40 = v29;
              +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to obtain semantic style properties from metadata sample"), v63, v29);
              v13 = 0;
              *a5 = (id)objc_claimAutoreleasedReturnValue();
              v23 = v60;
LABEL_42:
              v25 = v63;
              goto LABEL_43;
            }
            v62 = v29;
            v25 = v63;
LABEL_35:

            v63 = (void *)v28;
            +[NUStyleTransferReverseNode reverseSettingsForSemanticStyleProperties:](NUStyleTransferReverseNode, "reverseSettingsForSemanticStyleProperties:", v28);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v31, "objectForKeyedSubscript:", NUStyleTransferNodeConfigurationKey);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, NUStyleTransferNodeConfigurationKey);

            objc_msgSend(v31, "objectForKeyedSubscript:", NUStyleTransferNodeTuningParametersKey);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setObject:forKeyedSubscript:", v34, NUStyleTransferNodeTuningParametersKey);

            v61 = v31;
            objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("useFloat16"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setObject:forKeyedSubscript:", v35, CFSTR("useFloat16"));

            v59 = v32;
            v36 = -[NUStyleTransferThumbnailNode initWithInput:settings:]([NUStyleTransferThumbnailNode alloc], "initWithInput:settings:", v11, v32);
            -[NURenderNode inputs](v36, "inputs");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[NURenderNode resolvedNodeWithCachedInputs:cache:pipelineState:error:](v36, "resolvedNodeWithCachedInputs:cache:pipelineState:error:", v37, v8, v9, a5);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            if (v38)
            {
              objc_msgSend(v64, "setObject:forKeyedSubscript:", v38, CFSTR("thumbnail"));
              -[NUStyleTransferReverseNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](self, "resolvedNodeWithCachedInputs:settings:pipelineState:error:", v64, v61, v9, a5);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              +[NURenderNode nodeFromCache:cache:](NURenderNode, "nodeFromCache:cache:", v39, v8);
              v13 = (id)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v13, "setEvaluatedForMode:", objc_msgSend(v9, "evaluationMode"));
            }
            else
            {
              v13 = 0;
            }
            v23 = v60;
            v40 = v62;

            goto LABEL_42;
          }
          objc_msgSend(v9, "videoMetadataSamples");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 1, CFSTR("Failed to obtain metadata sample from pipeline state"), v41);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

          v40 = 0;
          v13 = 0;
        }
        else
        {
          if (objc_msgSend(v9, "evaluationMode") != 1)
          {
            NUAssertLogger_24413();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported pipelineState evaluation mode: %@"), v9);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v44;
              _os_log_error_impl(&dword_1A6553000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

            }
            specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            NUAssertLogger_24413();
            v46 = objc_claimAutoreleasedReturnValue();
            v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
            if (specific)
            {
              if (v47)
              {
                v50 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
                v51 = (void *)MEMORY[0x1E0CB3978];
                v52 = v50;
                objc_msgSend(v51, "callStackSymbols");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v50;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v54;
                _os_log_error_impl(&dword_1A6553000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

              }
            }
            else if (v47)
            {
              objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v49;
              _os_log_error_impl(&dword_1A6553000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

            }
            _NUAssertFailHandler((uint64_t)"-[NUStyleTransferReverseNode nodeByReplayingAgainstCache:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 815, CFSTR("Unsupported pipelineState evaluation mode: %@"), v55, v56, v57, v58, (uint64_t)v9);
          }
          v65 = 0;
          objc_msgSend(v11, "imageProperties:", &v65);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v65;
          if (v25)
          {
            objc_msgSend(v25, "semanticStyleProperties");
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (v30)
            {
              v60 = v23;
              objc_msgSend(v25, "semanticStyleProperties");
              v28 = objc_claimAutoreleasedReturnValue();
              goto LABEL_35;
            }
          }
          v40 = v62;
          +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to obtain semantic style properties from image properties"), v25, v62);
          v13 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_43:

        v12 = v64;
        goto LABEL_44;
      }
    }
    v13 = 0;
    goto LABEL_48;
  }
  v69.receiver = self;
  v69.super_class = (Class)NUStyleTransferReverseNode;
  -[NUStyleTransferNode nodeByReplayingAgainstCache:pipelineState:error:](&v69, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, v9, a5);
  v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_49:

  return v13;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUStyleTransferReverseNode;
  -[NUStyleTransferNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v7, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NUStyleTransferReverseNode)initWithInput:(id)a3 settings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NUStyleTransferReverseNode *v11;
  NSObject *v13;
  void *v14;
  void *specific;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  objc_super v29;
  const __CFString *v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    NUAssertLogger_24413();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "input != nil");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v14;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v21 = (void *)MEMORY[0x1E0CB3978];
        v22 = v20;
        objc_msgSend(v21, "callStackSymbols");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v20;
        v34 = 2114;
        v35 = v24;
        _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v19;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferReverseNode initWithInput:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 859, CFSTR("Invalid parameter not satisfying: %s"), v25, v26, v27, v28, (uint64_t)"input != nil");
  }
  v8 = v7;
  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("input"), CFSTR("__dominantInputSettingsKey"));
  v30 = CFSTR("input");
  v31 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29.receiver = self;
  v29.super_class = (Class)NUStyleTransferReverseNode;
  v11 = -[NURenderNode initWithSettings:inputs:](&v29, sel_initWithSettings_inputs_, v9, v10);

  return v11;
}

- (id)styleData
{
  void *v2;
  void *v3;

  -[NURenderNode settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("styleData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)inputNode
{
  return -[NURenderNode inputForKey:](self, "inputForKey:", CFSTR("input"));
}

- (id)deltaNode
{
  return -[NURenderNode inputForKey:](self, "inputForKey:", CFSTR("delta"));
}

- (id)thumbnailNode
{
  return -[NURenderNode inputForKey:](self, "inputForKey:", CFSTR("thumbnail"));
}

- (BOOL)requiresVideoComposition
{
  return 1;
}

- (id)_evaluateVideo:(id *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NUStyleTransferReverseNode;
  -[NURenderNode _evaluateVideo:](&v4, sel__evaluateVideo_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_evaluateVideoComposition:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v35;
  void *v36;
  void *specific;
  NSObject *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_24413();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v36;
      _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v39)
      {
        v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v43 = (void *)MEMORY[0x1E0CB3978];
        v44 = v42;
        objc_msgSend(v43, "callStackSymbols");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v53 = v42;
        v54 = 2114;
        v55 = v46;
        _os_log_error_impl(&dword_1A6553000, v38, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v39)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v41;
      _os_log_error_impl(&dword_1A6553000, v38, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferReverseNode _evaluateVideoComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 904, CFSTR("Invalid parameter not satisfying: %s"), v47, v48, v49, v50, (uint64_t)"error != NULL");
  }
  -[NURenderNode outputVideo:](self, "outputVideo:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NUStyleTransferReverseNode inputNode](self, "inputNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "outputVideoComposition:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "instructions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9 == 1)
      {
        -[NUStyleTransferReverseNode inputNode](self, "inputNode");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "videoProperties:", a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v11, "metadataItemForKey:", CFSTR("com.apple.quicktime.smartstyle.bypassed"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "numberValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "BOOLValue");

          if (v14)
          {
            if (_NULogOnceToken != -1)
              dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
            v15 = _NULogger;
            if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A6553000, v15, OS_LOG_TYPE_INFO, "Bypassing revert for video", buf, 2u);
            }
            v16 = v7;
          }
          else
          {
            objc_msgSend(v7, "instructions");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "firstObject");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            v20 = (void *)objc_msgSend(v19, "copy");
            objc_msgSend(v11, "auxiliaryVideoTrackProperties");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("DeltaImage"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              objc_msgSend(v20, "requiredSourceTrackIDs");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v22, "trackID"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "arrayByAddingObject:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setRequiredSourceTrackIDs:", v25);

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v22, "trackID"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setSourceIdentifier:forTrackID:", CFSTR("DeltaImage"), v26);

              +[NUVideoUtilities metadataTrackWithIdenfifier:forAsset:](NUVideoUtilities, "metadataTrackWithIdenfifier:forAsset:", kMetadataIdentifier_SmartStyleInfo, v5);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v27;
              if (v27)
              {
                v29 = NUSourceIdentifierSmartStyleVideoMetadata;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v27, "trackID"));
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setSourceIdentifier:forMetadataTrackID:", v29, v30);

              }
              v16 = (id)objc_msgSend(v7, "mutableCopy");
              v51 = v20;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setInstructions:", v31);

              objc_msgSend(v20, "requiredSourceSampleDataTrackIDs");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setSourceSampleDataTrackIDs:", v32);

            }
            else
            {
              objc_msgSend(v11, "auxiliaryVideoTrackProperties");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("Missing delta video track properties"), v33);
              *a3 = (id)objc_claimAutoreleasedReturnValue();

              v16 = 0;
            }

          }
        }
        else
        {
          v16 = 0;
        }

        goto LABEL_24;
      }
      objc_msgSend(v7, "instructions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError unsupportedError:object:](NUError, "unsupportedError:object:", CFSTR("Unsupported video configuration"), v17);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    v16 = 0;
LABEL_24:

    goto LABEL_25;
  }
  v16 = 0;
LABEL_25:

  return v16;
}

+ (id)reverseSettingsForSemanticStyleProperties:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v4, "isVideo"))
  {
    objc_msgSend(v4, "version");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "atLeastMajor:minor:", 0, 10))
    {
      objc_msgSend(v4, "styleData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "length");

    }
    objc_msgSend(a1, "_reverseVideoConfiguration_0");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_reverseVideoTuningParameters_0");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_reverseImageConfiguration_0");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_reverseImageTuningParameters_0");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "styleDataIsFloat16"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("useFloat16"));

  objc_msgSend(v4, "styleData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("styleData"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, NUStyleTransferNodeConfigurationKey);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, NUStyleTransferNodeTuningParametersKey);

  return v5;
}

+ (id)_reverseVideoConfiguration_0_1
{
  return &unk_1E50A3638;
}

+ (id)_reverseVideoTuningParameters_0_1
{
  return &unk_1E50A3660;
}

+ (id)_reverseVideoTuningParameters_0_10
{
  return &unk_1E50A3688;
}

+ (id)_reverseVideoConfiguration_0_10
{
  return &unk_1E50A36B0;
}

+ (id)_reverseImageConfiguration_0_1
{
  return &unk_1E50A36D8;
}

+ (id)_reverseImageTuningParameters_0_1
{
  return &unk_1E50A3700;
}

@end
