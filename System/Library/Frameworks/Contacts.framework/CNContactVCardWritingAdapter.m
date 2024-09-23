@implementation CNContactVCardWritingAdapter

+ (id)adapterWithContact:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContact:options:", v7, v6);

  return v8;
}

+ (id)descriptorForAllSupportedKeysWithOptions:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v8;
  void *v9;

  v9 = (void *)MEMORY[0x1E0C99DE8];
  v8 = a3;
  objc_msgSend(v9, "arrayWithObjects:", CFSTR("givenName"), CFSTR("familyName"), CFSTR("middleName"), CFSTR("namePrefix"), CFSTR("nameSuffix"), CFSTR("nickname"), CFSTR("previousFamilyName"), CFSTR("phoneticGivenName"), CFSTR("phoneticMiddleName"), CFSTR("phoneticFamilyName"), CFSTR("pronunciationGivenName"), CFSTR("pronunciationFamilyName"), CFSTR("organizationName"), CFSTR("phoneticOrganizationName"), CFSTR("departmentName"), CFSTR("jobTitle"), CFSTR("contactType"),
    CFSTR("emailAddresses"),
    CFSTR("phoneNumbers"),
    CFSTR("postalAddresses"),
    CFSTR("socialProfiles"),
    CFSTR("instantMessageAddresses"),
    CFSTR("urlAddresses"),
    CFSTR("calendarURIs"),
    CFSTR("callAlert"),
    CFSTR("textAlert"),
    CFSTR("thumbnailImageData"),
    CFSTR("imageData"),
    CFSTR("birthday"),
    CFSTR("nonGregorianBirthday"),
    CFSTR("dates"),
    CFSTR("contactRelations"),
    CFSTR("note"),
    CFSTR("preferredLikenessSource"),
    CFSTR("preferredApplePersonaIdentifier"),
    CFSTR("downtimeWhitelist"),
    CFSTR("imageType"),
    CFSTR("imageHash"),
    CFSTR("memojiMetadata"),
    CFSTR("wallpaper"),
    CFSTR("watchWallpaperImageData"),
    CFSTR("sharedPhotoDisplayPreference"),
    CFSTR("imageBackgroundColorsData"),
    CFSTR("sensitiveContentConfiguration"),
    0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v8, "includePronouns");

  if (v4)
    objc_msgSend(v3, "addObject:", CFSTR("addressingGrammars"));
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContact descriptorWithKeyDescriptors:description:](CNContact, "descriptorWithKeyDescriptors:description:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CNContactVCardWritingAdapter)initWithContact:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  CNContactVCardWritingAdapter *v9;
  CNContactVCardWritingAdapter *v10;
  CNContactVCardWritingAdapter *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNContactVCardWritingAdapter;
  v9 = -[CNContactVCardWritingAdapter init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contact, a3);
    objc_storeStrong((id *)&v10->_options, a4);
    v11 = v10;
  }

  return v10;
}

- (NSString)firstName
{
  return -[CNContact givenName](self->_contact, "givenName");
}

- (NSString)lastName
{
  return -[CNContact familyName](self->_contact, "familyName");
}

- (NSString)middleName
{
  return -[CNContact middleName](self->_contact, "middleName");
}

- (NSString)title
{
  return -[CNContact namePrefix](self->_contact, "namePrefix");
}

- (NSString)suffix
{
  return -[CNContact nameSuffix](self->_contact, "nameSuffix");
}

- (NSString)nickname
{
  return -[CNContact nickname](self->_contact, "nickname");
}

- (NSString)maidenName
{
  return -[CNContact previousFamilyName](self->_contact, "previousFamilyName");
}

- (NSString)phoneticFirstName
{
  return -[CNContact phoneticGivenName](self->_contact, "phoneticGivenName");
}

- (NSString)phoneticMiddleName
{
  return -[CNContact phoneticMiddleName](self->_contact, "phoneticMiddleName");
}

- (NSString)phoneticLastName
{
  return -[CNContact phoneticFamilyName](self->_contact, "phoneticFamilyName");
}

- (NSString)pronunciationFirstName
{
  return -[CNContact pronunciationGivenName](self->_contact, "pronunciationGivenName");
}

- (NSString)pronunciationLastName
{
  return -[CNContact pronunciationFamilyName](self->_contact, "pronunciationFamilyName");
}

