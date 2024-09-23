@implementation MRMediaRemoteGetSyncableSupportedCommandsForPlayer

void __MRMediaRemoteGetSyncableSupportedCommandsForPlayer_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_37);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "filteredArrayUsingPredicate:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, void *, uint64_t))(v7 + 16))(v7, v6, a3);

}

uint64_t __MRMediaRemoteGetSyncableSupportedCommandsForPlayer_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoDoNotSync"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "BOOLValue") ^ 1;
  return v4;
}

@end
