@implementation CKScheduledSectionDateChatItem

- (Class)cellClass
{
  return (Class)objc_opt_class();
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
  uint64_t v18;
  void *v19;
  objc_super v21;

  height = a7.height;
  width = a7.width;
  v13 = a3;
  v14 = a5;
  v15 = a6;
  if (a4 < 1)
  {
    v17 = 0;
LABEL_6:
    v21.receiver = self;
    v21.super_class = (Class)CKScheduledSectionDateChatItem;
    -[CKDateChatItem layoutItemSpacingWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:](&v21, sel_layoutItemSpacingWithEnvironment_datasourceItemIndex_allDatasourceItems_supplementryItems_sizeOverride_, v13, a4, v14, v15, width, height);
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v14, "objectAtIndex:", a4 - 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16 || objc_msgSend(v16, "layoutType") != 26)
    goto LABEL_6;
  +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:](CKChatItemLayoutUtilities, "transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:", self, v17, 0.0, 0.0);
  v18 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v19 = (void *)v18;

  return v19;
}

@end
