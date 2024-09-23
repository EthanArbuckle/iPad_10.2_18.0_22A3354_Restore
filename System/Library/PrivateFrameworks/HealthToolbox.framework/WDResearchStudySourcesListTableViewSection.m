@implementation WDResearchStudySourcesListTableViewSection

- (void)dataSourceDidUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[WDSourcesListTableViewSection dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedResearchStudySources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDResearchStudySourcesListTableViewSection setResearchSources:](self, "setResearchSources:", v5);

  -[WDTableViewSection delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadTable");

  -[WDSourcesListTableViewSection restorationSourceBundleIdentifier](self, "restorationSourceBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[WDResearchStudySourcesListTableViewSection researchSources](self, "researchSources", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v13, "source");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "bundleIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v7);

          if (v16)
          {
            -[WDTableViewSection delegate](self, "delegate");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[WDSourcesListTableViewSection detailViewControllerForSourceModel:](self, "detailViewControllerForSourceModel:", v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "pushViewController:", v18);

            goto LABEL_12;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_12:

    -[WDSourcesListTableViewSection setRestorationSourceBundleIdentifier:](self, "setRestorationSourceBundleIdentifier:", 0);
  }

}

- (unint64_t)numberOfRows
{
  void *v2;
  unint64_t v3;

  -[WDResearchStudySourcesListTableViewSection researchSources](self, "researchSources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3 <= 1)
    return 1;
  else
    return v3;
}

- (id)titleForHeader
{
  void *v2;
  void *v3;

  WDBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("RESEARCH_STUDIES_LIST_HEADER"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)titleForFooter
{
  void *v2;
  void *v3;

  WDBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("RESEARCH_STUDIES_LIST_EXPLANATION"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)noneString
{
  void *v2;
  void *v3;

  WDBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("RESEARCH_STUDIES_NONE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
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
  void *v12;

  v6 = a4;
  if (a3
    || (-[WDResearchStudySourcesListTableViewSection researchSources](self, "researchSources"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    -[WDResearchStudySourcesListTableViewSection researchSources](self, "researchSources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
      -[WDResearchStudySourcesListTableViewSection _sourceCellForRow:tableView:](self, "_sourceCellForRow:tableView:", a3, v6);
    else
      -[WDSourcesListTableViewSection noneCellForTableView:](self, "noneCellForTableView:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[WDSpinnerTableViewCell defaultReuseIdentifier](WDSpinnerTableViewCell, "defaultReuseIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_sourceCellForRow:(unint64_t)a3 tableView:(id)a4
{
  WDSourcesListTableViewCell *v6;
  void *v7;
  void *v8;

  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("WDResearchStudySourcesListTableViewSectionCell"));
  v6 = (WDSourcesListTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = -[WDSourcesListTableViewCell initWithStyle:reuseIdentifier:]([WDSourcesListTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("WDResearchStudySourcesListTableViewSectionCell"));
    -[WDSourcesListTableViewCell setAccessoryType:](v6, "setAccessoryType:", 1);
  }
  -[WDResearchStudySourcesListTableViewSection researchSources](self, "researchSources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSourcesListTableViewCell setSourceModel:](v6, "setSourceModel:", v8);

  return v6;
}

- (void)didSelectRow:(unint64_t)a3 representedByCell:(id)a4 withCompletion:(id)a5
{
  void (**v8)(id, uint64_t, _QWORD);
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a4;
  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  if (a3
    || (-[WDResearchStudySourcesListTableViewSection researchSources](self, "researchSources"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    -[WDResearchStudySourcesListTableViewSection researchSources](self, "researchSources");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      -[WDTableViewSection delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDResearchStudySourcesListTableViewSection researchSources](self, "researchSources");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDSourcesListTableViewSection detailViewControllerForSourceModel:](self, "detailViewControllerForSourceModel:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pushViewController:", v15);

    }
    v16 = 1;
  }
  else
  {
    v16 = 0;
  }
  v8[2](v8, v16, 0);

}

- (NSArray)researchSources
{
  return self->_researchSources;
}

- (void)setResearchSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_researchSources, 0);
}

@end
