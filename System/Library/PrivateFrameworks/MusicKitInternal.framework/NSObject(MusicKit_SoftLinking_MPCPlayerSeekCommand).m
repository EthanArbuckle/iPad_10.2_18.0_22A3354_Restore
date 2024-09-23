@implementation NSObject(MusicKit_SoftLinking_MPCPlayerSeekCommand)

- (id)_musicKit_self_seekCommand
{
  id v2;

  if (objc_msgSend(a1, "conformsToProtocol:", &unk_1F0135C68))
    v2 = a1;
  else
    v2 = 0;
  return v2;
}

- (id)musicKit_seekCommand_preferredForwardJumpInterval
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "_musicKit_self_seekCommand");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "preferredForwardJumpIntervals");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (void *)v3;
  else
    v4 = &unk_1E9C25540;
  return v4;
}

- (id)musicKit_seekCommand_preferredBackwardJumpInterval
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "_musicKit_self_seekCommand");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "preferredBackwardJumpIntervals");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (void *)v3;
  else
    v4 = &unk_1E9C25558;
  return v4;
}

- (id)musicKit_seekCommand_beginSeekCommandRequestWithDirection:()MusicKit_SoftLinking_MPCPlayerSeekCommand
{
  uint64_t v3;
  void *v4;
  void *v5;

  if ((unint64_t)(a3 + 2) > 7)
    v3 = 0;
  else
    v3 = qword_1D76A1068[a3 + 2];
  objc_msgSend(a1, "_musicKit_self_seekCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginSeekWithDirection:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)musicKit_seekCommand_endSeekCommandRequest
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_seekCommand");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endSeek");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_seekCommand_jumpCommandRequestByInterval:()MusicKit_SoftLinking_MPCPlayerSeekCommand
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_musicKit_self_seekCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jumpByInterval:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)musicKit_seekCommand_changePositionCommandRequestToElapsedInterval:()MusicKit_SoftLinking_MPCPlayerSeekCommand
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_musicKit_self_seekCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "changePositionToElapsedInterval:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
