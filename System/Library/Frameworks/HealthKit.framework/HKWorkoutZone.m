@implementation HKWorkoutZone

- (HKWorkoutZone)initWithIdentifier:(id)a3 startQuantity:(id)a4 endQuantity:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKWorkoutZone *v11;
  uint64_t v12;
  NSUUID *identifier;
  uint64_t v14;
  HKQuantity *startQuantity;
  uint64_t v16;
  HKQuantity *endQuantity;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKWorkoutZone;
  v11 = -[HKWorkoutZone init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSUUID *)v12;

    v14 = objc_msgSend(v9, "copy");
    startQuantity = v11->_startQuantity;
    v11->_startQuantity = (HKQuantity *)v14;

    v16 = objc_msgSend(v10, "copy");
    endQuantity = v11->_endQuantity;
    v11->_endQuantity = (HKQuantity *)v16;

  }
  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p identifier=%@, startQuantity=%@, endQuantity=%@>"), v5, self, self->_identifier, self->_startQuantity, self->_endQuantity);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HKWorkoutZone *v5;
  NSUUID *identifier;
  NSUUID *v7;
  uint64_t v8;
  void *v9;
  NSUUID *v10;
  void *v11;
  char v12;
  HKQuantity *startQuantity;
  HKQuantity *v14;
  uint64_t v15;
  HKQuantity *v16;
  void *v17;
  HKQuantity *endQuantity;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  HKQuantity *v23;
  void *v24;
  BOOL v25;
  void *v27;
  void *v28;
  void *v29;

  v5 = (HKWorkoutZone *)a3;
  if (self == v5)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      identifier = self->_identifier;
      -[HKWorkoutZone identifier](v5, "identifier");
      v7 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      if (identifier != v7)
      {
        -[HKWorkoutZone identifier](v5, "identifier");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v12 = 0;
          goto LABEL_31;
        }
        v9 = (void *)v8;
        v10 = self->_identifier;
        -[HKWorkoutZone identifier](v5, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSUUID isEqual:](v10, "isEqual:", v11))
        {
          v12 = 0;
LABEL_30:

          goto LABEL_31;
        }
        v28 = v9;
        v29 = v11;
      }
      startQuantity = self->_startQuantity;
      -[HKWorkoutZone startQuantity](v5, "startQuantity");
      v14 = (HKQuantity *)objc_claimAutoreleasedReturnValue();
      if (startQuantity != v14)
      {
        -[HKWorkoutZone startQuantity](v5, "startQuantity");
        v15 = objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          v12 = 0;
          goto LABEL_25;
        }
        v3 = (void *)v15;
        v16 = self->_startQuantity;
        -[HKWorkoutZone startQuantity](v5, "startQuantity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[HKQuantity isEqual:](v16, "isEqual:", v17))
        {

          v12 = 0;
LABEL_28:
          v25 = identifier == v7;
          v9 = v28;
LABEL_29:
          v11 = v29;
          if (!v25)
            goto LABEL_30;
LABEL_31:

          goto LABEL_32;
        }
        v27 = v17;
      }
      endQuantity = self->_endQuantity;
      -[HKWorkoutZone endQuantity](v5, "endQuantity");
      v19 = objc_claimAutoreleasedReturnValue();
      v12 = endQuantity == (HKQuantity *)v19;
      if (endQuantity == (HKQuantity *)v19)
      {

      }
      else
      {
        v20 = (void *)v19;
        -[HKWorkoutZone endQuantity](v5, "endQuantity");
        v21 = objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v22 = (void *)v21;
          v23 = self->_endQuantity;
          -[HKWorkoutZone endQuantity](v5, "endQuantity");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[HKQuantity isEqual:](v23, "isEqual:", v24);

          if (startQuantity == v14)
          {

            goto LABEL_28;
          }

          goto LABEL_26;
        }

      }
      if (startQuantity == v14)
      {
LABEL_26:

        goto LABEL_28;
      }

LABEL_25:
      v9 = v28;

      v25 = identifier == v7;
      goto LABEL_29;
    }
    v12 = 0;
  }
LABEL_32:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("Identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startQuantity, CFSTR("StartQuantity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endQuantity, CFSTR("EndQuantity"));

}

- (HKWorkoutZone)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HKWorkoutZone *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StartQuantity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EndQuantity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HKWorkoutZone initWithIdentifier:startQuantity:endQuantity:](self, "initWithIdentifier:startQuantity:endQuantity:", v5, v6, v7);
  return v8;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (HKQuantity)startQuantity
{
  return self->_startQuantity;
}

- (HKQuantity)endQuantity
{
  return self->_endQuantity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endQuantity, 0);
  objc_storeStrong((id *)&self->_startQuantity, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
