@implementation COTimerReadResponse

- (COTimerReadResponse)init
{
  COTimerReadResponse *v2;
  NSArray *v3;
  NSArray *timers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)COTimerReadResponse;
  v2 = -[COMeshCommand init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    timers = v2->_timers;
    v2->_timers = v3;

  }
  return v2;
}

- (COTimerReadResponse)initWithTimers:(id)a3
{
  id v4;
  COTimerReadResponse *v5;
  uint64_t v6;
  NSArray *timers;

  v4 = a3;
  v5 = -[COTimerReadResponse init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    timers = v5->_timers;
    v5->_timers = (NSArray *)v6;

  }
  return v5;
}

- (COTimerReadResponse)initWithFilteredTimers:(id)a3
{
  COTimerReadResponse *result;

  result = -[COTimerReadResponse initWithTimers:](self, "initWithTimers:", a3);
  if (result)
    result->_filtered = 1;
  return result;
}

- (COTimerReadResponse)initWithTimers:(id)a3 deletes:(id)a4
{
  id v6;
  COTimerReadResponse *v7;
  uint64_t v8;
  NSArray *deletes;

  v6 = a4;
  v7 = -[COTimerReadResponse initWithTimers:](self, "initWithTimers:", a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    deletes = v7->_deletes;
    v7->_deletes = (NSArray *)v8;

  }
  return v7;
}

- (id)initNotModifiedWithDeletes:(id)a3
{
  id result;

  result = -[COTimerReadResponse initWithTimers:deletes:](self, "initWithTimers:deletes:", MEMORY[0x24BDBD1A8], a3);
  if (result)
    *((_BYTE *)result + 18) = 1;
  return result;
}

- (COTimerReadResponse)initWithSkipInMerge
{
  COTimerReadResponse *v2;
  COTimerReadResponse *v3;
  NSArray *timers;

  v2 = -[COTimerReadResponse init](self, "init");
  v3 = v2;
  if (v2)
  {
    timers = v2->_timers;
    v2->_timers = (NSArray *)MEMORY[0x24BDBD1A8];

    v3->_skipInMerge = 1;
  }
  return v3;
}

- (COTimerReadResponse)initWithCoder:(id)a3
{
  id v4;
  COTimerReadResponse *v5;
  COTimerReadResponse *v6;
  uint64_t v7;
  NSArray *deletes;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *timers;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  COTimerReadResponse *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)COTimerReadResponse;
  v5 = -[COMeshResponse initWithCoder:](&v25, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = v5;
    v5->_filtered = objc_msgSend(v4, "containsValueForKey:", CFSTR("filtered"));
    v6->_notModified = objc_msgSend(v4, "containsValueForKey:", CFSTR("unmodified"));
    v6->_skipInMerge = objc_msgSend(v4, "containsValueForKey:", CFSTR("skip"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("deletes")))
    {
      objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("deletes"));
      v7 = objc_claimAutoreleasedReturnValue();
      deletes = v6->_deletes;
      v6->_deletes = (NSArray *)v7;

    }
    v9 = (void *)MEMORY[0x24BDBCF20];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("timers"));
    v12 = objc_claimAutoreleasedReturnValue();
    timers = v6->_timers;
    v6->_timers = (NSArray *)v12;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v14 = v6->_timers;
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v22;
        while (2)
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v22 != v17)
              objc_enumerationMutation(v14);
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v19 = 0;
              goto LABEL_17;
            }
            ++v18;
          }
          while (v16 != v18);
          v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          if (v16)
            continue;
          break;
        }
      }
      v19 = v6;
    }
    else
    {
      v19 = 0;
      v14 = (NSArray *)v6;
    }
LABEL_17:

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)COTimerReadResponse;
  -[COMeshResponse encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[COTimerReadResponse timers](self, "timers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("timers"));

  if (-[COTimerReadResponse isFiltered](self, "isFiltered"))
    objc_msgSend(v4, "encodeObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("filtered"));
  -[COTimerReadResponse deletes](self, "deletes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("deletes"));
  if (-[COTimerReadResponse skipInMerge](self, "skipInMerge"))
    objc_msgSend(v4, "encodeObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("skip"));
  if (-[COTimerReadResponse notModified](self, "notModified"))
    objc_msgSend(v4, "encodeObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("unmodified"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)timers
{
  return self->_timers;
}

- (BOOL)isFiltered
{
  return self->_filtered;
}

- (NSArray)deletes
{
  return self->_deletes;
}

- (BOOL)skipInMerge
{
  return self->_skipInMerge;
}

- (BOOL)notModified
{
  return self->_notModified;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletes, 0);
  objc_storeStrong((id *)&self->_timers, 0);
}

@end
