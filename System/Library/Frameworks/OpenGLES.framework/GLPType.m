@implementation GLPType

void __deserialize_GLPType_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  unsigned int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int *v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  unsigned int *v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  unsigned int *v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  unsigned int *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unsigned int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t (*v71)();
  void *v72;
  uint64_t v73;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned int *)(v2 + 260);
  v4 = *(_DWORD *)(v2 + 256);
  if (v3 >= v4)
LABEL_46:
    glpDeserialError(v2, 1u);
  v5 = *(_QWORD *)(v2 + 248);
  v6 = *(char *)(v5 + v3);
  v7 = *(unsigned __int8 *)(v5 + v3);
  v8 = v3 + 1;
  *(_DWORD *)(v2 + 260) = v3 + 1;
  if (v6 < 0)
    __asm { BR              X16 }
  switch((int)v7)
  {
    case 0:
      if (v8 >= v4)
        goto LABEL_46;
      v9 = *(char *)(v5 + v8);
      v10 = *(unsigned __int8 *)(v5 + v8);
      *(_DWORD *)(v2 + 260) = v3 + 2;
      if (v9 < 0)
        __asm { BR              X16 }
      if (v10 >= 0x4F)
        glpDeserialError(v2, 8u);
      glpGetPrimitiveType(v10);
      return;
    case 1:
      if (v8 >= v4)
        goto LABEL_46;
      v11 = *(char *)(v5 + v8);
      v12 = *(unsigned __int8 *)(v5 + v8);
      *(_DWORD *)(v2 + 260) = v3 + 2;
      if (v11 < 0)
        __asm { BR              X16 }
      v31 = v12;
      v66 = (*(uint64_t (**)(_QWORD, uint64_t, const char *))(*(_QWORD *)(v2 + 240) + 8))(**(_QWORD **)(v2 + 240), 8 * v12, "Deserialized");
      v64 = (*(uint64_t (**)(_QWORD, uint64_t, const char *))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) + 8))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 240), 8 * v12, "Deserialized");
      v62 = (*(uint64_t (**)(_QWORD, uint64_t, const char *))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) + 8))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 240), 8 * v12, "Deserialized");
      v60 = (*(uint64_t (**)(_QWORD, uint64_t, const char *))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) + 8))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 240), 16 * v12, "Deserialized");
      if (!(_DWORD)v12)
        goto LABEL_29;
      v32 = (_QWORD *)v62;
      v33 = (_QWORD *)(v60 + 8);
      v34 = MEMORY[0x24BDAC760];
      v35 = (_QWORD *)v64;
      v36 = (_QWORD *)v66;
      do
      {
        v37 = *(unsigned int **)(a1 + 32);
        v69 = v34;
        v70 = 0x40000000;
        v71 = __deserialize_GLPType_block_invoke;
        v72 = &__block_descriptor_tmp_12;
        v73 = (uint64_t)v37;
        deserialize_pointer(v37, (uint64_t)&v69, v36);
        v2 = *(_QWORD *)(a1 + 32);
        v38 = *(unsigned int *)(v2 + 260);
        if (v38 >= *(_DWORD *)(v2 + 256))
          goto LABEL_46;
        v39 = *(_QWORD *)(v2 + 248);
        v40 = *(char *)(v39 + v38);
        v41 = *(unsigned __int8 *)(v39 + v38);
        *(_DWORD *)(v2 + 260) = v38 + 1;
        if (v40 < 0)
          __asm { BR              X15 }
        *v35++ = v41;
        v69 = v34;
        v70 = 0x40000000;
        v71 = (uint64_t (*)())__deserialize_GLPLayoutObject_block_invoke;
        v72 = &__block_descriptor_tmp_3;
        v73 = v2;
        deserialize_pointer((unsigned int *)v2, (uint64_t)&v69, v32);
        *(v33 - 1) = deserialize_GLPString(*(_QWORD *)(a1 + 32));
        *v33 = v42;
        ++v36;
        ++v32;
        v33 += 2;
        --v31;
      }
      while (v31);
