@implementation NIBluetoothSample

- (NIBluetoothSample)initWithRSSI:(double)a3 identifier:(id)a4 model:(id)a5 channel:(int)a6 machContinuousTimeSeconds:(double)a7
{
  return -[NIBluetoothSample initWithRSSI:identifier:model:channel:machContinuousTimeSeconds:partIdentifier:name:](self, "initWithRSSI:identifier:model:channel:machContinuousTimeSeconds:partIdentifier:name:", a4, a5, *(_QWORD *)&a6, &stru_1E4363DF8, 0, a3, a7);
}

- (NIBluetoothSample)initWithRSSI:(double)a3 identifier:(id)a4 model:(id)a5 channel:(int)a6 machContinuousTimeSeconds:(double)a7 partIdentifier:(id)a8 name:(id)a9
{
  id v17;
  id v18;
  id v19;
  id v20;
  NIBluetoothSample *v21;
  NIBluetoothSample *v22;
  const __CFString *v23;
  NSString *model;
  objc_super v26;

  v17 = a4;
  v18 = a5;
  v19 = a8;
  v20 = a9;
  v26.receiver = self;
  v26.super_class = (Class)NIBluetoothSample;
  v21 = -[NIBluetoothSample init](&v26, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_rssi = a3;
    objc_storeStrong((id *)&v21->_identifier, a4);
    if (v18)
      v23 = (const __CFString *)v18;
    else
      v23 = CFSTR("NONE");
    model = v22->_model;
    v22->_model = &v23->isa;

    v22->_channel = a6;
    v22->_machContinuousTimeSeconds = a7;
    objc_storeStrong((id *)&v22->_partIdentifier, a8);
    objc_storeStrong((id *)&v22->_name, a9);
  }

  return v22;
}

