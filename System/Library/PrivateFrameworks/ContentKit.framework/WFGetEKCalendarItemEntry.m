@implementation WFGetEKCalendarItemEntry

id __WFGetEKCalendarItemEntry_block_invoke_2(uint64_t a1, void *a2)
{
  return WFGetEKCalendarItemFromSerializedRepresentation(a2);
}

id __WFGetEKCalendarItemEntry_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  getEKCalendarItemClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WFGetSerializedRepresentationForEKCalendarItem(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
