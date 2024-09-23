@implementation MKPunchoutOptions

+ (id)punchoutOptionsForURLStrings:(id)a3 withAttribution:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  char v31;
  uint64_t v32;
  MKPunchoutOptions *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v6;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
  v51 = v9;
  if (v10)
  {
    v47 = v10;
    v11 = *(_QWORD *)v61;
    v12 = *MEMORY[0x1E0D26400];
    v13 = 0x1E0C99000uLL;
    do
    {
      v14 = 0;
      v15 = v47;
      do
      {
        if (*(_QWORD *)v61 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(v13 + 3736), "URLWithString:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v14));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "scheme");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", v12);

        if (v18)
        {
          objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "applicationsAvailableForOpeningURL:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          objc_msgSend(v8, "attributionApps");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v56, &v65, 16);
          if (v48)
          {
            v22 = *(_QWORD *)v57;
            v49 = v21;
            v50 = v8;
            v44 = v12;
            v45 = v11;
            v43 = v20;
            v46 = *(_QWORD *)v57;
            do
            {
              v23 = 0;
              do
              {
                if (*(_QWORD *)v57 != v22)
                  objc_enumerationMutation(v21);
                objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * v23), "appBundleIdentifier");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = 0u;
                v53 = 0u;
                v54 = 0u;
                v55 = 0u;
                v25 = v20;
                v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
                if (v26)
                {
                  v27 = v26;
                  v28 = *(_QWORD *)v53;
                  while (2)
                  {
                    for (i = 0; i != v27; ++i)
                    {
                      if (*(_QWORD *)v53 != v28)
                        objc_enumerationMutation(v25);
                      objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "bundleIdentifier");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      v31 = objc_msgSend(v30, "isEqualToString:", v24);

                      if ((v31 & 1) != 0)
                      {
                        v33 = objc_alloc_init(MKPunchoutOptions);
                        -[MKPunchoutOptions setStrategy:](v33, "setStrategy:", 1);
                        -[MKPunchoutOptions setAppBundleIdentifier:](v33, "setAppBundleIdentifier:", v24);
                        -[MKPunchoutOptions setUrlToOpen:](v33, "setUrlToOpen:", v16);

                        v8 = v50;
                        v9 = v51;
                        goto LABEL_28;
                      }
                    }
                    v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
                    if (v27)
                      continue;
                    break;
                  }
                }

                ++v23;
                v21 = v49;
                v8 = v50;
                v9 = v51;
                v12 = v44;
                v11 = v45;
                v13 = 0x1E0C99000;
                v20 = v43;
                v22 = v46;
              }
              while (v23 != v48);
              v32 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v56, &v65, 16);
              v22 = v46;
              v15 = v47;
              v48 = v32;
            }
            while (v32);
          }

        }
        ++v14;
      }
      while (v14 != v15);
      v33 = 0;
      v47 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    }
    while (v47);
  }
  else
  {
    v33 = 0;
  }
LABEL_28:

  if (!v33)
  {
    v34 = v9;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v35 = v34;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v66;
      while (2)
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v66 != v38)
            objc_enumerationMutation(v35);
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "scheme");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v41, "isEqualToString:", CFSTR("http")) & 1) != 0
            || (objc_msgSend(v41, "isEqualToString:", CFSTR("https")) & 1) != 0)
          {
            v33 = objc_alloc_init(MKPunchoutOptions);
            -[MKPunchoutOptions setStrategy:](v33, "setStrategy:", 2);
            -[MKPunchoutOptions setUrlToOpen:](v33, "setUrlToOpen:", v40);

            v9 = v51;
            goto LABEL_41;
          }

        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
        v33 = 0;
        v9 = v51;
        if (v37)
          continue;
        break;
      }
    }
    else
    {
      v33 = 0;
    }
LABEL_41:

  }
  return v33;
}

- (NSURL)urlToOpen
{
  return self->_urlToOpen;
}

- (void)setUrlToOpen:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)strategy
{
  return self->_strategy;
}

- (void)setStrategy:(int64_t)a3
{
  self->_strategy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_urlToOpen, 0);
}

@end
