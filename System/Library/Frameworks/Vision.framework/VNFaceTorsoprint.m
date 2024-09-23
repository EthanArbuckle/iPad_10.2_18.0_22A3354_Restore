@implementation VNFaceTorsoprint

- (VNFaceTorsoprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 faceprintConfidence:(float)a7 torsoprintConfidence:(float)a8
{
  void *v15;
  double v16;
  double v17;
  VNFaceTorsoprint *v18;

  objc_msgSend((id)objc_opt_class(), "originatingRequestSpecifierForRequestRevision:error:", 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    *(float *)&v16 = a7;
    *(float *)&v17 = a8;
    self = -[VNFaceTorsoprint initWithData:elementCount:elementType:lengthInBytes:faceprintConfidence:torsoprintConfidence:originatingRequestSpecifier:](self, "initWithData:elementCount:elementType:lengthInBytes:faceprintConfidence:torsoprintConfidence:originatingRequestSpecifier:", a3, a4, a5, a6, v15, v16, v17);
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (VNFaceTorsoprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 faceprintConfidence:(float)a7 torsoprintConfidence:(float)a8 originatingRequestSpecifier:(id)a9
{
  id v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  VNFaceTorsoprint *v21;
  id v22;
  size_t v23;
  int v24;
  VNFaceprint *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  VNFaceTorsoprint *v33;
  VNFaceprint *v34;
  double v35;
  id v36;
  char *v37;
  int v38;
  VNTorsoprint *v39;
  VNTorsoprint *v40;
  double v41;
  unint64_t v43;
  id v44;
  objc_super v45;
  id v46;

  v16 = a9;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3, a6);
  v46 = 0;
  v18 = objc_msgSend((id)objc_opt_class(), "validateDescriptorData:elementType:elementCount:error:", v17, a5, a4, &v46);
  v19 = v46;
  v20 = v19;
  if ((v18 & 1) == 0)
  {
    objc_msgSend(v19, "localizedDescription");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v26 = objc_msgSend(v22, "UTF8String");
    VNValidatedLog(4, (uint64_t)CFSTR("%s"), v27, v28, v29, v30, v31, v32, v26);
    v33 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v45.receiver = self;
  v45.super_class = (Class)VNFaceTorsoprint;
  v21 = -[VNEspressoModelImageprint initWithDescriptorData:elementType:elementCount:originatingRequestSpecifier:](&v45, sel_initWithDescriptorData_elementType_elementCount_originatingRequestSpecifier_, v17, a5, a4, v16);
  self = v21;
  if (v21)
  {
    v44 = v16;
    +[VNFaceprint emptyFaceprintDataForRevision:](VNFaceprint, "emptyFaceprintDataForRevision:", 3737841667);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = a6 >> 1;
    v43 = a6 >> 3;
    v24 = memcmp((const void *)objc_msgSend(v22, "bytes"), a3, a6 >> 1);
    if (v24)
    {
      v25 = 0;
    }
    else
    {
      v34 = [VNFaceprint alloc];
      *(float *)&v35 = a7;
      v25 = -[VNFaceprint initWithData:elementCount:elementType:lengthInBytes:confidence:originatingRequestSpecifier:](v34, "initWithData:elementCount:elementType:lengthInBytes:confidence:originatingRequestSpecifier:", a3, v43, a5, v23, v44, v35);
    }
    objc_storeStrong((id *)&v21->_faceprint, v25);
    if (!v24)

    +[VNTorsoprint emptyTorsoprintDataForRevision:](VNTorsoprint, "emptyTorsoprintDataForRevision:", 1);
    v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v37 = (char *)a3 + v23;
    v38 = memcmp((const void *)objc_msgSend(v36, "bytes"), (char *)a3 + v23, v23);
    if (v38)
    {
      v39 = 0;
    }
    else
    {
      v40 = [VNTorsoprint alloc];
      *(float *)&v41 = a8;
      v39 = -[VNTorsoprint initWithData:elementCount:elementType:lengthInBytes:confidence:originatingRequestSpecifier:](v40, "initWithData:elementCount:elementType:lengthInBytes:confidence:originatingRequestSpecifier:", v37, v43, a5, v23, v44, v41);
    }
    objc_storeStrong((id *)&v21->_torsoprint, v39);
    v16 = v44;
    if (!v38)

    v21->_personId = 0;
    self = v21;

    v33 = self;
    goto LABEL_16;
  }
  v33 = 0;
LABEL_17:

  return v33;
}

- (VNFaceTorsoprint)initWithFaceprint:(id)a3 torsoprint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  VNFaceTorsoprint *v9;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "originatingRequestSpecifierForRequestRevision:error:", 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    self = -[VNFaceTorsoprint initWithFaceprint:torsoPrint:originatingRequestSpecifier:](self, "initWithFaceprint:torsoPrint:originatingRequestSpecifier:", v6, v7, v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (VNFaceTorsoprint)initWithFaceprint:(id)a3 torsoPrint:(id)a4 requestRevision:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  VNFaceTorsoprint *v11;

  v8 = a3;
  v9 = a4;
  objc_msgSend((id)objc_opt_class(), "originatingRequestSpecifierForRequestRevision:error:", a5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    self = -[VNFaceTorsoprint initWithFaceprint:torsoPrint:originatingRequestSpecifier:](self, "initWithFaceprint:torsoPrint:originatingRequestSpecifier:", v8, v9, v10);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (VNFaceTorsoprint)initWithFaceprint:(id)a3 torsoPrint:(id)a4 originatingRequestSpecifier:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  VNFaceTorsoprint *v21;
  VNFaceTorsoprint *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  VNFaceprint *faceprint;
  uint64_t v37;
  VNTorsoprint *torsoprint;
  VNFaceTorsoprint *v39;
  uint64_t v41;
  void *v42;
  objc_super v43;

  v8 = a3;
  v9 = a4;
  v16 = a5;
  if (v8)
  {
    v17 = objc_msgSend(v8, "elementType");
    if (v9)
    {
LABEL_3:
      v18 = objc_msgSend(v9, "elementType");
      goto LABEL_6;
    }
  }
  else
  {
    v17 = 1;
    if (v9)
      goto LABEL_3;
  }
  v18 = 1;
LABEL_6:
  if (v17 == v18)
  {
    +[VNFaceprint emptyFaceprintDataForRevision:](VNFaceprint, "emptyFaceprintDataForRevision:", objc_msgSend(v8, "requestRevision"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v19 = objc_msgSend(v8, "elementCount");
      v20 = objc_msgSend(v8, "lengthInBytes");
    }
    else
    {
      v23 = objc_msgSend(v42, "length");
      v20 = objc_msgSend(v42, "length");
      v19 = v23 >> 2;
    }
    +[VNTorsoprint emptyTorsoprintDataForRevision:](VNTorsoprint, "emptyTorsoprintDataForRevision:", objc_msgSend(v9, "requestRevision"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v9)
    {
      v26 = objc_msgSend(v9, "elementCount");
      v27 = objc_msgSend(v9, "lengthInBytes");
    }
    else
    {
      v28 = objc_msgSend(v24, "length");
      v27 = objc_msgSend(v25, "length");
      v26 = v28 >> 2;
    }
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v27 + v20);
    if (v8)
    {
      objc_msgSend(v8, "descriptorData");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = v42;
    }
    objc_msgSend(v29, "appendData:", v30);
    if (v8)

    if (v9)
    {
      objc_msgSend(v9, "descriptorData");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = v25;
    }
    objc_msgSend(v29, "appendData:", v31);
    v32 = v26 + v19;
    if (v9)
    {

      v33 = v8 == 0;
    }
    else
    {
      v33 = 1;
    }
    if (v33)
      v34 = 1;
    else
      v34 = v17;
    v43.receiver = self;
    v43.super_class = (Class)VNFaceTorsoprint;
    v22 = -[VNEspressoModelImageprint initWithDescriptorData:elementType:elementCount:originatingRequestSpecifier:](&v43, sel_initWithDescriptorData_elementType_elementCount_originatingRequestSpecifier_, v29, v34, v32, v16);
    if (v22)
    {
      v35 = objc_msgSend(v8, "copy");
      faceprint = v22->_faceprint;
      v22->_faceprint = (VNFaceprint *)v35;

      v37 = objc_msgSend(v9, "copy");
      torsoprint = v22->_torsoprint;
      v22->_torsoprint = (VNTorsoprint *)v37;

      v22->_personId = 0;
      v39 = v22;
    }

    v21 = v22;
  }
  else
  {
    VNValidatedLog(4, (uint64_t)CFSTR("faceprint and torsoprint must have the same element types"), v10, v11, v12, v13, v14, v15, v41);
    v21 = 0;
    v22 = self;
  }

  return v21;
}

- (VNFaceTorsoprint)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  VNFaceTorsoprint *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FTp_fp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FTp_tp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "originatingRequestSpecifierForRequestRevision:error:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FTp_rev")), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[VNFaceTorsoprint initWithFaceprint:torsoPrint:originatingRequestSpecifier:](self, "initWithFaceprint:torsoPrint:originatingRequestSpecifier:", v5, v6, v7);
    if (v8)
    {
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("FTp_pid")))
        v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FTp_pid"));
      else
        v9 = 0;
      v8->_personId = v9;
      self = v8;
      v8 = self;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[VNEspressoModelImageprint requestRevision](self, "requestRevision"), CFSTR("FTp_rev"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_faceprint, CFSTR("FTp_fp"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_torsoprint, CFSTR("FTp_tp"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_personId, CFSTR("FTp_pid"));

}

- (id)computeDistance:(id)a3 withDistanceFunction:(unint64_t)a4 error:(id *)a5
{
  id v8;
  int v9;
  int v10;
  _BOOL4 v11;
  int v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  float v23;
  float v24;
  float v25;
  double v26;
  uint64_t v27;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a5)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Wrong type of print object"));
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    goto LABEL_12;
  }
  v9 = -[VNFaceTorsoprint isValidFaceprint](self, "isValidFaceprint");
  v10 = objc_msgSend(v8, "isValidFaceprint");
  v11 = -[VNFaceTorsoprint isValidTorsoprint](self, "isValidTorsoprint");
  v12 = objc_msgSend(v8, "isValidTorsoprint");
  if (v9 == v10 || ((v11 ^ v12) & 1) == 0)
  {
    v14 = v9 & v10;
    v15 = v11 & v12;
    if ((v9 & v10 | v11 & v12) != 1)
    {
      v13 = &unk_1E459E2F8;
      goto LABEL_21;
    }
    if (!v14)
    {
      v18 = 0;
      v13 = 0;
      if (!v15)
        goto LABEL_20;
      goto LABEL_15;
    }
    -[VNFaceTorsoprint faceprint](self, "faceprint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "faceprint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "computeDistance:withDistanceFunction:error:", v17, a4, a5);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      if ((v15 & 1) == 0)
      {
        v18 = v18;
        v13 = v18;
LABEL_20:

        goto LABEL_21;
      }
LABEL_15:
      -[VNFaceTorsoprint torsoprint](self, "torsoprint");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "torsoprint");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "computeDistance:withDistanceFunction:error:", v20, a4, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        v21 = v14;
      else
        v21 = 0;
      if ((v21 & 1) != 0)
      {
        v22 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v18, "floatValue");
        v24 = v23;
        objc_msgSend(v13, "floatValue");
        *(float *)&v26 = (float)(v25 * 0.5) + (float)(v24 * 0.5);
        objc_msgSend(v22, "numberWithFloat:", v26);
        v27 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v27;
      }
      goto LABEL_20;
    }
LABEL_12:
    v13 = 0;
    goto LABEL_21;
  }
  v13 = &unk_1E459E2E8;
