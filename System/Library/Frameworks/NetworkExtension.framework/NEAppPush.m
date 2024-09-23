@implementation NEAppPush

- (NEAppPush)init
{
  NEAppPush *v2;
  NEAppPush *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NEAppPush;
  v2 = -[NEAppPush init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[NEAppPush setEnabled:](v2, "setEnabled:", 0);
  return v3;
}

- (NEAppPush)initWithCoder:(id)a3
{
  id v4;
  NEAppPush *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *matchSSIDs;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSDictionary *providerConfiguration;
  uint64_t v19;
  NSString *providerBundleIdentifier;
  uint64_t v21;
  NSString *pluginType;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSArray *matchPrivateLTENetworks;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NEAppPush;
  v5 = -[NEAppPush init](&v29, sel_init);
  if (v5)
  {
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Enabled"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("MatchSSIDs"));
    v9 = objc_claimAutoreleasedReturnValue();
    matchSSIDs = v5->_matchSSIDs;
    v5->_matchSSIDs = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("ProviderConfig"));
    v17 = objc_claimAutoreleasedReturnValue();
    providerConfiguration = v5->_providerConfiguration;
    v5->_providerConfiguration = (NSDictionary *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProviderBundleID"));
    v19 = objc_claimAutoreleasedReturnValue();
    providerBundleIdentifier = v5->_providerBundleIdentifier;
    v5->_providerBundleIdentifier = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PluginType"));
    v21 = objc_claimAutoreleasedReturnValue();
    pluginType = v5->_pluginType;
    v5->_pluginType = (NSString *)v21;

    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("MatchPLTEs"));
    v26 = objc_claimAutoreleasedReturnValue();
    matchPrivateLTENetworks = v5->_matchPrivateLTENetworks;
    v5->_matchPrivateLTENetworks = (NSArray *)v26;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[NEAppPush isEnabled](self, "isEnabled"), CFSTR("Enabled"));
  -[NEAppPush matchSSIDs](self, "matchSSIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MatchSSIDs"));

  -[NEAppPush providerConfiguration](self, "providerConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("ProviderConfig"));

  -[NEAppPush providerBundleIdentifier](self, "providerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("ProviderBundleID"));

  -[NEAppPush pluginType](self, "pluginType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("PluginType"));

  -[NEAppPush matchPrivateLTENetworks](self, "matchPrivateLTENetworks");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("MatchPLTEs"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NEAppPush *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = -[NEAppPush init](+[NEAppPush allocWithZone:](NEAppPush, "allocWithZone:", a3), "init");
  -[NEAppPush setEnabled:](v4, "setEnabled:", -[NEAppPush isEnabled](self, "isEnabled"));
  -[NEAppPush matchSSIDs](self, "matchSSIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAppPush setMatchSSIDs:](v4, "setMatchSSIDs:", v5);

  -[NEAppPush providerConfiguration](self, "providerConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAppPush setProviderConfiguration:](v4, "setProviderConfiguration:", v6);

  -[NEAppPush providerBundleIdentifier](self, "providerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAppPush setProviderBundleIdentifier:](v4, "setProviderBundleIdentifier:", v7);

  -[NEAppPush pluginType](self, "pluginType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAppPush setPluginType:](v4, "setPluginType:", v8);

  -[NEAppPush matchPrivateLTENetworks](self, "matchPrivateLTENetworks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAppPush setMatchPrivateLTENetworks:](v4, "setMatchPrivateLTENetworks:", v9);

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t j;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  unint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  BOOL v48;
  void *v50;
  __CFString *v51;
  uint64_t v52;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  NEAppPush *v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NEAppPush matchSSIDs](self, "matchSSIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {

  }
  else
  {
    -[NEAppPush matchPrivateLTENetworks](self, "matchPrivateLTENetworks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (!v7)
    {
      v10 = CFSTR("Empty SSID list or private LTE network list");
      goto LABEL_46;
    }
  }
  -[NEAppPush matchSSIDs](self, "matchSSIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 < 0xB)
  {
    -[NEAppPush matchPrivateLTENetworks](self, "matchPrivateLTENetworks");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12 < 0xB)
    {
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      -[NEAppPush matchSSIDs](self, "matchSSIDs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v59;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v59 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
            if (!isa_nsstring(v18) || !objc_msgSend(v18, "length"))
            {
              +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid/Empty SSID string in the SSID list"), v4);

              goto LABEL_47;
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
          if (v15)
            continue;
          break;
        }
      }

      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      -[NEAppPush matchPrivateLTENetworks](self, "matchPrivateLTENetworks");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
      if (v19)
      {
        v20 = v19;
        v52 = *(_QWORD *)v55;
        v21 = 0x1E0CB3000uLL;
        while (2)
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v55 != v52)
              objc_enumerationMutation(obj);
            v23 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
            objc_msgSend(v23, "mobileCountryCode", v52);
            v24 = (id)objc_claimAutoreleasedReturnValue();
            v25 = v24;
            if (!self || !isa_nsstring(v24) || objc_msgSend(v25, "length") != 3)
            {
              v50 = v25;
              v51 = CFSTR("Invalid MCC/MNC in Private LTE configuration");
              goto LABEL_57;
            }
            objc_msgSend(*(id *)(v21 + 1280), "decimalDigitCharacterSet");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "invertedSet");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            v28 = objc_msgSend(v25, "rangeOfCharacterFromSet:", v27);
            if (v28 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v51 = CFSTR("Invalid MCC/MNC in Private LTE configuration");
              goto LABEL_58;
            }
            objc_msgSend(v23, "mobileNetworkCode");
            v29 = (id)objc_claimAutoreleasedReturnValue();
            if (!isa_nsstring(v29)
              || objc_msgSend(v29, "length") != 3 && objc_msgSend(v29, "length") != 2)
            {
              v51 = CFSTR("Invalid MCC/MNC in Private LTE configuration");
              goto LABEL_56;
            }
            v30 = v21;
            objc_msgSend(*(id *)(v21 + 1280), "decimalDigitCharacterSet");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "invertedSet");
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            v33 = objc_msgSend(v29, "rangeOfCharacterFromSet:", v32);
            if (v33 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v51 = CFSTR("Invalid MCC/MNC in Private LTE configuration");
              goto LABEL_59;
            }
            objc_msgSend(v23, "trackingAreaCode");
            v34 = objc_claimAutoreleasedReturnValue();
            v21 = v30;
            if (v34)
            {
              v25 = (void *)v34;
              objc_msgSend(v23, "trackingAreaCode");
              v29 = (id)objc_claimAutoreleasedReturnValue();
              if (!isa_nsstring(v29))
                goto LABEL_55;
              objc_msgSend(*(id *)(v30 + 1280), "decimalDigitCharacterSet");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "invertedSet");
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v29, "rangeOfCharacterFromSet:", v36) != 0x7FFFFFFFFFFFFFFFLL
                || !objc_msgSend(v29, "length"))
              {

LABEL_55:
                v51 = CFSTR("Invalid TAC in Private LTE configuration");
LABEL_56:
                v50 = v25;

                v25 = v29;
LABEL_57:

                v25 = v50;
LABEL_58:

LABEL_59:
                +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v51, v4);

                goto LABEL_47;
              }
              v37 = objc_msgSend(v29, "length");

              if (v37 > 5)
              {
                v51 = CFSTR("Invalid TAC in Private LTE configuration");
                goto LABEL_59;
              }
            }
          }
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
          if (v20)
            continue;
          break;
        }
      }

      -[NEAppPush providerBundleIdentifier](self, "providerBundleIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "length");

      if (v39)
      {
        -[NEAppPush providerConfiguration](self, "providerConfiguration");
        v40 = objc_claimAutoreleasedReturnValue();
        if (!v40)
          goto LABEL_40;
        v41 = (void *)v40;
        -[NEAppPush providerConfiguration](self, "providerConfiguration");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "allKeys");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "count");

        if (!v44)
        {
LABEL_40:
          ne_log_obj();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v63 = self;
            _os_log_impl(&dword_19BD16000, v45, OS_LOG_TYPE_INFO, "%@ no provider configuration found", buf, 0xCu);
          }

        }
        -[NEAppPush pluginType](self, "pluginType");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "length");

        if (v47)
        {
          v48 = 1;
          goto LABEL_48;
        }
        v10 = CFSTR("missing plugin type");
      }
      else
      {
        v10 = CFSTR("provider bundle identifier not found");
      }
    }
    else
    {
      v10 = CFSTR("A configuration can have maximum 10 Private LTE networks");
    }
  }
  else
  {
    v10 = CFSTR("A configuration can have maximum 10 SSIDs");
  }
