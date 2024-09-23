@implementation FASuggestionsTableViewDecorator

- (FASuggestionsTableViewDecorator)initWithTableView:(id)a3 ruiTableView:(id)a4 pictureStore:(id)a5 recommendations:(id)a6 proactiveModelUsed:(int64_t)a7 emergencyContacts:(id)a8 context:(id)a9 viewController:(id)a10 suggester:(id)a11 objectModel:(id)a12
{
  FASuggestionsTableViewDecorator *v18;
  FASuggestionsTableViewDecorator *v19;
  NSSet *v20;
  NSSet *invitedHandles;
  CNContactStore *v22;
  CNContactStore *contactStore;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;

  v33 = a4;
  v32 = a5;
  v31 = a6;
  v30 = a8;
  v29 = a9;
  v28 = a10;
  v27 = a11;
  v26 = a12;
  v34.receiver = self;
  v34.super_class = (Class)FASuggestionsTableViewDecorator;
  v18 = -[FATableViewDecorator initWithTableView:](&v34, sel_initWithTableView_, a3);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_familySuggestionsPictureStore, a5);
    objc_storeStrong((id *)&v19->_remoteTableViewController, a4);
    objc_storeStrong((id *)&v19->_recommendedFamilyMembers, a6);
    v19->_proactiveModelUsedToDeriveRecommendations = a7;
    objc_storeStrong((id *)&v19->_emergencyContacts, a8);
    objc_storeStrong((id *)&v19->_context, a9);
    objc_storeStrong((id *)&v19->_viewController, a10);
    objc_storeStrong((id *)&v19->_suggester, a11);
    v20 = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCF20]);
    invitedHandles = v19->_invitedHandles;
    v19->_invitedHandles = v20;

    v22 = (CNContactStore *)objc_alloc_init(MEMORY[0x24BDBACF8]);
    contactStore = v19->_contactStore;
    v19->_contactStore = v22;

    objc_storeStrong((id *)&v19->_objectModel, a12);
  }

  return v19;
}

+ (BOOL)shouldShowSuggestionsInPage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "hasTableView"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v3, "tableViewOM", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "attributes");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("familyAction"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqual:", CFSTR("InjectFamilySuggestionsView"));

          if ((v12 & 1) != 0)
          {
            v13 = 1;
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }
    v13 = 0;
LABEL_13:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)accessoryViewFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  v5 = (void *)_IDSCopyIDForEmailAddress();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("mailto:"), &stru_24C8A3000);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)_IDSCopyIDForPhoneNumberWithOptions();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("tel:"), &stru_24C8A3000);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSSet containsObject:](self->_invitedHandles, "containsObject:", v6)
    || -[NSSet containsObject:](self->_invitedHandles, "containsObject:", v8))
  {
    -[FASuggestionsTableViewDecorator inviteSentImageForSuggestion](self, "inviteSentImageForSuggestion");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FASuggestionsTableViewDecorator inviteButtonForSuggestion](self, "inviteButtonForSuggestion");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (id)indexForSuggestionsSection
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  -[RUITableView sections](self->_remoteTableViewController, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    while (1)
    {
      -[RUITableView sections](self->_remoteTableViewController, "sections");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "attributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("familyAction"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqual:", CFSTR("InjectFamilySuggestionsView"));

      if (v10)
        break;

      if (v4 == ++v5)
        goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    v11 = 0;
  }
  return v11;
}

- (id)indexFor:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v18;
  NSUInteger v19;
  id v21;

  v21 = a3;
  v19 = -[NSArray count](self->_recommendedFamilyMembers, "count");
  if (v19)
  {
    v3 = 0;
    while (1)
    {
      -[NSArray objectAtIndex:](self->_recommendedFamilyMembers, "objectAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)_IDSCopyIDForEmailAddress();
      objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("mailto:"), &stru_24C8A3000);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = (void *)_IDSCopyIDForPhoneNumberWithOptions();
      objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("tel:"), &stru_24C8A3000);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "iMessageHandle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)_IDSCopyIDForEmailAddress();
      objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("mailto:"), &stru_24C8A3000);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "iMessageHandle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)_IDSCopyIDForPhoneNumberWithOptions();
      objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("tel:"), &stru_24C8A3000);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v11, "isEqual:", v6) & 1) != 0 || objc_msgSend(v14, "isEqual:", v8))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v3);
        v18 = objc_claimAutoreleasedReturnValue();
        v15 = 0;
      }
      else
      {
        v15 = 1;
      }

      if ((v15 & 1) == 0)
        break;
      if (v19 == ++v3)
        goto LABEL_9;
    }
    v16 = (void *)v18;
  }
  else
  {
LABEL_9:
    v16 = 0;
  }

  return v16;
}

