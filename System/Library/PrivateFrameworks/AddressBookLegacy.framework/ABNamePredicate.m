@implementation ABNamePredicate

- (ABNamePredicate)init
{
  ABNamePredicate *v2;
  ABNamePredicate *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ABNamePredicate;
  v2 = -[ABPredicate init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_matchPreferredName = 1;
    v2->_tokenizations = (void *)ABTokenListCreate();
    v3->_generateExceprts = 0;
  }
  return v3;
}

- (void)dealloc
{
  void *addressBook;
  __CFArray *tokenizationSortKeys;
  objc_super v5;

  addressBook = self->_addressBook;
  if (addressBook)
    CFRelease(addressBook);
  tokenizationSortKeys = self->_tokenizationSortKeys;
  if (tokenizationSortKeys)
    releaseTokenizationSortKeys(tokenizationSortKeys);
  CFRelease(self->_tokenizations);

  v5.receiver = self;
  v5.super_class = (Class)ABNamePredicate;
  -[ABPredicate dealloc](&v5, sel_dealloc);
}

- (void)setAddressBook:(void *)a3
{
  void *addressBook;

  addressBook = self->_addressBook;
  if (addressBook != a3)
  {
    if (addressBook)
      CFRelease(addressBook);
    if (a3)
      CFRetain(a3);
    self->_addressBook = a3;
  }
}

- (void)addressBook
{
  return self->_addressBook;
}

- (void)setName:(id)a3
{
  NSString *name;

  name = self->_name;
  if (name != a3)
  {

    self->_name = (NSString *)objc_msgSend(a3, "copy");
    ABTokenListRemoveAllTokens((uint64_t)self->_tokenizations);
  }
}

- (void)setGroup:(void *)a3
{
  if (a3)
    a3 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:");
  -[ABNamePredicate setGroups:](self, "setGroups:", a3);
}

- (void)group
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ABNamePredicate.m"), 90, CFSTR("Should not call [ABNamePredicate group].  Uses [ABNamePredicate groups] instead."));
  return 0;
}

- (void)setSource:(void *)a3
{
  if (a3)
    a3 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:");
  -[ABNamePredicate setSources:](self, "setSources:", a3);
}

- (void)source
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ABNamePredicate.m"), 105, CFSTR("Should not call [ABNamePredicate source].  Uses [ABNamePredicate sources] instead."));
  return 0;
}

- (void)setAccountIdentifier:(id)a3
{
  uint64_t v6;
  id v7;

  if (-[ABNamePredicate addressBook](self, "addressBook"))
  {
    if (!a3)
      return;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ABNamePredicate.m"), 111, CFSTR("Should have address book before attempting to use [ABNamePredicate setAccountIdentifier:].  Or preferably, use [ABNamePredicate setSources:]."));
    if (!a3)
      return;
  }
  v6 = ABAddressBookCopyArrayOfAllSourcesWithAccountIdentifier((uint64_t)-[ABNamePredicate addressBook](self, "addressBook"), (uint64_t)a3);
  if (v6)
  {
    v7 = (id)v6;
    -[ABNamePredicate setSources:](self, "setSources:", v6);

  }
}

- (NSString)accountIdentifier
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ABNamePredicate.m"), 123, CFSTR("Should not call [ABNamePredicate accountIdentifier].  ABNamePredicate is source based rather than account based."));
  return 0;
}

- (void)tokenizations
{
  void *tokenizations;
  __CFStringTokenizer *WordTokenizer;

  if (-[ABNamePredicate name](self, "name") && !ABTokenListGetCount((uint64_t)self->_tokenizations))
  {
    tokenizations = self->_tokenizations;
    WordTokenizer = ABAddressBookGetWordTokenizer((uint64_t)-[ABNamePredicate addressBook](self, "addressBook"));
    ABTokenListPopulateFromString((uint64_t)tokenizations, WordTokenizer, 0, (const __CFString *)-[ABNamePredicate name](self, "name"), 0, 1, 0);
  }
  return self->_tokenizations;
}

- (BOOL)isValid
{
  void *v2;

  v2 = -[ABNamePredicate tokenizations](self, "tokenizations");
  if (v2)
    LOBYTE(v2) = ABTokenListGetCount((uint64_t)v2) > 0;
  return (char)v2;
}