LABEL_46:
  +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v10, v4);
LABEL_47:
  v48 = 0;
LABEL_48:

  return v48;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEAppPush isEnabled](self, "isEnabled"), CFSTR("enabled"), v5, a4);
  -[NEAppPush matchSSIDs](self, "matchSSIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("matching SSID List"), v5, a4);

  -[NEAppPush matchPrivateLTENetworks](self, "matchPrivateLTENetworks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("matching Private LTE Network List"), v5, a4);

  -[NEAppPush providerConfiguration](self, "providerConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("vendor specific provider configuration"), v5, a4);

  -[NEAppPush providerBundleIdentifier](self, "providerBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("provider bundle identifier"), v5, a4);

  -[NEAppPush pluginType](self, "pluginType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("plugin type"), v5, a4);

  return v7;
}

- (id)description
{
  return -[NEAppPush descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 0);
}

- (BOOL)overlapsWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  char v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  uint64_t v58;
  char v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[NEAppPush matchSSIDs](self, "matchSSIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v4, "matchSSIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "intersectsSet:", v7) & 1) == 0)
  {
    -[NEAppPush matchPrivateLTENetworks](self, "matchPrivateLTENetworks");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "matchPrivateLTENetworks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11;
    v14 = v12;
    v15 = v14;
    if (!self || (LOBYTE(self) = 0, !v13) || !v14)
    {
LABEL_45:

      goto LABEL_46;
    }
    if (!objc_msgSend(v13, "count") || !objc_msgSend(v15, "count"))
    {
      LOBYTE(self) = 0;
      goto LABEL_45;
    }
    v16 = objc_msgSend(v13, "count");
    v17 = objc_msgSend(v15, "count");
    if (v16 >= v17)
      v18 = v15;
    else
      v18 = v13;
    if (v16 >= v17)
      v19 = v13;
    else
      v19 = v15;
    v20 = v18;
    v21 = v19;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v22 = v20;
    v47 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    if (!v47)
    {
      LOBYTE(self) = 0;
      goto LABEL_44;
    }
    v23 = *(_QWORD *)v61;
    v54 = v7;
    v55 = v4;
    v52 = v13;
    v53 = v10;
    v50 = v21;
    v51 = v15;
    v49 = v22;
    v46 = *(_QWORD *)v61;
LABEL_16:
    v24 = 0;
LABEL_17:
    if (*(_QWORD *)v61 != v23)
      objc_enumerationMutation(v22);
    v48 = v24;
    v25 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v24);
    v26 = v21;
    v27 = v25;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v28 = v26;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
    if (!v29)
      goto LABEL_38;
    v30 = v29;
    v31 = *(_QWORD *)v65;
    v56 = v28;
LABEL_21:
    v32 = 0;
    while (1)
    {
      if (*(_QWORD *)v65 != v31)
        objc_enumerationMutation(v28);
      v33 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v32);
      objc_msgSend(v33, "mobileCountryCode", v46);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "mobileCountryCode");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v34, "isEqual:", v35) & 1) != 0)
        break;