LABEL_21:

  return v13;
}

- (BOOL)isValidFaceprint
{
  void *v2;
  BOOL v3;

  -[VNFaceTorsoprint faceprint](self, "faceprint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isValidTorsoprint
{
  void *v2;
  BOOL v3;

  -[VNFaceTorsoprint torsoprint](self, "torsoprint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (VNFaceTorsoprint)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  _OWORD *v13;
  id v15;
  VNFaceTorsoprint *v16;
  uint64_t v17;
  int v18;
  unint64_t v19;
  int v20;
  unint64_t v21;
  VNTorsoprint *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  VNFaceTorsoprint *v29;
  void *v30;
  VNTorsoprint *v32;
  VNFaceprint *v33;
  _QWORD v34[2];
  _BYTE v35[28];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (!v8)
  {
    if (a5)
    {
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, CFSTR("state cannot be nil"));
      v15 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_15:
    v16 = 0;
    goto LABEL_39;
  }
  v10 = objc_retainAutorelease(v8);
  v11 = objc_msgSend(v10, "bytes");
  v12 = *a4;
  v13 = (_OWORD *)(v11 + *a4);
  *(_OWORD *)v35 = *v13;
  *(_OWORD *)&v35[12] = *(_OWORD *)((char *)v13 + 12);
  *a4 = v12 + 28;
  calculateChecksumMD5((char *)(v11 + v12 + 28), objc_msgSend(v10, "length") - 28, (unsigned __int8 *)v34);
  if (*(_QWORD *)&v35[12] == v34[0] && *(_QWORD *)&v35[20] == v34[1])
  {
    v17 = *(unsigned int *)&v35[4];
    if (*(_DWORD *)&v35[4] < 4u || (v18 = *(unsigned __int8 *)(v11 + *a4), v19 = *a4 + 1, *a4 = v19, v18))
    {
      v33 = -[VNFaceprint initWithState:byteOffset:error:]([VNFaceprint alloc], "initWithState:byteOffset:error:", v10, a4, a5);
      if (!v33)
        goto LABEL_15;
      v19 = *a4;
    }
    else
    {
      v33 = 0;
    }
    v20 = *(unsigned __int8 *)(v11 + v19);
    v21 = v19 + 1;
    *a4 = v21;
    if (v20)
    {
      v22 = -[VNTorsoprint initWithState:byteOffset:error:]([VNTorsoprint alloc], "initWithState:byteOffset:error:", v10, a4, a5);
      if (!v22)
      {
        v16 = 0;
LABEL_38:

        goto LABEL_39;
      }
      v21 = *a4;
    }
    else
    {
      v22 = 0;
    }
    v32 = v22;
    v23 = *(unsigned int *)(v11 + v21);
    *a4 = v21 + 4;
    if (objc_msgSend((id)objc_opt_class(), "shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:", v17))
    {
      objc_msgSend((id)objc_opt_class(), "originatingRequestSpecifierForRequestRevision:error:", v23, a5);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
        goto LABEL_36;
    }
    else
    {
      v25 = *(unsigned int *)(v11 + *a4);
      *a4 += 4;
      +[VNClassRegistrar classNameForClassCode:error:](VNClassRegistrar, "classNameForClassCode:error:", v25, a5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v26
        || (+[VNRequestSpecifier specifierForRequestClassName:revision:error:](VNRequestSpecifier, "specifierForRequestClassName:revision:error:", v26, v23, a5), v24 = (void *)objc_claimAutoreleasedReturnValue(), v26, !v24))
      {
        v24 = 0;
        goto LABEL_36;
      }
    }
    v27 = *a4;
    if (v17 < 5)
    {
      v28 = 0;
    }
    else
    {
      v28 = *(unsigned int *)(v11 + v27);
      v27 += 4;
      *a4 = v27;
    }
    if (v27 - v12 == *(unsigned int *)&v35[8])
    {
      v29 = -[VNFaceTorsoprint initWithFaceprint:torsoPrint:originatingRequestSpecifier:](self, "initWithFaceprint:torsoPrint:originatingRequestSpecifier:", v33, v32, v24);
      if (v29)
      {
        v29->_personId = v28;
        self = v29;
        v16 = self;
LABEL_37:

        goto LABEL_38;
      }
      if (a5)
      {
        +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 9, CFSTR("Failed to initialize VNFaceTorsoprint object"));
        self = 0;
        v16 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_37;
      }
      self = 0;
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected size of deserialized state of the object of type %@"), objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 9, v30);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_36:
    v16 = 0;
    goto LABEL_37;
  }
  if (!a5)
    goto LABEL_15;
  +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 9, CFSTR("Serialized and calculated MD5s don't match"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v16 = 0;
  *a5 = v15;
LABEL_39:

  return v16;
}

- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  int v12;
  _BOOL4 v13;
  unint64_t v14;
  unint64_t v15;
  _BOOL4 v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  _OWORD *v22;
  __int128 v23;
  void *v24;
  _BYTE v26[28];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (!v8)
  {
    if (a5)
    {
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, CFSTR("state cannot be nil"));
      v21 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  v10 = objc_retainAutorelease(v8);
  v11 = objc_msgSend(v10, "mutableBytes");
  *(_QWORD *)&v26[12] = 0;
  *(_QWORD *)&v26[20] = 0;
  *(_DWORD *)v26 = -87158511;
  v12 = -[VNFaceTorsoprint serializedLength](self, "serializedLength");
  *(_DWORD *)&v26[4] = 5;
  *(_DWORD *)&v26[8] = v12;
  v13 = -[VNFaceTorsoprint isValidFaceprint](self, "isValidFaceprint");
  *(_BYTE *)(v11 + a4 + 28) = v13;
  v14 = a4 + 29;
  if (v13)
  {
    v15 = -[VNFaceprint serializeStateIntoData:startingAtByteOffset:error:](self->_faceprint, "serializeStateIntoData:startingAtByteOffset:error:", v10, a4 + 29, a5);
    if (!v15)
      goto LABEL_12;
    v14 += v15;
  }
  v16 = -[VNFaceTorsoprint isValidTorsoprint](self, "isValidTorsoprint");
  *(_BYTE *)(v11 + v14) = v16;
  v17 = v14 + 1;
  if (v16)
  {
    v18 = -[VNTorsoprint serializeStateIntoData:startingAtByteOffset:error:](self->_torsoprint, "serializeStateIntoData:startingAtByteOffset:error:", v10, v17, a5);
    if (v18)
    {
      v17 += v18;
      goto LABEL_8;
    }
LABEL_12:
    v21 = 0;
    goto LABEL_17;
  }
LABEL_8:
  -[VNEspressoModelImageprint originatingRequestSpecifier](self, "originatingRequestSpecifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(v11 + v17) = objc_msgSend(v19, "requestRevision");
  *(_DWORD *)(v17 + v11 + 4) = objc_msgSend(v19, "requestClassCode");
  *(_DWORD *)(v17 + v11 + 8) = -[VNFaceTorsoprint personId](self, "personId");
  v20 = v17 - a4;
  v21 = v17 - a4 + 12;
  if (v21 == v12)
  {
    v22 = (_OWORD *)(v11 + a4);
    calculateChecksumMD5((char *)(v11 + a4 + 28), v20 - 16, &v26[12]);
    v23 = *(_OWORD *)v26;
    *(_OWORD *)((char *)v22 + 12) = *(_OWORD *)&v26[12];
    *v22 = v23;
  }
  else
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected size of serialized state of the object of type %@"), objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 9, v24);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v21 = 0;
  }

LABEL_17:
  return v21;
}

- (id)serializeStateAndReturnError:(id *)a3
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", -[VNFaceTorsoprint serializedLength](self, "serializedLength"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VNFaceTorsoprint serializeStateIntoData:startingAtByteOffset:error:](self, "serializeStateIntoData:startingAtByteOffset:error:", v5, 0, a3))
  {
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)serializedLength
{
  unint64_t v3;

  v3 = -[VNFaceprint serializedLength](self->_faceprint, "serializedLength");
  return v3 + -[VNTorsoprint serializedLength](self->_torsoprint, "serializedLength") + 42;
}

- (VNFaceprint)faceprint
{
  return self->_faceprint;
}

- (VNTorsoprint)torsoprint
{
  return self->_torsoprint;
}

- (unint64_t)personId
{
  return self->_personId;
}

- (void)setPersonId:(unint64_t)a3
{
  self->_personId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_torsoprint, 0);
  objc_storeStrong((id *)&self->_faceprint, 0);
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  if (a3 - 1 >= 2)
    return CFSTR("VNNOPRequest");
  else
    return CFSTR("VNCreateFaceTorsoprintRequest");
}

+ (id)currentVersion
{
  return CFSTR("1.0");
}

+ (unsigned)currentCodingVersion
{
  return 1;
}

+ (id)codingTypesToCodingKeys
{
  if (+[VNFaceTorsoprint codingTypesToCodingKeys]::onceToken != -1)
    dispatch_once(&+[VNFaceTorsoprint codingTypesToCodingKeys]::onceToken, &__block_literal_global_5708);
  return (id)+[VNFaceTorsoprint codingTypesToCodingKeys]::codingTypesToCodingKeys;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)currentSerializationVersion
{
  return 5;
}

+ (BOOL)shouldIgnoreLagecyLabelsAndConfidenceForHeaderSerializationVersion:(unsigned int)a3
{
  return a3 == 1;
}

+ (BOOL)shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:(unsigned int)a3
{
  return a3 < 3;
}

void __43__VNFaceTorsoprint_codingTypesToCodingKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("emp_data");
  v2[1] = CFSTR("emp_elementsCount");
  v3[0] = CFSTR("FTp_data");
  v3[1] = CFSTR("FTp_elementsCount");
  v2[2] = CFSTR("emp_elementsType");
  v2[3] = CFSTR("emp_length");
  v3[2] = CFSTR("FTp_elementsType");
  v3[3] = CFSTR("FTp_length");
  v2[4] = CFSTR("emp_labelsAndConfidence");
  v2[5] = CFSTR("VNEspressoModelImageprint");
  v3[4] = CFSTR("FTp_labelsAndConfidence");
  v3[5] = CFSTR("FTp_VNFaceTorsoprint");
  v2[6] = CFSTR("emp_algorithmVersionCodingKey");
  v2[7] = CFSTR("emp_algorithmVersion");
  v3[6] = CFSTR("FTp_algorithmVersion");
  v3[7] = CFSTR("1.0");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNFaceTorsoprint codingTypesToCodingKeys]::codingTypesToCodingKeys;
  +[VNFaceTorsoprint codingTypesToCodingKeys]::codingTypesToCodingKeys = v0;

}

@end
