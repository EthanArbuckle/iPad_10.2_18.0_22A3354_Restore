@implementation ABBufferQuery

- (__CFDictionary)propertyIndices
{
  return self->_propertyIndices;
}

- (NSIndexSet)requestedMultivalueIdentifiers
{
  return self->_requestedMultivalueIdentifiers;
}

- (NSIndexSet)requestedPropertyIdentifiers
{
  return self->_requestedPropertyIdentifiers;
}

- (ABSQLPredicate)predicate
{
  return self->_predicate;
}

- (int64_t)contactidentifierAuditMode
{
  return self->_contactidentifierAuditMode;
}

- (BOOL)requestedImageCropRect
{
  return self->_requestedImageCropRect;
}

- (BOOL)requestedImageData
{
  return self->_requestedImageData;
}

- (BOOL)requestedWatchWallpaperImageData
{
  return self->_requestedWatchWallpaperImageData;
}

- (BOOL)requestedWallpaperMetadata
{
  return self->_requestedWallpaperMetadata;
}

- (BOOL)requestedWallpaperData
{
  return self->_requestedWallpaperData;
}

- (BOOL)requestedSyncImageData
{
  return self->_requestedSyncImageData;
}

- (BOOL)requestedImageThumbnail
{
  return self->_requestedImageThumbnail;
}

- (BOOL)requestedImageFullscreenData
{
  return self->_requestedImageFullscreenData;
}

- (BOOL)requestedHasImageData
{
  return self->_requestedHasImageData;
}

- (CPSqliteStatement)statement
{
  return self->_statement;
}

- (void)setStatement:(CPSqliteStatement *)a3
{
  self->_statement = a3;
}

- (id)scopedStoresForManagedConfiguration:(id)a3
{
  if ((objc_msgSend(a3, "deviceHasManagementRestrictions") & 1) != 0
    || objc_msgSend(a3, "hasContactProviderRestrictions"))
  {
    return ABAddressBookIndexSetOfAllowedSourceIdentifiersIncludingDisabledSources((uint64_t)-[ABBufferQuery addressBook](self, "addressBook"), a3, 0);
  }
  else
  {
    return 0;
  }
}

- (void)bindWithClause:(id)a3
{
  NSIndexSet *v5;
  uint64_t v6;
  _QWORD v7[5];

  if (-[ABBufferQuery scopedStoreIdentifiers](self, "scopedStoreIdentifiers"))
  {
    v5 = -[ABBufferQuery scopedStoreIdentifiers](self, "scopedStoreIdentifiers");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __32__ABBufferQuery_bindWithClause___block_invoke;
    v7[3] = &unk_1E3CA4378;
    v7[4] = a3;
    -[NSIndexSet enumerateIndexesUsingBlock:](v5, "enumerateIndexesUsingBlock:", v7);
    if (-[ABBufferQuery fetchLinkedContacts](self, "fetchLinkedContacts"))
    {
      v6 = objc_msgSend(a3, "blobBinder");
      (*(void (**)(uint64_t, NSIndexSet *, uint64_t))(v6 + 16))(v6, -[ABBufferQuery scopedStoreIdentifiers](self, "scopedStoreIdentifiers"), 8);
    }
  }
}

- (void)bindWhereClause:(id)a3
{
  NSIndexSet *v5;
  _QWORD v6[5];

  if (-[ABBufferQuery scopedStoreIdentifiers](self, "scopedStoreIdentifiers"))
  {
    v5 = -[ABBufferQuery scopedStoreIdentifiers](self, "scopedStoreIdentifiers");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __33__ABBufferQuery_bindWhereClause___block_invoke;
    v6[3] = &unk_1E3CA4378;
    v6[4] = a3;
    -[NSIndexSet enumerateIndexesUsingBlock:](v5, "enumerateIndexesUsingBlock:", v6);
  }
}

