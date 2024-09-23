@implementation NSFileCoordinator(BRAdditions)

+ (void)br_boostFilePresenter:()BRAdditions
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v3 = a3;
  if (BRIsFPFSEnabled(v3, v4))
  {
    objc_msgSend(v3, "presentedItemURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_br_itemServiceSyncProxy");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __56__NSFileCoordinator_BRAdditions__br_boostFilePresenter___block_invoke;
    v17[3] = &unk_1E3DA47F0;
    v7 = &v18;
    v18 = v3;
    objc_msgSend(v6, "boostFilePresenter:", v17);
  }
  else
  {
    +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "newLegacySyncProxy");

    objc_msgSend(v3, "presentedItemURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __56__NSFileCoordinator_BRAdditions__br_boostFilePresenter___block_invoke_1;
    v15 = &unk_1E3DA47F0;
    v7 = &v16;
    v16 = v9;
    v6 = v9;
    objc_msgSend(v6, "boostFilePresenterAtURL:reply:", v10, &v12);

    v11 = (id)objc_msgSend(v6, "result", v12, v13, v14, v15);
  }

}

@end
