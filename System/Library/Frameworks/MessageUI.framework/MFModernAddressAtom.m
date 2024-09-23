@implementation MFModernAddressAtom

+ (id)copyDisplayStringForAddress:(id)a3 usingAddressBook:(void *)a4 useAbbreviatedName:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v5 = a5;
  v7 = a3;
  objc_msgSend(v7, "emailAddressValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "em_displayableString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "simpleAddress");
    if (v5)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      MFPreferredAbbreviatedNameForAddressAndDisplayName(a4, v11, v10, 0);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      MFPreferredCompositeNameForAddressAndDisplayName(a4, v11, v10, 0);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "containsString:", &stru_1E5A71A68))
    {
      objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", &stru_1E5A71A68, &stru_1E5A6A588);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = v10;
      v10 = v12;
    }
    v13 = v12;
  }

  return v13;
}

- (MFModernAddressAtom)initWithAddress:(id)a3 presentationOptions:(unint64_t)a4 isPhoneNumber:(BOOL)a5 maxWidth:(double)a6 addressBook:(void *)a7
{
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  MFModernAddressAtom *v19;
  MFModernAddressAtom *v20;
  MFModernAddressAtom *v21;
  void *v22;
  id v23;
  uint64_t v24;
  CNAtomView *atomView;
  void *v26;
  void *v28;
  objc_super v29;

  v14 = a3;
  objc_msgSend(MEMORY[0x1E0D13618], "defaultHeight");
  v16 = v15;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFModernAddressAtom.m"), 112, CFSTR("Current thread must be main"));

  }
  v17 = *MEMORY[0x1E0C9D538];
  v18 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v29.receiver = self;
  v29.super_class = (Class)MFModernAddressAtom;
  v19 = -[MFModernAddressAtom initWithFrame:](&v29, sel_initWithFrame_, v17, v18, 30.0, v16);
  v20 = v19;
  v21 = v19;
  if (v19)
  {
    v19->_maxWidth = a6;
    -[MFModernAddressAtom setOpaque:](v19, "setOpaque:", 0);
    -[MFModernAddressAtom setAutoresizesSubviews:](v21, "setAutoresizesSubviews:", 1);
    *((_BYTE *)v21 + 512) = *((_BYTE *)v21 + 512) & 0xFE | a5;
    objc_storeStrong((id *)&v20->_fullAddress, a3);
    if (a7)
      v22 = (void *)CFRetain(a7);
    else
      v22 = 0;
    v21->_addressBook = v22;
    -[MFModernAddressAtom _updateDisplayStringIncludingABPerson:](v21, "_updateDisplayStringIncludingABPerson:", 1);
    v23 = objc_alloc(MEMORY[0x1E0D13618]);
    -[MFModernAddressAtom bounds](v21, "bounds");
    v24 = objc_msgSend(v23, "initWithFrame:presentationOptions:separatorStyle:wrappingSupported:", a4, 1, 1);
    atomView = v21->_atomView;
    v21->_atomView = (CNAtomView *)v24;

    -[CNAtomView setUserInteractionEnabled:](v21->_atomView, "setUserInteractionEnabled:", 0);
    -[CNAtomView setAutoresizingMask:](v21->_atomView, "setAutoresizingMask:", 2);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAtomView setBackgroundColor:](v21->_atomView, "setBackgroundColor:", v26);

    -[MFModernAddressAtom addSubview:](v21, "addSubview:", v21->_atomView);
    -[MFModernAddressAtom _displayStringDidChange](v21, "_displayStringDidChange");
  }

  return v21;
}

