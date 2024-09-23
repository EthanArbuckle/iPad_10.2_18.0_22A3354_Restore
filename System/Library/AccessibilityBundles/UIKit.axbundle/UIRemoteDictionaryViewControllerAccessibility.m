@implementation UIRemoteDictionaryViewControllerAccessibility

void __82___UIRemoteDictionaryViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke(id *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id obj;
  uint64_t v17;
  _QWORD v18[8];
  id v19;
  _QWORD __b[8];
  uint64_t v21;
  id location[3];
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  location[2] = a1;
  location[1] = a1;
  location[0] = (id)objc_msgSend(a1[4], "accessoryView");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    memset(__b, 0, sizeof(__b));
    obj = (id)objc_msgSend(location[0], "allTargets");
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v24, 16);
    if (v17)
    {
      v13 = *(_QWORD *)__b[2];
      v14 = 0;
      v15 = v17;
      while (1)
      {
        v12 = v14;
        if (*(_QWORD *)__b[2] != v13)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(__b[1] + 8 * v14);
        memset(v18, 0, sizeof(v18));
        v10 = (id)objc_msgSend(location[0], "actionsForTarget:forControlEvent:", v21, 64);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v18, v23, 16);
        if (v11)
        {
          v7 = *(_QWORD *)v18[2];
          v8 = 0;
          v9 = v11;
          while (1)
          {
            v6 = v8;
            if (*(_QWORD *)v18[2] != v7)
              objc_enumerationMutation(v10);
            v19 = *(id *)(v18[1] + 8 * v8);
            if ((objc_msgSend(v19, "isEqualToString:", CFSTR("_handleDeleteButton:"), v1) & 1) != 0)
            {
              v4 = accessibilityLocalizedString(CFSTR("dictionary.delete.button"));
              objc_msgSend(location[0], "setAccessibilityLabel:");

              v5 = accessibilityLocalizedString(CFSTR("dictionary.delete.button.hint"));
              objc_msgSend(location[0], "setAccessibilityHint:");

              goto LABEL_16;
            }
            if ((objc_msgSend(v19, "isEqualToString:", CFSTR("_handleDownloadButton:")) & 1) != 0)
              break;
            v1 = v19;
            _AXAssert();
            ++v8;
            if (v6 + 1 >= v9)
            {
              v8 = 0;
              v9 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v18, v23, 16, v1);
              if (!v9)
                goto LABEL_16;
            }
          }
          v2 = accessibilityLocalizedString(CFSTR("dictionary.download.button"));
          objc_msgSend(location[0], "setAccessibilityLabel:");

          v3 = accessibilityLocalizedString(CFSTR("dictionary.download.button.hint"));
          objc_msgSend(location[0], "setAccessibilityHint:");

        }
LABEL_16:

        ++v14;
        if (v12 + 1 >= v15)
        {
          v14 = 0;
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v24, 16);
          if (!v15)
            break;
        }
      }
    }

  }
  objc_storeStrong(location, 0);
}

void __82___UIRemoteDictionaryViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke_233(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "row"));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

@end
