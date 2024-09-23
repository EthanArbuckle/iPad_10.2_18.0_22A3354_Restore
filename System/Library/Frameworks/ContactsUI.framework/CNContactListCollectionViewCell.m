@implementation CNContactListCollectionViewCell

- (void)setIsMeCard:(BOOL)a3
{
  if (self->_isMeCard != a3)
  {
    self->_isMeCard = a3;
    -[CNContactListCollectionViewCell applyAccessories](self, "applyAccessories");
  }
}

- (void)setIsEmergencyContact:(BOOL)a3
{
  if (self->_isEmergencyContact != a3)
  {
    self->_isEmergencyContact = a3;
    -[CNContactListCollectionViewCell applyAccessories](self, "applyAccessories");
  }
}

- (void)setContactMatchInfo:(id)a3 completionBlock:(id)a4
{
  CNContactMatchInfo *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v7 = (CNContactMatchInfo *)a3;
  v8 = a4;
  if (self->_contactMatchInfo != v7)
  {
    objc_storeStrong((id *)&self->_contactMatchInfo, a3);
    objc_initWeak(&location, self);
    v9 = (void *)MEMORY[0x1E0D13AF0];
    v18[1] = 3221225472;
    v18[2] = __71__CNContactListCollectionViewCell_setContactMatchInfo_completionBlock___block_invoke;
    v18[3] = &unk_1E2049B58;
    v18[0] = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v20, &location);
    v19 = v8;
    objc_msgSend(v9, "observerWithResultBlock:", v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0D13AE8];
    -[CNContactMatchInfo excerpt](v7, "excerpt");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "future");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "observableWithFuture:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "observeOn:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "subscribe:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListCollectionViewCell setSummaryCancelationToken:](self, "setSummaryCancelationToken:", v17);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

}

- (void)setContactListStyleApplier:(id)a3
{
  objc_storeStrong((id *)&self->_contactListStyleApplier, a3);
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
}

- (void)setContact:(id)a3
{
  CNContact *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CNContact *v10;

  v5 = (CNContact *)a3;
  if (self->_contact != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_contact, a3);
    -[CNContactListCollectionViewCell contactListStyleApplier](self, "contactListStyleApplier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[CNContactListCollectionViewCell contactListStyleApplier](self, "contactListStyleApplier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactListCollectionViewCell contactFormatter](self, "contactFormatter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "applyContactListStyleToContact:usingFormatter:ofCell:", v10, v8, self);

      -[UIView annotateWithContact:](self, "annotateWithContact:", v10);
    }
    else
    {
      -[CNContactListCollectionViewCell contactFormatter](self, "contactFormatter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNContactListStyleApplier applyDefaultStyleToContact:usingFormatter:ofCell:](CNContactListStyleApplier, "applyDefaultStyleToContact:usingFormatter:ofCell:", v10, v9, self);

    }
    v5 = v10;
  }

}

- (CNContactListStyleApplier)contactListStyleApplier
{
  return self->_contactListStyleApplier;
}

- (void)setAllowsMultiSelection:(BOOL)a3
{
  self->_allowsMultiSelection = a3;
}

- (void)setAllowsMultiSelectContextMenus:(BOOL)a3
{
  self->_allowsMultiSelectContextMenus = a3;
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)applyAccessories
{
  int v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (-[CNContactListCollectionViewCell allowsMultiSelection](self, "allowsMultiSelection"))
    v3 = !-[CNContactListCollectionViewCell allowsMultiSelectContextMenus](self, "allowsMultiSelectContextMenus");
  else
    v3 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DC3580]);
    objc_msgSend(v4, "addObject:", v5);

  }
  if (-[CNContactListCollectionViewCell isMeCard](self, "isMeCard"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    v7 = objc_alloc(MEMORY[0x1E0CB3498]);
    CNContactsUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ME_CELL_INDICATOR"), &stru_1E20507A8, CFSTR("Localized"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithString:", v9);
    objc_msgSend(v6, "setAttributedText:", v10);

    objc_msgSend(v6, "sizeToFit");
    -[CNContactListCollectionViewCell contactListStyleApplier](self, "contactListStyleApplier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "applyContactListStyleToMeContactLabel:ofCell:", v6, self);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v6, 1);
    v21[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v13);

  }
  if (-[CNContactListCollectionViewCell isEmergencyContact](self, "isEmergencyContact"))
  {
    v14 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    -[CNContactListCollectionViewCell contactListStyleApplier](self, "contactListStyleApplier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[CNContactListCollectionViewCell contactListStyleApplier](self, "contactListStyleApplier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "applyContactListStyleToEmergencyIcon:ofCell:", v14, self);
    }
    else
    {
      v17 = (void *)MEMORY[0x1E0DC3870];
      +[CNUIColorRepository contactListEmergencyContactGlyphColor](CNUIColorRepository, "contactListEmergencyContactGlyphColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "cnui_symbolImageNamed:scale:withColor:useFixedSize:", CFSTR("staroflife.fill"), 3, v18, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v16);
      v14 = (id)v19;
    }

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v14, 1);
    objc_msgSend(v4, "addObject:", v20);

  }
  -[CNContactListCollectionViewCell setAccessories:](self, "setAccessories:", v4);

}

