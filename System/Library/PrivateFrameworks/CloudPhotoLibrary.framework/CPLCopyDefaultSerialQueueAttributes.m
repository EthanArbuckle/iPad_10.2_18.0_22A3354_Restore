@implementation CPLCopyDefaultSerialQueueAttributes

void __CPLCopyDefaultSerialQueueAttributes_block_invoke()
{
  uint64_t v0;
  void *v1;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CPLCopyDefaultSerialQueueAttributes_attr;
  CPLCopyDefaultSerialQueueAttributes_attr = v0;

}

@end
