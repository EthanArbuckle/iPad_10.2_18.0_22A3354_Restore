@implementation MCHomeScreenLayoutPayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.homescreenlayout");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)localizedSingularForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("HOME_SCREEN_LAYOUT_SINGULAR"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("HOME_SCREEN_LAYOUT_PLURAL"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCHomeScreenLayoutPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCHomeScreenLayoutPayload *v10;
  uint64_t v11;
  char *v12;
  void *layout;
  void *v14;
  char *v15;
  void *v16;
  void *v17;
  char *v18;
  char *v19;
  uint64_t i;
  void *v21;
  id v22;
  char *v23;
  uint64_t v24;
  char *j;
  void *v26;
  uint64_t v27;
  NSArray *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v40;
  id *v41;
  void *v42;
  NSArray *obj;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  id v57;
  id v58;
  id v59;
  objc_super v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  id v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v60.receiver = self;
  v60.super_class = (Class)MCHomeScreenLayoutPayload;
  v10 = -[MCPayload initWithDictionary:profile:outError:](&v60, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (v10)
  {
    if (objc_msgSend(v9, "isStub"))
    {
      v59 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("Layout"), 0, &v59);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (char *)v59;
      layout = v10->_layout;
      v10->_layout = (NSArray *)v11;
    }
    else
    {
      layout = (void *)objc_opt_new();
      v58 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("Dock"), 0, &v58);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (char *)v58;
      if (v15)
      {
        v12 = v15;
        v16 = 0;
        v17 = 0;
      }
      else
      {
        v57 = 0;
        -[MCHomeScreenLayoutPayload parseIconsArray:allowFolders:outError:](v10, "parseIconsArray:allowFolders:outError:", v14, 1, &v57);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (char *)v57;
        if (v18)
        {
          v12 = v18;
          v16 = 0;
        }
        else
        {
          objc_msgSend(layout, "addObject:", v17);
          v56 = 0;
          objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("Pages"), 1, &v56);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (char *)v56;
          if (v19)
          {
            v12 = v19;
          }
          else
          {
            v42 = v17;
            v54 = 0u;
            v55 = 0u;
            v52 = 0u;
            v53 = 0u;
            obj = v16;
            v46 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
            if (v46)
            {
              v44 = layout;
              v45 = *(_QWORD *)v53;
              v40 = v14;
              v41 = a5;
              while (2)
              {
                for (i = 0; i != v46; ++i)
                {
                  if (*(_QWORD *)v53 != v45)
                    objc_enumerationMutation(obj);
                  v21 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
                  v48 = 0u;
                  v49 = 0u;
                  v50 = 0u;
                  v51 = 0u;
                  v22 = v21;
                  v23 = (char *)objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v65, 16);
                  if (v23)
                  {
                    v24 = *(_QWORD *)v49;
                    while (2)
                    {
                      for (j = 0; j != v23; ++j)
                      {
                        if (*(_QWORD *)v49 != v24)
                          objc_enumerationMutation(v22);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("Pages"));
                          v23 = (char *)objc_claimAutoreleasedReturnValue();
                          goto LABEL_25;
                        }
                      }
                      v23 = (char *)objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v65, 16);
                      if (v23)
                        continue;
                      break;
                    }
LABEL_25:
                    layout = v44;
                  }

                  v47 = v23;
                  -[MCHomeScreenLayoutPayload parseIconsArray:allowFolders:outError:](v10, "parseIconsArray:allowFolders:outError:", v22, 1, &v47);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v12 = v47;

                  if (v12)
                  {

                    v16 = obj;
                    v28 = obj;
                    v14 = v40;
                    a5 = v41;
                    goto LABEL_31;
                  }
                  objc_msgSend(layout, "addObject:", v26);

                }
                v14 = v40;
                a5 = v41;
                v46 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
                if (v46)
                  continue;
                break;
              }
            }
            v16 = obj;

            v27 = objc_msgSend(layout, "copy");
            v12 = 0;
            v28 = v10->_layout;
            v10->_layout = (NSArray *)v27;
