@implementation MRMediaRemoteServiceRequestVideoThumbnails

void __MRMediaRemoteServiceRequestVideoThumbnails_block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  void *v6;
  void *Error;
  id v9;

  v4 = (void *)MEMORY[0x1E0C81258];
  v5 = a2;
  v6 = v5;
  if (a2 == v4 || a2 == (void *)MEMORY[0x1E0C81260])
  {
    _MRServiceLogReplyError();

    Error = (void *)MRMediaRemoteCreateError(1);
    v9 = 0;
  }
  else
  {
    v9 = MRCreateVideoThumbnailsFromXPCMessage(v5);
    Error = (void *)MRCreateClientErrorFromXPCMessage(v6);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  kdebug_trace();

}

@end
