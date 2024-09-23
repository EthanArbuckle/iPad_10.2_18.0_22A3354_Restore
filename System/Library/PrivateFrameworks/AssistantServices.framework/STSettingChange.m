@implementation STSettingChange

- (STSettingChange)initWithSettingType:(int64_t)a3 valueBeforeUpdate:(id)a4 valueAfterUpdate:(id)a5
{
  id v8;
  id v9;
  STSettingChange *v10;
  STSettingChange *v11;
  uint64_t v12;
  id valueBeforeUpdate;
  uint64_t v14;
  id valueAfterUpdate;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)STSettingChange;
  v10 = -[STSettingChange init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_settingType = a3;
    v12 = objc_msgSend(v8, "copy");
    valueBeforeUpdate = v11->_valueBeforeUpdate;
    v11->_valueBeforeUpdate = (id)v12;

    v14 = objc_msgSend(v9, "copy");
    valueAfterUpdate = v11->_valueAfterUpdate;
    v11->_valueAfterUpdate = (id)v14;

  }
  return v11;
}

- (int64_t)settingType
{
  return self->_settingType;
}

- (id)valueBeforeUpdate
{
  return self->_valueBeforeUpdate;
}

- (id)valueAfterUpdate
{
  return self->_valueAfterUpdate;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STSettingChange;
  v4 = a3;
  -[STSiriModelObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_settingType, CFSTR("_settingType"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_valueBeforeUpdate, CFSTR("_valueBeforeUpdate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_valueAfterUpdate, CFSTR("_valueAfterUpdate"));

}

- (STSettingChange)initWithCoder:(id)a3
{
  id v4;
  STSettingChange *v5;
  uint64_t v6;
  id valueBeforeUpdate;
  uint64_t v8;
  id valueAfterUpdate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STSettingChange;
  v5 = -[STSiriModelObject initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_settingType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_settingType"));
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("_valueBeforeUpdate"));
    v6 = objc_claimAutoreleasedReturnValue();
    valueBeforeUpdate = v5->_valueBeforeUpdate;
    v5->_valueBeforeUpdate = (id)v6;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("_valueAfterUpdate"));
    v8 = objc_claimAutoreleasedReturnValue();
    valueAfterUpdate = v5->_valueAfterUpdate;
    v5->_valueAfterUpdate = (id)v8;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueAfterUpdate, 0);
  objc_storeStrong(&self->_valueBeforeUpdate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
