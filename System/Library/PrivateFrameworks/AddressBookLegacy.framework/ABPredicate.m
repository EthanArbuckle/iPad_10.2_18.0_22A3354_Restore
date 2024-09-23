@implementation ABPredicate

+ (id)personPredicateWithNameLike:(id)a3 addressBook:(void *)a4
{
  void *v6;

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setAddressBook:", a4);
  objc_msgSend(v6, "setName:", a3);
  if ((objc_msgSend(v6, "isValid") & 1) == 0)
  {

    v6 = 0;
  }
  return v6;
}

+ (id)personPredicateWithNameLike:(id)a3 group:(void *)a4 source:(void *)a5 account:(id)a6 addressBook:(void *)a7
{
  return (id)objc_msgSend(a1, "personPredicateWithNameLike:group:source:account:includeSourceInResults:addressBook:", a3, a4, a5, a6, 0, a7);
}

+ (id)personPredicateWithNameLike:(id)a3 group:(void *)a4 source:(void *)a5 account:(id)a6 includeSourceInResults:(BOOL)a7 addressBook:(void *)a8
{
  _BOOL8 v9;
  uint64_t v14;
  id v15;

  v9 = a7;
  if (a4)
  {
    v14 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a4);
    if (a5)
      goto LABEL_3;
LABEL_6:
    v15 = 0;
    if (!a6)
      return (id)objc_msgSend(a1, "personPredicateWithNameLike:groups:sources:includeSourceInResults:addressBook:", a3, v14, v15, v9, a8);
    goto LABEL_7;
  }
  v14 = 0;
  if (!a5)
    goto LABEL_6;
LABEL_3:
  v15 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a5);
  if (!a6)
    return (id)objc_msgSend(a1, "personPredicateWithNameLike:groups:sources:includeSourceInResults:addressBook:", a3, v14, v15, v9, a8);
LABEL_7:
  if (!v14 && !v15)
    v15 = (id)ABAddressBookCopyArrayOfAllSourcesWithAccountIdentifier((uint64_t)a8, (uint64_t)a6);
  return (id)objc_msgSend(a1, "personPredicateWithNameLike:groups:sources:includeSourceInResults:addressBook:", a3, v14, v15, v9, a8);
}

+ (id)personPredicateWithNameLike:(id)a3 groups:(id)a4 sources:(id)a5 addressBook:(void *)a6
{
  return (id)objc_msgSend(a1, "personPredicateWithNameLike:groups:sources:includeSourceInResults:addressBook:", a3, a4, a5, 0, a6);
}

+ (id)personPredicateWithNameLike:(id)a3 groups:(id)a4 sources:(id)a5 includeSourceInResults:(BOOL)a6 addressBook:(void *)a7
{
  return (id)objc_msgSend(a1, "personPredicateWithNameLike:groups:sources:includeSourceInResults:includePhotosInResults:addressBook:", a3, a4, a5, a6, 1, a7);
}

+ (id)personPredicateWithNameLike:(id)a3 groups:(id)a4 sources:(id)a5 includeSourceInResults:(BOOL)a6 includePhotosInResults:(BOOL)a7 addressBook:(void *)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  ABRecordRef v15;
  const void *v16;
  const void *AccountForSource;
  CFTypeRef v18;
  const void *v19;
  ABServerSearchPredicate *v20;

  v9 = a7;
  v10 = a6;
  if (objc_msgSend(a5, "count"))
  {
    v15 = (id)objc_msgSend(a5, "objectAtIndex:", 0);
  }
  else
  {
    if (!objc_msgSend(a4, "count"))
    {
      v16 = 0;
      goto LABEL_6;
    }
    v15 = ABGroupCopySource((ABRecordRef)objc_msgSend(a4, "objectAtIndex:", 0));
  }
  v16 = v15;
LABEL_6:
  if (!ABSourceIsRemote((uint64_t)v16)
    || (AccountForSource = (const void *)ABAddressBookGetAccountForSource((uint64_t)a8, (uint64_t)v16)) == 0
    || (v18 = ABAccountCopyIdentifier(AccountForSource)) == 0)
  {
    v20 = 0;
    if (!v16)
      goto LABEL_13;
    goto LABEL_12;
  }
  v19 = v18;
  v20 = -[ABServerSearchPredicate initWithSearchString:source:account:includeSourceInResults:includePhotosInResults:]([ABServerSearchPredicate alloc], "initWithSearchString:source:account:includeSourceInResults:includePhotosInResults:", a3, v16, v18, v10, v9);
  CFRelease(v19);
  if (v16)
LABEL_12:
    CFRelease(v16);
