@implementation VNTorsoprint

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

- (VNTorsoprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 confidence:(float)a7 requestRevision:(unint64_t)a8
{
  void *v14;
  double v15;
  VNTorsoprint *v16;

  objc_msgSend((id)objc_opt_class(), "originatingRequestSpecifierForRequestRevision:error:", a8, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    *(float *)&v15 = a7;
    self = -[VNTorsoprint initWithData:elementCount:elementType:lengthInBytes:confidence:originatingRequestSpecifier:](self, "initWithData:elementCount:elementType:lengthInBytes:confidence:originatingRequestSpecifier:", a3, a4, a5, a6, v14, v15);
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (VNTorsoprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 confidence:(float)a7 originatingRequestSpecifier:(id)a8
{
  id v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  VNTorsoprint *v19;
  double v20;
  BOOL v21;
  id v22;
  id v23;
  VNTorsoprint *v24;
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
  v42.super_class = (Class)VNTorsoprint;
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

- (VNTorsoprint)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  VNTorsoprint *v11;
  int v12;
  double v13;
  VNTorsoprint *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VNTorsoprint;
  v11 = -[VNEspressoModelImageprint initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v11)
  {
    v12 = objc_msgSend(v4, "containsValueForKey:", CFSTR("tp_conf"));
    LODWORD(v13) = 1.0;
    if (v12)
      objc_msgSend(v4, "vn_decodeValidatedConfidenceForKey:", CFSTR("tp_conf"), v13);
    v11->_confidence = *(float *)&v13;
    v14 = v11;
  }
  else
  {
    VNValidatedLog(4, (uint64_t)CFSTR("Unexpected error while decoding VNTorsoprint object state"), v5, v6, v7, v8, v9, v10, (uint64_t)v16.receiver);
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VNTorsoprint;
  -[VNEspressoModelImageprint encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  *(float *)&v5 = self->_confidence;
  objc_msgSend(v4, "vn_encodeValidatedConfidence:forKey:", CFSTR("tp_conf"), v5);

}

- (VNTorsoprint)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  VNTorsoprint *v12;
  double v13;
  VNTorsoprint *v14;
  unsigned int v15;
  unint64_t v16;
  void *v17;
  float v18;
  VNTorsoprint *v19;
  objc_super v21;

  v8 = objc_retainAutorelease(a3);
  v9 = objc_msgSend(v8, "bytes");
  v10 = *a4;
  v11 = objc_msgSend(v8, "length");
  v21.receiver = self;
  v21.super_class = (Class)VNTorsoprint;
  v12 = -[VNEspressoModelImageprint initWithState:byteOffset:error:](&v21, sel_initWithState_byteOffset_error_, v8, a4, a5);
  v14 = v12;
  if (!v12)
    goto LABEL_12;
  v15 = *(_DWORD *)(v9 + v10 + 4);
  v12->_confidence = 1.0;
  if (v15 >= 4)
  {
    v16 = *a4;
    if (v11 + v10 - *a4 <= 3)
    {
      if (a5)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Internal error desrializing torsoprint"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
        v19 = 0;
        *a5 = v17;
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    v18 = *(float *)(v9 + v16);
    *a4 = v16 + 4;
    *(float *)&v13 = v18;
    if (!+[VNValidationUtilities validateVNConfidenceRange:error:](VNValidationUtilities, "validateVNConfidenceRange:error:", a5, v13))
    {
      if (a5)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Deserialized confidence is outside of the valid range"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
LABEL_12:
      v19 = 0;
      goto LABEL_13;
    }
    v14->_confidence = v18;
  }
  v19 = v14;
LABEL_13:

  return v19;
}

- (unint64_t)serializedLength
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNTorsoprint;
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
  v14.super_class = (Class)VNTorsoprint;
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
  if (v9 + 4 != (char *)-[VNTorsoprint serializedLength](self, "serializedLength"))
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
  VNTorsoprint *v4;
  float v5;
  float v6;
  float v7;
  BOOL v8;
  objc_super v10;

  v4 = (VNTorsoprint *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v10.receiver = self,
          v10.super_class = (Class)VNTorsoprint,
          -[VNEspressoModelImageprint isEqual:](&v10, sel_isEqual_, v4)))
    {
      -[VNTorsoprint confidence](self, "confidence");
      v6 = v5;
      -[VNTorsoprint confidence](v4, "confidence");
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
  v7.super_class = (Class)VNTorsoprint;
  v3 = -[VNEspressoModelImageprint hash](&v7, sel_hash);
  -[VNTorsoprint confidence](self, "confidence");
  v5 = LODWORD(v4);
  if (v4 == 0.0)
    v5 = 0;
  return v5 ^ __ROR8__(v3, 51);
}

- (NSString)description
{
  id v3;
  void *v4;
  float v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)VNTorsoprint;
  -[VNEspressoModelImageprint description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNTorsoprint confidence](self, "confidence");
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@; coinfidence = %f"), v4, v5);

  return (NSString *)v6;
}

- (float)confidence
{
  return self->_confidence;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNCreateTorsoprintRequest");
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
  if (+[VNTorsoprint codingTypesToCodingKeys]::onceToken != -1)
    dispatch_once(&+[VNTorsoprint codingTypesToCodingKeys]::onceToken, &__block_literal_global_19899);
  return (id)+[VNTorsoprint codingTypesToCodingKeys]::codingTypesToCodingKeys;
}

+ (unint64_t)serializationMagicNumber
{
  return 2966487040;
}

+ (unint64_t)currentSerializationVersion
{
  return 4;
}

+ (BOOL)shouldIgnoreLagecyLabelsAndConfidenceForHeaderSerializationVersion:(unsigned int)a3
{
  return a3 == 1;
}

+ (BOOL)shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:(unsigned int)a3
{
  return a3 < 3;
}

+ (id)emptyTorsoprintDataForRevision:(unint64_t)a3
{
  if (+[VNTorsoprint emptyTorsoprintDataForRevision:]::onceToken != -1)
    dispatch_once(&+[VNTorsoprint emptyTorsoprintDataForRevision:]::onceToken, &__block_literal_global_69);
  return (id)+[VNTorsoprint emptyTorsoprintDataForRevision:]::emptyVNTorsoprint;
}

+ (unint64_t)confidenceTypeForOriginatingRequestSpecifier:(id)a3
{
  return 2 * (objc_msgSend(a3, "requestRevision") == 3737841670);
}

void __47__VNTorsoprint_emptyTorsoprintDataForRevision___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 512);
  v1 = (void *)+[VNTorsoprint emptyTorsoprintDataForRevision:]::emptyVNTorsoprint;
  +[VNTorsoprint emptyTorsoprintDataForRevision:]::emptyVNTorsoprint = v0;

}

void __39__VNTorsoprint_codingTypesToCodingKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("emp_data");
  v2[1] = CFSTR("emp_elementsCount");
  v3[0] = CFSTR("Tp_data");
  v3[1] = CFSTR("Tp_elementsCount");
  v2[2] = CFSTR("emp_elementsType");
  v2[3] = CFSTR("emp_length");
  v3[2] = CFSTR("Tp_elementsType");
  v3[3] = CFSTR("Tp_length");
  v2[4] = CFSTR("emp_labelsAndConfidence");
  v2[5] = CFSTR("VNEspressoModelImageprint");
  v3[4] = CFSTR("Tp_labelsAndConfidence");
  v3[5] = CFSTR("Tp_VNTorsoprint");
  v2[6] = CFSTR("emp_algorithmVersionCodingKey");
  v2[7] = CFSTR("emp_algorithmVersion");
  v3[6] = CFSTR("Tp_algorithmVersion");
  v3[7] = CFSTR("1.0");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNTorsoprint codingTypesToCodingKeys]::codingTypesToCodingKeys;
  +[VNTorsoprint codingTypesToCodingKeys]::codingTypesToCodingKeys = v0;

}

@end
