@implementation NUImage

void __26___NUImage__purgeableCopy__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 40;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(*(_QWORD *)(a1 + 40) + 48));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(*(_QWORD *)v2 + 56);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(id *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        v9 = v8;
        if (v8)
          objc_msgSend(v8, "incrementUseCount", (_QWORD)v10);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "replacePointerAtIndex:withPointer:", v5 + v7, v9, (_QWORD)v10);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v5 += v7;
    }
    while (v4);
  }

}

void __28___NUImage_endAccessRegion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  _OWORD v11[2];

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = *(void **)(v3 + 24);
  if (v2)
  {
    objc_msgSend(v2, "bounds");
    v5 = *(void **)(a1 + 40);
  }
  else
  {
    v5 = 0;
    memset(v11, 0, sizeof(v11));
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28___NUImage_endAccessRegion___block_invoke_2;
  v8[3] = &unk_1E5063890;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = v7;
  objc_msgSend(v4, "enumerateTilesForWritingInRect:withBlock:", v11, v8);

}

void __28___NUImage_endAccessRegion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  _OWORD v10[2];

  v3 = a2;
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (v3)
    objc_msgSend(v3, "frameRect");
  else
    memset(v10, 0, sizeof(v10));
  if (objc_msgSend(v5, "intersectsRect:", v10))
  {
    v6 = objc_msgSend(v4, "index");
    --*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) + v6);
    v7 = *(_QWORD **)(a1 + 40);
    if (!*(_BYTE *)(v7[9] + v6))
    {
      objc_msgSend(v7, "_tileAtIndex:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
        objc_msgSend(v8, "decrementAccessCount");

    }
  }

}

void __30___NUImage_beginAccessRegion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD v12[2];

  v3 = a1[4];
  v2 = (void *)a1[5];
  v4 = *(void **)(v3 + 24);
  if (v2)
  {
    objc_msgSend(v2, "bounds");
    v5 = (void *)a1[5];
  }
  else
  {
    v5 = 0;
    memset(v12, 0, sizeof(v12));
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __30___NUImage_beginAccessRegion___block_invoke_2;
  v8[3] = &unk_1E5063840;
  v6 = v5;
  v7 = a1[4];
  v9 = v6;
  v10 = v7;
  v11 = a1[6];
  objc_msgSend(v4, "enumerateTilesForWritingInRect:withBlock:", v12, v8);

}

void __30___NUImage_beginAccessRegion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _OWORD v13[2];
  _OWORD v14[2];

  v3 = a2;
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (v3)
    objc_msgSend(v3, "frameRect");
  else
    memset(v14, 0, sizeof(v14));
  if (objc_msgSend(v5, "intersectsRect:", v14))
  {
    v6 = objc_msgSend(v4, "index");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72);
    v8 = *(unsigned __int8 *)(v7 + v6);
    *(_BYTE *)(v7 + v6) = v8 + 1;
    if (!v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "_tileAtIndex:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9 && (objc_msgSend(v9, "incrementAccessCount") & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "validRegion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
          objc_msgSend(v4, "frameRect");
        else
          memset(v13, 0, sizeof(v13));
        objc_msgSend(v11, "regionByRemovingRect:", v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setValidRegion:", v12);

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      }

    }
  }

}

void __34___NUImage_writeRegion_withBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD v17[2];

  v5 = a2;
  v6 = v5;
  v7 = *(void **)(a1 + 32);
  if (v5)
    objc_msgSend(v5, "frameRect");
  else
    memset(v17, 0, sizeof(v17));
  if (objc_msgSend(v7, "intersectsRect:", v17))
  {
    v8 = objc_msgSend(v6, "index");
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(NSObject **)(v9 + 16);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __34___NUImage_writeRegion_withBlock___block_invoke_2;
    v11[3] = &unk_1E5063818;
    v11[4] = v9;
    v15 = v8;
    v12 = v6;
    v13 = *(id *)(a1 + 32);
    v14 = *(id *)(a1 + 48);
    v16 = a3;
    dispatch_sync(v10, v11);

  }
}

void __34___NUImage_writeRegion_withBlock___block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "validRegion");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "regionByAddingRegion:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setValidRegion:", v2);

}

