@implementation CNContactListCountFooterView

- (CNContactListCountFooterView)initWithFrame:(CGRect)a3
{
  CNContactListCountFooterView *v3;
  void *v4;
  CNContactListCountFooterView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNContactListCountFooterView;
  v3 = -[CNContactListCountFooterView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v3, sel_didSelectViewAllDuplicates);
    -[CNContactListCountFooterView addGestureRecognizer:](v3, "addGestureRecognizer:", v4);
    v3->_contactCount = 0;
    v3->_duplicateCount = 0;
    v3->_selectedCount = -1;
    v5 = v3;

  }
  return v3;
}

- (id)countViewConfiguration
{
  void *v3;
  void *v4;
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
  void *v15;

  objc_msgSend(MEMORY[0x1E0DC39A8], "plainFooterConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListCountFooterView primaryText](self, "primaryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v4);

  +[CNUIFontRepository contactListContactCountFont](CNUIFontRepository, "contactListContactCountFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  +[CNUIColorRepository contactListContactCountTextColor](CNUIColorRepository, "contactListContactCountTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColor:", v7);

  objc_msgSend(v3, "textProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlignment:", 1);

  -[CNContactListCountFooterView secondaryText](self, "secondaryText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSecondaryText:", v10);

  +[CNUIFontRepository contactListDuplicateCountFont](CNUIFontRepository, "contactListDuplicateCountFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secondaryTextProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v11);

  +[CNUIColorRepository contactListDuplicateCountTextColor](CNUIColorRepository, "contactListDuplicateCountTextColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secondaryTextProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setColor:", v13);

  objc_msgSend(v3, "secondaryTextProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAlignment:", 1);

  objc_msgSend(v3, "directionalLayoutMargins");
  objc_msgSend(v3, "setDirectionalLayoutMargins:", 15.0);
  return v3;
}

- (id)primaryText
{
  int64_t v3;
  const __CFString *v4;
  __CFString *v5;

  if (-[CNContactListCountFooterView shouldDisplayContactCount](self, "shouldDisplayContactCount"))
  {
    v3 = -[CNContactListCountFooterView contactCount](self, "contactCount");
    v4 = CFSTR("CONTACTS_COUNT");
  }
  else
  {
    if (!-[CNContactListCountFooterView shouldDisplaySelectedCount](self, "shouldDisplaySelectedCount"))
    {
      v5 = &stru_1E20507A8;
      return v5;
    }
    v3 = -[CNContactListCountFooterView selectedCount](self, "selectedCount");
    v4 = CFSTR("SELECTED_CONTACTS_COUNT");
  }
  -[CNContactListCountFooterView countStringForLocalizedStringKey:count:](self, "countStringForLocalizedStringKey:count:", v4, v3);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (id)secondaryText
{
  void *v3;

  if (-[CNContactListCountFooterView shouldDisplayDuplicateCount](self, "shouldDisplayDuplicateCount"))
  {
    -[CNContactListCountFooterView countStringForLocalizedStringKey:count:](self, "countStringForLocalizedStringKey:count:", CFSTR("DUPLICATES_COUNT"), -[CNContactListCountFooterView duplicateCount](self, "duplicateCount"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)countStringForLocalizedStringKey:(id)a3 count:(int64_t)a4
{
  id v5;
  id v6;
  void (**v7)(void);
  void *v8;
  void *v9;
  void *v10;
  _QWORD aBlock[4];
  id v13;
  int64_t v14;

  v5 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__CNContactListCountFooterView_countStringForLocalizedStringKey_count___block_invoke;
  aBlock[3] = &unk_1E204E128;
  v13 = v5;
  v14 = a4;
  v6 = v5;
  v7 = (void (**)(void))_Block_copy(aBlock);
  v8 = (void *)MEMORY[0x1E0CB3940];
  v7[2]();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringWithFormat:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)shouldDisplayContactCount
{
  return !-[CNContactListCountFooterView shouldHideCountFooter](self, "shouldHideCountFooter")
      && -[CNContactListCountFooterView contactCount](self, "contactCount") > 19;
}

- (BOOL)shouldDisplaySelectedCount
{
  return !-[CNContactListCountFooterView shouldHideCountFooter](self, "shouldHideCountFooter")
      && -[CNContactListCountFooterView selectedCount](self, "selectedCount") >= 0;
}

- (BOOL)shouldDisplayDuplicateCount
{
  return -[CNContactListCountFooterView duplicateCount](self, "duplicateCount") > 0;
}

- (void)setContactCount:(int64_t)a3
{
  id v4;

  if (self->_contactCount != a3)
  {
    self->_contactCount = a3;
    -[CNContactListCountFooterView countViewConfiguration](self, "countViewConfiguration");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactListCountFooterView setContentConfiguration:](self, "setContentConfiguration:", v4);

  }
}

- (void)setDuplicateCount:(int64_t)a3
{
  id v4;

  if (self->_duplicateCount != a3)
  {
    self->_duplicateCount = a3;
    -[CNContactListCountFooterView countViewConfiguration](self, "countViewConfiguration");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactListCountFooterView setContentConfiguration:](self, "setContentConfiguration:", v4);

  }
}

- (void)setSelectedCount:(int64_t)a3
{
  id v4;

  if (self->_selectedCount != a3)
  {
    self->_selectedCount = a3;
    -[CNContactListCountFooterView countViewConfiguration](self, "countViewConfiguration");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactListCountFooterView setContentConfiguration:](self, "setContentConfiguration:", v4);

  }
}

- (void)didSelectViewAllDuplicates
{
  CNContactListCountViewDelegate **p_delegate;
  id WeakRetained;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    if (-[CNContactListCountFooterView shouldDisplayDuplicateCount](self, "shouldDisplayDuplicateCount"))
    {
      v5 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v5, "didSelectViewAllDuplicates");

    }
  }
}

- (int64_t)contactCount
{
  return self->_contactCount;
}

- (int64_t)duplicateCount
{
  return self->_duplicateCount;
}

- (int64_t)selectedCount
{
  return self->_selectedCount;
}

- (CNContactListCountViewDelegate)delegate
{
  return (CNContactListCountViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldHideCountFooter
{
  return self->_shouldHideCountFooter;
}

- (void)setShouldHideCountFooter:(BOOL)a3
{
  self->_shouldHideCountFooter = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

id __71__CNContactListCountFooterView_countStringForLocalizedStringKey_count___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[CNNumberFormatting localizedStringWithInteger:](CNNumberFormatting, "localizedStringWithInteger:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  CNContactsUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", *(_QWORD *)(a1 + 32), &stru_1E20507A8, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v5, *(_QWORD *)(a1 + 40), v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
