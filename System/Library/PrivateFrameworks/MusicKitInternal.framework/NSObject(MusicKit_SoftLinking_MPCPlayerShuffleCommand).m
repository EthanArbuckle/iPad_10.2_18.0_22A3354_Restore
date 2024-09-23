@implementation NSObject(MusicKit_SoftLinking_MPCPlayerShuffleCommand)

- (id)_musicKit_self_shuffleCommand
{
  id v2;

  if (objc_msgSend(a1, "conformsToProtocol:", &unk_1F0135B48))
    v2 = a1;
  else
    v2 = 0;
  return v2;
}

- (id)musicKit_shuffleCommand_setShuffleType:()MusicKit_SoftLinking_MPCPlayerShuffleCommand
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (a3 == 2)
    v3 = 2;
  else
    v3 = a3 == 1;
  objc_msgSend(a1, "_musicKit_self_shuffleCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShuffleType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
