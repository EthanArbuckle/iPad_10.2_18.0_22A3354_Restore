@implementation VisionCoreFaceprintInferenceNetworkDescriptor(VNPrivateAdditions)

- (id)VNFaceprintFromOutputObjects:()VNPrivateAdditions originatingRequestSpecifier:error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  _QWORD aBlock[5];
  id v18;
  uint64_t *v19;
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  int v27;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "faceprintOutput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(a1, "confidencesOutput");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v27 = 0;
      if ((objc_msgSend(v8, "VNGetConfidenceValue:asTensor:error:", &v27, v11, a5) & 1) != 0)
      {
        v21 = 0;
        v22 = &v21;
        v23 = 0x3032000000;
        v24 = __Block_byref_object_copy__25316;
        v25 = __Block_byref_object_dispose__25317;
        v26 = 0;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __132__VisionCoreFaceprintInferenceNetworkDescriptor_VNPrivateAdditions__VNFaceprintFromOutputObjects_originatingRequestSpecifier_error___block_invoke;
        aBlock[3] = &unk_1E45475E8;
        v19 = &v21;
        aBlock[4] = a1;
        v20 = v27;
        v18 = v9;
        v12 = _Block_copy(aBlock);
        objc_msgSend(v10, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v8, "accessReadOnlyDataForName:usingBlock:error:", v13, v12, a5);

        if ((v14 & 1) != 0)
          v15 = (id)v22[5];
        else
          v15 = 0;

        _Block_object_dispose(&v21, 8);
        goto LABEL_14;
      }
    }
    else if (a5)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("confidences output descriptor is not defined"));
      v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

      goto LABEL_15;
    }
    v15 = 0;
    goto LABEL_14;
  }
  if (a5)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("faceprint output descriptor is not defined"));
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_15:

  return v15;
}

- (VNFaceprint)VNFaceprintFromData:()VNPrivateAdditions confidence:originatingRequestSpecifier:error:
{
  id v10;
  id v11;
  double v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  size_t v17;
  vision::mod::FaceprintAndAttributes *v18;
  float *v19;
  void *v20;
  VNFaceprint *v21;
  double v22;
  VNFaceprint *v23;
  VNFaceprint *v24;
  VNFaceprint *v25;
  void *__p[3];
  id v28;
  void *v29;
  uint64_t v30;

  v10 = a4;
  v11 = a5;
  *(float *)&v12 = a2;
  if (+[VNValidationUtilities validateVNConfidenceRange:error:](VNValidationUtilities, "validateVNConfidenceRange:error:", a6, v12))
  {
    objc_msgSend(a1, "faceprintOutput");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v29 = 0;
      v30 = 0;
      v28 = 0;
      v14 = objc_msgSend(a1, "getVNEspressoModelImageprintData:elementType:elementCount:fromTensorData:descriptor:error:", &v28, &v30, &v29, v10, v13, a6);
      v15 = v28;
      v16 = v15;
      if ((v14 & 1) != 0)
      {
        v17 = objc_msgSend(v15, "length");
        std::vector<unsigned char>::vector(__p, v17);
        v18 = (vision::mod::FaceprintAndAttributes *)objc_msgSend(objc_retainAutorelease(v16), "bytes");
        v20 = (void *)vision::mod::FaceprintAndAttributes::normalizeFacePrintData(v18, (const void *)v29, 1, (float *)__p[0], v19);
        if (v20 == 128)
        {
          v21 = [VNFaceprint alloc];
          *(float *)&v22 = a2;
          v23 = -[VNFaceprint initWithData:elementCount:elementType:lengthInBytes:confidence:originatingRequestSpecifier:](v21, "initWithData:elementCount:elementType:lengthInBytes:confidence:originatingRequestSpecifier:", __p[0], v29, v30, v17, v11, v22);
          v24 = v23;
          if (v23)
          {
            v25 = v23;
          }
          else if (a6)
          {
            +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("unable to create VNFaceprint"));
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }

        }
        else if (a6)
        {
          VNErrorForCVMLStatus(v20);
          v24 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v24 = 0;
        }
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
      else
      {
        v24 = 0;
      }

    }
    else if (a6)
    {
      +[VNError errorForDataUnavailableWithLocalizedDescription:underlyingError:](VNError, "errorForDataUnavailableWithLocalizedDescription:underlyingError:", CFSTR("could not obtain faceprint descriptor"), 0);
      v24 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

@end
