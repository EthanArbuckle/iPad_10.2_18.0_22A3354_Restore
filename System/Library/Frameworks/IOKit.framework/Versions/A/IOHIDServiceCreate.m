@implementation IOHIDServiceCreate

uint64_t ___IOHIDServiceCreate_block_invoke()
{
  mach_timebase_info info;
  pthread_attr_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  info = 0;
  mach_timebase_info(&info);
  memset(&v2, 0, sizeof(v2));
  if (hid_pthread_attr_init(&v2, 63, 2))
    ___IOHIDServiceCreate_block_invoke_cold_2();
  if (pthread_create(&__serviceRunLoop, &v2, (void *(__cdecl *)(void *))__IOHIDServiceRunLoopCompatibilityThread, 0))
    ___IOHIDServiceCreate_block_invoke_cold_1();
  pthread_attr_destroy(&v2);
  pthread_mutex_lock(&stru_1EDF7B500);
  while (!qword_1EDF7B4F0)
    pthread_cond_wait(&stru_1EDF7B540, &stru_1EDF7B500);
  return pthread_mutex_unlock(&stru_1EDF7B500);
}

void ___IOHIDServiceCreate_block_invoke_cold_1()
{
  __assert_rtn("_IOHIDServiceCreate_block_invoke", "IOHIDService.c", 1058, "!pthread_create(&__serviceRunLoop.thread, &attribute,(ThreadRoutine)&__IOHIDServiceRunLoopCompatibilityThread, NULL)");
}

void ___IOHIDServiceCreate_block_invoke_cold_2()
{
  __assert_rtn("_IOHIDServiceCreate_block_invoke", "IOHIDService.c", 1057, "!hid_pthread_attr_init(&attribute, kIOHIDInterruptThreadPriority, kIOHIDInterruptThreadPolicy)");
}

@end
