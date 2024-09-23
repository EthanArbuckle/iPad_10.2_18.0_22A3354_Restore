@implementation VN6B8mkraBUpwUqskMYPtS3

- (VN6B8mkraBUpwUqskMYPtS3)initWithData:(const void *)a3 elementCount:(unint64_t)a4 elementType:(unint64_t)a5 lengthInBytes:(unint64_t)a6 imageSignatureHashType:(unint64_t)a7 requestRevision:(unint64_t)a8
{
  VN6B8mkraBUpwUqskMYPtS3 *result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VN6B8mkraBUpwUqskMYPtS3;
  result = -[VNEspressoModelImageprint initWithData:elementCount:elementType:lengthInBytes:requestRevision:](&v10, sel_initWithData_elementCount_elementType_lengthInBytes_requestRevision_, a3, a4, a5, a6, a8);
  result->_imageSignatureHashType = a7;
  return result;
}

- (VN6B8mkraBUpwUqskMYPtS3)initWithCoder:(id)a3
{
  id v4;
  VN6B8mkraBUpwUqskMYPtS3 *v5;
  VN6B8mkraBUpwUqskMYPtS3 *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VN6B8mkraBUpwUqskMYPtS3;
  v5 = -[VNEspressoModelImageprint initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_imageSignatureHashType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sgnHash"));
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
  v5.super_class = (Class)VN6B8mkraBUpwUqskMYPtS3;
  -[VNEspressoModelImageprint encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_imageSignatureHashType, CFSTR("sgnHash"));

}

- (VN6B8mkraBUpwUqskMYPtS3)initWithState:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VN6B8mkraBUpwUqskMYPtS3;
  return -[VNEspressoModelImageprint initWithState:error:](&v5, sel_initWithState_error_, a3, a4);
}

- (VN6B8mkraBUpwUqskMYPtS3)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5
{
  id v8;
  VN6B8mkraBUpwUqskMYPtS3 *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VN6B8mkraBUpwUqskMYPtS3;
  v9 = -[VNEspressoModelImageprint initWithState:byteOffset:error:](&v14, sel_initWithState_byteOffset_error_, v8, a4, a5);
  if (!v9)
    goto LABEL_6;
  v10 = *(unsigned int *)(objc_msgSend(objc_retainAutorelease(v8), "bytes") + *a4);
  *a4 += 4;
  v9->_imageSignatureHashType = v10;
  v11 = *a4;
  if (v11 != -[VN6B8mkraBUpwUqskMYPtS3 serializedLength](v9, "serializedLength"))
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

  return (VN6B8mkraBUpwUqskMYPtS3 *)a5;
}

- (unint64_t)serializedLength
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VN6B8mkraBUpwUqskMYPtS3;
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
  v14.super_class = (Class)VN6B8mkraBUpwUqskMYPtS3;
  v9 = -[VNEspressoModelImageprint serializeStateIntoData:startingAtByteOffset:error:](&v14, sel_serializeStateIntoData_startingAtByteOffset_error_, v8, a4, a5);
  if (!v9)
  {
LABEL_6:
    v11 = 0;
    goto LABEL_7;
  }
  v10 = objc_msgSend(objc_retainAutorelease(v8), "mutableBytes");
  *(_DWORD *)&v9[a4 + v10] = self->_imageSignatureHashType;
  v11 = (unint64_t)(v9 + 4);
  if (v9 + 4 != (char *)-[VN6B8mkraBUpwUqskMYPtS3 serializedLength](self, "serializedLength"))
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

- (id)encodeHashDescriptorWithBase64EncodingAndReturnError:(id *)a3
{
  id v5;
  float *v6;
  id v7;
  void *p_p;
  uint64_t v9;
  void *v10;
  void *v11;
  void *__p;
  uint64_t v14;
  uint64_t v15;

  if (-[VN6B8mkraBUpwUqskMYPtS3 imageSignatureHashType](self, "imageSignatureHashType") == 1)
  {
    __p = 0;
    v14 = 0;
    v15 = 0;
    -[VNEspressoModelImageprint descriptorData](self, "descriptorData");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (float *)objc_msgSend(v5, "bytes");

    if (v6)
    {
      vision::mod::ImageDescriptorProcessorHasher::base64EncodeHash(v6, -[VNEspressoModelImageprint elementCount](self, "elementCount"), 1, (uint64_t)&__p);
      v7 = objc_alloc(MEMORY[0x1E0C99D50]);
      if (v15 >= 0)
        p_p = &__p;
      else
        p_p = __p;
      if (v15 >= 0)
        v9 = HIBYTE(v15);
      else
        v9 = v14;
      v10 = (void *)objc_msgSend(v7, "initWithBytes:length:", p_p, v9);
      if (SHIBYTE(v15) < 0)
        operator delete(__p);
      return v10;
    }
    if (a3)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Cannot encode null-print object "));
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
  }
  else if (a3)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Cannot calculate encoding for hash type: %lu"), -[VN6B8mkraBUpwUqskMYPtS3 imageSignatureHashType](self, "imageSignatureHashType"));
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  v10 = 0;
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  VN6B8mkraBUpwUqskMYPtS3 *v4;
  unint64_t v5;
  BOOL v6;
  objc_super v8;

  v4 = (VN6B8mkraBUpwUqskMYPtS3 *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v8.receiver = self,
          v8.super_class = (Class)VN6B8mkraBUpwUqskMYPtS3,
          -[VNEspressoModelImageprint isEqual:](&v8, sel_isEqual_, v4)))
    {
      v5 = -[VN6B8mkraBUpwUqskMYPtS3 imageSignatureHashType](self, "imageSignatureHashType");
      v6 = v5 == -[VN6B8mkraBUpwUqskMYPtS3 imageSignatureHashType](v4, "imageSignatureHashType");
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
  v3.super_class = (Class)VN6B8mkraBUpwUqskMYPtS3;
  return COERCE_UNSIGNED_INT((float)-[VN6B8mkraBUpwUqskMYPtS3 imageSignatureHashType](self, "imageSignatureHashType")) ^ __ROR8__(-[VNEspressoModelImageprint hash](&v3, sel_hash), 51);
}

- (unint64_t)imageSignatureHashType
{
  return self->_imageSignatureHashType;
}

- (void)setImageSignatureHashType:(unint64_t)a3
{
  self->_imageSignatureHashType = a3;
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
  return 3514433552;
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

@end
