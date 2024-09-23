@implementation IDSServicePseudonymChange

- (IDSServicePseudonymChange)initWithPseudonym:(id)a3 changeType:(unint64_t)a4 updateFlags:(int64_t)a5
{
  id v9;
  IDSServicePseudonymChange *v10;
  IDSServicePseudonymChange *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IDSServicePseudonymChange;
  v10 = -[IDSServicePseudonymChange init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_pseudonym, a3);
    v11->_changeType = a4;
    v11->_updateFlags = a5;
  }

  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t changeType;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  changeType = self->_changeType;
  if (changeType > 2)
    v7 = CFSTR("Unknown");
  else
    v7 = off_1E2C641A8[changeType];
  _IDSBinaryStringForValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p change: %@; updateFlags: %@; pseudonym: %@>"),
    v5,
    self,
    v7,
    v8,
    self->_pseudonym);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[IDSServicePseudonymChange isEqualToPseudonymChange:](self, "isEqualToPseudonymChange:", v4);

  return v5;
}

- (BOOL)isEqualToPseudonymChange:(id)a3
{
  IDSServicePseudonymChange *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  int64_t v8;
  BOOL v9;

  v4 = (IDSServicePseudonymChange *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    v5 = -[IDSServicePseudonymChange changeType](self, "changeType");
    if (v5 == -[IDSServicePseudonymChange changeType](v4, "changeType"))
    {
      -[IDSServicePseudonymChange pseudonym](self, "pseudonym");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[IDSServicePseudonymChange pseudonym](v4, "pseudonym");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToPseudonym:", v7))
      {
        v8 = -[IDSServicePseudonymChange updateFlags](self, "updateFlags");
        v9 = v8 == -[IDSServicePseudonymChange updateFlags](v4, "updateFlags");
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = -[IDSServicePseudonymChange changeType](self, "changeType");
  -[IDSServicePseudonymChange pseudonym](self, "pseudonym");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") - v3 + 32 * v3;

  return -[IDSServicePseudonymChange updateFlags](self, "updateFlags") - v5 + 32 * v5 + 29791;
}

- (IDSPseudonym)pseudonym
{
  return self->_pseudonym;
}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (int64_t)updateFlags
{
  return self->_updateFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pseudonym, 0);
}

@end
