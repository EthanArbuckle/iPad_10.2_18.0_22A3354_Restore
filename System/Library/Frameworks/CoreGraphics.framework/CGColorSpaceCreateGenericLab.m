@implementation CGColorSpaceCreateGenericLab

void __CGColorSpaceCreateGenericLab_block_invoke()
{
  char *lab;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int *v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;

  lab = color_space_state_create_lab((uint64_t)&xmmword_184F7CCA0, default_black_point_17149, (__int128 *)generic_lab_range, CFSTR("Generic Lab color space"), CFSTR("Generic Lab Profile"));
  if (lab)
  {
    v8 = (unsigned int *)lab;
    *((_QWORD *)lab + 9) = CFSTR("kCGColorSpaceGenericLab");
    lab[8] = 1;
    v9 = CGColorSpaceCreateWithState((unsigned int *)lab, v1, v2, v3, v4, v5, v6, v7);
    do
    {
      v10 = __ldxr(v8);
      v11 = v10 - 1;
    }
    while (__stxr(v11, v8));
    if (!v11)
      color_space_state_dealloc((uint64_t)v8);
  }
  else
  {
    v9 = 0;
  }
  CGColorSpaceCreateGenericLab_space = v9;
}

@end
