@implementation CNHashBuilder

+ (unint64_t)arrayHash:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      v9 = 17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v9 = objc_msgSend(a1, "objectHash:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i)) - v9 + 32 * v9;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
    else
    {
      v9 = 17;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (unint64_t)objectHash:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "hash");
  else
    return 0;
}

+ (unint64_t)cgfloatHash:(double)a3
{
  return *(_QWORD *)&a3;
}

+ (unint64_t)hashWithBlocks:(id)a3
{
  uint64_t (**v3)(_QWORD);
  uint64_t (**v4)(_QWORD);
  unint64_t v5;
  const void **v6;
  uint64_t (**v7)(_QWORD);
  const void **v9;
  uint64_t v10;

  v3 = (uint64_t (**)(_QWORD))a3;
  v9 = (const void **)&v10;
  if (!v3)
    return 17;
  v4 = v3;
  v5 = 17;
  do
  {
    v5 = v4[2](v4) - v5 + 32 * v5;
    v6 = v9++;
    v7 = (uint64_t (**)(_QWORD))_Block_copy(*v6);

    v4 = v7;
  }
  while (v7);
  return v5;
}

+ (unint64_t)BOOLHash:(BOOL)a3
{
  return a3;
}

+ (unint64_t)pointerHash:(void *)a3
{
  return (unint64_t)a3;
}

+ (unint64_t)setHash:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  if (!a3)
    return 0;
  objc_msgSend(a3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_map:", &__block_literal_global_44);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_2_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(a1, "arrayHash:", v6);
  return v7;
}

uint64_t __25__CNHashBuilder_setHash___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "hash"));
}

uint64_t __25__CNHashBuilder_setHash___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (unint64_t)orderedSetHash:(id)a3
{
  void *v4;
  unint64_t v5;

  if (!a3)
    return 0;
  objc_msgSend(a3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "arrayHash:", v4);

  return v5;
}

+ (unint64_t)dictionaryHash:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 17;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __32__CNHashBuilder_dictionaryHash___block_invoke;
    v8[3] = &unk_1E29BB1B0;
    v8[4] = &v9;
    v8[5] = a1;
    objc_msgSend(v4, "_cn_each:", v8);
    v6 = v10[3];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __32__CNHashBuilder_dictionaryHash___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v7 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v5, "objectHash:", a2) - v6 + 32 * v6;
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v9 = objc_msgSend(*(id *)(a1 + 40), "objectHash:", v7);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v9 - v8 + 32 * v8;
}

+ (unint64_t)integerHash:(int64_t)a3
{
  if (a3 >= 0)
    return a3;
  else
    return -a3;
}

+ (unint64_t)unsignedIntegerHash:(unint64_t)a3
{
  return a3;
}

+ (unint64_t)cgpointHash:(CGPoint)a3
{
  double y;
  uint64_t v5;

  y = a3.y;
  v5 = objc_msgSend(a1, "cgfloatHash:", a3.x);
  return objc_msgSend(a1, "cgfloatHash:", y) - v5 + 32 * v5 + 16337;
}

+ (unint64_t)cgsizeHash:(CGSize)a3
{
  double height;
  uint64_t v5;

  height = a3.height;
  v5 = objc_msgSend(a1, "cgfloatHash:", a3.width);
  return objc_msgSend(a1, "cgfloatHash:", height) - v5 + 32 * v5 + 16337;
}

+ (unint64_t)cgrectHash:(CGRect)a3
{
  double height;
  double width;
  uint64_t v6;

  height = a3.size.height;
  width = a3.size.width;
  v6 = objc_msgSend(a1, "cgpointHash:", a3.origin.x, a3.origin.y);
  return objc_msgSend(a1, "cgsizeHash:", width, height) - v6 + 32 * v6 + 16337;
}

@end