- (NSArray)addressingGrammars
{
  void *v3;
  void *v4;

  if (-[CNVCardWritingOptions useUnencryptedPronouns](self->_options, "useUnencryptedPronouns"))
    +[CN addressingGrammarToStringTransform](CN, "addressingGrammarToStringTransform");
  else
    +[CN addressingGrammarToEncryptedStringTransform](CN, "addressingGrammarToEncryptedStringTransform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactVCardWritingAdapter vCardPropertyItemsForProperty:valueTransform:](self, "vCardPropertyItemsForProperty:valueTransform:", CFSTR("addressingGrammars"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSString)organization
{
  return -[CNContact organizationName](self->_contact, "organizationName");
}

- (NSString)phoneticOrganization
{
  return -[CNContact phoneticOrganizationName](self->_contact, "phoneticOrganizationName");
}

- (NSString)department
{
  return -[CNContact departmentName](self->_contact, "departmentName");
}

- (NSString)jobTitle
{
  return -[CNContact jobTitle](self->_contact, "jobTitle");
}

- (BOOL)isMe
{
  return 0;
}

- (BOOL)isCompany
{
  return -[CNContact contactType](self->_contact, "contactType") == CNContactTypeOrganization;
}

- (int)nameOrder
{
  return 0;
}

- (NSArray)emailAddresses
{
  return (NSArray *)-[CNContactVCardWritingAdapter vCardPropertyItemsForProperty:](self, "vCardPropertyItemsForProperty:", CFSTR("emailAddresses"));
}

- (NSArray)phoneNumbers
{
  void *v3;
  void *v4;

  +[CN phoneNumberToStringTransform](CN, "phoneNumberToStringTransform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactVCardWritingAdapter vCardPropertyItemsForProperty:valueTransform:](self, "vCardPropertyItemsForProperty:valueTransform:", CFSTR("phoneNumbers"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)postalAddresses
{
  return (NSArray *)-[CNContactVCardWritingAdapter vCardPropertyItemsForProperty:valueTransform:](self, "vCardPropertyItemsForProperty:valueTransform:", CFSTR("postalAddresses"), &__block_literal_global_79);
}

- (NSArray)socialProfiles
{
  return (NSArray *)-[CNContactVCardWritingAdapter vCardPropertyItemsForProperty:valueTransform:](self, "vCardPropertyItemsForProperty:valueTransform:", CFSTR("socialProfiles"), &__block_literal_global_5_2);
}

id __46__CNContactVCardWritingAdapter_socialProfiles__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = a2;
  +[CN socialProfileToDictionaryTransform](CN, "socialProfileToDictionaryTransform");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v3)[2](v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  +[CNVCardConstantsMapping CNToVCardSocialProfileConstantsMapping](CNVCardConstantsMapping, "CNToVCardSocialProfileConstantsMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("service"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mappedConstant:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("service"));

  return v5;
}

- (NSArray)instantMessagingAddresses
{
  return (NSArray *)-[CNContactVCardWritingAdapter vCardPropertyItemsForProperty:valueTransform:](self, "vCardPropertyItemsForProperty:valueTransform:", CFSTR("instantMessageAddresses"), &__block_literal_global_7_4);
}

id __57__CNContactVCardWritingAdapter_instantMessagingAddresses__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = a2;
  +[CN instantMessageAddressToDictionaryTransform](CN, "instantMessageAddressToDictionaryTransform");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v3)[2](v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  +[CNVCardConstantsMapping CNToVCardInstantMessageConstantsMapping](CNVCardConstantsMapping, "CNToVCardInstantMessageConstantsMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("service"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mappedConstant:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("service"));

  return v5;
}

- (NSArray)urls
{
  return (NSArray *)-[CNContactVCardWritingAdapter vCardPropertyItemsForProperty:](self, "vCardPropertyItemsForProperty:", CFSTR("urlAddresses"));
}

- (NSArray)calendarURIs
{
  return (NSArray *)-[CNContactVCardWritingAdapter vCardPropertyItemsForProperty:](self, "vCardPropertyItemsForProperty:", CFSTR("calendarURIs"));
}

- (NSDictionary)activityAlerts
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CNContact activityAlerts](self->_contact, "activityAlerts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_map:", &__block_literal_global_11_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsForKeys:notFoundMarker:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_cn_map:", &__block_literal_global_13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

- (id)vCardPropertyItemsForProperty:(id)a3
{
  return -[CNContactVCardWritingAdapter vCardPropertyItemsForProperty:valueTransform:](self, "vCardPropertyItemsForProperty:valueTransform:", a3, 0);
}

- (id)vCardPropertyItemsForProperty:(id)a3 valueTransform:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContact valueForKey:](self->_contact, "valueForKey:", v6);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v13, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v7[2](v7, v14);
          v15 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v15;
        }
        v16 = (void *)MEMORY[0x1E0DDCAD8];
        objc_msgSend(v13, "label");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "itemWithValue:label:identifier:", v14, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "_cn_addNonNilObject:", v19);
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  return v8;
}

