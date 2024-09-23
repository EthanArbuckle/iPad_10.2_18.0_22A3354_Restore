@implementation AUAudioUnitProperty

- (AUAudioUnitProperty)initWithKey:(id)a3
{
  id v5;
  AUAudioUnitProperty *v6;
  AUAudioUnitProperty *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AUAudioUnitProperty;
  v6 = -[AUAudioUnitProperty init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_key, a3);
    *(_QWORD *)&v7->_v2propID = 0xFFFFFFFFLL;
    v7->_element = 0;
  }

  return v7;
}

- (AUAudioUnitProperty)initWithKey:(id)a3 scope:(unsigned int)a4 element:(unsigned int)a5
{
  id v9;
  AUAudioUnitProperty *v10;
  AUAudioUnitProperty *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AUAudioUnitProperty;
  v10 = -[AUAudioUnitProperty init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_key, a3);
    v11->_v2propID = -1;
    v11->_scope = a4;
    v11->_element = a5;
  }

  return v11;
}

- (AUAudioUnitProperty)initWithKey:(id)a3 v2propID:(unsigned int)a4 scope:(unsigned int)a5 element:(unsigned int)a6
{
  id v11;
  AUAudioUnitProperty *v12;
  AUAudioUnitProperty *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AUAudioUnitProperty;
  v12 = -[AUAudioUnitProperty init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_key, a3);
    v13->_v2propID = a4;
    v13->_scope = a5;
    v13->_element = a6;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_key, CFSTR("key"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_v2propID, CFSTR("v2propID"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_scope, CFSTR("scope"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_element, CFSTR("element"));

}

- (AUAudioUnitProperty)initWithCoder:(id)a3
{
  id v4;
  AUAudioUnitProperty *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AUAudioUnitProperty;
  v5 = -[AUAudioUnitProperty init](&v9, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("key"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v5->_key, v7);

    v5->_v2propID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("v2propID"));
    v5->_scope = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scope"));
    v5->_element = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("element"));
  }

  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AUAudioUnitProperty;
  -[AUAudioUnitProperty dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

+ (id)propertyWithKey:(id)a3
{
  id v3;
  AUAudioUnitProperty *v4;

  v3 = a3;
  v4 = -[AUAudioUnitProperty initWithKey:]([AUAudioUnitProperty alloc], "initWithKey:", v3);

  return v4;
}

+ (id)propertyWithKey:(id)a3 scope:(unsigned int)a4 element:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  AUAudioUnitProperty *v8;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = -[AUAudioUnitProperty initWithKey:scope:element:]([AUAudioUnitProperty alloc], "initWithKey:scope:element:", v7, v6, v5);

  return v8;
}

+ (id)propertyWithKey:(id)a3 v2propID:(unsigned int)a4 scope:(unsigned int)a5 element:(unsigned int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  AUAudioUnitProperty *v10;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v9 = a3;
  v10 = -[AUAudioUnitProperty initWithKey:v2propID:scope:element:]([AUAudioUnitProperty alloc], "initWithKey:v2propID:scope:element:", v9, v8, v7, v6);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
