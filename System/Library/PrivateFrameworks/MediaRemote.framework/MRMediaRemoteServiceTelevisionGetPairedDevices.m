@implementation MRMediaRemoteServiceTelevisionGetPairedDevices

void __MRMediaRemoteServiceTelevisionGetPairedDevices_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  UInt8 *v6;

  v3 = a2;
  v6 = (UInt8 *)MRCreateDataFromXPCMessage(v3, "MRXPC_PAIRED_EXTERNAL_DEVICES_DATA");
  +[MRDeviceInfo deviceInfosFromData:](MRDeviceInfo, "deviceInfosFromData:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _MRServiceCreateGenericErrorFromReply(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  kdebug_trace();

}

@end
