@implementation ZL23IIOLoadCoreMediaSymbolsv

const char *___ZL23IIOLoadCoreMediaSymbolsv_block_invoke()
{
  void *v0;
  const char *result;

  v0 = dlopen("/System/Library/Frameworks/CoreMedia.framework/CoreMedia", 261);
  IIOLoadCoreMediaSymbols(void)::lib = (uint64_t)v0;
  if (!v0)
    return LogError("IIOLoadCoreMediaSymbols_block_invoke", 821, "Failed to load %s\n", "/System/Library/Frameworks/CoreMedia.framework/CoreMedia");
  gFunc_CMBufferQueueCreate = dlsym(v0, "CMBufferQueueCreate");
  if (!gFunc_CMBufferQueueCreate)
    puts("❌  failed to load 'CMBufferQueueCreate' ");
  gFunc_CMBufferQueueDequeueAndRetain = (uint64_t (*)(_QWORD))dlsym((void *)IIOLoadCoreMediaSymbols(void)::lib, "CMBufferQueueDequeueAndRetain");
  if (!gFunc_CMBufferQueueDequeueAndRetain)
    puts("❌  failed to load 'CMBufferQueueDequeueAndRetain' ");
  gFunc_CMBufferQueueEnqueue = (uint64_t (*)(_QWORD))dlsym((void *)IIOLoadCoreMediaSymbols(void)::lib, "CMBufferQueueEnqueue");
  if (!gFunc_CMBufferQueueEnqueue)
    puts("❌  failed to load 'CMBufferQueueEnqueue' ");
  gFunc_CMBufferQueueGetBufferCount = dlsym((void *)IIOLoadCoreMediaSymbols(void)::lib, "CMBufferQueueGetBufferCount");
  if (!gFunc_CMBufferQueueGetBufferCount)
    puts("❌  failed to load 'CMBufferQueueGetBufferCount' ");
  gFunc_CMBufferQueueGetHead = (uint64_t (*)(_QWORD))dlsym((void *)IIOLoadCoreMediaSymbols(void)::lib, "CMBufferQueueGetHead");
  if (!gFunc_CMBufferQueueGetHead)
    puts("❌  failed to load 'CMBufferQueueGetHead' ");
  gFunc_CMBufferQueueInstallTriggerWithIntegerThreshold = dlsym((void *)IIOLoadCoreMediaSymbols(void)::lib, "CMBufferQueueInstallTriggerWithIntegerThreshold");
  if (!gFunc_CMBufferQueueInstallTriggerWithIntegerThreshold)
    puts("❌  failed to load 'CMBufferQueueInstallTriggerWithIntegerThreshold' ");
  gFunc_CMBufferQueueIsAtEndOfData = (uint64_t (*)(_QWORD))dlsym((void *)IIOLoadCoreMediaSymbols(void)::lib, "CMBufferQueueIsAtEndOfData");
  if (!gFunc_CMBufferQueueIsAtEndOfData)
    puts("❌  failed to load 'CMBufferQueueIsAtEndOfData' ");
  gFunc_CMBufferQueueIsEmpty = (uint64_t (*)(_QWORD))dlsym((void *)IIOLoadCoreMediaSymbols(void)::lib, "CMBufferQueueIsEmpty");
  if (!gFunc_CMBufferQueueIsEmpty)
    puts("❌  failed to load 'CMBufferQueueIsEmpty' ");
  gFunc_CMBufferQueueMarkEndOfData = (uint64_t (*)(_QWORD))dlsym((void *)IIOLoadCoreMediaSymbols(void)::lib, "CMBufferQueueMarkEndOfData");
  if (!gFunc_CMBufferQueueMarkEndOfData)
    puts("❌  failed to load 'CMBufferQueueMarkEndOfData' ");
  gFunc_CMBufferQueueReset = (uint64_t (*)(_QWORD))dlsym((void *)IIOLoadCoreMediaSymbols(void)::lib, "CMBufferQueueReset");
  if (!gFunc_CMBufferQueueReset)
    puts("❌  failed to load 'CMBufferQueueReset' ");
  gFunc_CMClockGetHostTimeClock = dlsym((void *)IIOLoadCoreMediaSymbols(void)::lib, "CMClockGetHostTimeClock");
  if (!gFunc_CMClockGetHostTimeClock)
    puts("❌  failed to load 'CMClockGetHostTimeClock' ");
  gFunc_CMTimeAdd = dlsym((void *)IIOLoadCoreMediaSymbols(void)::lib, "CMTimeAdd");
  if (!gFunc_CMTimeAdd)
    puts("❌  failed to load 'CMTimeAdd' ");
  gFunc_CMTimeMake = dlsym((void *)IIOLoadCoreMediaSymbols(void)::lib, "CMTimeMake");
  if (!gFunc_CMTimeMake)
    puts("❌  failed to load 'CMTimeMake' ");
  gFunc_CMTimeMakeWithSeconds = dlsym((void *)IIOLoadCoreMediaSymbols(void)::lib, "CMTimeMakeWithSeconds");
  if (!gFunc_CMTimeMakeWithSeconds)
    puts("❌  failed to load 'CMTimeMakeWithSeconds' ");
  gFunc_CMTimeMakeFromDictionary = dlsym((void *)IIOLoadCoreMediaSymbols(void)::lib, "CMTimeMakeFromDictionary");
  if (!gFunc_CMTimeMakeFromDictionary)
    puts("❌  failed to load 'CMTimeMakeFromDictionary' ");
  gFunc_CMTimeCopyAsDictionary = (uint64_t)dlsym((void *)IIOLoadCoreMediaSymbols(void)::lib, "CMTimeCopyAsDictionary");
  if (!gFunc_CMTimeCopyAsDictionary)
    puts("❌  failed to load 'CMTimeCopyAsDictionary' ");
  gFunc_CMTimeGetSeconds = dlsym((void *)IIOLoadCoreMediaSymbols(void)::lib, "CMTimeGetSeconds");
  if (!gFunc_CMTimeGetSeconds)
    puts("❌  failed to load 'CMTimeGetSeconds' ");
  gFunc_CMTimebaseAddTimerDispatchSource = dlsym((void *)IIOLoadCoreMediaSymbols(void)::lib, "CMTimebaseAddTimerDispatchSource");
  if (!gFunc_CMTimebaseAddTimerDispatchSource)
    puts("❌  failed to load 'CMTimebaseAddTimerDispatchSource' ");
  gFunc_CMTimebaseCreateWithSourceClock = dlsym((void *)IIOLoadCoreMediaSymbols(void)::lib, "CMTimebaseCreateWithSourceClock");
  if (!gFunc_CMTimebaseCreateWithSourceClock)
    puts("❌  failed to load 'CMTimebaseCreateWithSourceClock' ");
  gFunc_CMTimebaseGetTime = dlsym((void *)IIOLoadCoreMediaSymbols(void)::lib, "CMTimebaseGetTime");
  if (!gFunc_CMTimebaseGetTime)
    puts("❌  failed to load 'CMTimebaseGetTime' ");
  gFunc_CMTimebaseSetRate = dlsym((void *)IIOLoadCoreMediaSymbols(void)::lib, "CMTimebaseSetRate");
  if (!gFunc_CMTimebaseSetRate)
    puts("❌  failed to load 'CMTimebaseSetRate' ");
  result = (const char *)dlsym((void *)IIOLoadCoreMediaSymbols(void)::lib, "CMTimebaseSetTimerDispatchSourceNextFireTime");
  gFunc_CMTimebaseSetTimerDispatchSourceNextFireTime = result;
  if (!result)
    return (const char *)puts("❌  failed to load 'CMTimebaseSetTimerDispatchSourceNextFireTime' ");
  return result;
}

@end
