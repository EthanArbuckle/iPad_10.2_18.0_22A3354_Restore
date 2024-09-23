@implementation ZL23softLinkClassMLCompilerv

void *___ZL23softLinkClassMLCompilerv_block_invoke()
{
  void *result;

  if (qword_1EDC0BF40 != -1)
    dispatch_once(&qword_1EDC0BF40, &__block_literal_global_767);
  result = dlsym((void *)qword_1EDC0BF48, "OBJC_CLASS_$_MLCompiler");
  qword_1EDC0BF58 = (uint64_t)result;
  return result;
}

@end