- (void)appendWhereClauseToQueryString:(id)a3
{
  if (-[ABBufferQuery scopedStoreIdentifiers](self, "scopedStoreIdentifiers"))
  {
    objc_msgSend(a3, "appendString:", CFSTR(" WHERE abp.StoreID IN "));
    -[ABBufferQuery appendBindParameterMarkersToQueryString:count:](self, "appendBindParameterMarkersToQueryString:count:", a3, -[NSIndexSet count](-[ABBufferQuery scopedStoreIdentifiers](self, "scopedStoreIdentifiers"), "count"));
  }
}

- (void)prependWithClauseToQueryString:(id)a3 whereClause:(id)a4
{
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;

  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  if (-[ABBufferQuery sortOrder](self, "sortOrder"))
  {
    if (-[ABBufferQuery sortOrder](self, "sortOrder") == 1)
    {
      v8 = CFSTR(", LastSortLanguageIndex, LastSortSection, LastSort ");
    }
    else
    {
      if (-[ABBufferQuery sortOrder](self, "sortOrder") != -1)
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ABBufferQuery: unrecognized sort order: %u"), -[ABBufferQuery sortOrder](self, "sortOrder")), 0);
      v8 = &stru_1E3CA4E68;
    }
  }
  else
  {
    v8 = CFSTR(", FirstSortLanguageIndex, FirstSortSection, FirstSort ");
  }
  objc_msgSend(v7, "appendFormat:", CFSTR("WITH preferredmatched(rowid %@) as("), v8);
  if (-[ABBufferQuery fetchLinkedContacts](self, "fetchLinkedContacts"))
  {
    objc_msgSend(v7, "appendString:", CFSTR("WITH matched(rowid, personlink) as(SELECT rowid, personlink from ABPerson "));
    if (objc_msgSend(a4, "length"))
    {
      objc_msgSend(v7, "appendFormat:", CFSTR("WHERE rowid in(%@) "), a4);
      v9 = CFSTR("AND ");
    }
    else
    {
      v9 = CFSTR("WHERE ");
    }
    if (-[ABBufferQuery scopedStoreIdentifiers](self, "scopedStoreIdentifiers"))
    {
      objc_msgSend(v7, "appendFormat:", CFSTR("%@ StoreID IN"), v9);
      -[ABBufferQuery appendBindParameterMarkersToQueryString:count:](self, "appendBindParameterMarkersToQueryString:count:", v7, -[NSIndexSet count](-[ABBufferQuery scopedStoreIdentifiers](self, "scopedStoreIdentifiers"), "count"));
    }
    objc_msgSend(v7, "appendString:", CFSTR(") "));
    objc_msgSend(v7, "appendFormat:", CFSTR("SELECT rowid %@ FROM ABPerson abp WHERE abp.rowid IN (SELECT rowid FROM matched WHERE matched.personlink = -1 UNION "), v8);
    if (-[ABBufferQuery scopedStoreIdentifiers](self, "scopedStoreIdentifiers"))
      v11 = CFSTR("SELECT ab_allowed_preferred_contact(abp.rowid, abp.StoreID, abp.IsPreferredName, ?) FROM ABPerson abp JOIN ABPersonLink abpl on abpl.rowid = abp.PersonLink WHERE abpl.rowid in (select personlink from matched) GROUP BY abpl.rowid) ");
    else
      v11 = CFSTR("SELECT PreferredNamePersonID FROM ABPersonLink abpl WHERE abpl.rowid IN (SELECT personlink FROM matched)) ");
    objc_msgSend(v7, "appendFormat:", v11);
  }
  else
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("SELECT rowid %@ FROM ABPerson where rowid in("), v8);
    if (objc_msgSend(a4, "length"))
      v10 = (const __CFString *)a4;
    else
      v10 = CFSTR("SELECT rowid FROM ABPerson ");
    objc_msgSend(v7, "appendString:", v10);
    objc_msgSend(v7, "appendString:", CFSTR(") "));
    if (-[ABBufferQuery scopedStoreIdentifiers](self, "scopedStoreIdentifiers"))
    {
      objc_msgSend(v7, "appendString:", CFSTR("AND StoreID IN"));
      -[ABBufferQuery appendBindParameterMarkersToQueryString:count:](self, "appendBindParameterMarkersToQueryString:count:", v7, -[NSIndexSet count](-[ABBufferQuery scopedStoreIdentifiers](self, "scopedStoreIdentifiers"), "count"));
    }
  }
  objc_msgSend(v7, "appendString:", CFSTR(") "));
  objc_msgSend(a3, "insertString:atIndex:", v7, 0);
}

