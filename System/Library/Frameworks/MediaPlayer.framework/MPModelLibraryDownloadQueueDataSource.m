@implementation MPModelLibraryDownloadQueueDataSource

void __72___MPModelLibraryDownloadQueueDataSource_identifiersForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  v5 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "mediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72___MPModelLibraryDownloadQueueDataSource_identifiersForItemAtIndexPath___block_invoke_2;
  v6[3] = &__block_descriptor_40_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "setLibraryIdentifiersWithDatabaseID:block:", v4, v6);

}

uint64_t __72___MPModelLibraryDownloadQueueDataSource_identifiersForItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPersistentID:", *(_QWORD *)(a1 + 32));
}

@end
