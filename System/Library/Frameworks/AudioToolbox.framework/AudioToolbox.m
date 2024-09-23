uint64_t VibeSynthEngineHasHardwareSupport(PlatformUtilities_iOS *a1)
{
  return PlatformUtilities_iOS::ProductSupportsClosedLoopHaptics(a1);
}

uint64_t HapticServerManager_VibeEngineCancelWithOptions()
{
  return MEMORY[0x24BDB6B78]();
}

uint64_t HapticServerManager_VibeEngineInitialize()
{
  return MEMORY[0x24BDB6B80]();
}

uint64_t HapticServerManager_VibeEnginePlay()
{
  return MEMORY[0x24BDB6B88]();
}

uint64_t HapticServerManager_VibeEngineStartPrewarm()
{
  return MEMORY[0x24BDB6B90]();
}

uint64_t HapticServerManager_VibeEngineStopPrewarm()
{
  return MEMORY[0x24BDB6B98]();
}

