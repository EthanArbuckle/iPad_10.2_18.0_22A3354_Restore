@implementation MTIDSecret

- (NSString)value
{
  return self->_value;
}

- (BOOL)isSynchronized
{
  return self->_isSynchronized;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSDate)effectiveDate
{
  return self->_effectiveDate;
}

- (MTIDSecret)initWithCoder:(id)a3
{
  id v4;
  MTIDSecret *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTIDSecret;
  v5 = -[MTIDSecret init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIDSecret setValue:](v5, "setValue:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("effectiveDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIDSecret setEffectiveDate:](v5, "setEffectiveDate:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIDSecret setExpirationDate:](v5, "setExpirationDate:", v8);

    -[MTIDSecret setIsSynchronized:](v5, "setIsSynchronized:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSynchronized")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("syncStatusCode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIDSecret setSyncStatusCode:](v5, "setSyncStatusCode:", v9);

  }
  return v5;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setSyncStatusCode:(id)a3
{
  objc_storeStrong((id *)&self->_syncStatusCode, a3);
}

- (void)setIsSynchronized:(BOOL)a3
{
  self->_isSynchronized = a3;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setEffectiveDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)syncStatusCode
{
  return self->_syncStatusCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncStatusCode, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_effectiveDate, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTIDSecret)init
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("NotImplemented"), CFSTR("Use initWithScheme:date: instead"));

  return 0;
}

- (MTIDSecret)initWithValue:(id)a3 effectiveDate:(id)a4 expirationDate:(id)a5 isSynchronize:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  MTIDSecret *v14;
  MTIDSecret *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MTIDSecret;
  v14 = -[MTIDSecret init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_value, a3);
    objc_storeStrong((id *)&v15->_effectiveDate, a4);
    objc_storeStrong((id *)&v15->_expirationDate, a5);
    v15->_isSynchronized = a6;
  }

  return v15;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTIDSecret value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTIDSecret effectiveDate](self, "effectiveDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTIDSecret expirationDate](self, "expirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, value: %@, effective: %@, expiration: %@ >"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  BOOL v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[MTIDSecret value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[MTIDSecret effectiveDate](self, "effectiveDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSince1970");
      v10 = v9;
      objc_msgSend(v5, "effectiveDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSince1970");
      if (v10 == v12)
      {
        -[MTIDSecret expirationDate](self, "expirationDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSince1970");
        v15 = v14;
        objc_msgSend(v5, "expirationDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeIntervalSince1970");
        v18 = v15 == v17;

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)debugInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTIDSecret value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("value"));

  -[MTIDSecret effectiveDate](self, "effectiveDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("effectiveDate"));

  -[MTIDSecret expirationDate](self, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("expirationDate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MTIDSecret isSynchronized](self, "isSynchronized"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isSynchronized"));

  -[MTIDSecret syncStatusCode](self, "syncStatusCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("syncStatusCode"));

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[MTIDSecret value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("value"));

  -[MTIDSecret effectiveDate](self, "effectiveDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("effectiveDate"));

  -[MTIDSecret expirationDate](self, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("expirationDate"));

  objc_msgSend(v4, "encodeBool:forKey:", -[MTIDSecret isSynchronized](self, "isSynchronized"), CFSTR("isSynchronized"));
  -[MTIDSecret syncStatusCode](self, "syncStatusCode");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("syncStatusCode"));

}

@end
