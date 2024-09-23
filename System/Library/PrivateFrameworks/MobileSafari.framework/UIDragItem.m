@implementation UIDragItem

void __117__UIDragItem_MobileSafariExtras___sf_loadObjectsFromDragItems_usingLocalObjectLoader_objectLoader_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48));
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48));
}

void __117__UIDragItem_MobileSafariExtras___sf_loadObjectsFromDragItems_usingLocalObjectLoader_objectLoader_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void (*v9)(void *, _QWORD *);
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  v6 = v5;
  if (*(_QWORD *)(a1 + 56)
    && (objc_msgSend(v5, "localObject"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7)
    && ((*(void (**)(void *))(a1 + 56))(v6), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v9 = *(void (**)(void *, _QWORD *))(a1 + 64);
    objc_msgSend(v6, "itemProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __117__UIDragItem_MobileSafariExtras___sf_loadObjectsFromDragItems_usingLocalObjectLoader_objectLoader_completionHandler___block_invoke_3;
    v11[3] = &unk_1E21E52F0;
    v13 = *(id *)(a1 + 40);
    v14 = a3;
    v12 = *(id *)(a1 + 32);
    v9(v10, v11);

  }
}

void __117__UIDragItem_MobileSafariExtras___sf_loadObjectsFromDragItems_usingLocalObjectLoader_objectLoader_completionHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __117__UIDragItem_MobileSafariExtras___sf_loadObjectsFromDragItems_usingLocalObjectLoader_objectLoader_completionHandler___block_invoke_4(_QWORD *a1)
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1[6] + 8) + 48));
  objc_msgSend(MEMORY[0x1E0C99D20], "safari_arrayFromDictionaryOfObjectsByIndex:", a1[4]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1[6] + 8) + 48));
  (*(void (**)(void))(a1[5] + 16))();

}

@end
