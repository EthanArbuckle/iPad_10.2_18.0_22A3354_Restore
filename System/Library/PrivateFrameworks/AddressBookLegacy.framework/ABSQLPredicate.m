@implementation ABSQLPredicate

- (BOOL)isNullPredicate
{
  return self->_isNullPredicate;
}

- (id)matchInfoProvider
{
  return self->_matchInfoProvider;
}

+ (id)_sqlValuesTableOfLength:(unint64_t)a3 columnCount:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;

  if (!a3)
    return CFSTR("SELECT 1 WHERE 1 = 0");
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("VALUES "));
  v8 = objc_msgSend(a1, "_sqlListOfLength:", a4);
  v9 = 0;
  do
  {
    if (v9)
      objc_msgSend(v7, "appendString:", CFSTR(", "));
    objc_msgSend(v7, "appendString:", v8);
    ++v9;
  }
  while (a3 != v9);
  return v7;
}

- (id)bindBlock
{
  return self->_bindBlock;
}

- (NSString)query
{
  return self->_query;
}

+ (id)_sqlListOfLength:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  const __CFString *v6;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("("));
  if (a3)
  {
    v5 = 0;
    do
    {
      if (v5)
        v6 = CFSTR(",?");
      else
        v6 = CFSTR("?");
      objc_msgSend(v4, "appendString:", v6);
      ++v5;
    }
    while (a3 != v5);
  }
  objc_msgSend(v4, "appendString:", CFSTR(")"));
  return v4;
}

uint64_t __131__ABSQLPredicate_predicateForContactsMatchingMultivalueProperty_values_groupIdentifiers_containerIdentifiers_limitToOneResult_map___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];

  v4 = MEMORY[0x1E0C809B0];
  v5 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __131__ABSQLPredicate_predicateForContactsMatchingMultivalueProperty_values_groupIdentifiers_containerIdentifiers_limitToOneResult_map___block_invoke_2;
  v13[3] = &unk_1E3CA43C8;
  v13[4] = a2;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v13);
  if (*(_QWORD *)(a1 + 40))
  {
    v6 = objc_msgSend(a2, "blobBinder");
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 16))(v6, *(_QWORD *)(a1 + 40), 8);
  }
  v7 = objc_msgSend(a2, "intBinder");
  (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, *(unsigned int *)(a1 + 64));
  v8 = *(void **)(a1 + 48);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __131__ABSQLPredicate_predicateForContactsMatchingMultivalueProperty_values_groupIdentifiers_containerIdentifiers_limitToOneResult_map___block_invoke_3;
  v12[3] = &unk_1E3CA43C8;
  v12[4] = a2;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);
  v9 = *(void **)(a1 + 56);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __131__ABSQLPredicate_predicateForContactsMatchingMultivalueProperty_values_groupIdentifiers_containerIdentifiers_limitToOneResult_map___block_invoke_4;
  v11[3] = &unk_1E3CA43C8;
  v11[4] = a2;
  return objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);
}

uint64_t __127__ABSQLPredicate_predicateForContactsMatchingPhoneNumber_country_homeCountryCode_prefixHint_groupIdentifiers_limitToOneResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];

  v4 = objc_msgSend(a2, "pointerBinder");
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, objc_msgSend(*(id *)(a1 + 32), "decomposedPhoneNumberPointer"));
  v5 = objc_msgSend(a2, "stringBinder");
  (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, *(_QWORD *)(a1 + 40));
  v6 = objc_msgSend(a2, "blobBinder");
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 16))(v6, *(_QWORD *)(a1 + 48), 8);
  v7 = objc_msgSend(a2, "stringBinder");
  (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, *(_QWORD *)(a1 + 56));
  v8 = *(void **)(a1 + 64);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __127__ABSQLPredicate_predicateForContactsMatchingPhoneNumber_country_homeCountryCode_prefixHint_groupIdentifiers_limitToOneResult___block_invoke_2;
  v10[3] = &unk_1E3CA43C8;
  v10[4] = a2;
  return objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);
}

void *__99__ABSQLPredicate_predicateForContactsMatchingPhoneNumbers_emailAddresses_containerIdentifiers_map___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *result;
  uint64_t v7;

  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5 = objc_msgSend(v4, "bindBlock");
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  }
  result = *(void **)(a1 + 40);
  if (result)
  {
    v7 = objc_msgSend(result, "bindBlock");
    return (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);
  }
  return result;
}

uint64_t __56__ABSQLPredicate_predicateForContactsInRange_sortOrder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend(a2, "intBinder");
  (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(unsigned int *)(a1 + 40));
  v5 = objc_msgSend(a2, "intBinder");
  return (*(uint64_t (**)(uint64_t, _QWORD))(v5 + 16))(v5, *(unsigned int *)(a1 + 32));
}

uint64_t __59__ABSQLPredicate_predicateForContactsWithLegacyIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "intBinder");
  return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(unsigned int *)(a1 + 32));
}

uint64_t __84__ABSQLPredicate_predicateForContactsMatchingPhoneNumbers_containerIdentifiers_map___block_invoke(_QWORD *a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[5];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void *)a1[4];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __84__ABSQLPredicate_predicateForContactsMatchingPhoneNumbers_containerIdentifiers_map___block_invoke_2;
  v18[3] = &unk_1E3CA4418;
  v18[4] = a2;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v18);
  if (a1[5])
  {
    v5 = objc_msgSend(a2, "blobBinder");
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 16))(v5, a1[5], 8);
  }
  v6 = objc_msgSend(a2, "blobBinder");
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 16))(v6, a1[6], 8);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = (void *)a1[7];
  result = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (result)
  {
    v9 = result;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
        v13 = objc_msgSend(a2, "stringBinder");
        (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, v12);
        ++v11;
      }
      while (v9 != v11);
      result = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      v9 = result;
    }
    while (result);
  }
  return result;
}