- (id)inviteButtonForSuggestion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id location;

  objc_msgSend(MEMORY[0x24BEBD438], "filledButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBaseBackgroundColor:", v4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBaseForegroundColor:", v5);

  objc_msgSend(v3, "setButtonSize:", 0);
  objc_msgSend(v3, "setCornerStyle:", 4);
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x24BEBD388];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("INVITE_BUTTON_TITLE"), &stru_24C8A3000, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __60__FASuggestionsTableViewDecorator_inviteButtonForSuggestion__block_invoke;
  v15 = &unk_24C88B8C8;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v8, 0, 0, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithConfiguration:primaryAction:", v3, v9, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeToFit");

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v10;
}

void __60__FASuggestionsTableViewDecorator_inviteButtonForSuggestion__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "didTapInviteButtonInCell:", v4);
}

- (id)inviteSentImageForSuggestion
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 22.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("checkmark.circle"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v3);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v5);

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  FAProfilePictureStore *familySuggestionsPictureStore;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v6 = a3;
  v7 = a4;
  -[RUITableView sections](self->_remoteTableViewController, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "attributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("familyAction"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("InjectFamilySuggestionsView"));

  if (v12)
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("suggestionCell"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 3, CFSTR("suggestionCell"));
    -[NSArray objectAtIndexedSubscript:](self->_recommendedFamilyMembers, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contact");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSArray objectAtIndexedSubscript:](self->_recommendedFamilyMembers, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "iMessageHandle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[FASuggestionsTableViewDecorator accessoryViewFor:](self, "accessoryViewFor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessoryView:", v18);

    v19 = objc_msgSend(v7, "row");
    objc_msgSend(v13, "accessoryView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTag:", v19);

    objc_msgSend(MEMORY[0x24BDBACC0], "stringFromContact:style:", v15, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setText:", v21);

    -[FASuggestionsTableViewDecorator relationForContact:](self, "relationForContact:", v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "detailTextLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setText:", v23);

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "detailTextLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFont:", v25);

    familySuggestionsPictureStore = self->_familySuggestionsPictureStore;
    -[NSArray objectAtIndexedSubscript:](self->_recommendedFamilyMembers, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAProfilePictureStore profilePictureForRecommendedFamilyMember:](familySuggestionsPictureStore, "profilePictureForRecommendedFamilyMember:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = (void *)MEMORY[0x24BEBD640];
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "scale");
      objc_msgSend(v30, "imageWithData:scale:", v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "imageView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setImage:", v32);

      objc_msgSend(v13, "imageView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setContentMode:", 4);

    }
  }
  else
  {
    -[FATableViewDecorator dataSource](self, "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tableView:cellForRowAtIndexPath:", v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int64_t v12;
  void *v13;

  v6 = a3;
  -[RUITableView sections](self->_remoteTableViewController, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "attributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("familyAction"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", CFSTR("InjectFamilySuggestionsView"));

  if (v11)
  {
    v12 = -[NSArray count](self->_recommendedFamilyMembers, "count");
  }
  else
  {
    -[FATableViewDecorator dataSource](self, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v13, "tableView:numberOfRowsInSection:", v6, a4);

  }
  return v12;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  double v13;
  void *v14;
  double v15;

  v6 = a3;
  v7 = a4;
  -[RUITableView sections](self->_remoteTableViewController, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "attributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("familyAction"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("InjectFamilySuggestionsView"));

  if (v12)
  {
    v13 = *MEMORY[0x24BEBE770];
  }
  else
  {
    -[FATableViewDecorator delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "tableView:heightForRowAtIndexPath:", v6, v7);
    v13 = v15;

  }
  return v13;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  RUITableView *remoteTableViewController;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  remoteTableViewController = self->_remoteTableViewController;
  v8 = a5;
  -[RUITableView sections](remoteTableViewController, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "section");

  objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "attributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("familyAction"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqual:", CFSTR("InjectFamilySuggestionsView"));

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "detailTextLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextColor:", v15);

    objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackgroundColor:", v17);

  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSUInteger v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t proactiveModelUsedToDeriveRecommendations;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;

  v6 = a3;
  -[RUITableView sections](self->_remoteTableViewController, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "attributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("familyAction"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqual:", CFSTR("InjectFamilySuggestionsView")))
  {
    v11 = -[NSArray count](self->_recommendedFamilyMembers, "count");

    if (!v11)
    {
      v12 = 0;
      goto LABEL_14;
    }
  }
  else
  {

  }
  -[FATableViewDecorator dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "tableView:titleForHeaderInSection:", v6, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.FamilyCircle"));
  if (objc_msgSend(v14, "BOOLForKey:", CFSTR("DebugMegadome")) && objc_msgSend(v12, "length"))
  {
    proactiveModelUsedToDeriveRecommendations = self->_proactiveModelUsedToDeriveRecommendations;
    v16 = CFSTR("Unknown");
    if (proactiveModelUsedToDeriveRecommendations == 3)
      v16 = CFSTR("Megadome");
    if (proactiveModelUsedToDeriveRecommendations == 2)
      v17 = CFSTR("PeopleSuggester");
    else
      v17 = v16;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ (Model: %@)"), v12, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v18;
  }

LABEL_14:
  return v12;
}

