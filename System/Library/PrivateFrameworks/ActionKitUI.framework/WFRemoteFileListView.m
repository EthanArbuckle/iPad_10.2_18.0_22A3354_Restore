@implementation WFRemoteFileListView

- (WFRemoteFileListView)initWithFrame:(CGRect)a3 collation:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  WFRemoteFileListView *v11;
  id v12;
  uint64_t v13;
  UITableView *tableView;
  uint64_t v15;
  NSDictionary *filesBySection;
  NSDateFormatter *v17;
  NSDateFormatter *dateFormatter;
  WFRemoteFileListView *v19;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WFRemoteFileListView;
  v11 = -[WFRemoteFileListView initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x24BEBD9F0]);
    -[WFRemoteFileListView bounds](v11, "bounds");
    v13 = objc_msgSend(v12, "initWithFrame:style:", 0);
    tableView = v11->_tableView;
    v11->_tableView = (UITableView *)v13;

    -[UITableView setAutoresizingMask:](v11->_tableView, "setAutoresizingMask:", 18);
    -[UITableView setDelegate:](v11->_tableView, "setDelegate:", v11);
    -[UITableView setDataSource:](v11->_tableView, "setDataSource:", v11);
    -[UITableView setRowHeight:](v11->_tableView, "setRowHeight:", *MEMORY[0x24BEBE770]);
    -[UITableView setEstimatedRowHeight:](v11->_tableView, "setEstimatedRowHeight:", 44.0);
    -[WFRemoteFileListView addSubview:](v11, "addSubview:", v11->_tableView);
    -[UITableView registerClass:forCellReuseIdentifier:](v11->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("WFRemoteFileCellReuseIdentifier"));
    objc_storeStrong((id *)&v11->_collation, a4);
    v15 = objc_opt_new();
    filesBySection = v11->_filesBySection;
    v11->_filesBySection = (NSDictionary *)v15;

    v17 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    dateFormatter = v11->_dateFormatter;
    v11->_dateFormatter = v17;

    -[NSDateFormatter setDateStyle:](v11->_dateFormatter, "setDateStyle:", 1);
    -[NSDateFormatter setTimeStyle:](v11->_dateFormatter, "setTimeStyle:", 1);
    -[NSDateFormatter setDoesRelativeDateFormatting:](v11->_dateFormatter, "setDoesRelativeDateFormatting:", 1);
    v19 = v11;
  }

  return v11;
}

- (UIEdgeInsets)contentInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[UITableView contentInset](self->_tableView, "contentInset");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  -[UITableView setContentInset:](self->_tableView, "setContentInset:", a3.top, a3.left, a3.bottom, a3.right);
}

- (UIEdgeInsets)verticalScrollIndicatorInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[UITableView verticalScrollIndicatorInsets](self->_tableView, "verticalScrollIndicatorInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setVerticalScrollIndicatorInsets:(UIEdgeInsets)a3
{
  -[UITableView setVerticalScrollIndicatorInsets:](self->_tableView, "setVerticalScrollIndicatorInsets:", a3.top, a3.left, a3.bottom, a3.right);
}

- (void)setFiles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  WFRemoteFileListView *v26;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  void *v39;
  _QWORD v40[3];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFRemoteFileListView collation](self, "collation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v26 = self;
    v6 = (void *)objc_opt_new();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v27 = v4;
    obj = v4;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v34 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          v12 = objc_msgSend(v5, "sectionForObject:collationStringSelector:", v11, sel_wfName);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            v14 = (void *)objc_opt_new();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v15);

          }
          objc_msgSend(v14, "addObject:", v11);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v8);
    }

    v16 = (void *)objc_opt_new();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v17 = v6;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v30 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
          objc_msgSend(v17, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "sortedArrayFromArray:collationStringSelector:", v23, sel_wfName);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v24, v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v19);
    }

    -[WFRemoteFileListView setFilesBySection:](v26, "setFilesBySection:", v16);
    v4 = v27;
  }
  else if (v4)
  {
    v39 = &unk_24E3550C0;
    v40[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRemoteFileListView setFilesBySection:](self, "setFilesBySection:", v25);

  }
  else
  {
    -[WFRemoteFileListView setFilesBySection:](self, "setFilesBySection:", 0);
  }

}

