@implementation NSObject(MusicKit_SoftLinking_MPCPlayerActionAtQueueEndCommand)

- (id)_musicKit_self_actionAtQueueEndCommand
{
  id v2;

  if (objc_msgSend(a1, "conformsToProtocol:", &unk_1F0135C08))
    v2 = a1;
  else
    v2 = 0;
  return v2;
}

- (id)musicKit_actionAtQueueEndCommand_setQueueEndActionCommandRequest:()MusicKit_SoftLinking_MPCPlayerActionAtQueueEndCommand
{
  uint64_t v3;
  void *v4;
  void *v5;

  if ((unint64_t)(a3 - 1) >= 3)
    v3 = 0;
  else
    v3 = a3;
  objc_msgSend(a1, "_musicKit_self_actionAtQueueEndCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueueEndAction:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)musicKit_actionAtQueueEndCommand_isAutoPlaySupported
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "_musicKit_self_actionAtQueueEndCommand");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "supportedActions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

@end
