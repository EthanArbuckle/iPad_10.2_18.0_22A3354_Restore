@implementation CNAutocompleteSearchControllerSafeDelegateWrapper

- (CNAutocompleteSearchControllerSafeDelegateWrapper)initWithDelegate:(id)a3
{
  id v4;
  CNAutocompleteSearchControllerSafeDelegateWrapper *v5;
  CNAutocompleteSearchControllerSafeDelegateWrapper *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  int v35;
  void *v36;
  int v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  void *v42;
  int v43;
  void *v44;
  int v45;
  void *v46;
  int v47;
  void *v48;
  int v49;
  void *v50;
  int v51;
  CNAutocompleteSearchControllerSafeDelegateWrapper *v52;
  objc_super v54;

  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)CNAutocompleteSearchControllerSafeDelegateWrapper;
  v5 = -[CNAutocompleteSearchControllerSafeDelegateWrapper init](&v54, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](v6, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFFFFE | objc_opt_respondsToSelector() & 1);

    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](v6, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 2;
    else
      v9 = 0;
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFFFFD | v9);

    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](v6, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 128;
    else
      v11 = 0;
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFFF7F | v11);

    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](v6, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 4;
    else
      v13 = 0;
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFFFFB | v13);

    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](v6, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = 8;
    else
      v15 = 0;
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFFFF7 | v15);

    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](v6, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = 16;
    else
      v17 = 0;
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFFFEF | v17);

    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](v6, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = 32;
    else
      v19 = 0;
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFFFDF | v19);

    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](v6, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = 64;
    else
      v21 = 0;
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFFFBF | v21);

    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](v6, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = 256;
    else
      v23 = 0;
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFFEFF | v23);

    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](v6, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = 512;
    else
      v25 = 0;
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFFDFF | v25);

    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](v6, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v27 = 1024;
    else
      v27 = 0;
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFFBFF | v27);

    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](v6, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v29 = 2048;
    else
      v29 = 0;
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFF7FF | v29);

    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](v6, "delegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v31 = 4096;
    else
      v31 = 0;
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFEFFF | v31);

    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](v6, "delegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v33 = 0x2000;
    else
      v33 = 0;
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFDFFF | v33);

    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](v6, "delegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v35 = 0x4000;
    else
      v35 = 0;
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFBFFF | v35);

    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](v6, "delegate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v37 = 0x8000;
    else
      v37 = 0;
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFF7FFF | v37);

    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](v6, "delegate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v39 = 0x10000;
    else
      v39 = 0;
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFEFFFF | v39);

    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](v6, "delegate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v41 = 0x20000;
    else
      v41 = 0;
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFDFFFF | v41);

    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](v6, "delegate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v43 = 0x40000;
    else
      v43 = 0;
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFBFFFF | v43);

    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](v6, "delegate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v45 = 0x80000;
    else
      v45 = 0;
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFF7FFFF | v45);

    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](v6, "delegate");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v47 = 0x100000;
    else
      v47 = 0;
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFEFFFFF | v47);

    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](v6, "delegate");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v49 = 0x200000;
    else
      v49 = 0;
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFDFFFFF | v49);

    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](v6, "delegate");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v51 = 0x400000;
    else
      v51 = 0;
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFBFFFFF | v51);

    v52 = v6;
  }

  return v6;
}

+ (id)log
{
  if (log_cn_once_token_1 != -1)
    dispatch_once(&log_cn_once_token_1, &__block_literal_global_13);
  return (id)log_cn_once_object_1;
}

void __56__CNAutocompleteSearchControllerSafeDelegateWrapper_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.autocomplete.ui", "delegate wrapper");
  v1 = (void *)log_cn_once_object_1;
  log_cn_once_object_1 = (uint64_t)v0;

}

- (void)searchController:(id)a3 didAddRecipient:(id)a4
{
  id v6;
  id v7;
  id v8;

  if ((*(_BYTE *)&self->_delegateFlags & 1) != 0)
  {
    v6 = a4;
    v7 = a3;
    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchController:didAddRecipient:", v7, v6);

  }
}

