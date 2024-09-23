@implementation _HDStaticSyncSession

- (id)newChangeWithSyncEntityClass:(Class)a3 version:(id)a4
{
  +[HDCodableNanoSyncChange changeWithNanoSyncEntityClass:version:](HDCodableNanoSyncChange, "changeWithNanoSyncEntityClass:version:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)maxEncodedBytesPerCodableChangeForSyncEntityClass:(Class)a3
{
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
    return 0x20000;
  else
    return -[_HDStaticSyncSession maxEncodedBytesPerChangeSetForSyncEntityClass:](self, "maxEncodedBytesPerChangeSetForSyncEntityClass:", a3);
}

- (int64_t)maxEncodedBytesPerChangeSetForSyncEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3)
    return 3145728;
  else
    return 0x80000;
}

@end
