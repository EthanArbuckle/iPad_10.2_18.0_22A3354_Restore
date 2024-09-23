@implementation AVTEditingModelBuilder

+ (id)buildCoreModelFromPlistForPlatform:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "buildCoreModelFromPlistForPlatform:withLogger:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)buildCoreModelFromPlistForPlatform:(unint64_t)a3 withLogger:(id)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v5 = a4;
  v6 = -[AVTEditingModelDefinitionsParser initForPlatform:withLogger:]([AVTEditingModelDefinitionsParser alloc], "initForPlatform:withLogger:", a3, v5);
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__AVTEditingModelBuilder_buildCoreModelFromPlistForPlatform_withLogger___block_invoke;
  v9[3] = &unk_1EA51D2C8;
  v9[4] = &v10;
  objc_msgSend(v6, "parseWithCompletionHandler:", v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __72__AVTEditingModelBuilder_buildCoreModelFromPlistForPlatform_withLogger___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

@end
