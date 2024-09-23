@implementation WDAppSourcesListTableViewSection

- (void)dataSourceDidUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  -[WDSourcesListTableViewSection dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedUninstalledAppSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAppSourcesListTableViewSection setUninstalledSourcesExist:](self, "setUninstalledSourcesExist:", objc_msgSend(v5, "count") != 0);

  -[WDSourcesListTableViewSection dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "orderedAppSources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDTableViewSection delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentationContext");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v11 == CFSTR("SettingsPrivacy"))
  {
    -[WDSourcesListTableViewSection dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchFilteredSourcesWithAuthorizationRecordsForSources:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAppSourcesListTableViewSection setInstalledSources:](self, "setInstalledSources:", v13);

  }
  else
  {
    -[WDAppSourcesListTableViewSection setInstalledSources:](self, "setInstalledSources:", v8);
  }
  -[WDTableViewSection delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "healthStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "profileIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "type");

  if (v18 == 3)
  {
    -[WDAppSourcesListTableViewSection installedSources](self, "installedSources");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDSourcesListTableViewSection dataSource](self, "dataSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sources");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "orderedUninstalledAppSources");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "sortedArrayUsingComparator:", &__block_literal_global_10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAppSourcesListTableViewSection setInstalledSources:](self, "setInstalledSources:", v24);

    -[WDAppSourcesListTableViewSection setUninstalledSourcesExist:](self, "setUninstalledSourcesExist:", 0);
  }
  -[WDTableViewSection delegate](self, "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "reloadTable");

  -[WDSourcesListTableViewSection restorationSourceBundleIdentifier](self, "restorationSourceBundleIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v38 = v8;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[WDAppSourcesListTableViewSection installedSources](self, "installedSources");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v40 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v32, "source");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "bundleIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "isEqualToString:", v26);

          if (v35)
          {
            -[WDTableViewSection delegate](self, "delegate");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[WDSourcesListTableViewSection detailViewControllerForSourceModel:](self, "detailViewControllerForSourceModel:", v32);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "pushViewController:animated:", v37, 0);

            goto LABEL_17;
          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        if (v29)
          continue;
        break;
      }
    }
LABEL_17:

    -[WDSourcesListTableViewSection setRestorationSourceBundleIdentifier:](self, "setRestorationSourceBundleIdentifier:", 0);
    v8 = v38;
  }

}

uint64_t __55__WDAppSourcesListTableViewSection_dataSourceDidUpdate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "localizedStandardCompare:", v8);

  return v9;
}

- (unint64_t)numberOfRows
{
  void *v3;
  uint64_t v4;

  -[WDAppSourcesListTableViewSection installedSources](self, "installedSources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    return v4 + -[WDAppSourcesListTableViewSection uninstalledSourcesExist](self, "uninstalledSourcesExist");
  else
    return 1;
}

- (id)titleForHeader
{
  __CFString *v2;
  void *v3;

  if (-[WDSourcesListTableViewSection shouldHideHeader](self, "shouldHideHeader"))
  {
    v2 = &stru_24D38E7C8;
  }
  else
  {
    WDBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("APPS_LIST_HEADER"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)titleForFooter
{
  void *v2;
  void *v3;

  WDBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("APPS_LIST_EXPLANATION"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)noneString
{
  void *v2;
  void *v3;

  WDBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("APPS_NONE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cellForRow:(unint64_t)a3 table:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v15;

  v6 = a4;
  if (!a3)
  {
    -[WDAppSourcesListTableViewSection installedSources](self, "installedSources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      +[WDSpinnerTableViewCell defaultReuseIdentifier](WDSpinnerTableViewCell, "defaultReuseIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
  }
  -[WDAppSourcesListTableViewSection installedSources](self, "installedSources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    if (!-[WDAppSourcesListTableViewSection uninstalledSourcesExist](self, "uninstalledSourcesExist"))
    {
      -[WDSourcesListTableViewSection noneCellForTableView:](self, "noneCellForTableView:", v6);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  -[WDAppSourcesListTableViewSection installedSources](self, "installedSources");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 == a3)
  {
LABEL_7:
    -[WDAppSourcesListTableViewSection _uninstalledSourcesCellWithTableView:](self, "_uninstalledSourcesCellWithTableView:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  -[WDAppSourcesListTableViewSection _sourceCellForRow:tableView:](self, "_sourceCellForRow:tableView:", a3, v6);
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v13 = (void *)v12;
LABEL_10:

  return v13;
}

- (id)_sourceCellForRow:(unint64_t)a3 tableView:(id)a4
{
  WDSourcesListTableViewCell *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("WDAppSourcesListTableViewSectionCell"));
  v6 = (WDSourcesListTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = -[WDSourcesListTableViewCell initWithStyle:reuseIdentifier:]([WDSourcesListTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("WDAppSourcesListTableViewSectionCell"));
    -[WDSourcesListTableViewCell setAccessoryType:](v6, "setAccessoryType:", 1);
  }
  -[WDAppSourcesListTableViewSection installedSources](self, "installedSources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSourcesListTableViewCell setSourceModel:](v6, "setSourceModel:", v8);

  objc_msgSend(MEMORY[0x24BDF6A70], "hk_preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSourcesListTableViewCell textLabel](v6, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v9);

  return v6;
}

- (id)_uninstalledSourcesCellWithTableView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("WDSourcesListTableViewSectionUninstalledSources"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("WDSourcesListTableViewSectionUninstalledSources"));
  objc_msgSend(v3, "setAccessoryType:", 1);
  WDBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("UNINSTALLED_APPS"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(MEMORY[0x24BDF6A70], "hk_preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  return v3;
}

- (void)didSelectRow:(unint64_t)a3 representedByCell:(id)a4 withCompletion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  WDUninstalledAppSourcesViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a4;
  v8 = a5;
  if (a3
    || (-[WDAppSourcesListTableViewSection installedSources](self, "installedSources"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    objc_msgSend(v25, "reuseIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("WDSourcesListTableViewSectionUninstalledSources"));

    if (v11)
    {
      v12 = objc_alloc_init(WDUninstalledAppSourcesViewController);
      -[WDTableViewSection delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "profile");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDUninstalledAppSourcesViewController setProfile:](v12, "setProfile:", v14);

      -[WDSourcesListTableViewSection dataSource](self, "dataSource");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDUninstalledAppSourcesViewController setDataSource:](v12, "setDataSource:", v15);

      WDBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("UNINSTALLED_APPS"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDUninstalledAppSourcesViewController setTitle:](v12, "setTitle:", v17);

      -[WDTableViewSection delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "pushViewController:", v12);

      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
    }
    else
    {
      -[WDAppSourcesListTableViewSection installedSources](self, "installedSources");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if (v20)
      {
        -[WDAppSourcesListTableViewSection installedSources](self, "installedSources");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", a3);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        -[WDTableViewSection delegate](self, "delegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDSourcesListTableViewSection detailViewControllerForSourceModel:](self, "detailViewControllerForSourceModel:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "pushViewController:", v24);

      }
      (*((void (**)(id, uint64_t, _QWORD))v8 + 2))(v8, 1, 0);
    }
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  }

}

- (NSArray)installedSources
{
  return self->_installedSources;
}

- (void)setInstalledSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)uninstalledSourcesExist
{
  return self->_uninstalledSourcesExist;
}

- (void)setUninstalledSourcesExist:(BOOL)a3
{
  self->_uninstalledSourcesExist = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedSources, 0);
}

@end
