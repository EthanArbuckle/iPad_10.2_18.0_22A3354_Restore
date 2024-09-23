@implementation NSSQLiteIndexStatistics

- (NSSQLiteIndexStatistics)initWithName:(id)a3 storeID:(id)a4
{
  NSSQLiteIndexStatistics *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSSQLiteIndexStatistics;
  v6 = -[NSSQLiteIndexStatistics init](&v8, sel_init);
  if (v6)
  {
    v6->_indexName = (NSString *)objc_msgSend(a3, "copy");
    v6->_storeIdentifier = (NSString *)objc_msgSend(a4, "copy");
  }
  return v6;
}

- (NSSQLiteIndexStatistics)initWithResultDictionary:(id)a3 storeID:(id)a4
{
  NSSQLiteIndexStatistics *v5;

  v5 = -[NSSQLiteIndexStatistics initWithName:storeID:](self, "initWithName:storeID:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("indexName")), a4);
  if (v5)
  {
    v5->_executionCount = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("executionCount")), "longLongValue");
    v5->_instructionCount = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("instructionCount")), "longLongValue");
    v5->_rowCount = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rowCount")), "longLongValue");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSSQLiteIndexStatistics;
  -[NSSQLiteIndexStatistics dealloc](&v3, sel_dealloc);
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (NSString)indexName
{
  return self->_indexName;
}

- (int64_t)executionCount
{
  return self->_executionCount;
}

- (int64_t)instructionCount
{
  return self->_instructionCount;
}

- (int64_t)rowCount
{
  return self->_rowCount;
}

@end
