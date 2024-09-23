@implementation MRCreateDecodedUserInfo

MRPlayerPath *__MRCreateDecodedUserInfo_block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  MRPlayerPath *v3;

  v2 = a2;
  v3 = -[MRPlayerPath initWithData:]([MRPlayerPath alloc], "initWithData:", v2);

  return v3;
}

MRPlayerPath *__MRCreateDecodedUserInfo_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRPlayerPath *v3;

  v2 = a2;
  v3 = -[MRPlayerPath initWithData:]([MRPlayerPath alloc], "initWithData:", v2);

  return v3;
}

MRPlayerPath *__MRCreateDecodedUserInfo_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  MRPlayerPath *v3;

  v2 = a2;
  v3 = -[MRPlayerPath initWithData:]([MRPlayerPath alloc], "initWithData:", v2);

  return v3;
}

MRClient *__MRCreateDecodedUserInfo_block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  MRClient *v3;

  v2 = a2;
  v3 = -[MRClient initWithData:]([MRClient alloc], "initWithData:", v2);

  return v3;
}

MRPlayer *__MRCreateDecodedUserInfo_block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  MRPlayer *v3;

  v2 = a2;
  v3 = -[MRPlayer initWithData:]([MRPlayer alloc], "initWithData:", v2);

  return v3;
}

MRDeviceInfo *__MRCreateDecodedUserInfo_block_invoke_81(uint64_t a1, void *a2)
{
  id v2;
  MRDeviceInfo *v3;

  v2 = a2;
  v3 = -[MRDeviceInfo initWithData:]([MRDeviceInfo alloc], "initWithData:", v2);

  return v3;
}

MRDeviceInfo *__MRCreateDecodedUserInfo_block_invoke_2_83(uint64_t a1, void *a2)
{
  id v2;
  MRDeviceInfo *v3;

  v2 = a2;
  v3 = -[MRDeviceInfo initWithData:]([MRDeviceInfo alloc], "initWithData:", v2);

  return v3;
}

MROrigin *__MRCreateDecodedUserInfo_block_invoke_3_85(uint64_t a1, void *a2)
{
  id v2;
  MROrigin *v3;

  v2 = a2;
  v3 = -[MROrigin initWithData:]([MROrigin alloc], "initWithData:", v2);

  return v3;
}

MRPlaybackSessionRequest *__MRCreateDecodedUserInfo_block_invoke_87(uint64_t a1, void *a2)
{
  id v2;
  MRPlaybackSessionRequest *v3;

  v2 = a2;
  v3 = -[MRPlaybackSessionRequest initWithData:]([MRPlaybackSessionRequest alloc], "initWithData:", v2);

  return v3;
}

MRPlaybackSession *__MRCreateDecodedUserInfo_block_invoke_2_91(uint64_t a1, void *a2)
{
  id v2;
  MRPlaybackSession *v3;

  v2 = a2;
  v3 = -[MRPlaybackSession initWithData:]([MRPlaybackSession alloc], "initWithData:", v2);

  return v3;
}

MRPlaybackQueueRequest *__MRCreateDecodedUserInfo_block_invoke_3_93(uint64_t a1, void *a2)
{
  id v2;
  MRPlaybackQueueRequest *v3;

  v2 = a2;
  v3 = -[MRPlaybackQueueRequest initWithData:]([MRPlaybackQueueRequest alloc], "initWithData:", v2);

  return v3;
}

MRPlaybackQueue *__MRCreateDecodedUserInfo_block_invoke_4_95(uint64_t a1, void *a2)
{
  id v2;
  MRPlaybackQueue *v3;

  v2 = a2;
  v3 = -[MRPlaybackQueue initWithData:]([MRPlaybackQueue alloc], "initWithData:", v2);

  return v3;
}

id __MRCreateDecodedUserInfo_block_invoke_5_97(uint64_t a1, uint64_t a2)
{
  return +[MRCommandInfo commandInfosFromData:](MRCommandInfo, "commandInfosFromData:", a2);
}

MRAVDistantOutputDevice *__MRCreateDecodedUserInfo_block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  MRAVDistantOutputDevice *v3;
  _MRAVOutputDeviceDescriptorProtobuf *v4;
  MRAVDistantOutputDevice *v5;

  v2 = a2;
  v3 = [MRAVDistantOutputDevice alloc];
  v4 = -[_MRAVOutputDeviceDescriptorProtobuf initWithData:]([_MRAVOutputDeviceDescriptorProtobuf alloc], "initWithData:", v2);

  v5 = -[MRAVDistantOutputDevice initWithDescriptor:](v3, "initWithDescriptor:", v4);
  return v5;
}

@end
