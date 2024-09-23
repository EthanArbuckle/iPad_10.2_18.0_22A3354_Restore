@implementation AXAuditRange

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3;
  AXAuditObjectTransportPropertyEntry *v4;
  AXAuditObjectTransportInfoPropertyBased *v5;

  v3 = a3;
  v5 = -[AXAuditObjectTransportInfoPropertyBased initWithClass:transportKey:]([AXAuditObjectTransportInfoPropertyBased alloc], "initWithClass:transportKey:", objc_opt_class(), CFSTR("AXAuditRange_v1"));
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v4, "setTransportKey:", CFSTR("RangeValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v4, "setLocalValueToTransportValue:", &__block_literal_global_8);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v4, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_8_3);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v5, "addPropertyEntry:", v4);
  objc_msgSend(v3, "registerTransportInfoPropertyBased:", v5);

}

uint64_t __55__AXAuditRange_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x24BDD1968];
  v3 = objc_msgSend(a2, "range");
  return objc_msgSend(v2, "valueWithRange:", v3, v4);
}

void __55__AXAuditRange_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "rangeValue");
    objc_msgSend(v7, "setRange:", v5, v6);
  }

}

+ (id)createWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  AXAuditRange *v5;

  length = a3.length;
  location = a3.location;
  v5 = objc_alloc_init(AXAuditRange);
  -[AXAuditRange setRange:](v5, "setRange:", location, length);
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  v2 = -[AXAuditRange range](self, "range");
  return v2 + v3;
}

- (BOOL)isEqual:(id)a3
{
  AXAuditRange *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v10;

  v4 = (AXAuditRange *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[AXAuditRange range](self, "range");
      v7 = v6;
      v10 = v5 == -[AXAuditRange range](v4, "range") && v7 == v8;
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[AXAuditRange range](self, "range");
  objc_msgSend(v4, "setRange:", v5, v6);
  return v4;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

@end
