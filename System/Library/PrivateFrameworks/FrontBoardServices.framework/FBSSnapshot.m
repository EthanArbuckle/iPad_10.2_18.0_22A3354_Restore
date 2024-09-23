@implementation FBSSnapshot

uint64_t __23___FBSSnapshot_capture__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __23___FBSSnapshot_CGImage__block_invoke(uint64_t a1, int a2)
{
  _QWORD *v2;
  void *v4;
  BOOL v5;
  id v6;
  id v7;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[2] && !v2[4])
  {
    v4 = (void *)v2[3];
    if (v4)
      v5 = a2 == 0;
    else
      v5 = 1;
    if (!v5)
    {
      objc_msgSend(v4, "CGImageBuilder");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v6 = (id)objc_msgSend(v7, "setOpaque:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isOpaque"));
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = objc_msgSend(v7, "buildCGImage");

    }
  }
}

@end
