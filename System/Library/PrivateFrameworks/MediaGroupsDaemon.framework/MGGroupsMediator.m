@implementation MGGroupsMediator

- (MGGroupsMediator)initWithGroupsQueryAgent:(id)a3
{
  id v4;
  MGGroupsMediator *v5;
  MGGroupsMediator *v6;
  NSUUID *v7;
  NSUUID *identifier;
  NSArray *v9;
  NSArray *activities;
  NSDictionary *v11;
  NSDictionary *groups;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MGGroupsMediator;
  v5 = -[MGGroupsMediator init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = (NSUUID *)objc_alloc_init(MEMORY[0x24BDD1880]);
    identifier = v6->_identifier;
    v6->_identifier = v7;

    objc_storeWeak((id *)&v6->_queryAgent, v4);
    v9 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    activities = v6->_activities;
    v6->_activities = v9;

    v11 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    groups = v6->_groups;
    v6->_groups = v11;

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[MGGroupsMediator queryAgent](self, "queryAgent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupsMediatorRemoved:", self);

  v4.receiver = self;
  v4.super_class = (Class)MGGroupsMediator;
  -[MGGroupsMediator dealloc](&v4, sel_dealloc);
}

- (id)groups_unsafe
{
  os_unfair_lock_assert_owner(&self->_lock);
  return self->_groups;
}

- (void)upsertGroup_unsafe:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  NSDictionary *v7;
  void *v8;
  NSDictionary *groups;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  -[MGGroupsMediator groups_unsafe](self, "groups_unsafe");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSDictionary *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary setObject:forKey:](v7, "setObject:forKey:", v5, v8);

  groups = self->_groups;
  self->_groups = v7;

  -[MGGroupsMediator setPendingChanges:](self, "setPendingChanges:", 1);
}

- (void)removeGroup:(id)a3 ifExists_unsafe:(BOOL *)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  void *v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *groups;
  id v12;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_assert_owner(p_lock);
  -[MGGroupsMediator groups_unsafe](self, "groups_unsafe");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = v9 != 0;

  if (v9)
  {
    v10 = (NSDictionary *)objc_msgSend(v12, "mutableCopy");
    -[NSDictionary removeObjectForKey:](v10, "removeObjectForKey:", v8);
    groups = self->_groups;
    self->_groups = v10;

    -[MGGroupsMediator setPendingChanges:](self, "setPendingChanges:", 1);
  }

}

- (id)groupsForUpdate_unsafe
{
  void *v3;
  _BOOL4 v4;
  void *v5;

  os_unfair_lock_assert_owner(&self->_lock);
  -[MGGroupsMediator activities](self, "activities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {

LABEL_5:
    v5 = 0;
    return v5;
  }
  v4 = -[MGGroupsMediator hasPendingChanges](self, "hasPendingChanges");

  if (!v4)
    goto LABEL_5;
  -[MGGroupsMediator groups_unsafe](self, "groups_unsafe");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __31__MGGroupsMediator_description__block_invoke;
  v12[3] = &unk_24E0AA598;
  v12[4] = self;
  v12[5] = &v21;
  v12[6] = &v17;
  v12[7] = &v13;
  -[MGGroupsMediator _withLock:](self, "_withLock:", v12);
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGGroupsMediator identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14[3];
  if (*((_BYTE *)v18 + 24))
    v8 = CFSTR("pending");
  else
    v8 = CFSTR("no");
  if (objc_msgSend((id)v22[5], "count"))
    v9 = (const __CFString *)v22[5];
  else
    v9 = CFSTR("no activities");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, id=%@, groups=%p, %@ changes, %@>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v10;
}

