@implementation NSObject(MusicKit_SoftLinking_MPCPlayerRepeatCommand)

- (id)_musicKit_self_repeatCommand
{
  id v2;

  if (objc_msgSend(a1, "conformsToProtocol:", &unk_1F0135AE8))
    v2 = a1;
  else
    v2 = 0;
  return v2;
}

- (id)musicKit_repeatCommand_setRepeatType:()MusicKit_SoftLinking_MPCPlayerRepeatCommand
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (a3 == 2)
    v3 = 2;
  else
    v3 = a3 == 1;
  objc_msgSend(a1, "_musicKit_self_repeatCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRepeatType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
