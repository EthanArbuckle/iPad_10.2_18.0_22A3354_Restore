@implementation FBABugFormDiffableDataSource

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDiffableDataSource snapshot](self, "snapshot", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sectionIdentifiers"));
  v8 = objc_msgSend(v7, "indexOfObject:", CFSTR("TeamPicker"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDiffableDataSource snapshot](self, "snapshot"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sectionIdentifiers"));
  v11 = objc_msgSend(v10, "indexOfObject:", CFSTR("FormPicker"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDiffableDataSource snapshot](self, "snapshot"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sectionIdentifiers"));
  v14 = objc_msgSend(v13, "indexOfObject:", CFSTR("DeviceAttachmentsSectionType"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDiffableDataSource snapshot](self, "snapshot"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sectionIdentifiers"));
  v17 = objc_msgSend(v16, "indexOfObject:", CFSTR("AddAttachments"));

  if (v8 == (id)a4)
    goto LABEL_2;
  if (v11 == (id)a4)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = v19;
    v21 = FBKCommonStrings;
    v22 = CFSTR("FORM_PICKER_SECTION_HEADER");
LABEL_7:
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", v22, &stru_1000EA660, v21));
    goto LABEL_8;
  }
  if (v14 == (id)a4)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = v19;
    v21 = FBKCommonStrings;
    v22 = CFSTR("DEVICES_AND_ATTACHMENTS_SECTION_HEADER");
    goto LABEL_7;
  }
  if (v17 != (id)a4)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDiffableDataSource thisViewController](self, "thisViewController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "questionGroupForSection:", a4));

    if (!v20)
    {
      v18 = 0;
      goto LABEL_9;
    }
    if (FBKIsInternalInstall())
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v27 = objc_msgSend(v26, "BOOLForKey:", FBKShowSortOrderForDebugging);

      if (v27)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "title"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "sortOrder"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringValue"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v28, v30));

        goto LABEL_9;
      }
    }
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "title"));
LABEL_8:
    v18 = (void *)v23;
LABEL_9:

    return v18;
  }
LABEL_2:
  v18 = 0;
  return v18;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDiffableDataSource snapshot](self, "snapshot", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sectionIdentifiers"));
  v7 = objc_msgSend(v6, "indexOfObject:", CFSTR("DeviceAttachmentsSectionType"));

  if (v7 == (id)a4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SHORT_SUBMISSION_PII_MESSAGE"), &stru_1000EA660, 0));

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormDiffableDataSource thisViewController](self, "thisViewController"));
  v9 = objc_msgSend(v8, "_tableView:canEditRowAtIndexPath:", v7, v6);

  return v9;
}

- (void)applySnapshot:(id)a3 animatingDifferences:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FBABugFormDiffableDataSource;
  -[FBABugFormDiffableDataSource applySnapshot:animatingDifferences:](&v5, "applySnapshot:animatingDifferences:", a3, a4);
  -[FBABugFormDiffableDataSource set_attachmentSectionHeaderCached:](self, "set_attachmentSectionHeaderCached:", 0);
}

- (FBABugFormTableViewController)thisViewController
{
  return (FBABugFormTableViewController *)objc_loadWeakRetained((id *)&self->_thisViewController);
}

- (void)setThisViewController:(id)a3
{
  objc_storeWeak((id *)&self->_thisViewController, a3);
}

- (NSString)_attachmentSectionHeaderCached
{
  return self->__attachmentSectionHeaderCached;
}

- (void)set_attachmentSectionHeaderCached:(id)a3
{
  objc_storeStrong((id *)&self->__attachmentSectionHeaderCached, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__attachmentSectionHeaderCached, 0);
  objc_destroyWeak((id *)&self->_thisViewController);
}

@end
