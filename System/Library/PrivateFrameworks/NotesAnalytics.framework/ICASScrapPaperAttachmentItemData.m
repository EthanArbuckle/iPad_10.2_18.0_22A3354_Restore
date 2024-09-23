@implementation ICASScrapPaperAttachmentItemData

- (ICASScrapPaperAttachmentItemData)initWithTotalCountOfScrapPapersWithAttachmentDocScan:(id)a3 totalCountOfScrapPapersWithAttachmentInlineDrawingV1:(id)a4 totalCountOfScrapPapersWithAttachmentInlineDrawingV2:(id)a5 totalCountOfScrapPapersWithAttachmentPaperKit:(id)a6 totalCountOfScrapPapersWithAttachmentFullscreenDrawing:(id)a7 totalCountOfScrapPapersWithAttachmentTables:(id)a8 totalCountOfScrapPapersWithAttachmentOther:(id)a9 totalCountOfScrapPapersWithAttachmentRichUrl:(id)a10 totalCountOfScrapPapersWithAttachmentMapLink:(id)a11 totalCountOfScrapPapersWithAttachmentDeepLink:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  ICASScrapPaperAttachmentItemData *v22;
  ICASScrapPaperAttachmentItemData *v23;
  id obj;
  id v26;
  id v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  obj = a4;
  v33 = a4;
  v32 = a5;
  v26 = a6;
  v31 = a6;
  v27 = a7;
  v30 = a7;
  v29 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v35.receiver = self;
  v35.super_class = (Class)ICASScrapPaperAttachmentItemData;
  v22 = -[ICASScrapPaperAttachmentItemData init](&v35, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_totalCountOfScrapPapersWithAttachmentDocScan, a3);
    objc_storeStrong((id *)&v23->_totalCountOfScrapPapersWithAttachmentInlineDrawingV1, obj);
    objc_storeStrong((id *)&v23->_totalCountOfScrapPapersWithAttachmentInlineDrawingV2, a5);
    objc_storeStrong((id *)&v23->_totalCountOfScrapPapersWithAttachmentPaperKit, v26);
    objc_storeStrong((id *)&v23->_totalCountOfScrapPapersWithAttachmentFullscreenDrawing, v27);
    objc_storeStrong((id *)&v23->_totalCountOfScrapPapersWithAttachmentTables, a8);
    objc_storeStrong((id *)&v23->_totalCountOfScrapPapersWithAttachmentOther, a9);
    objc_storeStrong((id *)&v23->_totalCountOfScrapPapersWithAttachmentRichUrl, a10);
    objc_storeStrong((id *)&v23->_totalCountOfScrapPapersWithAttachmentMapLink, a11);
    objc_storeStrong((id *)&v23->_totalCountOfScrapPapersWithAttachmentDeepLink, a12);
  }

  return v23;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("ScrapPaperAttachmentItemData");
}

