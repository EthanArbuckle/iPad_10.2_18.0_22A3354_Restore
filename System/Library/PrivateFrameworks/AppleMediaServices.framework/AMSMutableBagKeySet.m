@implementation AMSMutableBagKeySet

- (void)addBagKey:(id)a3 valueType:(unint64_t)a4
{
  -[AMSMutableBagKeySet addBagKey:valueType:defaultValue:](self, "addBagKey:valueType:defaultValue:", a3, a4, 0);
}

- (void)addBagKey:(id)a3 valueType:(unint64_t)a4 defaultValue:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a3;
  -[AMSBagKeySet defaultValues](self, "defaultValues");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v8);

}

- (void)unionBagKeySet:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(a3, "defaultValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__AMSMutableBagKeySet_unionBagKeySet___block_invoke;
  v5[3] = &unk_1E253E880;
  v5[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __38__AMSMutableBagKeySet_unionBagKeySet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "defaultValues");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, v6);

}

@end