- (void)searchController:(id)a3 didRemoveRecipient:(id)a4
{
  id v6;
  id v7;
  id v8;

  if ((*(_BYTE *)&self->_delegateFlags & 2) != 0)
  {
    v6 = a4;
    v7 = a3;
    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchController:didRemoveRecipient:", v7, v6);

  }
}

- (id)searchController:(id)a3 composeRecipientForAddress:(id)a4
{
  void *v4;
  id v7;
  id v8;
  void *v9;

  if ((*(_BYTE *)&self->_delegateFlags & 4) != 0)
  {
    v7 = a4;
    v8 = a3;
    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchController:composeRecipientForAddress:", v8, v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)searchController:(id)a3 willShowResultsView:(id)a4
{
  id v6;
  id v7;
  id v8;

  if ((*(_BYTE *)&self->_delegateFlags & 8) != 0)
  {
    v6 = a4;
    v7 = a3;
    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchController:willShowResultsView:", v7, v6);

  }
}

- (void)searchController:(id)a3 didShowResultsView:(id)a4
{
  id v6;
  id v7;
  id v8;

  if ((*(_BYTE *)&self->_delegateFlags & 0x10) != 0)
  {
    v6 = a4;
    v7 = a3;
    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchController:didShowResultsView:", v7, v6);

  }
}

- (void)searchController:(id)a3 willHideResultsView:(id)a4
{
  id v6;
  id v7;
  id v8;

  if ((*(_BYTE *)&self->_delegateFlags & 0x20) != 0)
  {
    v6 = a4;
    v7 = a3;
    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchController:willHideResultsView:", v7, v6);

  }
}

- (void)searchController:(id)a3 didHideResultsView:(id)a4
{
  id v6;
  id v7;
  id v8;

  if ((*(_BYTE *)&self->_delegateFlags & 0x40) != 0)
  {
    v6 = a4;
    v7 = a3;
    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchController:didHideResultsView:", v7, v6);

  }
}

- (void)searchController:(id)a3 textViewTextDidChange:(id)a4
{
  id v6;
  id v7;
  id v8;

  if ((*(_BYTE *)&self->_delegateFlags & 0x80) != 0)
  {
    v6 = a4;
    v7 = a3;
    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchController:textViewTextDidChange:", v7, v6);

  }
}

- (unint64_t)searchController:(id)a3 presentationOptionsForRecipient:(id)a4
{
  id v7;
  id v8;
  void *v9;
  unint64_t v10;

  if ((*((_BYTE *)&self->_delegateFlags + 1) & 1) == 0)
    return 0;
  v7 = a4;
  v8 = a3;
  -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "searchController:presentationOptionsForRecipient:", v8, v7);

  return v10;
}

- (id)searchController:(id)a3 preferredRecipientForRecipient:(id)a4
{
  void *v4;
  id v7;
  id v8;
  void *v9;

  if ((*((_BYTE *)&self->_delegateFlags + 1) & 2) != 0)
  {
    v7 = a4;
    v8 = a3;
    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchController:preferredRecipientForRecipient:", v8, v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)searchController:(id)a3 tintColorForRecipient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)&self->_delegateFlags + 1) & 4) != 0)
  {
    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchController:tintColorForRecipient:", v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }

  return v8;
}

- (void)searchController:(id)a3 textViewWillChangeSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  id v8;

  if ((*((_BYTE *)&self->_delegateFlags + 1) & 8) != 0)
  {
    height = a4.height;
    width = a4.width;
    v7 = a3;
    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchController:textViewWillChangeSize:", v7, width, height);

  }
}

- (void)searchController:(id)a3 textViewDidChangeSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  id v8;

  if ((*((_BYTE *)&self->_delegateFlags + 1) & 0x10) != 0)
  {
    height = a4.height;
    width = a4.width;
    v7 = a3;
    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchController:textViewDidChangeSize:", v7, width, height);

  }
}

- (void)didTapTextViewAccessoryButtonForSearchController:(id)a3
{
  id v4;
  id v5;

  if ((*((_BYTE *)&self->_delegateFlags + 1) & 0x20) != 0)
  {
    v4 = a3;
    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didTapTextViewAccessoryButtonForSearchController:", v4);

  }
}

- (void)didTapTextViewAccessoryButtonForSearchController:(id)a3 anchoredToView:(id)a4
{
  $15C177CB5BC07E11AE80B5DA72E5CCC4 delegateFlags;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  delegateFlags = self->_delegateFlags;
  v7 = a3;
  if ((*(_WORD *)&delegateFlags & 0x4000) != 0)
  {
    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didTapTextViewAccessoryButtonForSearchController:anchoredToView:", v7, v9);

    v7 = v8;
  }
  else
  {
    -[CNAutocompleteSearchControllerSafeDelegateWrapper didTapTextViewAccessoryButtonForSearchController:](self, "didTapTextViewAccessoryButtonForSearchController:", v7);
  }

}

- (void)searchController:(id)a3 didTapTableAccessoryForRecipient:(id)a4
{
  id v6;
  id v7;
  id v8;

  if ((*((_BYTE *)&self->_delegateFlags + 1) & 0x80) != 0)
  {
    v6 = a4;
    v7 = a3;
    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchController:didTapTableAccessoryForRecipient:", v7, v6);

  }
}

- (id)searchController:(id)a3 contextMenuConfigurationForRecipient:(id)a4
{
  void *v4;
  id v7;
  id v8;
  void *v9;

  if ((*((_BYTE *)&self->_delegateFlags + 2) & 1) != 0)
  {
    v7 = a4;
    v8 = a3;
    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchController:contextMenuConfigurationForRecipient:", v8, v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)searchController:(id)a3 supplementalGroupsForSearchQuery:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;

  if ((*((_BYTE *)&self->_delegateFlags + 2) & 2) == 0)
    return 0;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "searchController:supplementalGroupsForSearchQuery:completionHandler:", v11, v10, v9);

  return v13;
}

- (BOOL)searchController:(id)a3 imageDataForRecipient:(id)a4 imageUpdateBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;

  if ((*((_BYTE *)&self->_delegateFlags + 2) & 4) == 0)
    return 0;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "searchController:imageDataForRecipient:imageUpdateBlock:", v11, v10, v9);

  return v13;
}

