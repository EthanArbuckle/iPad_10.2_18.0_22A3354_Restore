@implementation ICCROrderedSet

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[ICCROrderedSet contents](self, "contents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (ICCRSet)contents
{
  return self->_contents;
}

- (ICCROrderedSet)init
{
  ICCROrderedSet *v2;
  ICCRSet *v3;
  ICCRSet *contents;
  NSMutableArray *v5;
  NSMutableArray *orderedArray;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICCROrderedSet;
  v2 = -[ICCROrderedSet init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ICCRSet);
    contents = v2->_contents;
    v2->_contents = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    orderedArray = v2->_orderedArray;
    v2->_orderedArray = v5;

  }
  return v2;
}

- (void)walkGraph:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  -[ICCROrderedSet contents](self, "contents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (void)setDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICCROrderedSet contents](self, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDocument:", v4);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[ICCROrderedSet contents](self, "contents", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "index");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setDocument:", v4);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)encodeWithICCRCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  CRDT::Dictionary *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "currentDocumentObjectForEncoding");
  v5 = v4;
  if (*(_DWORD *)(v4 + 48) == 5)
  {
    v6 = *(CRDT::Dictionary **)(v4 + 40);
  }
  else
  {
    CRDT::Document_DocObject::clear_contents(v4);
    *(_DWORD *)(v5 + 48) = 5;
    v6 = (CRDT::Dictionary *)operator new();
    CRDT::Dictionary::Dictionary(v6);
    *(_QWORD *)(v5 + 40) = v6;
  }
  -[ICCROrderedSet contents](self, "contents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeWithICCRCoder:set:elementValueCoder:", v8, v6, &__block_literal_global_67);

}

uint64_t __38__ICCROrderedSet_encodeWithICCRCoder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "encodeIntoProtobufSetElement:coder:");
}

- (ICCROrderedSet)initWithICCRCoder:(id)a3
{
  id v4;
  ICCROrderedSet *v5;
  uint64_t v6;
  ICCRSet *v7;
  ICCRSet *v8;
  uint64_t v9;
  uint64_t v10;
  ICCRSet *contents;
  _QWORD v13[4];
  ICCROrderedSet *v14;

  v4 = a3;
  v5 = -[ICCROrderedSet init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "currentDocumentObjectForDecoding");
    if (*(_DWORD *)(v6 + 48) == 5)
    {
      v7 = [ICCRSet alloc];
      v8 = v7;
      if (*(_DWORD *)(v6 + 48) == 5)
        v9 = *(_QWORD *)(v6 + 40);
      else
        v9 = CRDT::Dictionary::default_instance((CRDT::Dictionary *)v7);
      v10 = -[ICCRSet initWithICCRCoder:set:elementValueDecoder:](v8, "initWithICCRCoder:set:elementValueDecoder:", v4, v9, &__block_literal_global_3_0);
      contents = v5->_contents;
      v5->_contents = (ICCRSet *)v10;

      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __36__ICCROrderedSet_initWithICCRCoder___block_invoke_2;
      v13[3] = &unk_1E76CFD60;
      v14 = v5;
      objc_msgSend(v4, "addDecoderCompletionHandler:dependency:for:", v13, 0, v14);

    }
  }

  return v5;
}

ICCROrderedSetElement *__36__ICCROrderedSet_initWithICCRCoder___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  ICCROrderedSetElement *v5;

  v4 = a3;
  v5 = -[ICCROrderedSetElement initWithProtobufSetElement:decoder:]([ICCROrderedSetElement alloc], "initWithProtobufSetElement:decoder:", a2, v4);

  return v5;
}

uint64_t __36__ICCROrderedSet_initWithICCRCoder___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mutableCopy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v3;

  return objc_msgSend(*(id *)(a1 + 32), "_sort");
}

