@implementation PFCloudKitExporterOptions

- (PFCloudKitExporterOptions)initWithDatabase:(id)a3 options:(id)a4
{
  char *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PFCloudKitExporterOptions;
  v6 = -[PFCloudKitExporterOptions init](&v8, sel_init);
  if (v6)
  {
    *((_QWORD *)v6 + 1) = a3;
    *((_QWORD *)v6 + 2) = a4;
    *(_OWORD *)(v6 + 24) = xmmword_18A50A8A0;
  }
  return (PFCloudKitExporterOptions *)v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_database = 0;
  self->_mirroringDelegateOptions = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitExporterOptions;
  -[PFCloudKitExporterOptions dealloc](&v3, sel_dealloc);
}

- (id)copy
{
  id result;

  result = -[PFCloudKitExporterOptions initWithDatabase:options:]([PFCloudKitExporterOptions alloc], "initWithDatabase:options:", self->_database, self->_mirroringDelegateOptions);
  if (result)
  {
    *((_QWORD *)result + 4) = self->_perOperationObjectThreshold;
    *((_QWORD *)result + 3) = self->_perOperationBytesThreshold;
  }
  return result;
}

@end
