@implementation FAProfileViewTableViewDecorator

- (FAProfileViewTableViewDecorator)initWithTableView:(id)a3 ruiTableView:(id)a4 forPerson:(id)a5 pictureStore:(id)a6
{
  id v11;
  id v12;
  id v13;
  FAProfileViewTableViewDecorator *v14;
  FAProfileViewTableViewDecorator *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *profileViewForCells;
  objc_super v19;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)FAProfileViewTableViewDecorator;
  v14 = -[FATableViewDecorator initWithTableView:](&v19, sel_initWithTableView_, a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_pictureStore, a6);
    objc_storeStrong((id *)&v15->_familyMember, a5);
    objc_storeStrong((id *)&v15->_remoteTableViewController, a4);
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    profileViewForCells = v15->_profileViewForCells;
    v15->_profileViewForCells = v16;

  }
  return v15;
}

+ (BOOL)shouldShowInPage:(id)a3
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
          if ((objc_msgSend(a1, "_shouldShowInSection:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i)) & 1) != 0)
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

+ (BOOL)_shouldShowInSection:(id)a3
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
        v10 = objc_msgSend(v9, "isEqual:", CFSTR("InjectProfileView"));

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

- (id)_keyForCell:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
}

- (id)_profileViewForCell:(id)a3
{
  void *v4;
  void *v5;

  -[FAProfileViewTableViewDecorator _keyForCell:](self, "_keyForCell:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_profileViewForCells, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_getOrCreateProfileViewForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  FAFamilyMember *familyMember;
  void *v16;
  void *v17;
  void *v18;
  FAFamilyMember *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;

  v4 = a3;
  -[FAProfileViewTableViewDecorator _profileViewForCell:](self, "_profileViewForCell:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v7 = (void *)MEMORY[0x24BEBD640];
    -[FAProfilePictureStore profilePictureForFamilyMember:pictureDiameter:](self->_pictureStore, "profilePictureForFamilyMember:pictureDiameter:", self->_familyMember, 60.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scale");
    objc_msgSend(v7, "imageWithData:scale:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[FAFamilyMember fullName](self->_familyMember, "fullName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      -[FAFamilyMember appleID](self->_familyMember, "appleID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      familyMember = self->_familyMember;
      if (v14)
        -[FAFamilyMember appleID](familyMember, "appleID");
      else
        -[FAFamilyMember inviteEmail](familyMember, "inviteEmail");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v13;
    objc_msgSend(MEMORY[0x24BDD1500], "fa_standardFormatter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFormattingContext:", 5);
    -[FAFamilyMember joinedDate](self->_familyMember, "joinedDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = self->_familyMember;
    if (v18)
    {
      -[FAFamilyMember joinedDate](v19, "joinedDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringFromDate:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[FAFamilyMember joinedDate](self->_familyMember, "joinedDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isDateRelative");

      v24 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v27 = CFSTR("JOINED_DATE_ABSOLUTE");
      v28 = CFSTR("JOINED_DATE_RELATIVE");
    }
    else
    {
      -[FAFamilyMember invitationDate](v19, "invitationDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("INVITED"), &stru_24C8A3000, CFSTR("Localizable"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04D50]), "initWithName:email:image:", v16, v34, v10);
        -[FAProfileViewTableViewDecorator _keyForCell:](self, "_keyForCell:", v4);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_profileViewForCells, "setObject:forKeyedSubscript:", v6, v35);

        goto LABEL_18;
      }
      -[FAFamilyMember invitationDate](self->_familyMember, "invitationDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringFromDate:", v30);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[FAFamilyMember invitationDate](self->_familyMember, "invitationDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v31, "isDateRelative");

      v24 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v27 = CFSTR("INVITED_DATE_ABSOLUTE");
      v28 = CFSTR("INVITED_DATE_RELATIVE");
    }
    if (v23)
      v32 = v28;
    else
      v32 = v27;
    objc_msgSend(v25, "localizedStringForKey:value:table:", v32, &stru_24C8A3000, CFSTR("Localizable"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", v33, v21);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  -[FAProfileViewTableViewDecorator _profileViewForCell:](self, "_profileViewForCell:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v6;
}

- (void)_addProfileViewToCell:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FAProfileViewTableViewDecorator _profileViewForCell:](self, "_profileViewForCell:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _FALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
      -[FAProfileViewTableViewDecorator _addProfileViewToCell:].cold.2(v6, v8, v9, v10, v11, v12, v13, v14);
  }
  else
  {
    if (v7)
      -[FAProfileViewTableViewDecorator _addProfileViewToCell:].cold.1(v6, v8, v9, v10, v11, v12, v13, v14);

    -[FAProfileViewTableViewDecorator _getOrCreateProfileViewForCell:](self, "_getOrCreateProfileViewForCell:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v6);

    -[NSObject setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v26 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v4, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject topAnchor](v6, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v30;
    objc_msgSend(v4, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "leftAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject leftAnchor](v6, "leftAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v25;
    objc_msgSend(v4, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "rightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject rightAnchor](v6, "rightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v17;
    objc_msgSend(v4, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject bottomAnchor](v6, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v22);

  }
}

- (void)_removeProfileViewFromCell:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FAProfileViewTableViewDecorator _profileViewForCell:](self, "_profileViewForCell:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[FAProfileViewTableViewDecorator _keyForCell:](self, "_keyForCell:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeFromSuperview");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_profileViewForCells, "setObject:forKeyedSubscript:", 0, v5);

}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[FATableViewDecorator delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[FATableViewDecorator delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tableView:viewForHeaderInSection:", v6, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  v6 = a3;
  -[FATableViewDecorator delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[FATableViewDecorator delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tableView:heightForHeaderInSection:", v6, a4);
    v11 = v10;

  }
  else
  {
    objc_msgSend(v6, "rowHeight");
    v11 = v12;
  }

  return v11;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  double v10;
  void *v11;
  double v12;
  void *v14;
  double v15;

  v6 = a3;
  v7 = v6;
  if (a4 || objc_msgSend(v6, "numberOfRowsInSection:", 0))
  {
    -[FATableViewDecorator delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    v10 = 0.0;
    if ((v9 & 1) != 0)
    {
      -[FATableViewDecorator delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "tableView:heightForFooterInSection:", v7, a4);
      v10 = v12;

    }
  }
  else
  {
    -[FAProfileViewTableViewDecorator tableView:titleForFooterInSection:](self, "tableView:titleForFooterInSection:", v7, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v10 = *MEMORY[0x24BEBE770];
    }
    else
    {
      UIRoundToViewScale();
      v10 = v15;
    }
  }

  return v10;
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
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("familyAction"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "isEqualToString:", CFSTR("InjectProfileView")))
    -[FAProfileViewTableViewDecorator _addProfileViewToCell:](self, "_addProfileViewToCell:", v9);
  else
    -[FAProfileViewTableViewDecorator _removeProfileViewFromCell:](self, "_removeProfileViewFromCell:", v9);

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  char v13;
  void *v14;
  double v15;
  double v16;

  v6 = a3;
  v7 = a4;
  -[RUITableView objectModelRowForIndexPath:](self->_remoteTableViewController, "objectModelRowForIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("familyAction"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "isEqualToString:", CFSTR("InjectProfileView")))
  {
    objc_msgSend(MEMORY[0x24BE04D50], "desiredHeight");
LABEL_6:
    v16 = v11;
    goto LABEL_7;
  }
  -[FATableViewDecorator delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) == 0)
  {
    objc_msgSend(v6, "rowHeight");
    goto LABEL_6;
  }
  -[FATableViewDecorator delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tableView:heightForRowAtIndexPath:", v6, v7);
  v16 = v15;

LABEL_7:
  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileViewForCells, 0);
  objc_storeStrong((id *)&self->_pictureStore, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_remoteTableViewController, 0);
}

- (void)_addProfileViewToCell:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_20DE41000, a1, a3, "Add new profile summary view.", a5, a6, a7, a8, 0);
}

- (void)_addProfileViewToCell:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_20DE41000, a1, a3, "Profile summary view already exist in view hierarchy.", a5, a6, a7, a8, 0);
}

@end
