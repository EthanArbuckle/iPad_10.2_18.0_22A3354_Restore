@implementation ICSCallAnnouncement

+ (id)announcementWithCall:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithCall:", v4);

  return v6;
}

- (ICSCallAnnouncement)init
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s is not available for use. To create an object instance use the designated initializer."), "-[ICSCallAnnouncement init]"));
  NSLog(CFSTR("** TUAssertion failure: %@"), v3);

  _TUAssertShouldCrashApplication();
  return 0;
}

- (ICSCallAnnouncement)initWithCall:(id)a3
{
  id v4;
  ICSCallAnnouncement *v5;
  void *v6;
  uint64_t v7;
  NSString *callDestinationID;
  uint64_t v9;
  NSString *callDisplayName;
  uint64_t v11;
  NSString *callISOCountryCode;
  uint64_t v13;
  NSString *callServiceName;
  void *v15;
  NSString *v16;
  NSString *callerName;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ICSCallAnnouncement;
  v5 = -[ICSAnnouncement init](&v20, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handle"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
    callDestinationID = v5->_callDestinationID;
    v5->_callDestinationID = (NSString *)v7;

    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));
    callDisplayName = v5->_callDisplayName;
    v5->_callDisplayName = (NSString *)v9;

    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "isoCountryCode"));
    callISOCountryCode = v5->_callISOCountryCode;
    v5->_callISOCountryCode = (NSString *)v11;

    v13 = objc_claimAutoreleasedReturnValue(-[ICSCallAnnouncement callServiceNameForCall:](v5, "callServiceNameForCall:", v4));
    callServiceName = v5->_callServiceName;
    v5->_callServiceName = (NSString *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCallAnnouncement callerNameForCall:](v5, "callerNameForCall:", v4));
    v16 = (NSString *)objc_msgSend(v15, "copy");
    callerName = v5->_callerName;
    v5->_callerName = v16;

    v5->_callerNameType = -[ICSCallAnnouncement callerNameTypeForCall:](v5, "callerNameTypeForCall:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v18, "addObserver:selector:name:object:", v5, "handleContactStoreDidChangeNotification:", CNContactStoreDidChangeNotification, 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICSCallAnnouncement;
  -[ICSCallAnnouncement dealloc](&v4, "dealloc");
}

- (NSArray)contacts
{
  NSArray *contacts;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  void *v15;

  contacts = self->_contacts;
  if (!contacts)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCallAnnouncement contactIdentifier](self, "contactIdentifier"));
    v5 = objc_msgSend(v4, "length");

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCallAnnouncement contactIdentifier](self, "contactIdentifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCallAnnouncement contactForIdentifier:](self, "contactForIdentifier:", v6));

      if (v7)
      {
        v15 = v7;
        v8 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
        v9 = self->_contacts;
        self->_contacts = v8;

      }
    }
    contacts = self->_contacts;
    if (!contacts)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCallAnnouncement callDestinationID](self, "callDestinationID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCallAnnouncement callISOCountryCode](self, "callISOCountryCode"));
      v12 = (NSArray *)objc_claimAutoreleasedReturnValue(-[ICSCallAnnouncement contactsForDestinationID:isoCountryCode:](self, "contactsForDestinationID:isoCountryCode:", v10, v11));
      v13 = self->_contacts;
      self->_contacts = v12;

      contacts = self->_contacts;
    }
  }
  return contacts;
}

- (id)callerNameForCall:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "callerNameFromNetwork"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "callerNameFromNetwork"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestedDisplayName"));
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestedDisplayName"));
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "companyName"));
      v10 = objc_msgSend(v9, "length");

      if (v10)
      {
        v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "companyName"));
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedLabel"));
        v12 = objc_msgSend(v11, "length");

        if (!v12)
        {
          v13 = 0;
          goto LABEL_10;
        }
        v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedLabel"));
      }
    }
  }
  v13 = (void *)v6;
LABEL_10:

  return v13;
}

- (int64_t)callerNameTypeForCall:(id)a3
{
  id v3;
  void *v4;
  id v5;
  int64_t v6;
  void *v7;
  id v8;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "callerNameFromNetwork"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
    goto LABEL_2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestedDisplayName"));
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v6 = 1;
    goto LABEL_5;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "companyName"));
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
LABEL_2:
    v6 = 0;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedLabel"));
    v13 = objc_msgSend(v12, "length");

    if (v13)
      v6 = 2;
    else
      v6 = 3;
  }
LABEL_5:

  return v6;
}

- (id)callServiceNameForCall:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "provider"));
  if (objc_msgSend(v4, "isFaceTimeProvider"))
  {
    v5 = objc_msgSend(v3, "isVideo");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    if (v5)
      v8 = CFSTR("ANNOUNCEMENT_FACETIME_VIDEO");
    else
      v8 = CFSTR("ANNOUNCEMENT_FACETIME_AUDIO");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_10028DC20, CFSTR("InCallService")));
