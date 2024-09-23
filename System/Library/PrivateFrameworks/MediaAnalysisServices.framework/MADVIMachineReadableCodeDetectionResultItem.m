@implementation MADVIMachineReadableCodeDetectionResultItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVIMachineReadableCodeDetectionResultItem)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomLeft:(CGPoint)a5 bottomRight:(CGPoint)a6 symbology:(id)a7 payload:(id)a8 andDescriptor:(id)a9
{
  CGFloat y;
  CGFloat x;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  id v21;
  id v22;
  id v23;
  MADVIMachineReadableCodeDetectionResultItem *v24;
  MADVIMachineReadableCodeDetectionResultItem *v25;
  objc_super v27;

  y = a6.y;
  x = a6.x;
  v14 = a5.y;
  v15 = a5.x;
  v16 = a4.y;
  v17 = a4.x;
  v18 = a3.y;
  v19 = a3.x;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v27.receiver = self;
  v27.super_class = (Class)MADVIMachineReadableCodeDetectionResultItem;
  v24 = -[MADVIMachineReadableCodeDetectionResultItem init](&v27, sel_init);
  v25 = v24;
  if (v24)
  {
    v24->_topLeft.x = v19;
    v24->_topLeft.y = v18;
    v24->_topRight.x = v17;
    v24->_topRight.y = v16;
    v24->_bottomLeft.x = v15;
    v24->_bottomLeft.y = v14;
    v24->_bottomRight.x = x;
    v24->_bottomRight.y = y;
    objc_storeStrong((id *)&v24->_symbology, a7);
    objc_storeStrong((id *)&v25->_payload, a8);
    objc_storeStrong((id *)&v25->_descriptor, a9);
  }

  return v25;
}