LABEL_31:

            v17 = v42;
          }
        }
      }

    }
    if (v12)
    {
      -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v12);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (a5)
        *a5 = objc_retainAutorelease(v29);
      v31 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v32 = v31;
        v33 = (void *)objc_opt_class();
        v34 = v33;
        objc_msgSend(v30, "MCVerboseDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v62 = v33;
        v63 = 2114;
        v64 = v35;
        _os_log_impl(&dword_19ECC4000, v32, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

      }
      v10 = 0;
    }
    if (objc_msgSend(v8, "count", v40, v41))
    {
      v36 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v37 = v36;
        -[MCPayload friendlyName](v10, "friendlyName");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v62 = v38;
        v63 = 2114;
        v64 = v8;
        _os_log_impl(&dword_19ECC4000, v37, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

      }
    }

  }
  return v10;
}

- (id)parseIconsArray:(id)a3 allowFolders:(BOOL)a4 outError:(id *)a5
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  char *v20;
  uint64_t v21;
  void *v22;
  char *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  id v30;
  char *v31;
  uint64_t v32;
  char *j;
  void *v34;
  char *v35;
  void *v36;
  char *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  id *v48;
  id v49;
  void *v50;
  uint64_t v51;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id obj;
  void *v58;
  id v60;
  id v61;
  char *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  id v72;
  id v73;
  char *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  void *v82;
  _QWORD v83[2];
  _QWORD v84[2];
  _BYTE v85[128];
  _BYTE v86[128];
  const __CFString *v87;
  NSObject *v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
  if (!v9)
  {

    goto LABEL_69;
  }
  v10 = v9;
  v48 = a5;
  v11 = 0;
  v54 = *(_QWORD *)v76;
  v49 = v8;
  v50 = v7;
  while (2)
  {
    v12 = 0;
    v51 = v10;
    do
    {
      if (*(_QWORD *)v76 != v54)
        objc_enumerationMutation(v8);
      v55 = v12;
      v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * v12), "mutableCopy");
      v74 = v11;
      v58 = v13;
      objc_msgSend(v13, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("Type"), 1, &v74);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v74;

      v56 = v14;
      if (v15)
      {
        v11 = v15;
        goto LABEL_64;
      }
      if (!objc_msgSend(v14, "isEqualToString:", CFSTR("Application")))
      {
        if (objc_msgSend(v14, "isEqualToString:", CFSTR("Folder")))
        {
          if (a4)
          {
            v72 = 0;
            v18 = v58;
            objc_msgSend(v58, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("DisplayName"), 1, &v72);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (char *)v72;
            if (v20)
            {
              v11 = v20;
            }
            else
            {
              v21 = objc_opt_class();
              v71 = 0;
              objc_msgSend(v58, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", v21, CFSTR("Pages"), 0, &v71);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = (char *)v71;
              if (!v23)
              {
                v53 = v19;
                v24 = (void *)objc_opt_new();
                v67 = 0u;
                v68 = 0u;
                v69 = 0u;
                v70 = 0u;
                obj = v22;
                v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v86, 16);
                if (v25)
                {
                  v26 = v25;
                  v27 = *(_QWORD *)v68;
                  while (2)
                  {
                    for (i = 0; i != v26; ++i)
                    {
                      if (*(_QWORD *)v68 != v27)
                        objc_enumerationMutation(obj);
                      v29 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
                      v63 = 0u;
                      v64 = 0u;
                      v65 = 0u;
                      v66 = 0u;
                      v30 = v29;
                      v31 = (char *)objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v63, v85, 16);
                      if (v31)
                      {
                        v32 = *(_QWORD *)v64;
                        while (2)
                        {
                          for (j = 0; j != v31; ++j)
                          {
                            if (*(_QWORD *)v64 != v32)
                              objc_enumerationMutation(v30);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) == 0)
                            {
                              +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("Pages"));
                              v31 = (char *)objc_claimAutoreleasedReturnValue();
                              goto LABEL_29;
                            }
                          }
                          v31 = (char *)objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v63, v85, 16);
                          if (v31)
                            continue;
                          break;
                        }
                      }
LABEL_29:

                      v62 = v31;
                      -[MCHomeScreenLayoutPayload parseIconsArray:allowFolders:outError:](self, "parseIconsArray:allowFolders:outError:", v30, 0, &v62);
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      v11 = v62;

                      if (v11)
                      {

                        goto LABEL_40;
                      }
                      objc_msgSend(v24, "addObject:", v34);

                    }
                    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v86, 16);
                    if (v26)
                      continue;
                    break;
                  }
                  v11 = 0;
