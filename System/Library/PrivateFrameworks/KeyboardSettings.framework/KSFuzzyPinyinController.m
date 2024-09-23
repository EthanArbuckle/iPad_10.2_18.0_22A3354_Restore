@implementation KSFuzzyPinyinController

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KSFuzzyPinyinController;
  -[KSFuzzyPinyinController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)KSFuzzyPinyinController;
  -[KSFuzzyPinyinController viewDidLoad](&v4, sel_viewDidLoad);
  v3 = (int)*MEMORY[0x24BE75700];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "setEstimatedSectionHeaderHeight:", 0.0);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "setEstimatedSectionFooterHeight:", 0.0);
}

- (NSArray)fuzzyPinyinPairSpecifiers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *fuzzyPinyinPairSpecifiers;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  fuzzyPinyinPairSpecifiers = self->_fuzzyPinyinPairSpecifiers;
  if (!fuzzyPinyinPairSpecifiers)
  {
    -[KSFuzzyPinyinController setFuzzyPinyinPairs:](self, "setFuzzyPinyinPairs:", -[KSFuzzyPinyinController readFuzzyPinyinPairs](self, "readFuzzyPinyinPairs"));
    v2 = (void *)objc_msgSend(MEMORY[0x24BEB4D08], "validFuzzyPinyinPairs");
    fuzzyPinyinPairSpecifiers = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v3)
    {
      v4 = v3;
      v5 = 0x24BDD1000uLL;
      v6 = *(_QWORD *)v23;
      v19 = *MEMORY[0x24BE75AC0];
      v18 = *MEMORY[0x24BE75B50];
      v16 = *MEMORY[0x24BE75948];
      v17 = *MEMORY[0x24BE75DA0];
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v23 != v6)
            objc_enumerationMutation(v2);
          v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v9 = objc_msgSend((id)objc_msgSend(*(id *)(v5 + 1160), "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("FUZZY_PINYIN_PAIR_FORMAT"), &stru_25107A038, CFSTR("Keyboard"));
          if (objc_msgSend(v8, "count") != 2)
            -[KSFuzzyPinyinController fuzzyPinyinPairSpecifiers].cold.1();
          if (objc_msgSend(v8, "count") == 2)
          {
            v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v9, objc_msgSend(v8, "objectAtIndex:", 0), objc_msgSend(v8, "objectAtIndex:", 1));
            v11 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, self, 0, 0, 0, 3, 0);
            objc_msgSend(v11, "setProperty:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@↔︎%@"), objc_msgSend(v8, "objectAtIndexedSubscript:", 0), objc_msgSend(v8, "objectAtIndexedSubscript:", 1)), v19);
            objc_msgSend(v11, "setProperty:forKey:", v8, CFSTR("TISpecifierKeyFuzzyPinyinPair"));
            objc_msgSend(v11, "setProperty:forKey:", &unk_251083C30, v18);
            v12 = (void *)MEMORY[0x24BDD16E0];
            v13 = -[NSMutableSet containsObject:](-[KSFuzzyPinyinController fuzzyPinyinPairs](self, "fuzzyPinyinPairs"), "containsObject:", v8);
            v14 = v12;
            v5 = 0x24BDD1000;
            objc_msgSend(v11, "setProperty:forKey:", objc_msgSend(v14, "numberWithBool:", v13), v17);
            objc_msgSend(v11, "setProperty:forKey:", objc_opt_class(), v16);
            -[NSArray addObject:](fuzzyPinyinPairSpecifiers, "addObject:", v11);
          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v4);
    }
    self->_fuzzyPinyinPairSpecifiers = fuzzyPinyinPairSpecifiers;
  }
  return fuzzyPinyinPairSpecifiers;
}

- (id)readFuzzyPinyinPairs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v3 = (void *)objc_msgSend(v2, "valueForPreferenceKey:", *MEMORY[0x24BEB4F50]);
  v4 = (void *)objc_msgSend(MEMORY[0x24BEB4D08], "validFuzzyPinyinPairs");
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v3);
          v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v4, "containsObject:", v10))
            objc_msgSend(v5, "addObject:", v10);
        }
        v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }
  }
  else
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB4D08], "defaultFuzzyPinyinPairs");
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j));
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v13);
    }
  }
  return v5;
}

- (id)keyboardPreferenceValue:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController", a3);
  return (id)objc_msgSend(v3, "valueForPreferenceKey:", *MEMORY[0x24BEB4F58]);
}

- (void)setKeyboardPreferenceValue:(id)a3 forSpecifier:(id)a4
{
  uint64_t v6;
  int v7;
  NSArray *v8;
  void *v9;

  v6 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "specifierForID:", CFSTR("FUZZY_PINYIN_PAIRS_GROUP"), a4);
  v7 = objc_msgSend(a3, "BOOLValue");
  v8 = -[KSFuzzyPinyinController fuzzyPinyinPairSpecifiers](self, "fuzzyPinyinPairSpecifiers");
  if (v7)
  {
    -[KSFuzzyPinyinController insertContiguousSpecifiers:afterSpecifier:animated:](self, "insertContiguousSpecifiers:afterSpecifier:animated:", v8, v6, 1);
  }
  else
  {
    -[KSFuzzyPinyinController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v8, 1);
    -[KSFuzzyPinyinController setFuzzyPinyinPairSpecifiers:](self, "setFuzzyPinyinPairSpecifiers:", 0);
  }
  v9 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  objc_msgSend(v9, "setValue:forPreferenceKey:", a3, *MEMORY[0x24BEB4F58]);
}

