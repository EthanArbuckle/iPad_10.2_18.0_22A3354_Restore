@implementation CNLimitedAccessContactListCollectionViewCell

- (CNLimitedAccessContactListCollectionViewCell)initWithFrame:(CGRect)a3
{
  CNLimitedAccessContactListCollectionViewCell *v3;
  CNLimitedAccessContactListCollectionViewCell *v4;
  CNLimitedAccessContactListCollectionViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNLimitedAccessContactListCollectionViewCell;
  v3 = -[CNLimitedAccessContactListCollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CNLimitedAccessContactListCollectionViewCell;
  -[CNLimitedAccessContactListCollectionViewCell layoutSubviews](&v2, sel_layoutSubviews);
}

- (void)setContact:(id)a3
{
  CNContact *v5;

  v5 = (CNContact *)a3;
  if (self->_contact != v5)
  {
    objc_storeStrong((id *)&self->_contact, a3);
    -[CNLimitedAccessContactListCollectionViewCell applyContactListStyleWithAvatarImage](self, "applyContactListStyleWithAvatarImage");
    -[UIView annotateWithContact:](self, "annotateWithContact:", v5);
  }

}

- (void)setIsShowingSearchResult:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  self->_isShowingSearchResult = a3;
  if (a3)
  {
    -[CNLimitedAccessContactListCollectionViewCell separatorLayoutGuide](self, "separatorLayoutGuide");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLimitedAccessContactListCollectionViewCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutMarginsGuide");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActive:", 1);

  }
}

- (void)setAvatarImage:(id)a3
{
  objc_storeStrong((id *)&self->_avatarImage, a3);
  -[CNLimitedAccessContactListCollectionViewCell applyContactListStyleWithAvatarImage](self, "applyContactListStyleWithAvatarImage");
}

- (void)applyContactListStyleWithAvatarImage
{
  uint64_t v3;
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
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  CNContact *contact;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t caption;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0DC1138];
  v42[0] = *MEMORY[0x1E0DC1138];
  +[CNUIFontRepository contactStyleDefaultTextFont](CNUIFontRepository, "contactStyleDefaultTextFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v4;
  v42[1] = *MEMORY[0x1E0C96788];
  +[CNUIFontRepository contactStyleDefaultBoldTextFont](CNUIFontRepository, "contactStyleDefaultBoldTextFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactFormatter attributedStringForObjectValue:withDefaultAttributes:](self->_contactFormatter, "attributedStringForObjectValue:withDefaultAttributes:", self->_contact, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v6;
  if (!objc_msgSend(v7, "length"))
  {
    v8 = (void *)objc_msgSend(v6, "mutableCopy", v6);
    +[CNUIFontRepository contactStyleDefaultTextFont](CNUIFontRepository, "contactStyleDefaultTextFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fontDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fontDescriptorWithSymbolicTraits:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0DC1350];
    +[CNUIFontRepository contactStyleDefaultTextFont](CNUIFontRepository, "contactStyleDefaultTextFont");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pointSize");
    objc_msgSend(v12, "fontWithDescriptor:size:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v3);

    v15 = objc_alloc(MEMORY[0x1E0CB3498]);
    CNContactsUIBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("NO_NAME"), &stru_1E20507A8, CFSTR("Localized"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "initWithString:attributes:", v17, v8);

    v7 = (void *)v18;
  }
  objc_opt_class();
  -[CNLimitedAccessContactListCollectionViewCell contentConfiguration](self, "contentConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  v21 = v20;

  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "setAttributedText:", v7, v38);
  -[CNContact phoneNumbers](self->_contact, "phoneNumbers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  contact = self->_contact;
  if (v23)
  {
    -[CNContact phoneNumbers](contact, "phoneNumbers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "value");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "formattedStringValue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0;
LABEL_12:

    goto LABEL_13;
  }
  -[CNContact emailAddresses](contact, "emailAddresses");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v30, "count");

  if (v29)
  {
    -[CNContact emailAddresses](self->_contact, "emailAddresses");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "value");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    goto LABEL_12;
  }
  v28 = 0;
LABEL_13:
  v40[0] = v3;
  +[CNUIFontRepository navigationListDetailCellSubtitleFontRegular](CNUIFontRepository, "navigationListDetailCellSubtitleFontRegular");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v31;
  v40[1] = *MEMORY[0x1E0DC1140];
  +[CNUIColorRepository navigationListDetailCellSubtitleTextColorRegular](CNUIColorRepository, "navigationListDetailCellSubtitleTextColorRegular");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  caption = self->_caption;
  if (caption == 1)
  {
    v35 = v29;
    if (!(*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
      goto LABEL_19;
LABEL_18:
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v35, v33);
    objc_msgSend(v19, "setSecondaryAttributedText:", v36);

    goto LABEL_19;
  }
  if (caption == 2)
  {
    v35 = v28;
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13850] + 16))() & 1) != 0)
      goto LABEL_18;
  }
LABEL_19:
  -[CNLimitedAccessContactListCollectionViewCell avatarImage](self, "avatarImage");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setImage:", v37);

  -[CNLimitedAccessContactListCollectionViewCell setContentConfiguration:](self, "setContentConfiguration:", v19);
}

- (CNContact)contact
{
  return self->_contact;
}

- (UIImage)avatarImage
{
  return self->_avatarImage;
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
}

- (unint64_t)caption
{
  return self->_caption;
}

- (void)setCaption:(unint64_t)a3
{
  self->_caption = a3;
}

- (BOOL)isShowingSearchResult
{
  return self->_isShowingSearchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_avatarImage, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
