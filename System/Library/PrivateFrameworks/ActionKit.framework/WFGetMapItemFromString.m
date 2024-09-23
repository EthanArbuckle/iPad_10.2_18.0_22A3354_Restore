@implementation WFGetMapItemFromString

void __WFGetMapItemFromString_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (objc_msgSend(v10, "count"))
  {
    v6 = objc_alloc((Class)getMKPlacemarkClass());
    objc_msgSend(v10, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithPlacemark:", v7);

    v9 = (void *)objc_msgSend(objc_alloc((Class)getMKMapItemClass_35886()), "initWithPlacemark:", v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

@end
