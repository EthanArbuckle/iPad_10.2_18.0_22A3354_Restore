@implementation SUUIMenuBarTemplateElement

- (SUUIMenuBarViewElement)menuBar
{
  void *v3;
  void *v4;

  -[SUUIMenuBarTemplateElement _menuBarChildOfElement:](self, "_menuBarChildOfElement:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SUUIMenuBarTemplateElement navigationBarElement](self, "navigationBarElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMenuBarTemplateElement _menuBarChildOfElement:](self, "_menuBarChildOfElement:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (SUUIMenuBarViewElement *)v3;
}

- (id)_menuBarChildOfElement:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "children");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "conformsToProtocol:", &unk_2571F1898, (_QWORD)v9))
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (SUUINavigationBarViewElement)navigationBarElement
{
  return (SUUINavigationBarViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 74);
}

@end
