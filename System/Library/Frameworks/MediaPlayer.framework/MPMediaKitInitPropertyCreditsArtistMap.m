@implementation MPMediaKitInitPropertyCreditsArtistMap

void ___MPMediaKitInitPropertyCreditsArtistMap_block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(a2, "valueForKeyPath:", CFSTR("relationships.artists.data.id.@firstObject"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v6);

}

void ___MPMediaKitInitPropertyCreditsArtistMap_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a2;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = ___MPMediaKitInitPropertyCreditsArtistMap_block_invoke_2;
  v11[3] = &unk_1E3163A30;
  v12 = v6;
  v10 = v6;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "setUniversalStoreIdentifiersWithBlock:", v11);
  objc_msgSend(v8, "personID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPersonalStoreIdentifiersWithPersonID:block:", v9, &__block_literal_global_523);
}

void ___MPMediaKitInitPropertyCreditsArtistMap_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("id"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSocialProfileID:", v4);

}

@end
