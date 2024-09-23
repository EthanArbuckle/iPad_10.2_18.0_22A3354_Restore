@implementation CertInfoCertificateDetailsView

- (void)appendInfoFromCertView:(id)a3
{
  id v4;
  NSMutableArray *tableSections;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = *((id *)a3 + 53);
    if (v4)
    {
      tableSections = self->_tableSections;
      v7 = v4;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](tableSections, "addObject:", v6);

      -[NSMutableArray addObjectsFromArray:](self->_tableSections, "addObjectsFromArray:", v7);
    }
  }
}

- (id)_cellInfosForSection:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKey:", CFSTR("localized label"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("type"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("value"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("section")))
        {
          -[CertInfoCertificateDetailsView _cellInfosForSection:](self, "_cellInfosForSection:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v13);
        }
        else
        {
          if ((objc_msgSend(v11, "isEqualToString:", CFSTR("string")) & 1) != 0
            || objc_msgSend(v11, "isEqualToString:", CFSTR("url")))
          {
            v14 = v12;
          }
          else
          {
            objc_msgSend(v12, "description");
            v14 = (id)objc_claimAutoreleasedReturnValue();
          }
          v13 = v14;
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v10, CFSTR("cell title"), v14, CFSTR("cell value"), 0);
          objc_msgSend(v4, "addObject:", v15);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)_sectionInfoForCertSection:(id)a3 title:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  -[CertInfoCertificateDetailsView _cellInfosForSection:](self, "_cellInfosForSection:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v8, CFSTR("cell infos"), v7, CFSTR("header title"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_sectionsFromProperties:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CertInfoCertificateDetailsView *v15;
  id v16;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v15 = self;
  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKey:", CFSTR("localized label"), v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("type"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("value"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("section")))
        {
          -[CertInfoCertificateDetailsView _sectionInfoForCertSection:title:](v15, "_sectionInfoForCertSection:title:", v11, v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v12);

        }
        else
        {
          objc_msgSend(v16, "addObject:", v8);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v16, "count"))
  {
    -[CertInfoCertificateDetailsView _sectionInfoForCertSection:title:](v15, "_sectionInfoForCertSection:title:", v16, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v13);

  }
  return v17;
}

- (CertInfoCertificateDetailsView)initWithFrame:(CGRect)a3 certificateProperties:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CertInfoCertificateDetailsView *v10;
  CertInfoCertificateDetailsView *v11;
  void *v12;
  uint64_t v13;
  NSMutableArray *tableSections;
  uint64_t v15;
  UITableView *tableView;
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CertInfoCertificateDetailsView;
  v10 = -[CertInfoCertificateDetailsView initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[CertInfoCertificateDetailsView _sectionsFromProperties:](v10, "_sectionsFromProperties:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "mutableCopy");
    tableSections = v11->_tableSections;
    v11->_tableSections = (NSMutableArray *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E58]), "initWithFrame:style:", 1, x, y, width, height);
    tableView = v11->_tableView;
    v11->_tableView = (UITableView *)v15;

    -[UITableView setAllowsSelection:](v11->_tableView, "setAllowsSelection:", 0);
    -[UITableView setDataSource:](v11->_tableView, "setDataSource:", v11);
    -[CertInfoCertificateDetailsView addSubview:](v11, "addSubview:", v11->_tableView);
  }

  return v11;
}

- (void)layoutSubviews
{
  -[CertInfoCertificateDetailsView bounds](self, "bounds");
  -[UITableView setFrame:](self->_tableView, "setFrame:");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  int64_t v8;

  if (-[NSMutableArray count](self->_tableSections, "count", a3) <= (unint64_t)a4)
    return 0;
  -[NSMutableArray objectAtIndex:](self->_tableSections, "objectAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("cell infos"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (id)_titleForIndexPath:(id)a3
{
  NSMutableArray *tableSections;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  tableSections = self->_tableSections;
  v4 = a3;
  -[NSMutableArray objectAtIndex:](tableSections, "objectAtIndex:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("cell infos"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "row");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("cell title"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_detailForIndexPath:(id)a3
{
  NSMutableArray *tableSections;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  tableSections = self->_tableSections;
  v4 = a3;
  -[NSMutableArray objectAtIndex:](tableSections, "objectAtIndex:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("cell infos"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "row");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("cell value"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 >= -[NSMutableArray count](self->_tableSections, "count"))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("CertificateTableCellReuseIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, CFSTR("CertificateTableCellReuseIdentifier"));
    objc_msgSend(v9, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertInfoCertificateDetailsView _titleForIndexPath:](self, "_titleForIndexPath:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v11);

    objc_msgSend(v9, "detailTextLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertInfoCertificateDetailsView _detailForIndexPath:](self, "_detailForIndexPath:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v13);

  }
  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSMutableArray count](self->_tableSections, "count", a3);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;

  if (-[NSMutableArray count](self->_tableSections, "count", a3) <= (unint64_t)a4)
  {
    v7 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_tableSections, "objectAtIndex:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("header title"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableSections, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
