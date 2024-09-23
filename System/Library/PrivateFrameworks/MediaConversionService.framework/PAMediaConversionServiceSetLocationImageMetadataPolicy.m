@implementation PAMediaConversionServiceSetLocationImageMetadataPolicy

- (PAMediaConversionServiceSetLocationImageMetadataPolicy)initWithCoder:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("location")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PAMediaConversionServiceSetLocationImageMetadataPolicy setLocation:](self, "setLocation:", v5);

  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PAMediaConversionServiceSetLocationImageMetadataPolicy location](self, "location");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("location"));

}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCD68]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PAMediaConversionServiceSetLocationImageMetadataPolicy location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0D75280];
    -[PAMediaConversionServiceSetLocationImageMetadataPolicy location](self, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "gpsDictionaryForLocation:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "isEqualToDictionary:", v4);
  }
  else
  {
    if (!v4)
    {
      v10 = 0;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "isEqual:", v8);
  }
  v10 = v9 ^ 1;

LABEL_6:
  return v10;
}

- (id)processMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "addEntriesFromDictionary:", v4);
  -[PAMediaConversionServiceSetLocationImageMetadataPolicy location](self, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0D75280];
    -[PAMediaConversionServiceSetLocationImageMetadataPolicy location](self, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "gpsDictionaryForLocation:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CBCD68]);

  return v6;
}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

+ (id)policyWithLocation:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setLocation:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
