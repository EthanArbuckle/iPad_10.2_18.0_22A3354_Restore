@implementation CLKLocalizableCompoundTextProvider

- (CLKLocalizableCompoundTextProvider)initWithFormatKey:(id)a3 textProviders:(id)a4
{
  id v6;
  id v7;
  CLKLocalizableCompoundTextProvider *v8;
  uint64_t v9;
  NSString *formatKey;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *textProviders;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)CLKLocalizableCompoundTextProvider;
  v8 = -[CLKTextProvider initPrivate](&v25, sel_initPrivate);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    formatKey = v8->_formatKey;
    v8->_formatKey = (NSString *)v9;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16), "finalizedCopy", (_QWORD)v21);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v14);
    }

    v18 = objc_msgSend(v11, "copy");
    textProviders = v8->_textProviders;
    v8->_textProviders = (NSArray *)v18;

  }
  return v8;
}

- (id)_localizedStringForKey:(id)a3 withBundle:(id)a4 forLocalization:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  NSObject *v22;
  void *v23;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v7)
  {
    v17 = 0;
    goto LABEL_19;
  }
  if (!v8)
  {
LABEL_18:
    v17 = v7;
    goto LABEL_19;
  }
  if (!v9)
  {
LABEL_14:
    objc_msgSend(v8, "localizedStringForKey:value:table:", v7, v7, CFSTR("ckcomplication"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
      goto LABEL_19;
    CLKLoggingObjectForDomain(4);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "bundlePath");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v7;
      v27 = 2112;
      v28 = v23;
      _os_log_impl(&dword_2114F4000, v22, OS_LOG_TYPE_DEFAULT, "Didn't find entry for '%@' in %@", buf, 0x16u);

    }
    goto LABEL_18;
  }
  objc_msgSend(v8, "bundlePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.lproj"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    CLKLoggingObjectForDomain(4);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v13;
      v19 = "Didn't find requested localization bundle at path %@";
      v20 = v18;
      v21 = 12;
LABEL_12:
      _os_log_impl(&dword_2114F4000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
    }
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend(v14, "localizedStringForKey:value:table:", v7, v7, CFSTR("ckcomplication"));
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    CLKLoggingObjectForDomain(4);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v7;
      v27 = 2112;
      v28 = v13;
      v19 = "Didn't find entry for '%@' in %@";
      v20 = v18;
      v21 = 22;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v17 = (id)v16;

LABEL_19:
  return v17;
}

- (id)_localizedTextProviderWithBundle:(id)a3 forLocalization:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSString *formatKey;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  NSString *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v22 = a3;
  v6 = a4;
  -[CLKLocalizableCompoundTextProvider _localizedStringForKey:withBundle:forLocalization:](self, "_localizedStringForKey:withBundle:forLocalization:", self->_formatKey, v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CLKLoggingObjectForDomain(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    formatKey = self->_formatKey;
    *(_DWORD *)buf = 138412546;
    v29 = formatKey;
    v30 = 2112;
    v31 = v7;
    _os_log_impl(&dword_2114F4000, v8, OS_LOG_TYPE_DEFAULT, "Localized format '%@' to '%@'", buf, 0x16u);
  }

  if (!v7)
    goto LABEL_27;
  v10 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = self->_textProviders;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v12)
  {

    goto LABEL_23;
  }
  v13 = v12;
  v14 = 0;
  v15 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v24 != v15)
        objc_enumerationMutation(v11);
      v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v17, "localizedTextProviderWithBundle:forLocalization:", v22, v6);
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(v10, "addObject:", v18);
          goto LABEL_18;
        }
        CLKLoggingObjectForDomain(4);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v29 = (NSString *)v17;
          _os_log_error_impl(&dword_2114F4000, v19, OS_LOG_TYPE_ERROR, "Error: %@ returned nil when being localized", buf, 0xCu);
        }

      }
      else
      {
        CLKLoggingObjectForDomain(4);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v29 = (NSString *)v17;
          _os_log_error_impl(&dword_2114F4000, v18, OS_LOG_TYPE_ERROR, "Error: %@ not a CLKTextProvider", buf, 0xCu);
        }
      }
      v14 = 1;
LABEL_18:

    }
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v13);

  if ((v14 & 1) != 0)
  {
LABEL_26:

    goto LABEL_27;
  }
