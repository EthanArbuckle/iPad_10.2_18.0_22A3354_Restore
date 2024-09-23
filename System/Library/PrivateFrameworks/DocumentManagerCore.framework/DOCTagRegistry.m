@implementation DOCTagRegistry

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_registry;
}

- (id)tagForName:(id)a3
{
  id v4;
  DOCTag *v5;
  void *v6;

  v4 = a3;
  v5 = -[DOCTag initWithDisplayName:labelIndex:type:]([DOCTag alloc], "initWithDisplayName:labelIndex:type:", v4, 0, 1);

  -[DOCTagRegistry _memberTag:](self, "_memberTag:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_memberTag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[NSMutableOrderedSet set](self->_userTags, "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "member:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[NSMutableOrderedSet set](self->_discoveredTags, "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "member:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

void __32__DOCTagRegistry_sharedInstance__block_invoke()
{
  DOCTagRegistry *v0;
  void *v1;
  DOCTagCloudSource *v2;
  DOCTagCloudSource *v3;

  v0 = objc_alloc_init(DOCTagRegistry);
  v1 = (void *)sharedInstance_registry;
  sharedInstance_registry = (uint64_t)v0;

  v2 = [DOCTagCloudSource alloc];
  v3 = -[DOCTagCloudSource initWithTagRegistry:](v2, "initWithTagRegistry:", sharedInstance_registry);
  objc_msgSend((id)sharedInstance_registry, "setICloudDataSource:", v3);

}

- (void)setICloudDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudDataSource, a3);
}

- (int64_t)tagSerialNumber
{
  return self->_tagSerialNumber;
}

- (DOCTagRegistry)init
{
  DOCTagRegistry *v2;
  uint64_t v3;
  NSPointerArray *changeObservers;
  void *v5;
  void *v6;
  uint64_t v7;
  NSMutableOrderedSet *userTags;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableOrderedSet *discoveredTags;
  void *v13;
  const char *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)DOCTagRegistry;
  v2 = -[DOCTagRegistry init](&v22, sel_init);
  objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
  v3 = objc_claimAutoreleasedReturnValue();
  changeObservers = v2->_changeObservers;
  v2->_changeObservers = (NSPointerArray *)v3;

  +[DOCTagLocalStorage sharedAppGroupStorage](DOCTagLocalStorage, "sharedAppGroupStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userTags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "mutableCopy");
  userTags = v2->_userTags;
  v2->_userTags = (NSMutableOrderedSet *)v7;

  +[DOCTagLocalStorage sharedAppGroupStorage](DOCTagLocalStorage, "sharedAppGroupStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "discoveredTags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "mutableCopy");
  discoveredTags = v2->_discoveredTags;
  v2->_discoveredTags = (NSMutableOrderedSet *)v11;

  +[DOCTagLocalStorage sharedAppGroupStorage](DOCTagLocalStorage, "sharedAppGroupStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_tagSerialNumber = objc_msgSend(v13, "tagSerialNumber");

  objc_initWeak(&location, v2);
  v14 = (const char *)objc_msgSend(CFSTR("DOCTagRegistryLocalStorageDidChangeNotification"), "UTF8String");
  v15 = MEMORY[0x24BDAC9B8];
  v16 = MEMORY[0x24BDAC9B8];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __22__DOCTagRegistry_init__block_invoke;
  v19[3] = &unk_24C0FDF98;
  objc_copyWeak(&v20, &location);
  LODWORD(v14) = notify_register_dispatch(v14, &v2->_localStorageDidUpdateNotifyToken, v15, v19);

  if ((_DWORD)v14)
  {
    v17 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v17 = docLogHandle;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[DOCTagRegistry init].cold.1(v17);
  }
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v2;
}

- (NSMutableOrderedSet)userTags
{
  return self->_userTags;
}

- (void)addChangeObserver:(id)a3
{
  if (a3)
  {
    -[NSPointerArray addPointer:](self->_changeObservers, "addPointer:");
    -[NSPointerArray compact](self->_changeObservers, "compact");
  }
}

void __22__DOCTagRegistry_init__block_invoke(uint64_t a1, int a2)
{
  _DWORD *WeakRetained;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _DWORD *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WeakRetained[2] == a2)
    {
      v7 = WeakRetained;
      v4 = objc_msgSend(WeakRetained, "tagSerialNumber");
      +[DOCTagLocalStorage sharedAppGroupStorage](DOCTagLocalStorage, "sharedAppGroupStorage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "tagSerialNumber");

      WeakRetained = v7;
      if (v4 < v6)
      {
        objc_msgSend(v7, "synchronize");
        WeakRetained = v7;
      }
    }
  }

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_localStorageDidUpdateNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)DOCTagRegistry;
  -[DOCTagRegistry dealloc](&v3, sel_dealloc);
}

