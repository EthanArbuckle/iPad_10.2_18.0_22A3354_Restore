@implementation CardDAVBulkUploadTaskGroup

- (CardDAVBulkUploadTaskGroup)initWithFolderURL:(id)a3 checkCTag:(id)a4 uuidsToAddActions:(id)a5 hrefsToModDeleteActions:(id)a6 context:(id)a7 accountInfoProvider:(id)a8 taskManager:(id)a9
{
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CardDAVBulkUploadTaskGroup;
  return -[CoreDAVBulkUploadTaskGroup initWithFolderURL:checkCTag:uuidsToAddActions:hrefsToModDeleteActions:context:accountInfoProvider:taskManager:](&v10, sel_initWithFolderURL_checkCTag_uuidsToAddActions_hrefsToModDeleteActions_context_accountInfoProvider_taskManager_, a3, a4, a5, a6, a7, a8, a9);
}

- (Class)multiPutTaskClass
{
  return (Class)objc_opt_class();
}

@end