uint64_t __31__MGGroupsMediator_description__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "activities");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "hasPendingChanges");
  result = objc_msgSend(*(id *)(a1 + 32), "groups_unsafe");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (id)currentGroups
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __33__MGGroupsMediator_currentGroups__block_invoke;
  v4[3] = &unk_24E0AA5C0;
  v4[4] = self;
  v4[5] = &v5;
  -[MGGroupsMediator _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __33__MGGroupsMediator_currentGroups__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "activities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "groups_unsafe");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "copy");
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (id)startActivityWithName:(id)a3
{
  id v4;
  MGGroupsActivity *v5;
  MGGroupsActivity *v6;
  MGGroupsActivity *v7;
  MGGroupsActivity *v8;
  _QWORD v10[5];
  MGGroupsActivity *v11;

  v4 = a3;
  v5 = -[MGGroupsActivity initWithName:]([MGGroupsActivity alloc], "initWithName:", v4);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __42__MGGroupsMediator_startActivityWithName___block_invoke;
  v10[3] = &unk_24E0AA5E8;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  -[MGGroupsMediator _withLock:](self, "_withLock:", v10);
  v7 = v11;
  v8 = v6;

  return v8;
}

void __42__MGGroupsMediator_startActivityWithName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "activities");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObject:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActivities:", v3);

}

- (void)endActivity:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__MGGroupsMediator_endActivity___block_invoke;
  v7[3] = &unk_24E0AA610;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[MGGroupsMediator _withLock:](self, "_withLock:", v7);
  if (v11[5])
  {
    -[MGGroupsMediator queryAgent](self, "queryAgent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "groupsMediator:didUpdateGroups:", self, v11[5]);

  }
  _Block_object_dispose(&v10, 8);

}

void __32__MGGroupsMediator_endActivity___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "activities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v8, "containsObject:", *(_QWORD *)(a1 + 40));
  v3 = v8;
  if (v2)
  {
    v4 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setActivities:", v4);
    objc_msgSend(*(id *)(a1 + 32), "groupsForUpdate_unsafe");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      objc_msgSend(*(id *)(a1 + 32), "setPendingChanges:", 0);

    v3 = v8;
  }

}

- (void)addGroup:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __29__MGGroupsMediator_addGroup___block_invoke;
  v7[3] = &unk_24E0AA610;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[MGGroupsMediator _withLock:](self, "_withLock:", v7);
  if (v11[5])
  {
    -[MGGroupsMediator queryAgent](self, "queryAgent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "groupsMediator:didUpdateGroups:", self, v11[5]);

  }
  _Block_object_dispose(&v10, 8);

}

void __29__MGGroupsMediator_addGroup___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "upsertGroup_unsafe:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "groupsForUpdate_unsafe");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    objc_msgSend(*(id *)(a1 + 32), "setPendingChanges:", 0);
}

- (void)removeGroup:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__MGGroupsMediator_removeGroup___block_invoke;
  v7[3] = &unk_24E0AA610;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[MGGroupsMediator _withLock:](self, "_withLock:", v7);
  if (v11[5])
  {
    -[MGGroupsMediator queryAgent](self, "queryAgent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "groupsMediator:didUpdateGroups:", self, v11[5]);

  }
  _Block_object_dispose(&v10, 8);

}

void __32__MGGroupsMediator_removeGroup___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  char v5;

  v5 = 0;
  objc_msgSend(*(id *)(a1 + 32), "removeGroup:ifExists_unsafe:", *(_QWORD *)(a1 + 40), &v5);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "groupsForUpdate_unsafe");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      objc_msgSend(*(id *)(a1 + 32), "setPendingChanges:", 0);
  }
}

- (id)group:(id)a3 renameTo:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  v7 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  v29 = v6;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __35__MGGroupsMediator_group_renameTo___block_invoke;
  v13[3] = &unk_24E0AA638;
  v13[4] = self;
  v8 = v29;
  v14 = v8;
  v16 = &v24;
  v9 = v7;
  v15 = v9;
  v17 = &v18;
  -[MGGroupsMediator _withLock:](self, "_withLock:", v13);
  if (v19[5])
  {
    -[MGGroupsMediator queryAgent](self, "queryAgent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "groupsMediator:didUpdateGroups:", self, v19[5]);

  }
  v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

void __35__MGGroupsMediator_group_renameTo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "groups_unsafe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v18;
  if (v18)
  {
    v5 = objc_alloc((Class)objc_opt_class());
    objc_msgSend(v18, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v18, "properties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "memberIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "initWithClientService:type:identifier:name:properties:memberIdentifiers:", v6, v7, v8, v9, v10, v11);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    objc_msgSend(*(id *)(a1 + 32), "upsertGroup_unsafe:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 32), "groupsForUpdate_unsafe");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    v4 = v18;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "setPendingChanges:", 0);
      v4 = v18;
    }
  }

}

