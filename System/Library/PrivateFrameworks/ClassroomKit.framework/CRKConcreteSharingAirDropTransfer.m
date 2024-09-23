@implementation CRKConcreteSharingAirDropTransfer

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CRKConcreteSharingAirDropTransfer manager](self, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)CRKConcreteSharingAirDropTransfer;
  -[CRKConcreteSharingAirDropTransfer dealloc](&v4, sel_dealloc);
}

- (CRKConcreteSharingAirDropTransfer)initWithAutoAccept:(BOOL)a3 hideProgress:(BOOL)a4 senderName:(id)a5 previewImageData:(id)a6 bundleID:(id)a7 sourceBundleID:(id)a8 itemsDescription:(id)a9 fileURLs:(id)a10 resultHandler:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  CRKConcreteSharingAirDropTransfer *v24;
  CRKConcreteSharingAirDropTransfer *v25;
  uint64_t v26;
  NSString *senderName;
  uint64_t v28;
  NSData *previewImageData;
  uint64_t v30;
  NSString *bundleID;
  uint64_t v32;
  NSString *sourceBundleID;
  uint64_t v34;
  NSString *itemsDescription;
  uint64_t v36;
  NSSet *fileURLs;
  uint64_t v38;
  id resultHandler;
  uint64_t v40;
  SFAirDropClassroomTransferManager *manager;
  NSArray *destFileURLs;
  void *v43;
  uint64_t v44;
  NSString *identifier;
  objc_super v47;

  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v47.receiver = self;
  v47.super_class = (Class)CRKConcreteSharingAirDropTransfer;
  v24 = -[CRKConcreteSharingAirDropTransfer init](&v47, sel_init);
  v25 = v24;
  if (v24)
  {
    v24->_autoAccept = a3;
    v24->_hideProgress = a4;
    v26 = objc_msgSend(v17, "copy");
    senderName = v25->_senderName;
    v25->_senderName = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    previewImageData = v25->_previewImageData;
    v25->_previewImageData = (NSData *)v28;

    v30 = objc_msgSend(v19, "copy");
    bundleID = v25->_bundleID;
    v25->_bundleID = (NSString *)v30;

    v32 = objc_msgSend(v20, "copy");
    sourceBundleID = v25->_sourceBundleID;
    v25->_sourceBundleID = (NSString *)v32;

    v34 = objc_msgSend(v21, "copy");
    itemsDescription = v25->_itemsDescription;
    v25->_itemsDescription = (NSString *)v34;

    v36 = objc_msgSend(v22, "copy");
    fileURLs = v25->_fileURLs;
    v25->_fileURLs = (NSSet *)v36;

    v38 = MEMORY[0x219A226E8](v23);
    resultHandler = v25->_resultHandler;
    v25->_resultHandler = (id)v38;

    v40 = objc_opt_new();
    manager = v25->_manager;
    v25->_manager = (SFAirDropClassroomTransferManager *)v40;

    -[SFAirDropClassroomTransferManager setDelegate:](v25->_manager, "setDelegate:", v25);
    -[SFAirDropClassroomTransferManager activate](v25->_manager, "activate");
    destFileURLs = v25->_destFileURLs;
    v25->_destFileURLs = (NSArray *)MEMORY[0x24BDBD1A8];

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "UUIDString");
    v44 = objc_claimAutoreleasedReturnValue();
    identifier = v25->_identifier;
    v25->_identifier = (NSString *)v44;

  }
  return v25;
}

- (void)invalidate
{
  id v2;

  -[CRKConcreteSharingAirDropTransfer manager](self, "manager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)updateWithState:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a4;
  -[CRKConcreteSharingAirDropTransfer manager](self, "manager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKConcreteSharingAirDropTransfer identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend((id)objc_opt_class(), "transferStateForState:", a3);
  -[CRKConcreteSharingAirDropTransfer transferInfoDictionary](self, "transferInfoDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateTransferWithIdentifier:withState:information:completionHandler:", v7, v8, v9, v6);

}

- (CRKConcreteSharingAirDropTransfer)transferWithIdentifierWasAccepted:(id)a3
{
  return (CRKConcreteSharingAirDropTransfer *)-[CRKConcreteSharingAirDropTransfer propagateResultForIdentifier:withSuccess:error:](self, "propagateResultForIdentifier:withSuccess:error:", a3, 1, 0);
}

- (CRKConcreteSharingAirDropTransfer)transferWithIdentifierWasDeclined:(id)a3 withFailureReason:(unint64_t)a4
{
  uint64_t v5;
  id v6;
  CRKConcreteSharingAirDropTransfer *result;
  id v8;

  if (a4 == 2)
    v5 = 115;
  else
    v5 = 18;
  v6 = a3;
  CRKErrorWithCodeAndUserInfo(v5, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKConcreteSharingAirDropTransfer propagateResultForIdentifier:withSuccess:error:](self, "propagateResultForIdentifier:withSuccess:error:", v6, 0, v8);

  return result;
}

- (CRKConcreteSharingAirDropTransfer)transferWithIdentifierWasDeclined:(id)a3
{
  id v4;
  CRKConcreteSharingAirDropTransfer *result;
  id v6;

  v4 = a3;
  CRKErrorWithCodeAndUserInfo(1, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKConcreteSharingAirDropTransfer propagateResultForIdentifier:withSuccess:error:](self, "propagateResultForIdentifier:withSuccess:error:", v4, 0, v6);

  return result;
}

- (NSString)description
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[CRKConcreteSharingAirDropTransfer transferInfoDictionary](self, "transferInfoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = *MEMORY[0x24BE90408];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE90408]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "length"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("<Data with length %@>"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v4);

  }
  objc_msgSend(v3, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void)propagateResultForIdentifier:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v10;
  id v11;

  v6 = a4;
  v11 = a3;
  v8 = a5;
  -[CRKConcreteSharingAirDropTransfer identifier](self, "identifier");
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isEqualToString:", v9))
    goto LABEL_4;
  -[CRKConcreteSharingAirDropTransfer resultHandler](self, "resultHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CRKConcreteSharingAirDropTransfer resultHandler](self, "resultHandler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _BOOL8, id))v9)[2](v9, v11, v6, v8);
