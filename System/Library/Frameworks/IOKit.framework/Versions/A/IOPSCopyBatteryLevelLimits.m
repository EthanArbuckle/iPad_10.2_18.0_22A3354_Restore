@implementation IOPSCopyBatteryLevelLimits

void __IOPSCopyBatteryLevelLimits_block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __IOPSGaugingMitigationGetState_block_invoke_cold_1();
}

@end
