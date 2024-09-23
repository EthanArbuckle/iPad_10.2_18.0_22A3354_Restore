@implementation BCSLinkItemModel

- (BCSLinkItemModel)initWithLinkMessage:(id)a3 bucketID:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BCSBusinessLinkContentItemModel *v11;
  void *v12;
  id v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  BCSLinkItemModel *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  const __CFString *v48;
  void *v49;
  uint8_t v50[128];
  uint8_t buf[4];
  int v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v4, "businessLinkContents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v45 != v9)
          objc_enumerationMutation(v6);
        v11 = -[BCSBusinessLinkContentItemModel initWithBusinessLinkContent:]([BCSBusinessLinkContentItemModel alloc], "initWithBusinessLinkContent:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i));
        objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "muid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_13;
  *__error() = 0;
  objc_msgSend(v4, "muid");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = strtoull((const char *)objc_msgSend(v13, "UTF8String"), 0, 0);

  if (*__error())
  {
    ABSLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v33 = *__error();
      *(_DWORD *)buf = 67109120;
      v52 = v33;
      _os_log_error_impl(&dword_20ACAD000, v15, OS_LOG_TYPE_ERROR, "BCSLinkItemModel: mapItemMUID could not be converted to a number: %d", buf, 8u);
    }

LABEL_13:
    v37 = 0;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v14);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v4, "categoryStyleAttributes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "dictionaryRepresentation");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v19);
  }

  if (objc_msgSend(v16, "count"))
  {
    v48 = CFSTR("attribute");
    v49 = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }
  v23 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v4, "link");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "URLWithString:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "heroImage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconImage");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v4, "redirectUrl");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "URLWithString:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v4, "action");
  v31 = objc_msgSend(v4, "hasIsPoweredBy");
  if (v31)
    LOBYTE(v31) = objc_msgSend(v4, "isPoweredBy");
  v39 = (BCSLinkItemModel *)-[BCSLinkItemModel initWithLinkURL:bundleID:heroImageURLString:iconImageURLString:redirectURL:action:mapIconStyleAttributes:mapItemMUID:businessLinkContentItemModels:isPoweredBy:](self, v34, v24, v25, v26, v29, v30, v36, v37, v5, v31);

  return v39;
}

+ (id)linkItemModelsFromLinkJSONObj:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  NSObject *v12;
  void *v13;
  BCSBusinessLinkMessage *v14;
  BCSLinkItemModel *v15;
  void *v16;
  void *v17;
  void *v18;
  BCSLinkItemModel *v19;
  NSObject *v20;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id obj;
  uint8_t buf[16];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("records"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = CFSTR("fields");
    v7 = *(_QWORD *)v28;
    v23 = *(_QWORD *)v28;
    do
    {
      v8 = 0;
      v24 = v5;
      do
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v8), "objectForKeyedSubscript:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("message"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v11 = v6;
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("value"));
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v12, 0);
          v14 = -[BCSBusinessLinkMessage initWithData:]([BCSBusinessLinkMessage alloc], "initWithData:", v13);
          v15 = [BCSLinkItemModel alloc];
          v16 = (void *)MEMORY[0x24BDD17C8];
          -[BCSBusinessLinkMessage link](v14, "link");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR("%@"), v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[BCSLinkItemModel initWithLinkMessage:bucketID:](v15, "initWithLinkMessage:bucketID:", v14, v18);

          if (v19)
          {
            objc_msgSend(v22, "addObject:", v19);
          }
          else
          {
            ABSLogCommon();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_20ACAD000, v20, OS_LOG_TYPE_ERROR, "BCSLinkItemModelFromLinkJSONObj: LinkItemModel object didn't initialize correctly", buf, 2u);
            }

          }
          v6 = v11;

          v7 = v23;
          v5 = v24;
        }
        else
        {
          ABSLogCommon();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_20ACAD000, v12, OS_LOG_TYPE_ERROR, "BCSLinkItemFromLinkJSONObj: Message object is not a dictionary or not initialized", buf, 2u);
          }
        }

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v5);
  }

  return v22;
}

