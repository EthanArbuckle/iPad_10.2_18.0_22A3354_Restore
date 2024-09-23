@implementation MCMResultWithOwnersAndGroupsBase

- (NSArray)ownerIdentifiers
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mutableOwnerIdentifiers, "copy");
}

- (NSArray)groupIdentifiers
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mutableGroupIdentifiers, "copy");
}

- (void)addOwner:(id)a3 group:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  MCMResultWithOwnersAndGroupsBaseFact *v9;
  id v10;
  id v11;

  v10 = a3;
  v6 = a4;
  v7 = -[NSMutableArray indexOfObject:](self->_mutableOwnerIdentifiers, "indexOfObject:", v10);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = -[NSMutableArray count](self->_mutableOwnerIdentifiers, "count");
    -[NSMutableArray addObject:](self->_mutableOwnerIdentifiers, "addObject:", v10);
  }
  v8 = -[NSMutableArray indexOfObject:](self->_mutableGroupIdentifiers, "indexOfObject:", v6, v10);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = -[NSMutableArray count](self->_mutableGroupIdentifiers, "count");
    -[NSMutableArray addObject:](self->_mutableGroupIdentifiers, "addObject:", v6);
  }
  v9 = -[MCMResultWithOwnersAndGroupsBaseFact initWithOwnerIndex:groupIndex:]([MCMResultWithOwnersAndGroupsBaseFact alloc], "initWithOwnerIndex:groupIndex:", v7, v8);
  -[NSMutableSet addObject:](self->_facts, "addObject:", v9);

}

- (BOOL)encodeResultOntoReply:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  size_t v7;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  BOOL v20;
  char *bytes;
  char *__s;
  objc_super v23;
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MCMResultWithOwnersAndGroupsBase;
  v5 = -[MCMResultBase encodeResultOntoReply:](&v23, sel_encodeResultOntoReply_, v4);
  if (v5)
  {
    -[MCMResultBase error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v20 = v5;
      v7 = -[NSMutableSet count](self->_facts, "count");
      if (v7 <= 1)
        v7 = 1;
      bytes = (char *)malloc_type_calloc(v7, 0x10uLL, 0x1000040451B5BE8uLL);
      __s = bytes;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v19 = 40;
      v8 = self->_facts;
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
      if (v9)
      {
        v10 = v9;
        v11 = 0;
        v12 = *(_QWORD *)v26;
        do
        {
          v13 = 0;
          v14 = &bytes[16 * v11 + 8];
          do
          {
            if (*(_QWORD *)v26 != v12)
              objc_enumerationMutation(v8);
            v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v13);
            *((_QWORD *)v14 - 1) = objc_msgSend(v15, "ownerIndex", v19);
            *(_QWORD *)v14 = objc_msgSend(v15, "groupIndex");
            v14 += 16;
            ++v13;
          }
          while (v10 != v13);
          v11 += v13;
          v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
        }
        while (v10);
      }

      xpc_dictionary_set_data(v4, "ReplyFacts", bytes, 16 * objc_msgSend(*(id *)((char *)&self->super.super.isa + v19), "count"));
      v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      if (v16)
        xpc_dictionary_set_value(v4, "ReplyOwnerIdentifiers", v16);
      v17 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      LOBYTE(v5) = v20;
      if (v17)
        xpc_dictionary_set_value(v4, "ReplyGroupIdentifiers", v17);
      if (bytes)
      {
        free(bytes);
        memset_s(&__s, 8uLL, 0, 8uLL);
      }

    }
  }

  return v5;
}

- (MCMResultWithOwnersAndGroupsBase)init
{
  MCMResultWithOwnersAndGroupsBase *v2;
  NSMutableArray *v3;
  NSMutableArray *mutableOwnerIdentifiers;
  NSMutableArray *v5;
  NSMutableArray *mutableGroupIdentifiers;
  NSMutableSet *v7;
  NSMutableSet *facts;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)MCMResultWithOwnersAndGroupsBase;
  v2 = -[MCMResultBase init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mutableOwnerIdentifiers = v2->_mutableOwnerIdentifiers;
    v2->_mutableOwnerIdentifiers = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mutableGroupIdentifiers = v2->_mutableGroupIdentifiers;
    v2->_mutableGroupIdentifiers = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    facts = v2->_facts;
    v2->_facts = v7;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_facts, 0);
  objc_storeStrong((id *)&self->_mutableGroupIdentifiers, 0);
  objc_storeStrong((id *)&self->_mutableOwnerIdentifiers, 0);
}

@end
