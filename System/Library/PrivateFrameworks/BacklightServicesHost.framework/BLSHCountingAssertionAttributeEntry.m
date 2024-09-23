@implementation BLSHCountingAssertionAttributeEntry

+ (id)activateForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5 attributeHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id *v15;
  id result;
  void *v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = -[BLSHCountingAssertionAttributeEntry initForAttribute:fromAssertion:forService:attributeHandler:]([BLSHCountingAssertionAttributeEntry alloc], "initForAttribute:fromAssertion:forService:attributeHandler:", v11, v12, v13, v14);
    -[BLSHCountingAssertionAttributeEntry activate](v15);

    return v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("attributeHandler:%@ is not a kindof BLSHLocalCountingAssertionAttributeHandler"), v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[BLSHCountingAssertionAttributeEntry activateForAttribute:fromAssertion:forService:attributeHandler:].cold.1(a2, (uint64_t)a1, (uint64_t)v17);
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)activate
{
  id WeakRetained;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 1);
    -[BLSHLocalCountingAssertionAttributeHandler incrementCountWithEntry:]((uint64_t)WeakRetained, a1);

  }
}

- (id)initForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5 attributeHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BLSHCountingAssertionAttributeEntry *v14;
  id *p_isa;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BLSHCountingAssertionAttributeEntry;
  v14 = -[BLSHCountingAssertionAttributeEntry init](&v17, sel_init);
  p_isa = (id *)&v14->super.isa;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_attribute, v10);
    objc_storeWeak(p_isa + 3, v11);
    objc_storeWeak(p_isa + 4, v12);
    objc_storeWeak(p_isa + 1, v13);
  }

  return p_isa;
}

- (BOOL)reactivateIfPossible
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_attributeHandler);
  -[BLSHLocalCountingAssertionAttributeHandler incrementCountWithEntry:]((uint64_t)WeakRetained, self);

  return 1;
}

- (void)invalidate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_attributeHandler);
  -[BLSHLocalCountingAssertionAttributeHandler decrementCountWithEntry:]((uint64_t)WeakRetained, self);

}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  BLSHCountingAssertionAttributeEntry *v12;

  v3 = (void *)objc_opt_new();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __50__BLSHCountingAssertionAttributeEntry_description__block_invoke;
  v10 = &unk_24D1BBE80;
  v11 = v3;
  v12 = self;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

void __50__BLSHCountingAssertionAttributeEntry_description__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", WeakRetained, CFSTR("attribute"));

  v5 = *(void **)(a1 + 32);
  v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
  NSStringFromBLSAssertingObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "appendObject:withName:", v7, CFSTR("assertion"));

  v9 = *(void **)(a1 + 32);
  v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
  v10 = (id)objc_msgSend(v9, "appendObject:withName:", v11, CFSTR("service"));

}

- (BLSAttribute)attribute
{
  return (BLSAttribute *)objc_loadWeakRetained((id *)&self->_attribute);
}

- (BLSAssertionServiceResponding)assertion
{
  return (BLSAssertionServiceResponding *)objc_loadWeakRetained((id *)&self->_assertion);
}

- (BLSHAssertionAttributeHandlerService)service
{
  return (BLSHAssertionAttributeHandlerService *)objc_loadWeakRetained((id *)&self->_service);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_service);
  objc_destroyWeak((id *)&self->_assertion);
  objc_destroyWeak((id *)&self->_attribute);
  objc_destroyWeak((id *)&self->_attributeHandler);
}

+ (void)activateForAttribute:(uint64_t)a3 fromAssertion:forService:attributeHandler:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("BLSHLocalCountingAssertionAttributeHandler.m");
  v16 = 1024;
  v17 = 136;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
