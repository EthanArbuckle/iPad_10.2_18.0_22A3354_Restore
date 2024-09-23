@implementation HKQuantityDatum

- (HKQuantityDatum)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKQuantityDatum)initWithIdentifier:(id)a3 dateInterval:(id)a4 quantity:(id)a5 resumeContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HKQuantityDatum *v14;
  uint64_t v15;
  NSUUID *UUID;
  uint64_t v17;
  NSDateInterval *dateInterval;
  uint64_t v19;
  HKQuantity *quantity;
  uint64_t v21;
  NSData *resumeContext;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HKQuantityDatum;
  v14 = -[HKQuantityDatum init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    UUID = v14->_UUID;
    v14->_UUID = (NSUUID *)v15;

    v17 = objc_msgSend(v11, "copy");
    dateInterval = v14->_dateInterval;
    v14->_dateInterval = (NSDateInterval *)v17;

    v19 = objc_msgSend(v12, "copy");
    quantity = v14->_quantity;
    v14->_quantity = (HKQuantity *)v19;

    v21 = objc_msgSend(v13, "copy");
    resumeContext = v14->_resumeContext;
    v14->_resumeContext = (NSData *)v21;

  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  id v5;

  UUID = self->_UUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", UUID, CFSTR("hkqd_id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateInterval, CFSTR("hkqd_dt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_quantity, CFSTR("hkqd_qt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_resumeContext, CFSTR("hkqd_cxt"));

}

- (HKQuantityDatum)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HKQuantityDatum *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hkqd_id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hkqd_dt"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hkqd_qt"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hkqd_cxt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HKQuantityDatum initWithIdentifier:dateInterval:quantity:resumeContext:](self, "initWithIdentifier:dateInterval:quantity:resumeContext:", v5, v6, v7, v8);
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *resumeContext;
  NSData *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || !-[NSUUID isEqual:](self->_UUID, "isEqual:", v4[1])
    || !-[NSDateInterval isEqual:](self->_dateInterval, "isEqual:", v4[3])
    || !-[HKQuantity isEqual:](self->_quantity, "isEqual:", v4[2]))
  {
    goto LABEL_8;
  }
  resumeContext = self->_resumeContext;
  v6 = (NSData *)v4[4];
  if (resumeContext == v6)
  {
    v7 = 1;
    goto LABEL_9;
  }
  if (v6)
    v7 = -[NSData isEqual:](resumeContext, "isEqual:");
  else
LABEL_8:
    v7 = 0;
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = -[NSUUID hash](self->_UUID, "hash");
  v4 = -[NSDateInterval hash](self->_dateInterval, "hash") ^ v3;
  v5 = -[HKQuantity hash](self->_quantity, "hash");
  return v4 ^ v5 ^ -[NSData hash](self->_resumeContext, "hash");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HKQuantityDatum UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityDatum dateInterval](self, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityDatum quantity](self, "quantity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@, quantity: %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (HKQuantity)quantity
{
  return self->_quantity;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSData)resumeContext
{
  return self->_resumeContext;
}

- (id)saveCompletion
{
  return self->_saveCompletion;
}

- (void)setSaveCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_saveCompletion, 0);
  objc_storeStrong((id *)&self->_resumeContext, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_quantity, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
