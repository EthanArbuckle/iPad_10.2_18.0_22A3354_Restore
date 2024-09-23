@implementation CNPostalAddressFormatter

uint64_t __55__CNPostalAddressFormatter_fieldArrangementWithString___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "postalAddressPropertyKeyForFormatPropertyKey:", a2);
}

id __97__CNPostalAddressFormatter_attributedStringFromPostalAddress_name_organization_attributes_order___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("postalAddressProperty"));
  objc_msgSend(*(id *)(a1 + 48), "localizedPlaceholderForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("postalAddressLocalizedPropertyName"));
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v5 == v8))
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v6);
  }
  v10 = (void *)v9;

  return v10;
}

void __46__CNPostalAddressFormatter__postalToFormatMap__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[10];
  _QWORD v4[11];

  v4[10] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Street");
  v3[1] = CFSTR("SubLocality");
  v4[0] = CFSTR("street");
  v4[1] = CFSTR("subLocality");
  v3[2] = CFSTR("City");
  v3[3] = CFSTR("State");
  v4[2] = CFSTR("city");
  v4[3] = CFSTR("state");
  v3[4] = CFSTR("SubAdministrativeArea");
  v3[5] = CFSTR("Region");
  v4[4] = CFSTR("subAdministrativeArea");
  v4[5] = CFSTR("subAdministrativeArea");
  v3[6] = CFSTR("ZIP");
  v3[7] = CFSTR("Country");
  v4[6] = CFSTR("postalCode");
  v4[7] = CFSTR("country");
  v3[8] = CFSTR("CountryCode");
  v3[9] = CFSTR("FormattedAddress");
  v4[8] = CFSTR("ISOCountryCode");
  v4[9] = CFSTR("formattedAddress");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 10);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)_postalToFormatMap_cn_once_object_1;
  _postalToFormatMap_cn_once_object_1 = v1;

}

id __51__CNPostalAddressFormatter_fieldLabelMapWithPlist___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForPostalAddressString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)localizedStringForPostalAddressString:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D13B08], "localizedStringForPostalAddressString:returningNilIfNotFound:", a3, 1);
}

+ (id)postalAddressPropertyKeyForFormatPropertyKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[CNPostalAddressFormatter _postalToFormatMap]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_postalToFormatMap
{
  objc_opt_self();
  if (_postalToFormatMap_cn_once_token_1 != -1)
    dispatch_once(&_postalToFormatMap_cn_once_token_1, &__block_literal_global_23_0);
  return (id)_postalToFormatMap_cn_once_object_1;
}

void __51__CNPostalAddressFormatter_fieldLabelMapWithPlist___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Street");
  v3[1] = CFSTR("SubLocality");
  v3[2] = CFSTR("City");
  v3[3] = CFSTR("SubAdministrativeArea");
  v3[4] = CFSTR("State");
  v3[5] = CFSTR("ZIP");
  v3[6] = CFSTR("Country");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 7);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)fieldLabelMapWithPlist__cn_once_object_2;
  fieldLabelMapWithPlist__cn_once_object_2 = v1;

}

