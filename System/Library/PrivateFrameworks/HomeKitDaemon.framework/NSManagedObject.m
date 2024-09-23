@implementation NSManagedObject

void __78__NSManagedObject_HomeKitDaemon__mkf_synchronizeRelation_items_allowCreation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __keyNameForEntity(v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "valueForKey:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v3, v6);

}

void __78__NSManagedObject_HomeKitDaemon__mkf_synchronizeRelation_items_allowCreation___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "backingModelKey");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v4);
    }
    else
    {
      objc_msgSend(v13, "backingModelType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = +[HMCContext managedObjectClassFromProtocol:](HMCContext, "managedObjectClassFromProtocol:", v7);

      if (!*(_BYTE *)(a1 + 72))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
        goto LABEL_8;
      }
      v9 = *(void **)(a1 + 40);
      v10 = *(void **)(a1 + 48);
      objc_msgSend(v13, "backingModelKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      __createNewObject(v9, v8, v10, v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if ((objc_msgSend(v13, "updateBackingModel:error:", v6, 0) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v6);

LABEL_8:
      return;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v12 = _HMFPreconditionFailure();
  __78__NSManagedObject_HomeKitDaemon__mkf_synchronizeRelation_items_allowCreation___block_invoke_3(v12);
}

void __78__NSManagedObject_HomeKitDaemon__mkf_synchronizeRelation_items_allowCreation___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "managedObjectContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteObject:", v2);

}

@end
