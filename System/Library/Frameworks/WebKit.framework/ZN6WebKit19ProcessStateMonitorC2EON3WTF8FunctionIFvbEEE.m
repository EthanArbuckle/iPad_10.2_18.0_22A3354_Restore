@implementation ZN6WebKit19ProcessStateMonitorC2EON3WTF8FunctionIFvbEEE

unsigned int *___ZN6WebKit19ProcessStateMonitorC2EON3WTF8FunctionIFvbEEE_block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD *v5;
  unsigned int *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *result;
  unsigned int v12;
  unsigned int v13;
  _QWORD v14[4];
  WTF *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
  objc_msgSend(v4, "setValues:", 24);
  objc_msgSend(a2, "setStateDescriptor:", v4);
  v16[0] = objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingHandle:", objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess"));
  objc_msgSend(a2, "setPredicates:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1));
  v5 = (_QWORD *)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3321888768;
  v14[2] = ___ZZN6WebKit19ProcessStateMonitorC1EON3WTF8FunctionIFvbEEEEN3__1clEPU39objcproto28RBSProcessMonitorConfiguring11objc_object_block_invoke;
  v14[3] = &__block_descriptor_40_e8_32c194_ZTSKZZN6WebKit19ProcessStateMonitorC1EON3WTF8FunctionIFvbEEEEN3__1clEPU39objcproto28RBSProcessMonitorConfiguring11objc_objectEUlP17RBSProcessMonitorP16RBSProcessHandleP21RBSProcessStateUpdateE__e74_v32__0__RBSProcessMonitor_8__RBSProcessHandle_16__RBSProcessStateUpdate_24l;
  v6 = *(unsigned int **)(a1 + 32);
  *v5 = 0;
  if (v6)
  {
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 + 1, v6));
  }
  v15 = (WTF *)v6;
  objc_msgSend(a2, "setUpdateHandler:", v14);
  if (v6)
  {
    do
    {
      v9 = __ldaxr(v6);
      v10 = v9 - 1;
    }
    while (__stlxr(v10, v6));
    if (!v10)
    {
      atomic_store(1u, v6);
      WTF::fastFree((WTF *)v6, v8);
    }
  }
  result = (unsigned int *)v15;
  v15 = 0;
  if (result)
  {
    do
    {
      v12 = __ldaxr(result);
      v13 = v12 - 1;
    }
    while (__stlxr(v13, result));
    if (!v13)
    {
      atomic_store(1u, result);
      return (unsigned int *)WTF::fastFree((WTF *)result, v8);
    }
  }
  return result;
}

@end
