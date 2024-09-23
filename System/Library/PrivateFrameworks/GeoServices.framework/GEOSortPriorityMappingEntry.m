@implementation GEOSortPriorityMappingEntry

- (GEOSortPriorityMappingEntry)init
{
  GEOSortPriorityMappingEntry *result;

  result = (GEOSortPriorityMappingEntry *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOSortPriorityMappingEntry)initWithPriority:(int64_t)a3 resultType:(int64_t)a4 resultSubtype:(int64_t)a5
{
  GEOSortPriorityMappingEntry *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GEOSortPriorityMappingEntry;
  result = -[GEOSortPriorityMappingEntry init](&v9, sel_init);
  if (result)
  {
    result->_priority = a3;
    result->_resultType = a4;
    result->_resultSubtype = a5;
  }
  return result;
}

- (int64_t)priority
{
  return self->_priority;
}

- (int64_t)resultType
{
  return self->_resultType;
}

- (int64_t)resultSubtype
{
  return self->_resultSubtype;
}

@end
