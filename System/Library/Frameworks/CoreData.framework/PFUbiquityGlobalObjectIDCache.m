@implementation PFUbiquityGlobalObjectIDCache

- (PFUbiquityGlobalObjectIDCache)init
{
  PFUbiquityGlobalObjectIDCache *v2;
  PFUbiquityGlobalObjectIDCache *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFUbiquityGlobalObjectIDCache;
  v2 = -[PFUbiquityGlobalObjectIDCache init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_storeName = 0;
    v2->_localPeerID = 0;
    v2->_peerIDToEntityNameToPrimaryKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_peerIDToEntityNameToPrimaryKeyLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
  }
  return v3;
}

- (PFUbiquityGlobalObjectIDCache)initWithLocalPeerID:(id)a3 forStoreName:(id)a4
{
  PFUbiquityGlobalObjectIDCache *v6;

  v6 = -[PFUbiquityGlobalObjectIDCache init](self, "init");
  if (v6)
  {
    v6->_storeName = (NSString *)a4;
    v6->_localPeerID = (NSString *)a3;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_storeName = 0;
  self->_localPeerID = 0;

  self->_peerIDToEntityNameToPrimaryKey = 0;
  self->_peerIDToEntityNameToPrimaryKeyLock = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityGlobalObjectIDCache;
  -[PFUbiquityGlobalObjectIDCache dealloc](&v3, sel_dealloc);
}

- (PFUbiquityGlobalObjectID)createGlobalIDForCompressedString:(uint64_t)a3 withEntityNames:(uint64_t)a4 primaryKeys:(uint64_t)a5 peerIDs:
{
  PFUbiquityGlobalObjectID *v5;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;

  v5 = a1;
  if (a1)
  {
    v9 = (void *)objc_msgSend(a2, "componentsSeparatedByString:", PFUbiquityGlobalObjectIDSeparator);
    if (objc_msgSend(v9, "count") == 3)
    {
      v10 = +[PFUbiquityGlobalObjectIDCache stringValueFromArray:atIndexDescribedByStringNumber:](PFUbiquityGlobalObjectIDCache, "stringValueFromArray:atIndexDescribedByStringNumber:", a3, objc_msgSend(v9, "objectAtIndex:", 0));
      v11 = +[PFUbiquityGlobalObjectIDCache stringValueFromArray:atIndexDescribedByStringNumber:](PFUbiquityGlobalObjectIDCache, "stringValueFromArray:atIndexDescribedByStringNumber:", a4, objc_msgSend(v9, "objectAtIndex:", 1));
      v12 = +[PFUbiquityGlobalObjectIDCache stringValueFromArray:atIndexDescribedByStringNumber:](PFUbiquityGlobalObjectIDCache, "stringValueFromArray:atIndexDescribedByStringNumber:", a5, objc_msgSend(v9, "objectAtIndex:", 2));
      v13 = v12;
      if (v10)
        v14 = v11 == 0;
      else
        v14 = 1;
      if (!v14 && v12 != 0)
      {
        v5 = -[PFUbiquityGlobalObjectIDCache createGlobalIDForPrimaryKeyString:entityName:andOwningPeerID:]((uint64_t)v5, (uint64_t)v11, (uint64_t)v10, (uint64_t)v12);
LABEL_13:

        return v5;
      }
    }
    else
    {
      v13 = 0;
      v11 = 0;
      v10 = 0;
    }
    v5 = 0;
    goto LABEL_13;
  }
  return v5;
}

- (PFUbiquityGlobalObjectID)createGlobalIDForPrimaryKeyString:(uint64_t)a3 entityName:(uint64_t)a4 andOwningPeerID:
{
  id v8;
  id v9;
  PFUbiquityGlobalObjectID *v10;

  objc_msgSend(*(id *)(a1 + 32), "lock");
  v8 = (id)objc_msgSend(*(id *)(a1 + 24), "objectForKey:", a4);
  if (!v8)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1 + 24), "setObject:forKey:", v8, a4);

  }
  v9 = (id)objc_msgSend(v8, "objectForKey:", a3);
  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v8, "setObject:forKey:", v9, a3);

  }
  v10 = (PFUbiquityGlobalObjectID *)(id)objc_msgSend(v9, "objectForKey:", a2);
  if (!v10)
  {
    v10 = -[PFUbiquityGlobalObjectID initWithStoreName:entityName:primaryKey:andPeerID:]([PFUbiquityGlobalObjectID alloc], "initWithStoreName:entityName:primaryKey:andPeerID:", *(_QWORD *)(a1 + 8), a3, a2, a4);
    objc_msgSend(v9, "setObject:forKey:", v10, a2);
  }
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  return v10;
}

- (PFUbiquityGlobalObjectID)createGlobalIDForGlobalIDString:(uint64_t)a1
{
  void *v3;

  if (a1 && (v3 = (void *)objc_msgSend(a2, "componentsSeparatedByString:", CFSTR(":")), objc_msgSend(v3, "count") == 4))
    return -[PFUbiquityGlobalObjectIDCache createGlobalIDForPrimaryKeyString:entityName:andOwningPeerID:](a1, objc_msgSend(v3, "objectAtIndex:", 2), objc_msgSend(v3, "objectAtIndex:", 1), objc_msgSend(v3, "objectAtIndex:", 3));
  else
    return 0;
}

- (uint64_t)purgeCache
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 32), "lock");

    *(_QWORD *)(v1 + 24) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    return objc_msgSend(*(id *)(v1 + 32), "unlock");
  }
  return result;
}

+ (id)stringValueFromArray:(id)a3 atIndexDescribedByStringNumber:(id)a4
{
  unint64_t v5;
  unint64_t v6;

  v5 = objc_msgSend(a4, "integerValue");
  if ((v5 & 0x8000000000000000) != 0)
    return 0;
  v6 = v5;
  if (v5 >= objc_msgSend(a3, "count"))
    return 0;
  else
    return (id)objc_msgSend(a3, "objectAtIndex:", v6);
}

@end
