@implementation GEOVectorTileAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GEOVectorTile");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)enumerateVisibleBuildingsUsingBlock:(id)a3
{
  void (**v3)(id, void *);
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = (void (**)(id, void *))a3;
  if (v3)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    v16 = 0;
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 0;
    AXPerformSafeBlock();
    v4 = (void *)v12[5];
    if (v4)
    {
      v5 = 0;
      do
      {
        if (v5 >= v8[3])
          break;
        objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
          v3[2](v3, v6);

        ++v5;
        v4 = (void *)v12[5];
      }
      while (v4);
    }
    _Block_object_dispose(&v7, 8);
    _Block_object_dispose(&v11, 8);

  }
}

uint64_t __66__GEOVectorTileAccessibility_enumerateVisibleBuildingsUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "buildingFootprints");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  result = objc_msgSend(*(id *)(a1 + 32), "buildingFootprintsCount");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)enumerateVisibleRoadsUsingBlock:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    AXPerformSafeBlock();

  }
}

void __62__GEOVectorTileAccessibility_enumerateVisibleRoadsUsingBlock___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __62__GEOVectorTileAccessibility_enumerateVisibleRoadsUsingBlock___block_invoke_2;
  v2[3] = &unk_25021BE88;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "forEachRoad:", v2);

}

uint64_t __62__GEOVectorTileAccessibility_enumerateVisibleRoadsUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
