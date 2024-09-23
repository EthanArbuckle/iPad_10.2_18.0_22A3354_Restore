@implementation _PFBatchHistoryFaultingArray

- (_PFBatchHistoryFaultingArray)initWithPFBatchFaultingArray:(id)a3
{
  return -[_PFBatchFaultingArray initWithPFArray:andRequest:andContext:](self, "initWithPFArray:andRequest:andContext:", *((_QWORD *)a3 + 2), *((_QWORD *)a3 + 5), *((_QWORD *)a3 + 4));
}

- (void)_setTransaction:(id)a3
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->super._moc, a2);
  self->_transaction = (NSPersistentHistoryTransaction *)a3;
}

- (id)transaction
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->super._moc, a2);
  return self->_transaction;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

@end