LABEL_23:
  if (!objc_msgSend(v10, "count"))
    goto LABEL_26;
  +[CLKCompoundTextProvider compoundProviderWithLocalizedFormat:localizedTextProviders:](CLKCompoundTextProvider, "compoundProviderWithLocalizedFormat:localizedTextProviders:", v7, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
LABEL_27:
    +[CLKSimpleTextProvider textProviderWithText:](CLKSimpleTextProvider, "textProviderWithText:", &stru_24CBFCB28);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4
{
  return 0;
}

- (BOOL)_validate
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)CLKLocalizableCompoundTextProvider;
  if (!-[CLKTextProvider _validate](&v14, sel__validate))
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_textProviders;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "validate", (_QWORD)v10))
        {
          v8 = 0;
          goto LABEL_13;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_13:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CLKLocalizableCompoundTextProvider *v4;
  uint64_t v5;
  NSArray *textProviders;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLKLocalizableCompoundTextProvider;
  v4 = -[CLKTextProvider copyWithZone:](&v8, sel_copyWithZone_, a3);
  if (v4 != self)
  {
    v5 = -[NSArray copy](self->_textProviders, "copy");
    textProviders = v4->_textProviders;
    v4->_textProviders = (NSArray *)v5;

    objc_storeStrong((id *)&v4->_formatKey, self->_formatKey);
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void **v4;
  char v5;
  objc_super v7;

  v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)CLKLocalizableCompoundTextProvider;
  if (-[CLKTextProvider isEqual:](&v7, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && CLKEqualObjects(self->_textProviders, v4[16]))
  {
    v5 = CLKEqualObjects(self->_formatKey, v4[17]);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  char *v3;
  char *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKLocalizableCompoundTextProvider;
  v3 = -[CLKTextProvider hash](&v6, sel_hash);
  v4 = &v3[-[NSArray hash](self->_textProviders, "hash")];
  return (unint64_t)&v4[4 * -[NSString hash](self->_formatKey, "hash")];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKLocalizableCompoundTextProvider;
  v4 = a3;
  -[CLKTextProvider encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_textProviders, CFSTR("_textProviders"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_formatKey, CFSTR("_formatKey"));

}

- (CLKLocalizableCompoundTextProvider)initWithCoder:(id)a3
{
  id v4;
  CLKLocalizableCompoundTextProvider *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *textProviders;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *formatKey;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CLKLocalizableCompoundTextProvider;
  v5 = -[CLKTextProvider initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_textProviders"));
    v9 = objc_claimAutoreleasedReturnValue();
    textProviders = v5->_textProviders;
    v5->_textProviders = (NSArray *)v9;

    v11 = v5->_textProviders;
    v12 = objc_opt_class();
    CLKValidateArray(v11, v12);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_formatKey"));
    v13 = objc_claimAutoreleasedReturnValue();
    formatKey = v5->_formatKey;
    v5->_formatKey = (NSString *)v13;

  }
  return v5;
}

- (id)_initWithJSONObjectRepresentation:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLKLocalizableCompoundTextProvider;
  v5 = -[CLKTextProvider _initWithJSONObjectRepresentation:](&v20, sel__initWithJSONObjectRepresentation_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("formatKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("key in '%@' dictionary must be a string - invalid value: %@"), CFSTR("formatKey"), v6);
    objc_storeStrong(v5 + 17, v6);
    objc_msgSend(v4, "objectForKeyedSubscript:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("key in '%@' dictionary must be an array - invalid value: %@"), CFSTR("textProviders"), v7);
    v8 = (void *)objc_opt_new();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v9);
          +[CLKTextProvider providerWithJSONObjectRepresentation:](CLKTextProvider, "providerWithJSONObjectRepresentation:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v13);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v10);
    }

    v14 = v5[16];
    v5[16] = v8;

  }
  return v5;
}

- (id)JSONObjectRepresentation
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKLocalizableCompoundTextProvider;
  -[CLKTextProvider JSONObjectRepresentation](&v6, sel_JSONObjectRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKLocalizableCompoundTextProvider _arrayOfTextProviderJSONObjectRepresentations](self, "_arrayOfTextProviderJSONObjectRepresentations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("textProviders"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_formatKey, CFSTR("formatKey"));
  return v3;
}

- (id)_arrayOfTextProviderJSONObjectRepresentations
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_textProviders;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "JSONObjectRepresentation", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatKey, 0);
  objc_storeStrong((id *)&self->_textProviders, 0);
}

@end
