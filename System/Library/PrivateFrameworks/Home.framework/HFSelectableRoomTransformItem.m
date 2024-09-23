@implementation HFSelectableRoomTransformItem

- (HFSelectableRoomTransformItem)initWithSourceItem:(id)a3 updateOptionsTransformBlock:(id)a4 resultsTransformBlock:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithRoomItem_accessoryVendor_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSelectableRoomTransformItem.m"), 25, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFSelectableRoomTransformItem initWithSourceItem:updateOptionsTransformBlock:resultsTransformBlock:]",
    v8);

  return 0;
}

- (HFSelectableRoomTransformItem)initWithRoomItem:(id)a3 accessoryVendor:(id)a4
{
  id v6;
  id v7;
  id v8;
  HFSelectableRoomTransformItem *v9;
  objc_super v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v12[1] = 3221225472;
  v12[2] = __66__HFSelectableRoomTransformItem_initWithRoomItem_accessoryVendor___block_invoke;
  v12[3] = &unk_1EA7329E0;
  v13 = a4;
  v14 = v6;
  v11.receiver = self;
  v11.super_class = (Class)HFSelectableRoomTransformItem;
  v12[0] = MEMORY[0x1E0C809B0];
  v7 = v6;
  v8 = v13;
  v9 = -[HFTransformItem initWithSourceItem:updateOptionsTransformBlock:resultsTransformBlock:](&v11, sel_initWithSourceItem_updateOptionsTransformBlock_resultsTransformBlock_, v7, 0, v12);

  return v9;
}

id __66__HFSelectableRoomTransformItem_initWithRoomItem_accessoryVendor___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_93);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66__HFSelectableRoomTransformItem_initWithRoomItem_accessoryVendor___block_invoke_3;
  v16[3] = &unk_1EA727840;
  v8 = v5;
  v17 = v8;
  v9 = objc_msgSend(v7, "na_any:", v16);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("selected"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = (void *)objc_msgSend(v11, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v14, "mutableCopy");

  }
  objc_msgSend(v13, "unionSet:", v4);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("dependentHomeKitObjects"));

  return v3;
}

uint64_t __66__HFSelectableRoomTransformItem_initWithRoomItem_accessoryVendor___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

uint64_t __66__HFSelectableRoomTransformItem_initWithRoomItem_accessoryVendor___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

@end
