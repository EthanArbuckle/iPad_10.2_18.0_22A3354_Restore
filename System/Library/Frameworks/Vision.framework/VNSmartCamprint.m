@implementation VNSmartCamprint

- (VNSmartCamprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 labelsAndConfidence:(id)a7 requestRevision:(unint64_t)a8
{
  id v14;
  void *v15;
  VNSmartCamprint *v16;

  v14 = a7;
  objc_msgSend((id)objc_opt_class(), "originatingRequestSpecifierForRequestRevision:error:", a8, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    self = -[VNSmartCamprint initWithData:elementCount:elementType:lengthInBytes:labelsAndConfidence:originatingRequestSpecifier:](self, "initWithData:elementCount:elementType:lengthInBytes:labelsAndConfidence:originatingRequestSpecifier:", a3, a4, a5, a6, v14, v15);
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (VNSmartCamprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 labelsAndConfidence:(id)a7 originatingRequestSpecifier:(id)a8
{
  id v14;
  id v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  VNSmartCamprint *v20;
  uint64_t v21;
  NSDictionary *labelsAndConfidence;
  VNSmartCamprint *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  objc_super v33;
  id v34;

  v14 = a7;
  v15 = a8;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3, a6);
  v34 = 0;
  v17 = objc_msgSend((id)objc_opt_class(), "validateDescriptorData:elementType:elementCount:error:", v16, a5, a4, &v34);
  v18 = v34;
  v19 = v18;
  if ((v17 & 1) != 0)
  {
    v33.receiver = self;
    v33.super_class = (Class)VNSmartCamprint;
    v20 = -[VNEspressoModelImageprint initWithDescriptorData:elementType:elementCount:originatingRequestSpecifier:](&v33, sel_initWithDescriptorData_elementType_elementCount_originatingRequestSpecifier_, v16, a5, a4, v15);
    if (v20)
    {
      v21 = objc_msgSend(v14, "copy");
      labelsAndConfidence = v20->_labelsAndConfidence;
      v20->_labelsAndConfidence = (NSDictionary *)v21;

    }
    self = v20;
    v23 = self;
  }
  else
  {
    objc_msgSend(v18, "localizedDescription");
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v25 = objc_msgSend(v24, "UTF8String");
    VNValidatedLog(4, (uint64_t)CFSTR("%s"), v26, v27, v28, v29, v30, v31, v25);

    v23 = 0;
  }

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNSmartCamprint;
  -[VNEspressoModelImageprint encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_labelsAndConfidence, CFSTR("labelsConfidences"));

}

- (VNSmartCamprint)initWithCoder:(id)a3
{
  id v4;
  VNSmartCamprint *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *labelsAndConfidence;
  VNSmartCamprint *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VNSmartCamprint;
  v5 = -[VNEspressoModelImageprint initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("labelsConfidences"));
    v10 = objc_claimAutoreleasedReturnValue();
    labelsAndConfidence = v5->_labelsAndConfidence;
    v5->_labelsAndConfidence = (NSDictionary *)v10;

    v12 = v5;
  }

  return v5;
}

- (unint64_t)serializedLength
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_labelsAndConfidence, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") + 4;

  return v3;
}

- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5
{
  id v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char *v13;
  id v14;
  const void *v15;
  size_t v16;
  char *v17;
  void *v18;
  objc_super v20;

  v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VNSmartCamprint;
  v9 = -[VNEspressoModelImageprint serializeStateIntoData:startingAtByteOffset:error:](&v20, sel_serializeStateIntoData_startingAtByteOffset_error_, v8, a4, a5);
  if (v9)
  {
    v10 = objc_msgSend(objc_retainAutorelease(v8), "mutableBytes");
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_labelsAndConfidence, 1, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = &v9[a4];
      if (objc_msgSend(v11, "length"))
      {
        *(_DWORD *)&v13[v10] = objc_msgSend(v12, "length");
        v14 = objc_retainAutorelease(v12);
        v15 = (const void *)objc_msgSend(v14, "bytes");
        v16 = objc_msgSend(v14, "length");
        v17 = v13 + 4;
        memcpy(&v17[v10], v15, v16);
        v13 = &v17[v16];
      }
      v9 = &v13[-a4];
      if (&v13[-a4] == (char *)-[VNSmartCamprint serializedLength](self, "serializedLength"))
      {
        calculateChecksumMD5((char *)(v10 + a4 + 28), (unint64_t)(v9 - 28), (unsigned __int8 *)(v10 + a4 + 12));
LABEL_10:

        goto LABEL_11;
      }
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected size of serialized state of the object of type %@"), objc_opt_class());
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v18);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v9 = 0;
    goto LABEL_10;
  }
LABEL_11:

  return (unint64_t)v9;
}

- (NSDictionary)labelsAndConfidence
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelsAndConfidence, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNCreateSmartCamprintRequest");
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
  if (+[VNSmartCamprint codingTypesToCodingKeys]::onceToken != -1)
    dispatch_once(&+[VNSmartCamprint codingTypesToCodingKeys]::onceToken, &__block_literal_global_9520);
  return (id)+[VNSmartCamprint codingTypesToCodingKeys]::codingTypesToCodingKeys;
}

+ (BOOL)shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:(unsigned int)a3
{
  return a3 < 2;
}

+ (unint64_t)serializationMagicNumber
{
  return 3394132480;
}

+ (unint64_t)currentSerializationVersion
{
  return 2;
}

+ (unint64_t)confidenceTypeForOriginatingRequestSpecifier:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "specifiesRequestClass:", objc_opt_class())
    && objc_msgSend(v3, "requestRevision") == 1;

  return v4;
}

void __42__VNSmartCamprint_codingTypesToCodingKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("emp_data");
  v2[1] = CFSTR("emp_elementsCount");
  v3[0] = CFSTR("sc_d");
  v3[1] = CFSTR("sc_ec");
  v2[2] = CFSTR("emp_elementsType");
  v2[3] = CFSTR("emp_length");
  v3[2] = CFSTR("sc_et");
  v3[3] = CFSTR("sc_l");
  v2[4] = CFSTR("emp_labelsAndConfidence");
  v2[5] = CFSTR("VNEspressoModelImageprint");
  v3[4] = CFSTR("sc_lac");
  v3[5] = CFSTR("VNSmartCamprint");
  v2[6] = CFSTR("emp_algorithmVersionCodingKey");
  v2[7] = CFSTR("emp_algorithmVersion");
  v3[6] = CFSTR("sc_av");
  v3[7] = CFSTR("1.0");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNSmartCamprint codingTypesToCodingKeys]::codingTypesToCodingKeys;
  +[VNSmartCamprint codingTypesToCodingKeys]::codingTypesToCodingKeys = v0;

}

@end
