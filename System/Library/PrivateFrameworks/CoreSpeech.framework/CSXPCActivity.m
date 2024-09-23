@implementation CSXPCActivity

- (void)registerXPCActivities
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = (void *)*MEMORY[0x1E0C80748];
  if (*MEMORY[0x1E0C80748])
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = ___RegisterXPCActivity_block_invoke;
    v3[3] = &unk_1E7C28C90;
    v4 = &__block_literal_global_2;
    v5 = &__block_literal_global_25577;
    xpc_activity_register("com.apple.siri.xpc_activity.power-logging", v2, v3);

  }
  else
  {
    xpc_activity_unregister("com.apple.siri.xpc_activity.power-logging");
  }
}

@end