- (id)relationForContact:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  CNContactStore *contactStore;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  NSArray *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _QWORD v54[7];
  uint8_t buf[4];
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v5 = self->_emergencyContacts;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v50;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v50 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v10, "nameContactIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (v13)
        {
          _FALogSystem();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v10, "relationship");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v56 = v36;
            _os_log_impl(&dword_20DE41000, v35, OS_LOG_TYPE_DEFAULT, "contact relation from emergency contacts  %@", buf, 0xCu);

          }
          v37 = (void *)MEMORY[0x24BDBAD38];
          objc_msgSend(v10, "relationship");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "localizedStringForLabel:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
          {
            objc_msgSend(v39, "localizedCapitalizedString");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v10, "relationship");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "localizedCapitalizedString");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_28;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      if (v7)
        continue;
      break;
    }
  }

  contactStore = self->_contactStore;
  v15 = *MEMORY[0x24BDBA2C8];
  v54[0] = *MEMORY[0x24BDBA2E0];
  v54[1] = v15;
  v16 = *MEMORY[0x24BDBA2C0];
  v54[2] = *MEMORY[0x24BDBA310];
  v54[3] = v16;
  v17 = *MEMORY[0x24BDBA348];
  v54[4] = *MEMORY[0x24BDBA288];
  v54[5] = v17;
  v54[6] = *MEMORY[0x24BDBA3C0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  -[CNContactStore _ios_meContactWithKeysToFetch:error:](contactStore, "_ios_meContactWithKeysToFetch:error:", v18, &v48);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (NSArray *)v48;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = v19;
  objc_msgSend(v19, "contactRelations");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v45;
    while (2)
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v45 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        objc_msgSend(v25, "value");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "name");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBACC0], "stringFromContact:style:", v4, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v27, "isEqualToString:", v28);

        if (v29)
        {
          _FALogSystem();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v56 = v26;
            _os_log_impl(&dword_20DE41000, v30, OS_LOG_TYPE_DEFAULT, "contact relation from contacts %@", buf, 0xCu);
          }

          v31 = (void *)MEMORY[0x24BDBAD38];
          objc_msgSend(v25, "label");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "localizedStringForLabel:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
          {
            objc_msgSend(v33, "localizedCapitalizedString");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_26;
          }
        }

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      if (v22)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("FAMILY_SUGGESTION_DEFAULT_DETAIL_LABEL"), &stru_24C8A3000, CFSTR("Localizable"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

  v39 = v42;
  v5 = v43;
LABEL_28:

  return v34;
}

- (void)didTapInviteButtonInCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSArray objectAtIndexedSubscript:](self->_recommendedFamilyMembers, "objectAtIndexedSubscript:", objc_msgSend(v7, "tag"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "iMessageHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[FamilyInviteAnalytics shared](_TtC14FamilyCircleUI21FamilyInviteAnalytics, "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendTapInviteOnSuggestedContactEvent");

    -[FASuggestionsTableViewDecorator setupInviteConfiguratioControllerFor:contactHandle:](self, "setupInviteConfiguratioControllerFor:contactHandle:", 1, v5);
  }

}

