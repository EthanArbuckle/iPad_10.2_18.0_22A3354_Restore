@implementation VNEspressoModelImageprint

+ (id)originatingRequestSpecifierForRequestRevision:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;

  objc_msgSend(a1, "defaultOriginatingRequestClassNameForRequestRevision:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v18 = 0;
    +[VNRequestSpecifier specifierForRequestClassName:revision:error:](VNRequestSpecifier, "specifierForRequestClassName:revision:error:", v7, a3, &v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v18;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromClass((Class)a1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ could not resolve originating request class of %@: %@"), v15, v7, v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError VNAssert:log:](VNError, "VNAssert:log:", 0, v16);

      if (a4)
        *a4 = objc_retainAutorelease(v9);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromClass((Class)a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ does not specify a default originating request class"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[VNError VNAssert:log:](VNError, "VNAssert:log:", 0, v13);
    if (a4)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    v8 = 0;
  }

  return v8;
}

- (VNEspressoModelImageprint)initWithDescriptorData:(id)a3 elementType:(unint64_t)a4 elementCount:(unint64_t)a5 originatingRequestSpecifier:(id)a6
{
  id v10;
  id v11;
  VNEspressoModelImageprint *v12;
  uint64_t v13;
  NSString *version;
  uint64_t v15;
  NSData *descriptorData;
  objc_super v18;

  v10 = a3;
  v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)VNEspressoModelImageprint;
  v12 = -[VNEspressoModelImageprint init](&v18, sel_init);
  if (v12)
  {
    objc_msgSend((id)objc_opt_class(), "currentVersion");
    v13 = objc_claimAutoreleasedReturnValue();
    version = v12->_version;
    v12->_version = (NSString *)v13;

    v15 = objc_msgSend(v10, "copy");
    descriptorData = v12->_descriptorData;
    v12->_descriptorData = (NSData *)v15;

    v12->_elementCount = a5;
    v12->_elementType = a4;
    v12->_confidenceScoreType = objc_msgSend((id)objc_opt_class(), "confidenceTypeForOriginatingRequestSpecifier:", v11);
    objc_storeStrong((id *)&v12->_originatingRequestSpecifier, a6);
  }

  return v12;
}

+ (BOOL)validateDescriptorData:(id)a3 elementType:(unint64_t)a4 elementCount:(unint64_t)a5 error:(id *)a6
{
  id v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  BOOL v13;
  id v14;
  void *v15;
  void *v16;

  v9 = a3;
  if (!_validateVNElementType(a4, a6))
    goto LABEL_11;
  if (a5)
  {
    if (a4 == 1)
      v10 = 4;
    else
      v10 = 8 * (a4 == 2);
    v11 = v10 * a5;
    v12 = objc_msgSend(v9, "length") == v10 * a5;
    v13 = v12;
    if (a6 && !v12)
    {
      v14 = objc_alloc(MEMORY[0x1E0CB3940]);
      VNElementTypeToString(a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%lu elements of type %@ with length of %lu mismatch to descriptor data length %lu"), a5, v15, v11, objc_msgSend(v9, "length"));

      +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", v16);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
      v13 = 0;
    }
  }
  else
  {
    if (!a6)
      goto LABEL_11;
    +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("element count must be non-zero"));
    v13 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_descriptorData, 0);
  objc_storeStrong((id *)&self->_originatingRequestSpecifier, 0);
}

- (VNEspressoModelImageprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 labelsAndConfidence:(id)a7 requestRevision:(unint64_t)a8
{
  +[VNError VNAssertClass:needsToOverrideMethod:](VNError, "VNAssertClass:needsToOverrideMethod:", objc_opt_class(), a2);

  return 0;
}

- (VNEspressoModelImageprint)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 requestRevision:(unint64_t)a7
{
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  VNEspressoModelImageprint *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v27;

  objc_msgSend((id)objc_opt_class(), "originatingRequestSpecifierForRequestRevision:error:", a7, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3, a6);
    v27 = 0;
    v14 = objc_msgSend((id)objc_opt_class(), "validateDescriptorData:elementType:elementCount:error:", v13, a5, a4, &v27);
    v15 = v27;
    v16 = v15;
    if ((v14 & 1) != 0)
    {
      self = -[VNEspressoModelImageprint initWithDescriptorData:elementType:elementCount:originatingRequestSpecifier:](self, "initWithDescriptorData:elementType:elementCount:originatingRequestSpecifier:", v13, a5, a4, v12);
      v17 = self;
    }
    else
    {
      objc_msgSend(v15, "localizedDescription");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v19 = objc_msgSend(v18, "UTF8String");
      VNValidatedLog(4, (uint64_t)CFSTR("%s"), v20, v21, v22, v23, v24, v25, v19);

      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (unint64_t)lengthInBytes
{
  return -[NSData length](self->_descriptorData, "length");
}

- (unint64_t)elementType
{
  return self->_elementType;
}

- (VNRequestSpecifier)originatingRequestSpecifier
{
  return self->_originatingRequestSpecifier;
}

- (unint64_t)requestRevision
{
  void *v2;
  unint64_t v3;

  -[VNEspressoModelImageprint originatingRequestSpecifier](self, "originatingRequestSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requestRevision");

  return v3;
}

- (id)labelsAndConfidence
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)_initWithClassKeyMappedCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  BOOL v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  VNEspressoModelImageprint *v22;
  uint64_t v23;
  id v24;
  id v25;
  char v26;
  VNEspressoModelImageprint *v27;
  id obj;
  id v30;
  id v31;
  id v32;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "codingTypesToCodingKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("emp_algorithmVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("emp_data"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("emp_elementsCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "decodeIntegerForKey:", v11);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("emp_length"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "decodeIntegerForKey:", v13);

  if (objc_msgSend(v10, "length") == v14)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("emp_elementsType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "containsValueForKey:", v15))
    {
      v16 = objc_msgSend(v4, "decodeIntegerForKey:", v15);
      v32 = 0;
      v17 = _validateVNElementType(v16, &v32);
      v18 = v32;
      v19 = v18;
      if (!v17)
      {
        objc_msgSend(v4, "failWithError:", v18);
        v22 = 0;
LABEL_19:

        goto LABEL_20;
      }

    }
    else
    {
      v16 = 1;
    }
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("VNEspressoModelImageprintRequestRevision")) & 1) != 0)
      v23 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("VNEspressoModelImageprintRequestRevision"));
    else
      v23 = 1;
    v31 = 0;
    objc_msgSend((id)objc_opt_class(), "originatingRequestSpecifierForRequestRevision:error:", v23, &v31);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v31;
    v25 = v24;
    if (v19)
    {

      v30 = 0;
      v26 = objc_msgSend((id)objc_opt_class(), "validateDescriptorData:elementType:elementCount:error:", v10, v16, v12, &v30);
      v25 = v30;
      if ((v26 & 1) != 0)
      {
        v27 = -[VNEspressoModelImageprint initWithDescriptorData:elementType:elementCount:originatingRequestSpecifier:](self, "initWithDescriptorData:elementType:elementCount:originatingRequestSpecifier:", v10, v16, v12, v19);
        v22 = v27;
        if (v27)
        {
          objc_storeStrong((id *)&v27->_version, obj);
          self = v22;
          v22 = self;
        }
        else
        {
          self = 0;
        }
        goto LABEL_18;
      }
      objc_msgSend(v4, "failWithError:", v25);
    }
    else
    {
      objc_msgSend(v4, "failWithError:", v24);
    }
    v22 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("descriptor data length (%lu) / expected length (%lu) mismatch"), objc_msgSend(v10, "length"), v14, obj);
  +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failWithError:", v21);

  v22 = 0;
LABEL_20:

  return v22;
}

