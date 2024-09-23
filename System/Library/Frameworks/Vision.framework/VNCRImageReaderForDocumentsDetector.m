@implementation VNCRImageReaderForDocumentsDetector

+ (id)imageReaderRecognitionOptionsForProcessOptions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___VNCRImageReaderForDocumentsDetector;
  objc_msgSendSuper2(&v10, sel_imageReaderRecognitionOptionsForProcessOptions_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0DBEC08];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DBEC08]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VNCRImageReaderForDocumentsDetectorProcessOption_DetectionOnly"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0DBEBC0]);

  return v5;
}

- (BOOL)warmUpSession:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  objc_super v13;

  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VNCRImageReaderForDocumentsDetector;
  if (-[VNDetector warmUpSession:withOptions:error:](&v13, sel_warmUpSession_withOptions_error_, a3, v8, a5))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DBEC08]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    v11 = objc_msgSend(MEMORY[0x1E0DBECA0], "preheatModelsForOptions:revision:error:", v8, v10, a5);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  unint64_t v22;
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  unint64_t v33;
  void *v35;
  __CVBuffer *v36;
  double v38;
  CGRect v39;
  CGRect v40;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a4;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v16, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[VNCRImageReaderDetector cachedImageReader](self, "cachedImageReader");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("VNCRImageReaderDetectorProcessOption_MinimumTextHeight"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v20;

    v22 = objc_msgSend(v17, "width");
    v23 = objc_msgSend(v17, "height");
    v39.origin.x = x * (double)v22;
    v39.size.width = width * (double)v22;
    v39.origin.y = y * (double)v23;
    v39.size.height = height * (double)v23;
    v40 = CGRectIntegral(v39);
    v24 = v40.origin.x;
    v25 = v40.origin.y;
    v26 = v40.size.width;
    v27 = v40.size.height;
    objc_msgSend(v18, "smallestImageSizeForTextWithRelativeHeight:originalImageSize:", v21, v40.size.width, v40.size.height);
    v29 = v28;
    v31 = v30;
    v38 = 0.0;
    +[VNValidationUtilities getDoubleValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getDoubleValue:forKey:inOptions:withDefaultValue:error:", &v38, CFSTR("VNCRImageReaderForDocumentsDetectorProcessOption_MaximumProcessingDimensionOnTheLongSide"), v16, a8, 0.0);
    if (v38 > 0.0)
    {
      v32 = v29 >= v31 ? v29 : v31;
      if (v32 > v38)
      {
        v29 = v29 * (v38 / v32);
        v31 = v31 * (v38 / v32);
      }
    }
    v33 = ((unint64_t)v31 + 1) & 0xFFFFFFFFFFFFFFFELL;
    if ((((unint64_t)v29 + 1) & 0xFFFFFFFFFFFFFFFELL) >= 3 && v33 > 2)
    {
      v36 = (__CVBuffer *)objc_msgSend(v17, "croppedBufferWithWidth:height:format:cropRect:options:error:", v24, v25, v26, v27);
      *a7 = v36;
      LOBYTE(a8) = v36 != 0;
    }
    else if (a8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The image is too small in at least one dimension %ld x %ld (each dimension has to be more than 2 pixels)"), ((unint64_t)v29 + 1) & 0xFFFFFFFFFFFFFFFELL, v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInvalidImageFailureWithLocalizedDescription:](VNError, "errorForInvalidImageFailureWithLocalizedDescription:", v35);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a8) = 0;
    }

  }
  else
  {
    LOBYTE(a8) = 0;
  }

  return (char)a8;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  char v24;
  id v25;
  NSError *v26;
  id v27;
  VNDocumentObservation *v28;
  VNDocumentObservation *v29;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  VNRequest *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  VNCRImageReaderForDocumentsDetector *v46;
  id v47;
  id v48;
  id v49;
  uint64_t *v50;
  uint64_t *v51;
  const __CVBuffer *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  VNDocumentObservation *v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v38 = a9;
  +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNCRImageReaderForDocumentsDetectorProcessOption_OriginatingRequest"), v13, a8);
  v37 = (VNRequest *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    -[VNDetector requiredCancellerInOptions:error:](self, "requiredCancellerInOptions:error:", v13, a8);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v36)
    {
      v20 = 0;
LABEL_34:

      goto LABEL_35;
    }
    objc_msgSend((id)objc_opt_class(), "imageReaderRecognitionOptionsForProcessOptions:", v13);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v35)
    {
      v20 = 0;
LABEL_33:

      goto LABEL_34;
    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("VNCRImageReaderForDocumentsDetectorProcessOption_CRImageReaderTrackingSession"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNCRImageReaderDetector cachedImageReader](self, "cachedImageReader");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("VNCRImageReaderForDocumentsDetectorProcessOption_TextObservationsToRecognize"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "count"))
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v34, "count"));
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v15 = v34;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v70;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v70 != v17)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * i), "getCROutputRegion");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v19);

          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
        }
        while (v16);
      }

    }
    else
    {
      v14 = 0;
    }
    v63 = 0;
    v64 = &v63;
    v65 = 0x3032000000;
    v66 = __Block_byref_object_copy__4632;
    v67 = __Block_byref_object_dispose__4633;
    v68 = 0;
    v57 = 0;
    v58 = &v57;
    v59 = 0x3032000000;
    v60 = __Block_byref_object_copy__4632;
    v61 = __Block_byref_object_dispose__4633;
    v62 = 0;
    v53 = 0;
    v54 = &v53;
    v55 = 0x2020000000;
    v21 = MEMORY[0x1E0C809B0];
    v56 = 0;
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __137__VNCRImageReaderForDocumentsDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
    v42[3] = &unk_1E4543D10;
    v52 = a4;
    v49 = v38;
    v31 = v14;
    v43 = v31;
    v44 = v33;
    v50 = &v57;
    v51 = &v63;
    v22 = v32;
    v45 = v22;
    v46 = self;
    v47 = v13;
    v48 = v35;
    v39[0] = v21;
    v39[1] = 3221225472;
    v39[2] = __137__VNCRImageReaderForDocumentsDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke_2;
    v39[3] = &unk_1E4543D38;
    v41 = &v53;
    v23 = v44;
    v40 = v23;
    v24 = objc_msgSend(v36, "tryToPerformBlock:usingSignallingBlock:", v42, v39);
    if (*((_BYTE *)v54 + 24)
      || !-[VNCRImageReaderDetector isCRImageReaderViableAfterError:](self, "isCRImageReaderViableAfterError:", v58[5], v31))
    {
      v25 = -[VNCRImageReaderDetector newImageReaderAndReturnError:](self, "newImageReaderAndReturnError:", 0, v31);
      if (v25)
        -[VNCRImageReaderDetector setCachedImageReader:](self, "setCachedImageReader:", v25);

    }
    if ((v24 & 1) != 0)
    {
      v26 = (NSError *)v58[5];
      if (!v26 && v64[5])
      {
        v28 = [VNDocumentObservation alloc];
        v29 = -[VNDocumentObservation initWithTopLevelRegion:requestRevision:](v28, "initWithTopLevelRegion:requestRevision:", v64[5], -[VNRequest revision](v37, "revision"));
        v73 = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_32;
      }
      if (a8)
      {
        _vnErrorForError(v26, v37);
        v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:
        v20 = 0;
        *a8 = v27;
LABEL_32:

        _Block_object_dispose(&v53, 8);
        _Block_object_dispose(&v57, 8);

        _Block_object_dispose(&v63, 8);
        goto LABEL_33;
      }
    }
    else if (a8)
    {
      +[VNError errorForCancellationOfRequest:](VNError, "errorForCancellationOfRequest:", v37);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    v20 = 0;
    goto LABEL_32;
  }
  v20 = 0;
