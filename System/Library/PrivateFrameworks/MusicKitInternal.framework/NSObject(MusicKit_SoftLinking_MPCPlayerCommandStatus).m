@implementation NSObject(MusicKit_SoftLinking_MPCPlayerCommandStatus)

- (id)_musicKit_self_commandStatus
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
  v2 = (void *)getMPCPlayerCommandStatusClass_softClass;
  v9 = getMPCPlayerCommandStatusClass_softClass;
  if (!getMPCPlayerCommandStatusClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getMPCPlayerCommandStatusClass_block_invoke;
    v5[3] = &unk_1E9C05688;
    v5[4] = &v6;
    __getMPCPlayerCommandStatusClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return a1;
  else
    return 0;
}

- (id)musicKit_commandStatus_error
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_commandStatus");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_commandStatus_dialog
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_commandStatus");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dialog");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)musicKit_commandStatus_type
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(a1, "_musicKit_self_commandStatus");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "type");

  if (v2 == 999)
    v3 = 999;
  else
    v3 = 0;
  if (v2 == 3)
    v3 = 3;
  if (v2 == 2)
    v4 = 2;
  else
    v4 = 0;
  if (v2 == 1)
    v4 = 1;
  if (v2 <= 2)
    return v4;
  else
    return v3;
}

@end
