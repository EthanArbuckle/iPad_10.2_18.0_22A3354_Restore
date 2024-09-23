@implementation MKApp

- (MKApp)initWithJSONData:(id)a3
{
  id v4;
  MKApp *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  float v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  MKDevice *v52;
  uint64_t v53;
  BOOL v54;
  uint64_t v55;
  MKApp *v56;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  objc_super v78;
  _BYTE v79[128];
  _QWORD v80[3];
  _QWORD v81[3];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v78.receiver = self;
  v78.super_class = (Class)MKApp;
  v5 = -[MKApp init](&v78, sel_init);
  if (!v5)
    goto LABEL_57;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_56;
  objc_msgSend(v4, "mk_stringForKey:", CFSTR("id"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_56;
  v7 = (void *)v6;
  objc_msgSend(v4, "mk_dictionaryForKey:", CFSTR("attributes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "mk_arrayForKey:", CFSTR("deviceFamilies"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v20 = 1;
      goto LABEL_55;
    }
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKApp setIsiPhoneApp:](v5, "setIsiPhoneApp:", objc_msgSend(v11, "containsObject:", CFSTR("iphone")));
    -[MKApp setIsiPadApp:](v5, "setIsiPadApp:", objc_msgSend(v11, "containsObject:", CFSTR("ipad")));
    -[MKApp setIsiPodApp:](v5, "setIsiPodApp:", objc_msgSend(v11, "containsObject:", CFSTR("ipod")));
    objc_msgSend(v9, "mk_dictionaryForKey:", CFSTR("platformAttributes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12)
    {
      v20 = 1;
LABEL_54:

LABEL_55:
      if (v20)
        goto LABEL_56;
LABEL_57:
      v56 = v5;
      goto LABEL_58;
    }
    objc_msgSend(v12, "mk_dictionaryForKey:", CFSTR("ios"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14)
    {
      v20 = 1;
LABEL_53:

      goto LABEL_54;
    }
    objc_msgSend(v14, "mk_stringForKey:", CFSTR("bundleId"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v15;
    v18 = (void *)v16;
    v69 = v17;
    objc_msgSend(v17, "mk_arrayForKey:", CFSTR("offers"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 1;
    v68 = v18;
    if (v18)
    {
      v15 = v69;
      if (v19)
      {
        v63 = v13;
        v64 = v11;
        v65 = v10;
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v62 = v19;
        v21 = v19;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
        v66 = v7;
        v67 = v9;
        if (v22)
        {
          v23 = *(_QWORD *)v75;
          while (2)
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v75 != v23)
                objc_enumerationMutation(v21);
              v25 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v25, "mk_stringForKey:", CFSTR("type"));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "lowercaseString");
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v25, "mk_numberForKey:", CFSTR("price"));
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if (v28 && (objc_msgSend(v27, "isEqualToString:", CFSTR("get")) & 1) != 0)
                {
                  objc_msgSend(v28, "floatValue");
                  v22 = v29 == 0.0;

                  goto LABEL_27;
                }

              }
            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
            if (v22)
              continue;
            break;
          }
LABEL_27:
          v7 = v66;
          v9 = v67;
          v15 = v69;
        }

        objc_msgSend(v9, "mk_stringForKey:", CFSTR("name"));
        v30 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "mk_stringForKey:", CFSTR("artistName"));
        v31 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "mk_stringForKey:", CFSTR("genreDisplayName"));
        v32 = objc_claimAutoreleasedReturnValue();
        -[MKApp setBundleIdentifier:](v5, "setBundleIdentifier:", v68);
        -[MKApp setAppStoreIdentifier:](v5, "setAppStoreIdentifier:", v7);
        -[MKApp setIsFree:](v5, "setIsFree:", v22);
        v61 = (void *)v30;
        -[MKApp setName:](v5, "setName:", v30);
        v60 = (void *)v31;
        -[MKApp setDeveloper:](v5, "setDeveloper:", v31);
        v59 = (void *)v32;
        -[MKApp setCategory:](v5, "setCategory:", v32);
        objc_msgSend(v15, "mk_dictionaryForKey:", CFSTR("artwork"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "mk_stringForKey:", CFSTR("url"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v80[0] = CFSTR("{h}");
        v80[1] = CFSTR("{c}");
        v81[0] = CFSTR("{w}");
        v81[1] = CFSTR("bb");
        v80[2] = CFSTR("{f}");
        v81[2] = CFSTR("png");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v81, v80, 3);
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v34 = (id)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v71;
          do
          {
            v38 = 0;
            v39 = v33;
            do
            {
              if (*(_QWORD *)v71 != v37)
                objc_enumerationMutation(v34);
              v40 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v38);
              objc_msgSend(v34, "objectForKeyedSubscript:", v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "stringByReplacingOccurrencesOfString:withString:", v40, v41);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              ++v38;
              v39 = v33;
            }
            while (v36 != v38);
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
          }
          while (v36);
        }

        objc_msgSend(&unk_24E36B748, "stringValue");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{w}"), v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKApp setIconURLForiPhone3x:](v5, "setIconURLForiPhone3x:", v43);

        objc_msgSend(&unk_24E36B760, "stringValue");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{w}"), v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKApp setIconURLForiPhone2x:](v5, "setIconURLForiPhone2x:", v45);

        objc_msgSend(&unk_24E36B778, "stringValue");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{w}"), v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKApp setIconURLForiPadPro:](v5, "setIconURLForiPadPro:", v47);

        objc_msgSend(&unk_24E36B790, "stringValue");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{w}"), v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKApp setIconURLForiPad:](v5, "setIconURLForiPad:", v49);

        objc_msgSend(&unk_24E36B7A8, "stringValue");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{w}"), v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKApp setIconURLForAppStore:](v5, "setIconURLForAppStore:", v51);

        v52 = objc_alloc_init(MKDevice);
        v53 = -[MKDevice iconSize](v52, "iconSize");

        if (v53 <= 166)
        {
          v10 = v65;
          if (v53 != 120)
          {
            v54 = v53 == 152;
            v7 = v66;
            v9 = v67;
            if (!v54)
              goto LABEL_51;
            v55 = 88;
            goto LABEL_50;
          }
          v55 = 72;
        }
        else
        {
          v10 = v65;
          if (v53 != 167)
          {
            v9 = v67;
            if (v53 == 180)
            {
              v55 = 64;
              v7 = v66;
            }
            else
            {
              v54 = v53 == 1024;
              v7 = v66;
              if (!v54)
                goto LABEL_51;
              v55 = 96;
            }
LABEL_50:
            -[MKApp setIconURL:](v5, "setIconURL:", *(Class *)((char *)&v5->super.isa + v55));
LABEL_51:

            v20 = 0;
            v13 = v63;
            v11 = v64;
            v15 = v69;
            v19 = v62;
            goto LABEL_52;
          }
          v55 = 80;
        }
        v7 = v66;
        v9 = v67;
        goto LABEL_50;
      }
    }
    else
    {
      v15 = v69;
    }
LABEL_52:

    goto LABEL_53;
  }

LABEL_56:
  v56 = 0;
LABEL_58:

  return v56;
}

