@implementation CKDualSIMUtilities

- (void)_createConversationListSIMLabelImagesDictionary
{
  NSDictionary *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  void *v15;
  NSDictionary *conversationListSIMLabelImagesDictionary;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CGSize v23;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[CKDualSIMUtilities _conversationListSIMLabels](self, "_conversationListSIMLabels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bounds");
        v23.width = v12;
        v23.height = v13;
        UIGraphicsBeginImageContextWithOptions(v23, 0, 0.0);
        objc_msgSend(v11, "layer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "renderInContext:", UIGraphicsGetCurrentContext());

        UIGraphicsGetImageFromCurrentImageContext();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();
        -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", v15, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  conversationListSIMLabelImagesDictionary = self->_conversationListSIMLabelImagesDictionary;
  self->_conversationListSIMLabelImagesDictionary = v3;

}

- (id)_conversationListSIMLabels
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id obj;
  uint64_t v40;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v42 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0D39820], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeSIMIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA5F8], "defaultMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "conversationListSIMLabelBaseRadius");
  objc_msgSend(v4, "scaledValueForValue:");
  v7 = v6;

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v3;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v8)
  {
    v9 = v8;
    v40 = *(_QWORD *)v44;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v44 != v40)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x1E0D39820], "sharedManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "shortNameForSIMLabel:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_alloc(MEMORY[0x1E0CEA700]);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "conversationListSummaryFont");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "capHeight");
        v18 = floor(v17 + 0.5);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "conversationListSummaryFont");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "capHeight");
        v22 = (void *)objc_msgSend(v14, "initWithFrame:", 0.0, 0.0, v18, floor(v21 + 0.5));

        v23 = (void *)MEMORY[0x1E0DC1350];
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "conversationListSummaryFont");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "capHeight");
        v27 = floor(v26);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "conversationListSIMLabelHeightTextSizeRatio");
        objc_msgSend(v23, "boldSystemFontOfSize:", v27 / v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setFont:", v30);

        objc_msgSend(v22, "setText:", v13);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "conversationListSIMLabelTextColor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setTextColor:", v32);

        objc_msgSend(v22, "setTextAlignment:", 1);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "conversationListSIMLabelBackgroundColor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setBackgroundColor:", v34);

        objc_msgSend(v22, "layer");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setMasksToBounds:", 1);

        objc_msgSend(v22, "layer");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setCornerRadius:", v7);

        -[CKDualSIMUtilities _resizeSIMLabel:](self, "_resizeSIMLabel:", v22);
        objc_msgSend(v42, "setValue:forKey:", v22, v11);

        ++v10;
      }
      while (v9 != v10);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v9);
  }

  v37 = (void *)objc_msgSend(v42, "copy");
  return v37;
}

+ (CKDualSIMUtilities)sharedUtilities
{
  if (sharedUtilities_onceToken != -1)
    dispatch_once(&sharedUtilities_onceToken, &__block_literal_global_142);
  return (CKDualSIMUtilities *)(id)sharedUtilities_sharedUtilitiesInstance;
}

void __37__CKDualSIMUtilities_sharedUtilities__block_invoke()
{
  CKDualSIMUtilities *v0;
  void *v1;

  v0 = objc_alloc_init(CKDualSIMUtilities);
  v1 = (void *)sharedUtilities_sharedUtilitiesInstance;
  sharedUtilities_sharedUtilitiesInstance = (uint64_t)v0;

}

- (CKDualSIMUtilities)init
{
  CKDualSIMUtilities *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKDualSIMUtilities;
  v2 = -[CKDualSIMUtilities init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleSIMSubscriptionsUpdate_, *MEMORY[0x1E0D38CE8], 0);

  }
  return v2;
}

- (void)updateConversationListSIMLabelImagesDictionary
{
  id v2;

  -[CKDualSIMUtilities _createConversationListSIMLabelImagesDictionary](self, "_createConversationListSIMLabelImagesDictionary");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__mainThreadPostNotificationName:object:", CFSTR("__kCKSIMLabelImagesChanged"), 0);

}

- (void)_resizeSIMLabel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  id v17;

  v3 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversationListSummaryFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "capHeight");
  v7 = floor(v6 + 0.5);

  objc_msgSend(MEMORY[0x1E0CEA5F8], "defaultMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "conversationListSIMLabelBaseBuffer");
  objc_msgSend(v8, "scaledValueForValue:");
  v11 = v10;

  objc_msgSend(v3, "intrinsicContentSize");
  v13 = floor(v11 + v12 + 0.5);
  if (v13 >= v7)
    v14 = v13;
  else
    v14 = v7;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "conversationListSummaryFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "capHeight");
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, v14, floor(v16 + 0.5));

}

- (id)_conversationListSIMLabelImageForSIMID:(id)a3
{
  return -[NSDictionary objectForKey:](self->_conversationListSIMLabelImagesDictionary, "objectForKey:", a3);
}

+ (id)makeSummaryAttributedStringWithSIMImageUsingAttributedString:(id)a3 forConversation:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  +[CKDualSIMUtilities _textAttachmentForLastUsedSIMForConversation:](CKDualSIMUtilities, "_textAttachmentForLastUsedSIMForConversation:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v5);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertAttributedString:atIndex:", v8, 0);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
    objc_msgSend(v7, "insertAttributedString:atIndex:", v9, 1);

    v10 = (id)objc_msgSend(v7, "copy");
  }
  else
  {
    v10 = v5;
  }

  return v10;
}

+ (id)_textAttachmentForLastUsedSIMForConversation:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  objc_msgSend(a1, "_imageForLastUsedSIMForConversation:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "conversationListSummaryFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "capHeight");
    v8 = v7;
    objc_msgSend(v3, "size");
    v10 = (v8 - v9) * 0.5;
    objc_msgSend(v3, "size");
    v12 = v11;
    objc_msgSend(v3, "size");
    objc_msgSend(v4, "setBounds:", 0.0, v10, v12, v13);

    objc_msgSend(v4, "setImage:", v3);
    objc_msgSend(v4, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_imageForLastUsedSIMForConversation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastAddressedSIMID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[CKDualSIMUtilities sharedUtilities](CKDualSIMUtilities, "sharedUtilities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_conversationListSIMLabelImageForSIMID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSDictionary)conversationListSIMLabelImagesDictionary
{
  return self->_conversationListSIMLabelImagesDictionary;
}

- (void)setConversationListSIMLabelImagesDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_conversationListSIMLabelImagesDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationListSIMLabelImagesDictionary, 0);
}

@end
