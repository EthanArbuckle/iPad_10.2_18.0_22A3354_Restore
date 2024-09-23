@implementation MRMediaRemoteServiceGetReceiverAirPlaySecuritySettings

void __MRMediaRemoteServiceGetReceiverAirPlaySecuritySettings_block_invoke(uint64_t a1, void *a2)
{
  UInt8 *v4;
  _MRAVAirPlaySecuritySettingsProtobuf *v5;

  if (a2 == (void *)MEMORY[0x1E0C81258] || a2 == (void *)MEMORY[0x1E0C81260])
  {
    _MRServiceLogReplyError();
    v5 = 0;
  }
  else
  {
    v4 = (UInt8 *)MRCreateDataFromXPCMessage(a2, "MRXPC_AIRPLAY_SEC_SETTINGS_DATA_KEY");
    v5 = MRAVAirPlaySecuritySettingsCreateFromExternalRepresentation((uint64_t)v4);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  kdebug_trace();

}

@end
