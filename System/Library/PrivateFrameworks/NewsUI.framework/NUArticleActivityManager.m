@implementation NUArticleActivityManager

- (NUArticleActivityManager)initWithHeadline:(id)a3 readingHistory:(id)a4 readingList:(id)a5 subscriptionList:(id)a6 URLHandler:(id)a7 reportConcernViewPresenter:(id)a8 URLModifier:(id)a9 optionsProvider:(id)a10
{
  id v17;
  NUArticleActivityManager *v18;
  NUArticleActivityManager *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v21 = a9;
  v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)NUArticleActivityManager;
  v18 = -[NUArticleActivityManager init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_headline, a3);
    objc_storeStrong((id *)&v19->_readingHistory, a4);
    objc_storeStrong((id *)&v19->_readingList, a5);
    objc_storeStrong((id *)&v19->_subscriptionList, a6);
    objc_storeStrong((id *)&v19->_URLHandler, a7);
    objc_storeStrong((id *)&v19->_reportConcernViewPresenter, a8);
    objc_storeStrong((id *)&v19->_URLModifier, a9);
    objc_storeStrong((id *)&v19->_optionsProvider, a10);
  }

  return v19;
}

- (id)activityItemSources
{
  NUArticleImageActivityItemSource *v3;
  void *v4;
  NUArticleImageActivityItemSource *v5;
  NUArticleURLActivityItemSource *v6;
  void *v7;
  void *v8;
  NUArticleURLActivityItemSource *v9;
  NUArticleTextActivityItemSource *v10;
  void *v11;
  NUArticleTextActivityItemSource *v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v3 = [NUArticleImageActivityItemSource alloc];
  -[NUArticleActivityManager headline](self, "headline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NUArticleImageActivityItemSource initWithHeadline:](v3, "initWithHeadline:", v4);

  v6 = [NUArticleURLActivityItemSource alloc];
  -[NUArticleActivityManager headline](self, "headline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleActivityManager URLModifier](self, "URLModifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NUArticleURLActivityItemSource initWithHeadline:URLModifier:](v6, "initWithHeadline:URLModifier:", v7, v8);

  v10 = [NUArticleTextActivityItemSource alloc];
  -[NUArticleActivityManager headline](self, "headline");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NUArticleTextActivityItemSource initWithHeadline:](v10, "initWithHeadline:", v11);

  v15[0] = v5;
  v15[1] = v12;
  v15[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)activities
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NUArticleActivity *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[NUArticleActivityManager supportedActivities](self, "supportedActivities");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v7), "unsignedIntegerValue");
        -[NUArticleActivityManager activityForType:](self, "activityForType:", v8);
        v9 = (NUArticleActivity *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          -[NUArticleActivityManager headline](self, "headline");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[NUArticleActivityManager activityTypeForHeadline:withType:](self, "activityTypeForHeadline:withType:", v10, v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          -[NUArticleActivityManager headline](self, "headline");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NUArticleActivityManager activityTitleForHeadline:withType:](self, "activityTitleForHeadline:withType:", v12, v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          -[NUArticleActivityManager headline](self, "headline");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NUArticleActivityManager activityImageForHeadline:withType:](self, "activityImageForHeadline:withType:", v14, v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[NUArticleActivityManager headline](self, "headline");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NUArticleActivityManager performBlockForHeadline:withType:](self, "performBlockForHeadline:withType:", v16, v8);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v9 = -[NUArticleActivity initWithActivityType:title:image:performBlock:]([NUArticleActivity alloc], "initWithActivityType:title:image:performBlock:", v11, v13, v15, v17);
        }
        objc_msgSend(v3, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  v18 = (void *)objc_msgSend(v3, "copy");
  return v18;
}

- (id)activityForType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 != 6)
    return 0;
  +[NUAddToSafariReadingListActivityFactory createAddToSafariReadingListActivity](NUAddToSafariReadingListActivityFactory, "createAddToSafariReadingListActivity", v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)supportedActivities
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleActivityManager optionsProvider](self, "optionsProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleActivityManager headline](self, "headline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "articleActivityOptionsForHeadline:", v5);

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v3, "addObject:", &unk_24D5BAA28);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "addObject:", &unk_24D5BAA40);
  if ((v6 & 0x20) == 0)
  {
LABEL_4:
    if ((v6 & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(v3, "addObject:", &unk_24D5BAA58);
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v3, "addObject:", &unk_24D5BAA70);
  if ((v6 & 0x10) == 0)
  {
LABEL_6:
    if ((v6 & 8) == 0)
      goto LABEL_7;
LABEL_15:
    objc_msgSend(v3, "addObject:", &unk_24D5BAAA0);
    if ((v6 & 0x40) == 0)
      return v3;
    goto LABEL_8;
  }
LABEL_14:
  objc_msgSend(v3, "addObject:", &unk_24D5BAA88);
  if ((v6 & 8) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v6 & 0x40) != 0)
LABEL_8:
    objc_msgSend(v3, "addObject:", &unk_24D5BAAB8);
  return v3;
}

