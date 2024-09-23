@implementation SAPersonAttribute

- (id)sr_inPerson
{
  void *v3;
  NSString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  NSString *v41;
  void *v42;
  void *v43;
  id v44;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *i;
  void *v51;
  void *v52;
  unsigned int v53;
  void *v54;
  void *v55;
  NSString *v56;
  NSString *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute displayText](self, "displayText"));
  v4 = INPersonHandleLabelMain;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute dataType](self, "dataType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute typedData](self, "typedData"));
  v58 = v5;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("PhoneNumber")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("PhoneLabel")))
  {
    objc_opt_class(SAPhone, v7);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
    {
      objc_opt_class(NSString, v9);
      if ((objc_opt_isKindOfClass(v6, v14) & 1) != 0)
        v11 = v6;
      else
        v11 = 0;
      v13 = 2;
      goto LABEL_29;
    }
    v10 = v6;
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "number"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "label"));

    v13 = 2;
LABEL_11:
    v4 = (NSString *)v12;
LABEL_29:
    v30 = v6;
    goto LABEL_30;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("EmailAddress")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("EmailLabel")))
  {
    objc_opt_class(SAEmail, v15);
    if ((objc_opt_isKindOfClass(v6, v16) & 1) == 0)
    {
      objc_opt_class(NSString, v17);
      if ((objc_opt_isKindOfClass(v6, v19) & 1) != 0)
        v11 = v6;
      else
        v11 = 0;
      v13 = 1;
      goto LABEL_29;
    }
    v18 = v6;
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "emailAddress"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "label"));

    v13 = 1;
    goto LABEL_11;
  }
  v55 = v3;
  v56 = v4;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    sub_1000A01C0();
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute data](self, "data", v6));
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute object](self, "object"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "phones"));

  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v64;
LABEL_20:
    v26 = 0;
    while (1)
    {
      if (*(_QWORD *)v64 != v25)
        objc_enumerationMutation(v22);
      v27 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "number"));
      v29 = objc_msgSend(v28, "isEqualToString:", v20);

      if ((v29 & 1) != 0)
        break;
      if (v24 == (id)++v26)
      {
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
        if (v24)
          goto LABEL_20;
        goto LABEL_26;
      }
    }
    v11 = v20;
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "label"));

    v13 = 2;
    v3 = v55;
    if (v11)
      goto LABEL_43;
  }
  else
  {
LABEL_26:

    v13 = 0;
    v3 = v55;
    v4 = v56;
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute object](self, "object"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "emails"));

  v48 = v47;
  v11 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
  if (v11)
  {
    v57 = v4;
    v49 = *(_QWORD *)v60;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v60 != v49)
          objc_enumerationMutation(v48);
        v51 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "emailAddress"));
        v53 = objc_msgSend(v52, "isEqualToString:", v20);

        if (v53)
        {
          v11 = v20;
          v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "label"));

          v13 = 1;
          v3 = v55;
          goto LABEL_42;
        }
      }
      v11 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
      if (v11)
        continue;
      break;
    }
    v3 = v55;
    v4 = v57;
  }
LABEL_42:

LABEL_43:
  v30 = v54;
LABEL_30:
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute object](self, "object"));
  v32 = objc_alloc_init((Class)NSPersonNameComponents);
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "firstName"));
  objc_msgSend(v32, "setGivenName:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "nickName"));
  objc_msgSend(v32, "setNickname:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "middleName"));
  objc_msgSend(v32, "setMiddleName:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "lastName"));
  objc_msgSend(v32, "setFamilyName:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "prefix"));
  objc_msgSend(v32, "setNamePrefix:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "suffix"));
  objc_msgSend(v32, "setNameSuffix:", v38);

  v39 = objc_msgSend(objc_alloc((Class)INPersonHandle), "initWithValue:type:label:", v11, v13, v4);
  v40 = objc_alloc((Class)INPerson);
  v41 = v4;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "internalGUID"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "aceId"));
  v44 = objc_msgSend(v40, "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", v39, v32, v3, 0, v42, v43);

  return v44;
}

- (id)_applicablePhone
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute typedData](self, "typedData"));
  objc_opt_class(SAPhone, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    v6 = v3;
  }
  else
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      sub_1000A022C();
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute data](self, "data"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute object](self, "object", 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "phones"));

    v6 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v9);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "number"));
          v14 = objc_msgSend(v13, "isEqualToString:", v7);

          if (v14)
          {
            v6 = v12;
            goto LABEL_15;
          }
        }
        v6 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_15:

  }
  return v6;
}

- (id)_applicableEmail
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute typedData](self, "typedData"));
  objc_opt_class(SAEmail, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    v6 = v3;
  }
  else
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      sub_1000A0298();
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute data](self, "data"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute object](self, "object", 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "emails"));

    v6 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v9);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "emailAddress"));
          v14 = objc_msgSend(v13, "isEqualToString:", v7);

          if (v14)
          {
            v6 = v12;
            goto LABEL_15;
          }
        }
        v6 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_15:

  }
  return v6;
}

@end