LABEL_36:
      if (v30 == ++v32)
      {
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
        if (v30)
          goto LABEL_21;
LABEL_38:

        v24 = v48 + 1;
        v7 = v54;
        v4 = v55;
        v13 = v52;
        v10 = v53;
        v21 = v50;
        v15 = v51;
        v22 = v49;
        v23 = v46;
        if (v48 + 1 == v47)
        {
          LOBYTE(self) = 0;
          v47 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
          if (!v47)
          {
LABEL_44:

            goto LABEL_45;
          }
          goto LABEL_16;
        }
        goto LABEL_17;
      }
    }
    objc_msgSend(v33, "mobileNetworkCode");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "mobileNetworkCode");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v36, "isEqual:", v37))
    {
      v44 = 0;
      goto LABEL_35;
    }
    objc_msgSend(v33, "trackingAreaCode");
    v58 = objc_claimAutoreleasedReturnValue();
    if (v58 || (objc_msgSend(v27, "trackingAreaCode"), (v57 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v33, "trackingAreaCode");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "trackingAreaCode");
      v39 = v30;
      v40 = v31;
      v41 = v27;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v38, "isEqual:", v42);

      v27 = v41;
      v31 = v40;
      v30 = v39;

      v28 = v56;
      v43 = (void *)v58;
      if (v58)
      {
LABEL_34:

        v44 = v59;
LABEL_35:

        if ((v44 & 1) != 0)
        {

          LOBYTE(self) = 1;
          v7 = v54;
          v4 = v55;
          v13 = v52;
          v10 = v53;
          v21 = v50;
          v15 = v51;
          v22 = v49;
          goto LABEL_44;
        }
        goto LABEL_36;
      }
    }
    else
    {
      v57 = 0;
      v59 = 1;
      v43 = 0;
    }

    goto LABEL_34;
  }
  LOBYTE(self) = 1;
LABEL_46:

  return (char)self;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSDictionary)providerConfiguration
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProviderConfiguration:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSArray)matchSSIDs
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMatchSSIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSArray)matchPrivateLTENetworks
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMatchPrivateLTENetworks:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)pluginType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPluginType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)providerBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProviderBundleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_pluginType, 0);
  objc_storeStrong((id *)&self->_matchPrivateLTENetworks, 0);
  objc_storeStrong((id *)&self->_matchSSIDs, 0);
  objc_storeStrong((id *)&self->_providerConfiguration, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