- (int64_t)numberOfLines
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[CNAtomView titleLabel](self->_atomView, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[CNAtomView titleLabel](self->_atomView, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lineHeight");
  v9 = v5 / v8;

  v10 = floor(v9);
  v11 = ceil(v9);
  if (v9 - v10 >= 0.25)
    return (uint64_t)v11;
  return (uint64_t)v10;
}

- (void)setFirstLineIndent:(double)a3
{
  -[CNAtomView setFirstLineIndent:](self->_atomView, "setFirstLineIndent:");
  self->_firstLineIndent = a3;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFModernAddressAtom;
  if (-[MFModernAddressAtom respondsToSelector:](&v5, sel_respondsToSelector_))
    v3 = 1;
  else
    v3 = objc_opt_respondsToSelector();
  return v3 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFModernAddressAtom;
  -[MFModernAddressAtom methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[CNAtomView methodSignatureForSelector:](self->_atomView, "methodSignatureForSelector:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_atomView;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFModernAddressAtom;
  -[MFModernAddressAtom setEnabled:](&v6, sel_setEnabled_);
  if (v3)
  {
    -[CNAtomView setTintColor:](self->_atomView, "setTintColor:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "mailModernLabelledAddressAtomDefaultTextColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAtomView setTintColor:](self->_atomView, "setTintColor:", v5);

  }
}

- (NSString)description
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MFModernAddressAtom;
  -[MFModernAddressAtom description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(";"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[MFModernAddressAtom presentationOptionsDescription](self, "presentationOptionsDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR(" presentation = %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertObject:atIndex:", v8, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" address = “%@”"), self->_fullAddress);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertObject:atIndex:", v9, 1);

  if (self->_identifier >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" person = %d"), self->_identifier);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertObject:atIndex:", v10, 1);

  }
  if (-[NSString length](self->_displayString, "length"))
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[MFModernAddressAtom displayString](self, "displayString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR(" name = “%@”"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "insertObject:atIndex:", v13, 1);
  }
  else
  {
    objc_msgSend(v5, "insertObject:atIndex:", CFSTR(" name = nil"), 1);
  }
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(";"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (id)presentationOptionsDescription
{
  unint64_t v2;
  unint64_t v3;
  void *v4;
  id v5;
  void (**v6)(void *, uint64_t, const __CFString *);
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, void *);
  void *v12;
  id v13;
  unint64_t v14;

  v2 = -[MFModernAddressAtom presentationOptions](self, "presentationOptions");
  if (!v2)
    return CFSTR("none");
  v3 = v2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __53__MFModernAddressAtom_presentationOptionsDescription__block_invoke;
  v12 = &unk_1E5A69750;
  v14 = v3;
  v5 = v4;
  v13 = v5;
  v6 = (void (**)(void *, uint64_t, const __CFString *))_Block_copy(&v9);
  v6[2](v6, 1, CFSTR("failure"));
  v6[2](v6, 2, CFSTR("sms"));
  v6[2](v6, 8, CFSTR("disabled"));
  v6[2](v6, 16, CFSTR("VIP"));
  v6[2](v6, 32, CFSTR("signed"));
  v6[2](v6, 64, CFSTR("insecure"));
  v6[2](v6, 128, CFSTR("secure"));
  v6[2](v6, 256, CFSTR("unverified"));
  v6[2](v6, 512, CFSTR("pending (leading)"));
  v6[2](v6, 4, CFSTR("pending (trailing)"));
  v6[2](v6, 1024, CFSTR("available"));
  v6[2](v6, 2048, CFSTR("unavailable"));
  v6[2](v6, 4096, CFSTR("unknown availability"));
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" + "), v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __53__MFModernAddressAtom_presentationOptionsDescription__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if ((*(_QWORD *)(a1 + 40) & a2) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (void)addressBookDidChange:(id)a3
{
  -[MFModernAddressAtom _updateDisplayStringIncludingABPerson:](self, "_updateDisplayStringIncludingABPerson:", 1);
  -[MFModernAddressAtom _displayStringDidChange](self, "_displayStringDidChange");
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)dealloc
{
  void *addressBook;
  void *person;
  objc_super v5;

  addressBook = self->_addressBook;
  if (addressBook)
    CFRelease(addressBook);
  person = self->_person;
  if (person)
    CFRelease(person);
  v5.receiver = self;
  v5.super_class = (Class)MFModernAddressAtom;
  -[MFModernAddressAtom dealloc](&v5, sel_dealloc);
}

- (void)setFrame:(CGRect)a3
{
  CNAtomView *atomView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFModernAddressAtom;
  -[MFModernAddressAtom setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  atomView = self->_atomView;
  -[MFModernAddressAtom bounds](self, "bounds");
  -[CNAtomView setFrame:](atomView, "setFrame:");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFModernAddressAtom;
  -[MFModernAddressAtom layoutSubviews](&v3, sel_layoutSubviews);
  -[CNAtomView sizeToFit](self->_atomView, "sizeToFit");
  -[MFModernAddressAtom sizeToFit](self, "sizeToFit");
}

- (void)setMaxWidth:(unsigned int)a3
{
  self->_maxWidth = a3;
  -[MFModernAddressAtom setNeedsLayout](self, "setNeedsLayout");
}

- (unint64_t)presentationOptions
{
  return -[CNAtomView presentationOptions](self->_atomView, "presentationOptions");
}

- (void)setPresentationOptions:(unint64_t)a3
{
  -[CNAtomView setPresentationOptions:](self->_atomView, "setPresentationOptions:", a3);
  -[MFModernAddressAtom sizeToFit](self, "sizeToFit");
}

- (void)setScale:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[CNAtomView setScale:](self->_atomView, "setScale:");
  -[MFModernAddressAtom frame](self, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0D13618], "defaultHeight");
  -[MFModernAddressAtom setFrame:](self, "setFrame:", v6, v8, v10, v11 * a3);
  -[MFModernAddressAtom sizeToFit](self, "sizeToFit");
}

- (void)setIsPrimaryAddressAtom:(BOOL)a3
{
  -[CNAtomView setIsPrimaryAddressAtom:](self->_atomView, "setIsPrimaryAddressAtom:", a3);
  -[MFModernAddressAtom sizeToFit](self, "sizeToFit");
}

- (CGPoint)baselinePoint
{
  double v3;
  double v4;
  CGPoint result;

  -[CNAtomView baselinePoint](self->_atomView, "baselinePoint");
  -[MFModernAddressAtom convertPoint:fromView:](self, "convertPoint:fromView:", self->_atomView);
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setAtomFont:(id)a3
{
  id v4;

  v4 = a3;
  -[CNAtomView setTitleFont:](self->_atomView, "setTitleFont:");
  -[MFModernAddressAtom sizeToFit](self, "sizeToFit");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  unint64_t v6;
  CNAtomView *atomView;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  CNAtomView *v16;
  unint64_t v17;
  double v18;
  double v19;
  CGSize result;

  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory", a3.width, a3.height);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  atomView = self->_atomView;
  if (IsAccessibilityCategory)
  {
    LODWORD(v6) = self->_maxWidth;
    -[CNAtomView sizeThatFits:](atomView, "sizeThatFits:", (double)v6, 1.79769313e308);
  }
  else
  {
    -[CNAtomView titleFont](atomView, "titleFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lineHeight");
    v12 = v11;
    -[CNAtomView titleFont](self->_atomView, "titleFont");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "descender");
    v15 = round(v12 - v14);

    v16 = self->_atomView;
    LODWORD(v17) = self->_maxWidth;
    v18 = (double)v17;
    -[CNAtomView frame](v16, "frame");
    -[CNAtomView preferredWidthWithSizeConstraints:](v16, "preferredWidthWithSizeConstraints:", v18, v19);
    v9 = v15;
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)_updateABPerson
{
  void *person;
  ECEmailAddressConvertible *fullAddress;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFModernAddressAtom.m"), 329, CFSTR("Current thread must be main"));

  }
  person = self->_person;
  if (person)
    CFRelease(person);
  if (self->_addressBook)
  {
    fullAddress = self->_fullAddress;
    if ((*((_BYTE *)self + 512) & 1) != 0)
    {
      -[ECEmailAddressConvertible stringValue](fullAddress, "stringValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "length"))
      {
        v8 = (void *)ABCFindPersonMatchingPhoneNumber();
        goto LABEL_11;
      }
    }
    else
    {
      -[ECEmailAddressConvertible emailAddressValue](fullAddress, "emailAddressValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "simpleAddress");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "length"))
      {
        v8 = (void *)ABCFindPersonMatchingEmailAddress();
LABEL_11:
        self->_person = v8;
      }
    }

  }
  self->_person = 0;
  self->_identifier = 0;
  *((_BYTE *)self + 512) |= 2u;
}

- (id)emailAddress
{
  void *v2;
  void *v3;

  -[ECEmailAddressConvertible emailAddressValue](self->_fullAddress, "emailAddressValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "simpleAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isDisplayStringFromAddressBook
{
  return (*((unsigned __int8 *)self + 512) >> 2) & 1;
}

- (void)setAddress:(id)a3
{
  ECEmailAddressConvertible *v5;

  v5 = (ECEmailAddressConvertible *)a3;
  if (self->_fullAddress != v5)
  {
    objc_storeStrong((id *)&self->_fullAddress, a3);
    *((_BYTE *)self + 512) &= ~1u;
    -[MFModernAddressAtom _updateDisplayStringIncludingABPerson:](self, "_updateDisplayStringIncludingABPerson:", 0);
    *((_BYTE *)self + 512) |= 2u;
    -[MFModernAddressAtom _displayStringDidChange](self, "_displayStringDidChange");
  }

}

- (void)_displayStringDidChange
{
  CNAtomView *atomView;
  void *v4;
  id v5;
  id WeakRetained;

  atomView = self->_atomView;
  -[MFModernAddressAtom displayString](self, "displayString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAtomView setTitle:](atomView, "setTitle:");

  -[CNAtomView layoutSubviews](self->_atomView, "layoutSubviews");
  -[MFModernAddressAtom sizeToFit](self, "sizeToFit");
  -[MFModernAddressAtom setNeedsDisplay](self, "setNeedsDisplay");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MFModernAddressAtom displayString](self, "displayString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "addressAtom:displayStringDidChange:", self, v4);

  }
}

- (void)_updateDisplayStringIncludingABPerson:(BOOL)a3
{
  _BOOL4 v3;
  id *p_displayString;
  NSString *displayString;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;

  v3 = a3;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFModernAddressAtom.m"), 400, CFSTR("Current thread must be main"));

  }
  p_displayString = (id *)&self->_displayString;
  displayString = self->_displayString;
  self->_displayString = 0;

  *((_BYTE *)self + 512) &= ~4u;
  if (v3)
    -[MFModernAddressAtom _updateABPerson](self, "_updateABPerson");
  if (!*p_displayString)
  {
    -[ECEmailAddressConvertible emailAddressValue](self->_fullAddress, "emailAddressValue");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Hide My Email")) & 1) != 0)
    {
      objc_msgSend(v17, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("icloud.com"));

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.messageui"));
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("HIDE_MY_EMAIL_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = *p_displayString;
        *p_displayString = (id)v12;

LABEL_14:
        return;
      }
    }
    else
    {

    }
    if ((*((_BYTE *)self + 512) & 1) != 0)
    {
      -[ECEmailAddressConvertible stringValue](self->_fullAddress, "stringValue");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v15 = CPPhoneNumberCopyFormattedStringForTextMessage();
      v16 = *p_displayString;
      *p_displayString = (id)v15;

      if (!*p_displayString)
        objc_storeStrong(p_displayString, v11);
    }
    else
    {
      v14 = objc_msgSend((id)objc_opt_class(), "copyDisplayStringForAddress:usingAddressBook:useAbbreviatedName:", self->_fullAddress, 0, 0);
      v11 = *p_displayString;
      *p_displayString = (id)v14;
    }
    goto LABEL_14;
  }
}

- (void)ABPerson
{
  if ((*((_BYTE *)self + 512) & 2) == 0)
    -[MFModernAddressAtom _updateABPerson](self, "_updateABPerson");
  return self->_person;
}

- (int)ABPropertyType
{
  int *v2;

  if ((*((_BYTE *)self + 512) & 1) != 0)
    v2 = (int *)MEMORY[0x1E0CF5DF0];
  else
    v2 = (int *)MEMORY[0x1E0CF5DA8];
  return *v2;
}

- (id)fullAddress
{
  return self->_fullAddress;
}

- (int)identifier
{
  return self->_identifier;
}

- (NSString)addressIdentifier
{
  NSString *addressIdentifier;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSString **p_addressIdentifier;
  NSString *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  addressIdentifier = self->_addressIdentifier;
  if (!addressIdentifier)
  {
    v17[0] = *MEMORY[0x1E0C966A8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFModernAddressAtom contactWithKeysToFetch:](self, "contactWithKeysToFetch:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[MFModernAddressAtom emailAddress](self, "emailAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "emailAddressValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {

      return (NSString *)0;
    }
    objc_msgSend(v5, "emailAddresses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __40__MFModernAddressAtom_addressIdentifier__block_invoke;
    v15[3] = &unk_1E5A68710;
    v9 = v7;
    v16 = v9;
    objc_msgSend(v8, "ef_firstObjectPassingTest:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "identifier");
    v11 = objc_claimAutoreleasedReturnValue();
    p_addressIdentifier = &self->_addressIdentifier;
    v13 = *p_addressIdentifier;
    *p_addressIdentifier = (NSString *)v11;

    addressIdentifier = *p_addressIdentifier;
  }
  return addressIdentifier;
}

BOOL __40__MFModernAddressAtom_addressIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emailAddressValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "emailAddressValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "compare:", *(_QWORD *)(a1 + 32)) == 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)contactWithKeysToFetch:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C97298]);
  -[MFModernAddressAtom unmodifiedAddressString](self, "unmodifiedAddressString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "em_fetchContactForEmailAddress:keysToFetch:createIfNeeded:", v6, v4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)unmodifiedAddressString
{
  return (id)-[ECEmailAddressConvertible stringValue](self->_fullAddress, "stringValue");
}

- (id)displayString
{
  return self->_displayString;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  CNAtomView *atomView;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  if (-[MFModernAddressAtom isHighlighted](self, "isHighlighted") != a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)MFModernAddressAtom;
    -[MFModernAddressAtom setHighlighted:](&v8, sel_setHighlighted_, v3);
    atomView = self->_atomView;
    if (v3)
    {
      -[CNAtomView setSelected:animated:](atomView, "setSelected:animated:", 1, 1);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D1F070], "__mui_nextRunLoopMainThreadScheduler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAtomView ef_onScheduler:](atomView, "ef_onScheduler:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSelected:animated:", 0, 1);

    }
  }
}

- (void)setOpaque:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFModernAddressAtom;
  -[MFModernAddressAtom setOpaque:](&v6, sel_setOpaque_);
  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFModernAddressAtom setBackgroundColor:](self, "setBackgroundColor:", v5);

}

- (void)setLabelAlpha:(double)a3
{
  id v4;

  -[CNAtomView titleLabel](self->_atomView, "titleLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", a3);

}

- (void)performBuildInAnimationFromTextColor:(id)a3 withDuration:(double)a4
{
  -[CNAtomView performBuildInAnimationFromTextColor:withDuration:](self->_atomView, "performBuildInAnimationFromTextColor:withDuration:", a3, a4);
}

- (id)viewForLastBaselineLayout
{
  return (id)-[CNAtomView titleLabel](self->_atomView, "titleLabel");
}

- (double)firstLineIndent
{
  return self->_firstLineIndent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressIdentifier, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_fullAddress, 0);
  objc_storeStrong((id *)&self->_atomView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
