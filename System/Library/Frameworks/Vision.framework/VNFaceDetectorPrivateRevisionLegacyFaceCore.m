@implementation VNFaceDetectorPrivateRevisionLegacyFaceCore

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allCPUComputeDevices](VNComputeDeviceUtilities, "allCPUComputeDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4
{
  VNSizeRange *v4;
  VNSupportedImageSize *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = -[VNSizeRange initWithMinimumDimension:maximumDimension:idealDimension:]([VNSizeRange alloc], "initWithMinimumDimension:maximumDimension:idealDimension:", 0, -1, 0);
  v5 = -[VNSupportedImageSize initWithIdealFormat:pixelsWideRange:pixelsHighRange:aspectRatioHandling:idealOrientation:orientationAgnostic:]([VNSupportedImageSize alloc], "initWithIdealFormat:pixelsWideRange:pixelsHighRange:aspectRatioHandling:idealOrientation:orientationAgnostic:", 1111970369, v4, v4, 0, 1, 0);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_convertVNOptionsToFaceCoreSetupOptions:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v21;
  uint64_t v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v21 = 0;
  v22 = 0;
  v6 = +[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:error:", &v22, CFSTR("VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_Type"), v4, &v21);
  v7 = v21;
  v14 = v7;
  if (!v6)
    VNValidatedLog(4, (uint64_t)CFSTR("FaceCore processing type option does not exist. We should never get here: %@"), v8, v9, v10, v11, v12, v13, (uint64_t)v7);
  switch(v22)
  {
    case 0:
      FCRFaceDetectionParameters();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addEntriesFromDictionary:", v15);
      goto LABEL_7;
    case 1:
      FCRFastFaceDetectionParameters();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addEntriesFromDictionary:", v15);
      goto LABEL_7;
    case 2:
      FCRPreciseDetectionParameters();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addEntriesFromDictionary:", v15);
LABEL_7:

      break;
    case 3:
      objc_msgSend(v5, "setValue:forKey:", *MEMORY[0x1E0CEE4D0], *MEMORY[0x1E0CEE4C8]);
      break;
    default:
      VNValidatedLog(4, (uint64_t)CFSTR("Unsupported FaceCore processing type: %lu"), v8, v9, v10, v11, v12, v13, v22);
      break;
  }
  v16 = *MEMORY[0x1E0CEE4D8];
  v23[0] = CFSTR("VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_MinFaceSize");
  v23[1] = CFSTR("VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_NumberOfDetectionAngles");
  v17 = *MEMORY[0x1E0CEE4E0];
  v24[0] = v16;
  v24[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_convertVNOptionsToFaceCoreOptions:optionsMap:", v4, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v19);

  return v5;
}

+ (id)_convertVNOptionsToFaceCoreDetectOptions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CEE438];
  v10[0] = CFSTR("VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_ROIs");
  v10[1] = CFSTR("VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_InitialAngle");
  v6 = *MEMORY[0x1E0CEE448];
  v11[0] = v5;
  v11[1] = v6;
  v10[2] = CFSTR("VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_EnhanceEyesAndMouthLocalization");
  v11[2] = *MEMORY[0x1E0CEE440];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_convertVNOptionsToFaceCoreOptions:optionsMap:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_convertVNOptionsToFaceCoreExtractOptions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CEE458];
  v10[0] = CFSTR("VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_EnhanceEyesAndMouthLocalization");
  v10[1] = CFSTR("VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_ExtractBlink");
  v6 = *MEMORY[0x1E0CEE460];
  v11[0] = v5;
  v11[1] = v6;
  v10[2] = CFSTR("VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_ExtractSmile");
  v11[2] = *MEMORY[0x1E0CEE468];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_convertVNOptionsToFaceCoreOptions:optionsMap:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_convertVNOptionsToFaceCoreOptions:(id)a3 optionsMap:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__VNFaceDetectorPrivateRevisionLegacyFaceCore__convertVNOptionsToFaceCoreOptions_optionsMap___block_invoke;
  v13[3] = &unk_1E4545028;
  v8 = v7;
  v14 = v8;
  v9 = v5;
  v15 = v9;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v13);
  v10 = v15;
  v11 = v8;

  return v11;
}

