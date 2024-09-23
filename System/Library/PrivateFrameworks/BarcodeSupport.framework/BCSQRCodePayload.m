@implementation BCSQRCodePayload

- (BCSQRCodePayload)initWithBarcodeDescriptor:(id)a3
{
  id v5;
  BCSQRCodePayload *v6;
  BCSQRCodePayload *v7;
  BCSQRCodePayload *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BCSQRCodePayload;
  v6 = -[BCSQRCodePayload init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_barcodeDescriptor, a3);
    v8 = v7;
  }

  return v7;
}

- (int64_t)codeType
{
  return 1;
}

- (void)savePayloadInUserActivity:(id)a3
{
  objc_msgSend(a3, "setDetectedCode:", self->_barcodeDescriptor);
}

- (BCSQRCodePayload)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  BCSQRCodePayload *v6;

  v4 = a3;
  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payloadData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[BCSQRCodePayload initWithBarcodeDescriptor:](self, "initWithBarcodeDescriptor:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_barcodeDescriptor, CFSTR("payloadData"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barcodeDescriptor, 0);
}

@end
