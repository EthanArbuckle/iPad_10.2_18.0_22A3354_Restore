@implementation MessageContentRepresentationRequestDelegate

- (void)contentObjectID:(id)a3 generateHTMLSnippetsForRelatedContentItems:(id)a4 completionHandler:(id)a5
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void (**)(id, void *, _QWORD))a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        +[ContentItemMarkupGenerator markupStringForDisplayForContentItem:](ContentItemMarkupGenerator, "markupStringForDisplayForContentItem:", v13, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "contentID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v15);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v7[2](v7, v8, 0);
}

- (void)contentObjectID:(id)a3 placeholderHTMLForEmptyContentWithCompletionHandler:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *, _QWORD);

  v11 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NO_BODY"), &stru_1E9A04480, CFSTR("Main"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "mf_stringByEscapingHTMLCodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", CFSTR("<html dir=auto><body><i><font color=#888>%@</font></i></body></html>"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC68E0]), "initWithMarkupString:baseURL:", v8, 0);
  objc_msgSend(v9, "markupString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, v10, 0);

}

@end
