@implementation BLSHBacklightEnvironmentPresentation

- (BLSHBacklightEnvironmentPresentation)initWithPresentationEntries:(id)a3 flipbookContext:(id)a4 expirationDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  BLSHBacklightEnvironmentPresentation *v12;
  uint64_t v13;
  NSArray *presentationEntries;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSSet *environmentsSet;
  void *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v32.receiver = self;
  v32.super_class = (Class)BLSHBacklightEnvironmentPresentation;
  v12 = -[BLSHBacklightEnvironmentPresentation init](&v32, sel_init);
  if (v12)
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p cannot initialize with nil presentationEntries, %@"), v12, v12);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[BLSHBacklightEnvironmentPresentation initWithPresentationEntries:flipbookContext:expirationDate:].cold.1(a2, (uint64_t)v12, (uint64_t)v25);
      objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x2145F2E54);
    }
    v26 = v11;
    v27 = v10;
    v13 = objc_msgSend(v9, "copy");
    presentationEntries = v12->_presentationEntries;
    v12->_presentationEntries = (NSArray *)v13;

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v16 = v9;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v29;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v20), "environment");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v18);
    }

    v22 = objc_msgSend(v15, "copy");
    environmentsSet = v12->_environmentsSet;
    v12->_environmentsSet = (NSSet *)v22;

    objc_storeStrong((id *)&v12->_flipbookContext, a4);
    objc_storeStrong((id *)&v12->_expirationDate, a5);

    v11 = v26;
    v10 = v27;
  }

  return v12;
}

- (BLSHBacklightEnvironmentPresentation)initWithPresentationEntries:(id)a3 caContext:(id)a4 expirationDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  BLSHFlipbookContext *v11;
  BLSHBacklightEnvironmentPresentation *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[BLSHFlipbookContext initWithCAContext:wantsTransform:inverted:]([BLSHFlipbookContext alloc], "initWithCAContext:wantsTransform:inverted:", v9, 0, 0);

  v12 = -[BLSHBacklightEnvironmentPresentation initWithPresentationEntries:flipbookContext:expirationDate:](self, "initWithPresentationEntries:flipbookContext:expirationDate:", v10, v11, v8);
  return v12;
}

- (BLSHBacklightEnvironmentPresentation)initWithEnvironments:(id)a3 caContext:(id)a4 expirationDate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  BLSHBacklightEnvironmentPresentation *v11;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "bs_mapNoNulls:", &__block_literal_global_16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BLSHBacklightEnvironmentPresentation initWithPresentationEntries:caContext:expirationDate:](self, "initWithPresentationEntries:caContext:expirationDate:", v10, v9, v8);

  return v11;
}

BLSHPresentationEntry *__86__BLSHBacklightEnvironmentPresentation_initWithEnvironments_caContext_expirationDate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BLSHPresentationEntry *v3;

  v2 = a2;
  v3 = -[BLSHPresentationEntry initWithEnvironment:userObject:]([BLSHPresentationEntry alloc], "initWithEnvironment:userObject:", v2, 0);

  return v3;
}

- (NSArray)environments
{
  return (NSArray *)-[NSArray bs_mapNoNulls:](self->_presentationEntries, "bs_mapNoNulls:", &__block_literal_global_8_0);
}

uint64_t __52__BLSHBacklightEnvironmentPresentation_environments__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "environment");
}