LABEL_13:
  if (!v20)
  {
    v20 = (ABServerSearchPredicate *)objc_msgSend(a1, "personPredicateWithNameLike:addressBook:", a3, a8);
    -[ABServerSearchPredicate setSources:](v20, "setSources:", a5);
    -[ABServerSearchPredicate setGroups:](v20, "setGroups:", a4);
  }
  return v20;
}

+ (id)personPredicateWithName:(id)a3 addressBook:(void *)a4
{
  void *v4;

  v4 = (void *)objc_msgSend(a1, "personPredicateWithNameLike:addressBook:", a3, a4);
  objc_msgSend(v4, "setMatchWholeWords:", 1);
  return v4;
}

+ (id)personPredicateWithNameOnly:(id)a3 account:(id)a4 addressBook:(void *)a5
{
  void *v6;

  v6 = (void *)objc_msgSend(a1, "personPredicateWithNameLike:addressBook:", a3, a5);
  objc_msgSend(v6, "setMatchWholeWords:", 1);
  objc_msgSend(v6, "setMatchPersonOrCompanyNamesExclusively:", 1);
  objc_msgSend(v6, "setMatchPreferredName:", 0);
  if (a4)
  {
    objc_msgSend(v6, "setAccountIdentifier:", a4);
    if (!objc_msgSend((id)objc_msgSend(v6, "sources"), "count"))
      return 0;
  }
  return v6;
}

+ (id)personPredicateWithSmartDialerStringLike:(id)a3 addressBook:(void *)a4
{
  void *v4;

  v4 = (void *)objc_msgSend(a1, "personPredicateWithNameLike:addressBook:", a3, a4);
  objc_msgSend(v4, "setMatchSmartDialerFormatsExclusively:", 1);
  return v4;
}

+ (id)personPredicateWithValue:(id)a3 comparison:(int64_t)a4 forProperty:(int)a5
{
  uint64_t v5;
  void *v8;

  v5 = *(_QWORD *)&a5;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setValue:", a3);
  objc_msgSend(v8, "setProperty:", v5);
  objc_msgSend(v8, "setComparison:", a4);
  if ((objc_msgSend(v8, "isValid") & 1) == 0)
  {

    v8 = 0;
  }
  return v8;
}

+ (id)personPredicateWithAnyValueForProperty:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setProperty:", v3);
  if ((objc_msgSend(v4, "isValid") & 1) == 0)
  {

    v4 = 0;
  }
  return v4;
}

+ (id)personPredicateWithPhoneLike:(id)a3 countryHint:(id)a4 addressBook:(void *)a5
{
  void *v7;

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setCountry:", a4);
  objc_msgSend(v7, "setPhoneNumber:", a3);
  if ((objc_msgSend(v7, "isValid") & 1) == 0)
  {

    v7 = 0;
  }
  return v7;
}

+ (id)personPredicateWithGroup:(void *)a3 source:(void *)a4 account:(id)a5
{
  void *v8;

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setGroup:", a3);
  objc_msgSend(v8, "setStore:", a4);
  objc_msgSend(v8, "setAccountIdentifier:", a5);
  if ((objc_msgSend(v8, "isValid") & 1) == 0)
  {

    v8 = 0;
  }
  return v8;
}

