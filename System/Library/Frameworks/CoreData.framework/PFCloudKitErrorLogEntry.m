@implementation PFCloudKitErrorLogEntry

- (PFCloudKitErrorLogEntry)initWithError:(id)a3 annotation:(id)a4
{
  PFCloudKitErrorLogEntry *v6;

  v6 = -[PFCloudKitErrorLogEntry init](self, "init");
  if (v6)
  {
    v6->_annotation = (NSString *)a4;
    v6->_error = (NSError *)a3;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_annotation = 0;
  self->_error = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitErrorLogEntry;
  -[PFCloudKitErrorLogEntry dealloc](&v3, sel_dealloc);
}

@end