- (VNEspressoModelImageprint)initWithCoder:(id)a3
{
  id v4;
  VNEspressoModelImageprint *v5;
  VNEspressoModelImageprint *v6;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("1.0")))
    v5 = -[VNEspressoModelImageprint _initWithClassKeyMappedCoder:](self, "_initWithClassKeyMappedCoder:", v4);
  else
    v5 = -[VNEspressoModelImageprint initWithCoder:forCodingVersion:](self, "initWithCoder:forCodingVersion:", v4, objc_msgSend(v4, "vn_decodeCodingVersionForKey:", CFSTR("version")));
  v6 = v5;

  return v6;
}

- (VNEspressoModelImageprint)initWithCoder:(id)a3 forCodingVersion:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  unint64_t v11;
  VNEspressoModelImageprint *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  char v20;
  VNEspressoModelImageprint *v21;
  uint64_t v22;
  NSString *version;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v39 = 0;
  LOBYTE(v4) = objc_msgSend((id)objc_opt_class(), "isSupportedCodingVersion:error:", v4, &v39);
  v7 = v39;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("algorithmVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("request"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      if ((objc_msgSend(v6, "containsValueForKey:", CFSTR("request")) & 1) != 0)
      {
        v12 = 0;
LABEL_38:

        goto LABEL_39;
      }
      v38 = 0;
      objc_msgSend((id)objc_opt_class(), "originatingRequestSpecifierForRequestRevision:error:", objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("requestRevision")), &v38);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v38;
      v9 = v25;
      if (!v24)
      {
        objc_msgSend(v6, "failWithError:", v25);
        v12 = 0;
LABEL_37:

        goto LABEL_38;
      }

      v9 = (void *)v24;
    }
    v10 = objc_msgSend(v6, "containsValueForKey:", CFSTR("f16Desc"));
    if ((v10 & 1) != 0)
      v11 = 1;
    else
      v11 = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("elementsType"));
    v13 = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("elementCount"));
    if (objc_msgSend(v6, "containsValueForKey:", CFSTR("descriptorByteLength")))
      v14 = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("descriptorByteLength"));
    else
      v14 = 0;
    if (v11 == 1)
      v15 = v10;
    else
      v15 = 0;
    if ((v15 & 1) != 0)
    {
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("f16Desc"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "length") != 2 * v13)
      {
        v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The '%@' data is not the expected length of %lu"), CFSTR("f16Desc"), 2 * v13);
        +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", v19);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "failWithError:", v26);

        v12 = 0;
LABEL_35:

        goto LABEL_36;
      }
      v35 = v8;
      v37 = 0;
      VNFloat32DataForFloat16Data(v16, &v37);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v37;
      v19 = v18;
      if (!v17)
      {
        objc_msgSend(v6, "failWithError:", v18);
        v12 = 0;
        goto LABEL_34;
      }
      v14 = 4 * v13;

      v33 = 1;
      if (!(4 * v13))
        goto LABEL_19;
    }
    else
    {
      v35 = v8;
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("descriptorData"));
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", CFSTR("descriptor data is unavailable"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v35;
        objc_msgSend(v6, "failWithError:", v16);
        v12 = 0;
