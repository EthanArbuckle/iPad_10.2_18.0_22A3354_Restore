@implementation HKMCWristTemperature

- (HKMCWristTemperature)initWithQuantity:(id)a3 watchBundleIdentifier:(id)a4
{
  id v7;
  id v8;
  HKMCWristTemperature *v9;
  HKMCWristTemperature *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKMCWristTemperature;
  v9 = -[HKMCWristTemperature init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_quantity, a3);
    objc_storeStrong((id *)&v10->_watchBundleIdentifier, a4);
  }

  return v10;
}

+ (id)wristTemperatureFromWristTemperatureSample:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "quantity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceRevision");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "initWithQuantity:watchBundleIdentifier:", v6, v9);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKQuantity *quantity;
  id v5;

  quantity = self->_quantity;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", quantity, CFSTR("Quantity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_watchBundleIdentifier, CFSTR("WatchBundleIdentifier"));

}

- (HKMCWristTemperature)initWithCoder:(id)a3
{
  id v4;
  HKMCWristTemperature *v5;
  uint64_t v6;
  HKQuantity *quantity;
  uint64_t v8;
  NSString *watchBundleIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKMCWristTemperature;
  v5 = -[HKMCWristTemperature init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Quantity"));
    v6 = objc_claimAutoreleasedReturnValue();
    quantity = v5->_quantity;
    v5->_quantity = (HKQuantity *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WatchBundleIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    watchBundleIdentifier = v5->_watchBundleIdentifier;
    v5->_watchBundleIdentifier = (NSString *)v8;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p quantity: %@, watchBundleIdentifier: %@>"), objc_opt_class(), self, self->_quantity, self->_watchBundleIdentifier);
}

- (NSString)hk_redactedDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p watchBundleIdentifier: %@>"), objc_opt_class(), self, self->_watchBundleIdentifier);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  HKMCWristTemperature *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  void *v12;
  void *v13;

  v7 = (HKMCWristTemperature *)a3;
  if (self == v7)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HKMCWristTemperature quantity](self, "quantity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMCWristTemperature quantity](v7, "quantity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v9)
        goto LABEL_9;
      -[HKMCWristTemperature quantity](v7, "quantity");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v11 = 0;
        goto LABEL_12;
      }
      v3 = (void *)v10;
      -[HKMCWristTemperature quantity](self, "quantity");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMCWristTemperature quantity](v7, "quantity");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isEqual:", v5))
      {
LABEL_9:
        -[HKMCWristTemperature watchBundleIdentifier](self, "watchBundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMCWristTemperature watchBundleIdentifier](v7, "watchBundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v12, "isEqual:", v13);

        if (v8 == v9)
        {
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
        v11 = 0;
      }

      goto LABEL_12;
    }
    v11 = 0;
  }
LABEL_13:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[HKQuantity hash](self->_quantity, "hash");
  return -[NSString hash](self->_watchBundleIdentifier, "hash") ^ v3;
}

- (HKQuantity)quantity
{
  return self->_quantity;
}

- (NSString)watchBundleIdentifier
{
  return self->_watchBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_quantity, 0);
}

@end