- (NSIndexSet)scopedStoreIdentifiers
{
  return self->_scopedStoreIdentifiers;
}

- (void)appendOrderByClauseToQueryString:(id)a3
{
  const __CFString *v5;

  objc_msgSend(a3, "appendString:", CFSTR(" ORDER BY "));
  if (!-[ABBufferQuery sortOrder](self, "sortOrder"))
  {
    v5 = CFSTR("preferredmatched.FirstSortLanguageIndex, preferredmatched.FirstSortSection, preferredmatched.FirstSort ");
    goto LABEL_5;
  }
  if (-[ABBufferQuery sortOrder](self, "sortOrder") == 1)
  {
    v5 = CFSTR("preferredmatched.LastSortLanguageIndex, preferredmatched.LastSortSection, preferredmatched.LastSort ");
LABEL_5:
    objc_msgSend(a3, "appendString:", v5);
    if (!-[ABBufferQuery fetchLinkedContacts](self, "fetchLinkedContacts"))
    {
LABEL_11:
      objc_msgSend(a3, "appendFormat:", CFSTR(", "));
      goto LABEL_12;
    }
    objc_msgSend(a3, "appendFormat:", CFSTR(", "));
LABEL_10:
    objc_msgSend(a3, "appendString:", CFSTR("abp.PersonLink "));
    goto LABEL_11;
  }
  if (-[ABBufferQuery sortOrder](self, "sortOrder") != -1)
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ABBufferQuery: unrecognized sorte order: %u"), -[ABBufferQuery sortOrder](self, "sortOrder")), 0);
  if (-[ABBufferQuery fetchLinkedContacts](self, "fetchLinkedContacts"))
    goto LABEL_10;
LABEL_12:
  objc_msgSend(a3, "appendString:", CFSTR("abp.ROWID "));
  if (-[ABBufferQuery needsMultivalueTable](self, "needsMultivalueTable"))
    objc_msgSend(a3, "appendString:", CFSTR(", abmv.property, abmv.UID "));
}

- (unsigned)sortOrder
{
  return self->_sortOrder;
}

- (BOOL)fetchLinkedContacts
{
  return self->_fetchLinkedContacts;
}

- (void)appendFromClauseToQueryString:(id)a3
{
  const __CFString *v5;

  objc_msgSend(a3, "appendString:", CFSTR(" FROM preferredmatched "));
  if (-[ABBufferQuery fetchLinkedContacts](self, "fetchLinkedContacts"))
  {
    objc_msgSend(a3, "appendString:", CFSTR(" LEFT JOIN ABPerson abp2 on (abp2.rowid = preferredmatched.rowid) "));
    v5 = CFSTR(" JOIN ABPerson abp on (abp2.personlink != -1 and abp2.personlink = abp.personlink) OR (abp.rowid = abp2.rowid) ");
  }
  else
  {
    v5 = CFSTR(" JOIN ABPerson abp on (abp.rowid = preferredmatched.rowid) ");
  }
  objc_msgSend(a3, "appendString:", v5);
  if (-[ABBufferQuery needsPersonLinkTable](self, "needsPersonLinkTable"))
    objc_msgSend(a3, "appendString:", CFSTR(" LEFT JOIN ABPersonLink abplink on abp.PersonLink = abplink.ROWID "));
  if (-[ABBufferQuery needsMultivalueTable](self, "needsMultivalueTable"))
  {
    objc_msgSend(a3, "appendString:", CFSTR(" LEFT JOIN ABMultivalue abmv ON abp.ROWID = abmv.record_id  AND +abmv.property IN "));
    -[ABBufferQuery appendBindParameterMarkersToQueryString:count:](self, "appendBindParameterMarkersToQueryString:count:", a3, -[NSIndexSet count](-[ABBufferQuery requestedMultivalueIdentifiers](self, "requestedMultivalueIdentifiers"), "count"));
    objc_msgSend(a3, "appendString:", CFSTR(" LEFT JOIN ABMultivalueLabel abmvlabel on abmv.label = abmvlabel.ROWID "));
    if (-[ABBufferQuery needsMultivalueEntryTable](self, "needsMultivalueEntryTable"))
      objc_msgSend(a3, "appendString:", CFSTR(" LEFT JOIN ABMultiValueEntry abmve on abmve.parent_id = abmv.UID LEFT JOIN ABMultiValueEntryKey abmvekey on abmve.key = abmvekey.rowid "));
  }
}

