@implementation CardDAVMultiPutTask

- (CardDAVMultiPutTask)initWithURL:(id)a3 checkCTag:(id)a4 uuidsToAddActions:(id)a5 hrefsToModDeleteActions:(id)a6
{
  id v10;
  id v11;
  CardDAVMultiPutTask *v12;
  CardDAVMultiPutTask *v13;
  objc_super v15;

  v10 = a5;
  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CardDAVMultiPutTask;
  v12 = -[CoreDAVMultiPutTask initWithURL:checkCTag:uuidsToAddActions:hrefsToModDeleteActions:](&v15, sel_initWithURL_checkCTag_uuidsToAddActions_hrefsToModDeleteActions_, a3, a4, v10, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->super._appSpecificNamespace, CFSTR("urn:ietf:params:xml:ns:carddav"));
    objc_storeStrong((id *)&v13->super._appSpecificDataProp, CFSTR("address-data"));
  }
  -[CoreDAVMultiPutTask fillOutDataWithUUIDsToAddActions:hrefsToModDeleteActions:](v13, "fillOutDataWithUUIDsToAddActions:hrefsToModDeleteActions:", v10, v11);

  return v13;
}

@end
