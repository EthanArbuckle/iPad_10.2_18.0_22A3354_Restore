@implementation MPStorePlatformInitPropertyPlaylistMap

void ___MPStorePlatformInitPropertyPlaylistMap_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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
  v11[2] = ___MPStorePlatformInitPropertyPlaylistMap_block_invoke_2;
  v11[3] = &unk_1E3163A30;
  v12 = v6;
  v10 = v6;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "setUniversalStoreIdentifiersWithBlock:", v11);
  objc_msgSend(v8, "personID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPersonalStoreIdentifiersWithPersonID:block:", v9, &__block_literal_global_222);
}

void ___MPStorePlatformInitPropertyPlaylistMap_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGlobalPlaylistID:", v5);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("libraryPlaylistId"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUniversalCloudLibraryID:", v6);

}

@end