- (id)ab_metadataForMatchingRow:(CPSqliteStatement *)a3 columnOffset:(int)a4
{
  uint64_t v7;
  uint64_t v8;
  const unsigned __int8 *v9;
  const char *v10;
  id v11;
  void *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  if (!ABCFTSIsEnabled())
    return 0;
  v7 = sqlite3_column_int(a3->var1, a4);
  v8 = *(_QWORD *)sqlite3_column_blob(a3->var1, a4 + 1);
  if (-[ABNamePredicate generateExceprts](self, "generateExceprts"))
  {
    v9 = sqlite3_column_text(a3->var1, a4 + 2);
    if (v9)
      v10 = (const char *)v9;
    else
      v10 = "";
    v11 = -[ABNamePredicate emphasizedExcerptStringForMatchString:](self, "emphasizedExcerptStringForMatchString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10));
    v19[0] = CFSTR("relevance");
    v20[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v20[1] = v8;
    v19[1] = CFSTR("matchedProperties");
    v19[2] = CFSTR("excerpt");
    v20[2] = v11;
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = v20;
    v14 = v19;
    v15 = 3;
  }
  else
  {
    v17[0] = CFSTR("relevance");
    v17[1] = CFSTR("matchedProperties");
    v18[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v18[1] = v8;
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = v18;
    v14 = v17;
    v15 = 2;
  }
  return (id)objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, v15);
}

- (id)emphasizedExcerptStringForMatchString:(id)a3
{
  id v5;
  void *v6;
  _QWORD v8[6];

  v5 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v6 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("\n"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__ABNamePredicate_emphasizedExcerptStringForMatchString___block_invoke;
  v8[3] = &unk_1E3CA3CF8;
  v8[4] = self;
  v8[5] = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);
  return v5;
}

void __57__ABNamePredicate_emphasizedExcerptStringForMatchString___block_invoke(uint64_t a1, void *a2, char a3)
{
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t Count;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a2, "isEqualToString:", CFSTR("…"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", a2);
  if ((a3 & 1) != 0 && (v5 & 1) == 0)
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "tokenizations");
    Count = ABTokenListGetCount(v7);
    if (Count >= 1)
    {
      v9 = Count;
      for (i = 0; i != v9; ++i)
      {
        v11 = objc_msgSend(a2, "rangeOfString:options:", ABTokenListGetTokenAtIndex(v7, i), 393);
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v13 = v11;
          v14 = v12;
          v16 = CFSTR("excerptEmphasized");
          v17[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
          objc_msgSend(v6, "setAttributes:range:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1), v13, v14);
        }
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "appendAttributedString:", v6);

}

- (id)querySelectPropertiesForPredicateIdentifier:(int)a3
{
  uint64_t v3;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD v9[3];
  _QWORD v10[3];

  v3 = *(_QWORD *)&a3;
  v10[2] = *MEMORY[0x1E0C80C00];
  if (!ABCFTSIsEnabled())
    return 0;
  if (self->_matchPersonOrCompanyNamesExclusively
    || self->_matchSmartDialerFormatsExclusively
    || !-[ABNamePredicate generateExceprts](self, "generateExceprts"))
  {
    v10[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RankResults_%d.Rank"), v3);
    v10[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RankResults_%d.MatchedColumns"), v3);
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = v10;
    v7 = 2;
  }
  else
  {
    v9[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RankResults_%d.Rank"), v3);
    v9[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RankResults_%d.MatchedColumns"), v3);
    v9[2] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RankResults_%d.MatchedSnippet"), v3);
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = v9;
    v7 = 3;
  }
  return (id)objc_msgSend(v5, "arrayWithObjects:count:", v6, v7);
}

- (id)_matchClauseForColumns:(id)a3 requiringAllTerms:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  unint64_t v9;
  const __CFString *v10;
  unint64_t v11;

  v4 = a4;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR(" MATCH ' "));
  v8 = -[ABNamePredicate tokenizations](self, "tokenizations");
  if (ABTokenListGetCount((uint64_t)v8))
  {
    v9 = 0;
    if (v4)
      v10 = CFSTR(" AND ");
    else
      v10 = CFSTR(" OR ");
    do
    {
      if (v9)
        objc_msgSend(v7, "appendFormat:", v10);
      objc_msgSend(v7, "appendFormat:", CFSTR("("));
      if (objc_msgSend(a3, "count"))
      {
        v11 = 0;
        do
        {
          if (v11)
            objc_msgSend(v7, "appendFormat:", CFSTR(" OR "));
          objc_msgSend(v7, "appendFormat:", CFSTR("%@:' || ? || '"), objc_msgSend(a3, "objectAtIndex:", v11++));
        }
        while (v11 < objc_msgSend(a3, "count"));
      }
      objc_msgSend(v7, "appendFormat:", CFSTR(")"));
      ++v9;
    }
    while (v9 < ABTokenListGetCount((uint64_t)v8));
  }
  objc_msgSend(v7, "appendFormat:", CFSTR("'"));
  return v7;
}

- (id)queryJoinsInCompound:(BOOL)a3 predicateIdentifier:(int)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v9;
  _BOOL4 v10;
  __CFString *v11;
  const __CFString *v12;
  unint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v4 = *(_QWORD *)&a4;
  v17[1] = *MEMORY[0x1E0C80C00];
  if (!ABCFTSIsEnabled())
    return 0;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  objc_msgSend(v6, "appendFormat:", CFSTR("LEFT JOIN "));
  if (-[ABNamePredicate matchPersonOrCompanyNamesExclusively](self, "matchPersonOrCompanyNamesExclusively"))
  {
    v7 = -[ABNamePredicate _personNameKeys](self, "_personNameKeys");
    objc_msgSend(v6, "appendFormat:", CFSTR("(select ROWID as RankRow, ab_cf_tokenizer_namerank(matchinfo(ABPersonFullTextSearch), ?) as Rank, ab_cf_tokenizer_matched_properties(matchinfo(ABPersonFullTextSearch), ?) as MatchedColumns, 1 as HasFTSMatch from ABPersonFullTextSearch join ABPerson on ABPerson.rowid=ABPersonFullTextSearch.rowid WHERE ABPersonFullTextSearch.Organization MATCH ? and Kind=%@"), kABPersonKindOrganization);
    objc_msgSend(v6, "appendFormat:", CFSTR(" UNION "));
    objc_msgSend(v6, "appendFormat:", CFSTR("select ROWID as RankRow, ab_cf_tokenizer_namerank(matchinfo(ABPersonFullTextSearch) , ?) as Rank, ab_cf_tokenizer_matched_properties(matchinfo(ABPersonFullTextSearch), ?) as MatchedColumns, 1 as HasFTSMatch from ABPersonFullTextSearch join ABPerson on ABPerson.rowid=ABPersonFullTextSearch.rowid WHERE ABPersonFullTextSearch "));
    objc_msgSend(v6, "appendString:", -[ABNamePredicate _matchClauseForColumns:requiringAllTerms:](self, "_matchClauseForColumns:requiringAllTerms:", v7, 1));
    objc_msgSend(v6, "appendFormat:", CFSTR(" AND Kind=%@)"), kABPersonKindPerson);
  }
  else if (self->_matchSmartDialerFormatsExclusively)
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("(select ROWID as RankRow, ab_cf_tokenizer_namerank(matchinfo(ABPersonSmartDialerFullTextSearch), ?) as Rank, ab_cf_tokenizer_sd_matched_properties(matchinfo(ABPersonSmartDialerFullTextSearch), ?) as MatchedColumns, 1 as HasFTSMatch from ABPersonSmartDialerFullTextSearch join ABPerson on ABPerson.rowid=ABPersonSmartDialerFullTextSearch.rowid WHERE ABPersonSmartDialerFullTextSearch MATCH ?"));
    objc_msgSend(v6, "appendFormat:", CFSTR(" UNION "));
    objc_msgSend(v6, "appendFormat:", CFSTR("select ROWID as RankRow, ab_cf_tokenizer_namerank(matchinfo(ABPersonFullTextSearch), ?) as Rank, ab_cf_tokenizer_matched_properties(matchinfo(ABPersonFullTextSearch), ?) as MatchedColumns, 1 as HasFTSMatch from ABPersonFullTextSearch join ABPerson on ABPerson.rowid=ABPersonFullTextSearch.rowid WHERE ABPersonFullTextSearch.Phone MATCH ?)"), v16);
  }
  else
  {
    v9 = -[ABNamePredicate tokenizations](self, "tokenizations");
    v10 = -[ABNamePredicate generateExceprts](self, "generateExceprts");
    v11 = &stru_1E3CA4E68;
    v12 = CFSTR("snippet(ABPersonFullTextSearch, '\n', '\n', '…', ab_cf_tokenizer_select_snippet_column(matchinfo(ABPersonFullTextSearch)), -5) as MatchedSnippet,");
    if (!v10)
      v12 = &stru_1E3CA4E68;
    objc_msgSend(v6, "appendFormat:", CFSTR("(select fts.ROWID as RankRow, ab_cf_tokenizer_namerank(matchinfo(ABPersonFullTextSearch), ?) as Rank, ab_cf_tokenizer_matched_properties(matchinfo(ABPersonFullTextSearch), ?) as MatchedColumns, %@ 1 as HasFTSMatch from ABPersonFullTextSearch fts "), v12);
    if (-[NSArray count](-[ABNamePredicate scopedContactIdentifiers](self, "scopedContactIdentifiers"), "count"))
    {
      v11 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("fts.rowid IN("));
      if (-[NSArray count](-[ABNamePredicate scopedContactIdentifiers](self, "scopedContactIdentifiers"), "count"))
      {
        v13 = 0;
        do
        {
          if (v13)
            v14 = CFSTR(", ?");
          else
            v14 = CFSTR("?");
          -[__CFString appendString:](v11, "appendString:", v14);
          ++v13;
        }
        while (v13 < -[NSArray count](-[ABNamePredicate scopedContactIdentifiers](self, "scopedContactIdentifiers"), "count"));
      }
      -[__CFString appendString:](v11, "appendString:", CFSTR(") AND"));
    }
    objc_msgSend(v6, "appendFormat:", CFSTR("where %@ ABPersonFullTextSearch MATCH ' ' || ? || ' "), v11);
    if (!self->_matchWholeWords)
    {
      objc_msgSend(v6, "appendString:", CFSTR(" OR ("));
      if (ABTokenListGetCount((uint64_t)v9) >= 1)
      {
        v15 = 0;
        do
        {
          if (v15)
            objc_msgSend(v6, "appendString:", CFSTR(" AND "));
          objc_msgSend(v6, "appendString:", CFSTR(" ' || ? || ' "));
          ++v15;
        }
        while (v15 < ABTokenListGetCount((uint64_t)v9));
      }
      objc_msgSend(v6, "appendString:", CFSTR(")"));
    }
    objc_msgSend(v6, "appendString:", CFSTR(" '"));
    objc_msgSend(v6, "appendString:", CFSTR(")"));
  }
  objc_msgSend(v6, "appendFormat:", CFSTR(" AS RankResults_%d ON abp.ROWID=RankResults_%d.RankRow "), v4, v4);
  v17[0] = v6;
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
}

- (id)_personNameKeys
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v13;

  v13 = (void *)MEMORY[0x1E0C99D20];
  v2 = ABCPersonNameForProperty(kABPersonFirstNamePhoneticProperty);
  v3 = ABCPersonNameForProperty(kABPersonMiddleNamePhoneticProperty);
  v4 = ABCPersonNameForProperty(kABPersonLastNamePhoneticProperty);
  v5 = ABCPersonNameForProperty(kABPersonFirstNameProperty);
  v6 = ABCPersonNameForProperty(kABPersonMiddleNameProperty);
  v7 = ABCPersonNameForProperty(kABPersonLastNameProperty);
  v8 = ABCPersonNameForProperty(kABPersonPreviousFamilyNameProperty);
  v9 = ABCPersonNameForProperty(kABPersonNicknameProperty);
  v10 = ABCPersonNameForProperty(kABPersonDisplayNameProperty);
  v11 = ABCPersonNameForProperty(kABPersonSuffixProperty);
  return (id)objc_msgSend(v13, "arrayWithObjects:", v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, ABCPersonNameForProperty(kABPersonPrefixProperty), 0);
}

- (id)_personNonNameKeys
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;

  v15 = (void *)MEMORY[0x1E0C99D20];
  v14 = ABCPersonNameForProperty(kABPersonOrganizationPhoneticProperty);
  v13 = ABCPersonNameForProperty(kABPersonOrganizationProperty);
  v2 = ABCPersonNameForProperty(kABPersonDepartmentProperty);
  v3 = ABCPersonNameForProperty(kABPersonNoteProperty);
  v4 = ABCPersonNameForProperty(kABPersonBirthdayProperty);
  v5 = ABCPersonNameForProperty(kABPersonJobTitleProperty);
  v6 = ABCPersonNameForProperty(kABPersonPhoneProperty);
  v7 = ABCPersonNameForProperty(kABPersonEmailProperty);
  v8 = ABCPersonNameForProperty(kABPersonAddressProperty);
  v9 = ABCPersonNameForProperty(kABPersonSocialProfileProperty);
  v10 = ABCPersonNameForProperty(kABPersonURLProperty);
  v11 = ABCPersonNameForProperty(kABPersonInstantMessageProperty);
  return (id)objc_msgSend(v15, "arrayWithObjects:", v14, v13, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, ABCPersonNameForProperty(kABPersonDateProperty), CFSTR("SupplementalCompositeNameTerms"), 0);
}

