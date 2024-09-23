@implementation VNCoreMLModel

- (NSArray)supportedComputeDevices
{
  void *v2;
  void *v3;
  uint64_t v4;

  -[VNCoreMLModel model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "computeUnits");

  return (NSArray *)+[VNComputeDeviceUtilities computeDevicesOfTypes:](VNComputeDeviceUtilities, "computeDevicesOfTypes:", +[VNComputeDeviceUtilities computeDeviceTypesForMLComputeUnits:](VNComputeDeviceUtilities, "computeDeviceTypesForMLComputeUnits:", v4));
}

- (void)setInputImageFeatureName:(NSString *)inputImageFeatureName
{
  NSString *v4;
  NSString *inputImageKey;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;

  v13 = inputImageFeatureName;
  v4 = (NSString *)-[NSString copy](v13, "copy");
  inputImageKey = self->_inputImageKey;
  self->_inputImageKey = v4;

  -[VNCoreMLModel model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modelDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "inputDescriptionsByName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && objc_msgSend(v9, "type") == 4)
  {
    objc_msgSend(v10, "imageConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      self->_inputImageWidth = objc_msgSend(v11, "pixelsWide");
      self->_inputImageHeight = objc_msgSend(v12, "pixelsHigh");
      self->_inputImageFormat = objc_msgSend(v12, "pixelFormatType");
    }

  }
  else
  {
    self->_inputImageWidth = 0;
    self->_inputImageHeight = 0;
  }

}

- (NSString)inputImageFeatureName
{
  return self->_inputImageKey;
}

- (id)predictWithCVPixelBuffer:(__CVBuffer *)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  VNPixelBufferMLFeatureProvider *v9;
  NSString *inputImageKey;
  void *v11;
  VNPixelBufferMLFeatureProvider *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a4;
  v9 = [VNPixelBufferMLFeatureProvider alloc];
  inputImageKey = self->_inputImageKey;
  -[VNCoreMLModel featureProvider](self, "featureProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[VNPixelBufferMLFeatureProvider initWithPixelBuffer:forKey:originalFeatureProvider:](v9, "initWithPixelBuffer:forKey:originalFeatureProvider:", a3, inputImageKey, v11);

  -[VNCoreMLModel _configuredMLPredictionOptionsForOptions:error:](self, v8, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[VNCoreMLModel model](self, "model");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "predictionFromFeatures:options:error:", v12, v13, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSObject)cachingIdentifier
{
  return self->_uuidStringForCacheIdentifier;
}

- (BOOL)wantsSequencedRequestObservationsRecording
{
  return 0;
}

- (id)sequencedRequestPreviousObservationsKey
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@:UUID=%@"), v5, self->_uuidStringForCacheIdentifier);

  return v6;
}

- (VNOperationPoints)operationPoints
{
  return (VNOperationPoints *)objc_getProperty(self, a2, 16, 1);
}

- (id)featureProvider
{
  return self->_featureProvider;
}

- (void)setFeatureProvider:(id)featureProvider
{
  objc_storeStrong((id *)&self->_featureProvider, featureProvider);
}

- (MLModel)model
{
  return (MLModel *)objc_getProperty(self, a2, 40, 1);
}

- (void)setModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (int)modelType
{
  return self->_modelType;
}

- (void)setModelType:(int)a3
{
  self->_modelType = a3;
}

- (NSString)inputImageKey
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInputImageKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)predictedFeatureKey
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPredictedFeatureKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)predictedProbabilitiesKey
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (MLObjectBoundingBoxOutputDescription)boundingBoxOutputDescription
{
  return (MLObjectBoundingBoxOutputDescription *)objc_getProperty(self, a2, 72, 1);
}

- (unint64_t)inputImageWidth
{
  return self->_inputImageWidth;
}

- (unint64_t)inputImageHeight
{
  return self->_inputImageHeight;
}

- (unsigned)inputImageFormat
{
  return self->_inputImageFormat;
}

- (VNRequestSpecifier)scenePrintRequestSpecifier
{
  return (VNRequestSpecifier *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)inputScenePrintKey
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputScenePrintKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (int64_t)inputScenePrintMLMultiArrayDataType
{
  return self->_inputScenePrintMLMultiArrayDataType;
}

- (VNRequestSpecifier)detectionPrintRequestSpecifier
{
  return (VNRequestSpecifier *)objc_getProperty(self, a2, 120, 1);
}

- (NSDictionary)detectionPrintInputDescriptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionPrintInputDescriptions, 0);
  objc_storeStrong((id *)&self->_detectionPrintRequestSpecifier, 0);
  objc_storeStrong((id *)&self->_inputScenePrintKey, 0);
  objc_storeStrong((id *)&self->_scenePrintRequestSpecifier, 0);
  objc_storeStrong((id *)&self->_boundingBoxOutputDescription, 0);
  objc_storeStrong((id *)&self->_predictedProbabilitiesKey, 0);
  objc_storeStrong((id *)&self->_predictedFeatureKey, 0);
  objc_storeStrong((id *)&self->_inputImageKey, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_featureProvider, 0);
  objc_storeStrong((id *)&self->_operationPoints, 0);
  objc_storeStrong((id *)&self->_uuidStringForCacheIdentifier, 0);
}