LABEL_29:
      v43 = deserialize_GLPString(*(_QWORD *)(a1 + 32));
      glpMakeStructType(*(_QWORD **)(*(_QWORD *)(a1 + 32) + 240), v43, v44, v12, v60, v66, v64, v62);
      return;
    case 2:
      v68 = 0;
      v69 = MEMORY[0x24BDAC760];
      v70 = 0x40000000;
      v71 = __deserialize_GLPType_block_invoke;
      v72 = &__block_descriptor_tmp_12;
      v73 = v2;
      deserialize_pointer((unsigned int *)v2, (uint64_t)&v69, &v68);
      v2 = *(_QWORD *)(a1 + 32);
      v13 = *(unsigned int *)(v2 + 260);
      v14 = *(_DWORD *)(v2 + 256);
      if (v13 >= v14)
        goto LABEL_46;
      v15 = *(_QWORD *)(v2 + 248);
      v16 = *(char *)(v15 + v13);
      v17 = *(unsigned __int8 *)(v15 + v13);
      v18 = v13 + 1;
      *(_DWORD *)(v2 + 260) = v13 + 1;
      if (v16 < 0)
        __asm { BR              X16 }
      if (v18 >= v14)
        goto LABEL_46;
      v45 = *(char *)(v15 + v18);
      v46 = *(unsigned __int8 *)(v15 + v18);
      *(_DWORD *)(v2 + 260) = v13 + 2;
      if (v45 < 0)
        __asm { BR              X16 }
      glpMakeArrayType(*(_QWORD *)(v2 + 240), v68, v17, v46);
      return;
    case 3:
      v68 = 0;
      v69 = MEMORY[0x24BDAC760];
      v70 = 0x40000000;
      v71 = __deserialize_GLPType_block_invoke;
      v72 = &__block_descriptor_tmp_12;
      v73 = v2;
      deserialize_pointer((unsigned int *)v2, (uint64_t)&v69, &v68);
      v2 = *(_QWORD *)(a1 + 32);
      v19 = *(unsigned int *)(v2 + 260);
      v20 = *(_DWORD *)(v2 + 256);
      if (v19 >= v20)
        goto LABEL_46;
      v21 = *(_QWORD *)(v2 + 248);
      v22 = *(char *)(v21 + v19);
      v23 = *(unsigned __int8 *)(v21 + v19);
      v24 = v19 + 1;
      *(_DWORD *)(v2 + 260) = v19 + 1;
      if (v22 < 0)
        __asm { BR              X16 }
      if (v24 >= v20)
        goto LABEL_46;
      v47 = *(char *)(v21 + v24);
      v48 = *(unsigned __int8 *)(v21 + v24);
      *(_DWORD *)(v2 + 260) = v19 + 2;
      if (v47 < 0)
        __asm { BR              X16 }
      glpMakeBankType(*(_QWORD *)(v2 + 240), v48, v68, v23);
      return;
    case 4:
      if (v8 >= v4)
        goto LABEL_46;
      v25 = *(char *)(v5 + v8);
      v26 = *(unsigned __int8 *)(v5 + v8);
      *(_DWORD *)(v2 + 260) = v3 + 2;
      if (v25 < 0)
        __asm { BR              X16 }
      v65 = (*(uint64_t (**)(_QWORD, uint64_t, const char *))(*(_QWORD *)(v2 + 240) + 8))(**(_QWORD **)(v2 + 240), 8 * v26, "Deserialized");
      v63 = (*(uint64_t (**)(_QWORD, uint64_t, const char *))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) + 8))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 240), 8 * v26, "Deserialized");
      v61 = (*(uint64_t (**)(_QWORD, uint64_t, const char *))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) + 8))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 240), 8 * v26, "Deserialized");
      v67 = v26;
      if (!(_DWORD)v26)
        goto LABEL_42;
      v49 = (_QWORD *)v65;
      v50 = v26;
      v51 = MEMORY[0x24BDAC760];
      v53 = (_QWORD *)v61;
      v52 = (_QWORD *)v63;
      break;
    case 5:
      v27 = deserialize_GLPString(v2);
      v29 = v28;
      v68 = 0;
      v30 = *(unsigned int **)(a1 + 32);
      v69 = MEMORY[0x24BDAC760];
      v70 = 0x40000000;
      v71 = (uint64_t (*)())__deserialize_GLPFunctionObject_block_invoke;
      v72 = &__block_descriptor_tmp_5;
      v73 = (uint64_t)v30;
      deserialize_pointer(v30, (uint64_t)&v69, &v68);
      glpMakeSubroutineType(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240), v27, v29, v68);
      return;
    default:
      glpDeserialError(v2, 7u);
  }
  do
  {
    v54 = *(unsigned int **)(a1 + 32);
    v69 = v51;
    v70 = 0x40000000;
    v71 = __deserialize_GLPType_block_invoke;
    v72 = &__block_descriptor_tmp_12;
    v73 = (uint64_t)v54;
    deserialize_pointer(v54, (uint64_t)&v69, v49);
    v2 = *(_QWORD *)(a1 + 32);
    v55 = *(unsigned int *)(v2 + 260);
    if (v55 >= *(_DWORD *)(v2 + 256))
      goto LABEL_46;
    v56 = *(_QWORD *)(v2 + 248);
    v57 = *(char *)(v56 + v55);
    v58 = *(unsigned __int8 *)(v56 + v55);
    *(_DWORD *)(v2 + 260) = v55 + 1;
    if (v57 < 0)
      __asm { BR              X15 }
    *v52++ = v58;
    v69 = v51;
    v70 = 0x40000000;
    v71 = (uint64_t (*)())__deserialize_GLPLayoutObject_block_invoke;
    v72 = &__block_descriptor_tmp_3;
    v73 = v2;
    deserialize_pointer((unsigned int *)v2, (uint64_t)&v69, v53);
    ++v49;
    ++v53;
    --v50;
  }
  while (v50);
LABEL_42:
  v68 = 0;
  v59 = *(unsigned int **)(a1 + 32);
  v69 = MEMORY[0x24BDAC760];
  v70 = 0x40000000;
  v71 = __deserialize_GLPType_block_invoke;
  v72 = &__block_descriptor_tmp_12;
  v73 = (uint64_t)v59;
  deserialize_pointer(v59, (uint64_t)&v69, &v68);
  glpMakeFunctionType(*(_QWORD **)(*(_QWORD *)(a1 + 32) + 240), v68, v67, v65, v63, v61);
}

@end
