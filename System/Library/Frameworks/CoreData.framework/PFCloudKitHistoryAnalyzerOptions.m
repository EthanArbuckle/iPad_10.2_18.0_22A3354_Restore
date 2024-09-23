@implementation PFCloudKitHistoryAnalyzerOptions

- (void)dealloc
{
  objc_super v3;

  self->_request = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitHistoryAnalyzerOptions;
  -[PFCloudKitHistoryAnalyzerOptions dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFCloudKitHistoryAnalyzerOptions;
  v4 = -[PFHistoryAnalyzerOptions copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[25] = *(&self->_includePrivateTransactions + 1);
  *((_QWORD *)v4 + 4) = self->_request;
  return v4;
}

@end
