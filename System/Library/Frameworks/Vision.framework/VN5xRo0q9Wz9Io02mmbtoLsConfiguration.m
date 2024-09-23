@implementation VN5xRo0q9Wz9Io02mmbtoLsConfiguration

- (VN5xRo0q9Wz9Io02mmbtoLsConfiguration)initWithRequestClass:(Class)a3
{
  VN5xRo0q9Wz9Io02mmbtoLsConfiguration *v3;
  VN5xRo0q9Wz9Io02mmbtoLsConfiguration *v4;
  VN6Ac6Cyl5O5oK19HboyMBR *inputSignatureprint;
  VN5xRo0q9Wz9Io02mmbtoLsConfiguration *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VN5xRo0q9Wz9Io02mmbtoLsConfiguration;
  v3 = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v8, sel_initWithRequestClass_, a3);
  v4 = v3;
  if (v3)
  {
    inputSignatureprint = v3->_inputSignatureprint;
    v3->_inputSignatureprint = 0;

    v4->_imageSignatureprintType = 0;
    v4->_imageSignatureHashType = 0;
    v6 = v4;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VN5xRo0q9Wz9Io02mmbtoLsConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setImageSignatureprintType:", self->_imageSignatureprintType);
    objc_msgSend(v5, "setImageSignatureHashType:", self->_imageSignatureHashType);
    v6 = (void *)-[VN6Ac6Cyl5O5oK19HboyMBR copy](self->_inputSignatureprint, "copy");
    objc_msgSend(v5, "setInputSignatureprint:", v6);

  }
  return v5;
}

- (unint64_t)imageSignatureprintType
{
  return self->_imageSignatureprintType;
}

- (void)setImageSignatureprintType:(unint64_t)a3
{
  self->_imageSignatureprintType = a3;
}

- (VN6Ac6Cyl5O5oK19HboyMBR)inputSignatureprint
{
  return self->_inputSignatureprint;
}

- (void)setInputSignatureprint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (unint64_t)imageSignatureHashType
{
  return self->_imageSignatureHashType;
}

- (void)setImageSignatureHashType:(unint64_t)a3
{
  self->_imageSignatureHashType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputSignatureprint, 0);
  objc_storeStrong((id *)&self->inputSignatureprint, 0);
}

@end