+ (id)predicateForContactsWithLegacyIdentifier:(int)a3
{
  void *v4;
  _QWORD v6[4];
  int v7;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setQuery:", CFSTR("SELECT rowid FROM ABPerson WHERE rowid = ?"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__ABSQLPredicate_predicateForContactsWithLegacyIdentifier___block_invoke;
  v6[3] = &__block_descriptor_36_e19_v16__0__ABBinders_8l;
  v7 = a3;
  objc_msgSend(v4, "setBindBlock:", v6);
  return v4;
}

+ (id)predicateForMeContact
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setQuery:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT MeIdentifier from ABStore where ROWID = (SELECT value from _SqliteDatabaseProperties where key = '%@')"), CFSTR("MeSourceID")));
  return v2;
}

+ (id)predicateForContactsInRange:(_NSRange)a3 sortOrder:(int)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  const __CFString *v8;
  _QWORD v10[6];

  length = a3.length;
  location = a3.location;
  v7 = (void *)objc_opt_new();
  v8 = CFSTR(" ORDER BY LastSortLanguageIndex, LastSortSection, LastSort");
  if (!a4)
    v8 = CFSTR(" ORDER BY FirstSortLanguageIndex, FirstSortSection, FirstSort");
  objc_msgSend(v7, "setQuery:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT abp.rowid FROM ABPerson abp WHERE abp.IsPreferredName = 1 %@ LIMIT ? OFFSET ?"), v8));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__ABSQLPredicate_predicateForContactsInRange_sortOrder___block_invoke;
  v10[3] = &__block_descriptor_48_e19_v16__0__ABBinders_8l;
  v10[4] = location;
  v10[5] = length;
  objc_msgSend(v7, "setBindBlock:", v10);
  return v7;
}

+ (id)predicateForContactsMatchingPhoneNumbers:(id)a3 emailAddresses:(id)a4 containerIdentifiers:(id)a5 map:(id)a6
{
  id result;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[5];
  _QWORD v20[6];

  if (objc_msgSend(a3, "count") || (result = (id)objc_msgSend(a4, "count")) != 0)
  {
    v12 = (void *)objc_opt_new();
    if (objc_msgSend(a3, "count"))
    {
      v13 = (void *)objc_msgSend(a1, "predicateForContactsMatchingPhoneNumbers:containerIdentifiers:map:", a3, a5, a6);
      if (!objc_msgSend(a4, "count"))
      {
        v14 = 0;
LABEL_10:
        if (v13)
        {
          v16 = objc_msgSend(v13, "query");
          goto LABEL_12;
        }
LABEL_13:
        v17 = objc_msgSend(v14, "query");
        v13 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      v13 = 0;
      v14 = 0;
      if (!objc_msgSend(a4, "count"))
        goto LABEL_13;
    }
    v15 = (void *)objc_msgSend(a1, "predicateForContactsMatchingMultivalueProperty:values:groupIdentifiers:containerIdentifiers:limitToOneResult:map:", kABPersonEmailProperty, a4, 0, a5, 0, a6);
    v14 = v15;
    if (v13 && v15)
    {
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT * FROM (%@) UNION SELECT * FROM  (%@)"), objc_msgSend(v13, "query"), objc_msgSend(v15, "query"));
LABEL_12:
      v17 = v16;
LABEL_14:
      objc_msgSend(v12, "setQuery:", v17);
      v18 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __99__ABSQLPredicate_predicateForContactsMatchingPhoneNumbers_emailAddresses_containerIdentifiers_map___block_invoke;
      v20[3] = &unk_1E3CA4490;
      v20[4] = v13;
      v20[5] = v14;
      objc_msgSend(v12, "setBindBlock:", v20);
      v19[0] = v18;
      v19[1] = 3221225472;
      v19[2] = __99__ABSQLPredicate_predicateForContactsMatchingPhoneNumbers_emailAddresses_containerIdentifiers_map___block_invoke_2;
      v19[3] = &unk_1E3CA44B8;
      v19[4] = a6;
      objc_msgSend(v12, "setMatchInfoProvider:", v19);
      return v12;
    }
    goto LABEL_10;
  }
  return result;
}

- (void)setMatchInfoProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

+ (id)predicateForContactsMatchingPhoneNumbers:(id)a3 containerIdentifiers:(id)a4 map:(id)a5
{
  id result;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  ABPhoneNumber *v17;
  ABPhoneNumber *v18;
  void *v19;
  const __CFString *v20;
  id v21;
  const __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  void *cf;
  id v26;
  _QWORD v27[8];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  result = (id)objc_msgSend(a3, "count");
  if (result)
  {
    v26 = a5;
    cf = (void *)CPPhoneNumberCopyHomeCountryCode();
    v10 = objc_msgSend(cf, "lowercaseString");
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a3, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(a3);
          v16 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          v17 = -[ABPhoneNumber initWithPhoneNumberString:countryCode:]([ABPhoneNumber alloc], "initWithPhoneNumberString:countryCode:", v16, v10);
          if (v17)
          {
            v18 = v17;
            objc_msgSend(v11, "setObject:forKey:", v17, v16);

          }
        }
        v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v13);
    }
    v19 = (void *)objc_opt_new();
    if (v26)
      v20 = CFSTR("ab_collect_value_row_map(?, ABQuery.term, abmv.record_id)");
    else
      v20 = CFSTR("abmv.record_id");
    if (a4)
    {
      v21 = a1;
      v22 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AND store.guid in %@"), objc_msgSend(a1, "_sqlListOfLength:", objc_msgSend(a4, "count")));
      v23 = CFSTR("JOIN ABPerson person ON person.ROWID = abmv.record_id JOIN ABStore store ON store.ROWID = person.storeID");
    }
    else
    {
      v22 = &stru_1E3CA4E68;
      v23 = &stru_1E3CA4E68;
      v21 = a1;
    }
    v24 = objc_msgSend(v21, "_sqlValuesTableOfLength:columnCount:", objc_msgSend(v11, "count"), 3);
    objc_msgSend(v19, "setQuery:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WITH ABQuery(term, termlastfour, termdecomposed) AS(%@) SELECT %@ FROM ABPhoneLastFour four JOIN ABQuery on ABQuery.termlastfour = four.value JOIN ABMultiValue abmv on abmv.rowid = four.multivalue_id %@ where ab_compare_phone_numbers(ABQuery.termdecomposed, null, abmv.value, ?) %@"), v24, v20, v23, v22));
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __84__ABSQLPredicate_predicateForContactsMatchingPhoneNumbers_containerIdentifiers_map___block_invoke;
    v27[3] = &unk_1E3CA4440;
    v27[4] = v11;
    v27[5] = v26;
    v27[6] = v10;
    v27[7] = a4;
    objc_msgSend(v19, "setBindBlock:", v27);
    if (cf)
      CFRelease(cf);
    return v19;
  }
  return result;
}

