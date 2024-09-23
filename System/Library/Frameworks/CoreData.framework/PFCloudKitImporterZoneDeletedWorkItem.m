@implementation PFCloudKitImporterZoneDeletedWorkItem

- (PFCloudKitImporterZoneDeletedWorkItem)initWithDeletedRecordZoneID:(id)a3 options:(id)a4 request:(id)a5
{
  PFCloudKitImporterZoneDeletedWorkItem *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PFCloudKitImporterZoneDeletedWorkItem;
  v6 = -[PFCloudKitImporterWorkItem initWithOptions:request:](&v8, sel_initWithOptions_request_, a4, a5);
  if (v6)
    v6->_deletedRecordZoneID = (CKRecordZoneID *)a3;
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_deletedRecordZoneID = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitImporterZoneDeletedWorkItem;
  -[PFCloudKitImporterWorkItem dealloc](&v3, sel_dealloc);
}

- (id)description
{
  id v3;
  objc_class *v4;
  NSString *v5;
  NSCloudKitMirroringImportRequest *request;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self)
    request = self->super._request;
  else
    request = 0;
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p - %@>"), v5, self, request);
  objc_msgSend(v7, "appendFormat:", CFSTR(" { %@ }"), self->_deletedRecordZoneID);
  return v7;
}

- (void)doWorkForStore:(id)a3 inMonitor:(id)a4 completion:(id)a5
{
  PFCloudKitImporterOptions *options;
  NSCloudKitMirroringDelegateOptions *v10;
  uint64_t v11;
  uint64_t v12;
  PFCloudKitImporterOptions *v13;
  NSCloudKitMirroringDelegateOptions *v14;
  uint64_t metadataPurger;
  _BOOL4 v16;
  NSCloudKitMirroringResult *v17;
  NSCloudKitMirroringImportRequest *request;
  uint64_t v19;
  NSCloudKitMirroringResult *v20;
  NSCloudKitMirroringImportRequest *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSCloudKitMirroringResult *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v26 = 0;
  if (self)
  {
    options = self->super._options;
    if (options)
      v10 = options->_options;
    else
      v10 = 0;
    v11 = -[NSCloudKitMirroringDelegateOptions databaseScope](v10, "databaseScope");
    if (v11 == 3)
      v12 = 299;
    else
      v12 = 298;
    v13 = self->super._options;
    if (v13 && (v14 = v13->_options) != 0)
      metadataPurger = (uint64_t)v14->_metadataPurger;
    else
      metadataPurger = 0;
  }
  else
  {
    v11 = objc_msgSend(0, "databaseScope");
    metadataPurger = 0;
    if (v11 == 3)
      v12 = 299;
    else
      v12 = 298;
  }
  v27[0] = self->_deletedRecordZoneID;
  v16 = -[PFCloudKitMetadataPurger purgeMetadataFromStore:inMonitor:withOptions:forRecordZones:inDatabaseWithScope:andTransactionAuthor:error:](metadataPurger, (uint64_t)a3, (uint64_t)a4, v12, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1), v11, CFSTR("NSCloudKitMirroringDelegate.import"), &v26);
  v17 = [NSCloudKitMirroringResult alloc];
  request = self->super._request;
  v19 = objc_msgSend(a3, "identifier");
  if (v16)
  {
    v20 = v17;
    v21 = request;
    v22 = 1;
    v23 = 1;
    v24 = 0;
  }
  else
  {
    v24 = v26;
    v20 = v17;
    v21 = request;
    v22 = 0;
    v23 = 0;
  }
  v25 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v20, "initWithRequest:storeIdentifier:success:madeChanges:error:", v21, v19, v22, v23, v24);
  if (a5)
    (*((void (**)(id, NSCloudKitMirroringResult *))a5 + 2))(a5, v25);

}

@end
