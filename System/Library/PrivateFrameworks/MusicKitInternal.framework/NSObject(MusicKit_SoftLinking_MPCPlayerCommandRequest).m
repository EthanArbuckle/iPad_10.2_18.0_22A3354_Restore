@implementation NSObject(MusicKit_SoftLinking_MPCPlayerCommandRequest)

- (id)_musicKit_self_commandRequest
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
  v2 = (void *)getMPCPlayerCommandRequestClass_softClass;
  v9 = getMPCPlayerCommandRequestClass_softClass;
  if (!getMPCPlayerCommandRequestClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getMPCPlayerCommandRequestClass_block_invoke;
    v5[3] = &unk_1E9C05688;
    v5[4] = &v6;
    __getMPCPlayerCommandRequestClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return a1;
  else
    return 0;
}

- (uint64_t)musicKit_setSessionID:()MusicKit_SoftLinking_MPCPlayerCommandRequest
{
  return objc_msgSend(a1, "_musicKit_setCommandOptionValue:forKey:", a3, *MEMORY[0x1E0D4CBD8]);
}

- (void)_musicKit_setCommandOptionValue:()MusicKit_SoftLinking_MPCPlayerCommandRequest forKey:
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_musicKit_self_commandRequest");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCommandOptionValue:forKey:", v7, v6);

}

@end
