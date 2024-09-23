@implementation APBrokerGroupRemoveBroker

_QWORD *__APBrokerGroupRemoveBroker_block_invoke(_QWORD *result, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  const void *GroupID;

  if (!*(_QWORD *)(result[4] + 48))
  {
    v3 = result;
    GroupID = (const void *)APBrokerGroupGetGroupID(a3);
    result = CFRetain(GroupID);
    *(_QWORD *)(v3[4] + 48) = result;
  }
  return result;
}

@end
