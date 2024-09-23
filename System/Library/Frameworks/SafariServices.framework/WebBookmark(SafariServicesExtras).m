@implementation WebBookmark(SafariServicesExtras)

- (id)_sf_iconKeyColor
{
  void *v1;
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;

  objc_msgSend(a1, "localAttributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("IconKeyColor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("R"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValue");
    v5 = v4;

    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("G"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("B"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("A"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v5, v8, v11, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_sf_setIconKeyColor:()SafariServicesExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "localAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  if (v4)
  {
    v17 = 0.0;
    v18 = 0.0;
    v15 = 0.0;
    v16 = 0.0;
    objc_msgSend(v4, "getRed:green:blue:alpha:", &v18, &v17, &v16, &v15);
    v19[0] = CFSTR("R");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v10;
    v19[1] = CFSTR("G");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v11;
    v19[2] = CFSTR("B");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v12;
    v19[3] = CFSTR("A");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("IconKeyColor"));

  }
  else
  {
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("IconKeyColor"));
  }
  objc_msgSend(a1, "setLocalAttributes:", v9);

}

- (id)_sf_icon
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "iconData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "length"))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

+ (uint64_t)_sf_operationForDropSession:()SafariServicesExtras
{
  return objc_msgSend(a1, "_sf_operationForDropSession:destinationSubtype:", a3, 0);
}

+ (uint64_t)_sf_operationForDropSession:()SafariServicesExtras destinationSubtype:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "items");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v25 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v12, "_sf_localTabGroup");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v22 = 1;
LABEL_31:

          goto LABEL_32;
        }
        objc_msgSend(v12, "_sf_localBookmark");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          if (a4 == 1 && (objc_msgSend(v14, "isFolder") & 1) != 0)
          {

            v22 = 0;
            goto LABEL_31;
          }
          ++v9;
          v8 = v8 || objc_msgSend(v15, "subtype") != a4;
        }
        else
        {
          objc_msgSend(v12, "itemProvider");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "canLoadObjectOfClass:", objc_opt_class());

          v25 += v17;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v7)
        continue;
      break;
    }

    if (v9 == 1 && !v25)
    {
      objc_msgSend(v5, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_sf_localBookmark");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isReadingListItem");

      v21 = 2;
      if (!v8)
        v21 = 3;
      if (v20)
        v22 = 1;
      else
        v22 = v21;
      goto LABEL_32;
    }
    v23 = v25 != 0;
    if (!v9 && v25)
    {
      v22 = 2;
      goto LABEL_32;
    }
  }
  else
  {

    v23 = 0;
    v9 = 0;
  }
  if (!v9)
    v23 = 0;
  v22 = v9 > 1 || v23;
LABEL_32:

  return v22;
}

+ (void)_sf_webBookmarksFromDropSession:()SafariServicesExtras completionHandler:
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0D4EF50];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__WebBookmark_SafariServicesExtras___sf_webBookmarksFromDropSession_completionHandler___block_invoke;
  v8[3] = &unk_1E4AC0B18;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "dropSession:loadObjectsUsingLocalObjectLoader:objectLoader:completionHandler:", a3, localObjectLoader, objectLoader, v8);

}

- (uint64_t)_sf_contextMenuUsingCollection:()SafariServicesExtras withUserInfo:handler:
{
  return objc_msgSend(a1, "_sf_contextMenuUsingCollection:tabGroupActionProvider:withUserInfo:handler:", a3, 0, a4, a5);
}

