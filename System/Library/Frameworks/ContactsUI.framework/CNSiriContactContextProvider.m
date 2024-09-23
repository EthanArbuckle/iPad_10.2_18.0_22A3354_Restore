@implementation CNSiriContactContextProvider

+ (id)descriptorForRequiredKeys
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[CNCapabilitiesManager defaultCapabilitiesManager](CNCapabilitiesManager, "defaultCapabilitiesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasSiriCapability");

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C97200];
    -[objc_class descriptorsForRequiredKeys](getCNAssistantConversionClass(), "descriptorsForRequiredKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNSiriContactContextProvider descriptorForRequiredKeys]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "descriptorWithKeyDescriptors:description:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (CNSiriContactContextProvider)initWithContact:(id)a3 store:(id)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  CNSiriContactContextProvider *v11;
  id *p_isa;
  CNSiriContactContextProvider *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  +[CNCapabilitiesManager defaultCapabilitiesManager](CNCapabilitiesManager, "defaultCapabilitiesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasSiriCapability");

  if (v10)
  {
    v15.receiver = self;
    v15.super_class = (Class)CNSiriContactContextProvider;
    v11 = -[CNSiriContactContextProvider init](&v15, sel_init);
    p_isa = (id *)&v11->super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_contact, a3);
      objc_storeStrong(p_isa + 3, a4);
    }
    self = p_isa;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[CNSiriContactContextProvider setIsEnabled:](self, "setIsEnabled:");
  -[CNSiriContactContextProvider defaultContextManager](self, "defaultContextManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "addContextProvider:", self);
  else
    objc_msgSend(v5, "removeContextProvider:", self);

}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (id)defaultContextManager
{
  return (id)objc_msgSend((Class)getAFContextManagerClass[0](), "defaultContextManager");
}

- (void)dealloc
{
  void *v3;
  int v4;
  objc_super v5;

  +[CNCapabilitiesManager defaultCapabilitiesManager](CNCapabilitiesManager, "defaultCapabilitiesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSiriCapability");

  if (v4)
    -[CNSiriContactContextProvider performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__removeContextProviderOnMainThread, 0, 1);
  v5.receiver = self;
  v5.super_class = (Class)CNSiriContactContextProvider;
  -[CNSiriContactContextProvider dealloc](&v5, sel_dealloc);
}

- (BOOL)allowContextProvider:(id)a3
{
  return 1;
}

- (id)getCurrentContext
{
  Class CNAssistantConversionClass;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  CNAssistantConversionClass = getCNAssistantConversionClass();
  -[CNSiriContactContextProvider contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class createSAPersonFromCNContact:](CNAssistantConversionClass, "createSAPersonFromCNContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_removeContextProviderOnMainThread
{
  id v3;

  -[CNSiriContactContextProvider defaultContextManager](self, "defaultContextManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeContextProvider:", self);

}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (CNContactStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
