@implementation GLPFunctionObject

uint64_t __deserialize_GLPFunctionObject_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int *v28;
  _QWORD *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t);
  void *v34;
  uint64_t v35;

  v2 = (*(uint64_t (**)(_QWORD, uint64_t, const char *))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) + 8))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 240), 168, "Deserialized");
  *(_OWORD *)v2 = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_OWORD *)(v2 + 80) = 0u;
  *(_OWORD *)(v2 + 96) = 0u;
  *(_OWORD *)(v2 + 112) = 0u;
  *(_OWORD *)(v2 + 128) = 0u;
  *(_OWORD *)(v2 + 144) = 0u;
  *(_QWORD *)(v2 + 160) = 0;
  v3 = MEMORY[0x24BDAC760];
  v4 = *(unsigned int **)(a1 + 32);
  v31 = MEMORY[0x24BDAC760];
  v32 = 0x40000000;
  v33 = (uint64_t (*)(uint64_t))__deserialize_GLPType_block_invoke;
  v34 = &__block_descriptor_tmp_12;
  v35 = (uint64_t)v4;
  deserialize_pointer(v4, (uint64_t)&v31, (_QWORD *)v2);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(unsigned int *)(v5 + 260);
  if (v6 >= *(_DWORD *)(v5 + 256))
    goto LABEL_17;
  v7 = *(_QWORD *)(v5 + 248);
  v8 = *(char *)(v7 + v6);
  v9 = *(unsigned __int8 *)(v7 + v6);
  *(_DWORD *)(v5 + 260) = v6 + 1;
  if (v8 < 0)
    __asm { BR              X16 }
  *(_QWORD *)(v2 + 8) = v9;
  *(_QWORD *)(v2 + 24) = deserialize_GLPString(v5);
  *(_QWORD *)(v2 + 32) = v10;
  *(_QWORD *)(v2 + 40) = deserialize_GLPString(*(_QWORD *)(a1 + 32));
  *(_QWORD *)(v2 + 48) = v11;
  v12 = *(unsigned int **)(a1 + 32);
  v31 = v3;
  v32 = 0x40000000;
  v33 = __deserialize_GLPASTNode_block_invoke;
  v34 = &__block_descriptor_tmp_16_0;
  v35 = (uint64_t)v12;
  deserialize_pointer(v12, (uint64_t)&v31, (_QWORD *)(v2 + 56));
  v13 = *(unsigned int **)(a1 + 32);
  v31 = v3;
  v32 = 0x40000000;
  v33 = __deserialize_GLPASTNode_block_invoke;
  v34 = &__block_descriptor_tmp_16_0;
  v35 = (uint64_t)v13;
  deserialize_pointer(v13, (uint64_t)&v31, (_QWORD *)(v2 + 64));
  v5 = *(_QWORD *)(a1 + 32);
  v14 = *(unsigned int *)(v5 + 260);
  if (v14 >= *(_DWORD *)(v5 + 256))
    goto LABEL_17;
  v15 = *(_QWORD *)(v5 + 248);
  v16 = *(char *)(v15 + v14);
  v17 = *(unsigned __int8 *)(v15 + v14);
  *(_DWORD *)(v5 + 260) = v14 + 1;
  if (v16 < 0)
    __asm { BR              X16 }
  *(_DWORD *)(v2 + 88) = v17;
  v31 = v3;
  v32 = 0x40000000;
  v33 = __deserialize_GLPVariableObject_block_invoke;
  v34 = &__block_descriptor_tmp_6;
  v35 = v5;
  deserialize_pointer((unsigned int *)v5, (uint64_t)&v31, (_QWORD *)(v2 + 72));
  *(_QWORD *)(v2 + 80) = (*(uint64_t (**)(_QWORD, uint64_t, const char *))(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                              + 240)
                                                                                  + 8))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 240), 8 * v17, "Deserialized");
  if ((_DWORD)v17)
  {
    v18 = 0;
    v19 = 8 * v17;
    do
    {
      v20 = *(unsigned int **)(a1 + 32);
      v21 = (_QWORD *)(*(_QWORD *)(v2 + 80) + v18);
      v31 = v3;
      v32 = 0x40000000;
      v33 = __deserialize_GLPVariableObject_block_invoke;
      v34 = &__block_descriptor_tmp_6;
      v35 = (uint64_t)v20;
      deserialize_pointer(v20, (uint64_t)&v31, v21);
      v18 += 8;
    }
    while (v19 != v18);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v22 = *(unsigned int *)(v5 + 260);
  if (v22 >= *(_DWORD *)(v5 + 256))
LABEL_17:
    glpDeserialError(v5, 1u);
  v23 = *(_QWORD *)(v5 + 248);
  v24 = *(char *)(v23 + v22);
  v25 = *(unsigned __int8 *)(v23 + v22);
  *(_DWORD *)(v5 + 260) = v22 + 1;
  if (v24 < 0)
    __asm { BR              X16 }
  *(_DWORD *)(v2 + 96) = v25;
  *(_QWORD *)(v2 + 104) = (*(uint64_t (**)(_QWORD, uint64_t, const char *))(*(_QWORD *)(v5 + 240) + 8))(**(_QWORD **)(v5 + 240), 8 * v25, "Deserialized");
  if ((_DWORD)v25)
  {
    v26 = 0;
    v27 = 8 * v25;
    do
    {
      v28 = *(unsigned int **)(a1 + 32);
      v29 = (_QWORD *)(*(_QWORD *)(v2 + 104) + v26);
      v31 = v3;
      v32 = 0x40000000;
      v33 = (uint64_t (*)(uint64_t))__deserialize_GLPType_block_invoke;
      v34 = &__block_descriptor_tmp_12;
      v35 = (uint64_t)v28;
      deserialize_pointer(v28, (uint64_t)&v31, v29);
      v26 += 8;
    }
    while (v27 != v26);
  }
  return v2;
}

@end