- (void)setupInviteConfiguratioControllerFor:(int64_t)a3 contactHandle:(id)a4
{
  id v6;
  FAMessagesInviteConfigurationController *v7;
  FAInviteContext *v8;
  void *v9;
  FAInviteConfigurationController *v10;
  FAMailInviteConfigurationController *v11;
  FAInviteContext *context;
  FAInviteConfigurationController *inviteConfigurationController;
  NSObject *v14;
  const char *v15;
  uint8_t *v16;
  uint64_t v17;
  __int16 v18;

  v6 = a4;
  if (a3 == 2)
  {
    if (+[FAMailInviteConfigurationController isAvailable](FAMailInviteConfigurationController, "isAvailable"))
    {
      v11 = [FAMailInviteConfigurationController alloc];
      context = self->_context;
      -[RemoteUIController hostViewController](self->_viewController, "hostViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[FAMailInviteConfigurationController initWithInviteContext:presentingController:email:](v11, "initWithInviteContext:presentingController:email:", context, v9, v6);
      goto LABEL_7;
    }
    _FALogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      v15 = "Device cannot send emails";
      v16 = (uint8_t *)&v17;
      goto LABEL_12;
    }
LABEL_13:

    goto LABEL_14;
  }
  if (a3 == 1)
  {
    if (+[FAMessagesInviteConfigurationController isAvailable](FAMessagesInviteConfigurationController, "isAvailable"))
    {
      v7 = [FAMessagesInviteConfigurationController alloc];
      v8 = self->_context;
      -[RemoteUIController hostViewController](self->_viewController, "hostViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[FAMessagesInviteConfigurationController initWithInviteContext:presentingController:familySuggestionHandle:](v7, "initWithInviteContext:presentingController:familySuggestionHandle:", v8, v9, v6);
LABEL_7:
      inviteConfigurationController = self->_inviteConfigurationController;
      self->_inviteConfigurationController = v10;

      goto LABEL_14;
    }
    _FALogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 0;
      v15 = "Device cannot send messages";
      v16 = (uint8_t *)&v18;
LABEL_12:
      _os_log_impl(&dword_20DE41000, v14, OS_LOG_TYPE_DEFAULT, v15, v16, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
LABEL_14:
  -[FAInviteConfigurationController setDelegate:](self->_inviteConfigurationController, "setDelegate:", self, v17);
  -[FAInviteConfigurationController presentWhenReadyWithCompletion:](self->_inviteConfigurationController, "presentWhenReadyWithCompletion:", &__block_literal_global_1);

}

- (void)inviteController:(id)a3 didFinishWithStatus:(unint64_t)a4 recipients:(id)a5 userInfo:(id)a6 error:(id)a7
{
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  RemoteUIController *viewController;
  void *v21;
  NSObject *v22;
  _QWORD v23[4];
  NSObject *v24;
  FASuggestionsTableViewDecorator *v25;
  id v26;
  uint8_t buf[4];
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  _FALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v28 = a4;
    _os_log_impl(&dword_20DE41000, v10, OS_LOG_TYPE_DEFAULT, "FASuggestions Controller did finish with status: %lu", buf, 0xCu);
  }

  +[FamilyInviteAnalytics shared](_TtC14FamilyCircleUI21FamilyInviteAnalytics, "shared");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendSuggestedContactInvitedEventWithInviteCompletionStatus:", a4);

  if (a4 == 1)
  {
    v12 = objc_alloc_init(MEMORY[0x24BE30AA0]);
    objc_msgSend(v12, "setStatus:", 1);
    objc_msgSend(v12, "setTransportType:", 1);
    objc_msgSend(v12, "setRecipients:", v9);
    objc_msgSend(v12, "serverReadableDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    -[FAInviteContext inviteURL](self->_context, "inviteURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "absoluteString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("inviteUrl"));

    -[RUIObjectModel serverInfo](self->_objectModel, "serverInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addEntriesFromDictionary:", v17);

    v26 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v14, 100, 0, &v26);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v26;
    if (v18)
    {
      viewController = self->_viewController;
      -[FAInviteContext reportInviteeDetailsUrl](self->_context, "reportInviteeDetailsUrl");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __98__FASuggestionsTableViewDecorator_inviteController_didFinishWithStatus_recipients_userInfo_error___block_invoke;
      v23[3] = &unk_24C88B930;
      v24 = v9;
      v25 = self;
      -[RemoteUIController loadURL:postBody:completion:](viewController, "loadURL:postBody:completion:", v21, v18, v23);

      v22 = v24;
    }
    else
    {
      _FALogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = (unint64_t)v19;
        _os_log_impl(&dword_20DE41000, v22, OS_LOG_TYPE_DEFAULT, "Couldn't serialize FAInviteCompletionInfo with error: %@", buf, 0xCu);
      }
    }

  }
}

void __98__FASuggestionsTableViewDecorator_inviteController_didFinishWithStatus_recipients_userInfo_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _FALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      v8 = *(void **)(a1 + 32);
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_20DE41000, v6, OS_LOG_TYPE_DEFAULT, "successfully sent pending invite info to server for  %@", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "updateSuggestionCellFor:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "sendSuggestionFeedbackFor:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (v7)
    {
      objc_msgSend(v5, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_20DE41000, v6, OS_LOG_TYPE_DEFAULT, "Error sending invite info to server %@", (uint8_t *)&v10, 0xCu);

    }
  }

}

