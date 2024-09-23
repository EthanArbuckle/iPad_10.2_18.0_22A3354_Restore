@implementation NSCloudKitMirroringAcceptShareInvitationsResult

- (NSCloudKitMirroringAcceptShareInvitationsResult)initWithRequest:(id)a3 storeIdentifier:(id)a4 acceptedShares:(id)a5 acceptedShareMetadatas:(id)a6 error:(id)a7
{
  _BOOL4 v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSCloudKitMirroringAcceptShareInvitationsResult *v23;
  objc_super v25;
  uint8_t buf[16];

  v13 = ((unint64_t)a5 | (unint64_t)a6) == 0;
  if (!((unint64_t)a5 | (unint64_t)a6))
  {
LABEL_8:
    v14 = 0;
    goto LABEL_9;
  }
  if (!a5 || !a6)
  {
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid arguments to initialize a share invitations result. If the operation failed both acceptedShares and acceptedShareMetadatas should be nil, otherwise there should be both arrays.");
    _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)v25.receiver);
    v22 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18A253000, v22, OS_LOG_TYPE_FAULT, "CoreData: Invalid arguments to initialize a share invitations result. If the operation failed both acceptedShares and acceptedShareMetadatas should be nil, otherwise there should be both arrays.", buf, 2u);
    }
    goto LABEL_8;
  }
  if (objc_msgSend(a5, "count"))
    v14 = 1;
  else
    v14 = objc_msgSend(a6, "count") != 0;
LABEL_9:
  v25.receiver = self;
  v25.super_class = (Class)NSCloudKitMirroringAcceptShareInvitationsResult;
  v23 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](&v25, sel_initWithRequest_storeIdentifier_success_madeChanges_error_, a3, a4, !v13, v14, a7);
  if (v23)
  {
    v23->_acceptedShares = (NSArray *)a5;
    v23->_acceptedShareMetadatas = (NSArray *)a6;
  }
  return v23;
}

- (void)dealloc
{
  objc_super v3;

  self->_acceptedShares = 0;
  self->_acceptedShareMetadatas = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringAcceptShareInvitationsResult;
  -[NSCloudKitMirroringResult dealloc](&v3, sel_dealloc);
}

- (NSArray)acceptedShares
{
  return self->_acceptedShares;
}

- (void)setAcceptedShares:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSArray)acceptedShareMetadatas
{
  return self->_acceptedShareMetadatas;
}

- (void)setAcceptedShareMetadatas:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
