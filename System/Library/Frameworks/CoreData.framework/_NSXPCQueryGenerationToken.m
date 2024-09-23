@implementation _NSXPCQueryGenerationToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSXPCQueryGenerationToken)initWithCoder:(id)a3
{
  _NSXPCQueryGenerationToken *v4;
  _NSXPCQueryGenerationToken *v5;
  id generationIdentifier;
  NSString *storeIdentifier;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  _PFWeakReference *v19;
  _PFWeakReference *store;
  _PFWeakReference *v21;
  id WeakRetained;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)_NSXPCQueryGenerationToken;
  v4 = -[_NSQueryGenerationToken initWithCoder:](&v28, sel_initWithCoder_);
  v5 = v4;
  if (!v4)
    return v5;
  generationIdentifier = v4->super._generationIdentifier;
  storeIdentifier = v4->super._storeIdentifier;
  v8 = (void *)objc_msgSend(a3, "delegate");
  if (!objc_msgSend(a3, "requiresSecureCoding"))
  {
    if (!v8)
      goto LABEL_34;
    goto LABEL_12;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = (void *)objc_msgSend(a3, "userInfo");
    if (v9)
    {
      v10 = v9;
      v9 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "valueForKey:", CFSTR("NSConnectionContext")), "managedObjectContext"), "persistentStoreCoordinator");
      if (v9)
        goto LABEL_16;
      v9 = (void *)objc_msgSend(v10, "valueForKey:", CFSTR("PSCKey"));
    }
  }
  else
  {
    v9 = 0;
  }
  if (!v9 && v8)
  {
LABEL_12:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_34;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_34;
    v9 = (void *)objc_msgSend(v8, "_persistentStoreCoordinator");
  }
  if (v9)
  {
LABEL_16:
    if (generationIdentifier)
      v11 = storeIdentifier == 0;
    else
      v11 = 1;
    if (!v11)
    {
      v12 = (void *)objc_msgSend(v9, "persistentStores");
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            if ((objc_msgSend((id)objc_msgSend(v17, "identifier"), "isEqual:", storeIdentifier) & 1) != 0)
            {
              v18 = v17;
              if (v18)
              {
                v19 = -[_PFWeakReference initWithObject:]([_PFWeakReference alloc], "initWithObject:", v18);
                store = v5->super._store;
                if (store != v19)
                {

                  v5->super._store = v19;
                }

                *(_WORD *)&v5->super._flags &= ~8u;
                *(_WORD *)&v5->super._flags |= 4u;
              }
              goto LABEL_33;
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
          if (v14)
            continue;
          break;
        }
      }
      v18 = 0;
LABEL_33:

    }
  }
LABEL_34:
  v21 = v5->super._store;
  if (!v21 || (WeakRetained = objc_loadWeakRetained(&v21->_object)) == 0)
  {
    WeakRetained = 0;
    *(_WORD *)&v5->super._flags |= 8u;
  }

  return v5;
}

@end
