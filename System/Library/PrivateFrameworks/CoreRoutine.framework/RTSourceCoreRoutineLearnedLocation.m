@implementation RTSourceCoreRoutineLearnedLocation

- (RTSourceCoreRoutineLearnedLocation)initWithIdentifier:(id)a3
{
  id v4;
  RTSourceCoreRoutineLearnedLocation *v5;
  uint64_t v6;
  NSUUID *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTSourceCoreRoutineLearnedLocation;
  v5 = -[RTSourceCoreRoutineLearnedLocation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTSourceCoreRoutineLearnedLocation)initWithCoder:(id)a3
{
  id v4;
  RTSourceCoreRoutineLearnedLocation *v5;
  uint64_t v6;
  NSUUID *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTSourceCoreRoutineLearnedLocation;
  v5 = -[RTSourceCoreRoutine initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTSourceCoreRoutineLearnedLocation;
  v4 = a3;
  -[RTSourceCoreRoutine encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"), v5.receiver, v5.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIdentifier:", self->_identifier);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RTSourceCoreRoutineLearnedLocation;
  if (-[RTSource isEqual:](&v12, sel_isEqual_, v5))
  {
    v6 = v5;
    -[RTSourceCoreRoutineLearnedLocation identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 || (objc_msgSend(v6, "identifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[RTSourceCoreRoutineLearnedLocation identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if (v7)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      v10 = 1;
    }

    goto LABEL_9;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RTSourceCoreRoutineLearnedLocation;
  v3 = -[RTSource hash](&v7, sel_hash);
  -[RTSourceCoreRoutineLearnedLocation identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