+ (id)linkItemModelsFromRecords:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BCSBusinessLinkMessage *v10;
  BCSLinkItemModel *v11;
  void *v12;
  void *v13;
  void *v14;
  BCSLinkItemModel *v15;
  NSObject *v16;
  void *v17;
  id obj;
  uint8_t buf[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v8), "objectForKeyedSubscript:", CFSTR("message"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[BCSBusinessLinkMessage initWithData:]([BCSBusinessLinkMessage alloc], "initWithData:", v9);
        v11 = [BCSLinkItemModel alloc];
        v12 = (void *)MEMORY[0x24BDD17C8];
        -[BCSBusinessLinkMessage link](v10, "link");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@"), v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[BCSLinkItemModel initWithLinkMessage:bucketID:](v11, "initWithLinkMessage:bucketID:", v10, v14);

        if (v15)
        {
          objc_msgSend(v4, "addObject:", v15);
        }
        else
        {
          ABSLogCommon();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_20ACAD000, v16, OS_LOG_TYPE_ERROR, "BCSLinkItemModelFromRecords: LinkItemModel object didn't initialize correctly", buf, 2u);
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  v17 = (void *)objc_msgSend(v4, "copy");
  return v17;
}

- (id)initWithLinkURL:(void *)a3 bundleID:(void *)a4 heroImageURLString:(void *)a5 iconImageURLString:(void *)a6 redirectURL:(uint64_t)a7 action:(void *)a8 mapIconStyleAttributes:(void *)a9 mapItemMUID:(void *)a10 businessLinkContentItemModels:(char)a11 isPoweredBy:
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v40;
  id v41;
  id v42;
  objc_super v43;

  v18 = a2;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v40 = a6;
  v42 = a8;
  v41 = a9;
  v22 = a10;
  if (a1
    && (v43.receiver = a1,
        v43.super_class = (Class)BCSLinkItemModel,
        (a1 = objc_msgSendSuper2(&v43, sel_init)) != 0))
  {
    v23 = v18;
    v24 = objc_msgSend(v18, "copy");
    v25 = (void *)*((_QWORD *)a1 + 1);
    *((_QWORD *)a1 + 1) = v24;

    v26 = v19;
    v27 = objc_msgSend(v19, "copy");
    v28 = (void *)*((_QWORD *)a1 + 2);
    *((_QWORD *)a1 + 2) = v27;

    v29 = objc_msgSend(v20, "copy");
    v30 = (void *)*((_QWORD *)a1 + 3);
    *((_QWORD *)a1 + 3) = v29;

    v31 = objc_msgSend(v21, "copy");
    v32 = (void *)*((_QWORD *)a1 + 4);
    *((_QWORD *)a1 + 4) = v31;

    v33 = v40;
    v34 = objc_msgSend(v40, "copy");
    v35 = (void *)*((_QWORD *)a1 + 5);
    *((_QWORD *)a1 + 5) = v34;

    v36 = 1;
    if (a7 == 2)
      v36 = 2;
    if (a7 == 3)
      v36 = 3;
    *((_QWORD *)a1 + 6) = v36;
    objc_storeStrong((id *)a1 + 9, a8);
    objc_storeStrong((id *)a1 + 10, a9);
    v37 = objc_msgSend(v22, "copy");
    v38 = (void *)*((_QWORD *)a1 + 11);
    *((_QWORD *)a1 + 11) = v37;

    *((_BYTE *)a1 + 64) = a11;
  }
  else
  {
    v23 = v18;
    v26 = v19;
    v33 = v40;
  }

  return a1;
}

