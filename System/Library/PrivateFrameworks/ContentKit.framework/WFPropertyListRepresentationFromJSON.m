@implementation WFPropertyListRepresentationFromJSON

id __WFPropertyListRepresentationFromJSON_block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, _QWORD *a5)
{
  id result;

  WFPropertyListRepresentationFromJSON(a3);
  result = (id)objc_claimAutoreleasedReturnValue();
  *a5 = result;
  return result;
}

id __WFPropertyListRepresentationFromJSON_block_invoke(uint64_t a1, void *a2)
{
  return WFPropertyListRepresentationFromJSON(a2);
}

@end
