@implementation AXElement(AXFocusEngine)

- (id)typeaheadQueryString
{
  return objc_getAssociatedObject(a1, &_FKAAXElementCategory_typeaheadQueryString);
}

- (void)setTypeaheadQueryString:()AXFocusEngine
{
  objc_setAssociatedObject(a1, &_FKAAXElementCategory_typeaheadQueryString, a3, (void *)1);
}

- (id)elementName
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "typeaheadQueryString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (v3)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(a1, "userInputLabels", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v9, "lowercaseString");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "typeaheadQueryString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "lowercaseString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v10, "containsString:", v12);

          if ((v13 & 1) != 0)
          {
            v14 = v9;
            goto LABEL_13;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v6)
          continue;
        break;
      }
    }

  }
  objc_msgSend(a1, "userInputLabels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
  v15 = v14;

  return v15;
}

- (double)elementLabelContainerSize
{
  return *MEMORY[0x24BDBF148];
}

- (uint64_t)isSpacer
{
  return 0;
}

- (uint64_t)hasRemoteFocusSystem
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "uiElement");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLWithAXAttribute:", 12008);

  return v2;
}

- (uint64_t)applicationIsExtension
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "uiElement");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLWithAXAttribute:", 3047);

  return v2;
}

- (id)elementForRemoteFocusSystem
{
  void *v2;
  void *v3;
  void *v4;
  const void *AppElementWithPid;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;

  if (!objc_msgSend(a1, "hasRemoteFocusSystem"))
    return 0;
  objc_msgSend(a1, "remoteSceneID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uiElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithAXAttribute:", 12009);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intValue");

  AppElementWithPid = (const void *)_AXUIElementCreateAppElementWithPid();
  objc_msgSend(MEMORY[0x24BDFEA68], "elementWithAXUIElement:", AppElementWithPid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (AppElementWithPid)
    CFRelease(AppElementWithPid);
  objc_msgSend(v6, "elementForAttribute:parameter:", 95256, v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "focusContainersForCurrentSceneIdentifier:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __55__AXElement_AXFocusEngine__elementForRemoteFocusSystem__block_invoke;
  v15[3] = &unk_24EBCD8E0;
  v10 = v9;
  v16 = v10;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v15);
  if (objc_msgSend(v10, "count") == 1)
  {
    objc_msgSend(v10, "firstObject");
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v11;
  }
  if (v7)
    v12 = v7;
  else
    v12 = v6;
  v13 = v12;

  return v13;
}

- (id)applicationForHostFocusSystem
{
  void *v1;
  void *v2;
  int v3;
  const void *AppElementWithPid;
  void *v5;

  objc_msgSend(a1, "uiElement");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "numberWithAXAttribute:", 12010);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  if (v3 < 1)
  {
    v5 = 0;
  }
  else
  {
    AppElementWithPid = (const void *)_AXUIElementCreateAppElementWithPid();
    objc_msgSend(MEMORY[0x24BDFEA68], "elementWithAXUIElement:", AppElementWithPid);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (AppElementWithPid)
      CFRelease(AppElementWithPid);
  }
  return v5;
}

- (uint64_t)currentFocusElement
{
  return objc_msgSend(a1, "elementForAttribute:shouldFetchAttributes:", 3024, 0);
}

- (id)remoteSceneID
{
  void *v2;
  void *v3;

  if (objc_msgSend(a1, "hasRemoteFocusSystem"))
  {
    objc_msgSend(a1, "uiElement");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectWithAXAttribute:", 12014);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)focusOnRemoteSceneID
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "remoteSceneID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "elementForRemoteFocusSystem");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "application");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "performAction:withValue:", 5310, v4);

  }
}

- (uint64_t)focusOnApplication
{
  return objc_msgSend(a1, "performAction:withValue:", 5308, MEMORY[0x24BDBD1C8]);
}

- (uint64_t)enableFocus
{
  return objc_msgSend(a1, "performAction:withValue:", 5305, MEMORY[0x24BDBD1C8]);
}

- (uint64_t)disableFocus
{
  return objc_msgSend(a1, "performAction:withValue:", 5305, MEMORY[0x24BDBD1C0]);
}

- (void)didFocus
{
  id v1;

  objc_msgSend(a1, "uiElement");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "performAXAction:", 5307);

}

- (uint64_t)moveFocusWithHeading:()AXFocusEngine byGroup:
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a1, "performAction:withValue:", 5300, v8);

  return v9;
}

- (uint64_t)moveFocusWithHeading:()AXFocusEngine withQueryString:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(a1, "performAction:withValue:", 5304, v9);
  return v10;
}

- (uint64_t)hasNativeFocusElements
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "uiElement");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLWithAXAttribute:", 3048);

  return v2;
}

@end
