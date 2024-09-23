@implementation BKSShareTouchesTouchDeliveryPolicy

id __68___BKSShareTouchesTouchDeliveryPolicy_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", CFSTR("share"), 0);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUInt64:withName:format:", *(unsigned int *)(*(_QWORD *)(a1 + 40) + 12), CFSTR("hostContextID"), 1);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendUInt64:withName:format:", *(unsigned int *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("childContextID"), 1);
}

@end