+ (id)predicateForContactsWithUUIDs:(id)a3 ignoreUnifiedIdentifiers:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  _QWORD v12[5];
  BOOL v13;

  v4 = a4;
  v7 = (void *)objc_opt_new();
  v8 = objc_msgSend(a1, "bindPlaceholderStringOfCount:", objc_msgSend(a3, "count"));
  if (v4)
    v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT rowid FROM ABPerson WHERE guid IN(%@)"), v8, v11);
  else
    v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT rowid FROM(SELECT abp.ROWID FROM ABPerson abp LEFT JOIN ABPersonLink abpl ON abpl.rowid = abp.personlink WHERE abpl.guid IN(%@) UNION SELECT abp.ROWID FROM ABPerson abp  WHERE abp.guid IN(%@))"), v8, v8);
  objc_msgSend(v7, "setQuery:", v9);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__ABSQLPredicate_predicateForContactsWithUUIDs_ignoreUnifiedIdentifiers___block_invoke;
  v12[3] = &unk_1E3CA42C0;
  v12[4] = a3;
  v13 = v4;
  objc_msgSend(v7, "setBindBlock:", v12);
  return v7;
}

+ (id)predicateForContactsMatchingPhoneNumber:(id)a3 country:(id)a4 homeCountryCode:(id)a5 prefixHint:(id)a6 groupIdentifiers:(id)a7 limitToOneResult:(BOOL)a8
{
  _BOOL4 v8;
  id result;
  id v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  unint64_t v20;
  const __CFString *v21;
  ABPhoneNumber *v22;
  const void *v23;
  _QWORD v24[9];

  if (!a3)
    return 0;
  v8 = a8;
  result = (id)_PNCopyLastFourDigitsOfLocalNumber();
  if (result)
  {
    v16 = result;
    result = (id)objc_msgSend(result, "length");
    if (result)
    {
      v17 = (void *)objc_opt_new();
      v18 = &stru_1E3CA4E68;
      if (v8)
        v19 = CFSTR("LIMIT 1");
      else
        v19 = &stru_1E3CA4E68;
      v20 = 0x1E0CB3000uLL;
      if (a7)
      {
        v18 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AND groups.guid in %@"), objc_msgSend(a1, "_sqlListOfLength:", objc_msgSend(a7, "count")));
        v20 = 0x1E0CB3000;
        v21 = CFSTR("JOIN ABGroupMembers members ON members.member_id = abmv.record_id AND member_type = 0 JOIN ABGroup groups on groups.rowid = members.group_id");
      }
      else
      {
        v21 = &stru_1E3CA4E68;
      }
      objc_msgSend(v17, "setQuery:", objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("WITH PhoneRanked (personrow, phonescore) as (SELECT abmv.record_id, ab_compare_phone_numbers( ?, ?, abmv.value, ?) FROM ABMultivalue abmv %@ WHERE abmv.UID IN (SELECT multivalue_id FROM ABPhoneLastFour WHERE value = ?) %@) SELECT personrow FROM PhoneRanked WHERE phonescore %@ %@"), v21, v18, CFSTR("= MAX(1, (SELECT max(phonescore) FROM PhoneRanked))"), v19));
      v22 = -[ABPhoneNumber initWithPhoneNumberString:countryCode:]([ABPhoneNumber alloc], "initWithPhoneNumberString:countryCode:", a3, objc_msgSend(a4, "lowercaseString"));
      if (!a5)
      {
        v23 = (const void *)CPPhoneNumberCopyHomeCountryCode();
        a5 = (id)CFAutorelease(v23);
      }
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __127__ABSQLPredicate_predicateForContactsMatchingPhoneNumber_country_homeCountryCode_prefixHint_groupIdentifiers_limitToOneResult___block_invoke;
      v24[3] = &unk_1E3CA43F0;
      v24[4] = v22;
      v24[5] = a6;
      v24[6] = a5;
      v24[7] = v16;
      v24[8] = a7;
      objc_msgSend(v17, "setBindBlock:", v24);

      return v17;
    }
  }
  return result;
}

