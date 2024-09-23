@implementation FBKBugFormDiffableDataSource

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  uint64_t v27;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  -[UITableViewDiffableDataSource snapshot](self, "snapshot", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", CFSTR("TeamPicker"));

  -[UITableViewDiffableDataSource snapshot](self, "snapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indexOfObject:", CFSTR("FormPicker"));

  -[UITableViewDiffableDataSource snapshot](self, "snapshot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormDiffableDataSource thisViewController](self, "thisViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifierOfFirstDeviceSection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "indexOfObject:", v15);

  -[UITableViewDiffableDataSource snapshot](self, "snapshot");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sectionIdentifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "indexOfObject:", CFSTR("AddAttachments"));

  -[UITableViewDiffableDataSource snapshot](self, "snapshot");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sectionIdentifiers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "indexOfObject:", CFSTR("UserCell"));

  v23 = 0;
  if (v8 != a4 && v22 != a4)
  {
    if (v11 == a4)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      v26 = CFSTR("FORM_PICKER_SECTION_HEADER");
    }
    else
    {
      if (v16 != a4)
      {
        if (v19 == a4)
        {
          v23 = 0;
          return v23;
        }
        -[FBKBugFormDiffableDataSource thisViewController](self, "thisViewController");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "questionGroupForSection:", a4);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
          v23 = 0;
          goto LABEL_9;
        }
        if (FBKIsInternalInstall(v30, v31))
        {
          objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "BOOLForKey:", CFSTR("showSortOrderForDebugging"));

          if (v33)
          {
            v34 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v25, "title");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "sortOrder");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "stringValue");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "stringWithFormat:", CFSTR("%@ (%@)"), v35, v37);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_9;
          }
        }
        objc_msgSend(v25, "title");
        v27 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v23 = (void *)v27;
LABEL_9:

        return v23;
      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      v26 = CFSTR("DEVICES_AND_ATTACHMENTS_SECTION_HEADER");
    }
    objc_msgSend(v24, "localizedStringForKey:value:table:", v26, &stru_24E15EAF8, CFSTR("CommonStrings"));
    v27 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  return v23;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[FBKBugFormDiffableDataSource thisViewController](self, "thisViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_tableView:canEditRowAtIndexPath:", v7, v6);

  return v9;
}

- (void)applySnapshot:(id)a3 animatingDifferences:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FBKBugFormDiffableDataSource;
  -[UITableViewDiffableDataSource applySnapshot:animatingDifferences:](&v5, sel_applySnapshot_animatingDifferences_, a3, a4);
  -[FBKBugFormDiffableDataSource set_attachmentSectionHeaderCached:](self, "set_attachmentSectionHeaderCached:", 0);
}

- (FBKBugFormTableViewController)thisViewController
{
  return (FBKBugFormTableViewController *)objc_loadWeakRetained((id *)&self->_thisViewController);
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
