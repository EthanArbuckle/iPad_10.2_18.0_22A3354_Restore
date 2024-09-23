@implementation ICDocCamDocumentInfoCollection

- (int64_t)docCamPDFVersion
{
  void *v2;
  double v3;
  int64_t v4;

  -[ICDocCamDocumentInfoCollection modificationDate](self, "modificationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  v4 = (uint64_t)v3;

  return v4;
}

- (ICDocCamDocumentInfoCollection)init
{
  ICDocCamDocumentInfoCollection *v2;
  ICDocCamDocumentInfoCollection *v3;
  NSString *title;
  uint64_t v5;
  NSDate *creationDate;
  void *v7;
  uint64_t v8;
  NSString *uniqueIdentifier;
  uint64_t v10;
  NSMutableArray *docInfos;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICDocCamDocumentInfoCollection;
  v2 = -[ICDocCamDocumentInfoCollection init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    title = v2->_title;
    v2->_title = 0;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = objc_claimAutoreleasedReturnValue();
    creationDate = v3->_creationDate;
    v3->_creationDate = (NSDate *)v5;

    objc_storeStrong((id *)&v3->_modificationDate, v3->_creationDate);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v3->_uniqueIdentifier;
    v3->_uniqueIdentifier = (NSString *)v8;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    docInfos = v3->_docInfos;
    v3->_docInfos = (NSMutableArray *)v10;

  }
  return v3;
}

+ (ICDocCamDocumentInfoCollection)infoCollectionWithArchivedDocumentCameraScanData:(id)a3 imageCache:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  VNDocumentCameraScan *v9;
  void *v10;

  v7 = a4;
  v8 = a3;
  v9 = -[VNDocumentCameraScan initWithArchivedData:error:]([VNDocumentCameraScan alloc], "initWithArchivedData:error:", v8, a5);

  -[VNDocumentCameraScan infoCollectionWithImageCache:error:](v9, "infoCollectionWithImageCache:error:", v7, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICDocCamDocumentInfoCollection *)v10;
}

- (void)bumpModificationDate
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamDocumentInfoCollection setModificationDate:](self, "setModificationDate:", v3);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICDocCamDocumentInfoCollection)initWithCoder:(id)a3
{
  id v4;
  ICDocCamDocumentInfoCollection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICDocCamDocumentInfoCollection;
  v5 = -[ICDocCamDocumentInfoCollection init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTitleFieldCodingKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamDocumentInfoCollection setTitle:](v5, "setTitle:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCreationDateFieldCodingKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamDocumentInfoCollection setCreationDate:](v5, "setCreationDate:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kModificationDateFieldCodingKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamDocumentInfoCollection setModificationDate:](v5, "setModificationDate:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kUniqueIdentifierFieldCodingKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamDocumentInfoCollection setUniqueIdentifier:](v5, "setUniqueIdentifier:", v9);

    v10 = (void *)MEMORY[0x24BDBCF20];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("kDocInfosFieldCodingKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamDocumentInfoCollection setDocInfos:](v5, "setDocInfos:", v13);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[ICDocCamDocumentInfoCollection title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kTitleFieldCodingKey"));

  -[ICDocCamDocumentInfoCollection creationDate](self, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCreationDateFieldCodingKey"));

  -[ICDocCamDocumentInfoCollection modificationDate](self, "modificationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kModificationDateFieldCodingKey"));

  -[ICDocCamDocumentInfoCollection uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kUniqueIdentifierFieldCodingKey"));

  -[ICDocCamDocumentInfoCollection docInfos](self, "docInfos");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("kDocInfosFieldCodingKey"));

}

+ (void)infoCollectionFromSidecarItems:(id)a3 imageCache:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  _QWORD v12[4];
  void (**v13)(id, void *);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  objc_msgSend(a1, "infoCollectionFromArchiveSidecarItems:imageCache:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v10)
      v10[2](v10, v11);
  }
  else
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __87__ICDocCamDocumentInfoCollection_infoCollectionFromSidecarItems_imageCache_completion___block_invoke;
    v12[3] = &unk_24C5B88A0;
    v13 = v10;
    objc_msgSend(a1, "infoCollectionFromImageSidecarItems:imageCache:completion:", v8, v9, v12);

  }
}