LABEL_35:

  return v20;
}

void __137__VNCRImageReaderForDocumentsDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  size_t Width;
  size_t Height;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id obj;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBECB8]), "initWithCVPixelBuffer:", *(_QWORD *)(a1 + 104));
  v3 = _Block_copy(*(const void **)(a1 + 80));
  if (*(_QWORD *)(a1 + 32))
  {
    Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 104));
    Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 104));
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    obj = *(id *)(v8 + 40);
    objc_msgSend(v6, "recognizeDetectedBlocks:inImage:error:withProgressHandler:", v7, v2, &obj, v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v8 + 40), obj);
    objc_msgSend(MEMORY[0x1E0DBEC80], "documentWithRegions:title:confidence:imageSize:", v9, 0, 2, (double)Width, (double)Height);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  else if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 56), "validatedImageBufferFromOptions:error:", *(_QWORD *)(a1 + 64), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sceneStabilityMetric");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSceneStabilityMetric:", v13);
    v14 = *(_QWORD *)(a1 + 72);
    v15 = *(void **)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 48);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v27 = *(id *)(v17 + 40);
    objc_msgSend(v15, "documentOutputRegionForImage:options:roi:trackingSession:error:withProgressHandler:", v2, v14, v16, &v27, v3, 0.0, 0.0, 1.0, 1.0);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v17 + 40), v27);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
  else
  {
    v21 = *(void **)(a1 + 40);
    v22 = *(_QWORD *)(a1 + 72);
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v26 = *(id *)(v23 + 40);
    objc_msgSend(v21, "documentOutputRegionForImage:options:roi:error:withProgressHandler:", v2, v22, &v26, v3, 0.0, 0.0, 1.0, 1.0);
    v24 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v23 + 40), v26);
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v9 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;
  }

}

uint64_t __137__VNCRImageReaderForDocumentsDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

@end
