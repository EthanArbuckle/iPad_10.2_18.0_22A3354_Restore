@implementation CNMutableContact

- (id)freeze
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class();
  object_setClass(self, v3);
  return self;
}

- (void)setAvailableKeyDescriptor:(id)a3
{
  CNContactKeyVector *v4;
  CNContactKeyVector *availableKeyDescriptor;

  v4 = (CNContactKeyVector *)objc_msgSend(a3, "copy");
  availableKeyDescriptor = self->super._availableKeyDescriptor;
  self->super._availableKeyDescriptor = v4;

}

- (id)freezeWithSelfAsSnapshot
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMutableContact setSnapshot:](self, "setSnapshot:", v3);

  return -[CNMutableContact freeze](self, "freeze");
}

- (void)setSnapshot:(id)a3
{
  CNContact *snapshot;
  id v5;
  CNContact *v6;
  CNContact *v7;

  snapshot = self->super._snapshot;
  if (snapshot != a3)
  {
    self->super._snapshot = 0;
    v5 = a3;

    v6 = (CNContact *)objc_msgSend(v5, "copy");
    v7 = self->super._snapshot;
    self->super._snapshot = v6;

  }
}

- (void)setIOSLegacyIdentifier:(int)a3
{
  self->super._iOSLegacyIdentifier = a3;
}

- (void)_setEmailAddresses:(id)a3
{
  NSArray *v4;
  NSArray **p_emailAddresses;
  NSArray *obj;

  v4 = (NSArray *)a3;
  p_emailAddresses = &self->super._emailAddresses;
  if (*p_emailAddresses != v4)
  {
    if (!v4)
    {
      +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    obj = v4;
    objc_storeStrong((id *)p_emailAddresses, v4);
    v4 = obj;
  }

}

- (void)_setGivenName:(id)a3
{
  objc_storeStrong((id *)&self->super._givenName, a3);
}

- (void)_setFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->super._familyName, a3);
}

- (void)setContactType:(CNContactType)contactType
{
  CNContactKeyVector *availableKeyDescriptor;

  if (self->super._contactType
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("contactType")))
  {
    self->super._contactType = contactType;
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }
}

- (void)setPhoneNumbers:(NSArray *)phoneNumbers
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  CNContactKeyVector *availableKeyDescriptor;
  void *v8;
  void *v9;
  void *v10;
  CNContactKeyVector *v11;
  BOOL v12;
  NSArray *v13;

  v4 = phoneNumbers;
  v5 = self->super._phoneNumbers;
  v13 = v4;
  if (!v5)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("phoneNumbers")))
    {
      goto LABEL_6;
    }
    goto LABEL_10;
  }
  +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v11 = self->super._availableKeyDescriptor;
    if (!v11)
    {
      v6 = v5;
      goto LABEL_3;
    }
    v12 = -[CNContactKeyVector containsKey:](v11, "containsKey:", CFSTR("phoneNumbers"));

    if (v12)
      goto LABEL_6;
LABEL_10:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    goto LABEL_7;
  }
LABEL_3:

LABEL_6:
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("phoneNumbers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertValueType:", v13);

  v10 = (void *)-[NSArray copy](v13, "copy");
  -[CNMutableContact _setPhoneNumbers:](self, "_setPhoneNumbers:", v10);

LABEL_7:
}

- (void)_setPhoneNumbers:(id)a3
{
  NSArray *v4;
  NSArray **p_phoneNumbers;
  NSArray *obj;

  v4 = (NSArray *)a3;
  p_phoneNumbers = &self->super._phoneNumbers;
  if (*p_phoneNumbers != v4)
  {
    if (!v4)
    {
      +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    obj = v4;
    objc_storeStrong((id *)p_phoneNumbers, v4);
    v4 = obj;
  }

}

- (void)_setOrganizationName:(id)a3
{
  objc_storeStrong((id *)&self->super._organizationName, a3);
}

- (NSString)givenName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._givenName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("givenName"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("givenName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSString)familyName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._familyName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("familyName"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("familyName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSString)middleName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._middleName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("middleName"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("middleName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSArray)phoneNumbers
{
  NSArray *v3;
  NSArray *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._phoneNumbers;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("phoneNumbers"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E0C9AA60];
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("phoneNumbers")))
    goto LABEL_9;
  v3 = (NSArray *)MEMORY[0x1E0C9AA60];
  return v3;
}

- (NSArray)emailAddresses
{
  NSArray *v3;
  NSArray *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._emailAddresses;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("emailAddresses"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E0C9AA60];
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("emailAddresses")))
    goto LABEL_9;
  v3 = (NSArray *)MEMORY[0x1E0C9AA60];
  return v3;
}

- (void)setIsUsingSharedPhoto:(BOOL)a3
{
  self->super._isUsingSharedPhoto = a3;
}

- (void)resetIsUsingSharedPhoto
{
  if (-[CNContact isKeyAvailable:](self, "isKeyAvailable:", CFSTR("isUsingSharedPhoto")))
    -[CNMutableContact setIsUsingSharedPhoto:](self, "setIsUsingSharedPhoto:", 0);
}

- (void)_setLinkIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->super._linkIdentifier, a3);
}

- (void)setStoreInfo:(id)a3
{
  NSDictionary *v4;
  NSDictionary *storeInfo;

  if (self->super._storeInfo != a3)
  {
    v4 = (NSDictionary *)objc_msgSend(a3, "copy");
    storeInfo = self->super._storeInfo;
    self->super._storeInfo = v4;

  }
}

- (void)setStoreIdentifier:(id)a3
{
  NSString *v4;
  NSString *storeIdentifier;

  if (self->super._storeIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    storeIdentifier = self->super._storeIdentifier;
    self->super._storeIdentifier = v4;

  }
}

- (void)_setWatchWallpaperImageData:(id)a3
{
  objc_storeStrong((id *)&self->super._watchWallpaperImageData, a3);
}

- (void)_setWallpaper:(id)a3
{
  objc_storeStrong((id *)&self->super._wallpaper, a3);
}

- (void)_setUrlAddresses:(id)a3
{
  NSArray *v4;
  NSArray **p_urlAddresses;
  NSArray *obj;

  v4 = (NSArray *)a3;
  p_urlAddresses = &self->super._urlAddresses;
  if (*p_urlAddresses != v4)
  {
    if (!v4)
    {
      +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    obj = v4;
    objc_storeStrong((id *)p_urlAddresses, v4);
    v4 = obj;
  }

}

- (void)_setTextAlert:(id)a3
{
  objc_storeStrong((id *)&self->super._textAlert, a3);
}

- (void)_setSocialProfiles:(id)a3
{
  NSArray *v4;
  NSArray **p_socialProfiles;
  NSArray *obj;

  v4 = (NSArray *)a3;
  p_socialProfiles = &self->super._socialProfiles;
  if (*p_socialProfiles != v4)
  {
    if (!v4)
    {
      +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    obj = v4;
    objc_storeStrong((id *)p_socialProfiles, v4);
    v4 = obj;
  }

}

- (void)_setSensitiveContentConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->super._sensitiveContentConfiguration, a3);
}

- (void)_setPronunciationGivenName:(id)a3
{
  objc_storeStrong((id *)&self->super._pronunciationGivenName, a3);
}

- (void)_setPronunciationFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->super._pronunciationFamilyName, a3);
}

- (void)_setPreviousFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->super._previousFamilyName, a3);
}

- (void)_setPreferredLikenessSource:(id)a3
{
  objc_storeStrong((id *)&self->super._preferredLikenessSource, a3);
}

- (void)_setPreferredChannel:(id)a3
{
  objc_storeStrong((id *)&self->super._preferredChannel, a3);
}

- (void)_setPreferredApplePersonaIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->super._preferredApplePersonaIdentifier, a3);
}

- (void)_setPhoneticOrganizationName:(id)a3
{
  objc_storeStrong((id *)&self->super._phoneticOrganizationName, a3);
}

