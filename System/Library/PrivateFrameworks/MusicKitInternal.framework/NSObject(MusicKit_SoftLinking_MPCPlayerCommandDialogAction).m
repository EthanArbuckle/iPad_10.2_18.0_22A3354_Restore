@implementation NSObject(MusicKit_SoftLinking_MPCPlayerCommandDialogAction)

- (id)_musicKit_self_commandDialogAction
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
  v2 = (void *)getMPCPlayerCommandDialogActionClass_softClass;
  v9 = getMPCPlayerCommandDialogActionClass_softClass;
  if (!getMPCPlayerCommandDialogActionClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getMPCPlayerCommandDialogActionClass_block_invoke;
    v5[3] = &unk_1E9C05688;
    v5[4] = &v6;
    __getMPCPlayerCommandDialogActionClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return a1;
  else
    return 0;
}

- (id)musicKit_commandDialogAction_localizedTitle
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_commandDialogAction");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)musicKit_commandDialogAction_type
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_musicKit_self_commandDialogAction");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "type");

  if (v2 == 2)
    return 2;
  else
    return v2 == 1;
}

- (id)musicKit_commandDialogAction_commandRequest
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_commandDialogAction");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "commandRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
