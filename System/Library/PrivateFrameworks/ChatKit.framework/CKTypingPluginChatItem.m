@implementation CKTypingPluginChatItem

- (CKTypingPluginChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  id v6;
  CKTypingPluginChatItem *v7;
  void *v8;
  uint64_t v9;
  NSString *plugInBundleID;
  uint64_t v11;
  NSData *typingIndicatorData;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKTypingPluginChatItem;
  v7 = -[CKChatItem initWithIMChatItem:maxWidth:](&v14, sel_initWithIMChatItem_maxWidth_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    plugInBundleID = v7->_plugInBundleID;
    v7->_plugInBundleID = (NSString *)v9;

    objc_msgSend(v6, "typingIndicatorIcon");
    v11 = objc_claimAutoreleasedReturnValue();
    typingIndicatorData = v7->_typingIndicatorData;
    v7->_typingIndicatorData = (NSData *)v11;

  }
  return v7;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  if (a4)
  {
    a3 = (CGSize)*MEMORY[0x1E0CEB4B0];
    *(CGSize *)&a3.height = *(CGSize *)(MEMORY[0x1E0CEB4B0] + 16);
    *(_OWORD *)&a4->top = *MEMORY[0x1E0CEB4B0];
    *(CGSize *)&a4->bottom = *(CGSize *)&a3.height;
  }
  +[CKTypingIndicatorLayer largeBubbleFrame](CKTypingIndicatorLayer, "largeBubbleFrame", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  v8 = fmax(*MEMORY[0x1E0C9D820], v4);
  v9 = fmax(*(double *)(MEMORY[0x1E0C9D820] + 8), v6);
  +[CKTypingIndicatorLayer defaultSize](CKTypingIndicatorLayer, "defaultSize");
  v12 = v8 + v10 - v5;
  v13 = v9 + v11 - v7;
  result.height = v13;
  result.width = v12;
  return result;
}

- (id)indicatorLayer
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  CKTypingIndicatorLayer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  CKTypingIndicatorLayer *v21;
  id v22;
  id location;

  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTypingPluginChatItem plugInBundleID](self, "plugInBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "balloonPluginForBundleID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (objc_class *)objc_msgSend(v5, "customTypingIndicatorLayerClass");
  if (v6)
  {
    v7 = (CKTypingIndicatorLayer *)objc_alloc_init(v6);
  }
  else
  {
    v7 = objc_alloc_init(CKTypingIndicatorLayer);
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "type");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "balloonPluginForBundleID:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D37588]);

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0CEA638];
      -[CKTypingPluginChatItem typingIndicatorData](self, "typingIndicatorData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "imageWithData:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_retainAutorelease(v16);
      -[CKTypingIndicatorLayer setIconImage:](v7, "setIconImage:", objc_msgSend(v17, "CGImage"));

    }
    else
    {
      location = 0;
      objc_initWeak(&location, self);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __40__CKTypingPluginChatItem_indicatorLayer__block_invoke;
      v19[3] = &unk_1E274BBA8;
      objc_copyWeak(&v22, &location);
      v20 = v9;
      v21 = v7;
      objc_msgSend(v11, "__ck_generateStatusImage:", v19);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }

  }
  return v7;
}

void __40__CKTypingPluginChatItem_indicatorLayer__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v13 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "IMChatItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if ((v7 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "setIconImage:", objc_msgSend(objc_retainAutorelease(v13), "CGImage"));
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(v4, "typingIndicatorData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageWithData:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = *(void **)(a1 + 40);
      v12 = objc_retainAutorelease(v10);
      objc_msgSend(v11, "setIconImage:", objc_msgSend(v12, "CGImage"));

    }
  }

}

- (NSString)plugInBundleID
{
  return self->_plugInBundleID;
}

- (void)setPlugInBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSData)typingIndicatorData
{
  return self->_typingIndicatorData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typingIndicatorData, 0);
  objc_storeStrong((id *)&self->_plugInBundleID, 0);
}

@end
