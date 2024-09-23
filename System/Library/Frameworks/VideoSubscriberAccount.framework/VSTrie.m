@implementation VSTrie

- (VSTrie)init
{
  VSTrie *v2;
  VSTrieNode *v3;
  VSTrieNode *root;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSTrie;
  v2 = -[VSTrie init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VSTrieNode);
    root = v2->_root;
    v2->_root = v3;

  }
  return v2;
}

- (void)insertString:(id)a3 withAssociatedObject:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v6 = a3;
  v7 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  -[VSTrie root](self, "root");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "length");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__VSTrie_insertString_withAssociatedObject___block_invoke;
  v10[3] = &unk_1E939F608;
  v10[4] = &v11;
  objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 2, v10);
  objc_msgSend((id)v12[5], "objects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v7);

  _Block_object_dispose(&v11, 8);
}

void __44__VSTrie_insertString_withAssociatedObject___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  VSTrieNode *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a2;
  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The substring parameter must not be nil."));
  v9 = v3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "next");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v9);
  v5 = (VSTrieNode *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v5 = objc_alloc_init(VSTrieNode);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "next");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The nextNode parameter must not be nil."));
    objc_msgSend(v6, "setObject:forKey:", v5, v9);

  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

- (id)objectsMatchingPrefix:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[5];
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
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  -[VSTrie root](self, "root");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __32__VSTrie_objectsMatchingPrefix___block_invoke;
  v9[3] = &unk_1E939F608;
  v9[4] = &v10;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 2, v9);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = (void *)v11[5];
  if (v7)
    VSTrieWalkNodes(v7, v6);
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __32__VSTrie_objectsMatchingPrefix___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, BOOL *a7)
{
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "next");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v15;
  v11 = (void *)v9;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The substring parameter must not be nil."));
    v10 = 0;
  }
  objc_msgSend(v11, "objectForKey:", v10);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  *a7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) == 0;
}

- (VSTrieNode)root
{
  return self->_root;
}

- (void)setRoot:(id)a3
{
  objc_storeStrong((id *)&self->_root, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_root, 0);
}

@end