- (MADVIMachineReadableCodeDetectionResultItem)initWithCoder:(id)a3
{
  id v4;
  MADVIMachineReadableCodeDetectionResultItem *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  uint64_t v14;
  NSString *symbology;
  uint64_t v16;
  NSString *payload;
  void *v18;
  id v19;
  uint64_t v20;
  CIBarcodeDescriptor *descriptor;
  objc_super v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MADVIMachineReadableCodeDetectionResultItem;
  v5 = -[MADVIMachineReadableCodeDetectionResultItem init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodePointForKey:", CFSTR("TopLeft"));
    v5->_topLeft.x = v6;
    v5->_topLeft.y = v7;
    objc_msgSend(v4, "decodePointForKey:", CFSTR("TopRight"));
    v5->_topRight.x = v8;
    v5->_topRight.y = v9;
    objc_msgSend(v4, "decodePointForKey:", CFSTR("BottomLeft"));
    v5->_bottomLeft.x = v10;
    v5->_bottomLeft.y = v11;
    objc_msgSend(v4, "decodePointForKey:", CFSTR("BottomRight"));
    v5->_bottomRight.x = v12;
    v5->_bottomRight.y = v13;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Symbology"));
    v14 = objc_claimAutoreleasedReturnValue();
    symbology = v5->_symbology;
    v5->_symbology = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Payload"));
    v16 = objc_claimAutoreleasedReturnValue();
    payload = v5->_payload;
    v5->_payload = (NSString *)v16;

    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v18 = (void *)getCIBarcodeDescriptorClass_softClass;
    v28 = getCIBarcodeDescriptorClass_softClass;
    if (!getCIBarcodeDescriptorClass_softClass)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __getCIBarcodeDescriptorClass_block_invoke;
      v24[3] = &unk_1E97E2300;
      v24[4] = &v25;
      __getCIBarcodeDescriptorClass_block_invoke((uint64_t)v24);
      v18 = (void *)v26[3];
    }
    v19 = objc_retainAutorelease(v18);
    _Block_object_dispose(&v25, 8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Descriptor"));
    v20 = objc_claimAutoreleasedReturnValue();
    descriptor = v5->_descriptor;
    v5->_descriptor = (CIBarcodeDescriptor *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double x;
  double y;
  id v6;

  x = self->_topLeft.x;
  y = self->_topLeft.y;
  v6 = a3;
  objc_msgSend(v6, "encodePoint:forKey:", CFSTR("TopLeft"), x, y);
  objc_msgSend(v6, "encodePoint:forKey:", CFSTR("TopRight"), self->_topRight.x, self->_topRight.y);
  objc_msgSend(v6, "encodePoint:forKey:", CFSTR("BottomLeft"), self->_bottomLeft.x, self->_bottomLeft.y);
  objc_msgSend(v6, "encodePoint:forKey:", CFSTR("BottomRight"), self->_bottomRight.x, self->_bottomRight.y);
  objc_msgSend(v6, "encodeObject:forKey:", self->_symbology, CFSTR("Symbology"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_payload, CFSTR("Payload"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_descriptor, CFSTR("Descriptor"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("topLeft: (%0.2f, %0.2f), "), *(_QWORD *)&self->_topLeft.x, *(_QWORD *)&self->_topLeft.y);
  objc_msgSend(v3, "appendFormat:", CFSTR("topRight: (%0.2f, %0.2f), "), *(_QWORD *)&self->_topRight.x, *(_QWORD *)&self->_topRight.y);
  objc_msgSend(v3, "appendFormat:", CFSTR("bottomLeft: (%0.2f, %0.2f), "), *(_QWORD *)&self->_bottomLeft.x, *(_QWORD *)&self->_bottomLeft.y);
  objc_msgSend(v3, "appendFormat:", CFSTR("bottomRight: (%0.2f, %0.2f), "), *(_QWORD *)&self->_bottomRight.x, *(_QWORD *)&self->_bottomRight.y);
  objc_msgSend(v3, "appendFormat:", CFSTR("symbology: '%@', "), self->_symbology);
  objc_msgSend(v3, "appendFormat:", CFSTR("payload: %@, "), self->_payload);
  objc_msgSend(v3, "appendFormat:", CFSTR("descriptor: %@>"), self->_descriptor);
  return v3;
}

- (CGRect)normalizedBoundingBox
{
  double x;
  double y;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  x = self->_topLeft.x;
  y = self->_topLeft.y;
  v4 = self->_topRight.x;
  v5 = self->_topRight.y;
  v6 = self->_bottomLeft.x;
  v7 = self->_bottomLeft.y;
  v8 = self->_bottomRight.x;
  v9 = self->_bottomRight.y;
  if (v7 >= v9)
    v10 = self->_bottomRight.y;
  else
    v10 = self->_bottomLeft.y;
  if (v7 < v9)
    v7 = self->_bottomRight.y;
  if (y >= v5)
    v11 = self->_topRight.y;
  else
    v11 = self->_topLeft.y;
  if (y >= v5)
    v5 = self->_topLeft.y;
  if (v6 >= v8)
    v12 = self->_bottomRight.x;
  else
    v12 = self->_bottomLeft.x;
  if (v6 < v8)
    v6 = self->_bottomRight.x;
  if (x >= v4)
    v13 = self->_topRight.x;
  else
    v13 = self->_topLeft.x;
  if (x >= v4)
    v4 = self->_topLeft.x;
  if (v13 >= v12)
    v14 = v12;
  else
    v14 = v13;
  if (v11 >= v10)
    v15 = v10;
  else
    v15 = v11;
  if (v4 < v6)
    v4 = v6;
  v16 = v4 - v14;
  if (v5 < v7)
    v5 = v7;
  v17 = v5 - v15;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGPoint)topLeft
{
  double x;
  double y;
  CGPoint result;

  x = self->_topLeft.x;
  y = self->_topLeft.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)topRight
{
  double x;
  double y;
  CGPoint result;

  x = self->_topRight.x;
  y = self->_topRight.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)bottomLeft
{
  double x;
  double y;
  CGPoint result;

  x = self->_bottomLeft.x;
  y = self->_bottomLeft.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)bottomRight
{
  double x;
  double y;
  CGPoint result;

  x = self->_bottomRight.x;
  y = self->_bottomRight.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSString)symbology
{
  return self->_symbology;
}

- (NSString)payload
{
  return self->_payload;
}

- (CIBarcodeDescriptor)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_symbology, 0);
}

@end
