@implementation IdentityProofingOptionsFromStringsArray

void __IdentityProofingOptionsFromStringsArray_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  if ((objc_msgSend(v6, "isEqual:", CFSTR("IdentityProofingOptionsPhone")) & 1) != 0)
  {
    v3 = 1;
    v4 = v6;
LABEL_5:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= v3;
    goto LABEL_6;
  }
  v5 = objc_msgSend(v6, "isEqual:", CFSTR("IdentityProofingOptionsWatch"));
  v4 = v6;
  if (v5)
  {
    v3 = 2;
    goto LABEL_5;
  }
LABEL_6:

}

@end
