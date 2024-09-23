@implementation PFCloudKitImporterWorkItem

- (PFCloudKitImporterWorkItem)initWithOptions:(id)a3 request:(id)a4
{
  PFCloudKitImporterWorkItem *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PFCloudKitImporterWorkItem;
  v6 = -[PFCloudKitImporterWorkItem init](&v8, sel_init);
  if (v6)
  {
    v6->_options = (PFCloudKitImporterOptions *)a3;
    v6->_request = (NSCloudKitMirroringImportRequest *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_options = 0;
  self->_request = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitImporterWorkItem;
  -[PFCloudKitImporterWorkItem dealloc](&v3, sel_dealloc);
}

- (void)doWorkForStore:(id)a3 inMonitor:(id)a4 completion:(id)a5
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

@end
