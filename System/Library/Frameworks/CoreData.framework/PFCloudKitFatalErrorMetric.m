@implementation PFCloudKitFatalErrorMetric

- (PFCloudKitFatalErrorMetric)initWithContainerIdentifier:(id)a3 result:(id)a4
{
  PFCloudKitFatalErrorMetric *v5;
  objc_class *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PFCloudKitFatalErrorMetric;
  v5 = -[PFCloudKitUnhandledPartialErrorMetric initWithContainerIdentifier:error:](&v8, sel_initWithContainerIdentifier_error_, a3, objc_msgSend(a4, "error"));
  if (v5)
  {
    objc_msgSend(a4, "request");
    v6 = (objc_class *)objc_opt_class();
    v5->_requestClass = NSStringFromClass(v6);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitFatalErrorMetric;
  -[PFCloudKitUnhandledPartialErrorMetric dealloc](&v3, sel_dealloc);
}

- (id)name
{
  return CFSTR("com.apple.coredata.cloudkit.fatalError");
}

- (id)payload
{
  void *v3;
  NSString *requestClass;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFCloudKitFatalErrorMetric;
  v3 = (void *)objc_msgSend(-[PFCloudKitUnhandledPartialErrorMetric payload](&v6, sel_payload), "mutableCopy");
  requestClass = self->_requestClass;
  if (!requestClass)
    requestClass = (NSString *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  objc_msgSend(v3, "setObject:forKey:", requestClass, CFSTR("requestClass"));
  return v3;
}

@end
