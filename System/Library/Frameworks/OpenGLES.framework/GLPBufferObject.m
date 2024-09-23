@implementation GLPBufferObject

uint64_t __deserialize_GLPBufferObject_block_invoke(uint64_t a1)
{
  uint64_t v2;
  unsigned int *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  _QWORD v14[5];

  v2 = (*(uint64_t (**)(_QWORD, uint64_t, const char *))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) + 8))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 240), 32, "Deserialized");
  *(_OWORD *)v2 = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  v3 = *(unsigned int **)(a1 + 32);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 0x40000000;
  v14[2] = __deserialize_GLPType_block_invoke;
  v14[3] = &__block_descriptor_tmp_12;
  v14[4] = v3;
  deserialize_pointer(v3, (uint64_t)v14, (_QWORD *)v2);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(unsigned int *)(v4 + 260);
  v6 = *(_DWORD *)(v4 + 256);
  if (v5 >= v6)
    goto LABEL_8;
  v7 = *(_QWORD *)(v4 + 248);
  v8 = *(char *)(v7 + v5);
  v9 = *(unsigned __int8 *)(v7 + v5);
  v10 = v5 + 1;
  *(_DWORD *)(v4 + 260) = v5 + 1;
  if (v8 < 0)
    __asm { BR              X16 }
  *(_DWORD *)(v2 + 8) = v9;
  if (v10 >= v6)
LABEL_8:
    glpDeserialError(v4, 1u);
  v11 = *(char *)(v7 + v10);
  v12 = *(unsigned __int8 *)(v7 + v10);
  *(_DWORD *)(v4 + 260) = v5 + 2;
  if (v11 < 0)
    __asm { BR              X16 }
  *(_DWORD *)(v2 + 12) = v12;
  return v2;
}

@end
