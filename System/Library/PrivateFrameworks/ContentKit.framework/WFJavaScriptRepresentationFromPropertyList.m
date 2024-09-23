@implementation WFJavaScriptRepresentationFromPropertyList

uint64_t __WFJavaScriptRepresentationFromPropertyList_block_invoke(uint64_t a1, uint64_t a2)
{
  return WFJavaScriptRepresentationFromPropertyList(a2, *(_QWORD *)(a1 + 32));
}

void __WFJavaScriptRepresentationFromPropertyList_block_invoke_2(uint64_t a1, void *a2, void *a3, _QWORD *a4, _QWORD *a5)
{
  id v9;
  id v10;

  v10 = a2;
  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v10, "description");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  WFJavaScriptRepresentationFromPropertyList(v9, *(_QWORD *)(a1 + 32));
  *a5 = (id)objc_claimAutoreleasedReturnValue();

}

@end
