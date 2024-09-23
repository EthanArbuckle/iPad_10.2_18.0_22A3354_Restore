@implementation DMTConfigurationPrimitive

- (DMTConfigurationPrimitive)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  DMTConfigurationPrimitive *v7;
  uint64_t v8;
  NSDictionary *rawDictionary;
  uint64_t v10;
  id v11;
  NSString *displayName;
  uint64_t v13;
  id v14;
  NSString *identifier;
  uint64_t v16;
  id v17;
  NSString *type;
  uint64_t v19;
  id v20;
  NSString *uuid;
  DMTConfigurationPrimitive *v22;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)DMTConfigurationPrimitive;
  v7 = -[DMTConfigurationPrimitive init](&v28, sel_init);
  if (!v7)
    goto LABEL_5;
  v8 = objc_msgSend(v6, "copy");
  rawDictionary = v7->_rawDictionary;
  v7->_rawDictionary = (NSDictionary *)v8;

  v27 = 0;
  DMTValidateProfileString(v6, CFSTR("PayloadDisplayName"), 1, &v27);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v27;
  displayName = v7->_displayName;
  v7->_displayName = (NSString *)v10;

  v26 = v11;
  DMTValidateProfileString(v6, CFSTR("PayloadIdentifier"), 0, &v26);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v26;

  identifier = v7->_identifier;
  v7->_identifier = (NSString *)v13;

  v25 = v14;
  DMTValidateProfileString(v6, CFSTR("PayloadType"), 0, &v25);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v25;

  type = v7->_type;
  v7->_type = (NSString *)v16;

  v24 = v17;
  DMTValidateProfileString(v6, CFSTR("PayloadUUID"), 0, &v24);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v24;

  uuid = v7->_uuid;
  v7->_uuid = (NSString *)v19;

  if (v20)
  {
    if (a4)
    {
      v20 = objc_retainAutorelease(v20);
      v22 = 0;
      *a4 = v20;
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
LABEL_5:
    v22 = v7;
    v20 = 0;
  }

  return v22;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSDictionary)rawDictionary
{
  return self->_rawDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawDictionary, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