- (void)_setPhoneticMiddleName:(id)a3
{
  objc_storeStrong((id *)&self->super._phoneticMiddleName, a3);
}

- (void)_setPhoneticGivenName:(id)a3
{
  objc_storeStrong((id *)&self->super._phoneticGivenName, a3);
}

- (void)_setPhoneticFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->super._phoneticFamilyName, a3);
}

- (void)_setPhonemeData:(id)a3
{
  objc_storeStrong((id *)&self->super._phonemeData, a3);
}

- (void)_setNote:(id)a3
{
  objc_storeStrong((id *)&self->super._note, a3);
}

- (void)_setNonGregorianBirthday:(id)a3
{
  objc_storeStrong((id *)&self->super._nonGregorianBirthday, a3);
}

- (void)_setNameSuffix:(id)a3
{
  objc_storeStrong((id *)&self->super._nameSuffix, a3);
}

- (void)_setNamePrefix:(id)a3
{
  objc_storeStrong((id *)&self->super._namePrefix, a3);
}

- (void)_setMemojiMetadata:(id)a3
{
  objc_storeStrong((id *)&self->super._memojiMetadata, a3);
}

- (void)_setMapsData:(id)a3
{
  objc_storeStrong((id *)&self->super._mapsData, a3);
}

- (void)_setJobTitle:(id)a3
{
  objc_storeStrong((id *)&self->super._jobTitle, a3);
}

- (void)_setInstantMessageAddresses:(id)a3
{
  NSArray *v4;
  NSArray **p_instantMessageAddresses;
  NSArray *obj;

  v4 = (NSArray *)a3;
  p_instantMessageAddresses = &self->super._instantMessageAddresses;
  if (*p_instantMessageAddresses != v4)
  {
    if (!v4)
    {
      +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    obj = v4;
    objc_storeStrong((id *)p_instantMessageAddresses, v4);
    v4 = obj;
  }

}

- (void)_setImageType:(id)a3
{
  objc_storeStrong((id *)&self->super._imageType, a3);
}

- (void)_setImageHash:(id)a3
{
  objc_storeStrong((id *)&self->super._imageHash, a3);
}

- (void)_setDowntimeWhitelist:(id)a3
{
  objc_storeStrong((id *)&self->super._downtimeWhitelist, a3);
}

- (void)_setDates:(id)a3
{
  NSArray *v4;
  NSArray **p_dates;
  NSArray *obj;

  v4 = (NSArray *)a3;
  p_dates = &self->super._dates;
  if (*p_dates != v4)
  {
    if (!v4)
    {
      +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    obj = v4;
    objc_storeStrong((id *)p_dates, v4);
    v4 = obj;
  }

}

- (void)_setContactRelations:(id)a3
{
  NSArray *v4;
  NSArray **p_contactRelations;
  NSArray *obj;

  v4 = (NSArray *)a3;
  p_contactRelations = &self->super._contactRelations;
  if (*p_contactRelations != v4)
  {
    if (!v4)
    {
      +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    obj = v4;
    objc_storeStrong((id *)p_contactRelations, v4);
    v4 = obj;
  }

}

- (void)_setCallAlert:(id)a3
{
  objc_storeStrong((id *)&self->super._callAlert, a3);
}

- (void)_setCalendarURIs:(id)a3
{
  NSArray *v4;
  NSArray **p_calendarURIs;
  NSArray *obj;

  v4 = (NSArray *)a3;
  p_calendarURIs = &self->super._calendarURIs;
  if (*p_calendarURIs != v4)
  {
    if (!v4)
    {
      +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    obj = v4;
    objc_storeStrong((id *)p_calendarURIs, v4);
    v4 = obj;
  }

}

- (void)_setBirthday:(id)a3
{
  objc_storeStrong((id *)&self->super._birthday, a3);
}

- (void)_setAddressingGrammars:(id)a3
{
  NSArray *v4;
  NSArray **p_addressingGrammars;
  NSArray *obj;

  v4 = (NSArray *)a3;
  p_addressingGrammars = &self->super._addressingGrammars;
  if (*p_addressingGrammars != v4)
  {
    if (!v4)
    {
      +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    obj = v4;
    objc_storeStrong((id *)p_addressingGrammars, v4);
    v4 = obj;
  }

}

- (NSArray)dates
{
  NSArray *v3;
  NSArray *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._dates;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("dates"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E0C9AA60];
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("dates")))
    goto LABEL_9;
  v3 = (NSArray *)MEMORY[0x1E0C9AA60];
  return v3;
}

- (NSArray)urlAddresses
{
  NSArray *v3;
  NSArray *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._urlAddresses;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("urlAddresses"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E0C9AA60];
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("urlAddresses")))
    goto LABEL_9;
  v3 = (NSArray *)MEMORY[0x1E0C9AA60];
  return v3;
}

- (NSDateComponents)nonGregorianBirthday
{
  void *v3;
  void *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = (void *)-[NSDateComponents copy](self->super._nonGregorianBirthday, "copy");
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSDateComponents *)v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("nonGregorianBirthday"));

    if (v6)
      return (NSDateComponents *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("nonGregorianBirthday")))
    goto LABEL_9;
  v3 = 0;
  return (NSDateComponents *)v3;
}

- (CNActivityAlert)callAlert
{
  CNActivityAlert *v3;
  CNActivityAlert *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._callAlert;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (CNActivityAlert *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("callAlert"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("callAlert")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSDateComponents)birthday
{
  void *v3;
  void *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = (void *)-[NSDateComponents copy](self->super._birthday, "copy");
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSDateComponents *)v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("birthday"));

    if (v6)
      return (NSDateComponents *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("birthday")))
    goto LABEL_9;
  v3 = 0;
  return (NSDateComponents *)v3;
}

- (NSString)note
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._note;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("note"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("note")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSData)imageBackgroundColorsData
{
  NSData *v3;
  NSData *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._imageBackgroundColorsData;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("imageBackgroundColorsData"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("imageBackgroundColorsData")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (CNActivityAlert)textAlert
{
  CNActivityAlert *v3;
  CNActivityAlert *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._textAlert;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (CNActivityAlert *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("textAlert"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("textAlert")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSArray)contactRelations
{
  NSArray *v3;
  NSArray *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._contactRelations;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("contactRelations"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E0C9AA60];
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("contactRelations")))
    goto LABEL_9;
  v3 = (NSArray *)MEMORY[0x1E0C9AA60];
  return v3;
}

- (NSData)watchWallpaperImageData
{
  NSData *v3;
  NSData *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._watchWallpaperImageData;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("watchWallpaperImageData"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("watchWallpaperImageData")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (CNSensitiveContentConfiguration)sensitiveContentConfiguration
{
  CNSensitiveContentConfiguration *v3;
  CNSensitiveContentConfiguration *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._sensitiveContentConfiguration;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (CNSensitiveContentConfiguration *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("sensitiveContentConfiguration"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("sensitiveContentConfiguration")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)mapsData
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._mapsData;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("mapsData"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("mapsData")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSArray)calendarURIs
{
  NSArray *v3;
  NSArray *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._calendarURIs;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("calendarURIs"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("calendarURIs")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (void)_setWallpaperURI:(id)a3
{
  objc_storeStrong((id *)&self->super._wallpaperURI, a3);
}

- (void)_setSyncImageData:(id)a3
{
  objc_storeStrong((id *)&self->super._syncImageData, a3);
}

- (void)_setSectionForSortingByGivenName:(id)a3
{
  objc_storeStrong((id *)&self->super._sectionForSortingByGivenName, a3);
}

- (void)_setSectionForSortingByFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->super._sectionForSortingByFamilyName, a3);
}

- (void)_setModificationDate:(id)a3
{
  objc_storeStrong((id *)&self->super._modificationDate, a3);
}

- (void)_setExternalUUID:(id)a3
{
  objc_storeStrong((id *)&self->super._externalUUID, a3);
}

- (void)_setExternalRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->super._externalRepresentation, a3);
}

- (void)_setExternalModificationTag:(id)a3
{
  objc_storeStrong((id *)&self->super._externalModificationTag, a3);
}

- (void)_setExternalImageURI:(id)a3
{
  objc_storeStrong((id *)&self->super._externalImageURI, a3);
}

- (void)_setExternalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->super._externalIdentifier, a3);
}

- (void)_setExplicitDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->super._explicitDisplayName, a3);
}

