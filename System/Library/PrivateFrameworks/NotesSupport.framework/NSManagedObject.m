@implementation NSManagedObject

BOOL __57__NSManagedObject_IC__ic_containsFaultingManagedObjects___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  objc_opt_class();
  v3 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v2, "faultingState") != 0;

  return v3;
}

uint64_t __56__NSManagedObject_IC__ic_permanentObjectIDsFromObjects___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTemporaryID");

  return v3;
}

void __63__NSManagedObject_IC__ic_postNotificationOnMainThreadWithName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "ic_permanentObjectID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __63__NSManagedObject_IC__ic_postNotificationOnMainThreadWithName___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

void __72__NSManagedObject_IC__ic_postNotificationOnMainThreadAfterSaveWithName___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "ic_permanentObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __72__NSManagedObject_IC__ic_postNotificationOnMainThreadAfterSaveWithName___block_invoke_2;
    v9 = &unk_1EA823F20;
    v10 = *(id *)(a1 + 32);
    v11 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], &v6);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v6, v7, v8, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(v4, "removeObserver:", v5);

}

void __72__NSManagedObject_IC__ic_postNotificationOnMainThreadAfterSaveWithName___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

@end
