@implementation CNContactVCardParsedResultBuilder

+ (id)contactKeyForVCardKey:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = contactKeyForVCardKey__cn_once_token_0;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&contactKeyForVCardKey__cn_once_token_0, &__block_literal_global_16);
  objc_msgSend((id)contactKeyForVCardKey__cn_once_object_0, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __59__CNContactVCardParsedResultBuilder_contactKeyForVCardKey___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[37];
  _QWORD v22[38];

  v22[37] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0DDC960];
  v21[0] = *MEMORY[0x1E0DDC910];
  v21[1] = v0;
  v22[0] = CFSTR("givenName");
  v22[1] = CFSTR("middleName");
  v1 = *MEMORY[0x1E0DDC970];
  v21[2] = *MEMORY[0x1E0DDC948];
  v21[3] = v1;
  v22[2] = CFSTR("familyName");
  v22[3] = CFSTR("namePrefix");
  v2 = *MEMORY[0x1E0DDC978];
  v21[4] = *MEMORY[0x1E0DDC968];
  v21[5] = v2;
  v22[4] = CFSTR("nameSuffix");
  v22[5] = CFSTR("nickname");
  v3 = *MEMORY[0x1E0DDC9A0];
  v21[6] = *MEMORY[0x1E0DDC950];
  v21[7] = v3;
  v22[6] = CFSTR("previousFamilyName");
  v22[7] = CFSTR("phoneticGivenName");
  v4 = *MEMORY[0x1E0DDC9A8];
  v21[8] = *MEMORY[0x1E0DDC9B0];
  v21[9] = v4;
  v22[8] = CFSTR("phoneticMiddleName");
  v22[9] = CFSTR("phoneticFamilyName");
  v5 = *MEMORY[0x1E0DDC9D8];
  v21[10] = *MEMORY[0x1E0DDC9D0];
  v21[11] = v5;
  v22[10] = CFSTR("pronunciationGivenName");
  v22[11] = CFSTR("pronunciationFamilyName");
  v6 = *MEMORY[0x1E0DDC988];
  v21[12] = *MEMORY[0x1E0DDC8E8];
  v21[13] = v6;
  v22[12] = CFSTR("addressingGrammars");
  v22[13] = CFSTR("organizationName");
  v7 = *MEMORY[0x1E0DDC940];
  v21[14] = *MEMORY[0x1E0DDC900];
  v21[15] = v7;
  v22[14] = CFSTR("departmentName");
  v22[15] = CFSTR("jobTitle");
  v8 = *MEMORY[0x1E0DDC8F0];
  v21[16] = *MEMORY[0x1E0DDC8F8];
  v21[17] = v8;
  v22[16] = CFSTR("birthday");
  v22[17] = CFSTR("nonGregorianBirthday");
  v9 = *MEMORY[0x1E0DDC908];
  v21[18] = *MEMORY[0x1E0DDC998];
  v21[19] = v9;
  v22[18] = CFSTR("phoneNumbers");
  v22[19] = CFSTR("emailAddresses");
  v10 = *MEMORY[0x1E0DDC9F0];
  v21[20] = *MEMORY[0x1E0DDC9B8];
  v21[21] = v10;
  v22[20] = CFSTR("postalAddresses");
  v22[21] = CFSTR("socialProfiles");
  v11 = *MEMORY[0x1E0DDC9F8];
  v21[22] = *MEMORY[0x1E0DDC938];
  v21[23] = v11;
  v22[22] = CFSTR("instantMessageAddresses");
  v22[23] = CFSTR("urlAddresses");
  v12 = *MEMORY[0x1E0DDC990];
  v21[24] = *MEMORY[0x1E0DDC9E0];
  v21[25] = v12;
  v22[24] = CFSTR("contactRelations");
  v22[25] = CFSTR("dates");
  v13 = *MEMORY[0x1E0DDC9C0];
  v21[26] = *MEMORY[0x1E0DDC9C8];
  v21[27] = v13;
  v22[26] = CFSTR("preferredLikenessSource");
  v22[27] = CFSTR("preferredApplePersonaIdentifier");
  v14 = *MEMORY[0x1E0DDC980];
  v21[28] = *MEMORY[0x1E0DDC918];
  v21[29] = v14;
  v22[28] = CFSTR("downtimeWhitelist");
  v22[29] = CFSTR("note");
  v15 = *MEMORY[0x1E0DDC928];
  v21[30] = *MEMORY[0x1E0DDC930];
  v21[31] = v15;
  v22[30] = CFSTR("imageType");
  v22[31] = CFSTR("imageHash");
  v16 = *MEMORY[0x1E0DDCA00];
  v21[32] = *MEMORY[0x1E0DDC958];
  v21[33] = v16;
  v22[32] = CFSTR("memojiMetadata");
  v22[33] = CFSTR("wallpaper");
  v17 = *MEMORY[0x1E0DDC9E8];
  v21[34] = *MEMORY[0x1E0DDCA08];
  v21[35] = v17;
  v22[34] = CFSTR("watchWallpaperImageData");
  v22[35] = CFSTR("sharedPhotoDisplayPreference");
  v21[36] = *MEMORY[0x1E0DDC920];
  v22[36] = CFSTR("imageBackgroundColorsData");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 37);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "copy");
  v20 = (void *)contactKeyForVCardKey__cn_once_object_0;
  contactKeyForVCardKey__cn_once_object_0 = v19;

}