+ (id)predicateForContactsMatchingMultivalueProperty:(int)a3 values:(id)a4 groupIdentifiers:(id)a5 containerIdentifiers:(id)a6 limitToOneResult:(BOOL)a7 map:(id)a8
{
  _BOOL4 v8;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  uint64_t v19;
  id v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  uint64_t v30;
  uint64_t v32;
  _QWORD v35[8];
  int v36;

  v8 = a7;
  v13 = (void *)objc_opt_new();
  v14 = objc_msgSend(a1, "_sqlValuesTableOfLength:columnCount:", objc_msgSend(a4, "count"), 1);
  v15 = 0x1E0CB3000uLL;
  if (a5)
  {
    v16 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AND groups.guid in %@"), objc_msgSend(a1, "_sqlListOfLength:", objc_msgSend(a5, "count")));
    v17 = CFSTR("JOIN ABGroupMembers members ON members.member_id = abmv.record_id AND member_type = 0 JOIN ABGroup groups on groups.rowid = members.group_id");
  }
  else
  {
    v17 = &stru_1E3CA4E68;
    v16 = &stru_1E3CA4E68;
  }
  v18 = &stru_1E3CA4E68;
  if (a6)
  {
    v19 = v14;
    v20 = a4;
    v21 = v8;
    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = v13;
    v24 = v16;
    v25 = v17;
    v32 = objc_msgSend(a1, "_sqlListOfLength:", objc_msgSend(a6, "count"));
    v26 = v22;
    v8 = v21;
    a4 = v20;
    v14 = v19;
    v15 = 0x1E0CB3000;
    v27 = (const __CFString *)objc_msgSend(v26, "stringWithFormat:", CFSTR("AND store.guid in %@"), v32);
    v18 = &stru_1E3CA4E68;
    v17 = v25;
    v16 = v24;
    v13 = v23;
    v28 = CFSTR("JOIN ABPerson person ON person.ROWID = abmv.record_id JOIN ABStore store ON store.ROWID = person.storeID");
  }
  else
  {
    v27 = &stru_1E3CA4E68;
    v28 = &stru_1E3CA4E68;
  }
  v29 = CFSTR("ab_collect_value_row_map(?, ABQuery.term, abmv.record_id)");
  if (v8)
    v18 = CFSTR("LIMIT 1");
  if (!a8)
    v29 = CFSTR("abmv.record_id");
  v30 = objc_msgSend(*(id *)(v15 + 2368), "stringWithFormat:", CFSTR("WITH ABQuery(term) AS(%@) SELECT %@ FROM ABMultivalue abmv JOIN ABQuery ON term = value collate nocase %@ %@ WHERE property = ? %@ %@ %@"), v14, v29, v17, v28, v16, v27, v18);
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __131__ABSQLPredicate_predicateForContactsMatchingMultivalueProperty_values_groupIdentifiers_containerIdentifiers_limitToOneResult_map___block_invoke;
  v35[3] = &unk_1E3CA4468;
  v35[4] = a4;
  v35[5] = a8;
  v36 = a3;
  v35[6] = a5;
  v35[7] = a6;
  objc_msgSend(v13, "setBindBlock:", v35);
  objc_msgSend(v13, "setQuery:", v30);
  return v13;
}

- (void)setQuery:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (void)setBindBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

+ (id)bindPlaceholderStringOfCount:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  const __CFString *v6;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  if (a3)
  {
    v5 = 0;
    do
    {
      if (v5)
        v6 = CFSTR(", ?");
      else
        v6 = CFSTR("?");
      objc_msgSend(v4, "appendString:", v6);
      ++v5;
    }
    while (a3 != v5);
  }
  return v4;
}

uint64_t __131__ABSQLPredicate_predicateForContactsMatchingMultivalueProperty_values_groupIdentifiers_containerIdentifiers_limitToOneResult_map___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = objc_msgSend(*(id *)(a1 + 32), "stringBinder");
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

uint64_t __73__ABSQLPredicate_predicateForContactsWithUUIDs_ignoreUnifiedIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = *(void **)(a1 + 32);
  result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v8);
        v10 = objc_msgSend(a2, "stringBinder");
        (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v9);
        ++v8;
      }
      while (v6 != v8);
      result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      v6 = result;
    }
    while (result);
  }
  if (!*(_BYTE *)(a1 + 40))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = *(void **)(a1 + 32);
    result = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (result)
    {
      v12 = result;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14);
          v16 = objc_msgSend(a2, "stringBinder");
          (*(void (**)(uint64_t, uint64_t))(v16 + 16))(v16, v15);
          ++v14;
        }
        while (v12 != v14);
        result = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        v12 = result;
      }
      while (result);
    }
  }
  return result;
}

uint64_t __84__ABSQLPredicate_predicateForContactsMatchingPhoneNumbers_containerIdentifiers_map___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = objc_msgSend(*(id *)(a1 + 32), "stringBinder");
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
  v7 = objc_msgSend(*(id *)(a1 + 32), "stringBinder");
  (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, objc_msgSend(a3, "lastFour"));
  v8 = objc_msgSend(*(id *)(a1 + 32), "pointerBinder");
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 16))(v8, objc_msgSend(a3, "decomposedPhoneNumberPointer"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ABSQLPredicate;
  -[ABSQLPredicate dealloc](&v3, sel_dealloc);
}

+ (id)predicateForAllContacts
{
  return (id)objc_opt_new();
}

+ (id)predicateForNoContacts
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setQuery:", CFSTR(" "));
  objc_msgSend(v2, "setIsNullPredicate:", 1);
  return v2;
}