- (BOOL)isMeCard
{
  return self->_isMeCard;
}

- (BOOL)isEmergencyContact
{
  return self->_isEmergencyContact;
}

- (BOOL)allowsMultiSelection
{
  return self->_allowsMultiSelection;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactListCollectionViewCell;
  -[CNContactListCollectionViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[CNContactListCollectionViewCell setHasBeenDisplayed:](self, "setHasBeenDisplayed:", 1);
}

- (void)setHasBeenDisplayed:(BOOL)a3
{
  self->_hasBeenDisplayed = a3;
}

- (CNContactListCollectionViewCell)initWithFrame:(CGRect)a3
{
  CNContactListCollectionViewCell *v3;
  CNContactListCollectionViewCell *v4;
  CNContactListCollectionViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNContactListCollectionViewCell;
  v3 = -[CNContactListCollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (CNCancelable)summaryCancelationToken
{
  return self->_summaryCancelationToken;
}

- (void)setSummaryCancelationToken:(id)a3
{
  objc_storeStrong((id *)&self->_summaryCancelationToken, a3);
}

- (void)cancelAsyncOperations
{
  void *v3;

  -[CNContactListCollectionViewCell summaryCancelationToken](self, "summaryCancelationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[CNContactListCollectionViewCell setSummaryCancelationToken:](self, "setSummaryCancelationToken:", 0);
}

- (void)setContactMatchInfo:(id)a3
{
  -[CNContactListCollectionViewCell setContactMatchInfo:completionBlock:](self, "setContactMatchInfo:completionBlock:", a3, 0);
}

- (void)setSubtitleAttributedText:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  objc_opt_class();
  -[CNContactListCollectionViewCell contentConfiguration](self, "contentConfiguration");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v7;
  else
    v5 = 0;
  v6 = v5;

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "setSecondaryText:", &stru_1E20507A8);
  objc_msgSend(v7, "setSecondaryAttributedText:", v4);

  -[CNContactListCollectionViewCell setContentConfiguration:](self, "setContentConfiguration:", v7);
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  -[CNContactListCollectionViewCell summaryCancelationToken](self, "summaryCancelationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[CNContactListCollectionViewCell setSummaryCancelationToken:](self, "setSummaryCancelationToken:", 0);
  -[CNContactListCollectionViewCell setContactMatchInfo:](self, "setContactMatchInfo:", 0);
  -[CNContactListCollectionViewCell setSubtitleAttributedText:](self, "setSubtitleAttributedText:", 0);
  -[CNContactListCollectionViewCell setIsEmergencyContact:](self, "setIsEmergencyContact:", 0);
  -[CNContactListCollectionViewCell setIsMeCard:](self, "setIsMeCard:", 0);
  -[CNContactListCollectionViewCell setContactListStyleApplier:](self, "setContactListStyleApplier:", 0);
  -[CNContactListCollectionViewCell setAccessories:](self, "setAccessories:", MEMORY[0x1E0C9AA60]);
  -[CNContactListCollectionViewCell setHasBeenDisplayed:](self, "setHasBeenDisplayed:", 0);
  -[UIView annotateWithContact:](self, "annotateWithContact:", 0);
  v4.receiver = self;
  v4.super_class = (Class)CNContactListCollectionViewCell;
  -[CNContactListCollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
}

- (void)dealloc
{
  objc_super v3;

  -[CNCancelable cancel](self->_summaryCancelationToken, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)CNContactListCollectionViewCell;
  -[CNContactListCollectionViewCell dealloc](&v3, sel_dealloc);
}

- (CNContact)contact
{
  return self->_contact;
}

- (CNContactMatchInfo)contactMatchInfo
{
  return self->_contactMatchInfo;
}

- (BOOL)allowsMultiSelectContextMenus
{
  return self->_allowsMultiSelectContextMenus;
}

- (BOOL)hasBeenDisplayed
{
  return self->_hasBeenDisplayed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryCancelationToken, 0);
  objc_storeStrong((id *)&self->_contactListStyleApplier, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_contactMatchInfo, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

void __71__CNContactListCollectionViewCell_setContactMatchInfo_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "summaryCancelationToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_10;
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(WeakRetained, "contactListStyleApplier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = WeakRetained;
    if (v5)
    {
      objc_msgSend(WeakRetained, "contactListStyleApplier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "applyContactListStyleToSubtitleText:ofSearchResultCell:", v11, WeakRetained);

      goto LABEL_8;
    }
    v8 = v11;
  }
  else
  {
    v6 = WeakRetained;
    v8 = 0;
  }
  objc_msgSend(v6, "setSubtitleAttributedText:", v8);
LABEL_8:
  v9 = objc_msgSend(WeakRetained, "hasBeenDisplayed");
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v9);
LABEL_10:

}

@end