- (id)specifiers
{
  uint64_t v3;
  id result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSUInteger v15;
  NSUInteger v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  result = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!result)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("FUZZY_PINYIN_GROUP")));
    v6 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("FUZZY_PINYIN_OPTION"), &stru_25107A038, CFSTR("Keyboard")), self, sel_setKeyboardPreferenceValue_forSpecifier_, sel_keyboardPreferenceValue_, 0, 6, 0);
    v7 = *MEMORY[0x24BE759E0];
    v17[0] = *MEMORY[0x24BE759E8];
    v17[1] = v7;
    v18[0] = CFSTR("com.apple.InputModePreferences");
    v18[1] = CFSTR("0");
    v8 = *MEMORY[0x24BE75B50];
    v17[2] = *MEMORY[0x24BE75AC0];
    v17[3] = v8;
    v18[2] = CFSTR("FuzzyPinyin");
    v18[3] = CFSTR("FuzzyPinyin");
    objc_msgSend(v6, "setProperties:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4));
    objc_msgSend(v5, "addObject:", v6);
    v9 = objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("FUZZY_PINYIN_PAIRS_GROUP"));
    objc_msgSend(v5, "addObject:", v9);
    v10 = objc_msgSend(v5, "indexOfObject:", v9);
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = v10;
      v12 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
      if (objc_msgSend(v12, "BOOLForPreferenceKey:", *MEMORY[0x24BEB4F58]))
      {
        v13 = v11 + 1;
        v14 = (void *)objc_msgSend(MEMORY[0x24BDD1698], "indexSetWithIndex:", v11 + 1);
        v15 = -[NSArray count](-[KSFuzzyPinyinController fuzzyPinyinPairSpecifiers](self, "fuzzyPinyinPairSpecifiers"), "count");
        if (v15)
        {
          v16 = v15;
          do
          {
            objc_msgSend(v14, "addIndex:", v13++);
            --v16;
          }
          while (v16);
        }
        objc_msgSend(v5, "insertObjects:atIndexes:", -[KSFuzzyPinyinController fuzzyPinyinPairSpecifiers](self, "fuzzyPinyinPairSpecifiers"), v14);
      }
    }
    result = v5;
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)result;
  }
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  unint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableSet *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)KSFuzzyPinyinController;
  -[KSFuzzyPinyinController tableView:didSelectRowAtIndexPath:](&v17, sel_tableView_didSelectRowAtIndexPath_);
  if (objc_msgSend(a4, "section") == 1)
  {
    v7 = objc_msgSend(a4, "row");
    if (v7 < -[NSArray count](-[KSFuzzyPinyinController fuzzyPinyinPairSpecifiers](self, "fuzzyPinyinPairSpecifiers"), "count"))
    {
      v8 = -[NSArray objectAtIndex:](-[KSFuzzyPinyinController fuzzyPinyinPairSpecifiers](self, "fuzzyPinyinPairSpecifiers"), "objectAtIndex:", v7);
      v9 = (void *)objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
      v10 = objc_msgSend(v9, "accessoryType");
      if (v10 == 3)
        v11 = 0;
      else
        v11 = 3;
      objc_msgSend(v9, "setAccessoryType:", v11);
      v12 = objc_msgSend(v8, "propertyForKey:", CFSTR("TISpecifierKeyFuzzyPinyinPair"));
      v13 = -[KSFuzzyPinyinController fuzzyPinyinPairs](self, "fuzzyPinyinPairs");
      if (v10 == 3)
        -[NSMutableSet removeObject:](v13, "removeObject:", v12);
      else
        -[NSMutableSet addObject:](v13, "addObject:", v12);
      v14 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10 != 3);
      objc_msgSend(v8, "setProperty:forKey:", v14, *MEMORY[0x24BE75DA0]);
      v15 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
      v16 = -[NSMutableSet allObjects](-[KSFuzzyPinyinController fuzzyPinyinPairs](self, "fuzzyPinyinPairs"), "allObjects");
      objc_msgSend(v15, "setValue:forPreferenceKey:", v16, *MEMORY[0x24BEB4F50]);
    }
  }
}

- (PSSpecifier)fuzzyPinyinSpecifier
{
  return self->_fuzzyPinyinSpecifier;
}

- (void)setFuzzyPinyinSpecifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1376);
}

- (NSMutableSet)fuzzyPinyinPairs
{
  return self->_fuzzyPinyinPairs;
}

- (void)setFuzzyPinyinPairs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1384);
}

- (void)setFuzzyPinyinPairSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1392);
}

- (void)fuzzyPinyinPairSpecifiers
{
  __assert_rtn("-[KSFuzzyPinyinController fuzzyPinyinPairSpecifiers]", "KSFuzzyPinyinController.m", 59, "[pair count] == 2");
}

@end
