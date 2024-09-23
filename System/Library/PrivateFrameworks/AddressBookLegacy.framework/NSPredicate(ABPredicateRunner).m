@implementation NSPredicate(ABPredicateRunner)

- (void)ab_runPredicateWithSortOrder:()ABPredicateRunner ranked:inAddressBook:withDelegate:
{
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const void *v14;
  int v15;
  CFDictionaryRef theDict[6];
  __int128 v17;
  __int128 v18;

  theDict[1] = a6;
  theDict[2] = a1;
  theDict[4] = 0;
  theDict[5] = 0;
  theDict[3] = a5;
  if (a5 && *((_QWORD *)a5 + 2))
  {
    v17 = 0u;
    v18 = 0u;
    *(_QWORD *)&v18 = ABCRecordStoreReadColumns();
    if (-[__CFDictionary predicateShouldContinue:](a6, "predicateShouldContinue:", a1))
    {
      CPRecordStoreGetDatabase();
      v11 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      if (-[__CFDictionary ab_hasCallback](a1, "ab_hasCallback"))
        CPSqliteDatabaseRegisterFunction();
      theDict[0] = 0;
      v12 = (void *)-[__CFDictionary ab_newQueryWithSortOrder:ranked:addressBook:propertyIndices:](a1, "ab_newQueryWithSortOrder:ranked:addressBook:propertyIndices:", a3, a4, a5, theDict);
      *((_QWORD *)&v17 + 1) = CFDictionaryGetCount(theDict[0]) + 1;
      -[__CFDictionary ab_addCallbackContextToArray:](a1, "ab_addCallbackContextToArray:", v11);
      v13 = CPSqliteDatabaseStatementForReading();
      ABRegulatoryLogReadContactsData((uint64_t)a5);
      if (v13)
      {
        v15 = 1;
        -[__CFDictionary ab_bindSelectClauseComponentOfStatement:withBindingOffset:predicateIdentifier:](a1, "ab_bindSelectClauseComponentOfStatement:withBindingOffset:predicateIdentifier:", v13, &v15, 0);
        -[__CFDictionary ab_bindJoinClauseComponentOfStatement:withBindingOffset:predicateIdentifier:](a1, "ab_bindJoinClauseComponentOfStatement:withBindingOffset:predicateIdentifier:", v13, &v15, 0);
        -[__CFDictionary ab_bindWhereClauseComponentOfStatement:withBindingOffset:predicateIdentifier:](a1, "ab_bindWhereClauseComponentOfStatement:withBindingOffset:predicateIdentifier:", v13, &v15, 0);
        if (-[__CFDictionary predicateShouldContinue:](a6, "predicateShouldContinue:", a1))
        {
          CPSqliteConnectionEnableProgressHandlerCallback();
          v14 = (const void *)CPRecordStoreProcessRecordStatementWithPropertyIndices();
          CPSqliteConnectionDisableProgressHandlerCallback();
          if (v14)
            CFRelease(v14);
        }
      }
      if (theDict[0])
        CFRelease(theDict[0]);

    }
    if ((_QWORD)v18)
      free((void *)v18);
  }
}

@end
