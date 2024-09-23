@implementation HFFakeMediaAccessoryItemProvider

- (HFFakeMediaAccessoryItemProvider)init
{
  HFFakeMediaAccessoryItemProvider *v2;
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFFakeMediaAccessoryItemProvider;
  v2 = -[HFItemProvider init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 1; i != 9; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

    }
    -[HFFakeMediaAccessoryItemProvider setMediaAccessoryItemTypes:](v2, "setMediaAccessoryItemTypes:", v3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFFakeMediaAccessoryItemProvider setMediaAccessoryItems:](v2, "setMediaAccessoryItems:", v6);

  }
  return v2;
}

- (id)items
{
  void *v2;
  void *v3;

  -[HFFakeMediaAccessoryItemProvider mediaAccessoryItems](self, "mediaAccessoryItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[HFFakeMediaAccessoryItemProvider mediaAccessoryItemTypes](self, "mediaAccessoryItemTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v4, &__block_literal_global_235, &__block_literal_global_3_18, &__block_literal_global_5_16, &__block_literal_global_7_17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__HFFakeMediaAccessoryItemProvider_reloadItems__block_invoke_5;
  v8[3] = &unk_1EA72C438;
  v8[4] = self;
  objc_msgSend(v5, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __47__HFFakeMediaAccessoryItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __47__HFFakeMediaAccessoryItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "mediaAccessoryItemType"));
}

uint64_t __47__HFFakeMediaAccessoryItemProvider_reloadItems__block_invoke_3()
{
  return 1;
}

HFFakeMediaAccessoryItem *__47__HFFakeMediaAccessoryItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  HFFakeMediaAccessoryItem *v3;
  uint64_t v4;

  v2 = a2;
  v3 = [HFFakeMediaAccessoryItem alloc];
  v4 = objc_msgSend(v2, "unsignedIntegerValue");

  return -[HFFakeMediaAccessoryItem initWithMediaAccessoryItemType:](v3, "initWithMediaAccessoryItemType:", v4);
}

id __47__HFFakeMediaAccessoryItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "mediaAccessoryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minusSet:", v6);

  objc_msgSend(*(id *)(a1 + 32), "mediaAccessoryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSMutableSet)mediaAccessoryItems
{
  return self->_mediaAccessoryItems;
}

- (void)setMediaAccessoryItems:(id)a3
{
  objc_storeStrong((id *)&self->_mediaAccessoryItems, a3);
}

- (NSMutableSet)mediaAccessoryItemTypes
{
  return self->_mediaAccessoryItemTypes;
}

- (void)setMediaAccessoryItemTypes:(id)a3
{
  objc_storeStrong((id *)&self->_mediaAccessoryItemTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaAccessoryItemTypes, 0);
  objc_storeStrong((id *)&self->_mediaAccessoryItems, 0);
}

@end
