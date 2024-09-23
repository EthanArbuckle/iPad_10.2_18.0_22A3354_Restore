@implementation _BRCUploadInfo

- (BOOL)allUploadsPendingQuota
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  -[_BRCUploadInfo outOfQuotaObjIDs](self, "outOfQuotaObjIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[_BRCUploadInfo outOfQuotaObjIDs](self, "outOfQuotaObjIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    -[_BRCTransferInfo versionSizes](self, "versionSizes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 == objc_msgSend(v6, "count");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (_BRCUploadInfo)init
{
  _BRCUploadInfo *v2;
  _BRCUploadInfo *v3;
  void *v4;
  NSMutableSet *v5;
  NSMutableSet *outOfQuotaObjIDs;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_BRCUploadInfo;
  v2 = -[_BRCTransferInfo init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_BRCTransferInfo progress](v2, "progress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUserInfoObject:forKey:", *MEMORY[0x1E0CB30E0], *MEMORY[0x1E0CB30C8]);

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    outOfQuotaObjIDs = v3->_outOfQuotaObjIDs;
    v3->_outOfQuotaObjIDs = v5;

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_BRCUploadInfo;
  -[_BRCTransferInfo description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasSuffix:", CFSTR(">")))
  {
    objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCUploadInfo outOfQuotaObjIDs](self, "outOfQuotaObjIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" ooq:%lu>"), objc_msgSend(v5, "count"));
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

- (void)updateLocalizedDescriptionWithOptions:(char)a3
{
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __CFString *v22;

  v5 = CFSTR("GLOBAL_PROGRESS_UPLOADS_WAITING_DESCRIPTION");
  if ((a3 & 4) == 0)
    v5 = CFSTR("GLOBAL_PROGRESS_UPLOADING_CAPITALIZE_DESCRIPTION");
  v6 = (void *)MEMORY[0x1E0CB34D0];
  v7 = v5;
  objc_msgSend(v6, "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BRCTransferInfo progress](self, "progress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB30E8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v11, "unsignedLongValue");
  _BRLocalizedStringWithFormat();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_BRCTransferInfo progress](self, "progress", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLocalizedDescription:", v12);

  if ((a3 & 2) != 0)
  {
    -[_BRCTransferInfo progress](self, "progress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "totalUnitCount");

    -[_BRCTransferInfo progress](self, "progress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "completedUnitCount");

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    BRLocalizedFileSizeDescription();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    BRLocalizedFileSizeDescription();
    v20 = v17;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _BRLocalizedStringWithFormat();
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = &stru_1E8769030;
  }
  -[_BRCTransferInfo progress](self, "progress", v20, v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLocalizedAdditionalDescription:", v22);

}

- (void)copyProgressInfoToProgress:(id)a3 options:(char)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)_BRCUploadInfo;
  v6 = a3;
  -[_BRCTransferInfo copyProgressInfoToProgress:options:](&v9, sel_copyProgressInfoToProgress_options_, v6, v4);
  -[BRCProgress localizedDescription](self->super._progress, "localizedDescription", v9.receiver, v9.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocalizedDescription:", v7);

  -[BRCProgress localizedAdditionalDescription](self->super._progress, "localizedAdditionalDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocalizedAdditionalDescription:", v8);

}

- (NSMutableSet)outOfQuotaObjIDs
{
  return self->_outOfQuotaObjIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outOfQuotaObjIDs, 0);
}

@end