- (id)_configuredMLPredictionOptionsForOptions:(_QWORD *)a3 error:
{
  id v5;
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a2;
  if (!a1)
  {
    v12 = 0;
    goto LABEL_12;
  }
  v6 = objc_alloc_init(MEMORY[0x1E0C9E9B0]);
  v7 = CFSTR("VNComputeStageMain");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VNDetectorOption_ComputeStageDeviceAssignments"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("VNComputeStageMain"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "computeDevice");
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
    objc_msgSend(a1, "supportedComputeDevices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "containsObject:", v9) & 1) == 0)
    {
      if (a3)
      {
        +[VNError errorForUnsupportedComputeDevice:](VNError, "errorForUnsupportedComputeDevice:", v9);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

      v12 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v6, "setUsesCPUOnly:", +[VNComputeDeviceUtilities isCPUComputeDevice:](VNComputeDeviceUtilities, "isCPUComputeDevice:", v9));

  }
  v12 = v6;
LABEL_11:

LABEL_12:
  return v12;
}

+ (VNCoreMLModel)modelForMLModel:(MLModel *)model error:(NSError *)error
{
  VNCoreMLModel *v5;
  MLModel *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  void *v55;
  void *v56;
  objc_class *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  __CFString *v67;
  id v68;
  void *v69;
  id obj;
  void *v71;
  void *v72;
  MLModel *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  objc_super v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v73 = model;
  v5 = [VNCoreMLModel alloc];
  v6 = v73;
  if (!v5
    || (v82.receiver = v5,
        v82.super_class = (Class)VNCoreMLModel,
        (v7 = objc_msgSendSuper2(&v82, sel_init)) == 0))
  {
    v28 = 0;
    v29 = v6;
    goto LABEL_66;
  }
  v8 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v8, "UUIDString");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)*((_QWORD *)v7 + 1);
  *((_QWORD *)v7 + 1) = v9;

  -[MLModel modelDescription](v6, "modelDescription");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inputDescriptionsByName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
  if (!v14)
    goto LABEL_11;
  v15 = *(_QWORD *)v84;
  while (2)
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v84 != v15)
        objc_enumerationMutation(v13);
      v17 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
      objc_msgSend(v13, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "type") == 4)
      {
        objc_msgSend(v18, "imageConstraint");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (!v19)
        {

          goto LABEL_20;
        }
        *((_QWORD *)v7 + 10) = objc_msgSend(v19, "pixelsWide");
        *((_QWORD *)v7 + 11) = objc_msgSend(v20, "pixelsHigh");
        *((_DWORD *)v7 + 7) = objc_msgSend(v20, "pixelFormatType");
        v21 = objc_msgSend(v17, "copy");
        v22 = (void *)*((_QWORD *)v7 + 6);
        *((_QWORD *)v7 + 6) = v21;

        +[VNOperationPoints operationPointsForMLModel:error:](VNOperationPoints, "operationPointsForMLModel:error:", v6, error);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)*((_QWORD *)v7 + 2);
        *((_QWORD *)v7 + 2) = v23;

        if (!*((_QWORD *)v7 + 2))
          goto LABEL_22;
        objc_msgSend(v11, "predictedProbabilitiesName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v25;
        if (objc_msgSend(v25, "length"))
          objc_storeStrong((id *)v7 + 8, v25);
        objc_msgSend(v11, "predictedFeatureName");
        obj = (id)objc_claimAutoreleasedReturnValue();
        -[MLModel objectBoundingBoxOutputDescription](v6, "objectBoundingBoxOutputDescription");
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)*((_QWORD *)v7 + 9);
        *((_QWORD *)v7 + 9) = v26;

        if (*((_QWORD *)v7 + 9))
        {
          *((_DWORD *)v7 + 6) = 3;
        }
        else if (obj)
        {
          objc_storeStrong((id *)v7 + 7, obj);
          *((_DWORD *)v7 + 6) = 0;
        }
        else
        {
          objc_msgSend(v11, "outputDescriptionsByName");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *((_DWORD *)v7 + 6) = 1;
          v80 = 0u;
          v81 = 0u;
          v78 = 0u;
          v79 = 0u;
          v31 = v30;
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
          if (v32)
          {
            v33 = *(_QWORD *)v79;
            do
            {
              for (j = 0; j != v32; ++j)
              {
                if (*(_QWORD *)v79 != v33)
                  objc_enumerationMutation(v31);
                objc_msgSend(v31, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * j));
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v35, "type") == 4)
                  *((_DWORD *)v7 + 6) = 2;

              }
              v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
            }
            while (v32);
          }

        }
        -[MLModel visionFeaturePrintInfo](v6, "visionFeaturePrintInfo");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36;
        v29 = v6;
        if (!v36)
          goto LABEL_63;
        v71 = v36;
        objc_msgSend(v36, "postVisionFeaturePrintModel");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v37, "featureExtractorParameters");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v68 = v72;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v68, "requestClassName");
            v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v38 = CFSTR("VNCreateSceneprintRequest");
          }
          v67 = v38;
          +[VNRequestSpecifier specifierForRequestClassName:revision:error:](VNRequestSpecifier, "specifierForRequestClassName:revision:error:", v38, objc_msgSend(v68, "scenePrintVersion"), error);
          v46 = objc_claimAutoreleasedReturnValue();
          v47 = (void *)*((_QWORD *)v7 + 12);
          *((_QWORD *)v7 + 12) = v46;

          v48 = (void *)*((_QWORD *)v7 + 12);
          if (v48 && objc_msgSend(v48, "representsSupportedRequestAndReturnError:", error))
          {
            objc_msgSend(v29, "modelDescription");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "inputDescriptionsByName");
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            v76 = 0u;
            v77 = 0u;
            v74 = 0u;
            v75 = 0u;
            v51 = v50;
            v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v74, &v83, 16);
            if (v52)
            {
              v53 = *(_QWORD *)v75;
              while (2)
              {
                for (k = 0; k != v52; ++k)
                {
                  if (*(_QWORD *)v75 != v53)
                    objc_enumerationMutation(v51);
                  v55 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * k);
                  objc_msgSend(v51, "objectForKeyedSubscript:", v55);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v56, "type") == 5)
                  {
                    objc_storeStrong((id *)v7 + 13, v55);
                    v37 = v71;
                    objc_msgSend(v56, "multiArrayConstraint");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    *((_QWORD *)v7 + 14) = objc_msgSend(v65, "dataType");

                    goto LABEL_61;
                  }

                  v37 = v71;
                }
                v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v74, &v83, 16);
                if (v52)
                  continue;
                break;
              }
            }
