@implementation FAProfilePictureTableViewDecorator

- (FAProfilePictureTableViewDecorator)initWithTableView:(id)a3 ruiTableView:(id)a4 pictureStore:(id)a5
{
  id v9;
  id v10;
  FAProfilePictureTableViewDecorator *v11;
  FAProfilePictureTableViewDecorator *v12;
  void *v13;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FAProfilePictureTableViewDecorator;
  v11 = -[FATableViewDecorator initWithTableView:](&v15, sel_initWithTableView_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_pictureStore, a5);
    objc_storeStrong((id *)&v12->_remoteTableViewController, a4);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v12, sel__profilePictureStoreDidReload, FAProfilePictureStoreDidReloadImagesNotification, v10);

  }
  return v12;
}

- (void)_profilePictureStoreDidReload
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__FAProfilePictureTableViewDecorator__profilePictureStoreDidReload__block_invoke;
  block[3] = &unk_24C88B7F0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __67__FAProfilePictureTableViewDecorator__profilePictureStoreDidReload__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FAProfilePictureTableViewDecorator;
  -[FAProfilePictureTableViewDecorator dealloc](&v4, sel_dealloc);
}

+ (BOOL)shouldShowPicturesInPage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "hasTableView"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v4, "tableViewOM", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(a1, "_shouldShowPictureInSection:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i)) & 1) != 0)
          {
            v11 = 1;
            goto LABEL_13;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_13:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)_shouldShowPictureInSection:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "rows", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "attributes");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("familyAction"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqual:", CFSTR("InjectMemberImage"));

        if ((v10 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a4;
  v7 = a3;
  -[FATableViewDecorator dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tableView:cellForRowAtIndexPath:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[RUITableView objectModelRowForIndexPath:](self->_remoteTableViewController, "objectModelRowForIndexPath:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "attributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("altDSID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "attributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("familyAction"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "isEqualToString:", CFSTR("InjectMemberImage")))
    v15 = v12 == 0;
  else
    v15 = 1;
  if (!v15)
  {
    -[FAProfilePictureStore profilePictureForFamilyMemberWithAltDSID:pictureDiameter:](self->_pictureStore, "profilePictureForFamilyMemberWithAltDSID:pictureDiameter:", v12, 36.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)MEMORY[0x24BEBD640];
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scale");
      objc_msgSend(v17, "imageWithData:scale:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setImage:", v19);

      objc_msgSend(v9, "imageView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setContentMode:", 4);
    }
    else
    {
      objc_msgSend(v9, "imageView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setImage:", 0);
    }

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pictureStore, 0);
  objc_storeStrong((id *)&self->_remoteTableViewController, 0);
}

@end