- (MKApp)initWithBundleIdentifier:(id)a3 appStoreIdentifier:(id)a4 isFree:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  MKApp *v10;
  MKApp *v11;
  objc_super v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MKApp;
  v10 = -[MKApp init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[MKApp setBundleIdentifier:](v10, "setBundleIdentifier:", v8);
    -[MKApp setAppStoreIdentifier:](v11, "setAppStoreIdentifier:", v9);
    -[MKApp setIsFree:](v11, "setIsFree:", v5);
  }

  return v11;
}

- (BOOL)isSupported:(int64_t)a3
{
  if (a3 == 3)
    return -[MKApp isiPodApp](self, "isiPodApp");
  if (a3 == 2)
    return -[MKApp isiPadApp](self, "isiPadApp");
  return a3 == 1 && -[MKApp isiPhoneApp](self, "isiPhoneApp");
}

- (BOOL)isFree
{
  return self->_isFree;
}

- (void)setIsFree:(BOOL)a3
{
  self->_isFree = a3;
}

- (BOOL)isiPhoneApp
{
  return self->_isiPhoneApp;
}

- (void)setIsiPhoneApp:(BOOL)a3
{
  self->_isiPhoneApp = a3;
}

- (BOOL)isiPadApp
{
  return self->_isiPadApp;
}

- (void)setIsiPadApp:(BOOL)a3
{
  self->_isiPadApp = a3;
}

- (BOOL)isiPodApp
{
  return self->_isiPodApp;
}

- (void)setIsiPodApp:(BOOL)a3
{
  self->_isiPodApp = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)appStoreIdentifier
{
  return self->_appStoreIdentifier;
}

- (void)setAppStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)developer
{
  return self->_developer;
}

- (void)setDeveloper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)iconURLForiPhone3x
{
  return self->_iconURLForiPhone3x;
}

- (void)setIconURLForiPhone3x:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)iconURLForiPhone2x
{
  return self->_iconURLForiPhone2x;
}

- (void)setIconURLForiPhone2x:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)iconURLForiPadPro
{
  return self->_iconURLForiPadPro;
}

- (void)setIconURLForiPadPro:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)iconURLForiPad
{
  return self->_iconURLForiPad;
}

- (void)setIconURLForiPad:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)iconURLForAppStore
{
  return self->_iconURLForAppStore;
}

- (void)setIconURLForAppStore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconURLForAppStore, 0);
  objc_storeStrong((id *)&self->_iconURLForiPad, 0);
  objc_storeStrong((id *)&self->_iconURLForiPadPro, 0);
  objc_storeStrong((id *)&self->_iconURLForiPhone2x, 0);
  objc_storeStrong((id *)&self->_iconURLForiPhone3x, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_developer, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_appStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
