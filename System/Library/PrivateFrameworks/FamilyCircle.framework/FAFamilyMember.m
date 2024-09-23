@implementation FAFamilyMember

- (FAFamilyMember)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  FAFamilyMember *v5;
  uint64_t v6;
  NSDictionary *dictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAFamilyMember;
  v5 = -[FAFamilyMember init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  void *v16;

  v15 = (void *)MEMORY[0x1E0CB37A0];
  v14 = objc_opt_class();
  -[FAFamilyMember appleID](self, "appleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilyMember dsid](self, "dsid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    -[FAFamilyMember hashedDSID](self, "hashedDSID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[FAFamilyMember altDSID](self, "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilyMember firstName](self, "firstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilyMember lastName](self, "lastName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilyMember memberTypeString](self, "memberTypeString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilyMember remoteChildren](self, "remoteChildren");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilyMember remoteGuardians](self, "remoteGuardians");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilyMember inviteEmail](self, "inviteEmail");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p - appleID=%@ dsid=%@ altDSID=%@ firstName=%@ lastName=%@ type=%@ remote guardians %@ remote children %@ inviteEmail=%@ purchaseSharingEnabled=%d>"), v14, self, v16, v4, v5, v6, v7, v8, v9, v10, v11, -[FAFamilyMember purchaseSharingEnabled](self, "purchaseSharingEnabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  return v12;
}

- (BOOL)isMe
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("is-me"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSString)appleID
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("member-apple-id"));
}

- (NSNumber)dsid
{
  return (NSNumber *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("member-dsid"));
}

- (NSString)hashedDSID
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("member-dsid-hash"));
}

- (NSString)altDSID
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("member-altDSID"));
}

- (NSString)firstName
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("member-first-name"));
}

- (BOOL)canRemoveSelf
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("can-remove-self"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSArray)appleIDAliases
{
  return (NSArray *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("member-appleID-aliases"));
}

- (NSString)shortName
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;

  -[FAFamilyMember contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  if (v3)
  {
    objc_msgSend(v3, "givenName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setGivenName:", v5);

    objc_msgSend(v3, "familyName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFamilyName:", v6);

    objc_msgSend(MEMORY[0x1E0CB3858], "_localizedShortNameForComponents:withStyle:options:", v4, 3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[FAFamilyMember firstName](self, "firstName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    -[FAFamilyMember lastName](self, "lastName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      v10 = objc_msgSend(v7, "length");

      if (v10)
        goto LABEL_10;
      -[FAFamilyMember firstName](self, "firstName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setGivenName:", v11);

      -[FAFamilyMember lastName](self, "lastName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setFamilyName:", v12);

      objc_msgSend(MEMORY[0x1E0CB3858], "_localizedShortNameForComponents:withStyle:options:", v4, 3, 0);
      v8 = v7;
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {

    }
  }

LABEL_10:
  if (objc_msgSend(v7, "length"))
    v13 = v7;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

- (NSString)lastName
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("member-last-name"));
}

- (NSString)fullName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  -[FAFamilyMember contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
      goto LABEL_10;

  }
  -[FAFamilyMember firstName](self, "firstName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    -[FAFamilyMember lastName](self, "lastName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (!v7)
    {
      v4 = 0;
      goto LABEL_10;
    }
    v5 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    -[FAFamilyMember firstName](self, "firstName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGivenName:", v8);

    -[FAFamilyMember lastName](self, "lastName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFamilyName:", v9);

    v10 = objc_alloc_init(MEMORY[0x1E0CB3858]);
    objc_msgSend(v10, "stringFromPersonNameComponents:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

LABEL_10:
  return (NSString *)v4;
}

- (unint64_t)age
{
  __CFString *v3;
  void *v4;
  unint64_t v5;
  void *v6;

  -[FAFamilyMember appleID](self, "appleID");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)CFPreferencesCopyAppValue(v3, CFSTR("com.apple.familycircle.ages"));

  if (v4)
  {
    v5 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("member-age"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "integerValue");

  }
  return v5;
}

- (NSString)memberTypeDisplayString
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("member-display-label"));
}

- (NSString)memberTypeString
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("member-type"));
}

