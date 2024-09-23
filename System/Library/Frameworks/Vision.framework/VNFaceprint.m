@implementation VNFaceprint

- (VNFaceprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 confidence:(float)a7 requestRevision:(unint64_t)a8
{
  void *v14;
  double v15;
  VNFaceprint *v16;

  objc_msgSend((id)objc_opt_class(), "originatingRequestSpecifierForRequestRevision:error:", a8, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    *(float *)&v15 = a7;
    self = -[VNFaceprint initWithData:elementCount:elementType:lengthInBytes:confidence:originatingRequestSpecifier:](self, "initWithData:elementCount:elementType:lengthInBytes:confidence:originatingRequestSpecifier:", a3, a4, a5, a6, v14, v15);
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (VNFaceprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 confidence:(float)a7 originatingRequestSpecifier:(id)a8
{
  id v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  VNFaceprint *v19;
  double v20;
  BOOL v21;
  id v22;
  id v23;
  VNFaceprint *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v41;
  objc_super v42;
  id v43;

  v14 = a8;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3, a6);
  v43 = 0;
  v16 = objc_msgSend((id)objc_opt_class(), "validateDescriptorData:elementType:elementCount:error:", v15, a5, a4, &v43);
  v17 = v43;
  v18 = v17;
  if ((v16 & 1) == 0)
  {
    objc_msgSend(v17, "localizedDescription");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v25 = objc_msgSend(v23, "UTF8String");
    VNValidatedLog(4, (uint64_t)CFSTR("%s"), v26, v27, v28, v29, v30, v31, v25);
    v24 = 0;
LABEL_8:

    goto LABEL_9;
  }
  v42.receiver = self;
  v42.super_class = (Class)VNFaceprint;
  v19 = -[VNEspressoModelImageprint initWithDescriptorData:elementType:elementCount:originatingRequestSpecifier:](&v42, sel_initWithDescriptorData_elementType_elementCount_originatingRequestSpecifier_, v15, a5, a4, v14);
  if (v19)
  {
    v41 = 0;
    *(float *)&v20 = a7;
    v21 = +[VNValidationUtilities validateVNConfidenceRange:error:](VNValidationUtilities, "validateVNConfidenceRange:error:", &v41, v20);
    v22 = v41;
    v23 = v22;
    if (v21)
    {
      v19->_confidence = a7;
      self = v19;
      v24 = self;
    }
    else
    {
      objc_msgSend(v22, "localizedDescription");
      v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v33 = objc_msgSend(v32, "UTF8String");
      VNValidatedLog(4, (uint64_t)CFSTR("%s"), v34, v35, v36, v37, v38, v39, v33);

      v24 = 0;
      self = v19;
    }
    goto LABEL_8;
  }
  self = 0;
  v24 = 0;
LABEL_9:

  return v24;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNCreateFaceprintRequest");
}

+ (id)currentVersion
{
  return CFSTR("1.0");
}

+ (unint64_t)confidenceTypeForOriginatingRequestSpecifier:(id)a3
{
  return 0;
}

- (BOOL)isEquivalentToVNEntityIdentificationModelPrint:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[VNEspressoModelImageprint hasEquivalentDescriptorToImageprint:](self, "hasEquivalentDescriptorToImageprint:", v4);

  return v5;
}

- (VNFaceprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 requestRevision:(unint64_t)a7
{
  double v7;

  LODWORD(v7) = 1.0;
  return -[VNFaceprint initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:](self, "initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:", a3, a4, a5, a6, a7, v7);
}

- (VNFaceprint)initWithRawData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 confidence:(float)a7 requestRevision:(unint64_t)a8
{
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  float *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  VNFaceprint *v31;
  const __CFString *v32;
  uint64_t v34;
  void *__p[3];

  +[VNRequest allSupportedRevisions](VNCreateFaceprintRequest, "allSupportedRevisions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "containsIndex:", a8) & 1) == 0)
  {
    VNValidatedLog(4, (uint64_t)CFSTR("Faceprint Initialization Failure: Unsupported Faceprint revision"), v16, v17, v18, v19, v20, v21, v34);
LABEL_13:
    v31 = 0;
    goto LABEL_14;
  }
  if (a5 == 1)
  {
    v22 = 4;
  }
  else
  {
    if (a5 != 2)
    {
      v32 = CFSTR("Faceprint Initialization Failure: Unsupported Faceprint element type");
      goto LABEL_12;
    }
    v22 = 8;
  }
  if (v22 * a4 != a6)
  {
    v32 = CFSTR("Faceprint Initialization Failure: Mismatch between Faceprint parameters: element type, element count and length in bytes");
LABEL_12:
    VNValidatedLog(4, (uint64_t)v32, v16, v17, v18, v19, v20, v21, v34);
    goto LABEL_13;
  }
  HIBYTE(v34) = 48;
  std::vector<unsigned char>::vector(__p, a6, (_BYTE *)&v34 + 7);
  if (vision::mod::FaceprintAndAttributes::normalizeFacePrintData((vision::mod::FaceprintAndAttributes *)a3, (const void *)a4, 1, (float *)__p[0], v23) == 128)
  {
    *(float *)&v30 = a7;
    self = -[VNFaceprint initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:](self, "initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:", __p[0], a4, 1, a6, a8, v30);
    v31 = self;
  }
  else
  {
    VNValidatedLog(4, (uint64_t)CFSTR("Faceprint Initialization Failure: Faceprint normalization failed"), v24, v25, v26, v27, v28, v29, v34);
    v31 = 0;
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
LABEL_14:

  return v31;
}

- (VNFaceprint)initWithRawData:(const void *)a3 confidence:(float)a4 requestRevision:(unint64_t)a5
{
  return -[VNFaceprint initWithRawData:elementCount:elementType:lengthInBytes:confidence:requestRevision:](self, "initWithRawData:elementCount:elementType:lengthInBytes:confidence:requestRevision:", a3, 128, 1, 512, a5);
}

- (VNFaceprint)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  id v7;
  void *v8;
  VNFaceprint *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  double v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  VNFaceprint *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  id v42;
  objc_super v43;

  v4 = a3;
  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("VNFaceprint")) & 1) != 0)
  {
    v5 = objc_msgSend(v4, "vn_decodeCodingVersionForKey:", CFSTR("VNFaceprint"));
    v42 = 0;
    v6 = objc_msgSend((id)objc_opt_class(), "isSupportedCodingVersion:error:", v5, &v42);
    v7 = v42;
    v8 = v7;
    if ((v6 & 1) != 0)
    {
      if ((_DWORD)v5)
      {

        v9 = 0;
        goto LABEL_27;
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "isEqualToString:", CFSTR("VNFaceprintGeneratorTypeEspressoCPU")) & 1) != 0)
      {
        v19 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("requestRevision"));
        v20 = v19;
        if (v19 <= 1)
          v21 = 1;
        else
          v21 = v19;
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v20 >= 2)
          v24 = 512;
        else
          v24 = 516;
        if (objc_msgSend(v22, "length") == v24)
        {
          v31 = objc_msgSend(objc_retainAutorelease(v23), "bytes");
          LODWORD(v32) = 1.0;
          v33 = -[VNFaceprint initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:](self, "initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:", v31, v24 >> 2, 1, v24, v21, v32);
          if (v33)
          {
            self = v33;
            v9 = self;
          }
          else
          {
            self = 0;
            VNValidatedLog(4, (uint64_t)CFSTR("Unexpected error while decoding VNFaceprint object state"), v34, v35, v36, v37, v38, v39, v41);
            v9 = 0;
          }
        }
        else
        {
          VNValidatedLog(4, (uint64_t)CFSTR("Unexpected error while decoding VNFaceprint object state"), v25, v26, v27, v28, v29, v30, v41);
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      objc_msgSend(v4, "failWithError:", v7);
      v9 = 0;
    }

    goto LABEL_27;
  }
  v43.receiver = self;
  v43.super_class = (Class)VNFaceprint;
  v9 = -[VNEspressoModelImageprint initWithCoder:](&v43, sel_initWithCoder_, v4);
  if (v9)
  {
    v16 = objc_msgSend(v4, "containsValueForKey:", CFSTR("fp_conf"));
    LODWORD(v17) = 1.0;
    if (v16)
      objc_msgSend(v4, "vn_decodeValidatedConfidenceForKey:", CFSTR("fp_conf"), v17);
    v9->_confidence = *(float *)&v17;
  }
  else
  {
    VNValidatedLog(4, (uint64_t)CFSTR("Unexpected error while decoding VNFaceprint object state"), v10, v11, v12, v13, v14, v15, v41);
  }
