@implementation ULHomeSlamAnalyticEventMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("ULHomeSlamAnalyticEventMO"));
}

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  id v5;
  ULHomeSlamAnalyticEventMO *v6;

  v5 = a4;
  v6 = -[ULHomeSlamAnalyticEventMO initWithContext:]([ULHomeSlamAnalyticEventMO alloc], "initWithContext:", v5);
  -[ULHomeSlamAnalyticEventMO setEvent:](v6, "setEvent:", *((__int16 *)a3 + 4));
  -[ULHomeSlamAnalyticEventMO setTimestamp:](v6, "setTimestamp:", *(double *)a3);

  return v6;
}

- (optional<CLMiLoHomeSlamAnalyticEventTable::Entry>)convertToEntry
{
  uint64_t v1;
  uint64_t v3;
  __int16 v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  optional<CLMiLoHomeSlamAnalyticEventTable::Entry> result;

  v3 = v1;
  v4 = -[ULHomeSlamAnalyticEventMO event](self, "event");
  -[ULHomeSlamAnalyticEventMO timestamp](self, "timestamp");
  v6 = CLMiLoHomeSlamAnalyticEventTable::Entry::Entry((uint64_t)&v8, v4, v5);
  *(_OWORD *)v3 = v8;
  *(_BYTE *)(v3 + 16) = 1;
  *((_QWORD *)&result.var0.var2 + 1) = v7;
  *(_QWORD *)&result.var0.var0 = v6;
  return result;
}

@end
