@implementation CHUISWatchComplicationsSnapshotMetadataUpdateAction

- (CHUISWatchComplicationsSnapshotMetadataUpdateAction)initWithMetadata:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  CHUISWatchComplicationsSnapshotMetadataUpdateAction *v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "temporaryDirectory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("SnapshotMetadataImageData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[CHUISWatchComplicationsSnapshotMetadataUpdateAction initWithMetadata:directory:completion:](self, "initWithMetadata:directory:completion:", v6, v10, v7);
  return v11;
}

- (CHUISWatchComplicationsSnapshotMetadataUpdateAction)initWithMetadata:(id)a3 directory:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CHUISWatchComplicationsSnapshotMetadataUpdateAction *v18;
  objc_super v20;
  _QWORD v21[4];
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0D016A0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __93__CHUISWatchComplicationsSnapshotMetadataUpdateAction_initWithMetadata_directory_completion___block_invoke;
  v21[3] = &unk_1E6B84A80;
  v12 = v10;
  v22 = v12;
  objc_msgSend(v11, "responderWithHandler:", v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setQueue:", MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, 0);

  v15 = (void *)objc_msgSend(v8, "copyForEncodingAtUrlDirectory:", v9);
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setObject:forSetting:", v15, 0);
  v17 = (void *)objc_msgSend(v16, "copy");
  v20.receiver = self;
  v20.super_class = (Class)CHUISWatchComplicationsSnapshotMetadataUpdateAction;
  v18 = -[CHUISWatchComplicationsSnapshotMetadataUpdateAction initWithInfo:responder:](&v20, sel_initWithInfo_responder_, v17, v13);

  return v18;
}

void __93__CHUISWatchComplicationsSnapshotMetadataUpdateAction_initWithMetadata_directory_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v6, "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      objc_msgSend(v6, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
    }
  }

}

- (CHUISWatchComplicationsWidgetSnapshotMetadata)metadata
{
  void *v2;
  void *v3;

  -[CHUISWatchComplicationsSnapshotMetadataUpdateAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CHUISWatchComplicationsWidgetSnapshotMetadata *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urls, 0);
}

@end
