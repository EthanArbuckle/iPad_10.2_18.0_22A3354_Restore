@implementation MPMediaKitInitPropertyGenreMap

void ___MPMediaKitInitPropertyGenreMap_block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(a3, "personID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPersonalStoreIdentifiersWithPersonID:block:", v6, &__block_literal_global_409);

}

@end
