@implementation AXAuditPreferenceController

+ (AXAuditPreferenceController)sharedController
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__AXAuditPreferenceController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_once != -1)
    dispatch_once(&sharedController_once, block);
  return (AXAuditPreferenceController *)(id)sharedController_sharedInstance;
}

void __47__AXAuditPreferenceController_sharedController__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedController_sharedInstance;
  sharedController_sharedInstance = (uint64_t)v1;

}

- (AXAuditPreferenceController)init
{
  AXAuditPreferenceController *v2;
  uint64_t v3;
  NSMutableDictionary *preferenceDictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXAuditPreferenceController;
  v2 = -[AXAuditPreferenceController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    preferenceDictionary = v2->_preferenceDictionary;
    v2->_preferenceDictionary = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)dealloc
{
  NSMutableDictionary *preferenceDictionary;
  objc_super v4;

  preferenceDictionary = self->_preferenceDictionary;
  self->_preferenceDictionary = 0;

  v4.receiver = self;
  v4.super_class = (Class)AXAuditPreferenceController;
  -[AXAuditPreferenceController dealloc](&v4, sel_dealloc);
}

- (void)setSpinRunloop:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AXAuditPreferenceController preferenceDictionary](self, "preferenceDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v5, CFSTR("spinRunloop"));

}

- (BOOL)spinRunloop
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[AXAuditPreferenceController preferenceDictionary](self, "preferenceDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("spinRunloop"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[AXAuditPreferenceController preferenceDictionary](self, "preferenceDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("spinRunloop"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSMutableDictionary)preferenceDictionary
{
  return self->_preferenceDictionary;
}

- (void)setPreferenceDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_preferenceDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferenceDictionary, 0);
}

@end