LABEL_27:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VNFaceprint;
  -[VNEspressoModelImageprint encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  *(float *)&v5 = self->_confidence;
  objc_msgSend(v4, "vn_encodeValidatedConfidence:forKey:", CFSTR("fp_conf"), v5);

}

- (VNFaceprint)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  id v11;
  VNFaceprint *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _OWORD *v17;
  uint64_t v18;
  double v19;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  double v29;
  VNFaceprint *v30;
  VNFaceprint *v31;
  double v32;
  unint64_t v33;
  float v34;
  VNFaceprint *v35;
  void *v36;
  void *v37;
  void *v38;
  VNFaceprint *v39;
  void *v40;
  VNFaceprint *v41;
  unint64_t v43;
  void *v44;
  objc_super v45;
  objc_super v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE v49[28];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (!v8)
  {
    if (a5)
    {
      +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", CFSTR("Attempt to deserialize nil"));
      v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_19:
    v12 = 0;
    goto LABEL_57;
  }
  v10 = objc_msgSend(v8, "length");
  if (v10 > 0x1B)
  {
    v13 = objc_retainAutorelease(v9);
    v14 = objc_msgSend(v13, "bytes");
    v15 = v14;
    v16 = *a4;
    v17 = (_OWORD *)(v14 + *a4);
    *(_OWORD *)v49 = *v17;
    *(_OWORD *)&v49[12] = *(_OWORD *)((char *)v17 + 12);
    if (*(_DWORD *)v49 == -87098674)
    {
      v18 = *(unsigned int *)&v49[4];
      if ((*(_DWORD *)&v49[4] - 4) < 3)
      {
        v45.receiver = self;
        v45.super_class = (Class)VNFaceprint;
        v31 = -[VNEspressoModelImageprint initWithState:byteOffset:error:](&v45, sel_initWithState_byteOffset_error_, v13, a4, a5);
        if (v31)
        {
          v33 = *a4;
          if (v16 + v10 - *a4 >= 4)
          {
            v34 = *(float *)(v15 + v33);
            *a4 = v33 + 4;
            *(float *)&v32 = v34;
            if (+[VNValidationUtilities validateVNConfidenceRange:error:](VNValidationUtilities, "validateVNConfidenceRange:error:", a5, v32))
            {
              v31->_confidence = v34;
              v35 = v31;
LABEL_39:
              v31 = v35;
              v12 = v35;
LABEL_56:
              self = v31;
              goto LABEL_57;
            }
          }
        }
      }
      else
      {
        if ((*(_DWORD *)&v49[4] - 1) < 2)
        {
          if (*(_DWORD *)&v49[8] != 544 || v10 != 544)
          {
            if (a5)
            {
              +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, CFSTR("Serialized state data length is invalid"));
              v21 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_42;
            }
LABEL_45:
            v12 = 0;
            goto LABEL_46;
          }
          v47 = 0;
          v48 = 0;
          calculateChecksumMD5((char *)(v14 + 28), 0x204uLL, (unsigned __int8 *)&v47);
          if (*(_QWORD *)&v49[12] != v47 || *(_QWORD *)&v49[20] != v48)
          {
            if (a5)
            {
              +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, CFSTR("Serialized state payload data checksum mismatch"));
              v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:
              v12 = 0;
              *a5 = v21;
              goto LABEL_46;
            }
            goto LABEL_45;
          }
          if ((_DWORD)v18 == 2)
          {
            if (*(_DWORD *)(v15 + 540) == 1)
              v43 = 516;
            else
              v43 = 512;
            LODWORD(v19) = 1.0;
            v41 = -[VNFaceprint initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:](self, "initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:", v15 + 28, v43 >> 2, 1, v19);
            if (!v41)
            {
              if (a5)
              {
LABEL_67:
                +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 9, CFSTR("Error deserializing VNFaceprint"));
                v21 = (id)objc_claimAutoreleasedReturnValue();
                self = 0;
                goto LABEL_42;
              }
LABEL_68:
              self = 0;
              goto LABEL_45;
            }
          }
          else
          {
            if ((_DWORD)v18 != 1)
            {
              if (a5)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unsupported serialized state version %u"), v18);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, v44);
                *a5 = (id)objc_claimAutoreleasedReturnValue();

              }
              goto LABEL_45;
            }
            LODWORD(v19) = 1.0;
            v41 = -[VNFaceprint initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:](self, "initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:", v15 + 28, 129, 1, 516, 1, v19);
            if (!v41)
            {
              if (a5)
                goto LABEL_67;
              goto LABEL_68;
            }
          }
          v41->_confidence = 1.0;
          self = v41;
          v12 = self;
          goto LABEL_46;
        }
        if (*(_DWORD *)&v49[4] != 3)
        {
          if (a5)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Serialized state data is an unsupported version (%lu)"), *(unsigned int *)&v49[4]);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, v40);
            *a5 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_45;
        }
        v46.receiver = self;
        v46.super_class = (Class)VNFaceprint;
        v39 = -[VNEspressoModelImageprint initWithState:byteOffset:error:](&v46, sel_initWithState_byteOffset_error_, v13, a4, a5);
        if (v39)
        {
          v39->_confidence = 1.0;
          v35 = v39;
          goto LABEL_39;
        }
        v31 = 0;
      }
      v12 = 0;
      goto LABEL_56;
    }
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v13, a5);
    if (!v22)
    {
      v12 = 0;
LABEL_35:

LABEL_46:
      v31 = self;
      goto LABEL_56;
    }
    v23 = objc_opt_class();
    objc_msgSend(v22, "setClass:forClassName:", v23, CFSTR("CVMLFaceprint"));
    objc_msgSend(v22, "decodeObjectOfClass:forKey:", v23, CFSTR("faceprint"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v24
       || (objc_msgSend(v22, "decodeObjectOfClass:forKey:", v23, CFSTR("facePrint")),
           (v24 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      && (objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v24, "faceprint");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "length");

      objc_msgSend(v24, "faceprint");
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v28 = objc_msgSend(v27, "bytes");
      LODWORD(v29) = 1.0;
      v30 = -[VNFaceprint initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:](self, "initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:", v28, v26 >> 2, 1, v26, 1, v29);

      if (v30)
      {
        self = v30;
        v12 = self;
LABEL_34:

        objc_msgSend(v22, "finishDecoding");
        goto LABEL_35;
      }
      if (a5)
      {
        +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, CFSTR("Error deserializing VNFaceprint"));
        self = 0;
        v12 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
      self = 0;
    }
    else if (a5)
    {
      v36 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v22, "error");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringWithFormat:", CFSTR("Input data is neither VNFaceprint nor CVMLFaceprint. NSKeyedUnarchiver error = %@"), v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, v38);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v12 = 0;
    goto LABEL_34;
  }
  if (!a5)
    goto LABEL_19;
  +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, CFSTR("Input data is not a VNFaceprint"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v12 = 0;
  *a5 = v11;
LABEL_57:

  return v12;
}

- (unint64_t)serializedLength
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNFaceprint;
  return -[VNEspressoModelImageprint serializedLength](&v3, sel_serializedLength) + 4;
}

- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5
{
  id v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VNFaceprint;
  v9 = -[VNEspressoModelImageprint serializeStateIntoData:startingAtByteOffset:error:](&v14, sel_serializeStateIntoData_startingAtByteOffset_error_, v8, a4, a5);
  if (!v9)
  {
LABEL_6:
    v11 = 0;
    goto LABEL_7;
  }
  v10 = objc_msgSend(objc_retainAutorelease(v8), "mutableBytes");
  *(float *)&v9[a4 + v10] = self->_confidence;
  v11 = (unint64_t)(v9 + 4);
  if (v9 + 4 != (char *)-[VNFaceprint serializedLength](self, "serializedLength"))
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected size of serialized state of the object of type %@"), objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v12);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_6;
  }
  calculateChecksumMD5((char *)(v10 + a4 + 28), (unint64_t)(v9 - 24), (unsigned __int8 *)(v10 + a4 + 12));
LABEL_7:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  VNFaceprint *v4;
  float v5;
  float v6;
  float v7;
  BOOL v8;
  objc_super v10;

  v4 = (VNFaceprint *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v10.receiver = self,
          v10.super_class = (Class)VNFaceprint,
          -[VNEspressoModelImageprint isEqual:](&v10, sel_isEqual_, v4)))
    {
      -[VNFaceprint confidence](self, "confidence");
      v6 = v5;
      -[VNFaceprint confidence](v4, "confidence");
      v8 = v6 == v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  id v3;
  float v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNFaceprint;
  v3 = -[VNEspressoModelImageprint hash](&v7, sel_hash);
  -[VNFaceprint confidence](self, "confidence");
  v5 = LODWORD(v4);
  if (v4 == 0.0)
    v5 = 0;
  return v5 ^ __ROR8__(v3, 51);
}