- (void)_setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->super._creationDate, a3);
}

- (void)_setAddressingGrammarsEncrypted:(id)a3
{
  NSArray *v4;
  NSArray **p_addressingGrammarsEncrypted;
  NSArray *obj;

  v4 = (NSArray *)a3;
  p_addressingGrammarsEncrypted = &self->super._addressingGrammarsEncrypted;
  if (*p_addressingGrammarsEncrypted != v4)
  {
    if (!v4)
    {
      +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    obj = v4;
    objc_storeStrong((id *)p_addressingGrammarsEncrypted, v4);
    v4 = obj;
  }

}

- (NSString)phonemeData
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._phonemeData;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("phonemeData"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("phonemeData")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)wallpaperURI
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._wallpaperURI;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("wallpaperURI"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("wallpaperURI")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSData)syncImageData
{
  NSData *v3;
  NSData *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._syncImageData;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("syncImageData"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("syncImageData")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)sectionForSortingByGivenName
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._sectionForSortingByGivenName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("sectionForSortingByGivenName"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("sectionForSortingByGivenName")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)sectionForSortingByFamilyName
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._sectionForSortingByFamilyName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("sectionForSortingByFamilyName"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("sectionForSortingByFamilyName")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSDate)modificationDate
{
  NSDate *v3;
  NSDate *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._modificationDate;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("modificationDate"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("modificationDate")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)externalUUID
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._externalUUID;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("externalUUID"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("externalUUID")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSData)externalRepresentation
{
  NSData *v3;
  NSData *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._externalRepresentation;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("externalRepresentation"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("externalRepresentation")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)externalModificationTag
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._externalModificationTag;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("externalModificationTag"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("externalModificationTag")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)externalIdentifier
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._externalIdentifier;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("externalIdentifier"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("externalIdentifier")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)explicitDisplayName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._explicitDisplayName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("explicitDisplayName"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("explicitDisplayName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSDate)creationDate
{
  NSDate *v3;
  NSDate *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._creationDate;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("creationDate"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("creationDate")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSArray)addressingGrammarsEncrypted
{
  NSArray *v3;
  NSArray *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._addressingGrammarsEncrypted;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("addressingGrammarsEncrypted"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E0C9AA60];
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("addressingGrammarsEncrypted")))
    goto LABEL_9;
  v3 = (NSArray *)MEMORY[0x1E0C9AA60];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cropRectHash, 0);
  objc_storeStrong((id *)&self->_cropRectID, 0);
}

- (void)setEmailAddresses:(NSArray *)emailAddresses
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  CNContactKeyVector *availableKeyDescriptor;
  void *v8;
  void *v9;
  void *v10;
  CNContactKeyVector *v11;
  BOOL v12;
  NSArray *v13;

  v4 = emailAddresses;
  v5 = self->super._emailAddresses;
  v13 = v4;
  if (!v5)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("emailAddresses")))
    {
      goto LABEL_6;
    }
    goto LABEL_10;
  }
  +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v11 = self->super._availableKeyDescriptor;
    if (!v11)
    {
      v6 = v5;
      goto LABEL_3;
    }
    v12 = -[CNContactKeyVector containsKey:](v11, "containsKey:", CFSTR("emailAddresses"));

    if (v12)
      goto LABEL_6;
LABEL_10:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    goto LABEL_7;
  }
LABEL_3:

LABEL_6:
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("emailAddresses"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertValueType:", v13);

  v10 = (void *)-[NSArray copy](v13, "copy");
  -[CNMutableContact _setEmailAddresses:](self, "_setEmailAddresses:", v10);

LABEL_7:
}

