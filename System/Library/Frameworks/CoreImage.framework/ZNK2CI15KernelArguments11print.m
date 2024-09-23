@implementation ZNK2CI15KernelArguments11print

char *___ZNK2CI15KernelArguments11print_typesEP7__sFILE_block_invoke(uint64_t a1, int a2)
{
  if (a2 > 47)
    return 0;
  else
    return CI::KernelArguments::name_for_type(CI::KernelArgumentType)::names[a2];
}

@end
