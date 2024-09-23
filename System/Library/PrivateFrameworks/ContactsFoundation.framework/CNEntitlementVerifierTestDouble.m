@implementation CNEntitlementVerifierTestDouble

- (CNEntitlementVerifierTestDouble)init
{
  CNEntitlementVerifierTestDouble *v2;
  uint64_t v3;
  NSMutableDictionary *entitlements;
  CNEntitlementVerifierTestDouble *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNEntitlementVerifierTestDouble;
  v2 = -[CNEntitlementVerifierTestDouble init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    entitlements = v2->_entitlements;
    v2->_entitlements = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)setCurrentProcessHasValue:(id)a3 forEntitlement:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "keyForEntitlement:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  +[CNResult successWithValue:](CNResult, "successWithValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_entitlements, "setObject:forKeyedSubscript:", v8, v9);
}

- (void)setCurrentProcessHasError:(id)a3 forEntitlement:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "keyForEntitlement:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  +[CNResult failureWithError:](CNResult, "failureWithError:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_entitlements, "setObject:forKeyedSubscript:", v8, v9);
}

- (void)setAuditToken:(id *)a3 hasValue:(id)a4 forEntitlement:(id)a5
{
  id v8;
  id v9;
  void *v10;
  __int128 v11;
  void *v12;
  void *v13;
  _OWORD v14[2];

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_opt_class();
  v11 = *(_OWORD *)&a3->var0[4];
  v14[0] = *(_OWORD *)a3->var0;
  v14[1] = v11;
  objc_msgSend(v10, "keyForEntitlement:auditToken:", v8, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNResult successWithValue:](CNResult, "successWithValue:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_entitlements, "setObject:forKeyedSubscript:", v13, v12);
}

- (void)setAuditToken:(id *)a3 hasError:(id)a4 forEntitlement:(id)a5
{
  id v8;
  id v9;
  void *v10;
  __int128 v11;
  void *v12;
  void *v13;
  _OWORD v14[2];

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_opt_class();
  v11 = *(_OWORD *)&a3->var0[4];
  v14[0] = *(_OWORD *)a3->var0;
  v14[1] = v11;
  objc_msgSend(v10, "keyForEntitlement:auditToken:", v8, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNResult failureWithError:](CNResult, "failureWithError:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_entitlements, "setObject:forKeyedSubscript:", v13, v12);
}

- (void)setAuditToken:(id *)a3 isFirstOrSecondParty:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  _OWORD v12[2];

  v4 = a4;
  v7 = (void *)objc_opt_class();
  v8 = *(_OWORD *)&a3->var0[4];
  v12[0] = *(_OWORD *)a3->var0;
  v12[1] = v8;
  objc_msgSend(v7, "keyForEntitlement:auditToken:", CFSTR("__isFirstParty__"), v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNResult successWithValue:](CNResult, "successWithValue:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_entitlements, "setObject:forKeyedSubscript:", v11, v9);

}

- (void)setAuditToken:(id *)a3 isFirstOrSecondPartyError:(id)a4
{
  id v6;
  void *v7;
  __int128 v8;
  void *v9;
  void *v10;
  _OWORD v11[2];

  v6 = a4;
  v7 = (void *)objc_opt_class();
  v8 = *(_OWORD *)&a3->var0[4];
  v11[0] = *(_OWORD *)a3->var0;
  v11[1] = v8;
  objc_msgSend(v7, "keyForEntitlement:auditToken:", CFSTR("__isFirstParty__"), v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNResult failureWithError:](CNResult, "failureWithError:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_entitlements, "setObject:forKeyedSubscript:", v10, v9);
}

- (void)setAuditToken:(id *)a3 allowsHighPriority:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  _OWORD v12[2];

  v4 = a4;
  v7 = (void *)objc_opt_class();
  v8 = *(_OWORD *)&a3->var0[4];
  v12[0] = *(_OWORD *)a3->var0;
  v12[1] = v8;
  objc_msgSend(v7, "keyForEntitlement:auditToken:", CFSTR("__isHighPriorityAllowed__"), v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNResult successWithValue:](CNResult, "successWithValue:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_entitlements, "setObject:forKeyedSubscript:", v11, v9);

}

- (void)setAuditToken:(id *)a3 allowsHighPriorityError:(id)a4
{
  id v6;
  void *v7;
  __int128 v8;
  void *v9;
  void *v10;
  _OWORD v11[2];

  v6 = a4;
  v7 = (void *)objc_opt_class();
  v8 = *(_OWORD *)&a3->var0[4];
  v11[0] = *(_OWORD *)a3->var0;
  v11[1] = v8;
  objc_msgSend(v7, "keyForEntitlement:auditToken:", CFSTR("__isHighPriorityAllowed__"), v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNResult failureWithError:](CNResult, "failureWithError:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_entitlements, "setObject:forKeyedSubscript:", v10, v9);
}

+ (id)keyForEntitlement:(id)a3
{
  return a3;
}

+ (id)keyForEntitlement:(id)a3 auditToken:(id *)a4
{
  void *v5;
  uint64_t i;

  v5 = (void *)objc_msgSend(a3, "mutableCopy");
  for (i = 0; i != 8; ++i)
  {
    objc_msgSend(v5, "appendString:", CFSTR("-"));
    objc_msgSend(v5, "appendFormat:", CFSTR("%d"), a4->var0[i]);
  }
  return v5;
}

- (BOOL)currentProcessHasBooleanEntitlement:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "keyForEntitlement:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = -[CNEntitlementVerifierTestDouble BOOLeanResultForKey:error:](self, "BOOLeanResultForKey:error:", v7, a4);
  return (char)a4;
}

- (BOOL)auditToken:(id *)a3 hasBooleanEntitlement:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  __int128 v10;
  void *v11;
  _OWORD v13[2];

  v8 = a4;
  v9 = (void *)objc_opt_class();
  v10 = *(_OWORD *)&a3->var0[4];
  v13[0] = *(_OWORD *)a3->var0;
  v13[1] = v10;
  objc_msgSend(v9, "keyForEntitlement:auditToken:", v8, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = -[CNEntitlementVerifierTestDouble BOOLeanResultForKey:error:](self, "BOOLeanResultForKey:error:", v11, a5);
  return (char)a5;
}

- (BOOL)BOOLeanResultForKey:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  id v7;
  char v8;
  void *v9;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_entitlements, "objectForKeyedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "isSuccess"))
    {
      objc_msgSend(v6, "value");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "BOOLValue");
    }
    else
    {
      objc_msgSend(v6, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v9;
      if (a4)
      {
        v7 = objc_retainAutorelease(v9);
        v8 = 0;
        *a4 = v7;
      }
      else
      {
        v8 = 0;
      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)currentProcessHasArrayWithStringValue:(id)a3 forAnyEntitlement:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a3;
  v9 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __97__CNEntitlementVerifierTestDouble_currentProcessHasArrayWithStringValue_forAnyEntitlement_error___block_invoke;
  v14[3] = &unk_1E29B8EB0;
  v14[4] = self;
  v16 = &v17;
  v10 = v8;
  v15 = v10;
  v11 = objc_msgSend(v9, "_cn_any:", v14);
  v12 = (void *)v18[5];
  if (v12)
  {
    v11 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __97__CNEntitlementVerifierTestDouble_currentProcessHasArrayWithStringValue_forAnyEntitlement_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id obj;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "keyForEntitlement:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)a1[4];
  v6 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v5, "stringArrayResultForKey:error:", v4, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  v8 = objc_msgSend(v7, "containsObject:", a1[5]);

  return v8;
}

- (BOOL)auditToken:(id *)a3 hasArrayWithStringValue:(id)a4 forAnyEntitlement:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  __int128 v12;
  id v13;
  char v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v10 = a4;
  v11 = a5;
  v24 = 0x3032000000;
  v17[1] = 3221225472;
  v12 = *(_OWORD *)&a3->var0[4];
  v20 = *(_OWORD *)a3->var0;
  v22 = 0;
  v23 = &v22;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  v17[0] = MEMORY[0x1E0C809B0];
  v27 = 0;
  v17[2] = __94__CNEntitlementVerifierTestDouble_auditToken_hasArrayWithStringValue_forAnyEntitlement_error___block_invoke;
  v17[3] = &unk_1E29B8ED8;
  v21 = v12;
  v17[4] = self;
  v19 = &v22;
  v13 = v10;
  v18 = v13;
  v14 = objc_msgSend(v11, "_cn_any:", v17);
  v15 = (void *)v23[5];
  if (v15)
  {
    v14 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v15);
  }

  _Block_object_dispose(&v22, 8);
  return v14;
}

uint64_t __94__CNEntitlementVerifierTestDouble_auditToken_hasArrayWithStringValue_forAnyEntitlement_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id obj;
  _OWORD v13[2];

  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = *(_OWORD *)(a1 + 72);
  v13[0] = *(_OWORD *)(a1 + 56);
  v13[1] = v5;
  objc_msgSend(v4, "keyForEntitlement:auditToken:", v3, v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v8 + 40);
  objc_msgSend(v7, "stringArrayResultForKey:error:", v6, &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);
  v10 = objc_msgSend(v9, "containsObject:", *(_QWORD *)(a1 + 40));

  return v10;
}

- (id)stringArrayResultForKey:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_entitlements, "objectForKeyedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(v5, "isSuccess"))
  {
    objc_msgSend(v6, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a4)
      *a4 = objc_retainAutorelease(v8);

    goto LABEL_7;
  }
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v7;
}