- (NSString)description
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t i;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[VNEspressoModelImageprint descriptorData](self, "descriptorData");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "bytes");

  for (i = 0; i < -[VNEspressoModelImageprint elementCount](self, "elementCount"); ++i)
  {
    if (i == -[VNEspressoModelImageprint elementCount](self, "elementCount") - 1)
      v7 = &stru_1E4549388;
    else
      v7 = CFSTR("\n");
    v8 = v7;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%f%@"), *(float *)(v5 + 4 * i), v8);
    objc_msgSend(v3, "appendString:", v9);

  }
  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  v14.receiver = self;
  v14.super_class = (Class)VNFaceprint;
  -[VNEspressoModelImageprint description](&v14, sel_description);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@; pixels:\n%@"), v11, v3);

  return (NSString *)v12;
}

- (float)confidence
{
  return self->_confidence;
}

+ (unsigned)currentCodingVersion
{
  return 2;
}

+ (id)codingTypesToCodingKeys
{
  if (+[VNFaceprint codingTypesToCodingKeys]::onceToken != -1)
    dispatch_once(&+[VNFaceprint codingTypesToCodingKeys]::onceToken, &__block_literal_global_6586);
  return (id)+[VNFaceprint codingTypesToCodingKeys]::codingTypesToCodingKeys;
}

