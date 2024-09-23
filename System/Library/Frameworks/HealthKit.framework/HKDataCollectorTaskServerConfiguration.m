@implementation HKDataCollectorTaskServerConfiguration

- (HKDataCollectorTaskServerConfiguration)initWithQuantityType:(id)a3 bundleIdentifier:(id)a4 canResumeFromLastDatum:(BOOL)a5
{
  id v8;
  id v9;
  HKDataCollectorTaskServerConfiguration *v10;
  uint64_t v11;
  HKQuantityType *quantityType;
  uint64_t v13;
  NSString *bundleIdentifier;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HKDataCollectorTaskServerConfiguration;
  v10 = -[HKDataCollectorTaskServerConfiguration init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    quantityType = v10->_quantityType;
    v10->_quantityType = (HKQuantityType *)v11;

    v13 = objc_msgSend(v9, "copy");
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v13;

    v10->_canResumeFromLastDatum = a5;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HKDataCollectorTaskServerConfiguration initWithQuantityType:bundleIdentifier:canResumeFromLastDatum:]([HKDataCollectorTaskServerConfiguration alloc], "initWithQuantityType:bundleIdentifier:canResumeFromLastDatum:", self->_quantityType, self->_bundleIdentifier, self->_canResumeFromLastDatum);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKDataCollectorTaskServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKDataCollectorTaskServerConfiguration *v5;
  uint64_t v6;
  HKQuantityType *quantityType;
  uint64_t v8;
  NSString *bundleIdentifier;
  HKDataCollectorTaskServerConfiguration *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKDataCollectorTaskServerConfiguration;
  v5 = -[HKTaskConfiguration initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("quantity_type"));
  v6 = objc_claimAutoreleasedReturnValue();
  quantityType = v5->_quantityType;
  v5->_quantityType = (HKQuantityType *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundle_identifier"));
  v8 = objc_claimAutoreleasedReturnValue();
  bundleIdentifier = v5->_bundleIdentifier;
  v5->_bundleIdentifier = (NSString *)v8;

  v5->_canResumeFromLastDatum = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("can_resume"));
  if (!v5->_quantityType)
    goto LABEL_5;
  if (v5->_bundleIdentifier)
LABEL_4:
    v10 = v5;
  else
LABEL_5:
    v10 = 0;

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKDataCollectorTaskServerConfiguration;
  v4 = a3;
  -[HKTaskConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_quantityType, CFSTR("quantity_type"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundle_identifier"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_canResumeFromLastDatum, CFSTR("can_resume"));

}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (void)setQuantityType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)canResumeFromLastDatum
{
  return self->_canResumeFromLastDatum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
}

@end
