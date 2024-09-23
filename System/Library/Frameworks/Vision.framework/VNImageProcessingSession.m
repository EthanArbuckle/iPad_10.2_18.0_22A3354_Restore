@implementation VNImageProcessingSession

- (VNImageProcessingSession)init
{
  VNImageProcessingSession *v2;
  VNSession *v3;
  VNSession *session;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VNImageProcessingSession;
  v2 = -[VNImageProcessingSession init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VNSession);
    session = v2->_session;
    v2->_session = v3;

  }
  return v2;
}

- (id)sceneprintsFromRequest:(id)a3 performedOnPixelBuffer:(__CVBuffer *)a4 withAugmentations:(id)a5 error:(id *)a6
{
  return -[VNImageProcessingSession _printsProducedByRequest:onPixelBuffer:withAugmentations:error:]((uint64_t)self, a3, a4, a5, a6);
}

- (id)detectionprintsFromRequest:(id)a3 performedOnPixelBuffer:(__CVBuffer *)a4 withAugmentations:(id)a5 error:(id *)a6
{
  return -[VNImageProcessingSession _printsProducedByRequest:onPixelBuffer:withAugmentations:error:]((uint64_t)self, a3, a4, a5, a6);
}

- (BOOL)prepareForPerformingRequests:(id)a3 error:(id *)a4
{
  return -[VNSession prepareForPerformingRequests:error:](self->_session, "prepareForPerformingRequests:error:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

- (id)_printsProducedByRequest:(__CVBuffer *)a3 onPixelBuffer:(void *)a4 withAugmentations:(_QWORD *)a5 error:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  size_t Width;
  size_t Height;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  unint64_t v30;
  VNImageBuffer *v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  __CFString *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  __CFString *v47;
  uint64_t v48;
  VNImageRequestHandler *v49;
  BOOL v50;
  __CFString *v51;
  void *v52;
  id v53;
  uint64_t v55;
  void *context;
  void *contexta;
  id v58;
  void *v59;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  __CFString *v66;
  uint64_t v67;
  __CFString *v68;
  _QWORD v69[2];

  v69[1] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v63 = a1;
  if (!a1)
  {
    v40 = 0;
    goto LABEL_42;
  }
  v9 = a4;
  v58 = v8;
  v10 = v8;
  if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EE6469A0))
  {
    objc_msgSend(v10, "supportedImageSizeSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v10, "VNImageProcessingSessionRegionOfInterest");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      Width = CVPixelBufferGetWidth(a3);
      Height = CVPixelBufferGetHeight(a3);
      objc_msgSend(v12, "pixelsWideRange");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "idealDimension");

      objc_msgSend(v12, "pixelsHighRange");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "idealDimension");

      v27 = objc_msgSend(v12, "idealImageFormat");
      v28 = v9;
      v29 = v28;
      if (!v24 || !v26)
      {
        if (a5)
        {
          +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("scaled dimensions cannot be 0"));
          v59 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v59 = 0;
        }
LABEL_21:

        goto LABEL_22;
      }
      v64 = v28;
      v30 = Width;
      context = (void *)MEMORY[0x1A1B0B060]();
      v68 = CFSTR("VNImageBufferOption_DoNotCacheRepresentations");
      v69[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[VNImageBuffer initWithCVPixelBuffer:orientation:options:session:]([VNImageBuffer alloc], "initWithCVPixelBuffer:orientation:options:session:", a3, 1, v61, *(_QWORD *)(v63 + 8));
      if (v31)
      {
        v32 = objc_msgSend(v64, "count");
        v33 = v14 * (double)v30;
        v34 = v18 * (double)v30;
        v35 = v16 * (double)Height;
        v36 = v20 * (double)Height;
        if (!v32)
        {
          v66 = 0;
          v29 = v64;
          v55 = -[VNImageBuffer croppedBufferWithWidth:height:format:cropRect:options:error:](v31, "croppedBufferWithWidth:height:format:cropRect:options:error:", v24, v26, v27, 0, &v66, v33, v35, v34, v36);
          v37 = v66;
          if (v55)
          {
            v67 = v55;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v59 = 0;
          }
          goto LABEL_17;
        }
        v66 = 0;
        -[VNImageBuffer augmentedCroppedBuffersWithWidth:height:format:cropRect:options:augmentationOptions:error:](v31, "augmentedCroppedBuffersWithWidth:height:format:cropRect:options:augmentationOptions:error:", v24, v26, v27, 0, v64, &v66, v33, v35, v34, v36);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v66;
      }
      else
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("could not create augmentation image buffer"));
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v59 = 0;
      }
      v29 = v64;
LABEL_17:

      objc_autoreleasePoolPop(context);
      if (a5 && v37)
        *a5 = objc_retainAutorelease(v37);

      goto LABEL_21;
    }
  }
  if (a5)
  {
    v38 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v10, "specifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v38, "initWithFormat:", CFSTR("%@ does not provide ideal image parameters"), v39);

    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 19, v12);
    v59 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

    goto LABEL_23;
  }
  v59 = 0;
LABEL_23:

  v40 = v59;
  if (v59)
  {
    v41 = v10;
    v42 = v59;
    contexta = (void *)MEMORY[0x1A1B0B060]();
    v62 = v41;
    v69[0] = v41;
    v65 = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v42, "count");
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v44);
    if (v44)
    {
      v46 = 0;
      v47 = 0;
      v48 = MEMORY[0x1E0C9AA70];
      while (1)
      {
        v49 = -[VNImageRequestHandler initWithCVPixelBuffer:options:session:]([VNImageRequestHandler alloc], "initWithCVPixelBuffer:options:session:", objc_msgSend(v65, "objectAtIndex:", v46), v48, *(_QWORD *)(v63 + 8));
        v68 = v47;
        v50 = -[VNImageRequestHandler performRequests:error:](v49, "performRequests:error:", v43, &v68);
        v51 = v68;

        if (!v50)
        {

          v40 = 0;
          goto LABEL_35;
        }
        v66 = v51;
        objc_msgSend(v62, "VNImageProcessingSessionPrintAndReturnError:", &v66);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v66;

        if (!v52)
          break;
        objc_msgSend(v45, "addObject:", v52);

        if (v44 == ++v46)
          goto LABEL_31;
      }

      v40 = 0;
    }
    else
    {
      v47 = 0;
LABEL_31:
      v40 = v45;
    }
    v51 = v47;
LABEL_35:

    objc_autoreleasePoolPop(contexta);
    if (a5 && v51)
      *a5 = objc_retainAutorelease(v51);

    if (v40)
      v53 = v40;

  }
  v8 = v58;

LABEL_42:
  return v40;
}

@end