- (BOOL)isLiveUpdating
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  char v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_presentationEntries;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "environment", (_QWORD)v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "isLiveUpdating");

        if ((v7 & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)hasUnrestrictedFramerateUpdates
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  char v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_presentationEntries;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "environment", (_QWORD)v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "hasUnrestrictedFramerateUpdates");

        if ((v7 & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isHighLuminanceAlwaysOn
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = self->_presentationEntries;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v6, "environment", (_QWORD)v11);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v6, "environment");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "isHighLuminanceAlwaysOn");

          if ((v9 & 1) != 0)
          {

            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }

      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BLSHPresentationDateSpecifier)currentSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__7;
  v14 = __Block_byref_object_dispose__7;
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[BLSHBacklightEnvironmentPresentation presentationEntries](self, "presentationEntries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__BLSHBacklightEnvironmentPresentation_currentSpecifier__block_invoke;
  v9[3] = &unk_24D1BDA40;
  v9[4] = &v10;
  objc_msgSend(v3, "bs_mapNoNulls:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)v11[5];
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "isEqualToDate:", v6);

  if ((v5 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    +[BLSHPresentationDateSpecifier specifierWithPresentationDate:specifiers:](BLSHPresentationDateSpecifier, "specifierWithPresentationDate:specifiers:", v11[5], v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v10, 8);
  return (BLSHPresentationDateSpecifier *)v7;
}

id __56__BLSHBacklightEnvironmentPresentation_currentSpecifier__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "currentSpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "laterDate:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  return v3;
}

- (CAContext)caContext
{
  return -[BLSHFlipbookContext caContext](self->_flipbookContext, "caContext");
}

- (id)bls_shortLoggingString
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:objectTransformer:", self->_presentationEntries, 0, 0, &__block_literal_global_14);
  -[NSDate bls_loggingString](self->_expirationDate, "bls_loggingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v4, CFSTR("expirationDate"), 1);

  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __62__BLSHBacklightEnvironmentPresentation_bls_shortLoggingString__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p:%@>"), v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)bls_loggingString
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:objectTransformer:", self->_presentationEntries, CFSTR("presentationEntries"), 0, &__block_literal_global_21);
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_flipbookContext, CFSTR("context"));
  -[NSDate bls_loggingString](self->_expirationDate, "bls_loggingString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v5, CFSTR("expirationDate"), 1);

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __57__BLSHBacklightEnvironmentPresentation_bls_loggingString__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p:%@>"), v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)debugDescription
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:objectTransformer:", self->_presentationEntries, CFSTR("presentationEntries"), 0, &__block_literal_global_25);
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_flipbookContext, CFSTR("context"));
  -[NSDate bls_loggingString](self->_expirationDate, "bls_loggingString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v5, CFSTR("expirationDate"), 1);

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __56__BLSHBacklightEnvironmentPresentation_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "debugDescription");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_presentationEntries);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_flipbookContext);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSArray *presentationEntries;
  uint64_t v7;
  id v8;
  id v9;
  BLSHFlipbookContext *flipbookContext;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  presentationEntries = self->_presentationEntries;
  v7 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __48__BLSHBacklightEnvironmentPresentation_isEqual___block_invoke;
  v19[3] = &unk_24D1BC410;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", presentationEntries, v19);
  flipbookContext = self->_flipbookContext;
  v14 = v7;
  v15 = 3221225472;
  v16 = __48__BLSHBacklightEnvironmentPresentation_isEqual___block_invoke_2;
  v17 = &unk_24D1BC410;
  v18 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", flipbookContext, &v14);
  LOBYTE(flipbookContext) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return (char)flipbookContext;
}

uint64_t __48__BLSHBacklightEnvironmentPresentation_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentationEntries");
}

uint64_t __48__BLSHBacklightEnvironmentPresentation_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "flipbookContext");
}

- (BOOL)containsEnvironment:(id)a3
{
  return -[NSSet containsObject:](self->_environmentsSet, "containsObject:", a3);
}

- (id)differenceFromPresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  BLSHPresentationDifference *v24;
  _BOOL4 v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "environmentsSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)-[NSSet mutableCopy](self->_environmentsSet, "mutableCopy");
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "minusSet:", v5);
  v8 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v8, "minusSet:", self->_environmentsSet);
  if (objc_msgSend(v7, "count"))
    v9 = 1;
  else
    v9 = objc_msgSend(v8, "count") != 0;
  v26 = v9;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = self->_presentationEntries;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v33;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v15), "environment");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "containsObject:", v16))
          objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v27 = v4;
  objc_msgSend(v4, "presentationEntries");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v29;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v22), "environment");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "containsObject:", v23))
          objc_msgSend(v17, "addObject:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v20);
  }

  v24 = -[BLSHPresentationDifference initWithHasChanges:insertedEnvironments:removedEnvironments:]([BLSHPresentationDifference alloc], "initWithHasChanges:insertedEnvironments:removedEnvironments:", v26, v10, v17);
  return v24;
}

- (void)differenceFromPresentation:(id)a3 forEachRemoval:(id)a4 forEachAddition:(id)a5
{
  void (**v8)(id, _QWORD);
  void (**v9)(id, _QWORD);
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, _QWORD))a4;
  v9 = (void (**)(id, _QWORD))a5;
  -[BLSHBacklightEnvironmentPresentation differenceFromPresentation:](self, "differenceFromPresentation:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "hasChanges"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v10, "removals");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v11);
          v8[2](v8, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v15++));
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v13);
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v10, "insertions", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v22;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v16);
          v9[2](v9, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v20++));
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v18);
    }

  }
}

- (void)invalidateContentForReason:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_presentationEntries;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "environment", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "invalidateContentForReason:", v4);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (NSArray)presentationEntries
{
  return self->_presentationEntries;
}

- (BLSHFlipbookContext)flipbookContext
{
  return self->_flipbookContext;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSSet)environmentsSet
{
  return self->_environmentsSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentsSet, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_flipbookContext, 0);
  objc_storeStrong((id *)&self->_presentationEntries, 0);
}

- (void)initWithPresentationEntries:(const char *)a1 flipbookContext:(uint64_t)a2 expirationDate:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
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
  v15 = CFSTR("BLSHBacklightEnvironmentPresentation.m");
  v16 = 1024;
  v17 = 22;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
