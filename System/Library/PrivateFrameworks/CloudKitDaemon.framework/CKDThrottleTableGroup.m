@implementation CKDThrottleTableGroup

+ (id)groupName
{
  return (id)objc_msgSend_groupNameWithDomain_domainIdentifier_groupName_(MEMORY[0x1E0C950F0], a2, 0, 0, CFSTR("Throttle"));
}

+ (BOOL)rebootShouldClearData
{
  return 1;
}

- (id)createTables:(id *)a3
{
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C951F0]);
  v5 = (void *)objc_msgSend_initWithLogicalTableName_(v3, v4, (uint64_t)CFSTR("Throttle"));
  v9[0] = v5;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
