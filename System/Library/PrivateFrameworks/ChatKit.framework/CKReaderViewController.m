@implementation CKReaderViewController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKReaderViewController;
  -[CKReaderViewController dealloc](&v4, sel_dealloc);
}

- (CKReaderViewController)init
{
  char *v2;
  CKReaderViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKReaderViewController;
  v2 = -[CKReaderViewController init](&v12, sel_init);
  v3 = (CKReaderViewController *)v2;
  if (v2)
  {
    v2[968] = 0;
    *(_OWORD *)(v2 + 1000) = xmmword_18E7CC200;
    objc_msgSend(v2, "setPreferredContentSize:", 325.0, 425.0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0CEB3F0], 0);

    v5 = (void *)MEMORY[0x1E0CEAB18];
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textViewUsingTextLayoutManager:", objc_msgSend(v6, "isTextKit2Enabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);
    objc_msgSend(v7, "setMarginTop:", 0);
    objc_msgSend(v7, "setEditable:", 0);
    objc_msgSend(v7, "textContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "readerContentInset");
    objc_msgSend(v9, "setLineFragmentPadding:");

    -[CKReaderViewController setTextView:](v3, "setTextView:", v7);
  }
  return v3;
}

- (void)loadView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CKReaderViewController;
  -[CKReaderViewController loadView](&v24, sel_loadView);
  -[CKReaderViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[CKReaderViewController preferredContentSize](self, "preferredContentSize");
  v9 = v8;
  v11 = v10;
  -[CKReaderViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBounds:", v5, v7, v9, v11);

  -[CKReaderViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "readerInsets");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  -[CKReaderViewController textView](self, "textView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBounds:", v5, v7, v9, v11);
  objc_msgSend(v23, "setContentInset:", v16, v18, v20, v22);
  objc_msgSend(v13, "bounds");
  objc_msgSend(v23, "setFrame:");
  objc_msgSend(v23, "setAutoresizingMask:", 18);
  objc_msgSend(v13, "addSubview:", v23);

}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 26;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKReaderViewController;
  -[CKReaderViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CKReaderViewController _restoreScrollPositionIfNeeded](self, "_restoreScrollPositionIfNeeded");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKReaderViewController;
  -[CKReaderViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[CKReaderViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "readerViewControllerWillDismiss:", self);

}

- (void)contentSizeCategoryDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CKReaderViewController_contentSizeCategoryDidChange___block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __55__CKReaderViewController_contentSizeCategoryDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "textView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *MEMORY[0x1E0DC1138];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "readerFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addAttributes:range:", v5, 0, objc_msgSend(v2, "length"));

}

+ (id)readerViewControllerForChatItem:(id)a3
{
  id v3;
  char v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CKReaderViewController *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v3 = a3;
  v4 = objc_msgSend(v3, "isCorrupt");
  if ((v4 & 1) != 0)
    objc_msgSend(v3, "fallbackCorruptText");
  else
    objc_msgSend(v3, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(v5, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithString:", v7);

  if ((v4 & 1) == 0)
  {
    v9 = objc_msgSend(v5, "length");
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __58__CKReaderViewController_readerViewControllerForChatItem___block_invoke;
    v20[3] = &unk_1E2756B48;
    v21 = v5;
    v22 = v3;
    v23 = v8;
    objc_msgSend(v21, "enumerateAttributesInRange:options:usingBlock:", 0, v9, 0, v20);

  }
  objc_msgSend(v3, "message");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "guid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(CKReaderViewController);
  -[CKReaderViewController setMessageGUID:](v12, "setMessageGUID:", v11);
  -[CKReaderViewController setText:](v12, "setText:", v8);
  objc_msgSend((id)objc_opt_class(), "readerScrollPositionCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_msgSend(v14, "rangeValue");
    -[CKReaderViewController setVisibleRange:](v12, "setVisibleRange:", v15, v16);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CKReaderViewController navigationItem](v12, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTitle:", v18);

  }
  return v12;
}

void __58__CKReaderViewController_readerViewControllerForChatItem___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  id v19;

  v19 = a2;
  objc_msgSend(v19, "objectForKey:", *MEMORY[0x1E0D36430]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1[4], "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "substringWithRange:", a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D362F8]))
    {
      +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "message");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mediaObjectWithTransferGUID:imMessage:", v7, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "imageData");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "image");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
        objc_msgSend(v15, "setImage:", v14);
        objc_msgSend(v15, "bounds");
        objc_msgSend(v15, "setBounds:");
        objc_msgSend(a1[6], "addAttribute:value:range:", *MEMORY[0x1E0DC10F8], v15, a3, a4);

      }
    }

  }
  objc_msgSend(v19, "objectForKey:", *MEMORY[0x1E0D365F0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scheme");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("http"));

  if (v18)
    objc_msgSend(a1[6], "addAttribute:value:range:", *MEMORY[0x1E0DC1160], v16, a3, a4);

}

+ (id)readerViewControllerForAudioChatItem:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CKReaderViewController *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (objc_class *)MEMORY[0x1E0CB3778];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "audioTranscriptionText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithString:", v6);

  objc_msgSend(v4, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "guid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(CKReaderViewController);
  -[CKReaderViewController setMessageGUID:](v10, "setMessageGUID:", v9);
  -[CKReaderViewController setText:](v10, "setText:", v7);
  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "readerScrollPositionCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v9);
    v12 = objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = -[NSObject rangeValue](v12, "rangeValue");
      -[CKReaderViewController setVisibleRange:](v10, "setVisibleRange:", v13, v14);
    }
  }
  else
  {
    IMLogHandleForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[CKReaderViewController readerViewControllerForAudioChatItem:].cold.1(v12);
  }

  -[CKReaderViewController navigationItem](v10, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("AUDIO_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTitle:", v17);

  return v10;
}

