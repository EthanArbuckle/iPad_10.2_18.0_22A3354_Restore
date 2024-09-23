@implementation GDGraphPerson

- (NSPersonNameComponents)suggestedNameComponentsInner
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  GDGraphPerson *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1AE501548(&qword_1EED9BD60);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  GDGraphPerson.suggestedNameComponentsInner.getter((uint64_t)v5);

  v7 = sub_1AE92469C();
  v8 = 0;
  if (_s20IntelligencePlatform17UnstructuredImageV5AssetOwet_0((uint64_t)v5, 1, v7) != 1)
  {
    v8 = (void *)sub_1AE924678();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v5, v7);
  }
  return (NSPersonNameComponents *)v8;
}

- (NSString)suggestedNameStringInner
{
  return (NSString *)sub_1AE7384DC(self, (uint64_t)a2, (void (*)(void))GDGraphPerson.suggestedNameStringInner.getter);
}

- (NSString)suggestedContactIdentifierInner
{
  return (NSString *)sub_1AE7384DC(self, (uint64_t)a2, (void (*)(void))GDGraphPerson.suggestedContactIdentifierInner.getter);
}

- (int64_t)autonamingSuggestionReasonInner
{
  GDGraphPerson *v2;
  int64_t v3;

  v2 = self;
  v3 = GDGraphPerson.autonamingSuggestionReasonInner.getter();

  return v3;
}

- (GDGraphPerson)initWithEntityIdentifierField:(id)a3 fullNamesField:(id)a4 prefixesField:(id)a5 givenNamesField:(id)a6 phoneticGivenNamesField:(id)a7 middleNamesField:(id)a8 phoneticMiddleNamesField:(id)a9 familyNamesField:(id)a10 phoneticFamilyNamesField:(id)a11 previousFamilyNamesField:(id)a12 suffixesField:(id)a13 nicknamesField:(id)a14 birthNamesField:(id)a15 birthdayField:(id)a16 occupationField:(id)a17 isFavoriteField:(id)a18 isCurrentUserField:(id)a19 isInferredDeviceUserField:(id)a20 associatedPeopleField:(id)a21 locationsField:(id)a22 employersField:(id)a23 topicsField:(id)a24 handlesField:(id)a25 identifiersField:(id)a26 contactIdentifierField:(id)a27 visualIdentifiersField:(id)a28 allBirthdayField:(id)a29 allOccupationField:(id)a30 allIsFavoriteField:(id)a31 allIsCurrentUserField:(id)a32 allIsInferredDeviceUserField:(id)a33 allContactIdentifierField:(id)a34
{
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  GDGraphPerson *v45;
  GDGraphPerson *v46;
  id v49;
  id v50;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  objc_super v78;

  v77 = a3;
  v49 = a4;
  v76 = a4;
  v75 = a5;
  v50 = a6;
  v74 = a6;
  v73 = a7;
  v72 = a8;
  v71 = a9;
  v70 = a10;
  v69 = a11;
  v68 = a12;
  v67 = a13;
  v66 = a14;
  v65 = a15;
  v64 = a16;
  v63 = a17;
  v62 = a18;
  v61 = a19;
  v60 = a20;
  v59 = a21;
  v39 = a22;
  v40 = a23;
  v41 = a24;
  v42 = a25;
  v43 = a26;
  v56 = a27;
  v44 = a28;
  v58 = a29;
  v57 = a30;
  v55 = a31;
  v54 = a32;
  v53 = a33;
  v52 = a34;
  v78.receiver = self;
  v78.super_class = (Class)GDGraphPerson;
  v45 = -[GDGraphPerson init](&v78, sel_init);
  v46 = v45;
  if (v45)
  {
    objc_storeStrong((id *)&v45->_entityIdentifier, a3);
    objc_storeStrong((id *)&v46->_fullNames, v49);
    objc_storeStrong((id *)&v46->_prefixes, a5);
    objc_storeStrong((id *)&v46->_givenNames, v50);
    objc_storeStrong((id *)&v46->_phoneticGivenNames, a7);
    objc_storeStrong((id *)&v46->_middleNames, a8);
    objc_storeStrong((id *)&v46->_phoneticMiddleNames, a9);
    objc_storeStrong((id *)&v46->_familyNames, a10);
    objc_storeStrong((id *)&v46->_phoneticFamilyNames, a11);
    objc_storeStrong((id *)&v46->_previousFamilyNames, a12);
    objc_storeStrong((id *)&v46->_suffixes, a13);
    objc_storeStrong((id *)&v46->_nicknames, a14);
    objc_storeStrong((id *)&v46->_birthNames, a15);
    objc_storeStrong((id *)&v46->_birthday, a16);
    objc_storeStrong((id *)&v46->_occupation, a17);
    objc_storeStrong((id *)&v46->_isFavorite, a18);
    objc_storeStrong((id *)&v46->_isCurrentUser, a19);
    objc_storeStrong((id *)&v46->_isInferredDeviceUser, a20);
    objc_storeStrong((id *)&v46->_associatedPeople, a21);
    objc_storeStrong((id *)&v46->_locations, a22);
    objc_storeStrong((id *)&v46->_employers, a23);
    objc_storeStrong((id *)&v46->_topics, a24);
    objc_storeStrong((id *)&v46->_handles, a25);
    objc_storeStrong((id *)&v46->_identifiers, a26);
    objc_storeStrong((id *)&v46->_contactIdentifier, a27);
    objc_storeStrong((id *)&v46->_visualIdentifiers, a28);
    objc_storeStrong((id *)&v46->_allBirthday, a29);
    objc_storeStrong((id *)&v46->_allOccupation, a30);
    objc_storeStrong((id *)&v46->_allIsFavorite, a31);
    objc_storeStrong((id *)&v46->_allIsCurrentUser, a32);
    objc_storeStrong((id *)&v46->_allIsInferredDeviceUser, a33);
    objc_storeStrong((id *)&v46->_allContactIdentifier, a34);
  }

  return v46;
}

