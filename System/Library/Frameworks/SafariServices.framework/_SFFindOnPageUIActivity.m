@implementation _SFFindOnPageUIActivity

- (_SFFindOnPageUIActivity)initWithWebView:(id)a3
{
  id v5;
  _SFFindOnPageUIActivity *v6;
  _SFFindOnPageUIActivity *v7;
  _SFFindOnPageUIActivity *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFFindOnPageUIActivity;
  v6 = -[UIActivity init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_webView, a3);
    v8 = v7;
  }

  return v7;
}

- (id)activityType
{
  return CFSTR("com.apple.mobilesafari.activity.findOnPage");
}

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (id)_systemImageName
{
  return CFSTR("doc.text.magnifyingglass");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    LOBYTE(v6) = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v9, "activeWebView", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "URL");
          v6 = objc_claimAutoreleasedReturnValue();

          if (!v6)
            goto LABEL_13;
          LOBYTE(v6) = 1;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
  }
LABEL_13:

  return v6 & 1;
}

- (void)performActivity
{
  -[_SFWebView find:](self->_webView, "find:", 0);
  -[_SFFindOnPageUIActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

- (void)activityDidFinish:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_SFFindOnPageUIActivity;
  -[_SFActivity activityDidFinish:](&v5, sel_activityDidFinish_);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didFindOnPageWithTrigger:", 1);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
}

@end
