@implementation DOCEnumerationProperties

- (DOCEnumerationProperties)initWithConfiguration:(id)a3 tags:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  DOCEnumerationProperties *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "hostIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "maximumNumberOfItemsToFetch");
  objc_msgSend(v7, "documentContentTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "excludedDocumentContentTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[DOCEnumerationProperties initWithHostIdentifier:maximumNumberOfItems:allowedContentTypes:excludedContentTypes:tags:](self, "initWithHostIdentifier:maximumNumberOfItems:allowedContentTypes:excludedContentTypes:tags:", v8, v9, v10, v11, v6);
  return v12;
}

- (DOCEnumerationProperties)initWithHostIdentifier:(id)a3 maximumNumberOfItems:(int64_t)a4 allowedContentTypes:(id)a5 excludedContentTypes:(id)a6 tags:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  DOCEnumerationProperties *v16;
  DOCEnumerationProperties *v17;
  void *v18;
  DOCEnumerationProperties *v19;
  objc_super v21;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)DOCEnumerationProperties;
  v16 = -[DOCEnumerationProperties init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    -[DOCEnumerationProperties setHostIdentifier:](v16, "setHostIdentifier:", v12);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCEnumerationProperties setMaximumNumberOfItems:](v17, "setMaximumNumberOfItems:", v18);

    -[DOCEnumerationProperties setAllowedContentTypes:](v17, "setAllowedContentTypes:", v13);
    -[DOCEnumerationProperties setExcludedContentTypes:](v17, "setExcludedContentTypes:", v14);
    -[DOCEnumerationProperties setTagIdentifiers:](v17, "setTagIdentifiers:", v15);
    v19 = v17;
  }

  return v17;
}

- (void)setMaximumNumberOfItems:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void)setAllowedContentTypes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void)setTagIdentifiers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void)setHostIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void)setExcludedContentTypes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSNumber)maximumNumberOfItems
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)hostIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)excludedContentTypes
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)allowedContentTypes
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
  objc_storeStrong((id *)&self->_allowedContentTypes, 0);
  objc_storeStrong((id *)&self->_excludedContentTypes, 0);
  objc_storeStrong((id *)&self->_tagIdentifiers, 0);
  objc_storeStrong((id *)&self->_maximumNumberOfItems, 0);
}

- (NSArray)tagIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

@end
