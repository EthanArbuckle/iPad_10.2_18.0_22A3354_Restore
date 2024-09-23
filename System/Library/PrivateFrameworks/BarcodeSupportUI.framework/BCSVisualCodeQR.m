@implementation BCSVisualCodeQR

- (BCSVisualCodeQR)initWithBarcodeObservation:(id)a3
{
  id v5;
  BCSVisualCodeQR *v6;
  BCSVisualCodeQR *v7;
  BCSVisualCodeQR *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BCSVisualCodeQR;
  v6 = -[BCSVisualCodeQR init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_barcodeObservation, a3);
    v8 = v7;
  }

  return v7;
}

- (int64_t)codeType
{
  return 0;
}

- (CGPoint)topLeft
{
  double v2;
  double v3;
  CGPoint result;

  -[VNBarcodeObservation topLeft](self->_barcodeObservation, "topLeft");
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)topRight
{
  double v2;
  double v3;
  CGPoint result;

  -[VNBarcodeObservation topRight](self->_barcodeObservation, "topRight");
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)bottomRight
{
  double v2;
  double v3;
  CGPoint result;

  -[VNBarcodeObservation bottomRight](self->_barcodeObservation, "bottomRight");
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)bottomLeft
{
  double v2;
  double v3;
  CGPoint result;

  -[VNBarcodeObservation bottomLeft](self->_barcodeObservation, "bottomLeft");
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)payloadString
{
  return -[VNBarcodeObservation payloadStringValue](self->_barcodeObservation, "payloadStringValue");
}

- (CGRect)boundingBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[VNBarcodeObservation boundingBox](self->_barcodeObservation, "boundingBox");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  -[VNBarcodeObservation encodeWithCoder:](self->_barcodeObservation, "encodeWithCoder:", a3);
}

- (BCSVisualCodeQR)initWithCoder:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  BCSVisualCodeQR *v7;

  v4 = (objc_class *)MEMORY[0x24BDF9AE8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithCoder:", v5);

  v7 = -[BCSVisualCodeQR initWithBarcodeObservation:](self, "initWithBarcodeObservation:", v6);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barcodeObservation, 0);
}

@end
