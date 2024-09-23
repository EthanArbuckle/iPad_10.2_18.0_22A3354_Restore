@implementation CardDAVBulkChangeTask

- (CardDAVBulkChangeTask)initWithURL:(id)a3 checkCTag:(id)a4 simple:(BOOL)a5 returnChangedData:(BOOL)a6 uuidsToAddActions:(id)a7 hrefsToModDeleteActions:(id)a8
{
  _BOOL8 v10;
  _BOOL8 v11;
  id v15;
  id v16;
  CardDAVBulkChangeTask *v17;
  CardDAVBulkChangeTask *v18;
  __CFString *v19;
  objc_super v21;

  v10 = a6;
  v11 = a5;
  v15 = a7;
  v16 = a8;
  v21.receiver = self;
  v21.super_class = (Class)CardDAVBulkChangeTask;
  v17 = -[CoreDAVBulkChangeTask initWithURL:checkCTag:simple:returnChangedData:uuidsToAddActions:hrefsToModDeleteActions:](&v21, sel_initWithURL_checkCTag_simple_returnChangedData_uuidsToAddActions_hrefsToModDeleteActions_, a3, a4, v11, v10, v15, v16);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->super._appSpecificNamespace, CFSTR("urn:ietf:params:xml:ns:carddav"));
    objc_storeStrong((id *)&v18->super._appSpecificDataProp, CFSTR("address-data"));
    objc_storeStrong((id *)&v18->super._uuidsToAddActions, a7);
    objc_storeStrong((id *)&v18->super._hrefsToModDeleteActions, a8);
    if (v11)
      v19 = CFSTR("text/vcard; charset=utf-8");
    else
      v19 = CFSTR("application/xml; charset=utf-8");
    objc_storeStrong((id *)&v18->super._requestDataContentType, v19);
  }
  -[CoreDAVBulkChangeTask fillOutDataWithUUIDsToAddActions:hrefsToModDeleteActions:](v18, "fillOutDataWithUUIDsToAddActions:hrefsToModDeleteActions:", v15, v16);

  return v18;
}

@end