- (id)queryWhereStringForPredicateIdentifier:(int)a3
{
  uint64_t v3;
  __CFString *v5;
  __CFArray *tokenizationSortKeys;
  char v7;
  __CFString *v8;
  __CFStringTokenizer *WordTokenizer;
  const __CFArray *v10;
  const __CFArray *v11;
  uint64_t SearchCollator;
  uint64_t v14;

  v3 = *(_QWORD *)&a3;
  v5 = (__CFString *)objc_opt_new();
  tokenizationSortKeys = self->_tokenizationSortKeys;
  if (tokenizationSortKeys)
    releaseTokenizationSortKeys(tokenizationSortKeys);
  if (-[NSArray count](self->_groups, "count"))
    v7 = 1;
  else
    v7 = -[NSArray count](self->_sources, "count") != 0;
  v8 = ABAddressBookCopyWhereClauseForLinkedPeopleInGroupsAndSources(self->_matchPreferredName, v7, (CFArrayRef)-[ABNamePredicate groups](self, "groups"), (const __CFArray *)-[ABNamePredicate sources](self, "sources"), (uint64_t)CFSTR("abp"));
  if (v8)
    -[__CFString appendString:](v5, "appendString:", v8);
  if (-[NSString length](self->_name, "length"))
  {
    if (v8)
      -[__CFString appendString:](v5, "appendString:", CFSTR(" AND "));
    if (ABCFTSIsEnabled())
    {
      -[__CFString appendFormat:](v5, "appendFormat:", CFSTR(" RankResults_%d.HasFTSMatch = 1 "), v3);
    }
    else
    {
      WordTokenizer = ABAddressBookGetWordTokenizer((uint64_t)-[ABNamePredicate addressBook](self, "addressBook"));
      v10 = ABCCreateArrayOfTokenizationsBySeparatingWordsInCompositeName(WordTokenizer, (const __CFString *)self->_name, 1);
      if (v10)
      {
        v11 = v10;
        if (CFArrayGetCount(v10) >= 1)
        {
          SearchCollator = ABAddressBookGetSearchCollator((uint64_t)self->_addressBook);
          v14 = 0;
          -[__CFString appendFormat:](v5, "appendFormat:", CFSTR("abp.ROWID in (select abs.person_id from ABPersonSearchKey abs WHERE"));
          appendTokenizations(self->_name, v11, SearchCollator, v5, &self->_tokenizationSortKeys, &v14, -[ABNamePredicate matchWholeWords](self, "matchWholeWords"), -[ABNamePredicate matchPersonOrCompanyNamesExclusively](self, "matchPersonOrCompanyNamesExclusively"));
          -[__CFString appendFormat:](v5, "appendFormat:", CFSTR(")"));
        }
        CFRelease(v11);
      }
    }
  }
  return v5;
}