void __93__VNFaceDetectorPrivateRevisionLegacyFaceCore__convertVNOptionsToFaceCoreOptions_optionsMap___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t i;
  VNFaceLegacyFaceCore *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  VNFaceObservation *v41;
  id v42;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id obj;
  unint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD aBlock[4];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint64_t *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  double v75[4];
  _BYTE v76[128];
  uint64_t v77;
  CGRect v78;
  CGRect v79;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v77 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v49 = v14;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v14, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v48 = v15;
    v51 = objc_msgSend(v15, "width");
    v17 = objc_msgSend(v16, "height");
    v18 = (void *)objc_opt_class();
    objc_msgSend(v18, "_convertVNOptionsToFaceCoreSetupOptions:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_convertVNOptionsToFaceCoreDetectOptions:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v20;
    objc_msgSend(v18, "_convertVNOptionsToFaceCoreExtractOptions:", v14);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v79.origin.x = 0.0;
    v79.origin.y = 0.0;
    v79.size.width = 1.0;
    v79.size.height = 1.0;
    v78.origin.x = x;
    v78.origin.y = y;
    v78.size.width = width;
    v78.size.height = height;
    if (!CGRectEqualToRect(v78, v79))
    {
      v75[0] = x * (double)v51;
      v75[1] = (1.0 - y - height) * (double)v17;
      v75[2] = width * (double)v51;
      v75[3] = height * (double)v17;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v75, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CEE438]);

    }
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEE4F0]), "initWithOptions:", v19);
    if (v22)
    {
      v69 = 0;
      v70 = &v69;
      v71 = 0x3032000000;
      v72 = __Block_byref_object_copy__10822;
      v73 = __Block_byref_object_dispose__10823;
      v74 = 0;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __152__VNFaceDetectorPrivateRevisionLegacyFaceCore_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke;
      aBlock[3] = &unk_1E4545000;
      v63 = x;
      v64 = y;
      v65 = width;
      v66 = height;
      v67 = v51;
      v68 = v17;
      v23 = v22;
      v57 = v48;
      v24 = v14;
      v58 = v24;
      v62 = &v69;
      v44 = v23;
      v59 = v23;
      v60 = v20;
      v61 = v47;
      v45 = _Block_copy(aBlock);
      if ((VNExecuteBlock(v45, (uint64_t)a7) & 1) != 0)
      {
        +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v24, a7);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)v70[5], "count"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          obj = (id)v70[5];
          v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v76, 16);
          if (v27)
          {
            v28 = *(_QWORD *)v53;
            v29 = (double)v51;
            v30 = (double)v17;
            do
            {
              for (i = 0; i != v27; ++i)
              {
                if (*(_QWORD *)v53 != v28)
                  objc_enumerationMutation(obj);
                v32 = -[VNFaceLegacyFaceCore initWithFace:]([VNFaceLegacyFaceCore alloc], "initWithFace:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i));
                -[VNFaceLegacyFaceCore faceBoundingBox](v32, "faceBoundingBox");
                v37 = 0.0;
                v38 = 0.0;
                v39 = 0.0;
                if (v51)
                {
                  v38 = v33 / v29;
                  v39 = v35 / v29;
                }
                v40 = 0.0;
                if (v17)
                {
                  v37 = v34 / v30;
                  v40 = v36 / v30;
                }
                v41 = -[VNDetectedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:]([VNFaceObservation alloc], "initWithOriginatingRequestSpecifier:boundingBox:", v25, v38, v37, v39, v40);
                -[VNFaceObservation setUnalignedBoundingBox:](v41, "setUnalignedBoundingBox:", v38, v37, v39, v40);
                -[VNFaceObservation setLegacyFaceCore:](v41, "setLegacyFaceCore:", v32);
                objc_msgSend(v26, "addObject:", v41);

              }
              v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v76, 16);
            }
            while (v27);
          }

          v42 = &__block_literal_global_86_33184;
          objc_msgSend(v26, "sortWithOptions:usingComparator:", 16, &__block_literal_global_86_33184);

        }
        else
        {
          v26 = 0;
        }

      }
      else
      {
        v26 = 0;
      }

      _Block_object_dispose(&v69, 8);
    }
    else
    {
      if (!a7)
      {
        v26 = 0;
LABEL_28:

        v16 = v48;
        goto LABEL_29;
      }
      v44 = 0;
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Failed to create detector"));
      v26 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22 = v44;
    goto LABEL_28;
  }
  v26 = 0;
