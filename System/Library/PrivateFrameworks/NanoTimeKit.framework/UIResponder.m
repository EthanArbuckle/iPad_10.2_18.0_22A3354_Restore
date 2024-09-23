@implementation UIResponder

uint64_t __58__UIResponder__NTKResponderFix___ntk_becomeFirstResponder__block_invoke(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "becomeFirstResponder");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = result;
  }
  return result;
}

@end
