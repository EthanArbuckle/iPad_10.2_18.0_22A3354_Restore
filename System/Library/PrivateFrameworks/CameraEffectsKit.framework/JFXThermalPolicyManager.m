@implementation JFXThermalPolicyManager

- (JFXThermalPolicyManager)init
{

  return 0;
}

- (JFXThermalPolicyManager)initWithDefaultPolicy:(id)a3
{
  id v3;
  JFXThermalPolicyManager *v4;
  JFXThreadSafeArray *v5;
  JFXThreadSafeArray *activePolicies;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)JFXThermalPolicyManager;
  v3 = a3;
  v4 = -[JFXThermalPolicyManager init](&v8, sel_init);
  v5 = objc_alloc_init(JFXThreadSafeArray);
  activePolicies = v4->_activePolicies;
  v4->_activePolicies = v5;

  -[JFXThreadSafeArray addObject:](v4->_activePolicies, "addObject:", v3, v8.receiver, v8.super_class);
  return v4;
}

- (JFXThermalPolicy)highestPriorityPolicy
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__22;
  v10 = __Block_byref_object_dispose__22;
  v11 = 0;
  -[JFXThermalPolicyManager activePolicies](self, "activePolicies");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__JFXThermalPolicyManager_highestPriorityPolicy__block_invoke;
  v5[3] = &unk_24EE5B278;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (JFXThermalPolicy *)v3;
}

void __48__JFXThermalPolicyManager_highestPriorityPolicy__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  id v7;

  v4 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = v4;
  if (!*(_QWORD *)(v5 + 40))
    goto LABEL_4;
  v6 = objc_msgSend(v4, "priority");
  if (v6 <= objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "priority"))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
LABEL_4:
    objc_storeStrong((id *)(v5 + 40), a2);
  }

}

- (void)setPolicyType:(Class)a3 active:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (a4)
  {
    v9 = objc_alloc_init(a3);
    -[JFXThermalPolicyManager activePolicies](self, "activePolicies");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

  }
  else
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__22;
    v15 = __Block_byref_object_dispose__22;
    v16 = 0;
    -[JFXThermalPolicyManager activePolicies](self, "activePolicies");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __48__JFXThermalPolicyManager_setPolicyType_active___block_invoke;
    v10[3] = &unk_24EE5B2A0;
    v10[4] = &v11;
    v10[5] = a3;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

    if (v12[5])
    {
      -[JFXThermalPolicyManager activePolicies](self, "activePolicies");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObject:", v12[5]);

    }
    _Block_object_dispose(&v11, 8);

  }
}

void __48__JFXThermalPolicyManager_setPolicyType_active___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[JFXThermalPolicyManager highestPriorityPolicy](self, "highestPriorityPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXThermalPolicyManager activePolicies](self, "activePolicies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Highest Priority: %@\n\nActive Policy List:\n%@\n"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (JFXThreadSafeArray)activePolicies
{
  return self->_activePolicies;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePolicies, 0);
}

@end
