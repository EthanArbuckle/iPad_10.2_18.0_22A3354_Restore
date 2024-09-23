@implementation MRMediaRemoteServiceGetCountOfBrowsableContentChildItems

void __MRMediaRemoteServiceGetCountOfBrowsableContentChildItems_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  uint64_t uint64;
  uint64_t v6;
  id v7;

  v3 = a2;
  v4 = v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260];
  v7 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    uint64 = 0;
  }
  else
  {
    uint64 = xpc_dictionary_get_uint64(v3, "MRXPC_CONTENT_CHILD_ITEMS_COUNT_KEY");
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, uint64);
  kdebug_trace();

}

@end
