@implementation MUCollectionViewDiffableDataSourceCellProviderForwardingBlock

id __MUCollectionViewDiffableDataSourceCellProviderForwardingBlock_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  void *v13;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "collectionView:cellForItemAtIndexPath:itemIdentifier:", v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    if (!NavdRecentLocationsEntitlment_block_invoke_fallbackCellRegistration)
    {
      objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), &__block_literal_global_11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)NavdRecentLocationsEntitlment_block_invoke_fallbackCellRegistration;
      NavdRecentLocationsEntitlment_block_invoke_fallbackCellRegistration = v12;

    }
    objc_msgSend(v7, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

@end
