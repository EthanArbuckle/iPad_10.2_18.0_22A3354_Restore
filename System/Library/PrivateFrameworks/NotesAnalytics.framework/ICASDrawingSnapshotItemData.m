@implementation ICASDrawingSnapshotItemData

- (ICASDrawingSnapshotItemData)initWithCountOfInlineDrawingV1PencilStrokes:(id)a3 countOfInlineDrawingV1FingerStrokes:(id)a4 countOfInlineDrawingV2PencilStrokes:(id)a5 countOfInlineDrawingV2FingerStrokes:(id)a6 countOfFullscreenDrawingStrokes:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ICASDrawingSnapshotItemData *v17;
  ICASDrawingSnapshotItemData *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ICASDrawingSnapshotItemData;
  v17 = -[ICASDrawingSnapshotItemData init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_countOfInlineDrawingV1PencilStrokes, a3);
    objc_storeStrong((id *)&v18->_countOfInlineDrawingV1FingerStrokes, a4);
    objc_storeStrong((id *)&v18->_countOfInlineDrawingV2PencilStrokes, a5);
    objc_storeStrong((id *)&v18->_countOfInlineDrawingV2FingerStrokes, a6);
    objc_storeStrong((id *)&v18->_countOfFullscreenDrawingStrokes, a7);
  }

  return v18;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("DrawingSnapshotItemData");
}

- (id)toDict
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("countOfInlineDrawingV1PencilStrokes");
  -[ICASDrawingSnapshotItemData countOfInlineDrawingV1PencilStrokes](self, "countOfInlineDrawingV1PencilStrokes");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[ICASDrawingSnapshotItemData countOfInlineDrawingV1PencilStrokes](self, "countOfInlineDrawingV1PencilStrokes", v19);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_opt_new();
  }
  v4 = (void *)v3;
  v22[0] = v3;
  v21[1] = CFSTR("countOfInlineDrawingV1FingerStrokes");
  -[ICASDrawingSnapshotItemData countOfInlineDrawingV1FingerStrokes](self, "countOfInlineDrawingV1FingerStrokes", v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ICASDrawingSnapshotItemData countOfInlineDrawingV1FingerStrokes](self, "countOfInlineDrawingV1FingerStrokes");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_opt_new();
  }
  v7 = (void *)v6;
  v22[1] = v6;
  v21[2] = CFSTR("countOfInlineDrawingV2PencilStrokes");
  -[ICASDrawingSnapshotItemData countOfInlineDrawingV2PencilStrokes](self, "countOfInlineDrawingV2PencilStrokes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[ICASDrawingSnapshotItemData countOfInlineDrawingV2PencilStrokes](self, "countOfInlineDrawingV2PencilStrokes");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_opt_new();
  }
  v10 = (void *)v9;
  v22[2] = v9;
  v21[3] = CFSTR("countOfInlineDrawingV2FingerStrokes");
  -[ICASDrawingSnapshotItemData countOfInlineDrawingV2FingerStrokes](self, "countOfInlineDrawingV2FingerStrokes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[ICASDrawingSnapshotItemData countOfInlineDrawingV2FingerStrokes](self, "countOfInlineDrawingV2FingerStrokes");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = objc_opt_new();
  }
  v13 = (void *)v12;
  v22[3] = v12;
  v21[4] = CFSTR("countOfFullscreenDrawingStrokes");
  -[ICASDrawingSnapshotItemData countOfFullscreenDrawingStrokes](self, "countOfFullscreenDrawingStrokes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[ICASDrawingSnapshotItemData countOfFullscreenDrawingStrokes](self, "countOfFullscreenDrawingStrokes");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = objc_opt_new();
  }
  v16 = (void *)v15;
  v22[4] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSNumber)countOfInlineDrawingV1PencilStrokes
{
  return self->_countOfInlineDrawingV1PencilStrokes;
}

- (NSNumber)countOfInlineDrawingV1FingerStrokes
{
  return self->_countOfInlineDrawingV1FingerStrokes;
}

- (NSNumber)countOfInlineDrawingV2PencilStrokes
{
  return self->_countOfInlineDrawingV2PencilStrokes;
}

- (NSNumber)countOfInlineDrawingV2FingerStrokes
{
  return self->_countOfInlineDrawingV2FingerStrokes;
}

- (NSNumber)countOfFullscreenDrawingStrokes
{
  return self->_countOfFullscreenDrawingStrokes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countOfFullscreenDrawingStrokes, 0);
  objc_storeStrong((id *)&self->_countOfInlineDrawingV2FingerStrokes, 0);
  objc_storeStrong((id *)&self->_countOfInlineDrawingV2PencilStrokes, 0);
  objc_storeStrong((id *)&self->_countOfInlineDrawingV1FingerStrokes, 0);
  objc_storeStrong((id *)&self->_countOfInlineDrawingV1PencilStrokes, 0);
}

@end