LABEL_40:
                  v8 = v49;
                  v7 = v50;
                  v10 = v51;
                }
                else
                {
                  v11 = 0;
                }

                v83[0] = CFSTR("displayName");
                v83[1] = CFSTR("iconLists");
                v84[0] = v53;
                v84[1] = v24;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 2);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "addObject:", v41);

                goto LABEL_47;
              }
              v11 = v23;

            }
          }
          else
          {
            v45 = _MCLogObjects;
            v18 = v58;
            if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19ECC4000, v45, OS_LOG_TYPE_ERROR, "Folder isn't allowed at this level. Ignoring.", buf, 2u);
            }
            v11 = 0;
          }
LABEL_65:

          goto LABEL_66;
        }
        if (!objc_msgSend(v14, "isEqualToString:", CFSTR("WebClip")))
        {
          v40 = (void *)_MCLogObjects;
          if (!os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
          {
LABEL_44:
            v11 = 0;
            goto LABEL_47;
          }
          v16 = v40;
          -[MCPayload friendlyName](self, "friendlyName");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v80 = v36;
          v81 = 2114;
          v82 = v56;
          _os_log_impl(&dword_19ECC4000, v16, OS_LOG_TYPE_ERROR, "Icon dictionary for payload “%{public}@” is unknown type “%{public}@”. Ignoring.", buf, 0x16u);
LABEL_43:

          goto LABEL_44;
        }
        v61 = 0;
        v18 = v58;
        objc_msgSend(v58, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("URL"), 1, &v61);
        v16 = objc_claimAutoreleasedReturnValue();
        v35 = (char *)v61;
        if (v35)
        {
          v11 = v35;

          goto LABEL_65;
        }
        v60 = 0;
        objc_msgSend(v58, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("DisplayName"), 0, &v60);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (char *)v60;
        if (!v37)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v16, CFSTR("webClipURL"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38;
          if (v36)
            objc_msgSend(v38, "setObject:forKey:", v36, CFSTR("displayName"));
          objc_msgSend(v7, "addObject:", v39);

          goto LABEL_43;
        }
        v11 = v37;

LABEL_63:
LABEL_64:
        v18 = v58;
        goto LABEL_65;
      }
      v73 = 0;
      objc_msgSend(v58, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("BundleID"), 1, &v73);
      v16 = objc_claimAutoreleasedReturnValue();
      v11 = (char *)v73;
      if (v11)
        goto LABEL_63;
      v87 = CFSTR("displayIdentifier");
      v88 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v17);

LABEL_47:
      if (objc_msgSend(v58, "count"))
      {
        v42 = (void *)_MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
        {
          v43 = v42;
          -[MCPayload friendlyName](self, "friendlyName");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v80 = v44;
          v81 = 2114;
          v82 = v58;
          _os_log_impl(&dword_19ECC4000, v43, OS_LOG_TYPE_INFO, "Icon dictionary for payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

        }
      }

      v12 = v55 + 1;
    }
    while (v55 + 1 != v10);
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
    if (v10)
      continue;
    break;
  }
LABEL_66:

  a5 = v48;
  if (!v11)
  {
LABEL_69:
    v46 = (void *)objc_msgSend(v7, "copy");
    v11 = 0;
    if (a5)
      goto LABEL_70;
    goto LABEL_71;
  }
  v46 = 0;
  if (!v48)
    goto LABEL_71;
LABEL_70:
  *a5 = objc_retainAutorelease(v11);
LABEL_71:

  return v46;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCHomeScreenLayoutPayload;
  -[MCPayload stubDictionary](&v6, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCHomeScreenLayoutPayload layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Layout"));

  return v3;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v2;

  v2 = (void *)objc_opt_new();
  if (!objc_msgSend(v2, "count"))
  {

    v2 = 0;
  }
  return v2;
}

- (NSArray)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