- (NIBluetoothSample)initWithBluetoothSample:(id)a3
{
  id v5;
  NIBluetoothSample *v6;
  double v7;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  NSString *model;
  double v12;
  uint64_t v13;
  NSString *partIdentifier;
  uint64_t v15;
  NSString *name;
  void *v18;
  objc_super v19;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIBluetoothSample.mm"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sample"));

  }
  v19.receiver = self;
  v19.super_class = (Class)NIBluetoothSample;
  v6 = -[NIBluetoothSample init](&v19, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "rssi");
    v6->_rssi = v7;
    objc_msgSend(v5, "identifier");
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    objc_msgSend(v5, "model");
    v10 = objc_claimAutoreleasedReturnValue();
    model = v6->_model;
    v6->_model = (NSString *)v10;

    v6->_channel = objc_msgSend(v5, "channel");
    objc_msgSend(v5, "machContinuousTimeSeconds");
    v6->_machContinuousTimeSeconds = v12;
    objc_msgSend(v5, "partIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    partIdentifier = v6->_partIdentifier;
    v6->_partIdentifier = (NSString *)v13;

    objc_msgSend(v5, "name");
    v15 = objc_claimAutoreleasedReturnValue();
    name = v6->_name;
    v6->_name = (NSString *)v15;

  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBluetoothSample:", self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("rssi"), self->_rssi);
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_model, CFSTR("model"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_channel, CFSTR("channel"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("machContinuousTimeSeconds"), self->_machContinuousTimeSeconds);
  objc_msgSend(v4, "encodeObject:forKey:", self->_partIdentifier, CFSTR("partIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("name"));

}

- (NIBluetoothSample)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  int v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  NIBluetoothSample *v14;
  NIBluetoothSample *v15;
  NIBluetoothSample *v16;
  objc_super v18;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("model"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (objc_opt_class(), (objc_opt_isKindOfClass() & (v6 != 0)) == 1)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rssi"));
    v8 = v7;
    v9 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("channel"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("machContinuousTimeSeconds"));
    v11 = v10;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("partIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v12 = 0;
      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v13 = 0;
      }
    }
    v18.receiver = self;
    v18.super_class = (Class)NIBluetoothSample;
    v14 = -[NIBluetoothSample init](&v18, sel_init);
    v15 = v14;
    if (v14)
    {
      v14->_rssi = v8;
      objc_storeStrong((id *)&v14->_identifier, v5);
      objc_storeStrong((id *)&v15->_model, v6);
      v15->_channel = v9;
      v15->_machContinuousTimeSeconds = v11;
      objc_storeStrong((id *)&v15->_partIdentifier, v12);
      objc_storeStrong((id *)&v15->_name, v13);
    }
    self = v15;

    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NIBluetoothSample *v5;
  NIBluetoothSample *v6;
  NSString *identifier;
  void *v8;
  void *v9;
  char v10;
  NSString *model;
  void *v12;
  void *v13;
  char v14;
  double rssi;
  double v16;
  double v17;
  int channel;
  int v19;
  double machContinuousTimeSeconds;
  double v21;
  double v22;
  NSString *partIdentifier;
  void *v24;
  void *v25;
  char v26;
  NSString *name;
  void *v28;
  void *v29;
  BOOL v30;
  char v31;
  char v32;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NIBluetoothSample *)v4;
    v6 = v5;
    if (v5 == self)
    {
      v32 = 1;
LABEL_28:

      goto LABEL_29;
    }
    identifier = self->_identifier;
    if (!identifier)
    {
      -[NIBluetoothSample identifier](v5, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v10 = 1;
LABEL_7:
        model = self->_model;
        if (!model)
        {
          -[NIBluetoothSample model](v6, "model");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            v14 = 1;
LABEL_11:
            rssi = self->_rssi;
            -[NIBluetoothSample rssi](v6, "rssi");
            v17 = v16;
            channel = self->_channel;
            v19 = -[NIBluetoothSample channel](v6, "channel");
            machContinuousTimeSeconds = self->_machContinuousTimeSeconds;
            -[NIBluetoothSample machContinuousTimeSeconds](v6, "machContinuousTimeSeconds");
            v22 = v21;
            partIdentifier = self->_partIdentifier;
            if (!partIdentifier)
            {
              -[NIBluetoothSample partIdentifier](v6, "partIdentifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v24)
              {
                v26 = 1;
LABEL_15:
                name = self->_name;
                if (!name)
                {
                  -[NIBluetoothSample name](v6, "name");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v28)
                  {
LABEL_19:
                    v31 = v10 & v14;
                    if (rssi != v17)
                      v31 = 0;
                    if (channel != v19)
                      v31 = 0;
                    if (machContinuousTimeSeconds != v22)
                      v31 = 0;
                    v32 = v31 & v26;
                    goto LABEL_28;
                  }
                  name = self->_name;
                }
                -[NIBluetoothSample name](v6, "name");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = -[NSString isEqualToString:](name, "isEqualToString:", v29);

                v26 &= v30;
                goto LABEL_19;
              }
              partIdentifier = self->_partIdentifier;
            }
            -[NIBluetoothSample partIdentifier](v6, "partIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = -[NSString isEqualToString:](partIdentifier, "isEqualToString:", v25);

            goto LABEL_15;
          }
          model = self->_model;
        }
        -[NIBluetoothSample model](v6, "model");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[NSString isEqualToString:](model, "isEqualToString:", v13);

        goto LABEL_11;
      }
      identifier = self->_identifier;
    }
    -[NIBluetoothSample identifier](v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NSString isEqualToString:](identifier, "isEqualToString:", v9);

    goto LABEL_7;
  }
  v32 = 0;
LABEL_29:

  return v32;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rssi);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_identifier, "hash");
  v6 = -[NSString hash](self->_model, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_channel);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_machContinuousTimeSeconds);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  v11 = -[NSString hash](self->_name, "hash");
  v12 = v5 ^ v4 ^ v6 ^ v8 ^ v10 ^ v11 ^ -[NSString hash](self->_partIdentifier, "hash");

  return v12;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  objc_msgSend(v6, "appendFormat:", CFSTR("Identifier: %@"), self->_identifier);
  objc_msgSend(v6, "appendFormat:", CFSTR(", RSSI: %.2f"), *(_QWORD *)&self->_rssi);
  objc_msgSend(v6, "appendFormat:", CFSTR(", Mach Continuous Time Seconds: %f"), *(_QWORD *)&self->_machContinuousTimeSeconds);
  objc_msgSend(v6, "appendFormat:", CFSTR(", Channel: %d"), self->_channel);
  objc_msgSend(v6, "appendFormat:", CFSTR(", Model: %@"), self->_model);
  -[NIBluetoothSample descriptionInternal](self, "descriptionInternal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v7);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (id)descriptionInternal
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", partIdentifier: %@"), self->_partIdentifier);
}

- (double)rssi
{
  return self->_rssi;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (int)channel
{
  return self->_channel;
}

- (double)machContinuousTimeSeconds
{
  return self->_machContinuousTimeSeconds;
}

- (NSString)partIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_partIdentifier, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
