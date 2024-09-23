@implementation PFCloudKitImporterZonePurgedWorkItem

- (PFCloudKitImporterZonePurgedWorkItem)initWithPurgedRecordZoneID:(id)a3 options:(id)a4 request:(id)a5
{
  PFCloudKitImporterZonePurgedWorkItem *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PFCloudKitImporterZonePurgedWorkItem;
  v6 = -[PFCloudKitImporterWorkItem initWithOptions:request:](&v8, sel_initWithOptions_request_, a4, a5);
  if (v6)
    v6->_purgedRecordZoneID = (CKRecordZoneID *)a3;
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_purgedRecordZoneID = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitImporterZonePurgedWorkItem;
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
  objc_msgSend(v7, "appendFormat:", CFSTR(" { %@ }"), self->_purgedRecordZoneID);
  return v7;
}

- (void)doWorkForStore:(id)a3 inMonitor:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  PFCloudKitImporterOptions *options;
  NSCloudKitMirroringDelegateOptions *v13;
  uint64_t metadataPurger;
  uint64_t v15;
  PFCloudKitImporterOptions *v16;
  NSCloudKitMirroringDelegateOptions *v17;
  id v18;
  void *v19;
  NSCloudKitMirroringResult *v20;
  NSCloudKitMirroringImportRequest *request;
  uint64_t v22;
  NSCloudKitMirroringResult *v23;
  NSCloudKitMirroringImportRequest *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSCloudKitMirroringResult *v28;
  NSCloudKitMirroringImportRequest *v29;
  NSCloudKitMirroringResult *v30;
  uint64_t v31;
  const __CFString *v32;
  void *v33;
  CKRecordZoneID *purgedRecordZoneID;
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v31 = 0;
  v9 = (id)objc_msgSend(a3, "mirroringDelegate");
  v10 = objc_alloc(MEMORY[0x1E0CB37C0]);
  v35 = CFSTR("NSCloudKitMirroringDelegateResetSyncReasonKey");
  v36[0] = &unk_1E1F4B648;
  v11 = (void *)objc_msgSend(v10, "initWithName:object:userInfo:", CFSTR("NSCloudKitMirroringDelegateWillResetSyncNotificationName"), v9, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1));
  objc_msgSend(v9, "logResetSyncNotification:", v11);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v11);

  if (self && (options = self->super._options) != 0 && (v13 = options->_options) != 0)
    metadataPurger = (uint64_t)v13->_metadataPurger;
  else
    metadataPurger = 0;
  purgedRecordZoneID = self->_purgedRecordZoneID;
  v15 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &purgedRecordZoneID, 1);
  v16 = self->super._options;
  if (v16)
    v17 = v16->_options;
  else
    v17 = 0;
  if (-[PFCloudKitMetadataPurger purgeMetadataFromStore:inMonitor:withOptions:forRecordZones:inDatabaseWithScope:andTransactionAuthor:error:](metadataPurger, (uint64_t)a3, (uint64_t)a4, 9, v15, -[NSCloudKitMirroringDelegateOptions databaseScope](v17, "databaseScope"), CFSTR("NSCloudKitMirroringDelegate.reset"), &v31))
  {
    v18 = objc_alloc(MEMORY[0x1E0CB37C0]);
    v32 = CFSTR("NSCloudKitMirroringDelegateResetSyncReasonKey");
    v33 = &unk_1E1F4B648;
    v19 = (void *)objc_msgSend(v18, "initWithName:object:userInfo:", CFSTR("NSCloudKitMirroringDelegateDidResetSyncNotificationName"), v9, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    objc_msgSend(v9, "logResetSyncNotification:", v19);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v19);

    v20 = [NSCloudKitMirroringResult alloc];
    request = self->super._request;
    v22 = objc_msgSend(a3, "identifier");
    v23 = v20;
    v24 = request;
    v25 = 1;
    v26 = 1;
    v27 = 0;
  }
  else
  {
    v28 = [NSCloudKitMirroringResult alloc];
    v29 = self->super._request;
    v22 = objc_msgSend(a3, "identifier");
    v27 = v31;
    v23 = v28;
    v24 = v29;
    v25 = 0;
    v26 = 0;
  }
  v30 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v23, "initWithRequest:storeIdentifier:success:madeChanges:error:", v24, v22, v25, v26, v27);
  if (a5)
    (*((void (**)(id, NSCloudKitMirroringResult *))a5 + 2))(a5, v30);

}

@end
