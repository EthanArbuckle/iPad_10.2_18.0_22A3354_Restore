@implementation CNContactStore

+ (int64_t)authorizationStatus
{
  return +[CNContactStore authorizationStatusForEntityType:](CNContactStore, "authorizationStatusForEntityType:", 0);
}

+ (BOOL)phoneKit_isAuthorized
{
  return objc_msgSend(a1, "authorizationStatus") == (id)3;
}

+ (id)contactStore
{
  uint64_t v3;
  Class v4;
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (objc_msgSend(a1, "phoneKit_isAuthorized"))
  {
    objc_opt_class(a1, v3);
    v5 = objc_alloc_init(v4);
  }
  else
  {
    v6 = sub_1000C5588();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1001AAB58(v7, v8, v9, v10, v11, v12, v13, v14);

    v5 = 0;
  }
  return v5;
}

+ (id)suggestedContactStore
{
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (objc_msgSend(a1, "phoneKit_isAuthorized"))
  {
    if (+[CNContact suggestionsEnabled](CNContact, "suggestionsEnabled"))
      v3 = 7;
    else
      v3 = 1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "storeWithOptions:", v3));
  }
  else
  {
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1001AAB58(v6, v7, v8, v9, v10, v11, v12, v13);

    v4 = 0;
  }
  return v4;
}

- (id)contactsForHandles:(id)a3 keyDescriptors:(id)a4
{
  return -[CNContactStore contactsForHandles:keyDescriptors:alwaysUnifyLabeledValues:](self, "contactsForHandles:keyDescriptors:alwaysUnifyLabeledValues:", a3, a4, 1);
}

- (id)contactsForHandles:(id)a3 keyDescriptors:(id)a4 alwaysUnifyLabeledValues:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  SEL v12;
  char v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  CNContactStore *v36;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v10 = objc_msgSend(objc_alloc((Class)CNContactFetchRequest), "initWithKeysToFetch:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact predicateForContactsMatchingHandleStrings:](CNContact, "predicateForContactsMatchingHandleStrings:", v8));
    objc_msgSend(v10, "setPredicate:", v11);

    v12 = NSSelectorFromString(CFSTR("setAlwaysUnifyLabeledValues:"));
    v13 = objc_opt_respondsToSelector(v10, v12);
    v14 = sub_1000C5588();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if ((v13 & 1) != 0)
    {
      if (v16)
      {
        *(_DWORD *)buf = 138412546;
        v34 = v10;
        v35 = 2112;
        v36 = self;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Executing contact fetch request %@ without always unifying labels using contact store %@", buf, 0x16u);
      }

      ((void (*)(id, SEL, _BOOL8))objc_msgSend(v10, "methodForSelector:", v12))(v10, v12, v5);
    }
    else
    {
      if (v16)
      {
        *(_DWORD *)buf = 138412546;
        v34 = v10;
        v35 = 2112;
        v36 = self;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Executing contact fetch request %@ using contact store %@", buf, 0x16u);
      }

    }
    v32 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactStore executeFetchRequest:error:](self, "executeFetchRequest:error:", v10, &v32));
    v19 = v32;
    v20 = v19;
    if (v18)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "value"));
      v21 = sub_1000C5588();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = objc_msgSend(v17, "count");
        *(_DWORD *)buf = 134217984;
        v34 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Contact fetch request returned %lu results", buf, 0xCu);
      }
    }
    else
    {
      if (!v19 || objc_msgSend(v19, "code") == (id)200)
      {
        v17 = 0;
LABEL_20:

        goto LABEL_21;
      }
      v24 = sub_1000C5588();
      v22 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_1001AABC8((uint64_t)v20, v22, v25, v26, v27, v28, v29, v30);
      v17 = 0;
    }

    goto LABEL_20;
  }
  v17 = 0;
LABEL_21:

  return v17;
}

@end
