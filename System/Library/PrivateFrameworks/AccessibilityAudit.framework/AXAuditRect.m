@implementation AXAuditRect

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3;
  AXAuditObjectTransportPropertyEntry *v4;
  AXAuditObjectTransportInfoPropertyBased *v5;

  v3 = a3;
  v5 = -[AXAuditObjectTransportInfoPropertyBased initWithClass:transportKey:]([AXAuditObjectTransportInfoPropertyBased alloc], "initWithClass:transportKey:", objc_opt_class(), CFSTR("AXAuditRect_v1"));
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v4, "setTransportKey:", CFSTR("RectValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v4, "setLocalValueToTransportValue:", &__block_literal_global_4);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v4, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_8_0);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v5, "addPropertyEntry:", v4);
  objc_msgSend(v3, "registerTransportInfoPropertyBased:", v5);

}

uint64_t __54__AXAuditRect_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(a2, "rect");
  return objc_msgSend(v2, "valueWithRect:");
}

void __54__AXAuditRect_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "rectValue");
    objc_msgSend(v5, "setRect:");
  }

}

+ (id)createWithRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  AXAuditRect *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = objc_alloc_init(AXAuditRect);
  -[AXAuditRect setRect:](v7, "setRect:", x, y, width, height);
  return v7;
}

- (unint64_t)hash
{
  double v2;
  double v3;
  double v4;
  double v5;

  -[AXAuditRect rect](self, "rect");
  return (unint64_t)(v5 + v4 + v2 + v3);
}

- (BOOL)isEqual:(id)a3
{
  AXAuditRect *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  BOOL v17;
  NSRect v19;
  NSRect v20;

  v4 = (AXAuditRect *)a3;
  if (self == v4)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AXAuditRect rect](self, "rect");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;
      -[AXAuditRect rect](v4, "rect");
      v20.origin.x = v13;
      v20.origin.y = v14;
      v20.size.width = v15;
      v20.size.height = v16;
      v19.origin.x = v6;
      v19.origin.y = v8;
      v19.size.width = v10;
      v19.size.height = v12;
      v17 = NSEqualRects(v19, v20);
    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[AXAuditRect rect](self, "rect");
  objc_msgSend(v4, "setRect:");
  return v4;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

@end
