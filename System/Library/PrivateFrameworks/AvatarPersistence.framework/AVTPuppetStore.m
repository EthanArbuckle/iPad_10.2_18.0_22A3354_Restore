@implementation AVTPuppetStore

- (AVTPuppetStore)initWithEnvironment:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVTPuppetStore;
  return -[AVTPuppetStore init](&v4, sel_init, a3);
}

- (id)allPuppetRecords
{
  void *v3;
  void *v4;

  -[AVTPuppetStore loadPuppetRecordsIfNeeded](self, "loadPuppetRecordsIfNeeded");
  -[AVTPuppetStore puppetRecords](self, "puppetRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void)loadPuppetRecordsIfNeeded
{
  void *v3;
  id v4;

  -[AVTPuppetStore puppetRecords](self, "puppetRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend((id)objc_opt_class(), "createPuppetRecords");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTPuppetStore setPuppetRecords:](self, "setPuppetRecords:", v4);

  }
}

+ (id)createPuppetRecords
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AVTAvatarPuppetRecord *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(MEMORY[0x24BE0B3F0], "animojiNames", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = -[AVTAvatarPuppetRecord initWithPuppetName:]([AVTAvatarPuppetRecord alloc], "initWithPuppetName:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

- (id)avatarPuppetsForFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v6 = a3;
  -[AVTPuppetStore loadPuppetRecordsIfNeeded](self, "loadPuppetRecordsIfNeeded");
  v7 = objc_msgSend(v6, "criteria");
  v8 = (void *)MEMORY[0x24BDBD1A8];
  switch(v7)
  {
    case 0:
    case 3:
      -[AVTPuppetStore allAvatarPuppetsWithError:](self, "allAvatarPuppetsWithError:", a4);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
    case 2:
      objc_msgSend(v6, "identifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTPuppetStore avatarsWithIdentifiers:error:](self, "avatarsWithIdentifiers:error:", v10, a4);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 5:
      -[AVTPuppetStore primaryAvatarPuppet](self, "primaryAvatarPuppet");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v8 = (void *)v9;
      break;
    case 6:
    case 7:
      objc_msgSend(v6, "excludingIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTPuppetStore allAvatarPuppetsExcluding:error:](self, "allAvatarPuppetsExcluding:error:", v10, a4);
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_5:
      v8 = (void *)v11;

      break;
    default:
      break;
  }

  return v8;
}

- (id)avatarsWithIdentifiers:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id *v18;
  void *v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v18 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[AVTPuppetStore puppetRecords](self, "puppetRecords", v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[AVTAvatarPuppetRecord matchingIdentifierTest:](AVTAvatarPuppetRecord, "matchingIdentifierTest:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "indexOfObjectPassingTest:", v12);

        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v19, "addObject:", v10);
        }
        else
        {
          -[AVTPuppetStore puppetRecords](self, "puppetRecords");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v15);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v20, "count"))
  {
    v16 = (void *)objc_msgSend(v20, "copy");
  }
  else if (v18)
  {
    +[AVTError errorWithCode:userInfo:](AVTError, "errorWithCode:userInfo:", 404, 0);
    v16 = 0;
    *v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)allAvatarPuppetsExcluding:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  -[AVTPuppetStore puppetRecords](self, "puppetRecords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __50__AVTPuppetStore_allAvatarPuppetsExcluding_error___block_invoke;
  v14[3] = &unk_24DD31BF0;
  v8 = v6;
  v15 = v8;
  objc_msgSend(v7, "indexesOfObjectsPassingTest:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTPuppetStore puppetRecords](self, "puppetRecords");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectsAtIndexes:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    v12 = (void *)objc_msgSend(v11, "copy");
  }
  else if (a4)
  {
    +[AVTError errorWithCode:userInfo:](AVTError, "errorWithCode:userInfo:", 404, 0);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

BOOL __50__AVTPuppetStore_allAvatarPuppetsExcluding_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "indexOfObject:", v3) == 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (id)allAvatarPuppetsWithError:(id *)a3
{
  void *v3;
  void *v4;

  -[AVTPuppetStore puppetRecords](self, "puppetRecords", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)primaryAvatarPuppet
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[AVTPuppetStore puppetRecords](self, "puppetRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return MEMORY[0x24BDBD1A8];
  -[AVTPuppetStore puppetRecords](self, "puppetRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  v10[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)puppetRecords
{
  return self->_puppetRecords;
}

- (void)setPuppetRecords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_puppetRecords, 0);
}

@end
