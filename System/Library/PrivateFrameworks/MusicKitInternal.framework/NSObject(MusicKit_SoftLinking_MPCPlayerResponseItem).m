@implementation NSObject(MusicKit_SoftLinking_MPCPlayerResponseItem)

- (id)_musicKit_self_responseItem
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
  v2 = (void *)getMPCPlayerResponseItemClass_softClass;
  v9 = getMPCPlayerResponseItemClass_softClass;
  if (!getMPCPlayerResponseItemClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getMPCPlayerResponseItemClass_block_invoke;
    v5[3] = &unk_1E9C05688;
    v5[4] = &v6;
    __getMPCPlayerResponseItemClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return a1;
  else
    return 0;
}

- (id)musicKit_playerResponseItem_underlyingModelObject
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_responseItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "metadataObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_playerResponseItem_contentItemIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_responseItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contentItemIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)_durationSnapshot
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_musicKit_self_responseItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "duration");
    v3 = v4;
  }
  else
  {
    *(_QWORD *)(a2 + 48) = 0;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)a2 = 0u;
  }

}

- (double)musicKit_playerResponseItem_startTime
{
  double v2;

  objc_msgSend(a1, "_durationSnapshot");
  return v2;
}

- (double)musicKit_playerResponseItem_endTime
{
  double v2;

  objc_msgSend(a1, "_durationSnapshot");
  return v2;
}

- (double)musicKit_playerResponseItem_duration
{
  double v2;

  objc_msgSend(a1, "_durationSnapshot");
  return v2;
}

- (double)musicKit_playerResponseItem_elapsedTime
{
  double v1;
  double v2;
  double v4;
  double v5;
  double v6;
  float v7;

  objc_msgSend(a1, "_durationSnapshot");
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v2 = v6 + (v1 - v4) * v7;
  if (v2 >= v5)
    v2 = v5;
  return fmax(v2, 0.0);
}

- (float)musicKit_playerResponseItem_rate
{
  float v2;

  objc_msgSend(a1, "_durationSnapshot");
  return v2;
}

- (float)musicKit_playerResponseItem_defaultRate
{
  float v2;

  objc_msgSend(a1, "_durationSnapshot");
  return v2;
}

- (uint64_t)musicKit_playerResponseItem_isLiveContent
{
  unsigned __int8 v2;

  objc_msgSend(a1, "_durationSnapshot");
  return v2;
}

- (uint64_t)musicKit_playerResponseItem_isPlaceholder
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_musicKit_self_responseItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isPlaceholder");

  return v2;
}

- (uint64_t)musicKit_playerResponseItem_isLoading
{
  unsigned __int8 v2;

  objc_msgSend(a1, "_durationSnapshot");
  return v2;
}

- (id)musicKit_playerResponseItem_nowPlayingAudioFormat
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_responseItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "nowPlayingAudioFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_playerResponseItem_seekCommand
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_responseItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "seekCommand");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_playerResponseItem_removeCommandRequest
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_responseItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "remove");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