- (ICCRDocument)document
{
  void *v2;
  void *v3;

  -[ICCROrderedSet contents](self, "contents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICCRDocument *)v3;
}

- (BOOL)containsObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[ICCROrderedSet contents](self, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICCROrderedSetElement temporaryElementWithValue:](ICCROrderedSetElement, "temporaryElementWithValue:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  return v7;
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[ICCROrderedSet orderedArray](self, "orderedArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)allObjects
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[ICCROrderedSet count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[ICCROrderedSet orderedArray](self, "orderedArray", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "value");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return (NSArray *)v3;
}

- (unint64_t)indexOfObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[ICCROrderedSet orderedArray](self, "orderedArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICCROrderedSetElement temporaryElementWithValue:](ICCROrderedSetElement, "temporaryElementWithValue:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "indexOfObject:", v6);

  return v7;
}

- (void)_sort
{
  id v2;

  -[ICCROrderedSet orderedArray](self, "orderedArray");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortUsingComparator:", &__block_literal_global_7);

}

uint64_t __23__ICCROrderedSet__sort__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "index");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "index");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

- (id)_indexForIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (a3)
  {
    -[ICCROrderedSet orderedArray](self, "orderedArray");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    -[ICCROrderedSet orderedArray](self, "orderedArray");
    if (v6 <= a3)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", a3 - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICCROrderedSet orderedArray](self, "orderedArray");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[ICCROrderedSet orderedArray](self, "orderedArray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB3A28], "CR_unserialized");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "index");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "index");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICCRIndex indexForReplica:betweenIndex:andIndex:](ICCRIndex, "indexForReplica:betweenIndex:andIndex:", v11, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)moveObject:(id)a3 toIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[ICCROrderedSet contents](self, "contents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICCROrderedSetElement temporaryElementWithValue:](ICCROrderedSetElement, "temporaryElementWithValue:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "member:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ICCROrderedSet orderedArray](self, "orderedArray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", v8);

    -[ICCROrderedSet _indexForIndex:](self, "_indexForIndex:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCROrderedSet orderedArray](self, "orderedArray");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertObject:atIndex:", v8, a4);

    objc_msgSend(v8, "index");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContents:", v10);

  }
}

- (void)setObject:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    -[ICCROrderedSet contents](self, "contents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICCROrderedSetElement temporaryElementWithValue:](ICCROrderedSetElement, "temporaryElementWithValue:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

    if ((v8 & 1) == 0)
    {
      if (-[ICCROrderedSet count](self, "count") > a4)
        -[ICCROrderedSet removeObjectAtIndex:](self, "removeObjectAtIndex:", a4);
      -[ICCROrderedSet insertObject:atIndex:](self, "insertObject:atIndex:", v9, a4);
    }
  }

}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  char v8;
  ICCROrderedSetElement *v9;
  ICCRRegisterLatest *v10;
  void *v11;
  void *v12;
  ICCRRegisterLatest *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  if (v16)
  {
    -[ICCROrderedSet contents](self, "contents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICCROrderedSetElement temporaryElementWithValue:](ICCROrderedSetElement, "temporaryElementWithValue:", v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

    if ((v8 & 1) == 0)
    {
      v9 = objc_alloc_init(ICCROrderedSetElement);
      -[ICCROrderedSetElement setValue:](v9, "setValue:", v16);
      v10 = [ICCRRegisterLatest alloc];
      -[ICCROrderedSet _indexForIndex:](self, "_indexForIndex:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCROrderedSet document](self, "document");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[ICCRRegisterLatest initWithContents:document:](v10, "initWithContents:document:", v11, v12);
      -[ICCROrderedSetElement setIndex:](v9, "setIndex:", v13);

      -[ICCROrderedSet contents](self, "contents");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v9);

      -[ICCROrderedSet orderedArray](self, "orderedArray");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v9);

      -[ICCROrderedSet _sort](self, "_sort");
    }
  }

}

- (void)removeObject:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  +[ICCROrderedSetElement temporaryElementWithValue:](ICCROrderedSetElement, "temporaryElementWithValue:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICCROrderedSet contents](self, "contents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v6);

  -[ICCROrderedSet orderedArray](self, "orderedArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  -[ICCROrderedSet orderedArray](self, "orderedArray");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "count");

  if (v5 > a3)
  {
    -[ICCROrderedSet contents](self, "contents");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[ICCROrderedSet orderedArray](self, "orderedArray");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", v7);

    -[ICCROrderedSet orderedArray](self, "orderedArray");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectAtIndex:", a3);

  }
}

