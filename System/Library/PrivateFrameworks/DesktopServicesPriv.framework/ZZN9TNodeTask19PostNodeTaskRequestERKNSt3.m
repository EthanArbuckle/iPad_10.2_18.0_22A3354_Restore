@implementation ZZN9TNodeTask19PostNodeTaskRequestERKNSt3

TNodeTask *___ZZN9TNodeTask19PostNodeTaskRequestERKNSt3__110shared_ptrIS_EERKNS1_I17TVolumeSyncThreadEEENK3__0clEv_block_invoke(uint64_t a1)
{
  TNode *v2;
  TNodeTask *result;

  if (*(_BYTE *)(a1 + 72))
  {
    v2 = (TNode *)TNodeFromFINode(*(FINode **)(a1 + 32));
    TNode::ClearSyncRequested(v2);
  }
  result = (TNodeTask *)TVolumeSyncThread::SynchingCanceled(*(TVolumeSyncThread **)(a1 + 40));
  if ((result & 1) == 0)
    return TNode::HandleNodeRequest((id **)(a1 + 56));
  return result;
}

@end