LABEL_36:

        goto LABEL_37;
      }
      v33 = 0;
      if (!v14)
      {
LABEL_19:
        +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", CFSTR("descriptor length is unavailable"));
        v19 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "failWithError:", v19);
        goto LABEL_31;
      }
    }
    v36 = 0;
    v20 = objc_msgSend((id)objc_opt_class(), "validateDescriptorData:elementType:elementCount:error:", v17, v11, v13, &v36);
    v19 = v36;
    if ((v20 & 1) == 0)
      objc_msgSend(v6, "failWithError:", v19);
    v21 = -[VNEspressoModelImageprint initWithDescriptorData:elementType:elementCount:originatingRequestSpecifier:](self, "initWithDescriptorData:elementType:elementCount:originatingRequestSpecifier:", v17, v11, v13, v9);
    if (v21)
    {
      v21->_serializationOptions = v33;
      v22 = objc_msgSend(v35, "copy");
      version = v21->_version;
      v21->_version = (NSString *)v22;

      self = v21;
      v16 = (void *)v17;
      v12 = self;
LABEL_34:
      v8 = v35;
      goto LABEL_35;
    }
    v27 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    VNElementTypeToString(v11);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v27, "initWithFormat:", CFSTR("unable to create a %@ %@ %@ descriptor with length %@"), v9, v34, v28, v29);

    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "failWithError:", v31);

    self = 0;
LABEL_31:
    v12 = 0;
    v16 = (void *)v17;
    goto LABEL_34;
  }
  objc_msgSend(v6, "failWithError:", v7);
  v12 = 0;