+ (id)readerScrollPositionCache
{
  if (readerScrollPositionCache_once != -1)
    dispatch_once(&readerScrollPositionCache_once, &__block_literal_global_255);
  return (id)readerScrollPositionCache_sReaderScrollPositionCache;
}

void __51__CKReaderViewController_readerScrollPositionCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFA998]), "initWithMaximumCapacity:", 8);
  v1 = (void *)readerScrollPositionCache_sReaderScrollPositionCache;
  readerScrollPositionCache_sReaderScrollPositionCache = v0;

}

- (void)setText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t, uint64_t *);
  void *v23;
  id v24;
  __CFString *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKReaderViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "mutableCopy");

  v31 = *MEMORY[0x1E0DC1138];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "readerFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAttributes:range:", v9, 0, objc_msgSend(v6, "length"));

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *MEMORY[0x1E0DC1140];
  v30 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAttributes:range:", v11, 0, objc_msgSend(v6, "length"));

  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v13, "setAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v6, "length");
  v20 = MEMORY[0x1E0C809B0];
  v22 = __34__CKReaderViewController_setText___block_invoke;
  v23 = &unk_1E275A378;
  v21 = 3221225472;
  v24 = v6;
  v25 = CFSTR("\n\n");
  v26 = v14;
  v27 = v13;
  v28 = v5;
  v16 = v5;
  v17 = v13;
  v18 = v14;
  v19 = v6;
  CKEnumerateSearchRange(0, v15, 2, (uint64_t)&v20);
  objc_msgSend(v16, "setAttributedText:", v19, v20, v21, v22, v23);

}

void __34__CKReaderViewController_setText___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v48;
  double v49;
  double v50;
  id v51;

  objc_msgSend(*(id *)(a1 + 32), "string");
  v51 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v51, "rangeOfString:options:range:", *MEMORY[0x1E0D362F8], 4, a2, a3);
  *a4 = v8;
  a4[1] = v9;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v8;
    v11 = objc_msgSend(*(id *)(a1 + 40), "length");
    v12 = (v10 - v11) & ~((v10 - v11) >> 63);
    v13 = objc_msgSend(v51, "__ck_rangeOfSequenceOfCharactersFromSet:options:range:", *(_QWORD *)(a1 + 48), 4, v12, *a4 - v12);
    v15 = v14;
    v16 = objc_msgSend(v51, "length");
    v17 = a4[1];
    if (v16 - 1 >= (unint64_t)(v17 + *a4))
      v18 = v17 + *a4;
    else
      v18 = v16 - 1;
    v19 = objc_msgSend(v51, "length") - v18;
    v20 = objc_msgSend(*(id *)(a1 + 40), "length");
    if (v19 >= v20)
      v21 = v20;
    else
      v21 = v19;
    v22 = objc_msgSend(v51, "__ck_rangeOfSequenceOfCharactersFromSet:options:range:", *(_QWORD *)(a1 + 48), 0, v18, v21);
    v24 = v23;
    v26 = *a4;
    v25 = a4[1];
    if (v22 + v23 != objc_msgSend(v51, "length") && v25 + v26 != objc_msgSend(v51, "length"))
    {
      if (v22 == 0x7FFFFFFFFFFFFFFFLL)
        v22 = a4[1] + *a4;
      objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", v22, v24, *(_QWORD *)(a1 + 40));
    }
    if (v13)
      v27 = v26 == 0;
    else
      v27 = 1;
    if (!v27)
    {
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        v13 = *a4;
      objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", v13, v15, *(_QWORD *)(a1 + 40));
      v26 = objc_msgSend(*(id *)(a1 + 40), "length") + v13;
    }
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E0DC1178], *(_QWORD *)(a1 + 56), v26, v25);
    objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], v26, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_msgSend(*(id *)(a1 + 64), "bounds");
      v30 = v29;
      v32 = v31;
      v34 = v33;
      v36 = v35;
      objc_msgSend(v28, "image");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "size");
      v39 = v38;
      v41 = v40;

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "readerContentInset");
      v44 = v43;

      v45 = v34 - (v44 + v44);
      v46 = v36 - (v44 + v44);
      if (v45 < v39 || v46 < v41)
      {
        v48 = v45 / v39;
        if (v39 == 0.0)
          v48 = 0.0;
        v49 = v46 / v41;
        if (v41 == 0.0)
          v49 = 0.0;
        v50 = fmin(v48, v49);
        v39 = v39 * v50;
        v41 = v41 * v50;
      }
      objc_msgSend(v28, "setBounds:", v30, v32, v39, v41);
    }

  }
}

