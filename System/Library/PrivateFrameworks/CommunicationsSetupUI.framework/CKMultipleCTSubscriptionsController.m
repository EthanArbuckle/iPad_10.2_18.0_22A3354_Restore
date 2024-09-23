@implementation CKMultipleCTSubscriptionsController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKMultipleCTSubscriptionsController;
  -[CKMultipleCTSubscriptionsController viewDidLoad](&v5, sel_viewDidLoad);
  CommunicationsSetupUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", self->_controllerTitle, self->_controllerTitle, CFSTR("Messages"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMultipleCTSubscriptionsController setTitle:](self, "setTitle:", v4);
}

- (id)isEnabledForSubscription:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("NoImplementation"), CFSTR("%s must be implemented in a subclass."), "-[CKMultipleCTSubscriptionsController isEnabledForSubscription:]");
}

- (void)setEnabledForSubscription:(id)a3 specifier:(id)a4
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("NoImplementation"), CFSTR("%s must be implemented in a subclass."), "-[CKMultipleCTSubscriptionsController setEnabledForSubscription:specifier:]");
}

- (id)specifiers
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v27;
  void *v28;
  uint64_t v29;
  id obj;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (!v3)
  {
    v29 = (int)*MEMORY[0x24BE756E0];
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    CommunicationsSetupUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", self->_headerKey, self->_headerKey, CFSTR("Messages"));
    v6 = objc_claimAutoreleasedReturnValue();

    v28 = (void *)v6;
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, 0, 0, 0);
    v31 = v4;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:");
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[CKMultipleCTSubscriptionsController ctSubscriptions](self, "ctSubscriptions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v33 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x24BE511B0];
          objc_msgSend(v11, "phoneNumber");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "labelID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "IMUniqueIdentifierForPhoneNumber:simID:", v13, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v16 = (void *)MEMORY[0x24BE75590];
            objc_msgSend(v11, "label");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17, self, sel_setEnabledForSubscription_specifier_, sel_isEnabledForSubscription_, 0, 6, 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), self->_defaultsKey, v15);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setIdentifier:", v19);
            objc_msgSend(v11, "labelID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              objc_msgSend(v11, "labelID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setProperty:forKey:", v21, CFSTR("simID"));

            }
            objc_msgSend(v11, "phoneNumber");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              objc_msgSend(v11, "phoneNumber");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setProperty:forKey:", v23, CFSTR("phoneNumber"));

            }
            objc_msgSend(v31, "addObject:", v18);

          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v8);
    }

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v31);
    v24 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v25 = *(Class *)((char *)&self->super.super.super.super.super.isa + v29);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v29) = v24;

    v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v29);
  }
  return v3;
}

- (NSString)defaultsKey
{
  return self->_defaultsKey;
}

- (void)setDefaultsKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1376);
}

- (NSString)headerKey
{
  return self->_headerKey;
}

- (void)setHeaderKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1384);
}

- (NSString)controllerTitle
{
  return self->_controllerTitle;
}

- (void)setControllerTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1392);
}

- (NSArray)ctSubscriptions
{
  return self->_ctSubscriptions;
}

- (void)setCtSubscriptions:(id)a3
{
  objc_storeStrong((id *)&self->_ctSubscriptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ctSubscriptions, 0);
  objc_storeStrong((id *)&self->_controllerTitle, 0);
  objc_storeStrong((id *)&self->_headerKey, 0);
  objc_storeStrong((id *)&self->_defaultsKey, 0);
}

@end