LABEL_39:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSData *descriptorData;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "vn_encodeCodingVersion:forKey:", objc_msgSend((id)objc_opt_class(), "currentCodingVersion"), CFSTR("version"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_originatingRequestSpecifier, CFSTR("request"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_version, CFSTR("algorithmVersion"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_elementCount, CFSTR("elementCount"));
  if (self->_elementType == 1 && (self->_serializationOptions & 1) != 0)
  {
    descriptorData = self->_descriptorData;
    v8 = 0;
    VNFloat16DataForFloat32Data(descriptorData, &v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (v6)
    {
      objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("f16Desc"));

    }
    else
    {
      objc_msgSend(v4, "failWithError:", v7);
    }

  }
  else
  {
    objc_msgSend(v4, "encodeInteger:forKey:");
    objc_msgSend(v4, "encodeObject:forKey:", self->_descriptorData, CFSTR("descriptorData"));
    objc_msgSend(v4, "encodeInteger:forKey:", -[NSData length](self->_descriptorData, "length"), CFSTR("descriptorByteLength"));
  }

}

- (unint64_t)serializedLength
{
  return -[NSData length](self->_descriptorData, "length") + 44;
}

- (unint64_t)_VNEspressoModelImageprintSerializedLength
{
  uint64_t (*v3)(VNEspressoModelImageprint *, char *);

  v3 = (uint64_t (*)(VNEspressoModelImageprint *, char *))objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", sel_serializedLength);
  return v3(self, sel_serializedLength);
}

- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  const void *v13;
  size_t v14;
  unint64_t v15;
  _OWORD *v16;
  __int128 v17;
  void *v18;
  _BYTE v20[28];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(objc_retainAutorelease(v8), "mutableBytes");
    *(_DWORD *)&v20[16] = 0;
    *(_QWORD *)&v20[20] = 0;
    *(_DWORD *)v20 = objc_msgSend((id)objc_opt_class(), "serializationMagicNumber");
    *(_QWORD *)&v20[8] = -[VNEspressoModelImageprint serializedLength](self, "serializedLength");
    *(_DWORD *)&v20[4] = objc_msgSend((id)objc_opt_class(), "currentSerializationVersion");
    -[VNEspressoModelImageprint originatingRequestSpecifier](self, "originatingRequestSpecifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(v10 + a4 + 28) = objc_msgSend(v11, "requestRevision");
    v12 = a4 + v10;
    *(_DWORD *)(a4 + v10 + 32) = objc_msgSend(v11, "requestClassCode");
    *(_DWORD *)(v12 + 36) = -[VNEspressoModelImageprint lengthInBytes](self, "lengthInBytes");
    *(_DWORD *)(v12 + 40) = self->_elementCount;
    v13 = -[NSData bytes](self->_descriptorData, "bytes");
    v14 = -[NSData length](self->_descriptorData, "length");
    memcpy((void *)(v10 + a4 + 44), v13, v14);
    v15 = v14 + 44;
    if (v15 == -[VNEspressoModelImageprint _VNEspressoModelImageprintSerializedLength](self, "_VNEspressoModelImageprintSerializedLength"))
    {
      v16 = (_OWORD *)(v10 + a4);
      calculateChecksumMD5((char *)(v10 + a4 + 28), v15 - 28, &v20[12]);
      v17 = *(_OWORD *)v20;
      *(_OWORD *)((char *)v16 + 12) = *(_OWORD *)&v20[12];
      *v16 = v17;
    }
    else
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected size of serialized state of the object of type %@"), objc_opt_class());
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v18);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v15 = 0;
    }

  }
  else if (a5)
  {
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, CFSTR("state cannot be nil"));
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)serializeStateAndReturnError:(id *)a3
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", -[VNEspressoModelImageprint serializedLength](self, "serializedLength"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VNEspressoModelImageprint serializeStateIntoData:startingAtByteOffset:error:](self, "serializeStateIntoData:startingAtByteOffset:error:", v5, 0, a3))
  {
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (VNEspressoModelImageprint)initWithState:(id)a3 error:(id *)a4
{
  uint64_t v5;

  v5 = 0;
  return -[VNEspressoModelImageprint initWithState:byteOffset:error:](self, "initWithState:byteOffset:error:", a3, &v5, a4);
}

- (VNEspressoModelImageprint)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  _OWORD *v13;
  unint64_t v14;
  VNEspressoModelImageprint *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  size_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  int v29;
  unint64_t v30;
  void *v31;
  id v32;
  VNEspressoModelImageprint *v33;
  void *v34;
  unsigned int v35;
  void *v36;
  _QWORD v37[2];
  _BYTE v38[28];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (!v8)
  {
    if (a5)
    {
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, CFSTR("State cannot be nil"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_17:
    v16 = 0;
    goto LABEL_18;
  }
  if ((unint64_t)objc_msgSend(v8, "length") > 0x1B)
  {
    v11 = objc_msgSend(objc_retainAutorelease(v9), "bytes");
    v12 = *a4;
    v13 = (_OWORD *)(v11 + *a4);
    *(_OWORD *)v38 = *v13;
    *(_OWORD *)&v38[12] = *(_OWORD *)((char *)v13 + 12);
    *a4 = v12 + 28;
    if (objc_msgSend((id)objc_opt_class(), "serializationMagicNumber") != *(unsigned int *)v38)
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid format of %@ serialized state"), objc_opt_class());
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError errorForInvalidFormatErrorWithLocalizedDescription:](VNError, "errorForInvalidFormatErrorWithLocalizedDescription:", v17);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_17;
    }
    v14 = *(unsigned int *)&v38[8];
    calculateChecksumMD5((char *)(v11 + *a4), *(unsigned int *)&v38[8] - 28, (unsigned __int8 *)v37);
    if (*(_QWORD *)&v38[12] != v37[0] || *(_QWORD *)&v38[20] != v37[1])
    {
      if (a5)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Serialized and calculated MD5s don't match"));
        v10 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      goto LABEL_17;
    }
    v19 = *(unsigned int *)(v11 + *a4);
    *a4 += 4;
    v20 = (void *)objc_opt_class();
    v35 = *(_DWORD *)&v38[4];
    if (objc_msgSend(v20, "shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:"))
    {
      objc_msgSend((id)objc_opt_class(), "originatingRequestSpecifierForRequestRevision:error:", v19, a5);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v36)
        goto LABEL_17;
    }
    else
    {
      v21 = *(unsigned int *)(v11 + *a4);
      *a4 += 4;
      +[VNClassRegistrar classNameForClassCode:error:](VNClassRegistrar, "classNameForClassCode:error:", v21, a5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
        goto LABEL_17;
      +[VNRequestSpecifier specifierForRequestClassName:revision:error:](VNRequestSpecifier, "specifierForRequestClassName:revision:error:", v22, v19, a5);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v36)
        goto LABEL_17;
    }
    v23 = *a4;
    v24 = *(unsigned int *)(v11 + *a4);
    v25 = *a4 + 4;
    *a4 = v25;
    v26 = *(unsigned int *)(v11 + v25);
    *a4 = v23 + 8;
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v24);
    v34 = v27;
    if (v27)
    {
      v28 = objc_retainAutorelease(v27);
      memcpy((void *)objc_msgSend(v28, "mutableBytes"), (const void *)(v11 + *a4), v24);
      *a4 += v24;
      v29 = objc_msgSend((id)objc_opt_class(), "shouldIgnoreLagecyLabelsAndConfidenceForHeaderSerializationVersion:", v35);
      v30 = *a4;
      if (v29)
      {
        v30 += 241;
        *a4 = v30;
      }
      if (v30 - v12 > v14)
      {
        if (a5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected size of deserialized state of the object of type %@"), objc_opt_class(), v34);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v31);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_39;
      }
      if (objc_msgSend((id)objc_opt_class(), "validateDescriptorData:elementType:elementCount:error:", v28, 1, v26, a5))
      {
        v33 = -[VNEspressoModelImageprint initWithDescriptorData:elementType:elementCount:originatingRequestSpecifier:](self, "initWithDescriptorData:elementType:elementCount:originatingRequestSpecifier:", v28, 1, v26, v36);
        if (v33)
        {
          self = v33;
          v16 = self;
          goto LABEL_40;
        }
        if (a5)
        {
          +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Failed to initialize 'print' object"));
          v32 = (id)objc_claimAutoreleasedReturnValue();
          self = 0;
          goto LABEL_32;
        }
        self = 0;
      }
    }
    else if (a5)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Memory allocation failure"));
      v32 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:
      v16 = 0;
      *a5 = v32;
LABEL_40:

      goto LABEL_18;
    }