- (BOOL)needsMultivalueTable
{
  return self->_needsMultivalueTable;
}

- (BOOL)needsMultivalueEntryTable
{
  return self->_needsMultivalueEntryTable;
}

- (BOOL)needsPersonLinkTable
{
  return self->_needsPersonLinkTable;
}

- (void)appendCustomPropertySelectsToQueryString:(id)a3
{
  NSIndexSet *v5;
  NSIndexSet *v6;

  v5 = -[ABBufferQuery requestedPropertyIdentifiers](self, "requestedPropertyIdentifiers");
  if (-[NSIndexSet containsIndex:](v5, "containsIndex:", kABCPersonLinkUUIDProperty))
    objc_msgSend(a3, "appendString:", CFSTR(", abplink.guid"));
  v6 = -[ABBufferQuery requestedPropertyIdentifiers](self, "requestedPropertyIdentifiers");
  if (-[NSIndexSet containsIndex:](v6, "containsIndex:", kABCPersonIsPreferredImageProperty))
    objc_msgSend(a3, "appendString:", CFSTR(", (abplink.PreferredImagePersonID = abp.rowid)"));
  if (-[NSIndexSet count](-[ABBufferQuery requestedMultivalueIdentifiers](self, "requestedMultivalueIdentifiers"), "count"))
  {
    objc_msgSend(a3, "appendString:", CFSTR(", abmv.property, abmv.identifier, abmv.guid, abmv.value, abmvlabel.value"));
    if (-[ABBufferQuery needsMultivalueEntryTable](self, "needsMultivalueEntryTable"))
      objc_msgSend(a3, "appendString:", CFSTR(", abmvekey.value, abmve.value"));
  }
}

- (void)appendBindParameterMarkersToQueryString:(id)a3 count:(unint64_t)a4
{
  uint64_t v6;
  const __CFString *v7;

  objc_msgSend(a3, "appendString:", CFSTR(" ("));
  if (a4)
  {
    v6 = 0;
    do
    {
      if (v6)
        v7 = CFSTR(", ?");
      else
        v7 = CFSTR(" ?");
      objc_msgSend(a3, "appendString:", v7);
      ++v6;
    }
    while (a4 != v6);
  }
  objc_msgSend(a3, "appendString:", CFSTR(")"));
}

- (void)addressBook
{
  return self->_addressBook;
}

- (void)dealloc
{
  __CFDictionary *propertyIndices;
  void *addressBook;
  objc_super v5;

  propertyIndices = self->_propertyIndices;
  if (propertyIndices)
    CFRelease(propertyIndices);
  if (self->_statement)
    CPSqliteStatementReset();
  addressBook = self->_addressBook;
  if (addressBook)
    CFRelease(addressBook);
  v5.receiver = self;
  v5.super_class = (Class)ABBufferQuery;
  -[ABBufferQuery dealloc](&v5, sel_dealloc);
}