+ (id)newQueryWithProperties:(id)a3 joins:(id)a4 whereString:(id)a5 sortOrder:(unsigned int)a6 rankString:(id)a7 groupByProperties:(id)a8 addressBook:(void *)a9 propertyIndices:(const __CFDictionary *)a10
{
  void *ColumnListWithAliasAndExtraColumns;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint64_t v23;
  unint64_t j;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  const __CFString *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  ColumnListWithAliasAndExtraColumns = (void *)CPRecordStoreCreateColumnListWithAliasAndExtraColumns();
  v17 = ColumnListWithAliasAndExtraColumns;
  if (a3)
    objc_msgSend(ColumnListWithAliasAndExtraColumns, "appendString:", a3);
  objc_msgSend(v17, "appendString:", CFSTR(" FROM ABPerson abp "));
  if (a4)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v18 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v34 != v20)
            objc_enumerationMutation(a4);
          objc_msgSend(v17, "appendString:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
          objc_msgSend(v17, "appendString:", CFSTR(" "));
        }
        v19 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v19);
    }
  }
  if (a5)
  {
    objc_msgSend(v17, "appendString:", CFSTR("WHERE "));
    objc_msgSend(v17, "appendString:", a5);
  }
  v22 = objc_msgSend(a8, "count");
  if (v22 >= 1)
  {
    v23 = v22;
    objc_msgSend(v17, "appendString:", CFSTR(" GROUP BY ("));
    for (j = 0; j != v23; ++j)
    {
      v25 = objc_msgSend(a8, "objectAtIndex:", j);
      if (j >= 2)
        objc_msgSend(v17, "appendString:", CFSTR(", "));
      objc_msgSend(v17, "appendString:", v25);
    }
    objc_msgSend(v17, "appendString:", CFSTR(")"));
  }
  if (a6 != -1)
  {
    if (a6)
      v26 = CFSTR(" ORDER BY LastSortLanguageIndex, LastSortSection, LastSort");
    else
      v26 = CFSTR(" ORDER BY FirstSortLanguageIndex, FirstSortSection, FirstSort");
    objc_msgSend(v17, "appendString:", v26);
  }
  if (objc_msgSend(a7, "length"))
  {
    v27 = objc_msgSend(v17, "rangeOfString:options:", CFSTR("ORDER BY"), 5);
    if (v27 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v29 = objc_msgSend(v17, "length");
      v30 = CFSTR(" ORDER BY ");
      v31 = &stru_1E3CA4E68;
    }
    else
    {
      v29 = v27 + v28;
      v30 = CFSTR(" ");
      v31 = CFSTR(", ");
    }
    objc_msgSend(v17, "insertString:atIndex:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@ DESC %@"), v30, a7, v31), v29);
  }
  return v17;
}

+ (id)newQueryFromABPredicate:(id)a3 withSortOrder:(unsigned int)a4 ranked:(BOOL)a5 addressBook:(void *)a6 propertyIndices:(const __CFDictionary *)a7
{
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v9 = a5;
  v10 = *(_QWORD *)&a4;
  v13 = objc_msgSend(a3, "_querySelectStringForPredicateIdentifier:", 0);
  v14 = objc_msgSend(a3, "queryJoinsInCompound:predicateIdentifier:", 0, 0);
  v15 = objc_msgSend(a3, "queryWhereStringForPredicateIdentifier:", 0);
  if (v9)
    v16 = objc_msgSend(a3, "queryRankStringForPredicateIdentifier:", 0);
  else
    v16 = 0;
  return (id)objc_msgSend(a1, "newQueryWithProperties:joins:whereString:sortOrder:rankString:groupByProperties:addressBook:propertyIndices:", v13, v14, v15, v10, v16, objc_msgSend(a3, "queryGroupByProperties"), a6, a7);
}