LABEL_61:

            *((_DWORD *)v7 + 6) = 4;
            goto LABEL_62;
          }

LABEL_58:
          v28 = 0;
LABEL_64:

          goto LABEL_65;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v68 = v72;
          +[VNRequestSpecifier specifierForRequestClassName:revision:error:](VNRequestSpecifier, "specifierForRequestClassName:revision:error:", CFSTR("VNCreateDetectionprintRequest"), objc_msgSend(v68, "objectPrintVersion"), error);
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = (void *)*((_QWORD *)v7 + 15);
          *((_QWORD *)v7 + 15) = v39;

          v41 = (void *)*((_QWORD *)v7 + 15);
          if (!v41 || !objc_msgSend(v41, "representsSupportedRequestAndReturnError:", error))
            goto LABEL_58;
          objc_msgSend(v29, "modelDescription");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "inputDescriptionsByName");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "copy");
          v45 = (void *)*((_QWORD *)v7 + 16);
          *((_QWORD *)v7 + 16) = v44;

          if (!*((_QWORD *)v7 + 16))
          {
            if (error)
            {
              +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", CFSTR("The FeaturePrint input descriptions ares not available."));
              *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
            }
            goto LABEL_58;
          }
          *((_DWORD *)v7 + 6) = 5;
        }
        else
        {
          v57 = (objc_class *)objc_opt_class();
          NSStringFromClass(v57);
          v68 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v58 = objc_msgSend(v68, "UTF8String");
          VNValidatedLog(2, (uint64_t)CFSTR("CoreML model has a FeaturePrint with an unsupported feature extractor class %s"), v59, v60, v61, v62, v63, v64, v58);
        }
LABEL_62:

LABEL_63:
        objc_storeStrong((id *)v7 + 5, v29);
        v28 = v7;
        goto LABEL_64;
      }

    }
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
    if (v14)
      continue;
    break;
  }
LABEL_11:

LABEL_20:
  if (error)
  {
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 15, CFSTR("The model does not have a valid input feature of type image"));
    v28 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_22:
    v28 = 0;
  }
  v29 = v6;
LABEL_65:

LABEL_66:
  return (VNCoreMLModel *)v28;
}

@end