- (ABBufferQuery)initWithAddressBook:(void *)a3 predicate:(id)a4 requestedProperties:(__CFSet *)a5 includeLinkedContacts:(BOOL)a6 sortOrder:(unsigned int)a7 managedConfiguration:(id)a8 identifierAuditStyle:(int64_t)a9 authorizationContext:(id)a10
{
  _BOOL8 v12;
  ABBufferQuery *v16;
  __CFSet *MutableCopy;
  const __CFSet *v18;
  id v19;
  id v20;
  _BOOL8 v21;
  uint64_t PersonRecordDescriptorForPrefetchQueries;
  char *v23;
  char *v24;
  unsigned int *v25;
  int v26;
  BOOL v27;
  BOOL v28;
  unsigned int v29;
  const void *ColumnListWithAliasAndExtraColumns;
  uint64_t v31;
  CPSqliteStatement *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  NSIndexSet *requestedMultivalueIdentifiers;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  id v41;
  _QWORD v42[5];
  _QWORD v43[6];
  _QWORD v44[6];
  _QWORD v45[6];
  _QWORD v46[6];
  __CFDictionary *v47;
  _QWORD v48[3];
  int v49;
  objc_super v50;

  v12 = a6;
  v50.receiver = self;
  v50.super_class = (Class)ABBufferQuery;
  v16 = -[ABBufferQuery init](&v50, sel_init);
  if (v16)
  {
    if (a3 && (CPRecordStoreGetDatabase(), CPSqliteDatabaseConnectionForWriting()))
    {
      v16->_contactidentifierAuditMode = a9;
      v16->_managedConfiguration = (CNManagedConfiguration *)a8;
      v16->_predicate = (ABSQLPredicate *)a4;
      MutableCopy = CFSetCreateMutableCopy(0, 0, a5);
      v18 = MutableCopy;
      if (v12)
        CFSetAddValue(MutableCopy, (const void *)kABPersonLinkProperty);
      v48[0] = 0;
      v48[1] = v48;
      v48[2] = 0x2020000000;
      v49 = 1;
      v16->_sortOrder = a7;
      CFRetain(a3);
      v16->_addressBook = a3;
      v19 = -[ABBufferQuery limitedAccessBundleIdentifierForAuthorizationContext:](v16, "limitedAccessBundleIdentifierForAuthorizationContext:", a10);
      v20 = v19;
      if (v19)
        v21 = objc_msgSend(v19, "length") != 0;
      else
        v21 = 0;
      -[ABBufferQuery _initSetupPropertySet:includeLinkedContacts:hasLimitedAccess:](v16, "_initSetupPropertySet:includeLinkedContacts:hasLimitedAccess:", v18, v12, v21);
      v41 = v20;
      v16->_scopedStoreIdentifiers = (NSIndexSet *)-[ABBufferQuery scopedStoresForManagedConfiguration:](v16, "scopedStoresForManagedConfiguration:", a8);
      PersonRecordDescriptorForPrefetchQueries = ABCAddressBookGetPersonRecordDescriptorForPrefetchQueries((uint64_t)a3);
      v47 = 0;
      v23 = (char *)*(int *)(PersonRecordDescriptorForPrefetchQueries + 72);
      if ((_DWORD)v23)
      {
        v24 = 0;
        v25 = (unsigned int *)(*(_QWORD *)(PersonRecordDescriptorForPrefetchQueries + 80) + 24);
        do
        {
          v26 = *(v25 - 4);
          if (v25[2] == 5)
          {
            if (!v26)
              *(v25 - 4) = 2;
          }
          else if (!v26)
          {
            goto LABEL_25;
          }
          if (!CFSetContainsValue(v18, v24)
            || (v24 != (char *)kABCPersonWallpaperProperty
              ? (v27 = v24 == (char *)kABCPersonWatchWallpaperImageDataProperty)
              : (v27 = 1),
                !v27 ? (v28 = v24 == (char *)kABCPersonWallpaperMetadataProperty) : (v28 = 1),
                v28))
          {
LABEL_25:
            v29 = *v25 | 1;
            goto LABEL_26;
          }
          v29 = *v25 & 0xFFFFFFFE;
LABEL_26:
          *v25 = v29;
          v25 += 10;
          ++v24;
        }
        while (v23 != v24);
      }
      ColumnListWithAliasAndExtraColumns = (const void *)CPRecordStoreCreateColumnListWithAliasAndExtraColumns();
      v16->_propertyIndices = v47;
      -[ABBufferQuery prependWithClauseToQueryString:whereClause:](v16, "prependWithClauseToQueryString:whereClause:", ColumnListWithAliasAndExtraColumns, objc_msgSend(a4, "query"));
      -[ABBufferQuery appendCustomPropertySelectsToQueryString:](v16, "appendCustomPropertySelectsToQueryString:", ColumnListWithAliasAndExtraColumns);
      -[ABBufferQuery appendFromClauseToQueryString:](v16, "appendFromClauseToQueryString:", ColumnListWithAliasAndExtraColumns);
      if (v21)
        +[ABLimitedAccess appendLimitedAccessLeftJoinToQueryString:](ABLimitedAccess, "appendLimitedAccessLeftJoinToQueryString:", ColumnListWithAliasAndExtraColumns);
      -[ABBufferQuery appendWhereClauseToQueryString:](v16, "appendWhereClauseToQueryString:", ColumnListWithAliasAndExtraColumns);
      -[ABBufferQuery appendOrderByClauseToQueryString:](v16, "appendOrderByClauseToQueryString:", ColumnListWithAliasAndExtraColumns);
      v31 = CPSqliteConnectionStatementForSQL();
      v32 = (CPSqliteStatement *)v31;
      if (v31)
      {
        if (*(_QWORD *)(v31 + 8))
        {
          ABRegulatoryLogReadContactsData((uint64_t)a3);
          v16->_statement = v32;
          v33 = (void *)objc_opt_new();
          v34 = MEMORY[0x1E0C809B0];
          v46[0] = MEMORY[0x1E0C809B0];
          v46[1] = 3221225472;
          v46[2] = __162__ABBufferQuery_initWithAddressBook_predicate_requestedProperties_includeLinkedContacts_sortOrder_managedConfiguration_identifierAuditStyle_authorizationContext___block_invoke;
          v46[3] = &unk_1E3CA4588;
          v46[4] = v48;
          v46[5] = v32;
          objc_msgSend(v33, "setIntBinder:", v46);
          v45[0] = v34;
          v45[1] = 3221225472;
          v45[2] = __162__ABBufferQuery_initWithAddressBook_predicate_requestedProperties_includeLinkedContacts_sortOrder_managedConfiguration_identifierAuditStyle_authorizationContext___block_invoke_2;
          v45[3] = &unk_1E3CA45B0;
          v45[4] = v48;
          v45[5] = v32;
          objc_msgSend(v33, "setStringBinder:", v45);
          v44[0] = v34;
          v44[1] = 3221225472;
          v44[2] = __162__ABBufferQuery_initWithAddressBook_predicate_requestedProperties_includeLinkedContacts_sortOrder_managedConfiguration_identifierAuditStyle_authorizationContext___block_invoke_3;
          v44[3] = &unk_1E3CA45D8;
          v44[4] = v48;
          v44[5] = v32;
          objc_msgSend(v33, "setBlobBinder:", v44);
          v43[0] = v34;
          v43[1] = 3221225472;
          v43[2] = __162__ABBufferQuery_initWithAddressBook_predicate_requestedProperties_includeLinkedContacts_sortOrder_managedConfiguration_identifierAuditStyle_authorizationContext___block_invoke_4;
          v43[3] = &unk_1E3CA4600;
          v43[4] = v48;
          v43[5] = v32;
          objc_msgSend(v33, "setPointerBinder:", v43);
          if (objc_msgSend(a4, "bindBlock"))
          {
            v35 = objc_msgSend(a4, "bindBlock");
            (*(void (**)(uint64_t, void *))(v35 + 16))(v35, v33);
          }
          -[ABBufferQuery bindWithClause:](v16, "bindWithClause:", v33);
          requestedMultivalueIdentifiers = v16->_requestedMultivalueIdentifiers;
          v42[0] = v34;
          v42[1] = 3221225472;
          v42[2] = __162__ABBufferQuery_initWithAddressBook_predicate_requestedProperties_includeLinkedContacts_sortOrder_managedConfiguration_identifierAuditStyle_authorizationContext___block_invoke_5;
          v42[3] = &unk_1E3CA4378;
          v42[4] = v33;
          -[NSIndexSet enumerateIndexesUsingBlock:](requestedMultivalueIdentifiers, "enumerateIndexesUsingBlock:", v42);
          if (v21)
          {
            v37 = objc_msgSend(v33, "stringBinder");
            (*(void (**)(uint64_t, id))(v37 + 16))(v37, v41);
          }
          -[ABBufferQuery bindWhereClause:](v16, "bindWhereClause:", v33);

        }
      }
      else
      {
        v38 = ABOSLogGeneral();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          -[ABBufferQuery initWithAddressBook:predicate:requestedProperties:includeLinkedContacts:sortOrder:managedConfiguration:identifierAuditStyle:authorizationContext:].cold.1((uint64_t)ColumnListWithAliasAndExtraColumns, v38, v39);
      }
      CFRelease(ColumnListWithAliasAndExtraColumns);
      CFRelease(v18);
      _Block_object_dispose(v48, 8);
    }
    else
    {

      return 0;
    }
  }
  return v16;
}

