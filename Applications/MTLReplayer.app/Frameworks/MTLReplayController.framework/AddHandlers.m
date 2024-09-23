@implementation AddHandlers

void __AddHandlers_block_invoke_2(id a1, MTLCommandBuffer *a2)
{
  id v2;
  void *v3;
  MTLCommandBuffer *v4;

  v4 = a2;
  if (-[MTLCommandBuffer status](v4, "status") == (char *)&dword_4 + 1)
  {
    v2 = GTMTLReplay_dictionaryFromCommandBuffer(v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    GTMTLReplay_handleCommandBufferError((uint64_t)v3);

  }
  if (GTMTLReplayDefaults_logCommandBufferHandlers())
    LogCommandBuffer(CFSTR("Completed"), v4);

}

void __AddHandlers_block_invoke(id a1, MTLCommandBuffer *a2)
{
  LogCommandBuffer(CFSTR("Scheduled"), a2);
}

@end