LABEL_12:

    goto LABEL_13;
  }
  if ((objc_msgSend(v4, "isTelephonyProvider") & 1) == 0)
  {
    v10 = CFSTR("ANNOUNCEMENT_CALL_PROVIDER_NAME_%@_CALL_TYPE_VIDEO");
    if ((objc_msgSend(v3, "isVideo") & 1) == 0 && !objc_msgSend(v3, "isThirdPartyVideo"))
      v10 = CFSTR("ANNOUNCEMENT_CALL_PROVIDER_NAME_%@_CALL_TYPE_AUDIO");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v10, &stru_10028DC20, CFSTR("InCallService")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12));

    goto LABEL_12;
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (CNContactStore)contactStore
{
  CNContactStore *contactStore;
  CNContactStore *v4;
  CNContactStore *v5;

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v4 = (CNContactStore *)objc_claimAutoreleasedReturnValue(+[CNContactStore contactStore](CNContactStore, "contactStore"));
    v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (id)text
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCallAnnouncement contactIdentifier](self, "contactIdentifier"));

  if (v3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCallAnnouncement callDisplayName](self, "callDisplayName"));
  if (!objc_msgSend(v3, "length"))
  {
    v4 = objc_claimAutoreleasedReturnValue(-[ICSCallAnnouncement callerName](self, "callerName"));

    v3 = (void *)v4;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("%@ call from %@."), &stru_10028DC20, CFSTR("InCallService")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCallAnnouncement callServiceName](self, "callServiceName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7, v3));

  return v8;
}

- (NSArray)contactKeyDescriptors
{
  _QWORD v3[11];

  v3[0] = CNContactGivenNameKey;
  v3[1] = CNContactMiddleNameKey;
  v3[2] = CNContactFamilyNameKey;
  v3[3] = CNContactNicknameKey;
  v3[4] = CNContactPhoneticGivenNameKey;
  v3[5] = CNContactPhoneticMiddleNameKey;
  v3[6] = CNContactPhoneticFamilyNameKey;
  v3[7] = CNContactOrganizationNameKey;
  v3[8] = CNContactPhonemeDataKey;
  v3[9] = CNContactPronunciationGivenNameKey;
  v3[10] = CNContactPronunciationFamilyNameKey;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 11));
}

- (id)contactForIdentifier:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v20;
  uint8_t buf[4];
  id v22;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Retrieving contact matching the specified contact identifier (%@).", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCallAnnouncement contactStore](self, "contactStore"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCallAnnouncement contactKeyDescriptors](self, "contactKeyDescriptors"));
    v20 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "unifiedContactWithIdentifier:keysToFetch:error:", v4, v8, &v20));
    v10 = v20;

    if (v10 && objc_msgSend(v10, "code") != (id)200)
    {
      v11 = sub_1000C5588();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1001AA8A0((uint64_t)v10, v12, v13, v14, v15, v16, v17, v18);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)contactsForDestinationID:(id)a3 isoCountryCode:(id)a4
{
  NSObject *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v35;
  uint8_t buf[4];
  NSObject *v37;
  __int16 v38;
  id v39;

  v6 = a3;
  v7 = a4;
  v8 = sub_1000C5588();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v37 = v6;
    v38 = 2112;
    v39 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Retrieving contact matching the specified identifier (%@) and ISO country code (%@).", buf, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCallAnnouncement contactStore](self, "contactStore"));
  if (v10)
  {
    if (-[NSObject destinationIdIsEmailAddress](v6, "destinationIdIsEmailAddress"))
    {
      v11 = objc_claimAutoreleasedReturnValue(+[CNContact predicateForContactsMatchingEmailAddress:](CNContact, "predicateForContactsMatchingEmailAddress:", v6));
      if (!v11)
      {
LABEL_22:
        v27 = sub_1000C5588();
        v11 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_1001AA904((uint64_t)v6, v11, v28, v29, v30, v31, v32, v33);
        v12 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
      if (!-[NSObject destinationIdIsPhoneNumber](v6, "destinationIdIsPhoneNumber"))
        goto LABEL_22;
      if (!objc_msgSend(v7, "length")
        || (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lowercaseString")),
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[CNPhoneNumber phoneNumberWithDigits:countryCode:](CNPhoneNumber, "phoneNumberWithDigits:countryCode:", v6, v13)), v13, !v14))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[CNPhoneNumber phoneNumberWithStringValue:](CNPhoneNumber, "phoneNumberWithStringValue:", v6));
      }
      v11 = objc_claimAutoreleasedReturnValue(+[CNContact predicateForContactsMatchingPhoneNumber:](CNContact, "predicateForContactsMatchingPhoneNumber:", v14));

      if (!v11)
        goto LABEL_22;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCallAnnouncement contactKeyDescriptors](self, "contactKeyDescriptors"));
    v35 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "unifiedContactsMatchingPredicate:keysToFetch:error:", v11, v15, &v35));
    v16 = v35;

    if (!objc_msgSend(v12, "count"))
    {
      v17 = sub_1000C5588();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v11;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Did not find any contacts matching the predicate (%@).", buf, 0xCu);
      }

    }
    if (v16)
    {
      v19 = sub_1000C5588();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_1001AA8A0((uint64_t)v16, v20, v21, v22, v23, v24, v25, v26);

    }
    goto LABEL_25;
  }
  v12 = 0;
LABEL_26:

  return v12;
}

- (void)handleContactStoreDidChangeNotification:(id)a3
{
  -[ICSCallAnnouncement setContacts:](self, "setContacts:", 0);
}

- (NSString)callerName
{
  return self->_callerName;
}

- (void)setCallerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)callerNameType
{
  return self->_callerNameType;
}

- (void)setCallerNameType:(int64_t)a3
{
  self->_callerNameType = a3;
}

- (NSString)callServiceName
{
  return self->_callServiceName;
}

- (void)setCallServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)callDestinationID
{
  return self->_callDestinationID;
}

- (void)setCallDestinationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (NSString)callDisplayName
{
  return self->_callDisplayName;
}

- (void)setCallDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)callISOCountryCode
{
  return self->_callISOCountryCode;
}

- (void)setCallISOCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_callISOCountryCode, 0);
  objc_storeStrong((id *)&self->_callDisplayName, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_callDestinationID, 0);
  objc_storeStrong((id *)&self->_callServiceName, 0);
  objc_storeStrong((id *)&self->_callerName, 0);
}

@end
