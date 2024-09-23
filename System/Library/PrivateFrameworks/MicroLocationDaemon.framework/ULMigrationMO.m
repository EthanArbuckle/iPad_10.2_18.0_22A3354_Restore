@implementation ULMigrationMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("ULMigrationMO"));
}

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  id v5;
  ULMigrationMO *v6;

  v5 = a4;
  v6 = -[ULMigrationMO initWithContext:]([ULMigrationMO alloc], "initWithContext:", v5);
  -[ULMigrationMO setTimestamp:](v6, "setTimestamp:", *(double *)a3);
  -[ULMigrationMO setState:](v6, "setState:", *((unsigned int *)a3 + 2));

  return v6;
}

- (optional<CLMicroLocationMigrationTable::Entry>)convertToEntry
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  optional<CLMicroLocationMigrationTable::Entry> result;

  v3 = v1;
  -[ULMigrationMO timestamp](self, "timestamp");
  v8 = v4;
  v5 = CLMicroLocationMigrationTable::Entry::Entry((uint64_t)&v7, -[ULMigrationMO state](self, "state"), &v8);
  *(_OWORD *)v3 = v7;
  *(_BYTE *)(v3 + 16) = 1;
  *((_QWORD *)&result.var0.var2 + 1) = v6;
  *(_QWORD *)&result.var0.var0 = v5;
  return result;
}

@end
