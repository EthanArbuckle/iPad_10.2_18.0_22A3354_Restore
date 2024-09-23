@implementation GLPInterfaceBlockObject

uint64_t __deserialize_GLPInterfaceBlockObject_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int IBVariableObjectCount;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  _QWORD *v19;
  unsigned int *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)();
  void *v25;
  uint64_t v26;

  v2 = (*(uint64_t (**)(_QWORD, uint64_t, const char *))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) + 8))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 240), 88, "Deserialized");
  *(_OWORD *)v2 = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_QWORD *)(v2 + 80) = 0;
  *(_QWORD *)v2 = deserialize_GLPString(*(_QWORD *)(a1 + 32));
  *(_QWORD *)(v2 + 8) = v3;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(unsigned int *)(v4 + 260);
  if (v5 >= *(_DWORD *)(v4 + 256))
    goto LABEL_12;
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v4 + 248) + v5);
  *(_DWORD *)(v4 + 260) = v5 + 1;
  *(_BYTE *)(v2 + 32) = v6;
  if (v6)
  {
    v7 = (const char *)deserialize_GLPString(v4);
  }
  else
  {
    v8 = 0xDFA3F2CD0000004BLL;
    v7 = "<<BUG: printing instance name of interface block without an instance name>>";
  }
  *(_QWORD *)(v2 + 16) = v7;
  *(_QWORD *)(v2 + 24) = v8;
  v4 = *(_QWORD *)(a1 + 32);
  v9 = *(unsigned int *)(v4 + 260);
  if (v9 >= *(_DWORD *)(v4 + 256))
LABEL_12:
    glpDeserialError(v4, 1u);
  v10 = *(_QWORD *)(v4 + 248);
  v11 = *(char *)(v10 + v9);
  v12 = *(unsigned __int8 *)(v10 + v9);
  *(_DWORD *)(v4 + 260) = v9 + 1;
  if (v11 < 0)
    __asm { BR              X16 }
  *(_QWORD *)(v2 + 40) = v12;
  v13 = MEMORY[0x24BDAC760];
  v22 = MEMORY[0x24BDAC760];
  v23 = 0x40000000;
  v24 = (uint64_t (*)())__deserialize_GLPLayoutObject_block_invoke;
  v25 = &__block_descriptor_tmp_3;
  v26 = v4;
  deserialize_pointer((unsigned int *)v4, (uint64_t)&v22, (_QWORD *)(v2 + 56));
  v14 = *(unsigned int **)(a1 + 32);
  v22 = v13;
  v23 = 0x40000000;
  v24 = __deserialize_GLPType_block_invoke;
  v25 = &__block_descriptor_tmp_12;
  v26 = (uint64_t)v14;
  deserialize_pointer(v14, (uint64_t)&v22, (_QWORD *)(v2 + 64));
  IBVariableObjectCount = glpGetIBVariableObjectCount(*(_QWORD *)(v2 + 40), *(unsigned int **)(v2 + 64));
  *(_QWORD *)(v2 + 72) = (*(uint64_t (**)(_QWORD, uint64_t, const char *))(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                              + 240)
                                                                                  + 8))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 240), 8 * IBVariableObjectCount, "Deserialized");
  if (IBVariableObjectCount)
  {
    v16 = 0;
    v17 = 8 * IBVariableObjectCount;
    do
    {
      v18 = *(unsigned int **)(a1 + 32);
      v19 = (_QWORD *)(*(_QWORD *)(v2 + 72) + v16);
      v22 = v13;
      v23 = 0x40000000;
      v24 = __deserialize_GLPVariableObject_block_invoke;
      v25 = &__block_descriptor_tmp_6;
      v26 = (uint64_t)v18;
      deserialize_pointer(v18, (uint64_t)&v22, v19);
      v16 += 8;
    }
    while (v17 != v16);
  }
  v20 = *(unsigned int **)(a1 + 32);
  v22 = v13;
  v23 = 0x40000000;
  v24 = (uint64_t (*)())__deserialize_GLPBufferObject_block_invoke;
  v25 = &__block_descriptor_tmp_7;
  v26 = (uint64_t)v20;
  deserialize_pointer(v20, (uint64_t)&v22, (_QWORD *)(v2 + 80));
  return v2;
}

@end
