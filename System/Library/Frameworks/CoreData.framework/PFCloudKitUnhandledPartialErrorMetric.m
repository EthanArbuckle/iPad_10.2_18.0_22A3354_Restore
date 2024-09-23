@implementation PFCloudKitUnhandledPartialErrorMetric

- (PFCloudKitUnhandledPartialErrorMetric)initWithContainerIdentifier:(id)a3 error:(id)a4
{
  PFCloudKitUnhandledPartialErrorMetric *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PFCloudKitUnhandledPartialErrorMetric;
  v5 = -[PFCloudKitBaseMetric initWithContainerIdentifier:](&v7, sel_initWithContainerIdentifier_, a3);
  if (v5)
  {
    v5->_errorCode = (NSNumber *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", objc_msgSend(a4, "code"));
    v5->_errorDomain = (NSString *)(id)objc_msgSend(a4, "domain");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitUnhandledPartialErrorMetric;
  -[PFCloudKitBaseMetric dealloc](&v3, sel_dealloc);
}

- (id)name
{
  return CFSTR("com.apple.coredata.cloudkit.unhandledPartialError");
}

- (id)payload
{
  void *v3;
  NSString *errorDomain;
  NSNumber *errorCode;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PFCloudKitUnhandledPartialErrorMetric;
  v3 = (void *)-[NSDictionary mutableCopy](-[PFCloudKitBaseMetric payload](&v7, sel_payload), "mutableCopy");
  errorDomain = self->_errorDomain;
  if (!errorDomain)
    errorDomain = (NSString *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  objc_msgSend(v3, "setObject:forKey:", errorDomain, CFSTR("errorDomain"));
  errorCode = self->_errorCode;
  if (!errorCode)
    errorCode = (NSNumber *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  objc_msgSend(v3, "setObject:forKey:", errorCode, CFSTR("errorCode"));
  return v3;
}

@end