uint64_t __87__ICDocCamDocumentInfoCollection_infoCollectionFromSidecarItems_imageCache_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)infoCollectionFromArchiveSidecarItems:(id)a3 imageCache:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  VNDocumentCameraScan *v10;
  void *v11;
  VNDocumentCameraScan *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v20;
  id v21;

  v5 = a3;
  v6 = a4;
  v7 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[ICDocCamDocumentInfoCollection infoCollectionFromArchiveSidecarItems:imageCache:].cold.5(v5);

  objc_msgSend(v5, "dc_objectPassingTest:", &__block_literal_global_14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [VNDocumentCameraScan alloc];
    objc_msgSend(v8, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v12 = -[VNDocumentCameraScan initWithArchivedData:error:](v10, "initWithArchivedData:error:", v11, &v21);
    v13 = v21;

    if (v12)
    {
      v20 = v13;
      -[VNDocumentCameraScan infoCollectionWithImageCache:error:](v12, "infoCollectionWithImageCache:error:", v6, &v20);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v20;

      v16 = os_log_create("com.apple.documentcamera", ");
      v17 = v16;
      if (v14)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          +[ICDocCamDocumentInfoCollection infoCollectionFromArchiveSidecarItems:imageCache:].cold.4();

        v14 = v14;
        v18 = v14;
      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          +[ICDocCamDocumentInfoCollection infoCollectionFromArchiveSidecarItems:imageCache:].cold.3();

        v18 = 0;
      }
    }
    else
    {
      v14 = os_log_create("com.apple.documentcamera", ");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[ICDocCamDocumentInfoCollection infoCollectionFromArchiveSidecarItems:imageCache:].cold.2();
      v18 = 0;
      v15 = v13;
    }

  }
  else
  {
    v15 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[ICDocCamDocumentInfoCollection infoCollectionFromArchiveSidecarItems:imageCache:].cold.1();
    v18 = 0;
  }

  return v18;
}

uint64_t __83__ICDocCamDocumentInfoCollection_infoCollectionFromArchiveSidecarItems_imageCache___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToType:", CFSTR("com.apple.DocumentCamera.scan-archive"));
}

+ (void)infoCollectionFromImageSidecarItems:(id)a3 imageCache:(id)a4 completion:(id)a5
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  os_log_t v20;
  os_log_t v21;
  id v22;
  void *v23;
  ICDocCamDocumentInfo *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  _QWORD block[4];
  id v36;
  id v37;
  _QWORD v38[4];
  ICDocCamDocumentInfo *v39;
  id v40;
  NSObject *v41;
  uint8_t v42;
  _BYTE v43[15];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v34 = a4;
  v32 = a5;
  v8 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[ICDocCamDocumentInfoCollection infoCollectionFromImageSidecarItems:imageCache:completion:].cold.2(v7);

  v9 = dispatch_group_create();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v45;
    v14 = (void *)*MEMORY[0x24BDF8438];
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v45 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v15);
        objc_msgSend(v14, "identifier", v32);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "conformsToType:", v17))
        {

LABEL_14:
          v22 = objc_alloc(MEMORY[0x24BDF6AC8]);
          objc_msgSend(v16, "data");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (os_log_t)objc_msgSend(v22, "initWithData:", v23);

          if (v21)
          {
            dispatch_group_enter(v9);
            v24 = objc_alloc_init(ICDocCamDocumentInfo);
            v38[0] = MEMORY[0x24BDAC760];
            v38[1] = 3221225472;
            v38[2] = __92__ICDocCamDocumentInfoCollection_infoCollectionFromImageSidecarItems_imageCache_completion___block_invoke;
            v38[3] = &unk_24C5B88E8;
            v39 = v24;
            v40 = v33;
            v41 = v9;
            v20 = v24;
            objc_msgSend(v34, "setImage:metaData:addToMemoryCache:completion:", v21, MEMORY[0x24BDBD1B8], 0, v38);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setFullImageUUID:](v20, "setFullImageUUID:", v25);

          }
          else
          {
            v20 = os_log_create("com.apple.documentcamera", ");
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              +[ICDocCamDocumentInfoCollection infoCollectionFromImageSidecarItems:imageCache:completion:].cold.1(&v42, v43, v20);
          }
          goto LABEL_18;
        }
        objc_msgSend(v16, "data");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "length");

        if (!v19)
          goto LABEL_14;
        v20 = os_log_create("com.apple.documentcamera", ");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v16, "type");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v16, "data");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "length"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v49 = v26;
          v50 = 2112;
          v51 = v29;
          _os_log_debug_impl(&dword_20CE8E000, v20, OS_LOG_TYPE_DEBUG, "Item data doesn't conform to JPEG — skipping {type: %@, data.length: %@}", buf, 0x16u);

        }
        v21 = v20;
