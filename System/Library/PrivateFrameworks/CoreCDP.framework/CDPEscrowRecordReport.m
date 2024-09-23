@implementation CDPEscrowRecordReport

- (CDPEscrowRecordReport)initWithDefaultValues
{
  CDPEscrowRecordViability *v3;
  CDPEscrowRecordReport *v4;

  v3 = -[CDPEscrowRecordViability initWithDefaultValues]([CDPEscrowRecordViability alloc], "initWithDefaultValues");
  v4 = -[CDPEscrowRecordReport initWithDeviceStatus:](self, "initWithDeviceStatus:", v3);

  return v4;
}

- (CDPEscrowRecordReport)initWithDeviceStatus:(id)a3
{
  id v5;
  CDPEscrowRecordReport *v6;
  CDPEscrowRecordReport *v7;
  CDPEscrowRecordReport *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CDPEscrowRecordReport;
  v6 = -[CDPEscrowRecordReport init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_deviceViability, a3);
    v8 = v7;
  }

  return v7;
}

- (id)updatedReportWithRecord:(id)a3
{
  id v4;
  CDPEscrowRecordReport *v5;
  int64x2_t *v6;
  void *v7;
  CDPEscrowRecordReport *v8;

  v4 = a3;
  v5 = [CDPEscrowRecordReport alloc];
  -[CDPEscrowRecordReport deviceViability](self, "deviceViability");
  v6 = (int64x2_t *)objc_claimAutoreleasedReturnValue();
  -[CDPEscrowRecordViability updatedViabiltyWithRecord:](v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CDPEscrowRecordReport initWithDeviceStatus:](v5, "initWithDeviceStatus:", v7);
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CDPEscrowRecordReport)initWithCoder:(id)a3
{
  id v4;
  CDPEscrowRecordReport *v5;
  void *v6;
  uint64_t v7;
  CDPEscrowRecordViability *deviceViability;
  CDPEscrowRecordReport *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDPEscrowRecordReport;
  v5 = -[CDPEscrowRecordReport init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceViability"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v7 = objc_claimAutoreleasedReturnValue();

    deviceViability = v5->_deviceViability;
    v5->_deviceViability = (CDPEscrowRecordViability *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_deviceViability, CFSTR("deviceViability"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CDPEscrowRecordReport deviceViability](self, "deviceViability");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceViability");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {

      v7 = 1;
    }
    else
    {
      -[CDPEscrowRecordReport deviceViability](self, "deviceViability");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "deviceViability");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8 != v9;

      v7 = !v10;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7 & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CDPEscrowRecordReport *v5;
  void *v6;
  void *v7;
  CDPEscrowRecordReport *v8;

  v5 = [CDPEscrowRecordReport alloc];
  -[CDPEscrowRecordReport deviceViability](self, "deviceViability");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  v8 = -[CDPEscrowRecordReport initWithDeviceStatus:](v5, "initWithDeviceStatus:", v7);

  return v8;
}

- (CDPEscrowRecordViability)deviceViability
{
  return self->_deviceViability;
}

- (void)setDeviceViability:(id)a3
{
  objc_storeStrong((id *)&self->_deviceViability, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceViability, 0);
}

@end