- (void)removeChangeObserver:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  DOCTagRegistry *v8;

  v5 = a3;
  if (v5)
  {
    -[NSPointerArray allObjects](self->_changeObservers, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __39__DOCTagRegistry_removeChangeObserver___block_invoke;
    v6[3] = &unk_24C0FDFC0;
    v7 = v5;
    v8 = self;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

    -[NSPointerArray compact](self->_changeObservers, "compact");
  }

}

uint64_t __39__DOCTagRegistry_removeChangeObserver___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  if (*(_QWORD *)(result + 32) == a2)
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 24), "removePointerAtIndex:");
    *a4 = 1;
  }
  return result;
}

- (void)notifyObserversDidRemoveTags:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  DOCTagRegistry *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__DOCTagRegistry_notifyObserversDidRemoveTags___block_invoke;
  v6[3] = &unk_24C0FE010;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[DOCTagRegistry _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v6);

}

void __47__DOCTagRegistry_notifyObserversDidRemoveTags___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__DOCTagRegistry_notifyObserversDidRemoveTags___block_invoke_2;
  v7[3] = &unk_24C0FDFE8;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __47__DOCTagRegistry_notifyObserversDidRemoveTags___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "tagRegistry:didRemoveTag:", *(_QWORD *)(a1 + 40), a2);
}

- (void)notifyObserversDidReplaceTag:(id)a3 withTag:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__DOCTagRegistry_notifyObserversDidReplaceTag_withTag___block_invoke;
  v10[3] = &unk_24C0FE038;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[DOCTagRegistry _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v10);

}

uint64_t __55__DOCTagRegistry_notifyObserversDidReplaceTag_withTag___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "tagRegistry:didReplaceTag:withTag:", a1[4], a1[5], a1[6]);
}

- (void)_enumerateObserversWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[NSPointerArray allObjects](self->_changeObservers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "copy");

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__DOCTagRegistry__enumerateObserversWithBlock___block_invoke;
  v8[3] = &unk_24C0FE060;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __47__DOCTagRegistry__enumerateObserversWithBlock___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)_notifyDidRemoveTagIfNoLongPresentExistingTags:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__DOCTagRegistry__notifyDidRemoveTagIfNoLongPresentExistingTags___block_invoke;
  v7[3] = &unk_24C0FE088;
  v7[4] = self;
  v4 = a3;
  objc_msgSend(v4, "indexesOfObjectsPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsAtIndexes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
    -[DOCTagRegistry notifyObserversDidRemoveTags:](self, "notifyObserversDidRemoveTags:", v6);

}

BOOL __65__DOCTagRegistry__notifyDidRemoveTagIfNoLongPresentExistingTags___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tagForName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

- (void)removeAllTagsOfType:(int64_t)a3
{
  id v4;

  -[DOCTagRegistry _setForTagType:](self, "_setForTagType:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "removeAllObjects");
    -[DOCTagRegistry synchronize](self, "synchronize");
  }

}

- (void)addTags:(id)a3 options:(int64_t)a4
{
  id v6;
  _QWORD v7[4];
  id v8;
  DOCTagRegistry *v9;
  int64_t v10;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __34__DOCTagRegistry_addTags_options___block_invoke;
    v7[3] = &unk_24C0FE0B0;
    v8 = v6;
    v9 = self;
    v10 = a4;
    -[DOCTagRegistry performBatchUpdate:](self, "performBatchUpdate:", v7);

  }
}

void __34__DOCTagRegistry_addTags_options___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "addTag:options:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), *(_QWORD *)(a1 + 48), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)addTag:(id)a3 options:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[NSMutableOrderedSet set](self->_userTags, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "member:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "mergeWithTag:options:", v10, a4);
  }
  else
  {
    -[NSMutableOrderedSet set](self->_discoveredTags, "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "member:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v9, "mergeWithTag:options:", v10, a4);
    else
      -[DOCTagRegistry addTag:](self, "addTag:", v10);

  }
}