LABEL_18:

        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v12);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__ICDocCamDocumentInfoCollection_infoCollectionFromImageSidecarItems_imageCache_completion___block_invoke_173;
  block[3] = &unk_24C5B7BA0;
  v36 = v33;
  v37 = v32;
  v30 = v32;
  v31 = v33;
  dispatch_group_notify(v9, MEMORY[0x24BDAC9B8], block);

}

void __92__ICDocCamDocumentInfoCollection_infoCollectionFromImageSidecarItems_imageCache_completion___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  NSObject *v4;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "fullImageUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCroppedAndFilteredImageUUID:", v3);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v4 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __92__ICDocCamDocumentInfoCollection_infoCollectionFromImageSidecarItems_imageCache_completion___block_invoke_cold_1();

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __92__ICDocCamDocumentInfoCollection_infoCollectionFromImageSidecarItems_imageCache_completion___block_invoke_173(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  ICDocCamDocumentInfoCollection *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;

  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __92__ICDocCamDocumentInfoCollection_infoCollectionFromImageSidecarItems_imageCache_completion___block_invoke_173_cold_2();

    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  }
  v4 = objc_alloc_init(ICDocCamDocumentInfoCollection);
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  -[ICDocCamDocumentInfoCollection setDocInfos:](v4, "setDocInfos:", v5);

  v6 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __92__ICDocCamDocumentInfoCollection_infoCollectionFromImageSidecarItems_imageCache_completion___block_invoke_173_cold_1();

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, ICDocCamDocumentInfoCollection *))(v7 + 16))(v7, v4);

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_storeStrong((id *)&self->_modificationDate, a3);
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (NSMutableArray)docInfos
{
  return self->_docInfos;
}

- (void)setDocInfos:(id)a3
{
  objc_storeStrong((id *)&self->_docInfos, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_docInfos, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (void)infoCollectionFromArchiveSidecarItems:imageCache:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20CE8E000, v0, v1, "Item doesn't have data — returning", v2);
  OUTLINED_FUNCTION_1_0();
}

+ (void)infoCollectionFromArchiveSidecarItems:imageCache:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_20CE8E000, v0, v1, "Cannot convert item data to scan document — returning {error: %@}", v2, v3, v4, v5, v6);
}

+ (void)infoCollectionFromArchiveSidecarItems:imageCache:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_20CE8E000, v0, v1, "Cannot convert scan document to info collection — returning {error: %@}", v2, v3, v4, v5, v6);
}

+ (void)infoCollectionFromArchiveSidecarItems:imageCache:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_20CE8E000, v0, v1, "Created info collection from archive sidecar item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)infoCollectionFromArchiveSidecarItems:(void *)a1 imageCache:.cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_20CE8E000, v2, v3, "Collecting info collection for scan archive items… {#items: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

+ (void)infoCollectionFromImageSidecarItems:(uint8_t *)a1 imageCache:(_BYTE *)a2 completion:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_0(&dword_20CE8E000, a3, (uint64_t)a3, "Item data cannot be converted to image — skipping", a1);
}

+ (void)infoCollectionFromImageSidecarItems:(void *)a1 imageCache:completion:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_20CE8E000, v2, v3, "Collecting info collection for image sidecar items… {#items: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __92__ICDocCamDocumentInfoCollection_infoCollectionFromImageSidecarItems_imageCache_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_20CE8E000, v0, v1, "Cannot set image for cache — skipping", v2);
  OUTLINED_FUNCTION_1_0();
}

void __92__ICDocCamDocumentInfoCollection_infoCollectionFromImageSidecarItems_imageCache_completion___block_invoke_173_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_20CE8E000, v0, v1, "Created info collection from image sidecar items", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __92__ICDocCamDocumentInfoCollection_infoCollectionFromImageSidecarItems_imageCache_completion___block_invoke_173_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_20CE8E000, v0, v1, "Didn't find any suitable sidecar items", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