- (id)_sf_contextMenuUsingCollection:()SafariServicesExtras tabGroupActionProvider:withUserInfo:handler:
{
  void *v6;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void (**v21)(_QWORD, _QWORD);
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  BOOL v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD *v59;
  id *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v71;
  id v72;
  int v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  _QWORD v79[6];
  id v80;
  BOOL v81;
  _QWORD v82[6];
  id v83;
  BOOL v84;
  _QWORD v85[4];
  id v86;
  void *v87;
  id v88;
  id v89;
  _QWORD v90[5];
  id v91;
  id v92;
  id v93;
  _QWORD v94[5];
  id v95;
  id v96;
  _QWORD v97[4];
  id v98;
  _QWORD v99[4];
  id v100;
  _QWORD v101[4];
  id v102;
  void *v103;
  id v104;
  id v105;
  char v106;
  _QWORD v107[4];
  char v108;
  _QWORD v109[6];
  _QWORD v110[5];
  id location;
  _QWORD v112[5];

  v112[3] = *MEMORY[0x1E0C80C00];
  v78 = a3;
  v72 = a4;
  v74 = a5;
  v71 = a6;
  objc_initWeak(&location, v71);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "address");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v78, "bookmarkContainsLeafBookmark:", a1);
  if ((objc_msgSend(a1, "isFolder") & 1) != 0 || !objc_msgSend(v75, "length"))
  {
    if ((objc_msgSend(a1, "isFolder") & v73) != 1)
      goto LABEL_7;
    v16 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v109[0] = MEMORY[0x1E0C809B0];
    v109[1] = 3221225472;
    v109[2] = __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke_2;
    v109[3] = &unk_1E4AC0B80;
    v14 = v109;
    v109[4] = v78;
    v109[5] = a1;
    objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", v17, v18, 0, v109);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "addObject:", v19);

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v110[0] = MEMORY[0x1E0C809B0];
    v110[1] = 3221225472;
    v110[2] = __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke;
    v110[3] = &unk_1E4ABFA58;
    v14 = v110;
    v110[4] = v75;
    objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v12, v13, 0, v110);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "addObject:", v15);

  }