uint64_t __162__ABBufferQuery_initWithAddressBook_predicate_requestedProperties_includeLinkedContacts_sortOrder_managedConfiguration_identifierAuditStyle_authorizationContext___block_invoke(uint64_t a1, int a2)
{
  uint64_t result;

  result = sqlite3_bind_int(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 40) + 8), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), a2);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __162__ABBufferQuery_initWithAddressBook_predicate_requestedProperties_includeLinkedContacts_sortOrder_managedConfiguration_identifierAuditStyle_authorizationContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  sqlite3_stmt *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  uint64_t result;

  v3 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(_DWORD *)(v4 + 24);
  if (a2)
  {
    v6 = (const char *)_CPCreateUTF8StringFromCFString();
    result = sqlite3_bind_text(v3, v5, v6, -1, (void (__cdecl *)(void *))MEMORY[0x1E0C834A8]);
  }
  else
  {
    result = sqlite3_bind_null(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 40) + 8), *(_DWORD *)(v4 + 24));
  }
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __162__ABBufferQuery_initWithAddressBook_predicate_requestedProperties_includeLinkedContacts_sortOrder_managedConfiguration_identifierAuditStyle_authorizationContext___block_invoke_3(uint64_t a1, void *a2, int n)
{
  uint64_t result;

  result = sqlite3_bind_blob(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 40) + 8), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), a2, n, 0);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __162__ABBufferQuery_initWithAddressBook_predicate_requestedProperties_includeLinkedContacts_sortOrder_managedConfiguration_identifierAuditStyle_authorizationContext___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  v4 = a2;
  result = sqlite3_bind_blob(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 40) + 8), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), &v4, 8, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __162__ABBufferQuery_initWithAddressBook_predicate_requestedProperties_includeLinkedContacts_sortOrder_managedConfiguration_identifierAuditStyle_authorizationContext___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = objc_msgSend(*(id *)(a1 + 32), "intBinder");
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

