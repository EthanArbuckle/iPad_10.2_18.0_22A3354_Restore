@implementation CalDatabaseRequestApplicationSnapshotUpdate

void ___CalDatabaseRequestApplicationSnapshotUpdate_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_CalDatabaseRequestApplicationSnapshotUpdate_systemService;
  _CalDatabaseRequestApplicationSnapshotUpdate_systemService = v0;

  v8 = *MEMORY[0x1E0D22CF0];
  v6 = *MEMORY[0x1E0D22BB0];
  v7 = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_CalDatabaseRequestApplicationSnapshotUpdate_options;
  _CalDatabaseRequestApplicationSnapshotUpdate_options = v4;

}

void ___CalDatabaseRequestApplicationSnapshotUpdate_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    objc_msgSend(a3, "code");
    CFLog();
  }
}

@end