void __34___NUImage_writeRegion_withBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;

  objc_msgSend(*(id *)(a1 + 32), "tileAtIndex:", *(_QWORD *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_createOrCopyTile:tileInfo:writeRegion:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 40), "translatedAndClippedRegion:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __34___NUImage_writeRegion_withBlock___block_invoke_3;
  v18[3] = &unk_1E5063778;
  v22 = *(id *)(a1 + 56);
  v5 = v2;
  v19 = v5;
  v6 = v3;
  v20 = v6;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 72);
  v21 = v7;
  v23 = v8;
  if (objc_msgSend(v5, "writeStorageInRegion:block:", v6, v18) == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_createOrCopyTile:tileInfo:writeRegion:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __34___NUImage_writeRegion_withBlock___block_invoke_4;
    v12[3] = &unk_1E5063778;
    v16 = *(id *)(a1 + 56);
    v5 = v9;
    v13 = v5;
    v14 = v6;
    v10 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 72);
    v15 = v10;
    v17 = v11;
    objc_msgSend(v5, "writeStorageInRegion:block:", v14, v12);

  }
}

uint64_t __34___NUImage_writeRegion_withBlock___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], a2, a1[8]);
}

uint64_t __34___NUImage_writeRegion_withBlock___block_invoke_4(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], a2, a1[8]);
}

void __51___NUImage__createOrCopyTile_tileInfo_writeRegion___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  _OWORD v5[2];

  objc_msgSend(*(id *)(a1 + 32), "validRegion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v3;
  objc_msgSend(v2, "regionByRemovingRect:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setValidRegion:", v4);

}

void __51___NUImage__createOrCopyTile_tileInfo_writeRegion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  BOOL v4;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "_tileAtIndex:", *(_QWORD *)(a1 + 72));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  obj = (id)v2;
  if (v2)
  {
    v4 = v2 == (_QWORD)v3;
    v3 = (void *)v2;
    if (!v4)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 48));
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), obj);
      goto LABEL_10;
    }
  }
  else if (!v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "replacePointerAtIndex:withPointer:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48));
    goto LABEL_10;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + *(_QWORD *)(a1 + 72)))
  {
    objc_msgSend(v3, "decrementAccessCount");
    v3 = *(void **)(a1 + 40);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "replacePointerAtIndex:withPointer:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + *(_QWORD *)(a1 + 72)))
    objc_msgSend(*(id *)(a1 + 48), "decrementAccessCount");
LABEL_10:

}

void __33___NUImage_readRegion_withBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  _OWORD v18[2];

  v5 = a2;
  v6 = v5;
  v7 = *(void **)(a1 + 32);
  if (v5)
    objc_msgSend(v5, "contentRect");
  else
    memset(v18, 0, sizeof(v18));
  if (objc_msgSend(v7, "intersectsRect:", v18))
  {
    objc_msgSend(*(id *)(a1 + 40), "tileAtIndex:", objc_msgSend(v6, "index"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && objc_msgSend(v8, "isValid"))
    {
      objc_msgSend(v6, "translatedAndClippedRegion:", *(_QWORD *)(a1 + 32));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __33___NUImage_readRegion_withBlock___block_invoke_2;
      v12[3] = &unk_1E5063778;
      v16 = *(id *)(a1 + 48);
      v13 = v9;
      v14 = v10;
      v15 = v6;
      v17 = a3;
      v11 = v10;
      objc_msgSend(v13, "readStorageInRegion:block:", v11, v12);

    }
  }

}

uint64_t __33___NUImage_readRegion_withBlock___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], a2, a1[8]);
}

void __24___NUImage_tileAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_tileAtIndex:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __23___NUImage_description__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;

  if (*(uint64_t *)(a1 + 48) >= 1)
  {
    v2 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "_tileAtIndex:", v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        v10 = 0u;
        v11 = 0u;
        objc_msgSend(*(id *)(a1 + 32), "layout");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        if (v4)
        {
          objc_msgSend(v4, "frameRectForTileAtIndex:", v2);
        }
        else
        {
          v10 = 0u;
          v11 = 0u;
        }

        v7 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{origin={%ld, %ld} size={%ld, %ld}}]"), v10, v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ - %@"), v8, v9);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v6 = CFSTR("n/a");
      }
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

      ++v2;
    }
    while (v2 < *(_QWORD *)(a1 + 48));
  }
}

@end
