@implementation NTPBPersonalizationAggregateDelta

IMP __75__NTPBPersonalizationAggregateDelta_FCBugFixSwizzle__fc_swizzleFor24117796__block_invoke()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  void (*v2)(void);

  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel_addEvents_);
  v2 = imp_implementationWithBlock(&__block_literal_global_14_2);
  return method_setImplementation(InstanceMethod, v2);
}

void __75__NTPBPersonalizationAggregateDelta_FCBugFixSwizzle__fc_swizzleFor24117796__block_invoke_2(uint64_t a1, void *a2, int a3)
{
  char *v4;
  char *v5;
  uint64_t v6;
  _DWORD *v7;
  uint64_t v8;
  char *v9;
  char *v10;

  v4 = a2;
  v5 = &v4[*MEMORY[0x1E0D628D8]];
  v6 = *((_QWORD *)v5 + 2);
  if (v6 && *((_QWORD *)v5 + 1) == v6)
  {
    if (v6 >= 1)
    {
      v9 = v4;
      v7 = malloc_type_realloc(*(void **)v5, 8 * v6, 0x100004052888210uLL);
      v4 = v9;
      if (v7)
      {
        *((_QWORD *)v5 + 2) = 2 * v6;
        v8 = *((_QWORD *)v5 + 1);
        v7[v8] = a3;
        *(_QWORD *)v5 = v7;
        *((_QWORD *)v5 + 1) = v8 + 1;
      }
    }
  }
  else
  {
    v10 = v4;
    PBRepeatedUInt32Add();
    v4 = v10;
  }

}

@end
