@implementation RemoveSubConnection

uint64_t __udpconnectionAggregate_RemoveSubConnection_block_invoke()
{
  return nw_replicate_metadata_remove_endpoint();
}

@end
