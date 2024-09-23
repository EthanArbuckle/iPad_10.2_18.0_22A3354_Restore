@implementation PFHistoryAnalyzerOptions

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_BYTE *)result + 8) = self->_automaticallyPruneTransientRecords;
  *((_QWORD *)result + 2) = self->_transactionLimit;
  return result;
}

@end
