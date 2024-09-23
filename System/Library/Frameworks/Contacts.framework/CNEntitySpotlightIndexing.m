@implementation CNEntitySpotlightIndexing

+ (void)associateAttributeSet:(id)a3 withContactEntityIdentifiedBy:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v7 = (void *)getLNSpotlightAppEntityMapperClass_softClass;
  v17 = getLNSpotlightAppEntityMapperClass_softClass;
  if (!getLNSpotlightAppEntityMapperClass_softClass)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __getLNSpotlightAppEntityMapperClass_block_invoke;
    v13[3] = &unk_1E29F98A8;
    v13[4] = &v14;
    __getLNSpotlightAppEntityMapperClass_block_invoke((uint64_t)v13);
    v7 = (void *)v15[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v14, 8);
  +[CNContactEntityIdentifierProvider EntityTypeIdentifier](_TtC8Contacts33CNContactEntityIdentifierProvider, "EntityTypeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = &stru_1E29FF900;
  objc_msgSend(v8, "tagCSSearchableItem:entityInstanceIdentifier:typeIdentifier:displayTitle:displaySubtitle:displaySynonyms:typeDisplayName:typeDisplaySynonyms:propertyDictionary:priority:", v5, v6, v9, v12, 0, 0, 0, 0, 0, &unk_1E2A400C8);

}

@end
