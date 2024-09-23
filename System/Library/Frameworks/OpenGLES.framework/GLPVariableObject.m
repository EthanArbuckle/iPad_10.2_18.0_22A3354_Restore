@implementation GLPVariableObject

uint64_t __deserialize_GLPVariableObject_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int *v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  unsigned int *v16;
  uint64_t v17;
  unsigned int *v18;
  unsigned int *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)();
  void *v31;
  uint64_t v32;
  uint64_t v33;

  v2 = (*(uint64_t (**)(_QWORD, uint64_t, const char *))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) + 8))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 240), 160, "Deserialized");
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
  v3 = MEMORY[0x24BDAC760];
  v4 = *(unsigned int **)(a1 + 32);
  v28 = MEMORY[0x24BDAC760];
  v29 = 0x40000000;
  v30 = __deserialize_GLPType_block_invoke;
  v31 = &__block_descriptor_tmp_12;
  v32 = (uint64_t)v4;
  deserialize_pointer(v4, (uint64_t)&v28, (_QWORD *)v2);
  v5 = *(unsigned int **)(a1 + 32);
  v28 = v3;
  v29 = 0x40000000;
  v30 = (uint64_t (*)())__deserialize_GLPLayoutObject_block_invoke;
  v31 = &__block_descriptor_tmp_3;
  v32 = (uint64_t)v5;
  deserialize_pointer(v5, (uint64_t)&v28, (_QWORD *)(v2 + 8));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(unsigned int *)(v6 + 260);
  if (v7 >= *(_DWORD *)(v6 + 256))
    goto LABEL_12;
  v8 = *(_QWORD *)(v6 + 248);
  v9 = *(char *)(v8 + v7);
  v10 = *(unsigned __int8 *)(v8 + v7);
  *(_DWORD *)(v6 + 260) = v7 + 1;
  if (v9 < 0)
    __asm { BR              X16 }
  *(_QWORD *)(v2 + 48) = v10;
  *(_QWORD *)(v2 + 16) = deserialize_GLPString(v6);
  *(_QWORD *)(v2 + 24) = v11;
  *(_QWORD *)(v2 + 32) = deserialize_GLPString(*(_QWORD *)(a1 + 32));
  *(_QWORD *)(v2 + 40) = v12;
  v6 = *(_QWORD *)(a1 + 32);
  v13 = *(unsigned int *)(v6 + 260);
  if (v13 >= *(_DWORD *)(v6 + 256))
    goto LABEL_12;
  v14 = *(_BYTE *)(*(_QWORD *)(v6 + 248) + v13);
  *(_DWORD *)(v6 + 260) = v13 + 1;
  *(_BYTE *)(v2 + 56) = v14;
  v15 = *(_QWORD *)v2;
  v28 = v3;
  v29 = 0x40000000;
  v30 = (uint64_t (*)())__deserialize_GLPValue_block_invoke;
  v31 = &__block_descriptor_tmp_2;
  v32 = v6;
  v33 = v15;
  deserialize_pointer((unsigned int *)v6, (uint64_t)&v28, (_QWORD *)(v2 + 64));
  v16 = *(unsigned int **)(a1 + 32);
  v17 = *(_QWORD *)v2;
  v28 = v3;
  v29 = 0x40000000;
  v30 = (uint64_t (*)())__deserialize_GLPValue_block_invoke;
  v31 = &__block_descriptor_tmp_2;
  v32 = (uint64_t)v16;
  v33 = v17;
  deserialize_pointer(v16, (uint64_t)&v28, (_QWORD *)(v2 + 72));
  v18 = *(unsigned int **)(a1 + 32);
  v28 = v3;
  v29 = 0x40000000;
  v30 = (uint64_t (*)())__deserialize_GLPInterfaceBlockObject_block_invoke;
  v31 = &__block_descriptor_tmp_9;
  v32 = (uint64_t)v18;
  deserialize_pointer(v18, (uint64_t)&v28, (_QWORD *)(v2 + 80));
  v19 = *(unsigned int **)(a1 + 32);
  v28 = v3;
  v29 = 0x40000000;
  v30 = (uint64_t (*)())__deserialize_GLPBufferObject_block_invoke;
  v31 = &__block_descriptor_tmp_7;
  v32 = (uint64_t)v19;
  deserialize_pointer(v19, (uint64_t)&v28, (_QWORD *)(v2 + 88));
  v6 = *(_QWORD *)(a1 + 32);
  v20 = *(unsigned int *)(v6 + 260);
  if (v20 >= *(_DWORD *)(v6 + 256))
    goto LABEL_12;
  v21 = *(_QWORD *)(v6 + 248);
  v22 = *(char *)(v21 + v20);
  v23 = *(unsigned __int8 *)(v21 + v20);
  *(_DWORD *)(v6 + 260) = v20 + 1;
  if (v22 < 0)
    __asm { BR              X16 }
  *(_DWORD *)(v2 + 96) = v23;
  v24 = *(unsigned int *)(v6 + 260);
  if (v24 >= *(_DWORD *)(v6 + 256))
LABEL_12:
    glpDeserialError(v6, 1u);
  v25 = *(char *)(v21 + v24);
  v26 = *(unsigned __int8 *)(v21 + v24);
  *(_DWORD *)(v6 + 260) = v24 + 1;
  if (v25 < 0)
    __asm { BR              X16 }
  *(_DWORD *)(v2 + 100) = v26;
  return v2;
}

@end