LABEL_29:

  return v26;
}

uint64_t __152__VNFaceDetectorPrivateRevisionLegacyFaceCore_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  CGImage *v5;
  CGImageRef v6;
  void *v7;
  unint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[4];
  __CVBuffer *v19[5];
  CGRect v20;
  CGRect v21;

  v19[4] = *(__CVBuffer **)MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*(id *)(a1 + 32), "originalCGImage");
  if (v4)
  {
    v5 = (CGImage *)v4;
    v21.origin.x = 0.0;
    v21.origin.y = 0.0;
    v21.size.width = 1.0;
    v21.size.height = 1.0;
    if (CGRectEqualToRect(*(CGRect *)(a1 + 80), v21))
    {
      v6 = 0;
    }
    else
    {
      v8 = *(_QWORD *)(a1 + 120);
      v9 = (double)*(unint64_t *)(a1 + 112);
      v20.origin.x = *(double *)(a1 + 80) * v9;
      v20.size.width = *(double *)(a1 + 96) * v9;
      v20.origin.y = *(double *)(a1 + 88) * (double)v8;
      v20.size.height = *(double *)(a1 + 104) * (double)v8;
      v6 = CGImageCreateWithImageInRect(v5, v20);
      v5 = v6;
    }
    v18[0] = &off_1E453B2B8;
    v18[1] = v6;
    v18[3] = v18;
    v19[3] = (__CVBuffer *)v19;
    _ZNKSt3__110__function6__funcIZZZ152__VNFaceDetectorPrivateRevisionLegacyFaceCore_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler__EUb_ENK3__0clEP7CGImageEUlvE_NS_9allocatorIS5_EEFvvEE7__cloneEPNS0_6__baseIS8_EE((uint64_t)v18, v19);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEE4F8]), "initWithCGImage:", v5);
    apple::vision::ScopeExit::~ScopeExit((apple::vision::ScopeExit *)v19);
    if (v7)
      goto LABEL_8;
LABEL_14:
    if (a2)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Failed to create internal image"));
      v16 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_16:
    v16 = 0;
    goto LABEL_17;
  }
  v19[0] = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 32), "croppedBufferWithWidth:height:format:cropRect:options:error:", *(double *)(a1 + 80) * (double)*(unint64_t *)(a1 + 112), *(double *)(a1 + 88) * (double)*(unint64_t *)(a1 + 120), *(double *)(a1 + 96) * (double)*(unint64_t *)(a1 + 112), *(double *)(a1 + 104) * (double)*(unint64_t *)(a1 + 120));
  if (v19[0])
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEE4F8]), "initWithCVPixelBuffer:", v19[0]);
  else
    v7 = 0;
  apple::vision::CVPixelBufferWrapper::~CVPixelBufferWrapper(v19);
  if (!v7)
    goto LABEL_14;
LABEL_8:
  objc_msgSend(*(id *)(a1 + 48), "detectFacesInImage:options:error:", v7, *(_QWORD *)(a1 + 56), a2);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    goto LABEL_16;
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    objc_msgSend(*(id *)(a1 + 48), "extractDetailsForFaces:inImage:options:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v7, *(_QWORD *)(a1 + 64), a2);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
      goto LABEL_16;
  }
  v16 = 1;
LABEL_17:

  return v16;
}

@end
