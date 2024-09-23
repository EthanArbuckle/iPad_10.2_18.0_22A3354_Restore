@implementation HULinkedApplicationItem

- (HULinkedApplicationItem)init
{
  HULinkedApplicationItem *v2;
  uint64_t v3;
  NSSet *associatedAccessories;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HULinkedApplicationItem;
  v2 = -[HULinkedApplicationItem init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    associatedAccessories = v2->_associatedAccessories;
    v2->_associatedAccessories = (NSSet *)v3;

  }
  return v2;
}

- (NSString)bundleIdentifier
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HULinkedApplicationItem.m"), 58, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HULinkedApplicationItem bundleIdentifier]", objc_opt_class());

  return 0;
}

+ (id)na_identity
{
  if (_MergedGlobals_631 != -1)
    dispatch_once(&_MergedGlobals_631, &__block_literal_global_22_2);
  return (id)qword_1ED580BA0;
}

void __38__HULinkedApplicationItem_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_27_0);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_29_1);
  objc_msgSend(v0, "build");
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)qword_1ED580BA0;
  qword_1ED580BA0 = v3;

}

uint64_t __38__HULinkedApplicationItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleIdentifier");
}

uint64_t __38__HULinkedApplicationItem_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "associatedAccessories");
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (int)_iconVariantForScale:(double)a3
{
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (a3 >= 2.0)
    v6 = 15;
  else
    v6 = 0;
  if (a3 < 3.0)
    v7 = v6;
  else
    v7 = 32;
  if (a3 < 2.0)
    v8 = 1;
  else
    v8 = 24;
  if (v5 == 1)
    return v8;
  else
    return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0D314B8]);
  v11[0] = CFSTR("HFResultApplicationBundleIdentifier");
  -[HULinkedApplicationItem bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("HFResultApplicationAssociatedAccessories");
  v12[0] = v5;
  -[HULinkedApplicationItem associatedAccessories](self, "associatedAccessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithResults:", v7);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_failedUpdateOutcome
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D314B8]);
  v7 = *MEMORY[0x1E0D30D70];
  v8[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithResults:", v3);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSSet)associatedAccessories
{
  return self->_associatedAccessories;
}

- (void)setAssociatedAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_associatedAccessories, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedAccessories, 0);
}

@end
