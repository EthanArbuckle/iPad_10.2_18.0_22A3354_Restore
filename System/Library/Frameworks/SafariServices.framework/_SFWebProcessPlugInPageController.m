@implementation _SFWebProcessPlugInPageController

+ (id)pageControllerForBrowserContextController:(id)a3
{
  objc_getAssociatedObject(a3, &kContextControllerToPlugInPageControllerAssociationKey);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 willSendRequestForResource:(unint64_t)a5 request:(id)a6 redirectResponse:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v28;
  void *v29;
  int v30;
  char IsUsingEphemeralSession;
  void *v32;
  id v33;
  void *v34;
  char v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v41 = v12;
  -[WBSWebProcessPlugInPageController webProcessPlugIn](self, "webProcessPlugIn");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "searchEnginesForRedirectToSafeSearch");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v12 = v12;
    v39 = v14;
    objc_msgSend(v12, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v11;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v17 = v39;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v18)
    {
      v40 = v10;
      v19 = *(_QWORD *)v43;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v43 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          if ((objc_msgSend(v21, "urlIsValidSearch:", v15) & 1) != 0)
          {
            objc_msgSend(v21, "safeSearchURLForSearchURL:", v15);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = v40;
            v11 = v16;
            if (v23 && (objc_msgSend(v15, "isEqual:", v23) & 1) == 0)
            {
              v22 = (void *)objc_msgSend(v12, "mutableCopy");
              objc_msgSend(v22, "setURL:", v23);
              objc_msgSend(v22, "setAttribution:", 1);
            }
            else
            {
              v22 = 0;
            }

            goto LABEL_18;
          }
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        if (v18)
          continue;
        break;
      }
      v22 = 0;
      v10 = v40;
    }
    else
    {
      v22 = 0;
    }
    v11 = v16;
LABEL_18:

    if (v22)
    {
      v24 = v22;

      v12 = v24;
    }

  }
  -[WBSWebProcessPlugInPageController webProcessPlugIn](self, "webProcessPlugIn");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v25, "isABTestingEnabled"))
    goto LABEL_24;
  objc_msgSend(v10, "mainFrame");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  if (v26 != v11)
    goto LABEL_23;
  objc_msgSend(v41, "URL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_provisionalURL");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = WBSIsEqual();

  if (!v30)
    goto LABEL_25;
  objc_msgSend(v10, "_bundlePageRef");
  IsUsingEphemeralSession = WKBundlePageIsUsingEphemeralSession();
  -[WBSWebProcessPlugInPageController webProcessPlugIn](self, "webProcessPlugIn");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v12;
  v33 = v32;
  objc_msgSend(v12, "URL");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
    v35 = IsUsingEphemeralSession;
  else
    v35 = 1;
  if ((v35 & 1) != 0 || (v36 = objc_msgSend(v33, "abGroupIdentifier")) == 0)
  {
    v25 = 0;
  }
  else
  {
    objc_msgSend(v33, "defaultSearchProvider");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "urlByIncorporatingGroupIdentifier:ifIsValidSearchResultsURL:", v36, v34);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38 && (WBSIsEqual() & 1) == 0)
    {
      v25 = (id)objc_msgSend(v12, "mutableCopy");
      objc_msgSend(v25, "setURL:", v38);
      objc_msgSend(v25, "setAttribution:", 1);
    }
    else
    {
      v25 = 0;
    }

  }
  if (v25)
  {
    v25 = v25;
    v26 = v12;
    v12 = v25;
LABEL_23:

  }
LABEL_24:

LABEL_25:
  return v12;
}

@end
