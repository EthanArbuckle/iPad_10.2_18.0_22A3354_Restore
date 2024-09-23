@implementation HPSResult

- (HPSResult)initWithSetting:(id)a3 accessoryIdentifier:(id)a4 error:(id)a5 result:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  HPSResult *v14;
  HPSResult *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HPSResult;
  v14 = -[HPSResult init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_isSuccess = a6;
    objc_storeStrong((id *)&v14->_error, a5);
    objc_storeStrong((id *)&v15->_accessoryIdentifier, a4);
    objc_storeStrong((id *)&v15->_setting, a3);
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[HPSResult accessoryIdentifier](self, "accessoryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("AccessoryIdentifier"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HPSResult isSuccess](self, "isSuccess"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("Success"));

  -[HPSResult setting](self, "setting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;
    if (v9)
    {
      _HPSLoggingFacility();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[HPSResult encodeWithCoder:].cold.1((uint64_t)v9, v10);

    }
    else
    {
      objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("Value"));
    }

  }
  -[HPSResult error](self, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("Error"));

}

- (HPSResult)initWithCoder:(id)a3
{
  id v4;
  HPSResult *v5;
  uint64_t v6;
  NSUUID *accessoryIdentifier;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  HPSSetting *setting;
  HPSResult *v13;
  uint64_t v14;
  NSError *error;
  id v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HPSResult;
  v5 = -[HPSResult init](&v18, sel_init);
  if (!v5)
  {
LABEL_13:
    v13 = v5;
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("AccessoryIdentifier")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AccessoryIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    accessoryIdentifier = v5->_accessoryIdentifier;
    v5->_accessoryIdentifier = (NSUUID *)v6;

  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Success"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5->_isSuccess = objc_msgSend(v8, "BOOLValue");
  }
  if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("Value")))
    goto LABEL_17;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Value"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, &v17);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v17;
  setting = v5->_setting;
  v5->_setting = (HPSSetting *)v10;

  if (!v11)
  {
LABEL_17:
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("Error")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Error"));
      v14 = objc_claimAutoreleasedReturnValue();
      error = v5->_error;
      v5->_error = (NSError *)v14;

    }
    goto LABEL_13;
  }

  v13 = 0;
LABEL_14:

  return v13;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  if (-[HPSResult isSuccess](self, "isSuccess"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  -[HPSResult accessoryIdentifier](self, "accessoryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSResult setting](self, "setting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSResult error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n Success = %@, \n Accessory Identifier = %@, \n Setting = [%@], \n Error = %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HPSSetting)setting
{
  return self->_setting;
}

- (NSUUID)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)isSuccess
{
  return self->_isSuccess;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_setting, 0);
}

- (void)encodeWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_22DF16000, a2, OS_LOG_TYPE_ERROR, "Encoding result failed with error %@", (uint8_t *)&v2, 0xCu);
}

@end