- (NSDate)birthDate
{
  void *v3;
  void *v4;
  void *v5;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("member-date-of-birth"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("member-date-of-birth"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAFamilyMember _dateWithEpochString:](self, "_dateWithEpochString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSDate *)v5;
}

- (BOOL)memberIsPending
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("member-status"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Pending"));

  return v3;
}

- (int64_t)memberType
{
  void *v3;
  int64_t v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[FAFamilyMember memberTypeString](self, "memberTypeString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADULT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TEEN")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHILD")) & 1) != 0)
  {
    v4 = 2;
  }
  else
  {
    if (!-[FAFamilyMember memberIsPending](self, "memberIsPending"))
    {
      _FALogSystem();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("member-status"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412290;
        v9 = v6;
        _os_log_impl(&dword_1CAEBA000, v5, OS_LOG_TYPE_DEFAULT, "No valid member type present! %@", (uint8_t *)&v8, 0xCu);

      }
    }
    v4 = -1;
  }

  return v4;
}

+ (id)defaultInvitationDelay
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 604800000);
}

- (NSNumber)memberSortOrder
{
  return (NSNumber *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("member-sort-order"));
}

- (NSString)memberPhoneNumbers
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("member-phone-numbers"));
}

- (NSDate)joinedDate
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("member-join-date-epoch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilyMember _dateWithEpochString:](self, "_dateWithEpochString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (NSDate)invitationDate
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("member-invite-date-epoch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilyMember _dateWithEpochString:](self, "_dateWithEpochString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (NSNumber)badgeAfter
{
  return (NSNumber *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("badge-after-invite-delay"));
}

- (id)_dateWithEpochString:(id)a3
{
  double v4;
  void *v5;

  objc_msgSend(a3, "doubleValue");
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v4 * 0.001);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (NSString)statusString
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("member-status"));
}

- (NSString)inviteEmail
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("member-invite-email"));
}

- (BOOL)isChildAccount
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("member-is-child-account"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)hasParentalControlsEnabled
{
  uint64_t v3;
  void *v4;
  void *v6;
  char v7;

  if (hasParentalControlsEnabled_onceToken != -1)
    dispatch_once(&hasParentalControlsEnabled_onceToken, &__block_literal_global_4);
  v3 = hasParentalControlsEnabled_forceParentalControlsAppleIDs;
  -[FAFamilyMember appleID](self, "appleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend((id)v3, "containsObject:", v4);

  if ((v3 & 1) != 0)
    return 1;
  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("is-parental-controls-enabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

void __44__FAFamilyMember_hasParentalControlsEnabled__block_invoke()
{
  CFPropertyListRef v0;
  void *v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = CFPreferencesCopyAppValue(CFSTR("ParentalControlsAppleIDs"), CFSTR("com.apple.familycircle"));
  v1 = (void *)hasParentalControlsEnabled_forceParentalControlsAppleIDs;
  hasParentalControlsEnabled_forceParentalControlsAppleIDs = (uint64_t)v0;

  if (hasParentalControlsEnabled_forceParentalControlsAppleIDs)
  {
    _FALogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = hasParentalControlsEnabled_forceParentalControlsAppleIDs;
      _os_log_impl(&dword_1CAEBA000, v2, OS_LOG_TYPE_DEFAULT, "WARNING: Parent controls is being forced for these Apple Accounts by preference: %@", (uint8_t *)&v3, 0xCu);
    }

  }
}

- (BOOL)isParent
{
  uint64_t v3;
  void *v4;
  void *v6;
  char v7;

  if (isParent_onceToken != -1)
    dispatch_once(&isParent_onceToken, &__block_literal_global_77);
  v3 = isParent_forceParentAppleIDs;
  -[FAFamilyMember appleID](self, "appleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend((id)v3, "containsObject:", v4);

  if ((v3 & 1) != 0)
    return 1;
  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("member-is-parent-account"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

void __26__FAFamilyMember_isParent__block_invoke()
{
  CFPropertyListRef v0;
  void *v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = CFPreferencesCopyAppValue(CFSTR("ParentAppleIDs"), CFSTR("com.apple.familycircle"));
  v1 = (void *)isParent_forceParentAppleIDs;
  isParent_forceParentAppleIDs = (uint64_t)v0;

  if (isParent_forceParentAppleIDs)
  {
    _FALogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = isParent_forceParentAppleIDs;
      _os_log_impl(&dword_1CAEBA000, v2, OS_LOG_TYPE_DEFAULT, "WARNING: These Apple Accounts are forced to be parent accounts by preference: %@", (uint8_t *)&v3, 0xCu);
    }

  }
}

- (BOOL)isGuardian
{
  return -[FAFamilyMember isParent](self, "isParent") || -[FAFamilyMember isOrganizer](self, "isOrganizer");
}

- (BOOL)isOrganizer
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("member-is-organizer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)hasHSA2
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilyMember altDSID](self, "altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authKitAccountWithAltDSID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v3, "securityLevelForAccount:", v5) == 4;
  return (char)v4;
}

- (BOOL)hasAskToBuyEnabled
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("is-ask-to-buy-enabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)hasSiwaEnabled
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("isSiwaEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSNumber)iTunesAccountDSID
{
  return (NSNumber *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("linked-itunes-account-dsid"));
}

- (NSString)iTunesAccountUsername
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("linked-itunes-account-appleid"));
}

- (BOOL)hasLinkediTunesAccount
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("is-itunes-linked"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSString)iTunesNotLinkedMessage
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("itunes-not-linked-message"));
}

- (BOOL)purchaseSharingEnabled
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("family-purchase-sharing-enabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)fetchFamilyPhotoWithRequestedSize:(unint64_t)a3 fallbackToLocalAddressBook:(BOOL)a4 completionHandler:(id)a5
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a5;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__FAFamilyMember_fetchFamilyPhotoWithRequestedSize_fallbackToLocalAddressBook_completionHandler___block_invoke;
  block[3] = &unk_1E8561AD0;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

uint64_t __97__FAFamilyMember_fetchFamilyPhotoWithRequestedSize_fallbackToLocalAddressBook_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_dictionary, CFSTR("_dictionary"));
}

- (FAFamilyMember)initWithCoder:(id)a3
{
  id v4;
  FAFamilyMember *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *dictionary;
  FAFamilyMember *v14;

  v4 = a3;
  v5 = -[FAFamilyMember init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("_dictionary"));
    v12 = objc_claimAutoreleasedReturnValue();
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v12;

    v14 = v5;
  }

  return v5;
}

