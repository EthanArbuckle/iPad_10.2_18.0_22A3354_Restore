@implementation ICASSearchBufferArrayData

- (ICASSearchBufferArrayData)initWithSearchStringLength:(id)a3 topHitCount:(id)a4 nonTopHitCount:(id)a5 isResultSelected:(id)a6 nonTopHitRawCount:(id)a7 attachmentHitCount:(id)a8
{
  id v15;
  id v16;
  id v17;
  ICASSearchBufferArrayData *v18;
  ICASSearchBufferArrayData *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)ICASSearchBufferArrayData;
  v18 = -[ICASSearchBufferArrayData init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_searchStringLength, a3);
    objc_storeStrong((id *)&v19->_topHitCount, a4);
    objc_storeStrong((id *)&v19->_nonTopHitCount, a5);
    objc_storeStrong((id *)&v19->_isResultSelected, a6);
    objc_storeStrong((id *)&v19->_nonTopHitRawCount, a7);
    objc_storeStrong((id *)&v19->_attachmentHitCount, a8);
  }

  return v19;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("SearchBufferArrayData");
}

- (id)toDict
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
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
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[6];
  _QWORD v25[7];

  v25[6] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("searchStringLength");
  -[ICASSearchBufferArrayData searchStringLength](self, "searchStringLength");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[ICASSearchBufferArrayData searchStringLength](self, "searchStringLength");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_opt_new();
  }
  v22 = (void *)v3;
  v25[0] = v3;
  v24[1] = CFSTR("topHitCount");
  -[ICASSearchBufferArrayData topHitCount](self, "topHitCount");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[ICASSearchBufferArrayData topHitCount](self, "topHitCount", v20);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v25[1] = v4;
  v24[2] = CFSTR("nonTopHitCount");
  -[ICASSearchBufferArrayData nonTopHitCount](self, "nonTopHitCount", v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICASSearchBufferArrayData nonTopHitCount](self, "nonTopHitCount");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v25[2] = v7;
  v24[3] = CFSTR("isResultSelected");
  -[ICASSearchBufferArrayData isResultSelected](self, "isResultSelected");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ICASSearchBufferArrayData isResultSelected](self, "isResultSelected");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v25[3] = v10;
  v24[4] = CFSTR("nonTopHitRawCount");
  -[ICASSearchBufferArrayData nonTopHitRawCount](self, "nonTopHitRawCount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[ICASSearchBufferArrayData nonTopHitRawCount](self, "nonTopHitRawCount");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  v25[4] = v13;
  v24[5] = CFSTR("attachmentHitCount");
  -[ICASSearchBufferArrayData attachmentHitCount](self, "attachmentHitCount");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[ICASSearchBufferArrayData attachmentHitCount](self, "attachmentHitCount");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = objc_opt_new();
  }
  v17 = (void *)v16;
  v25[5] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSNumber)searchStringLength
{
  return self->_searchStringLength;
}

- (NSNumber)topHitCount
{
  return self->_topHitCount;
}

- (NSNumber)nonTopHitCount
{
  return self->_nonTopHitCount;
}

- (NSNumber)isResultSelected
{
  return self->_isResultSelected;
}

- (NSNumber)nonTopHitRawCount
{
  return self->_nonTopHitRawCount;
}

- (NSNumber)attachmentHitCount
{
  return self->_attachmentHitCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentHitCount, 0);
  objc_storeStrong((id *)&self->_nonTopHitRawCount, 0);
  objc_storeStrong((id *)&self->_isResultSelected, 0);
  objc_storeStrong((id *)&self->_nonTopHitCount, 0);
  objc_storeStrong((id *)&self->_topHitCount, 0);
  objc_storeStrong((id *)&self->_searchStringLength, 0);
}

@end