- (id)queryRankStringForPredicateIdentifier:(int)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RankResults_%d.Rank"), *(_QWORD *)&a3);
}

- (void)ab_bindJoinClauseComponentOfStatement:(CPSqliteStatement *)a3 withBindingOffset:(int *)a4 predicateIdentifier:(int)a5
{
  void *v5;
  void *v6;
  uint64_t Count;
  CFMutableArrayRef Mutable;
  uint64_t i;
  const void *TokenAtIndex;
  const __CFString *v11;
  const __CFArray *v12;
  sqlite3_stmt *var1;
  int v14;
  CFTypeRef v15;
  void (__cdecl *v16)(void *);
  sqlite3_stmt *v17;
  CFTypeRef v18;
  sqlite3_stmt *v19;
  const char *v20;
  id v21;
  uint64_t v22;
  __CFArray *v23;
  unint64_t v24;
  sqlite3_stmt *v25;
  int v26;
  CFTypeRef v27;
  void (__cdecl *v28)(void *);
  sqlite3_stmt *v29;
  CFTypeRef v30;
  void (__cdecl *v31)(void *);
  void *v32;
  uint64_t v33;
  void (__cdecl *v34)(void *);
  unint64_t v35;
  uint64_t v36;
  void *v37;
  _BOOL4 v38;
  const __CFString *v39;
  sqlite3_stmt *v40;
  int v41;
  const char *v42;
  sqlite3_stmt *v43;
  int v44;
  _BOOL4 matchSmartDialerFormatsExclusively;
  sqlite3_stmt *v46;
  int v47;
  CFTypeRef v48;
  void (__cdecl *v49)(void *);
  sqlite3_stmt *v50;
  CFTypeRef v51;
  int v52;
  sqlite3_stmt *v53;
  const char *v54;
  void (__cdecl *v55)(void *);
  sqlite3_stmt *v56;
  CFTypeRef v57;
  void (__cdecl *v58)(void *);
  sqlite3_stmt *v59;
  CFTypeRef v60;
  sqlite3_stmt *v61;
  const char *v62;
  NSArray *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t j;
  sqlite3_stmt *v68;
  int v69;
  const char *v70;
  BOOL v71;
  uint64_t v72;
  uint64_t v73;
  void (__cdecl *v74)(void *);
  sqlite3_stmt *v75;
  int v76;
  const char *v77;
  uint64_t v78;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  uint64_t v88;
  CFRange v89;

  v88 = *MEMORY[0x1E0C80C00];
  if (ABCFTSIsEnabled())
  {
    v5 = -[ABNamePredicate tokenizations](self, "tokenizations");
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    Count = ABTokenListGetCount((uint64_t)v5);
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    CFAutorelease(Mutable);
    if (Count)
    {
      for (i = 0; i != Count; ++i)
      {
        TokenAtIndex = (const void *)ABTokenListGetTokenAtIndex((uint64_t)v5, i);
        if (-[ABNamePredicate matchWholeWords](self, "matchWholeWords"))
          v11 = &stru_1E3CA4E68;
        else
          v11 = CFSTR("*");
        objc_msgSend(v6, "appendFormat:", CFSTR("##&%@%@ "), TokenAtIndex, v11);
        CFArrayAppendValue(Mutable, TokenAtIndex);
      }
    }
    v12 = Mutable;
    v78 = Count;
    if (objc_msgSend(v6, "length"))
    {
      v82 = v5;
      if (self->_matchPersonOrCompanyNamesExclusively)
      {
        var1 = a3->var1;
        v14 = *a4;
        v15 = CFRetain(Mutable);
        v16 = (void (__cdecl *)(void *))MEMORY[0x1E0C98BC0];
        sqlite3_bind_blob(var1, v14, v15, 8, (void (__cdecl *)(void *))MEMORY[0x1E0C98BC0]);
        LODWORD(var1) = *a4 + 1;
        *a4 = (int)var1;
        v17 = a3->var1;
        v18 = CFRetain(Mutable);
        sqlite3_bind_blob(v17, (int)var1, v18, 8, v16);
        LODWORD(var1) = *a4 + 1;
        *a4 = (int)var1;
        v19 = a3->var1;
        v20 = (const char *)_CPCreateUTF8StringFromCFString();
        sqlite3_bind_text(v19, (int)var1, v20, -1, (void (__cdecl *)(void *))MEMORY[0x1E0C834A8]);
        ++*a4;
        v21 = -[ABNamePredicate _personNameKeys](self, "_personNameKeys");
        v22 = objc_msgSend(v21, "count");
        v23 = CFArrayCreateMutable(0, v22 * Count, MEMORY[0x1E0C9B378]);
        if (objc_msgSend(v21, "count"))
        {
          v24 = 0;
          do
          {
            v89.length = CFArrayGetCount(v12);
            v89.location = 0;
            CFArrayAppendArray(v23, v12, v89);
            ++v24;
          }
          while (v24 < objc_msgSend(v21, "count"));
        }
        v25 = a3->var1;
        v26 = *a4;
        v27 = CFRetain(v23);
        v28 = (void (__cdecl *)(void *))MEMORY[0x1E0C98BC0];
        sqlite3_bind_blob(v25, v26, v27, 8, (void (__cdecl *)(void *))MEMORY[0x1E0C98BC0]);
        LODWORD(v25) = *a4 + 1;
        *a4 = (int)v25;
        v29 = a3->var1;
        v30 = CFRetain(v23);
        v31 = v28;
        v32 = v21;
        sqlite3_bind_blob(v29, (int)v25, v30, 8, v31);
        ++*a4;
        CFRelease(v23);
        if (Count)
        {
          v33 = 0;
          v34 = (void (__cdecl *)(void *))MEMORY[0x1E0C834A8];
          do
          {
            if (objc_msgSend(v32, "count"))
            {
              v35 = 0;
              do
              {
                v36 = ABTokenListGetTokenAtIndex((uint64_t)v5, v33);
                v37 = (void *)MEMORY[0x1E0CB3940];
                v38 = -[ABNamePredicate matchWholeWords](self, "matchWholeWords");
                v39 = CFSTR("*");
                if (v38)
                  v39 = &stru_1E3CA4E68;
                objc_msgSend(v37, "stringWithFormat:", CFSTR("##&%@%@ "), v36, v39);
                v40 = a3->var1;
                v41 = *a4;
                v42 = (const char *)_CPCreateUTF8StringFromCFString();
                v43 = v40;
                v5 = v82;
                v44 = v41;
                v32 = v21;
                sqlite3_bind_text(v43, v44, v42, -1, v34);
                ++*a4;
                ++v35;
              }
              while (v35 < objc_msgSend(v21, "count"));
            }
            ++v33;
          }
          while (v33 != Count);
        }
      }
      else
      {
        matchSmartDialerFormatsExclusively = self->_matchSmartDialerFormatsExclusively;
        v46 = a3->var1;
        v47 = *a4;
        v48 = CFRetain(v12);
        v49 = (void (__cdecl *)(void *))MEMORY[0x1E0C98BC0];
        sqlite3_bind_blob(v46, v47, v48, 8, (void (__cdecl *)(void *))MEMORY[0x1E0C98BC0]);
        LODWORD(v46) = *a4 + 1;
        *a4 = (int)v46;
        v50 = a3->var1;
        v51 = CFRetain(v12);
        sqlite3_bind_blob(v50, (int)v46, v51, 8, v49);
        v52 = *a4 + 1;
        *a4 = v52;
        if (matchSmartDialerFormatsExclusively)
        {
          v53 = a3->var1;
          v54 = (const char *)_CPCreateUTF8StringFromCFString();
          v55 = (void (__cdecl *)(void *))MEMORY[0x1E0C834A8];
          sqlite3_bind_text(v53, v52, v54, -1, (void (__cdecl *)(void *))MEMORY[0x1E0C834A8]);
          LODWORD(v53) = *a4 + 1;
          *a4 = (int)v53;
          v56 = a3->var1;
          v57 = CFRetain(v12);
          v58 = (void (__cdecl *)(void *))MEMORY[0x1E0C98BC0];
          sqlite3_bind_blob(v56, (int)v53, v57, 8, (void (__cdecl *)(void *))MEMORY[0x1E0C98BC0]);
          LODWORD(v53) = *a4 + 1;
          *a4 = (int)v53;
          v59 = a3->var1;
          v60 = CFRetain(v12);
          sqlite3_bind_blob(v59, (int)v53, v60, 8, v58);
          LODWORD(v53) = *a4 + 1;
          *a4 = (int)v53;
          v61 = a3->var1;
          v62 = (const char *)_CPCreateUTF8StringFromCFString();
          sqlite3_bind_text(v61, (int)v53, v62, -1, v55);
          ++*a4;
        }
        else
        {
          if (-[NSArray count](-[ABNamePredicate scopedContactIdentifiers](self, "scopedContactIdentifiers"), "count"))
          {
            v85 = 0u;
            v86 = 0u;
            v83 = 0u;
            v84 = 0u;
            v63 = -[ABNamePredicate scopedContactIdentifiers](self, "scopedContactIdentifiers");
            v64 = -[NSArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
            if (v64)
            {
              v65 = v64;
              v66 = *(_QWORD *)v84;
              do
              {
                for (j = 0; j != v65; ++j)
                {
                  if (*(_QWORD *)v84 != v66)
                    objc_enumerationMutation(v63);
                  sqlite3_bind_int(a3->var1, *a4, objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * j), "intValue"));
                  ++*a4;
                }
                v65 = -[NSArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
              }
              while (v65);
            }
          }
          v68 = a3->var1;
          v69 = *a4;
          v70 = (const char *)_CPCreateUTF8StringFromCFString();
          sqlite3_bind_text(v68, v69, v70, -1, (void (__cdecl *)(void *))MEMORY[0x1E0C834A8]);
          ++*a4;
          v71 = self->_matchWholeWords || Count == 0;
          v72 = (uint64_t)v82;
          if (!v71)
          {
            v73 = 0;
            v74 = (void (__cdecl *)(void *))MEMORY[0x1E0C834A8];
            do
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("##&%@ "), ABTokenListGetTokenAtIndex(v72, v73));
              v75 = a3->var1;
              v76 = *a4;
              v77 = (const char *)_CPCreateUTF8StringFromCFString();
              v72 = (uint64_t)v82;
              sqlite3_bind_text(v75, v76, v77, -1, v74);
              ++*a4;
              ++v73;
            }
            while (v78 != v73);
          }
        }
      }
    }
  }
}