- (void)updateSuggestionCellFor:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__FASuggestionsTableViewDecorator_updateSuggestionCellFor___block_invoke;
  v6[3] = &unk_24C88B958;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __59__FASuggestionsTableViewDecorator_updateSuggestionCellFor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setByAddingObjectsFromArray:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 104);
  *(_QWORD *)(v3 + 104) = v2;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexFor:", v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "indexForSuggestionsSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", (int)objc_msgSend(v12, "intValue"), (int)objc_msgSend(v7, "intValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v9, 0);
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reloadRowsAtIndexPaths:withRowAnimation:", v10, 5);

  }
}

- (void)sendSuggestionFeedbackFor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  id v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  objc_class *v40;
  id v41;
  void *v42;
  void *v43;
  objc_class *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  objc_class *v48;
  void *v49;
  id v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  id v77;
  uint8_t buf[8];
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v69 = objc_alloc_init(MEMORY[0x24BE719C0]);
  v66 = v3;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FASuggestionsTableViewDecorator indexFor:](self, "indexFor:", v4);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSArray objectAtIndexedSubscript:](self->_recommendedFamilyMembers, "objectAtIndexedSubscript:", (int)objc_msgSend(v68, "intValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE30A60], "megadomeAdoption");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEnabled"))
    goto LABEL_4;
  objc_msgSend(MEMORY[0x24BE30AF8], "megadomeKillSwitch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEnabledWithForceRefresh:", 1))
  {

LABEL_4:
    goto LABEL_5;
  }
  -[FAInviteSuggestions feedbackContext](self->_suggester, "feedbackContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "megadomeFeedbackEventId");

  if (v37 != -1)
  {
    _FALogSystem();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DE41000, v38, OS_LOG_TYPE_DEFAULT, "Submitting feedback to Megadome for suggestion tap", buf, 2u);
    }

    v83 = 0;
    v84 = &v83;
    v85 = 0x2050000000;
    v39 = (void *)getGDPersonEntityTagEventIDSetClass_softClass;
    v86 = getGDPersonEntityTagEventIDSetClass_softClass;
    if (!getGDPersonEntityTagEventIDSetClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      v79 = 3221225472;
      v80 = __getGDPersonEntityTagEventIDSetClass_block_invoke;
      v81 = &unk_24C88B7B0;
      v82 = &v83;
      __getGDPersonEntityTagEventIDSetClass_block_invoke((uint64_t)buf);
      v39 = (void *)v84[3];
    }
    v40 = objc_retainAutorelease(v39);
    _Block_object_dispose(&v83, 8);
    v41 = [v40 alloc];
    -[FAInviteSuggestions feedbackContext](self->_suggester, "feedbackContext");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (void *)objc_msgSend(v41, "initWithEventId:", objc_msgSend(v42, "megadomeFeedbackEventId"));

    v83 = 0;
    v84 = &v83;
    v85 = 0x2050000000;
    v43 = (void *)getGDPersonEntityTaggingStatefulFeedbackClass_softClass;
    v86 = getGDPersonEntityTaggingStatefulFeedbackClass_softClass;
    if (!getGDPersonEntityTaggingStatefulFeedbackClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      v79 = 3221225472;
      v80 = __getGDPersonEntityTaggingStatefulFeedbackClass_block_invoke;
      v81 = &unk_24C88B7B0;
      v82 = &v83;
      __getGDPersonEntityTaggingStatefulFeedbackClass_block_invoke((uint64_t)buf);
      v43 = (void *)v84[3];
    }
    v44 = objc_retainAutorelease(v43);
    _Block_object_dispose(&v83, 8);
    v71 = (void *)objc_msgSend([v44 alloc], "initWithStatefulFeedbackType:eventIds:", 2, v67);
    v83 = 0;
    v84 = &v83;
    v85 = 0x2050000000;
    v45 = (void *)getGDConfigurationClass_softClass;
    v86 = getGDConfigurationClass_softClass;
    if (!getGDConfigurationClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      v79 = 3221225472;
      v80 = __getGDConfigurationClass_block_invoke;
      v81 = &unk_24C88B7B0;
      v82 = &v83;
      __getGDConfigurationClass_block_invoke((uint64_t)buf);
      v45 = (void *)v84[3];
    }
    v46 = objc_retainAutorelease(v45);
    _Block_object_dispose(&v83, 8);
    v35 = objc_alloc_init(v46);
    v83 = 0;
    v84 = &v83;
    v85 = 0x2050000000;
    v47 = (void *)getGDEntityTaggingServiceClass_softClass;
    v86 = getGDEntityTaggingServiceClass_softClass;
    if (!getGDEntityTaggingServiceClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      v79 = 3221225472;
      v80 = __getGDEntityTaggingServiceClass_block_invoke;
      v81 = &unk_24C88B7B0;
      v82 = &v83;
      __getGDEntityTaggingServiceClass_block_invoke((uint64_t)buf);
      v47 = (void *)v84[3];
    }
    v48 = objc_retainAutorelease(v47);
    _Block_object_dispose(&v83, 8);
    v77 = 0;
    v49 = (void *)objc_msgSend([v48 alloc], "initWithConfig:error:", v35, &v77);
    v50 = v77;
    if (!v49)
    {
      _FALogSystem();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        -[FASuggestionsTableViewDecorator sendSuggestionFeedbackFor:].cold.2((uint64_t)v50, v51, v52, v53, v54, v55, v56, v57);

    }
    v76 = 0;
    objc_msgSend(v49, "recordStatefulFeedback:error:", v71, &v76);
    v58 = v76;
    if (v58)
    {
      _FALogSystem();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        -[FASuggestionsTableViewDecorator sendSuggestionFeedbackFor:].cold.1((uint64_t)v58, v59, v60, v61, v62, v63, v64, v65);

    }
    goto LABEL_18;
  }