- (void)searchController:(id)a3 willDisplayRowForRecipient:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v6 = a4;
  if ((*((_BYTE *)&self->_delegateFlags + 2) & 8) != 0)
  {
    v7 = a3;
    objc_msgSend((id)objc_opt_class(), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CNAutocompleteSearchControllerSafeDelegateWrapper searchController:willDisplayRowForRecipient:].cold.1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "searchController:willDisplayRowForRecipient:", v7, v6);

  }
}

- (void)searchController:(id)a3 didEndDisplayingRowForRecipient:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v6 = a4;
  if ((*((_BYTE *)&self->_delegateFlags + 2) & 0x10) != 0)
  {
    v7 = a3;
    objc_msgSend((id)objc_opt_class(), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CNAutocompleteSearchControllerSafeDelegateWrapper searchController:didEndDisplayingRowForRecipient:].cold.1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "searchController:didEndDisplayingRowForRecipient:", v7, v6);

  }
}

- (void)searchController:(id)a3 didAddRecipientByResultsController:(id)a4
{
  id v6;
  id v7;
  id v8;

  if ((*((_BYTE *)&self->_delegateFlags + 2) & 0x20) != 0)
  {
    v6 = a4;
    v7 = a3;
    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchController:didAddRecipientByResultsController:", v7, v6);

  }
}

- (void)searchController:(id)a3 didAddRecipientBySuggestionsController:(id)a4
{
  id v6;
  id v7;
  id v8;

  if ((*((_BYTE *)&self->_delegateFlags + 2) & 0x40) != 0)
  {
    v6 = a4;
    v7 = a3;
    -[CNAutocompleteSearchControllerSafeDelegateWrapper delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchController:didAddRecipientBySuggestionsController:", v7, v6);

  }
}

- (CNAutocompleteSearchControllerInternalDelegate)delegate
{
  return (CNAutocompleteSearchControllerInternalDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)searchController:(uint64_t)a3 willDisplayRowForRecipient:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B10FF000, a2, a3, "willDisplayRowForRecipient for %@", a5, a6, a7, a8, 2u);
}

- (void)searchController:(uint64_t)a3 didEndDisplayingRowForRecipient:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B10FF000, a2, a3, "didEndDisplayingRowForRecipient for %@", a5, a6, a7, a8, 2u);
}

@end
