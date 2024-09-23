@implementation AXAuditPSN

+ (id)createWithPSN:(ProcessSerialNumber)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setPsn:", a3);
  return v4;
}

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3;
  AXAuditObjectTransportPropertyEntry *v4;
  AXAuditObjectTransportPropertyEntry *v5;
  AXAuditObjectTransportInfoPropertyBased *v6;

  v3 = a3;
  v6 = -[AXAuditObjectTransportInfoPropertyBased initWithClass:transportKey:]([AXAuditObjectTransportInfoPropertyBased alloc], "initWithClass:transportKey:", objc_opt_class(), CFSTR("AXAuditPSN_v1"));
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v4, "setTransportKey:", CFSTR("PsnHigh_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v4, "setLocalValueToTransportValue:", &__block_literal_global_1);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v4, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_8);
  v5 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v5, "setTransportKey:", CFSTR("PsnLow_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v5, "setLocalValueToTransportValue:", &__block_literal_global_11);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v5, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_12_0);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v6, "addPropertyEntry:", v5);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v6, "addPropertyEntry:", v4);
  objc_msgSend(v3, "registerTransportInfoPropertyBased:", v6);

}

uint64_t __53__AXAuditPSN_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(a2, "psn"));
}

void __53__AXAuditPSN_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setPsn:", objc_msgSend(v5, "psn") & 0xFFFFFFFF00000000 | objc_msgSend(v4, "integerValue"));

}

uint64_t __53__AXAuditPSN_registerTransportableObjectWithManager___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (unint64_t)objc_msgSend(a2, "psn") >> 32);
}

void __53__AXAuditPSN_registerTransportableObjectWithManager___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setPsn:", objc_msgSend(v5, "psn") | ((unint64_t)objc_msgSend(v4, "integerValue") << 32));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setPsn:", -[AXAuditPSN psn](self, "psn"));
  return v4;
}

- (unint64_t)hash
{
  ProcessSerialNumber v2;

  v2 = -[AXAuditPSN psn](self, "psn");
  return v2.highLongOfPSN ^ HIDWORD(*(unint64_t *)&v2);
}

- (BOOL)isEqual:(id)a3
{
  AXAuditPSN *v4;
  AXAuditPSN *v5;
  ProcessSerialNumber v6;
  uint64_t v7;
  BOOL v8;

  v4 = (AXAuditPSN *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[AXAuditPSN psn](self, "psn");
      v7 = -[AXAuditPSN psn](v5, "psn");

      v8 = v6 == v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (ProcessSerialNumber)psn
{
  return self->_psn;
}

- (void)setPsn:(ProcessSerialNumber)a3
{
  self->_psn = a3;
}

@end
