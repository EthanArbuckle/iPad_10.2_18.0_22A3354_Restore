@implementation _SWHighlightEventAllowList

+ (id)_eventClassToTypeMap
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[8];
  _QWORD v13[9];

  v13[8] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v13[0] = &unk_1E287B168;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  v13[1] = &unk_1E287B180;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v4;
  v13[2] = &unk_1E287B198;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v5;
  v13[3] = &unk_1E287B1B0;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v6;
  v13[4] = &unk_1E287B168;
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v7;
  v13[5] = &unk_1E287B180;
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[6] = v8;
  v13[6] = &unk_1E287B198;
  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[7] = v9;
  v13[7] = &unk_1E287B1B0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)allowedClasses
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "_eventClassToTypeMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (Class)eventClassForType:(int64_t)a3
{
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v11 = 0;
  objc_msgSend(a1, "_eventClassToTypeMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48___SWHighlightEventAllowList_eventClassForType___block_invoke;
  v7[3] = &unk_1E2873F58;
  v7[4] = &v8;
  v7[5] = a3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  v5 = (id)v9[3];
  _Block_object_dispose(&v8, 8);
  return (Class)v5;
}

+ (int64_t)eventTypeForClass:(Class)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  int64_t v9;

  objc_msgSend(a1, "_eventClassToTypeMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &unk_1E287B1C8;
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  v9 = objc_msgSend(v8, "integerValue");
  return v9;
}

@end
