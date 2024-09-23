@implementation ENRegionServerAgencyExposureNotificationConfiguration

+ (BOOL)getNotificationConfiguration:(id *)a3 fromDictionary:(id)a4 locale:(id)a5 index:(unsigned __int8)a6
{
  uint64_t v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  BOOL v24;
  void *v25;
  ENRegionServerAgencyExposureNotificationConfiguration *v26;
  uint64_t v27;
  NSString *classificationName;
  uint64_t v29;
  NSURL *classificationURL;
  uint64_t v31;
  NSString *localizedExposureDetailBody;
  uint64_t v33;
  NSString *localizedNotificationBody;
  uint64_t v35;
  NSString *localizedNotificationSubject;
  ENRegionServerAgencyExposureNotificationConfiguration *v37;
  ENRegionServerAgencyExposureNotificationConfiguration *v38;
  void *v40;
  id v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  char v46;

  v6 = a6;
  v9 = a4;
  v10 = a5;
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v10, "localeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uppercaseString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __114__ENRegionServerAgencyExposureNotificationConfiguration_getNotificationConfiguration_fromDictionary_locale_index___block_invoke;
    v43[3] = &unk_24C38B1B8;
    v46 = v6;
    v13 = v12;
    v44 = v13;
    v14 = v9;
    v45 = v14;
    v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD2F464](v43);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@_%d"), CFSTR("classificationName"), v6);
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      v41 = v10;
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@_%d"), CFSTR("classificationURL"), v6);
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19)
          LogInvalidValueForKey(v14, v17);
      }
      else
      {
        v19 = 0;
      }

      ((void (**)(_QWORD, const __CFString *))v15)[2](v15, CFSTR("exposureDetailsBodyText"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        ((void (**)(_QWORD, const __CFString *))v15)[2](v15, CFSTR("notificationBody"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v40 = v16;
          v22 = v13;
          ((void (**)(_QWORD, const __CFString *))v15)[2](v15, CFSTR("notificationSubject"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23 != 0;
          if (v23)
          {
            v25 = v17;
            v26 = objc_alloc_init(ENRegionServerAgencyExposureNotificationConfiguration);
            v27 = objc_msgSend(v42, "copy");
            classificationName = v26->_classificationName;
            v26->_classificationName = (NSString *)v27;

            v29 = objc_msgSend(v19, "copy");
            classificationURL = v26->_classificationURL;
            v26->_classificationURL = (NSURL *)v29;

            v31 = objc_msgSend(v20, "copy");
            localizedExposureDetailBody = v26->_localizedExposureDetailBody;
            v26->_localizedExposureDetailBody = (NSString *)v31;

            v33 = objc_msgSend(v21, "copy");
            localizedNotificationBody = v26->_localizedNotificationBody;
            v26->_localizedNotificationBody = (NSString *)v33;

            v35 = objc_msgSend(v23, "copy");
            localizedNotificationSubject = v26->_localizedNotificationSubject;
            v26->_localizedNotificationSubject = (NSString *)v35;

            v37 = v26;
            v17 = v25;
            v24 = v23 != 0;
            v38 = objc_retainAutorelease(v37);
            *a3 = v38;

          }
          v13 = v22;
          v16 = v40;
        }
        else
        {
          v24 = 0;
        }

      }
      else
      {
        v24 = 0;
      }

      v10 = v41;
    }
    else
    {
      *a3 = 0;
      v24 = 1;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

id __114__ENRegionServerAgencyExposureNotificationConfiguration_getNotificationConfiguration_fromDictionary_locale_index___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDD17C8];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("%@_%d_%@"), v4, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *classificationName;
  id v5;

  classificationName = self->_classificationName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", classificationName, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_classificationURL, CFSTR("URL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedExposureDetailBody, CFSTR("expB"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedNotificationBody, CFSTR("noteB"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedNotificationSubject, CFSTR("noteT"));

}

- (ENRegionServerAgencyExposureNotificationConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ENRegionServerAgencyExposureNotificationConfiguration *v9;
  NSURL *v10;
  NSURL *classificationURL;
  ENRegionServerAgencyExposureNotificationConfiguration *v12;
  objc_super v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expB"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("noteB"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("noteT"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8
          && (v14.receiver = self,
              v14.super_class = (Class)ENRegionServerAgencyExposureNotificationConfiguration,
              v9 = -[ENRegionServerAgencyExposureNotificationConfiguration init](&v14, sel_init),
              (self = v9) != 0))
        {
          objc_storeStrong((id *)&v9->_classificationName, v5);
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
          v10 = (NSURL *)objc_claimAutoreleasedReturnValue();
          classificationURL = self->_classificationURL;
          self->_classificationURL = v10;

          objc_storeStrong((id *)&self->_localizedExposureDetailBody, v6);
          objc_storeStrong((id *)&self->_localizedNotificationBody, v7);
          objc_storeStrong((id *)&self->_localizedNotificationSubject, v8);
          self = self;
          v12 = self;
        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)classificationName
{
  return self->_classificationName;
}

- (NSURL)classificationURL
{
  return self->_classificationURL;
}

- (NSString)localizedExposureDetailBody
{
  return self->_localizedExposureDetailBody;
}

- (NSString)localizedNotificationSubject
{
  return self->_localizedNotificationSubject;
}

- (NSString)localizedNotificationBody
{
  return self->_localizedNotificationBody;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedNotificationBody, 0);
  objc_storeStrong((id *)&self->_localizedNotificationSubject, 0);
  objc_storeStrong((id *)&self->_localizedExposureDetailBody, 0);
  objc_storeStrong((id *)&self->_classificationURL, 0);
  objc_storeStrong((id *)&self->_classificationName, 0);
}

@end