- (id)activityTypeForHeadline:(id)a3 withType:(unint64_t)a4
{
  if (a4 > 5)
    return 0;
  else
    return off_24D5A2FB8[a4];
}

- (id)activityTitleForHeadline:(id)a3 withType:(unint64_t)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  const __CFString *v9;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  _BOOL4 v13;
  void *v14;

  v6 = a3;
  switch(a4)
  {
    case 0uLL:
      v7 = -[NUArticleActivityManager articleLikedForHeadline:](self, "articleLikedForHeadline:", v6);
      NUBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        v9 = CFSTR("Undo Suggest More");
      else
        v9 = CFSTR("Suggest More");
      goto LABEL_18;
    case 1uLL:
      v10 = -[NUArticleActivityManager articleDislikedForHeadline:](self, "articleDislikedForHeadline:", v6);
      NUBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        v9 = CFSTR("Undo Suggest Less");
      else
        v9 = CFSTR("Suggest Less");
      goto LABEL_18;
    case 2uLL:
      v11 = -[NUArticleActivityManager channelMutedForHeadline:](self, "channelMutedForHeadline:", v6);
      NUBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        v9 = CFSTR("Unblock Channel");
      else
        v9 = CFSTR("Block Channel");
      goto LABEL_18;
    case 3uLL:
      NUBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v12;
      v9 = CFSTR("Open in Safari");
      goto LABEL_19;
    case 4uLL:
      NUBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v12;
      v9 = CFSTR("Report a Concern");
      goto LABEL_19;
    case 5uLL:
      v13 = -[NUArticleActivityManager articleSavedForHeadline:](self, "articleSavedForHeadline:", v6);
      NUBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        v9 = CFSTR("Unsave");
      else
        v9 = CFSTR("Save");
LABEL_18:
      v12 = v8;
LABEL_19:
      objc_msgSend(v12, "localizedStringForKey:value:table:", v9, &stru_24D5A3F98, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v14 = 0;
      break;
  }

  return v14;
}

- (id)activityImageForHeadline:(id)a3 withType:(unint64_t)a4
{
  id v6;
  const __CFString *v7;
  _BOOL4 v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = CFSTR("safari");
  switch(a4)
  {
    case 0uLL:
      v8 = -[NUArticleActivityManager articleLikedForHeadline:](self, "articleLikedForHeadline:", v6);
      v9 = CFSTR("hand.thumbsup");
      v10 = CFSTR("hand.thumbsup.fill");
      goto LABEL_8;
    case 1uLL:
      v8 = -[NUArticleActivityManager articleDislikedForHeadline:](self, "articleDislikedForHeadline:", v6);
      v9 = CFSTR("hand.thumbsdown");
      v10 = CFSTR("hand.thumbsdown.fill");
      goto LABEL_8;
    case 2uLL:
      v8 = -[NUArticleActivityManager channelMutedForHeadline:](self, "channelMutedForHeadline:", v6);
      v9 = CFSTR("hand.raised");
      v10 = CFSTR("hand.raised.slash.fill");
      goto LABEL_8;
    case 3uLL:
      goto LABEL_11;
    case 4uLL:
      v7 = CFSTR("exclamationmark.bubble");
      goto LABEL_11;
    case 5uLL:
      v8 = -[NUArticleActivityManager articleSavedForHeadline:](self, "articleSavedForHeadline:", v6);
      v9 = CFSTR("bookmark");
      v10 = CFSTR("bookmark.fill");
LABEL_8:
      if (v8)
        v7 = v10;
      else
        v7 = v9;
LABEL_11:
      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "imageWithTintColor:renderingMode:", v13, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v11 = 0;
      break;
  }

  return v11;
}

- (id)performBlockForHeadline:(id)a3 withType:(unint64_t)a4
{
  id v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  switch(a4)
  {
    case 0uLL:
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke;
      v24[3] = &unk_24D5A2F08;
      v7 = &v26;
      objc_copyWeak(&v26, &location);
      v25 = v6;
      v8 = (void *)MEMORY[0x2199FC190](v24);
      v9 = v25;
      goto LABEL_9;
    case 1uLL:
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke_2;
      v21[3] = &unk_24D5A2F08;
      v7 = &v23;
      objc_copyWeak(&v23, &location);
      v22 = v6;
      v8 = (void *)MEMORY[0x2199FC190](v21);
      v9 = v22;
      goto LABEL_9;
    case 2uLL:
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke_4;
      v15[3] = &unk_24D5A2F08;
      v7 = &v17;
      objc_copyWeak(&v17, &location);
      v16 = v6;
      v8 = (void *)MEMORY[0x2199FC190](v15);
      v9 = v16;
      goto LABEL_9;
    case 3uLL:
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke_5;
      v14[3] = &unk_24D5A2F70;
      v14[4] = self;
      v8 = (void *)MEMORY[0x2199FC190](v14);
      break;
    case 4uLL:
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke_7;
      v12[3] = &unk_24D5A2F98;
      v12[4] = self;
      v13 = v6;
      v8 = (void *)MEMORY[0x2199FC190](v12);

      break;
    case 5uLL:
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke_3;
      v18[3] = &unk_24D5A2F08;
      v7 = &v20;
      objc_copyWeak(&v20, &location);
      v19 = v6;
      v8 = (void *)MEMORY[0x2199FC190](v18);
      v9 = v19;
LABEL_9:

      objc_destroyWeak(v7);
      break;
    default:
      v8 = 0;
      break;
  }
  v10 = (void *)MEMORY[0x2199FC190](v8);

  objc_destroyWeak(&location);
  return v10;
}