- (id)toDict
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[10];
  _QWORD v36[12];

  v36[10] = *MEMORY[0x1E0C80C00];
  v35[0] = CFSTR("totalCountOfScrapPapersWithAttachmentDocScan");
  -[ICASScrapPaperAttachmentItemData totalCountOfScrapPapersWithAttachmentDocScan](self, "totalCountOfScrapPapersWithAttachmentDocScan");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    -[ICASScrapPaperAttachmentItemData totalCountOfScrapPapersWithAttachmentDocScan](self, "totalCountOfScrapPapersWithAttachmentDocScan");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_opt_new();
  }
  v33 = (void *)v3;
  v36[0] = v3;
  v35[1] = CFSTR("totalCountOfScrapPapersWithAttachmentInlineDrawingV1");
  -[ICASScrapPaperAttachmentItemData totalCountOfScrapPapersWithAttachmentInlineDrawingV1](self, "totalCountOfScrapPapersWithAttachmentInlineDrawingV1");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    -[ICASScrapPaperAttachmentItemData totalCountOfScrapPapersWithAttachmentInlineDrawingV1](self, "totalCountOfScrapPapersWithAttachmentInlineDrawingV1");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v31 = (void *)v4;
  v36[1] = v4;
  v35[2] = CFSTR("totalCountOfScrapPapersWithAttachmentInlineDrawingV2");
  -[ICASScrapPaperAttachmentItemData totalCountOfScrapPapersWithAttachmentInlineDrawingV2](self, "totalCountOfScrapPapersWithAttachmentInlineDrawingV2");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    -[ICASScrapPaperAttachmentItemData totalCountOfScrapPapersWithAttachmentInlineDrawingV2](self, "totalCountOfScrapPapersWithAttachmentInlineDrawingV2");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_opt_new();
  }
  v29 = (void *)v5;
  v36[2] = v5;
  v35[3] = CFSTR("totalCountOfScrapPapersWithAttachmentPaperKit");
  -[ICASScrapPaperAttachmentItemData totalCountOfScrapPapersWithAttachmentPaperKit](self, "totalCountOfScrapPapersWithAttachmentPaperKit");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    -[ICASScrapPaperAttachmentItemData totalCountOfScrapPapersWithAttachmentPaperKit](self, "totalCountOfScrapPapersWithAttachmentPaperKit");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_opt_new();
  }
  v27 = (void *)v6;
  v36[3] = v6;
  v35[4] = CFSTR("totalCountOfScrapPapersWithAttachmentFullscreenDrawing");
  -[ICASScrapPaperAttachmentItemData totalCountOfScrapPapersWithAttachmentFullscreenDrawing](self, "totalCountOfScrapPapersWithAttachmentFullscreenDrawing");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    -[ICASScrapPaperAttachmentItemData totalCountOfScrapPapersWithAttachmentFullscreenDrawing](self, "totalCountOfScrapPapersWithAttachmentFullscreenDrawing");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v25 = (void *)v7;
  v36[4] = v7;
  v35[5] = CFSTR("totalCountOfScrapPapersWithAttachmentTables");
  -[ICASScrapPaperAttachmentItemData totalCountOfScrapPapersWithAttachmentTables](self, "totalCountOfScrapPapersWithAttachmentTables");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[ICASScrapPaperAttachmentItemData totalCountOfScrapPapersWithAttachmentTables](self, "totalCountOfScrapPapersWithAttachmentTables");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_opt_new();
  }
  v9 = (void *)v8;
  v36[5] = v8;
  v35[6] = CFSTR("totalCountOfScrapPapersWithAttachmentOther");
  -[ICASScrapPaperAttachmentItemData totalCountOfScrapPapersWithAttachmentOther](self, "totalCountOfScrapPapersWithAttachmentOther");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[ICASScrapPaperAttachmentItemData totalCountOfScrapPapersWithAttachmentOther](self, "totalCountOfScrapPapersWithAttachmentOther");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_opt_new();
  }
  v12 = (void *)v11;
  v36[6] = v11;
  v35[7] = CFSTR("totalCountOfScrapPapersWithAttachmentRichUrl");
  -[ICASScrapPaperAttachmentItemData totalCountOfScrapPapersWithAttachmentRichUrl](self, "totalCountOfScrapPapersWithAttachmentRichUrl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[ICASScrapPaperAttachmentItemData totalCountOfScrapPapersWithAttachmentRichUrl](self, "totalCountOfScrapPapersWithAttachmentRichUrl");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = objc_opt_new();
  }
  v15 = (void *)v14;
  v36[7] = v14;
  v35[8] = CFSTR("totalCountOfScrapPapersWithAttachmentMapLink");
  -[ICASScrapPaperAttachmentItemData totalCountOfScrapPapersWithAttachmentMapLink](self, "totalCountOfScrapPapersWithAttachmentMapLink");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[ICASScrapPaperAttachmentItemData totalCountOfScrapPapersWithAttachmentMapLink](self, "totalCountOfScrapPapersWithAttachmentMapLink");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = objc_opt_new();
  }
  v18 = (void *)v17;
  v36[8] = v17;
  v35[9] = CFSTR("totalCountOfScrapPapersWithAttachmentDeepLink");
  -[ICASScrapPaperAttachmentItemData totalCountOfScrapPapersWithAttachmentDeepLink](self, "totalCountOfScrapPapersWithAttachmentDeepLink");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[ICASScrapPaperAttachmentItemData totalCountOfScrapPapersWithAttachmentDeepLink](self, "totalCountOfScrapPapersWithAttachmentDeepLink");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = objc_opt_new();
  }
  v21 = (void *)v20;
  v36[9] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (NSNumber)totalCountOfScrapPapersWithAttachmentDocScan
{
  return self->_totalCountOfScrapPapersWithAttachmentDocScan;
}

- (NSNumber)totalCountOfScrapPapersWithAttachmentInlineDrawingV1
{
  return self->_totalCountOfScrapPapersWithAttachmentInlineDrawingV1;
}

- (NSNumber)totalCountOfScrapPapersWithAttachmentInlineDrawingV2
{
  return self->_totalCountOfScrapPapersWithAttachmentInlineDrawingV2;
}

- (NSNumber)totalCountOfScrapPapersWithAttachmentPaperKit
{
  return self->_totalCountOfScrapPapersWithAttachmentPaperKit;
}

- (NSNumber)totalCountOfScrapPapersWithAttachmentFullscreenDrawing
{
  return self->_totalCountOfScrapPapersWithAttachmentFullscreenDrawing;
}

- (NSNumber)totalCountOfScrapPapersWithAttachmentTables
{
  return self->_totalCountOfScrapPapersWithAttachmentTables;
}

- (NSNumber)totalCountOfScrapPapersWithAttachmentOther
{
  return self->_totalCountOfScrapPapersWithAttachmentOther;
}

- (NSNumber)totalCountOfScrapPapersWithAttachmentRichUrl
{
  return self->_totalCountOfScrapPapersWithAttachmentRichUrl;
}

- (NSNumber)totalCountOfScrapPapersWithAttachmentMapLink
{
  return self->_totalCountOfScrapPapersWithAttachmentMapLink;
}

- (NSNumber)totalCountOfScrapPapersWithAttachmentDeepLink
{
  return self->_totalCountOfScrapPapersWithAttachmentDeepLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalCountOfScrapPapersWithAttachmentDeepLink, 0);
  objc_storeStrong((id *)&self->_totalCountOfScrapPapersWithAttachmentMapLink, 0);
  objc_storeStrong((id *)&self->_totalCountOfScrapPapersWithAttachmentRichUrl, 0);
  objc_storeStrong((id *)&self->_totalCountOfScrapPapersWithAttachmentOther, 0);
  objc_storeStrong((id *)&self->_totalCountOfScrapPapersWithAttachmentTables, 0);
  objc_storeStrong((id *)&self->_totalCountOfScrapPapersWithAttachmentFullscreenDrawing, 0);
  objc_storeStrong((id *)&self->_totalCountOfScrapPapersWithAttachmentPaperKit, 0);
  objc_storeStrong((id *)&self->_totalCountOfScrapPapersWithAttachmentInlineDrawingV2, 0);
  objc_storeStrong((id *)&self->_totalCountOfScrapPapersWithAttachmentInlineDrawingV1, 0);
  objc_storeStrong((id *)&self->_totalCountOfScrapPapersWithAttachmentDocScan, 0);
}

@end
