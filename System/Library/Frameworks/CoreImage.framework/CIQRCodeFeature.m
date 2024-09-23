@implementation CIQRCodeFeature

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CIQRCodeFeature)initWithCoder:(id)a3
{
  CIQRCodeFeature *v4;
  CIQRCodeFeature *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CIQRCodeFeature;
  v4 = -[CIFeature init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->bounds.origin.x = decodeRectForKey(a3, (uint64_t)CFSTR("bounds"));
    v5->bounds.origin.y = v6;
    v5->bounds.size.width = v7;
    v5->bounds.size.height = v8;
    v5->topLeft.x = decodePointForKey(a3, (uint64_t)CFSTR("topLeft"));
    v5->topLeft.y = v9;
    v5->topRight.x = decodePointForKey(a3, (uint64_t)CFSTR("topRight"));
    v5->topRight.y = v10;
    v5->bottomLeft.x = decodePointForKey(a3, (uint64_t)CFSTR("bottomLeft"));
    v5->bottomLeft.y = v11;
    v5->bottomRight.x = decodePointForKey(a3, (uint64_t)CFSTR("bottomRight"));
    v5->bottomRight.y = v12;
    v5->symbolDescriptor = (CIQRCodeDescriptor *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolDescriptor"));
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  encodeRectForKey(a3, (uint64_t)CFSTR("bounds"), self->bounds.origin.x, self->bounds.origin.y, self->bounds.size.width, self->bounds.size.height);
  encodePointForKey(a3, (uint64_t)CFSTR("topLeft"), self->topLeft.x);
  encodePointForKey(a3, (uint64_t)CFSTR("topRight"), self->topRight.x);
  encodePointForKey(a3, (uint64_t)CFSTR("bottomLeft"), self->bottomLeft.x);
  encodePointForKey(a3, (uint64_t)CFSTR("bottomRight"), self->bottomRight.x);
  objc_msgSend(a3, "encodeObject:forKey:", self->symbolDescriptor, CFSTR("symbolDescriptor"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  CIQRCodeFeature *v5;
  id v6;
  CGSize size;
  CGPoint topLeft;
  CGPoint topRight;
  CGPoint bottomRight;
  CIQRCodeFeature *v11;
  _OWORD v13[6];
  id v14;

  v5 = +[CIQRCodeFeature allocWithZone:](CIQRCodeFeature, "allocWithZone:");
  v6 = -[CIQRCodeDescriptor copyWithZone:](self->symbolDescriptor, "copyWithZone:", a3);
  size = self->bounds.size;
  topLeft = self->topLeft;
  v13[0] = self->bounds.origin;
  v13[1] = size;
  topRight = self->topRight;
  v13[2] = topLeft;
  v13[3] = topRight;
  bottomRight = self->bottomRight;
  v13[4] = self->bottomLeft;
  v13[5] = bottomRight;
  v14 = v6;
  v11 = -[CIQRCodeFeature initWithInternalRepresentation:](v5, "initWithInternalRepresentation:", v13);

  return v11;
}

- (id)type
{
  return CFSTR("QRCode");
}

- (void)dealloc
{
  CIQRCodeDescriptor *symbolDescriptor;
  objc_super v4;

  symbolDescriptor = self->symbolDescriptor;
  if (symbolDescriptor)

  v4.receiver = self;
  v4.super_class = (Class)CIQRCodeFeature;
  -[CIQRCodeFeature dealloc](&v4, sel_dealloc);
}

- (CIQRCodeFeature)initWithInternalRepresentation:(id *)a3
{
  CIQRCodeFeature *v4;
  CIQRCodeFeature *v5;
  CGSize size;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CIQRCodeFeature;
  v4 = -[CIFeature init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    size = a3->var0.size;
    v4->bounds.origin = a3->var0.origin;
    v4->bounds.size = size;
    v4->topLeft = a3->var1;
    v4->topRight = a3->var2;
    v4->bottomLeft = a3->var3;
    v4->bottomRight = a3->var4;
    v4->symbolDescriptor = (CIQRCodeDescriptor *)a3->var5;
  }
  return v5;
}

+ (CIQRCodeFeature)featureWithInternalRepresentation:(id *)a3
{
  return -[CIQRCodeFeature initWithInternalRepresentation:]([CIQRCodeFeature alloc], "initWithInternalRepresentation:", a3);
}

- (NSString)messageString
{
  NSString *result;
  NSString *v4;
  uint64_t v5;
  const __CFDictionary *v6;
  void *v7;
  _QWORD v8[3];
  _QWORD v9[3];
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  result = (NSString *)loadACBS();
  if (result)
  {
    v4 = result;
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c"), (char)-[CIQRCodeDescriptor errorCorrectionLevel](self->symbolDescriptor, "errorCorrectionLevel"));
    v11[0] = CFSTR("QR");
    v10[0] = CFSTR("BarcodeType");
    v10[1] = CFSTR("BarcodeRawData");
    v11[1] = -[CIQRCodeDescriptor errorCorrectedPayload](self->symbolDescriptor, "errorCorrectedPayload");
    v10[2] = CFSTR("CodeProperties");
    v9[0] = v5;
    v8[0] = CFSTR("ErrorCorrectionLevel");
    v8[1] = CFSTR("QRMASK");
    v9[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[CIQRCodeDescriptor maskPattern](self->symbolDescriptor, "maskPattern"));
    v8[2] = CFSTR("SymbolVersion");
    v9[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CIQRCodeDescriptor symbolVersion](self->symbolDescriptor, "symbolVersion"));
    v11[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
    v6 = (const __CFDictionary *)((uint64_t (*)(uint64_t, _QWORD))v4[5])(objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3), 0);
    v7 = (id)CFDictionaryGetValue(v6, CFSTR("BarcodeString"));
    CFRelease(v6);
    return (NSString *)v7;
  }
  return result;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->bounds, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGPoint)topLeft
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->topLeft, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)topRight
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->topRight, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)bottomLeft
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->bottomLeft, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)bottomRight
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->bottomRight, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CIQRCodeDescriptor)symbolDescriptor
{
  return self->symbolDescriptor;
}

@end
