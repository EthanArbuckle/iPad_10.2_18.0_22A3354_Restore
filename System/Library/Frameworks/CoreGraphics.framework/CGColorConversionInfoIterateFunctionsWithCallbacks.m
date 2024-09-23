@implementation CGColorConversionInfoIterateFunctionsWithCallbacks

uint64_t __CGColorConversionInfoIterateFunctionsWithCallbacks_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t);
  __int128 v8;
  _OWORD v10[3];
  _OWORD v11[2];

  v5 = *(_QWORD *)(a1 + 32);
  if (!v5)
    return 1;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t))(v5 + 16);
  v8 = *(_OWORD *)(v6 + 56);
  v10[1] = *(_OWORD *)(v6 + 40);
  v10[2] = v8;
  v11[0] = *(_OWORD *)(v6 + 72);
  *(_OWORD *)((char *)v11 + 12) = *(_OWORD *)(v6 + 84);
  v10[0] = *(_OWORD *)(v6 + 24);
  return v7(v5, v10, a2, a3, a4);
}

uint64_t __CGColorConversionInfoIterateFunctionsWithCallbacks_block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, _OWORD *, uint64_t, uint64_t);
  __int128 v7;
  _OWORD v9[3];
  _OWORD v10[2];

  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
    return 1;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t))(v4 + 16);
  v7 = *(_OWORD *)(v5 + 56);
  v9[1] = *(_OWORD *)(v5 + 40);
  v9[2] = v7;
  v10[0] = *(_OWORD *)(v5 + 72);
  *(_OWORD *)((char *)v10 + 12) = *(_OWORD *)(v5 + 84);
  v9[0] = *(_OWORD *)(v5 + 24);
  return v6(v4, v9, a2, a3);
}

uint64_t __CGColorConversionInfoIterateFunctionsWithCallbacks_block_invoke_2(uint64_t a1, _OWORD *a2)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, _OWORD *);
  __int128 v10;
  _OWORD v12[3];
  _OWORD v13[2];

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = a2[2];
  v4 = a2[3];
  v6 = *(_OWORD *)((char *)a2 + 60);
  *(_OWORD *)(v3 + 40) = a2[1];
  *(_OWORD *)(v3 + 84) = v6;
  *(_OWORD *)(v3 + 72) = v4;
  *(_OWORD *)(v3 + 56) = v5;
  *(_OWORD *)(v3 + 24) = *a2;
  v7 = *(_QWORD *)(a1 + 32);
  if (!v7)
    return 1;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(uint64_t (**)(uint64_t, _OWORD *))(v7 + 16);
  v10 = *(_OWORD *)(v8 + 56);
  v12[1] = *(_OWORD *)(v8 + 40);
  v12[2] = v10;
  v13[0] = *(_OWORD *)(v8 + 72);
  *(_OWORD *)((char *)v13 + 12) = *(_OWORD *)(v8 + 84);
  v12[0] = *(_OWORD *)(v8 + 24);
  return v9(v7, v12);
}

uint64_t (*__CGColorConversionInfoIterateFunctionsWithCallbacks_block_invoke())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncTransformIterate");
  v1 = colorsync_smart_null_746;
  if (result)
    v1 = result;
  CGColorConversionInfoIterateFunctionsWithCallbacks_f = v1;
  return result;
}

uint64_t __CGColorConversionInfoIterateFunctionsWithCallbacks_block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, _OWORD *, uint64_t, uint64_t);
  __int128 v7;
  _OWORD v9[3];
  _OWORD v10[2];

  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
    return 1;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t))(v4 + 16);
  v7 = *(_OWORD *)(v5 + 56);
  v9[1] = *(_OWORD *)(v5 + 40);
  v9[2] = v7;
  v10[0] = *(_OWORD *)(v5 + 72);
  *(_OWORD *)((char *)v10 + 12) = *(_OWORD *)(v5 + 84);
  v9[0] = *(_OWORD *)(v5 + 24);
  return v6(v4, v9, a2, a3);
}

@end