+ (id)predicateForContactsMatchingName:(id)a3 addressBook:(void *)a4
{
  uint64_t SearchCollator;
  __CFStringTokenizer *WordTokenizer;
  id v8;
  CFArrayRef v9;
  __CFString *v10;
  id v11;
  _QWORD v13[5];
  __CFArray *v14;
  uint64_t v15;

  SearchCollator = ABAddressBookGetSearchCollator((uint64_t)a4);
  WordTokenizer = ABAddressBookGetWordTokenizer((uint64_t)a4);
  v8 = 0;
  v15 = 0;
  if (SearchCollator && WordTokenizer)
  {
    v9 = ABCCreateArrayOfTokenizationsBySeparatingWordsInCompositeName(WordTokenizer, (const __CFString *)a3, 1);
    if (-[__CFArray count](v9, "count")
      && (v14 = 0,
          v10 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("SELECT abp.ROWID FROM ABPersonSearchKey abs JOIN ABPerson abp ON abs.person_id = abp.ROWID WHERE ")), appendTokenizations(a3, v9, SearchCollator, v10, &v14, &v15, 0, 0), v15 >= 1))
    {
      v11 = (id)objc_opt_new();
      objc_msgSend(v11, "setTokenizationSortKeys:", v14);
      v8 = (id)objc_opt_new();
      objc_msgSend(v8, "setQuery:", v10);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __63__ABSQLPredicate_predicateForContactsMatchingName_addressBook___block_invoke;
      v13[3] = &unk_1E3CA4308;
      v13[4] = v11;
      objc_msgSend(v8, "setBindBlock:", v13);
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

uint64_t __63__ABSQLPredicate_predicateForContactsMatchingName_addressBook___block_invoke(uint64_t a1, void *a2)
{
  const __CFArray *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ValueAtIndex;
  const char **v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  size_t v13;

  v3 = (const __CFArray *)objc_msgSend(*(id *)(a1 + 32), "tokenizationSortKeys");
  result = CFArrayGetCount(v3);
  if (result >= 0)
    v5 = result;
  else
    v5 = result + 1;
  if (result >= 2)
  {
    v6 = 0;
    v7 = v5 >> 1;
    do
    {
      ValueAtIndex = (uint64_t)CFArrayGetValueAtIndex(v3, 2 * v6);
      result = (uint64_t)CFArrayGetValueAtIndex(v3, (2 * v6) | 1);
      if (ValueAtIndex >= 1)
      {
        v9 = (const char **)result;
        if (ValueAtIndex <= 1)
          v10 = 1;
        else
          v10 = ValueAtIndex;
        do
        {
          v11 = *v9++;
          v12 = objc_msgSend(a2, "blobBinder");
          v13 = strlen(v11);
          result = (*(uint64_t (**)(uint64_t, const char *, size_t))(v12 + 16))(v12, v11, v13);
          --v10;
        }
        while (v10);
      }
      ++v6;
    }
    while (v6 != v7);
  }
  return result;
}

+ (id)predicateForContactsInGroupWithIdentifier:(id)a3
{
  void *v4;
  _QWORD v6[5];

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setQuery:", CFSTR("SELECT abp.rowid from ABPerson abp JOIN ABGroupMembers abgm ON abgm.member_id = abp.ROWID AND abgm.member_type = 0 JOIN ABGroup abg ON abgm.group_id = abg.ROWID WHERE abg.guid = ?"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__ABSQLPredicate_predicateForContactsInGroupWithIdentifier___block_invoke;
  v6[3] = &unk_1E3CA4308;
  v6[4] = a3;
  objc_msgSend(v4, "setBindBlock:", v6);
  return v4;
}

uint64_t __60__ABSQLPredicate_predicateForContactsInGroupWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "stringBinder");
  return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
}

+ (id)predicateForContactsInContainerWithIdentifier:(id)a3
{
  void *v4;
  _QWORD v6[5];

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setQuery:", CFSTR("SELECT abp.rowid FROM ABPerson abp JOIN ABStore abs ON abp.storeid = abs.ROWID WHERE abs.guid = ?"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__ABSQLPredicate_predicateForContactsInContainerWithIdentifier___block_invoke;
  v6[3] = &unk_1E3CA4308;
  v6[4] = a3;
  objc_msgSend(v4, "setBindBlock:", v6);
  return v4;
}

uint64_t __64__ABSQLPredicate_predicateForContactsInContainerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "stringBinder");
  return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
}

+ (id)predicateForContactsMatchingMultivalueProperty:(int)a3 value:(id)a4
{
  void *v6;
  _QWORD v8[5];
  int v9;

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setQuery:", CFSTR("SELECT abp.rowid FROM ABPerson abp WHERE abp.rowid IN (SELECT record_id FROM ABMultiValue WHERE property = ? AND value LIKE ?)"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__ABSQLPredicate_predicateForContactsMatchingMultivalueProperty_value___block_invoke;
  v8[3] = &unk_1E3CA4330;
  v9 = a3;
  v8[4] = a4;
  objc_msgSend(v6, "setBindBlock:", v8);
  return v6;
}

uint64_t __71__ABSQLPredicate_predicateForContactsMatchingMultivalueProperty_value___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend(a2, "intBinder");
  (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(unsigned int *)(a1 + 40));
  v5 = objc_msgSend(a2, "stringBinder");
  return (*(uint64_t (**)(uint64_t, _QWORD))(v5 + 16))(v5, *(_QWORD *)(a1 + 32));
}

+ (id)predicateForSingleContactMatchingMultivalueProperty:(int)a3 value:(id)a4
{
  void *v6;
  _QWORD v8[5];
  int v9;

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setQuery:", CFSTR("SELECT abp.rowid FROM ABPerson abp WHERE abp.rowid IN (SELECT record_id FROM ABMultiValue WHERE property = ? AND value COLLATE NOCASE = ? LIMIT 1)"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__ABSQLPredicate_predicateForSingleContactMatchingMultivalueProperty_value___block_invoke;
  v8[3] = &unk_1E3CA4330;
  v9 = a3;
  v8[4] = a4;
  objc_msgSend(v6, "setBindBlock:", v8);
  return v6;
}