+ (id)contactValueTransformForVCardKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (contactValueTransformForVCardKey__cn_once_token_1 != -1)
    dispatch_once(&contactValueTransformForVCardKey__cn_once_token_1, &__block_literal_global_1);
  objc_msgSend((id)contactValueTransformForVCardKey__cn_once_object_1, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = _Block_copy((const void *)*MEMORY[0x1E0D137E0]);
  v5 = _Block_copy(v4);

  return v5;
}

void __70__CNContactVCardParsedResultBuilder_contactValueTransformForVCardKey___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[7];
  _QWORD v10[8];

  v10[7] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0DDC9F0];
  v9[0] = *MEMORY[0x1E0DDC9B8];
  v9[1] = v0;
  v10[0] = &__block_literal_global_4_1;
  v10[1] = &__block_literal_global_7;
  v10[2] = &__block_literal_global_9;
  v1 = *MEMORY[0x1E0DDC998];
  v9[2] = *MEMORY[0x1E0DDC938];
  v9[3] = v1;
  +[CN phoneNumberFromStringTransform](CN, "phoneNumberFromStringTransform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v2;
  v9[4] = *MEMORY[0x1E0DDC9E0];
  +[CN relatedContactFromStringTransform](CN, "relatedContactFromStringTransform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v3;
  v9[5] = *MEMORY[0x1E0DDC8E8];
  +[CN addressingGrammarFromStringTransform](CN, "addressingGrammarFromStringTransform");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v4;
  v9[6] = *MEMORY[0x1E0DDCA00];
  +[CN wallpaperFromDataTransform](CN, "wallpaperFromDataTransform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[6] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copy");
  v8 = (void *)contactValueTransformForVCardKey__cn_once_object_1;
  contactValueTransformForVCardKey__cn_once_object_1 = v7;

}

- (CNContactVCardParsedResultBuilder)init
{
  CNContactVCardParsedResultBuilder *v2;
  CNMutableContact *v3;
  CNMutableContact *contact;
  CNContactVCardParsedResultBuilder *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNContactVCardParsedResultBuilder;
  v2 = -[CNContactVCardParsedResultBuilder init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CNMutableContact);
    contact = v2->_contact;
    v2->_contact = v3;

    v2->_empty = 1;
    v5 = v2;
  }

  return v2;
}

+ (id)os_log
{
  if (os_log_cn_once_token_2_0 != -1)
    dispatch_once(&os_log_cn_once_token_2_0, &__block_literal_global_11);
  return (id)os_log_cn_once_object_2_0;
}

void __43__CNContactVCardParsedResultBuilder_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.vcard", "parser");
  v1 = (void *)os_log_cn_once_object_2_0;
  os_log_cn_once_object_2_0 = (uint64_t)v0;

}

- (id)build
{
  if (self->_empty)
    return 0;
  else
    return (id)-[CNMutableContact copy](self->_contact, "copy");
}

- (id)valueForProperty:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqual:", *MEMORY[0x1E0DDC8E0]))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CNContactVCardParsedResultBuilder personFlags](self, "personFlags"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)canSetValueForProperty:(id)a3
{
  return 1;
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  NSObject *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "contactKeyForVCardKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (_QWORD *)MEMORY[0x1E0DDC8E0];
  if (v8 || (objc_msgSend(v7, "isEqual:", *MEMORY[0x1E0DDC8E0]) & 1) != 0)
  {
    if (v6)
      self->_empty = 0;
    if (objc_msgSend(v7, "isEqual:", *v9))
    {
      -[CNContactVCardParsedResultBuilder setPersonFlags:](self, "setPersonFlags:", objc_msgSend(v6, "integerValue"));
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "contactValueTransformForVCardKey:", v7);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10)
      {
        (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);
        v12 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v12;
      }
      -[CNMutableContact setValue:forKey:](self->_contact, "setValue:forKey:", v6, v8);

    }
    v13 = 1;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412546;
      v17 = v7;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_18F8BD000, v15, OS_LOG_TYPE_DEFAULT, "Not sure how to handle '%@': %@", (uint8_t *)&v16, 0x16u);
    }

    v13 = 0;
  }

  return v13;
}

