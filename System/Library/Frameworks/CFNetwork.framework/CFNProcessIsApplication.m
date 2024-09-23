@implementation CFNProcessIsApplication

uint64_t ____CFNProcessIsApplication_block_invoke(double a1)
{
  uint64_t v1;
  uint64_t result;

  gotLoadHelper_x19__OBJC_CLASS___RBSProcessHandle(a1);
  result = objc_opt_class();
  if (result)
    result = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 3424), "currentProcess"), "isApplication");
  __CFNProcessIsApplication::result = result;
  return result;
}

@end