- (NSAttributedString)text
{
  void *v2;
  void *v3;

  -[CKReaderViewController textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (_NSRange)visibleRange
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  double MaxX;
  double MaxY;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSUInteger v26;
  NSUInteger v27;
  _NSRange result;
  CGRect v29;
  CGRect v30;

  -[CKReaderViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isTextKit2Enabled");

  if (v13)
  {
    v29.origin.x = v5;
    v29.origin.y = v7;
    v29.size.width = v9;
    v29.size.height = v11;
    MaxX = CGRectGetMaxX(v29);
    v30.origin.x = v5;
    v30.origin.y = v7;
    v30.size.width = v9;
    v30.size.height = v11;
    MaxY = CGRectGetMaxY(v30);
    objc_msgSend(v3, "closestPositionToPoint:", v5, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "closestPositionToPoint:", MaxX, MaxY);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "beginningOfDocument");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v3, "offsetFromPosition:toPosition:", v18, v16);

    v20 = objc_msgSend(v3, "offsetFromPosition:toPosition:", v16, v17);
  }
  else
  {
    -[CKReaderViewController textView](self, "textView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layoutManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKReaderViewController textView](self, "textView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "textContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v16, "glyphRangeForBoundingRect:inTextContainer:", v17, v5, v7, v9, v11);
    v19 = objc_msgSend(v16, "characterRangeForGlyphRange:actualGlyphRange:", v23, v24, 0);
    v20 = v25;
  }

  v26 = v19;
  v27 = v20;
  result.length = v27;
  result.location = v26;
  return result;
}

- (void)setVisibleRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  int v7;
  id v8;

  length = a3.length;
  location = a3.location;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isTextKit2Enabled");

  if (v7)
  {
    self->_textRangeToRestore.location = location;
    self->_textRangeToRestore.length = length;
  }
  else
  {
    -[CKReaderViewController textView](self, "textView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutIfNeeded");

  }
}

- (void)_restoreScrollPositionIfNeeded
{
  void *v3;
  int v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTextKit2Enabled");

  if (v4
    && -[CKReaderViewController isViewLoaded](self, "isViewLoaded")
    && !-[CKReaderViewController isScrollPositionRestored](self, "isScrollPositionRestored")
    && self->_textRangeToRestore.length != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CKReaderViewController setScrollPositionRestored:](self, "setScrollPositionRestored:", 1);
    -[CKReaderViewController textView](self, "textView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scrollRangeToVisible:", self->_textRangeToRestore.location, self->_textRangeToRestore.length);

  }
}

- (UITextView)textView
{
  id v3;

  v3 = (id)-[CKReaderViewController view](self, "view");
  return self->_textView;
}

- (CKReaderViewControllerDelegate)delegate
{
  return (CKReaderViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (void)setMessageGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (BOOL)isScrollPositionRestored
{
  return self->_scrollPositionRestored;
}

- (void)setScrollPositionRestored:(BOOL)a3
{
  self->_scrollPositionRestored = a3;
}

- (_NSRange)textRangeToRestore
{
  _NSRange *p_textRangeToRestore;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_textRangeToRestore = &self->_textRangeToRestore;
  location = self->_textRangeToRestore.location;
  length = p_textRangeToRestore->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setTextRangeToRestore:(_NSRange)a3
{
  self->_textRangeToRestore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_messageGUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (void)readerViewControllerForAudioChatItem:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "Tried to open a reader view with a nil messageGUID", v1, 2u);
}

@end
