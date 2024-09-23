@implementation GEORequestResponseLogQueue

void ___GEORequestResponseLogQueue_block_invoke()
{
  uint64_t v0;
  void *v1;

  geo_dispatch_queue_create_with_workloop_qos();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECDBBD60;
  qword_1ECDBBD60 = v0;

}

@end