- (CNContact)contact
{
  return (CNContact *)-[FAFamilyMember contactIncludingImage:](self, "contactIncludingImage:", 1);
}

- (id)contactWithKeys:(id)a3 contactStore:(id)a4
{
  void *v4;
  void *v5;

  -[FAFamilyMember contactsWithKeys:contactStore:](self, "contactsWithKeys:contactStore:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)contactsIncludingImage:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[18];

  v3 = a3;
  v22[17] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0C966D0];
  v22[0] = *MEMORY[0x1E0C96790];
  v22[1] = v5;
  v6 = *MEMORY[0x1E0C966C0];
  v22[2] = *MEMORY[0x1E0C96780];
  v22[3] = v6;
  v7 = *MEMORY[0x1E0C96798];
  v22[4] = *MEMORY[0x1E0C96820];
  v22[5] = v7;
  v8 = *MEMORY[0x1E0C967B8];
  v22[6] = *MEMORY[0x1E0C967A0];
  v22[7] = v8;
  v9 = *MEMORY[0x1E0C96758];
  v22[8] = *MEMORY[0x1E0C96698];
  v22[9] = v9;
  v10 = *MEMORY[0x1E0C967E0];
  v22[10] = *MEMORY[0x1E0C967D8];
  v22[11] = v10;
  v11 = *MEMORY[0x1E0C967E8];
  v22[12] = *MEMORY[0x1E0C967D0];
  v22[13] = v11;
  v12 = *MEMORY[0x1E0C967C0];
  v22[14] = *MEMORY[0x1E0C96898];
  v22[15] = v12;
  v22[16] = *MEMORY[0x1E0C966A8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayByAddingObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v21 = *MEMORY[0x1E0C96890];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v17;
  }
  v18 = objc_alloc_init(MEMORY[0x1E0C97298]);
  -[FAFamilyMember contactsWithKeys:contactStore:](self, "contactsWithKeys:contactStore:", v15, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)contactsWithKeys:(id)a3 contactStore:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  if (-[FAFamilyMember isMe](self, "isMe"))
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAFamilyMember altDSID](self, "altDSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "aa_appleAccountWithAltDSID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v7, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v6, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(v8, "addObject:", v12);
      objc_msgSend(v8, "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_34;
    }

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilyMember appleID](self, "appleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0C97200];
    -[FAFamilyMember appleID](self, "appleID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "predicateForContactsMatchingEmailAddress:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v18);

  }
  -[FAFamilyMember inviteEmail](self, "inviteEmail");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (void *)MEMORY[0x1E0C97200];
    -[FAFamilyMember inviteEmail](self, "inviteEmail");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "predicateForContactsMatchingEmailAddress:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v22);

  }
  v23 = (void *)MEMORY[0x1E0C97398];
  -[FAFamilyMember inviteEmail](self, "inviteEmail");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "phoneNumberWithStringValue:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v26);

  }
  -[FAFamilyMember memberPhoneNumbers](self, "memberPhoneNumbers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = v14;
    v46 = v25;
    -[FAFamilyMember memberPhoneNumbers](self, "memberPhoneNumbers");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "componentsSeparatedByString:", CFSTR(","));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v31 = v30;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v52 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          if (objc_msgSend(v36, "length"))
          {
            objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (v37)
            {
              objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "addObject:", v38);

            }
          }
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v33);
    }

    v25 = v46;
    v14 = v28;
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v39 = v14;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v48 != v42)
          objc_enumerationMutation(v39);
        objc_msgSend(v7, "unifiedContactsMatchingPredicate:keysToFetch:error:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j), v6, 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v44);

      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v41);
  }

  objc_msgSend(v8, "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_34:
  return v13;
}

