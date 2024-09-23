@implementation ZL19getCustomAttributesP10objc

void *___ZL19getCustomAttributesP10objc_class_block_invoke(uint64_t a1)
{
  void *result;

  result = (void *)objc_msgSend((id)registeredFilterConstructors, "valueForKey:", NSStringFromClass(*(Class *)(a1 + 32)));
  if (result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(result, "mutableCopy");
    return (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeObjectForKey:", kCIConstructorKey);
  }
  return result;
}

@end
