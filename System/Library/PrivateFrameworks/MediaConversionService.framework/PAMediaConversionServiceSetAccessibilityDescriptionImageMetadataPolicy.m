@implementation PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy

+ (id)policyWithAccessibilityDescription:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setAccessibilityDescription:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy)initWithCoder:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("accessibilityDescription")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessibilityDescription"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy setAccessibilityDescription:](self, "setAccessibilityDescription:", v5);

  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy accessibilityDescription](self, "accessibilityDescription");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("accessibilityDescription"));

}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCED8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCEF0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy accessibilityDescription](self, "accessibilityDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy accessibilityDescription](self, "accessibilityDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v5);
  }
  else
  {
    if (!v5)
    {
      v9 = 0;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isEqual:", v7);
  }
  v9 = v8 ^ 1;

LABEL_6:
  return v9;
}

- (id)processMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "addEntriesFromDictionary:", v4);
  v7 = *MEMORY[0x1E0CBCED8];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCED8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  -[PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy accessibilityDescription](self, "accessibilityDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy accessibilityDescription](self, "accessibilityDescription");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CBCEF0]);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v7);
  return v6;
}

- (NSString)accessibilityDescription
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccessibilityDescription:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
}

@end