+ (unint64_t)serializationMagicNumber
{
  return 4207868622;
}

+ (unint64_t)currentSerializationVersion
{
  return 6;
}

+ (BOOL)shouldIgnoreLagecyLabelsAndConfidenceForHeaderSerializationVersion:(unsigned int)a3
{
  return a3 < 5;
}

+ (BOOL)shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:(unsigned int)a3
{
  return a3 < 6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)emptyFaceprintDataForRevision:(unint64_t)a3
{
  if (+[VNFaceprint emptyFaceprintDataForRevision:]::onceToken != -1)
    dispatch_once(&+[VNFaceprint emptyFaceprintDataForRevision:]::onceToken, &__block_literal_global_112);
  return (id)+[VNFaceprint emptyFaceprintDataForRevision:]::emptyFaceprintData;
}

void __45__VNFaceprint_emptyFaceprintDataForRevision___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 512);
  v1 = (void *)+[VNFaceprint emptyFaceprintDataForRevision:]::emptyFaceprintData;
  +[VNFaceprint emptyFaceprintDataForRevision:]::emptyFaceprintData = v0;

}

void __38__VNFaceprint_codingTypesToCodingKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("emp_data");
  v2[1] = CFSTR("emp_elementsCount");
  v3[0] = CFSTR("data");
  v3[1] = CFSTR("fp_ec");
  v2[2] = CFSTR("emp_elementsType");
  v2[3] = CFSTR("emp_length");
  v3[2] = CFSTR("fp_et");
  v3[3] = CFSTR("fp_l");
  v2[4] = CFSTR("emp_labelsAndConfidence");
  v2[5] = CFSTR("VNEspressoModelImageprint");
  v3[4] = CFSTR("fp_lac");
  v3[5] = CFSTR("VNFaceprint");
  v2[6] = CFSTR("emp_algorithmVersionCodingKey");
  v2[7] = CFSTR("emp_algorithmVersion");
  v3[6] = CFSTR("fp_av");
  v3[7] = CFSTR("1.0");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNFaceprint codingTypesToCodingKeys]::codingTypesToCodingKeys;
  +[VNFaceprint codingTypesToCodingKeys]::codingTypesToCodingKeys = v0;

}

@end
