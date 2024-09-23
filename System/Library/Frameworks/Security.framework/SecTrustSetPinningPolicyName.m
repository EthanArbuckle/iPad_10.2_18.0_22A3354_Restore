@implementation SecTrustSetPinningPolicyName

void __SecTrustSetPinningPolicyName_block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SecPolicySetName(a2, *(CFTypeRef *)(a1 + 32));
  v3 = secLogObjForScope("SecPinningDb");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_debug_impl(&dword_18A900000, v3, OS_LOG_TYPE_DEBUG, "Set %@ as name on all policies", (uint8_t *)&v5, 0xCu);
  }
}

void __SecTrustSetPinningPolicyName_block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFArray *v2;
  _QWORD context[5];
  CFRange v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(const __CFArray **)(*(_QWORD *)(a1 + 32) + 32);
  context[0] = MEMORY[0x1E0C809B0];
  context[1] = 0x40000000;
  context[2] = __SecTrustSetPinningPolicyName_block_invoke_2;
  context[3] = &__block_descriptor_tmp_59_11538;
  context[4] = v1;
  v4.length = CFArrayGetCount(v2);
  v4.location = 0;
  CFArrayApplyFunction(v2, v4, (CFArrayApplierFunction)apply_block_1_11511, context);
}

@end