- (void)ab_bindWhereClauseComponentOfStatement:(CPSqliteStatement *)a3 withBindingOffset:(int *)a4 predicateIdentifier:(int)a5
{
  _BOOL8 v8;

  if (-[NSArray count](self->_groups, "count", a3, a4, *(_QWORD *)&a5))
    v8 = 1;
  else
    v8 = -[NSArray count](self->_sources, "count") != 0;
  ABAddressBookBindWhereClauseForLinkedPeopleInGroupsAndSources(v8, (CFArrayRef)-[ABNamePredicate groups](self, "groups"), (CFArrayRef)-[ABNamePredicate sources](self, "sources"), a3->var1, a4);
  if ((ABCFTSIsEnabled() & 1) == 0)
    bindTokenizations((uint64_t)a3, self->_tokenizationSortKeys, a4);
}

- (id)predicateFormat
{
  void *v3;
  NSString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[ABNamePredicate name](self, "name");
  v5 = CFSTR("YES");
  if (-[ABNamePredicate matchWholeWords](self, "matchWholeWords"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[ABNamePredicate matchPersonOrCompanyNamesExclusively](self, "matchPersonOrCompanyNamesExclusively"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[ABNamePredicate matchSmartDialerFormatsExclusively](self, "matchSmartDialerFormatsExclusively"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (!-[ABNamePredicate matchPreferredName](self, "matchPreferredName"))
    v5 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("ABNamePredicate %p - Name matching <%@> - Match whole words <%@> - Match name only <%@> - Match smart dialer format only <%@> - Match preferred name <%@> - Sources <%@> - Groups <%@>"), self, v4, v6, v7, v8, v5, -[ABNamePredicate sources](self, "sources"), -[ABNamePredicate groups](self, "groups"));
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)sources
{
  return self->_sources;
}

- (void)setSources:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSArray)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)matchWholeWords
{
  return self->_matchWholeWords;
}

- (void)setMatchWholeWords:(BOOL)a3
{
  self->_matchWholeWords = a3;
}

- (BOOL)matchPersonOrCompanyNamesExclusively
{
  return self->_matchPersonOrCompanyNamesExclusively;
}

- (void)setMatchPersonOrCompanyNamesExclusively:(BOOL)a3
{
  self->_matchPersonOrCompanyNamesExclusively = a3;
}

- (BOOL)matchSmartDialerFormatsExclusively
{
  return self->_matchSmartDialerFormatsExclusively;
}

- (void)setMatchSmartDialerFormatsExclusively:(BOOL)a3
{
  self->_matchSmartDialerFormatsExclusively = a3;
}

- (BOOL)matchPreferredName
{
  return self->_matchPreferredName;
}

- (void)setMatchPreferredName:(BOOL)a3
{
  self->_matchPreferredName = a3;
}

- (BOOL)generateExceprts
{
  return self->_generateExceprts;
}

- (void)setGenerateExceprts:(BOOL)a3
{
  self->_generateExceprts = a3;
}

- (NSArray)scopedContactIdentifiers
{
  return self->_scopedContactIdentifiers;
}

- (void)setScopedContactIdentifiers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

@end