LABEL_4:

  }
}

+ (int64_t)transferStateForState:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 4)
    return 1;
  else
    return a3;
}

- (id)transferInfoDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[5];

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKConcreteSharingAirDropTransfer autoAccept](self, "autoAccept"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BE903C8]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKConcreteSharingAirDropTransfer hideProgress](self, "hideProgress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE90428]);

  -[CRKConcreteSharingAirDropTransfer senderName](self, "senderName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CRKConcreteSharingAirDropTransfer senderName](self, "senderName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE90470]);

  }
  -[CRKConcreteSharingAirDropTransfer bundleID](self, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (_QWORD *)MEMORY[0x24BE903D0];
  if (v8)
  {
    -[CRKConcreteSharingAirDropTransfer bundleID](self, "bundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *v9);

  }
  -[CRKConcreteSharingAirDropTransfer destFileURLs](self, "destFileURLs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    -[CRKConcreteSharingAirDropTransfer destFileURLs](self, "destFileURLs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE90438]);

  }
  -[CRKConcreteSharingAirDropTransfer fileURLs](self, "fileURLs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    -[CRKConcreteSharingAirDropTransfer fileURLs](self, "fileURLs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __59__CRKConcreteSharingAirDropTransfer_transferInfoDictionary__block_invoke;
    v28[3] = &unk_24D9CA150;
    v28[4] = self;
    objc_msgSend(v18, "crk_mapUsingBlock:", v28);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE90420]);

  }
  -[CRKConcreteSharingAirDropTransfer previewImageData](self, "previewImageData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[CRKConcreteSharingAirDropTransfer previewImageData](self, "previewImageData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, *MEMORY[0x24BE90408]);

  }
  -[CRKConcreteSharingAirDropTransfer sourceBundleID](self, "sourceBundleID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[CRKConcreteSharingAirDropTransfer sourceBundleID](self, "sourceBundleID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, *v9);

  }
  -[CRKConcreteSharingAirDropTransfer itemsDescription](self, "itemsDescription");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[CRKConcreteSharingAirDropTransfer itemsDescription](self, "itemsDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, *MEMORY[0x24BE90430]);

  }
  v26 = (void *)objc_msgSend(v3, "copy");

  return v26;
}

id __59__CRKConcreteSharingAirDropTransfer_transferInfoDictionary__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "infoForFileURL:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)infoForFileURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE90410]);
  objc_msgSend(a1, "UTIForURL:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE90418]);
  if (objc_msgSend(v5, "count"))
    v8 = (void *)objc_msgSend(v5, "copy");
  else
    v8 = 0;

  return v8;
}

+ (id)UTIForURL:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v15[0] = *MEMORY[0x24BDBCBE8];
  v4 = v15[0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resourceValuesForKeys:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "pathExtension");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = &stru_24D9CB490;
    if (v9)
      v11 = (__CFString *)v9;
    v12 = v11;

    objc_msgSend(MEMORY[0x24BDF8238], "typeWithFilenameExtension:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSSet)fileURLs
{
  return self->_fileURLs;
}

- (NSArray)destFileURLs
{
  return self->_destFileURLs;
}

- (void)setDestFileURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)autoAccept
{
  return self->_autoAccept;
}

- (BOOL)hideProgress
{
  return self->_hideProgress;
}

- (NSString)senderName
{
  return self->_senderName;
}

- (NSData)previewImageData
{
  return self->_previewImageData;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)sourceBundleID
{
  return self->_sourceBundleID;
}

- (NSString)itemsDescription
{
  return self->_itemsDescription;
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (SFAirDropClassroomTransferManager)manager
{
  return self->_manager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_itemsDescription, 0);
  objc_storeStrong((id *)&self->_sourceBundleID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_previewImageData, 0);
  objc_storeStrong((id *)&self->_senderName, 0);
  objc_storeStrong((id *)&self->_destFileURLs, 0);
  objc_storeStrong((id *)&self->_fileURLs, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
