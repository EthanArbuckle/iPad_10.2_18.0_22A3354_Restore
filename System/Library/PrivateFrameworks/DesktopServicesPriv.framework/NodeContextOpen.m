@implementation NodeContextOpen

void __NodeContextOpen_block_invoke()
{
  NSObject *v0;
  TFSVolumeInfo *v1;
  TFSInfo *v2;
  TDSNotifier *v3;
  TFSInfo *v4;
  TSystemNotificationTask *v5;
  TSystemNotificationTask *v6;
  TNode *v7;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = ___ZZ15NodeContextOpenENK3__2clEv_block_invoke;
  block[3] = &__block_descriptor_33_ea8_32c41_ZTSKZZ15NodeContextOpenENK3__2clEvEUlvE__e5_v8__0l;
  dispatch_async(v0, block);

  TCFURLInfo::Initialize((TCFURLInfo *)+[FIDSNode registerClassForFIDSNodeCoding:](FILocalStorageNode, "registerClassForFIDSNodeCoding:", CFSTR("FI Local Storage")));
  TFSVolumeInfo::SetFullEnvironment(v1);
  v3 = (TDSNotifier *)TFSInfo::MarkAsUsed(v2);
  TClientChangeNotifier::ValidateNotifierList(v3);
  TFSInfo::Validate(v4);
  TSystemNotificationTask::MakeNotificationQueue(v5);
  TSystemNotificationTask::MakeStreamQueue(v6);
  TNode::Initialize(v7);
}

@end