uint64_t __76__ABSQLPredicate_predicateForSingleContactMatchingMultivalueProperty_value___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend(a2, "intBinder");
  (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(unsigned int *)(a1 + 40));
  v5 = objc_msgSend(a2, "stringBinder");
  return (*(uint64_t (**)(uint64_t, _QWORD))(v5 + 16))(v5, *(_QWORD *)(a1 + 32));
}

+ (id)predicateForContactsMatchingOrganizationName:(id)a3
{
  id result;
  void *v5;
  _QWORD v6[5];

  result = (id)objc_msgSend(a3, "length");
  if (result)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setQuery:", CFSTR("SELECT abp.rowid FROM ABPerson abp WHERE abp.Organization LIKE ?"));
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__ABSQLPredicate_predicateForContactsMatchingOrganizationName___block_invoke;
    v6[3] = &unk_1E3CA4308;
    v6[4] = a3;
    objc_msgSend(v5, "setBindBlock:", v6);
    return v5;
  }
  return result;
}

uint64_t __63__ABSQLPredicate_predicateForContactsMatchingOrganizationName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "stringBinder");
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%%%@%%"), *(_QWORD *)(a1 + 32)));
}

+ (id)predicateForContactsInRange:(_NSRange)a3 allowedStoreIdentifiers:(id)a4 sortOrder:(int)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  _QWORD v15[7];

  length = a3.length;
  location = a3.location;
  v10 = (void *)objc_opt_new();
  v11 = objc_msgSend(a1, "_sqlListOfLength:", objc_msgSend(a4, "count"));
  v12 = CFSTR(" ORDER BY FirstSortLanguageIndex, FirstSortSection, FirstSort");
  if (a5)
    v12 = CFSTR(" ORDER BY LastSortLanguageIndex, LastSortSection, LastSort");
  v13 = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("SELECT rowid FROM ABPerson WHERE rowid IN (SELECT rowid FROM ABPerson WHERE personlink = -1 AND StoreID IN %@ UNION SELECT ab_allowed_preferred_contact(abp.rowid, abp.StoreID, abp.IsPreferredName, ?) FROM ABPerson abp JOIN ABPersonLink abpl ON abpl.rowid = abp.PersonLink WHERE abp.StoreID IN %@ GROUP BY abpl.rowid) %@ LIMIT ? OFFSET ? "), v11, v11, v12);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__ABSQLPredicate_predicateForContactsInRange_allowedStoreIdentifiers_sortOrder___block_invoke;
  v15[3] = &unk_1E3CA43A0;
  v15[4] = a4;
  v15[5] = location;
  v15[6] = length;
  objc_msgSend(v10, "setBindBlock:", v15);
  objc_msgSend(v10, "setQuery:", v13);
  return v10;
}

uint64_t __80__ABSQLPredicate_predicateForContactsInRange_allowedStoreIdentifiers_sortOrder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[5];
  _QWORD v12[5];

  v4 = MEMORY[0x1E0C809B0];
  v5 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__ABSQLPredicate_predicateForContactsInRange_allowedStoreIdentifiers_sortOrder___block_invoke_2;
  v12[3] = &unk_1E3CA4378;
  v12[4] = a2;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v12);
  v6 = objc_msgSend(a2, "blobBinder");
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 16))(v6, *(_QWORD *)(a1 + 32), 8);
  v7 = *(void **)(a1 + 32);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __80__ABSQLPredicate_predicateForContactsInRange_allowedStoreIdentifiers_sortOrder___block_invoke_3;
  v11[3] = &unk_1E3CA4378;
  v11[4] = a2;
  objc_msgSend(v7, "enumerateIndexesUsingBlock:", v11);
  v8 = objc_msgSend(a2, "intBinder");
  (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, *(unsigned int *)(a1 + 48));
  v9 = objc_msgSend(a2, "intBinder");
  return (*(uint64_t (**)(uint64_t, _QWORD))(v9 + 16))(v9, *(unsigned int *)(a1 + 40));
}

uint64_t __80__ABSQLPredicate_predicateForContactsInRange_allowedStoreIdentifiers_sortOrder___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = objc_msgSend(*(id *)(a1 + 32), "intBinder");
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

uint64_t __80__ABSQLPredicate_predicateForContactsInRange_allowedStoreIdentifiers_sortOrder___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = objc_msgSend(*(id *)(a1 + 32), "intBinder");
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

uint64_t __127__ABSQLPredicate_predicateForContactsMatchingPhoneNumber_country_homeCountryCode_prefixHint_groupIdentifiers_limitToOneResult___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = objc_msgSend(*(id *)(a1 + 32), "stringBinder");
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

uint64_t __131__ABSQLPredicate_predicateForContactsMatchingMultivalueProperty_values_groupIdentifiers_containerIdentifiers_limitToOneResult_map___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = objc_msgSend(*(id *)(a1 + 32), "stringBinder");
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

uint64_t __131__ABSQLPredicate_predicateForContactsMatchingMultivalueProperty_values_groupIdentifiers_containerIdentifiers_limitToOneResult_map___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = objc_msgSend(*(id *)(a1 + 32), "stringBinder");
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

