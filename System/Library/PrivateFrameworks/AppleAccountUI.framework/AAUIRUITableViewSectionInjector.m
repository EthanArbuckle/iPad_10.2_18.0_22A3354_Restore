@implementation AAUIRUITableViewSectionInjector

- (AAUIRUITableViewSectionInjector)initWithTableView:(id)a3 ruiTableView:(id)a4 injectWith:(id)a5
{
  id v9;
  id v10;
  AAUIRUITableViewSectionInjector *v11;
  AAUIRUITableViewSectionInjector *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AAUIRUITableViewSectionInjector;
  v11 = -[AAUITableViewDecorator initWithTableView:](&v14, sel_initWithTableView_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_remoteTableViewController, a4);
    objc_storeStrong((id *)&v12->_viewToInject, a5);
  }

  return v12;
}

+ (BOOL)shouldInject:(id)a3 inPage:(id)a4
{
  id v5;
  id v6;
  int v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "hasTableView");
  v8 = 0;
  if (v5 && v7)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v6, "tableViewOM", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "attributes");
          v15 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v15, "objectForKeyedSubscript:", CFSTR("appleAccountAction"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(v15) = objc_msgSend(v16, "isEqualToString:", v5);
          if ((v15 & 1) != 0)
          {
            v8 = 1;
            goto LABEL_13;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v12)
          continue;
        break;
      }
    }
    v8 = 0;
LABEL_13:

  }
  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;

  v6 = a3;
  if (-[AAUIRUITableViewSectionInjector _shouldInjectViewInSection:](self, "_shouldInjectViewInSection:", a4))
  {
    -[UIView intrinsicContentSize](self->_viewToInject, "intrinsicContentSize");
    v8 = v7;
  }
  else
  {
    -[RUITableView tableView:heightForFooterInSection:](self->_remoteTableViewController, "tableView:heightForFooterInSection:", v6, a4);
    v8 = v9;
  }

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  UIView *v7;
  UIView *v8;

  v6 = a3;
  if (-[AAUIRUITableViewSectionInjector _shouldInjectViewInSection:](self, "_shouldInjectViewInSection:", a4))
  {
    -[UIView setAccessibilityIdentifier:](self->_viewToInject, "setAccessibilityIdentifier:", CFSTR("injected-view"));
    v7 = self->_viewToInject;
  }
  else
  {
    -[RUITableView tableView:viewForFooterInSection:](self->_remoteTableViewController, "tableView:viewForFooterInSection:", v6, a4);
    v7 = (UIView *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (BOOL)_shouldInjectViewInSection:(int64_t)a3
{
  NSString **p_injectionType;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  char v12;

  p_injectionType = &self->_injectionType;
  WeakRetained = objc_loadWeakRetained((id *)&self->_injectionType);

  if (!WeakRetained)
    return 0;
  -[RUITableView sections](self->_remoteTableViewController, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("appleAccountAction"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    return 0;
  v11 = objc_loadWeakRetained((id *)p_injectionType);
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  return (v12 & 1) != 0;
}

- (NSString)injectionType
{
  return (NSString *)objc_loadWeakRetained((id *)&self->_injectionType);
}

- (void)setInjectionType:(id)a3
{
  objc_storeWeak((id *)&self->_injectionType, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_injectionType);
  objc_storeStrong((id *)&self->_viewToInject, 0);
  objc_storeStrong((id *)&self->_remoteTableViewController, 0);
}

@end