- (id)valuesForCurrentProcessForEntitlements:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__CNEntitlementVerifierTestDouble_valuesForCurrentProcessForEntitlements_error___block_invoke;
  v10[3] = &unk_1E29B8F00;
  v10[4] = self;
  v10[5] = &v17;
  v10[6] = &v11;
  objc_msgSend(v6, "_cn_each:", v10);
  v7 = (void *)v18[5];
  if (v7)
  {
    v8 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v7);
  }
  else
  {
    v8 = (id)v12[5];
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __80__CNEntitlementVerifierTestDouble_valuesForCurrentProcessForEntitlements_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id obj;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "keyForEntitlement:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)a1[4];
  v6 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v5, "valueForEntitlementForKey:error:", v4, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setObject:forKey:", v7, v3);

}

- (id)valuesForAuditToken:(id *)a3 forEntitlements:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  __int128 v10;
  void *v11;
  id v12;
  _QWORD v14[7];
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = 3221225472;
  v10 = *(_OWORD *)&a3->var0[4];
  v15 = *(_OWORD *)a3->var0;
  v22 = v9;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[2] = __77__CNEntitlementVerifierTestDouble_valuesForAuditToken_forEntitlements_error___block_invoke;
  v14[3] = &unk_1E29B8F28;
  v16 = v10;
  v14[4] = self;
  v14[5] = &v23;
  v14[6] = &v17;
  objc_msgSend(v8, "_cn_each:", v14);
  v11 = (void *)v24[5];
  if (v11)
  {
    v12 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v11);
  }
  else
  {
    v12 = (id)v18[5];
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v12;
}