- (BOOL)setValues:(id)a3 labels:(id)a4 isPrimaries:(id)a5 forProperty:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend((id)objc_opt_class(), "contactKeyForVCardKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (objc_msgSend(v10, "count"))
      self->_empty = 0;
    objc_msgSend((id)objc_opt_class(), "contactValueTransformForVCardKey:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "labeledValuesWithValues:transform:labels:isPrimaries:", v10, v15, v11, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableContact setValue:forKey:](self->_contact, "setValue:forKey:", v16, v14);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412546;
      v20 = v13;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_18F8BD000, v17, OS_LOG_TYPE_DEFAULT, "Not sure how to handle '%@': %@", (uint8_t *)&v19, 0x16u);
    }

  }
  return v14 != 0;
}

+ (id)labeledValuesWithValues:(id)a3 transform:(id)a4 labels:(id)a5 isPrimaries:(id)a6
{
  id v9;
  void (**v10)(id, NSObject *);
  void *v11;
  void *v12;
  __int128 v13;
  unint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  CNLabeledValue *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  __int128 v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, NSObject *))a4;
  v26 = a5;
  v25 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v14 = 0;
    *(_QWORD *)&v13 = 138412290;
    v24 = v13;
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v14, v24);
      v15 = objc_claimAutoreleasedReturnValue();
      if (v10
        && (v10[2](v10, v15),
            v16 = objc_claimAutoreleasedReturnValue(),
            v15,
            (v15 = v16) == 0))
      {
        objc_msgSend((id)objc_opt_class(), "os_log");
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          goto LABEL_11;
        objc_msgSend(v9, "objectAtIndexedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v24;
        v28 = v17;
        _os_log_debug_impl(&dword_18F8BD000, v15, OS_LOG_TYPE_DEBUG, "Got nil when transforming from vcard value:%@", buf, 0xCu);
      }
      else
      {
        objc_msgSend(v26, "objectAtIndexedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[CNLabeledValue initWithLabel:value:]([CNLabeledValue alloc], "initWithLabel:value:", v17, v15);
        objc_msgSend(v25, "objectAtIndexedSubscript:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "BOOLValue");

        if (v20)
          v21 = v11;
        else
          v21 = v12;
        objc_msgSend(v21, "addObject:", v18);

      }
LABEL_11:

      ++v14;
    }
    while (v14 < objc_msgSend(v9, "count"));
  }
  v22 = (void *)objc_msgSend(v11, "mutableCopy");
  objc_msgSend(v22, "addObjectsFromArray:", v12);

  return v22;
}

- (BOOL)setImageData:(id)a3 forReference:(id)a4 clipRects:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && objc_msgSend(v8, "length"))
  {
    self->_empty = 0;
    -[CNMutableContact setImageData:](self->_contact, "setImageData:", v8);
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kABImageInfoClipRectKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "rectValue");
      -[CNMutableContact setCropRect:](self->_contact, "setCropRect:");
    }

  }
  return 1;
}

- (id)validCountryCodes
{
  return 0;
}

- (int64_t)contactTypeFromPersonFlags:(int64_t)a3
{
  return (a3 & 7) == 1;
}

- (unint64_t)personFlagsByAddingContactType:(int64_t)a3 toFlags:(unint64_t)a4
{
  return a4 & 0xFFFFFFFFFFFFFFF8 | (a3 == 1);
}

- (int64_t)sharedPhotoDisplayPreferenceFromPersonFlags:(int64_t)a3
{
  if ((unint64_t)(a3 >> 6) - 1 >= 3)
    return 0;
  else
    return a3 >> 6;
}

- (unint64_t)personFlagsByAddingSharedPhotoDisplayPreference:(int64_t)a3 toFlags:(unint64_t)a4
{
  int64_t v4;

  if ((unint64_t)(a3 - 1) >= 3)
    v4 = 0;
  else
    v4 = ((a3 - 1) << 6) + 64;
  return v4 | a4 & 0xFFFFFFFFFFFFFF3FLL;
}

- (BOOL)setPersonFlags:(int64_t)a3
{
  -[CNMutableContact setContactType:](self->_contact, "setContactType:", -[CNContactVCardParsedResultBuilder contactTypeFromPersonFlags:](self, "contactTypeFromPersonFlags:"));
  -[CNMutableContact setSharedPhotoDisplayPreference:](self->_contact, "setSharedPhotoDisplayPreference:", -[CNContactVCardParsedResultBuilder sharedPhotoDisplayPreferenceFromPersonFlags:](self, "sharedPhotoDisplayPreferenceFromPersonFlags:", a3));
  return 1;
}

- (int64_t)personFlags
{
  return -[CNContactVCardParsedResultBuilder personFlagsByAddingSharedPhotoDisplayPreference:toFlags:](self, "personFlagsByAddingSharedPhotoDisplayPreference:toFlags:", -[CNMutableContact sharedPhotoDisplayPreference](self->_contact, "sharedPhotoDisplayPreference"), -[CNContactVCardParsedResultBuilder personFlagsByAddingContactType:toFlags:](self, "personFlagsByAddingContactType:toFlags:", -[CNMutableContact contactType](self->_contact, "contactType"), 0));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