+ (id)newQueryFromCompoundPredicate:(id)a3 withSortOrder:(unsigned int)a4 ranked:(BOOL)a5 addressBook:(void *)a6 propertyIndices:(const __CFDictionary *)a7
{
  void *ColumnListWithAliasAndExtraColumns;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t n;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t ii;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t jj;
  uint64_t v51;
  const __CFString *v52;
  const __CFString *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const __CFString *v57;
  const __CFString *v58;
  _BOOL4 v60;
  _BOOL4 v61;
  const __CFString *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id obj;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v61 = a5;
  v105 = *MEMORY[0x1E0C80C00];
  ColumnListWithAliasAndExtraColumns = (void *)CPRecordStoreCreateColumnListWithAliasAndExtraColumns();
  v9 = objc_msgSend(a3, "compoundPredicateType");
  v10 = CFSTR(" OR ");
  v11 = CFSTR(" AND ");
  if (v9 != 1)
    v11 = 0;
  v12 = v9 == 2 || v9 == 1;
  if (v9 != 2)
    v10 = v11;
  v63 = v10;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  obj = (id)objc_msgSend(a3, "subpredicates");
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v104, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v95;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v95 != v16)
          objc_enumerationMutation(obj);
        v18 = objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * i), "_querySelectStringForPredicateIdentifier:", v15 + i);
        if (v18)
          objc_msgSend(ColumnListWithAliasAndExtraColumns, "appendString:", v18);
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v104, 16);
      v15 = (v15 + i);
    }
    while (v14);
  }
  v60 = v12;
  objc_msgSend(ColumnListWithAliasAndExtraColumns, "appendString:", CFSTR(" FROM ABPerson abp "));
  v19 = (void *)objc_opt_new();
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v103, 16);
  if (v67)
  {
    v20 = 0;
    v65 = *(_QWORD *)v91;
    do
    {
      for (j = 0; j != v67; ++j)
      {
        if (*(_QWORD *)v91 != v65)
          objc_enumerationMutation(obj);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * j), "queryJoinsInCompound:predicateIdentifier:", 1, v20);
        v86 = 0u;
        v87 = 0u;
        v88 = 0u;
        v89 = 0u;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v86, v102, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v87;
          do
          {
            for (k = 0; k != v24; ++k)
            {
              if (*(_QWORD *)v87 != v25)
                objc_enumerationMutation(v22);
              v27 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * k);
              if ((objc_msgSend(v19, "containsObject:", v27) & 1) == 0)
              {
                objc_msgSend(ColumnListWithAliasAndExtraColumns, "appendString:", v27);
                objc_msgSend(ColumnListWithAliasAndExtraColumns, "appendString:", CFSTR(" "));
                objc_msgSend(v19, "addObject:", v27);
              }
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v86, v102, 16);
          }
          while (v24);
        }
        v20 = (v20 + 1);
      }
      v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v103, 16);
    }
    while (v67);
  }

  objc_msgSend(ColumnListWithAliasAndExtraColumns, "appendString:", CFSTR("WHERE "));
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v101, 16);
  if (v28)
  {
    v29 = v28;
    v30 = 0;
    v31 = 0;
    v32 = *(_QWORD *)v83;
    do
    {
      for (m = 0; m != v29; ++m)
      {
        if (*(_QWORD *)v83 != v32)
          objc_enumerationMutation(obj);
        v34 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * m), "queryWhereStringForPredicateIdentifier:", v31 + m);
        if ((v60 & v30) == 1)
          objc_msgSend(ColumnListWithAliasAndExtraColumns, "appendString:", v63);
        if (objc_msgSend(v34, "length"))
        {
          objc_msgSend(ColumnListWithAliasAndExtraColumns, "appendString:", CFSTR("("));
          objc_msgSend(ColumnListWithAliasAndExtraColumns, "appendString:", v34);
          objc_msgSend(ColumnListWithAliasAndExtraColumns, "appendString:", CFSTR(")"));
          v30 = 1;
        }
      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v101, 16);
      v31 = (v31 + m);
    }
    while (v29);
  }
  if (v61)
  {
    v35 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v100, 16);
    v64 = v35;
    if (v36)
    {
      v37 = v36;
      v38 = 0;
      v39 = 0;
      v40 = *(_QWORD *)v79;
      do
      {
        for (n = 0; n != v37; ++n)
        {
          if (*(_QWORD *)v79 != v40)
            objc_enumerationMutation(obj);
          v42 = objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * n), "queryRankStringForPredicateIdentifier:", v39 + n);
          if (v42)
          {
            v43 = v42;
            if ((v38 & 1) != 0)
              objc_msgSend(v35, "appendString:", CFSTR(" + "));
            objc_msgSend(v35, "appendString:", v43);
          }
          v38 |= ColumnListWithAliasAndExtraColumns != 0;
        }
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v100, 16);
        v39 = (v39 + n);
      }
      while (v37);
    }
  }
  else
  {
    v64 = 0;
  }
  v44 = (void *)objc_opt_new();
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v99, 16);
  if (v68)
  {
    v66 = *(_QWORD *)v75;
    do
    {
      for (ii = 0; ii != v68; ++ii)
      {
        if (*(_QWORD *)v75 != v66)
          objc_enumerationMutation(obj);
        v46 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * ii), "queryGroupByProperties");
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v70, v98, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v71;
          do
          {
            for (jj = 0; jj != v48; ++jj)
            {
              if (*(_QWORD *)v71 != v49)
                objc_enumerationMutation(v46);
              v51 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * jj);
              if ((objc_msgSend(v44, "containsObject:", v51) & 1) == 0)
              {
                if (objc_msgSend(v44, "count"))
                  v52 = CFSTR(", ");
                else
                  v52 = CFSTR(" GROUP BY ");
                objc_msgSend(ColumnListWithAliasAndExtraColumns, "appendString:", v52);
                objc_msgSend(ColumnListWithAliasAndExtraColumns, "appendString:", v51);
                objc_msgSend(v44, "addObject:", v51);
              }
            }
            v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v70, v98, 16);
          }
          while (v48);
        }
      }
      v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v99, 16);
    }
    while (v68);
  }

  if (a4 != -1)
  {
    if (a4)
      v53 = CFSTR(" ORDER BY LastSortLanguageIndex, LastSortSection, LastSort");
    else
      v53 = CFSTR(" ORDER BY FirstSortLanguageIndex, FirstSortSection, FirstSort");
    objc_msgSend(ColumnListWithAliasAndExtraColumns, "appendString:", v53);
  }
  if (objc_msgSend(v64, "length"))
  {
    v54 = objc_msgSend(ColumnListWithAliasAndExtraColumns, "rangeOfString:options:", CFSTR("ORDER BY"), 5);
    if (v54 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v56 = objc_msgSend(ColumnListWithAliasAndExtraColumns, "length");
      v57 = CFSTR(" ORDER BY ");
      v58 = &stru_1E3CA4E68;
    }
    else
    {
      v56 = v54 + v55;
      v57 = CFSTR(" ");
      v58 = CFSTR(", ");
    }
    objc_msgSend(ColumnListWithAliasAndExtraColumns, "insertString:atIndex:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v57, v64, v58), v56);
  }
  return ColumnListWithAliasAndExtraColumns;
}

