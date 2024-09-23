@implementation VNSceneprint

- (VNSceneprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 labelsAndConfidence:(id)a7 requestRevision:(unint64_t)a8
{
  id v14;
  VNSceneprint *v15;
  void *v16;
  VNSceneprint *v17;
  objc_super v19;

  v14 = a7;
  v19.receiver = self;
  v19.super_class = (Class)VNSceneprint;
  v15 = -[VNEspressoModelImageprint initWithData:elementCount:elementType:lengthInBytes:requestRevision:](&v19, sel_initWithData_elementCount_elementType_lengthInBytes_requestRevision_, a3, a4, a5, a6, a8);
  if (v15)
  {
    if (v14)
      v16 = (void *)objc_msgSend(v14, "copy");
    else
      v16 = (void *)MEMORY[0x1E0C9AA70];
    objc_storeStrong((id *)&v15->_labelsAndConfidence, v16);
    if (v14)

    v17 = v15;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSUInteger v5;
  NSDictionary *labelsAndConfidence;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VNSceneprint;
  -[VNEspressoModelImageprint encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v5 = -[NSDictionary count](self->_labelsAndConfidence, "count");
  labelsAndConfidence = self->_labelsAndConfidence;
  if (v5)
  {
    objc_msgSend(v4, "encodeObject:forKey:", labelsAndConfidence, CFSTR("labelsConfidences"));
  }
  else
  {
    self->_labelsAndConfidence = (NSDictionary *)MEMORY[0x1E0C9AA70];

  }
}

- (VNSceneprint)initWithCoder:(id)a3
{
  id v4;
  VNSceneprint *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSDictionary *v9;
  uint64_t v10;
  NSDictionary *labelsAndConfidence;
  VNSceneprint *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VNSceneprint;
  v5 = -[VNEspressoModelImageprint initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("labelsConfidences")))
    {
      v6 = objc_alloc(MEMORY[0x1E0C99E60]);
      v7 = objc_opt_class();
      v8 = objc_opt_class();
      v9 = (NSDictionary *)objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("labelsConfidences"));
      v10 = objc_claimAutoreleasedReturnValue();
      labelsAndConfidence = v5->_labelsAndConfidence;
      v5->_labelsAndConfidence = (NSDictionary *)v10;

    }
    else
    {
      v9 = v5->_labelsAndConfidence;
      v5->_labelsAndConfidence = (NSDictionary *)MEMORY[0x1E0C9AA70];
    }

    v12 = v5;
  }

  return v5;
}