LABEL_7:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    v20 = objc_msgSend(a1, "isFolder");
    v107[0] = MEMORY[0x1E0C809B0];
    v107[1] = 3221225472;
    v107[2] = __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke_4;
    v107[3] = &__block_descriptor_33_e18___NSString_16__0q8l;
    v108 = v20;
    v21 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A8598C40](v107);
    v101[0] = MEMORY[0x1E0C809B0];
    v101[1] = 3221225472;
    v101[2] = __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke_5;
    v101[3] = &unk_1E4AC0BF0;
    v106 = v20;
    v22 = v72;
    v102 = v22;
    v103 = a1;
    objc_copyWeak(&v105, &location);
    v104 = v74;
    v23 = (void *)MEMORY[0x1A8598C40](v101);
    v24 = (void *)MEMORY[0x1E0DC3428];
    v21[2](v21, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus.square.on.square"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v99[0] = MEMORY[0x1E0C809B0];
    v99[1] = 3221225472;
    v99[2] = __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke_7;
    v99[3] = &unk_1E4AC0C18;
    v27 = v23;
    v100 = v27;
    objc_msgSend(v24, "actionWithTitle:image:identifier:handler:", v25, v26, 0, v99);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "addObject:", v28);

    if (v22)
    {
      objc_msgSend(v78, "descendantsOfBookmarkFolder:", a1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "count");
      v31 = (void *)MEMORY[0x1E0C99E98];
      if (v30)
      {
        objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "address");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v32 = v75;
      }
      objc_msgSend(v31, "URLWithString:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {

      }
      if (!v20
        || (objc_msgSend(a1, "isBookmarksBarFolder") & 1) != 0
        || (objc_msgSend(a1, "isBookmarksMenuFolder") & 1) != 0)
      {
        v34 = 0;
      }
      else
      {
        objc_msgSend(a1, "localizedTitle");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v97[0] = MEMORY[0x1E0C809B0];
      v97[1] = 3221225472;
      v97[2] = __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke_8;
      v97[3] = &unk_1E4AC0230;
      v98 = v27;
      objc_msgSend(v22, "openInTabGroupMenuWithNewTabGroupName:URL:descendantCount:handler:", v34, v33, v30, v97);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "addObject:", v35);

    }
    objc_destroyWeak(&v105);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "bookmarkWithID:", objc_msgSend(a1, "parentID"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(a1, "subtype");
  v39 = v38 == 5;
  if (objc_msgSend(a1, "isEditable")
    && v38 != 5
    && (objc_msgSend(v37, "isWebFilterAllowedSitesFolder") & 1) == 0
    && (objc_msgSend(a1, "isReadingListItem") & 1) == 0)
  {
    v40 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.pencil"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v94[0] = MEMORY[0x1E0C809B0];
    v94[1] = 3221225472;
    v94[2] = __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke_9;
    v94[3] = &unk_1E4ABFAD0;
    objc_copyWeak(&v96, &location);
    v94[4] = a1;
    v95 = v74;
    objc_msgSend(v40, "actionWithTitle:image:identifier:handler:", v41, v42, 0, v94);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObject:", v43);

    objc_destroyWeak(&v96);
  }
  v44 = objc_loadWeakRetained(&location);
  v45 = objc_opt_respondsToSelector();

  if ((v45 & 1) != 0)
  {
    if ((objc_msgSend(a1, "isFolder") & 1) != 0 || !objc_msgSend(v75, "length"))
    {
      if ((objc_msgSend(a1, "isFolder") & v73) == 1)
      {
        v50 = (void *)MEMORY[0x1E0DC3428];
        _WBSLocalizedString();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.up"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v85[0] = MEMORY[0x1E0C809B0];
        v85[1] = 3221225472;
        v85[2] = __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke_11;
        v85[3] = &unk_1E4AC0C88;
        v86 = v78;
        v87 = a1;
        objc_copyWeak(&v89, &location);
        v88 = v74;
        objc_msgSend(v50, "actionWithTitle:image:identifier:handler:", v51, v52, 0, v85);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObject:", v53);

        objc_destroyWeak(&v89);
      }
    }
    else
    {
      v46 = (void *)MEMORY[0x1E0DC3428];
      _WBSLocalizedString();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.up"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v90[0] = MEMORY[0x1E0C809B0];
      v90[1] = 3221225472;
      v90[2] = __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke_10;
      v90[3] = &unk_1E4AC0C40;
      objc_copyWeak(&v93, &location);
      v90[4] = a1;
      v91 = v75;
      v92 = v74;
      objc_msgSend(v46, "actionWithTitle:image:identifier:handler:", v47, v48, 0, v90);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addObject:", v49);

      objc_destroyWeak(&v93);
    }
  }
  if (objc_msgSend(a1, "isDeletable") && (objc_msgSend(v37, "isWebFilterAllowedSitesFolder") & 1) == 0)
  {
    v54 = objc_msgSend(MEMORY[0x1E0D8A8F8], "is2024SuggestionsEnabled");
    if (v38 == 5)
      v55 = v54;
    else
      v55 = 0;
    v56 = (void *)MEMORY[0x1E0DC3428];
    if (v55 == 1)
    {
      _WBSLocalizedString();
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("minus.circle"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v82[0] = MEMORY[0x1E0C809B0];
      v82[1] = 3221225472;
      v82[2] = __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke_13;
      v82[3] = &unk_1E4ABFA30;
      v59 = v82;
      v60 = &v83;
      objc_copyWeak(&v83, &location);
      v82[4] = a1;
      v82[5] = v74;
      v84 = v39;
      objc_msgSend(v56, "actionWithTitle:image:identifier:handler:", v57, v58, 0, v82);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "addObject:", v61);
    }
    else
    {
      _WBSLocalizedString();
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke_14;
      v79[3] = &unk_1E4ABFA30;
      v59 = v79;
      v60 = &v80;
      objc_copyWeak(&v80, &location);
      v79[4] = a1;
      v79[5] = v74;
      v81 = v39;
      objc_msgSend(v56, "actionWithTitle:image:identifier:handler:", v62, v63, 0, v79);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v61, "setAttributes:", 2);
      objc_msgSend(v36, "addObject:", v61);
    }

    objc_destroyWeak(v60);
  }
  v64 = (void *)MEMORY[0x1E0DC39D0];
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E4AC8470, 0, 0, 1, v76);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v112[0] = v65;
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E4AC8470, 0, 0, 1, v77);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v112[1] = v66;
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E4AC8470, 0, 0, 1, v36);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v112[2] = v67;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 3);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "menuWithTitle:children:", &stru_1E4AC8470, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&location);
  return v69;
}

@end