- (void)removeAllObjects
{
  id v3;
  id v4;

  -[ICCROrderedSet contents](self, "contents");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[ICCROrderedSet orderedArray](self, "orderedArray");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ICCROrderedSet contents](self, "contents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ICCROrderedSet contents](self, "contents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)mergeWith:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Invalid merge, classes must be equal for merge."), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  -[ICCROrderedSet mergeWithSet:](self, "mergeWithSet:", v5);

}

- (void)mergeWithSet:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[ICCROrderedSet contents](self, "contents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mergeWith:", v5);

  -[ICCROrderedSet contents](self, "contents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  -[ICCROrderedSet setOrderedArray:](self, "setOrderedArray:", v8);

  -[ICCROrderedSet _sort](self, "_sort");
}

- (id)deltaSince:(id)a3 in:(id)a4
{
  id v6;
  id v7;
  ICCROrderedSet *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(ICCROrderedSet);
  -[ICCROrderedSet setDocument:](v8, "setDocument:", v7);
  objc_opt_class();
  -[ICCROrderedSet contents](self, "contents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deltaSince:in:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCROrderedSet setContents:](v8, "setContents:", v11);

  -[ICCROrderedSet contents](v8, "contents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  -[ICCROrderedSet setOrderedArray:](v8, "setOrderedArray:", v14);

  -[ICCROrderedSet _sort](v8, "_sort");
  return v8;
}

- (void)enumerateWithBlock:(id)a3
{
  void (**v4)(id, void *, unint64_t, _BYTE *);
  unint64_t v5;
  void *v6;
  char v7;

  v4 = (void (**)(id, void *, unint64_t, _BYTE *))a3;
  v5 = 0;
  v7 = 0;
  while (v5 < -[ICCROrderedSet count](self, "count") && !v7)
  {
    -[ICCROrderedSet objectAtIndex:](self, "objectAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6, v5, &v7);

    ++v5;
  }

}

- (void)addObjectsFromArray:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  ICCROrderedSetElement *v8;
  void *v9;
  ICCRRegisterLatest *v10;
  void *v11;
  ICCRRegisterLatest *v12;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *orderedArray;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v6);
        v8 = objc_alloc_init(ICCROrderedSetElement);
        -[ICCROrderedSet _indexForIndex:](self, "_indexForIndex:", -[NSMutableArray count](self->_orderedArray, "count"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICCROrderedSetElement setValue:](v8, "setValue:", v7);
        v10 = [ICCRRegisterLatest alloc];
        -[ICCROrderedSet document](self, "document");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[ICCRRegisterLatest initWithContents:document:](v10, "initWithContents:document:", v9, v11);
        -[ICCROrderedSetElement setIndex:](v8, "setIndex:", v12);

        -[ICCRSet addObject:](self->_contents, "addObject:", v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  -[ICCRSet allObjects](self->_contents, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (NSMutableArray *)objc_msgSend(v13, "mutableCopy");
  orderedArray = self->_orderedArray;
  self->_orderedArray = v14;

  -[ICCROrderedSet _sort](self, "_sort");
}

- (void)addObject:(id)a3
{
  id v4;

  v4 = a3;
  -[ICCROrderedSet insertObject:atIndex:](self, "insertObject:atIndex:", v4, -[ICCROrderedSet count](self, "count"));

}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
  id v6;

  v6 = a3;
  if (v6)
    -[ICCROrderedSet setObject:atIndex:](self, "setObject:atIndex:", v6, a4);

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p (\n"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ICCROrderedSet orderedArray](self, "orderedArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "index");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR("  %@ %@,\n"), v12, v13);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  objc_msgSend(v6, "replaceCharactersInRange:withString:", objc_msgSend(v6, "length") - 2, 2, CFSTR(")>"));
  return (NSString *)v6;
}

- (void)setContents:(id)a3
{
  objc_storeStrong((id *)&self->_contents, a3);
}

- (NSMutableArray)orderedArray
{
  return self->_orderedArray;
}

- (void)setOrderedArray:(id)a3
{
  objc_storeStrong((id *)&self->_orderedArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedArray, 0);
  objc_storeStrong((id *)&self->_contents, 0);
}

@end
