@implementation FBKSearchIndex

- (FBKSearchIndex)initWithManagedObjectContext:(id)a3
{
  id v5;
  FBKSearchIndex *v6;
  FBKSearchIndex *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBKSearchIndex;
  v6 = -[FBKSearchIndex init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_managedObjectContext, a3);
    v7->_isSearching = 0;
  }

  return v7;
}

- (void)asynchronouslySearchWithQuery:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  int *p_isSearching;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  p_isSearching = &self->_isSearching;
  while (!__ldxr((unsigned int *)p_isSearching))
  {
    if (!__stxr(1u, (unsigned int *)p_isSearching))
    {
      -[FBKSearchIndex managedObjectContext](self, "managedObjectContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __66__FBKSearchIndex_asynchronouslySearchWithQuery_completionHandler___block_invoke;
      v11[3] = &unk_24E157358;
      v11[4] = self;
      v13 = v7;
      v12 = v6;
      objc_msgSend(v10, "performBlock:", v11);

      goto LABEL_6;
    }
  }
  __clrex();
LABEL_6:

}

void __66__FBKSearchIndex_asynchronouslySearchWithQuery_completionHandler___block_invoke(id *a1)
{
  uint64_t v2;
  void (**v3)(void *, void *);
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[5];
  id v18;

  v2 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__FBKSearchIndex_asynchronouslySearchWithQuery_completionHandler___block_invoke_2;
  aBlock[3] = &unk_24E159770;
  aBlock[4] = a1[4];
  v18 = a1[6];
  v3 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (objc_msgSend(a1[5], "length"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 5);
    v5 = a1[5];
    v6 = objc_msgSend(v5, "length");
    v15[0] = v2;
    v15[1] = 3221225472;
    v15[2] = __66__FBKSearchIndex_asynchronouslySearchWithQuery_completionHandler___block_invoke_3;
    v15[3] = &unk_24E159798;
    v7 = v4;
    v16 = v7;
    objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 1027, v15);
    +[FBKContentItem fetchRequest](FBKContentItem, "fetchRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setResultType:", 1);
    objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPredicate:", v9);

    objc_msgSend(a1[4], "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v10, "executeFetchRequest:error:", v8, &v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14;

    if (v12)
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
    else
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v3[2](v3, v12);
  }

}

uint64_t __66__FBKSearchIndex_asynchronouslySearchWithQuery_completionHandler___block_invoke_2(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __66__FBKSearchIndex_asynchronouslySearchWithQuery_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("searchText CONTAINS[cd] %@"), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setManagedObjectContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

@end
