@implementation MRMediaRemoteServiceCopyBrowsableContentNowPlayingIdentifiers

void __MRMediaRemoteServiceCopyBrowsableContentNowPlayingIdentifiers_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const void *data;
  void *v7;
  void *v8;
  uint64_t v9;
  size_t length;

  v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260])
  {
    _MRServiceLogReplyError();
  }
  else
  {
    length = 0;
    data = xpc_dictionary_get_data(v3, "MRXPC_CONTENT_NOW_PLAYING_IDENTIFIERS_KEY", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
  }
  v8 = 0;
LABEL_10:
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v8);
  kdebug_trace();

}

@end
