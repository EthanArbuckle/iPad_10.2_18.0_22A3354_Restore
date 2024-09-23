@implementation CEMSystemiCloudDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.system.icloud");
}

+ (id)profileType
{
  return &stru_24C63AAC0;
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[15];

  v6[14] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("allowCloudBackup");
  v6[1] = CFSTR("allowCloudDocumentSync");
  v6[2] = CFSTR("allowFindMyFriendsModification");
  v6[3] = CFSTR("allowPhotoStream");
  v6[4] = CFSTR("allowSharedStream");
  v6[5] = CFSTR("allowCloudPhotoLibrary");
  v6[6] = CFSTR("allowCloudBookmarks");
  v6[7] = CFSTR("allowCloudMail");
  v6[8] = CFSTR("allowCloudCalendar");
  v6[9] = CFSTR("allowCloudReminders");
  v6[10] = CFSTR("allowCloudAddressBook");
  v6[11] = CFSTR("allowCloudNotes");
  v6[12] = CFSTR("allowCloudDesktopAndDocuments");
  v6[13] = CFSTR("allowCloudKeychainSync");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[15];

  v6[14] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("allowCloudBackup");
  v6[1] = CFSTR("allowCloudDocumentSync");
  v6[2] = CFSTR("allowFindMyFriendsModification");
  v6[3] = CFSTR("allowPhotoStream");
  v6[4] = CFSTR("allowSharedStream");
  v6[5] = CFSTR("allowCloudPhotoLibrary");
  v6[6] = CFSTR("allowCloudBookmarks");
  v6[7] = CFSTR("allowCloudMail");
  v6[8] = CFSTR("allowCloudCalendar");
  v6[9] = CFSTR("allowCloudReminders");
  v6[10] = CFSTR("allowCloudAddressBook");
  v6[11] = CFSTR("allowCloudNotes");
  v6[12] = CFSTR("allowCloudDesktopAndDocuments");
  v6[13] = CFSTR("allowCloudKeychainSync");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)multipleAllowed
{
  return 0;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)activationLevel
{
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)buildWithIdentifier:(id)a3 withAllowCloudBackup:(id)a4 withAllowCloudDocumentSync:(id)a5 withAllowFindMyFriendsModification:(id)a6 withAllowPhotoStream:(id)a7 withAllowSharedStream:(id)a8 withAllowCloudPhotoLibrary:(id)a9 withAllowCloudBookmarks:(id)a10 withAllowCloudMail:(id)a11 withAllowCloudCalendar:(id)a12 withAllowCloudReminders:(id)a13 withAllowCloudAddressBook:(id)a14 withAllowCloudNotes:(id)a15 withAllowCloudDesktopAndDocuments:(id)a16 withAllowCloudKeychainSync:(id)a17
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;

  v17 = a3;
  v55 = a17;
  v54 = a16;
  v53 = a15;
  v52 = a14;
  v18 = a13;
  v51 = a12;
  v50 = a11;
  v49 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "setDeclarationType:", CFSTR("com.apple.configuration.system.icloud"));
  if (v17)
  {
    objc_msgSend(v25, "setDeclarationIdentifier:", v17);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "UUIDString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDeclarationIdentifier:", v27);

    v17 = 0;
  }
  v28 = (void *)MEMORY[0x24BDBD1C8];
  if (v24)
    v29 = v24;
  else
    v29 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v25, "setPayloadAllowCloudBackup:", v29, a8);

  if (v23)
    v30 = v23;
  else
    v30 = v28;
  objc_msgSend(v25, "setPayloadAllowCloudDocumentSync:", v30);

  if (v22)
    v31 = v22;
  else
    v31 = v28;
  objc_msgSend(v25, "setPayloadAllowFindMyFriendsModification:", v31);

  if (v21)
    v32 = v21;
  else
    v32 = v28;
  objc_msgSend(v25, "setPayloadAllowPhotoStream:", v32);

  if (v20)
    v33 = v20;
  else
    v33 = v28;
  objc_msgSend(v25, "setPayloadAllowSharedStream:", v33);

  if (v19)
    v34 = v19;
  else
    v34 = v28;
  objc_msgSend(v25, "setPayloadAllowCloudPhotoLibrary:", v34);

  if (v49)
    v35 = v49;
  else
    v35 = v28;
  objc_msgSend(v25, "setPayloadAllowCloudBookmarks:", v35);

  if (v50)
    v36 = v50;
  else
    v36 = v28;
  objc_msgSend(v25, "setPayloadAllowCloudMail:", v36);

  if (v51)
    v37 = v51;
  else
    v37 = v28;
  objc_msgSend(v25, "setPayloadAllowCloudCalendar:", v37);

  if (v18)
    v38 = v18;
  else
    v38 = v28;
  objc_msgSend(v25, "setPayloadAllowCloudReminders:", v38);

  if (v52)
    v39 = v52;
  else
    v39 = v28;
  objc_msgSend(v25, "setPayloadAllowCloudAddressBook:", v39);

  if (v53)
    v40 = v53;
  else
    v40 = v28;
  objc_msgSend(v25, "setPayloadAllowCloudNotes:", v40);

  if (v54)
    v41 = v54;
  else
    v41 = v28;
  objc_msgSend(v25, "setPayloadAllowCloudDesktopAndDocuments:", v41);

  if (v55)
    v42 = v55;
  else
    v42 = v28;
  objc_msgSend(v25, "setPayloadAllowCloudKeychainSync:", v42);

  objc_msgSend(v25, "updateServerHash");
  return v25;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.system.icloud"));
  if (v3)
  {
    objc_msgSend(v4, "setDeclarationIdentifier:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeclarationIdentifier:", v6);

  }
  objc_msgSend(v4, "updateServerHash");

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *unknownPayloadKeys;
  NSNumber *v13;
  id v14;
  NSNumber *payloadAllowCloudBackup;
  NSNumber *v16;
  NSNumber *payloadAllowCloudDocumentSync;
  NSNumber *v18;
  NSNumber *payloadAllowFindMyFriendsModification;
  NSNumber *v20;
  NSNumber *payloadAllowPhotoStream;
  NSNumber *v22;
  NSNumber *payloadAllowSharedStream;
  NSNumber *v24;
  NSNumber *payloadAllowCloudPhotoLibrary;
  NSNumber *v26;
  NSNumber *payloadAllowCloudBookmarks;
  NSNumber *v28;
  NSNumber *payloadAllowCloudMail;
  NSNumber *v30;
  NSNumber *payloadAllowCloudCalendar;
  NSNumber *v32;
  NSNumber *payloadAllowCloudReminders;
  NSNumber *v34;
  NSNumber *payloadAllowCloudAddressBook;
  NSNumber *v36;
  NSNumber *payloadAllowCloudNotes;
  NSNumber *v38;
  NSNumber *payloadAllowCloudDesktopAndDocuments;
  NSNumber *v40;
  NSNumber *payloadAllowCloudKeychainSync;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMSystemiCloudDeclaration allowedPayloadKeys](CEMSystemiCloudDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v56 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowCloudBackup"), 0, MEMORY[0x24BDBD1C8], &v56);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v56;
  payloadAllowCloudBackup = self->_payloadAllowCloudBackup;
  self->_payloadAllowCloudBackup = v13;

  if (!v14)
  {
    v55 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowCloudDocumentSync"), 0, MEMORY[0x24BDBD1C8], &v55);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v55;
    payloadAllowCloudDocumentSync = self->_payloadAllowCloudDocumentSync;
    self->_payloadAllowCloudDocumentSync = v16;

    if (!v14)
    {
      v54 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowFindMyFriendsModification"), 0, MEMORY[0x24BDBD1C8], &v54);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v54;
      payloadAllowFindMyFriendsModification = self->_payloadAllowFindMyFriendsModification;
      self->_payloadAllowFindMyFriendsModification = v18;

      if (!v14)
      {
        v53 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowPhotoStream"), 0, MEMORY[0x24BDBD1C8], &v53);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v53;
        payloadAllowPhotoStream = self->_payloadAllowPhotoStream;
        self->_payloadAllowPhotoStream = v20;

        if (!v14)
        {
          v52 = 0;
          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowSharedStream"), 0, MEMORY[0x24BDBD1C8], &v52);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v52;
          payloadAllowSharedStream = self->_payloadAllowSharedStream;
          self->_payloadAllowSharedStream = v22;

          if (!v14)
          {
            v51 = 0;
            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowCloudPhotoLibrary"), 0, MEMORY[0x24BDBD1C8], &v51);
            v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v14 = v51;
            payloadAllowCloudPhotoLibrary = self->_payloadAllowCloudPhotoLibrary;
            self->_payloadAllowCloudPhotoLibrary = v24;

            if (!v14)
            {
              v50 = 0;
              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowCloudBookmarks"), 0, MEMORY[0x24BDBD1C8], &v50);
              v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              v14 = v50;
              payloadAllowCloudBookmarks = self->_payloadAllowCloudBookmarks;
              self->_payloadAllowCloudBookmarks = v26;

              if (!v14)
              {
                v49 = 0;
                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowCloudMail"), 0, MEMORY[0x24BDBD1C8], &v49);
                v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                v14 = v49;
                payloadAllowCloudMail = self->_payloadAllowCloudMail;
                self->_payloadAllowCloudMail = v28;

                if (!v14)
                {
                  v48 = 0;
                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowCloudCalendar"), 0, MEMORY[0x24BDBD1C8], &v48);
                  v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  v14 = v48;
                  payloadAllowCloudCalendar = self->_payloadAllowCloudCalendar;
                  self->_payloadAllowCloudCalendar = v30;

                  if (!v14)
                  {
                    v47 = 0;
                    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowCloudReminders"), 0, MEMORY[0x24BDBD1C8], &v47);
                    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                    v14 = v47;
                    payloadAllowCloudReminders = self->_payloadAllowCloudReminders;
                    self->_payloadAllowCloudReminders = v32;

                    if (!v14)
                    {
                      v46 = 0;
                      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowCloudAddressBook"), 0, MEMORY[0x24BDBD1C8], &v46);
                      v34 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                      v14 = v46;
                      payloadAllowCloudAddressBook = self->_payloadAllowCloudAddressBook;
                      self->_payloadAllowCloudAddressBook = v34;

                      if (!v14)
                      {
                        v45 = 0;
                        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowCloudNotes"), 0, MEMORY[0x24BDBD1C8], &v45);
                        v36 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                        v14 = v45;
                        payloadAllowCloudNotes = self->_payloadAllowCloudNotes;
                        self->_payloadAllowCloudNotes = v36;

                        if (!v14)
                        {
                          v44 = 0;
                          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowCloudDesktopAndDocuments"), 0, MEMORY[0x24BDBD1C8], &v44);
                          v38 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                          v14 = v44;
                          payloadAllowCloudDesktopAndDocuments = self->_payloadAllowCloudDesktopAndDocuments;
                          self->_payloadAllowCloudDesktopAndDocuments = v38;

                          if (!v14)
                          {
                            v43 = 0;
                            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowCloudKeychainSync"), 0, MEMORY[0x24BDBD1C8], &v43);
                            v40 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                            v14 = v43;
                            payloadAllowCloudKeychainSync = self->_payloadAllowCloudKeychainSync;
                            self->_payloadAllowCloudKeychainSync = v40;

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
      }
    }
  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDBD1C8];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowCloudBackup"), self->_payloadAllowCloudBackup, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowCloudDocumentSync"), self->_payloadAllowCloudDocumentSync, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowFindMyFriendsModification"), self->_payloadAllowFindMyFriendsModification, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowPhotoStream"), self->_payloadAllowPhotoStream, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowSharedStream"), self->_payloadAllowSharedStream, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowCloudPhotoLibrary"), self->_payloadAllowCloudPhotoLibrary, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowCloudBookmarks"), self->_payloadAllowCloudBookmarks, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowCloudMail"), self->_payloadAllowCloudMail, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowCloudCalendar"), self->_payloadAllowCloudCalendar, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowCloudReminders"), self->_payloadAllowCloudReminders, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowCloudAddressBook"), self->_payloadAllowCloudAddressBook, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowCloudNotes"), self->_payloadAllowCloudNotes, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowCloudDesktopAndDocuments"), self->_payloadAllowCloudDesktopAndDocuments, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowCloudKeychainSync"), self->_payloadAllowCloudKeychainSync, 0, v5);
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)CEMSystemiCloudDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v34, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadAllowCloudBackup, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadAllowCloudDocumentSync, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadAllowFindMyFriendsModification, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadAllowPhotoStream, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSNumber copy](self->_payloadAllowSharedStream, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSNumber copy](self->_payloadAllowCloudPhotoLibrary, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  v17 = -[NSNumber copy](self->_payloadAllowCloudBookmarks, "copy");
  v18 = (void *)v4[15];
  v4[15] = v17;

  v19 = -[NSNumber copy](self->_payloadAllowCloudMail, "copy");
  v20 = (void *)v4[16];
  v4[16] = v19;

  v21 = -[NSNumber copy](self->_payloadAllowCloudCalendar, "copy");
  v22 = (void *)v4[17];
  v4[17] = v21;

  v23 = -[NSNumber copy](self->_payloadAllowCloudReminders, "copy");
  v24 = (void *)v4[18];
  v4[18] = v23;

  v25 = -[NSNumber copy](self->_payloadAllowCloudAddressBook, "copy");
  v26 = (void *)v4[19];
  v4[19] = v25;

  v27 = -[NSNumber copy](self->_payloadAllowCloudNotes, "copy");
  v28 = (void *)v4[20];
  v4[20] = v27;

  v29 = -[NSNumber copy](self->_payloadAllowCloudDesktopAndDocuments, "copy");
  v30 = (void *)v4[21];
  v4[21] = v29;

  v31 = -[NSNumber copy](self->_payloadAllowCloudKeychainSync, "copy");
  v32 = (void *)v4[22];
  v4[22] = v31;

  return v4;
}

- (NSNumber)payloadAllowCloudBackup
{
  return self->_payloadAllowCloudBackup;
}

- (void)setPayloadAllowCloudBackup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadAllowCloudDocumentSync
{
  return self->_payloadAllowCloudDocumentSync;
}

- (void)setPayloadAllowCloudDocumentSync:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadAllowFindMyFriendsModification
{
  return self->_payloadAllowFindMyFriendsModification;
}

- (void)setPayloadAllowFindMyFriendsModification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadAllowPhotoStream
{
  return self->_payloadAllowPhotoStream;
}

- (void)setPayloadAllowPhotoStream:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadAllowSharedStream
{
  return self->_payloadAllowSharedStream;
}

- (void)setPayloadAllowSharedStream:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)payloadAllowCloudPhotoLibrary
{
  return self->_payloadAllowCloudPhotoLibrary;
}

