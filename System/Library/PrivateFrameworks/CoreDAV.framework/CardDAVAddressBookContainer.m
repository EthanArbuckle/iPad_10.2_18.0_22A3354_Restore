@implementation CardDAVAddressBookContainer

+ (id)copyPropertyMappingsForParser
{
  id v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CardDAVAddressBookContainer;
  v2 = objc_msgSendSuper2(&v5, sel_copyPropertyMappingsForParser);
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(v3, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("urn:ietf:params:xml:ns:carddav"), CFSTR("max-resource-size"), objc_opt_class());
  objc_msgSend(v3, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("urn:ietf:params:xml:ns:carddav"), CFSTR("max-image-size"), objc_opt_class());
  objc_msgSend(v3, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("http://me.com/_namespace/"), CFSTR("guardian-restricted"), objc_opt_class());
  objc_msgSend(v3, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("http://calendarserver.org/ns/"), CFSTR("me-card"), objc_opt_class());
  objc_msgSend(v3, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("urn:mobileme:davservices"), CFSTR("quota-available"), objc_opt_class());
  objc_msgSend(v3, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("urn:mobileme:davservices"), CFSTR("quota-used"), objc_opt_class());

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CardDAVAddressBookContainer;
  -[CoreDAVContainer description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16A8];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %p: "), v6, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "appendFormat:", CFSTR(" PARENT CLASS: %@"), v3);
  -[CardDAVAddressBookContainer maxResourceSize](self, "maxResourceSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tmaxResourceSize: %@"), v8);

  -[CardDAVAddressBookContainer maxImageSize](self, "maxImageSize");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tmaxImageSize: %@"), v9);

  return v7;
}

- (void)applyParsedProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CardDAVAddressBookContainer;
  v4 = a3;
  -[CoreDAVContainer applyParsedProperties:](&v17, sel_applyParsedProperties_, v4);
  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("urn:ietf:params:xml:ns:carddav"), CFSTR("max-resource-size"), v17.receiver, v17.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payloadAsString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CardDAVAddressBookContainer setMaxResourceSize:](self, "setMaxResourceSize:", v6);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("urn:ietf:params:xml:ns:carddav"), CFSTR("max-image-size"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "payloadAsString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CardDAVAddressBookContainer setMaxImageSize:](self, "setMaxImageSize:", v8);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("http://calendarserver.org/ns/"), CFSTR("me-card"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "href");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "payloadAsFullURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CardDAVAddressBookContainer setMeCardURL:](self, "setMeCardURL:", v11);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("http://me.com/_namespace/"), CFSTR("guardian-restricted"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "payloadAsString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CardDAVAddressBookContainer setIsGuardianRestricted:](self, "setIsGuardianRestricted:", objc_msgSend(v13, "isEqualToString:", CFSTR("true")));

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("urn:mobileme:davservices"), CFSTR("quota-available"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "otherBytes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v14, "otherBytes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CardDAVAddressBookContainer setIsImageUploadRestricted:](self, "setIsImageUploadRestricted:", objc_msgSend(v16, "payloadAsNSInteger") < 1);

    }
    else
    {
      -[CardDAVAddressBookContainer setIsImageUploadRestricted:](self, "setIsImageUploadRestricted:", 0);
    }

  }
  else
  {
    -[CardDAVAddressBookContainer setIsImageUploadRestricted:](self, "setIsImageUploadRestricted:", 0);
  }

}

- (BOOL)isAddressBook
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[CoreDAVContainer resourceType](self, "resourceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CoreDAVContainer resourceType](self, "resourceType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addressBook");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isSearchAddressBook
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  -[CoreDAVContainer resourceType](self, "resourceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CoreDAVContainer resourceType](self, "resourceType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchAddressBook");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = 1;
    }
    else
    {
      -[CoreDAVContainer resourceType](self, "resourceType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "isTypeWithNameSpace:andName:", CFSTR("urn:ietf:params:xml:ns:carddav"), CFSTR("directory"));

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isSharedAddressBook
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (!-[CardDAVAddressBookContainer isAddressBook](self, "isAddressBook"))
    return 0;
  -[CoreDAVContainer resourceType](self, "resourceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CoreDAVContainer resourceType](self, "resourceType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)maxResourceSize
{
  return self->_maxResourceSize;
}

- (void)setMaxResourceSize:(id)a3
{
  objc_storeStrong((id *)&self->_maxResourceSize, a3);
}

- (NSString)maxImageSize
{
  return self->_maxImageSize;
}

- (void)setMaxImageSize:(id)a3
{
  objc_storeStrong((id *)&self->_maxImageSize, a3);
}

- (NSURL)meCardURL
{
  return self->_meCardURL;
}

- (void)setMeCardURL:(id)a3
{
  objc_storeStrong((id *)&self->_meCardURL, a3);
}

- (BOOL)isGuardianRestricted
{
  return self->_isGuardianRestricted;
}

- (void)setIsGuardianRestricted:(BOOL)a3
{
  self->_isGuardianRestricted = a3;
}

- (BOOL)isImageUploadRestricted
{
  return self->_isImageUploadRestricted;
}

- (void)setIsImageUploadRestricted:(BOOL)a3
{
  self->_isImageUploadRestricted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meCardURL, 0);
  objc_storeStrong((id *)&self->_maxImageSize, 0);
  objc_storeStrong((id *)&self->_maxResourceSize, 0);
}

@end