- (id)contactIncludingImage:(BOOL)a3
{
  void *v3;
  void *v4;

  -[FAFamilyMember contactsIncludingImage:](self, "contactsIncludingImage:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[FAFamilyMember altDSID](self, "altDSID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  FAFamilyMember *v4;
  BOOL v5;

  v4 = (FAFamilyMember *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[FAFamilyMember isEqualToFamilyMember:](self, "isEqualToFamilyMember:", v4);
  }

  return v5;
}

- (BOOL)isEqualToFamilyMember:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
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

  v4 = a3;
  v5 = -[FAFamilyMember age](self, "age");
  if (v5 == objc_msgSend(v4, "age"))
  {
    -[FAFamilyMember altDSID](self, "altDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "altDSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[FAFamilyMember _nilEqualProperty:with:](self, "_nilEqualProperty:with:", v6, v7))
    {
      -[FAFamilyMember appleID](self, "appleID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appleID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[FAFamilyMember _nilEqualProperty:with:](self, "_nilEqualProperty:with:", v8, v9))
      {
        -[FAFamilyMember dsid](self, "dsid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "dsid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[FAFamilyMember _nilEqualProperty:with:](self, "_nilEqualProperty:with:", v10, v11))
        {
          -[FAFamilyMember firstName](self, "firstName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "firstName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[FAFamilyMember _nilEqualProperty:with:](self, "_nilEqualProperty:with:", v12, v13))
          {
            v50 = v12;
            v14 = -[FAFamilyMember hasAskToBuyEnabled](self, "hasAskToBuyEnabled");
            if (v14 == objc_msgSend(v4, "hasAskToBuyEnabled"))
            {
              -[FAFamilyMember hashedDSID](self, "hashedDSID");
              v16 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "hashedDSID");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = (void *)v16;
              if (-[FAFamilyMember _nilEqualProperty:with:](self, "_nilEqualProperty:with:", v16)
                && (v17 = -[FAFamilyMember hasLinkediTunesAccount](self, "hasLinkediTunesAccount"),
                    v17 == objc_msgSend(v4, "hasLinkediTunesAccount"))
                && (v18 = -[FAFamilyMember hasParentalControlsEnabled](self, "hasParentalControlsEnabled"),
                    v18 == objc_msgSend(v4, "hasParentalControlsEnabled")))
              {
                -[FAFamilyMember inviteEmail](self, "inviteEmail");
                v20 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "inviteEmail");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = (void *)v20;
                if (-[FAFamilyMember _nilEqualProperty:with:](self, "_nilEqualProperty:with:", v20)
                  && (v21 = -[FAFamilyMember isMe](self, "isMe"), v21 == objc_msgSend(v4, "isMe"))
                  && (v22 = -[FAFamilyMember isOrganizer](self, "isOrganizer"),
                      v22 == objc_msgSend(v4, "isOrganizer"))
                  && (v23 = -[FAFamilyMember isParent](self, "isParent"),
                      v23 == objc_msgSend(v4, "isParent")))
                {
                  -[FAFamilyMember iTunesAccountDSID](self, "iTunesAccountDSID");
                  v24 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "iTunesAccountDSID");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  v45 = (void *)v24;
                  if (-[FAFamilyMember _nilEqualProperty:with:](self, "_nilEqualProperty:with:", v24))
                  {
                    -[FAFamilyMember iTunesAccountUsername](self, "iTunesAccountUsername");
                    v25 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v4, "iTunesAccountUsername");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    v43 = (void *)v25;
                    if (-[FAFamilyMember _nilEqualProperty:with:](self, "_nilEqualProperty:with:", v25))
                    {
                      -[FAFamilyMember lastName](self, "lastName");
                      v26 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v4, "lastName");
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      v41 = (void *)v26;
                      if (-[FAFamilyMember _nilEqualProperty:with:](self, "_nilEqualProperty:with:", v26)
                        && (v27 = -[FAFamilyMember memberType](self, "memberType"), v27 == objc_msgSend(v4, "memberType")))
                      {
                        -[FAFamilyMember memberTypeDisplayString](self, "memberTypeDisplayString");
                        v28 = objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v4, "memberTypeDisplayString");
                        v38 = (void *)objc_claimAutoreleasedReturnValue();
                        v39 = (void *)v28;
                        if (-[FAFamilyMember _nilEqualProperty:with:](self, "_nilEqualProperty:with:", v28)
                          && (v29 = -[FAFamilyMember memberType](self, "memberType"),
                              v29 == objc_msgSend(v4, "memberType")))
                        {
                          -[FAFamilyMember memberTypeDisplayString](self, "memberTypeDisplayString");
                          v30 = objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v4, "memberTypeDisplayString");
                          v36 = (void *)objc_claimAutoreleasedReturnValue();
                          v37 = (void *)v30;
                          if (-[FAFamilyMember _nilEqualProperty:with:](self, "_nilEqualProperty:with:", v30))
                          {
                            -[FAFamilyMember memberTypeString](self, "memberTypeString");
                            v31 = objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v4, "memberTypeString");
                            v34 = (void *)objc_claimAutoreleasedReturnValue();
                            v35 = (void *)v31;
                            if (-[FAFamilyMember _nilEqualProperty:with:](self, "_nilEqualProperty:with:", v31))
                            {
                              -[FAFamilyMember statusString](self, "statusString");
                              v33 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v4, "statusString");
                              v32 = (void *)objc_claimAutoreleasedReturnValue();
                              v15 = -[FAFamilyMember _nilEqualProperty:with:](self, "_nilEqualProperty:with:", v33);

                            }
                            else
                            {
                              v15 = 0;
                            }

                          }
                          else
                          {
                            v15 = 0;
                          }

                        }
                        else
                        {
                          v15 = 0;
                        }

                      }
                      else
                      {
                        v15 = 0;
                      }

                    }
                    else
                    {
                      v15 = 0;
                    }

                  }
                  else
                  {
                    v15 = 0;
                  }

                }
                else
                {
                  v15 = 0;
                }
                v12 = v50;

              }
              else
              {
                v15 = 0;
                v12 = v50;
              }

            }
            else
            {
              v15 = 0;
              v12 = v50;
            }
          }
          else
          {
            v15 = 0;
          }

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FAFamilyMember *v4;
  void *v5;
  FAFamilyMember *v6;

  v4 = [FAFamilyMember alloc];
  -[FAFamilyMember dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FAFamilyMember initWithDictionaryRepresentation:](v4, "initWithDictionaryRepresentation:", v5);

  return v6;
}

