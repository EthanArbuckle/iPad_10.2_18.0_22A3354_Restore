@implementation WhiteTabsTestRunner

- (WhiteTabsTestRunner)init
{
  WhiteTabsTestRunner *v2;
  WhiteTabsTestRunner *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WhiteTabsTestRunner;
  v2 = -[WhiteTabsTestRunner init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PageLoadTestRunner setFailFast:](v2, "setFailFast:", 0);
  return v3;
}

- (void)collectPPTResults
{
  unint64_t runCount;
  double v3;

  runCount = self->_runCount;
  if (runCount)
    v3 = (float)((float)self->_totalLiveTabs / (float)runCount);
  else
    v3 = 0.0;
  -[PurplePageLoadTestRunner pptResultFor:measure:value:units:](self, "pptResultFor:measure:value:units:", CFSTR("Summary"), CFSTR("Average live tabs"), CFSTR("tabs"), v3);
}

- (void)finishedTestPage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  int v14;
  unint64_t runCount;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PageLoadTestRunner browserController](self, "browserController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tabController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "tabDocuments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    LODWORD(v10) = 0;
    LODWORD(v11) = 0;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v7);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "isAlive");
        v10 = (v10 + v14);
        v11 = v11 + (v14 ^ 1);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  if (objc_msgSend(v7, "count") == 36)
  {
    ++self->_runCount;
    self->_totalHibernatedTabs += (int)v11;
    self->_totalLiveTabs += (int)v10;
  }
  runCount = self->_runCount;
  if (runCount)
    v16 = (float)((float)self->_totalLiveTabs / (float)runCount);
  else
    v16 = 0.0;
  -[PageLoadTestRunner log:](self, "log:", CFSTR("Total tabs = %2d livetabs = %2d hibernatedTabs = %2d Run count = %4d Avg number of live tabs = %2.2f - Finished loading page %@"), objc_msgSend(v7, "count"), v10, v11, self->_runCount, *(_QWORD *)&v16, v4);

}

@end