- (void)updateCheckmarkForFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[WFRemoteFileListView tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForVisibleRows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[WFRemoteFileListView filesBySection](self, "filesBySection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v11, "section"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v11, "row"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v4, "isEqual:", v15))
        {
          -[WFRemoteFileListView tableView](self, "tableView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "cellForRowAtIndexPath:", v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          -[WFRemoteFileListView delegate](self, "delegate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "fileListView:shouldDisplayCheckmarkForFile:", self, v15);

          -[WFRemoteFileListView dateFormatter](self, "dateFormatter");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setFile:checked:dateFormatter:", v15, v19, v20);

          goto LABEL_11;
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

}

- (CGRect)frameOfCellAtPoint:(CGPoint)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  -[WFRemoteFileListView cellAtPoint:](self, "cellAtPoint:", a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[WFRemoteFileListView tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteFileListView convertRect:fromView:](self, "convertRect:fromView:", v13, v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (id)cellAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;

  y = a3.y;
  x = a3.x;
  -[WFRemoteFileListView tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:fromView:", self, x, y);
  objc_msgSend(v6, "indexPathForRowAtPoint:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fileAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  y = a3.y;
  x = a3.x;
  -[WFRemoteFileListView tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:fromView:", self, x, y);
  objc_msgSend(v6, "indexPathForRowAtPoint:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[WFRemoteFileListView filesBySection](self, "filesBySection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "section"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setFilesBySection:(id)a3
{
  NSDictionary *filesBySection;
  id v5;
  NSDictionary *v6;
  NSDictionary *v7;
  id v8;

  filesBySection = self->_filesBySection;
  v5 = a3;
  LOBYTE(filesBySection) = -[NSDictionary isEqualToDictionary:](filesBySection, "isEqualToDictionary:", v5);
  v6 = (NSDictionary *)objc_msgSend(v5, "copy");

  v7 = self->_filesBySection;
  self->_filesBySection = v6;

  if ((filesBySection & 1) == 0)
  {
    -[WFRemoteFileListView tableView](self, "tableView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadData");

  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("WFRemoteFileCellReuseIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteFileListView filesBySection](self, "filesBySection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "row");

  objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFRemoteFileListView delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fileListView:shouldDisplayCheckmarkForFile:", self, v12);

  -[WFRemoteFileListView dateFormatter](self, "dateFormatter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFile:checked:dateFormatter:", v12, v14, v15);

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[WFRemoteFileListView filesBySection](self, "filesBySection", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKeyPath:", CFSTR("@max.self"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue") + 1;

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[WFRemoteFileListView filesBySection](self, "filesBySection", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  -[WFRemoteFileListView filesBySection](self, "filesBySection", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[WFRemoteFileListView collation](self, "collation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sectionTitles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  void *v3;
  void *v4;

  -[WFRemoteFileListView collation](self, "collation", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionTitles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  int64_t v10;

  if (!a5)
  {
    v7 = a3;
    objc_msgSend(v7, "tableHeaderView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    objc_msgSend(v7, "scrollRectToVisible:animated:", 0);

  }
  -[WFRemoteFileListView collation](self, "collation", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "sectionForSectionIndexTitleAtIndex:", a5) - 1;

  return v10;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a4;
  -[WFRemoteFileListView filesBySection](self, "filesBySection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "row");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFRemoteFileListView delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v11, "fileListView:shouldSelectFile:", self, v10);

  return (char)self;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[WFRemoteFileListView filesBySection](self, "filesBySection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
  -[WFRemoteFileListView delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fileListView:didSelectFile:", self, v12);

}

- (WFRemoteFileListViewDelegate)delegate
{
  return (WFRemoteFileListViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (UILocalizedIndexedCollation)collation
{
  return self->_collation;
}

- (NSDictionary)filesBySection
{
  return self->_filesBySection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filesBySection, 0);
  objc_storeStrong((id *)&self->_collation, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