LABEL_39:
    v16 = 0;
    goto LABEL_40;
  }
  if (!a5)
    goto LABEL_17;
  +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("Invalid input data to de-serialize a print object"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
  v16 = 0;
  *a5 = v10;
LABEL_18:

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;

  -[VNEspressoModelImageprint originatingRequestSpecifier](self, "originatingRequestSpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[VNEspressoModelImageprint descriptorData](self, "descriptorData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  v7 = -[VNEspressoModelImageprint elementCount](self, "elementCount");
  v8 = -[VNEspressoModelImageprint lengthInBytes](self, "lengthInBytes");
  -[VNEspressoModelImageprint labelsAndConfidence](self, "labelsAndConfidence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash") ^ __ROR8__(v8 ^ __ROR8__(v7 ^ __ROR8__(v6 ^ __ROR8__(v4, 51), 51), 51), 51);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  VNEspressoModelImageprint *v4;
  VNEspressoModelImageprint *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (VNEspressoModelImageprint *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNEspressoModelImageprint originatingRequestSpecifier](self, "originatingRequestSpecifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNEspressoModelImageprint originatingRequestSpecifier](v5, "originatingRequestSpecifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if ((v8 & 1) == 0)
        goto LABEL_10;
      -[VNEspressoModelImageprint descriptorData](self, "descriptorData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNEspressoModelImageprint descriptorData](v5, "descriptorData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = VisionCoreEqualOrNilObjects();

      if ((v11 & 1) == 0)
        goto LABEL_10;
      v12 = -[VNEspressoModelImageprint elementCount](self, "elementCount");
      if (v12 == -[VNEspressoModelImageprint elementCount](v5, "elementCount")
        && (v13 = -[VNEspressoModelImageprint lengthInBytes](self, "lengthInBytes"),
            v13 == -[VNEspressoModelImageprint lengthInBytes](v5, "lengthInBytes")))
      {
        -[VNEspressoModelImageprint labelsAndConfidence](self, "labelsAndConfidence");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNEspressoModelImageprint labelsAndConfidence](v5, "labelsAndConfidence");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = VisionCoreEqualOrNilObjects();

      }
      else
      {
LABEL_10:
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (BOOL)hasEquivalentDescriptorToImageprint:(id)a3
{
  VNEspressoModelImageprint *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;

  v4 = (VNEspressoModelImageprint *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    v5 = (void *)objc_opt_class();
    if ((objc_msgSend(v5, "isEqual:", objc_opt_class()) & 1) == 0)
      goto LABEL_7;
    -[VNEspressoModelImageprint originatingRequestSpecifier](self, "originatingRequestSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNEspressoModelImageprint originatingRequestSpecifier](v4, "originatingRequestSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "hasModelEquivalencyToRequestSpecifier:", v7);

    if ((v8 & 1) == 0)
      goto LABEL_7;
    -[VNEspressoModelImageprint descriptorData](self, "descriptorData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNEspressoModelImageprint descriptorData](v4, "descriptorData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = VisionCoreEqualOrNilObjects();

    if ((v11 & 1) == 0)
      goto LABEL_7;
    v12 = -[VNEspressoModelImageprint elementCount](self, "elementCount");
    if (v12 == -[VNEspressoModelImageprint elementCount](v4, "elementCount"))
    {
      v13 = -[VNEspressoModelImageprint lengthInBytes](self, "lengthInBytes");
      v14 = v13 == -[VNEspressoModelImageprint lengthInBytes](v4, "lengthInBytes");
    }
    else
    {
LABEL_7:
      v14 = 0;
    }
  }

  return v14;
}

- (id)computeDistance:(id)a3 withDistanceFunction:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  uint64_t *v23;
  int v24;
  uint64_t v25;
  float *v26;
  uint64_t v27;
  int v28;

  v8 = a3;
  -[VNEspressoModelImageprint descriptorData](self, "descriptorData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "descriptorData");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (!v9 || !v10)
  {
    if (a5)
    {
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, CFSTR("nil VNEspressoModelImageprint(s) supplied"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
  v12 = objc_msgSend(v9, "length");
  if (v12 != objc_msgSend(v11, "length"))
  {
    if (a5)
    {
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, CFSTR("VNEspressoModelImageprint(s) with different length supplied"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (!-[VNEspressoModelImageprint isPrint:compatibleWithOtherPrint:error:](self, "isPrint:compatibleWithOtherPrint:error:", self, v8, a5))goto LABEL_14;
  if (!a4)
  {
    LODWORD(a4) = 2;
    goto LABEL_17;
  }
  if (a4 == 1)
  {
LABEL_17:
    v25 = 0;
    v26 = (float *)&v25;
    v27 = 0x2020000000;
    v28 = 2139095040;
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __72__VNEspressoModelImageprint_computeDistance_withDistanceFunction_error___block_invoke;
    v20 = &unk_1E45457D0;
    v21 = v9;
    v24 = a4;
    v22 = v11;
    v23 = &v25;
    v16 = _Block_copy(&v17);
    if ((VNExecuteBlock(v16, (uint64_t)a5) & 1) == 0)
      goto LABEL_21;
    if (v26[6] != INFINITY)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17, v18, v19, v20, v21);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    if (a5)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("could not compute faceprint distance"), v17, v18, v19, v20, v21);
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_21:
      v14 = 0;
    }
LABEL_23:

    _Block_object_dispose(&v25, 8);
    goto LABEL_15;
  }
  if (!a5)
    goto LABEL_14;
  +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, CFSTR("Unknown distance funtion requested"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  v14 = 0;
  *a5 = v13;
LABEL_15:

  return v14;
}

- (BOOL)isPrint:(id)a3 compatibleWithOtherPrint:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "originatingRequestSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "originatingRequestSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "hasModelEquivalencyToRequestSpecifier:", v10);

  if (a5)
    v12 = v11;
  else
    v12 = 1;
  if ((v12 & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "originatingRequestSpecifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "originatingRequestSpecifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("cannot compare prints of %@ and %@"), v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[VNError errorForInvalidOptionWithLocalizedDescription:](VNError, "errorForInvalidOptionWithLocalizedDescription:", v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)description
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[VNEspressoModelImageprint version](self, "version");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VNEspressoModelImageprint elementCount](self, "elementCount");
  VNElementTypeToString(-[VNEspressoModelImageprint elementType](self, "elementType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VNEspressoModelImageprint lengthInBytes](self, "lengthInBytes");
  v8 = -[VNEspressoModelImageprint confidenceScoreType](self, "confidenceScoreType");
  -[VNEspressoModelImageprint originatingRequestSpecifier](self, "originatingRequestSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Espresso print: version = %@; element count = %lu; element type = %@; length in bytes = %lu; confidence score type = %lu; originating request specifier = %@"),
                  v4,
                  v5,
                  v6,
                  v7,
                  v8,
                  v9);

  return v10;
}

- (NSData)descriptorData
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)elementCount
{
  return self->_elementCount;
}

- (unint64_t)confidenceScoreType
{
  return self->_confidenceScoreType;
}

- (NSString)version
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

uint64_t __72__VNEspressoModelImageprint_computeDistance_withDistanceFunction_error___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  unint64_t v4;
  _QWORD *v5;
  void *v6;
  unint64_t v7;
  _QWORD *v9[3];
  void *v10[13];
  int v11;
  void *v12;
  void *v13[13];
  int v14;
  void *v15;

  v2 = operator new(8uLL);
  *v2 = 1;
  v10[1] = v2 + 1;
  v10[2] = v2 + 1;
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes");
  v4 = objc_msgSend(*(id *)(a1 + 32), "length");
  vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)v13, (_QWORD **)v10, v3, v4, 1, 0);
  v14 = 1;
  v15 = 0;
  v13[0] = &off_1E453A8D0;
  v13[12] = (void *)(v4 >> 2);
  operator delete(v2);
  v14 = *(_DWORD *)(a1 + 56);
  v5 = operator new(8uLL);
  *v5 = 1;
  v9[1] = v5 + 1;
  v9[2] = v5 + 1;
  v9[0] = v5;
  v6 = (void *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes");
  v7 = objc_msgSend(*(id *)(a1 + 40), "length");
  vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)v10, v9, v6, v7, 1, 0);
  v11 = 1;
  v12 = 0;
  v10[0] = &off_1E453A8D0;
  v10[12] = (void *)(v7 >> 2);
  operator delete(v5);
  v11 = *(_DWORD *)(a1 + 56);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = vision::mod::ImageDescriptorBufferFloat32::computeDistanceFrom((vision::mod::ImageDescriptorBufferFloat32 *)v13, (const vision::mod::ImageDescriptorBufferAbstract *)v10);
  v10[0] = &off_1E453A8D0;
  free(v12);
  vision::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract(v10);
  v13[0] = &off_1E453A8D0;
  free(v15);
  vision::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract(v13);
  return 1;
}

+ (unint64_t)confidenceTypeForOriginatingRequestSpecifier:(id)a3
{
  return 0;
}

+ (id)printWithDescriptorData:(id)a3 elementType:(unint64_t)a4 elementCount:(unint64_t)a5 originatingRequestSpecifier:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;

  v12 = a3;
  v13 = a6;
  if ((objc_msgSend(a1, "validateDescriptorData:elementType:elementCount:error:", v12, a4, a5, a7) & 1) != 0)
    v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptorData:elementType:elementCount:originatingRequestSpecifier:", v12, a4, a5, v13);
  else
    v14 = 0;

  return v14;
}

+ (id)printWithFloat16PrecisionFloat32Values:(const float *)a3 elementCount:(unint64_t)a4 originatingRequestSpecifier:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;

  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", a3, 4 * a4, 0);
  objc_msgSend(a1, "printWithFloat16PrecisionFloat32Data:originatingRequestSpecifier:error:", v11, v10, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)printWithFloat16PrecisionFloat32Data:(id)a3 originatingRequestSpecifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  _QWORD *v15;
  void *v16;
  _QWORD *v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  VNFloat16DataForFloat32Data(v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    VNFloat32DataForFloat16Data(v10, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = (unint64_t)objc_msgSend(v12, "length") >> 2;
      objc_msgSend(a1, "printWithDescriptorData:elementType:elementCount:originatingRequestSpecifier:error:", v13, 1, v14, v9, a5);
      v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        v15[3] |= 1uLL;
        v17 = v15;
      }
      else if (a5)
      {
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unable to create float16 descriptor with %lu elements"), v14);
        +[VNError errorForInternalErrorWithLocalizedDescription:underlyingError:](VNError, "errorForInternalErrorWithLocalizedDescription:underlyingError:", v18, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)printFromEspressoBuffer:(id *)a3 originatingRequestSpecifier:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  v8 = a4;
  if (a3->var7 == 1)
  {
    if (a3->var14 == 65568)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3->var0, 4 * a3->var13);
      v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptorData:elementType:elementCount:originatingRequestSpecifier:", v9, 1, a3->var13, v8);
      v11 = v10;
      if (v10)
      {
        v12 = v10;
      }
      else if (a5)
      {
        v16 = objc_alloc(MEMORY[0x1E0CB3940]);
        NSStringFromClass((Class)a1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("Unable to create %@ from %ld element float data %p"), v17, a3->var13, a3->var0);

        +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", v18);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_14;
    }
    if (a5)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unsupported element storage type of 0x%04X"), a3->var14);
      +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else if (a5)
  {
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    NSStringFromClass((Class)a1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("Unable to create %@ from from a tensor buffer of dimension [%lu %lu %lu %lu]"), v14, a3->var7, a3->var6, a3->var5, a3->var4);

    +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v11 = 0;
    *a5 = v15;
LABEL_14:

    goto LABEL_15;
  }
  v11 = 0;
LABEL_15:

  return v11;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  +[VNError VNAssertClass:needsToOverrideMethod:](VNError, "VNAssertClass:needsToOverrideMethod:", objc_opt_class(), a2);
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:(unsigned int)a3
{
  return 0;
}

+ (BOOL)shouldIgnoreLagecyLabelsAndConfidenceForHeaderSerializationVersion:(unsigned int)a3
{
  return 0;
}

+ (BOOL)isSupportedCodingVersion:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;

  v5 = *(_QWORD *)&a3;
  if (!+[VisionCoreRuntimeUtilities item:overridesSelector:](VNRuntimeUtilities, "item:overridesSelector:", a1, a2)&& objc_msgSend(a1, "currentCodingVersion") >= v5)
  {
    return 1;
  }
  if (a4)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    NSStringFromClass((Class)a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@ does not support a coding version of %u"), v8, v5);

    +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (id)_VNEspressoModelImageprintMLMultiArrayWithDataType:(int64_t)a3 shape:(id)a4 strides:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  size_t v26;
  double *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t aBlock;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  void *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v10 = a4;
  v11 = a5;
  if (-[VNEspressoModelImageprint elementType](self, "elementType") == 1)
  {
    -[VNEspressoModelImageprint descriptorData](self, "descriptorData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v10;
    v14 = v11;
    v15 = v12;
    v16 = v15;
    if (self)
    {
      switch(a3)
      {
        case 65552:
          VNFloat16DataForFloat32Data(v15, a6);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v22)
          {
            v37 = 0;
            v38 = &v37;
            v39 = 0x3032000000;
            v40 = __Block_byref_object_copy__20258;
            v41 = __Block_byref_object_dispose__20259;
            v24 = v22;
            v42 = v24;
            aBlock = MEMORY[0x1E0C809B0];
            v33 = 3221225472;
            v34 = __137__VNEspressoModelImageprint_VNCoreMLTransformer___VNEspressoModelImageprintMLMultiArrayWithDataType_shape_strides_fromFloat32Data_error___block_invoke_2;
            v35 = &unk_1E4546500;
            v36 = &v37;
            v25 = _Block_copy(&aBlock);
            v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E970]), "initWithDataPointer:shape:dataType:strides:deallocator:error:", objc_msgSend(objc_retainAutorelease(v24), "bytes"), v13, 65552, v14, v25, a6);

            _Block_object_dispose(&v37, 8);
          }
          else
          {
            v19 = 0;
          }

          goto LABEL_18;
        case 65600:
          v26 = (unint64_t)objc_msgSend(v15, "length") >> 2;
          v27 = (double *)malloc_type_calloc(8uLL, v26, 0x2B955FCAuLL);
          vDSP_vspdp((const float *)objc_msgSend(objc_retainAutorelease(v16), "bytes"), 1, v27, 1, v26);
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E970]), "initWithDataPointer:shape:dataType:strides:deallocator:error:", v27, v13, 65600, v14, &__block_literal_global_20260, a6);
          goto LABEL_18;
        case 65568:
          v37 = 0;
          v38 = &v37;
          v39 = 0x3032000000;
          v40 = __Block_byref_object_copy__20258;
          v41 = __Block_byref_object_dispose__20259;
          v17 = v15;
          v42 = v17;
          aBlock = MEMORY[0x1E0C809B0];
          v33 = 3221225472;
          v34 = __137__VNEspressoModelImageprint_VNCoreMLTransformer___VNEspressoModelImageprintMLMultiArrayWithDataType_shape_strides_fromFloat32Data_error___block_invoke;
          v35 = &unk_1E4546500;
          v36 = &v37;
          v18 = _Block_copy(&aBlock);
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E970]), "initWithDataPointer:shape:dataType:strides:deallocator:error:", objc_msgSend(objc_retainAutorelease(v17), "bytes"), v13, 65568, v14, v18, a6);

          _Block_object_dispose(&v37, 8);