+ (id)predicateForContactsMatchingPreferredChannel:(id)a3 limitOne:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  const __CFString *v7;
  _QWORD v9[5];

  v4 = a4;
  v6 = (void *)objc_opt_new();
  v7 = &stru_1E3CA4E68;
  if (v4)
    v7 = CFSTR("LIMIT 1");
  objc_msgSend(v6, "setQuery:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT abp.rowid FROM ABPerson abp WHERE abp.PreferredChannel = ? %@"), v7));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__ABSQLPredicate_predicateForContactsMatchingPreferredChannel_limitOne___block_invoke;
  v9[3] = &unk_1E3CA4308;
  v9[4] = a3;
  objc_msgSend(v6, "setBindBlock:", v9);
  return v6;
}

uint64_t __72__ABSQLPredicate_predicateForContactsMatchingPreferredChannel_limitOne___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "stringBinder");
  return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
}

void *__99__ABSQLPredicate_predicateForContactsMatchingPhoneNumbers_emailAddresses_containerIdentifiers_map___block_invoke_2(uint64_t a1, int a2)
{
  void *result;

  result = NSMapGet(*(NSMapTable **)(a1 + 32), (const void *)a2);
  if (result)
    return (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", result, CFSTR("matchedTerms"));
  return result;
}

+ (id)predicateForContactsMatchingText:(id)a3 tokenizer:(__CFStringTokenizer *)a4 collator:(UCollator *)a5 matchNameFieldsOnly:(BOOL)a6
{
  _BOOL4 v6;
  void *v10;
  const void *v11;
  void *v12;
  uint64_t Count;
  void *v14;
  uint64_t i;
  uint64_t j;
  uint64_t v17;
  const __CFString *v18;
  BOOL v20;
  void *v21;
  _QWORD v22[5];
  BOOL v23;

  v6 = a6;
  v10 = (void *)objc_opt_new();
  v11 = (const void *)ABTokenListCreate();
  ABTokenListPopulateFromString((uint64_t)v11, a4, (uint64_t)a5, (const __CFString *)a3, 0, 1, 0);
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  Count = ABTokenListGetCount((uint64_t)v11);
  v14 = (void *)objc_msgSend(CFSTR("SELECT rowid from ABPersonFullTextSearch WHERE ABPersonFullTextSearch MATCH "), "mutableCopy");
  objc_msgSend(v10, "setQuery:", v14);

  if (Count < 1)
  {
    if (v6)
    {
      v18 = CFSTR("'");
      objc_msgSend(v14, "appendString:", CFSTR("'"));
      goto LABEL_18;
    }
LABEL_17:
    v18 = CFSTR("?");
    goto LABEL_18;
  }
  for (i = 0; i != Count; ++i)
    objc_msgSend(v12, "addObject:", ABTokenListGetTokenAtIndex((uint64_t)v11, i));
  if (!v6)
    goto LABEL_17;
  objc_msgSend(v14, "appendString:", CFSTR("'"));
  v20 = v6;
  v21 = v10;
  for (j = 0; j != Count; ++j)
  {
    if (j)
      objc_msgSend(v14, "appendString:", CFSTR(" AND "));
    objc_msgSend(v14, "appendString:", CFSTR("("));
    v17 = 0;
    while (1)
    {
      do
      {
        objc_msgSend(v14, "appendString:", FTSearchNameOnlyProperties[v17]);
        objc_msgSend(v14, "appendString:", CFSTR(":' || ? || '"));
        ++v17;
      }
      while (!(_DWORD)v17);
      if ((_DWORD)v17 == 15)
        break;
      objc_msgSend(v14, "appendString:", CFSTR(" OR "));
    }
    objc_msgSend(v14, "appendString:", CFSTR(")"));
  }
  v10 = v21;
  LOBYTE(v6) = v20;
  v18 = CFSTR("'");
LABEL_18:
  objc_msgSend(v14, "appendString:", v18);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __90__ABSQLPredicate_predicateForContactsMatchingText_tokenizer_collator_matchNameFieldsOnly___block_invoke;
  v22[3] = &unk_1E3CA42C0;
  v23 = v6;
  v22[4] = v12;
  objc_msgSend(v10, "setBindBlock:", v22);
  CFRelease(v11);
  return v10;
}

uint64_t __90__ABSQLPredicate_predicateForContactsMatchingText_tokenizer_collator_matchNameFieldsOnly___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 40))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v4 = *(void **)(a1 + 32);
    result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (result)
    {
      v6 = result;
      v7 = *(_QWORD *)v20;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v4);
          v9 = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("##&%@* "), *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8));
          v10 = 15;
          do
          {
            v11 = objc_msgSend(a2, "stringBinder");
            (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, v9);
            --v10;
          }
          while (v10);
          ++v8;
        }
        while (v8 != v6);
        result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        v6 = result;
      }
      while (result);
    }
  }
  else
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = *(void **)(a1 + 32);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(v12, "appendFormat:", CFSTR("##&%@* "), *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v15);
    }
    v18 = objc_msgSend(a2, "stringBinder");
    return (*(uint64_t (**)(uint64_t, void *))(v18 + 16))(v18, v12);
  }
  return result;
}