- (GDGraphPersonEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSArray)fullNames
{
  return self->_fullNames;
}

- (NSArray)prefixes
{
  return self->_prefixes;
}

- (NSArray)givenNames
{
  return self->_givenNames;
}

- (NSArray)phoneticGivenNames
{
  return self->_phoneticGivenNames;
}

- (NSArray)middleNames
{
  return self->_middleNames;
}

- (NSArray)phoneticMiddleNames
{
  return self->_phoneticMiddleNames;
}

- (NSArray)familyNames
{
  return self->_familyNames;
}

- (NSArray)phoneticFamilyNames
{
  return self->_phoneticFamilyNames;
}

- (NSArray)previousFamilyNames
{
  return self->_previousFamilyNames;
}

- (NSArray)suffixes
{
  return self->_suffixes;
}

- (NSArray)nicknames
{
  return self->_nicknames;
}

- (NSArray)birthNames
{
  return self->_birthNames;
}

- (NSDate)birthday
{
  return self->_birthday;
}

- (NSString)occupation
{
  return self->_occupation;
}

- (NSNumber)isFavorite
{
  return self->_isFavorite;
}

- (NSNumber)isCurrentUser
{
  return self->_isCurrentUser;
}

- (NSNumber)isInferredDeviceUser
{
  return self->_isInferredDeviceUser;
}

- (NSArray)associatedPeople
{
  return self->_associatedPeople;
}

- (NSArray)locations
{
  return self->_locations;
}

- (NSArray)employers
{
  return self->_employers;
}

- (NSArray)topics
{
  return self->_topics;
}

- (NSArray)handles
{
  return self->_handles;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSArray)visualIdentifiers
{
  return self->_visualIdentifiers;
}

- (NSArray)allBirthday
{
  return self->_allBirthday;
}

- (NSArray)allOccupation
{
  return self->_allOccupation;
}

- (NSArray)allIsFavorite
{
  return self->_allIsFavorite;
}

- (NSArray)allIsCurrentUser
{
  return self->_allIsCurrentUser;
}

- (NSArray)allIsInferredDeviceUser
{
  return self->_allIsInferredDeviceUser;
}

- (NSArray)allContactIdentifier
{
  return self->_allContactIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allContactIdentifier, 0);
  objc_storeStrong((id *)&self->_allIsInferredDeviceUser, 0);
  objc_storeStrong((id *)&self->_allIsCurrentUser, 0);
  objc_storeStrong((id *)&self->_allIsFavorite, 0);
  objc_storeStrong((id *)&self->_allOccupation, 0);
  objc_storeStrong((id *)&self->_allBirthday, 0);
  objc_storeStrong((id *)&self->_visualIdentifiers, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_employers, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_associatedPeople, 0);
  objc_storeStrong((id *)&self->_isInferredDeviceUser, 0);
  objc_storeStrong((id *)&self->_isCurrentUser, 0);
  objc_storeStrong((id *)&self->_isFavorite, 0);
  objc_storeStrong((id *)&self->_occupation, 0);
  objc_storeStrong((id *)&self->_birthday, 0);
  objc_storeStrong((id *)&self->_birthNames, 0);
  objc_storeStrong((id *)&self->_nicknames, 0);
  objc_storeStrong((id *)&self->_suffixes, 0);
  objc_storeStrong((id *)&self->_previousFamilyNames, 0);
  objc_storeStrong((id *)&self->_phoneticFamilyNames, 0);
  objc_storeStrong((id *)&self->_familyNames, 0);
  objc_storeStrong((id *)&self->_phoneticMiddleNames, 0);
  objc_storeStrong((id *)&self->_middleNames, 0);
  objc_storeStrong((id *)&self->_phoneticGivenNames, 0);
  objc_storeStrong((id *)&self->_givenNames, 0);
  objc_storeStrong((id *)&self->_prefixes, 0);
  objc_storeStrong((id *)&self->_fullNames, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (id)suggestedNameComponents
{
  return (id)((uint64_t (*)(GDGraphPerson *, char *))MEMORY[0x1E0DE7D20])(self, sel_suggestedNameComponentsInner);
}

- (id)suggestedNameString
{
  return (id)((uint64_t (*)(GDGraphPerson *, char *))MEMORY[0x1E0DE7D20])(self, sel_suggestedNameStringInner);
}

- (id)suggestedContactIdentifier
{
  return (id)((uint64_t (*)(GDGraphPerson *, char *))MEMORY[0x1E0DE7D20])(self, sel_suggestedContactIdentifierInner);
}

- (int64_t)autonamingSuggestionReason
{
  return ((uint64_t (*)(GDGraphPerson *, char *))MEMORY[0x1E0DE7D20])(self, sel_autonamingSuggestionReasonInner);
}

@end
