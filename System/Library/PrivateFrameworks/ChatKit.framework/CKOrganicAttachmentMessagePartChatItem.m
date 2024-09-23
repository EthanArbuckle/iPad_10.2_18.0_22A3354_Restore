@implementation CKOrganicAttachmentMessagePartChatItem

- (unint64_t)layoutType
{
  if (-[CKChatItem itemIsReply](self, "itemIsReply"))
    return 12;
  else
    return 18;
}

- (CKOrganicAttachmentMessagePartChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  CKOrganicAttachmentMessagePartChatItem *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)CKOrganicAttachmentMessagePartChatItem;
  v4 = -[CKAttachmentMessagePartChatItem initWithIMChatItem:maxWidth:](&v18, sel_initWithIMChatItem_maxWidth_, a3, a4);
  -[CKMessagePartChatItem visibleAssociatedMessageChatItems](v4, "visibleAssociatedMessageChatItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[CKMessagePartChatItem visibleAssociatedMessageChatItems](v4, "visibleAssociatedMessageChatItems", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v12, "setParentIsOrganicLayout:", 1);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v9);
    }

  }
  return v4;
}

- (Class)customLayoutGroupProviderClass
{
  return (Class)objc_opt_class();
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (BOOL)supportsInlineReplyTransition
{
  return 0;
}

- (Class)balloonViewClass
{
  void *v3;
  void *v4;
  char isKindOfClass;

  v3 = (void *)objc_opt_class();
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v3 = (void *)objc_opt_class();
  return (Class)v3;
}

- (unint64_t)balloonCorners
{
  return 0;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)CKOrganicAttachmentMessagePartChatItem;
  -[CKAttachmentMessagePartChatItem loadSizeThatFits:textAlignmentInsets:](&v14, sel_loadSizeThatFits_textAlignmentInsets_, a4);
  v8 = width * dbl_18E7CB610[v6 < v7];
  if (height < v8)
  {
    v9 = width / width;
    v10 = 0.0;
    if (width == 0.0)
      v9 = 0.0;
    if (v8 != 0.0)
      v10 = height / v8;
    v11 = fmin(v9, v10);
    width = width * v11;
    v8 = v8 * v11;
  }
  v12 = ceil(width);
  v13 = ceil(v8);
  result.height = v13;
  result.width = v12;
  return result;
}

- (CKOrganicImageLayoutRecipe)layoutRecipe
{
  return self->_layoutRecipe;
}

- (void)setLayoutRecipe:(id)a3
{
  objc_storeStrong((id *)&self->_layoutRecipe, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutRecipe, 0);
}

@end
