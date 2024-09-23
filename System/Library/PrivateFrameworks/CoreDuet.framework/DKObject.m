@implementation DKObject

void __55___DKObject_MOConversion__fetchObjectWithUUID_context___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v2 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  v3 = (void *)MEMORY[0x1E0C97B20];
  +[_DKObject entityName](_DKObject, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entityForName:inManagedObjectContext:", v4, *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:", v5);

  v6 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 40), "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("UUID == %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v8);

  v9 = *(void **)(a1 + 32);
  v16 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v2, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;
  objc_msgSend(v10, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "objectID");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
}

void __55___DKObject_MOConversion__fetchObjectWithUUID_context___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, v0, v1, "Fetched object not found:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