- (NSArray)imageReferences
{
  return 0;
}

- (NSDictionary)imageCropRects
{
  return 0;
}

- (NSDictionary)largeImageCropRects
{
  return 0;
}

- (NSData)largeImageData
{
  return -[CNContact imageData](self->_contact, "imageData");
}

- (NSData)imageData
{
  return -[CNContact thumbnailImageData](self->_contact, "thumbnailImageData");
}

- (id)largeImageHashOfType:(id)a3
{
  return 0;
}

- (NSDateComponents)birthdayComponents
{
  return -[CNContact birthday](self->_contact, "birthday");
}

- (NSDateComponents)alternateBirthdayComponents
{
  return -[CNContact nonGregorianBirthday](self->_contact, "nonGregorianBirthday");
}

- (NSArray)otherDateComponents
{
  return (NSArray *)-[CNContactVCardWritingAdapter vCardPropertyItemsForProperty:](self, "vCardPropertyItemsForProperty:", CFSTR("dates"));
}

- (NSArray)relatedNames
{
  void *v3;
  void *v4;

  +[CN relatedContactToStringTransform](CN, "relatedContactToStringTransform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactVCardWritingAdapter vCardPropertyItemsForProperty:valueTransform:](self, "vCardPropertyItemsForProperty:valueTransform:", CFSTR("contactRelations"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSString)note
{
  void *v3;

  if (-[CNContact isKeyAvailable:](self->_contact, "isKeyAvailable:", CFSTR("note")))
  {
    -[CNContact note](self->_contact, "note");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSArray)namesOfParentGroups
{
  return 0;
}

- (NSString)cardDAVUID
{
  return -[CNContact cardDAVUID](self->_contact, "cardDAVUID");
}

- (NSString)uid
{
  return 0;
}

- (NSString)phonemeData
{
  return 0;
}

- (int)downtimeWhitelistAuthorization
{
  uint64_t v3;
  void *v4;

  v3 = *MEMORY[0x1E0D13848];
  -[CNContact downtimeWhitelist](self->_contact, "downtimeWhitelist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  if ((v3 & 1) != 0)
    return 0;
  if (+[CNDowntimeWhitelist isWhitelistedContact:](CNDowntimeWhitelist, "isWhitelistedContact:", self->_contact))
  {
    return 1;
  }
  return 2;
}

- (NSString)preferredLikenessSource
{
  return -[CNContact preferredLikenessSource](self->_contact, "preferredLikenessSource");
}

- (NSString)preferredApplePersonaIdentifier
{
  return -[CNContact preferredApplePersonaIdentifier](self->_contact, "preferredApplePersonaIdentifier");
}

- (NSString)imageType
{
  return -[CNContact imageType](self->_contact, "imageType");
}

- (NSData)imageHash
{
  return -[CNContact imageHash](self->_contact, "imageHash");
}

- (NSData)memojiMetadata
{
  return -[CNContact memojiMetadata](self->_contact, "memojiMetadata");
}

- (NSData)wallpaper
{
  void *v2;
  void *v3;

  -[CNContact wallpaper](self->_contact, "wallpaper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSData)watchWallpaperImageData
{
  return -[CNContact watchWallpaperImageData](self->_contact, "watchWallpaperImageData");
}

- (int)sharedPhotoDisplayPreference
{
  int64_t v2;

  v2 = -[CNContact sharedPhotoDisplayPreference](self->_contact, "sharedPhotoDisplayPreference");
  if ((unint64_t)(v2 - 1) >= 3)
    LODWORD(v2) = 0;
  return v2;
}

- (NSData)imageBackgroundColorsData
{
  return -[CNContact imageBackgroundColorsData](self->_contact, "imageBackgroundColorsData");
}

- (NSData)sensitiveContentConfiguration
{
  void *v2;
  void *v3;

  -[CNContact sensitiveContentConfiguration](self->_contact, "sensitiveContentConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSArray)unknownProperties
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
