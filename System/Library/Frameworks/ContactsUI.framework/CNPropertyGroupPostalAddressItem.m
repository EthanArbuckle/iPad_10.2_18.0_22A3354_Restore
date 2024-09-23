@implementation CNPropertyGroupPostalAddressItem

- (id)displayStringForValue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C973B0];
  -[CNPropertyGroupPostalAddressItem address](self, "address", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromPostalAddress:style:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "length"))
  {
    -[CNPropertyGroupPostalAddressItem address](self, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(" "));
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v6;
  objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v29;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v19);
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringByTrimmingCharactersInSet:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "length");

        if (v23)
        {
          v24 = &stru_1E20507A8;
          if ((v17 & 1) != 0)
            v24 = CFSTR("\n");
          objc_msgSend(v13, "appendFormat:", CFSTR("%@%@"), v24, v20);
          v17 = 1;
        }
        ++v19;
      }
      while (v16 != v19);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v16);
  }

  v25 = (void *)objc_msgSend(v13, "copy");
  return v25;
}

- (CNPostalAddress)address
{
  void *v2;
  void *v3;

  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNPostalAddress *)v3;
}

+ (id)emptyValueForLabel:(id)a3
{
  return objc_alloc_init(MEMORY[0x1E0C973A8]);
}

- (id)normalizedValue
{
  void *v2;
  void *v3;

  -[CNPropertyGroupItem displayValue](self, "displayValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\r\n"), CFSTR("\n"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\r"), CFSTR("\n"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)defaultActionURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)MEMORY[0x1E0C973B0];
  -[CNPropertyGroupPostalAddressItem address](self, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "singleLineStringFromPostalAddress:addCountryName:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = -[CNPropertyGroupItem anyContactLegacyIdentifier](self, "anyContactLegacyIdentifier");
  v10 = -[CNPropertyGroupItem labeledValueMultiValueIdentifierForChosenSourceContact](self, "labeledValueMultiValueIdentifierForChosenSourceContact");
  -[CNPropertyGroupItem contact](self, "contact");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("maps:?address=%@&abPersonID=%d&abAddressID=%d&cncontactidentifier=%@&cnaddressidentifier=%@"), v7, v9, v10, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)isEquivalentToItem:(id)a3 whenEditing:(BOOL)a4
{
  void *v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  BOOL v46;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;

  v6 = a3;
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "labeledValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "labeledValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "label");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CNPropertyGroupPostalAddressItem _isMinimalAddress:](self, "_isMinimalAddress:", v8)
    || -[CNPropertyGroupPostalAddressItem _isMinimalAddress:](self, "_isMinimalAddress:", v10))
  {
    objc_msgSend(v8, "subLocality");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subLocality");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "caseInsensitiveCompare:", v16);
    if (v17)
    {
      objc_msgSend(v8, "subLocality");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        objc_msgSend(v10, "subLocality");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {

          v19 = 0;
LABEL_78:

LABEL_79:
          goto LABEL_80;
        }
      }
    }
    objc_msgSend(v8, "city");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "city");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v20, "caseInsensitiveCompare:");
    v74 = v17;
    if (v73)
    {
      objc_msgSend(v8, "city");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v72 = (void *)v21;
        objc_msgSend(v10, "city");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {

          v19 = 0;
          if (!v17)
            goto LABEL_79;
          goto LABEL_78;
        }
        v70 = v20;
        v23 = v16;
        v24 = v14;
        v25 = v12;
      }
      else
      {
        v70 = v20;
        v23 = v16;
        v24 = v14;
        v25 = v12;
        v72 = 0;
      }
    }
    else
    {
      v70 = v20;
      v23 = v16;
      v24 = v14;
      v25 = v12;
    }
    objc_msgSend(v8, "postalCode");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postalCode");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v26;
    v69 = objc_msgSend(v26, "caseInsensitiveCompare:", v27);
    if (v69)
    {
      objc_msgSend(v8, "postalCode");
      v28 = objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v68 = (void *)v28;
        objc_msgSend(v10, "postalCode");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {

          v19 = 0;
          v12 = v25;
          v14 = v24;
          v16 = v23;
          v30 = v74;
          goto LABEL_75;
        }
        v67 = v27;
      }
      else
      {
        v67 = v27;
        v68 = 0;
      }
    }
    else
    {
      v67 = v27;
    }
    v12 = v25;
    v14 = v24;
    v16 = v23;
    v30 = v74;
    objc_msgSend(v8, "subAdministrativeArea");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subAdministrativeArea");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v31, "caseInsensitiveCompare:");
    if (v65)
    {
      objc_msgSend(v8, "subAdministrativeArea");
      v32 = objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        v61 = (void *)v32;
        objc_msgSend(v10, "subAdministrativeArea");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
        {

          v19 = 0;
LABEL_72:
          if (v69)

LABEL_75:
          if (v73)

          if (!v30)
            goto LABEL_79;
          goto LABEL_78;
        }
        v62 = v31;
      }
      else
      {
        v61 = 0;
        v62 = v31;
      }
    }
    else
    {
      v62 = v31;
    }
    objc_msgSend(v8, "state");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "state");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v34;
    v60 = objc_msgSend(v34, "caseInsensitiveCompare:");
    if (v60)
    {
      objc_msgSend(v8, "state");
      v35 = objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        v59 = (void *)v35;
        objc_msgSend(v10, "state");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {

          v19 = 0;
LABEL_69:
          if (v65)

          goto LABEL_72;
        }
      }
      else
      {
        v59 = 0;
      }
    }
    objc_msgSend(v8, "country");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "country");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v37;
    v38 = objc_msgSend(v37, "caseInsensitiveCompare:");
    if (v38)
    {
      objc_msgSend(v8, "country");
      v39 = objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        v56 = (void *)v39;
        objc_msgSend(v10, "country");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40)
        {

          v19 = 0;
LABEL_66:
          if (v60)

          goto LABEL_69;
        }
        v53 = v4;
        v54 = v12;
        v41 = v14;
      }
      else
      {
        v53 = v4;
        v54 = v12;
        v41 = v14;
        v56 = 0;
      }
    }
    else
    {
      v53 = v4;
      v54 = v12;
      v41 = v14;
    }
    objc_msgSend(v8, "ISOCountryCode");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ISOCountryCode");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v42, "caseInsensitiveCompare:", v43);
    v55 = v38;
    if (v44)
    {
      objc_msgSend(v8, "ISOCountryCode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v10, "ISOCountryCode");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (v45)
        {

          v19 = 0;
          v12 = v54;
          v14 = v41;
LABEL_63:
          v4 = v53;
          v30 = v74;
          if (v55)

          goto LABEL_66;
        }
      }
      v49 = v42;
      v51 = v16;
      v52 = v15;
    }
    else
    {
      v49 = v42;
      v51 = v16;
      v52 = v15;
    }
    v12 = v54;
    if (objc_msgSend(v54, "caseInsensitiveCompare:", v41, v49))
      v46 = v54 == 0;
    else
      v46 = 1;
    v19 = v46 || v41 == 0;
    if (v44)

    v14 = v41;
    v16 = v51;
    v15 = v52;
    goto LABEL_63;
  }
  v19 = 0;