BOOL __60__CNMutableContact_updateImageDataAvailableFromCurrentState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isKeyAvailable:", v5))
  {
    objc_msgSend(v3, "CNValueForContact:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nilValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6 != v7;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSData)imageData
{
  NSData *v3;
  NSData *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._imageData;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("imageData"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("imageData")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSData)thumbnailImageData
{
  NSData *v3;
  NSData *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._thumbnailImageData;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("thumbnailImageData"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("thumbnailImageData")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSData)fullscreenImageData
{
  NSData *v3;
  NSData *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._fullscreenImageData;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("fullscreenImageData"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("fullscreenImageData")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)externalImageURI
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._externalImageURI;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("externalImageURI"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("externalImageURI")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (CNContactType)contactType
{
  CNContactType contactType;
  CNContactKeyVector *availableKeyDescriptor;

  contactType = self->super._contactType;
  availableKeyDescriptor = self->super._availableKeyDescriptor;
  if (availableKeyDescriptor
    && !-[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("contactType")))
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }
  return contactType;
}

- (NSString)nameSuffix
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._nameSuffix;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("nameSuffix"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("nameSuffix")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSString)namePrefix
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._namePrefix;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("namePrefix"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("namePrefix")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSString)nickname
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._nickname;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("nickname"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("nickname")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSString)organizationName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._organizationName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("organizationName"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("organizationName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSString)phoneticGivenName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._phoneticGivenName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("phoneticGivenName"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("phoneticGivenName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSString)phoneticFamilyName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._phoneticFamilyName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("phoneticFamilyName"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("phoneticFamilyName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSString)phoneticMiddleName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._phoneticMiddleName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("phoneticMiddleName"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("phoneticMiddleName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSString)phoneticOrganizationName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._phoneticOrganizationName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("phoneticOrganizationName"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("phoneticOrganizationName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (void)setFlags:(unint64_t)a3
{
  self->super._flags = a3;
}

- (void)_setMiddleName:(id)a3
{
  objc_storeStrong((id *)&self->super._middleName, a3);
}

- (void)_setNickname:(id)a3
{
  objc_storeStrong((id *)&self->super._nickname, a3);
}

- (void)_setImageBackgroundColorsData:(id)a3
{
  objc_storeStrong((id *)&self->super._imageBackgroundColorsData, a3);
}

- (void)_setDepartmentName:(id)a3
{
  objc_storeStrong((id *)&self->super._departmentName, a3);
}

- (NSArray)addressingGrammars
{
  NSArray *v3;
  NSArray *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._addressingGrammars;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("addressingGrammars"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E0C9AA60];
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("addressingGrammars")))
    goto LABEL_9;
  v3 = (NSArray *)MEMORY[0x1E0C9AA60];
  return v3;
}

- (void)setThumbnailImageData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._thumbnailImageData
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("thumbnailImageData")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("thumbnailImageData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setThumbnailImageData:](self, "_setThumbnailImageData:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (CNWallpaper)wallpaper
{
  CNWallpaper *v3;
  CNWallpaper *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._wallpaper;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (CNWallpaper *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("wallpaper"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("wallpaper")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (BOOL)preferredForName
{
  _BOOL4 preferredForName;
  CNContactKeyVector *availableKeyDescriptor;

  preferredForName = self->super._preferredForName;
  availableKeyDescriptor = self->super._availableKeyDescriptor;
  if (availableKeyDescriptor
    && !-[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("preferredForName")))
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }
  return preferredForName;
}

- (BOOL)preferredForImage
{
  _BOOL4 preferredForImage;
  CNContactKeyVector *availableKeyDescriptor;

  preferredForImage = self->super._preferredForImage;
  availableKeyDescriptor = self->super._availableKeyDescriptor;
  if (availableKeyDescriptor
    && !-[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("preferredForImage")))
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }
  return preferredForImage;
}

- (BOOL)isUsingSharedPhoto
{
  return self->super._isUsingSharedPhoto;
}

- (int64_t)sharedPhotoDisplayPreference
{
  int64_t sharedPhotoDisplayPreference;
  CNContactKeyVector *availableKeyDescriptor;

  sharedPhotoDisplayPreference = self->super._sharedPhotoDisplayPreference;
  availableKeyDescriptor = self->super._availableKeyDescriptor;
  if (availableKeyDescriptor
    && !-[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("sharedPhotoDisplayPreference")))
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }
  return sharedPhotoDisplayPreference;
}

- (void)_setFullscreenImageData:(id)a3
{
  objc_storeStrong((id *)&self->super._fullscreenImageData, a3);
  -[CNMutableContact updateImageDataAvailableFromCurrentState](self, "updateImageDataAvailableFromCurrentState");
  -[CNMutableContact resetIsUsingSharedPhoto](self, "resetIsUsingSharedPhoto");
}

- (void)_setImageData:(id)a3
{
  objc_storeStrong((id *)&self->super._imageData, a3);
  -[CNMutableContact updateImageDataAvailableFromCurrentState](self, "updateImageDataAvailableFromCurrentState");
  -[CNMutableContact resetIsUsingSharedPhoto](self, "resetIsUsingSharedPhoto");
}

- (void)setCropRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CNContact assertKeyIsAvailable:](self, "assertKeyIsAvailable:", CFSTR("cropRect"));
  self->super._cropRect.origin.x = x;
  self->super._cropRect.origin.y = y;
  self->super._cropRect.size.width = width;
  self->super._cropRect.size.height = height;
}

- (BOOL)imageDataAvailable
{
  -[CNContact assertKeyIsAvailable:](self, "assertKeyIsAvailable:", CFSTR("imageDataAvailable"));
  return self->super._imageDataAvailable;
}

- (void)_setThumbnailImageData:(id)a3
{
  objc_storeStrong((id *)&self->super._thumbnailImageData, a3);
  -[CNMutableContact updateImageDataAvailableFromCurrentState](self, "updateImageDataAvailableFromCurrentState");
  -[CNMutableContact resetIsUsingSharedPhoto](self, "resetIsUsingSharedPhoto");
}

- (void)updateImageDataAvailableFromCurrentState
{
  id v3;
  _QWORD v4[5];

  if (-[CNContact isKeyAvailable:](self, "isKeyAvailable:", CFSTR("imageDataAvailable")))
  {
    objc_msgSend((id)objc_opt_class(), "imageDataDescriptions");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __60__CNMutableContact_updateImageDataAvailableFromCurrentState__block_invoke;
    v4[3] = &unk_1E29F7DC0;
    v4[4] = self;
    -[CNMutableContact setImageDataAvailable:](self, "setImageDataAvailable:", objc_msgSend(v3, "_cn_any:", v4));

  }
}

+ (id)imageDataDescriptions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CN imageDataDescription](CN, "imageDataDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  +[CN fullscreenImageDataDescription](CN, "fullscreenImageDataDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

  +[CN thumbnailImageDataDescription](CN, "thumbnailImageDataDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v5);

  +[CN externalImageURIDescription](CN, "externalImageURIDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v6);

  return v2;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[CNContact assertKeyIsAvailable:](self, "assertKeyIsAvailable:", CFSTR("cropRect"));
  x = self->super._cropRect.origin.x;
  y = self->super._cropRect.origin.y;
  width = self->super._cropRect.size.width;
  height = self->super._cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setImageDataAvailable:(BOOL)a3
{
  -[CNContact assertKeyIsAvailable:](self, "assertKeyIsAvailable:", CFSTR("imageDataAvailable"));
  self->super._imageDataAvailable = a3;
}

- (NSString)downtimeWhitelist
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._downtimeWhitelist;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("downtimeWhitelist"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("downtimeWhitelist")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (void)setImageData:(NSData *)imageData
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  NSData *v8;

  v8 = imageData;
  if (self->super._imageData
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("imageData")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("imageData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)-[NSData copy](v8, "copy");
    -[CNMutableContact _setImageData:](self, "_setImageData:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setPreferredForName:(BOOL)a3
{
  CNContactKeyVector *availableKeyDescriptor;

  if (self->super._preferredForName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("preferredForName")))
  {
    self->super._preferredForName = a3;
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }
}

- (void)setSharedPhotoDisplayPreference:(int64_t)a3
{
  CNContactKeyVector *availableKeyDescriptor;

  if (self->super._sharedPhotoDisplayPreference
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("sharedPhotoDisplayPreference")))
  {
    self->super._sharedPhotoDisplayPreference = a3;
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }
}

- (void)setPreferredForImage:(BOOL)a3
{
  CNContactKeyVector *availableKeyDescriptor;

  if (self->super._preferredForImage
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("preferredForImage")))
  {
    self->super._preferredForImage = a3;
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }
}

- (void)_setWallpaperMetadata:(id)a3
{
  objc_storeStrong((id *)&self->super._wallpaperMetadata, a3);
}

- (void)_setPostalAddresses:(id)a3
{
  NSArray *v4;
  NSArray **p_postalAddresses;
  NSArray *obj;

  v4 = (NSArray *)a3;
  p_postalAddresses = &self->super._postalAddresses;
  if (*p_postalAddresses != v4)
  {
    if (!v4)
    {
      +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    obj = v4;
    objc_storeStrong((id *)p_postalAddresses, v4);
    v4 = obj;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  +[CNContact contactWithContact:](CNContact, "contactWithContact:", self);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setGivenName:(NSString *)givenName
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  NSString *v8;

  v8 = givenName;
  if (self->super._givenName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("givenName")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("givenName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)-[NSString copy](v8, "copy");
    -[CNMutableContact _setGivenName:](self, "_setGivenName:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setFamilyName:(NSString *)familyName
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  NSString *v8;

  v8 = familyName;
  if (self->super._familyName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("familyName")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("familyName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)-[NSString copy](v8, "copy");
    -[CNMutableContact _setFamilyName:](self, "_setFamilyName:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (NSString)preferredChannel
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._preferredChannel;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("preferredChannel"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("preferredChannel")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)departmentName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._departmentName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("departmentName"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("departmentName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSString)preferredApplePersonaIdentifier
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._preferredApplePersonaIdentifier;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("preferredApplePersonaIdentifier"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("preferredApplePersonaIdentifier")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)preferredLikenessSource
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._preferredLikenessSource;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("preferredLikenessSource"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("preferredLikenessSource")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)jobTitle
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._jobTitle;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("jobTitle"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("jobTitle")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSString)previousFamilyName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._previousFamilyName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("previousFamilyName"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("previousFamilyName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSString)pronunciationGivenName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._pronunciationGivenName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("pronunciationGivenName"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("pronunciationGivenName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSString)pronunciationFamilyName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._pronunciationFamilyName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("pronunciationFamilyName"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("pronunciationFamilyName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSArray)socialProfiles
{
  NSArray *v3;
  NSArray *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._socialProfiles;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("socialProfiles"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E0C9AA60];
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("socialProfiles")))
    goto LABEL_9;
  v3 = (NSArray *)MEMORY[0x1E0C9AA60];
  return v3;
}

- (NSArray)postalAddresses
{
  NSArray *v3;
  NSArray *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._postalAddresses;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("postalAddresses"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E0C9AA60];
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("postalAddresses")))
    goto LABEL_9;
  v3 = (NSArray *)MEMORY[0x1E0C9AA60];
  return v3;
}

- (NSArray)instantMessageAddresses
{
  NSArray *v3;
  NSArray *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._instantMessageAddresses;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("instantMessageAddresses"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E0C9AA60];
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("instantMessageAddresses")))
    goto LABEL_9;
  v3 = (NSArray *)MEMORY[0x1E0C9AA60];
  return v3;
}

- (NSData)memojiMetadata
{
  NSData *v3;
  NSData *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._memojiMetadata;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("memojiMetadata"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("memojiMetadata")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)linkIdentifier
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._linkIdentifier;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("linkIdentifier"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("linkIdentifier")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)imageType
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._imageType;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("imageType"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("imageType")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSData)imageHash
{
  NSData *v3;
  NSData *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._imageHash;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("imageHash"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("imageHash")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (void)setOrganizationName:(NSString *)organizationName
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  NSString *v8;

  v8 = organizationName;
  if (self->super._organizationName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("organizationName")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("organizationName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)-[NSString copy](v8, "copy");
    -[CNMutableContact _setOrganizationName:](self, "_setOrganizationName:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setNickname:(NSString *)nickname
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  NSString *v8;

  v8 = nickname;
  if (self->super._nickname
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("nickname")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("nickname"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)-[NSString copy](v8, "copy");
    -[CNMutableContact _setNickname:](self, "_setNickname:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setNameSuffix:(NSString *)nameSuffix
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  NSString *v8;

  v8 = nameSuffix;
  if (self->super._nameSuffix
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("nameSuffix")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("nameSuffix"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)-[NSString copy](v8, "copy");
    -[CNMutableContact _setNameSuffix:](self, "_setNameSuffix:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setNamePrefix:(NSString *)namePrefix
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  NSString *v8;

  v8 = namePrefix;
  if (self->super._namePrefix
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("namePrefix")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("namePrefix"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)-[NSString copy](v8, "copy");
    -[CNMutableContact _setNamePrefix:](self, "_setNamePrefix:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setMiddleName:(NSString *)middleName
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  NSString *v8;

  v8 = middleName;
  if (self->super._middleName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("middleName")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("middleName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)-[NSString copy](v8, "copy");
    -[CNMutableContact _setMiddleName:](self, "_setMiddleName:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setLinkedContacts:(id)a3
{
  objc_class *v4;
  id v5;
  NSArray *v6;
  NSArray *linkedContacts;

  if (self->super._linkedContacts != a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0C99D20];
    v5 = a3;
    v6 = (NSArray *)objc_msgSend([v4 alloc], "initWithArray:", v5);

    linkedContacts = self->super._linkedContacts;
    self->super._linkedContacts = v6;

  }
}

- (void)setLinkIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._linkIdentifier
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("linkIdentifier")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("linkIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setLinkIdentifier:](self, "_setLinkIdentifier:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (CNMutableContact)initWithContact:(id)a3
{
  id v4;
  CNMutableContact *v5;
  uint64_t v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNMutableContact;
  v5 = -[CNContact init](&v8, sel_init);
  if (v5 && v4)
  {
    v6 = objc_msgSend(v4, "mutableCopy");

    v5 = (CNMutableContact *)v6;
  }

  return v5;
}

- (id)copyWithSelfAsSnapshot
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;

  v2 = (_QWORD *)-[CNMutableContact copy](self, "copy");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v2[67];
  v2[67] = v3;

  return v2;
}

- (void)setFrozenSelfAsSnapshot
{
  id v3;

  v3 = (id)-[CNMutableContact copy](self, "copy");
  -[CNMutableContact setSnapshot:](self, "setSnapshot:", v3);

}

+ (id)unifyContacts:(id)a3
{
  return +[CN mutableContactUnifyingContacts:includingMainStoreContacts:](CN, "mutableContactUnifyingContacts:includingMainStoreContacts:", a3, 1);
}

- (void)setPreviousFamilyName:(NSString *)previousFamilyName
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  NSString *v8;

  v8 = previousFamilyName;
  if (self->super._previousFamilyName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("previousFamilyName")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("previousFamilyName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)-[NSString copy](v8, "copy");
    -[CNMutableContact _setPreviousFamilyName:](self, "_setPreviousFamilyName:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setPhoneticGivenName:(NSString *)phoneticGivenName
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  NSString *v8;

  v8 = phoneticGivenName;
  if (self->super._phoneticGivenName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("phoneticGivenName")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("phoneticGivenName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)-[NSString copy](v8, "copy");
    -[CNMutableContact _setPhoneticGivenName:](self, "_setPhoneticGivenName:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setPhoneticMiddleName:(NSString *)phoneticMiddleName
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  NSString *v8;

  v8 = phoneticMiddleName;
  if (self->super._phoneticMiddleName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("phoneticMiddleName")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("phoneticMiddleName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)-[NSString copy](v8, "copy");
    -[CNMutableContact _setPhoneticMiddleName:](self, "_setPhoneticMiddleName:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setPhoneticFamilyName:(NSString *)phoneticFamilyName
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  NSString *v8;

  v8 = phoneticFamilyName;
  if (self->super._phoneticFamilyName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("phoneticFamilyName")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("phoneticFamilyName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)-[NSString copy](v8, "copy");
    -[CNMutableContact _setPhoneticFamilyName:](self, "_setPhoneticFamilyName:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setPhoneticOrganizationName:(NSString *)phoneticOrganizationName
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  NSString *v8;

  v8 = phoneticOrganizationName;
  if (self->super._phoneticOrganizationName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("phoneticOrganizationName")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("phoneticOrganizationName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)-[NSString copy](v8, "copy");
    -[CNMutableContact _setPhoneticOrganizationName:](self, "_setPhoneticOrganizationName:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (NSString)searchIndex
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._searchIndex;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("searchIndex"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("searchIndex")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (void)setSearchIndex:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._searchIndex
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("searchIndex")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("searchIndex"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setSearchIndex:](self, "_setSearchIndex:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)_setSearchIndex:(id)a3
{
  objc_storeStrong((id *)&self->super._searchIndex, a3);
}

- (void)setPronunciationGivenName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._pronunciationGivenName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("pronunciationGivenName")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("pronunciationGivenName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setPronunciationGivenName:](self, "_setPronunciationGivenName:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setPronunciationFamilyName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._pronunciationFamilyName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("pronunciationFamilyName")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("pronunciationFamilyName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setPronunciationFamilyName:](self, "_setPronunciationFamilyName:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setExplicitDisplayName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._explicitDisplayName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("explicitDisplayName")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("explicitDisplayName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setExplicitDisplayName:](self, "_setExplicitDisplayName:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setSectionForSortingByFamilyName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._sectionForSortingByFamilyName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("sectionForSortingByFamilyName")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("sectionForSortingByFamilyName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setSectionForSortingByFamilyName:](self, "_setSectionForSortingByFamilyName:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setSectionForSortingByGivenName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._sectionForSortingByGivenName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("sectionForSortingByGivenName")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("sectionForSortingByGivenName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setSectionForSortingByGivenName:](self, "_setSectionForSortingByGivenName:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setDepartmentName:(NSString *)departmentName
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  NSString *v8;

  v8 = departmentName;
  if (self->super._departmentName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("departmentName")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("departmentName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)-[NSString copy](v8, "copy");
    -[CNMutableContact _setDepartmentName:](self, "_setDepartmentName:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setJobTitle:(NSString *)jobTitle
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  NSString *v8;

  v8 = jobTitle;
  if (self->super._jobTitle
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("jobTitle")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("jobTitle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)-[NSString copy](v8, "copy");
    -[CNMutableContact _setJobTitle:](self, "_setJobTitle:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setBirthday:(NSDateComponents *)birthday
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  NSDateComponents *v8;

  v8 = birthday;
  if (self->super._birthday
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("birthday")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("birthday"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)-[NSDateComponents copy](v8, "copy");
    -[CNMutableContact _setBirthday:](self, "_setBirthday:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setNonGregorianBirthday:(NSDateComponents *)nonGregorianBirthday
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  NSDateComponents *v8;

  v8 = nonGregorianBirthday;
  if (self->super._nonGregorianBirthday
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("nonGregorianBirthday")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("nonGregorianBirthday"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)-[NSDateComponents copy](v8, "copy");
    -[CNMutableContact _setNonGregorianBirthday:](self, "_setNonGregorianBirthday:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setCreationDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._creationDate
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("creationDate")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("creationDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setCreationDate:](self, "_setCreationDate:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setModificationDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._modificationDate
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("modificationDate")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("modificationDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setModificationDate:](self, "_setModificationDate:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setNote:(NSString *)note
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  NSString *v8;

  v8 = note;
  if (self->super._note
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("note")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("note"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)-[NSString copy](v8, "copy");
    -[CNMutableContact _setNote:](self, "_setNote:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setFullscreenImageData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._fullscreenImageData
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("fullscreenImageData")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("fullscreenImageData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setFullscreenImageData:](self, "_setFullscreenImageData:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setSyncImageData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._syncImageData
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("syncImageData")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("syncImageData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setSyncImageData:](self, "_setSyncImageData:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (NSString)cardDAVUID
{
  return (NSString *)(id)-[NSString copy](self->super._cardDAVUID, "copy");
}

- (void)setCardDAVUID:(id)a3
{
  NSString *v4;
  NSString *cardDAVUID;

  if (self->super._cardDAVUID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    cardDAVUID = self->super._cardDAVUID;
    self->super._cardDAVUID = v4;

  }
}

- (void)setPhonemeData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._phonemeData
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("phonemeData")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("phonemeData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setPhonemeData:](self, "_setPhonemeData:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setCallAlert:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._callAlert
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("callAlert")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("callAlert"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setCallAlert:](self, "_setCallAlert:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setTextAlert:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._textAlert
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("textAlert")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("textAlert"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setTextAlert:](self, "_setTextAlert:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setExternalIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._externalIdentifier
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("externalIdentifier")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("externalIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setExternalIdentifier:](self, "_setExternalIdentifier:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setExternalRepresentation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._externalRepresentation
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("externalRepresentation")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("externalRepresentation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setExternalRepresentation:](self, "_setExternalRepresentation:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setExternalModificationTag:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._externalModificationTag
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("externalModificationTag")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("externalModificationTag"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setExternalModificationTag:](self, "_setExternalModificationTag:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setExternalUUID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._externalUUID
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("externalUUID")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("externalUUID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setExternalUUID:](self, "_setExternalUUID:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setExternalImageURI:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._externalImageURI
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("externalImageURI")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("externalImageURI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setExternalImageURI:](self, "_setExternalImageURI:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setMapsData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._mapsData
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("mapsData")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("mapsData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setMapsData:](self, "_setMapsData:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setImplicitAugmentation:(BOOL)a3
{
  -[CNMutableContact setFlags:](self, "setFlags:", -[CNContact flags](self, "flags") & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (void)setUrlAddresses:(NSArray *)urlAddresses
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  CNContactKeyVector *availableKeyDescriptor;
  void *v8;
  void *v9;
  void *v10;
  CNContactKeyVector *v11;
  BOOL v12;
  NSArray *v13;

  v4 = urlAddresses;
  v5 = self->super._urlAddresses;
  v13 = v4;
  if (!v5)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("urlAddresses")))
    {
      goto LABEL_6;
    }
    goto LABEL_10;
  }
  +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v11 = self->super._availableKeyDescriptor;
    if (!v11)
    {
      v6 = v5;
      goto LABEL_3;
    }
    v12 = -[CNContactKeyVector containsKey:](v11, "containsKey:", CFSTR("urlAddresses"));

    if (v12)
      goto LABEL_6;
LABEL_10:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    goto LABEL_7;
  }
LABEL_3:

LABEL_6:
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("urlAddresses"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertValueType:", v13);

  v10 = (void *)-[NSArray copy](v13, "copy");
  -[CNMutableContact _setUrlAddresses:](self, "_setUrlAddresses:", v10);

LABEL_7:
}

- (void)setDates:(NSArray *)dates
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  CNContactKeyVector *availableKeyDescriptor;
  void *v8;
  void *v9;
  void *v10;
  CNContactKeyVector *v11;
  BOOL v12;
  NSArray *v13;

  v4 = dates;
  v5 = self->super._dates;
  v13 = v4;
  if (!v5)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("dates")))
    {
      goto LABEL_6;
    }
    goto LABEL_10;
  }
  +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v11 = self->super._availableKeyDescriptor;
    if (!v11)
    {
      v6 = v5;
      goto LABEL_3;
    }
    v12 = -[CNContactKeyVector containsKey:](v11, "containsKey:", CFSTR("dates"));

    if (v12)
      goto LABEL_6;
LABEL_10:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    goto LABEL_7;
  }
LABEL_3:

LABEL_6:
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("dates"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertValueType:", v13);

  v10 = (void *)-[NSArray copy](v13, "copy");
  -[CNMutableContact _setDates:](self, "_setDates:", v10);

LABEL_7:
}

- (void)setInstantMessageAddresses:(NSArray *)instantMessageAddresses
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  CNContactKeyVector *availableKeyDescriptor;
  void *v8;
  void *v9;
  void *v10;
  CNContactKeyVector *v11;
  BOOL v12;
  NSArray *v13;

  v4 = instantMessageAddresses;
  v5 = self->super._instantMessageAddresses;
  v13 = v4;
  if (!v5)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("instantMessageAddresses")))
    {
      goto LABEL_6;
    }
    goto LABEL_10;
  }
  +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v11 = self->super._availableKeyDescriptor;
    if (!v11)
    {
      v6 = v5;
      goto LABEL_3;
    }
    v12 = -[CNContactKeyVector containsKey:](v11, "containsKey:", CFSTR("instantMessageAddresses"));

    if (v12)
      goto LABEL_6;
LABEL_10:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    goto LABEL_7;
  }
LABEL_3:

LABEL_6:
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("instantMessageAddresses"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertValueType:", v13);

  v10 = (void *)-[NSArray copy](v13, "copy");
  -[CNMutableContact _setInstantMessageAddresses:](self, "_setInstantMessageAddresses:", v10);

LABEL_7:
}

- (void)setContactRelations:(NSArray *)contactRelations
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  CNContactKeyVector *availableKeyDescriptor;
  void *v8;
  void *v9;
  void *v10;
  CNContactKeyVector *v11;
  BOOL v12;
  NSArray *v13;

  v4 = contactRelations;
  v5 = self->super._contactRelations;
  v13 = v4;
  if (!v5)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("contactRelations")))
    {
      goto LABEL_6;
    }
    goto LABEL_10;
  }
  +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v11 = self->super._availableKeyDescriptor;
    if (!v11)
    {
      v6 = v5;
      goto LABEL_3;
    }
    v12 = -[CNContactKeyVector containsKey:](v11, "containsKey:", CFSTR("contactRelations"));

    if (v12)
      goto LABEL_6;
LABEL_10:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    goto LABEL_7;
  }
LABEL_3:

LABEL_6:
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("contactRelations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertValueType:", v13);

  v10 = (void *)-[NSArray copy](v13, "copy");
  -[CNMutableContact _setContactRelations:](self, "_setContactRelations:", v10);

LABEL_7:
}

- (void)setSocialProfiles:(NSArray *)socialProfiles
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  CNContactKeyVector *availableKeyDescriptor;
  void *v8;
  void *v9;
  void *v10;
  CNContactKeyVector *v11;
  BOOL v12;
  NSArray *v13;

  v4 = socialProfiles;
  v5 = self->super._socialProfiles;
  v13 = v4;
  if (!v5)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("socialProfiles")))
    {
      goto LABEL_6;
    }
    goto LABEL_10;
  }
  +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v11 = self->super._availableKeyDescriptor;
    if (!v11)
    {
      v6 = v5;
      goto LABEL_3;
    }
    v12 = -[CNContactKeyVector containsKey:](v11, "containsKey:", CFSTR("socialProfiles"));

    if (v12)
      goto LABEL_6;
LABEL_10:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    goto LABEL_7;
  }
LABEL_3:

LABEL_6:
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("socialProfiles"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertValueType:", v13);

  v10 = (void *)-[NSArray copy](v13, "copy");
  -[CNMutableContact _setSocialProfiles:](self, "_setSocialProfiles:", v10);

LABEL_7:
}

- (void)setPostalAddresses:(NSArray *)postalAddresses
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  CNContactKeyVector *availableKeyDescriptor;
  void *v8;
  void *v9;
  void *v10;
  CNContactKeyVector *v11;
  BOOL v12;
  NSArray *v13;

  v4 = postalAddresses;
  v5 = self->super._postalAddresses;
  v13 = v4;
  if (!v5)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("postalAddresses")))
    {
      goto LABEL_6;
    }
    goto LABEL_10;
  }
  +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v11 = self->super._availableKeyDescriptor;
    if (!v11)
    {
      v6 = v5;
      goto LABEL_3;
    }
    v12 = -[CNContactKeyVector containsKey:](v11, "containsKey:", CFSTR("postalAddresses"));

    if (v12)
      goto LABEL_6;
LABEL_10:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    goto LABEL_7;
  }
LABEL_3:

LABEL_6:
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("postalAddresses"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertValueType:", v13);

  v10 = (void *)-[NSArray copy](v13, "copy");
  -[CNMutableContact _setPostalAddresses:](self, "_setPostalAddresses:", v10);

LABEL_7:
}

- (void)setCalendarURIs:(id)a3
{
  id v4;
  NSArray *calendarURIs;
  NSArray *v6;
  CNContactKeyVector *availableKeyDescriptor;
  void *v8;
  void *v9;
  void *v10;
  CNContactKeyVector *v11;
  BOOL v12;
  id v13;

  v4 = a3;
  calendarURIs = self->super._calendarURIs;
  v13 = v4;
  if (!calendarURIs)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("calendarURIs")))
    {
      goto LABEL_6;
    }
    goto LABEL_10;
  }
  +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (calendarURIs == v6)
  {
    v11 = self->super._availableKeyDescriptor;
    if (!v11)
    {
      v6 = calendarURIs;
      goto LABEL_3;
    }
    v12 = -[CNContactKeyVector containsKey:](v11, "containsKey:", CFSTR("calendarURIs"));

    if (v12)
      goto LABEL_6;
LABEL_10:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    goto LABEL_7;
  }
LABEL_3:

LABEL_6:
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("calendarURIs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertValueType:", v13);

  v10 = (void *)objc_msgSend(v13, "copy");
  -[CNMutableContact _setCalendarURIs:](self, "_setCalendarURIs:", v10);

LABEL_7:
}

- (void)setAddressingGrammars:(id)a3
{
  id v4;
  NSArray *addressingGrammars;
  NSArray *v6;
  CNContactKeyVector *availableKeyDescriptor;
  void *v8;
  void *v9;
  void *v10;
  CNContactKeyVector *v11;
  BOOL v12;
  id v13;

  v4 = a3;
  addressingGrammars = self->super._addressingGrammars;
  v13 = v4;
  if (!addressingGrammars)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("addressingGrammars")))
    {
      goto LABEL_6;
    }
    goto LABEL_10;
  }
  +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (addressingGrammars == v6)
  {
    v11 = self->super._availableKeyDescriptor;
    if (!v11)
    {
      v6 = addressingGrammars;
      goto LABEL_3;
    }
    v12 = -[CNContactKeyVector containsKey:](v11, "containsKey:", CFSTR("addressingGrammars"));

    if (v12)
      goto LABEL_6;
LABEL_10:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    goto LABEL_7;
  }
LABEL_3:

LABEL_6:
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("addressingGrammars"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertValueType:", v13);

  v10 = (void *)objc_msgSend(v13, "copy");
  -[CNMutableContact _setAddressingGrammars:](self, "_setAddressingGrammars:", v10);

LABEL_7:
}

- (void)setAddressingGrammarsEncrypted:(id)a3
{
  id v4;
  NSArray *addressingGrammarsEncrypted;
  NSArray *v6;
  CNContactKeyVector *availableKeyDescriptor;
  void *v8;
  void *v9;
  void *v10;
  CNContactKeyVector *v11;
  BOOL v12;
  id v13;

  v4 = a3;
  addressingGrammarsEncrypted = self->super._addressingGrammarsEncrypted;
  v13 = v4;
  if (!addressingGrammarsEncrypted)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("addressingGrammarsEncrypted")))
    {
      goto LABEL_6;
    }
    goto LABEL_10;
  }
  +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (addressingGrammarsEncrypted == v6)
  {
    v11 = self->super._availableKeyDescriptor;
    if (!v11)
    {
      v6 = addressingGrammarsEncrypted;
      goto LABEL_3;
    }
    v12 = -[CNContactKeyVector containsKey:](v11, "containsKey:", CFSTR("addressingGrammarsEncrypted"));

    if (v12)
      goto LABEL_6;
LABEL_10:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    goto LABEL_7;
  }
LABEL_3:

LABEL_6:
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("addressingGrammarsEncrypted"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertValueType:", v13);

  v10 = (void *)objc_msgSend(v13, "copy");
  -[CNMutableContact _setAddressingGrammarsEncrypted:](self, "_setAddressingGrammarsEncrypted:", v10);

LABEL_7:
}

- (void)setPreferredLikenessSource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._preferredLikenessSource
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("preferredLikenessSource")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("preferredLikenessSource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setPreferredLikenessSource:](self, "_setPreferredLikenessSource:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setPreferredApplePersonaIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._preferredApplePersonaIdentifier
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("preferredApplePersonaIdentifier")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("preferredApplePersonaIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setPreferredApplePersonaIdentifier:](self, "_setPreferredApplePersonaIdentifier:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setPreferredChannel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._preferredChannel
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("preferredChannel")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("preferredChannel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setPreferredChannel:](self, "_setPreferredChannel:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setDowntimeWhitelist:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._downtimeWhitelist
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("downtimeWhitelist")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("downtimeWhitelist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setDowntimeWhitelist:](self, "_setDowntimeWhitelist:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setImageType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._imageType
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("imageType")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("imageType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setImageType:](self, "_setImageType:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setImageHash:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._imageHash
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("imageHash")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("imageHash"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setImageHash:](self, "_setImageHash:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setMemojiMetadata:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._memojiMetadata
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("memojiMetadata")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("memojiMetadata"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setMemojiMetadata:](self, "_setMemojiMetadata:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setWallpaper:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._wallpaper
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("wallpaper")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("wallpaper"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setWallpaper:](self, "_setWallpaper:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (CNWallpaperMetadata)wallpaperMetadata
{
  CNWallpaperMetadata *v3;
  CNWallpaperMetadata *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._wallpaperMetadata;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (CNWallpaperMetadata *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("wallpaperMetadata"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("wallpaperMetadata")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (void)setWallpaperMetadata:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._wallpaperMetadata
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("wallpaperMetadata")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("wallpaperMetadata"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setWallpaperMetadata:](self, "_setWallpaperMetadata:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setWatchWallpaperImageData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._watchWallpaperImageData
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("watchWallpaperImageData")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("watchWallpaperImageData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setWatchWallpaperImageData:](self, "_setWatchWallpaperImageData:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setWallpaperURI:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._wallpaperURI
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("wallpaperURI")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("wallpaperURI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setWallpaperURI:](self, "_setWallpaperURI:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setImageBackgroundColorsData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._imageBackgroundColorsData
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("imageBackgroundColorsData")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("imageBackgroundColorsData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setImageBackgroundColorsData:](self, "_setImageBackgroundColorsData:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)setSensitiveContentConfiguration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._sensitiveContentConfiguration
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("sensitiveContentConfiguration")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("sensitiveContentConfiguration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setSensitiveContentConfiguration:](self, "_setSensitiveContentConfiguration:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (NSDate)imageSyncFailedTime
{
  NSDate *v3;
  NSDate *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._imageSyncFailedTime;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("imageSyncFailedTime"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("imageSyncFailedTime")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (void)setImageSyncFailedTime:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._imageSyncFailedTime
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("imageSyncFailedTime")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("imageSyncFailedTime"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setImageSyncFailedTime:](self, "_setImageSyncFailedTime:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)_setImageSyncFailedTime:(id)a3
{
  objc_storeStrong((id *)&self->super._imageSyncFailedTime, a3);
}

- (NSDate)wallpaperSyncFailedTime
{
  NSDate *v3;
  NSDate *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->super._wallpaperSyncFailedTime;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("wallpaperSyncFailedTime"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->super._availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("wallpaperSyncFailedTime")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (void)setWallpaperSyncFailedTime:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  id v8;

  v8 = a3;
  if (self->super._wallpaperSyncFailedTime
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("wallpaperSyncFailedTime")))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("wallpaperSyncFailedTime"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertValueType:", v8);

    v6 = (void *)objc_msgSend(v8, "copy");
    -[CNMutableContact _setWallpaperSyncFailedTime:](self, "_setWallpaperSyncFailedTime:", v6);

  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }

}

- (void)_setWallpaperSyncFailedTime:(id)a3
{
  objc_storeStrong((id *)&self->super._wallpaperSyncFailedTime, a3);
}

- (void)setNilValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "nilValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCNValue:onContact:", v7, self);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CNMutableContact;
    -[CNMutableContact setNilValueForKey:](&v8, sel_setNilValueForKey_, v4);
  }

}

- (void)updateStateFromContact:(id)a3
{
  if (a3)
    -[CNMutableContact overwriteStateFromContact:](self, "overwriteStateFromContact:");
  else
    -[CNMutableContact resetToNewContact](self, "resetToNewContact");
}

- (void)resetToNewContact
{
  -[CNMutableContact setSnapshot:](self, "setSnapshot:", 0);
  -[CNMutableContact setLinkedContacts:](self, "setLinkedContacts:", MEMORY[0x1E0C9AA60]);
}

- (void)overwriteStateFromContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CNMutableContact *v7;
  CNMutableContact *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  __46__CNMutableContact_overwriteStateFromContact___block_invoke((uint64_t)v4, v4, self);
  objc_msgSend(v4, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNContact snapshot](self, "snapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[CNContact contactWithContact:](CNMutableContact, "contactWithContact:", v6);
      v7 = (CNMutableContact *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = objc_alloc_init(CNMutableContact);
    }
    v8 = v7;
    objc_msgSend(v4, "snapshot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __46__CNMutableContact_overwriteStateFromContact___block_invoke((uint64_t)v9, v9, v8);

    -[CNMutableContact freeze](v8, "freeze");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableContact setSnapshot:](self, "setSnapshot:", v10);

  }
  if (-[CNContact isUnified](self, "isUnified"))
  {
    -[CNContact linkedContacts](self, "linkedContacts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_cn_indexBy:", &__block_literal_global_154_0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__14;
    v23 = __Block_byref_object_dispose__14;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkedContacts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __46__CNMutableContact_overwriteStateFromContact___block_invoke_155;
    v15[3] = &unk_1E29F9C08;
    v14 = v12;
    v16 = v14;
    v17 = &__block_literal_global_54;
    v18 = &v19;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);

    -[CNMutableContact setLinkedContacts:](self, "setLinkedContacts:", v20[5]);
    _Block_object_dispose(&v19, 8);

  }
}

void __46__CNMutableContact_overwriteStateFromContact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "keyVector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyVector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyVectorByAddingKeysFromKeyVector:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAvailableKeyDescriptor:", v8);

  objc_msgSend(v4, "keyVector");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__CNMutableContact_overwriteStateFromContact___block_invoke_2;
  v12[3] = &unk_1E29F9BC0;
  v13 = v4;
  v14 = v5;
  v10 = v5;
  v11 = v4;
  objc_msgSend(v9, "enumeratePropertiesUsingBlock:", v12);

}

void __46__CNMutableContact_overwriteStateFromContact___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "CNValueForContact:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCNValue:onContact:", v5, *(_QWORD *)(a1 + 40));

}

uint64_t __46__CNMutableContact_overwriteStateFromContact___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __46__CNMutableContact_overwriteStateFromContact___block_invoke_155(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    (*(void (**)(void))(a1[5] + 16))();

    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v8);
  }
  else
  {
    v6 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    v7 = (void *)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(v6, "addObject:", v7);
  }

}

- (void)removeKeys:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v8 = a3;
  v4 = objc_msgSend(v8, "count");
  v5 = v8;
  if (v4)
  {
    +[CNContactKeyVector keyVectorWithKeys:](CNContactKeyVector, "keyVectorWithKeys:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __31__CNMutableContact_removeKeys___block_invoke((uint64_t)v6, self, v6);
    if (-[CNContact isUnified](self, "isUnified"))
    {
      -[CNContact linkedContacts](self, "linkedContacts");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __31__CNMutableContact_removeKeys___block_invoke_3;
      v9[3] = &unk_1E29F9C78;
      v11 = &__block_literal_global_158;
      v10 = v6;
      objc_msgSend(v7, "_cn_each:", v9);

    }
    v5 = v8;
  }

}

void __31__CNMutableContact_removeKeys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "keyVector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __31__CNMutableContact_removeKeys___block_invoke_2;
  v9[3] = &unk_1E29F9C50;
  v10 = v4;
  v7 = v4;
  objc_msgSend(v5, "enumeratePropertiesUsingBlock:", v9);
  objc_msgSend(v6, "keyVectorByRemovingKeysFromKeyVector:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAvailableKeyDescriptor:", v8);
}

void __31__CNMutableContact_removeKeys___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "nilValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCNValue:onContact:", v4, *(_QWORD *)(a1 + 32));

}

uint64_t __31__CNMutableContact_removeKeys___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

- (CNContactKeyVector)availableKeyDescriptor
{
  return (CNContactKeyVector *)(id)-[CNContactKeyVector copy](self->super._availableKeyDescriptor, "copy");
}

- (NSString)cropRectID
{
  return self->_cropRectID;
}

- (void)setCropRectID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 736);
}

- (NSData)cropRectHash
{
  return self->_cropRectHash;
}

- (void)setCropRectHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 744);
}

- (BOOL)hasChanges
{
  return self->_hasChanges;
}

- (void)updateWithSharedProfile:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "imageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMutableContact setImageData:](self, "setImageData:", v4);

  objc_msgSend(v15, "thumbnailImageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMutableContact setThumbnailImageData:](self, "setThumbnailImageData:", v5);

  objc_msgSend(v15, "cropRect");
  -[CNMutableContact setCropRect:](self, "setCropRect:");
  -[CNMutableContact setMemojiMetadata:](self, "setMemojiMetadata:", 0);
  objc_msgSend(v15, "imageType");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = CFSTR("PHOTO");
  -[CNMutableContact setImageType:](self, "setImageType:", v8);

  objc_msgSend(v15, "imageData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_cn_md5Hash");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMutableContact setImageHash:](self, "setImageHash:", v10);

  -[CNMutableContact setFullscreenImageData:](self, "setFullscreenImageData:", 0);
  objc_msgSend(v15, "wallpaper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v11, "contentIsSensitive");

  if ((_DWORD)v10)
  {
    -[CNMutableContact setWallpaper:](self, "setWallpaper:", 0);
    -[CNMutableContact setWatchWallpaperImageData:](self, "setWatchWallpaperImageData:", 0);
  }
  else
  {
    objc_msgSend(v15, "wallpaper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableContact setWallpaper:](self, "setWallpaper:", v12);

    objc_msgSend(v15, "watchWallpaperImageData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableContact setWatchWallpaperImageData:](self, "setWatchWallpaperImageData:", v13);

  }
  +[CNSensitiveContentConfiguration configurationWithOverride:](CNSensitiveContentConfiguration, "configurationWithOverride:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMutableContact setSensitiveContentConfiguration:](self, "setSensitiveContentConfiguration:", v14);

}

- (void)setRelatedNames:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        +[CNContactRelation contactRelationWithName:](CNContactRelation, "contactRelationWithName:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[CNMutableContact setContactRelations:](self, "setContactRelations:", v5);
}

@end
