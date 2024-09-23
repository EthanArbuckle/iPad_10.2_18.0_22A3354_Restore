@implementation CKTranscriptSharingSuggestion

+ (id)bannerWithState:(int64_t)a3
{
  return -[CKTranscriptSharingSuggestion initWithState:]([CKTranscriptSharingSuggestion alloc], "initWithState:", a3);
}

- (CKTranscriptSharingSuggestion)initWithState:(int64_t)a3
{
  CKTranscriptSharingSuggestion *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKTranscriptSharingSuggestion;
  result = -[CKTranscriptSharingSuggestion init](&v5, sel_init);
  if (result)
    result->_state = a3;
  return result;
}

- (id)suggestionPrimaryAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD aBlock[5];

  if (self->_state == 1)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__CKTranscriptSharingSuggestion_suggestionPrimaryAction__block_invoke;
    aBlock[3] = &unk_1E2757768;
    aBlock[4] = self;
    v2 = _Block_copy(aBlock);
    v3 = (void *)MEMORY[0x1E0D19F18];
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TS_STOP_SHARING_ACTION_BANNER"), &stru_1E276D870, CFSTR("TranscriptSharing-SYDROB_FEATURES"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "actionWithTitle:handler:", v5, v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
    v2 = 0;
  }

  return v6;
}

void __56__CKTranscriptSharingSuggestion_suggestionPrimaryAction__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transcriptStopSharingButtonTapped:", *(_QWORD *)(a1 + 32));

  }
}

- (id)suggestionDismissAction
{
  void *v3;
  char v4;
  void *v5;
  _QWORD v7[5];

  if (self->_state == 3
    && (-[CKTranscriptSharingSuggestion delegate](self, "delegate"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_opt_respondsToSelector(),
        v3,
        (v4 & 1) != 0))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__CKTranscriptSharingSuggestion_suggestionDismissAction__block_invoke;
    v7[3] = &unk_1E2757768;
    v7[4] = self;
    objc_msgSend(MEMORY[0x1E0D19F18], "actionWithTitle:handler:", &stru_1E276D870, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

void __56__CKTranscriptSharingSuggestion_suggestionDismissAction__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transcriptSharingBannerWillDismiss:", *(_QWORD *)(a1 + 32));

}

- (id)suggestionSubtitle
{
  return 0;
}

- (id)suggestionImageSGView
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("person.crop.circle.fill"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v2);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGray2Color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintColor:", v4);

  return v3;
}

- (id)suggestionTitle
{
  int64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;

  v2 = -[CKTranscriptSharingSuggestion state](self, "state");
  if ((unint64_t)(v2 - 1) >= 2)
  {
    if (v2 != 3)
    {
      v6 = &stru_1E276D870;
      return v6;
    }
    CKFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("TS_NO_LONGER_SHARING");
  }
  else
  {
    CKFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("TS_CURRENTLY_SHARING");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E276D870, CFSTR("TranscriptSharing-SYDROB_FEATURES"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)suggestionCategoryId
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)suggestionCategoryImage
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", &stru_1E276D870);
}

- (id)suggestionCategoryLocalizedCountOfItems:(id)a3
{
  return &stru_1E276D870;
}

- (id)suggestionCategorySubtitleForItems:(id)a3
{
  return 0;
}

- (id)suggestionCategoryTitle
{
  return &stru_1E276D870;
}

- (id)suggestionCategoryTitleForItems:(id)a3
{
  return &stru_1E276D870;
}

- (int64_t)suggestionActionButtonType
{
  return 0;
}

- (BOOL)suggestionProminentActionButton
{
  return 1;
}

- (SGSuggestionDelegate)suggestionDelegate
{
  return (SGSuggestionDelegate *)objc_loadWeakRetained((id *)&self->suggestionDelegate);
}

- (void)setSuggestionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->suggestionDelegate, a3);
}

- (CKTranscriptSharingSuggestionDelegate)delegate
{
  return (CKTranscriptSharingSuggestionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->suggestionDelegate);
}

@end
