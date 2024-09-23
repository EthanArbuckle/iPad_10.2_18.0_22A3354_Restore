@implementation TIHardwareKeyboardModifierRemapDetailController

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = -[TIHardwareKeyboardModifierRemapDetailController newSpecifiers](self, "newSpecifiers");
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)newSpecifiers
{
  void *v3;
  __IOHIDServiceClient *v4;
  TIHardwareKeyboardModifierRemapDetailController *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  char v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v31 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[TIHardwareKeyboardModifierRemapDetailController parentController](self, "parentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (__IOHIDServiceClient *)objc_msgSend(v3, "currentKeyboard");

  v5 = self;
  -[TIHardwareKeyboardModifierRemapDetailController specifier](self, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BE75AC0];
  objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BE75AC0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Function"));
  v10 = v9;
  if (v9)
    v11 = showGlobeKeyInsteadOfFunctionKey(v4);
  else
    v11 = 0;
  v30 = v8;
  attributedTitleForKey(v8, v4, CFSTR(" key"), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "string");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CHOOSE_KEY_ACTION"), &stru_25107A038, CFSTR("Keyboard"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)v12;
  objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%@"), v12);
  v15 = objc_claimAutoreleasedReturnValue();

  v27 = (void *)v15;
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B28]);
  v26 = v16;
  objc_msgSend(v31, "addObject:", v16);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v17 = (id)_dstKeys;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v33;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v33 != v20)
          objc_enumerationMutation(v17);
        v22 = *(id *)(*((_QWORD *)&v32 + 1) + 8 * v21);
        v23 = v22;
        if (((v10 & 1) != 0 || (objc_msgSend(v22, "isEqualToString:", CFSTR("Function")) & 1) == 0)
          && (!v11 || (objc_msgSend(v23, "isEqualToString:", CFSTR("Globe")) & 1) == 0))
        {
          objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, v5, 0, 0, 0, 3, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setProperty:forKey:", v23, v7);
          objc_msgSend(v31, "addObject:", v24);

        }
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v19);
  }

  return v31;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  unint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v46;
  void *v47;
  objc_super v48;

  v6 = a4;
  v48.receiver = self;
  v48.super_class = (Class)TIHardwareKeyboardModifierRemapDetailController;
  v7 = a3;
  -[TIHardwareKeyboardModifierRemapDetailController tableView:cellForRowAtIndexPath:](&v48, sel_tableView_cellForRowAtIndexPath_, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIHardwareKeyboardModifierRemapDetailController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BE75AC0];
  v47 = v9;
  objc_msgSend(v9, "propertyForKey:", *MEMORY[0x24BE75AC0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIHardwareKeyboardModifierRemapDetailController parentController](self, "parentController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  attributedTitleForKey(v11, (__IOHIDServiceClient *)objc_msgSend(v12, "currentKeyboard"), 0, 1);
  v13 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)v13;
  objc_msgSend(v14, "setAttributedText:", v13);

  -[TIHardwareKeyboardModifierRemapDetailController specifier](self, "specifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "propertyForKey:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIHardwareKeyboardModifierRemapDetailController parentController](self, "parentController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "valueForRemappingKey:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setChecked:", objc_msgSend(v11, "isEqualToString:", v18));
  objc_msgSend(v7, "window");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "screen");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scale");
  v22 = v21;

  if (v22 <= 1.0)
    v23 = 1.0;
  else
    v23 = 1.0 / v22;
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSeparatorColor:", v24);

  objc_msgSend(v8, "viewWithTag:", 10086);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v30 = v26;
  v31 = v27;
  v32 = v28;
  v33 = v29;
  if (!v25)
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v26, v27, v28, v29);
    objc_msgSend(v25, "setTag:", 10086);
    objc_msgSend(v25, "setAutoresizingMask:", 10);
    objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBackgroundColor:", v34);

    objc_msgSend(v8, "addSubview:", v25);
  }
  v35 = objc_msgSend(v6, "row");
  -[TIHardwareKeyboardModifierRemapDetailController specifiers](self, "specifiers");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "count") - 3;

  if (v35 == v37)
  {
    v23 = v23 * 3.0;
    v31 = v33 - v23;
  }
  else
  {
    v38 = objc_msgSend(v6, "row");
    -[TIHardwareKeyboardModifierRemapDetailController specifiers](self, "specifiers");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "count") - 2;

    if (v38 >= v40)
    {
      objc_msgSend(v25, "removeFromSuperview");
      v23 = v33;
    }
    else
    {
      objc_msgSend(v8, "separatorInset");
      v30 = v30 + v41;
      v32 = v32 - (v41 + v42);
      v31 = v33 - (v43 + v44) - v23;
    }
  }
  objc_msgSend(v25, "setFrame:", v30, v31, v32, v23);

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  -[TIHardwareKeyboardModifierRemapDetailController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[TIHardwareKeyboardModifierRemapDetailController specifier](self, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BE75AC0];
  objc_msgSend(v8, "propertyForKey:", *MEMORY[0x24BE75AC0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "propertyForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIHardwareKeyboardModifierRemapDetailController parentController](self, "parentController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRemappingFromKey:toValue:", v10, v11);

  -[TIHardwareKeyboardModifierRemapDetailController reloadSpecifiers](self, "reloadSpecifiers");
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

}

@end
