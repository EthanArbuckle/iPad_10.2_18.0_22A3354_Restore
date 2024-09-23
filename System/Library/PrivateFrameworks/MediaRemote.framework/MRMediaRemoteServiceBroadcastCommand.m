@implementation MRMediaRemoteServiceBroadcastCommand

void __MRMediaRemoteServiceBroadcastCommand_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  UInt8 *v5;

  v3 = a2;
  xpc_dictionary_get_uint64(v3, "MRXPC_COMMAND_SEND_ERROR_KEY");
  v5 = (UInt8 *)MRCreateDataFromXPCMessage(v3, "MRXPC_COMMAND_STATUSES_DATA_KEY");

  MRCreateArrayFromData(v5, &__block_literal_global_144);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  kdebug_trace();

}

_MRSendCommandResultMessageProtobuf *__MRMediaRemoteServiceBroadcastCommand_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _MRSendCommandResultMessageProtobuf *v3;

  v2 = a2;
  v3 = -[_MRSendCommandResultMessageProtobuf initWithData:]([_MRSendCommandResultMessageProtobuf alloc], "initWithData:", v2);

  return v3;
}

@end