+ (void)searchPeopleWithPredicate:(id)a3 sortOrder:(unsigned int)a4 inAddressBook:(void *)a5 withDelegate:(id)a6
{
  objc_msgSend(a1, "searchPeopleWithPredicate:sortOrder:ranked:inAddressBook:withDelegate:", a3, *(_QWORD *)&a4, 0, a5, a6);
}

+ (void)searchPeopleWithPredicate:(id)a3 sortOrder:(unsigned int)a4 ranked:(BOOL)a5 inAddressBook:(void *)a6 withDelegate:(id)a7
{
  _BOOL8 v9;
  uint64_t v10;

  v9 = a5;
  v10 = *(_QWORD *)&a4;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ABPredicate.m"), 490, CFSTR("Only address book specific predicates and compound predicates are supported"));
    }
  }
  objc_msgSend(a3, "ab_runPredicateWithSortOrder:ranked:inAddressBook:withDelegate:", v10, v9, a6, a7);
}

- (ABPredicate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ABPredicate;
  return -[ABPredicate init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ABPredicate;
  -[ABPredicate dealloc](&v2, sel_dealloc);
}

- (id)predicateFormat
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ABPredicate (%@) %p"), objc_opt_class(), self);
}

- (BOOL)isValid
{
  return 0;
}

- (id)querySelectPropertiesForPredicateIdentifier:(int)a3
{
  return 0;
}

- (id)_querySelectStringForPredicateIdentifier:(int)a3
{
  id v3;
  id result;

  v3 = -[ABPredicate querySelectPropertiesForPredicateIdentifier:](self, "querySelectPropertiesForPredicateIdentifier:", *(_QWORD *)&a3);
  result = (id)objc_msgSend(v3, "count");
  if (result)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", %@"), objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")));
  return result;
}

- (id)queryJoinsInCompound:(BOOL)a3 predicateIdentifier:(int)a4
{
  return 0;
}

- (id)queryGroupByProperties
{
  return 0;
}

- (id)queryWhereStringForPredicateIdentifier:(int)a3
{
  return 0;
}

- (id)queryRankStringForPredicateIdentifier:(int)a3
{
  return 0;
}

- (BOOL)hasCallback
{
  return 0;
}

- (id)callbackContext
{
  return 0;
}

- (void)bindString:(id)a3 toStatement:(CPSqliteStatement *)a4 withBindingOffset:(int *)a5
{
  const char *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7 = (const char *)_CPCreateUTF8StringFromCFString();
  v8 = sqlite3_bind_text(a4->var1, *a5, v7, -1, (void (__cdecl *)(void *))MEMORY[0x1E0C834A8]);
  ++*a5;
  if (v8)
  {
    ABDiagnosticsEnabled();
    _ABLog2(3, (uint64_t)"-[ABPredicate bindString:toStatement:withBindingOffset:]", 581, 0, (uint64_t)CFSTR("Binding error at index %d"), v9, v10, v11, *a5);
  }
}

- (void)bindDouble:(double)a3 toStatement:(CPSqliteStatement *)a4 withBindingOffset:(int *)a5
{
  sqlite3_bind_double(a4->var1, *a5, a3);
  ++*a5;
}

- (id)querySerializationIdentifier
{
  return 0;
}

- (void)ab_addCallbackContextToArray:(id)a3
{
  id v5;

  v5 = -[ABPredicate callbackContext](self, "callbackContext");
  if (!v5)
    v5 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self));
  objc_msgSend(a3, "addObject:", v5);
}

- (id)ab_newQueryWithSortOrder:(unsigned int)a3 ranked:(BOOL)a4 addressBook:(void *)a5 propertyIndices:(const __CFDictionary *)a6
{
  return +[ABPredicate newQueryFromABPredicate:withSortOrder:ranked:addressBook:propertyIndices:](ABPredicate, "newQueryFromABPredicate:withSortOrder:ranked:addressBook:propertyIndices:", self, *(_QWORD *)&a3, a4, a5, a6);
}

@end