- (NSString)debugDescription
{
  return (NSString *)-[BCSLinkItemModel descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSArray *businessLinkContentItemModels;
  NSArray *v28;
  uint64_t v29;
  void *v30;
  NSDictionary *debugInfo;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    -[BCSLinkItemModel linkURL](self, "linkURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copyWithZone:", a3);
    v8 = *(void **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = v7;

    -[BCSLinkItemModel bundleID](self, "bundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v10;

    -[BCSLinkItemModel heroImageURLString](self, "heroImageURLString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copyWithZone:", a3);
    v14 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v13;

    -[BCSLinkItemModel iconImageURLString](self, "iconImageURLString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v16;

    -[BCSLinkItemModel redirectURL](self, "redirectURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copyWithZone:", a3);
    v20 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v19;

    -[BCSLinkItemModel mapIconStyleAttributes](self, "mapIconStyleAttributes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copyWithZone:", a3);
    v23 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v22;

    -[BCSLinkItemModel mapItemMUID](self, "mapItemMUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copyWithZone:", a3);
    v26 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v25;

    *(_QWORD *)(v5 + 48) = -[BCSLinkItemModel action](self, "action");
    if (self)
      businessLinkContentItemModels = self->_businessLinkContentItemModels;
    else
      businessLinkContentItemModels = 0;
    v28 = businessLinkContentItemModels;
    v29 = -[NSArray copyWithZone:](v28, "copyWithZone:", a3);
    v30 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = v29;

    *(_BYTE *)(v5 + 64) = -[BCSLinkItemModel isPoweredBy](self, "isPoweredBy");
    if (self)
      debugInfo = self->_debugInfo;
    else
      debugInfo = 0;
    objc_storeStrong((id *)(v5 + 96), debugInfo);
  }
  return (id)v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *linkURL;
  id v5;

  linkURL = self->_linkURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", linkURL, CFSTR("kBCSLinkItemModelLinkURLCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleID, CFSTR("kBCSLinkItemModelBundleIDCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_heroImageURLString, CFSTR("kBCSLinkItemModelHeroImageURLStringCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconImageURLString, CFSTR("kBCSLinkItemModelIconImageURLStringCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_redirectURL, CFSTR("kBCSLinkItemModelRedirectURLCodingKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_action, CFSTR("kBCSLinkItemModelActionCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_businessLinkContentItemModels, CFSTR("kBCSLinkItemModelContentItemCodingKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPoweredBy, CFSTR("kBCSLinkItemModelIsPoweredByCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mapIconStyleAttributes, CFSTR("kBCSLinkItemModelIconStyleAttributesCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mapItemMUID, CFSTR("kBCSLinkItemModelMapItemMUIDCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_debugInfo, CFSTR("kBCSLinkItemModelDebugInfoCodingKey"));

}

- (BCSLinkItemModel)initWithCoder:(id)a3
{
  id v4;
  BCSLinkItemModel *v5;
  uint64_t v6;
  NSURL *linkURL;
  uint64_t v8;
  NSString *bundleID;
  uint64_t v10;
  NSString *heroImageURLString;
  uint64_t v12;
  NSString *iconImageURLString;
  uint64_t v14;
  NSURL *redirectURL;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *businessLinkContentItemModels;
  uint64_t v21;
  NSNumber *mapItemMUID;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSDictionary *mapIconStyleAttributes;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSDictionary *debugInfo;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BCSLinkItemModel;
  v5 = -[BCSLinkItemModel init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kBCSLinkItemModelLinkURLCodingKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    linkURL = v5->_linkURL;
    v5->_linkURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kBCSLinkItemModelBundleIDCodingKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kBCSLinkItemModelHeroImageURLStringCodingKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    heroImageURLString = v5->_heroImageURLString;
    v5->_heroImageURLString = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kBCSLinkItemModelIconImageURLStringCodingKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    iconImageURLString = v5->_iconImageURLString;
    v5->_iconImageURLString = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kBCSLinkItemModelRedirectURLCodingKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    redirectURL = v5->_redirectURL;
    v5->_redirectURL = (NSURL *)v14;

    v5->_action = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kBCSLinkItemModelActionCodingKey"));
    v16 = (void *)MEMORY[0x24BDBCF20];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("kBCSLinkItemModelContentItemCodingKey"));
    v19 = objc_claimAutoreleasedReturnValue();
    businessLinkContentItemModels = v5->_businessLinkContentItemModels;
    v5->_businessLinkContentItemModels = (NSArray *)v19;

    v5->_isPoweredBy = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kBCSLinkItemModelIsPoweredByCodingKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kBCSLinkItemModelMapItemMUIDCodingKey"));
    v21 = objc_claimAutoreleasedReturnValue();
    mapItemMUID = v5->_mapItemMUID;
    v5->_mapItemMUID = (NSNumber *)v21;

    v23 = (void *)MEMORY[0x24BDBCF20];
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, v25, v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("kBCSLinkItemModelIconStyleAttributesCodingKey"));
    v28 = objc_claimAutoreleasedReturnValue();
    mapIconStyleAttributes = v5->_mapIconStyleAttributes;
    v5->_mapIconStyleAttributes = (NSDictionary *)v28;

    v30 = (void *)MEMORY[0x24BDBCF20];
    v31 = objc_opt_class();
    objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("kBCSLinkItemModelDebugInfoCodingKey"));
    v33 = objc_claimAutoreleasedReturnValue();
    debugInfo = v5->_debugInfo;
    v5->_debugInfo = (NSDictionary *)v33;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)fullHash
{
  uint64_t v2;
  void *v3;
  void *v4;

  -[BCSLinkItemModel _linkItemIdentifier](self);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = (void *)objc_msgSend(*(id *)(v2 + 8), "copy");
  else
    v4 = 0;

  return (NSString *)v4;
}

- (_QWORD)_linkItemIdentifier
{
  _QWORD *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[7];
    if (!v2)
    {
      objc_msgSend(a1, "linkURL");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      +[BCSLinkItemIdentifier identifierWithNormalizedURL:]((uint64_t)BCSLinkItemIdentifier, v3);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v1[7];
      v1[7] = v4;

      v2 = (void *)v1[7];
    }
    a1 = v2;
  }
  return a1;
}

- (NSObject)itemIdentifier
{
  void *v2;
  void *v3;

  -[BCSLinkItemModel _linkItemIdentifier](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)truncatedHash
{
  void *v2;
  int64_t v3;

  -[BCSLinkItemModel _linkItemIdentifier](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "truncatedHash");

  return v3;
}

- (int64_t)type
{
  void *v2;
  int64_t v3;

  -[BCSLinkItemModel _linkItemIdentifier](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  return v3;
}

- (BOOL)matchesItemIdentifying:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[BCSLinkItemModel _linkItemIdentifier](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "matchesItemIdentifying:", v4);

  return v6;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BCSLinkItemModel succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_linkURL, CFSTR("linkURL"), 1);
  objc_msgSend(v3, "appendString:withName:", self->_bundleID, CFSTR("bundleID"));
  -[BCSLinkItemModel fullHash](self, "fullHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("fullHash"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BCSLinkItemModel descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  BCSLinkItemModel *v12;

  v4 = (void *)MEMORY[0x24BE0BE08];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__BCSLinkItemModel_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_24C39BED8;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

id __58__BCSLinkItemModel_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  const __CFString *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("linkURL"), 1);
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("bundleID"));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "fullHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("fullHash"));

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("heroImageURLString"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("iconImageURLString"));
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("redirectURL"));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) - 1;
  if (v8 > 2)
    v9 = CFSTR("???");
  else
    v9 = off_24C39D488[v8];
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v9, CFSTR("action"));
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    v12 = *(_QWORD *)(v11 + 88);
  else
    v12 = 0;
  objc_msgSend(*(id *)(a1 + 32), "appendArraySection:withName:skipIfEmpty:", v12, CFSTR("businessContentItemModels"), 0);
  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 64), CFSTR("isPoweredBy"));
  v14 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80), CFSTR("mapItemMUID"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72), CFSTR("mapIconStyleAttributes"));
}

- (NSURL)linkURL
{
  return self->_linkURL;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)heroImageURLString
{
  return self->_heroImageURLString;
}

- (NSString)iconImageURLString
{
  return self->_iconImageURLString;
}

- (NSURL)redirectURL
{
  return self->_redirectURL;
}

- (int64_t)action
{
  return self->_action;
}

- (BOOL)isPoweredBy
{
  return self->_isPoweredBy;
}

- (NSNumber)mapItemMUID
{
  return self->_mapItemMUID;
}

- (NSDictionary)mapIconStyleAttributes
{
  return self->_mapIconStyleAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_businessLinkContentItemModels, 0);
  objc_storeStrong((id *)&self->_mapItemMUID, 0);
  objc_storeStrong((id *)&self->_mapIconStyleAttributes, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_redirectURL, 0);
  objc_storeStrong((id *)&self->_iconImageURLString, 0);
  objc_storeStrong((id *)&self->_heroImageURLString, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_linkURL, 0);
}

@end