- (unint64_t)serializedLength
{
  char *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VNSceneprint;
  v3 = (char *)-[VNEspressoModelImageprint serializedLength](&v6, sel_serializedLength) + 4;
  if (-[NSDictionary count](self->_labelsAndConfidence, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_labelsAndConfidence, 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 += objc_msgSend(v4, "length");

  }
  return (unint64_t)v3;
}

- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5
{
  id v8;
  char *v9;
  uint64_t v10;
  char *v11;
  void *v12;
  void *v13;
  int v14;
  char *v15;
  id v16;
  const void *v17;
  size_t v18;
  unint64_t v19;
  void *v20;
  objc_super v22;

  v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)VNSceneprint;
  v9 = -[VNEspressoModelImageprint serializeStateIntoData:startingAtByteOffset:error:](&v22, sel_serializeStateIntoData_startingAtByteOffset_error_, v8, a4, a5);
  if (v9)
  {
    v10 = objc_msgSend(objc_retainAutorelease(v8), "mutableBytes");
    v11 = &v9[a4];
    if (-[NSDictionary count](self->_labelsAndConfidence, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_labelsAndConfidence, 1, a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (!v12)
        goto LABEL_12;
      v14 = objc_msgSend(v12, "length");
      *(_DWORD *)&v11[v10] = v14;
      v15 = v11 + 4;
      if (v14)
      {
        v16 = objc_retainAutorelease(v13);
        v17 = (const void *)objc_msgSend(v16, "bytes");
        v18 = objc_msgSend(v16, "length");
        memcpy(&v15[v10], v17, v18);
        v15 += v18;
        v13 = v16;
      }
    }
    else
    {
      v13 = 0;
      *(_DWORD *)&v11[v10] = 0;
      v15 = v11 + 4;
    }
    v19 = (unint64_t)&v15[-a4];
    if (&v15[-a4] == (char *)-[VNSceneprint serializedLength](self, "serializedLength"))
    {
      calculateChecksumMD5((char *)(v10 + a4 + 28), v19 - 28, (unsigned __int8 *)(v10 + a4 + 12));
LABEL_13:

      goto LABEL_14;
    }
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected size of serialized state of the object of type %@"), objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v20);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_12:
    v19 = 0;
    goto LABEL_13;
  }
  v19 = 0;
LABEL_14:

  return v19;
}

- (VNSceneprint)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5
{
  id v8;
  VNSceneprint *v9;
  uint64_t v10;
  size_t v11;
  id v12;
  uint64_t v13;
  NSDictionary *labelsAndConfidence;
  VNSceneprint *v15;
  NSDictionary *v16;
  objc_super v18;

  v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VNSceneprint;
  v9 = -[VNEspressoModelImageprint initWithState:byteOffset:error:](&v18, sel_initWithState_byteOffset_error_, v8, a4, a5);
  if (v9)
  {
    v10 = objc_msgSend(objc_retainAutorelease(v8), "bytes");
    v11 = *(unsigned int *)(v10 + *a4);
    *a4 += 4;
    if ((_DWORD)v11)
    {
      v12 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v11));
      memcpy((void *)objc_msgSend(v12, "mutableBytes"), (const void *)(v10 + *a4), v11);
      *a4 += v11;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v12, a5);
      v13 = objc_claimAutoreleasedReturnValue();
      labelsAndConfidence = v9->_labelsAndConfidence;
      v9->_labelsAndConfidence = (NSDictionary *)v13;

      v15 = (VNSceneprint *)v9->_labelsAndConfidence;
      if (!v15)
        goto LABEL_7;
    }
    else
    {
      v16 = v9->_labelsAndConfidence;
      v9->_labelsAndConfidence = (NSDictionary *)MEMORY[0x1E0C9AA70];

    }
  }
  v15 = v9;
LABEL_7:

  return v15;
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
  return CFSTR("VNCreateSceneprintRequest");
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
  if (+[VNSceneprint codingTypesToCodingKeys]::onceToken != -1)
    dispatch_once(&+[VNSceneprint codingTypesToCodingKeys]::onceToken, &__block_literal_global_7824);
  return (id)+[VNSceneprint codingTypesToCodingKeys]::codingTypesToCodingKeys;
}

+ (BOOL)shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:(unsigned int)a3
{
  return a3 < 2;
}

+ (unint64_t)serializationMagicNumber
{
  return 1558503424;
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

void __39__VNSceneprint_codingTypesToCodingKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("emp_data");
  v2[1] = CFSTR("emp_elementsCount");
  v3[0] = CFSTR("data");
  v3[1] = CFSTR("elementsCount");
  v2[2] = CFSTR("emp_elementsType");
  v2[3] = CFSTR("emp_length");
  v3[2] = CFSTR("elementsType");
  v3[3] = CFSTR("length");
  v2[4] = CFSTR("emp_labelsAndConfidence");
  v2[5] = CFSTR("VNEspressoModelImageprint");
  v3[4] = CFSTR("labelsAndConfidence");
  v3[5] = CFSTR("VNSceneprint");
  v2[6] = CFSTR("emp_algorithmVersionCodingKey");
  v2[7] = CFSTR("emp_algorithmVersion");
  v3[6] = CFSTR("algorithmVersion");
  v3[7] = CFSTR("1.0");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNSceneprint codingTypesToCodingKeys]::codingTypesToCodingKeys;
  +[VNSceneprint codingTypesToCodingKeys]::codingTypesToCodingKeys = v0;

}

@end
