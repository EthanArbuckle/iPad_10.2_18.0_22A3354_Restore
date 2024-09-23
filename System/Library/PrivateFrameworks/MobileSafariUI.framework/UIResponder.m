@implementation UIResponder

- (uint64_t)safari_becomeFirstResponderIfNeeded
{
  void *v1;

  if (result)
  {
    v1 = (void *)result;
    result = objc_msgSend((id)result, "sf_inResponderChain");
    if ((result & 1) == 0)
      return objc_msgSend(v1, "becomeFirstResponder");
  }
  return result;
}

@end
