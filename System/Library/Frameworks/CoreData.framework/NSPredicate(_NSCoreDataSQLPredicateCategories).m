@implementation NSPredicate(_NSCoreDataSQLPredicateCategories)

- (uint64_t)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories
{
  uint64_t v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0CB3980], "defaultInstance") == a1
    || objc_msgSend(MEMORY[0x1E0CB35F0], "defaultInstance") == a1)
  {
    return objc_msgSend(MEMORY[0x1E0C99E20], "set");
  }
  if (a3)
  {
    v5 = *MEMORY[0x1E0CB28A8];
    v7 = CFSTR("expression");
    v8[0] = a1;
    *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v5, 134097, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
  }
  return 0;
}

@end
