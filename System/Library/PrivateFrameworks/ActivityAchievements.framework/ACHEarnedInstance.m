@implementation ACHEarnedInstance

- (ACHEarnedInstance)init
{
  ACHEarnedInstance *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACHEarnedInstance;
  result = -[ACHEarnedInstance init](&v3, sel_init);
  if (result)
  {
    result->_packedEarnedDateComponents.valid = 0;
    *(_DWORD *)&result->_packedEarnedDateComponents.year = 0;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  ACHEarnedInstance *v4;
  ACHEarnedInstance *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = (ACHEarnedInstance *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[ACHEarnedInstance key](self, "key");
      if (v6 == -[ACHEarnedInstance key](v5, "key"))
      {
        -[ACHEarnedInstance templateUniqueName](self, "templateUniqueName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACHEarnedInstance templateUniqueName](v5, "templateUniqueName");
        v8 = objc_claimAutoreleasedReturnValue();
        if (v7 == (void *)v8)
        {

        }
        else
        {
          v9 = (void *)v8;
          -[ACHEarnedInstance templateUniqueName](self, "templateUniqueName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[ACHEarnedInstance templateUniqueName](v5, "templateUniqueName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqualToString:", v11);

          if (!v12)
            goto LABEL_11;
        }
        if ((((*(unsigned int *)&v5->_packedEarnedDateComponents.year | ((unint64_t)v5->_packedEarnedDateComponents.valid << 32)) ^ (*(unsigned int *)&self->_packedEarnedDateComponents.year | ((unint64_t)self->_packedEarnedDateComponents.valid << 32))) & 0x1FFFFFFFFLL) == 0)
        {
          -[ACHEarnedInstance createdDate](self, "createdDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[ACHEarnedInstance createdDate](v5, "createdDate");
          v16 = objc_claimAutoreleasedReturnValue();
          if (v15 == (void *)v16)
          {

          }
          else
          {
            v17 = (void *)v16;
            -[ACHEarnedInstance createdDate](self, "createdDate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[ACHEarnedInstance createdDate](v5, "createdDate");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v18, "isEqual:", v19);

            if (!v20)
              goto LABEL_11;
          }
          v21 = -[ACHEarnedInstance creatorDevice](self, "creatorDevice");
          if (v21 == -[ACHEarnedInstance creatorDevice](v5, "creatorDevice"))
          {
            -[ACHEarnedInstance value](self, "value");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "_value");
            -[ACHEarnedInstance value](v5, "value");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "_value");
            v24 = HKCompareDoubles();

            if (!v24)
            {
              -[ACHEarnedInstance externalIdentifier](self, "externalIdentifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[ACHEarnedInstance externalIdentifier](v5, "externalIdentifier");
              v26 = objc_claimAutoreleasedReturnValue();
              if (v25 == (void *)v26)
              {
                v13 = 1;
                v27 = v25;
              }
              else
              {
                v27 = (void *)v26;
                -[ACHEarnedInstance externalIdentifier](self, "externalIdentifier");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                -[ACHEarnedInstance externalIdentifier](v5, "externalIdentifier");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = objc_msgSend(v28, "isEqual:", v29);

              }
              goto LABEL_12;
            }
          }
        }
      }
LABEL_11:
      v13 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v13 = 0;
  }
LABEL_13:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  v3 = -[ACHEarnedInstance key](self, "key");
  -[ACHEarnedInstance templateUniqueName](self, "templateUniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[ACHEarnedInstance earnedDateComponents](self, "earnedDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[ACHEarnedInstance createdDate](self, "createdDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  v10 = -[ACHEarnedInstance creatorDevice](self, "creatorDevice");
  -[ACHEarnedInstance value](self, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9 ^ v10 ^ objc_msgSend(v11, "hash");
  -[ACHEarnedInstance externalIdentifier](self, "externalIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");

  return v14;
}

- (int64_t)compareEarnedDateWithEarnedInstance:(id)a3
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  BOOL v9;
  uint64_t v12;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;

  if (!a3)
    return 1;
  v3 = *(unsigned int *)&self->_packedEarnedDateComponents.year | ((unint64_t)self->_packedEarnedDateComponents.valid << 32);
  v4 = *((unsigned int *)a3 + 6) | ((unint64_t)*((unsigned __int8 *)a3 + 28) << 32);
  v5 = HIDWORD(v3) & 1;
  v6 = HIDWORD(v4) & 1;
  if ((_DWORD)v5 == (_DWORD)v6)
  {
    if ((unsigned __int16)*((_DWORD *)a3 + 6) != (unsigned __int16)*(_DWORD *)&self->_packedEarnedDateComponents.year)
    {
      v7 = (unsigned __int16)*(_DWORD *)&self->_packedEarnedDateComponents.year;
      v8 = v7 >= (unsigned __int16)*((_DWORD *)a3 + 6);
      v9 = v7 > (unsigned __int16)*((_DWORD *)a3 + 6);
    }
    else if (BYTE2(*((_DWORD *)a3 + 6)) != BYTE2(*(_DWORD *)&self->_packedEarnedDateComponents.year))
    {
      v14 = BYTE2(*(_DWORD *)&self->_packedEarnedDateComponents.year);
      v8 = v14 >= BYTE2(*((_DWORD *)a3 + 6));
      v9 = v14 > BYTE2(*((_DWORD *)a3 + 6));
    }
    else
    {
      v15 = v4 >> 24;
      v16 = HIBYTE(*(_DWORD *)&self->_packedEarnedDateComponents.year);
      v8 = v16 >= v15;
      v9 = v16 > v15;
    }
    if (v8)
      v17 = 0;
    else
      v17 = -1;
    if (v9)
      return 1;
    else
      return v17;
  }
  if ((v3 & 0x100000000) != 0 && (_DWORD)v6 == 0)
    return 1;
  v12 = (v4 & 0x100000000) != 0 && (_DWORD)v5 == 0;
  return v12 << 63 >> 63;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ACHEarnedInstance *v5;
  int v6;
  void *v7;
  uint64_t v8;
  NSDate *createdDate;
  void *v10;
  uint64_t v11;
  HKQuantity *value;
  void *v13;
  uint64_t v14;
  NSString *externalIdentifier;

  v5 = -[ACHEarnedInstance init](+[ACHEarnedInstance allocWithZone:](ACHEarnedInstance, "allocWithZone:"), "init");
  v5->_key = -[ACHEarnedInstance key](self, "key");
  v5->_uniqueNameIndex = self->_uniqueNameIndex;
  v6 = *(_DWORD *)&self->_packedEarnedDateComponents.year;
  v5->_packedEarnedDateComponents.valid = self->_packedEarnedDateComponents.valid;
  *(_DWORD *)&v5->_packedEarnedDateComponents.year = v6;
  -[ACHEarnedInstance createdDate](self, "createdDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copyWithZone:", a3);
  createdDate = v5->_createdDate;
  v5->_createdDate = (NSDate *)v8;

  v5->_creatorDevice = -[ACHEarnedInstance creatorDevice](self, "creatorDevice");
  -[ACHEarnedInstance value](self, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "copy");
  value = v5->_value;
  v5->_value = (HKQuantity *)v11;

  -[ACHEarnedInstance externalIdentifier](self, "externalIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "copy");
  externalIdentifier = v5->_externalIdentifier;
  v5->_externalIdentifier = (NSString *)v14;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v13.receiver = self;
  v13.super_class = (Class)ACHEarnedInstance;
  -[ACHEarnedInstance description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ACHEarnedInstance key](self, "key");
  -[ACHEarnedInstance templateUniqueName](self, "templateUniqueName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHEarnedInstance earnedDateComponents](self, "earnedDateComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHEarnedInstance createdDate](self, "createdDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHEarnedInstance value](self, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHEarnedInstance externalIdentifier](self, "externalIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(Key: %lu\nTemplate Unique Name: %@\nEarned Date: %@\nCreated Date (MM-dd-yyyy HH:mm:ss): %@\nValue: %@\nExternal Identifier: %@\nCreator Device [1 = Watch, 2= Phone]: %lu\n)"), v4, v5, v6, v7, v8, v9, v10, -[ACHEarnedInstance creatorDevice](self, "creatorDevice"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v13.receiver = self;
  v13.super_class = (Class)ACHEarnedInstance;
  -[ACHEarnedInstance description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ACHEarnedInstance key](self, "key");
  -[ACHEarnedInstance templateUniqueName](self, "templateUniqueName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHEarnedInstance earnedDateComponents](self, "earnedDateComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHEarnedInstance createdDate](self, "createdDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHEarnedInstance value](self, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHEarnedInstance externalIdentifier](self, "externalIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(key=%lu, templateUniqueName=%@, earnedDate=%@, createdDate=%@, value=%@, externalIdentifier=%@, creatorDevice=%lu\n)"), v4, v5, v6, v7, v8, v9, v10, -[ACHEarnedInstance creatorDevice](self, "creatorDevice"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACHEarnedInstance)initWithCodable:(id)a3
{
  id v4;
  ACHEarnedInstance *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  ACHSyncIdentity *v27;
  ACHEarnedInstance *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)ACHEarnedInstance;
  v5 = -[ACHEarnedInstance init](&v30, sel_init);
  if (v5)
  {
    -[ACHEarnedInstance setKey:](v5, "setKey:", objc_msgSend(v4, "key"));
    objc_msgSend(v4, "templateUniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHEarnedInstance setTemplateUniqueName:](v5, "setTemplateUniqueName:", v6);

    v7 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v4, "createdDate");
    objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHEarnedInstance setCreatedDate:](v5, "setCreatedDate:", v8);

    objc_msgSend(v4, "earnedDateComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ACHYearMonthDayDateComponentsFromString(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHEarnedInstance setEarnedDateComponents:](v5, "setEarnedDateComponents:", v10);

    -[ACHEarnedInstance setCreatorDevice:](v5, "setCreatorDevice:", objc_msgSend(v4, "creatorDevice"));
    objc_msgSend(v4, "value");
    v12 = v11;
    objc_msgSend(v4, "valueUnitString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)MEMORY[0x24BDD3E50];
      objc_msgSend(MEMORY[0x24BDD4048], "unitFromString:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "quantityWithUnit:doubleValue:", v15, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHEarnedInstance setValue:](v5, "setValue:", v16);

    }
    if (objc_msgSend(v4, "hasExternalIdentifier"))
    {
      objc_msgSend(v4, "externalIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHEarnedInstance setExternalIdentifier:](v5, "setExternalIdentifier:", v17);

    }
    if (objc_msgSend(v4, "hasSyncIdentity"))
    {
      objc_msgSend(v4, "syncIdentity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "hardwareIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "syncIdentity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "databaseIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19 && v21)
      {
        objc_msgSend(v4, "syncIdentity");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "instanceDiscriminator");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        v25 = &stru_24D1281D8;
        if (v23)
          v25 = (__CFString *)v23;
        v26 = v25;

        v27 = -[ACHSyncIdentity initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:]([ACHSyncIdentity alloc], "initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:", v19, v21, v26);
        -[ACHEarnedInstance setSyncIdentity:](v5, "setSyncIdentity:", v27);
      }
      else
      {
        ACHLogTemplates();
        v27 = (ACHSyncIdentity *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v27->super, OS_LOG_TYPE_ERROR))
          -[ACHEarnedInstance initWithCodable:].cold.1(&v27->super);
      }

    }
    v28 = v5;

  }
  return v5;
}

- (ACHEarnedInstance)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  ACHCodableEarnedInstance *v9;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    v9 = -[ACHCodableEarnedInstance initWithData:]([ACHCodableEarnedInstance alloc], "initWithData:", v8);
    if (v9)
    {
      self = -[ACHEarnedInstance initWithCodable:](self, "initWithCodable:", v9);

      v9 = (ACHCodableEarnedInstance *)self;
    }
  }
  else
  {
    v9 = 0;
  }

  return (ACHEarnedInstance *)v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;

  v8 = a3;
  ACHCodableFromEarnedInstance(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v5, v7);

  }
}

- (NSDateComponents)earnedDateComponents
{
  void *v2;

  if (self->_packedEarnedDateComponents.valid)
  {
    ACHDateComponentsForYearMonthDay(self->_packedEarnedDateComponents.year, self->_packedEarnedDateComponents.month, self->_packedEarnedDateComponents.day);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSDateComponents *)v2;
}

- (void)setEarnedDateComponents:(id)a3
{
  id v4;
  unsigned __int16 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  BOOL v8;

  if (a3)
  {
    v4 = a3;
    v5 = objc_msgSend(v4, "year");
    v6 = objc_msgSend(v4, "month");
    v7 = objc_msgSend(v4, "day");

    v8 = 1;
  }
  else
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
  }
  self->_packedEarnedDateComponents.year = v5;
  self->_packedEarnedDateComponents.month = v6;
  self->_packedEarnedDateComponents.day = v7;
  self->_packedEarnedDateComponents.valid = v8;
}

+ (id)_allTemplateUniqueNames
{
  if (_allTemplateUniqueNames_onceToken != -1)
    dispatch_once(&_allTemplateUniqueNames_onceToken, &__block_literal_global_200_0);
  return (id)_allTemplateUniqueNames_allTemplateUniqueNames;
}

void __44__ACHEarnedInstance__allTemplateUniqueNames__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_allTemplateUniqueNames_allTemplateUniqueNames;
  _allTemplateUniqueNames_allTemplateUniqueNames = v0;

}

- (NSString)templateUniqueName
{
  void *v3;
  unint64_t uniqueNameIndex;
  void *v5;

  os_unfair_lock_lock((os_unfair_lock_t)&__lock);
  objc_msgSend((id)objc_opt_class(), "_allTemplateUniqueNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uniqueNameIndex = self->_uniqueNameIndex;
  if (uniqueNameIndex >= objc_msgSend(v3, "count"))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", self->_uniqueNameIndex);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__lock);

  return (NSString *)v5;
}

- (void)setTemplateUniqueName:(id)a3
{
  void *v4;
  unint64_t v5;
  id v6;

  v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&__lock);
  objc_msgSend((id)objc_opt_class(), "_allTemplateUniqueNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", v6);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_uniqueNameIndex = objc_msgSend(v4, "count");
    objc_msgSend(v4, "addObject:", v6);
  }
  else
  {
    self->_uniqueNameIndex = v5;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__lock);

}

- (unsigned)creatorDevice
{
  return self->_creatorDevice;
}

- (void)setCreatorDevice:(unsigned __int8)a3
{
  self->_creatorDevice = a3;
}

- (unint64_t)key
{
  return self->_key;
}

- (void)setKey:(unint64_t)a3
{
  self->_key = a3;
}

- (HKQuantity)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (void)setExternalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_externalIdentifier, a3);
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (void)setCreatedDate:(id)a3
{
  objc_storeStrong((id *)&self->_createdDate, a3);
}

- (ACHSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentity, a3);
}

- ($02FB07F485EFC64008691ED20BDF3B27)packedEarnedDateComponents
{
  return ($02FB07F485EFC64008691ED20BDF3B27)(*(unsigned int *)&self->_packedEarnedDateComponents.year | ((unint64_t)self->_packedEarnedDateComponents.valid << 32));
}

- (void)setPackedEarnedDateComponents:(id)a3
{
  self->_packedEarnedDateComponents = ($DF469B387FBA7E543935CF1F2373AD6C)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (void)initWithCodable:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_214029000, log, OS_LOG_TYPE_ERROR, "Unable to decode sync identity.", v1, 2u);
}

@end
