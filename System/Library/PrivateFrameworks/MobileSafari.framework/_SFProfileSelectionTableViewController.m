@implementation _SFProfileSelectionTableViewController

- (_SFProfileSelectionTableViewController)init
{
  return -[_SFProfileSelectionTableViewController initWithStyle:](self, "initWithStyle:", 2);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFProfileSelectionTableViewController;
  -[_SFProfileSelectionTableViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[_SFProfileSelectionTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("CellIdentifier"));

}

- (void)setProfiles:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *profiles;
  int v8;
  void *v9;
  NSArray *v10;

  v4 = (NSArray *)a3;
  v5 = v4;
  if (self->_profiles != v4)
  {
    v10 = v4;
    v6 = (NSArray *)-[NSArray copy](v4, "copy");
    profiles = self->_profiles;
    self->_profiles = v6;

    self->_selectedRow = 0;
    v8 = -[_SFProfileSelectionTableViewController isViewLoaded](self, "isViewLoaded");
    v5 = v10;
    if (v8)
    {
      -[_SFProfileSelectionTableViewController tableView](self, "tableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "reloadData");

      v5 = v10;
    }
  }

}

- (WBProfile)selectedProfile
{
  return (WBProfile *)-[NSArray objectAtIndexedSubscript:](self->_profiles, "objectAtIndexedSubscript:", self->_selectedRow);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_profiles, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("CellIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->_profiles, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  objc_msgSend(v8, "symbolImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImage:", v11);

  v13 = objc_msgSend(v6, "row");
  if (v13 == self->_selectedRow)
    v14 = 3;
  else
    v14 = 0;
  objc_msgSend(v7, "setAccessoryType:", v14);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", self->_selectedRow, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForRowAtIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessoryType:", 0);

  objc_msgSend(v7, "cellForRowAtIndexPath:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAccessoryType:", 3);
  v11 = objc_msgSend(v6, "row");

  self->_selectedRow = v11;
}

- (NSArray)profiles
{
  return self->_profiles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profiles, 0);
}

@end
