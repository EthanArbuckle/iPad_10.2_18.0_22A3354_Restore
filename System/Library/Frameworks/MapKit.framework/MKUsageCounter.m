@implementation MKUsageCounter

- (void)countUsageOfTypeIfNeeded:(unint64_t)a3
{
  id v5;

  -[MKUsageCounter createCountedEventsSetIfNeeded](self, "createCountedEventsSetIfNeeded");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableSet containsObject:](self->_countedEventsSet, "containsObject:") & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_countedEventsSet, "addObject:", v5);
    -[MKUsageCounter count:](self, "count:", a3);
  }

}

- (void)createCountedEventsSetIfNeeded
{
  NSMutableSet *v3;
  NSMutableSet *countedEventsSet;

  if (!self->_countedEventsSet)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    countedEventsSet = self->_countedEventsSet;
    self->_countedEventsSet = v3;

  }
}

- (void)count:(unint64_t)a3
{
  id v3;
  void *v4;

  GEOApplicationIdentifierOrProcessName();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  AnalyticsSendEventLazy();

}

+ (id)sharedCounter
{
  if (_MergedGlobals_149 != -1)
    dispatch_once(&_MergedGlobals_149, &__block_literal_global_52);
  return (id)qword_1ECE2DA48;
}

id __24__MKUsageCounter_count___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fieldNameForType:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("mktype"));

  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("bundleID"));
  return v2;
}

- (id)fieldNameForType:(unint64_t)a3
{
  if (a3 > 0x39)
    return CFSTR("nil");
  else
    return off_1E20DAF00[a3];
}

void __31__MKUsageCounter_sharedCounter__block_invoke()
{
  MKUsageCounter *v0;
  void *v1;

  v0 = objc_alloc_init(MKUsageCounter);
  v1 = (void *)qword_1ECE2DA48;
  qword_1ECE2DA48 = (uint64_t)v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countedEventsSet, 0);
}

@end