LABEL_18:

          goto LABEL_19;
      }
      if (a6)
      {
        v28 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(MEMORY[0x1E0C9E990], "stringForDataType:", a3);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v28, "initWithFormat:", CFSTR("%@ cannot be represented as %@"), self, v29);

        +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v30);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v19 = 0;
    goto LABEL_18;
  }
  if (a6)
  {
    v20 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0C9E990], "stringForDataType:", a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("%@ cannot be represented as %@"), self, v21);

    +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v16);
    v19 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

    goto LABEL_20;
  }
  v19 = 0;
LABEL_20:

  return v19;
}

- (id)VNEspressoModelImageprintMLMultiArrayWithConstraint:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (a4)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ cannot be represented as %@"), self, v6);
    +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", v7);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (id)VNEspressoModelImageprintOneDimensionMLMultiArrayWithDataType:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VNEspressoModelImageprint elementCount](self, "elementCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[VNEspressoModelImageprint _VNEspressoModelImageprintMLMultiArrayWithDataType:shape:strides:error:](self, "_VNEspressoModelImageprintMLMultiArrayWithDataType:shape:strides:error:", a3, v8, &unk_1E459E1C8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __137__VNEspressoModelImageprint_VNCoreMLTransformer___VNEspressoModelImageprintMLMultiArrayWithDataType_shape_strides_fromFloat32Data_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  if (objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)), "bytes") == a2)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
}

