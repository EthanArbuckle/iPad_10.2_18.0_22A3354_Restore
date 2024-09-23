@implementation _NSZeroData

+ (id)data
{
  if (qword_1ECD09540 != -1)
    dispatch_once(&qword_1ECD09540, &__block_literal_global_205);
  return (id)_MergedGlobals_35;
}

- (unint64_t)length
{
  return 0;
}

- (const)bytes
{
  return 0;
}

- (BOOL)_isCompact
{
  return 1;
}

- (unint64_t)retainCount
{
  return -1;
}

- (_NSZeroData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 deallocator:(id)a6
{
  _BOOL8 v7;

  v7 = a5;
  _NSDataReinitializationBreak();
  return (_NSZeroData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:copy:deallocator:", a3, a4, v7, a6);
}

- (id)_dispatchData
{
  return (id)MEMORY[0x1E0C80D00];
}

- (BOOL)_providesConcreteBacking
{
  return 1;
}

@end
