@implementation _SFActivityItemCustomizationController

- (_SFActivityItemCustomizationController)init
{
  _SFActivityItemCustomizationController *v2;
  _SFActivityItemCustomizationController *v3;
  _SFActivityItemCustomizationController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SFActivityItemCustomizationController;
  v2 = -[_SFActivityItemCustomizationController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_contentTypeAllowedMap[4] = 1;
    *(_DWORD *)v2->_contentTypeAllowedMap = 16843009;
    v2->_selectedContentType = 0;
    v4 = v2;
  }

  return v3;
}

- (id)_customizationGroupsForActivityViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  -[_SFActivityItemCustomizationController _allowedContentTypes](self, "_allowedContentTypes", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_mapObjectsUsingBlock:", &__block_literal_global_42);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    v7 = (void *)MEMORY[0x1E0CEAC48];
    v8 = -[_SFActivityItemCustomizationController _selectedIndex](self, "_selectedIndex");
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __88___SFActivityItemCustomizationController__customizationGroupsForActivityViewController___block_invoke_2;
    v16[3] = &unk_1E4AC5370;
    v16[4] = self;
    objc_msgSend(v7, "pickerCustomizationWithIdentifier:options:selectedOptionIndex:footerText:valueChangedHandler:", CFSTR("SFActivityFormatPicker"), v5, v8, v9, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x1E0CEAC50]);
    _WBSLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "_initGroupWithName:identifier:customizations:", v12, CFSTR("SFActivityFormatGroup"), v13);

    v17 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  char v8;
  char v9;
  int v10;
  char v11;
  char v12;
  int v13;
  id v14;
  uint64_t (**v15)(_QWORD, _QWORD);
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void *v20;
  id v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;

  v4 = a3;
  objc_storeWeak((id *)&self->_delegate, v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "webViewForCustomizationController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = objc_msgSend(v4, "isContentObscuredByDigitalHealthForCustomizationController:", self);
    else
      v6 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = objc_msgSend(v4, "isDisplayingQuickLookDocumentForCustomizationController:", self) ^ 1;
    else
      v7 = 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = objc_msgSend(v4, "isReaderAvailableForCustomizationController:", self);
    else
      v8 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = objc_msgSend(v4, "isShowingReaderForCustomizationController:", self);
    else
      v9 = 0;
    v10 = objc_msgSend(v5, "_isDisplayingStandaloneImageDocument");
    v11 = v10;
    if (((v6 | v10) & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      v13 = objc_msgSend(v5, "_isDisplayingStandaloneMediaDocument");
      if (((v13 | v7) & 1) != 0)
        v12 = v13 ^ 1;
      else
        v12 = objc_msgSend(v5, "_isDisplayingPDF");
    }
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __54___SFActivityItemCustomizationController_setDelegate___block_invoke;
    v20 = &unk_1E4AC5398;
    v22 = v12;
    v23 = v9;
    v24 = v8;
    v14 = v5;
    v21 = v14;
    v25 = v6;
    v26 = v11;
    v15 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1A8598C40](&v17);
    for (i = 0; i != 5; ++i)
      self->_contentTypeAllowedMap[i] = v15[2](v15, i);
    -[_SFActivityItemCustomizationController _ensureSelectedContentTypeIsAllowed](self, "_ensureSelectedContentTypeIsAllowed", v17, v18, v19, v20);

  }
}

- (BOOL)canShareAsLink
{
  return (unint64_t)(self->_selectedContentType - 6) < 0xFFFFFFFFFFFFFFFBLL;
}

- (BOOL)canPrint
{
  return ((self->_selectedContentType - 3) & 0xFFFFFFFFFFFFFFFDLL) != 0;
}

- (BOOL)canShareAsDownload
{
  return (unint64_t)(self->_selectedContentType - 6) < 0xFFFFFFFFFFFFFFFCLL;
}

- (BOOL)canShareAsWebArchive
{
  return self->_selectedContentType > 5uLL || (self->_selectedContentType & 0x3F) == 3;
}

- (BOOL)canShareAsStandaloneImage
{
  return (self->_selectedContentType > 5uLL) | (0x11u >> self->_selectedContentType) & 1;
}

- (BOOL)canShareAsPDF
{
  return (self->_selectedContentType > 5uLL) | (6u >> self->_selectedContentType) & 1;
}

- (int64_t)_contentTypeForAllowedContentAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[_SFActivityItemCustomizationController _allowedContentTypes](self, "_allowedContentTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  return v6;
}

- (int64_t)_selectedIndex
{
  void *v3;
  void *v4;
  int64_t v5;

  -[_SFActivityItemCustomizationController _allowedContentTypes](self, "_allowedContentTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_selectedContentType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "indexOfObject:", v4);

  return v5;
}

- (id)_allowedContentTypes
{
  void *v3;
  uint64_t v4;
  BOOL *contentTypeAllowedMap;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  contentTypeAllowedMap = self->_contentTypeAllowedMap;
  do
  {
    if (contentTypeAllowedMap[v4])
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

    }
    ++v4;
  }
  while (v4 != 5);
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (void)_customizationsDidChange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "customizationControllerCustomizationsDidChange:", self);

}

- (void)_ensureSelectedContentTypeIsAllowed
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;

  if (!self->_contentTypeAllowedMap[self->_selectedContentType])
  {
    -[_SFActivityItemCustomizationController _allowedContentTypes](self, "_allowedContentTypes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v6;
    if (v6)
    {
      v5 = objc_msgSend(v6, "integerValue");
      v4 = v6;
    }
    else
    {
      v5 = 0;
    }
    self->_selectedContentType = v5;

  }
}

- (_SFActivityItemCustomizationDelegate)delegate
{
  return (_SFActivityItemCustomizationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)selectedContentType
{
  return self->_selectedContentType;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