+ (id)predicateForContactsMatchingSmartDialerString:(id)a3 tokenizer:(__CFStringTokenizer *)a4 collator:(UCollator *)a5
{
  void *v8;
  const void *v9;
  void *v10;
  uint64_t Count;
  uint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  uint64_t i;
  uint64_t TokenAtIndex;
  uint64_t v18;
  _QWORD v20[5];
  _QWORD v21[7];

  v8 = (void *)objc_opt_new();
  v9 = (const void *)ABTokenListCreate();
  ABTokenListPopulateFromString((uint64_t)v9, a4, (uint64_t)a5, (const __CFString *)a3, 0, 1, 0);
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  Count = ABTokenListGetCount((uint64_t)v9);
  v12 = objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 1282, 0);
  v13 = CFSTR("ab_cf_tokenizer_sd_match_collect(?, matchinfo(ABPersonSmartDialerFullTextSearch), ?, rowid)");
  v14 = CFSTR("rowid");
  if (v12)
    v14 = CFSTR("ab_cf_tokenizer_match_collect(?, matchinfo(ABPersonFullTextSearch), ?, rowid)");
  else
    v13 = CFSTR("rowid");
  objc_msgSend(v8, "setQuery:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT %@ from ABPersonSmartDialerFullTextSearch WHERE ABPersonSmartDialerFullTextSearch MATCH ? UNION SELECT %@ from ABPersonFullTextSearch WHERE ABPersonFullTextSearch.Phone MATCH ? "), v13, v14));
  v15 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      TokenAtIndex = ABTokenListGetTokenAtIndex((uint64_t)v9, i);
      objc_msgSend(v15, "appendFormat:", CFSTR("##&%@* "), TokenAtIndex);
      objc_msgSend(v10, "addObject:", TokenAtIndex);
    }
  }
  v18 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __83__ABSQLPredicate_predicateForContactsMatchingSmartDialerString_tokenizer_collator___block_invoke;
  v21[3] = &unk_1E3CA4560;
  v21[4] = v12;
  v21[5] = v10;
  v21[6] = v15;
  objc_msgSend(v8, "setBindBlock:", v21);
  v20[0] = v18;
  v20[1] = 3221225472;
  v20[2] = __83__ABSQLPredicate_predicateForContactsMatchingSmartDialerString_tokenizer_collator___block_invoke_2;
  v20[3] = &unk_1E3CA44B8;
  v20[4] = v12;
  objc_msgSend(v8, "setMatchInfoProvider:", v20);
  CFRelease(v9);
  return v8;
}

uint64_t __83__ABSQLPredicate_predicateForContactsMatchingSmartDialerString_tokenizer_collator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  CFTypeRef v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CFTypeRef v10;
  uint64_t v11;

  v4 = objc_msgSend(a2, "blobBinder");
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 16))(v4, *(_QWORD *)(a1 + 32), 8);
  v5 = objc_msgSend(a2, "blobBinder");
  v6 = CFRetain(*(CFTypeRef *)(a1 + 40));
  (*(void (**)(uint64_t, CFTypeRef, uint64_t))(v5 + 16))(v5, v6, 8);
  v7 = objc_msgSend(a2, "stringBinder");
  (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, *(_QWORD *)(a1 + 48));
  v8 = objc_msgSend(a2, "blobBinder");
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 16))(v8, *(_QWORD *)(a1 + 32), 8);
  v9 = objc_msgSend(a2, "blobBinder");
  v10 = CFRetain(*(CFTypeRef *)(a1 + 40));
  (*(void (**)(uint64_t, CFTypeRef, uint64_t))(v9 + 16))(v9, v10, 8);
  v11 = objc_msgSend(a2, "stringBinder");
  return (*(uint64_t (**)(uint64_t, _QWORD))(v11 + 16))(v11, *(_QWORD *)(a1 + 48));
}

void *__83__ABSQLPredicate_predicateForContactsMatchingSmartDialerString_tokenizer_collator___block_invoke_2(uint64_t a1, int a2)
{
  void *result;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  result = NSMapGet(*(NSMapTable **)(a1 + 32), (const void *)a2);
  if (result)
  {
    v3 = CFSTR("matchedProperties");
    v4[0] = result;
    return (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  }
  return result;
}

+ (id)predicateForContactsWithExternalUUIDs:(id)a3
{
  void *v5;
  uint64_t v6;
  _QWORD v8[5];

  v5 = (void *)objc_opt_new();
  v6 = objc_msgSend(a1, "bindPlaceholderStringOfCount:", objc_msgSend(a3, "count"));
  objc_msgSend(v5, "setQuery:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT rowid FROM ABPerson WHERE ExternalUUID IN(%@)"), v6));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__ABSQLPredicate_predicateForContactsWithExternalUUIDs___block_invoke;
  v8[3] = &unk_1E3CA4308;
  v8[4] = a3;
  objc_msgSend(v5, "setBindBlock:", v8);
  return v5;
}

uint64_t __56__ABSQLPredicate_predicateForContactsWithExternalUUIDs___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(void **)(a1 + 32);
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        v9 = objc_msgSend(a2, "stringBinder");
        (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v8);
        ++v7;
      }
      while (v5 != v7);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

+ (id)predicateForContactsMissingBackgroundColors
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setQuery:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT rowid FROM ABPerson WHERE ImageType is NOT NULL and ImageBackgroundColorsData is NULL")));
  return v2;
}

+ (id)predicateForContactsWithWallpaperMetadata
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setQuery:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT rowid FROM ABPerson WHERE WallpaperMetadata is NOT NULL")));
  return v2;
}

+ (id)predicateUnioningPredicate:(id)a3 withPredicate:(id)a4
{
  void *v6;
  _QWORD v8[6];

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setQuery:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT * FROM (%@) UNION SELECT * FROM  (%@)"), objc_msgSend(a3, "query"), objc_msgSend(a4, "query")));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__ABSQLPredicate_predicateUnioningPredicate_withPredicate___block_invoke;
  v8[3] = &unk_1E3CA4490;
  v8[4] = a3;
  v8[5] = a4;
  objc_msgSend(v6, "setBindBlock:", v8);
  return v6;
}

uint64_t __59__ABSQLPredicate_predicateUnioningPredicate_withPredicate___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend(*(id *)(a1 + 32), "bindBlock");
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  v5 = objc_msgSend(*(id *)(a1 + 40), "bindBlock");
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
}

- (id)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setIsNullPredicate:(BOOL)a3
{
  self->_isNullPredicate = a3;
}

@end
