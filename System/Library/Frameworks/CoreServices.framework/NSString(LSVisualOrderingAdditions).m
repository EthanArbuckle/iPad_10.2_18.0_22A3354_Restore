@implementation NSString(LSVisualOrderingAdditions)

- (id)ls_visuallyOrderCharactersReturningError:()LSVisualOrderingAdditions
{
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__20;
  v18 = __Block_byref_object_dispose__20;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__20;
  v12 = __Block_byref_object_dispose__20;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__NSString_LSVisualOrderingAdditions__ls_visuallyOrderCharactersReturningError___block_invoke;
  v7[3] = &unk_1E10432F8;
  v7[4] = &v14;
  v7[5] = &v8;
  _LSDNCWithCharacters(a1, v7);
  v4 = (void *)v15[5];
  if (a3 && !v4)
  {
    *a3 = objc_retainAutorelease((id)v9[5]);
    v4 = (void *)v15[5];
  }
  v5 = v4;
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

@end
