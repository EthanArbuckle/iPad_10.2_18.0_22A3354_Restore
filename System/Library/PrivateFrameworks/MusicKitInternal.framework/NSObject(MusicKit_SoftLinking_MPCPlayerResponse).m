@implementation NSObject(MusicKit_SoftLinking_MPCPlayerResponse)

- (id)_musicKit_self_playerResponse
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getMPCPlayerResponseClass_softClass;
  v9 = getMPCPlayerResponseClass_softClass;
  if (!getMPCPlayerResponseClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getMPCPlayerResponseClass_block_invoke;
    v5[3] = &unk_1E9C05688;
    v5[4] = &v6;
    __getMPCPlayerResponseClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return a1;
  else
    return 0;
}

- (id)musicKit_playerResponse_tracklist
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_playerResponse");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "tracklist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_playerPath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_playerResponse");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "playerPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)musicKit_playerResponse_state
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_musicKit_self_playerResponse");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "state");

  if ((unint64_t)(v2 - 1) > 5)
    return 0;
  else
    return qword_1D76A10D8[v2 - 1];
}

- (id)musicKit_playerResponse_playCommandRequest
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_playerResponse");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "play");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_playerResponse_pauseCommandRequest
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_playerResponse");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pause");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_playerResponse_stopCommandRequest
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_playerResponse");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stop");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
