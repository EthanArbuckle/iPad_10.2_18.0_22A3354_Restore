@implementation DMCPayloadUserInputField

- (DMCPayloadUserInputField)initWithFieldDictionary:(id)a3
{
  id v4;
  DMCPayloadUserInputField *v5;
  uint64_t v6;
  NSMutableDictionary *fieldDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMCPayloadUserInputField;
  v5 = -[DMCPayloadUserInputField init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    fieldDictionary = v5->_fieldDictionary;
    v5->_fieldDictionary = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (void)setUserResponse:(id)a3
{
  void *v4;
  id response;

  v4 = (void *)objc_msgSend(a3, "copy");
  response = self->_response;
  self->_response = v4;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DMCPayloadUserInputField;
  -[DMCPayloadUserInputField description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary description](self->_fieldDictionary, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int)type
{
  void *v2;
  int v3;

  -[NSMutableDictionary objectForKey:](self->_fieldDictionary, "objectForKey:", *MEMORY[0x24BE63D58]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (int)flags
{
  void *v2;
  int v3;

  -[NSMutableDictionary objectForKey:](self->_fieldDictionary, "objectForKey:", *MEMORY[0x24BE63D68]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (NSNumber)minimumLength
{
  return (NSNumber *)-[NSMutableDictionary objectForKey:](self->_fieldDictionary, "objectForKey:", *MEMORY[0x24BE63D70]);
}

- (NSString)title
{
  return (NSString *)-[NSMutableDictionary objectForKey:](self->_fieldDictionary, "objectForKey:", *MEMORY[0x24BE63D98]);
}

- (NSString)fieldDescription
{
  return (NSString *)-[NSMutableDictionary objectForKey:](self->_fieldDictionary, "objectForKey:", *MEMORY[0x24BE63D50]);
}

- (void)setFieldDescription:(id)a3
{
  -[NSMutableDictionary setObject:forKey:](self->_fieldDictionary, "setObject:forKey:", a3, *MEMORY[0x24BE63D50]);
}

- (NSString)retypeDescription
{
  return (NSString *)-[NSMutableDictionary objectForKey:](self->_fieldDictionary, "objectForKey:", *MEMORY[0x24BE63D90]);
}

- (NSString)mismatchDescription
{
  return (NSString *)-[NSMutableDictionary objectForKey:](self->_fieldDictionary, "objectForKey:", *MEMORY[0x24BE63D78]);
}

- (NSString)finePrint
{
  return (NSString *)-[NSMutableDictionary objectForKey:](self->_fieldDictionary, "objectForKey:", *MEMORY[0x24BE63D60]);
}

- (void)setFinePrint:(id)a3
{
  -[NSMutableDictionary setObject:forKey:](self->_fieldDictionary, "setObject:forKey:", a3, *MEMORY[0x24BE63D60]);
}

- (NSString)defaultValue
{
  return (NSString *)-[NSMutableDictionary objectForKey:](self->_fieldDictionary, "objectForKey:", *MEMORY[0x24BE63D48]);
}

- (NSString)placeholderValue
{
  return (NSString *)-[NSMutableDictionary objectForKey:](self->_fieldDictionary, "objectForKey:", *MEMORY[0x24BE63D80]);
}

- (id)_uuid
{
  return (id)-[NSMutableDictionary objectForKey:](self->_fieldDictionary, "objectForKey:", *MEMORY[0x24BE63DA0]);
}

- (id)responseDictionary
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE70];
  -[DMCPayloadUserInputField _uuid](self, "_uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, *MEMORY[0x24BE63DA0], self->_response, *MEMORY[0x24BE63D88], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)keyboardType
{
  int v2;

  v2 = -[DMCPayloadUserInputField type](self, "type") - 1;
  if (v2 > 6)
    return 0;
  else
    return qword_21639B710[v2];
}

- (int64_t)capitalizationType
{
  return -[DMCPayloadUserInputField type](self, "type") == 6;
}

- (BOOL)isRequired
{
  return (-[DMCPayloadUserInputField flags](self, "flags") & 5) == 0;
}

- (BOOL)isPassword
{
  unsigned int v2;

  v2 = -[DMCPayloadUserInputField type](self, "type");
  return (v2 < 8) & (0xB8u >> v2);
}

- (BOOL)needsRetype
{
  return (-[DMCPayloadUserInputField flags](self, "flags") >> 1) & 1;
}

- (BOOL)isDevicePasscodeField
{
  return (-[DMCPayloadUserInputField flags](self, "flags") >> 3) & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_response, 0);
  objc_storeStrong((id *)&self->_fieldDictionary, 0);
}

@end