- (void)setPayloadAllowCloudPhotoLibrary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)payloadAllowCloudBookmarks
{
  return self->_payloadAllowCloudBookmarks;
}

- (void)setPayloadAllowCloudBookmarks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)payloadAllowCloudMail
{
  return self->_payloadAllowCloudMail;
}

- (void)setPayloadAllowCloudMail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)payloadAllowCloudCalendar
{
  return self->_payloadAllowCloudCalendar;
}

- (void)setPayloadAllowCloudCalendar:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)payloadAllowCloudReminders
{
  return self->_payloadAllowCloudReminders;
}

- (void)setPayloadAllowCloudReminders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)payloadAllowCloudAddressBook
{
  return self->_payloadAllowCloudAddressBook;
}

- (void)setPayloadAllowCloudAddressBook:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)payloadAllowCloudNotes
{
  return self->_payloadAllowCloudNotes;
}

- (void)setPayloadAllowCloudNotes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSNumber)payloadAllowCloudDesktopAndDocuments
{
  return self->_payloadAllowCloudDesktopAndDocuments;
}

- (void)setPayloadAllowCloudDesktopAndDocuments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSNumber)payloadAllowCloudKeychainSync
{
  return self->_payloadAllowCloudKeychainSync;
}

- (void)setPayloadAllowCloudKeychainSync:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowCloudKeychainSync, 0);
  objc_storeStrong((id *)&self->_payloadAllowCloudDesktopAndDocuments, 0);
  objc_storeStrong((id *)&self->_payloadAllowCloudNotes, 0);
  objc_storeStrong((id *)&self->_payloadAllowCloudAddressBook, 0);
  objc_storeStrong((id *)&self->_payloadAllowCloudReminders, 0);
  objc_storeStrong((id *)&self->_payloadAllowCloudCalendar, 0);
  objc_storeStrong((id *)&self->_payloadAllowCloudMail, 0);
  objc_storeStrong((id *)&self->_payloadAllowCloudBookmarks, 0);
  objc_storeStrong((id *)&self->_payloadAllowCloudPhotoLibrary, 0);
  objc_storeStrong((id *)&self->_payloadAllowSharedStream, 0);
  objc_storeStrong((id *)&self->_payloadAllowPhotoStream, 0);
  objc_storeStrong((id *)&self->_payloadAllowFindMyFriendsModification, 0);
  objc_storeStrong((id *)&self->_payloadAllowCloudDocumentSync, 0);
  objc_storeStrong((id *)&self->_payloadAllowCloudBackup, 0);
}

@end