LABEL_80:

  return v19;
}

- (BOOL)_isMinimalAddress:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "street");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (id)bestValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "labeledValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = __46__CNPropertyGroupPostalAddressItem_bestValue___block_invoke(v6);
  if ((int)v7 >= (int)__46__CNPropertyGroupPostalAddressItem_bestValue___block_invoke(v8))
    v9 = v6;
  else
    v9 = v8;
  v10 = v9;

  return v10;
}

uint64_t __46__CNPropertyGroupPostalAddressItem_bestValue___block_invoke(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
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
  unsigned int v18;
  void *v19;
  uint64_t v20;

  v1 = a1;
  objc_msgSend(v1, "street");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  objc_msgSend(v1, "subLocality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v3)
    v6 = 2;
  else
    v6 = 1;
  if (v5)
    v7 = v6;
  else
    v7 = v3 != 0;
  objc_msgSend(v1, "city");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
    ++v7;
  objc_msgSend(v1, "subAdministrativeArea");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
    ++v7;
  objc_msgSend(v1, "state");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
    ++v7;
  objc_msgSend(v1, "postalCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
    ++v7;
  objc_msgSend(v1, "country");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (v17)
    v18 = v7 + 1;
  else
    v18 = v7;
  objc_msgSend(v1, "ISOCountryCode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "length");
  if (v20)
    return v18 + 1;
  else
    return v18;
}

@end
