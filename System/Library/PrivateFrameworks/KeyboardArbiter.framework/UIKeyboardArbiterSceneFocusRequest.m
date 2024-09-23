@implementation UIKeyboardArbiterSceneFocusRequest

id __65___UIKeyboardArbiterSceneFocusRequest_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("shouldStealKeyboardOnSuccess"));
}

@end