LABEL_5:
  _FALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DE41000, v8, OS_LOG_TYPE_DEFAULT, "Submitting feedback to PeopleSuggester for suggestion tap", buf, 2u);
  }

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  -[FAInviteSuggestions feedbackContext](self->_suggester, "feedbackContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "peopleSuggesterSuggestions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v73;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v73 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        objc_msgSend(v14, "recipients");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "handle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (v19)
        {
          v20 = v14;

          v69 = v20;
          goto LABEL_17;
        }

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_17:

  v21 = objc_alloc(MEMORY[0x24BE71998]);
  objc_msgSend(v69, "bundleID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (void *)objc_msgSend(v21, "initWithType:suggestion:transportBundleID:", 0, v69, v22);

  v23 = (void *)MEMORY[0x24BE71990];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAInviteSuggestions feedbackContext](self->_suggester, "feedbackContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "peopleSuggesterPredictionContext");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "suggestionDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "timeIntervalSinceDate:", v27);
  v29 = v28;
  -[FAInviteSuggestions feedbackContext](self->_suggester, "feedbackContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "peopleSuggesterPredictionContext");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAInviteSuggestions feedbackContext](self->_suggester, "feedbackContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "peopleSuggesterSuggestions");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v34 = (float)-[NSArray count](self->_recommendedFamilyMembers, "count");
  objc_msgSend(v23, "feedbackForAction:delay:context:suggestions:numberOfVisibleSuggestions:sessionIdentifier:", v67, v31, v33, 0, v29, v34);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE719B0], "suggesterWithDaemon");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "provideFeedbackForSuggestions:", v71);
LABEL_18:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectModel, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_invitedHandles, 0);
  objc_storeStrong((id *)&self->_suggester, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_inviteConfigurationController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_emergencyContacts, 0);
  objc_storeStrong((id *)&self->_recommendedFamilyMembers, 0);
  objc_storeStrong((id *)&self->_familySuggestionsPictureStore, 0);
  objc_storeStrong((id *)&self->_remoteTableViewController, 0);
}

- (void)sendSuggestionFeedbackFor:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DE41000, a2, a3, "Error providing feedback to megadome: %@", a5, a6, a7, a8, 2u);
}

- (void)sendSuggestionFeedbackFor:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DE41000, a2, a3, "Error initializing megadome entity tagging service while providing feedback: %@", a5, a6, a7, a8, 2u);
}

@end
