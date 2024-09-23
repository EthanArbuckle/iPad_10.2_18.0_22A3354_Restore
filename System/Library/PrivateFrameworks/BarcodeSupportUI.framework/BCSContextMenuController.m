@implementation BCSContextMenuController

- (void)showMenuForAction:(id)a3 fromView:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIMenu *v17;
  UIMenu *actionPickerMenu;
  void *v19;
  id v20;
  void *v21;
  id obj;
  _QWORD v23[6];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v20 = a4;
  objc_storeStrong((id *)&self->_viewForMenu, a4);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = v6;
  objc_msgSend(v6, "actionPickerItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x24BEBD388];
        objc_msgSend(v12, "label");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "icon");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __55__BCSContextMenuController_showMenuForAction_fromView___block_invoke;
        v23[3] = &unk_250864078;
        v23[4] = self;
        v23[5] = v12;
        objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v14, v15, 0, v23);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "addObject:", v16);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x24BEBD748], "menuWithChildren:", v7);
  v17 = (UIMenu *)objc_claimAutoreleasedReturnValue();
  actionPickerMenu = self->_actionPickerMenu;
  self->_actionPickerMenu = v17;

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD500]), "initWithDelegate:", self);
  -[UIView addInteraction:](self->_viewForMenu, "addInteraction:", v19);
  objc_msgSend(v19, "_presentMenuAtLocation:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

}

void __55__BCSContextMenuController_showMenuForAction_fromView___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __82__BCSContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v5[3] = &unk_2508640A0;
  v5[4] = self;
  objc_msgSend(MEMORY[0x24BEBD4F8], "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __82__BCSContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  void (**finishAction)(id, BCSActionPickerItem *);
  BCSActionPickerItem *selectedItem;

  -[UIView removeInteraction:](self->_viewForMenu, "removeInteraction:", a3, a4, a5);
  finishAction = (void (**)(id, BCSActionPickerItem *))self->_finishAction;
  if (finishAction)
    finishAction[2](finishAction, self->_selectedItem);
  selectedItem = self->_selectedItem;
  self->_selectedItem = 0;

}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  void *v4;

  objc_msgSend(MEMORY[0x24BEBDBB8], "defaultStyle", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreferredLayout:", 3);
  return v4;
}

- (id)finishAction
{
  return self->_finishAction;
}

- (void)setFinishAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishAction, 0);
  objc_storeStrong((id *)&self->_actionPickerMenu, 0);
  objc_storeStrong((id *)&self->_selectedItem, 0);
  objc_storeStrong((id *)&self->_viewForMenu, 0);
}

@end