+ (NSString)stringFromPostalAddress:(CNPostalAddress *)postalAddress style:(CNPostalAddressFormatterStyle)style
{
  CNPostalAddress *v5;
  CNPostalAddressFormatter *v6;
  void *v7;

  v5 = postalAddress;
  v6 = objc_alloc_init(CNPostalAddressFormatter);
  -[CNPostalAddressFormatter setStyle:](v6, "setStyle:", style);
  -[CNPostalAddressFormatter stringFromPostalAddress:](v6, "stringFromPostalAddress:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)stringFromPostalAddress:(CNPostalAddress *)postalAddress
{
  void *v3;
  void *v4;

  -[CNPostalAddressFormatter attributedStringFromPostalAddress:name:organization:attributes:order:]((uint64_t)self, postalAddress, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setStyle:(CNPostalAddressFormatterStyle)style
{
  self->_style = style;
}

- (id)attributedStringFromPostalAddress:(uint64_t)a1 name:(void *)a2 organization:(void *)a3 attributes:(void *)a4 order:(void *)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  char v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  _BYTE v57[128];
  _QWORD v58[3];

  v58[1] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    objc_msgSend(v9, "formattedAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(v9, "formattedAddress");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithString:attributes:", v15, 0);

    }
    else
    {
      +[CNPostalAddressFormatter getCountryCodeFromPostalAddress:]((uint64_t)CNPostalAddressFormatter, v9);
      v17 = objc_claimAutoreleasedReturnValue();
      +[CNAddressFormats addressFormats](CNAddressFormats, "addressFormats");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKey:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = v19;
      if (v10
        && (objc_msgSend(v19, "objectForKey:", CFSTR("LABEL_FORMAT")), (v20 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v21 = (void *)v20;
        v42 = 1;
      }
      else
      {
        objc_msgSend(v19, "objectForKey:", CFSTR("FORMAT"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0;
      }
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", &stru_1E29FF900, v12);
      v48 = (void *)v17;
      objc_msgSend((id)objc_opt_class(), "specificationForCountry:", v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v21;
      +[CNPostalAddressFormatter fieldArrangementWithString:]((uint64_t)CNPostalAddressFormatter, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __97__CNPostalAddressFormatter_attributedStringFromPostalAddress_name_organization_attributes_order___block_invoke;
      v53[3] = &unk_1E29FBD28;
      v54 = v9;
      v55 = v12;
      v44 = v22;
      v45 = v23;
      v56 = v44;
      objc_msgSend(v23, "_cn_map:", v53);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_cn_filter:", &__block_literal_global_88);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("\n"), 0);
      v58[0] = v43;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_cn_join:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      objc_msgSend(v27, "_cn_flatten");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v50 != v31)
              objc_enumerationMutation(v28);
            objc_msgSend(v16, "appendAttributedString:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        }
        while (v30);
      }

      if (objc_msgSend(v11, "length"))
        v33 = v42;
      else
        v33 = 1;
      if ((v33 & 1) == 0)
      {
        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("\n"), 0);
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("organizationName"), CFSTR("postalAddressProperty"), 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v11, v35);
        objc_msgSend(v36, "appendAttributedString:", v34);
        objc_msgSend(v16, "insertAttributedString:atIndex:", v36, 0);

      }
      if (objc_msgSend(v10, "length"))
        v37 = v42;
      else
        v37 = 1;
      if ((v37 & 1) == 0)
      {
        v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("\n"), 0);
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Name"), CFSTR("postalAddressProperty"), 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v10, v39);
        objc_msgSend(v40, "appendAttributedString:", v38);
        objc_msgSend(v16, "insertAttributedString:atIndex:", v40, 0);

      }
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

id __97__CNPostalAddressFormatter_attributedStringFromPostalAddress_name_organization_attributes_order___block_invoke(id *a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __97__CNPostalAddressFormatter_attributedStringFromPostalAddress_name_organization_attributes_order___block_invoke_2;
  v9[3] = &unk_1E29FBD00;
  v10 = a1[4];
  v11 = a1[5];
  v12 = a1[6];
  objc_msgSend(a2, "_cn_map:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_filter:", *MEMORY[0x1E0D13830]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR(" "), a1[5]);
  objc_msgSend(v5, "_cn_join:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)specificationForCountry:(id)a3
{
  void *v4;
  void *v5;

  +[CNAddressFormats addressFormatForCountryCode:](CNAddressFormats, "addressFormatForCountryCode:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "specificationWithAddressFormatPlist:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)specificationWithAddressFormatPlist:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CNPostalAddressFormattingSpecification *v10;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FORMAT"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNPostalAddressFormatter fieldArrangementWithString:]((uint64_t)a1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EDIT_FORMAT"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNPostalAddressFormatter fieldArrangementWithString:]((uint64_t)a1, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[CNPostalAddressFormatter fieldLabelMapWithPlist:]((uint64_t)a1, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[CNPostalAddressFormattingSpecification initWithDisplayFieldArrangement:editingFieldArrangement:fieldLabelMap:]([CNPostalAddressFormattingSpecification alloc], "initWithDisplayFieldArrangement:editingFieldArrangement:fieldLabelMap:", v6, v8, v9);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (id)fieldArrangementWithString:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v2 = a2;
  v3 = objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__CNPostalAddressFormatter_fieldArrangementWithString___block_invoke;
  v8[3] = &__block_descriptor_40_e27___NSArray_16__0__NSString_8l;
  v8[4] = v3;
  objc_msgSend(v5, "_cn_map:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __55__CNPostalAddressFormatter_fieldArrangementWithString___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a2;
  objc_msgSend(v3, "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__CNPostalAddressFormatter_fieldArrangementWithString___block_invoke_2;
  v10[3] = &__block_descriptor_40_e28___NSString_16__0__NSString_8l;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "_cn_map:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_cn_filter:", *MEMORY[0x1E0D13830]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)getCountryCodeFromPostalAddress:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "ISOCountryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == (void *)*MEMORY[0x1E0C9B0D0])
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "lowercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0
    || (+[CNAddressFormats addressFormats](CNAddressFormats, "addressFormats"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "objectForKey:", v4),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    +[CNContactsUserDefaults sharedDefaults](CNContactsUserDefaults, "sharedDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "countryCode");
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  return v4;
}

+ (id)fieldLabelMapWithPlist:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  uint64_t v16;

  v2 = a2;
  v3 = objc_opt_self();
  if (fieldLabelMapWithPlist__cn_once_token_2 != -1)
    dispatch_once(&fieldLabelMapWithPlist__cn_once_token_2, &__block_literal_global_38_0);
  v4 = (id)fieldLabelMapWithPlist__cn_once_object_2;
  objc_msgSend(v4, "_cn_map:", &__block_literal_global_42_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __51__CNPostalAddressFormatter_fieldLabelMapWithPlist___block_invoke_2;
  v14 = &unk_1E29FBDB0;
  v15 = v2;
  v16 = v3;
  v6 = v2;
  objc_msgSend(v4, "_cn_map:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v7, v5, v11, v12, v13, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_cn_filter:", &__block_literal_global_41_1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

BOOL __51__CNPostalAddressFormatter_fieldLabelMapWithPlist___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _BOOL8 v9;

  v4 = a2;
  v5 = (void *)MEMORY[0x1E0C99E38];
  v6 = a3;
  objc_msgSend(v5, "null");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v8 != v4;

  }
  return v9;
}

uint64_t __97__CNPostalAddressFormatter_attributedStringFromPostalAddress_name_organization_attributes_order___block_invoke_3()
{
  return (*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))() ^ 1;
}

+ (NSAttributedString)attributedStringFromPostalAddress:(CNPostalAddress *)postalAddress style:(CNPostalAddressFormatterStyle)style withDefaultAttributes:(NSDictionary *)attributes
{
  NSDictionary *v7;
  CNPostalAddress *v8;
  CNPostalAddressFormatter *v9;
  void *v10;

  v7 = attributes;
  v8 = postalAddress;
  v9 = objc_alloc_init(CNPostalAddressFormatter);
  -[CNPostalAddressFormatter setStyle:](v9, "setStyle:", style);
  -[CNPostalAddressFormatter attributedStringFromPostalAddress:withDefaultAttributes:](v9, "attributedStringFromPostalAddress:withDefaultAttributes:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v10;
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNPostalAddressFormatter stringFromPostalAddress:](self, "stringFromPostalAddress:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNPostalAddressFormatter attributedStringFromPostalAddress:name:organization:attributes:order:]((uint64_t)self, v6, 0, 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSAttributedString)attributedStringFromPostalAddress:(CNPostalAddress *)postalAddress withDefaultAttributes:(NSDictionary *)attributes
{
  return (NSAttributedString *)-[CNPostalAddressFormatter attributedStringFromPostalAddress:name:organization:attributes:order:]((uint64_t)self, postalAddress, 0, 0, attributes);
}

- (id)attributedStringFromPostalAddress:(id)a3 name:(id)a4 organization:(id)a5 attributes:(id)a6
{
  return -[CNPostalAddressFormatter attributedStringFromPostalAddress:name:organization:attributes:order:]((uint64_t)self, a3, a4, a5, a6);
}

+ (id)formatPropertyKeyForPostalAddressPropertyKey:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__CNPostalAddressFormatter_formatPropertyKeyForPostalAddressPropertyKey___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v3 = formatPropertyKeyForPostalAddressPropertyKey__cn_once_token_0;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&formatPropertyKeyForPostalAddressPropertyKey__cn_once_token_0, block);
  objc_msgSend((id)formatPropertyKeyForPostalAddressPropertyKey__cn_once_object_0, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __73__CNPostalAddressFormatter_formatPropertyKeyForPostalAddressPropertyKey___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v0 = (void *)MEMORY[0x1E0C99D80];
  +[CNPostalAddressFormatter _postalToFormatMap]();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPostalAddressFormatter _postalToFormatMap]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dictionaryWithObjects:forKeys:", v1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "copy");
  v6 = (void *)formatPropertyKeyForPostalAddressPropertyKey__cn_once_object_0;
  formatPropertyKeyForPostalAddressPropertyKey__cn_once_object_0 = v5;

}

+ (id)addressValueForFormatKey:(void *)a3 postalAddress:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Street")))
  {
    objc_msgSend(v5, "street");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("SubLocality")))
  {
    objc_msgSend(v5, "subLocality");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("City")))
  {
    objc_msgSend(v5, "city");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("State")))
  {
    objc_msgSend(v5, "state");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("SubAdministrativeArea"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("Region")))
  {
    objc_msgSend(v5, "subAdministrativeArea");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("ZIP")))
  {
    objc_msgSend(v5, "postalCode");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Country")))
  {
    objc_msgSend(v5, "country");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("CountryCode")))
  {
    objc_msgSend(v5, "ISOCountryCode");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("FormattedAddress")))
    {
      v7 = 0;
      goto LABEL_13;
    }
    objc_msgSend(v5, "formattedAddress");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
LABEL_13:

  return v7;
}

- (id)postalAddressFromString:(id)a3
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

  objc_msgSend(MEMORY[0x1E0D13B18], "postalAddressFromString:error:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D138D8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setStreet:", v5);

    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D138E8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSubLocality:", v6);

    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D138B0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCity:", v7);

    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D138E0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSubAdministrativeArea:", v8);

    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D138D0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setState:", v9);

    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D138C8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPostalCode:", v10);

    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D138B8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCountry:", v11);

    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D138C0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setISOCountryCode:", v12);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)singleLineStringFromPostalAddress:(id)a3 addCountryName:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  id v6;
  __objc2_class **v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __objc2_class **v19;
  _BOOL8 v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;

  v4 = a4;
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v7 = off_1E29F2000;
  +[CNPostalAddressFormatter getCountryCodeFromPostalAddress:]((uint64_t)CNPostalAddressFormatter, v5);
  v8 = objc_claimAutoreleasedReturnValue();
  +[CNAddressFormats addressFormats](CNAddressFormats, "addressFormats");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)v8;
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v10;
  objc_msgSend(v10, "objectForKey:", CFSTR("URL_FORMAT"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "componentsSeparatedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *MEMORY[0x1E0D13848];
    v27 = *MEMORY[0x1E0C997B0];
    v28 = v12;
    v29 = v11;
    do
    {
      objc_msgSend(v11, "objectAtIndex:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNPostalAddressFormatter addressValueForFormatKey:postalAddress:]((uint64_t)v7[34], v16, v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("Country"))
        && v4
        && (*(unsigned int (**)(uint64_t, void *))(v15 + 16))(v15, v17))
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "displayNameForKey:value:", v27, v30);
        v19 = v7;
        v20 = v4;
        v21 = v6;
        v22 = v5;
        v23 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v23;
        v5 = v22;
        v6 = v21;
        v4 = v20;
        v7 = v19;
        v13 = v28;
        v11 = v29;
      }
      if (((*(uint64_t (**)(uint64_t, void *))(v15 + 16))(v15, v17) & 1) == 0)
      {
        if (objc_msgSend(v6, "length"))
          objc_msgSend(v6, "appendString:", CFSTR(" "));
        objc_msgSend(v6, "appendString:", v17);
      }

      ++v14;
    }
    while (v13 != v14);
  }
  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), CFSTR(" "), 2, 0, objc_msgSend(v6, "length"));

  return v6;
}

+ (id)localizedCountryNameForISOCountryCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  +[CNAddressFormats addressFormatForCountryCode:](CNAddressFormats, "addressFormatForCountryCode:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("COUNTRY"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedStringForPostalAddressString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
    v8 = v4;
  else
    v8 = v7;
  v9 = v8;

  return v9;
}

+ (NSArray)supportedCountries
{
  return (NSArray *)+[CNAddressFormats supportedCountries](CNAddressFormats, "supportedCountries");
}

- (CNPostalAddressFormatterStyle)style
{
  return self->_style;
}

@end