- (id)group:(id)a3 addMember:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  v7 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  v29 = v6;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __36__MGGroupsMediator_group_addMember___block_invoke;
  v13[3] = &unk_24E0AA638;
  v13[4] = self;
  v8 = v29;
  v14 = v8;
  v9 = v7;
  v15 = v9;
  v16 = &v24;
  v17 = &v18;
  -[MGGroupsMediator _withLock:](self, "_withLock:", v13);
  if (v19[5])
  {
    -[MGGroupsMediator queryAgent](self, "queryAgent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "groupsMediator:didUpdateGroups:", self, v19[5]);

  }
  v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

void __36__MGGroupsMediator_group_addMember___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "groups_unsafe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v20;
  if (v20)
  {
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "memberIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "containsObject:", v5) & 1) == 0)
    {
      v7 = objc_alloc((Class)objc_opt_class());
      objc_msgSend(v20, "service");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "type");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "properties");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "arrayByAddingObject:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v7, "initWithClientService:type:identifier:name:properties:memberIdentifiers:", v8, v9, v10, v11, v12, v13);
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      objc_msgSend(*(id *)(a1 + 32), "upsertGroup_unsafe:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      objc_msgSend(*(id *)(a1 + 32), "groupsForUpdate_unsafe");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
        objc_msgSend(*(id *)(a1 + 32), "setPendingChanges:", 0);
    }

    v4 = v20;
  }

}

- (id)group:(id)a3 removeMember:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  v7 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  v29 = v6;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __39__MGGroupsMediator_group_removeMember___block_invoke;
  v13[3] = &unk_24E0AA638;
  v13[4] = self;
  v8 = v29;
  v14 = v8;
  v9 = v7;
  v15 = v9;
  v16 = &v24;
  v17 = &v18;
  -[MGGroupsMediator _withLock:](self, "_withLock:", v13);
  if (v19[5])
  {
    -[MGGroupsMediator queryAgent](self, "queryAgent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "groupsMediator:didUpdateGroups:", self, v19[5]);

  }
  v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

void __39__MGGroupsMediator_group_removeMember___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "groups_unsafe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v20;
  if (v20)
  {
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "memberIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "containsObject:", v5))
    {
      v7 = (void *)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v7, "removeObject:", v5);
      v8 = objc_alloc((Class)objc_opt_class());
      objc_msgSend(v20, "service");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "type");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "properties");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v8, "initWithClientService:type:identifier:name:properties:memberIdentifiers:", v9, v10, v11, v12, v13, v7);
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      objc_msgSend(*(id *)(a1 + 32), "upsertGroup_unsafe:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      objc_msgSend(*(id *)(a1 + 32), "groupsForUpdate_unsafe");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
        objc_msgSend(*(id *)(a1 + 32), "setPendingChanges:", 0);

    }
    v4 = v20;
  }

}

- (void)removeGroupWithIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__MGGroupsMediator_removeGroupWithIdentifier___block_invoke;
  v6[3] = &unk_24E0AA660;
  v8 = &v9;
  v6[4] = self;
  v5 = v4;
  v7 = v5;
  -[MGGroupsMediator _withLock:](self, "_withLock:", v6);
  -[MGGroupsMediator removeGroup:](self, "removeGroup:", v10[5]);

  _Block_object_dispose(&v9, 8);
}

void __46__MGGroupsMediator_removeGroupWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "groups_unsafe");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (MGGroupsQueryAgent)queryAgent
{
  return (MGGroupsQueryAgent *)objc_loadWeakRetained((id *)&self->_queryAgent);
}

- (BOOL)allowsClientEdits
{
  return self->_allowsClientEdits;
}

- (void)setAllowsClientEdits:(BOOL)a3
{
  self->_allowsClientEdits = a3;
}

- (NSArray)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)hasPendingChanges
{
  return self->_pendingChanges;
}

- (void)setPendingChanges:(BOOL)a3
{
  self->_pendingChanges = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activities, 0);
  objc_destroyWeak((id *)&self->_queryAgent);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_groups, 0);
}

@end