void __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "toggleArticleLikeStatusForHeadline:", *(_QWORD *)(a1 + 32));

}

void __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "toggleArticleDislikeStatusForHeadline:", *(_QWORD *)(a1 + 32));

}

void __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "toggleSaveForHeadline:", *(_QWORD *)(a1 + 32));

}

void __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "toggleMuteForHeadline:", *(_QWORD *)(a1 + 32));

}

void __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "fc_firstObjectPassingTest:", &__block_literal_global_11);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "URLHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "openURL:options:completion:", v4, 0, 0);

  }
}

uint64_t __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke_7(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "reportConcernViewPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "reportConcernViewPresenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentReportConcernViewForHeadline:", *(_QWORD *)(a1 + 40));

  }
}

- (void)toggleArticleLikeStatusForHeadline:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NUArticleActivityManager readingHistory](self, "readingHistory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "articleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "toggleLikeForArticleWithID:", v5);
}

- (void)toggleArticleDislikeStatusForHeadline:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NUArticleActivityManager readingHistory](self, "readingHistory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "articleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "toggleDislikeForArticleWithID:", v5);
}

- (void)toggleSaveForHeadline:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = -[NUArticleActivityManager articleSavedForHeadline:](self, "articleSavedForHeadline:", v4);
  -[NUArticleActivityManager readingList](self, "readingList");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "articleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v7, "removeArticleFromReadingList:", v6);
  else
    objc_msgSend(v7, "addArticleToReadingList:eventInitiationLevel:origin:", v6, 0, 1);

}

- (void)toggleMuteForHeadline:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[NUArticleActivityManager headline](self, "headline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceChannel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = -[NUArticleActivityManager channelMutedForHeadline:](self, "channelMutedForHeadline:", v4);
  -[NUArticleActivityManager subscriptionList](self, "subscriptionList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((_DWORD)v5)
    objc_msgSend(v7, "removeSubscriptionForTagID:type:", v9, 2);
  else
    objc_msgSend(v7, "addSubscriptionForTagID:type:", v9, 2);

}

- (BOOL)articleLikedForHeadline:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NUArticleActivityManager readingHistory](self, "readingHistory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "articleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "likingStatusForArticleID:", v6) == 1;
  return (char)v4;
}

- (BOOL)articleDislikedForHeadline:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NUArticleActivityManager readingHistory](self, "readingHistory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "articleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "likingStatusForArticleID:", v6) == 2;
  return (char)v4;
}

- (BOOL)articleSavedForHeadline:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NUArticleActivityManager readingList](self, "readingList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "articleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isArticleOnReadingList:", v6);
  return (char)v4;
}

- (BOOL)channelMutedForHeadline:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[NUArticleActivityManager subscriptionList](self, "subscriptionList", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleActivityManager headline](self, "headline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceChannel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "hasMutedSubscriptionForTagID:", v7);

  return v8;
}

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (FCReadingHistory)readingHistory
{
  return self->_readingHistory;
}

- (FCReadingList)readingList
{
  return self->_readingList;
}

- (FCSubscriptionList)subscriptionList
{
  return self->_subscriptionList;
}

- (NUURLHandling)URLHandler
{
  return self->_URLHandler;
}

- (NUReportConcernViewPresenter)reportConcernViewPresenter
{
  return self->_reportConcernViewPresenter;
}

- (NUURLModifying)URLModifier
{
  return self->_URLModifier;
}

- (NUArticleActivityOptionsProvider)optionsProvider
{
  return self->_optionsProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsProvider, 0);
  objc_storeStrong((id *)&self->_URLModifier, 0);
  objc_storeStrong((id *)&self->_reportConcernViewPresenter, 0);
  objc_storeStrong((id *)&self->_URLHandler, 0);
  objc_storeStrong((id *)&self->_subscriptionList, 0);
  objc_storeStrong((id *)&self->_readingList, 0);
  objc_storeStrong((id *)&self->_readingHistory, 0);
  objc_storeStrong((id *)&self->_headline, 0);
}

@end
