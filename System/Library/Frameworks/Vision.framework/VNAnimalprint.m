@implementation VNAnimalprint

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

- (VNAnimalprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 confidence:(float)a7 requestRevision:(unint64_t)a8
{
  VNAnimalprint *v9;
  double v10;
  BOOL v11;
  id v12;
  void *v13;
  VNAnimalprint *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)VNAnimalprint;
  v9 = -[VNEspressoModelImageprint initWithData:elementCount:elementType:lengthInBytes:requestRevision:](&v25, sel_initWithData_elementCount_elementType_lengthInBytes_requestRevision_, a3, a4, a5, a6, a8);
  if (v9)
  {
    v24 = 0;
    *(float *)&v10 = a7;
    v11 = +[VNValidationUtilities validateVNConfidenceRange:error:](VNValidationUtilities, "validateVNConfidenceRange:error:", &v24, v10);
    v12 = v24;
    v13 = v12;
    if (v11)
    {
      v9->_confidence = a7;
      v14 = v9;
    }
    else
    {
      objc_msgSend(v12, "localizedDescription");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v16 = objc_msgSend(v15, "UTF8String");
      VNValidatedLog(4, (uint64_t)CFSTR("%s"), v17, v18, v19, v20, v21, v22, v16);

      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (VNAnimalprint)initWithCoder:(id)a3
{
  id v4;
  VNAnimalprint *v5;
  float v6;
  VNAnimalprint *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNAnimalprint;
  v5 = -[VNEspressoModelImageprint initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "vn_decodeValidatedConfidenceForKey:", CFSTR("ap_conf"));
    v5->_confidence = v6;
    v7 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VNAnimalprint;
  -[VNEspressoModelImageprint encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  *(float *)&v5 = self->_confidence;
  objc_msgSend(v4, "vn_encodeValidatedConfidence:forKey:", CFSTR("ap_conf"), v5);

}

- (VNAnimalprint)initWithState:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNAnimalprint;
  return -[VNEspressoModelImageprint initWithState:error:](&v5, sel_initWithState_error_, a3, a4);
}

- (VNAnimalprint)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5
{
  id v8;
  VNAnimalprint *v9;
  float v10;
  double v11;
  unint64_t v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNAnimalprint;
  v9 = -[VNEspressoModelImageprint initWithState:byteOffset:error:](&v15, sel_initWithState_byteOffset_error_, v8, a4, a5);
  if (!v9)
    goto LABEL_7;
  v10 = *(float *)(objc_msgSend(objc_retainAutorelease(v8), "bytes") + *a4);
  *a4 += 4;
  *(float *)&v11 = v10;
  if (!+[VNValidationUtilities validateVNConfidenceRange:error:](VNValidationUtilities, "validateVNConfidenceRange:error:", a5, v11))goto LABEL_7;
  v9->_confidence = v10;
  v12 = *a4;
  if (v12 != -[VNAnimalprint serializedLength](v9, "serializedLength"))
  {
    if (!a5)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error deserializing object of type %@"), objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
    a5 = 0;
    goto LABEL_8;
  }
  a5 = v9;
LABEL_8:

  return (VNAnimalprint *)a5;
}

- (unint64_t)serializedLength
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNAnimalprint;
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
  v14.super_class = (Class)VNAnimalprint;
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
  if (v9 + 4 != (char *)-[VNAnimalprint serializedLength](self, "serializedLength"))
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
  VNAnimalprint *v4;
  float v5;
  float v6;
  float v7;
  BOOL v8;
  objc_super v10;

  v4 = (VNAnimalprint *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v10.receiver = self,
          v10.super_class = (Class)VNAnimalprint,
          -[VNEspressoModelImageprint isEqual:](&v10, sel_isEqual_, v4)))
    {
      -[VNAnimalprint confidence](self, "confidence");
      v6 = v5;
      -[VNAnimalprint confidence](v4, "confidence");
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
  v7.super_class = (Class)VNAnimalprint;
  v3 = -[VNEspressoModelImageprint hash](&v7, sel_hash);
  -[VNAnimalprint confidence](self, "confidence");
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
  v14.super_class = (Class)VNAnimalprint;
  -[VNEspressoModelImageprint description](&v14, sel_description);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@; pixels:\n%@"), v11, v3);

  return (NSString *)v12;
}

- (float)confidence
{
  return self->_confidence;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNCreateAnimalprintRequest");
}

+ (id)currentVersion
{
  return CFSTR("1.0");
}

+ (unsigned)currentCodingVersion
{
  return 0;
}

+ (unint64_t)serializationMagicNumber
{
  return 3198488576;
}

+ (unint64_t)currentSerializationVersion
{
  return 2;
}

+ (BOOL)shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:(unsigned int)a3
{
  return a3 < 2;
}

+ (unint64_t)confidenceTypeForRevision:(unint64_t)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
