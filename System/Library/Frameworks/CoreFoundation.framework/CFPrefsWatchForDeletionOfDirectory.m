@implementation CFPrefsWatchForDeletionOfDirectory

dispatch_queue_t ___CFPrefsWatchForDeletionOfDirectory_block_invoke()
{
  NSObject *global_queue;
  dispatch_queue_t result;

  watchedDirs = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeArrayCallBacks);
  dirWatcherTargets = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  global_queue = dispatch_get_global_queue(-2, 0);
  result = dispatch_queue_create_with_target_V2("CFPreferences FSEvents Queue", 0, global_queue);
  fseventsQueue = (uint64_t)result;
  return result;
}

@end