- (BOOL)_canAddTag:(id)a3
{
  void *v4;

  objc_msgSend(a3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[DOCTagRegistry isValidNewTagName:](self, "isValidNewTagName:", v4);

  return (char)self;
}

+ (id)sanitizedTagName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "newlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsJoinedByString:", &stru_24C0FF868);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "precomposedStringWithCanonicalMapping");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (id)_tagNameForComparing:(id)a3
{
  return (id)objc_msgSend(a3, "localizedLowercaseString");
}

- (BOOL)isValidNewTagName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "sanitizedTagName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCTagRegistry _tagNameForComparing:](self, "_tagNameForComparing:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NSMutableOrderedSet set](self->_userTags, "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableOrderedSet set](self->_discoveredTags, "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setByAddingObjectsFromSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "displayName", (_QWORD)v20);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[DOCTagRegistry _tagNameForComparing:](self, "_tagNameForComparing:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", v6);

          if ((v17 & 1) != 0)
          {
            v18 = 0;
            goto LABEL_12;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v12)
          continue;
        break;
      }
    }
    v18 = 1;
LABEL_12:

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)addTag:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;

  v4 = a3;
  v5 = -[DOCTagRegistry _canAddTag:](self, "_canAddTag:", v4);
  if (v5)
  {
    -[DOCTagRegistry _setForTagType:](self, "_setForTagType:", objc_msgSend(v4, "type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v4);

    -[DOCTagRegistry synchronize](self, "synchronize");
  }

  return v5;
}

- (BOOL)insertTag:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  BOOL v9;

  v6 = a3;
  if (-[DOCTagRegistry _canAddTag:](self, "_canAddTag:", v6))
  {
    -[DOCTagRegistry _setForTagType:](self, "_setForTagType:", objc_msgSend(v6, "type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    v9 = v8 >= a4;
    if (v8 >= a4)
    {
      objc_msgSend(v7, "insertObject:atIndex:", v6, a4);
      -[DOCTagRegistry synchronize](self, "synchronize");
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_setForTagType:(int64_t)a3
{
  uint64_t v3;

  if (a3 == 1)
  {
    v3 = 32;
    goto LABEL_5;
  }
  if (!a3)
  {
    v3 = 40;
LABEL_5:
    a2 = (SEL)*(id *)((char *)&self->super.isa + v3);
  }
  return (id)(id)a2;
}

- (void)removeTags:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  DOCTagRegistry *v9;
  id v10;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = MEMORY[0x24BDAC760];
    v6 = 3221225472;
    v7 = __29__DOCTagRegistry_removeTags___block_invoke;
    v8 = &unk_24C0FE0D8;
    v9 = self;
    v10 = v4;
    -[DOCTagRegistry performBatchUpdate:](self, "performBatchUpdate:", &v5);
    -[DOCTagRegistry synchronize](self, "synchronize", v5, v6, v7, v8, v9);

  }
}

void __29__DOCTagRegistry_removeTags___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "userTags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectsInArray:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "discoveredTags");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectsInArray:", *(_QWORD *)(a1 + 40));

}

- (BOOL)canReplaceTag:(id)a3 withTag:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "type");
  if (v8 == objc_msgSend(v7, "type")
    && (objc_msgSend(v7, "displayName"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "length"),
        v9,
        v10))
  {
    -[DOCTagRegistry _memberTag:](self, "_memberTag:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 && !objc_msgSend(v11, "isEqual:", v6))
    {
      v14 = 0;
    }
    else
    {
      -[DOCTagRegistry _setForTagType:](self, "_setForTagType:", objc_msgSend(v6, "type"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "indexOfObject:", v6) != 0x7FFFFFFFFFFFFFFFLL;

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)replaceTag:(id)a3 withTag:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[DOCTagRegistry canReplaceTag:withTag:](self, "canReplaceTag:withTag:", v6, v7);
  if (v8)
  {
    -[DOCTagRegistry _setForTagType:](self, "_setForTagType:", objc_msgSend(v6, "type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "replaceObjectAtIndex:withObject:", objc_msgSend(v9, "indexOfObject:", v6), v7);
    -[DOCTagRegistry notifyObserversDidReplaceTag:withTag:](self, "notifyObserversDidReplaceTag:withTag:", v6, v7);
    -[DOCTagRegistry synchronize](self, "synchronize");

  }
  return v8;
}

- (BOOL)moveTag:(id)a3 toIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  unint64_t v10;
  void *v11;

  v6 = a3;
  -[DOCTagRegistry _setForTagType:](self, "_setForTagType:", objc_msgSend(v6, "type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v6);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    v10 = objc_msgSend(v7, "count");
    v9 = 0;
    if (v8 != a4 && v10 > a4)
    {
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "moveObjectsAtIndexes:toIndex:", v11, a4);

      -[DOCTagRegistry synchronize](self, "synchronize");
      v9 = 1;
    }
  }

  return v9;
}

- (void)performBatchUpdate:(id)a3
{
  void (**v4)(id, DOCTagRegistry *);

  v4 = (void (**)(id, DOCTagRegistry *))a3;
  -[DOCTagRegistry inBatchUpdateEnter](self, "inBatchUpdateEnter");
  v4[2](v4, self);

  -[DOCTagRegistry inBatchUpdateLeave](self, "inBatchUpdateLeave");
}

- (BOOL)inBatchUpdate
{
  return self->_inBatchUpdateCount > 0;
}

- (void)inBatchUpdateEnter
{
  int64_t inBatchUpdateCount;
  NSArray *v4;
  NSArray *tagsBeforeBatchUpdate;

  inBatchUpdateCount = self->_inBatchUpdateCount;
  self->_inBatchUpdateCount = inBatchUpdateCount + 1;
  if (!inBatchUpdateCount)
  {
    -[DOCTagRegistry _allTags](self, "_allTags");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    tagsBeforeBatchUpdate = self->_tagsBeforeBatchUpdate;
    self->_tagsBeforeBatchUpdate = v4;

  }
}

- (void)inBatchUpdateLeave
{
  int64_t v2;
  NSArray *tagsBeforeBatchUpdate;
  NSArray *v5;

  v2 = self->_inBatchUpdateCount - 1;
  self->_inBatchUpdateCount = v2;
  if (!v2)
  {
    v5 = self->_tagsBeforeBatchUpdate;
    tagsBeforeBatchUpdate = self->_tagsBeforeBatchUpdate;
    self->_tagsBeforeBatchUpdate = 0;

    if (self->_shouldSynchronizeAfterBatchUpdate)
      -[DOCTagRegistry synchronize](self, "synchronize");
    -[DOCTagRegistry _notifyDidRemoveTagIfNoLongPresentExistingTags:](self, "_notifyDidRemoveTagIfNoLongPresentExistingTags:", v5);

  }
}

- (id)_allTags
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet array](self->_userTags, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[NSMutableOrderedSet array](self->_discoveredTags, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  return v3;
}

- (void)synchronize
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableOrderedSet *userTags;
  void *v8;
  void *v9;
  NSMutableOrderedSet *discoveredTags;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableOrderedSet *v17;
  NSMutableOrderedSet *v18;
  void *v19;
  DOCTagCloudSource *v20;
  DOCTagCloudSource *iCloudDataSource;
  DOCTagCloudSource *v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  DOCTagCloudSource *v30;
  DOCTagRegistry *v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x24BDAC8D0];
  if (-[DOCTagRegistry inBatchUpdate](self, "inBatchUpdate"))
  {
    self->_shouldSynchronizeAfterBatchUpdate = 1;
    return;
  }
  self->_shouldSynchronizeAfterBatchUpdate = 0;
  v3 = -[DOCTagRegistry tagSerialNumber](self, "tagSerialNumber");
  +[DOCTagLocalStorage sharedAppGroupStorage](DOCTagLocalStorage, "sharedAppGroupStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "tagSerialNumber");

  if (v3 >= v5)
  {
    userTags = self->_userTags;
    +[DOCTagLocalStorage sharedAppGroupStorage](DOCTagLocalStorage, "sharedAppGroupStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userTags");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[DOCTag areTags:equalByNameAndColorTo:](DOCTag, "areTags:equalByNameAndColorTo:", userTags, v9) ^ 1;

  }
  else
  {
    v6 = 1;
  }
  discoveredTags = self->_discoveredTags;
  +[DOCTagLocalStorage sharedAppGroupStorage](DOCTagLocalStorage, "sharedAppGroupStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "discoveredTags");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[DOCTag areTags:equalByNameAndColorTo:](DOCTag, "areTags:equalByNameAndColorTo:", discoveredTags, v12);

  if ((_DWORD)v6)
  {
    +[DOCTagLocalStorage sharedAppGroupStorage](DOCTagLocalStorage, "sharedAppGroupStorage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v3 >= v5)
    {
      objc_msgSend(v14, "setUserTags:", self->_userTags);

      v20 = self->_iCloudDataSource;
      iCloudDataSource = self->_iCloudDataSource;
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __29__DOCTagRegistry_synchronize__block_invoke;
      v29[3] = &unk_24C0FE100;
      v30 = v20;
      v31 = self;
      v22 = v20;
      -[DOCTagCloudSource isICloudAvailableWithCompletionBlock:](iCloudDataSource, "isICloudAvailableWithCompletionBlock:", v29);

    }
    else
    {
      objc_msgSend(v14, "userTags");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (NSMutableOrderedSet *)objc_msgSend(v16, "mutableCopy");
      v18 = self->_userTags;
      self->_userTags = v17;

      +[DOCTagLocalStorage sharedAppGroupStorage](DOCTagLocalStorage, "sharedAppGroupStorage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      self->_tagSerialNumber = objc_msgSend(v19, "tagSerialNumber");

    }
  }
  v23 = !v13;
  if (!v13)
  {
    +[DOCTagLocalStorage sharedAppGroupStorage](DOCTagLocalStorage, "sharedAppGroupStorage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDiscoveredTags:", self->_discoveredTags);

    goto LABEL_14;
  }
  if (v6 | v23)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = CFSTR("DOCTagRegistryChangeUserTagsDidChangeKey");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = CFSTR("DOCTagRegistryChangeDiscoveredTagsDidChangeKey");
    v33[0] = v26;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "postNotificationName:object:userInfo:", CFSTR("DOCTagRegistryTagsDidChangeNotification"), self, v28);

  }
}

uint64_t __29__DOCTagRegistry_synchronize__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "writeTagsToCloud");
  }
  else
  {
    +[DOCTagLocalStorage sharedAppGroupStorage](DOCTagLocalStorage, "sharedAppGroupStorage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "tagSerialNumber");

    objc_msgSend(*(id *)(a1 + 40), "setTagSerialNumber:", v4 + 1);
  }
  return notify_post((const char *)objc_msgSend(CFSTR("DOCTagRegistryLocalStorageDidChangeNotification"), "UTF8String"));
}

- (void)setTagSerialNumber:(int64_t)a3
{
  id v4;

  if (self->_tagSerialNumber != a3)
  {
    self->_tagSerialNumber = a3;
    +[DOCTagLocalStorage sharedAppGroupStorage](DOCTagLocalStorage, "sharedAppGroupStorage");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTagSerialNumber:", a3);

  }
}

- (NSPointerArray)changeObservers
{
  return self->_changeObservers;
}

- (void)setUserTags:(id)a3
{
  objc_storeStrong((id *)&self->_userTags, a3);
}

- (NSMutableOrderedSet)discoveredTags
{
  return self->_discoveredTags;
}

- (void)setDiscoveredTags:(id)a3
{
  objc_storeStrong((id *)&self->_discoveredTags, a3);
}

- (DOCTagCloudSource)iCloudDataSource
{
  return self->_iCloudDataSource;
}

- (int64_t)inBatchUpdateCount
{
  return self->_inBatchUpdateCount;
}

- (void)setInBatchUpdateCount:(int64_t)a3
{
  self->_inBatchUpdateCount = a3;
}

- (NSArray)tagsBeforeBatchUpdate
{
  return self->_tagsBeforeBatchUpdate;
}

- (void)setTagsBeforeBatchUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_tagsBeforeBatchUpdate, a3);
}

- (BOOL)shouldSynchronizeAfterBatchUpdate
{
  return self->_shouldSynchronizeAfterBatchUpdate;
}

- (void)setShouldSynchronizeAfterBatchUpdate:(BOOL)a3
{
  self->_shouldSynchronizeAfterBatchUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagsBeforeBatchUpdate, 0);
  objc_storeStrong((id *)&self->_iCloudDataSource, 0);
  objc_storeStrong((id *)&self->_discoveredTags, 0);
  objc_storeStrong((id *)&self->_userTags, 0);
  objc_storeStrong((id *)&self->_changeObservers, 0);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2090A2000, log, OS_LOG_TYPE_ERROR, "Failed to register libnotify", v1, 2u);
}

@end
