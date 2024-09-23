@implementation MCNotificationSettingsPayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.notificationsettings");
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

  return MCLocalizedFormat(CFSTR("NOTIFICATION_SETTINGS_SINGULAR"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("NOTIFICATION_SETTINGS_PLURAL"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCNotificationSettingsPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCNotificationSettingsPayload *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *notificationSettings;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v29;
  id v30;
  id v31;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v32.receiver = self;
  v32.super_class = (Class)MCNotificationSettingsPayload;
  v10 = -[MCPayload initWithDictionary:profile:outError:](&v32, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (v10)
  {
    v11 = objc_msgSend(v9, "isStub");
    v12 = objc_opt_class();
    if (v11)
    {
      v31 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", v12, CFSTR("NotificationSettings"), 0, &v31);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v31;
      notificationSettings = v10->_notificationSettings;
      v10->_notificationSettings = (NSArray *)v13;
    }
    else
    {
      v30 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", v12, CFSTR("NotificationSettings"), 1, &v30);
      notificationSettings = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v30;
      if (v16)
      {
        v14 = v16;
      }
      else
      {
        v29 = 0;
        -[MCNotificationSettingsPayload validatedNotificationSettings:outError:](v10, "validatedNotificationSettings:outError:", notificationSettings, &v29);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v29;
        -[MCNotificationSettingsPayload setNotificationSettings:](v10, "setNotificationSettings:", v17);

      }
    }

    if (v14)
    {
      -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (a5)
        *a5 = objc_retainAutorelease(v18);
      v20 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v21 = v20;
        v22 = (void *)objc_opt_class();
        v23 = v22;
        objc_msgSend(v19, "MCVerboseDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v22;
        v35 = 2114;
        v36 = v24;
        _os_log_impl(&dword_19ECC4000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

      }
      v10 = 0;
    }
    if (objc_msgSend(v8, "count"))
    {
      v25 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v26 = v25;
        -[MCPayload friendlyName](v10, "friendlyName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v27;
        v35 = 2114;
        v36 = v8;
        _os_log_impl(&dword_19ECC4000, v26, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

      }
    }

  }
  return v10;
}

- (id)validatedNotificationSettings:(id)a3 outError:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  int v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[10];
  _QWORD v91[10];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
  if (v9)
  {
    v10 = v9;
    v72 = v6;
    v71 = a4;
    v11 = 0;
    v12 = *(_QWORD *)v87;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v87 != v12)
        objc_enumerationMutation(v8);
      v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * v13), "mutableCopy");
      v85 = v11;
      objc_msgSend(v14, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("BundleIdentifier"), 1, &v85);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v85;

      if (v16)
      {

        v58 = 0;
        v11 = v16;
        a4 = v71;
        v6 = v72;
        if (v71)
          goto LABEL_68;
        goto LABEL_69;
      }
      v17 = objc_opt_class();
      v84 = 0;
      objc_msgSend(v14, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v17, CFSTR("NotificationsEnabled"), 0, &v84);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v84;
      if (v19)
      {
        v11 = v19;
        v20 = 2;
      }
      else
      {
        v21 = objc_opt_class();
        v83 = 0;
        objc_msgSend(v14, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v21, CFSTR("ShowInNotificationCenter"), 0, &v83);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v83;
        if (v22)
        {
          v11 = v22;
          v20 = 2;
        }
        else
        {
          v23 = objc_opt_class();
          v82 = 0;
          objc_msgSend(v14, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v23, CFSTR("ShowInLockScreen"), 0, &v82);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v82;
          if (v24)
          {
            v11 = v24;
            v20 = 2;
          }
          else
          {
            v25 = objc_opt_class();
            v81 = 0;
            objc_msgSend(v14, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v25, CFSTR("AlertType"), 0, &v81);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v81;
            if (v26)
            {
              v11 = v26;
              v20 = 2;
            }
            else
            {
              v27 = objc_opt_class();
              v80 = 0;
              objc_msgSend(v14, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v27, CFSTR("BadgesEnabled"), 0, &v80);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v80;
              if (v28)
              {
                v11 = v28;
                v20 = 2;
              }
              else
              {
                v29 = objc_opt_class();
                v79 = 0;
                objc_msgSend(v14, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v29, CFSTR("SoundsEnabled"), 0, &v79);
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = v79;
                if (v30)
                {
                  v11 = v30;
                  v20 = 2;
                }
                else
                {
                  v31 = objc_opt_class();
                  v78 = 0;
                  objc_msgSend(v14, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v31, CFSTR("ShowInCarPlay"), 0, &v78);
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = v78;
                  if (v32)
                  {
                    v11 = v32;
                    v20 = 2;
                  }
                  else
                  {
                    v33 = objc_opt_class();
                    v77 = 0;
                    objc_msgSend(v14, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v33, CFSTR("CriticalAlertEnabled"), 0, &v77);
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    v34 = v77;
                    if (v34)
                    {
                      v11 = v34;
                      v20 = 2;
                    }
                    else
                    {
                      v35 = objc_opt_class();
                      v76 = 0;
                      objc_msgSend(v14, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v35, CFSTR("GroupingType"), 0, &v76);
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      v36 = v76;
                      if (v36)
                      {
                        v11 = v36;
                        v20 = 2;
                      }
                      else
                      {
                        v37 = objc_opt_class();
                        v75 = 0;
                        objc_msgSend(v14, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v37, CFSTR("PreviewType"), 0, &v75);
                        v38 = objc_claimAutoreleasedReturnValue();
                        v39 = v75;
                        v64 = (void *)v38;
                        if (v39)
                        {
                          v11 = v39;
                          v20 = 2;
                        }
                        else if (objc_msgSend(v7, "containsObject:", v15))
                        {
                          v47 = (void *)MEMORY[0x1E0CB35C8];
                          MCErrorArray(CFSTR("ERROR_PAYLOAD_MULTIPLE_NOTIFICATION_SETTINGS_FOR_SAME_APP"), v40, v41, v42, v43, v44, v45, v46, 0);
                          v61 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v47, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCPayloadErrorDomain"), 2000);
                          v11 = (void *)objc_claimAutoreleasedReturnValue();
                          v20 = 2;

                        }
                        else
                        {
                          v62 = objc_alloc(MEMORY[0x1E0C99E08]);
                          v90[0] = CFSTR("BundleIdentifier");
                          v90[1] = CFSTR("NotificationsEnabled");
                          if (v18)
                            v48 = v18;
                          else
                            v48 = (void *)MEMORY[0x1E0C9AAB0];
                          v91[0] = v15;
                          v91[1] = v48;
                          v49 = v74;
                          if (!v74)
                            v49 = (void *)MEMORY[0x1E0C9AAB0];
                          v90[2] = CFSTR("ShowInNotificationCenter");
                          v90[3] = CFSTR("ShowInLockScreen");
                          v50 = v73;
                          if (!v73)
                            v50 = (void *)MEMORY[0x1E0C9AAB0];
                          v91[2] = v49;
                          v91[3] = v50;
                          v51 = &unk_1E42129B8;
                          if (v70)
                            v51 = v70;
                          v90[4] = CFSTR("AlertType");
                          v90[5] = CFSTR("BadgesEnabled");
                          v52 = v69;
                          if (!v69)
                            v52 = (void *)MEMORY[0x1E0C9AAB0];
                          v91[4] = v51;
                          v91[5] = v52;
                          v53 = v68;
                          if (!v68)
                            v53 = (void *)MEMORY[0x1E0C9AAB0];
                          v90[6] = CFSTR("SoundsEnabled");
                          v90[7] = CFSTR("ShowInCarPlay");
                          v54 = v67;
                          if (!v67)
                            v54 = (void *)MEMORY[0x1E0C9AAB0];
                          v91[6] = v53;
                          v91[7] = v54;
                          v55 = (void *)MEMORY[0x1E0C9AAA0];
                          if (v66)
                            v55 = v66;
                          v90[8] = CFSTR("CriticalAlertEnabled");
                          v90[9] = CFSTR("GroupingType");
                          v56 = &unk_1E42129D0;
                          if (v65)
                            v56 = v65;
                          v91[8] = v55;
                          v91[9] = v56;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 10);
                          v57 = (void *)objc_claimAutoreleasedReturnValue();
                          v63 = (void *)objc_msgSend(v62, "initWithDictionary:", v57);

                          if (v38)
                            objc_msgSend(v63, "setObject:forKeyedSubscript:", v38, CFSTR("PreviewType"));
                          objc_msgSend(v7, "addObject:", v15);
                          objc_msgSend(v72, "addObject:", v63);
                          v20 = 0;
                          v11 = 0;

                        }
                      }

                    }
                  }

                }
              }

            }
          }

        }
      }

      if (v20)
        break;
      if (v10 == ++v13)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }

    a4 = v71;
    v6 = v72;
    if (!v11)
      goto LABEL_67;
    v58 = 0;
    if (v71)
      goto LABEL_68;
  }
  else
  {

LABEL_67:
    v58 = v6;
    v11 = 0;
    if (a4)
LABEL_68:
      *a4 = objc_retainAutorelease(v11);
  }
LABEL_69:
  v59 = v58;

  return v59;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCNotificationSettingsPayload;
  -[MCPayload stubDictionary](&v6, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCNotificationSettingsPayload notificationSettings](self, "notificationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("NotificationSettings"));

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

- (NSArray)notificationSettings
{
  return self->_notificationSettings;
}

- (void)setNotificationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationSettings, 0);
}

@end