void __137__VNEspressoModelImageprint_VNCoreMLTransformer___VNEspressoModelImageprintMLMultiArrayWithDataType_shape_strides_fromFloat32Data_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  if (objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)), "bytes") == a2)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
}

void __137__VNEspressoModelImageprint_VNCoreMLTransformer___VNEspressoModelImageprintMLMultiArrayWithDataType_shape_strides_fromFloat32Data_error___block_invoke_3(int a1, void *a2)
{
  free(a2);
}

+ (id)printFromCSUBuffer:(id)a3 originatingRequestSpecifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v7 = a3;
  v8 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__29_23236;
  v17 = __Block_byref_object_dispose__30_23237;
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __116__VNEspressoModelImageprint_VNCoreSceneUnderstandingDetector__printFromCSUBuffer_originatingRequestSpecifier_error___block_invoke;
  v12[3] = &unk_1E4546E38;
  v12[4] = &v13;
  v12[5] = &v19;
  objc_msgSend(v7, "accessDataUsingBlock:", v12);
  v9 = objc_alloc((Class)a1);
  v10 = (void *)objc_msgSend(v9, "initWithDescriptorData:elementType:elementCount:originatingRequestSpecifier:", v14[5], 1, v20[3], v8);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __116__VNEspressoModelImageprint_VNCoreSceneUnderstandingDetector__printFromCSUBuffer_originatingRequestSpecifier_error___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a2, a3);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3 >> 2;
}

@end
