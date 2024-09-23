@implementation BSService

- (id)_identifier
{
  if (a1)
  {
    objc_msgSend(a1[1], "identifier");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void __43__BSService__registerListener_forInstance___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id *v5;
  id v6;
  uint64_t v7;
  id v8;
  char *WeakRetained;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  v2 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 6);
    if (WeakRetained[56])
    {
LABEL_3:
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 6);
      goto LABEL_4;
    }
    if (v4)
    {
      v5 = (id *)(WeakRetained + 40);
      objc_msgSend(*((id *)WeakRetained + 5), "objectForKey:", v4);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (v6 != v3)
        goto LABEL_3;
      v7 = objc_msgSend(*v5, "count");
      v8 = *v5;
      if (v7 != 1)
      {
        objc_msgSend(v8, "removeObjectForKey:", v4);
        goto LABEL_3;
      }
    }
    else
    {
      v5 = (id *)(WeakRetained + 32);
      if (*((id *)WeakRetained + 4) != v3)
        goto LABEL_3;
      v8 = v3;
    }
    *v5 = 0;

    goto LABEL_3;
  }
LABEL_4:

}

- (id)_debugDescriptionWithMultilinePrefix:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __50__BSService__debugDescriptionWithMultilinePrefix___block_invoke;
    v17[3] = &unk_1E390D478;
    v6 = v4;
    v18 = v6;
    v19 = a1;
    v7 = (id)objc_msgSend(v6, "modifyProem:", v17);
    v11 = v5;
    v12 = 3221225472;
    v13 = __50__BSService__debugDescriptionWithMultilinePrefix___block_invoke_2;
    v14 = &unk_1E390D478;
    v15 = a1;
    v8 = v6;
    v16 = v8;
    objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, &v11);
    objc_msgSend(v8, "build", v11, v12, v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __50__BSService__debugDescriptionWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  const __CFString *v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, 0);

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 24));
  v5 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v5 + 56))
    v6 = CFSTR("invalid");
  else
    v6 = CFSTR("active");
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 24));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v6, CFSTR("state"));
}

void __50__BSService__debugDescriptionWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  uint64_t v21;

  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v2, "activeMultilinePrefix");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[BSServiceSpecification _appendManagerDumpBodyToBuilder:withMultilinePrefix:](v3, v2, v12);

  v4 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), CFSTR("listener"), 1);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v13, "sortUsingSelector:", sel_compare_);
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v6, "activeMultilinePrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __50__BSService__debugDescriptionWithMultilinePrefix___block_invoke_3;
    v18 = &unk_1E390D4A0;
    v12 = v13;
    v19 = v12;
    v8 = *(id *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 32);
    v20 = v8;
    v21 = v9;
    objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("listeners"), v7, &v15);

  }
  v10 = *(void **)(a1 + 40);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(v10, "activeMultilinePrefix", v12, v15, v16, v17, v18);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v11, CFSTR("pendedConnections"));

}

void __50__BSService__debugDescriptionWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "objectForKey:", v6, (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (id)objc_msgSend(v7, "appendObject:withName:", v8, v6);

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }

}

- (id)debugDescription
{
  return -[BSService _debugDescriptionWithMultilinePrefix:]((uint64_t)self, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_pendedConnections, 0);
  objc_storeStrong((id *)&self->_lock_instanceToListener, 0);
  objc_storeStrong((id *)&self->_lock_globalListener, 0);
  objc_storeStrong((id *)&self->_domainSpecification, 0);
  objc_storeStrong((id *)&self->_specification, 0);
}

@end
