@implementation HAPBLECharacteristicCache

- (HAPBLECharacteristicCache)initWithCharacteristicUUID:(id)a3 instanceId:(id)a4 characteristicProperties:(unint64_t)a5 characteristicMetadata:(id)a6
{
  id v11;
  id v12;
  id v13;
  HAPBLECharacteristicCache *v14;
  HAPBLECharacteristicCache *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HAPBLECharacteristicCache;
  v14 = -[HAPBLECharacteristicCache init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_characteristicUUID, a3);
    objc_storeStrong((id *)&v15->_characteristicInstanceId, a4);
    v15->_characteristicProperties = a5;
    objc_storeStrong((id *)&v15->_characteristicMetadata, a6);
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  HAPBLECharacteristicCache *v4;
  HAPBLECharacteristicCache *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (HAPBLECharacteristicCache *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HAPBLECharacteristicCache characteristicUUID](self, "characteristicUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPBLECharacteristicCache characteristicUUID](v5, "characteristicUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (v8)
      {
        -[HAPBLECharacteristicCache characteristicInstanceId](self, "characteristicInstanceId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPBLECharacteristicCache characteristicInstanceId](v5, "characteristicInstanceId");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HAPBLECharacteristicCache characteristicUUID](self, "characteristicUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HAPBLECharacteristicCache characteristicInstanceId](self, "characteristicInstanceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (void)updateWithCharacteristic:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HAPBLECharacteristicCache setCharacteristicProperties:](self, "setCharacteristicProperties:", objc_msgSend(v4, "characteristicProperties"));
  objc_msgSend(v4, "characteristicMetadata");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[HAPBLECharacteristicCache setCharacteristicMetadata:](self, "setCharacteristicMetadata:", v5);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HAPBLECharacteristicCache characteristicUUID](self, "characteristicUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CUUI"));

  -[HAPBLECharacteristicCache characteristicInstanceId](self, "characteristicInstanceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("CI"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[HAPBLECharacteristicCache characteristicProperties](self, "characteristicProperties"), CFSTR("CP"));
  -[HAPBLECharacteristicCache characteristicMetadata](self, "characteristicMetadata");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("CM"));

}

- (HAPBLECharacteristicCache)initWithCoder:(id)a3
{
  id v4;
  HAPBLECharacteristicCache *v5;
  uint64_t v6;
  NSUUID *characteristicUUID;
  uint64_t v8;
  NSNumber *characteristicInstanceId;
  uint64_t v10;
  HAPCharacteristicMetadata *characteristicMetadata;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HAPBLECharacteristicCache;
  v5 = -[HAPBLECharacteristicCache init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CUUI"));
    v6 = objc_claimAutoreleasedReturnValue();
    characteristicUUID = v5->_characteristicUUID;
    v5->_characteristicUUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CI"));
    v8 = objc_claimAutoreleasedReturnValue();
    characteristicInstanceId = v5->_characteristicInstanceId;
    v5->_characteristicInstanceId = (NSNumber *)v8;

    v5->_characteristicProperties = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CP"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CM"));
    v10 = objc_claimAutoreleasedReturnValue();
    characteristicMetadata = v5->_characteristicMetadata;
    v5->_characteristicMetadata = (HAPCharacteristicMetadata *)v10;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  __int16 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HAPBLECharacteristicCache characteristicUUID](self, "characteristicUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBLECharacteristicCache characteristicInstanceId](self, "characteristicInstanceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HAPBLECharacteristicCache characteristicProperties](self, "characteristicProperties");
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 0x40) != 0)
  {
    objc_msgSend(v7, "stringByAppendingString:", CFSTR(": Hidden"));
    v13 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v13;
    if ((v6 & 1) == 0)
    {
LABEL_3:
      if ((v6 & 8) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v8, "stringByAppendingString:", CFSTR(": Notify"));
  v14 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)v14;
  if ((v6 & 8) == 0)
  {
LABEL_4:
    if ((v6 & 2) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v8, "stringByAppendingString:", CFSTR(": Broadcast"));
  v15 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)v15;
  if ((v6 & 2) == 0)
  {
LABEL_5:
    if ((v6 & 4) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(v8, "stringByAppendingString:", CFSTR(": Read"));
  v16 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)v16;
  if ((v6 & 4) == 0)
  {
LABEL_6:
    if ((v6 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v8, "stringByAppendingString:", CFSTR(": Write"));
  v17 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)v17;
  if ((v6 & 0x20) == 0)
  {
LABEL_7:
    if ((v6 & 0x10) == 0)
      goto LABEL_8;
LABEL_17:
    objc_msgSend(v8, "stringByAppendingString:", CFSTR(": AAD"));
    v19 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v19;
    if ((v6 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  objc_msgSend(v8, "stringByAppendingString:", CFSTR(": Timed Write"));
  v18 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)v18;
  if ((v6 & 0x10) != 0)
    goto LABEL_17;
LABEL_8:
  if ((v6 & 0x100) != 0)
  {
LABEL_9:
    objc_msgSend(v8, "stringByAppendingString:", CFSTR(": ENC"));
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
LABEL_10:
  -[HAPBLECharacteristicCache characteristicMetadata](self, "characteristicMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n\tCharacteristic Info:\n\t\tCharacteristic UUID: %@,\n\t\tInstanceId: %@,\n\t\tProperties: %@,\n\t\tMetadata: %@"), v4, v5, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSUUID)characteristicUUID
{
  return self->_characteristicUUID;
}

- (NSNumber)characteristicInstanceId
{
  return self->_characteristicInstanceId;
}

- (unint64_t)characteristicProperties
{
  return self->_characteristicProperties;
}

- (void)setCharacteristicProperties:(unint64_t)a3
{
  self->_characteristicProperties = a3;
}

- (HAPCharacteristicMetadata)characteristicMetadata
{
  return self->_characteristicMetadata;
}

- (void)setCharacteristicMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicMetadata, 0);
  objc_storeStrong((id *)&self->_characteristicInstanceId, 0);
  objc_storeStrong((id *)&self->_characteristicUUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
