@implementation PAMediaConversionServiceAddPFMetadataPolicy

+ (id)policyWithKey:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setKey:", v6);

  objc_msgSend(v7, "setValue:", v5);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAMediaConversionServiceAddPFMetadataPolicy)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("mediaMetadataType")))
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("mediaMetadataType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PAMediaConversionServiceAddPFMetadataPolicy setKey:](self, "setKey:", v5);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("mediaMetadataValue")))
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("mediaMetadataValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PAMediaConversionServiceAddPFMetadataPolicy setValue:](self, "setValue:", v6);

  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PAMediaConversionServiceAddPFMetadataPolicy key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("mediaMetadataType"));

  -[PAMediaConversionServiceAddPFMetadataPolicy value](self, "value");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("mediaMetadataValue"));

}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  return 1;
}

- (id)processMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "addEntriesFromDictionary:", v4);
  v7 = (void *)MEMORY[0x1E0D75148];
  -[PAMediaConversionServiceAddPFMetadataPolicy key](self, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PAMediaConversionServiceAddPFMetadataPolicy value](self, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v7, "addMakerApplePropertyWithKey:value:toProperties:", v8, v9, v6);

  if ((v7 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = 138412290;
    v12 = 0;
    _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to add metadata: %@", (uint8_t *)&v11, 0xCu);
  }

  return v6;
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)value
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