- (void)_initSetupPropertySet:(__CFSet *)a3 includeLinkedContacts:(BOOL)a4 hasLimitedAccess:(BOOL)a5
{
  _BOOL4 v5;
  CFIndex Count;
  const void **v10;
  NSIndexSet *v11;
  NSIndexSet *i;
  ABPropertyType TypeOfProperty;
  char v14;
  _QWORD v15[2];

  v5 = a5;
  v15[1] = *MEMORY[0x1E0C80C00];
  Count = CFSetGetCount(a3);
  v10 = (const void **)((char *)v15 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
  CFSetGetValues(a3, v10);
  v11 = (NSIndexSet *)objc_opt_new();
  for (i = (NSIndexSet *)objc_opt_new(); Count; --Count)
  {
    -[NSIndexSet addIndex:](v11, "addIndex:", *v10);
    TypeOfProperty = ABPersonGetTypeOfProperty(*(_DWORD *)v10);
    if ((TypeOfProperty & 0x100) != 0)
    {
      -[NSIndexSet addIndex:](i, "addIndex:", *v10);
      self->_needsMultivalueTable = 1;
    }
    if (TypeOfProperty == 261)
      self->_needsMultivalueEntryTable = 1;
    ++v10;
  }
  if (v5)
    -[NSIndexSet addIndex:](v11, "addIndex:", kABCPersonLinkUUIDProperty);
  if (-[NSIndexSet containsIndex:](v11, "containsIndex:", kABCPersonLinkUUIDProperty))
    v14 = 1;
  else
    v14 = -[NSIndexSet containsIndex:](v11, "containsIndex:", kABCPersonIsPreferredImageProperty);
  self->_needsPersonLinkTable = v14;
  self->_requestedImageData = -[NSIndexSet containsIndex:](v11, "containsIndex:", kABCPersonImageDataProperty);
  self->_requestedImageCropRect = -[NSIndexSet containsIndex:](v11, "containsIndex:", kABCPersonImageCropRectProperty);
  self->_requestedImageThumbnail = -[NSIndexSet containsIndex:](v11, "containsIndex:", kABCPersonThumbnailDataProperty);
  self->_requestedImageFullscreenData = -[NSIndexSet containsIndex:](v11, "containsIndex:", kABCPersonFullscreenImageDataProperty);
  self->_requestedSyncImageData = -[NSIndexSet containsIndex:](v11, "containsIndex:", kABCPersonSyncImageDataProperty);
  self->_requestedHasImageData = -[NSIndexSet containsIndex:](v11, "containsIndex:", kABCPersonHasImageDataProperty);
  self->_requestedWallpaperData = -[NSIndexSet containsIndex:](v11, "containsIndex:", kABCPersonWallpaperProperty);
  self->_requestedWatchWallpaperImageData = -[NSIndexSet containsIndex:](v11, "containsIndex:", kABCPersonWatchWallpaperImageDataProperty);
  self->_requestedWallpaperMetadata = -[NSIndexSet containsIndex:](v11, "containsIndex:", kABCPersonWallpaperMetadataProperty);
  self->_fetchLinkedContacts = a4;
  self->_requestedPropertyIdentifiers = v11;
  self->_requestedMultivalueIdentifiers = i;
}

- (void)setPropertyIndices:(__CFDictionary *)a3
{
  __CFDictionary *propertyIndices;

  propertyIndices = self->_propertyIndices;
  if (propertyIndices != a3)
  {
    if (propertyIndices)
      CFRelease(propertyIndices);
    if (a3)
      CFRelease(a3);
    self->_propertyIndices = a3;
  }
}

uint64_t __32__ABBufferQuery_bindWithClause___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = objc_msgSend(*(id *)(a1 + 32), "intBinder");
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

- (id)limitedAccessBundleIdentifierForAuthorizationContext:(id)a3
{
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!+[ABLimitedAccess isLimitedAccessFF_Enabled](ABLimitedAccess, "isLimitedAccessFF_Enabled")
    || !objc_msgSend(a3, "isLimitedAccessGranted"))
  {
    return 0;
  }
  v4 = (void *)objc_msgSend(a3, "clientBundleIdentifier");
  v5 = ABOSLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_19BC4B000, v5, OS_LOG_TYPE_DEFAULT, "ABBufferQuery limited access for bundleIdentifier: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return v4;
}

uint64_t __33__ABBufferQuery_bindWhereClause___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = objc_msgSend(*(id *)(a1 + 32), "intBinder");
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

- (void)setAddressBook:(void *)a3
{
  self->_addressBook = a3;
}

- (CNManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setContactidentifierAuditMode:(int64_t)a3
{
  self->_contactidentifierAuditMode = a3;
}

- (void)setPredicate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setSortOrder:(unsigned int)a3
{
  self->_sortOrder = a3;
}

- (void)setFetchLinkedContacts:(BOOL)a3
{
  self->_fetchLinkedContacts = a3;
}

- (BOOL)needsPersonTable
{
  return self->_needsPersonTable;
}

- (void)initWithAddressBook:(uint64_t)a3 predicate:requestedProperties:includeLinkedContacts:sortOrder:managedConfiguration:identifierAuditStyle:authorizationContext:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_2(&dword_19BC4B000, a2, a3, "error in SQL preparation of statement: %@", (uint8_t *)&v3);
}

@end