void __77__CNEntitlementVerifierTestDouble_valuesForAuditToken_forEntitlements_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id obj;
  _OWORD v11[2];

  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = *(_OWORD *)(a1 + 72);
  v11[0] = *(_OWORD *)(a1 + 56);
  v11[1] = v5;
  objc_msgSend(v4, "keyForEntitlement:auditToken:", v3, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v8 + 40);
  objc_msgSend(v7, "valueForEntitlementForKey:error:", v6, &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKey:", v9, v3);

}

- (id)valueForEntitlementForKey:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_entitlements, "objectForKeyedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(v5, "isSuccess"))
  {
    objc_msgSend(v6, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a4)
      *a4 = objc_retainAutorelease(v8);

    goto LABEL_7;
  }
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v7;
}

- (BOOL)currentProcessIsFirstOrSecondPartyWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  void *v10;

  objc_msgSend((id)objc_opt_class(), "keyForEntitlement:", CFSTR("__isFirstParty__"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_entitlements, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "isSuccess"))
    {
      objc_msgSend(v7, "value");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "BOOLValue");
    }
    else
    {
      objc_msgSend(v7, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v10;
      if (a3)
      {
        v8 = objc_retainAutorelease(v10);
        v9 = 0;
        *a3 = v8;
      }
      else
      {
        v9 = 0;
      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)auditToken:(id *)a3 isFirstOrSecondPartyWithError:(id *)a4
{
  void *v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  char v13;
  void *v14;
  _OWORD v16[2];

  v7 = (void *)objc_opt_class();
  v8 = *(_OWORD *)&a3->var0[4];
  v16[0] = *(_OWORD *)a3->var0;
  v16[1] = v8;
  objc_msgSend(v7, "keyForEntitlement:auditToken:", CFSTR("__isFirstParty__"), v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_entitlements, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if (objc_msgSend(v10, "isSuccess"))
    {
      objc_msgSend(v11, "value");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "BOOLValue");
    }
    else
    {
      objc_msgSend(v11, "error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v14;
      if (a4)
      {
        v12 = objc_retainAutorelease(v14);
        v13 = 0;
        *a4 = v12;
      }
      else
      {
        v13 = 0;
      }
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)auditToken:(id *)a3 allowsHighPriorityWithError:(id *)a4
{
  void *v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  char v13;
  void *v14;
  _OWORD v16[2];

  v7 = (void *)objc_opt_class();
  v8 = *(_OWORD *)&a3->var0[4];
  v16[0] = *(_OWORD *)a3->var0;
  v16[1] = v8;
  objc_msgSend(v7, "keyForEntitlement:auditToken:", CFSTR("__isHighPriorityAllowed__"), v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_entitlements, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if (objc_msgSend(v10, "isSuccess"))
    {
      objc_msgSend(v11, "value");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "BOOLValue");
    }
    else
    {
      objc_msgSend(v11, "error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v14;
      if (a4)
      {
        v12 = objc_retainAutorelease(v14);
        v13 = 0;
        *a4 = v12;
      }
      else
      {
        v13 = 0;
      }
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlements, 0);
}

@end
