@implementation HFMutableItemSection

- (void)setItems:(id)a3 filteringToDisplayedItems:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__HFMutableItemSection_setItems_filteringToDisplayedItems___block_invoke;
  v9[3] = &unk_1EA7295B8;
  v10 = v6;
  v8 = v6;
  objc_msgSend(a3, "na_filter:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemSection setItems:](self, "setItems:", v7);

}

uint64_t __59__HFMutableItemSection_setItems_filteringToDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (void)setItemsUsingDefaultSortComparator:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "allObjects");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[HFItemSection defaultItemComparator](HFItemSection, "defaultItemComparator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemSection setItems:](self, "setItems:", v5);

}

@end
