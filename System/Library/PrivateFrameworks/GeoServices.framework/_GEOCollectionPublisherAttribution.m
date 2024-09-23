@implementation _GEOCollectionPublisherAttribution

- (_GEOCollectionPublisherAttribution)initWithPublisherAttributionSource:(id)a3 preferredLanguages:(id)a4
{
  id v6;
  id v7;
  _GEOCollectionPublisherAttribution *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSURL *websiteURL;
  uint64_t v13;
  NSString *applicationAdamId;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  id v34;
  void *v35;
  BOOL v36;
  uint64_t v37;
  NSString *displayName;
  uint64_t v39;
  NSString *subtitle;
  uint64_t v41;
  NSString *themeColorLightMode;
  uint64_t v43;
  NSString *themeColorDarkMode;
  id v46;
  _GEOCollectionPublisherAttribution *v47;
  id v48;
  void *v49;
  id v50;
  id obj;
  objc_super v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v52.receiver = self;
  v52.super_class = (Class)_GEOCollectionPublisherAttribution;
  v8 = -[_GEOCollectionPublisherAttribution init](&v52, sel_init);
  if (!v8)
    goto LABEL_36;
  v9 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v6, "websiteURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLWithString:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  websiteURL = v8->_websiteURL;
  v8->_websiteURL = (NSURL *)v11;

  objc_msgSend(v6, "appAdamID");
  v13 = objc_claimAutoreleasedReturnValue();
  applicationAdamId = v8->_applicationAdamId;
  v47 = v8;
  v8->_applicationAdamId = (NSString *)v13;

  v48 = v6;
  objc_msgSend(v6, "localizedAttributions");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v50 = v7;
  v16 = v7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v18 = v15;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
  if (v19)
  {
    v20 = v19;
    v21 = 0;
    v22 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v58 != v22)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        if (objc_msgSend(v24, "hasLanguage"))
        {
          objc_msgSend(v24, "language");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v25);

        }
        else if (!v21)
        {
          v21 = v24;
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    }
    while (v20);
  }
  else
  {
    v21 = 0;
  }

  v49 = v16;
  objc_msgSend(MEMORY[0x1E0C99DC8], "mostPreferredLanguageOf:withPreferredLanguages:forUsage:options:", v17, v16, 1, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = v18;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v54;
LABEL_18:
      v30 = 0;
      while (1)
      {
        if (*(_QWORD *)v54 != v29)
          objc_enumerationMutation(obj);
        v31 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v30);
        objc_msgSend(v31, "language");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "isEqualToString:", v26);

        if ((v33 & 1) != 0)
          break;
        if (v28 == ++v30)
        {
          v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
          if (v28)
            goto LABEL_18;
          goto LABEL_24;
        }
      }
      v34 = v31;

      if (v34)
        v36 = v21 == 0;
      else
        v36 = 1;
      if (!v36)
      {
        v46 = (id)objc_msgSend(v21, "copy");
        objc_msgSend(v46, "mergeFrom:", v34);
        v8 = v47;
        v6 = v48;
        goto LABEL_35;
      }
      if (v34)
        v35 = v34;
      else
        v35 = v21;
      goto LABEL_34;
    }
LABEL_24:

  }
  v34 = 0;
  v35 = v21;
LABEL_34:
  v8 = v47;
  v6 = v48;
  v46 = v35;
LABEL_35:

  objc_msgSend(v46, "displayName");
  v37 = objc_claimAutoreleasedReturnValue();
  displayName = v8->_displayName;
  v8->_displayName = (NSString *)v37;

  objc_msgSend(v46, "subtitle");
  v39 = objc_claimAutoreleasedReturnValue();
  subtitle = v8->_subtitle;
  v8->_subtitle = (NSString *)v39;

  v8->_iconIdentifier = objc_msgSend(v46, "iconIdentifier");
  v8->_logoIdentifier = objc_msgSend(v46, "logoIdentifier");
  v8->_logoWithoutPaddingIdentifier = objc_msgSend(v46, "logoWithoutPaddingIdentifier");
  v8->_logoCenteredIdentifier = objc_msgSend(v46, "logoCenteredIdentifier");
  v8->_logoCenteredColorizedIdentifier = objc_msgSend(v46, "logoCenteredColorizedIdentifier");
  objc_msgSend(v46, "themeColorLightMode");
  v41 = objc_claimAutoreleasedReturnValue();
  themeColorLightMode = v8->_themeColorLightMode;
  v8->_themeColorLightMode = (NSString *)v41;

  objc_msgSend(v46, "themeColorDarkMode");
  v43 = objc_claimAutoreleasedReturnValue();
  themeColorDarkMode = v8->_themeColorDarkMode;
  v8->_themeColorDarkMode = (NSString *)v43;

  v7 = v50;
LABEL_36:

  return v8;
}

- (NSURL)websiteURL
{
  return self->_websiteURL;
}

- (NSString)applicationAdamId
{
  return self->_applicationAdamId;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (unsigned)iconIdentifier
{
  return self->_iconIdentifier;
}

- (unsigned)logoIdentifier
{
  return self->_logoIdentifier;
}

- (unsigned)logoWithoutPaddingIdentifier
{
  return self->_logoWithoutPaddingIdentifier;
}

- (unsigned)logoCenteredIdentifier
{
  return self->_logoCenteredIdentifier;
}

- (unsigned)logoCenteredColorizedIdentifier
{
  return self->_logoCenteredColorizedIdentifier;
}

- (NSString)themeColorLightMode
{
  return self->_themeColorLightMode;
}

- (NSString)themeColorDarkMode
{
  return self->_themeColorDarkMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themeColorDarkMode, 0);
  objc_storeStrong((id *)&self->_themeColorLightMode, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_applicationAdamId, 0);
  objc_storeStrong((id *)&self->_websiteURL, 0);
}

@end
