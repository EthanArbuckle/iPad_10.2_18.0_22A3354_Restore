@implementation AXAuditPoint

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3;
  AXAuditObjectTransportPropertyEntry *v4;
  AXAuditObjectTransportInfoPropertyBased *v5;

  v3 = a3;
  v5 = -[AXAuditObjectTransportInfoPropertyBased initWithClass:transportKey:]([AXAuditObjectTransportInfoPropertyBased alloc], "initWithClass:transportKey:", objc_opt_class(), CFSTR("AXAuditPoint_v1"));
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v4, "setTransportKey:", CFSTR("PointValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v4, "setLocalValueToTransportValue:", &__block_literal_global_6);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v4, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_8_1);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v5, "addPropertyEntry:", v4);
  objc_msgSend(v3, "registerTransportInfoPropertyBased:", v5);

}

uint64_t __55__AXAuditPoint_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(a2, "point");
  return objc_msgSend(v2, "valueWithPoint:");
}

void __55__AXAuditPoint_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "pointValue");
    objc_msgSend(v5, "setPoint:");
  }

}

+ (id)createWithPoint:(CGPoint)a3
{
  double y;
  double x;
  AXAuditPoint *v5;

  y = a3.y;
  x = a3.x;
  v5 = objc_alloc_init(AXAuditPoint);
  -[AXAuditPoint setPoint:](v5, "setPoint:", x, y);
  return v5;
}

- (unint64_t)hash
{
  double v2;
  double v3;

  -[AXAuditPoint point](self, "point");
  return (unint64_t)(v2 + v3);
}

- (BOOL)isEqual:(id)a3
{
  AXAuditPoint *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  BOOL v11;
  NSPoint v13;
  NSPoint v14;

  v4 = (AXAuditPoint *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AXAuditPoint point](self, "point");
      v6 = v5;
      v8 = v7;
      -[AXAuditPoint point](v4, "point");
      v14.x = v9;
      v14.y = v10;
      v13.x = v6;
      v13.y = v8;
      v11 = NSEqualPoints(v13, v14);
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[AXAuditPoint point](self, "point");
  objc_msgSend(v4, "setPoint:");
  return v4;
}

- (CGPoint)point
{
  double x;
  double y;
  CGPoint result;

  x = self->_point.x;
  y = self->_point.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  self->_point = a3;
}

@end
