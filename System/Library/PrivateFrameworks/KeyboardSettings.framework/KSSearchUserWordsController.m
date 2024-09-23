@implementation KSSearchUserWordsController

- (KSSearchUserWordsController)initWithNavigationController:(id)a3
{
  KSSearchUserWordsController *v4;
  objc_super v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  v6.receiver = self;
  v6.super_class = (Class)KSSearchUserWordsController;
  v4 = -[KSSearchUserWordsController init](&v6, sel_init);
  if (v4)
  {
    v7[0] = &stru_25107A038;
    v7[1] = &stru_25107A038;
    v7[2] = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("NO_RESULTS"), &stru_25107A038, CFSTR("Keyboard"));
    v4->_noResults = (NSArray *)(id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 3);
    -[KSSearchUserWordsController setEdgesForExtendedLayout:](v4, "setEdgesForExtendedLayout:", 4);
    -[KSSearchUserWordsController setParentNavigationController:](v4, "setParentNavigationController:", a3);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KSSearchUserWordsController;
  -[KSSearchUserWordsController dealloc](&v3, sel_dealloc);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)KSSearchUserWordsController;
  -[KSSearchUserWordsController setEditing:animated:](&v7, sel_setEditing_animated_);
  objc_msgSend((id)-[KSSearchUserWordsController navigationItem](self, "navigationItem"), "setHidesBackButton:animated:", v5, 1);
  objc_msgSend((id)-[KSSearchUserWordsController tableView](self, "tableView"), "setEditing:animated:", v5, v4);
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  -[KSSearchUserWordsController setEditing:animated:](self, "setEditing:animated:", 1, 1);
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  -[KSSearchUserWordsController setEditing:animated:](self, "setEditing:animated:", 0, 1);
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  KSUserWordsManager *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (a4 == 1)
  {
    objc_msgSend(a3, "deselectRowAtIndexPath:animated:", a5);
    v7 = -[NSArray objectAtIndex:](-[KSSearchUserWordsController filteredListContent](self, "filteredListContent"), "objectAtIndex:", objc_msgSend(a5, "row"));
    v8 = -[KSSearchUserWordsController dictionaryController](self, "dictionaryController");
    v9[0] = v7;
    -[KSUserWordsManager addEntries:removeEntries:withCompletionHandler:](v8, "addEntries:removeEntries:withCompletionHandler:", 0, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1), 0);
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  if (-[NSArray count](-[KSSearchUserWordsController filteredListContent](self, "filteredListContent", a3), "count"))
    return a4;
  else
    return 0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return -[NSArray count](-[KSSearchUserWordsController filteredListContent](self, "filteredListContent", a3, a4), "count") != 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  KSEditUserWordController *v6;

  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", a4, 1);
  v6 = -[KSEditUserWordController initWithUserWord:]([KSEditUserWordController alloc], "initWithUserWord:", -[NSArray objectAtIndex:](-[KSSearchUserWordsController filteredListContent](self, "filteredListContent"), "objectAtIndex:", objc_msgSend(a4, "row")));
  -[KSEditUserWordController setDictionaryController:](v6, "setDictionaryController:", -[KSSearchUserWordsController dictionaryController](self, "dictionaryController"));
  -[UINavigationController pushViewController:animated:](-[KSSearchUserWordsController parentNavigationController](self, "parentNavigationController"), "pushViewController:animated:", v6, 1);

}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result;

  result = -[NSArray count](-[KSSearchUserWordsController filteredListContent](self, "filteredListContent", a3, a4), "count");
  if (!result)
    return -[NSArray count](-[KSSearchUserWordsController noResults](self, "noResults"), "count");
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  const __CFString *v7;
  id v8;
  _BOOL8 v9;
  id v10;
  void *v11;

  if (-[NSArray count](-[KSSearchUserWordsController filteredListContent](self, "filteredListContent"), "count"))
    v7 = CFSTR("kCellIdentifier");
  else
    v7 = CFSTR("kNoResultsIdentifier");
  v8 = (id)objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", v7);
  if (!v8)
  {
    v9 = -[NSArray count](-[KSSearchUserWordsController filteredListContent](self, "filteredListContent"), "count") != 0;
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", v9, v7);
    objc_msgSend(v8, "setAccessoryType:", 0);
  }
  if (-[NSArray count](-[KSSearchUserWordsController filteredListContent](self, "filteredListContent"), "count"))
  {
    v10 = -[NSArray objectAtIndex:](-[KSSearchUserWordsController filteredListContent](self, "filteredListContent"), "objectAtIndex:", objc_msgSend(a4, "row"));
    objc_msgSend((id)objc_msgSend(v8, "detailTextLabel"), "setText:", objc_msgSend(v10, "phrase"));
    objc_msgSend((id)objc_msgSend(v8, "textLabel"), "setText:", objc_msgSend(v10, "shortcut"));
  }
  else
  {
    objc_msgSend((id)objc_msgSend(v8, "textLabel"), "setText:", -[NSArray objectAtIndex:](-[KSSearchUserWordsController noResults](self, "noResults"), "objectAtIndex:", objc_msgSend(a4, "row")));
    objc_msgSend((id)objc_msgSend(v8, "textLabel"), "setTextAlignment:", 1);
    v11 = (void *)objc_msgSend(v8, "textLabel");
    objc_msgSend(v11, "setTextColor:", objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.8, 1.0));
    objc_msgSend((id)objc_msgSend(v8, "textLabel"), "setFont:", UISystemFontBoldForSize());
  }
  return v8;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return -[NSArray count](-[KSSearchUserWordsController filteredListContent](self, "filteredListContent", a3, a4), "count") != 0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)filterContentForSearchText:(id)a3
{
  -[KSSearchUserWordsController setFilteredListContent:](self, "setFilteredListContent:", -[NSArray filteredArrayUsingPredicate:](-[KSUserWordsManager entries](-[KSSearchUserWordsController dictionaryController](self, "dictionaryController"), "entries"), "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(shortcut CONTAINS[c] %@) OR (phrase CONTAINS[c] %@)"), a3, a3)));
  objc_msgSend((id)-[KSSearchUserWordsController tableView](self, "tableView"), "reloadData");
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  if (objc_msgSend(a3, "isActive"))
    -[KSSearchUserWordsController filterContentForSearchText:](self, "filterContentForSearchText:", objc_msgSend((id)objc_msgSend(a3, "searchBar"), "text"));
}

- (KSUserWordsManager)dictionaryController
{
  return self->_dictionaryController;
}

- (void)setDictionaryController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1016);
}

- (NSArray)filteredListContent
{
  return self->_filteredListContent;
}

- (void)setFilteredListContent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1024);
}

- (NSArray)noResults
{
  return self->_noResults;
}

- (void)setNoResults:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1032);
}

- (UINavigationController)parentNavigationController
{
  return self->_parentNavigationController;
}

- (void)setParentNavigationController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1040);
}

@end
