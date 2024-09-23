@implementation EKEventURLDetailItem

- (void)reset
{
  UITableViewCell *cell;

  cell = self->_cell;
  self->_cell = 0;

}

+ (Class)_SGSuggestionsServiceClass
{
  return (Class)EKWeakLinkClass();
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  BOOL v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSURL *v9;
  NSURL *url;
  void *v11;
  void *v12;
  void *v13;
  NSURL *v14;
  void *v15;
  void *v16;
  void *v17;
  NSURL *v18;
  void *v19;
  void *v21;
  EKEvent *event;
  NSObject *v23;
  void *v24;
  void *v25;
  SGSuggestedEventLaunchInfo *v26;
  id v27;
  SGSuggestedEventLaunchInfo *launchInfo;
  SGSuggestedEventLaunchInfo *v29;
  NSObject *v30;
  _QWORD v31[5];
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if ((-[EKEvent isBirthday](self->super._event, "isBirthday", a3, a4) & 1) != 0)
    return 0;
  -[EKEvent URL](self->super._event, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[EKEvent URL](self->super._event, "URL");
    v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
    url = self->_url;
    self->_url = v9;

  }
  if (!objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessIsFirstPartyCalendarApp"))
    return self->_url != 0;
  -[EKEvent suggestionInfo](self->super._event, "suggestionInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    return self->_url != 0;
  -[EKEvent suggestionInfo](self->super._event, "suggestionInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniqueKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v21 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      event = self->super._event;
      v23 = v21;
      -[EKEvent calendarItemExternalIdentifier](event, "calendarItemExternalIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent suggestionInfo](self->super._event, "suggestionInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v24;
      v35 = 2112;
      v36 = v25;
      _os_log_impl(&dword_1AF84D000, v23, OS_LOG_TYPE_ERROR, "We found an event with suggestionInfo but no unique key [id: %{public}@ suggestionInfo:%@]", buf, 0x16u);

    }
    return 0;
  }
  v14 = self->_url;
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent suggestionInfo](self->super._event, "suggestionInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "uniqueKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = self->_url;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __54__EKEventURLDetailItem_configureWithCalendar_preview___block_invoke;
    v31[3] = &unk_1E6018FA0;
    v31[4] = self;
    objc_msgSend(v15, "launchInfoForSuggestedEventWithUniqueIdentifier:sourceURL:clientLocale:withCompletion:", v17, v18, v19, v31);

    return 1;
  }
  else
  {
    v32 = 0;
    objc_msgSend(v15, "launchInfoForSuggestedEventWithUniqueIdentifier:sourceURL:clientLocale:error:", v17, v18, v19, &v32);
    v26 = (SGSuggestedEventLaunchInfo *)objc_claimAutoreleasedReturnValue();
    v27 = v32;
    launchInfo = self->_launchInfo;
    self->_launchInfo = v26;

    v29 = self->_launchInfo;
    v5 = v29 != 0;
    if (!v29)
    {
      v30 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v27;
        _os_log_impl(&dword_1AF84D000, v30, OS_LOG_TYPE_ERROR, "Could not find synchronous launch info for suggested event: %@", buf, 0xCu);
      }
    }

  }
  return v5;
}

void __54__EKEventURLDetailItem_configureWithCalendar_preview___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__EKEventURLDetailItem_configureWithCalendar_preview___block_invoke_2;
  block[3] = &unk_1E6018660;
  v10 = v5;
  v11 = v6;
  v12 = *(_QWORD *)(a1 + 32);
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __54__EKEventURLDetailItem_configureWithCalendar_preview___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 88), v2);
    objc_msgSend(*(id *)(a1 + 48), "_updateWithChanges");
  }
  else
  {
    v3 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1AF84D000, v3, OS_LOG_TYPE_ERROR, "Could not find async launch info for suggested event: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_updateWithChanges
{
  id v3;

  -[EKEventURLDetailItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateWithURL:launchInfo:", self->_url, self->_launchInfo);

}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  UITableViewCell *cell;
  id v8;
  double v9;

  cell = self->_cell;
  if (cell)
  {
    if (a5)
    {
      -[UITableViewCell update](self->_cell, "update", a3);
      cell = self->_cell;
    }
    -[UITableViewCell layoutForWidth:position:](cell, "layoutForWidth:position:", -[EKEventDetailItem cellPosition](self, "cellPosition", a3), a4);
  }
  else
  {
    v8 = -[EKEventURLDetailItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", a3, a5, a4);
  }
  -[UITableViewCell bounds](self->_cell, "bounds");
  return v9;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  UITableViewCell *cell;
  EKEventDetailURLCell *v5;
  UITableViewCell *v6;
  UITableViewCell *v7;
  double v8;
  NSObject *v10;
  uint8_t v11[16];

  cell = self->_cell;
  if (!cell)
  {
    if (self->_launchInfo)
    {
      v5 = -[EKEventDetailURLCell initWithEvent:launchInfo:editable:style:]([EKEventDetailURLCell alloc], "initWithEvent:launchInfo:editable:style:", self->super._event, self->_launchInfo, 0, 0);
    }
    else
    {
      if (!self->_url)
      {
        v10 = kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_1AF84D000, v10, OS_LOG_TYPE_ERROR, "We are displaying a cell with no launchInfo and no url. This should not be possible.", v11, 2u);
        }
        goto LABEL_7;
      }
      v5 = -[EKEventDetailURLCell initWithEvent:url:editable:style:]([EKEventDetailURLCell alloc], "initWithEvent:url:editable:style:", self->super._event, self->_url, 0, 0);
    }
    v6 = self->_cell;
    self->_cell = &v5->super.super.super;

LABEL_7:
    -[UITableViewCell update](self->_cell, "update");
    v7 = self->_cell;
    -[UITableViewCell frame](v7, "frame");
    -[UITableViewCell layoutForWidth:position:](v7, "layoutForWidth:position:", -[EKEventDetailItem cellPosition](self, "cellPosition"), v8);
    cell = self->_cell;
  }
  return cell;
}

- (BOOL)hasDetailViewControllerAtIndex:(unint64_t)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_launchInfo, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
