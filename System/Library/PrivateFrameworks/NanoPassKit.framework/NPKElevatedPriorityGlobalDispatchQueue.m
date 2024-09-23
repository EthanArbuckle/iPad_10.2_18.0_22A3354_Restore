@implementation NPKElevatedPriorityGlobalDispatchQueue

void __NPKElevatedPriorityGlobalDispatchQueue_block_invoke()
{
  uint64_t v0;
  void *v1;
  sched_param v2;
  pthread_attr_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  memset(&v3, 0, sizeof(v3));
  pthread_attr_init(&v3);
  v2 = 0;
  pthread_attr_getschedparam(&v3, &v2);
  v2.sched_priority = 50;
  pthread_attr_setschedparam(&v3, &v2);
  v0 = dispatch_pthread_root_queue_create();
  v1 = (void *)NPKElevatedPriorityGlobalDispatchQueue_rootQueue;
  NPKElevatedPriorityGlobalDispatchQueue_rootQueue = v0;

}

@end