- (BOOL)_nilEqualProperty:(id)a3 with:(id)a4
{
  if (a3 == a4)
    return 1;
  else
    return objc_msgSend(a3, "isEqual:", a4);
}

- (void)finishWith:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  FAFamilyMember *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!_os_feature_enabled_impl())
    goto LABEL_21;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("member-child-dsids"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = self;
  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("member-guardian-dsids"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v4, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v10)
    goto LABEL_14;
  v11 = v10;
  v12 = *(_QWORD *)v21;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v21 != v12)
        objc_enumerationMutation(v9);
      v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
      if (objc_msgSend(v7, "containsObject:", v14))
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v5;
      }
      else
      {
        if (!objc_msgSend(v8, "containsObject:", v14))
          continue;
        objc_msgSend(v4, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v6;
      }
      objc_msgSend(v16, "addObject:", v15);

    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  }
  while (v11);
LABEL_14:

  if (objc_msgSend(v5, "count"))
    v17 = v5;
  else
    v17 = 0;
  objc_storeStrong((id *)&v19->_remoteChildren, v17);
  if (objc_msgSend(v6, "count"))
    v18 = v6;
  else
    v18 = 0;
  objc_storeStrong((id *)&v19->_remoteGuardians, v18);

LABEL_21:
}

- (NSArray)remoteGuardians
{
  return self->_remoteGuardians;
}

- (NSArray)remoteChildren
{
  return self->_remoteChildren;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (NSDictionary)idsCache
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIdsCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsCache, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_remoteChildren, 0);
  objc_storeStrong((id *)&self->_remoteGuardians, 0);
}

@end
