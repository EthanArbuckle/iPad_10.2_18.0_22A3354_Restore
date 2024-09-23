@implementation _SFMailContentProvider

- (void)prepareMailComposeViewController:(id)a3 withMailToURL:(id)a4 contentURL:(id)a5 preferredContentType:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  void (**v14)(_QWORD);
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  void (**v23)(_QWORD);
  _QWORD v24[4];
  id v25;
  void (**v26)(_QWORD);

  v12 = a3;
  v13 = a5;
  v14 = (void (**)(_QWORD))a7;
  if (v14)
    v15 = v14;
  else
    v15 = (void (**)(_QWORD))&__block_literal_global_48;
  objc_msgSend(v12, "setKeyboardVisible:", 1);
  if (v13)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "safari_userVisibleString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("\n%@"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMessageBody:isHTML:", v18, 0);

  }
  if (a4
    || (v19 = -[_SFMailContentProvider _bestContentTypeForPreferredContentType:](self, "_bestContentTypeForPreferredContentType:", a6), v19 < 2))
  {
    v15[2](v15);
  }
  else
  {
    if (v19 == 2)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __123___SFMailContentProvider_prepareMailComposeViewController_withMailToURL_contentURL_preferredContentType_completionHandler___block_invoke_2;
      v24[3] = &unk_1E4AC5C20;
      v25 = v12;
      v26 = v15;
      -[_SFMailContentProvider _getReaderContentWithCompletionHandler:](self, "_getReaderContentWithCompletionHandler:", v24);

      v20 = v25;
      goto LABEL_14;
    }
    if (v19 == 3)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __123___SFMailContentProvider_prepareMailComposeViewController_withMailToURL_contentURL_preferredContentType_completionHandler___block_invoke_33;
      v21[3] = &unk_1E4AC5C48;
      v22 = v12;
      v23 = v15;
      -[_SFMailContentProvider _getPDFDataWithCompletionHandler:](self, "_getPDFDataWithCompletionHandler:", v21);

      v20 = v22;
LABEL_14:

    }
  }

}

- (void)getMailComposeViewControllerWithMailToURL:(id)a3 contentURL:(id)a4 preferredContentType:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if ((objc_msgSend(getMFMailComposeViewControllerClass(), "canSendMail") & 1) != 0)
  {
    v13 = (void *)objc_msgSend(objc_alloc((Class)getMFMailComposeViewControllerClass()), "initWithURL:", v10);
    objc_msgSend(v13, "setMailComposeDelegate:", self);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __118___SFMailContentProvider_getMailComposeViewControllerWithMailToURL_contentURL_preferredContentType_completionHandler___block_invoke;
    v15[3] = &unk_1E4AC1338;
    v16 = v13;
    v17 = v12;
    v14 = v13;
    -[_SFMailContentProvider prepareMailComposeViewController:withMailToURL:contentURL:preferredContentType:completionHandler:](self, "prepareMailComposeViewController:withMailToURL:contentURL:preferredContentType:completionHandler:", v14, v10, v11, a5, v15);

  }
  else
  {
    (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
  }

}

- (id)_preferentiallyOrderedContentTypes
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_preferentiallyOrderedContentTypes_contentTypes;
  if (!_preferentiallyOrderedContentTypes_contentTypes)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", &unk_1E4B27310);
    v4 = (void *)_preferentiallyOrderedContentTypes_contentTypes;
    _preferentiallyOrderedContentTypes_contentTypes = v3;

    v2 = (void *)_preferentiallyOrderedContentTypes_contentTypes;
  }
  return v2;
}

- (id)_preferentiallyOrderedAvailableContentTypes
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[_SFMailContentProvider _preferentiallyOrderedContentTypes](self, "_preferentiallyOrderedContentTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[_SFMailContentProvider _canProvideContentType:](self, "_canProvideContentType:", objc_msgSend(v10, "integerValue", (_QWORD)v13)))
        {
          objc_msgSend(v4, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (int64_t)_bestContentTypeForPreferredContentType:(int64_t)a3
{
  void *v5;
  int64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  -[_SFMailContentProvider _preferentiallyOrderedAvailableContentTypes](self, "_preferentiallyOrderedAvailableContentTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "containsObject:", v7);

    if ((v8 & 1) != 0)
      goto LABEL_9;
    goto LABEL_5;
  }
  v6 = -[_SFMailContentProvider _defaultPreferredContentType](self, "_defaultPreferredContentType");
  if (v6)
  {
    a3 = v6;
    goto LABEL_4;
  }
LABEL_5:
  objc_msgSend(v5, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    a3 = objc_msgSend(v9, "integerValue");
  else
    a3 = 0;

LABEL_9:
  return a3;
}

- (BOOL)_canProvideContentType:(int64_t)a3
{
  char v3;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v7 = WeakRetained;
  switch(a3)
  {
    case 3:
      if (self->_restrictAddingPDFContent)
      {
        v3 = 0;
      }
      else
      {
        objc_msgSend(WeakRetained, "webViewForMailContentProvider:", self);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v9, "_isDisplayingPDF");

      }
      break;
    case 2:
      v3 = objc_msgSend(WeakRetained, "readerViewIsVisibleForMailContentProvider:", self);
      break;
    case 1:
      objc_msgSend(WeakRetained, "webViewForMailContentProvider:", self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v8 != 0;

      break;
  }

  return v3 & 1;
}

- (int64_t)_defaultPreferredContentType
{
  id WeakRetained;
  void *v4;
  int64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "webViewForMailContentProvider:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "_isDisplayingPDF") & 1) != 0)
  {
    v5 = 3;
  }
  else if (objc_msgSend(WeakRetained, "readerViewIsVisibleForMailContentProvider:", self))
  {
    v5 = 2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_getReaderContentWithCompletionHandler:(id)a3
{
  _SFMailContentProviderDataSource **p_dataSource;
  id v5;
  id WeakRetained;
  id v7;

  p_dataSource = &self->_dataSource;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(WeakRetained, "readerControllerForMailContentProvider:", self);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "collectReaderContentForMailWithCompletion:", v5);
}

- (void)_getPDFDataWithCompletionHandler:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *, void *);

  v9 = (void (**)(id, void *, void *))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "webViewForMailContentProvider:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "_isDisplayingPDF"))
  {
    objc_msgSend(v5, "_dataForDisplayedPDF");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sf_suggestedFilename");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safari_ensurePathExtension:", CFSTR("pdf"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v6, v8);

  }
  else
  {
    v9[2](v9, 0, 0);
  }

}

- (void)_getWebArchiveDataWithCompletion:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "webViewForMailContentProvider:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0C92C18]);
  objc_msgSend(v6, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v8, CFSTR("application/x-webarchive"), 0, 0);

  objc_msgSend(v9, "suggestedFilename");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safari_ensurePathExtension:", CFSTR("webarchive"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59___SFMailContentProvider__getWebArchiveDataWithCompletion___block_invoke;
  v14[3] = &unk_1E4AC5C70;
  v15 = v11;
  v16 = v4;
  v12 = v11;
  v13 = v4;
  objc_msgSend(v6, "_getWebArchiveDataWithCompletionHandler:", v14);

}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v5;
  else
    v6 = v8;
  v7 = v6;

  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (_SFMailContentProviderDataSource)dataSource
{
  return (_SFMailContentProviderDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (BOOL)restrictAddingPDFContent
{
  return self->_restrictAddingPDFContent;
}

- (void)setRestrictAddingPDFContent:(BOOL)a3
{
  self->_restrictAddingPDFContent = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
