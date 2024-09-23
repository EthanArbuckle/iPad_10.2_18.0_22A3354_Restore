@implementation VN6Ac6Cyl5O5oK19HboyMBR

- (VN6Ac6Cyl5O5oK19HboyMBR)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 imageSignatureprintType:(unint64_t)a7 originatingRequestSpecifier:(id)a8
{
  id v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  VN6Ac6Cyl5O5oK19HboyMBR *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  VN6Ac6Cyl5O5oK19HboyMBR *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  objc_super v36;
  id v37;

  v14 = a8;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3, a6);
  v37 = 0;
  v16 = objc_msgSend((id)objc_opt_class(), "validateDescriptorData:elementType:elementCount:error:", v15, a5, a4, &v37);
  v17 = v37;
  v18 = v17;
  if ((v16 & 1) == 0)
  {
    objc_msgSend(v17, "localizedDescription");
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28 = objc_msgSend(v27, "UTF8String");
    VNValidatedLog(4, (uint64_t)CFSTR("%s"), v29, v30, v31, v32, v33, v34, v28);

LABEL_7:
    v26 = 0;
    goto LABEL_8;
  }
  v36.receiver = self;
  v36.super_class = (Class)VN6Ac6Cyl5O5oK19HboyMBR;
  v19 = -[VNEspressoModelImageprint initWithDescriptorData:elementType:elementCount:originatingRequestSpecifier:](&v36, sel_initWithDescriptorData_elementType_elementCount_originatingRequestSpecifier_, v15, a5, a4, v14);
  if (!v19)
  {
    self = 0;
    goto LABEL_7;
  }
  if ((objc_msgSend((id)objc_opt_class(), "_signaturePrintTypeSupported:", a7) & 1) != 0)
  {
    v19->_imageSignatureprintType = a7;
    self = v19;
    v26 = self;
  }
  else
  {
    VNValidatedLog(4, (uint64_t)CFSTR("unsupported signature print type %lu"), v20, v21, v22, v23, v24, v25, a7);
    v26 = 0;
    self = v19;
  }
LABEL_8:

  return v26;
}

- (VN6Ac6Cyl5O5oK19HboyMBR)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 imageSignatureprintType:(unint64_t)a7 requestRevision:(unint64_t)a8
{
  void *v14;
  VN6Ac6Cyl5O5oK19HboyMBR *v15;

  objc_msgSend((id)objc_opt_class(), "originatingRequestSpecifierForRequestRevision:error:", a8, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    self = -[VN6Ac6Cyl5O5oK19HboyMBR initWithData:elementCount:elementType:lengthInBytes:imageSignatureprintType:originatingRequestSpecifier:](self, "initWithData:elementCount:elementType:lengthInBytes:imageSignatureprintType:originatingRequestSpecifier:", a3, a4, a5, a6, a7, v14);
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (VN6Ac6Cyl5O5oK19HboyMBR)initWithCoder:(id)a3
{
  id v4;
  VN6Ac6Cyl5O5oK19HboyMBR *v5;
  VN6Ac6Cyl5O5oK19HboyMBR *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VN6Ac6Cyl5O5oK19HboyMBR;
  v5 = -[VNEspressoModelImageprint initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_imageSignatureprintType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sgnPrnt"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VN6Ac6Cyl5O5oK19HboyMBR;
  -[VNEspressoModelImageprint encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_imageSignatureprintType, CFSTR("sgnPrnt"));

}

- (VN6Ac6Cyl5O5oK19HboyMBR)initWithState:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VN6Ac6Cyl5O5oK19HboyMBR;
  return -[VNEspressoModelImageprint initWithState:error:](&v5, sel_initWithState_error_, a3, a4);
}

- (VN6Ac6Cyl5O5oK19HboyMBR)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5
{
  id v8;
  VN6Ac6Cyl5O5oK19HboyMBR *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VN6Ac6Cyl5O5oK19HboyMBR;
  v9 = -[VNEspressoModelImageprint initWithState:byteOffset:error:](&v14, sel_initWithState_byteOffset_error_, v8, a4, a5);
  if (!v9)
    goto LABEL_6;
  v10 = *(unsigned int *)(objc_msgSend(objc_retainAutorelease(v8), "bytes") + *a4);
  *a4 += 4;
  v9->_imageSignatureprintType = v10;
  v11 = *a4;
  if (v11 != -[VN6Ac6Cyl5O5oK19HboyMBR serializedLength](v9, "serializedLength"))
  {
    if (!a5)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error deserializing object of type %@"), objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
    a5 = 0;
    goto LABEL_7;
  }
  a5 = v9;
LABEL_7:

  return (VN6Ac6Cyl5O5oK19HboyMBR *)a5;
}

- (unint64_t)serializedLength
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VN6Ac6Cyl5O5oK19HboyMBR;
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
  v14.super_class = (Class)VN6Ac6Cyl5O5oK19HboyMBR;
  v9 = -[VNEspressoModelImageprint serializeStateIntoData:startingAtByteOffset:error:](&v14, sel_serializeStateIntoData_startingAtByteOffset_error_, v8, a4, a5);
  if (!v9)
  {
LABEL_6:
    v11 = 0;
    goto LABEL_7;
  }
  v10 = objc_msgSend(objc_retainAutorelease(v8), "mutableBytes");
  *(_DWORD *)&v9[a4 + v10] = self->_imageSignatureprintType;
  v11 = (unint64_t)(v9 + 4);
  if (v9 + 4 != (char *)-[VN6Ac6Cyl5O5oK19HboyMBR serializedLength](self, "serializedLength"))
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
  VN6Ac6Cyl5O5oK19HboyMBR *v4;
  unint64_t v5;
  BOOL v6;
  objc_super v8;

  v4 = (VN6Ac6Cyl5O5oK19HboyMBR *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v8.receiver = self,
          v8.super_class = (Class)VN6Ac6Cyl5O5oK19HboyMBR,
          -[VNEspressoModelImageprint isEqual:](&v8, sel_isEqual_, v4)))
    {
      v5 = -[VN6Ac6Cyl5O5oK19HboyMBR imageSignatureprintType](self, "imageSignatureprintType");
      v6 = v5 == -[VN6Ac6Cyl5O5oK19HboyMBR imageSignatureprintType](v4, "imageSignatureprintType");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VN6Ac6Cyl5O5oK19HboyMBR;
  return COERCE_UNSIGNED_INT((float)-[VN6Ac6Cyl5O5oK19HboyMBR imageSignatureprintType](self, "imageSignatureprintType")) ^ __ROR8__(-[VNEspressoModelImageprint hash](&v3, sel_hash), 51);
}

- (unint64_t)imageSignatureprintType
{
  return self->_imageSignatureprintType;
}

- (void)setImageSignatureprintType:(unint64_t)a3
{
  self->_imageSignatureprintType = a3;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VN6kBnCOr2mZlSV6yV1dLwB");
}

+ (id)currentVersion
{
  return CFSTR("1.0");
}

+ (unsigned)currentCodingVersion
{
  return 1;
}

+ (unint64_t)serializationMagicNumber
{
  return 3514433537;
}

+ (unint64_t)currentSerializationVersion
{
  return 2;
}

+ (BOOL)shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:(unsigned int)a3
{
  return a3 < 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)_signaturePrintTypeSupported:(unint64_t)a3
{
  return a3 == 3;
}

@end
