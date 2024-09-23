@implementation NSArray

uint64_t __33__NSArray_DC__dc_objectsOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

void __29__NSArray_DC__dc_compactMap___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dc_addNonNilObject:", v2);

}

void __22__NSArray_DC__dc_map___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);

}

void __26__NSArray_DC__dc_flatMap___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = objc_opt_class();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  DCCheckedDynamicCast(v4, (uint64_t)v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v6);
}

@end
