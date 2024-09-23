@implementation AXAuditSize

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3;
  AXAuditObjectTransportPropertyEntry *v4;
  AXAuditObjectTransportInfoPropertyBased *v5;

  v3 = a3;
  v5 = -[AXAuditObjectTransportInfoPropertyBased initWithClass:transportKey:]([AXAuditObjectTransportInfoPropertyBased alloc], "initWithClass:transportKey:", objc_opt_class(), CFSTR("AXAuditSize_v1"));
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v4, "setTransportKey:", CFSTR("SizeValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v4, "setLocalValueToTransportValue:", &__block_literal_global_7);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v4, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_8_2);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v5, "addPropertyEntry:", v4);
  objc_msgSend(v3, "registerTransportInfoPropertyBased:", v5);

}

uint64_t __54__AXAuditSize_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(a2, "size");
  return objc_msgSend(v2, "valueWithSize:");
}

void __54__AXAuditSize_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "sizeValue");
    objc_msgSend(v5, "setSize:");
  }

}

+ (id)createWithSize:(CGSize)a3
{
  double height;
  double width;
  AXAuditSize *v5;

  height = a3.height;
  width = a3.width;
  v5 = objc_alloc_init(AXAuditSize);
  -[AXAuditSize setSize:](v5, "setSize:", width, height);
  return v5;
}

- (unint64_t)hash
{
  double v2;
  double v3;

  -[AXAuditSize size](self, "size");
  return (unint64_t)(v2 + v3);
}

- (BOOL)isEqual:(id)a3
{
  AXAuditSize *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  BOOL v11;
  NSSize v13;
  NSSize v14;

  v4 = (AXAuditSize *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AXAuditSize size](self, "size");
      v6 = v5;
      v8 = v7;
      -[AXAuditSize size](v4, "size");
      v14.width = v9;
      v14.height = v10;
      v13.width = v6;
      v13.height = v8;
      v11 = NSEqualSizes(v13, v14);
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
  -[AXAuditSize size](self, "size");
  objc_msgSend(v4, "setSize:");
  return v4;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

@end
