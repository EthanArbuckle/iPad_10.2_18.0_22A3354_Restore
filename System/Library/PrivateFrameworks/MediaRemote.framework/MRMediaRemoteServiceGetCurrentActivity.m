@implementation MRMediaRemoteServiceGetCurrentActivity

void __MRMediaRemoteServiceGetCurrentActivity_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  const void *data;
  void *v5;
  void *v6;
  size_t length;

  if (xdict == (xpc_object_t)MEMORY[0x1E0C81258] || xdict == (xpc_object_t)MEMORY[0x1E0C81260])
  {
    _MRServiceLogReplyError();
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  length = 0;
  data = xpc_dictionary_get_data(xdict, "MRXPC_APPLICATION_ACTIVITY_DATA_KEY", &length);
  if (!data)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)_MRApplicationActivityCreateWithExternalRepresentation((uint64_t)v5);

LABEL_10:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  kdebug_trace();

}

@end
