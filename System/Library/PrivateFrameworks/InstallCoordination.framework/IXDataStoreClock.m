@implementation IXDataStoreClock

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newClock
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithGUID:sequenceNumber:", v3, 0);

  return v4;
}

+ (id)newClockWithDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("guid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sequenceNumber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v8 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  v10 = 0;
  if (v6 && v9)
  {
    v11 = objc_alloc((Class)objc_opt_class());
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
    v10 = (void *)objc_msgSend(v11, "initWithGUID:sequenceNumber:", v12, objc_msgSend(v9, "unsignedLongLongValue"));

  }
  return v10;
}

- (IXDataStoreClock)initWithGUID:(id)a3 sequenceNumber:(unint64_t)a4
{
  id v7;
  IXDataStoreClock *v8;
  IXDataStoreClock *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IXDataStoreClock;
  v8 = -[IXDataStoreClock init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_guid, a3);
    v9->_sequenceNumber = a4;
  }

  return v9;
}

- (void)increment
{
  unint64_t v3;
  void *v4;

  v3 = -[IXDataStoreClock sequenceNumber](self, "sequenceNumber");
  if (v3 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXDataStoreClock setGuid:](self, "setGuid:", v4);

    v3 = 0;
  }
  -[IXDataStoreClock setSequenceNumber:](self, "setSequenceNumber:", v3 + 1);
}

- (IXDataStoreClock)initWithCoder:(id)a3
{
  id v4;
  IXDataStoreClock *v5;
  uint64_t v6;
  NSUUID *guid;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IXDataStoreClock;
  v5 = -[IXDataStoreClock init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("guid"));
    v6 = objc_claimAutoreleasedReturnValue();
    guid = v5->_guid;
    v5->_guid = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sequenceNumber"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sequenceNumber = objc_msgSend(v8, "unsignedLongLongValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[IXDataStoreClock guid](self, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("guid"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[IXDataStoreClock sequenceNumber](self, "sequenceNumber"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sequenceNumber"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[IXDataStoreClock guid](self, "guid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  v8 = (void *)objc_msgSend(v5, "initWithGUID:sequenceNumber:", v7, -[IXDataStoreClock sequenceNumber](self, "sequenceNumber"));

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  IXDataStoreClock *v4;
  IXDataStoreClock *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  BOOL v12;

  v4 = (IXDataStoreClock *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[IXDataStoreClock guid](self, "guid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[IXDataStoreClock guid](v5, "guid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if ((v8 != 0) != (v9 != 0) || v8 && v9 && !objc_msgSend(v8, "isEqual:", v9))
      {

        v12 = 0;
      }
      else
      {

        v11 = -[IXDataStoreClock sequenceNumber](self, "sequenceNumber");
        v12 = v11 == -[IXDataStoreClock sequenceNumber](v5, "sequenceNumber");
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[IXDataStoreClock guid](self, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[IXDataStoreClock sequenceNumber](self, "sequenceNumber") ^ v4;

  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("sequenceNumber");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[IXDataStoreClock sequenceNumber](self, "sequenceNumber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("guid");
  v9[0] = v3;
  -[IXDataStoreClock guid](self, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (NSDictionary)notificationDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("sequenceNumber");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[IXDataStoreClock sequenceNumber](self, "sequenceNumber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("guid");
  v9[0] = v3;
  -[IXDataStoreClock guid](self, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataStoreClock guid](self, "guid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ guid:%@ serialNumber:%llu>"), v5, v6, -[IXDataStoreClock sequenceNumber](self, "sequenceNumber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSUUID)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_storeStrong((id *)&self->_guid, a3);
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_sequenceNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
