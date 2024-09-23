@implementation GTMTLShaderDebugger

void __GTMTLShaderDebugger_executeCommandEncoder_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "status") == (char *)&dword_4 + 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "error"));
    v4 = objc_msgSend(v3, "copy");
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

@end
