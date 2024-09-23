@implementation CKDateChatItem

- (id)loadTranscriptText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
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
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v26;
  void *v27;

  -[CKDateChatItem date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDateChatItem now](self, "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transcriptRegularFontAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldUseSimpleTimestampsInTranscript");

  v9 = objc_msgSend(v4, "compare:", v3);
  if (v8)
  {
    if (v9 == -1)
    {
      v10 = v4;
      v11 = v3;
    }
    else
    {
      v10 = v3;
      v11 = v4;
    }
    +[CKDateUtilities relativeFullDateOnlyFormatterFromDate:toDate:](CKDateUtilities, "relativeFullDateOnlyFormatterFromDate:toDate:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringFromDate:", v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v15, v6);
  }
  else
  {
    v27 = v4;
    if (v9 == -1)
    {
      +[CKDateUtilities relativeDateFormatterFromDate:toDate:](CKDateUtilities, "relativeDateFormatterFromDate:toDate:", v4, v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v4;
      v14 = v3;
    }
    else
    {
      +[CKDateUtilities relativeDateFormatterFromDate:toDate:](CKDateUtilities, "relativeDateFormatterFromDate:toDate:", v3, v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v3;
      v14 = v4;
    }
    +[CKDateUtilities relativeDateOnlyFormatterFromDate:toDate:](CKDateUtilities, "relativeDateOnlyFormatterFromDate:toDate:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringFromDate:", v3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringFromDate:", v3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v17, v6);
    v18 = v6;
    v19 = objc_msgSend(v17, "rangeOfString:", v26);
    v21 = v20;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "transcriptEmphasizedFontAttributes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v19;
    v6 = v18;
    objc_msgSend(v16, "setAttributes:range:", v23, v24, v21);

    v4 = v27;
  }

  return v16;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  v6.receiver = self;
  v6.super_class = (Class)CKDateChatItem;
  -[CKStampLabelChatItem loadSizeThatFits:textAlignmentInsets:](&v6, sel_loadSizeThatFits_textAlignmentInsets_, a4, a3.width, a3.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (NSDate)date
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (id)now
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (unint64_t)layoutType
{
  return 7;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  objc_super v23;

  height = a7.height;
  width = a7.width;
  v13 = a3;
  v14 = a5;
  v15 = a6;
  if (a4 < 1)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v14, "objectAtIndexedSubscript:", a4 - 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v16, "layoutType") == 2
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend(v16, "hasInformativeText"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "largeTranscriptSpace");
    v19 = v18;

    +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:](CKChatItemLayoutUtilities, "transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:", self, v16, v19, 0.0);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)CKDateChatItem;
    -[CKStampChatItem layoutItemSpacingWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:](&v23, sel_layoutItemSpacingWithEnvironment_datasourceItemIndex_allDatasourceItems_supplementryItems_sizeOverride_, v13, a4, v14, v15, width, height);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v20;

  return v21;
}

@end
