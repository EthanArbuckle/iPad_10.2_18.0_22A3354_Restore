@implementation BKSCancelTouchesTouchDeliveryPolicy

id __69___BKSCancelTouchesTouchDeliveryPolicy_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", CFSTR("cancel"), 0);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUInt64:withName:format:", *(unsigned int *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("contextID"), 1);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendTimeInterval:withName:decomposeUnits:", CFSTR("initialTouchTimestamp"), 0, *(double *)(*(_QWORD *)(a1 + 40) + 24));
}

@end
