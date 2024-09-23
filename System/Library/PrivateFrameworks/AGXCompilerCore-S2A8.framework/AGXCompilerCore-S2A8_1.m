char *sub_21DF923BC(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  void **v6;
  uint64_t i;
  const std::string::value_type **v8;
  int v9;
  const std::string::value_type *v10;
  std::string::size_type v11;
  uint64_t j;
  const std::string::value_type **v13;
  int v14;
  const std::string::value_type *v15;
  std::string::size_type v16;
  uint64_t k;
  llvm::Type **v18;
  _QWORD *v19;
  double v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[3];
  std::string __dst;

  sub_21DF1AF28(v53, "tess_b3_0_");
  sub_21DF1AF28(v54, "tess_b3_1_");
  v6 = (void **)&v53[3 * (*a3 & 3)];
  if (*((char *)v6 + 23) < 0)
    sub_21DF205EC(&__dst, *v6, (unint64_t)v6[1]);
  else
    __dst = *(std::string *)v6;
  for (i = 0; i != -6; i -= 3)
  {
    if (SHIBYTE(v54[i + 2]) < 0)
      operator delete((void *)v53[i + 3]);
  }
  sub_21DF1AF28(v53, "0_");
  sub_21DF1AF28(v54, "1_");
  sub_21DF1AF28(v55, "2_");
  sub_21DF1AF28(v56, "3_");
  v8 = (const std::string::value_type **)&v53[3 * ((*a3 >> 2) & 7)];
  v9 = *((char *)v8 + 23);
  if (v9 >= 0)
    v10 = (const std::string::value_type *)&v53[3 * ((*a3 >> 2) & 7)];
  else
    v10 = *v8;
  if (v9 >= 0)
    v11 = *((unsigned __int8 *)v8 + 23);
  else
    v11 = (std::string::size_type)v8[1];
  std::string::append(&__dst, v10, v11);
  for (j = 0; j != -12; j -= 3)
  {
    if (SHIBYTE(v56[j + 2]) < 0)
      operator delete((void *)v56[j]);
  }
  sub_21DF1AF28(v53, "0");
  sub_21DF1AF28(v54, "1");
  sub_21DF1AF28(v55, "2");
  sub_21DF1AF28(v56, "3");
  v13 = (const std::string::value_type **)&v53[3 * (*a3 >> 5)];
  v14 = *((char *)v13 + 23);
  if (v14 >= 0)
    v15 = (const std::string::value_type *)&v53[3 * (*a3 >> 5)];
  else
    v15 = *v13;
  if (v14 >= 0)
    v16 = *((unsigned __int8 *)v13 + 23);
  else
    v16 = (std::string::size_type)v13[1];
  std::string::append(&__dst, v15, v16);
  for (k = 0; k != -12; k -= 3)
  {
    if (SHIBYTE(v56[k + 2]) < 0)
      operator delete((void *)v56[k]);
  }
  v18 = (llvm::Type **)sub_21DF2CCE8(a2, (const UInt8 *)&__dst);
  v19 = (_QWORD *)operator new();
  sub_21DF2E500((uint64_t)(v19 + 573), a1, *v18);
  v20 = sub_21DF90F44((uint64_t)v19, (uint64_t *)off_24E1F3BA0, (uint64_t)v18, (uint64_t)a3);
  *v19 = &off_24E1F3938;
  v19[573] = &unk_24E1F3B38;
  v21 = (*(uint64_t (**)(_QWORD, double))(**(_QWORD **)(v19[616] + 792) + 48))(*(_QWORD *)(v19[616] + 792), v20);
  v22 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "internalPerPatch_ID", 0x13uLL);
  *(_QWORD *)(v22 + 8) = 1;
  *(_DWORD *)(v22 + 16) = v21;
  *(_QWORD *)(v22 + 20) = 0;
  v23 = *(_QWORD *)(*(_QWORD *)((char *)v19 + *(_QWORD *)(*v19 - 24) + 344) + 792);
  v24 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v23 + 56))(v23);
  v25 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "internalPerPatch_Data", 0x15uLL);
  *(_QWORD *)(v25 + 8) = 2;
  *(_DWORD *)(v25 + 16) = v24;
  *(_QWORD *)(v25 + 20) = 0;
  v26 = *(_QWORD *)(*(_QWORD *)((char *)v19 + *(_QWORD *)(*v19 - 24) + 344) + 792);
  v27 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v26 + 40))(v26);
  v28 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "tessFactors", 0xBuLL);
  *(_QWORD *)(v28 + 8) = 3;
  *(_DWORD *)(v28 + 16) = v27;
  *(_QWORD *)(v28 + 20) = 0;
  v29 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "tessFactorScale", 0xFuLL);
  *(_OWORD *)(v29 + 8) = xmmword_21DFA61B0;
  *(_DWORD *)(v29 + 24) = 2;
  v30 = *(_QWORD *)(*(_QWORD *)((char *)v19 + *(_QWORD *)(*v19 - 24) + 344) + 792);
  v31 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v30 + 88))(v30);
  v32 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "internalInstanceCounts", 0x16uLL);
  *(_QWORD *)(v32 + 8) = 5;
  *(_DWORD *)(v32 + 16) = v31;
  *(_QWORD *)(v32 + 20) = 0;
  v33 = *(_QWORD *)(*(_QWORD *)((char *)v19 + *(_QWORD *)(*v19 - 24) + 344) + 792);
  v34 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v33 + 64))(v33);
  v35 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "internalDrawIndexOffsets", 0x18uLL);
  *(_QWORD *)(v35 + 8) = 6;
  *(_DWORD *)(v35 + 16) = v34;
  *(_QWORD *)(v35 + 20) = 0;
  v36 = *(_QWORD *)(*(_QWORD *)((char *)v19 + *(_QWORD *)(*v19 - 24) + 344) + 792);
  v37 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v36 + 96))(v36);
  v38 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "packedInternalInstanceIDs", 0x19uLL);
  *(_QWORD *)(v38 + 8) = 7;
  *(_DWORD *)(v38 + 16) = v37;
  *(_QWORD *)(v38 + 20) = 0;
  v39 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "instanceCount", 0xDuLL);
  *(_OWORD *)(v39 + 8) = xmmword_21DFA61C0;
  *(_DWORD *)(v39 + 24) = 1;
  v40 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "patchCount", 0xAuLL);
  *(_OWORD *)(v40 + 8) = xmmword_21DFA61D0;
  *(_DWORD *)(v40 + 24) = 0;
  v41 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "instanceStrideInTessFactorUnits", 0x1FuLL);
  *(_OWORD *)(v41 + 8) = xmmword_21DFA61E0;
  *(_DWORD *)(v41 + 24) = 4;
  v42 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "patchStart", 0xAuLL);
  *(_OWORD *)(v42 + 8) = xmmword_21DFA61F0;
  *(_DWORD *)(v42 + 24) = 0;
  v43 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "baseInstance", 0xCuLL);
  *(_OWORD *)(v43 + 8) = xmmword_21DFA6200;
  *(_DWORD *)(v43 + 24) = 6;
  v44 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "patchCountMultiplier", 0x14uLL);
  *(_OWORD *)(v44 + 8) = xmmword_21DFA6220;
  *(_DWORD *)(v44 + 24) = 10;
  v45 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "patchCountShift", 0xFuLL);
  *(_OWORD *)(v45 + 8) = xmmword_21DFA6230;
  *(_DWORD *)(v45 + 24) = 11;
  v46 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "instanceCountMultiplier", 0x17uLL);
  *(_OWORD *)(v46 + 8) = xmmword_21DFA6240;
  *(_DWORD *)(v46 + 24) = 12;
  v47 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "instanceCountShift", 0x12uLL);
  *(_OWORD *)(v47 + 8) = xmmword_21DFA6250;
  *(_DWORD *)(v47 + 24) = 13;
  v48 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "patchCountTimesInstanceCountMultiplier", 0x26uLL);
  *(_OWORD *)(v48 + 8) = xmmword_21DFA6260;
  *(_DWORD *)(v48 + 24) = 14;
  v49 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "patchCountTimesInstanceCountShift", 0x21uLL);
  *(_OWORD *)(v49 + 8) = xmmword_21DFA6270;
  *(_DWORD *)(v49 + 24) = 15;
  v50 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "maxTessellationFactor", 0x15uLL);
  *(_OWORD *)(v50 + 8) = xmmword_21DFA6210;
  *(_DWORD *)(v50 + 24) = 16;
  v51 = *(_QWORD *)(*v19 - 24);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  return (char *)v19 + v51;
}

char *sub_21DF92A64(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  void **v6;
  uint64_t i;
  const std::string::value_type **v8;
  int v9;
  const std::string::value_type *v10;
  std::string::size_type v11;
  uint64_t j;
  const std::string::value_type **v13;
  int v14;
  const std::string::value_type *v15;
  std::string::size_type v16;
  uint64_t k;
  llvm::Type **v18;
  _QWORD *v19;
  double v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[3];
  std::string __dst;

  sub_21DF1AF28(v38, "tess_b1_0_");
  sub_21DF1AF28(v39, "tess_b1_1_");
  v6 = (void **)&v38[3 * (*a3 & 3)];
  if (*((char *)v6 + 23) < 0)
    sub_21DF205EC(&__dst, *v6, (unint64_t)v6[1]);
  else
    __dst = *(std::string *)v6;
  for (i = 0; i != -6; i -= 3)
  {
    if (SHIBYTE(v39[i + 2]) < 0)
      operator delete((void *)v38[i + 3]);
  }
  sub_21DF1AF28(v38, "0_");
  sub_21DF1AF28(v39, "1_");
  sub_21DF1AF28(v40, "2_");
  sub_21DF1AF28(v41, "3_");
  v8 = (const std::string::value_type **)&v38[3 * ((*a3 >> 2) & 7)];
  v9 = *((char *)v8 + 23);
  if (v9 >= 0)
    v10 = (const std::string::value_type *)&v38[3 * ((*a3 >> 2) & 7)];
  else
    v10 = *v8;
  if (v9 >= 0)
    v11 = *((unsigned __int8 *)v8 + 23);
  else
    v11 = (std::string::size_type)v8[1];
  std::string::append(&__dst, v10, v11);
  for (j = 0; j != -12; j -= 3)
  {
    if (SHIBYTE(v41[j + 2]) < 0)
      operator delete((void *)v41[j]);
  }
  sub_21DF1AF28(v38, "0");
  sub_21DF1AF28(v39, "1");
  sub_21DF1AF28(v40, "2");
  sub_21DF1AF28(v41, "3");
  v13 = (const std::string::value_type **)&v38[3 * (*a3 >> 5)];
  v14 = *((char *)v13 + 23);
  if (v14 >= 0)
    v15 = (const std::string::value_type *)&v38[3 * (*a3 >> 5)];
  else
    v15 = *v13;
  if (v14 >= 0)
    v16 = *((unsigned __int8 *)v13 + 23);
  else
    v16 = (std::string::size_type)v13[1];
  std::string::append(&__dst, v15, v16);
  for (k = 0; k != -12; k -= 3)
  {
    if (SHIBYTE(v41[k + 2]) < 0)
      operator delete((void *)v41[k]);
  }
  v18 = (llvm::Type **)sub_21DF2CCE8(a2, (const UInt8 *)&__dst);
  v19 = (_QWORD *)operator new();
  sub_21DF2E500((uint64_t)(v19 + 573), a1, *v18);
  v20 = sub_21DF90F44((uint64_t)v19, (uint64_t *)off_24E1F3E88, (uint64_t)v18, (uint64_t)a3);
  *v19 = &off_24E1F3C20;
  v19[573] = &unk_24E1F3E20;
  v21 = (*(uint64_t (**)(_QWORD, double))(**(_QWORD **)(v19[616] + 792) + 40))(*(_QWORD *)(v19[616] + 792), v20);
  v22 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "tessFactors", 0xBuLL);
  *(_QWORD *)(v22 + 8) = 3;
  *(_DWORD *)(v22 + 16) = v21;
  *(_QWORD *)(v22 + 20) = 0;
  v23 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "tessFactorScale", 0xFuLL);
  *(_OWORD *)(v23 + 8) = xmmword_21DFA61B0;
  *(_DWORD *)(v23 + 24) = 2;
  v24 = *(_QWORD *)(*(_QWORD *)((char *)v19 + *(_QWORD *)(*v19 - 24) + 344) + 792);
  v25 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v24 + 88))(v24);
  v26 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "internalInstanceCounts", 0x16uLL);
  *(_QWORD *)(v26 + 8) = 5;
  *(_DWORD *)(v26 + 16) = v25;
  *(_QWORD *)(v26 + 20) = 0;
  v27 = *(_QWORD *)(*(_QWORD *)((char *)v19 + *(_QWORD *)(*v19 - 24) + 344) + 792);
  v28 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v27 + 96))(v27);
  v29 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "packedInternalInstanceIDs", 0x19uLL);
  *(_QWORD *)(v29 + 8) = 7;
  *(_DWORD *)(v29 + 16) = v28;
  *(_QWORD *)(v29 + 20) = 0;
  v30 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "instanceCount", 0xDuLL);
  *(_OWORD *)(v30 + 8) = xmmword_21DFA61C0;
  *(_DWORD *)(v30 + 24) = 1;
  v31 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "patchCount", 0xAuLL);
  *(_OWORD *)(v31 + 8) = xmmword_21DFA61D0;
  *(_DWORD *)(v31 + 24) = 0;
  v32 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "instanceStrideInTessFactorUnits", 0x1FuLL);
  *(_OWORD *)(v32 + 8) = xmmword_21DFA61E0;
  *(_DWORD *)(v32 + 24) = 4;
  v33 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "patchStart", 0xAuLL);
  *(_OWORD *)(v33 + 8) = xmmword_21DFA61F0;
  *(_DWORD *)(v33 + 24) = 0;
  v34 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "baseInstance", 0xCuLL);
  *(_OWORD *)(v34 + 8) = xmmword_21DFA6200;
  *(_DWORD *)(v34 + 24) = 6;
  v35 = *sub_21DF575AC((llvm::StringMapImpl *)(v19 + 569), "maxTessellationFactor", 0x15uLL);
  *(_OWORD *)(v35 + 8) = xmmword_21DFA6210;
  *(_DWORD *)(v35 + 24) = 16;
  v36 = *(_QWORD *)(*v19 - 24);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  return (char *)v19 + v36;
}

char *sub_21DF92F00(uint64_t a1, uint64_t a2)
{
  llvm::Type **v4;
  _QWORD *v5;
  double v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  sub_21DF1AF28(__p, "tess_b2");
  v4 = (llvm::Type **)sub_21DF2CCE8(a2, (const UInt8 *)__p);
  if (v18 < 0)
    operator delete(__p[0]);
  v5 = (_QWORD *)operator new();
  sub_21DF2E500((uint64_t)(v5 + 573), a1, *v4);
  v6 = sub_21DF90F44((uint64_t)v5, (uint64_t *)off_24E1F4170, (uint64_t)v4, 0);
  *v5 = &off_24E1F3F08;
  v5[573] = &unk_24E1F4108;
  v7 = (*(uint64_t (**)(_QWORD, double))(**(_QWORD **)(v5[616] + 792) + 72))(*(_QWORD *)(v5[616] + 792), v6);
  v8 = *sub_21DF575AC((llvm::StringMapImpl *)(v5 + 569), "drawElementsIndirectCommands", 0x1CuLL);
  *(_QWORD *)(v8 + 8) = 0;
  *(_DWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 20) = 0;
  v9 = *(_QWORD *)(*(_QWORD *)((char *)v5 + *(_QWORD *)(*v5 - 24) + 344) + 792);
  v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 88))(v9);
  v11 = *sub_21DF575AC((llvm::StringMapImpl *)(v5 + 569), "internalInstanceCounts", 0x16uLL);
  *(_QWORD *)(v11 + 8) = 5;
  *(_DWORD *)(v11 + 16) = v10;
  *(_QWORD *)(v11 + 20) = 0;
  v12 = *(_QWORD *)(*(_QWORD *)((char *)v5 + *(_QWORD *)(*v5 - 24) + 344) + 792);
  v13 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v12 + 64))(v12);
  v14 = *sub_21DF575AC((llvm::StringMapImpl *)(v5 + 569), "internalDrawIndexOffsets", 0x18uLL);
  *(_QWORD *)(v14 + 8) = 6;
  *(_DWORD *)(v14 + 16) = v13;
  *(_QWORD *)(v14 + 20) = 0;
  v15 = *sub_21DF575AC((llvm::StringMapImpl *)(v5 + 569), "max_draw_commands_roundup_div_16", 0x20uLL);
  *(_OWORD *)(v15 + 8) = xmmword_21DFA61C0;
  *(_DWORD *)(v15 + 24) = 9;
  return (char *)v5 + *(_QWORD *)(*v5 - 24);
}

char *sub_21DF930E4(uint64_t a1, uint64_t a2)
{
  llvm::Type **v4;
  _QWORD *v5;
  double v6;
  int v7;
  uint64_t v8;
  void *__p[2];
  char v11;

  sub_21DF1AF28(__p, "tess_b0");
  v4 = (llvm::Type **)sub_21DF2CCE8(a2, (const UInt8 *)__p);
  if (v11 < 0)
    operator delete(__p[0]);
  v5 = (_QWORD *)operator new();
  sub_21DF2E500((uint64_t)(v5 + 573), a1, *v4);
  v6 = sub_21DF90F44((uint64_t)v5, (uint64_t *)off_24E1F4458, (uint64_t)v4, 0);
  *v5 = &off_24E1F41F0;
  v5[573] = &unk_24E1F43F0;
  v7 = (*(uint64_t (**)(_QWORD, double))(**(_QWORD **)(v5[616] + 792) + 88))(*(_QWORD *)(v5[616] + 792), v6);
  v8 = *sub_21DF575AC((llvm::StringMapImpl *)(v5 + 569), "buf", 3uLL);
  *(_QWORD *)(v8 + 8) = 0;
  *(_DWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 20) = 0;
  return (char *)v5 + *(_QWORD *)(*v5 - 24);
}

_QWORD *sub_21DF931F0(uint64_t a1, uint64_t a2)
{
  llvm::Type **v4;
  _QWORD *v5;
  void *__p[2];
  char v8;

  sub_21DF1AF28(__p, "vdm_nopdbg");
  v4 = (llvm::Type **)sub_21DF2CCE8(a2, (const UInt8 *)__p);
  if (v8 < 0)
    operator delete(__p[0]);
  v5 = (_QWORD *)operator new();
  sub_21DF2E500((uint64_t)(v5 + 573), a1, *v4);
  sub_21DF90F44((uint64_t)v5, (uint64_t *)off_24E1F4740, (uint64_t)v4, 0);
  *v5 = &off_24E1F44D8;
  v5[573] = &unk_24E1F46D8;
  return v5 + 573;
}

uint64_t sub_21DF932B4(uint64_t a1, uint64_t a2)
{
  llvm::Type **v4;
  uint64_t v5;
  unsigned __int8 v6;
  void *__p[2];
  char v9;

  sub_21DF1AF28(__p, "gei_esl_gen");
  v4 = (llvm::Type **)sub_21DF2CCE8(a2, (const UInt8 *)__p);
  v5 = operator new();
  sub_21DF2E500(v5 + 4576, a1, *v4);
  v6 = atomic_load((unsigned __int8 *)&qword_2553B3D30);
  if ((v6 & 1) == 0 && __cxa_guard_acquire(&qword_2553B3D30))
  {
    qword_2553B3D20 = 0;
    *(_QWORD *)algn_2553B3D28 = 0;
    __cxa_guard_release(&qword_2553B3D30);
  }
  sub_21DF90AFC(v5, (uint64_t *)off_24E1F4A30, (uint64_t)v4, (uint64_t)&qword_2553B3D20, 0, 0);
  *(_QWORD *)v5 = &off_24E1F47C0;
  *(_QWORD *)(v5 + 4576) = &unk_24E1F49C0;
  *(_OWORD *)(v5 + 4544) = 0u;
  *(_QWORD *)(v5 + 4560) = 0x2000000000;
  if (v9 < 0)
    operator delete(__p[0]);
  return v5 + 4576;
}

uint64_t sub_21DF933D0(uint64_t a1, uint64_t a2)
{
  llvm::Type **v4;
  uint64_t v5;
  unsigned __int8 v6;
  void *__p[2];
  char v9;

  sub_21DF1AF28(__p, "gei_esl_gen");
  v4 = (llvm::Type **)sub_21DF2CCE8(a2, (const UInt8 *)__p);
  v5 = operator new();
  sub_21DF2E500(v5 + 4576, a1, *v4);
  v6 = atomic_load((unsigned __int8 *)&qword_2553B3D48);
  if ((v6 & 1) == 0 && __cxa_guard_acquire(&qword_2553B3D48))
  {
    qword_2553B3D38 = 0;
    unk_2553B3D40 = 0;
    __cxa_guard_release(&qword_2553B3D48);
  }
  sub_21DF90AFC(v5, (uint64_t *)off_24E1F4D08, (uint64_t)v4, (uint64_t)&qword_2553B3D38, 0, 0);
  *(_QWORD *)v5 = &off_24E1F4A98;
  *(_QWORD *)(v5 + 4576) = &unk_24E1F4C98;
  *(_OWORD *)(v5 + 4544) = 0u;
  *(_QWORD *)(v5 + 4560) = 0x2000000000;
  if (v9 < 0)
    operator delete(__p[0]);
  return v5 + 4576;
}

_QWORD *sub_21DF934EC(uint64_t a1, uint64_t a2)
{
  llvm::Type **v4;
  _QWORD *v5;
  unsigned __int8 v6;
  void *__p[2];
  char v9;

  sub_21DF1AF28(__p, (char *)&unk_21DFAD77A);
  v4 = (llvm::Type **)sub_21DF2CCE8(a2, (const UInt8 *)__p);
  v5 = (_QWORD *)operator new();
  sub_21DF2E500((uint64_t)(v5 + 568), a1, *v4);
  v6 = atomic_load((unsigned __int8 *)&qword_2553B3D60);
  if ((v6 & 1) == 0 && __cxa_guard_acquire(&qword_2553B3D60))
  {
    qword_2553B3D50 = 0;
    *(_QWORD *)algn_2553B3D58 = 0;
    __cxa_guard_release(&qword_2553B3D60);
  }
  sub_21DF90AFC((uint64_t)v5, (uint64_t *)off_24E1F4FE0, (uint64_t)v4, (uint64_t)&qword_2553B3D50, 0, 0);
  *v5 = &off_24E1F4D70;
  v5[568] = &unk_24E1F4F70;
  if (v9 < 0)
    operator delete(__p[0]);
  return v5 + 568;
}

_QWORD *sub_21DF935F8(uint64_t a1, uint64_t a2)
{
  llvm::Type **v4;
  _QWORD *v5;
  unsigned __int8 v6;
  void *__p[2];
  char v9;

  sub_21DF1AF28(__p, "pds_patchup_vertex");
  v4 = (llvm::Type **)sub_21DF2CCE8(a2, (const UInt8 *)__p);
  if (v9 < 0)
    operator delete(__p[0]);
  v5 = (_QWORD *)operator new();
  sub_21DF2E500((uint64_t)(v5 + 568), a1, *v4);
  v6 = atomic_load((unsigned __int8 *)&qword_2553B3D78);
  if ((v6 & 1) == 0 && __cxa_guard_acquire(&qword_2553B3D78))
  {
    qword_2553B3D68 = 0;
    unk_2553B3D70 = 0;
    __cxa_guard_release(&qword_2553B3D78);
  }
  sub_21DF90AFC((uint64_t)v5, (uint64_t *)off_24E1F52B8, (uint64_t)v4, (uint64_t)&qword_2553B3D68, 0, 0);
  *v5 = &off_24E1F5048;
  v5[568] = &unk_24E1F5248;
  return v5 + 568;
}

llvm::Value *sub_21DF9370C(llvm::Value *result)
{
  uint64_t v1;
  llvm::Value *v2;
  uint64_t v3;
  char *v4;
  _BYTE v5[32];
  __int16 v6;

  v1 = *(_QWORD *)((char *)result + *(_QWORD *)(*(_QWORD *)result - 24) + 344);
  if (*(_QWORD *)(v1 + 1264))
  {
    v2 = result;
    strlen(*(const char **)(v1 + 1264));
    v3 = sub_21DF206CC();
    v4 = (char *)v2 + *(_QWORD *)(*(_QWORD *)v2 - 24);
    v6 = 257;
    return sub_21DF191A4((uint64_t)(v4 + 8), **(_QWORD **)(*(_QWORD *)v3 + 16), v3, 0, 0, (uint64_t)v5);
  }
  return result;
}

uint64_t sub_21DF937A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(unsigned int *)(a1 + 3088);
  v2 = a1 + *(_QWORD *)(*(_QWORD *)a1 - 24);
  if ((_DWORD)v1)
  {
    v3 = (char *)operator new(8 * v1);
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)(v2 + 160);
    do
    {
      *(_QWORD *)&v3[v5] = v6;
      v5 += 8;
    }
    while (8 * v1 != v5);
  }
  else
  {
    v4 = 0;
  }
  v7 = llvm::FunctionType::get();
  if (v4)
    operator delete(v4);
  return v7;
}

uint64_t sub_21DF93840()
{
  return 102;
}

uint64_t sub_21DF93848(uint64_t a1)
{
  uint64_t v2;
  uint64_t Function;
  llvm::Function *v4;
  llvm::Function *v5;
  uint64_t v6;
  llvm::Function *v7;
  uint64_t v8;
  uint64_t v9;
  llvm::Instruction *v10;
  void *v12[2];
  _QWORD v13[17];

  v13[16] = *MEMORY[0x24BDAC8D0];
  v2 = sub_21DF59368((_QWORD *)a1);
  if ((_DWORD)v2)
  {
    Function = llvm::Module::getFunction();
    if (Function)
    {
      v4 = (llvm::Function *)Function;
      v12[0] = v13;
      v12[1] = (void *)0x1000000000;
      v5 = *(llvm::Function **)(a1 + 152);
      if ((*((_BYTE *)v5 + 18) & 1) != 0)
      {
        llvm::Function::BuildLazyArguments(*(llvm::Function **)(a1 + 152));
        v7 = *(llvm::Function **)(a1 + 152);
        v6 = *((_QWORD *)v5 + 11);
        if ((*((_WORD *)v7 + 9) & 1) != 0)
          llvm::Function::BuildLazyArguments(v7);
        v5 = v7;
      }
      else
      {
        v6 = *((_QWORD *)v5 + 11);
      }
      v8 = *((_QWORD *)v5 + 11) + 40 * *((_QWORD *)v5 + 12);
      while (v6 != v8)
      {
        sub_21DF19CD0((uint64_t)v12, v6);
        v6 += 40;
      }
      v9 = *((_QWORD *)v4 + 1);
      while (v9)
      {
        v10 = *(llvm::Instruction **)(v9 + 24);
        v9 = *(_QWORD *)(v9 + 8);
        llvm::Value::replaceAllUsesWith();
        llvm::Instruction::eraseFromParent(v10);
      }
      llvm::Function::eraseFromParent(v4);
      if (v12[0] != v13)
        free(v12[0]);
    }
  }
  return v2;
}

uint64_t sub_21DF939C4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  unsigned int *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  const char **v30;
  unint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  const char **v39;
  char *v40;
  _QWORD *v41;
  _QWORD *v42;
  const char *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  __int16 v54;
  int v55;
  uint64_t v56;

  v2 = *(_QWORD *)(*(_QWORD *)a1 - 24) + a1 + 8;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 160) + 80);
  if (v3)
    v4 = v3 - 24;
  else
    v4 = 0;
  v5 = *(_QWORD *)(v4 + 40);
  if (v5)
    v6 = v5 - 24;
  else
    v6 = 0;
  sub_21DF3F430(v2, v6);
  v7 = *(_QWORD *)(a1 + 160);
  if ((*(_WORD *)(v7 + 18) & 1) != 0)
  {
    llvm::Function::BuildLazyArguments(*(llvm::Function **)(a1 + 160));
    v9 = *(_QWORD *)(a1 + 160);
    v8 = *(_QWORD *)(v7 + 88);
    if ((*(_WORD *)(v9 + 18) & 1) != 0)
      llvm::Function::BuildLazyArguments(*(llvm::Function **)(a1 + 160));
    v7 = v9;
  }
  else
  {
    v8 = *(_QWORD *)(v7 + 88);
  }
  v10 = *(_QWORD *)(v7 + 88) + 40 * *(_QWORD *)(v7 + 96);
  if (v8 != v10)
  {
    v49 = *(_QWORD *)(v7 + 88) + 40 * *(_QWORD *)(v7 + 96);
    do
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8 * *(unsigned int *)(v8 + 32));
      if (*(_QWORD *)(v8 + 8))
        v12 = v11 == 0;
      else
        v12 = 1;
      if (!v12
        && sub_21DF241E0(*(llvm::MDString **)(v11 - 8 * *(unsigned int *)(v11 + 8) + 8), "air.vertex_transform_feedback"))
      {
        v56 = 0;
        v55 = 0;
        LODWORD(v50) = 3;
        sub_21DF7A834(0, v11, (unsigned int *)&v50, (_DWORD *)&v56 + 1);
        LODWORD(v50) = 5;
        sub_21DF7A834(0, v11, (unsigned int *)&v50, &v56);
        LODWORD(v50) = 7;
        sub_21DF7A834(0, v11, (unsigned int *)&v50, &v55);
        v13 = (unsigned int *)operator new();
        *v13 = v56 >> 2;
        v14 = (void *)operator new[]();
        *((_QWORD *)v13 + 1) = v14;
        memset_pattern4(v14, &unk_21DFA0EE8, 4 * *v13);
        v15 = HIDWORD(v56);
        v16 = a1 + 8 * HIDWORD(v56);
        *(_QWORD *)(v16 + 3192) = v13;
        v17 = *(_DWORD *)(a1 + 3256);
        if (v17 <= (int)v15 + 1)
          v17 = v15 + 1;
        *(_DWORD *)(a1 + 3256) = v17;
        v18 = *(_QWORD *)(v16 + 3224);
        if (!v18)
        {
          v19 = (uint64_t *)(v16 + 3224);
          v20 = llvm::User::operator new((llvm::User *)0x58);
          v50 = "agc.tf_buffer";
          v48 = v48 & 0xFFFFFFFF00000000 | v15;
          v52 = v48;
          v54 = 2051;
          v21 = llvm::GlobalVariable::GlobalVariable();
          *(_BYTE *)(v21 + 80) |= 1u;
          llvm::GlobalObject::setSection();
          sub_21DF7A774(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
          v22 = *(_QWORD *)(*(_QWORD *)a1 - 24);
          v54 = 257;
          v18 = sub_21DF19394((uint64_t *)(a1 + 8 + v22), **(llvm::Type ***)(*(_QWORD *)v20 + 16), v20, 0, (uint64_t)&v50);
          *v19 = v18;
        }
        llvm::Value::replaceAllUsesWith();
        while (1)
        {
          v18 = *(_QWORD *)(v18 + 8);
          if (!v18)
            break;
          v23 = *(_QWORD *)(v18 + 24);
          v51 = 4;
          v52 = 0;
          v53 = 0;
          v24 = v23;
          do
          {
            v25 = *(unsigned __int8 *)(v24 + 16);
            if (v25 == 62)
            {
              v26 = *(_DWORD *)(v24 + 20);
              if ((v26 & 0x40000000) != 0)
                v27 = *(_QWORD **)(v24 - 8);
              else
                v27 = (_QWORD *)(v24 - 32 * (v26 & 0x7FFFFFF));
              if (*v27 == v23)
              {
                v28 = v27[4];
                v29 = (_QWORD *)(v28 + 24);
                if (*(_DWORD *)(v28 + 32) >= 0x41u)
                  v29 = (_QWORD *)*v29;
                LODWORD(v50) = *v29;
              }
            }
            else if (v25 == 61)
            {
              break;
            }
            v24 = *(_QWORD *)(*(_QWORD *)(v24 + 8) + 24);
          }
          while (v24);
          HIDWORD(v50) = HIDWORD(v56);
          sub_21DF4EB3C((llvm::ValueHandleBase *)&v51, v24);
          v30 = *(const char ***)(a1 + 3176);
          v31 = *(_QWORD *)(a1 + 3184);
          if ((unint64_t)v30 >= v31)
          {
            v33 = *(_QWORD *)(a1 + 3168);
            v34 = ((uint64_t)v30 - v33) >> 5;
            v35 = v34 + 1;
            if ((unint64_t)(v34 + 1) >> 59)
              abort();
            v36 = v31 - v33;
            if (v36 >> 4 > v35)
              v35 = v36 >> 4;
            if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFE0)
              v37 = 0x7FFFFFFFFFFFFFFLL;
            else
              v37 = v35;
            if (v37)
            {
              if (v37 >> 59)
                sub_21DF256A4();
              v38 = (char *)operator new(32 * v37);
            }
            else
            {
              v38 = 0;
            }
            v39 = (const char **)&v38[32 * v34];
            v40 = &v38[32 * v37];
            *v39 = v50;
            v32 = v39 + 4;
            sub_21DF5B820((llvm::ValueHandleBase *)(v39 + 1), 2u, &v51);
            v41 = *(_QWORD **)(a1 + 3176);
            v42 = *(_QWORD **)(a1 + 3168);
            if (v41 == v42)
            {
              *(_QWORD *)(a1 + 3168) = v39;
              *(_QWORD *)(a1 + 3176) = v32;
              *(_QWORD *)(a1 + 3184) = v40;
            }
            else
            {
              do
              {
                v43 = (const char *)*(v41 - 4);
                v41 -= 4;
                *(v39 - 4) = v43;
                v39 -= 4;
                sub_21DF5B820((llvm::ValueHandleBase *)(v39 + 1), 2u, v41 + 1);
              }
              while (v41 != v42);
              v44 = *(_QWORD **)(a1 + 3168);
              v41 = *(_QWORD **)(a1 + 3176);
              *(_QWORD *)(a1 + 3168) = v39;
              *(_QWORD *)(a1 + 3176) = v32;
              *(_QWORD *)(a1 + 3184) = v40;
              if (v41 != v44)
              {
                do
                {
                  v45 = *(v41 - 1);
                  if (v45 != -8192 && v45 != -4096 && v45 != 0)
                    llvm::ValueHandleBase::RemoveFromUseList((llvm::ValueHandleBase *)(v41 - 3));
                  v41 -= 4;
                }
                while (v41 != v44);
                v41 = v44;
              }
            }
            if (v41)
              operator delete(v41);
          }
          else
          {
            *v30 = v50;
            v32 = v30 + 4;
            sub_21DF5B820((llvm::ValueHandleBase *)(v30 + 1), 2u, &v51);
          }
          *(_QWORD *)(a1 + 3176) = v32;
          if (v53 != -8192 && v53 != -4096)
          {
            if (v53)
              llvm::ValueHandleBase::RemoveFromUseList((llvm::ValueHandleBase *)&v51);
          }
        }
        v10 = v49;
      }
      v8 += 40;
    }
    while (v8 != v10);
  }
  return 1;
}

uint64_t sub_21DF93EF4(_QWORD *a1)
{
  llvm::CallBase *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t **v5;
  uint64_t *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  unint64_t v15;
  size_t v16;
  int8x8_t v17;
  int v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t String;
  uint64_t v23;
  uint64_t v24;
  unsigned __int8 *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  BOOL v29;
  BOOL v30;
  void **v37;
  uint64_t v38;
  BOOL v40;
  BOOL v41;
  uint64_t v42;
  int v43;
  uint8x8_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  _BYTE *v52;
  llvm::Type *v53;
  unsigned __int8 *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  llvm::Type *v61;
  unsigned __int8 *v62;
  uint64_t *v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  unint64_t v71;
  uint64_t v72;
  char v73;
  _BYTE *v74;
  _BYTE *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  int v79;
  int v80;
  uint64_t *v81;
  unint64_t v82;
  uint64_t v83;
  llvm::BasicBlock *v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD *v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  llvm::Constant *v91;
  char *v92;
  unint64_t v93;
  uint64_t v94;
  unsigned int v95;
  uint64_t v96;
  _QWORD *v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  size_t v102;
  uint64_t v103;
  uint64_t v104;
  llvm::Value *v105;
  uint64_t v106;
  uint64_t v107;
  int v108;
  uint64_t v109;
  uint64_t v110;
  int v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  int v133;
  unint64_t v134;
  uint64_t v135;
  unint64_t v136;
  uint64_t *v137;
  uint64_t v138;
  uint64_t SinglePredecessor;
  int *v140;
  int *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  unsigned int v145;
  uint64_t v146;
  _QWORD *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  int v153;
  uint64_t v156;
  int v157;
  int v158;
  void **v159;
  _BYTE *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  unint64_t v164;
  uint64_t v165;
  unsigned int *v166;
  _DWORD *v167;
  unint64_t v168;
  int v169;
  uint64_t v170;
  uint64_t v171;
  int v172;
  unsigned int *v173;
  unsigned int *v174;
  llvm::Instruction *v175;
  uint64_t v176;
  uint64_t v177;
  unint64_t v178;
  uint64_t v179;
  unint64_t v180;
  int v181;
  unsigned int v182;
  uint64_t v183;
  unsigned int v184;
  llvm *v185;
  uint64_t *v186;
  uint64_t v187;
  uint64_t v188;
  _BYTE *v190;
  const std::string::value_type *p_dst;
  std::string::size_type v192;
  uint64_t v193;
  uint64_t v194;
  _QWORD *v195;
  int v196;
  unint64_t v197;
  unint64_t v198;
  int v199;
  unsigned int *v200;
  _DWORD *v201;
  uint64_t v202;
  int v203;
  uint64_t v204;
  unsigned int *v205;
  unsigned int *v206;
  _QWORD *v207;
  llvm::Instruction *v208;
  uint64_t v209;
  uint64_t v210;
  unsigned __int8 *v211;
  uint64_t v212;
  unsigned int v213;
  uint64_t v214;
  uint64_t v215;
  int v216;
  unsigned int v217;
  uint64_t v218;
  uint64_t v219;
  unsigned __int8 *v220;
  uint64_t v221;
  unint64_t v222;
  unsigned int v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  int v229;
  unsigned int v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  int v235;
  unsigned int v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  int v242;
  unsigned int v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  int v249;
  unsigned int v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  int v256;
  unsigned int v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  int v263;
  unsigned int v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  int v270;
  unsigned int v271;
  uint64_t v272;
  uint64_t v273;
  int v274;
  unsigned int v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  _QWORD *v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  int v286;
  unsigned int v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  int v294;
  uint64_t v295;
  unsigned __int8 *v296;
  uint64_t v297;
  uint64_t v298;
  BOOL v299;
  uint64_t v300;
  uint64_t v301;
  int v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  _BOOL4 v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  int v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  int v320;
  uint64_t v321;
  uint64_t v322;
  int v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  int v331;
  uint64_t v332;
  uint64_t v333;
  _BOOL4 v334;
  unint64_t v335;
  unsigned int v336;
  char *v337;
  unint64_t v338;
  char *v339;
  char *v340;
  unsigned int v341;
  _QWORD *v342;
  uint64_t v343;
  _QWORD *v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  llvm::Constant *v351;
  uint64_t *v352;
  BOOL v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  int v359;
  uint64_t *v360;
  _QWORD *v361;
  uint64_t v362;
  uint64_t v363;
  llvm::Type *v364;
  uint64_t v365;
  int v366;
  uint64_t v367;
  _QWORD *v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  unsigned __int8 *v375;
  uint64_t v376;
  unsigned __int8 *v377;
  llvm::Constant **v378;
  uint64_t v379;
  uint64_t v380;
  char *v381;
  uint64_t v382;
  unsigned __int8 *v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  char *v388;
  uint64_t v389;
  int v390;
  uint64_t v391;
  uint64_t v392;
  char *v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  void **v400;
  _QWORD *v401;
  llvm::Instruction *v402;
  _QWORD *v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t *v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t *v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  llvm::Instruction *v427;
  uint64_t v428;
  llvm::Instruction *v429;
  uint64_t v430;
  char *v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t *v434;
  llvm::Type ***v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t *v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  void **v445;
  uint64_t v446;
  _QWORD *v447;
  void **v448;
  _QWORD *v449;
  llvm::BasicBlock *v450;
  _QWORD *v451;
  _QWORD *v452;
  _QWORD *v453;
  unsigned int v454;
  int v455;
  uint64_t v457;
  uint64_t FirstInsertionPt;
  uint64_t v459;
  unint64_t v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  char *v464;
  uint64_t v465;
  unsigned __int8 *v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  _BYTE *v474;
  uint64_t v475;
  llvm::Type ***v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  uint64_t v480;
  uint64_t v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  uint64_t v492;
  int v493;
  _QWORD *v494;
  unsigned __int8 *v495;
  int v496;
  llvm::Type ***v497;
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  uint64_t v503;
  uint64_t v504;
  llvm::Type ***v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  uint64_t v509;
  llvm::Type ***v510;
  uint64_t v511;
  uint64_t v512;
  uint64_t v513;
  uint64_t v514;
  uint64_t v515;
  uint64_t v516;
  uint64_t v517;
  uint64_t v518;
  uint64_t v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  uint64_t v525;
  uint64_t v526;
  uint64_t v527;
  int v528;
  int v529;
  _BYTE *v530;
  uint64_t v531;
  uint64_t v532;
  uint64_t v533;
  uint64_t v534;
  uint64_t v535;
  uint64_t v536;
  uint64_t v537;
  uint64_t v538;
  llvm::Instruction *v539;
  llvm::BasicBlock **v540;
  uint64_t v541;
  llvm::Function *Function;
  uint64_t v544;
  llvm::Function **p_Function;
  _BYTE *v546;
  char *v547;
  uint64_t *v548;
  uint64_t *v549;
  unsigned __int8 *v550;
  uint64_t *v551;
  llvm::BasicBlock **v552;
  unsigned __int8 *NullValue;
  _QWORD *v554;
  uint64_t v555;
  uint64_t v556;
  uint64_t v557;
  _BYTE *v558;
  _BYTE *v559;
  void **v560;
  void **v561;
  unint64_t v562;
  _QWORD *i;
  _BYTE *v564;
  __int128 v565;
  uint64_t v566;
  int v567;
  int v568;
  _BYTE v569[32];
  __int16 v570;
  _BYTE v571[8];
  const char *v572;
  uint64_t v573;
  void *v574;
  _WORD v575[7];
  char v576;
  _BYTE v577[8];
  uint64_t v578;
  uint64_t v579;
  uint64_t v580;
  char v581;
  char v582;
  const char *v583;
  uint64_t v584;
  uint64_t v585;
  uint64_t v586;
  uint64_t v587;
  uint64_t v588;
  char v589;
  char v590;
  const char *v591;
  uint64_t v592;
  unsigned __int8 *v593;
  uint64_t v594;
  uint64_t v595;
  uint64_t v596;
  char v597;
  char v598;
  const char *v599;
  uint64_t v600;
  uint64_t *v601;
  uint64_t v602;
  uint64_t v603;
  uint64_t v604;
  _BYTE v605[64];
  _BYTE *v606;
  uint64_t v607;
  _BYTE v608[64];
  char *v609;
  uint64_t v610;
  _BYTE v611[256];
  llvm::Constant *v612;
  uint64_t v613;
  int v614;
  void *v615;
  __int16 v616;
  char v617;
  char *__dst;
  uint64_t v619;
  uint64_t v620;
  void *v621;
  uint64_t v622;
  uint64_t v623;
  char v624;
  uint64_t v625;

  v625 = *MEMORY[0x24BDAC8D0];
  Function = (llvm::Function *)llvm::Module::getFunction();
  v2 = *(llvm::CallBase **)(*((_QWORD *)Function + 1) + 24);
  v3 = sub_21DF35A70(v2);
  v4 = *((_DWORD *)v2 + 5) & 0x7FFFFFF;
  v552 = (llvm::BasicBlock **)v2;
  v5 = (uint64_t **)((char *)v2 - 32 * v4);
  if (((v3 - (_QWORD)v5) & 0x1FFFFFFFE0) != 0)
  {
    v6 = *v5;
    v7 = **v5;
    if (*(_BYTE *)(v7 + 8) != 16)
    {
      v9 = 0;
      v609 = v611;
      v610 = 0x1000000000;
      v606 = v608;
      v607 = 0x1000000000;
      v8 = 1;
      goto LABEL_9;
    }
    v8 = *(unsigned int *)(v7 + 12);
    v609 = v611;
    v610 = 0x1000000000;
    v606 = v608;
    v607 = 0x1000000000;
    if ((_DWORD)v8)
    {
      if (v8 >= 0x11)
      {
        llvm::SmallVectorBase<unsigned int>::grow_pod();
        v9 = v607;
        v11 = v606;
LABEL_10:
        v12 = 0;
        v13 = &v11[4 * v9];
        do
          *(_DWORD *)&v13[4 * v12++] = -1;
        while (v8 != v12);
        v10 = 0;
        LODWORD(v607) = v607 + v8;
        goto LABEL_13;
      }
      v9 = 0;
LABEL_9:
      v11 = v608;
      goto LABEL_10;
    }
  }
  else
  {
    v8 = 0;
    v6 = 0;
    v7 = 0;
    v609 = v611;
    v610 = 0x1000000000;
    v606 = v608;
    v607 = 0x1000000000;
  }
  v10 = 1;
LABEL_13:
  memset(v605, 0, sizeof(v605));
  v568 = 0;
  NullValue = (unsigned __int8 *)llvm::ConstantInt::get();
  v551 = (uint64_t *)llvm::ConstantInt::get();
  v14 = sub_21DF3F430((uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8, (uint64_t)v552);
  MEMORY[0x24BDAC7A8](v14);
  if (v15 >= 0x200)
    v16 = 512;
  else
    v16 = v15;
  i = (llvm::Function **)((char *)&Function - ((v15 + 15) & 0xFFFFFFFF0));
  bzero(i, v16);
  v564 = a1;
  v549 = v6;
  v546 = v608;
  v547 = v611;
  p_Function = &Function;
  if ((v10 & 1) != 0)
  {
    v550 = 0;
    v562 = 0;
  }
  else
  {
    v18 = *(unsigned __int8 *)(v7 + 8);
    v561 = (void **)v7;
    if (v18 == 16)
      sub_21DF79D0C((uint64_t)a1 + *(_QWORD *)(*a1 - 24), v6, i);
    else
      *i = v6;
    v19 = 0;
    v562 = 0;
    v550 = 0;
    v559 = a1 + 304;
    v560 = &v574;
    do
    {
      v20 = a1;
      v21 = *(_QWORD *)(a1[7] - 8 * *(unsigned int *)(a1[7] + 8) + 8 * v19);
      String = llvm::MDString::getString(*(llvm::MDString **)(v21 - 8 * *(unsigned int *)(v21 + 8)));
      v24 = v23;
      v25 = (unsigned __int8 *)i[v19];
      if (*((_BYTE *)v20 + 3146))
      {
        v26 = 1;
        do
        {
          v27 = *(unsigned int *)(v21 + 8);
          if (v26 >= v27)
            break;
          if (sub_21DF241E0(*(llvm::MDString **)(v21 - 8 * v27 + 8 * v26), "air.shared"))
            goto LABEL_28;
          ++v26;
        }
        while (v564[3146]);
        v28 = 1;
      }
      else
      {
LABEL_28:
        v28 = 0;
      }
      if (v24 <= 16)
      {
        if (v24 == 12)
        {
          v41 = *(_QWORD *)String == 0x69736F702E726961 && *(_DWORD *)(String + 8) == 1852795252;
          a1 = v564;
          if (v41)
          {
            v564[3156] = v28;
            v562 = (unint64_t)v25;
          }
        }
        else
        {
          a1 = v564;
          if (v24 == 14 && *(_QWORD *)String == 0x6E696F702E726961 && *(_QWORD *)(String + 6) == 0x657A69735F746E69)
          {
            v564[3157] = v28;
            v550 = v25;
          }
        }
      }
      else if (v24 == 17)
      {
        if (*(_QWORD *)String == 0x70696C632E726961
          && *(_QWORD *)(String + 8) == 0x636E61747369645FLL
          && *(_BYTE *)(String + 16) == 101)
        {
          v42 = v21;
          a1 = v564;
          (*(void (**)(_BYTE *, unsigned __int8 *, uint64_t, _BYTE *, int *))(*(_QWORD *)v564 + 328))(v564, v25, v42, v605, &v568);
          *((_BYTE *)a1 + 3160) = v28;
        }
        else
        {
          if (*(_QWORD *)String == 0x747265762E726961
            && *(_QWORD *)(String + 8) == 0x757074756F5F7865
            && *(_BYTE *)(String + 16) == 116)
          {
            v38 = (uint64_t)v560;
            v37 = v561;
            *v560 = 0;
            *(_QWORD *)(v38 + 8) = 0;
            *(_QWORD *)(v38 + 16) = 0;
            if ((*(unsigned int (**)(_BYTE *, void **, uint64_t, uint64_t, _BYTE *, uint64_t))(*(_QWORD *)v564 + 336))(v564, v37, v19, v21, v571, v28))
            {
              sub_21DF6DCE8((uint64_t)&v609, v573, (uint64_t)v25);
              sub_21DF99E7C((uint64_t)v559, (unint64_t)v571);
            }
            if (v576 < 0)
              operator delete(v574);
          }
          a1 = v564;
        }
      }
      else if (v24 == 24)
      {
        v40 = *(_QWORD *)String == 0x776569762E726961
           && *(_QWORD *)(String + 8) == 0x7272615F74726F70
           && *(_QWORD *)(String + 16) == 0x7865646E695F7961;
        a1 = v564;
        if (v40)
        {
          v564[3158] = v28;
          *((_BYTE *)a1 + 3101) = 1;
          NullValue = v25;
        }
      }
      else
      {
        a1 = v564;
        if (v24 == 29)
        {
          v29 = *(_QWORD *)String == 0x646E65722E726961 && *(_QWORD *)(String + 8) == 0x65677261745F7265;
          v30 = v29 && *(_QWORD *)(String + 16) == 0x5F79617272615F74;
          if (v30 && *(_QWORD *)(String + 21) == 0x7865646E695F7961)
          {
            v564[3159] = v28;
            *((_BYTE *)a1 + 3102) = 1;
            v551 = (uint64_t *)v25;
          }
        }
      }
      ++v19;
    }
    while (v19 != v8);
  }
  v43 = *((_DWORD *)a1 + 779) & v568;
  *((_DWORD *)a1 + 779) = v43;
  v17.i32[0] = v43;
  v44 = (uint8x8_t)vcnt_s8(v17);
  v44.i16[0] = vaddlv_u8(v44);
  *((_DWORD *)a1 + 778) = v44.i32[0];
  if (v43 && (*((_BYTE *)a1 + 3160) || *((_BYTE *)a1 + 3156)))
  {
    *((_BYTE *)a1 + 3160) = 1;
    *((_BYTE *)a1 + 3156) = 1;
  }
  *((_BYTE *)a1 + 3100) = (*(uint64_t (**)(_QWORD *, unsigned __int8 *))(*a1 + 360))(a1, v550);
  if (*((_BYTE *)a1 + 3146))
  {
    if (!*((_BYTE *)a1 + 3144))
    {
      a1[391] = sub_21DF97490(a1, *((_DWORD *)a1 + 788));
      *((_BYTE *)a1 + 3144) = 1;
    }
    if (!*((_BYTE *)a1 + 3145))
    {
      a1[392] = sub_21DF97554(a1);
      *((_BYTE *)a1 + 3145) = 1;
    }
    v45 = (_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24));
    v46 = a1[408];
    v575[0] = 257;
    v47 = (uint64_t *)sub_21DF19394(v45 + 1, **(llvm::Type ***)(*(_QWORD *)v46 + 16), v46, 0, (uint64_t)v571);
    v48 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v49 = (uint64_t *)a1[391];
    v575[0] = 257;
    v50 = sub_21DF1A924(v48, v47, v49, (uint64_t)v571);
    v51 = (_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24));
    v575[0] = 257;
    v52 = (_BYTE *)sub_21DF19394(v51 + 1, **(llvm::Type ***)(*(_QWORD *)v50 + 16), v50, 0, (uint64_t)v571);
    __dst = 0;
    v619 = 0;
    sub_21DF79D0C((uint64_t)a1 + *(_QWORD *)(*a1 - 24), v52, &__dst);
    if (!*((_BYTE *)a1 + 3101))
    {
      NullValue = (unsigned __int8 *)llvm::Constant::getNullValue(*(llvm::Constant **)a1[409], v53);
      *((_BYTE *)a1 + 3101) = 1;
    }
    *((_BYTE *)a1 + 3158) = 1;
    v54 = NullValue;
    v55 = (uint64_t *)sub_21DF79090((_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24)), (uint64_t)__dst, *(_QWORD *)NullValue);
    a1[409] = v55;
    v56 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8;
    v57 = *v55;
    v575[0] = 257;
    v58 = sub_21DF1A79C(v56, 39, (uint64_t)v54, v57, (uint64_t)v571);
    v59 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8;
    v60 = a1[409];
    v575[0] = 257;
    v62 = (unsigned __int8 *)sub_21DF19FAC(v59, v58, v60, (uint64_t)v571);
    v63 = v551;
    if (!*((_BYTE *)a1 + 3102))
    {
      v63 = (uint64_t *)llvm::Constant::getNullValue(*(llvm::Constant **)a1[410], v61);
      *((_BYTE *)a1 + 3102) = 1;
    }
    *((_BYTE *)a1 + 3159) = 1;
    v64 = (uint64_t *)sub_21DF79090((_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24)), v619, *v63);
    a1[410] = v64;
    v65 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8;
    v66 = *v64;
    v575[0] = 257;
    v67 = sub_21DF1A79C(v65, 39, (uint64_t)v63, v66, (uint64_t)v571);
    v68 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8;
    v69 = a1[410];
    v575[0] = 257;
    v70 = (uint64_t *)sub_21DF19FAC(v68, v67, v69, (uint64_t)v571);
  }
  else
  {
    v70 = v551;
    v62 = NullValue;
  }
  v71 = 0;
  v72 = 0;
  v571[0] = 1;
  v73 = *((_BYTE *)a1 + 3144);
  i = a1 + 475;
  v571[1] = v73;
  v572 = "air.amplification_id";
  v573 = 20;
  v574 = (void *)a1[391];
  v578 = 0;
  v579 = 0;
  v580 = 0;
  v581 = 0;
  v582 = *((_BYTE *)a1 + 3145);
  v583 = "air.amplification_count";
  v584 = 23;
  v585 = a1[392];
  v586 = 0;
  v587 = 0;
  v588 = 0;
  v589 = *((_BYTE *)a1 + 3158);
  v590 = *((_BYTE *)a1 + 3101);
  v591 = "air.viewport_array_index";
  v592 = 24;
  NullValue = v62;
  v593 = v62;
  v594 = 0;
  v595 = 0;
  v596 = 0;
  v597 = *((_BYTE *)a1 + 3159);
  v598 = *((_BYTE *)a1 + 3102);
  v599 = "air.render_target_array_index";
  v600 = 29;
  v551 = v70;
  v601 = v70;
  v602 = 0;
  v74 = a1 + 304;
  v603 = 0;
  v604 = 0;
  do
  {
    v75 = &v571[v71];
    if ((*(unsigned int (**)(_QWORD *, _QWORD, _QWORD, _WORD *, _QWORD))(*a1 + 344))(a1, *(_QWORD *)&v571[v71 + 8], *(uint64_t *)((char *)&v573 + v71), &v575[v71 / 2], v571[v71]))
    {
      v76 = *(_QWORD *)(*a1 - 24);
      v77 = (uint64_t)a1 + v76;
      v78 = (uint64_t *)*((_QWORD *)v75 + 3);
      v79 = sub_21DF78CC0(v77, *v78, &__dst);
      if (v75[1])
      {
        v80 = *(_DWORD *)&v575[v71 / 2 + 2];
        if (v80 >= v79)
        {
          if (v80 > v79)
          {
            v92 = (char *)*((_QWORD *)v75 + 1);
            if (v92)
            {
              v93 = *(&v573 + 12 * v72);
              v94 = 4;
              if (v93 < 4)
                v94 = *(&v573 + 12 * v72);
              sub_21DF24420(&__dst, &v92[v94], v93 - v94);
              v95 = HIBYTE(v620);
              v92 = __dst;
              v96 = v619;
              v97 = v564;
              v76 = *(_QWORD *)(*(_QWORD *)v564 - 24);
              v98 = v547;
            }
            else
            {
              v96 = 0;
              v95 = 0;
              __dst = 0;
              v619 = 0;
              v620 = 0;
              v98 = v547;
              v97 = v564;
            }
            v190 = v546;
            if ((v95 & 0x80u) == 0)
              p_dst = (const std::string::value_type *)&__dst;
            else
              p_dst = v92;
            if ((v95 & 0x80u) == 0)
              v192 = v95;
            else
              v192 = v96;
            std::string::append((std::string *)((char *)v97 + v76 + 408), p_dst, v192);
            if (SHIBYTE(v620) < 0)
              operator delete(__dst);
            std::string::append((std::string *)((char *)v97 + *(_QWORD *)(*v97 - 24) + 408), " type does not match between vertex and fragment function");
            v193 = 0;
            goto LABEL_490;
          }
        }
        else
        {
          *((_QWORD *)v75 + 3) = sub_21DF79174(v77, v78, v80, 0);
        }
      }
      sub_21DF99E7C((uint64_t)v74, (unint64_t)&v575[v71 / 2]);
      sub_21DF6DCE8((uint64_t)&v609, *(unsigned int *)&v577[v71], *((_QWORD *)v75 + 3));
      a1 = v564;
    }
    ++v72;
    v71 += 96;
  }
  while (v72 != 4);
  *((_DWORD *)a1 + 774) = sub_21DF9A5E4(v74, *(_BYTE *)(*(_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 344) + 1634), *((_DWORD *)a1 + 773));
  v621 = 0;
  v622 = 0;
  v623 = 0;
  if ((*(unsigned int (**)(_QWORD *, char **))(*a1 + 352))(a1, &__dst))
  {
    do
      sub_21DF99E7C((uint64_t)v74, (unint64_t)&__dst);
    while (((*(uint64_t (**)(_QWORD *, char **))(*a1 + 352))(a1, &__dst) & 1) != 0);
  }
  v81 = v549;
  if (SHIBYTE(v623) < 0)
    operator delete(v621);
  v82 = 126 - 2 * __clz(v610);
  if ((_DWORD)v610)
    v83 = v82;
  else
    v83 = 0;
  sub_21DF9764C((unint64_t)v609, (unint64_t)&v609[16 * v610], v83, 1);
  sub_21DF9A30C((uint64_t)v74, *(_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 344));
  v84 = v552[5];
  v85 = llvm::ConstantInt::get();
  v86 = llvm::ConstantInt::get();
  a1[388] = 0;
  v87 = (_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  if (*(_BYTE *)(v87[43] + 1676))
  {
    v88 = v85;
    if (*((_BYTE *)a1 + 3144))
    {
      v89 = sub_21DF97554(a1);
      v86 = sub_21DF79090(v87, v89, *(_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 584));
      v90 = (_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24));
      if (*((_DWORD *)a1 + 788))
        v91 = (llvm::Constant *)sub_21DF98C2C(a1);
      else
        v91 = (llvm::Constant *)sub_21DF97554(a1);
      v612 = v91;
      v99 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
      v100 = *(_QWORD *)(v99 + 344);
      v101 = *(_QWORD *)(v100 + 1344);
      if (v101)
        v102 = strlen(*(const char **)(v100 + 1344));
      else
        v102 = 0;
      v103 = sub_21DF203DC(v99, v101, v102, *(_QWORD *)(v99 + 192), *(_QWORD *)(v99 + 192));
      a1 = v564;
      v104 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8;
      LOWORD(v622) = 257;
      v105 = sub_21DF191A4(v104, *(_QWORD *)(v103 + 24), v103, (uint64_t)&v612, 1, (uint64_t)&__dst);
      v88 = sub_21DF79090(v90, (uint64_t)v105, *(_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 584));
    }
  }
  else
  {
    v88 = v85;
  }
  a1[411] = llvm::ConstantInt::get();
  v106 = llvm::ConstantInt::get();
  v107 = v106;
  a1[412] = v106;
  v108 = *((unsigned __int8 *)a1 + 3156);
  if (*((_BYTE *)a1 + 3156))
    v109 = v88;
  else
    v109 = v85;
  a1[413] = v109;
  if (!v108)
  {
    a1[414] = v106;
    goto LABEL_141;
  }
  v110 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8;
  LOWORD(v622) = 257;
  v107 = sub_21DF1A864(v110, v107, v86, (uint64_t)&__dst);
  v111 = *((unsigned __int8 *)a1 + 3156);
  a1[414] = v107;
  if (!v111)
  {
LABEL_141:
    *((_DWORD *)a1 + 776) += 4;
    goto LABEL_142;
  }
  *((_DWORD *)a1 + 777) += 4;
LABEL_142:
  v112 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8;
  v113 = a1[411];
  LOWORD(v622) = 257;
  a1[415] = sub_21DF19FAC(v112, v113, v107, (uint64_t)&__dst);
  v114 = llvm::ConstantInt::get();
  a1[416] = v114;
  a1[417] = v85;
  a1[418] = v114;
  v115 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8;
  v116 = a1[415];
  LOWORD(v622) = 257;
  a1[419] = sub_21DF19FAC(v115, v116, v114, (uint64_t)&__dst);
  v117 = llvm::ConstantInt::get();
  a1[420] = v117;
  a1[421] = v85;
  a1[422] = v117;
  v118 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8;
  v119 = a1[419];
  LOWORD(v622) = 257;
  a1[423] = sub_21DF19FAC(v118, v119, v117, (uint64_t)&__dst);
  v120 = llvm::ConstantInt::get();
  a1[424] = v120;
  a1[425] = v85;
  a1[426] = v120;
  v121 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8;
  v122 = a1[423];
  LOWORD(v622) = 257;
  a1[427] = sub_21DF19FAC(v121, v122, v120, (uint64_t)&__dst);
  v123 = llvm::ConstantInt::get();
  a1[428] = v123;
  a1[429] = v85;
  a1[430] = v123;
  v124 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8;
  v125 = a1[427];
  LOWORD(v622) = 257;
  a1[431] = sub_21DF19FAC(v124, v125, v123, (uint64_t)&__dst);
  v126 = llvm::ConstantInt::get();
  a1[432] = v126;
  a1[433] = v85;
  a1[434] = v126;
  v127 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8;
  v128 = a1[431];
  LOWORD(v622) = 257;
  a1[435] = sub_21DF19FAC(v127, v128, v126, (uint64_t)&__dst);
  v129 = llvm::ConstantInt::get();
  a1[436] = v129;
  a1[437] = v85;
  a1[438] = v129;
  v130 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8;
  v131 = a1[435];
  LOWORD(v622) = 257;
  v132 = sub_21DF19FAC(v130, v131, v129, (uint64_t)&__dst);
  a1[439] = v132;
  if (*((_DWORD *)a1 + 814) && !*(_BYTE *)(*(_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 344) + 1654))
  {
    v559 = (_BYTE *)v88;
    v560 = (void **)v86;
    if (!v81)
      goto LABEL_244;
    LODWORD(v620) = 128;
    __dst = (char *)MEMORY[0x2207A6DD8](6144, 8);
    sub_21DF985E0((uint64_t)&__dst);
    LOBYTE(v621) = 0;
    v624 = 0;
    if (*((_BYTE *)v81 + 16) == 83)
    {
      v133 = *((_DWORD *)v81 + 5);
      v134 = v133 & 0x7FFFFFF;
      if ((v133 & 0x7FFFFFF) != 0)
      {
        v135 = 0;
        v136 = 0;
        do
        {
          if ((v133 & 0x40000000) != 0)
            v137 = (uint64_t *)*(v81 - 1);
          else
            v137 = &v81[-4 * v134];
          v138 = v137[v135];
          *sub_21DF98694((uint64_t)&__dst, v137[4 * *((unsigned int *)v81 + 15) + v136++]) = v138;
          v133 = *((_DWORD *)v81 + 5);
          v134 = v133 & 0x7FFFFFF;
          v135 += 4;
        }
        while (v136 < v134);
      }
    }
    else
    {
      SinglePredecessor = llvm::BasicBlock::getSinglePredecessor(v84);
      *sub_21DF98694((uint64_t)&__dst, SinglePredecessor) = v81;
    }
    v140 = (int *)a1[396];
    v141 = (int *)a1[397];
    if (v140 != v141)
    {
      v561 = &v615;
      while (1)
      {
        v142 = *((_QWORD *)v140 + 3);
        if (!v142)
          goto LABEL_185;
        v143 = **(_QWORD **)(v142 - 64);
        v144 = (*(_DWORD *)(v143 + 8) & 0xFE) == 0x12 ? *(unsigned int *)(v143 + 32) : 1;
        v145 = *v140;
        v146 = v140[1];
        v147 = sub_21DF98694((uint64_t)&__dst, *(_QWORD *)(v142 + 40));
        v148 = *v147;
        if (*(unsigned __int8 *)(*v147 + 16) - 11 < 2)
          break;
        while (*(_QWORD *)(v148 - 32) != *(_QWORD *)(v142 - 64))
        {
          v148 = *(_QWORD *)(v148 - 64);
          if (*(unsigned __int8 *)(v148 + 16) - 11 <= 1)
            goto LABEL_176;
        }
        v149 = **(unsigned int **)(v148 + 64);
        v150 = *(_QWORD *)(*((_QWORD *)v564 + 7) - 8 * *(unsigned int *)(*((_QWORD *)v564 + 7) + 8) + 8 * v149);
        v151 = llvm::MDString::getString(*(llvm::MDString **)(v150 - 8 * *(unsigned int *)(v150 + 8)));
        if (v152 == 17)
        {
          if (*(_QWORD *)v151 != 0x747265762E726961
            || *(_QWORD *)(v151 + 8) != 0x757074756F5F7865
            || *(_BYTE *)(v151 + 16) != 116)
          {
            break;
          }
          v159 = v561;
          *v561 = 0;
          v159[1] = 0;
          v159[2] = 0;
          v160 = v564;
          if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t, uint64_t, llvm::Constant **, _QWORD))(*(_QWORD *)v564 + 336))(v564, *v549, v149, v150, &v612, 0))
          {
            v161 = *((unsigned int *)v160 + 616);
            if ((_DWORD)v161)
            {
              v162 = *((_QWORD *)v160 + 307);
              v163 = v161 << 6;
              while (*(_DWORD *)(v162 + 16) != v614)
              {
                v162 += 64;
                v163 -= 64;
                if (!v163)
                  goto LABEL_192;
              }
              v153 = *(_DWORD *)(v162 + 48);
            }
            else
            {
LABEL_192:
              v153 = 0xFFFF;
            }
          }
          else
          {
            v153 = -2;
          }
          if (v617 < 0)
            operator delete(v615);
        }
        else
        {
          if (v152 != 12)
            break;
          if (*(_QWORD *)v151 ^ 0x69736F702E726961 | *(unsigned int *)(v151 + 8) ^ 0x6E6F6974)
            v153 = -2;
          else
            v153 = 0;
        }
LABEL_177:
        if (v144)
        {
          v156 = *(_QWORD *)(*(_QWORD *)&v564[8 * v146 + 3192] + 8);
          while (1)
          {
            v157 = *(_DWORD *)(v156 + 4 * v145);
            if (v157 != -2)
            {
              v158 = v153;
              if (v157 == -1)
                goto LABEL_183;
              if (v153 != v157)
                break;
            }
LABEL_184:
            ++v153;
            ++v145;
            if (!--v144)
              goto LABEL_185;
          }
          v158 = -2;
LABEL_183:
          *(_DWORD *)(v156 + 4 * v145) = v158;
          goto LABEL_184;
        }
LABEL_185:
        v140 += 8;
        if (v140 == v141)
          goto LABEL_197;
      }
LABEL_176:
      v153 = -2;
      goto LABEL_177;
    }
LABEL_197:
    v164 = *((unsigned int *)v564 + 814);
    if (v164 >= 2)
    {
      v165 = 0;
      while (1)
      {
        v166 = *(unsigned int **)&v564[8 * v165 + 3192];
        v167 = (_DWORD *)*((_QWORD *)v166 + 1);
        v168 = *v166;
        if (*v167 >= 0xFFFFFFFE)
          goto LABEL_206;
        if (v168 >= 2)
          break;
LABEL_207:
        if (++v165 >= v164)
          goto LABEL_208;
      }
      v169 = *v167 + 1;
      if (v167[1] == v169)
      {
        v170 = 0;
        while (v168 - 2 != v170)
        {
          v171 = v170;
          v172 = v167[v170++ + 2];
          if (v169 + (_DWORD)v170 != v172)
          {
            if (v171 + 2 >= v168)
              goto LABEL_207;
            goto LABEL_206;
          }
        }
        goto LABEL_207;
      }
LABEL_206:
      memset_pattern4(v167, &unk_21DFA30BC, 4 * v168);
      v164 = *((unsigned int *)v564 + 814);
      goto LABEL_207;
    }
LABEL_208:
    v173 = (unsigned int *)*((_QWORD *)v564 + 396);
    v174 = (unsigned int *)*((_QWORD *)v564 + 397);
    while (v173 != v174)
    {
      v175 = (llvm::Instruction *)*((_QWORD *)v173 + 3);
      if (!v175)
        goto LABEL_221;
      v176 = *v173;
      v177 = **((_QWORD **)v175 - 8);
      if ((*(_DWORD *)(v177 + 8) & 0xFE) == 0x12)
      {
        v178 = *(unsigned int *)(v177 + 32);
        if (!(_DWORD)v178)
          goto LABEL_220;
      }
      else
      {
        v178 = 1;
      }
      v179 = *(_QWORD *)(*(_QWORD *)&v564[8 * v173[1] + 3192] + 8);
      if (*(_DWORD *)(v179 + 4 * v176) > 0xFFFFFFFD)
        goto LABEL_221;
      v180 = 0;
      v181 = v176 + 1;
      while (v178 - 1 != v180)
      {
        v182 = *(_DWORD *)(v179 + 4 * (v181 + v180++));
        if (v182 >= 0xFFFFFFFE)
        {
          if (v180 < v178)
            goto LABEL_221;
          break;
        }
      }
LABEL_220:
      v183 = *((_QWORD *)v175 - 4);
      llvm::Instruction::eraseFromParent(v175);
      sub_21DF523B8(v183);
LABEL_221:
      v173 += 8;
    }
    sub_21DF5B48C((uint64_t)&v621);
    v184 = v620;
    v185 = (llvm *)__dst;
    if ((_DWORD)v620)
    {
      v186 = (uint64_t *)(__dst + 24);
      v187 = 48 * v620;
      a1 = v564;
      do
      {
        v188 = *v186;
        if (*v186 != -8192 && v188 != -4096 && v188 != 0)
          llvm::ValueHandleBase::RemoveFromUseList((llvm::ValueHandleBase *)(v186 - 2));
        v186 += 6;
        v187 -= 48;
      }
      while (v187);
      v185 = (llvm *)__dst;
      v184 = v620;
    }
    else
    {
      a1 = v564;
    }
    llvm::deallocate_buffer(v185, (void *)(48 * v184));
    v132 = a1[439];
LABEL_244:
    if (*(_BYTE *)(v132 + 16) == 16)
      v194 = v132;
    else
      v194 = 0;
    v195 = (_QWORD *)(v194 + 24);
    if (*(_DWORD *)(v194 + 32) >= 0x41u)
      v195 = (_QWORD *)*v195;
    v196 = *(_DWORD *)v195;
    v197 = *((unsigned int *)a1 + 814);
    if (v197 < 2)
    {
      v199 = 0;
    }
    else
    {
      v198 = 0;
      v199 = 0;
      do
      {
        v200 = (unsigned int *)a1[v198 + 399];
        v201 = (_DWORD *)*((_QWORD *)v200 + 1);
        if (*v201 >= 0xFFFFFFFE)
        {
          v202 = *v200;
          if ((_DWORD)v202)
          {
            v203 = v196;
            v204 = v202;
            do
            {
              *v201++ = v203++;
              --v204;
            }
            while (v204);
            v197 = *((unsigned int *)a1 + 814);
          }
          v196 += v202;
          v199 += v202;
        }
        ++v198;
      }
      while (v198 < v197);
    }
    v561 = (void **)v85;
    v205 = (unsigned int *)a1[396];
    v206 = (unsigned int *)a1[397];
    if (v205 != v206)
    {
      v207 = v564;
      while (1)
      {
        v208 = (llvm::Instruction *)*((_QWORD *)v205 + 3);
        if (v208)
          break;
LABEL_272:
        v205 += 8;
        if (v205 == v206)
          goto LABEL_279;
      }
      v209 = *v205;
      v210 = v205[1];
      v211 = (unsigned __int8 *)*((_QWORD *)v208 - 8);
      v212 = **(_QWORD **)(**((_QWORD **)v208 - 4) + 16);
      if ((*(_DWORD *)(v212 + 8) & 0xFE) == 0x12)
      {
        v213 = *(_DWORD *)(v212 + 32);
        v214 = *(_QWORD *)&v564[8 * v210 + 3192];
        if (!v213)
        {
LABEL_271:
          v219 = llvm::ConstantInt::get();
          v220 = v211;
          a1 = v207;
          sub_21DF98000(v207, v220, v219, 0, 1, 0);
          v221 = *((_QWORD *)v208 - 4);
          llvm::Instruction::eraseFromParent(v208);
          sub_21DF523B8(v221);
          goto LABEL_272;
        }
      }
      else
      {
        v214 = *(_QWORD *)&v564[8 * v210 + 3192];
        v213 = 1;
      }
      v215 = *(_QWORD *)(v214 + 8);
      if (*(_DWORD *)(v215 + 4 * v209) <= 0xFFFFFFFD)
      {
        v222 = 0;
        while (v213 - 1 != v222)
        {
          v223 = *(_DWORD *)(v215 + 4 * (v209 + 1 + v222++));
          if (v223 >= 0xFFFFFFFE)
          {
            if (v222 < v213)
              goto LABEL_268;
            goto LABEL_271;
          }
        }
      }
      else
      {
LABEL_268:
        v216 = v196;
        v217 = *v205;
        v218 = v213;
        do
        {
          *(_DWORD *)(v215 + 4 * v217++) = v216++;
          --v218;
        }
        while (v218);
        v196 += v213;
        v199 += v213;
      }
      goto LABEL_271;
    }
LABEL_279:
    *((_DWORD *)a1 + 773) += v199;
    v86 = (uint64_t)v560;
    v85 = (uint64_t)v561;
    v88 = (uint64_t)v559;
  }
  v224 = llvm::ConstantInt::get();
  a1[440] = v224;
  a1[441] = v85;
  a1[442] = v224;
  v225 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8;
  v226 = a1[439];
  LOWORD(v622) = 257;
  a1[443] = sub_21DF19FAC(v225, v226, v224, (uint64_t)&__dst);
  v227 = llvm::ConstantInt::get();
  v228 = 0;
  v229 = 0;
  a1[444] = v227;
  a1[445] = v85;
  a1[446] = v227;
  do
  {
    v230 = *(_DWORD *)((char *)a1 + v228 + 3036);
    if (*((_BYTE *)a1 + 2992))
      v230 = (v230 + 1) >> 1;
    v229 += *(_DWORD *)((char *)a1 + v228 + 3024) + v230;
    v228 += 4;
  }
  while (v228 != 12);
  *((_DWORD *)a1 + 776) += *((_DWORD *)a1 + 773) + *((_DWORD *)a1 + 774) + v229;
  v231 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8;
  v232 = a1[443];
  LOWORD(v622) = 257;
  v233 = sub_21DF19FAC(v231, v232, v227, (uint64_t)&__dst);
  v234 = 0;
  v235 = 0;
  a1[447] = v233;
  do
  {
    v236 = *(_DWORD *)((char *)a1 + v234 + 3060);
    if (*((_BYTE *)a1 + 2992))
      v236 = (v236 + 1) >> 1;
    v235 += *(_DWORD *)((char *)a1 + v234 + 3048) + v236;
    v234 += 4;
  }
  while (v234 != 12);
  a1[448] = llvm::ConstantInt::get();
  a1[449] = v88;
  v237 = llvm::ConstantInt::get();
  a1[450] = v237;
  v238 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8;
  v239 = a1[447];
  LOWORD(v622) = 257;
  v240 = sub_21DF19FAC(v238, v239, v237, (uint64_t)&__dst);
  v241 = 0;
  v242 = 0;
  a1[451] = v240;
  do
  {
    v243 = *(_DWORD *)((char *)a1 + v241 + 3060);
    if (*((_BYTE *)a1 + 2992))
      v243 = (v243 + 1) >> 1;
    v242 += *(_DWORD *)((char *)a1 + v241 + 3048) + v243;
    v241 += 4;
  }
  while (v241 != 12);
  a1[452] = llvm::ConstantInt::get();
  a1[453] = v88;
  v244 = llvm::ConstantInt::get();
  a1[454] = v244;
  v245 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8;
  v246 = a1[451];
  LOWORD(v622) = 257;
  v247 = sub_21DF19FAC(v245, v246, v244, (uint64_t)&__dst);
  v248 = 0;
  v249 = 0;
  a1[455] = v247;
  do
  {
    v250 = *(_DWORD *)((char *)a1 + v248 + 3060);
    if (*((_BYTE *)a1 + 2992))
      v250 = (v250 + 1) >> 1;
    v249 += *(_DWORD *)((char *)a1 + v248 + 3048) + v250;
    v248 += 4;
  }
  while (v248 != 12);
  a1[456] = llvm::ConstantInt::get();
  a1[457] = v88;
  v251 = llvm::ConstantInt::get();
  a1[458] = v251;
  v252 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8;
  v253 = a1[455];
  LOWORD(v622) = 257;
  v254 = sub_21DF19FAC(v252, v253, v251, (uint64_t)&__dst);
  v255 = 0;
  v256 = 0;
  a1[459] = v254;
  do
  {
    v257 = *(_DWORD *)((char *)a1 + v255 + 3060);
    if (*((_BYTE *)a1 + 2992))
      v257 = (v257 + 1) >> 1;
    v256 += *(_DWORD *)((char *)a1 + v255 + 3048) + v257;
    v255 += 4;
  }
  while (v255 != 12);
  a1[460] = llvm::ConstantInt::get();
  a1[461] = v88;
  v258 = llvm::ConstantInt::get();
  a1[462] = v258;
  v259 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8;
  v260 = a1[459];
  LOWORD(v622) = 257;
  v261 = sub_21DF19FAC(v259, v260, v258, (uint64_t)&__dst);
  v262 = 0;
  v263 = 0;
  a1[463] = v261;
  do
  {
    v264 = *(_DWORD *)((char *)a1 + v262 + 3060);
    if (*((_BYTE *)a1 + 2992))
      v264 = (v264 + 1) >> 1;
    v263 += *(_DWORD *)((char *)a1 + v262 + 3048) + v264;
    v262 += 4;
  }
  while (v262 != 12);
  a1[464] = llvm::ConstantInt::get();
  a1[465] = v88;
  v265 = llvm::ConstantInt::get();
  a1[466] = v265;
  v266 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8;
  v267 = a1[463];
  LOWORD(v622) = 257;
  v268 = sub_21DF19FAC(v266, v267, v265, (uint64_t)&__dst);
  v269 = 0;
  v270 = 0;
  a1[467] = v268;
  do
  {
    v271 = *(_DWORD *)((char *)a1 + v269 + 3060);
    if (*((_BYTE *)a1 + 2992))
      v271 = (v271 + 1) >> 1;
    v270 += *(_DWORD *)((char *)a1 + v269 + 3048) + v271;
    v269 += 4;
  }
  while (v269 != 12);
  a1[468] = llvm::ConstantInt::get();
  a1[469] = v88;
  v272 = llvm::ConstantInt::get();
  v273 = 0;
  v274 = 0;
  a1[470] = v272;
  do
  {
    v275 = *(_DWORD *)((char *)a1 + v273 + 3060);
    if (*((_BYTE *)a1 + 2992))
      v275 = (v275 + 1) >> 1;
    v274 += *(_DWORD *)((char *)a1 + v273 + 3048) + v275;
    v273 += 4;
  }
  while (v273 != 12);
  v276 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8;
  v277 = llvm::ConstantInt::get();
  v278 = (uint64_t)&v564[*(_QWORD *)(*(_QWORD *)v564 - 24) + 8];
  v279 = llvm::ConstantInt::get();
  LOWORD(v622) = 257;
  v280 = sub_21DF3BFA0(v278, v86, v279, (uint64_t)&__dst);
  v616 = 257;
  v281 = v277;
  v282 = v564;
  v283 = sub_21DF1A864(v276, v281, v280, (uint64_t)&v612);
  v570 = 257;
  v284 = sub_21DF19FAC(v276, v272, v283, (uint64_t)v569);
  v285 = 0;
  v286 = 0;
  v282[470] = v284;
  do
  {
    v287 = *(_DWORD *)((char *)v282 + v285 + 3060);
    if (*((_BYTE *)v282 + 2992))
      v287 = (v287 + 1) >> 1;
    v286 += *(_DWORD *)((char *)v282 + v285 + 3048) + v287;
    v285 += 4;
  }
  while (v285 != 12);
  *((_DWORD *)v282 + 777) += v286;
  v288 = (uint64_t)v282 + *(_QWORD *)(*v282 - 24) + 8;
  v289 = llvm::ConstantInt::get();
  LOWORD(v622) = 257;
  v290 = sub_21DF1A864(v288, v289, v86, (uint64_t)&__dst);
  v291 = (uint64_t)v282 + *(_QWORD *)(*v282 - 24) + 8;
  v292 = v282[447];
  LOWORD(v622) = 257;
  v282[471] = sub_21DF19FAC(v291, v292, v290, (uint64_t)&__dst);
  v293 = llvm::ConstantInt::get();
  v282[472] = v293;
  v294 = *((unsigned __int8 *)v282 + 3157);
  if (*((_BYTE *)v282 + 3157))
    v295 = v88;
  else
    v295 = v85;
  v282[473] = v295;
  v296 = (unsigned __int8 *)v562;
  if (v294)
  {
    v297 = (uint64_t)v282 + *(_QWORD *)(*v282 - 24) + 8;
    LOWORD(v622) = 257;
    v293 = sub_21DF1A864(v297, v293, v86, (uint64_t)&__dst);
  }
  v282[474] = v293;
  if (*((_BYTE *)v282 + 3100))
  {
    if (*((_BYTE *)v282 + 3157))
      ++*((_DWORD *)v282 + 777);
    else
      ++*((_DWORD *)v282 + 776);
  }
  v298 = *(_QWORD *)(*v282 - 24);
  if (*(_BYTE *)(*(_QWORD *)((char *)v282 + v298 + 344) + 1671))
  {
    if (*((_BYTE *)v282 + 3101))
      v299 = 1;
    else
      v299 = *((_BYTE *)v282 + 3102) != 0;
    v305 = v88;
    if (*((_BYTE *)v282 + 3158))
      v306 = 1;
    else
      v306 = *((_BYTE *)v282 + 3159) != 0;
    v307 = v282[471];
    LOWORD(v622) = 257;
    v282[475] = sub_21DF19FAC((uint64_t)v282 + v298 + 8, v307, v293, (uint64_t)&__dst);
    v308 = llvm::ConstantInt::get();
    v309 = v308;
    v282[476] = v308;
    if (v306)
    {
      v88 = v305;
      v282[477] = v305;
      v310 = (uint64_t)v282 + *(_QWORD *)(*v282 - 24) + 8;
      LOWORD(v622) = 257;
      v309 = sub_21DF1A864(v310, v309, v86, (uint64_t)&__dst);
      v311 = v282[477];
      v282[478] = v309;
      *((_OWORD *)i + 2) = *(_OWORD *)i;
      v282[481] = v311;
      v282[482] = v309;
      if (!v299)
        goto LABEL_356;
LABEL_354:
      ++*((_DWORD *)v282 + 777);
      goto LABEL_356;
    }
    v282[477] = v85;
    v282[478] = v308;
    v282[479] = v282[475];
    v282[480] = v308;
    v282[481] = v85;
    v282[482] = v308;
    if (v299)
      ++*((_DWORD *)v282 + 776);
    v88 = v305;
  }
  else
  {
    v300 = v282[471];
    LOWORD(v622) = 257;
    v282[475] = sub_21DF19FAC((uint64_t)v282 + v298 + 8, v300, v293, (uint64_t)&__dst);
    v301 = llvm::ConstantInt::get();
    v282[476] = v301;
    v302 = *((unsigned __int8 *)v282 + 3158);
    if (*((_BYTE *)v282 + 3158))
      v303 = v88;
    else
      v303 = v85;
    v282[477] = v303;
    if (v302)
    {
      v304 = (uint64_t)v282 + *(_QWORD *)(*v282 - 24) + 8;
      LOWORD(v622) = 257;
      v301 = sub_21DF1A864(v304, v301, v86, (uint64_t)&__dst);
    }
    v282[478] = v301;
    if (*((_BYTE *)v282 + 3101))
    {
      if (*((_BYTE *)v282 + 3158))
        ++*((_DWORD *)v282 + 777);
      else
        ++*((_DWORD *)v282 + 776);
    }
    v312 = (uint64_t)v282 + *(_QWORD *)(*v282 - 24) + 8;
    v313 = v282[475];
    LOWORD(v622) = 257;
    v282[479] = sub_21DF19FAC(v312, v313, v301, (uint64_t)&__dst);
    v309 = llvm::ConstantInt::get();
    v282[480] = v309;
    v314 = *((unsigned __int8 *)v282 + 3159);
    if (*((_BYTE *)v282 + 3159))
      v315 = v88;
    else
      v315 = v85;
    v282[481] = v315;
    if (v314)
    {
      v316 = (uint64_t)v282 + *(_QWORD *)(*v282 - 24) + 8;
      LOWORD(v622) = 257;
      v309 = sub_21DF1A864(v316, v309, v86, (uint64_t)&__dst);
    }
    v282[482] = v309;
    if (*((_BYTE *)v282 + 3102))
    {
      if (!*((_BYTE *)v282 + 3159))
      {
        ++*((_DWORD *)v282 + 776);
        goto LABEL_356;
      }
      goto LABEL_354;
    }
  }
LABEL_356:
  v317 = (uint64_t)v282 + *(_QWORD *)(*v282 - 24) + 8;
  v318 = v282[479];
  LOWORD(v622) = 257;
  v282[483] = sub_21DF19FAC(v317, v318, v309, (uint64_t)&__dst);
  v319 = llvm::ConstantInt::get();
  v282[484] = v319;
  v320 = *((unsigned __int8 *)v282 + 3156);
  if (*((_BYTE *)v282 + 3156))
    v321 = v88;
  else
    v321 = v85;
  v282[485] = v321;
  if (v320)
  {
    v322 = (uint64_t)v282 + *(_QWORD *)(*v282 - 24) + 8;
    LOWORD(v622) = 257;
    v319 = sub_21DF1A864(v322, v319, v86, (uint64_t)&__dst);
  }
  v282[486] = v319;
  v323 = *((_DWORD *)v282 + 778);
  if (v323)
  {
    if (!*((_BYTE *)v282 + 3156))
    {
      *((_DWORD *)v282 + 776) += v323;
      if (!v296)
        goto LABEL_366;
      goto LABEL_365;
    }
    *((_DWORD *)v282 + 777) += v323;
  }
  if (v296)
  {
LABEL_365:
    v324 = (uint64_t)v282 + *(_QWORD *)(*v282 - 24) + 8;
    v325 = v282[411];
    v326 = v282[413];
    v327 = v282[412];
    LOWORD(v622) = 257;
    v328 = sub_21DF1A864(v324, v326, v327, (uint64_t)&__dst);
    v616 = 257;
    v329 = sub_21DF19FAC(v324, v325, v328, (uint64_t)&v612);
    sub_21DF98000(v282, v296, v329, 0, 0, *((unsigned __int8 *)v282 + 3156));
  }
LABEL_366:
  v330 = *((unsigned int *)v282 + 616);
  if (!(_DWORD)v330)
    goto LABEL_402;
  v331 = 0;
  LODWORD(v558) = 0;
  LODWORD(v559) = 0;
  v560 = 0;
  i = 0;
  v332 = v282[307];
  v333 = v332 + (v330 << 6);
  v554 = v282 + 24;
  v548 = &v613;
  v556 = (uint64_t)(v282 + 73);
  v544 = v333;
  do
  {
    if (*((_BYTE *)v282 + 2992))
      v334 = *(_BYTE *)(v332 + 56) != 0;
    else
      v334 = 0;
    v335 = v610;
    if ((_DWORD)v610)
    {
      v336 = *(_DWORD *)(v332 + 16);
      v337 = v609;
      do
      {
        v338 = v335 >> 1;
        v339 = &v337[16 * (v335 >> 1)];
        v341 = *(_DWORD *)v339;
        v340 = v339 + 16;
        v335 += ~(v335 >> 1);
        if (v341 < v336)
          v337 = v340;
        else
          v335 = v338;
      }
      while (v335);
      if (v337 == &v609[16 * v610] || *(_DWORD *)v337 != v336)
      {
LABEL_398:
        v282 = v564;
      }
      else
      {
        v342 = v564;
        v343 = (uint64_t)v342 + *(_QWORD *)(*v342 - 24) + 8;
        v562 = *(unsigned int *)(v332 + 60);
        v344 = &v564[32 * v562];
        v345 = v344[411];
        v346 = v344[413];
        v347 = v344[412];
        LOWORD(v622) = 257;
        v348 = sub_21DF1A864(v343, v346, v347, (uint64_t)&__dst);
        v616 = 257;
        v349 = sub_21DF19FAC(v343, v345, v348, (uint64_t)&v612);
        v350 = v349;
        v351 = (llvm::Constant *)*((_QWORD *)v337 + 1);
        if (v334)
        {
          v352 = v548;
          *v548 = 0;
          v352[1] = 0;
          v352[2] = 0;
          v612 = v351;
          if (*(_QWORD *)v351)
            v353 = *(_BYTE *)(*(_QWORD *)v351 + 8) == 18;
          else
            v353 = 0;
          if (v353)
          {
            v354 = *(unsigned int *)(*(_QWORD *)v351 + 32);
            sub_21DF79A74((uint64_t)&v564[*(_QWORD *)(*(_QWORD *)v564 - 24)], v351, &v612);
            if (!(_DWORD)v354)
              goto LABEL_398;
          }
          else
          {
            v354 = 1;
          }
          v555 = v350;
          v557 = v332;
          v359 = *(_DWORD *)(v332 + 52);
          v360 = (uint64_t *)&v612;
          while (1)
          {
            v361 = v564;
            v362 = (uint64_t)&v564[*(_QWORD *)(*(_QWORD *)v564 - 24) + 8];
            v363 = llvm::ConstantInt::get();
            LOWORD(v622) = 257;
            v561 = (void **)sub_21DF19FAC(v362, v555, v363, (uint64_t)&__dst);
            v365 = *v360;
            v366 = *(unsigned __int8 *)(v557 + 57);
            if (i)
            {
              v367 = *(_QWORD *)(*v361 - 24);
              if (v331 == (_DWORD)v562 && (_DWORD)v558 == (v359 & 0xFFFFFFFE))
              {
                v368 = v564;
                LOWORD(v622) = 257;
                v369 = (uint64_t)&v564[v367 + 8];
                v370 = (uint64_t)i;
                v371 = llvm::ConstantInt::get();
                v372 = sub_21DF7980C(v369, v370, v365, v371, (uint64_t)&__dst);
                if (v372)
                {
                  v373 = *(_QWORD *)(*v368 - 24);
                  v374 = *(_QWORD *)((char *)v554 + v373);
                  LOWORD(v622) = 257;
                  v375 = (unsigned __int8 *)sub_21DF1A79C((uint64_t)v368 + v373 + 8, 49, v372, v374, (uint64_t)&__dst);
                  sub_21DF98000(v368, v375, (uint64_t)v560, 1, 1, (_DWORD)v559 != 0);
                  i = 0;
                  v560 = 0;
                }
                else
                {
                  i = 0;
                }
                goto LABEL_395;
              }
              v361 = v564;
              v376 = *(_QWORD *)((char *)v554 + v367);
              LOWORD(v622) = 257;
              v377 = (unsigned __int8 *)sub_21DF1A79C((uint64_t)&v564[v367 + 8], 49, (uint64_t)i, v376, (uint64_t)&__dst);
              sub_21DF98000(v361, v377, (uint64_t)v560, 1, 1, (_DWORD)v559 != 0);
            }
            v378 = (llvm::Constant **)((char *)v361 + *(_QWORD *)(*v361 - 24));
            v379 = llvm::Constant::getNullValue(v378[26], v364);
            LOWORD(v622) = 257;
            v380 = llvm::ConstantInt::get();
            i = (_QWORD *)sub_21DF7980C((uint64_t)(v378 + 1), v379, v365, v380, (uint64_t)&__dst);
            v560 = v561;
            LODWORD(v559) = v366;
            LODWORD(v558) = v359;
LABEL_395:
            ++v359;
            ++v360;
            v331 = v562;
            if (!--v354)
            {
              v331 = v562;
              v332 = v557;
              v333 = v544;
              goto LABEL_398;
            }
          }
        }
        v355 = v349;
        v356 = (uint64_t)v342 + *(_QWORD *)(*v342 - 24) + 8;
        v357 = llvm::ConstantInt::get();
        LOWORD(v622) = 257;
        v358 = sub_21DF19FAC(v356, v355, v357, (uint64_t)&__dst);
        sub_21DF98000(v342, (unsigned __int8 *)v351, v358, 1, 1, *(unsigned __int8 *)(v332 + 57));
        v282 = v342;
      }
    }
    v332 += 64;
  }
  while (v332 != v333);
  if (i)
  {
    v381 = (char *)v282 + *(_QWORD *)(*v282 - 24);
    v382 = *((_QWORD *)v381 + 24);
    LOWORD(v622) = 257;
    v383 = (unsigned __int8 *)sub_21DF1A79C((uint64_t)(v381 + 8), 49, (uint64_t)i, v382, (uint64_t)&__dst);
    sub_21DF98000(v282, v383, (uint64_t)v560, 1, 1, (_DWORD)v559 != 0);
  }
LABEL_402:
  if (*((_DWORD *)v282 + 814))
  {
    v384 = *(_QWORD *)(*v282 - 24);
    if (*(_BYTE *)(*(_QWORD *)((char *)v282 + v384 + 344) + 1654))
    {
      v385 = *(_QWORD *)((char *)v282 + v384 + 56);
      __dst = "return_block";
      LOWORD(v622) = 259;
      v386 = llvm::BasicBlock::splitBasicBlock();
      __dst = "tf_write_block";
      LOWORD(v622) = 259;
      v557 = v385;
      operator new();
      v556 = v386;
      v387 = llvm::BasicBlock::BasicBlock();
      v388 = (char *)v282 + *(_QWORD *)(*v282 - 24);
      v555 = v387;
      *((_QWORD *)v388 + 7) = v387;
      *((_QWORD *)v388 + 8) = v387 + 40;
      v389 = v282[19];
      if ((*(_BYTE *)(v389 + 18) & 1) != 0)
        llvm::Function::BuildLazyArguments((llvm::Function *)v282[19]);
      v390 = *((_DWORD *)v282 + 815);
      if (v390)
        v391 = 40 * (v390 - 1) + 40;
      else
        v391 = 0;
      v392 = *(_QWORD *)(v389 + 88) + v391;
      v393 = (char *)v282 + *(_QWORD *)(*v282 - 24);
      v394 = (uint64_t)(v393 + 8);
      v395 = *((_QWORD *)v393 + 24);
      LOWORD(v622) = 257;
      v396 = sub_21DF1A79C((uint64_t)(v393 + 8), 49, v392, v395, (uint64_t)&__dst);
      v397 = *(_QWORD *)((char *)v282 + *(_QWORD *)(*v282 - 24) + 200);
      v616 = 257;
      v398 = sub_21DF1A79C(v394, 39, v396, v397, (uint64_t)&v612);
      v399 = v282[396];
      v400 = (void **)v282[397];
      v560 = (void **)v398;
      v561 = v400;
      if ((void **)v399 != v400)
      {
        v558 = v564 + 192;
        v559 = v564 + 200;
        v401 = v564;
        do
        {
          v402 = *(llvm::Instruction **)(v399 + 24);
          if (v402)
          {
            v403 = (_QWORD *)*((_QWORD *)v402 - 8);
            v562 = (unint64_t)&v401[*(unsigned int *)(v399 + 4)];
            i = v403;
            v404 = (uint64_t)v401 + *(_QWORD *)(*v401 - 24) + 8;
            v405 = llvm::ConstantInt::get();
            v406 = (uint64_t)v559;
            v407 = *(_QWORD *)&v559[*(_QWORD *)(*v401 - 24)];
            LOWORD(v622) = 257;
            v408 = sub_21DF1A79C(v404, 39, v405, v407, (uint64_t)&__dst);
            v616 = 257;
            v409 = sub_21DF1A864(v404, (uint64_t)v560, v408, (uint64_t)&v612);
            v410 = (uint64_t)v401 + *(_QWORD *)(*v401 - 24) + 8;
            v411 = llvm::ConstantInt::get();
            v412 = *(_QWORD *)(v406 + *(_QWORD *)(*v401 - 24));
            LOWORD(v622) = 257;
            v413 = sub_21DF1A79C(v410, 39, v411, v412, (uint64_t)&__dst);
            v616 = 257;
            v414 = (uint64_t *)sub_21DF19FAC(v410, v409, v413, (uint64_t)&v612);
            v415 = (uint64_t)v401 + *(_QWORD *)(*v401 - 24);
            v416 = *(_QWORD *)(v562 + 3224);
            v417 = llvm::PointerType::get();
            LOWORD(v622) = 257;
            v418 = (uint64_t *)sub_21DF1A79C(v415 + 8, 49, v416, v417, (uint64_t)&__dst);
            v616 = 257;
            v419 = sub_21DF1A924(v415, v418, v414, (uint64_t)&v612);
            v420 = (uint64_t)v401 + *(_QWORD *)(*v401 - 24) + 8;
            v421 = **((_QWORD **)v402 - 4);
            LOWORD(v622) = 257;
            v422 = sub_21DF1A79C(v420, 49, v419, v421, (uint64_t)&__dst);
            sub_21DF385B0((_QWORD *)((char *)v401 + *(_QWORD *)(*v401 - 24) + 8), (llvm::Type **)i, v422, 0);
            v423 = *((_QWORD *)v402 - 4);
            llvm::Instruction::eraseFromParent(v402);
            sub_21DF523B8(v423);
          }
          v399 += 32;
        }
        while ((void **)v399 != v561);
      }
      v282 = v564;
      v424 = v556;
      sub_21DF38D0C((_QWORD *)((char *)v282 + *(_QWORD *)(*v282 - 24) + 8));
      v426 = v557 + 40;
      v425 = *(_QWORD *)(v557 + 40);
      if (v425 == v557 + 40)
      {
        v429 = 0;
      }
      else
      {
        v427 = (llvm::Instruction *)(v425 - 24);
        if (v425)
          v428 = v425 - 24;
        else
          v428 = 0;
        if (*(unsigned __int8 *)(v428 + 16) - 29 >= 0xB)
          v429 = 0;
        else
          v429 = v427;
      }
      v430 = v555;
      llvm::Instruction::eraseFromParent(v429);
      v431 = (char *)v282 + *(_QWORD *)(*v282 - 24);
      *((_QWORD *)v431 + 7) = v557;
      *((_QWORD *)v431 + 8) = v426;
      v432 = llvm::User::operator new((llvm::User *)0x58);
      __dst = "agc.tf_writes_enable";
      LOWORD(v622) = 259;
      v433 = llvm::GlobalVariable::GlobalVariable();
      *(_BYTE *)(v433 + 80) |= 1u;
      llvm::GlobalObject::setSection();
      sub_21DF7A774((uint64_t)v282 + *(_QWORD *)(*v282 - 24));
      v434 = (_QWORD *)((char *)v282 + *(_QWORD *)(*v282 - 24) + 8);
      LOWORD(v622) = 257;
      v435 = (llvm::Type ***)sub_21DF19394(v434, **(llvm::Type ***)(*(_QWORD *)v432 + 16), v432, 0, (uint64_t)&__dst);
      v436 = llvm::ConstantInt::get();
      v616 = 257;
      v437 = sub_21DF19478(v434, 33, v435, v436, (uint64_t)&v612);
      sub_21DF38D70((_QWORD *)((char *)v282 + *(_QWORD *)(*v282 - 24) + 8), v437, v430, v424);
    }
  }
  if (*((_DWORD *)v282 + 774))
  {
    v438 = llvm::ConstantFP::get();
    v439 = (_QWORD *)((char *)v282 + *(_QWORD *)(*v282 - 24));
    v440 = v439[43];
    v441 = *(_QWORD *)(v440 + 1232);
    v442 = v441 ? strlen(*(const char **)(v440 + 1232)) : 0;
    v443 = sub_21DF1B0B0((uint64_t)v439, v441, v442, v439[18], v439[73], v439[20]);
    v444 = *(_QWORD *)((char *)v282 + *(_QWORD *)(*v282 - 24) + 320);
    v445 = *(void ***)(v444 + 32);
    v561 = (void **)(v444 + 24);
    if (v445 != (void **)(v444 + 24))
    {
      v446 = v443;
      v447 = v282 + 1;
      do
      {
        v448 = v445 - 7;
        if (!v445)
          v448 = 0;
        v449 = v448[10];
        v562 = (unint64_t)v445;
        for (i = v448 + 9; v449 != i; v449 = (_QWORD *)v449[1])
        {
          if (v449)
            v450 = (llvm::BasicBlock *)(v449 - 3);
          else
            v450 = 0;
          v451 = (_QWORD *)*((_QWORD *)v450 + 5);
          if (v451 != (_QWORD *)((char *)v450 + 40))
          {
            v452 = v451 - 3;
            if (v451)
              v453 = v451 - 3;
            else
              v453 = 0;
            v454 = *((unsigned __int8 *)v453 + 16) - 29;
            if (v454 >= 0xB)
              v452 = 0;
            v455 = *((unsigned __int8 *)v452 + 16);
            if (v454 <= 0xA && v455 == 29)
            {
              v457 = (uint64_t)v447 + *(_QWORD *)(*v282 - 24);
              FirstInsertionPt = llvm::BasicBlock::getFirstInsertionPt(v450);
              v459 = v457;
              v282 = v564;
              sub_21DF19018(v459, (uint64_t)v450, FirstInsertionPt);
              if (*((_DWORD *)v282 + 774))
              {
                v460 = 0;
                do
                {
                  v612 = 0;
                  v613 = 0;
                  v612 = (llvm::Constant *)llvm::ConstantInt::get();
                  v613 = v438;
                  v461 = (uint64_t)v447 + *(_QWORD *)(*v282 - 24);
                  LOWORD(v622) = 257;
                  sub_21DF191A4(v461, *(_QWORD *)(v446 + 24), v446, (uint64_t)&v612, 2, (uint64_t)&__dst);
                  ++v460;
                }
                while (v460 < *((unsigned int *)v282 + 774));
              }
            }
          }
        }
        v445 = *(void ***)(v562 + 8);
      }
      while (v445 != v561);
    }
  }
  sub_21DF3F430((uint64_t)v282 + *(_QWORD *)(*v282 - 24) + 8, (uint64_t)v552);
  if (*((_BYTE *)v282 + 3100))
  {
    v462 = (*(uint64_t (**)(_QWORD *, unsigned __int8 *))(*v282 + 368))(v282, v550);
    v463 = llvm::ConstantFP::get();
    v464 = (char *)v282 + *(_QWORD *)(*v282 - 24);
    v465 = *((_QWORD *)v464 + 43);
    v565 = *(_OWORD *)(v464 + 56);
    llvm::IRBuilderBase::getCurrentDebugLocation((llvm::IRBuilderBase *)(v464 + 8));
    v567 = *((_DWORD *)v464 + 26);
    v466 = (unsigned __int8 *)(*(uint64_t (**)(uint64_t, __int128 *, uint64_t, uint64_t, _QWORD))(*(_QWORD *)v465 + 48))(v465, &v565, v462, v463, 0);
    if (v566)
      llvm::MetadataTracking::untrack();
    v282 = v564;
    v467 = (uint64_t)v282 + *(_QWORD *)(*v282 - 24) + 8;
    v468 = *((_QWORD *)v564 + 471);
    v469 = *((_QWORD *)v564 + 473);
    v470 = *((_QWORD *)v564 + 472);
    LOWORD(v622) = 257;
    v471 = sub_21DF1A864(v467, v469, v470, (uint64_t)&__dst);
    v616 = 257;
    v472 = sub_21DF19FAC(v467, v468, v471, (uint64_t)&v612);
    sub_21DF98000(v282, v466, v472, 0, 2, *((unsigned __int8 *)v282 + 3157));
  }
  v473 = *(_QWORD *)(*v282 - 24);
  v474 = *(_BYTE **)((char *)v282 + v473 + 344);
  if (v474[1671])
  {
    if (*((_BYTE *)v282 + 3101) || *((_BYTE *)v282 + 3102))
    {
      v475 = llvm::ConstantInt::get();
      if (*((_BYTE *)v282 + 3101))
      {
        v476 = (llvm::Type ***)NullValue;
        v477 = *(_QWORD *)(*v282 - 24);
        v478 = (uint64_t)v282 + v477;
        v479 = *(_QWORD *)((char *)v282 + v477 + 192);
        if (*(_QWORD *)NullValue == v479)
        {
          v497 = (llvm::Type ***)llvm::ConstantInt::get();
          v480 = sub_21DF7A358(v478, v476, v497, 36);
        }
        else
        {
          LOWORD(v622) = 257;
          v480 = sub_21DF1A79C((uint64_t)v282 + v477 + 8, 39, (uint64_t)NullValue, v479, (uint64_t)&__dst);
        }
        v498 = v480;
        v499 = sub_21DF984E8(v282);
        v500 = (uint64_t)v282 + *(_QWORD *)(*v282 - 24) + 8;
        LOWORD(v622) = 257;
        v501 = sub_21DF1A184(v500, v498, v499, (uint64_t)&__dst);
        v502 = (uint64_t)v282 + *(_QWORD *)(*v282 - 24) + 8;
        LOWORD(v622) = 257;
        v503 = llvm::ConstantInt::get();
        v475 = sub_21DF1A184(v502, v501, v503, (uint64_t)&__dst);
      }
      v504 = v475;
      v505 = (llvm::Type ***)v551;
      if (*((_BYTE *)v282 + 3102))
      {
        v506 = *(_QWORD *)(*v282 - 24);
        v507 = (uint64_t)v282 + v506;
        v508 = *(_QWORD *)((char *)v282 + v506 + 192);
        if (*v551 == v508)
        {
          v510 = (llvm::Type ***)llvm::ConstantInt::get();
          v509 = sub_21DF7A358(v507, v505, v510, 36);
        }
        else
        {
          LOWORD(v622) = 257;
          v509 = sub_21DF1A79C((uint64_t)v282 + v506 + 8, 39, (uint64_t)v551, v508, (uint64_t)&__dst);
        }
        v511 = v509;
        v512 = sub_21DF984E8(v282);
        v513 = (uint64_t)v282 + *(_QWORD *)(*v282 - 24) + 8;
        LOWORD(v622) = 257;
        v514 = sub_21DF1A410(v513, v511, v512, (uint64_t)&__dst);
        v515 = (uint64_t)v282 + *(_QWORD *)(*v282 - 24) + 8;
        LOWORD(v622) = 257;
        v516 = llvm::ConstantInt::get();
        v517 = v515;
        v282 = v564;
        v518 = sub_21DF1A184(v517, v514, v516, (uint64_t)&__dst);
        v519 = (uint64_t)v282 + *(_QWORD *)(*v282 - 24) + 8;
        LOWORD(v622) = 257;
        v520 = sub_21DF19FAC(v519, v504, v518, (uint64_t)&__dst);
        v521 = (uint64_t)v282 + *(_QWORD *)(*v282 - 24) + 8;
        LOWORD(v622) = 257;
        v504 = sub_21DF1A4A0(v521, v520, v511, (uint64_t)&__dst);
      }
      v522 = (uint64_t)v282 + *(_QWORD *)(*v282 - 24) + 8;
      v523 = v282[475];
      v524 = v282[477];
      v525 = v282[476];
      LOWORD(v622) = 257;
      v526 = sub_21DF1A864(v522, v524, v525, (uint64_t)&__dst);
      v616 = 257;
      v492 = sub_21DF19FAC(v522, v523, v526, (uint64_t)&v612);
      if (*((_BYTE *)v282 + 3158))
        v493 = 1;
      else
        v493 = *((_BYTE *)v282 + 3159) != 0;
      v494 = v282;
      v495 = (unsigned __int8 *)v504;
      v496 = 4;
LABEL_480:
      sub_21DF98000(v494, v495, v492, 0, v496, v493);
    }
  }
  else
  {
    if (v474[1669] && *((_BYTE *)v282 + 3101))
    {
      v481 = (uint64_t)v282 + v473 + 8;
      v482 = v282[475];
      v483 = v282[477];
      v484 = v282[476];
      LOWORD(v622) = 257;
      v485 = sub_21DF1A864(v481, v483, v484, (uint64_t)&__dst);
      v616 = 257;
      v486 = sub_21DF19FAC(v481, v482, v485, (uint64_t)&v612);
      sub_21DF98000(v282, NullValue, v486, 0, 4, *((unsigned __int8 *)v282 + 3158));
      v473 = *(_QWORD *)(*v282 - 24);
      v474 = *(_BYTE **)((char *)v282 + v473 + 344);
    }
    if (v474[1670] && *((_BYTE *)v282 + 3102))
    {
      v487 = (uint64_t)v282 + v473 + 8;
      v488 = v282[479];
      v489 = v282[481];
      v490 = v282[480];
      LOWORD(v622) = 257;
      v491 = sub_21DF1A864(v487, v489, v490, (uint64_t)&__dst);
      v616 = 257;
      v492 = sub_21DF19FAC(v487, v488, v491, (uint64_t)&v612);
      v493 = *((unsigned __int8 *)v282 + 3159);
      v494 = v282;
      v495 = (unsigned __int8 *)v551;
      v496 = 5;
      goto LABEL_480;
    }
  }
  v527 = 0;
  v528 = 0;
  v529 = 1;
  v530 = v564;
  do
  {
    if ((*((_DWORD *)v530 + 779) & v529) != 0)
    {
      v531 = llvm::ConstantInt::get();
      v532 = (uint64_t)&v530[*(_QWORD *)(*(_QWORD *)v530 - 24) + 8];
      v533 = *((_QWORD *)v530 + 483);
      v534 = *((_QWORD *)v530 + 485);
      v535 = *((_QWORD *)v530 + 484);
      LOWORD(v622) = 257;
      v536 = sub_21DF1A864(v532, v534, v535, (uint64_t)&__dst);
      v616 = 257;
      v537 = sub_21DF19FAC(v532, v533, v536, (uint64_t)&v612);
      v570 = 257;
      v538 = sub_21DF19FAC(v532, v531, v537, (uint64_t)v569);
      sub_21DF98000(v530, *(unsigned __int8 **)&v605[v527], v538, 0, 3, v530[3156]);
      ++v528;
    }
    v529 *= 2;
    v527 += 8;
  }
  while (v527 != 64);
  if (v549)
    sub_21DF523B8((uint64_t)v549);
  v539 = (llvm::Instruction *)v552;
  v540 = v552 + 3;
  if (!v552)
    v540 = 0;
  sub_21DF19018((uint64_t)&v564[*(_QWORD *)(*(_QWORD *)v564 - 24) + 8], (uint64_t)v552[5], (uint64_t)v540[1]);
  llvm::Instruction::eraseFromParent(v539);
  llvm::Function::eraseFromParent(Function);
  v193 = 1;
  v190 = v546;
  v98 = v547;
LABEL_490:
  v541 = 384;
  do
  {
    if ((char)v569[v541 + 23] < 0)
      operator delete(*(void **)&v569[v541]);
    v541 -= 96;
  }
  while (v541);
  if (v606 != v190)
    free(v606);
  if (v609 != v98)
    free(v609);
  return v193;
}

uint64_t sub_21DF9718C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t Function;
  uint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  _QWORD *v14;
  _QWORD *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  unint64_t *v37;
  uint64_t v38;
  unint64_t v39;
  void *__p;
  char *v42;
  uint64_t v43;
  _QWORD **v44;
  _QWORD *v45[2];
  uint64_t v46;

  if (*(_BYTE *)(a1 + 3124))
  {
    sub_21DF51844(*(_QWORD *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24) + 320), a2, a3, a4, a5, a6, a7, a8);
    v9 = *(_QWORD *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24) + 344);
    if (*(_QWORD *)(v9 + 1240))
      strlen(*(const char **)(v9 + 1240));
    Function = llvm::Module::getFunction();
    if (Function)
    {
      v11 = *(_QWORD *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24) + 320);
      __p = 0;
      v42 = 0;
      v45[0] = 0;
      v45[1] = 0;
      v43 = 0;
      v44 = v45;
      v46 = v11;
      v12 = *(_QWORD *)(Function + 8);
      if (v12)
      {
        do
        {
          v13 = (unint64_t *)(*(_QWORD *)(v12 + 24)
                                   - 32 * (*(_DWORD *)(*(_QWORD *)(v12 + 24) + 20) & 0x7FFFFFF));
          v14 = (_QWORD *)(*v13 + 24);
          if (*(_DWORD *)(*v13 + 32) >= 0x41u)
            v14 = (_QWORD *)*v14;
          if ((*(_DWORD *)v14 & 0xFFFFFFFC) == 0)
            sub_21DF52680((uint64_t *)&__p, v13[4]);
          v12 = *(_QWORD *)(v12 + 8);
        }
        while (v12);
        v15 = v42;
        if (__p != v42)
        {
          v16 = 0;
          do
          {
            v17 = *(v15 - 1);
            v42 = (char *)(v15 - 1);
            if (sub_21DF195AC(v17))
              llvm::Instruction::setFast((llvm::Instruction *)v17);
            if (v17 && *(_BYTE *)(v17 + 16) == 60)
            {
              v18 = **(_QWORD **)(v17 - 32);
              v19 = *(_DWORD *)(v18 + 8);
              if ((v19 & 0xFE) == 0x12)
                v19 = *(_DWORD *)(**(_QWORD **)(v18 + 16) + 8);
              v20 = v19 >> 8;
              v21 = 1 << SBYTE1(v19);
              if (((1 << SBYTE1(v19)) & v16) == 0)
              {
                v22 = v46 + 24;
                for (i = *(_QWORD *)(v46 + 32); i != v22; i = *(_QWORD *)(i + 8))
                {
                  v24 = i - 56;
                  if (!i)
                    v24 = 0;
                  v25 = v24 + 72;
                  for (j = *(_QWORD *)(v24 + 80); j != v25; j = *(_QWORD *)(j + 8))
                  {
                    v27 = j - 24;
                    if (!j)
                      v27 = 0;
                    v28 = *(_QWORD *)(v27 + 48);
                    if (v28 != v27 + 40)
                    {
LABEL_47:
                      while (j != v25)
                      {
                        v29 = v28 - 24;
                        if (!v28)
                          v29 = 0;
                        v30 = *(unsigned __int8 *)(v29 + 16);
                        if (v30 != 61)
                          v29 = 0;
                        if (v28 && v30 == 61)
                        {
                          v31 = **(_QWORD **)(v29 - 32);
                          v32 = *(_DWORD *)(v31 + 8);
                          if ((v32 & 0xFE) == 0x12)
                            v32 = *(_DWORD *)(**(_QWORD **)(v31 + 16) + 8);
                          if (v20 == v32 >> 8)
                            sub_21DF52680((uint64_t *)&__p, *(_QWORD *)(v29 - 64));
                        }
                        v28 = *(_QWORD *)(v28 + 8);
                        v33 = j - 24;
                        if (!j)
                          v33 = 0;
                        if (v28 == v33 + 40)
                        {
                          while (1)
                          {
                            j = *(_QWORD *)(j + 8);
                            if (j == v25)
                              goto LABEL_48;
                            v34 = j - 24;
                            if (!j)
                              v34 = 0;
                            v28 = *(_QWORD *)(v34 + 48);
                            if (v28 != v34 + 40)
                              goto LABEL_47;
                          }
                        }
                      }
                      break;
                    }
                  }
LABEL_48:
                  ;
                }
                v16 |= v21;
              }
              goto LABEL_57;
            }
            v35 = *(_DWORD *)(v17 + 20);
            if ((v35 & 0x40000000) != 0)
            {
              v37 = *(unint64_t **)(v17 - 8);
              v36 = v35 & 0x7FFFFFF;
              if (v36)
              {
LABEL_53:
                v38 = 32 * v36;
                do
                {
                  v39 = *v37;
                  v37 += 4;
                  sub_21DF52680((uint64_t *)&__p, v39);
                  v38 -= 32;
                }
                while (v38);
              }
            }
            else
            {
              v36 = v35 & 0x7FFFFFF;
              v37 = (unint64_t *)(v17 - 32 * v36);
              if (v36)
                goto LABEL_53;
            }
LABEL_57:
            v15 = v42;
          }
          while (__p != v42);
        }
      }
      sub_21DF2E824(v45[0]);
      if (__p)
      {
        v42 = (char *)__p;
        operator delete(__p);
      }
    }
  }
  return 1;
}

llvm::Value *sub_21DF97490(_QWORD *a1, int a2)
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  _WORD v10[20];
  uint64_t v11;

  v3 = *(_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 344);
  if (a2)
  {
    v4 = *(const char **)(v3 + 1352);
    v5 = sub_21DF98C2C(a1);
  }
  else
  {
    v4 = *(const char **)(v3 + 1344);
    v5 = sub_21DF97554(a1);
  }
  v11 = v5;
  if (v4)
    v6 = strlen(v4);
  else
    v6 = 0;
  v7 = sub_21DF203DC((uint64_t)a1 + *(_QWORD *)(*a1 - 24), (uint64_t)v4, v6, *(_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 192), *(_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 192));
  v8 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8;
  v10[16] = 257;
  return sub_21DF191A4(v8, *(_QWORD *)(v7 + 24), v7, (uint64_t)&v11, 1, (uint64_t)v10);
}

uint64_t sub_21DF97554(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  const char *v6;
  __int16 v7;

  v2 = llvm::User::operator new((llvm::User *)0x58);
  v6 = "agc.amp.count";
  v7 = 259;
  v3 = llvm::GlobalVariable::GlobalVariable();
  *(_BYTE *)(v3 + 80) |= 1u;
  llvm::GlobalObject::setSection();
  sub_21DF7A774((uint64_t)a1 + *(_QWORD *)(*a1 - 24));
  v4 = (_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  v7 = 257;
  return sub_21DF19394(v4 + 1, **(llvm::Type ***)(*(_QWORD *)v2 + 16), v2, 0, (uint64_t)&v6);
}

unint64_t sub_21DF9764C(unint64_t result, unint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7;
  unsigned int *v8;
  unint64_t i;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t k;
  unsigned int v21;
  unsigned int v22;
  unint64_t m;
  unsigned int v24;
  unsigned int v25;
  unsigned int v27;
  unsigned int v28;
  unint64_t v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  BOOL v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unint64_t j;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  uint64_t v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  BOOL v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unsigned int v55;
  unsigned int v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unsigned int v61;
  unint64_t v62;
  uint64_t v63;
  int64_t v64;
  int64_t v65;
  int64_t v66;
  uint64_t v67;
  unint64_t v68;
  unsigned int v69;
  unint64_t v70;
  unsigned int v71;
  unsigned int v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unsigned int v78;
  unsigned int v79;
  unint64_t v80;
  uint64_t v82;
  unsigned int v83;
  unsigned int v84;
  unint64_t v85;
  uint64_t v86;
  unsigned int v87;
  unsigned int v88;
  uint64_t v89;
  int64_t v90;
  unsigned int v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  int64_t v97;
  uint64_t v98;
  uint64_t v99;
  unsigned int v100;
  uint64_t v101;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  unsigned int v105;
  unsigned int v106;
  unint64_t v107;
  unint64_t v108;
  unint64_t v109;
  unsigned int v110;

  v7 = result;
LABEL_2:
  v8 = (unsigned int *)(a2 - 16);
  i = v7;
  while (2)
  {
    v7 = i;
    v10 = a2 - i;
    v11 = (uint64_t)(a2 - i) >> 4;
    switch(v11)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v45 = *v8;
        v46 = *(_DWORD *)i;
        if (*v8 >= *(_DWORD *)i)
        {
          if (v46 < v45)
            return result;
          v48 = *(_QWORD *)(a2 - 8);
          v47 = *(_QWORD *)(i + 8);
          if (v48 >= v47)
            return result;
        }
        else
        {
          v47 = *(_QWORD *)(i + 8);
          v48 = *(_QWORD *)(a2 - 8);
        }
        *(_DWORD *)i = v45;
        *(_DWORD *)(a2 - 16) = v46;
        *(_QWORD *)(i + 8) = v48;
        *(_QWORD *)(a2 - 8) = v47;
        return result;
      case 3uLL:
        return (unint64_t)sub_21DF98D24((unsigned int *)i, (unsigned int *)(i + 16), (unsigned int *)(a2 - 16));
      case 4uLL:
        return (unint64_t)sub_21DF98E6C(i, i + 16, i + 32, a2 - 16);
      case 5uLL:
        return (unint64_t)sub_21DF98F6C(i, i + 16, i + 32, i + 48, (unsigned int *)(a2 - 16));
      default:
        if (v10 > 383)
        {
          if (!a3)
          {
            if (i == a2)
              return result;
            v64 = (v11 - 2) >> 1;
            v65 = v64;
            while (1)
            {
              v66 = v65;
              if (v64 >= v65)
              {
                v67 = (2 * v65) | 1;
                v68 = i + 16 * v67;
                if (2 * v66 + 2 < (uint64_t)v11)
                {
                  v69 = *(_DWORD *)(v68 + 16);
                  if (*(_DWORD *)v68 < v69
                    || v69 >= *(_DWORD *)v68 && *(_QWORD *)(i + 16 * v67 + 8) < *(_QWORD *)(v68 + 24))
                  {
                    v68 += 16;
                    v67 = 2 * v66 + 2;
                  }
                }
                v70 = i + 16 * v66;
                v71 = *(_DWORD *)v68;
                v72 = *(_DWORD *)v70;
                if (*(_DWORD *)v68 >= *(_DWORD *)v70)
                {
                  if (v72 < v71)
                  {
                    v73 = *(_QWORD *)(v70 + 8);
                    v74 = *(_QWORD *)(v68 + 8);
LABEL_131:
                    *(_DWORD *)v70 = v71;
                    *(_QWORD *)(v70 + 8) = v74;
                    if (v64 >= v67)
                    {
                      while (1)
                      {
                        v76 = 2 * v67;
                        v67 = (2 * v67) | 1;
                        v75 = i + 16 * v67;
                        v77 = v76 + 2;
                        if (v77 < (uint64_t)v11)
                        {
                          v78 = *(_DWORD *)(v75 + 16);
                          if (*(_DWORD *)v75 < v78
                            || v78 >= *(_DWORD *)v75 && *(_QWORD *)(i + 16 * v67 + 8) < *(_QWORD *)(v75 + 24))
                          {
                            v75 += 16;
                            v67 = v77;
                          }
                        }
                        v79 = *(_DWORD *)v75;
                        if (*(_DWORD *)v75 < v72)
                          break;
                        v80 = *(_QWORD *)(v75 + 8);
                        if (v72 >= v79 && v80 < v73)
                          break;
                        *(_DWORD *)v68 = v79;
                        *(_QWORD *)(v68 + 8) = v80;
                        v68 = v75;
                        if (v64 < v67)
                          goto LABEL_133;
                      }
                    }
                    v75 = v68;
LABEL_133:
                    *(_DWORD *)v75 = v72;
                    *(_QWORD *)(v75 + 8) = v73;
                    goto LABEL_134;
                  }
                  v74 = *(_QWORD *)(v68 + 8);
                  v73 = *(_QWORD *)(i + 16 * v66 + 8);
                  if (v74 >= v73)
                    goto LABEL_131;
                }
              }
LABEL_134:
              v65 = v66 - 1;
              if (!v66)
              {
                v89 = (unint64_t)v10 >> 4;
                while (1)
                {
                  v90 = 0;
                  v91 = *(_DWORD *)i;
                  v92 = *(_QWORD *)(i + 8);
                  v93 = v89 - 2;
                  if (v89 < 2)
                    v93 = v89 - 1;
                  v94 = v93 >> 1;
                  v95 = i;
                  do
                  {
                    v96 = v95;
                    v97 = v90 + 1;
                    v95 += 16 * (v90 + 1);
                    v98 = 2 * v90;
                    result = (2 * v90) | 1;
                    v90 = result;
                    v99 = v98 + 2;
                    if (v99 < v89)
                    {
                      result = v95 + 16;
                      v100 = *(_DWORD *)(v95 + 16);
                      if (*(_DWORD *)v95 < v100
                        || v100 >= *(_DWORD *)v95 && *(_QWORD *)(v96 + 16 * v97 + 8) < *(_QWORD *)(v95 + 24))
                      {
                        v95 += 16;
                        v90 = v99;
                      }
                    }
                    *(_DWORD *)v96 = *(_DWORD *)v95;
                    *(_QWORD *)(v96 + 8) = *(_QWORD *)(v95 + 8);
                  }
                  while (v90 <= v94);
                  if (v95 == a2 - 16)
                  {
                    *(_DWORD *)v95 = v91;
                    *(_QWORD *)(v95 + 8) = v92;
                  }
                  else
                  {
                    *(_DWORD *)v95 = *(_DWORD *)(a2 - 16);
                    *(_QWORD *)(v95 + 8) = *(_QWORD *)(a2 - 8);
                    *(_DWORD *)(a2 - 16) = v91;
                    *(_QWORD *)(a2 - 8) = v92;
                    v101 = v95 - i + 16;
                    if (v101 >= 17)
                    {
                      v102 = (v101 >> 4) - 2;
                      v103 = v102 >> 1;
                      v104 = i + 16 * (v102 >> 1);
                      v105 = *(_DWORD *)v104;
                      v106 = *(_DWORD *)v95;
                      if (*(_DWORD *)v104 < *(_DWORD *)v95)
                      {
                        v107 = *(_QWORD *)(v95 + 8);
                        result = *(_QWORD *)(v104 + 8);
LABEL_176:
                        *(_DWORD *)v95 = v105;
                        *(_QWORD *)(v95 + 8) = result;
                        if (v102 >= 2)
                        {
                          while (1)
                          {
                            v109 = v103 - 1;
                            v103 = (v103 - 1) >> 1;
                            v108 = i + 16 * v103;
                            v110 = *(_DWORD *)v108;
                            if (*(_DWORD *)v108 >= v106)
                            {
                              if (v106 < v110)
                                break;
                              result = *(_QWORD *)(i + 16 * v103 + 8);
                              if (result >= v107)
                                break;
                            }
                            else
                            {
                              result = *(_QWORD *)(v108 + 8);
                            }
                            *(_DWORD *)v104 = v110;
                            *(_QWORD *)(v104 + 8) = result;
                            v104 = i + 16 * v103;
                            if (v109 <= 1)
                              goto LABEL_183;
                          }
                        }
                        v108 = v104;
LABEL_183:
                        *(_DWORD *)v108 = v106;
                        *(_QWORD *)(v108 + 8) = v107;
                        goto LABEL_185;
                      }
                      if (v106 >= v105)
                      {
                        result = *(_QWORD *)(i + 16 * v103 + 8);
                        v107 = *(_QWORD *)(v95 + 8);
                        if (result < v107)
                          goto LABEL_176;
                      }
                    }
                  }
LABEL_185:
                  a2 -= 16;
                  if (v89-- <= 2)
                    return result;
                }
              }
            }
          }
          v12 = v11 >> 1;
          v13 = i + 16 * (v11 >> 1);
          if ((unint64_t)v10 < 0x801)
          {
            result = (unint64_t)sub_21DF98D24((unsigned int *)(v7 + 16 * (v11 >> 1)), (unsigned int *)v7, (unsigned int *)(a2 - 16));
          }
          else
          {
            sub_21DF98D24((unsigned int *)v7, (unsigned int *)(v7 + 16 * (v11 >> 1)), (unsigned int *)(a2 - 16));
            sub_21DF98D24((unsigned int *)(v7 + 16), (unsigned int *)(v13 - 16), (unsigned int *)(a2 - 32));
            sub_21DF98D24((unsigned int *)(v7 + 32), (unsigned int *)(v7 + 16 + 16 * v12), (unsigned int *)(a2 - 48));
            result = (unint64_t)sub_21DF98D24((unsigned int *)(v13 - 16), (unsigned int *)v13, (unsigned int *)(v7 + 16 + 16 * v12));
            v14 = *(_DWORD *)v7;
            *(_DWORD *)v7 = *(_DWORD *)v13;
            *(_DWORD *)v13 = v14;
            v15 = *(_QWORD *)(v7 + 8);
            *(_QWORD *)(v7 + 8) = *(_QWORD *)(v13 + 8);
            *(_QWORD *)(v13 + 8) = v15;
          }
          --a3;
          v16 = *(_DWORD *)v7;
          if ((a4 & 1) == 0)
          {
            v17 = *(_DWORD *)(v7 - 16);
            if (v17 >= v16)
            {
              if (v16 < v17)
              {
                v18 = *(_QWORD *)(v7 + 8);
              }
              else
              {
                v18 = *(_QWORD *)(v7 + 8);
                if (*(_QWORD *)(v7 - 8) < v18)
                  goto LABEL_13;
              }
              v34 = *v8;
              if (v16 >= *v8 && (v34 < v16 || v18 >= *(_QWORD *)(a2 - 8)))
              {
                for (i = v7 + 16;
                      i < a2 && v16 >= *(_DWORD *)i && (*(_DWORD *)i < v16 || v18 >= *(_QWORD *)(i + 8));
              }
              else
              {
                i = v7;
                do
                {
                  v36 = *(_DWORD *)(i + 16);
                  i += 16;
                  v35 = v36;
                }
                while (v16 >= v36 && (v35 < v16 || v18 >= *(_QWORD *)(i + 8)));
              }
              j = a2;
              if (i < a2)
              {
                for (j = a2 - 16; v16 < v34 || v34 >= v16 && v18 < *(_QWORD *)(j + 8); j -= 16)
                {
                  v38 = *(_DWORD *)(j - 16);
                  v34 = v38;
                }
              }
              if (i < j)
              {
                v39 = *(_DWORD *)i;
                v40 = *(_DWORD *)j;
                do
                {
                  *(_DWORD *)i = v40;
                  *(_DWORD *)j = v39;
                  v41 = *(_DWORD *)(i + 16);
                  i += 16;
                  v39 = v41;
                  v42 = *(_QWORD *)(i - 8);
                  *(_QWORD *)(i - 8) = *(_QWORD *)(j + 8);
                  *(_QWORD *)(j + 8) = v42;
                  while (v16 >= v39 && (v39 < v16 || v18 >= *(_QWORD *)(i + 8)))
                  {
                    v43 = *(_DWORD *)(i + 16);
                    i += 16;
                    v39 = v43;
                  }
                  do
                  {
                    do
                    {
                      v44 = *(_DWORD *)(j - 16);
                      j -= 16;
                      v40 = v44;
                    }
                    while (v16 < v44);
                  }
                  while (v40 >= v16 && v18 < *(_QWORD *)(j + 8));
                }
                while (i < j);
              }
              if (i - 16 != v7)
              {
                *(_DWORD *)v7 = *(_DWORD *)(i - 16);
                *(_QWORD *)(v7 + 8) = *(_QWORD *)(i - 8);
              }
              a4 = 0;
              *(_DWORD *)(i - 16) = v16;
              *(_QWORD *)(i - 8) = v18;
              continue;
            }
          }
LABEL_13:
          v19 = *(_QWORD *)(v7 + 8);
          for (k = v7 + 16; ; k += 16)
          {
            v21 = *(_DWORD *)k;
            if (*(_DWORD *)k >= v16 && (v16 < v21 || *(_QWORD *)(k + 8) >= v19))
              break;
          }
          if (k - 16 == v7)
          {
            m = a2;
            if (k < a2)
            {
              v25 = *v8;
              m = a2 - 16;
              if (*v8 >= v16)
              {
                m = a2 - 16;
                do
                {
                  if (v16 >= v25)
                  {
                    if (*(_QWORD *)(m + 8) < v19 || k >= m)
                      break;
                  }
                  else if (k >= m)
                  {
                    break;
                  }
                  v27 = *(_DWORD *)(m - 16);
                  m -= 16;
                  v25 = v27;
                }
                while (v27 >= v16);
              }
            }
          }
          else
          {
            v22 = *v8;
            for (m = a2 - 16; v22 >= v16 && (v16 < v22 || *(_QWORD *)(m + 8) >= v19); m -= 16)
            {
              v24 = *(_DWORD *)(m - 16);
              v22 = v24;
            }
          }
          i = k;
          if (k < m)
          {
            v28 = *(_DWORD *)m;
            i = k;
            v29 = m;
            do
            {
              *(_DWORD *)i = v28;
              *(_DWORD *)v29 = v21;
              v30 = *(_QWORD *)(i + 8);
              *(_QWORD *)(i + 8) = *(_QWORD *)(v29 + 8);
              *(_QWORD *)(v29 + 8) = v30;
              do
              {
                do
                {
                  v31 = *(_DWORD *)(i + 16);
                  i += 16;
                  v21 = v31;
                }
                while (v31 < v16);
              }
              while (v16 >= v21 && *(_QWORD *)(i + 8) < v19);
              do
              {
                v32 = *(_DWORD *)(v29 - 16);
                v29 -= 16;
                v28 = v32;
              }
              while (v32 >= v16 && (v16 < v28 || *(_QWORD *)(v29 + 8) >= v19));
            }
            while (i < v29);
          }
          if (i - 16 != v7)
          {
            *(_DWORD *)v7 = *(_DWORD *)(i - 16);
            *(_QWORD *)(v7 + 8) = *(_QWORD *)(i - 8);
          }
          *(_DWORD *)(i - 16) = v16;
          *(_QWORD *)(i - 8) = v19;
          if (k < m)
          {
LABEL_50:
            result = sub_21DF9764C(v7, i - 16, a3, a4 & 1);
            a4 = 0;
            continue;
          }
          v33 = sub_21DF990BC(v7, i - 16);
          result = sub_21DF990BC(i, a2);
          if (!(_DWORD)result)
          {
            if (v33)
              continue;
            goto LABEL_50;
          }
          a2 = i - 16;
          if (v33)
            return result;
          goto LABEL_2;
        }
        v49 = i + 16;
        v51 = i == a2 || v49 == a2;
        if ((a4 & 1) == 0)
        {
          if (v51)
            return result;
          while (1)
          {
            v82 = v7;
            v7 = v49;
            v83 = *(_DWORD *)(v82 + 16);
            v84 = *(_DWORD *)v82;
            if (v83 < *(_DWORD *)v82)
              break;
            if (v84 >= v83)
            {
              v85 = *(_QWORD *)(v82 + 24);
              if (v85 < *(_QWORD *)(v82 + 8))
                goto LABEL_157;
            }
LABEL_161:
            v49 = v7 + 16;
            if (v7 + 16 == a2)
              return result;
          }
          v85 = *(_QWORD *)(v82 + 24);
          do
          {
            do
            {
LABEL_157:
              v86 = v82;
              v87 = v84;
              v88 = *(_DWORD *)(v82 - 16);
              v82 -= 16;
              v84 = v88;
              *(_DWORD *)(v82 + 32) = v87;
              *(_QWORD *)(v82 + 40) = *(_QWORD *)(v82 + 24);
            }
            while (v83 < v88);
          }
          while (v84 >= v83 && v85 < *(_QWORD *)(v86 - 8));
          *(_DWORD *)v86 = v83;
          *(_QWORD *)(v86 + 8) = v85;
          goto LABEL_161;
        }
        if (v51)
          return result;
        v52 = 0;
        v53 = i;
        do
        {
          v54 = v53;
          v53 = v49;
          v55 = *(_DWORD *)(v54 + 16);
          v56 = *(_DWORD *)v54;
          if (v55 >= *(_DWORD *)v54)
          {
            if (v56 < v55)
              goto LABEL_117;
            v57 = *(_QWORD *)(v54 + 24);
            v58 = *(_QWORD *)(v54 + 8);
            if (v57 >= v58)
              goto LABEL_117;
          }
          else
          {
            v57 = *(_QWORD *)(v54 + 24);
            v58 = *(_QWORD *)(v54 + 8);
          }
          *(_DWORD *)(v54 + 16) = v56;
          *(_QWORD *)(v53 + 8) = v58;
          v59 = i;
          if (v54 == i)
            goto LABEL_116;
          v60 = v52;
          while (1)
          {
            v61 = *(_DWORD *)(i + v60 - 16);
            if (v55 >= v61)
              break;
            v62 = *(_QWORD *)(i + v60 - 8);
LABEL_113:
            v54 -= 16;
            v63 = i + v60;
            *(_DWORD *)v63 = v61;
            *(_QWORD *)(v63 + 8) = v62;
            v60 -= 16;
            if (!v60)
            {
              v59 = i;
              goto LABEL_116;
            }
          }
          if (v61 >= v55)
          {
            v59 = i + v60;
            v62 = *(_QWORD *)(i + v60 - 8);
            if (v57 >= v62)
              goto LABEL_116;
            goto LABEL_113;
          }
          v59 = v54;
LABEL_116:
          *(_DWORD *)v59 = v55;
          *(_QWORD *)(v59 + 8) = v57;
LABEL_117:
          v49 = v53 + 16;
          v52 += 16;
        }
        while (v53 + 16 != a2);
        return result;
    }
  }
}

llvm::Value *sub_21DF98000(_QWORD *a1, unsigned __int8 *a2, uint64_t a3, char a4, int a5, int a6)
{
  unsigned __int8 *v7;
  uint64_t v9;
  uint64_t *v10;
  _BOOL4 v11;
  uint64_t v12;
  char v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  size_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char **v22;
  uint64_t v23;
  const char **v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t **v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned __int8 *v51;
  uint64_t v52;
  char v53;
  __int128 v54;
  uint64_t v55;
  int v56;
  _BYTE v57[32];
  __int16 v58;
  __int128 v59;
  uint64_t v60;
  int v61;
  _QWORD v62[2];
  _OWORD v63[2];
  uint64_t v64;

  v7 = a2;
  v64 = *MEMORY[0x24BDAC8D0];
  v9 = *(_QWORD *)a2;
  if ((*(_DWORD *)(*(_QWORD *)a2 + 8) & 0xFE) == 0x12)
    v9 = **(_QWORD **)(v9 + 16);
  v10 = (_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  v11 = v9 == v10[20] || v9 == v10[19];
  v12 = v10[43];
  if (*(_BYTE *)(v12 + 1635))
    v13 = a4;
  else
    v13 = 0;
  v53 = v13;
  switch(a5)
  {
    case 0:
      v14 = a6 == 0;
      v15 = 1240;
      v16 = 1304;
      goto LABEL_25;
    case 1:
      v21 = 1224;
      if (v11)
        v21 = 1232;
      v22 = (const char **)(v12 + v21);
      v23 = 1288;
      if (v11)
        v23 = 1296;
      v24 = (const char **)(v12 + v23);
      if (!a6)
        v24 = v22;
      goto LABEL_28;
    case 2:
      v14 = a6 == 0;
      v15 = 1248;
      v16 = 1312;
      goto LABEL_25;
    case 3:
      v14 = a6 == 0;
      v15 = 1256;
      v16 = 1320;
      goto LABEL_25;
    case 4:
      v14 = a6 == 0;
      v15 = 1272;
      v16 = 1328;
      goto LABEL_25;
    case 5:
      v14 = a6 == 0;
      v15 = 1280;
      v16 = 1336;
LABEL_25:
      if (!v14)
        v15 = v16;
      v24 = (const char **)(v12 + v15);
LABEL_28:
      v17 = *v24;
      v14 = !v11;
      v25 = 24;
      if (!v14)
        v25 = 20;
      v20 = v10[v25];
      if (v17)
        v18 = strlen(v17);
      else
        v18 = 0;
      break;
    default:
      v17 = 0;
      v18 = 0;
      v14 = !v11;
      v19 = 24;
      if (!v14)
        v19 = 20;
      v20 = v10[v19];
      break;
  }
  v26 = sub_21DF1B0B0((uint64_t)v10, (uint64_t)v17, v18, v10[18], v10[73], v20);
  v27 = *(_QWORD *)v7;
  if (*(_QWORD *)v7 && *(_BYTE *)(v27 + 8) == 18)
  {
    v28 = *(unsigned int *)(v27 + 32);
    memset(v63, 0, sizeof(v63));
    v29 = v7[16];
    v30 = (_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24));
    v31 = v9;
    v52 = v28;
    if (v29 < 0x15 || (v29 & 0xFE) == 0x5A)
    {
      sub_21DF79A74((uint64_t)v30, (llvm::Constant *)v7, (llvm::Constant **)v63);
      if (!(_DWORD)v28)
        return (llvm::Value *)sub_21DF523B8((uint64_t)v7);
      v38 = v28;
      v39 = (uint64_t **)v63;
      do
      {
        *v39 = (uint64_t *)sub_21DF78D78((_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *v39, v9, 1, *(unsigned __int8 *)(*(_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 344) + 1640));
        ++v39;
        --v38;
      }
      while (v38);
      v28 = v52;
      if (!(_DWORD)v52)
        return (llvm::Value *)sub_21DF523B8((uint64_t)v7);
    }
    else
    {
      v7 = (unsigned __int8 *)sub_21DF78D78(v30, (uint64_t *)v7, v9, 1, *(unsigned __int8 *)(v30[43] + 1640));
      sub_21DF79A74((uint64_t)a1 + *(_QWORD *)(*a1 - 24), (llvm::Constant *)v7, (llvm::Constant **)v63);
      if (!(_DWORD)v28)
        return (llvm::Value *)sub_21DF523B8((uint64_t)v7);
    }
    v51 = v7;
    v40 = 0;
    do
    {
      v41 = *((_QWORD *)v63 + v40);
      v42 = (char *)a1 + *(_QWORD *)(*a1 - 24);
      v43 = v53 ^ 1;
      if (v31 != *((_QWORD *)v42 + 19))
        v43 = 1;
      if ((v43 & 1) == 0)
      {
        v44 = v26;
        v45 = v31;
        v46 = a3;
        v47 = *((_QWORD *)v42 + 43);
        v59 = *(_OWORD *)(v42 + 56);
        llvm::IRBuilderBase::getCurrentDebugLocation((llvm::IRBuilderBase *)(v42 + 8));
        v61 = *((_DWORD *)v42 + 26);
        v41 = (*(uint64_t (**)(uint64_t, __int128 *, uint64_t))(*(_QWORD *)v47 + 128))(v47, &v59, v41);
        if (v60)
          llvm::MetadataTracking::untrack();
        a3 = v46;
        v31 = v45;
        v26 = v44;
        v28 = v52;
      }
      v48 = llvm::ConstantInt::get();
      v49 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8;
      v58 = 257;
      v62[0] = sub_21DF19FAC(v49, a3, v48, (uint64_t)v57);
      v62[1] = v41;
      v50 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8;
      v58 = 257;
      sub_21DF191A4(v50, *(_QWORD *)(v26 + 24), v26, (uint64_t)v62, 2, (uint64_t)v57);
      ++v40;
    }
    while (v28 != v40);
    v7 = v51;
    return (llvm::Value *)sub_21DF523B8((uint64_t)v7);
  }
  v32 = sub_21DF78D78((_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24)), (uint64_t *)v7, v9, 1, *(unsigned __int8 *)(*(_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 344) + 1640));
  v33 = (char *)a1 + *(_QWORD *)(*a1 - 24);
  v34 = v53 ^ 1;
  if (v9 != *((_QWORD *)v33 + 19))
    v34 = 1;
  if ((v34 & 1) == 0)
  {
    v35 = *((_QWORD *)v33 + 43);
    v54 = *(_OWORD *)(v33 + 56);
    llvm::IRBuilderBase::getCurrentDebugLocation((llvm::IRBuilderBase *)(v33 + 8));
    v56 = *((_DWORD *)v33 + 26);
    v32 = (*(uint64_t (**)(uint64_t, __int128 *, uint64_t))(*(_QWORD *)v35 + 128))(v35, &v54, v32);
    if (v55)
      llvm::MetadataTracking::untrack();
  }
  *(_QWORD *)&v63[0] = a3;
  *((_QWORD *)&v63[0] + 1) = v32;
  v36 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24) + 8;
  v58 = 257;
  return sub_21DF191A4(v36, *(_QWORD *)(v26 + 24), v26, (uint64_t)v63, 2, (uint64_t)v57);
}

uint64_t sub_21DF984E8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  const char *v6;
  __int16 v7;

  v2 = llvm::User::operator new((llvm::User *)0x58);
  v6 = "agc.layered_vrr_enabled";
  v7 = 259;
  v3 = llvm::GlobalVariable::GlobalVariable();
  *(_BYTE *)(v3 + 80) |= 1u;
  llvm::GlobalObject::setSection();
  sub_21DF7A774((uint64_t)a1 + *(_QWORD *)(*a1 - 24));
  v4 = (_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  v7 = 257;
  return sub_21DF19394(v4 + 1, **(llvm::Type ***)(*(_QWORD *)v2 + 16), v2, 0, (uint64_t)&v6);
}

uint64_t sub_21DF985E0(uint64_t result)
{
  unsigned int v1;
  uint64_t v2;
  llvm::ValueHandleBase *v3;
  char *v4;
  _QWORD v6[2];
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(result + 8) = 0;
  v6[1] = 0;
  v7 = -4096;
  v6[0] = 2;
  v8 = 0;
  v1 = *(_DWORD *)(result + 16);
  if (v1)
  {
    v2 = *(_QWORD *)result + 48 * v1;
    result = *(_QWORD *)result + 8;
    do
    {
      v3 = sub_21DF5B820((llvm::ValueHandleBase *)result, (LODWORD(v6[0]) >> 1) & 3, v6);
      *((_QWORD *)v3 - 1) = &unk_24E1FE9C0;
      *((_QWORD *)v3 + 3) = v8;
      v4 = (char *)v3 + 40;
      result = (uint64_t)v3 + 48;
    }
    while (v4 != (char *)v2);
    if (v7 != -8192 && v7 != -4096 && v7 != 0)
      return llvm::ValueHandleBase::RemoveFromUseList((llvm::ValueHandleBase *)v6);
  }
  return result;
}

_QWORD *sub_21DF98694(uint64_t a1, uint64_t a2)
{
  char v3;
  _QWORD *v4;
  void *v7;
  _QWORD v8[2];
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  sub_21DF5B518(&v7, a2);
  v7 = &unk_24E1FE9C0;
  v10 = a1;
  v11 = 0;
  v3 = sub_21DF675B4(*(_QWORD *)a1, *(_DWORD *)(a1 + 16), v9, &v11);
  v4 = v11;
  if ((v3 & 1) == 0)
  {
    v4 = (_QWORD *)sub_21DF98748(a1, (uint64_t)&v7, (uint64_t)v11);
    sub_21DF569CC((llvm::ValueHandleBase *)(v4 + 1), v8);
    v4[4] = v10;
    v4[5] = 0;
  }
  if (v9 != -8192 && v9 != -4096 && v9 != 0)
    llvm::ValueHandleBase::RemoveFromUseList((llvm::ValueHandleBase *)v8);
  return v4 + 5;
}

uint64_t sub_21DF98748(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5;
  unsigned int v6;
  uint64_t v8;

  v5 = *(_DWORD *)(a1 + 8);
  v6 = *(_DWORD *)(a1 + 16);
  if (4 * v5 + 4 >= 3 * v6)
  {
    v6 *= 2;
  }
  else if (v6 + ~v5 - *(_DWORD *)(a1 + 12) > v6 >> 3)
  {
    goto LABEL_3;
  }
  sub_21DF987F8(a1, v6);
  v8 = 0;
  sub_21DF675B4(*(_QWORD *)a1, *(_DWORD *)(a1 + 16), *(_QWORD *)(a2 + 24), &v8);
  a3 = v8;
LABEL_3:
  ++*(_DWORD *)(a1 + 8);
  if (*(_QWORD *)(a3 + 24) != -4096)
    --*(_DWORD *)(a1 + 12);
  return a3;
}

uint64_t sub_21DF987F8(uint64_t a1, int a2)
{
  uint64_t v3;
  llvm *v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v15;

  v3 = *(unsigned int *)(a1 + 16);
  v4 = *(llvm **)a1;
  v5 = (a2 - 1) | ((unint64_t)(a2 - 1) >> 1);
  v6 = v5 | (v5 >> 2) | ((v5 | (v5 >> 2)) >> 4);
  v7 = ((v6 | (v6 >> 8)) >> 16) | v6 | (v6 >> 8);
  if ((v7 + 1) > 0x40)
    v8 = (v7 + 1);
  else
    v8 = 64;
  *(_DWORD *)(a1 + 16) = v8;
  *(_QWORD *)a1 = MEMORY[0x2207A6DD8]((_QWORD *)v8, 48 * v8, 8);
  if (!v4)
    return sub_21DF985E0(a1);
  sub_21DF985E0(a1);
  if ((_DWORD)v3)
  {
    v9 = (uint64_t *)((char *)v4 + 24);
    v10 = 48 * v3;
    do
    {
      v11 = *v9;
      if ((*v9 | 0x1000) != 0xFFFFFFFFFFFFF000)
      {
        v15 = 0;
        sub_21DF675B4(*(_QWORD *)a1, *(_DWORD *)(a1 + 16), v11, &v15);
        v12 = v15;
        sub_21DF569CC((llvm::ValueHandleBase *)(v15 + 8), v9 - 2);
        *(_QWORD *)(v12 + 32) = v9[1];
        *(_QWORD *)(v12 + 40) = v9[2];
        ++*(_DWORD *)(a1 + 8);
        v11 = *v9;
      }
      if (v11 != -8192 && v11 != -4096 && v11 != 0)
        llvm::ValueHandleBase::RemoveFromUseList((llvm::ValueHandleBase *)(v9 - 2));
      v9 += 6;
      v10 -= 48;
    }
    while (v10);
  }
  return llvm::deallocate_buffer(v4, (void *)(48 * v3));
}

uint64_t sub_21DF9893C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  _QWORD *v4;
  _BYTE v6[16];
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD v10[4];

  v1 = a1 + 8;
  sub_21DF5B820((llvm::ValueHandleBase *)v6, (*(_DWORD *)(a1 + 8) >> 1) & 3, (_QWORD *)(a1 + 8));
  v2 = *(_QWORD *)(v1 + 24);
  v8 = v2;
  v9 = 0;
  result = sub_21DF675B4(*(_QWORD *)v2, *(_DWORD *)(v2 + 16), v7, &v9);
  if ((_DWORD)result)
  {
    v4 = v9;
    v10[1] = 0;
    v10[2] = -8192;
    v9 = &unk_24E1FE9C0;
    v10[0] = 2;
    v10[3] = 0;
    result = (uint64_t)sub_21DF569CC((llvm::ValueHandleBase *)(v4 + 1), v10);
    v4[4] = 0;
    *(int32x2_t *)(v2 + 8) = vadd_s32(*(int32x2_t *)(v2 + 8), (int32x2_t)0x1FFFFFFFFLL);
  }
  if (v7 != -8192 && v7 != -4096 && v7 != 0)
    return llvm::ValueHandleBase::RemoveFromUseList((llvm::ValueHandleBase *)v6);
  return result;
}

uint64_t sub_21DF98A18(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int32x2_t *v4;
  uint64_t result;
  _QWORD *v6;
  int32x2_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _BYTE v12[16];
  uint64_t v13;
  int32x2_t *v14;
  void *v15;
  _QWORD v16[2];
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v3 = a1 + 8;
  sub_21DF5B820((llvm::ValueHandleBase *)v12, (*(_DWORD *)(a1 + 8) >> 1) & 3, (_QWORD *)(a1 + 8));
  v4 = *(int32x2_t **)(v3 + 24);
  v14 = v4;
  v19 = 0;
  result = sub_21DF675B4((uint64_t)*v4, v4[2].i32[0], v13, &v19);
  if ((_DWORD)result)
    v6 = v19;
  else
    v6 = (_QWORD *)(*(_QWORD *)v4 + 48 * v4[2].u32[0]);
  v7 = v14;
  if ((_QWORD *)(*(_QWORD *)v14 + 48 * v14[2].u32[0]) != v6)
  {
    v8 = v6[5];
    v20[1] = 0;
    v21 = -8192;
    v19 = &unk_24E1FE9C0;
    v20[0] = 2;
    v22 = 0;
    sub_21DF569CC((llvm::ValueHandleBase *)(v6 + 1), v20);
    v9 = v21;
    v6[4] = v22;
    if (v9 != -8192 && v9 != -4096 && v9)
      llvm::ValueHandleBase::RemoveFromUseList((llvm::ValueHandleBase *)v20);
    v7[1] = vadd_s32(v7[1], (int32x2_t)0x1FFFFFFFFLL);
    v10 = (uint64_t)v14;
    sub_21DF5B518(&v15, a2);
    v15 = &unk_24E1FE9C0;
    v18 = v10;
    sub_21DF5B820((llvm::ValueHandleBase *)v20, (LODWORD(v16[0]) >> 1) & 3, v16);
    v19 = &unk_24E1FE9C0;
    v22 = v18;
    v23 = v8;
    v24 = 0;
    result = sub_21DF675B4(*(_QWORD *)v10, *(_DWORD *)(v10 + 16), v21, &v24);
    if ((result & 1) == 0)
    {
      v11 = (_QWORD *)sub_21DF98748(v10, (uint64_t)&v19, v24);
      result = (uint64_t)sub_21DF569CC((llvm::ValueHandleBase *)(v11 + 1), v20);
      v11[4] = v22;
      v11[5] = v23;
    }
    if (v21 != -8192 && v21 != -4096 && v21)
      result = llvm::ValueHandleBase::RemoveFromUseList((llvm::ValueHandleBase *)v20);
    if (v17 != -8192 && v17 != -4096 && v17)
      result = llvm::ValueHandleBase::RemoveFromUseList((llvm::ValueHandleBase *)v16);
  }
  if (v13 != -8192 && v13 != -4096)
  {
    if (v13)
      return llvm::ValueHandleBase::RemoveFromUseList((llvm::ValueHandleBase *)v12);
  }
  return result;
}

uint64_t sub_21DF98C2C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  const char *v6;
  __int16 v7;

  v2 = llvm::User::operator new((llvm::User *)0x58);
  v6 = "agc.amp.mask";
  v7 = 259;
  v3 = llvm::GlobalVariable::GlobalVariable();
  *(_BYTE *)(v3 + 80) |= 1u;
  llvm::GlobalObject::setSection();
  sub_21DF7A774((uint64_t)a1 + *(_QWORD *)(*a1 - 24));
  v4 = (_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  v7 = 257;
  return sub_21DF19394(v4 + 1, **(llvm::Type ***)(*(_QWORD *)v2 + 16), v2, 0, (uint64_t)&v6);
}

unsigned int *sub_21DF98D24(unsigned int *result, unsigned int *a2, unsigned int *a3)
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unsigned int v17;
  unint64_t v18;

  v3 = *a2;
  v4 = *result;
  if (*a2 >= *result && (v4 < v3 || *((_QWORD *)a2 + 1) >= *((_QWORD *)result + 1)))
  {
    v8 = *a3;
    if (*a3 >= v3)
    {
      if (v3 < v8)
        return result;
      v10 = *((_QWORD *)a3 + 1);
      v9 = *((_QWORD *)a2 + 1);
      if (v10 >= v9)
        return result;
    }
    else
    {
      v9 = *((_QWORD *)a2 + 1);
      v10 = *((_QWORD *)a3 + 1);
    }
    *a2 = v8;
    *a3 = v3;
    *((_QWORD *)a2 + 1) = v10;
    *((_QWORD *)a3 + 1) = v9;
    v11 = *a2;
    v12 = *result;
    if (*a2 >= *result)
    {
      if (v12 < v11)
        return result;
      v14 = *((_QWORD *)a2 + 1);
      v13 = *((_QWORD *)result + 1);
      if (v14 >= v13)
        return result;
    }
    else
    {
      v13 = *((_QWORD *)result + 1);
      v14 = *((_QWORD *)a2 + 1);
    }
    *result = v11;
    *a2 = v12;
    *((_QWORD *)result + 1) = v14;
    *((_QWORD *)a2 + 1) = v13;
    return result;
  }
  v5 = *a3;
  if (*a3 < v3)
  {
    v6 = *((_QWORD *)a3 + 1);
LABEL_6:
    *result = v5;
    *a3 = v4;
    v7 = *((_QWORD *)result + 1);
    *((_QWORD *)result + 1) = v6;
    *((_QWORD *)a3 + 1) = v7;
    return result;
  }
  if (v3 >= v5)
  {
    v6 = *((_QWORD *)a3 + 1);
    v15 = *((_QWORD *)a2 + 1);
    if (v6 < v15)
      goto LABEL_6;
  }
  else
  {
    v15 = *((_QWORD *)a2 + 1);
  }
  *result = v3;
  *a2 = v4;
  v16 = *((_QWORD *)result + 1);
  *((_QWORD *)result + 1) = v15;
  *((_QWORD *)a2 + 1) = v16;
  v17 = *a3;
  if (*a3 < v4)
  {
    v18 = *((_QWORD *)a3 + 1);
LABEL_24:
    *a2 = v17;
    *a3 = v4;
    *((_QWORD *)a2 + 1) = v18;
    *((_QWORD *)a3 + 1) = v16;
    return result;
  }
  if (v4 >= v17)
  {
    v18 = *((_QWORD *)a3 + 1);
    if (v18 < v16)
      goto LABEL_24;
  }
  return result;
}

unsigned int *sub_21DF98E6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int *result;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unint64_t v15;
  unint64_t v16;
  unsigned int v17;
  unsigned int v18;
  unint64_t v19;
  unint64_t v20;

  result = sub_21DF98D24((unsigned int *)a1, (unsigned int *)a2, (unsigned int *)a3);
  v9 = *(_DWORD *)a4;
  v10 = *(_DWORD *)a3;
  if (*(_DWORD *)a4 >= *(_DWORD *)a3)
  {
    if (v10 < v9)
      return result;
    v12 = *(_QWORD *)(a4 + 8);
    v11 = *(_QWORD *)(a3 + 8);
    if (v12 >= v11)
      return result;
  }
  else
  {
    v11 = *(_QWORD *)(a3 + 8);
    v12 = *(_QWORD *)(a4 + 8);
  }
  *(_DWORD *)a3 = v9;
  *(_DWORD *)a4 = v10;
  *(_QWORD *)(a3 + 8) = v12;
  *(_QWORD *)(a4 + 8) = v11;
  v13 = *(_DWORD *)a3;
  v14 = *(_DWORD *)a2;
  if (*(_DWORD *)a3 >= *(_DWORD *)a2)
  {
    if (v14 < v13)
      return result;
    v16 = *(_QWORD *)(a3 + 8);
    v15 = *(_QWORD *)(a2 + 8);
    if (v16 >= v15)
      return result;
  }
  else
  {
    v15 = *(_QWORD *)(a2 + 8);
    v16 = *(_QWORD *)(a3 + 8);
  }
  *(_DWORD *)a2 = v13;
  *(_DWORD *)a3 = v14;
  *(_QWORD *)(a2 + 8) = v16;
  *(_QWORD *)(a3 + 8) = v15;
  v17 = *(_DWORD *)a2;
  v18 = *(_DWORD *)a1;
  if (*(_DWORD *)a2 < *(_DWORD *)a1)
  {
    v19 = *(_QWORD *)(a1 + 8);
    v20 = *(_QWORD *)(a2 + 8);
LABEL_15:
    *(_DWORD *)a1 = v17;
    *(_DWORD *)a2 = v18;
    *(_QWORD *)(a1 + 8) = v20;
    *(_QWORD *)(a2 + 8) = v19;
    return result;
  }
  if (v18 >= v17)
  {
    v20 = *(_QWORD *)(a2 + 8);
    v19 = *(_QWORD *)(a1 + 8);
    if (v20 < v19)
      goto LABEL_15;
  }
  return result;
}

unsigned int *sub_21DF98F6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int *a5)
{
  unsigned int *result;
  unsigned int v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unint64_t v17;
  unint64_t v18;
  unsigned int v19;
  unsigned int v20;
  unint64_t v21;
  unint64_t v22;
  unsigned int v23;
  unsigned int v24;
  unint64_t v25;
  unint64_t v26;

  result = sub_21DF98E6C(a1, a2, a3, a4);
  v11 = *a5;
  v12 = *(_DWORD *)a4;
  if (*a5 >= *(_DWORD *)a4)
  {
    if (v12 < v11)
      return result;
    v14 = *((_QWORD *)a5 + 1);
    v13 = *(_QWORD *)(a4 + 8);
    if (v14 >= v13)
      return result;
  }
  else
  {
    v13 = *(_QWORD *)(a4 + 8);
    v14 = *((_QWORD *)a5 + 1);
  }
  *(_DWORD *)a4 = v11;
  *a5 = v12;
  *(_QWORD *)(a4 + 8) = v14;
  *((_QWORD *)a5 + 1) = v13;
  v15 = *(_DWORD *)a4;
  v16 = *(_DWORD *)a3;
  if (*(_DWORD *)a4 >= *(_DWORD *)a3)
  {
    if (v16 < v15)
      return result;
    v18 = *(_QWORD *)(a4 + 8);
    v17 = *(_QWORD *)(a3 + 8);
    if (v18 >= v17)
      return result;
  }
  else
  {
    v17 = *(_QWORD *)(a3 + 8);
    v18 = *(_QWORD *)(a4 + 8);
  }
  *(_DWORD *)a3 = v15;
  *(_DWORD *)a4 = v16;
  *(_QWORD *)(a3 + 8) = v18;
  *(_QWORD *)(a4 + 8) = v17;
  v19 = *(_DWORD *)a3;
  v20 = *(_DWORD *)a2;
  if (*(_DWORD *)a3 >= *(_DWORD *)a2)
  {
    if (v20 < v19)
      return result;
    v22 = *(_QWORD *)(a3 + 8);
    v21 = *(_QWORD *)(a2 + 8);
    if (v22 >= v21)
      return result;
  }
  else
  {
    v21 = *(_QWORD *)(a2 + 8);
    v22 = *(_QWORD *)(a3 + 8);
  }
  *(_DWORD *)a2 = v19;
  *(_DWORD *)a3 = v20;
  *(_QWORD *)(a2 + 8) = v22;
  *(_QWORD *)(a3 + 8) = v21;
  v23 = *(_DWORD *)a2;
  v24 = *(_DWORD *)a1;
  if (*(_DWORD *)a2 < *(_DWORD *)a1)
  {
    v25 = *(_QWORD *)(a1 + 8);
    v26 = *(_QWORD *)(a2 + 8);
LABEL_9:
    *(_DWORD *)a1 = v23;
    *(_DWORD *)a2 = v24;
    *(_QWORD *)(a1 + 8) = v26;
    *(_QWORD *)(a2 + 8) = v25;
    return result;
  }
  if (v24 >= v23)
  {
    v26 = *(_QWORD *)(a2 + 8);
    v25 = *(_QWORD *)(a1 + 8);
    if (v26 < v25)
      goto LABEL_9;
  }
  return result;
}

BOOL sub_21DF990BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _BOOL8 result;
  unsigned int v6;
  unsigned int v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  unint64_t v22;

  v4 = (a2 - a1) >> 4;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = *(_DWORD *)(a2 - 16);
      v7 = *(_DWORD *)a1;
      if (v6 < *(_DWORD *)a1)
      {
        v8 = *(_QWORD *)(a1 + 8);
        v9 = *(_QWORD *)(a2 - 8);
LABEL_30:
        *(_DWORD *)a1 = v6;
        *(_DWORD *)(a2 - 16) = v7;
        *(_QWORD *)(a1 + 8) = v9;
        *(_QWORD *)(a2 - 8) = v8;
        return result;
      }
      if (v7 >= v6)
      {
        v9 = *(_QWORD *)(a2 - 8);
        v8 = *(_QWORD *)(a1 + 8);
        if (v9 < v8)
          goto LABEL_30;
      }
      return result;
    case 3:
      sub_21DF98D24((unsigned int *)a1, (unsigned int *)(a1 + 16), (unsigned int *)(a2 - 16));
      return 1;
    case 4:
      sub_21DF98E6C(a1, a1 + 16, a1 + 32, a2 - 16);
      return 1;
    case 5:
      sub_21DF98F6C(a1, a1 + 16, a1 + 32, a1 + 48, (unsigned int *)(a2 - 16));
      return 1;
    default:
      v10 = a1 + 32;
      sub_21DF98D24((unsigned int *)a1, (unsigned int *)(a1 + 16), (unsigned int *)(a1 + 32));
      v11 = a1 + 48;
      if (a1 + 48 == a2)
        return 1;
      v12 = 0;
      v13 = 0;
      break;
  }
LABEL_6:
  v14 = *(_DWORD *)v11;
  v15 = *(_DWORD *)v10;
  if (*(_DWORD *)v11 >= *(_DWORD *)v10)
  {
    if (v15 < v14)
      goto LABEL_21;
    v16 = *(_QWORD *)(v11 + 8);
    v17 = *(_QWORD *)(v10 + 8);
    if (v16 >= v17)
      goto LABEL_21;
  }
  else
  {
    v16 = *(_QWORD *)(v11 + 8);
    v17 = *(_QWORD *)(v10 + 8);
  }
  *(_DWORD *)v11 = v15;
  *(_QWORD *)(v11 + 8) = v17;
  v18 = a1;
  if (v10 == a1)
    goto LABEL_20;
  v19 = v12;
  while (1)
  {
    v20 = a1 + v19;
    v21 = *(_DWORD *)(a1 + v19 + 16);
    if (v14 >= v21)
    {
      if (v21 < v14)
      {
        v18 = v10;
        goto LABEL_20;
      }
      v22 = *(_QWORD *)(a1 + v19 + 24);
      if (v16 >= v22)
      {
        v18 = a1 + v19 + 32;
LABEL_20:
        *(_DWORD *)v18 = v14;
        *(_QWORD *)(v18 + 8) = v16;
        if (++v13 == 8)
          return v11 + 16 == a2;
LABEL_21:
        v10 = v11;
        v12 += 16;
        v11 += 16;
        if (v11 == a2)
          return 1;
        goto LABEL_6;
      }
    }
    else
    {
      v22 = *(_QWORD *)(v20 + 24);
    }
    v10 -= 16;
    *(_DWORD *)(v20 + 32) = v21;
    *(_QWORD *)(a1 + v19 + 40) = v22;
    v19 -= 16;
    if (v19 == -32)
    {
      v18 = a1;
      goto LABEL_20;
    }
  }
}

uint64_t sub_21DF992B4(uint64_t a1)
{
  unint64_t v1;
  char *v2;
  char *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  int v14;
  char *v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unsigned int *v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  char *v43;
  int v44;
  char v45;
  unint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  int v55;
  int v56;
  char *v57;
  uint64_t v58;
  uint64_t *v59;
  int v60;
  int v61;
  uint64_t v62;
  uint64_t *v63;
  int v64;
  int v65;
  uint64_t v66;
  int v67;
  int v68;
  int v69;
  uint64_t v70;
  int v72;
  int v73;
  unsigned int **v75;
  void **v76;
  void *__p;
  _BYTE *v78;
  uint64_t v79;
  char *v80[2];
  _QWORD v81[65];
  char v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  int v86[8];
  unsigned __int8 v87;
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v1 = *(unsigned int *)(a1 + 3256);
  if (!*(_BYTE *)(*(_QWORD *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24) + 344) + 1654))
  {
    if (*(_DWORD *)(a1 + 3256))
    {
      v17 = a1;
      v15 = 0;
      v16 = 0;
      v18 = 0;
      v19 = 0;
      do
      {
        v20 = v17 + 8 * v19;
        v21 = *(unsigned int **)(v20 + 3192);
        v22 = *v21;
        if (*v21)
        {
          v23 = 0;
          v75 = (unsigned int **)(v20 + 3192);
          do
          {
            v24 = *((_QWORD *)v21 + 1);
            v25 = *(_DWORD *)(v24 + 4 * v23);
            if (v23 + 1 >= v22)
            {
              v27 = 1;
            }
            else
            {
              v26 = v22 - v23;
              v27 = 1;
              while (v25 + v27 == *(_DWORD *)(v24 + 4 * (v23 + v27)))
              {
                if (v26 == ++v27)
                {
                  v27 = v26;
                  break;
                }
              }
            }
            v28 = v17 + *(_QWORD *)(*(_QWORD *)v17 - 24);
            v29 = (uint64_t *)(v28 + 704);
            *(_BYTE *)(v28 + 774) = 1;
            v30 = *(_DWORD *)(v28 + 736) - *(_DWORD *)(v28 + 752) + *(_DWORD *)(v28 + 744);
            sub_21DF2E08C((uint64_t *)(v28 + 704), 4, v27);
            sub_21DF2E08C(v29, 6, v25);
            sub_21DF2E08C(v29, 8, v19);
            sub_21DF2E08C(v29, 10, v23);
            v31 = sub_21DF2DC24((uint64_t)v29, v30);
            v38 = v31;
            if ((unint64_t)v16 >= v18)
            {
              v39 = (v16 - v15) >> 2;
              v40 = v39 + 1;
              if ((unint64_t)(v39 + 1) >> 62)
LABEL_84:
                abort();
              if ((uint64_t)(v18 - (_QWORD)v15) >> 1 > v40)
                v40 = (uint64_t)(v18 - (_QWORD)v15) >> 1;
              if (v18 - (unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL)
                v41 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v41 = v40;
              if (v41)
              {
                if (v41 >> 62)
                  sub_21DF256A4();
                v31 = (uint64_t)operator new(4 * v41);
              }
              else
              {
                v31 = 0;
              }
              v42 = (char *)(v31 + 4 * v39);
              *(_DWORD *)v42 = v38;
              v43 = v42 + 4;
              while (v16 != v15)
              {
                v44 = *((_DWORD *)v16 - 1);
                v16 -= 4;
                *((_DWORD *)v42 - 1) = v44;
                v42 -= 4;
              }
              v18 = v31 + 4 * v41;
              if (v15)
                operator delete(v15);
              v15 = v42;
              v16 = v43;
              v17 = a1;
            }
            else
            {
              *(_DWORD *)v16 = v31;
              v16 += 4;
            }
            sub_21DF28954(v31, "TF entry: (buf %d, slot %d, size %d) =  uvs(%d)", v32, v33, v34, v35, v36, v37, v19);
            v23 += v27;
            v21 = *v75;
            v22 = **v75;
          }
          while (v22 > v23);
          v1 = *(unsigned int *)(v17 + 3256);
        }
        ++v19;
      }
      while (v19 < v1);
      goto LABEL_56;
    }
LABEL_55:
    v15 = 0;
    v16 = 0;
LABEL_56:
    v2 = 0;
    v3 = 0;
    goto LABEL_57;
  }
  if (!*(_DWORD *)(a1 + 3256))
    goto LABEL_55;
  v2 = 0;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = a1;
  do
  {
    v7 = **(_DWORD **)(v6 + 8 * v5 + 3192);
    if ((unint64_t)v3 >= v4)
    {
      v8 = (v3 - v2) >> 2;
      v9 = v8 + 1;
      if ((unint64_t)(v8 + 1) >> 62)
        goto LABEL_84;
      if ((uint64_t)(v4 - (_QWORD)v2) >> 1 > v9)
        v9 = (uint64_t)(v4 - (_QWORD)v2) >> 1;
      if (v4 - (unint64_t)v2 >= 0x7FFFFFFFFFFFFFFCLL)
        v10 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v10 = v9;
      if (v10)
        v10 = (unint64_t)sub_21DF2EACC(v10);
      else
        v11 = 0;
      v12 = (char *)(v10 + 4 * v8);
      *(_DWORD *)v12 = v7;
      v13 = v12 + 4;
      while (v3 != v2)
      {
        v14 = *((_DWORD *)v3 - 1);
        v3 -= 4;
        *((_DWORD *)v12 - 1) = v14;
        v12 -= 4;
      }
      v4 = v10 + 4 * v11;
      if (v2)
        operator delete(v2);
      v2 = v12;
      v3 = v13;
    }
    else
    {
      *(_DWORD *)v3 = v7;
      v3 += 4;
    }
    ++v5;
    v6 = a1;
  }
  while (v5 < *(unsigned int *)(a1 + 3256));
  v15 = 0;
  v16 = 0;
LABEL_57:
  v45 = *(_BYTE *)(a1 + 2992);
  __p = 0;
  v78 = 0;
  v79 = 0;
  v80[0] = (char *)v81;
  v80[1] = (char *)0x800000000;
  v81[64] = 0x1FFFFFFFFLL;
  v82 = v45;
  v86[7] = 0;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  memset(v86, 0, 26);
  v87 = 1;
  if (*(_DWORD *)(a1 + 2464))
  {
    v46 = *(_QWORD *)(a1 + 2456);
    do
    {
      sub_21DF99E7C((uint64_t)&__p, v46);
      v46 += 64;
    }
    while (v46 < *(_QWORD *)(a1 + 2456) + ((unint64_t)*(unsigned int *)(a1 + 2464) << 6));
  }
  sub_21DF9A30C((uint64_t)&__p, *(_QWORD *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24) + 344));
  sub_21DF9A678((uint64_t)&__p, a1 + *(_QWORD *)(*(_QWORD *)a1 - 24) + 704);
  if (v78 == __p)
    v47 = &unk_2553B3D8C;
  else
    v47 = __p;
  v73 = sub_21DF34C5C(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24) + 704, (uint64_t)v47, (v78 - (_BYTE *)__p) >> 2);
  v48 = a1 + *(_QWORD *)(*(_QWORD *)a1 - 24);
  v49 = v48 + 704;
  *(_BYTE *)(v48 + 774) = 1;
  sub_21DF2E13C(v48 + 704, v16 - v15, 4uLL);
  sub_21DF2E13C(v48 + 704, v16 - v15, 4uLL);
  v50 = v16 - v15;
  if (v16 == v15)
    v51 = (char *)&unk_21DFA30DD;
  else
    v51 = v15;
  if (v16 != v15)
  {
    v52 = v50 >> 2;
    v53 = v51 - 4;
    do
    {
      v54 = v52 - 1;
      v55 = *(_DWORD *)&v53[4 * v52];
      sub_21DF2DF68(v49, 4uLL);
      sub_21DF2E0DC(v49, *(_DWORD *)(v48 + 736) - *(_DWORD *)(v48 + 752) + *(_DWORD *)(v48 + 744) - v55 + 4);
      v52 = v54;
    }
    while (v54);
  }
  *(_BYTE *)(v48 + 774) = 0;
  v56 = sub_21DF2E0DC(v49, (unint64_t)v50 >> 2);
  if (v3 == v2)
    v57 = (char *)&unk_2553B3E08;
  else
    v57 = v2;
  v72 = sub_21DF2EA5C(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24) + 704, v57, (v3 - v2) >> 2);
  v58 = a1 + *(_QWORD *)(*(_QWORD *)a1 - 24);
  v59 = (uint64_t *)(v58 + 704);
  *(_BYTE *)(v58 + 774) = 1;
  v60 = *(_DWORD *)(v58 + 736) - *(_DWORD *)(v58 + 752) + *(_DWORD *)(v58 + 744);
  sub_21DF2E08C((uint64_t *)(v58 + 704), 4, SDWORD1(v85));
  sub_21DF2E08C(v59, 6, SDWORD2(v85));
  sub_21DF2E08C(v59, 8, *(_DWORD *)(a1 + 3092) + *(_DWORD *)(a1 + 3096) + HIDWORD(v85));
  sub_21DF2E08C(v59, 10, SDWORD2(v84));
  sub_21DF2E08C(v59, 12, SHIDWORD(v84));
  sub_21DF2E08C(v59, 14, v85);
  v61 = sub_21DF2DC24((uint64_t)v59, v60);
  v62 = a1 + *(_QWORD *)(*(_QWORD *)a1 - 24);
  v63 = (uint64_t *)(v62 + 704);
  *(_BYTE *)(v62 + 774) = 1;
  v64 = *(_DWORD *)(v62 + 736) - *(_DWORD *)(v62 + 752) + *(_DWORD *)(v62 + 744);
  sub_21DF2E08C((uint64_t *)(v62 + 704), 4, v86[3]);
  sub_21DF2E08C(v63, 6, v86[4]);
  sub_21DF2E08C(v63, 8, v86[5]);
  sub_21DF2E08C(v63, 10, v86[0]);
  sub_21DF2E08C(v63, 12, v86[1]);
  sub_21DF2E08C(v63, 14, v86[2]);
  LODWORD(v63) = sub_21DF2DC24((uint64_t)v63, v64);
  v65 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 376))(a1);
  v66 = a1 + *(_QWORD *)(*(_QWORD *)a1 - 24);
  *(_BYTE *)(v66 + 774) = 1;
  v67 = v56;
  v68 = *(_DWORD *)(v66 + 736) - *(_DWORD *)(v66 + 752) + *(_DWORD *)(v66 + 744);
  sub_21DF34D10((uint64_t *)(v66 + 704), v65);
  sub_21DF2FF00((uint64_t *)(v66 + 704), 6, v87);
  sub_21DF2FF00((uint64_t *)(v66 + 704), 8, *(unsigned __int8 *)(a1 + 3100));
  sub_21DF2E08C((uint64_t *)(v66 + 704), 10, *(_DWORD *)(a1 + 3104));
  sub_21DF2E08C((uint64_t *)(v66 + 704), 12, *(_DWORD *)(a1 + 3108));
  sub_21DF2E08C((uint64_t *)(v66 + 704), 14, *(_DWORD *)(a1 + 3112));
  sub_21DF2DB24((uint64_t *)(v66 + 704), 16, v61);
  sub_21DF2DB24((uint64_t *)(v66 + 704), 18, (int)v63);
  sub_21DF2FF00((uint64_t *)(v66 + 704), 20, LOBYTE(v86[6]));
  sub_21DF2DB24((uint64_t *)(v66 + 704), 22, v73);
  if (v67)
  {
    sub_21DF2DF68(v66 + 704, 4uLL);
    sub_21DF2E08C((uint64_t *)(v66 + 704), 24, *(_DWORD *)(v66 + 736) - *(_DWORD *)(v66 + 752) + *(_DWORD *)(v66 + 744) - v67 + 4);
  }
  v69 = *(_DWORD *)(a1 + 3256);
  if (v69)
  {
    sub_21DF2E08C((uint64_t *)(v66 + 704), 26, v69);
    if (*(_BYTE *)(*(_QWORD *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24) + 344) + 1654))
      sub_21DF2DB24((uint64_t *)(v66 + 704), 28, v72);
  }
  v70 = sub_21DF2DC24(v66 + 704, v68);
  v76 = (void **)&v83;
  sub_21DF34DC8(&v76);
  sub_21DF34954(v80);
  if (__p)
  {
    v78 = __p;
    operator delete(__p);
  }
  if (v2)
    operator delete(v2);
  if (v15)
    operator delete(v15);
  return v70;
}

uint64_t sub_21DF99AB8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  BOOL v18;

  v8 = sub_21DF9C730((uint64_t *)a1, a2 + 1, a3, "air.vertex", a4, a5);
  v9 = *a2;
  *v8 = *a2;
  *(uint64_t *)((char *)v8 + *(_QWORD *)(v9 - 24)) = a2[5];
  v10 = *(_BYTE *)(*(uint64_t *)((char *)v8 + *(_QWORD *)(*v8 - 24) + 344) + 1686);
  v8[304] = 0;
  v8[306] = 0;
  v8[305] = 0;
  v8[307] = (uint64_t)(v8 + 309);
  v8[308] = 0x800000000;
  v8[373] = 0xFFFFFFFFLL;
  *((_BYTE *)v8 + 2992) = v10;
  *((_DWORD *)v8 + 769) = 0;
  *(_OWORD *)(v8 + 375) = 0u;
  *(_OWORD *)(v8 + 377) = 0u;
  *(_OWORD *)(v8 + 379) = 0u;
  *(_OWORD *)(v8 + 381) = 0u;
  *(_OWORD *)((char *)v8 + 3058) = 0u;
  *((_BYTE *)v8 + 3080) = 1;
  v8[386] = 0;
  *((_DWORD *)v8 + 774) = 0;
  *(_WORD *)((char *)v8 + 3101) = 0;
  *((_BYTE *)v8 + 3124) = 0;
  *(_QWORD *)(a1 + 3128) = llvm::ConstantInt::get();
  *(_QWORD *)(a1 + 3136) = llvm::ConstantInt::get();
  *(_WORD *)(a1 + 3144) = 0;
  *(_BYTE *)(a1 + 3146) = 0;
  *(_DWORD *)(a1 + 3148) = 1;
  *(_DWORD *)(a1 + 3156) = 0;
  *(_BYTE *)(a1 + 3160) = 0;
  *(_OWORD *)(a1 + 3244) = 0u;
  *(_OWORD *)(a1 + 3232) = 0u;
  *(_OWORD *)(a1 + 3216) = 0u;
  *(_OWORD *)(a1 + 3200) = 0u;
  *(_OWORD *)(a1 + 3184) = 0u;
  *(_OWORD *)(a1 + 3168) = 0u;
  *(_DWORD *)(a1 + 3260) = -1;
  *(_QWORD *)(a1 + 3264) = 0;
  *(_QWORD *)(a1 + 3272) = llvm::ConstantInt::get();
  *(_QWORD *)(a1 + 3280) = llvm::ConstantInt::get();
  v11 = a3 + 168;
  v12 = *(char *)(a3 + 191);
  if (v12 < 0)
  {
    if (*(_QWORD *)(a3 + 176) != 20)
    {
LABEL_15:
      v18 = 0;
      goto LABEL_16;
    }
    v11 = *(_QWORD *)v11;
  }
  else if (v12 != 20)
  {
    goto LABEL_15;
  }
  v13 = *(_QWORD *)v11;
  v14 = *(_QWORD *)(v11 + 8);
  v15 = *(_DWORD *)(v11 + 16);
  v18 = v13 == 0x535F786574726556 && v14 == 0x6F72505F65746174 && v15 == 1835102823;
LABEL_16:
  *(_BYTE *)(a1 + 3124) = v18;
  return a1;
}

uint64_t sub_21DF99CB8(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v13;
  void **v15;

  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + *(_QWORD *)(v4 - 24)) = a2[5];
  for (i = 3192; i != 3224; i += 8)
  {
    v6 = *(_QWORD *)(a1 + i);
    if (v6)
    {
      v7 = *(_QWORD *)(v6 + 8);
      if (v7)
        MEMORY[0x2207A7948](v7, 0x1000C8052888210);
      MEMORY[0x2207A7960](v6, 0x1010C4082113244);
    }
  }
  v8 = *(_QWORD *)(a1 + 3168);
  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 3176);
    v10 = *(void **)(a1 + 3168);
    if (v9 != v8)
    {
      do
      {
        v11 = *(_QWORD *)(v9 - 8);
        if (v11 != -8192 && v11 != -4096 && v11 != 0)
          llvm::ValueHandleBase::RemoveFromUseList((llvm::ValueHandleBase *)(v9 - 24));
        v9 -= 32;
      }
      while (v9 != v8);
      v10 = *(void **)(a1 + 3168);
    }
    *(_QWORD *)(a1 + 3176) = v8;
    operator delete(v10);
  }
  v15 = (void **)(a1 + 3000);
  sub_21DF34DC8(&v15);
  sub_21DF34954((char **)(a1 + 2456));
  v13 = *(void **)(a1 + 2432);
  if (v13)
  {
    *(_QWORD *)(a1 + 2440) = v13;
    operator delete(v13);
  }
  return sub_21DF73870(a1, a2 + 2);
}

llvm::Value *sub_21DF99DC8(_QWORD *a1)
{
  uint64_t v2;
  char *v3;
  _WORD v5[20];
  uint64_t v6;

  v2 = sub_21DF203DC((uint64_t)a1 + *(_QWORD *)(*a1 - 24), (uint64_t)"agc.read_vi.f32", 15, *(_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 160), *(_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 192));
  v3 = (char *)a1 + *(_QWORD *)(*a1 - 24);
  v6 = llvm::ConstantInt::get();
  v5[16] = 257;
  return sub_21DF191A4((uint64_t)(v3 + 8), *(_QWORD *)(v2 + 24), v2, (uint64_t)&v6, 1, (uint64_t)v5);
}

uint64_t sub_21DF99E64(uint64_t a1)
{
  sub_21DF58CF4(a1);
  return 1;
}

void sub_21DF99E7C(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  int v9;
  _OWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void **v14;
  __int128 v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  void *v23;
  void **v24;
  void *v25;
  void **v26;
  size_t v27;
  int v28;
  BOOL v29;
  _BOOL4 v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  int v35;
  int v36;
  void *v37;
  void **v38;
  void *v39;
  void **v40;
  size_t v41;
  int v42;
  BOOL v43;
  int v44;
  BOOL v45;
  int v46;
  BOOL v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void **v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v64;
  unint64_t v65;
  __int128 v66;
  uint64_t v67;
  int v68;
  size_t __n;
  size_t __na;
  void **v71;
  void **v72;
  void **v73;
  void **v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *__p[2];
  uint64_t v81;
  void *__dst[2];
  uint64_t v83;

  v3 = a1;
  v6 = *(_QWORD *)(a1 + 24);
  v4 = a1 + 24;
  v5 = v6;
  v7 = *(unsigned int *)(v4 + 8);
  if ((_DWORD)v7)
  {
    v79 = v4;
    v8 = *(_DWORD *)(v3 + 556);
    v9 = *(unsigned __int8 *)(v3 + 641);
    v10 = (_OWORD *)(a2 + 24);
    v11 = v5;
    while (1)
    {
      v12 = v7 >> 1;
      v13 = v11 + (v7 >> 1 << 6);
      if (v9)
      {
        __dst[0] = 0;
        __dst[1] = 0;
        v83 = 0;
        __p[0] = 0;
        __p[1] = 0;
        v81 = 0;
      }
      else
      {
        v14 = (void **)(v13 + 24);
        if (*(char *)(v13 + 47) < 0)
        {
          sub_21DF205EC(__dst, *v14, *(_QWORD *)(v11 + (v12 << 6) + 32));
        }
        else
        {
          v15 = *(_OWORD *)v14;
          v83 = *(_QWORD *)(v13 + 40);
          *(_OWORD *)__dst = v15;
        }
        if (*(char *)(a2 + 47) < 0)
        {
          sub_21DF205EC(__p, *(void **)(a2 + 24), *(_QWORD *)(a2 + 32));
        }
        else
        {
          *(_OWORD *)__p = *v10;
          v81 = *(_QWORD *)(a2 + 40);
        }
      }
      v16 = v11 + (v12 << 6);
      if (!v8)
        break;
      v17 = *(unsigned __int8 *)(v16 + 56);
      v18 = *(unsigned __int8 *)(a2 + 56);
      if (v17 < v18)
        goto LABEL_38;
      if (v18 < v17)
        goto LABEL_40;
      v19 = *(_DWORD *)(v16 + 8);
      v20 = *(_DWORD *)(a2 + 8);
      if (v19 < v20)
        goto LABEL_38;
      if (v20 < v19)
        goto LABEL_40;
      v21 = *(unsigned __int8 *)(v16 + 57);
      v22 = *(unsigned __int8 *)(a2 + 57);
      if (v21 < v22)
        goto LABEL_38;
      if (v22 < v21)
        goto LABEL_40;
      v75 = v3;
      if (v83 >= 0)
        v23 = (void *)HIBYTE(v83);
      else
        v23 = __dst[1];
      if (v83 >= 0)
        v24 = __dst;
      else
        v24 = (void **)__dst[0];
      if (v81 >= 0)
        v25 = (void *)HIBYTE(v81);
      else
        v25 = __p[1];
      if (v81 >= 0)
        v26 = __p;
      else
        v26 = (void **)__p[0];
      v77 = v23;
      if (v25 >= v23)
        v27 = (size_t)v23;
      else
        v27 = (size_t)v25;
      v71 = v26;
      v73 = v24;
      __n = v27;
      v28 = memcmp(v24, v26, v27);
      v29 = v77 < v25;
      if (v28)
        v29 = v28 < 0;
      if (!v29)
      {
        v46 = memcmp(v71, v73, __n);
        v47 = v25 < v77;
        if (v46)
          v47 = v46 < 0;
        v3 = v75;
        if (!v47)
          goto LABEL_81;
LABEL_40:
        v30 = 0;
        goto LABEL_41;
      }
      v30 = 1;
      v3 = v75;
LABEL_41:
      if (SHIBYTE(v81) < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v83) < 0)
        operator delete(__dst[0]);
      if (v30)
        v7 += ~v12;
      else
        v7 >>= 1;
      if (v30)
        v11 = v13 + 64;
      if (!v7)
      {
        v5 = *(_QWORD *)(v3 + 24);
        v48 = *(unsigned int *)(v3 + 32);
        v4 = v79;
        goto LABEL_83;
      }
    }
    v31 = *(unsigned __int8 *)(v16 + 57);
    v32 = *(unsigned __int8 *)(a2 + 57);
    if (v31 >= v32)
    {
      if (v32 < v31)
        goto LABEL_40;
      v33 = *(unsigned __int8 *)(v16 + 56);
      v34 = *(unsigned __int8 *)(a2 + 56);
      if (v33 >= v34)
      {
        if (v34 < v33)
          goto LABEL_40;
        v35 = *(_DWORD *)(v16 + 8);
        v36 = *(_DWORD *)(a2 + 8);
        if (v35 >= v36)
        {
          if (v36 < v35)
            goto LABEL_40;
          if (v83 >= 0)
            v37 = (void *)HIBYTE(v83);
          else
            v37 = __dst[1];
          if (v83 >= 0)
            v38 = __dst;
          else
            v38 = (void **)__dst[0];
          if (v81 >= 0)
            v39 = (void *)HIBYTE(v81);
          else
            v39 = __p[1];
          if (v81 >= 0)
            v40 = __p;
          else
            v40 = (void **)__p[0];
          v76 = v39;
          v78 = v37;
          if (v39 >= v37)
            v41 = (size_t)v37;
          else
            v41 = (size_t)v39;
          v72 = v40;
          v74 = v38;
          __na = v41;
          v42 = memcmp(v38, v40, v41);
          v43 = v78 < v76;
          if (v42)
            v43 = v42 < 0;
          if (!v43)
          {
            v44 = memcmp(v72, v74, __na);
            v45 = v76 < v78;
            if (v44)
              v45 = v44 < 0;
            if (!v45)
            {
LABEL_81:
              v30 = *(_DWORD *)(v16 + 16) < *(_DWORD *)(a2 + 16);
              goto LABEL_41;
            }
            goto LABEL_40;
          }
        }
      }
    }
LABEL_38:
    v30 = 1;
    goto LABEL_41;
  }
  v48 = 0;
  v11 = v5 + (v7 << 6);
LABEL_83:
  if (v5 + (v48 << 6) == v11)
  {
    sub_21DF361E0(v4, a2);
  }
  else
  {
    v49 = v11 - v5;
    v50 = (v11 - v5) >> 6;
    v51 = sub_21DF3626C(v4, a2);
    v52 = *(_QWORD *)(v3 + 24);
    v53 = v52 + v49;
    v54 = v52 + ((unint64_t)*(unsigned int *)(v3 + 32) << 6);
    *(_DWORD *)(v54 + 16) = *(_DWORD *)(v54 - 48);
    *(_OWORD *)v54 = *(_OWORD *)(v54 - 64);
    *(_OWORD *)(v54 + 24) = *(_OWORD *)(v54 - 40);
    *(_QWORD *)(v54 + 40) = *(_QWORD *)(v54 - 24);
    *(_QWORD *)(v54 - 40) = 0;
    *(_QWORD *)(v54 - 32) = 0;
    *(_QWORD *)(v54 - 24) = 0;
    *(_OWORD *)(v54 + 48) = *(_OWORD *)(v54 - 16);
    v55 = *(_QWORD *)(v3 + 24);
    v56 = *(unsigned int *)(v3 + 32);
    v57 = v55 + (v56 << 6) - 64;
    if (v57 != v53)
    {
      do
      {
        *(_OWORD *)v57 = *(_OWORD *)(v57 - 64);
        *(_DWORD *)(v57 + 16) = *(_DWORD *)(v57 - 48);
        v58 = (void **)(v57 + 24);
        if (*(char *)(v57 + 47) < 0)
          operator delete(*v58);
        v59 = *(_OWORD *)(v57 - 40);
        v60 = *(_QWORD *)(v57 - 24);
        *(_BYTE *)(v57 - 17) = 0;
        *(_BYTE *)(v57 - 40) = 0;
        *(_OWORD *)(v57 + 48) = *(_OWORD *)(v57 - 16);
        *(_OWORD *)v58 = v59;
        *(_QWORD *)(v57 + 40) = v60;
        v57 -= 64;
      }
      while (v57 != v53);
      LODWORD(v56) = *(_DWORD *)(v3 + 32);
      v55 = *(_QWORD *)(v3 + 24);
    }
    v61 = (v56 + 1);
    *(_DWORD *)(v3 + 32) = v61;
    v62 = v55 + (v61 << 6);
    v64 = v51 >= v53 && v51 < v62;
    v65 = v51 + (v64 << 6);
    v66 = *(_OWORD *)v65;
    *(_DWORD *)(v53 + 16) = *(_DWORD *)(v65 + 16);
    *(_OWORD *)v53 = v66;
    v67 = v52 + (v50 << 6);
    std::string::operator=((std::string *)(v67 + 24), (const std::string *)(v65 + 24));
    *(_OWORD *)(v67 + 48) = *(_OWORD *)(v65 + 48);
  }
  v68 = *(_DWORD *)(v3 + 552);
  if (v68 <= *(_DWORD *)(a2 + 16))
    v68 = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(v3 + 552) = v68;
  *(_DWORD *)(v3 + 644) += *(_DWORD *)a2;
}

void sub_21DF9A30C(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  int64x2_t *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  size_t v17;
  char *v18;
  __int128 v19;
  int64x2_t v20;
  uint64_t v21;
  void **v22;
  void **v23;
  uint64_t v24;
  int v25;
  int v26;
  int v27;
  const std::string *v28;
  int *v29;
  int v30;
  int data;
  unsigned int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int *v37;
  int *v38;
  int *v39;
  int *v40;
  int *v41;
  BOOL v42;
  int *v43;
  uint64_t v44;

  v4 = (*(_DWORD *)(a1 + 552) + 7);
  v5 = (int64x2_t *)(a1 + 568);
  v6 = *(_QWORD *)(a1 + 576);
  v7 = *(_QWORD *)(a1 + 568);
  v8 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v6 - v7) >> 3);
  v9 = v4 - v8;
  if (v4 <= v8)
  {
    if (v4 < v8)
    {
      v21 = v7 + 40 * v4;
      while (v6 != v21)
      {
        if (*(char *)(v6 - 1) < 0)
          operator delete(*(void **)(v6 - 24));
        v6 -= 40;
      }
      *(_QWORD *)(a1 + 576) = v21;
    }
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 584);
    if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v10 - v6) >> 3) >= v9)
    {
      bzero(*(void **)(a1 + 576), 40 * ((40 * v9 - 40) / 0x28) + 40);
      *(_QWORD *)(a1 + 576) = v6 + 40 * ((40 * v9 - 40) / 0x28) + 40;
    }
    else
    {
      v11 = 0xCCCCCCCCCCCCCCCDLL * ((v10 - v7) >> 3);
      v12 = 0x999999999999999ALL * ((v10 - v7) >> 3);
      if (v12 > v4)
        v4 = v12;
      if (v11 >= 0x333333333333333)
        v4 = 0x666666666666666;
      if (v4 > 0x666666666666666)
        sub_21DF256A4();
      v13 = 5 * v4;
      v14 = (char *)operator new(40 * v4);
      v15 = &v14[8 * ((uint64_t)(v6 - v7) >> 3)];
      v16 = &v14[8 * v13];
      v17 = 40 * ((40 * v9 - 40) / 0x28) + 40;
      bzero(v15, v17);
      v18 = &v15[v17];
      if (v6 == v7)
      {
        v20 = vdupq_n_s64(v6);
      }
      else
      {
        do
        {
          *(_OWORD *)(v15 - 40) = *(_OWORD *)(v6 - 40);
          v19 = *(_OWORD *)(v6 - 24);
          *((_QWORD *)v15 - 1) = *(_QWORD *)(v6 - 8);
          *(_OWORD *)(v15 - 24) = v19;
          v15 -= 40;
          *(_QWORD *)(v6 - 16) = 0;
          *(_QWORD *)(v6 - 8) = 0;
          *(_QWORD *)(v6 - 24) = 0;
          v6 -= 40;
        }
        while (v6 != v7);
        v20 = *v5;
      }
      *(_QWORD *)(a1 + 568) = v15;
      *(_QWORD *)(a1 + 576) = v18;
      *(_QWORD *)(a1 + 584) = v16;
      v23 = (void **)v20.i64[1];
      v22 = (void **)v20.i64[0];
      while (v23 != v22)
      {
        if (*((char *)v23 - 1) < 0)
          operator delete(*(v23 - 3));
        v23 -= 5;
      }
      if (v22)
        operator delete(v22);
    }
  }
  v24 = *(unsigned int *)(a1 + 32);
  if ((_DWORD)v24)
  {
    v25 = 0;
    v26 = 0;
    v27 = *(unsigned __int8 *)(a2 + 1657);
    v28 = *(const std::string **)(a1 + 24);
    v29 = (int *)((char *)v28 + 64 * v24);
    v30 = 4;
    do
    {
      data = (int)v28->__r_.__value_.__l.__data_;
      v32 = LODWORD(v28->__r_.__value_.__r.__words[2]) + 6;
      LODWORD(v28[2].__r_.__value_.__l.__data_) = v30;
      v33 = v28[2].__r_.__value_.__s.__data_[8];
      v34 = v5->i64[0];
      v35 = v5->i64[0] + 40 * v32;
      *(_BYTE *)v35 = v33;
      *(_DWORD *)(v35 + 4) = v25 + 2 * (v26 + v27);
      *(_DWORD *)(v35 + 8) = 2 * (v26 + v27 + v25);
      v30 += data;
      v36 = LODWORD(v28->__r_.__value_.__r.__words[1]);
      v37 = (int *)(a1 + 4 * v36);
      v38 = v37 + 148;
      if (v28[2].__r_.__value_.__s.__data_[9])
        v38 = v37 + 154;
      v39 = v37 + 151;
      v40 = v37 + 157;
      if (v28[2].__r_.__value_.__s.__data_[9])
        v41 = v40;
      else
        v41 = v39;
      v42 = v33 == 0;
      if (v33)
        v43 = v41;
      else
        v43 = v38;
      if (v42)
        v26 += data;
      else
        v25 += data;
      HIDWORD(v28[2].__r_.__value_.__r.__words[0]) = *v43;
      *v43 += data;
      v44 = v34 + 40 * v32;
      *(_DWORD *)(v44 + 12) = v36;
      std::string::operator=((std::string *)(v44 + 16), v28 + 1);
      v28 = (const std::string *)((char *)v28 + 64);
    }
    while (v28 != (const std::string *)v29);
  }
}

uint64_t sub_21DF9A5E4(_BYTE *a1, char a2, int a3)
{
  uint64_t v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  uint64_t v9;
  BOOL v10;

  if (!a2)
    return 0;
  v3 = 0;
  v4 = 0;
  do
  {
    v5 = *(_DWORD *)&a1[v3 + 604];
    if (a1[560])
      v5 = (v5 + 1) >> 1;
    v4 += *(_DWORD *)&a1[v3 + 592] + v5;
    v3 += 4;
  }
  while (v3 != 12);
  v6 = a3 + v4 + a1[648] + 1;
  v7 = v6 & 3;
  if (v6 < 0x11 || v7 == 0)
  {
    v9 = 0;
    v10 = v6 > 0xF;
  }
  else
  {
    v9 = (4 - v7);
    v10 = 1;
  }
  a1[640] = v10;
  return v9;
}

void sub_21DF9A678(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  size_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  unint64_t v17;
  _DWORD *v18;
  _DWORD *v19;
  _DWORD *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _DWORD *v26;
  int v27;

  v2 = -858993459 * ((*(_QWORD *)(a1 + 576) - *(_QWORD *)(a1 + 568)) >> 3);
  if ((_DWORD)v2)
  {
    for (i = 0; i != v2; ++i)
    {
      v6 = *(_QWORD *)(a1 + 568) + 40 * i;
      v9 = *(void **)(v6 + 16);
      v7 = v6 + 16;
      v8 = v9;
      v10 = *(char *)(v7 + 23);
      if (v10 >= 0)
        v11 = (void *)v7;
      else
        v11 = v8;
      if (v10 >= 0)
        v12 = *(unsigned __int8 *)(v7 + 23);
      else
        v12 = *(_QWORD *)(v7 + 8);
      v13 = sub_21DF2DAB0(a2, v11, v12);
      *(_BYTE *)(a2 + 70) = 1;
      v14 = *(_DWORD *)(a2 + 32) - *(_DWORD *)(a2 + 48) + *(_DWORD *)(a2 + 40);
      sub_21DF2FF00((uint64_t *)a2, 4, *(unsigned __int8 *)(*(_QWORD *)(a1 + 568) + 40 * i));
      sub_21DF2E08C((uint64_t *)a2, 6, *(_DWORD *)(*(_QWORD *)(a1 + 568) + 40 * i + 4));
      sub_21DF2E08C((uint64_t *)a2, 8, *(_DWORD *)(*(_QWORD *)(a1 + 568) + 40 * i + 8));
      sub_21DF2FF00((uint64_t *)a2, 10, *(char *)(*(_QWORD *)(a1 + 568) + 40 * i + 12));
      sub_21DF2DB24((uint64_t *)a2, 12, v13);
      v15 = sub_21DF2DC24(a2, v14);
      v16 = v15;
      v18 = *(_DWORD **)(a1 + 8);
      v17 = *(_QWORD *)(a1 + 16);
      if ((unint64_t)v18 >= v17)
      {
        v20 = *(_DWORD **)a1;
        v21 = ((uint64_t)v18 - *(_QWORD *)a1) >> 2;
        v22 = v21 + 1;
        if ((unint64_t)(v21 + 1) >> 62)
          abort();
        v23 = v17 - (_QWORD)v20;
        if (v23 >> 1 > v22)
          v22 = v23 >> 1;
        if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL)
          v24 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v24 = v22;
        if (v24)
        {
          v24 = (unint64_t)sub_21DF2EACC(v24);
          v20 = *(_DWORD **)a1;
          v18 = *(_DWORD **)(a1 + 8);
        }
        else
        {
          v25 = 0;
        }
        v26 = (_DWORD *)(v24 + 4 * v21);
        *v26 = v16;
        v19 = v26 + 1;
        while (v18 != v20)
        {
          v27 = *--v18;
          *--v26 = v27;
        }
        *(_QWORD *)a1 = v26;
        *(_QWORD *)(a1 + 8) = v19;
        *(_QWORD *)(a1 + 16) = v24 + 4 * v25;
        if (v20)
          operator delete(v20);
      }
      else
      {
        *v18 = v15;
        v19 = v18 + 1;
      }
      *(_QWORD *)(a1 + 8) = v19;
    }
  }
}

void sub_21DF9A860(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  __int128 *v6;
  unint64_t v7;
  __int128 *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  int v15;
  __int128 v16;
  void **v17;
  int v18;
  int v19;
  size_t v20;
  const void *v21;
  size_t v22;
  const void *v23;
  size_t v24;
  int v25;
  BOOL v26;
  uint64_t v27;
  void **v28;
  const void *v29;
  size_t v30;
  __int128 *v31;
  int v32;
  size_t v33;
  const void *v34;
  size_t v35;
  int v36;
  BOOL v37;
  unint64_t v38;
  uint64_t v39;
  const void **v40;
  int v41;
  size_t v42;
  const void *v43;
  size_t v44;
  int v45;
  BOOL v46;
  __int128 *v47;
  const void **v48;
  int v49;
  size_t v50;
  const void *v51;
  size_t v52;
  int v53;
  BOOL v54;
  uint64_t v55;
  __int128 *v56;
  const void **v57;
  const void **v58;
  size_t v59;
  size_t v60;
  const void *v61;
  size_t v62;
  int v63;
  BOOL v64;
  const void **v65;
  const void **v66;
  size_t v67;
  size_t v68;
  const void *v69;
  size_t v70;
  int v71;
  _BOOL4 v72;
  __int128 *v73;
  __int128 v74;
  __int128 v75;
  void **v76;
  __int128 v77;
  BOOL v78;
  const void *v79;
  int v80;
  size_t v81;
  __int128 *v82;
  size_t v83;
  const void *v84;
  size_t v85;
  int v86;
  BOOL v87;
  const void **v88;
  int v89;
  size_t v90;
  const void *v91;
  size_t v92;
  int v93;
  BOOL v94;
  __int128 *v95;
  int v96;
  __int128 *v97;
  size_t v98;
  const void *v99;
  size_t v100;
  int v101;
  BOOL v102;
  char v103;
  BOOL v104;
  __int128 *v105;
  const void **v106;
  int v107;
  size_t v108;
  const void *v109;
  size_t v110;
  int v111;
  BOOL v112;
  const void **v113;
  const void **v114;
  size_t v115;
  size_t v116;
  const void *v117;
  size_t v118;
  int v119;
  _BOOL4 v120;
  const void **v121;
  const void **v122;
  size_t v123;
  size_t v124;
  const void *v125;
  size_t v126;
  int v127;
  BOOL v128;
  __int128 *v129;
  __int128 v130;
  __int128 v131;
  void **v132;
  __int128 v133;
  int v134;
  int v135;
  size_t v136;
  const void *v137;
  size_t v138;
  const void *v139;
  size_t v140;
  int v141;
  _BOOL4 v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  __int128 *v147;
  int v148;
  int v149;
  size_t v150;
  const void *v151;
  size_t v152;
  const void *v153;
  size_t v154;
  int v155;
  _BOOL4 v156;
  size_t v157;
  __int128 *v158;
  uint64_t v159;
  uint64_t v160;
  void **v161;
  uint64_t v162;
  int v163;
  size_t v164;
  const void *v165;
  size_t v166;
  int v167;
  BOOL v168;
  uint64_t v169;
  __int128 *v170;
  uint64_t v171;
  __int128 v172;
  int64_t v173;
  int64_t v174;
  uint64_t v175;
  uint64_t v176;
  int v177;
  int v178;
  unint64_t v179;
  const void *v180;
  unint64_t v181;
  const void *v182;
  size_t v183;
  int v184;
  uint64_t v185;
  __int128 *v186;
  uint64_t v187;
  int v188;
  int v189;
  size_t v190;
  const void *v191;
  size_t v192;
  const void *v193;
  size_t v194;
  int v195;
  BOOL v196;
  __int128 v197;
  uint64_t v198;
  __int128 v199;
  void **v200;
  __int128 v201;
  uint64_t v202;
  uint64_t v203;
  int v204;
  int v205;
  unint64_t v206;
  const void *v207;
  unint64_t v208;
  const void *v209;
  size_t v210;
  int v211;
  uint64_t v212;
  int v213;
  size_t v214;
  const void *v215;
  size_t v216;
  __int128 *v217;
  size_t v218;
  int v219;
  _BOOL4 v220;
  void **v221;
  __int128 v222;
  uint64_t v223;
  uint64_t v224;
  unint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  int v230;
  int v231;
  unint64_t v232;
  const void *v233;
  unint64_t v234;
  const void *v235;
  size_t v236;
  int v237;
  uint64_t v238;
  __int128 v239;
  void **v240;
  __int128 v241;
  void **v242;
  __int128 *v243;
  __int128 *v244;
  __int128 v245;
  __int128 v246;
  uint64_t v247;
  unint64_t v248;
  unint64_t v249;
  int v250;
  int v251;
  size_t v252;
  const void *v253;
  size_t v254;
  const void *v255;
  size_t v256;
  int v257;
  _BOOL4 v258;
  __int128 v259;
  size_t v260;
  __int128 *v261;
  unint64_t v262;
  __int128 v263;
  void **v264;
  __int128 v265;
  int v266;
  size_t v267;
  const void *v268;
  size_t v269;
  int v270;
  BOOL v271;
  void **v272;
  __int128 v273;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  __int128 *v278;
  int v279;
  int v280;
  size_t v281;
  const void *v282;
  size_t v283;
  const void *v284;
  size_t v285;
  int v286;
  _BOOL4 v287;
  size_t v288;
  __int128 *v289;
  const void **v290;
  const void **v291;
  const void **v292;
  int v293;
  size_t v294;
  const void *v295;
  size_t v296;
  int v297;
  BOOL v298;
  void **v299;
  __int128 v300;
  __int128 *v301;
  uint64_t v303;
  uint64_t v304;
  int64_t v305;
  char v306;
  __int128 v308;
  __int128 v309;
  _BYTE v310[15];
  __int128 v311;
  __int128 v312;
  int v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  int v321;
  int v322;
  int v323;
  int v324;
  int v325;
  int v326;
  int v327;
  __int128 v328;
  const void *v329;
  __int128 v330;
  uint64_t v331;

  v331 = *MEMORY[0x24BDAC8D0];
  v6 = &v330;
LABEL_2:
  v7 = a2;
  v301 = (__int128 *)(a2 - 64);
  v8 = (__int128 *)a1;
  while (2)
  {
    a1 = (uint64_t)v8;
    v9 = v7 - (_QWORD)v8;
    v10 = (uint64_t)(v7 - (_QWORD)v8) >> 6;
    switch(v10)
    {
      case 0:
      case 1:
        return;
      case 2:
        v134 = *(char *)(a1 + 47);
        v135 = *(char *)(a2 - 17);
        if (v135 >= 0)
          v136 = *(unsigned __int8 *)(a2 - 17);
        else
          v136 = *(_QWORD *)(a2 - 32);
        if (v135 >= 0)
          v137 = (const void *)(a2 - 40);
        else
          v137 = *(const void **)(a2 - 40);
        if (v134 >= 0)
          v138 = *(unsigned __int8 *)(a1 + 47);
        else
          v138 = *(_QWORD *)(a1 + 32);
        if (v134 >= 0)
          v139 = (const void *)(a1 + 24);
        else
          v139 = *(const void **)(a1 + 24);
        if (v138 >= v136)
          v140 = v136;
        else
          v140 = v138;
        v141 = memcmp(v137, v139, v140);
        v142 = v136 < v138;
        if (v141)
          v142 = v141 < 0;
        if (v142)
          sub_21DF9BD34((__int128 *)a1, v301);
        return;
      case 3:
        sub_21DF9BE34(a1, a1 + 64, (uint64_t)v301);
        return;
      case 4:
        sub_21DF9C024(a1, a1 + 64, a1 + 128, (uint64_t)v301);
        return;
      case 5:
        sub_21DF9C1C8(a1, a1 + 64, a1 + 128, a1 + 192, (uint64_t)v301);
        return;
      default:
        if (v9 <= 1535)
        {
          if ((a4 & 1) != 0)
          {
            if (a1 != v7)
            {
              v143 = a1 + 64;
              if (a1 + 64 != a2)
              {
                v144 = 0;
                v145 = a1;
                do
                {
                  v146 = v143;
                  v147 = (__int128 *)(v145 + 88);
                  v148 = *(char *)(v145 + 47);
                  v149 = *(char *)(v145 + 111);
                  if (v149 >= 0)
                    v150 = *(unsigned __int8 *)(v145 + 111);
                  else
                    v150 = *(_QWORD *)(v145 + 96);
                  if (v149 >= 0)
                    v151 = (const void *)(v145 + 88);
                  else
                    v151 = *(const void **)(v145 + 88);
                  if (v148 >= 0)
                    v152 = *(unsigned __int8 *)(v145 + 47);
                  else
                    v152 = *(_QWORD *)(v145 + 32);
                  if (v148 >= 0)
                    v153 = (const void *)(v145 + 24);
                  else
                    v153 = *(const void **)(v145 + 24);
                  if (v152 >= v150)
                    v154 = v150;
                  else
                    v154 = v152;
                  v155 = memcmp(v151, v153, v154);
                  v156 = v150 < v152;
                  if (v155)
                    v156 = v155 < 0;
                  if (v156)
                  {
                    v324 = *(_DWORD *)(v146 + 16);
                    v317 = *(_OWORD *)v146;
                    v329 = *(const void **)(v145 + 104);
                    v328 = *v147;
                    *(_QWORD *)v147 = 0;
                    *(_QWORD *)(v145 + 96) = 0;
                    *(_QWORD *)(v145 + 104) = 0;
                    v330 = *(_OWORD *)(v145 + 112);
                    if (SHIBYTE(v329) >= 0)
                      v157 = HIBYTE(v329);
                    else
                      v157 = *((_QWORD *)&v328 + 1);
                    if (SHIBYTE(v329) >= 0)
                      v158 = &v328;
                    else
                      v158 = (__int128 *)v328;
                    v159 = v144;
                    while (1)
                    {
                      v160 = a1 + v159;
                      *(_OWORD *)(v160 + 64) = *(_OWORD *)(a1 + v159);
                      *(_DWORD *)(v160 + 80) = *(_DWORD *)(a1 + v159 + 16);
                      v161 = (void **)(a1 + v159 + 88);
                      if (*(char *)(a1 + v159 + 111) < 0)
                        operator delete(*v161);
                      *(_OWORD *)v161 = *(_OWORD *)(v160 + 24);
                      *(_QWORD *)(a1 + v159 + 104) = *(_QWORD *)(v160 + 40);
                      *(_BYTE *)(v160 + 47) = 0;
                      *(_BYTE *)(v160 + 24) = 0;
                      *(_OWORD *)(v160 + 112) = *(_OWORD *)(v160 + 48);
                      if (!v159)
                        break;
                      v162 = a1 + v159;
                      v163 = *(char *)(a1 + v159 - 17);
                      if (v163 >= 0)
                        v164 = *(unsigned __int8 *)(a1 + v159 - 17);
                      else
                        v164 = *(_QWORD *)(a1 + v159 - 32);
                      if (v163 >= 0)
                        v165 = (const void *)(a1 + v159 - 40);
                      else
                        v165 = *(const void **)(a1 + v159 - 40);
                      if (v164 >= v157)
                        v166 = v157;
                      else
                        v166 = v164;
                      v167 = memcmp(v158, v165, v166);
                      v168 = v157 < v164;
                      if (v167)
                        v168 = v167 < 0;
                      v159 -= 64;
                      if (!v168)
                      {
                        v169 = v162 + 24;
                        v170 = (__int128 *)(v162 + 48);
                        v171 = a1 + v159 + 64;
                        goto LABEL_284;
                      }
                    }
                    v169 = a1 + 24;
                    v170 = (__int128 *)(a1 + 48);
                    v171 = a1;
LABEL_284:
                    *(_DWORD *)(v171 + 16) = v324;
                    *(_OWORD *)v171 = v317;
                    if (*(char *)(v171 + 47) < 0)
                      operator delete(*(void **)v169);
                    v172 = v328;
                    *(_QWORD *)(v169 + 16) = v329;
                    *(_OWORD *)v169 = v172;
                    *v170 = v330;
                  }
                  v143 = v146 + 64;
                  v144 += 64;
                  v145 = v146;
                }
                while (v146 + 64 != a2);
              }
            }
          }
          else if (a1 != v7)
          {
            v275 = a1 + 64;
            if (a1 + 64 != a2)
            {
              v276 = a1 - 40;
              do
              {
                v277 = v275;
                v278 = (__int128 *)(a1 + 88);
                v279 = *(char *)(a1 + 47);
                v280 = *(char *)(a1 + 111);
                if (v280 >= 0)
                  v281 = *(unsigned __int8 *)(a1 + 111);
                else
                  v281 = *(_QWORD *)(a1 + 96);
                if (v280 >= 0)
                  v282 = (const void *)(a1 + 88);
                else
                  v282 = *(const void **)(a1 + 88);
                if (v279 >= 0)
                  v283 = *(unsigned __int8 *)(a1 + 47);
                else
                  v283 = *(_QWORD *)(a1 + 32);
                if (v279 >= 0)
                  v284 = (const void *)(a1 + 24);
                else
                  v284 = *(const void **)(a1 + 24);
                if (v283 >= v281)
                  v285 = v281;
                else
                  v285 = v283;
                v286 = memcmp(v282, v284, v285);
                v287 = v281 < v283;
                if (v286)
                  v287 = v286 < 0;
                if (v287)
                {
                  v327 = *(_DWORD *)(v277 + 16);
                  v320 = *(_OWORD *)v277;
                  v329 = *(const void **)(a1 + 104);
                  v328 = *v278;
                  *(_QWORD *)v278 = 0;
                  *(_QWORD *)(a1 + 96) = 0;
                  *(_QWORD *)(a1 + 104) = 0;
                  v330 = *(_OWORD *)(a1 + 112);
                  if (SHIBYTE(v329) >= 0)
                    v288 = HIBYTE(v329);
                  else
                    v288 = *((_QWORD *)&v328 + 1);
                  if (SHIBYTE(v329) >= 0)
                    v289 = &v328;
                  else
                    v289 = (__int128 *)v328;
                  v290 = (const void **)v276;
                  do
                  {
                    v291 = v290;
                    *(_OWORD *)(v290 + 13) = *(_OWORD *)(v290 + 5);
                    *((_DWORD *)v290 + 30) = *((_DWORD *)v290 + 14);
                    v292 = v290 + 16;
                    if (*((char *)v290 + 151) < 0)
                      operator delete((void *)*v292);
                    *(_OWORD *)v292 = *((_OWORD *)v291 + 4);
                    v292[2] = v291[10];
                    *((_BYTE *)v291 + 87) = 0;
                    *((_BYTE *)v291 + 64) = 0;
                    *(_OWORD *)(v291 + 19) = *(_OWORD *)(v291 + 11);
                    v293 = *((char *)v291 + 23);
                    if (v293 >= 0)
                      v294 = *((unsigned __int8 *)v291 + 23);
                    else
                      v294 = (size_t)v291[1];
                    if (v293 >= 0)
                      v295 = v291;
                    else
                      v295 = *v291;
                    if (v294 >= v288)
                      v296 = v288;
                    else
                      v296 = v294;
                    v297 = memcmp(v289, v295, v296);
                    v298 = v297 < 0;
                    if (!v297)
                      v298 = v288 < v294;
                    v290 = v291 - 8;
                  }
                  while (v298);
                  v299 = (void **)(v291 + 8);
                  *((_DWORD *)v291 + 14) = v327;
                  *(_OWORD *)(v291 + 5) = v320;
                  if (*((char *)v291 + 87) < 0)
                    operator delete(*v299);
                  v300 = v328;
                  v291[10] = v329;
                  *(_OWORD *)v299 = v300;
                  *(_OWORD *)(v291 + 11) = v330;
                }
                v275 = v277 + 64;
                v276 += 64;
                a1 = v277;
              }
              while (v277 + 64 != a2);
            }
          }
          return;
        }
        if (!a3)
        {
          if (a1 != v7)
          {
            v305 = (unint64_t)(v10 - 2) >> 1;
            v173 = v305;
            do
            {
              v174 = v173;
              if (v305 >= v173)
              {
                v175 = (2 * v173) | 1;
                v176 = a1 + (v175 << 6);
                if (2 * v173 + 2 < v10)
                {
                  v177 = *(char *)(v176 + 111);
                  v178 = *(char *)(v176 + 47);
                  v179 = v178 >= 0 ? *(unsigned __int8 *)(v176 + 47) : *(_QWORD *)(v176 + 32);
                  v180 = v178 >= 0 ? (const void *)(v176 + 24) : *(const void **)(v176 + 24);
                  v181 = v177 >= 0 ? *(unsigned __int8 *)(v176 + 111) : *(_QWORD *)(v176 + 96);
                  v182 = v177 >= 0 ? (const void *)(v176 + 88) : *(const void **)(v176 + 88);
                  v183 = v181 >= v179 ? v179 : v181;
                  v184 = memcmp(v180, v182, v183);
                  v185 = v184 ? v184 < 0 : v179 < v181;
                  v176 += v185 << 6;
                  if ((_DWORD)v185)
                    v175 = 2 * v174 + 2;
                }
                v303 = a1 + (v174 << 6);
                v186 = (__int128 *)(v303 + 24);
                v187 = v303;
                v188 = *(char *)(v303 + 47);
                v189 = *(char *)(v176 + 47);
                if (v189 >= 0)
                  v190 = *(unsigned __int8 *)(v176 + 47);
                else
                  v190 = *(_QWORD *)(v176 + 32);
                if (v189 >= 0)
                  v191 = (const void *)(v176 + 24);
                else
                  v191 = *(const void **)(v176 + 24);
                if (v188 >= 0)
                  v192 = *(unsigned __int8 *)(v303 + 47);
                else
                  v192 = *(_QWORD *)(v303 + 32);
                if (v188 >= 0)
                  v193 = (const void *)(v303 + 24);
                else
                  v193 = *(const void **)(v303 + 24);
                if (v192 >= v190)
                  v194 = v190;
                else
                  v194 = v192;
                v195 = memcmp(v191, v193, v194);
                v196 = v190 < v192;
                if (v195)
                  v196 = v195 < 0;
                if (!v196)
                {
                  v325 = *(_DWORD *)(v303 + 16);
                  v318 = *(_OWORD *)v303;
                  v197 = *v186;
                  v329 = *(const void **)(v303 + 40);
                  v328 = v197;
                  *(_QWORD *)(v303 + 32) = 0;
                  *(_QWORD *)(v303 + 40) = 0;
                  *(_QWORD *)v186 = 0;
                  v330 = *(_OWORD *)(v303 + 48);
                  do
                  {
                    v198 = v176;
                    v199 = *(_OWORD *)v176;
                    *(_DWORD *)(v187 + 16) = *(_DWORD *)(v176 + 16);
                    *(_OWORD *)v187 = v199;
                    v200 = (void **)(v187 + 24);
                    if (*(char *)(v187 + 47) < 0)
                      operator delete(*v200);
                    v201 = *(_OWORD *)(v176 + 24);
                    *(_QWORD *)(v187 + 40) = *(_QWORD *)(v176 + 40);
                    *(_OWORD *)v200 = v201;
                    *(_BYTE *)(v176 + 47) = 0;
                    *(_BYTE *)(v176 + 24) = 0;
                    *(_OWORD *)(v187 + 48) = *(_OWORD *)(v176 + 48);
                    if (v305 < v175)
                      break;
                    v202 = (2 * v175) | 1;
                    v176 = a1 + (v202 << 6);
                    v203 = 2 * v175 + 2;
                    if (v203 < v10)
                    {
                      v204 = *(char *)(v176 + 111);
                      v205 = *(char *)(v176 + 47);
                      v206 = v205 >= 0 ? *(unsigned __int8 *)(v176 + 47) : *(_QWORD *)(v176 + 32);
                      v207 = v205 >= 0 ? (const void *)(v176 + 24) : *(const void **)(v176 + 24);
                      v208 = v204 >= 0 ? *(unsigned __int8 *)(v176 + 111) : *(_QWORD *)(v176 + 96);
                      v209 = v204 >= 0 ? (const void *)(v176 + 88) : *(const void **)(v176 + 88);
                      v210 = v208 >= v206 ? v206 : v208;
                      v211 = memcmp(v207, v209, v210);
                      v212 = v211 ? v211 < 0 : v206 < v208;
                      v176 += v212 << 6;
                      if ((_DWORD)v212)
                        v202 = v203;
                    }
                    v213 = *(char *)(v176 + 47);
                    if (v213 >= 0)
                      v214 = *(unsigned __int8 *)(v176 + 47);
                    else
                      v214 = *(_QWORD *)(v176 + 32);
                    if (v213 >= 0)
                      v215 = (const void *)(v176 + 24);
                    else
                      v215 = *(const void **)(v176 + 24);
                    if (SHIBYTE(v329) >= 0)
                      v216 = HIBYTE(v329);
                    else
                      v216 = *((_QWORD *)&v328 + 1);
                    if (SHIBYTE(v329) >= 0)
                      v217 = &v328;
                    else
                      v217 = (__int128 *)v328;
                    if (v216 >= v214)
                      v218 = v214;
                    else
                      v218 = v216;
                    v219 = memcmp(v215, v217, v218);
                    v220 = v214 < v216;
                    if (v219)
                      v220 = v219 < 0;
                    v187 = v198;
                    v175 = v202;
                  }
                  while (!v220);
                  v221 = (void **)(v198 + 24);
                  *(_DWORD *)(v198 + 16) = v325;
                  *(_OWORD *)v198 = v318;
                  if (*(char *)(v198 + 47) < 0)
                    operator delete(*v221);
                  v222 = v328;
                  *(_QWORD *)(v198 + 40) = v329;
                  *(_OWORD *)v221 = v222;
                  *(_OWORD *)(v198 + 48) = v330;
                }
              }
              v173 = v174 - 1;
            }
            while (v174);
            v223 = (unint64_t)v9 >> 6;
            do
            {
              v224 = 0;
              v225 = a2;
              v313 = *(_DWORD *)(a1 + 16);
              v312 = *(_OWORD *)a1;
              v304 = *(_QWORD *)(a1 + 24);
              *(_QWORD *)v310 = *(_QWORD *)(a1 + 32);
              *(_QWORD *)&v310[7] = *(_QWORD *)(a1 + 39);
              v306 = *(_BYTE *)(a1 + 47);
              *(_QWORD *)(a1 + 32) = 0;
              *(_QWORD *)(a1 + 40) = 0;
              *(_QWORD *)(a1 + 24) = 0;
              v226 = a1;
              v309 = *(_OWORD *)(a1 + 48);
              do
              {
                v227 = v226 + ((v224 + 1) << 6);
                v228 = 2 * v224;
                v224 = (2 * v224) | 1;
                v229 = v228 + 2;
                if (v228 + 2 < v223)
                {
                  v230 = *(char *)(v227 + 111);
                  v231 = *(char *)(v227 + 47);
                  v232 = v231 >= 0 ? *(unsigned __int8 *)(v227 + 47) : *(_QWORD *)(v227 + 32);
                  v233 = v231 >= 0 ? (const void *)(v227 + 24) : *(const void **)(v227 + 24);
                  v234 = v230 >= 0 ? *(unsigned __int8 *)(v227 + 111) : *(_QWORD *)(v227 + 96);
                  v235 = v230 >= 0 ? (const void *)(v227 + 88) : *(const void **)(v227 + 88);
                  v236 = v234 >= v232 ? v232 : v234;
                  v237 = memcmp(v233, v235, v236);
                  v238 = v237 ? v237 < 0 : v232 < v234;
                  v227 += v238 << 6;
                  if ((_DWORD)v238)
                    v224 = v229;
                }
                v239 = *(_OWORD *)v227;
                *(_DWORD *)(v226 + 16) = *(_DWORD *)(v227 + 16);
                *(_OWORD *)v226 = v239;
                v240 = (void **)(v226 + 24);
                if (*(char *)(v226 + 47) < 0)
                  operator delete(*v240);
                v241 = *(_OWORD *)(v227 + 24);
                *(_QWORD *)(v226 + 40) = *(_QWORD *)(v227 + 40);
                *(_OWORD *)v240 = v241;
                *(_BYTE *)(v227 + 47) = 0;
                *(_BYTE *)(v227 + 24) = 0;
                *(_OWORD *)(v226 + 48) = *(_OWORD *)(v227 + 48);
                v226 = v227;
              }
              while (v224 <= (uint64_t)((unint64_t)(v223 - 2) >> 1));
              v242 = (void **)(v227 + 24);
              v243 = (__int128 *)(v227 + 48);
              v244 = (__int128 *)(a2 - 64);
              a2 -= 64;
              if (v227 == v225 - 64)
              {
                *(_DWORD *)(v227 + 16) = v313;
                *(_OWORD *)v227 = v312;
                if (*(char *)(v227 + 47) < 0)
                  operator delete(*v242);
                *(_QWORD *)(v227 + 24) = v304;
                *(_QWORD *)(v227 + 32) = *(_QWORD *)v310;
                *(_QWORD *)(v227 + 39) = *(_QWORD *)&v310[7];
                *(_BYTE *)(v227 + 47) = v306;
                *v243 = v309;
              }
              else
              {
                v245 = *v244;
                *(_DWORD *)(v227 + 16) = *(_DWORD *)(v225 - 48);
                *(_OWORD *)v227 = v245;
                if (*(char *)(v227 + 47) < 0)
                  operator delete(*v242);
                v246 = *(_OWORD *)(v225 - 40);
                *(_QWORD *)(v227 + 40) = *(_QWORD *)(v225 - 24);
                *(_OWORD *)v242 = v246;
                *(_BYTE *)(v225 - 17) = 0;
                *(_BYTE *)(v225 - 40) = 0;
                *v243 = *(_OWORD *)(v225 - 16);
                *(_DWORD *)(v225 - 48) = v313;
                *v244 = v312;
                if (*(char *)(v225 - 17) < 0)
                  operator delete(*(void **)(v225 - 40));
                *(_QWORD *)(v225 - 40) = v304;
                *(_QWORD *)(v225 - 25) = *(_QWORD *)&v310[7];
                *(_QWORD *)(v225 - 32) = *(_QWORD *)v310;
                *(_BYTE *)(v225 - 17) = v306;
                *(_OWORD *)(v225 - 16) = v309;
                v247 = v227 + 64 - a1;
                if (v247 >= 65)
                {
                  v248 = (((unint64_t)v247 >> 6) - 2) >> 1;
                  v249 = a1 + (v248 << 6);
                  v250 = *(char *)(v227 + 47);
                  v251 = *(char *)(v249 + 47);
                  if (v251 >= 0)
                    v252 = *(unsigned __int8 *)(v249 + 47);
                  else
                    v252 = *(_QWORD *)(v249 + 32);
                  if (v251 >= 0)
                    v253 = (const void *)(v249 + 24);
                  else
                    v253 = *(const void **)(v249 + 24);
                  if (v250 >= 0)
                    v254 = *(unsigned __int8 *)(v227 + 47);
                  else
                    v254 = *(_QWORD *)(v227 + 32);
                  if (v250 >= 0)
                    v255 = (const void *)(v227 + 24);
                  else
                    v255 = *(const void **)(v227 + 24);
                  if (v254 >= v252)
                    v256 = v252;
                  else
                    v256 = v254;
                  v257 = memcmp(v253, v255, v256);
                  v258 = v252 < v254;
                  if (v257)
                    v258 = v257 < 0;
                  if (v258)
                  {
                    v326 = *(_DWORD *)(v227 + 16);
                    v319 = *(_OWORD *)v227;
                    v259 = *(_OWORD *)v242;
                    v329 = *(const void **)(v227 + 40);
                    v328 = v259;
                    *(_QWORD *)(v227 + 32) = 0;
                    *(_QWORD *)(v227 + 40) = 0;
                    *v242 = 0;
                    v330 = *v243;
                    if (SHIBYTE(v329) >= 0)
                      v260 = HIBYTE(v329);
                    else
                      v260 = *((_QWORD *)&v328 + 1);
                    if (SHIBYTE(v329) >= 0)
                      v261 = &v328;
                    else
                      v261 = (__int128 *)v328;
                    do
                    {
                      v262 = v249;
                      v263 = *(_OWORD *)v249;
                      *(_DWORD *)(v227 + 16) = *(_DWORD *)(v249 + 16);
                      *(_OWORD *)v227 = v263;
                      v264 = (void **)(v227 + 24);
                      if (*(char *)(v227 + 47) < 0)
                        operator delete(*v264);
                      v265 = *(_OWORD *)(v249 + 24);
                      *(_QWORD *)(v227 + 40) = *(_QWORD *)(v249 + 40);
                      *(_OWORD *)v264 = v265;
                      *(_BYTE *)(v249 + 47) = 0;
                      *(_BYTE *)(v249 + 24) = 0;
                      *(_OWORD *)(v227 + 48) = *(_OWORD *)(v249 + 48);
                      if (!v248)
                        break;
                      v248 = (v248 - 1) >> 1;
                      v249 = a1 + (v248 << 6);
                      v266 = *(char *)(v249 + 47);
                      if (v266 >= 0)
                        v267 = *(unsigned __int8 *)(v249 + 47);
                      else
                        v267 = *(_QWORD *)(v249 + 32);
                      if (v266 >= 0)
                        v268 = (const void *)(v249 + 24);
                      else
                        v268 = *(const void **)(v249 + 24);
                      if (v260 >= v267)
                        v269 = v267;
                      else
                        v269 = v260;
                      v270 = memcmp(v268, v261, v269);
                      v271 = v267 < v260;
                      if (v270)
                        v271 = v270 < 0;
                      v227 = v262;
                    }
                    while (v271);
                    v272 = (void **)(v262 + 24);
                    *(_DWORD *)(v262 + 16) = v326;
                    *(_OWORD *)v262 = v319;
                    if (*(char *)(v262 + 47) < 0)
                      operator delete(*v272);
                    v273 = v328;
                    *(_QWORD *)(v262 + 40) = v329;
                    *(_OWORD *)v272 = v273;
                    *(_OWORD *)(v262 + 48) = v330;
                  }
                }
              }
            }
            while (v223-- > 2);
          }
          return;
        }
        v11 = (unint64_t)v10 >> 1;
        v12 = a1 + ((unint64_t)v10 >> 1 << 6);
        if ((unint64_t)v9 <= 0x2000)
        {
          sub_21DF9BE34(v12, a1, (uint64_t)v301);
        }
        else
        {
          sub_21DF9BE34(a1, v12, (uint64_t)v301);
          sub_21DF9BE34(a1 + 64, v12 - 64, a2 - 128);
          sub_21DF9BE34(a1 + 128, a1 + 64 + (v11 << 6), a2 - 192);
          sub_21DF9BE34(v12 - 64, v12, a1 + 64 + (v11 << 6));
          v321 = *(_DWORD *)(a1 + 16);
          v314 = *(_OWORD *)a1;
          *(_QWORD *)((char *)&v308 + 7) = *(_QWORD *)(a1 + 39);
          v13 = *(_QWORD *)(a1 + 24);
          *(_QWORD *)&v308 = *(_QWORD *)(a1 + 32);
          v14 = *(_BYTE *)(a1 + 47);
          *(_QWORD *)(a1 + 32) = 0;
          *(_QWORD *)(a1 + 40) = 0;
          *(_QWORD *)(a1 + 24) = 0;
          v311 = *(_OWORD *)(a1 + 48);
          v15 = *(_DWORD *)(v12 + 16);
          *(_OWORD *)a1 = *(_OWORD *)v12;
          *(_DWORD *)(a1 + 16) = v15;
          v16 = *(_OWORD *)(v12 + 24);
          *(_QWORD *)(a1 + 40) = *(_QWORD *)(v12 + 40);
          *(_OWORD *)(a1 + 24) = v16;
          *(_BYTE *)(v12 + 47) = 0;
          *(_BYTE *)(v12 + 24) = 0;
          *(_OWORD *)(a1 + 48) = *(_OWORD *)(v12 + 48);
          *(_DWORD *)(v12 + 16) = v321;
          *(_OWORD *)v12 = v314;
          *(_QWORD *)(v12 + 24) = v13;
          *(_QWORD *)(v12 + 32) = v308;
          *(_QWORD *)(v12 + 39) = *(_QWORD *)((char *)&v308 + 7);
          *(_BYTE *)(v12 + 47) = v14;
          *(_OWORD *)(v12 + 48) = v311;
        }
        --a3;
        if ((a4 & 1) == 0)
        {
          v17 = (void **)(a1 + 24);
          v18 = *(char *)(a1 + 47);
          v19 = *(char *)(a1 - 17);
          if (v19 >= 0)
            v20 = *(unsigned __int8 *)(a1 - 17);
          else
            v20 = *(_QWORD *)(a1 - 32);
          if (v19 >= 0)
            v21 = (const void *)(a1 - 40);
          else
            v21 = *(const void **)(a1 - 40);
          if (v18 >= 0)
            v22 = *(unsigned __int8 *)(a1 + 47);
          else
            v22 = *(_QWORD *)(a1 + 32);
          if (v18 >= 0)
            v23 = (const void *)(a1 + 24);
          else
            v23 = *(const void **)(a1 + 24);
          if (v22 >= v20)
            v24 = v20;
          else
            v24 = v22;
          v25 = memcmp(v21, v23, v24);
          v26 = v20 < v22;
          if (v25)
            v26 = v25 < 0;
          if (!v26)
          {
            v323 = *(_DWORD *)(a1 + 16);
            v316 = *(_OWORD *)a1;
            v79 = *(const void **)(a1 + 40);
            v328 = *(_OWORD *)v17;
            v329 = v79;
            *(_QWORD *)(a1 + 32) = 0;
            *(_QWORD *)(a1 + 40) = 0;
            *v17 = 0;
            v330 = *(_OWORD *)(a1 + 48);
            v80 = *(char *)(a2 - 17);
            if (SHIBYTE(v329) >= 0)
              v81 = HIBYTE(v329);
            else
              v81 = *((_QWORD *)&v328 + 1);
            if (SHIBYTE(v329) >= 0)
              v82 = &v328;
            else
              v82 = (__int128 *)v328;
            if (v80 >= 0)
              v83 = *(unsigned __int8 *)(a2 - 17);
            else
              v83 = *(_QWORD *)(a2 - 32);
            if (v80 >= 0)
              v84 = (const void *)(a2 - 40);
            else
              v84 = *(const void **)(a2 - 40);
            if (v83 >= v81)
              v85 = v81;
            else
              v85 = v83;
            v86 = memcmp(v82, v84, v85);
            v87 = v81 < v83;
            if (v86)
              v87 = v86 < 0;
            if (v87)
            {
              v88 = (const void **)(a1 + 88);
              do
              {
                v89 = *((char *)v88 + 23);
                if (v89 >= 0)
                  v90 = *((unsigned __int8 *)v88 + 23);
                else
                  v90 = (size_t)v88[1];
                if (v89 >= 0)
                  v91 = v88;
                else
                  v91 = *v88;
                if (v90 >= v81)
                  v92 = v81;
                else
                  v92 = v90;
                v93 = memcmp(v82, v91, v92);
                v94 = v81 < v90;
                if (v93)
                  v94 = v93 < 0;
                v88 += 8;
              }
              while (!v94);
              v8 = (__int128 *)(v88 - 11);
            }
            else
            {
              v95 = (__int128 *)(a1 + 64);
              do
              {
                v8 = v95;
                if ((unint64_t)v95 >= a2)
                  break;
                v96 = *((char *)v95 + 47);
                v97 = v6;
                if (v96 >= 0)
                  v98 = *((unsigned __int8 *)v95 + 47);
                else
                  v98 = *((_QWORD *)v95 + 4);
                if (v96 >= 0)
                  v99 = (char *)v95 + 24;
                else
                  v99 = (const void *)*((_QWORD *)v95 + 3);
                if (v98 >= v81)
                  v100 = v81;
                else
                  v100 = v98;
                v101 = memcmp(v82, v99, v100);
                v102 = v81 >= v98;
                v6 = v97;
                v103 = !v102;
                v104 = v101 < 0;
                if (!v101)
                  v104 = v103;
                v95 = v8 + 4;
              }
              while (!v104);
            }
            v105 = (__int128 *)a2;
            if ((unint64_t)v8 < a2)
            {
              v106 = (const void **)(a2 - 40);
              do
              {
                v107 = *((char *)v106 + 23);
                if (v107 >= 0)
                  v108 = *((unsigned __int8 *)v106 + 23);
                else
                  v108 = (size_t)v106[1];
                if (v107 >= 0)
                  v109 = v106;
                else
                  v109 = *v106;
                if (v108 >= v81)
                  v110 = v81;
                else
                  v110 = v108;
                v111 = memcmp(v82, v109, v110);
                v112 = v81 < v108;
                if (v111)
                  v112 = v111 < 0;
                v106 -= 8;
              }
              while (v112);
              v105 = (__int128 *)(v106 + 5);
            }
            while (v8 < v105)
            {
              sub_21DF9BD34(v8, v105);
              v113 = (const void **)v8 + 11;
              do
              {
                v114 = v113;
                v115 = *((unsigned __int8 *)v113 + 23);
                if ((v115 & 0x80u) == 0)
                  v116 = v115;
                else
                  v116 = (size_t)v114[1];
                if ((v115 & 0x80u) == 0)
                  v117 = v114;
                else
                  v117 = *v114;
                if (v116 >= v81)
                  v118 = v81;
                else
                  v118 = v116;
                v119 = memcmp(v82, v117, v118);
                v120 = v119 < 0;
                if (!v119)
                  v120 = v81 < v116;
                v113 = v114 + 8;
              }
              while (!v120);
              v8 = (__int128 *)(v114 - 3);
              v121 = (const void **)v105 - 5;
              do
              {
                v122 = v121;
                v123 = *((unsigned __int8 *)v121 + 23);
                if ((v123 & 0x80u) == 0)
                  v124 = v123;
                else
                  v124 = (size_t)v122[1];
                if ((v123 & 0x80u) == 0)
                  v125 = v122;
                else
                  v125 = *v122;
                if (v124 >= v81)
                  v126 = v81;
                else
                  v126 = v124;
                v127 = memcmp(v82, v125, v126);
                v128 = v127 < 0;
                if (!v127)
                  v128 = v81 < v124;
                v121 = v122 - 8;
              }
              while (v128);
              v105 = (__int128 *)(v122 - 3);
            }
            v129 = v8 - 4;
            v7 = a2;
            v6 = &v330;
            if (v8 - 4 != (__int128 *)a1)
            {
              v130 = *v129;
              *(_DWORD *)(a1 + 16) = *((_DWORD *)v8 - 12);
              *(_OWORD *)a1 = v130;
              if (*(char *)(a1 + 47) < 0)
                operator delete(*v17);
              v131 = *(__int128 *)((char *)v8 - 40);
              *(_QWORD *)(a1 + 40) = *((_QWORD *)v8 - 3);
              *(_OWORD *)v17 = v131;
              *((_BYTE *)v8 - 17) = 0;
              *((_BYTE *)v8 - 40) = 0;
              *(_OWORD *)(a1 + 48) = *(v8 - 1);
            }
            *((_DWORD *)v8 - 12) = v323;
            *v129 = v316;
            v132 = (void **)v8 - 5;
            if (*((char *)v8 - 17) < 0)
              operator delete(*v132);
            a4 = 0;
            v133 = v328;
            *((_QWORD *)v8 - 3) = v329;
            *(_OWORD *)v132 = v133;
            *(v8 - 1) = v330;
            continue;
          }
        }
        v27 = 0;
        v322 = *(_DWORD *)(a1 + 16);
        v315 = *(_OWORD *)a1;
        v28 = (void **)(a1 + 24);
        v29 = *(const void **)(a1 + 40);
        v328 = *(_OWORD *)(a1 + 24);
        v329 = v29;
        *(_QWORD *)(a1 + 32) = 0;
        *(_QWORD *)(a1 + 40) = 0;
        *(_QWORD *)(a1 + 24) = 0;
        v330 = *(_OWORD *)(a1 + 48);
        if (SHIBYTE(v329) >= 0)
          v30 = HIBYTE(v329);
        else
          v30 = *((_QWORD *)&v328 + 1);
        if (SHIBYTE(v329) >= 0)
          v31 = &v328;
        else
          v31 = (__int128 *)v328;
        do
        {
          v32 = *(char *)(a1 + v27 + 111);
          if (v32 >= 0)
            v33 = *(unsigned __int8 *)(a1 + v27 + 111);
          else
            v33 = *(_QWORD *)(a1 + v27 + 96);
          if (v32 >= 0)
            v34 = (const void *)(a1 + v27 + 88);
          else
            v34 = *(const void **)(a1 + v27 + 88);
          if (v30 >= v33)
            v35 = v33;
          else
            v35 = v30;
          v36 = memcmp(v34, v31, v35);
          v37 = v33 < v30;
          if (v36)
            v37 = v36 < 0;
          v27 += 64;
        }
        while (v37);
        v38 = a1 + v27;
        v39 = a1 + v27 - 64;
        v40 = (const void **)(a2 - 40);
        if (v39 == a1)
        {
          v48 = (const void **)(a2 - 40);
          while (1)
          {
            v47 = (__int128 *)(v48 + 5);
            if (v38 >= (unint64_t)(v48 + 5))
              break;
            v49 = *((char *)v48 + 23);
            if (v49 >= 0)
              v50 = *((unsigned __int8 *)v48 + 23);
            else
              v50 = (size_t)v48[1];
            if (v49 >= 0)
              v51 = v48;
            else
              v51 = *v48;
            if (v30 >= v50)
              v52 = v50;
            else
              v52 = v30;
            v53 = memcmp(v51, v31, v52);
            v54 = v50 < v30;
            if (v53)
              v54 = v53 < 0;
            v48 -= 8;
            if (v54)
            {
              v47 = (__int128 *)(v48 + 5);
              break;
            }
          }
        }
        else
        {
          do
          {
            v41 = *((char *)v40 + 23);
            if (v41 >= 0)
              v42 = *((unsigned __int8 *)v40 + 23);
            else
              v42 = (size_t)v40[1];
            if (v41 >= 0)
              v43 = v40;
            else
              v43 = *v40;
            if (v30 >= v42)
              v44 = v42;
            else
              v44 = v30;
            v45 = memcmp(v43, v31, v44);
            v46 = v42 < v30;
            if (v45)
              v46 = v45 < 0;
            v40 -= 8;
          }
          while (!v46);
          v47 = (__int128 *)(v40 + 5);
        }
        v55 = a3;
        v8 = (__int128 *)v38;
        if (v38 < (unint64_t)v47)
        {
          v56 = v47;
          do
          {
            sub_21DF9BD34(v8, v56);
            v57 = (const void **)v8 + 11;
            do
            {
              v58 = v57;
              v59 = *((unsigned __int8 *)v57 + 23);
              if ((v59 & 0x80u) == 0)
                v60 = v59;
              else
                v60 = (size_t)v58[1];
              if ((v59 & 0x80u) == 0)
                v61 = v58;
              else
                v61 = *v58;
              if (v30 >= v60)
                v62 = v60;
              else
                v62 = v30;
              v63 = memcmp(v61, v31, v62);
              v64 = v63 < 0;
              if (!v63)
                v64 = v60 < v30;
              v57 = v58 + 8;
            }
            while (v64);
            v8 = (__int128 *)(v58 - 3);
            v65 = (const void **)v56 - 5;
            do
            {
              v66 = v65;
              v67 = *((unsigned __int8 *)v65 + 23);
              if ((v67 & 0x80u) == 0)
                v68 = v67;
              else
                v68 = (size_t)v66[1];
              if ((v67 & 0x80u) == 0)
                v69 = v66;
              else
                v69 = *v66;
              if (v30 >= v68)
                v70 = v68;
              else
                v70 = v30;
              v71 = memcmp(v69, v31, v70);
              v72 = v71 < 0;
              if (!v71)
                v72 = v68 < v30;
              v65 = v66 - 8;
            }
            while (!v72);
            v56 = (__int128 *)(v66 - 3);
          }
          while (v8 < v56);
        }
        v73 = v8 - 4;
        a3 = v55;
        v6 = &v330;
        if (v8 - 4 != (__int128 *)a1)
        {
          v74 = *v73;
          *(_DWORD *)(a1 + 16) = *((_DWORD *)v8 - 12);
          *(_OWORD *)a1 = v74;
          if (*(char *)(a1 + 47) < 0)
            operator delete(*v28);
          v75 = *(__int128 *)((char *)v8 - 40);
          *(_QWORD *)(a1 + 40) = *((_QWORD *)v8 - 3);
          *(_OWORD *)v28 = v75;
          *((_BYTE *)v8 - 17) = 0;
          *((_BYTE *)v8 - 40) = 0;
          *(_OWORD *)(a1 + 48) = *(v8 - 1);
        }
        *((_DWORD *)v8 - 12) = v322;
        *v73 = v315;
        v76 = (void **)v8 - 5;
        if (*((char *)v8 - 17) < 0)
          operator delete(*v76);
        v77 = v328;
        *((_QWORD *)v8 - 3) = v329;
        *(_OWORD *)v76 = v77;
        *(v8 - 1) = v330;
        v7 = a2;
        if (v38 < (unint64_t)v47)
        {
LABEL_113:
          sub_21DF9A860(a1, v8 - 4, v55, a4 & 1);
          a4 = 0;
          continue;
        }
        v78 = sub_21DF9C3DC(a1, (uint64_t)(v8 - 4));
        if (!sub_21DF9C3DC((uint64_t)v8, a2))
        {
          if (v78)
            continue;
          goto LABEL_113;
        }
        a2 = (unint64_t)(v8 - 4);
        if (!v78)
          goto LABEL_2;
        return;
    }
  }
}

__n128 sub_21DF9BD34(__int128 *a1, __int128 *a2)
{
  uint64_t v3;
  char v4;
  int v5;
  uint64_t v6;
  __n128 *v7;
  __n128 result;
  __n128 v9;
  _BYTE v10[15];
  __int128 v11;
  int v12;

  v11 = *a1;
  v12 = *((_DWORD *)a1 + 4);
  v3 = *((_QWORD *)a1 + 3);
  *(_QWORD *)v10 = *((_QWORD *)a1 + 4);
  *(_QWORD *)&v10[7] = *(_QWORD *)((char *)a1 + 39);
  v4 = *((_BYTE *)a1 + 47);
  *((_QWORD *)a1 + 4) = 0;
  *((_QWORD *)a1 + 5) = 0;
  *((_QWORD *)a1 + 3) = 0;
  v9 = (__n128)a1[3];
  v5 = *((_DWORD *)a2 + 4);
  *a1 = *a2;
  *((_DWORD *)a1 + 4) = v5;
  v6 = *((_QWORD *)a2 + 5);
  *(__int128 *)((char *)a1 + 24) = *(__int128 *)((char *)a2 + 24);
  *((_QWORD *)a1 + 5) = v6;
  *((_BYTE *)a2 + 47) = 0;
  *((_BYTE *)a2 + 24) = 0;
  v7 = (__n128 *)(a2 + 3);
  a1[3] = a2[3];
  *a2 = v11;
  *((_DWORD *)a2 + 4) = v12;
  if (*((char *)a2 + 47) < 0)
    operator delete(*((void **)a2 + 3));
  *((_QWORD *)a2 + 3) = v3;
  *((_QWORD *)a2 + 4) = *(_QWORD *)v10;
  *(_QWORD *)((char *)a2 + 39) = *(_QWORD *)&v10[7];
  *((_BYTE *)a2 + 47) = v4;
  result = v9;
  *v7 = v9;
  return result;
}

double sub_21DF9BE34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v6;
  const void *v7;
  int v8;
  int v9;
  size_t v10;
  const void *v11;
  size_t v12;
  const void *v13;
  size_t v14;
  int v15;
  BOOL v16;
  int v17;
  size_t v18;
  const void *v19;
  size_t v20;
  int v21;
  double result;
  _BOOL4 v23;
  __int128 *v24;
  int v25;
  int v26;
  size_t v27;
  const void *v28;
  size_t v29;
  const void *v30;
  size_t v31;
  int v32;
  _BOOL4 v33;
  __int128 *v34;
  int v35;
  int v36;
  size_t v37;
  const void *v38;
  size_t v39;
  const void *v40;
  size_t v41;
  int v42;
  _BOOL4 v43;

  v6 = (const void *)(a2 + 24);
  v7 = (const void *)(a1 + 24);
  v8 = *(char *)(a1 + 47);
  v9 = *(char *)(a2 + 47);
  if (v9 >= 0)
    v10 = *(unsigned __int8 *)(a2 + 47);
  else
    v10 = *(_QWORD *)(a2 + 32);
  if (v9 >= 0)
    v11 = (const void *)(a2 + 24);
  else
    v11 = *(const void **)(a2 + 24);
  if (v8 >= 0)
    v12 = *(unsigned __int8 *)(a1 + 47);
  else
    v12 = *(_QWORD *)(a1 + 32);
  if (v8 >= 0)
    v13 = (const void *)(a1 + 24);
  else
    v13 = *(const void **)(a1 + 24);
  if (v12 >= v10)
    v14 = v10;
  else
    v14 = v12;
  v15 = memcmp(v11, v13, v14);
  if (v15)
    v16 = v15 < 0;
  else
    v16 = v10 < v12;
  v17 = *(char *)(a3 + 47);
  if (v17 >= 0)
    v18 = *(unsigned __int8 *)(a3 + 47);
  else
    v18 = *(_QWORD *)(a3 + 32);
  if (v17 >= 0)
    v19 = (const void *)(a3 + 24);
  else
    v19 = *(const void **)(a3 + 24);
  if (v10 >= v18)
    v20 = v18;
  else
    v20 = v10;
  v21 = memcmp(v19, v11, v20);
  v23 = v18 < v10;
  if (v21)
    v23 = v21 < 0;
  if (v16)
  {
    v24 = (__int128 *)a1;
    if (v23)
    {
LABEL_51:
      v34 = (__int128 *)a3;
LABEL_72:
      *(_QWORD *)&result = sub_21DF9BD34(v24, v34).n128_u64[0];
      return result;
    }
    sub_21DF9BD34((__int128 *)a1, (__int128 *)a2);
    v25 = *(char *)(a2 + 47);
    v26 = *(char *)(a3 + 47);
    if (v26 >= 0)
      v27 = *(unsigned __int8 *)(a3 + 47);
    else
      v27 = *(_QWORD *)(a3 + 32);
    if (v26 >= 0)
      v28 = (const void *)(a3 + 24);
    else
      v28 = *(const void **)(a3 + 24);
    if (v25 >= 0)
      v29 = *(unsigned __int8 *)(a2 + 47);
    else
      v29 = *(_QWORD *)(a2 + 32);
    if (v25 >= 0)
      v30 = v6;
    else
      v30 = *(const void **)(a2 + 24);
    if (v29 >= v27)
      v31 = v27;
    else
      v31 = v29;
    v32 = memcmp(v28, v30, v31);
    v33 = v27 < v29;
    if (v32)
      v33 = v32 < 0;
    if (v33)
    {
      v24 = (__int128 *)a2;
      goto LABEL_51;
    }
  }
  else if (v23)
  {
    sub_21DF9BD34((__int128 *)a2, (__int128 *)a3);
    v35 = *(char *)(a1 + 47);
    v36 = *(char *)(a2 + 47);
    if (v36 >= 0)
      v37 = *(unsigned __int8 *)(a2 + 47);
    else
      v37 = *(_QWORD *)(a2 + 32);
    if (v36 >= 0)
      v38 = v6;
    else
      v38 = *(const void **)(a2 + 24);
    if (v35 >= 0)
      v39 = *(unsigned __int8 *)(a1 + 47);
    else
      v39 = *(_QWORD *)(a1 + 32);
    if (v35 >= 0)
      v40 = v7;
    else
      v40 = *(const void **)(a1 + 24);
    if (v39 >= v37)
      v41 = v37;
    else
      v41 = v39;
    v42 = memcmp(v38, v40, v41);
    v43 = v37 < v39;
    if (v42)
      v43 = v42 < 0;
    if (v43)
    {
      v24 = (__int128 *)a1;
      v34 = (__int128 *)a2;
      goto LABEL_72;
    }
  }
  return result;
}

double sub_21DF9C024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v8;
  int v9;
  size_t v10;
  const void *v11;
  size_t v12;
  const void *v13;
  size_t v14;
  int v15;
  double result;
  _BOOL4 v17;
  int v18;
  int v19;
  size_t v20;
  const void *v21;
  size_t v22;
  const void *v23;
  size_t v24;
  int v25;
  _BOOL4 v26;
  int v27;
  int v28;
  size_t v29;
  const void *v30;
  size_t v31;
  const void *v32;
  size_t v33;
  int v34;
  _BOOL4 v35;

  sub_21DF9BE34(a1, a2, a3);
  v8 = *(char *)(a3 + 47);
  v9 = *(char *)(a4 + 47);
  if (v9 >= 0)
    v10 = *(unsigned __int8 *)(a4 + 47);
  else
    v10 = *(_QWORD *)(a4 + 32);
  if (v9 >= 0)
    v11 = (const void *)(a4 + 24);
  else
    v11 = *(const void **)(a4 + 24);
  if (v8 >= 0)
    v12 = *(unsigned __int8 *)(a3 + 47);
  else
    v12 = *(_QWORD *)(a3 + 32);
  if (v8 >= 0)
    v13 = (const void *)(a3 + 24);
  else
    v13 = *(const void **)(a3 + 24);
  if (v12 >= v10)
    v14 = v10;
  else
    v14 = v12;
  v15 = memcmp(v11, v13, v14);
  v17 = v10 < v12;
  if (v15)
    v17 = v15 < 0;
  if (v17)
  {
    sub_21DF9BD34((__int128 *)a3, (__int128 *)a4);
    v18 = *(char *)(a2 + 47);
    v19 = *(char *)(a3 + 47);
    if (v19 >= 0)
      v20 = *(unsigned __int8 *)(a3 + 47);
    else
      v20 = *(_QWORD *)(a3 + 32);
    if (v19 >= 0)
      v21 = (const void *)(a3 + 24);
    else
      v21 = *(const void **)(a3 + 24);
    if (v18 >= 0)
      v22 = *(unsigned __int8 *)(a2 + 47);
    else
      v22 = *(_QWORD *)(a2 + 32);
    if (v18 >= 0)
      v23 = (const void *)(a2 + 24);
    else
      v23 = *(const void **)(a2 + 24);
    if (v22 >= v20)
      v24 = v20;
    else
      v24 = v22;
    v25 = memcmp(v21, v23, v24);
    v26 = v20 < v22;
    if (v25)
      v26 = v25 < 0;
    if (v26)
    {
      sub_21DF9BD34((__int128 *)a2, (__int128 *)a3);
      v27 = *(char *)(a1 + 47);
      v28 = *(char *)(a2 + 47);
      if (v28 >= 0)
        v29 = *(unsigned __int8 *)(a2 + 47);
      else
        v29 = *(_QWORD *)(a2 + 32);
      if (v28 >= 0)
        v30 = (const void *)(a2 + 24);
      else
        v30 = *(const void **)(a2 + 24);
      if (v27 >= 0)
        v31 = *(unsigned __int8 *)(a1 + 47);
      else
        v31 = *(_QWORD *)(a1 + 32);
      if (v27 >= 0)
        v32 = (const void *)(a1 + 24);
      else
        v32 = *(const void **)(a1 + 24);
      if (v31 >= v29)
        v33 = v29;
      else
        v33 = v31;
      v34 = memcmp(v30, v32, v33);
      v35 = v29 < v31;
      if (v34)
        v35 = v34 < 0;
      if (v35)
        *(_QWORD *)&result = sub_21DF9BD34((__int128 *)a1, (__int128 *)a2).n128_u64[0];
    }
  }
  return result;
}

double sub_21DF9C1C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v10;
  int v11;
  size_t v12;
  const void *v13;
  size_t v14;
  const void *v15;
  size_t v16;
  int v17;
  double result;
  _BOOL4 v19;
  int v20;
  int v21;
  size_t v22;
  const void *v23;
  size_t v24;
  const void *v25;
  size_t v26;
  int v27;
  _BOOL4 v28;
  int v29;
  int v30;
  size_t v31;
  const void *v32;
  size_t v33;
  const void *v34;
  size_t v35;
  int v36;
  _BOOL4 v37;
  int v38;
  int v39;
  size_t v40;
  const void *v41;
  size_t v42;
  const void *v43;
  size_t v44;
  int v45;
  _BOOL4 v46;

  sub_21DF9C024(a1, a2, a3, a4);
  v10 = *(char *)(a4 + 47);
  v11 = *(char *)(a5 + 47);
  if (v11 >= 0)
    v12 = *(unsigned __int8 *)(a5 + 47);
  else
    v12 = *(_QWORD *)(a5 + 32);
  if (v11 >= 0)
    v13 = (const void *)(a5 + 24);
  else
    v13 = *(const void **)(a5 + 24);
  if (v10 >= 0)
    v14 = *(unsigned __int8 *)(a4 + 47);
  else
    v14 = *(_QWORD *)(a4 + 32);
  if (v10 >= 0)
    v15 = (const void *)(a4 + 24);
  else
    v15 = *(const void **)(a4 + 24);
  if (v14 >= v12)
    v16 = v12;
  else
    v16 = v14;
  v17 = memcmp(v13, v15, v16);
  v19 = v12 < v14;
  if (v17)
    v19 = v17 < 0;
  if (v19)
  {
    sub_21DF9BD34((__int128 *)a4, (__int128 *)a5);
    v20 = *(char *)(a3 + 47);
    v21 = *(char *)(a4 + 47);
    if (v21 >= 0)
      v22 = *(unsigned __int8 *)(a4 + 47);
    else
      v22 = *(_QWORD *)(a4 + 32);
    if (v21 >= 0)
      v23 = (const void *)(a4 + 24);
    else
      v23 = *(const void **)(a4 + 24);
    if (v20 >= 0)
      v24 = *(unsigned __int8 *)(a3 + 47);
    else
      v24 = *(_QWORD *)(a3 + 32);
    if (v20 >= 0)
      v25 = (const void *)(a3 + 24);
    else
      v25 = *(const void **)(a3 + 24);
    if (v24 >= v22)
      v26 = v22;
    else
      v26 = v24;
    v27 = memcmp(v23, v25, v26);
    v28 = v22 < v24;
    if (v27)
      v28 = v27 < 0;
    if (v28)
    {
      sub_21DF9BD34((__int128 *)a3, (__int128 *)a4);
      v29 = *(char *)(a2 + 47);
      v30 = *(char *)(a3 + 47);
      if (v30 >= 0)
        v31 = *(unsigned __int8 *)(a3 + 47);
      else
        v31 = *(_QWORD *)(a3 + 32);
      if (v30 >= 0)
        v32 = (const void *)(a3 + 24);
      else
        v32 = *(const void **)(a3 + 24);
      if (v29 >= 0)
        v33 = *(unsigned __int8 *)(a2 + 47);
      else
        v33 = *(_QWORD *)(a2 + 32);
      if (v29 >= 0)
        v34 = (const void *)(a2 + 24);
      else
        v34 = *(const void **)(a2 + 24);
      if (v33 >= v31)
        v35 = v31;
      else
        v35 = v33;
      v36 = memcmp(v32, v34, v35);
      v37 = v31 < v33;
      if (v36)
        v37 = v36 < 0;
      if (v37)
      {
        sub_21DF9BD34((__int128 *)a2, (__int128 *)a3);
        v38 = *(char *)(a1 + 47);
        v39 = *(char *)(a2 + 47);
        if (v39 >= 0)
          v40 = *(unsigned __int8 *)(a2 + 47);
        else
          v40 = *(_QWORD *)(a2 + 32);
        if (v39 >= 0)
          v41 = (const void *)(a2 + 24);
        else
          v41 = *(const void **)(a2 + 24);
        if (v38 >= 0)
          v42 = *(unsigned __int8 *)(a1 + 47);
        else
          v42 = *(_QWORD *)(a1 + 32);
        if (v38 >= 0)
          v43 = (const void *)(a1 + 24);
        else
          v43 = *(const void **)(a1 + 24);
        if (v42 >= v40)
          v44 = v40;
        else
          v44 = v42;
        v45 = memcmp(v41, v43, v44);
        v46 = v40 < v42;
        if (v45)
          v46 = v45 < 0;
        if (v46)
          *(_QWORD *)&result = sub_21DF9BD34((__int128 *)a1, (__int128 *)a2).n128_u64[0];
      }
    }
  }
  return result;
}

BOOL sub_21DF9C3DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _BOOL8 result;
  int v6;
  int v7;
  size_t v8;
  const void *v9;
  size_t v10;
  const void *v11;
  size_t v12;
  int v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  __int128 *v19;
  const void *v20;
  uint64_t v21;
  const void *v22;
  int v23;
  int v24;
  size_t v25;
  const void *v26;
  size_t v27;
  const void *v28;
  size_t v29;
  int v30;
  _BOOL4 v31;
  uint64_t v32;
  uint64_t v33;
  void **v34;
  uint64_t v35;
  int v36;
  size_t v37;
  __int128 *v38;
  size_t v39;
  const void *v40;
  size_t v41;
  int v42;
  BOOL v43;
  uint64_t v44;
  uint64_t v45;
  _OWORD *v46;
  __int128 v47;
  int v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;

  v4 = (a2 - a1) >> 6;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = *(char *)(a1 + 47);
      v7 = *(char *)(a2 - 17);
      if (v7 >= 0)
        v8 = *(unsigned __int8 *)(a2 - 17);
      else
        v8 = *(_QWORD *)(a2 - 32);
      if (v7 >= 0)
        v9 = (const void *)(a2 - 40);
      else
        v9 = *(const void **)(a2 - 40);
      if (v6 >= 0)
        v10 = *(unsigned __int8 *)(a1 + 47);
      else
        v10 = *(_QWORD *)(a1 + 32);
      if (v6 >= 0)
        v11 = (const void *)(a1 + 24);
      else
        v11 = *(const void **)(a1 + 24);
      if (v10 >= v8)
        v12 = v8;
      else
        v12 = v10;
      v13 = memcmp(v9, v11, v12);
      v14 = v8 < v10;
      if (v13)
        v14 = v13 < 0;
      if (v14)
        sub_21DF9BD34((__int128 *)a1, (__int128 *)(a2 - 64));
      return 1;
    case 3:
      sub_21DF9BE34(a1, a1 + 64, a2 - 64);
      return 1;
    case 4:
      sub_21DF9C024(a1, a1 + 64, a1 + 128, a2 - 64);
      return 1;
    case 5:
      sub_21DF9C1C8(a1, a1 + 64, a1 + 128, a1 + 192, a2 - 64);
      return 1;
    default:
      v15 = a1 + 128;
      sub_21DF9BE34(a1, a1 + 64, a1 + 128);
      v16 = a1 + 192;
      if (a1 + 192 == a2)
        return 1;
      v17 = 0;
      v18 = 0;
      break;
  }
  while (1)
  {
    v19 = (__int128 *)(v16 + 24);
    v22 = *(const void **)(v15 + 24);
    v21 = v15 + 24;
    v20 = v22;
    v23 = *(char *)(v21 + 23);
    v24 = *(char *)(v16 + 47);
    if (v24 >= 0)
      v25 = *(unsigned __int8 *)(v16 + 47);
    else
      v25 = *(_QWORD *)(v16 + 32);
    if (v24 >= 0)
      v26 = (const void *)(v16 + 24);
    else
      v26 = *(const void **)(v16 + 24);
    if (v23 >= 0)
      v27 = *(unsigned __int8 *)(v21 + 23);
    else
      v27 = *(_QWORD *)(v21 + 8);
    if (v23 >= 0)
      v28 = (const void *)v21;
    else
      v28 = v20;
    if (v27 >= v25)
      v29 = v25;
    else
      v29 = v27;
    v30 = memcmp(v26, v28, v29);
    v31 = v25 < v27;
    if (v30)
      v31 = v30 < 0;
    if (v31)
    {
      v47 = *(_OWORD *)v16;
      v48 = *(_DWORD *)(v16 + 16);
      v49 = *v19;
      v50 = *(_QWORD *)(v16 + 40);
      *(_QWORD *)v19 = 0;
      *(_QWORD *)(v16 + 32) = 0;
      *(_QWORD *)(v16 + 40) = 0;
      v32 = v17;
      v51 = *(_OWORD *)(v16 + 48);
      while (1)
      {
        v33 = a1 + v32;
        *(_OWORD *)(v33 + 192) = *(_OWORD *)(a1 + v32 + 128);
        *(_DWORD *)(v33 + 208) = *(_DWORD *)(a1 + v32 + 144);
        v34 = (void **)(a1 + v32 + 216);
        if (*(char *)(a1 + v32 + 239) < 0)
          operator delete(*v34);
        *(_OWORD *)v34 = *(_OWORD *)(v33 + 152);
        *(_QWORD *)(a1 + v32 + 232) = *(_QWORD *)(v33 + 168);
        *(_BYTE *)(v33 + 175) = 0;
        *(_BYTE *)(v33 + 152) = 0;
        *(_OWORD *)(v33 + 240) = *(_OWORD *)(v33 + 176);
        if (v32 == -128)
          break;
        v35 = a1 + v32;
        v36 = *(char *)(a1 + v32 + 111);
        if (v50 >= 0)
          v37 = HIBYTE(v50);
        else
          v37 = *((_QWORD *)&v49 + 1);
        if (v50 >= 0)
          v38 = &v49;
        else
          v38 = (__int128 *)v49;
        if (v36 >= 0)
          v39 = *(unsigned __int8 *)(a1 + v32 + 111);
        else
          v39 = *(_QWORD *)(a1 + v32 + 96);
        if (v36 >= 0)
          v40 = (const void *)(a1 + v32 + 88);
        else
          v40 = *(const void **)(a1 + v32 + 88);
        if (v39 >= v37)
          v41 = v37;
        else
          v41 = v39;
        v42 = memcmp(v38, v40, v41);
        v43 = v37 < v39;
        if (v42)
          v43 = v42 < 0;
        v32 -= 64;
        if (!v43)
        {
          v44 = v35 + 152;
          v45 = a1 + v32 + 192;
          v46 = (_OWORD *)(v35 + 176);
          goto LABEL_65;
        }
      }
      v44 = a1 + 24;
      v46 = (_OWORD *)(a1 + 48);
      v45 = a1;
LABEL_65:
      *(_OWORD *)v45 = v47;
      *(_DWORD *)(v45 + 16) = v48;
      if (*(char *)(v45 + 47) < 0)
        operator delete(*(void **)v44);
      *(_OWORD *)v44 = v49;
      *(_QWORD *)(v44 + 16) = v50;
      *v46 = v51;
      if (++v18 == 8)
        return v16 + 64 == a2;
    }
    v15 = v16;
    v17 += 64;
    v16 += 64;
    if (v16 == a2)
      return 1;
  }
}

uint64_t *sub_21DF9C730(uint64_t *a1, uint64_t *a2, uint64_t a3, _BYTE *a4, uint64_t a5, char a6)
{
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t i;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *Int8PtrTy;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  llvm::Module *v28;
  uint64_t NamedMetadata;
  llvm::NamedMDNode *v30;
  unsigned int v31;
  uint64_t Operand;
  uint64_t *v33;
  int v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v41;
  uint64_t *v42;
  uint64_t v43;
  int v44;
  llvm::Module *v47;
  llvm::NamedMDNode *v48;
  uint64_t v49;
  llvm::Module *v50;
  llvm::NamedMDNode *v51;
  char v52;
  char v53;
  uint64_t v54;
  unsigned int v55;
  int v56;
  unsigned int v57;
  int v58;
  llvm::Module *v59;
  char v60;
  llvm::NamedMDNode *v61;
  uint64_t v62;
  unsigned __int8 *v63;
  uint64_t v64;
  llvm::Module *v65;
  llvm::DILocalScope *Subprogram;
  llvm::Value *v67;
  _QWORD *Name;
  uint64_t v69;
  BOOL v70;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t ValueAsString;
  uint64_t v86;
  void *v88;
  size_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void **p_p;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t j;
  uint64_t v103;
  uint64_t v104;
  unsigned int v106;
  void *__p;
  uint64_t v108;
  uint64_t v109;
  __int16 v110;
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
  v11 = a2[1];
  *a1 = v11;
  *(uint64_t *)((char *)a1 + *(_QWORD *)(v11 - 24)) = a2[2];
  *((_WORD *)a1 + 4) = 0;
  *((_BYTE *)a1 + 10) = a6;
  *(_DWORD *)((char *)a1 + 11) = 0;
  a1[2] = a5;
  *((_BYTE *)a1 + 29) = 1;
  *((_DWORD *)a1 + 8) = 0;
  *((_WORD *)a1 + 18) = 1;
  a1[9] = (uint64_t)(a1 + 11);
  v12 = a1 + 9;
  a1[6] = 0;
  a1[7] = 0;
  a1[5] = 0;
  a1[10] = 0x800000000;
  a1[19] = 0;
  a1[20] = 0;
  v13 = *(_QWORD *)(*(uint64_t *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 400) + 32);
  if (*(_QWORD *)(v13 + 16))
    strlen(*(const char **)(v13 + 16));
  *((_WORD *)a1 + 88) = 0;
  *((_WORD *)a1 + 94) = 0;
  a1[25] = (uint64_t)(a1 + 28);
  *((_OWORD *)a1 + 13) = xmmword_21DFA6170;
  a1[29] = (uint64_t)(a1 + 31);
  a1[30] = 0x1000000000;
  a1[47] = 0;
  a1[48] = 0;
  a1[49] = 0;
  a1[50] = (uint64_t)(a1 + 52);
  a1[51] = 0x800000000;
  a1[68] = 0;
  a1[69] = (uint64_t)(a1 + 71);
  a1[70] = 0x800000000;
  llvm::DataLayout::reset();
  a1[75] = (uint64_t)(a1 + 77);
  a1[76] = 0x400000000;
  *((_DWORD *)a1 + 162) = 128;
  a1[79] = MEMORY[0x2207A6DD8](6144, 8);
  sub_21DF71190((uint64_t)(a1 + 79));
  *((_BYTE *)a1 + 656) = 0;
  *((_BYTE *)a1 + 680) = 0;
  *((_DWORD *)a1 + 178) = 128;
  a1[87] = MEMORY[0x2207A6DD8](6144, 8);
  sub_21DF67840((uint64_t)(a1 + 87));
  *((_BYTE *)a1 + 720) = 0;
  *((_BYTE *)a1 + 744) = 0;
  a1[97] = 0;
  a1[96] = 0;
  a1[95] = (uint64_t)(a1 + 96);
  a1[107] = 0;
  a1[106] = 0;
  *((_OWORD *)a1 + 49) = 0u;
  *((_OWORD *)a1 + 50) = 0u;
  *((_OWORD *)a1 + 51) = 0u;
  a1[104] = 0;
  a1[105] = (uint64_t)(a1 + 106);
  a1[110] = 0;
  a1[109] = 0;
  a1[108] = (uint64_t)(a1 + 109);
  a1[111] = (uint64_t)(a1 + 115);
  a1[112] = (uint64_t)(a1 + 115);
  a1[113] = 8;
  *((_DWORD *)a1 + 228) = 0;
  bzero(a1 + 123, 0x230uLL);
  for (i = 0; i != 70; i += 7)
  {
    v15 = &a1[i];
    v15[123] = 4;
    *((_OWORD *)v15 + 62) = 0uLL;
    *((_OWORD *)v15 + 63) = 0uLL;
    v15[128] = 0;
    v15[129] = -1;
  }
  v16 = 0;
  *(_OWORD *)(a1 + 209) = 0u;
  *(_OWORD *)(a1 + 211) = 0u;
  *(_OWORD *)(a1 + 205) = 0u;
  *(_OWORD *)(a1 + 207) = 0u;
  *(_OWORD *)(a1 + 201) = 0u;
  *(_OWORD *)(a1 + 203) = 0u;
  *(_OWORD *)(a1 + 197) = 0u;
  *(_OWORD *)(a1 + 199) = 0u;
  *(_OWORD *)(a1 + 193) = 0u;
  *(_OWORD *)(a1 + 195) = 0u;
  a1[213] = 0;
  do
  {
    v17 = &a1[v16];
    v17[193] = 4;
    *((_OWORD *)v17 + 97) = 0uLL;
    *((_OWORD *)v17 + 98) = 0uLL;
    v17[198] = 0;
    v16 += 7;
    v17[199] = -1;
  }
  while (v16 != 21);
  v18 = 0;
  a1[234] = 0;
  *((_OWORD *)a1 + 116) = 0u;
  *((_OWORD *)a1 + 115) = 0u;
  *((_OWORD *)a1 + 114) = 0u;
  *((_OWORD *)a1 + 113) = 0u;
  *((_OWORD *)a1 + 112) = 0u;
  *((_OWORD *)a1 + 111) = 0u;
  *((_OWORD *)a1 + 110) = 0u;
  *((_OWORD *)a1 + 109) = 0u;
  *((_OWORD *)a1 + 108) = 0u;
  *((_OWORD *)a1 + 107) = 0u;
  do
  {
    v19 = &a1[v18];
    v19[214] = 4;
    v20 = &a1[v18 + 215];
    v19[219] = 0;
    *(_OWORD *)v20 = 0uLL;
    *((_OWORD *)v20 + 1) = 0uLL;
    v19[220] = -1;
    v18 += 7;
  }
  while (v18 != 21);
  v21 = 0;
  *((_DWORD *)a1 + 470) = 0;
  do
  {
    a1[v21 + 236] = 4;
    *(_OWORD *)&a1[v21 + 237] = 0uLL;
    v21 += 3;
  }
  while (v21 != 9);
  a1[245] = (uint64_t)"agc.driver.api_texture.";
  *((_OWORD *)a1 + 123) = 0u;
  *((_OWORD *)a1 + 124) = 0u;
  *((_DWORD *)a1 + 500) = 1065353216;
  a1[251] = (uint64_t)"agc.driver.api_sampler.";
  *((_OWORD *)a1 + 126) = 0u;
  *((_OWORD *)a1 + 127) = 0u;
  *((_DWORD *)a1 + 512) = 1065353216;
  a1[257] = (uint64_t)"agc.driver.ab_texture.";
  *((_OWORD *)a1 + 129) = 0u;
  *((_OWORD *)a1 + 130) = 0u;
  *((_DWORD *)a1 + 524) = 1065353216;
  a1[263] = (uint64_t)"agc.driver.ab_sampler.";
  *((_OWORD *)a1 + 132) = 0u;
  *((_OWORD *)a1 + 133) = 0u;
  *((_DWORD *)a1 + 536) = 1065353216;
  a1[269] = (uint64_t)(a1 + 271);
  a1[270] = 0x200000000;
  a1[275] = 0;
  a1[274] = 0;
  a1[273] = (uint64_t)(a1 + 274);
  *((_DWORD *)a1 + 556) = 128;
  a1[276] = MEMORY[0x2207A6DD8](6144, 8);
  sub_21DF733F4((uint64_t)(a1 + 276));
  *((_BYTE *)a1 + 2232) = 0;
  *((_BYTE *)a1 + 2256) = 0;
  *((_OWORD *)a1 + 142) = 0u;
  *((_OWORD *)a1 + 143) = 0u;
  a1[288] = (uint64_t)(a1 + 290);
  a1[289] = 0x400000000;
  *((_WORD *)a1 + 1192) = 0;
  *((_DWORD *)a1 + 606) = 0;
  *(_OWORD *)(a1 + 299) = 0u;
  *(_OWORD *)(a1 + 301) = 0u;
  a1[196] = (uint64_t)"agc.sampler_words";
  v22 = *a1;
  a1[197] = *(_QWORD *)(*(uint64_t *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 344) + 1584);
  a1[198] = (uint64_t)"sampler_state";
  a1[199] = 0x100000040;
  a1[203] = (uint64_t)"agc.sampler_es1_lod_bias";
  a1[204] = *(uint64_t *)((char *)a1 + *(_QWORD *)(v22 - 24) + 160);
  a1[205] = (uint64_t)"driver_parameters";
  *((_DWORD *)a1 + 412) = *(_DWORD *)(*(uint64_t *)((char *)a1 + *(_QWORD *)(v22 - 24) + 344) + 836);
  *((_DWORD *)a1 + 413) = 19;
  a1[210] = (uint64_t)"agc.sampler_unique_id";
  a1[211] = *(uint64_t *)((char *)a1 + *(_QWORD *)(v22 - 24) + 200);
  a1[212] = (uint64_t)"driver_parameters";
  *((_DWORD *)a1 + 426) = *(_DWORD *)(*(uint64_t *)((char *)a1 + *(_QWORD *)(v22 - 24) + 344) + 836);
  *((_DWORD *)a1 + 427) = 98;
  a1[217] = (uint64_t)"agc.constant_sampler_words";
  a1[218] = *(_QWORD *)(*(uint64_t *)((char *)a1 + *(_QWORD *)(v22 - 24) + 344) + 1584);
  a1[219] = (uint64_t)"constant_driver";
  a1[220] = 0x1200000040;
  a1[126] = (uint64_t)"agc.read_image_words";
  a1[127] = *(_QWORD *)(*(uint64_t *)((char *)a1 + *(_QWORD *)(v22 - 24) + 344) + 1576);
  a1[128] = (uint64_t)"image_state";
  a1[129] = 64;
  a1[133] = (uint64_t)"agc.write_image_words";
  a1[134] = *(_QWORD *)(*(uint64_t *)((char *)a1 + *(_QWORD *)(v22 - 24) + 344) + 1576);
  a1[135] = (uint64_t)"image_state";
  a1[136] = 0x600000040;
  a1[140] = (uint64_t)"agc.image_dim";
  a1[141] = llvm::FixedVectorType::get();
  a1[142] = (uint64_t)"driver_parameters";
  v23 = *a1;
  *((_DWORD *)a1 + 286) = *(_DWORD *)(*(uint64_t *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 344) + 836);
  *((_DWORD *)a1 + 287) = 11;
  a1[147] = (uint64_t)"agc.image_array_info";
  Int8PtrTy = (void *)llvm::Type::getInt8PtrTy(*(llvm::Type **)((char *)a1 + *(_QWORD *)(v23 - 24) + 336), (llvm::LLVMContext *)2);
  v25 = *(uint64_t *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 192);
  __p = Int8PtrTy;
  v108 = v25;
  v109 = v25;
  a1[148] = llvm::StructType::get();
  a1[149] = (uint64_t)"driver_parameters";
  v26 = *a1;
  *((_DWORD *)a1 + 300) = *(_DWORD *)(*(uint64_t *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 344) + 836);
  *((_DWORD *)a1 + 301) = 12;
  a1[161] = (uint64_t)"agc.image_mipmap_count";
  a1[162] = *(uint64_t *)((char *)a1 + *(_QWORD *)(v26 - 24) + 192);
  a1[163] = (uint64_t)"driver_parameters";
  *((_DWORD *)a1 + 328) = *(_DWORD *)(*(uint64_t *)((char *)a1 + *(_QWORD *)(v26 - 24) + 344) + 836);
  *((_DWORD *)a1 + 329) = 16;
  a1[168] = (uint64_t)"agc.image_sample_count";
  a1[169] = *(uint64_t *)((char *)a1 + *(_QWORD *)(v26 - 24) + 192);
  a1[170] = (uint64_t)"driver_parameters";
  *((_DWORD *)a1 + 342) = *(_DWORD *)(*(uint64_t *)((char *)a1 + *(_QWORD *)(v26 - 24) + 344) + 836);
  *((_DWORD *)a1 + 343) = 17;
  a1[154] = (uint64_t)"agc.image_pack_format";
  a1[155] = *(uint64_t *)((char *)a1 + *(_QWORD *)(v26 - 24) + 192);
  a1[156] = (uint64_t)"driver_parameters";
  *((_DWORD *)a1 + 314) = *(_DWORD *)(*(uint64_t *)((char *)a1 + *(_QWORD *)(v26 - 24) + 344) + 836);
  *((_DWORD *)a1 + 315) = 13;
  a1[175] = (uint64_t)"agc.image_base_level";
  a1[176] = *(uint64_t *)((char *)a1 + *(_QWORD *)(v26 - 24) + 192);
  a1[177] = (uint64_t)"driver_parameters";
  *((_DWORD *)a1 + 356) = *(_DWORD *)(*(uint64_t *)((char *)a1 + *(_QWORD *)(v26 - 24) + 344) + 836);
  *((_DWORD *)a1 + 357) = 62;
  a1[189] = (uint64_t)"agc.image_unique_id";
  a1[190] = *(uint64_t *)((char *)a1 + *(_QWORD *)(v26 - 24) + 200);
  a1[191] = (uint64_t)"driver_parameters";
  *((_DWORD *)a1 + 384) = *(_DWORD *)(*(uint64_t *)((char *)a1 + *(_QWORD *)(v26 - 24) + 344) + 836);
  *((_DWORD *)a1 + 385) = 97;
  a1[182] = (uint64_t)"agc.image_heap_index";
  a1[183] = *(uint64_t *)((char *)a1 + *(_QWORD *)(v26 - 24) + 192);
  a1[184] = (uint64_t)"driver_parameters";
  *((_DWORD *)a1 + 370) = *(_DWORD *)(*(uint64_t *)((char *)a1 + *(_QWORD *)(v26 - 24) + 344) + 836);
  *((_DWORD *)a1 + 371) = 93;
  v27 = *a1;
  *(uint64_t *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 320) = a3;
  *(_QWORD *)(*(uint64_t *)((char *)a1 + *(_QWORD *)(v27 - 24) + 344) + 320) = *(uint64_t *)((char *)a1
                                                                                         + *(_QWORD *)(v27 - 24)
                                                                                         + 320);
  *(_QWORD *)(*(uint64_t *)((char *)a1 + *(_QWORD *)(v27 - 24) + 344) + 328) = (char *)a1 + *(_QWORD *)(v27 - 24) + 592;
  *((_BYTE *)a1 + 24) = 1;
  v28 = *(llvm::Module **)((char *)a1 + *(_QWORD *)(v27 - 24) + 320);
  __p = "air.compile_options";
  v110 = 259;
  NamedMetadata = llvm::Module::getNamedMetadata(v28, (const llvm::Twine *)&__p);
  if (NamedMetadata)
  {
    v30 = (llvm::NamedMDNode *)NamedMetadata;
    v31 = 0;
    while (v31 < llvm::NamedMDNode::getNumOperands(v30))
    {
      Operand = llvm::NamedMDNode::getOperand(v30);
      ++v31;
      if (sub_21DF241E0(*(llvm::MDString **)(Operand - 8 * *(unsigned int *)(Operand + 8)), "air.compile.fast_math_disable"))
      {
        *((_BYTE *)a1 + 24) = 0;
        break;
      }
    }
    llvm::NamedMDNode::eraseFromParent(v30);
  }
  v33 = (uint64_t *)(a3 + 168);
  if (*(char *)(a3 + 191) < 0)
  {
    v35 = *(_QWORD *)(a3 + 176);
    if (v35 != 20)
    {
      if (v35 != 22)
      {
LABEL_31:
        v41 = 0;
        goto LABEL_43;
      }
      v33 = (uint64_t *)*v33;
LABEL_24:
      v36 = (uint64_t *)*v33;
      v37 = v33[1];
      v38 = *(uint64_t *)((char *)v33 + 14);
      if (v36 == (uint64_t *)0x746E656D67617246 && v37 == 0x505F65746174535FLL && v38 == 0x6D6172676F72505FLL)
      {
        v41 = 1;
        goto LABEL_43;
      }
      goto LABEL_31;
    }
    v33 = (uint64_t *)*v33;
  }
  else
  {
    v34 = *(unsigned __int8 *)(a3 + 191);
    if (v34 != 20)
    {
      if (v34 != 22)
        goto LABEL_31;
      goto LABEL_24;
    }
  }
  v42 = (uint64_t *)*v33;
  v43 = v33[1];
  v44 = *((_DWORD *)v33 + 4);
  v41 = v42 == (uint64_t *)0x535F786574726556 && v43 == 0x6F72505F65746174 && v44 == 1835102823;
LABEL_43:
  *((_BYTE *)a1 + 10) |= v41;
  v47 = *(llvm::Module **)((char *)a1 + *(_QWORD *)(*a1 - 24) + 320);
  __p = "air.language_version";
  v110 = 259;
  v48 = (llvm::NamedMDNode *)llvm::Module::getNamedMetadata(v47, (const llvm::Twine *)&__p);
  if (v48)
  {
    v49 = llvm::NamedMDNode::getOperand(v48);
    if (v49)
    {
      if (sub_21DF241E0(*(llvm::MDString **)(v49 - 8 * *(unsigned int *)(v49 + 8)), "OpenGL ES GLSL"))
        *((_BYTE *)a1 + 10) = 1;
    }
  }
  v50 = *(llvm::Module **)((char *)a1 + *(_QWORD *)(*a1 - 24) + 320);
  __p = "air.version";
  v110 = 259;
  v51 = (llvm::NamedMDNode *)llvm::Module::getNamedMetadata(v50, (const llvm::Twine *)&__p);
  if (v51)
    llvm::NamedMDNode::eraseFromParent(v51);
  v52 = *((_BYTE *)a1 + 24);
  if (v52)
    v53 = 1;
  else
    v53 = a6;
  *((_BYTE *)a1 + 26) = v53;
  *((_BYTE *)a1 + 28) = v53;
  *((_BYTE *)a1 + 27) = v53;
  *((_BYTE *)a1 + 25) = v52;
  v54 = *a1;
  v55 = *(_DWORD *)((char *)a1 + 25);
  if ((v55 & 1) != 0)
    v56 = -1;
  else
    v56 = 16;
  if ((v55 & 0x100) != 0)
    v56 |= 6u;
  *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 104) = v56 | (v55 >> 13) & 8;
  v57 = *(_DWORD *)((char *)a1 + 25);
  if ((v57 & 1) != 0)
    v58 = -1;
  else
    v58 = 16;
  if ((v57 & 0x100) != 0)
    v58 |= 6u;
  *(_DWORD *)(*(uint64_t *)((char *)a1 + *(_QWORD *)(v54 - 24) + 344) + 104) = v58 | (v57 >> 13) & 8;
  v59 = *(llvm::Module **)((char *)a1 + *(_QWORD *)(v54 - 24) + 320);
  v60 = 1;
  HIBYTE(v110) = 1;
  if (*a4)
  {
    __p = a4;
    v60 = 3;
  }
  LOBYTE(v110) = v60;
  v61 = (llvm::NamedMDNode *)llvm::Module::getNamedMetadata(v59, (const llvm::Twine *)&__p);
  a1[6] = (uint64_t)v61;
  v62 = llvm::NamedMDNode::getOperand(v61);
  a1[20] = 0;
  v63 = *(unsigned __int8 **)(v62 - 8 * *(unsigned int *)(v62 + 8));
  if (v63 && *v63 - 1 <= 1)
  {
    v64 = *((_QWORD *)v63 + 16);
    if (*(_BYTE *)(v64 + 16))
      v64 = 0;
    a1[20] = v64;
  }
  v65 = *(llvm::Module **)((char *)a1 + *(_QWORD *)(*a1 - 24) + 320);
  __p = "llvm.dbg.cu";
  v110 = 259;
  if (llvm::Module::getNamedMetadata(v65, (const llvm::Twine *)&__p))
  {
    *((_BYTE *)a1 + *(_QWORD *)(*a1 - 24) + 576) = 1;
    Subprogram = (llvm::DILocalScope *)llvm::Function::getSubprogram((llvm::Function *)a1[20]);
    if (Subprogram)
    {
      llvm::DILocalScope::getNonLexicalBlockFileScope(Subprogram);
      a1[5] = llvm::DILocation::getImpl();
    }
  }
  v67 = (llvm::Value *)a1[20];
  Name = (_QWORD *)llvm::Value::getName(v67);
  if (v69 == 23)
  {
    v70 = *Name == 0x747265762E726961 && Name[1] == 0x4668637465467865;
    if (v70 && *(_QWORD *)((char *)Name + 15) == 0x6E6F6974636E7546)
    {
      v72 = *(_QWORD *)(a1[20] + 80);
      v73 = v72 - 24;
      if (!v72)
        v73 = 0;
      v74 = *(_QWORD *)(v73 + 40);
      if (v74 == v73 + 40)
      {
        v77 = 0;
      }
      else
      {
        v75 = v74 - 24;
        if (v74)
          v76 = v74 - 24;
        else
          v76 = 0;
        if (*(unsigned __int8 *)(v76 + 16) - 29 >= 0xB)
          v77 = 0;
        else
          v77 = v75;
      }
      if (*(_BYTE *)(v77 + 16) == 29)
        v78 = v77;
      else
        v78 = 0;
      v79 = *(_DWORD *)(v78 + 20) & 0x7FFFFFF;
      if ((_DWORD)v79 && (v80 = *(_QWORD *)(v78 - 32 * v79)) != 0)
      {
        v81 = *(unsigned __int8 *)(v80 + 16);
      }
      else
      {
        v82 = *(_QWORD *)(v78 + 24);
        v80 = v82 - 24;
        if (v82)
          v83 = v82 - 24;
        else
          v83 = 0;
        v81 = *(unsigned __int8 *)(v83 + 16);
      }
      if (v81 == 84)
      {
        v84 = *(_QWORD *)(v80 - 32);
        if (!v84 || *(_BYTE *)(v84 + 16) || *(_QWORD *)(v84 + 24) != *(_QWORD *)(v80 + 72))
          v84 = 0;
        if (v84)
          v67 = (llvm::Value *)v84;
      }
    }
  }
  __p = (void *)llvm::Function::getFnAttribute();
  if (llvm::Attribute::isStringAttribute((llvm::Attribute *)&__p))
  {
    ValueAsString = llvm::Attribute::getValueAsString((llvm::Attribute *)&__p);
    if (v86 == 10 && *(_QWORD *)ValueAsString == 0x696F706563617274 && *(_WORD *)(ValueAsString + 8) == 29806)
      *((_BYTE *)a1 + 37) = 1;
  }
  v88 = (void *)llvm::Value::getName(v67);
  if (v88)
  {
    v88 = sub_21DF24420(&__p, v88, v89);
    if (v109 >= 0)
      p_p = &__p;
    else
      LOBYTE(p_p) = (_BYTE)__p;
  }
  else
  {
    __p = 0;
    v108 = 0;
    p_p = &__p;
    v109 = 0;
  }
  sub_21DF28954((uint64_t)v88, "------ Compiling function : %s ------", v90, v91, v92, v93, v94, v95, (char)p_p);
  if (SHIBYTE(v109) < 0)
    operator delete(__p);
  v97 = a1[20];
  if (**(_QWORD **)(*(_QWORD *)(v97 + 24) + 16) != *(uint64_t *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 144))
    a1[7] = *(_QWORD *)(v62 - 8 * *(unsigned int *)(v62 + 8) + 8);
  v98 = *(_QWORD *)(v97 + 96);
  if (v98)
  {
    v99 = *(_QWORD *)(v62 - 8 * *(unsigned int *)(v62 + 8) + 16);
    a1[8] = v99;
    v100 = *((unsigned int *)a1 + 20);
    if (v98 != v100)
    {
      if (v98 >= v100)
      {
        if (v98 > (unint64_t)*((unsigned int *)a1 + 21))
        {
          llvm::SmallVectorBase<unsigned int>::grow_pod();
          v100 = *((unsigned int *)a1 + 20);
        }
        if (v100 != v98)
          bzero((void *)(*v12 + 8 * v100), 8 * v98 - 8 * v100);
      }
      *((_DWORD *)a1 + 20) = v98;
      v99 = a1[8];
    }
    v101 = *(unsigned int *)(v99 + 8);
    if ((_DWORD)v101)
    {
      for (j = 0; j < v101; ++j)
      {
        v103 = *(_QWORD *)(v99 - 8 * v101 + 8 * j);
        v106 = 0;
        LODWORD(__p) = 0;
        sub_21DF7A834(0, v103, (unsigned int *)&__p, &v106);
        *(_QWORD *)(a1[9] + 8 * v106) = v103;
        v99 = a1[8];
        v101 = *(unsigned int *)(v99 + 8);
      }
    }
  }
  v104 = *a2;
  *a1 = *a2;
  *(uint64_t *)((char *)a1 + *(_QWORD *)(v104 - 24)) = a2[3];
  return a1;
}

uint64_t sub_21DF9D590(_QWORD *a1, unint64_t *a2, unsigned int a3, uint64_t a4)
{
  const char *String;
  uint64_t v9;
  BOOL v10;
  _QWORD *v14;
  size_t v15;
  void *v16;
  size_t v17;
  BOOL v19;
  uint64_t result;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  llvm::MDString *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v35;
  int v36;
  unint64_t *v37;
  unint64_t v38;
  unsigned int v39;
  unsigned int v40;
  char v41;
  unsigned __int8 **v42;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  int v49;
  unint64_t *v50;
  void *__p[2];
  uint64_t v52;
  _QWORD v53[4];
  __int16 v54;
  uint64_t v55;
  const char *v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;

  if (a4)
  {
    String = (const char *)llvm::MDString::getString(*(llvm::MDString **)(a4 - 8 * *(unsigned int *)(a4 + 8) + 8));
    if (v9 > 10)
    {
      if (v9 == 11)
      {
        if (*(_QWORD *)String == 0x747865742E726961 && *(_QWORD *)(String + 3) == 0x657275747865742ELL)
        {
          if (!a2[1])
            return 1;
          v48 = *(_QWORD *)(a1[9] + 8 * a3);
          BYTE4(v55) = 0;
          LOBYTE(v55) = 0;
          LODWORD(v53[0]) = 0;
          LODWORD(__p[0]) = 0;
          LOWORD(v57) = 0;
          *(_QWORD *)((char *)&v57 + 4) = 0xFFFFFFFFLL;
          v58 = 0;
          if (!sub_21DF7AB58(v48, v53, __p, (_BYTE *)&v57 + 1, &v57, (BOOL *)&v55 + 4, &v55))
            goto LABEL_28;
          v49 = BYTE4(v55);
          v50 = a2;
          if (BYTE4(v55))
            v50 = *(unint64_t **)(**(_QWORD **)(*a2 + 16) + 16);
          v59 = **(_QWORD **)(*v50 + 16);
          v39 = (*(uint64_t (**)(_QWORD *, _QWORD))(*a1 + 208))(a1, LODWORD(v53[0]));
          v40 = __p[0];
          *((_DWORD *)a1 + 571) += LODWORD(__p[0]);
          *((_BYTE *)a1 + 2384) |= v55;
          LODWORD(v56) = (unsigned __int16)v39;
          HIDWORD(v56) = v40;
          sub_21DF69C94(a1 + 105, (unsigned __int16)v39, (uint64_t)&v56);
          if ((_BYTE)v57)
          {
            if (v49)
            {
              *((_DWORD *)a1 + 606) |= ~(-1 << v40) << v39;
              v41 = 1;
            }
            else
            {
              v41 = 0;
              *((_DWORD *)a1 + 606) |= 1 << v39;
            }
          }
          else
          {
            v41 = v49 != 0;
          }
          v42 = (unsigned __int8 **)(a1 + 245);
        }
        else
        {
          if (*(_QWORD *)String != 0x706D61732E726961 || *(_QWORD *)(String + 3) != 0x72656C706D61732ELL)
            goto LABEL_28;
          if (!a2[1])
            return 1;
          v35 = *(_QWORD *)(a1[9] + 8 * a3);
          LODWORD(v53[0]) = 0;
          LODWORD(__p[0]) = 0;
          BYTE4(v55) = 0;
          if ((sub_21DF7A9C8(v35, v53, __p, (BOOL *)&v55 + 4) & 1) == 0)
            goto LABEL_28;
          v36 = BYTE4(v55);
          v37 = a2;
          if (BYTE4(v55))
            v37 = *(unint64_t **)(**(_QWORD **)(*a2 + 16) + 16);
          v38 = *v37;
          v39 = (*(uint64_t (**)(_QWORD *, _QWORD))(*a1 + 208))(a1, LODWORD(v53[0]));
          v40 = __p[0];
          *((_DWORD *)a1 + 572) += LODWORD(__p[0]);
          *(_QWORD *)&v57 = 0;
          *((_QWORD *)&v57 + 1) = **(_QWORD **)(v38 + 16);
          LODWORD(v56) = (unsigned __int16)v39;
          HIDWORD(v56) = v40;
          sub_21DF7209C(a1 + 108, (unsigned __int16)v39, (uint64_t)&v56);
          v41 = v36 != 0;
          v42 = (unsigned __int8 **)(a1 + 251);
        }
        if ((sub_21DF764A4(a1, a2, v39, v40, v41, v42) & 1) != 0)
          return 1;
        goto LABEL_28;
      }
      if (v9 != 19)
      {
        if (v9 != 22)
          goto LABEL_28;
        v10 = *(_QWORD *)String == 0x63616E692E726961 && *((_QWORD *)String + 1) == 0x656C626973736563;
        if (!v10 || *(_QWORD *)(String + 14) != 0x7475706E695F656CLL)
          goto LABEL_28;
        llvm::UndefValue::get();
LABEL_97:
        llvm::Value::replaceAllUsesWith();
        return 1;
      }
      if (*(_QWORD *)String != 0x69646E692E726961
        || *((_QWORD *)String + 1) != 0x6675625F74636572
        || *(_QWORD *)(String + 11) != 0x7265666675625F74)
      {
        goto LABEL_28;
      }
LABEL_90:
      sub_21DF73C40((uint64_t)a1, (uint64_t *)a2, a3, a4, 0xFFFFFFFF);
      return 1;
    }
    if (v9 != 9)
    {
      if (v9 != 10)
        goto LABEL_28;
      if (*(_QWORD *)String != 0x666675622E726961 || *((_WORD *)String + 4) != 29285)
        goto LABEL_28;
      goto LABEL_90;
    }
  }
  else
  {
    String = "air.byval";
  }
  if (*(_QWORD *)String == 0x617679622E726961 && String[8] == 108)
  {
    v30 = *a2;
    v56 = "agc.byval.";
    *((_QWORD *)&v57 + 1) = a3;
    LOWORD(v59) = 2051;
    v31 = sub_21DF66EC0(a1, v30, (uint64_t)&v56, a3, 0);
    v32 = (_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24));
    LOWORD(v59) = 257;
    sub_21DF19394(v32 + 1, **(llvm::Type ***)(*(_QWORD *)v31 + 16), v31, 0, (uint64_t)&v56);
    goto LABEL_97;
  }
LABEL_28:
  v14 = (_QWORD *)llvm::MDString::getString(*(llvm::MDString **)(a4 - 8 * *(unsigned int *)(a4 + 8) + 8));
  v16 = v14;
  v17 = v15;
  if (v15 == 11)
  {
    if (*v14 != 0x66696E752E726961 || *(_QWORD *)((char *)v14 + 3) != 0x6D726F66696E752ELL)
      return 0;
  }
  else
  {
    if (v15 != 19)
      return 0;
    v19 = *v14 == 0x616665642E726961 && v14[1] == 0x66696E755F746C75;
    if (!v19 || *(_QWORD *)((char *)v14 + 11) != 0x6D726F66696E755FLL)
      return 0;
  }
  v55 = 0;
  v22 = *(_DWORD *)(a4 + 8);
  if (v22 >= 3)
  {
    v23 = 2;
    do
    {
      v24 = v23 + 1;
      v25 = *(llvm::MDString **)(a4 - 8 * *(unsigned int *)(a4 + 8) + 8 * v23);
      if (v25 && !*(_BYTE *)v25)
      {
        v26 = (_QWORD *)llvm::MDString::getString(v25);
        if (v27 == 11)
        {
          if (*v26 != 0x646E69622E726961 || *(_QWORD *)((char *)v26 + 3) != 0x676E69646E69622ELL)
            goto LABEL_48;
          LODWORD(v56) = v23 + 1;
          if (!sub_21DF7A834(0, a4, (unsigned int *)&v56, &v55))
            return 0;
        }
        else
        {
          if (v27 != 15)
            goto LABEL_48;
          if (*v26 != 0x666675622E726961 || *(_QWORD *)((char *)v26 + 7) != 0x657A69735F726566)
            goto LABEL_48;
          LODWORD(v56) = v23 + 1;
          if ((sub_21DF7A834(0, a4, (unsigned int *)&v56, (_DWORD *)&v55 + 1) & 1) == 0)
            return 0;
        }
        v24 = v23 + 2;
      }
LABEL_48:
      v23 = v24;
    }
    while (v24 < v22);
  }
  v45 = *a2;
  v53[0] = "agc.buffer_pointers";
  v53[2] = ".";
  v54 = 771;
  if (v16)
  {
    sub_21DF24420(__p, v16, v17);
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v52 = 0;
  }
  v56 = (const char *)v53;
  *((_QWORD *)&v57 + 1) = __p;
  LOWORD(v59) = 1026;
  v46 = sub_21DF66EC0(a1, v45, (uint64_t)&v56, v55, SHIDWORD(v55));
  if (SHIBYTE(v52) < 0)
    operator delete(__p[0]);
  v47 = (_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  LOWORD(v59) = 257;
  result = sub_21DF19394(v47 + 1, **(llvm::Type ***)(*(_QWORD *)v46 + 16), v46, 0, (uint64_t)&v56);
  if (result)
    goto LABEL_97;
  return result;
}

uint64_t sub_21DF9DCF4(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;

  v1 = *(_QWORD *)(result + *(_QWORD *)(*(_QWORD *)result - 24) + 320);
  v2 = v1 + 24;
  v3 = *(_QWORD *)(v1 + 32);
  if (v3 != v1 + 24)
  {
    while (1)
    {
      v4 = v3 ? v3 - 56 : 0;
      result = llvm::GlobalValue::isDeclaration((llvm::GlobalValue *)v4);
      if ((result & 1) == 0)
        break;
LABEL_6:
      v3 = *(_QWORD *)(v3 + 8);
      if (v3 == v2)
        return result;
    }
    if ((*(_WORD *)(v4 + 18) & 1) != 0)
    {
      result = llvm::Function::BuildLazyArguments((llvm::Function *)v4);
      v5 = *(_QWORD *)(v4 + 88);
      if ((*(_WORD *)(v4 + 18) & 1) != 0)
      {
        result = llvm::Function::BuildLazyArguments((llvm::Function *)v4);
        v6 = *(_QWORD *)(v4 + 88);
LABEL_13:
        v7 = v6 + 40 * *(_QWORD *)(v4 + 96);
        while (v5 != v7)
        {
          v8 = *(_DWORD *)(*(_QWORD *)v5 + 8);
          if (v8 == 15)
          {
            if ((v8 & 0xFE) == 0x12)
              v8 = *(_DWORD *)(**(_QWORD **)(*(_QWORD *)v5 + 16) + 8);
            if (v8 <= 0xFF)
              result = llvm::Function::addParamAttr();
          }
          v5 += 40;
        }
        goto LABEL_6;
      }
    }
    else
    {
      v5 = *(_QWORD *)(v4 + 88);
    }
    v6 = v5;
    goto LABEL_13;
  }
  return result;
}

void sub_21DF9DDFC(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t *v4;
  uint64_t *v5;
  _QWORD *v6;
  llvm::DataLayout *v7;
  uint64_t Impl;
  uint64_t v9;
  unsigned __int8 *v10;
  llvm::GlobalObject *v11;
  _QWORD *SectionImpl;
  uint64_t v13;
  uint64_t v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t i;
  int v20;
  llvm::Type **v21;
  llvm::Type *v22;
  int v23;
  llvm::Type *v24;
  BOOL v25;
  unint64_t v26;
  char *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  BOOL v35;
  unint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  unint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  _QWORD *v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char *v58;
  char *v59;
  char *v60;
  char *v61;
  char *v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  llvm::Type *v69;
  _QWORD *v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  char *__p;
  char *__pa;
  char *__pb;
  char *__pc;
  char *__pd;
  unint64_t v82;
  char *v83;
  char *v84;
  unint64_t v85;
  int v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  int v91;
  int v92;
  int v93;
  unint64_t v94;
  __int128 v95;
  uint64_t v96;
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v1 = (char *)a1 + *(_QWORD *)(*a1 - 24);
  v2 = *((unsigned int *)v1 + 150);
  if ((_DWORD)v2)
  {
    v4 = (uint64_t *)*((_QWORD *)v1 + 74);
    v5 = &v4[v2];
    v6 = a1 + 43;
    v7 = (llvm::DataLayout *)(a1 + 21);
    do
    {
      Impl = *v4;
      v9 = *(unsigned int *)(*v4 + 8);
      if (v9 >= 3)
      {
        v10 = *(unsigned __int8 **)(Impl - 8 * v9);
        if (v10)
        {
          if (*v10 - 1 <= 1)
          {
            v11 = (llvm::GlobalObject *)*((_QWORD *)v10 + 16);
            if (v11)
            {
              if (*((_BYTE *)v11 + 16) == 3 && (*((_BYTE *)v11 + 34) & 0x40) != 0)
              {
                SectionImpl = (_QWORD *)llvm::GlobalObject::getSectionImpl(v11);
                if (v13 == 15
                  && *SectionImpl == 0x625F726566667562
                  && *(_QWORD *)((char *)SectionImpl + 7) == 0x73676E69646E6962)
                {
                  v15 = *(_QWORD *)v11;
                  v16 = *(_DWORD *)(*(_QWORD *)v11 + 8);
                  if (v16 == 15)
                  {
                    if ((v16 & 0xFE) == 0x12)
                      v16 = *(_DWORD *)(**(_QWORD **)(v15 + 16) + 8);
                    if ((v16 & 0xFFFFFF00) == 0x4000)
                    {
                      v17 = **(_QWORD **)(v15 + 16);
                      v18 = *(_DWORD *)(v17 + 8);
                      if (v18 == 15)
                      {
                        if ((v18 & 0xFE) == 0x12)
                          v18 = *(_DWORD *)(**(_QWORD **)(v17 + 16) + 8);
                        if ((v18 >> 8) - 1 <= 1)
                        {
                          for (i = *((_QWORD *)v11 + 1); i; i = *(_QWORD *)(i + 8))
                          {
                            if (*(_BYTE *)(*(_QWORD *)(i + 24) + 16) != 60)
                              goto LABEL_33;
                          }
                          v20 = 0;
                          v93 = 0;
                          if (*(_DWORD *)(Impl + 8) != 4
                            || (LODWORD(v94) = 3, sub_21DF7A834(0, Impl, (unsigned int *)&v94, &v93))
                            && (v20 = v93, v93 != -1))
                          {
                            v21 = *(llvm::Type ***)(v17 + 16);
                            v22 = *v21;
                            v23 = *((unsigned __int8 *)*v21 + 8);
                            v24 = v23 == 16 ? *v21 : 0;
                            if (v23 != 7 && (!v24 || (*((_BYTE *)v24 + 9) & 1) != 0))
                            {
                              v86 = v20;
                              v69 = v22;
                              v91 = 0;
                              v92 = 0;
                              LODWORD(v94) = 1;
                              sub_21DF7A834(0, Impl, (unsigned int *)&v94, &v92);
                              LODWORD(v94) = 2;
                              sub_21DF7A834(0, Impl, (unsigned int *)&v94, &v91);
                              if (*(_BYTE *)(*(_QWORD *)((char *)v6 + *(_QWORD *)(*a1 - 24)) + 1685))
                                v25 = 0;
                              else
                                v25 = v92 == 5;
                              if (v25 && v91 < 0 && ((a1[284] >> SBYTE2(v91)) & 1) != 0)
                              {
                                v94 = llvm::ValueAsMetadata::get();
                                v95 = *(_OWORD *)(Impl - 8 * *(unsigned int *)(Impl + 8) + 8);
                                llvm::ConstantInt::get();
                                v96 = llvm::ValueAsMetadata::get();
                                Impl = llvm::MDTuple::getImpl();
                                goto LABEL_33;
                              }
                              if (v86)
                                goto LABEL_33;
                              v26 = *((_QWORD *)v11 + 1);
                              if (v26)
                              {
                                v27 = 0;
                                v28 = 0;
                                v29 = 0;
                                v70 = v6;
                                do
                                {
                                  v30 = *(_QWORD *)(v26 + 24);
                                  if (v28 >= v29)
                                  {
                                    v31 = (v28 - v27) >> 4;
                                    v32 = v31 + 1;
                                    if ((unint64_t)(v31 + 1) >> 60)
LABEL_127:
                                      abort();
                                    v33 = v29 - v27;
                                    v34 = (v29 - v27) >> 3;
                                    if (v34 > v32)
                                      v32 = v34;
                                    v35 = v33 >= 0x7FFFFFFFFFFFFFF0;
                                    v36 = 0xFFFFFFFFFFFFFFFLL;
                                    if (!v35)
                                      v36 = v32;
                                    v82 = v36;
                                    v87 = v26;
                                    if (v36)
                                    {
                                      v71 = (v28 - v27) >> 4;
                                      v74 = *(_QWORD *)(v26 + 24);
                                      __p = v27;
                                      if (v36 >> 60)
LABEL_128:
                                        sub_21DF256A4();
                                      v37 = (char *)operator new(16 * v36);
                                      v27 = __p;
                                      v31 = v71;
                                      v30 = v74;
                                    }
                                    else
                                    {
                                      v37 = 0;
                                    }
                                    v38 = &v37[16 * v31];
                                    *(_QWORD *)v38 = v30;
                                    *((_QWORD *)v38 + 1) = 0;
                                    if (v28 == v27)
                                    {
                                      v41 = &v37[16 * v31];
                                      v40 = v82;
                                    }
                                    else
                                    {
                                      v39 = &v37[16 * v31];
                                      v40 = v82;
                                      do
                                      {
                                        v41 = v39 - 16;
                                        *((_OWORD *)v39 - 1) = *((_OWORD *)v28 - 1);
                                        v28 -= 16;
                                        v39 -= 16;
                                      }
                                      while (v28 != v27);
                                    }
                                    v29 = &v37[16 * v40];
                                    v28 = v38 + 16;
                                    if (v27)
                                    {
                                      v83 = &v37[16 * v40];
                                      operator delete(v27);
                                      v29 = v83;
                                    }
                                    v27 = v41;
                                    v6 = v70;
                                    v26 = v87;
                                  }
                                  else
                                  {
                                    *(_QWORD *)v28 = v30;
                                    *((_QWORD *)v28 + 1) = 0;
                                    v28 += 16;
                                  }
                                  v26 = *(_QWORD *)(v26 + 8);
                                }
                                while (v26);
                                v84 = v29;
                                if (v27 != v28)
                                {
                                  v26 = 0;
                                  v42 = v27;
                                  v27 = v28;
                                  while (1)
                                  {
                                    v43 = *((_QWORD *)v27 - 2);
                                    v27 -= 16;
                                    v44 = *(_QWORD *)(v43 + 8);
                                    if (v44)
                                      break;
LABEL_113:
                                    if (v42 == v27)
                                      goto LABEL_119;
                                  }
                                  v45 = *((_QWORD *)v27 + 1);
                                  v65 = v45;
                                  while (2)
                                  {
                                    v46 = *(_QWORD *)(v44 + 24);
                                    v47 = *(unsigned __int8 *)(v46 + 16);
                                    switch(v47)
                                    {
                                      case 'M':
                                        v67 = v44;
                                        v72 = v42;
                                        v75 = *(_QWORD **)(v44 + 24);
                                        v88 = v26;
                                        __pa = v27;
                                        if (*(_BYTE *)(*(_QWORD *)v46 + 8) != 15
                                          || (v94 = sub_21DF1B2C4(v7, v69),
                                              *(_QWORD *)&v95 = v48,
                                              v66 = llvm::TypeSize::operator unsigned long long(),
                                              v94 = sub_21DF1B2C4(v7, **(llvm::Type ***)(*v75 + 16)),
                                              *(_QWORD *)&v95 = v49,
                                              llvm::TypeSize::operator unsigned long long() > v66))
                                        {
                                          v42 = v72;
                                          if (v72)
                                            goto LABEL_123;
                                          goto LABEL_33;
                                        }
                                        v42 = v72;
                                        v50 = v75[1];
                                        v27 = __pa;
                                        v26 = v88;
                                        v44 = v67;
                                        v45 = v65;
                                        if (v50)
                                        {
                                          while (*(_BYTE *)(*(_QWORD *)(v50 + 24) + 16) == 60)
                                          {
                                            v50 = *(_QWORD *)(v50 + 8);
                                            if (!v50)
                                              goto LABEL_79;
                                          }
                                          goto LABEL_122;
                                        }
LABEL_79:
                                        if (v26 <= v45)
                                          v26 = v45;
                                        break;
                                      case '>':
                                        v51 = *(_DWORD *)(v46 + 20) & 0x7FFFFFF;
                                        v52 = *(_QWORD *)(v46 - 32 * v51 + 32);
                                        if (v52)
                                          v53 = *(_BYTE *)(v52 + 16) == 16;
                                        else
                                          v53 = 0;
                                        if (!v53)
                                          goto LABEL_122;
                                        v54 = (_QWORD *)(v52 + 24);
                                        if (*(_DWORD *)(v52 + 32) >= 0x41u)
                                          v54 = (_QWORD *)*v54;
                                        v55 = *v54 + v45;
                                        if ((_DWORD)v51 == 2)
                                        {
                                          if (v27 >= v84)
                                          {
                                            v76 = *(_QWORD *)(v44 + 24);
                                            v68 = v44;
                                            v89 = v26;
                                            __pb = v27;
                                            v56 = (v27 - v42) >> 4;
                                            v57 = v56 + 1;
                                            if ((unint64_t)(v56 + 1) >> 60)
                                              goto LABEL_127;
                                            v73 = v42;
                                            if ((v84 - v42) >> 3 > v57)
                                              v57 = (v84 - v42) >> 3;
                                            if ((unint64_t)(v84 - v42) >= 0x7FFFFFFFFFFFFFF0)
                                              v57 = 0xFFFFFFFFFFFFFFFLL;
                                            v85 = v57;
                                            if (v57)
                                            {
                                              if (v57 >> 60)
                                                goto LABEL_128;
                                              v58 = (char *)operator new(16 * v57);
                                            }
                                            else
                                            {
                                              v58 = 0;
                                            }
                                            v59 = &v58[16 * v56];
                                            *(_QWORD *)v59 = v76;
                                            *((_QWORD *)v59 + 1) = v55;
                                            if (__pb == v73)
                                            {
                                              v62 = &v58[16 * v56];
                                            }
                                            else
                                            {
                                              v60 = &v58[16 * v56];
                                              v61 = __pb;
                                              do
                                              {
                                                v62 = v60 - 16;
                                                *((_OWORD *)v60 - 1) = *((_OWORD *)v61 - 1);
                                                v61 -= 16;
                                                v60 -= 16;
                                              }
                                              while (v61 != v73);
                                            }
                                            __pc = v59 + 16;
                                            v84 = &v58[16 * v85];
                                            if (v73)
                                              operator delete(v73);
                                            v42 = v62;
                                            v6 = v70;
                                            v27 = __pc;
                                            v26 = v89;
                                            v44 = v68;
                                            v45 = v65;
                                          }
                                          else
                                          {
                                            *(_QWORD *)v27 = v46;
                                            *((_QWORD *)v27 + 1) = v55;
                                            v27 += 16;
                                          }
                                        }
                                        else if (v26 <= v55)
                                        {
                                          v26 = *v54 + v45;
                                        }
                                        break;
                                      case '<':
                                        goto LABEL_79;
                                      default:
                                        goto LABEL_122;
                                    }
                                    v44 = *(_QWORD *)(v44 + 8);
                                    if (!v44)
                                      goto LABEL_113;
                                    continue;
                                  }
                                }
                                v26 = 0;
                              }
                              else
                              {
                                v27 = 0;
                              }
LABEL_119:
                              v90 = v26;
                              __pd = v27;
                              v63 = sub_21DF1B2C4(v7, v69);
                              v94 = v63 + v63 * v90;
                              *(_QWORD *)&v95 = v64;
                              if ((unint64_t)llvm::TypeSize::operator unsigned long long() <= 0xFFFFFFFE)
                              {
                                v94 = llvm::ValueAsMetadata::get();
                                v95 = *(_OWORD *)(Impl - 8 * *(unsigned int *)(Impl + 8) + 8);
                                llvm::ConstantInt::get();
                                v96 = llvm::ValueAsMetadata::get();
                                Impl = llvm::MDTuple::getImpl();
                              }
                              v42 = __pd;
LABEL_122:
                              if (v42)
LABEL_123:
                                operator delete(v42);
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_33:
      *v4++ = Impl;
    }
    while (v4 != v5);
  }
}

uint64_t sub_21DF9E5E4(uint64_t result, int a2, int a3)
{
  uint64_t v5;

  v5 = result;
  if ((a2 & 1) != 0 || a3)
  {
    result = llvm::Module::getOrInsertNamedMetadata();
    if (a2)
    {
      result = llvm::Module::getOrInsertNamedMetadata();
      *(_BYTE *)(v5 + 36) = 1;
    }
    if (a3)
      return llvm::Module::getOrInsertNamedMetadata();
  }
  return result;
}

uint64_t sub_21DF9E694(uint64_t a1)
{
  void **v3;

  if (*(char *)(a1 + 383) < 0)
    operator delete(*(void **)(a1 + 360));
  if (*(char *)(a1 + 359) < 0)
    operator delete(*(void **)(a1 + 336));
  if (*(char *)(a1 + 335) < 0)
    operator delete(*(void **)(a1 + 312));
  if (*(char *)(a1 + 311) < 0)
    operator delete(*(void **)(a1 + 288));
  v3 = (void **)(a1 + 264);
  sub_21DF9E78C(&v3);
  if (*(char *)(a1 + 255) < 0)
    operator delete(*(void **)(a1 + 232));
  if (*(char *)(a1 + 223) < 0)
    operator delete(*(void **)(a1 + 200));
  if (*(char *)(a1 + 199) < 0)
    operator delete(*(void **)(a1 + 176));
  if (*(char *)(a1 + 167) < 0)
    operator delete(*(void **)(a1 + 144));
  if (*(char *)(a1 + 135) < 0)
    operator delete(*(void **)(a1 + 112));
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  if (*(char *)(a1 + 79) < 0)
    operator delete(*(void **)(a1 + 56));
  if (*(char *)(a1 + 55) < 0)
    operator delete(*(void **)(a1 + 32));
  return a1;
}

void sub_21DF9E78C(void ***a1)
{
  void **v1;
  void **v2;
  void **v4;
  void *v5;

  v1 = *a1;
  v2 = (void **)**a1;
  if (v2)
  {
    v4 = (void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        if (*((char *)v4 - 1) < 0)
          operator delete(*(v4 - 3));
        v4 -= 3;
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t **sub_21DF9E804(uint64_t **a1, _QWORD *a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t **v6;
  _QWORD *v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        v6 = (uint64_t **)v5;
        v8 = v5 + 4;
        if (!sub_21DF214C4(a2, v5 + 4))
          break;
        v5 = *v6;
        v9 = v6;
        if (!*v6)
          goto LABEL_9;
      }
      if (!sub_21DF214C4(v8, a2))
        break;
      v9 = v6 + 1;
      v5 = v6[1];
      if (!v5)
        goto LABEL_9;
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_9:
    v10 = (uint64_t *)v6;
    v6 = (uint64_t **)operator new(0x40uLL);
    *((_OWORD *)v6 + 2) = *(_OWORD *)a3;
    v6[6] = *(uint64_t **)(a3 + 16);
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *((_BYTE *)v6 + 56) = 0;
    *v6 = 0;
    v6[1] = 0;
    v6[2] = v10;
    *v9 = (uint64_t *)v6;
    v11 = (uint64_t *)**a1;
    v12 = (uint64_t *)v6;
    if (v11)
    {
      *a1 = v11;
      v12 = *v9;
    }
    sub_21DF25404(a1[1], v12);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  return v6;
}

uint64_t sub_21DF9E8F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v5;
  uint64_t v6;

  if (*(char *)(a1 + 335) < 0)
  {
    if (!*(_QWORD *)(a1 + 320))
      return flatbuffers::GenerateText();
  }
  else if (!*(_BYTE *)(a1 + 335))
  {
    return flatbuffers::GenerateText();
  }
  std::operator+<char>();
  if (*(char *)(a3 + 23) < 0)
    operator delete(*(void **)a3);
  *(_OWORD *)a3 = v5;
  *(_QWORD *)(a3 + 16) = v6;
  return flatbuffers::GenerateText();
}

uint64_t sub_21DF9E98C(uint64_t result)
{
  uint64_t v1;
  void ***v2;
  void ***v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  void **v32;

  if (result)
  {
    v1 = result;
    v3 = *(void ****)(result + 272);
    v2 = *(void ****)(result + 280);
    while (v3 != v2)
    {
      v4 = *v3;
      if (*v3)
      {
        v32 = *v3;
        sub_21DF9E78C(&v32);
        MEMORY[0x2207A7960](v4, 0x1020C4016EE4530);
        v2 = *(void ****)(v1 + 280);
      }
      ++v3;
    }
    v5 = *(_QWORD *)(v1 + 1176);
    if (v5)
    {
      v6 = *(_QWORD *)(v1 + 1184);
      v7 = *(void **)(v1 + 1176);
      if (v6 != v5)
      {
        do
        {
          if (*(char *)(v6 - 17) < 0)
            operator delete(*(void **)(v6 - 40));
          v6 -= 72;
        }
        while (v6 != v5);
        v7 = *(void **)(v1 + 1176);
      }
      *(_QWORD *)(v1 + 1184) = v5;
      operator delete(v7);
    }
    if (*(char *)(v1 + 1175) < 0)
      operator delete(*(void **)(v1 + 1152));
    sub_21DF9E694(v1 + 728);
    sub_21DF253BC(*(char **)(v1 + 712));
    v32 = (void **)(v1 + 680);
    sub_21DF9E78C(&v32);
    sub_21DF9EF20(*(char **)(v1 + 664));
    sub_21DF16820(*(_QWORD **)(v1 + 640));
    if (*(char *)(v1 + 631) < 0)
      operator delete(*(void **)(v1 + 608));
    if (*(char *)(v1 + 607) < 0)
      operator delete(*(void **)(v1 + 584));
    sub_21DF2E824(*(_QWORD **)(v1 + 536));
    sub_21DF2E824(*(_QWORD **)(v1 + 504));
    v8 = *(void **)(v1 + 456);
    if (v8)
    {
      *(_QWORD *)(v1 + 464) = v8;
      operator delete(v8);
    }
    v9 = *(void **)(v1 + 432);
    if (v9)
    {
      *(_QWORD *)(v1 + 440) = v9;
      operator delete(v9);
    }
    sub_21DF2E778((_QWORD *)(v1 + 336));
    if (*(char *)(v1 + 335) < 0)
      operator delete(*(void **)(v1 + 312));
    v10 = *(void **)(v1 + 272);
    if (v10)
    {
      *(_QWORD *)(v1 + 280) = v10;
      operator delete(v10);
    }
    v12 = *(uint64_t **)(v1 + 248);
    v11 = *(uint64_t **)(v1 + 256);
    if (v12 != v11)
    {
      do
      {
        v13 = *v12;
        if (*v12)
        {
          v15 = *(uint64_t **)(v13 + 176);
          v14 = *(uint64_t **)(v13 + 184);
          if (v15 != v14)
          {
            do
            {
              v16 = *v15;
              if (*v15)
              {
                sub_21DF9EF70(v16 + 72);
                v32 = (void **)(v16 + 48);
                sub_21DF9E78C(&v32);
                if (*(char *)(v16 + 47) < 0)
                  operator delete(*(void **)(v16 + 24));
                if (*(char *)(v16 + 23) < 0)
                  operator delete(*(void **)v16);
                MEMORY[0x2207A7960](v16, 0x10B2C40EE200C30);
                v14 = *(uint64_t **)(v13 + 184);
              }
              ++v15;
            }
            while (v15 != v14);
            v15 = *(uint64_t **)(v13 + 176);
          }
          if (v15)
          {
            *(_QWORD *)(v13 + 184) = v15;
            operator delete(v15);
          }
          sub_21DF253BC(*(char **)(v13 + 160));
          sub_21DF9EF70(v13 + 72);
          v32 = (void **)(v13 + 48);
          sub_21DF9E78C(&v32);
          if (*(char *)(v13 + 47) < 0)
            operator delete(*(void **)(v13 + 24));
          if (*(char *)(v13 + 23) < 0)
            operator delete(*(void **)v13);
          MEMORY[0x2207A7960](v13, 0x10B2C401A85D49FLL);
          v11 = *(uint64_t **)(v1 + 256);
        }
        ++v12;
      }
      while (v12 != v11);
      v12 = *(uint64_t **)(v1 + 248);
    }
    if (v12)
    {
      *(_QWORD *)(v1 + 256) = v12;
      operator delete(v12);
    }
    sub_21DF253BC(*(char **)(v1 + 232));
    v18 = *(uint64_t **)(v1 + 200);
    v17 = *(uint64_t **)(v1 + 208);
    if (v18 != v17)
    {
      do
      {
        v19 = *v18;
        if (*v18)
        {
          v21 = *(uint64_t **)(v19 + 208);
          v20 = *(uint64_t **)(v19 + 216);
          if (v21 != v20)
          {
            do
            {
              v22 = *v21;
              if (*v21)
              {
                sub_21DF9EF70(v22 + 88);
                v32 = (void **)(v22 + 24);
                sub_21DF9E78C(&v32);
                if (*(char *)(v22 + 23) < 0)
                  operator delete(*(void **)v22);
                MEMORY[0x2207A7960](v22, 0x10B2C4072A4B994);
                v20 = *(uint64_t **)(v19 + 216);
              }
              ++v21;
            }
            while (v21 != v20);
            v21 = *(uint64_t **)(v19 + 208);
          }
          if (v21)
          {
            *(_QWORD *)(v19 + 216) = v21;
            operator delete(v21);
          }
          sub_21DF253BC(*(char **)(v19 + 192));
          sub_21DF9EF70(v19 + 72);
          v32 = (void **)(v19 + 48);
          sub_21DF9E78C(&v32);
          if (*(char *)(v19 + 47) < 0)
            operator delete(*(void **)(v19 + 24));
          if (*(char *)(v19 + 23) < 0)
            operator delete(*(void **)v19);
          MEMORY[0x2207A7960](v19, 0x10B2C409EE52067);
          v17 = *(uint64_t **)(v1 + 208);
        }
        ++v18;
      }
      while (v18 != v17);
      v18 = *(uint64_t **)(v1 + 200);
    }
    if (v18)
    {
      *(_QWORD *)(v1 + 208) = v18;
      operator delete(v18);
    }
    sub_21DF253BC(*(char **)(v1 + 184));
    v24 = *(uint64_t **)(v1 + 152);
    v23 = *(uint64_t **)(v1 + 160);
    if (v24 != v23)
    {
      do
      {
        v25 = *v24;
        if (*v24)
        {
          v26 = *(_QWORD *)(v25 + 224);
          *(_QWORD *)(v25 + 224) = 0;
          if (v26)
          {
            if (*(char *)(v26 + 23) < 0)
              operator delete(*(void **)v26);
            MEMORY[0x2207A7960](v26, 0x1012C40EC159624);
          }
          v28 = *(uint64_t **)(v25 + 176);
          v27 = *(uint64_t **)(v25 + 184);
          if (v28 != v27)
          {
            do
            {
              v29 = *v28;
              if (*v28)
              {
                if (*(char *)(v29 + 207) < 0)
                  operator delete(*(void **)(v29 + 184));
                sub_21DF9EF70(v29 + 72);
                v32 = (void **)(v29 + 48);
                sub_21DF9E78C(&v32);
                if (*(char *)(v29 + 47) < 0)
                  operator delete(*(void **)(v29 + 24));
                if (*(char *)(v29 + 23) < 0)
                  operator delete(*(void **)v29);
                MEMORY[0x2207A7960](v29, 0x10B2C40559199D4);
                v27 = *(uint64_t **)(v25 + 184);
              }
              ++v28;
            }
            while (v28 != v27);
            v28 = *(uint64_t **)(v25 + 176);
          }
          if (v28)
          {
            *(_QWORD *)(v25 + 184) = v28;
            operator delete(v28);
          }
          sub_21DF253BC(*(char **)(v25 + 160));
          sub_21DF9EF70(v25 + 72);
          v32 = (void **)(v25 + 48);
          sub_21DF9E78C(&v32);
          if (*(char *)(v25 + 47) < 0)
            operator delete(*(void **)(v25 + 24));
          if (*(char *)(v25 + 23) < 0)
            operator delete(*(void **)v25);
          MEMORY[0x2207A7960](v25, 0x10B2C4058EA06FBLL);
          v23 = *(uint64_t **)(v1 + 160);
        }
        ++v24;
      }
      while (v24 != v23);
      v24 = *(uint64_t **)(v1 + 152);
    }
    if (v24)
    {
      *(_QWORD *)(v1 + 160) = v24;
      operator delete(v24);
    }
    sub_21DF253BC(*(char **)(v1 + 136));
    v31 = *(_QWORD **)(v1 + 104);
    v30 = *(_QWORD **)(v1 + 112);
    if (v31 != v30)
    {
      do
      {
        if (*v31)
        {
          MEMORY[0x2207A7960](*v31, 0x1020C4001A1C0B8);
          v30 = *(_QWORD **)(v1 + 112);
        }
        ++v31;
      }
      while (v31 != v30);
      v31 = *(_QWORD **)(v1 + 104);
    }
    if (v31)
    {
      *(_QWORD *)(v1 + 112) = v31;
      operator delete(v31);
    }
    sub_21DF253BC(*(char **)(v1 + 88));
    v32 = (void **)(v1 + 56);
    sub_21DF9E78C(&v32);
    if (*(char *)(v1 + 55) < 0)
      operator delete(*(void **)(v1 + 32));
    JUMPOUT(0x2207A7960);
  }
  return result;
}

void sub_21DF9EF20(char *a1)
{
  if (a1)
  {
    sub_21DF9EF20(*(_QWORD *)a1);
    sub_21DF9EF20(*((_QWORD *)a1 + 1));
    sub_21DF253BC(*((char **)a1 + 8));
    if (a1[55] < 0)
      operator delete(*((void **)a1 + 4));
    operator delete(a1);
  }
}

uint64_t sub_21DF9EF70(uint64_t a1)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;

  v3 = *(uint64_t **)(a1 + 24);
  v2 = *(uint64_t **)(a1 + 32);
  if (v3 != v2)
  {
    do
    {
      v4 = *v3;
      if (*v3)
      {
        if (*(char *)(v4 + 55) < 0)
          operator delete(*(void **)(v4 + 32));
        MEMORY[0x2207A7960](v4, 0x1032C40E9BF265ALL);
        v2 = *(uint64_t **)(a1 + 32);
      }
      ++v3;
    }
    while (v3 != v2);
    v3 = *(uint64_t **)(a1 + 24);
  }
  if (v3)
  {
    *(_QWORD *)(a1 + 32) = v3;
    operator delete(v3);
  }
  sub_21DF253BC(*(char **)(a1 + 8));
  return a1;
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x24BDBBA80](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x24BDBBAA8](bundleID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x24BDBC798](anURL, pathStyle);
}

uint64_t LLVMAGXRuntimeMajorVersion()
{
  return MEMORY[0x24BED4EB0]();
}

uint64_t LLVMAGXRuntimeMinorVersion()
{
  return MEMORY[0x24BED4EB8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t flatbuffers::GenerateText()
{
  return MEMORY[0x24BEDC498]();
}

uint64_t flatbuffers::Parser::Deserialize(flatbuffers::Parser *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BEDC4A0](this, a2);
}

uint64_t llvm::AllocaInst::AllocaInst()
{
  return MEMORY[0x24BED5288]();
}

uint64_t llvm::BasicBlock::eraseFromParent(llvm::BasicBlock *this)
{
  return MEMORY[0x24BED52A8](this);
}

uint64_t llvm::BasicBlock::splitBasicBlock()
{
  return MEMORY[0x24BED52B0]();
}

uint64_t llvm::BasicBlock::dropAllReferences(llvm::BasicBlock *this)
{
  return MEMORY[0x24BED52B8](this);
}

uint64_t llvm::BasicBlock::removePredecessor(llvm::BasicBlock *this, llvm::BasicBlock *a2)
{
  return MEMORY[0x24BED52C0](this, a2);
}

uint64_t llvm::BasicBlock::BasicBlock()
{
  return MEMORY[0x24BED52C8]();
}

uint64_t llvm::BranchInst::BranchInst()
{
  return MEMORY[0x24BED52D8]();
}

{
  return MEMORY[0x24BED52E8]();
}

uint64_t llvm::ConstantFP::get()
{
  return MEMORY[0x24BED5310]();
}

uint64_t llvm::DILocation::getImpl()
{
  return MEMORY[0x24BED5328]();
}

uint64_t llvm::DataLayout::reset()
{
  return MEMORY[0x24BED5338]();
}

void llvm::DataLayout::~DataLayout(llvm::DataLayout *this)
{
  MEMORY[0x24BED5348](this);
}

void llvm::ModulePass::~ModulePass(llvm::ModulePass *this)
{
  MEMORY[0x24BED5360](this);
}

uint64_t llvm::ReturnInst::ReturnInst()
{
  return MEMORY[0x24BED5388]();
}

uint64_t llvm::StructType::get()
{
  return MEMORY[0x24BED53A0]();
}

{
  return MEMORY[0x24BED53A8]();
}

uint64_t llvm::StructType::create()
{
  return MEMORY[0x24BED53C0]();
}

uint64_t llvm::StructType::setBody()
{
  return MEMORY[0x24BED53D0]();
}

uint64_t llvm::SwitchInst::addCase()
{
  return MEMORY[0x24BED53E0]();
}

uint64_t llvm::SwitchInst::SwitchInst()
{
  return MEMORY[0x24BED53E8]();
}

uint64_t llvm::UndefValue::get()
{
  return MEMORY[0x24BED5418]();
}

uint64_t llvm::VectorType::get()
{
  return MEMORY[0x24BED5420]();
}

uint64_t llvm::APFloatBase::IEEEdouble(llvm::APFloatBase *this)
{
  return MEMORY[0x24BED5430](this);
}

uint64_t llvm::APFloatBase::PPCDoubleDouble(llvm::APFloatBase *this)
{
  return MEMORY[0x24BED5450](this);
}

uint64_t llvm::BitCastInst::BitCastInst()
{
  return MEMORY[0x24BED5520]();
}

uint64_t llvm::ConstantInt::get()
{
  return MEMORY[0x24BED5538]();
}

{
  return MEMORY[0x24BED5548]();
}

uint64_t llvm::ConstantInt::getSigned()
{
  return MEMORY[0x24BED5580]();
}

uint64_t llvm::Instruction::moveBefore()
{
  return MEMORY[0x24BED55D0]();
}

uint64_t llvm::Instruction::insertAfter()
{
  return MEMORY[0x24BED55E0]();
}

uint64_t llvm::Instruction::setMetadata()
{
  return MEMORY[0x24BED55F0]();
}

uint64_t llvm::Instruction::insertBefore()
{
  return MEMORY[0x24BED5600]();
}

uint64_t llvm::Instruction::eraseFromParent(llvm::Instruction *this)
{
  return MEMORY[0x24BED5608](this);
}

uint64_t llvm::Instruction::setFastMathFlags()
{
  return MEMORY[0x24BED5618]();
}

uint64_t llvm::Instruction::setHasApproxFunc(llvm::Instruction *this)
{
  return MEMORY[0x24BED5620](this);
}

uint64_t llvm::Instruction::setHasAllowReassoc(llvm::Instruction *this)
{
  return MEMORY[0x24BED5628](this);
}

uint64_t llvm::Instruction::setFast(llvm::Instruction *this)
{
  return MEMORY[0x24BED5650](this);
}

uint64_t llvm::Instruction::Instruction()
{
  return MEMORY[0x24BED5660]();
}

uint64_t llvm::IntegerType::get()
{
  return MEMORY[0x24BED5670]();
}

uint64_t llvm::LLVMContext::setLLVMRemarkStreamer()
{
  return MEMORY[0x24BED5690]();
}

uint64_t llvm::LLVMContext::LLVMContext(llvm::LLVMContext *this)
{
  return MEMORY[0x24BED56C8](this);
}

void llvm::LLVMContext::~LLVMContext(llvm::LLVMContext *this)
{
  MEMORY[0x24BED56D8](this);
}

uint64_t llvm::NamedMDNode::addOperand()
{
  return MEMORY[0x24BED56E8]();
}

uint64_t llvm::NamedMDNode::eraseFromParent(llvm::NamedMDNode *this)
{
  return MEMORY[0x24BED5700](this);
}

uint64_t llvm::PointerType::get()
{
  return MEMORY[0x24BED5758]();
}

uint64_t llvm::PointerType::get(llvm::PointerType *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x24BED5760](this, a2);
}

uint64_t llvm::ValueMapper::mapConstant()
{
  return MEMORY[0x24BED5790]();
}

uint64_t llvm::ValueMapper::remapInstruction(llvm::ValueMapper *this, llvm::Instruction *a2)
{
  return MEMORY[0x24BED57A0](this, a2);
}

uint64_t llvm::ValueMapper::ValueMapper()
{
  return MEMORY[0x24BED57B0]();
}

void llvm::ValueMapper::~ValueMapper(llvm::ValueMapper *this)
{
  MEMORY[0x24BED57B8](this);
}

uint64_t llvm::raw_ostream::flush_nonempty(llvm::raw_ostream *this)
{
  return MEMORY[0x24BED57C8](this);
}

uint64_t llvm::raw_ostream::SetBufferAndMode()
{
  return MEMORY[0x24BED57D0]();
}

uint64_t llvm::raw_ostream::write(llvm::raw_ostream *this, const char *a2)
{
  return MEMORY[0x24BED57D8](this, a2);
}

void llvm::raw_ostream::~raw_ostream(llvm::raw_ostream *this)
{
  MEMORY[0x24BED57F8](this);
}

uint64_t llvm::ConstantExpr::getBitCast()
{
  return MEMORY[0x24BED5878]();
}

uint64_t llvm::ConstantExpr::getIntToPtr()
{
  return MEMORY[0x24BED5880]();
}

uint64_t llvm::ConstantExpr::getPtrToInt()
{
  return MEMORY[0x24BED5888]();
}

uint64_t llvm::ConstantExpr::getPointerCast()
{
  return MEMORY[0x24BED58A0]();
}

uint64_t llvm::ConstantExpr::getGetElementPtr()
{
  return MEMORY[0x24BED58B8]();
}

uint64_t llvm::FunctionType::get()
{
  return MEMORY[0x24BED5920]();
}

{
  return MEMORY[0x24BED5928]();
}

uint64_t llvm::GlobalObject::setSection()
{
  return MEMORY[0x24BED5930]();
}

uint64_t llvm::GlobalObject::setAlignment()
{
  return MEMORY[0x24BED5940]();
}

uint64_t llvm::IntEqClasses::uncompress(llvm::IntEqClasses *this)
{
  return MEMORY[0x24BED5960](this);
}

uint64_t llvm::IntEqClasses::grow(llvm::IntEqClasses *this)
{
  return MEMORY[0x24BED5968](this);
}

uint64_t llvm::IntEqClasses::join(llvm::IntEqClasses *this)
{
  return MEMORY[0x24BED5970](this);
}

uint64_t llvm::IntEqClasses::compress(llvm::IntEqClasses *this)
{
  return MEMORY[0x24BED5978](this);
}

uint64_t llvm::MemoryBuffer::getMemBuffer()
{
  return MEMORY[0x24BED5990]();
}

uint64_t llvm::PassRegistry::getPassRegistry(llvm::PassRegistry *this)
{
  return MEMORY[0x24BED59B8](this);
}

uint64_t llvm::verifyModule()
{
  return MEMORY[0x24BED59F0]();
}

uint64_t llvm::AtomicRMWInst::AtomicRMWInst()
{
  return MEMORY[0x24BED5A00]();
}

uint64_t llvm::AttributeList::get()
{
  return MEMORY[0x24BED5A10]();
}

uint64_t llvm::ConstantArray::get()
{
  return MEMORY[0x24BED5A30]();
}

uint64_t llvm::GetStatistics(llvm *this)
{
  return MEMORY[0x24BED5A48](this);
}

uint64_t llvm::IRBuilderBase::CreateSelect()
{
  return MEMORY[0x24BED5A68]();
}

uint64_t llvm::IRBuilderBase::CreateFCmpHelper()
{
  return MEMORY[0x24BED5A90]();
}

uint64_t llvm::IRBuilderBase::CreateConstrainedFPCast()
{
  return MEMORY[0x24BED5AE0]();
}

uint64_t llvm::IRBuilderBase::CreateConstrainedFPBinOp()
{
  return MEMORY[0x24BED5AE8]();
}

uint64_t llvm::StringMapImpl::RehashTable(llvm::StringMapImpl *this)
{
  return MEMORY[0x24BED5B28](this);
}

uint64_t llvm::StringMapImpl::LookupBucketFor()
{
  return MEMORY[0x24BED5B30]();
}

uint64_t llvm::StringMapImpl::RemoveKey()
{
  return MEMORY[0x24BED5B40]();
}

uint64_t llvm::UnaryOperator::Create()
{
  return MEMORY[0x24BED5B58]();
}

uint64_t llvm::getNamedTimer()
{
  return MEMORY[0x24BED5B60]();
}

uint64_t llvm::initializeIPO(llvm *this, llvm::PassRegistry *a2)
{
  return MEMORY[0x24BED5B68](this, a2);
}

uint64_t llvm::BinaryOperator::Create()
{
  return MEMORY[0x24BED5B78]();
}

uint64_t llvm::BinaryOperator::CreateNeg()
{
  return MEMORY[0x24BED5B80]();
}

uint64_t llvm::BinaryOperator::CreateNot()
{
  return MEMORY[0x24BED5B88]();
}

uint64_t llvm::ConstantStruct::get()
{
  return MEMORY[0x24BED5BA0]();
}

uint64_t llvm::ConstantVector::get()
{
  return MEMORY[0x24BED5BA8]();
}

uint64_t llvm::GlobalVariable::setInitializer()
{
  return MEMORY[0x24BED5BF8]();
}

uint64_t llvm::GlobalVariable::eraseFromParent(llvm::GlobalVariable *this)
{
  return MEMORY[0x24BED5C00](this);
}

uint64_t llvm::GlobalVariable::copyAttributesFrom(llvm::GlobalVariable *this, const llvm::GlobalVariable *a2)
{
  return MEMORY[0x24BED5C18](this, a2);
}

uint64_t llvm::GlobalVariable::GlobalVariable()
{
  return MEMORY[0x24BED5C28]();
}

uint64_t llvm::createSROAPass(llvm *this)
{
  return MEMORY[0x24BED5C98](this);
}

uint64_t llvm::initializeCore(llvm *this, llvm::PassRegistry *a2)
{
  return MEMORY[0x24BED5CB0](this, a2);
}

uint64_t llvm::FixedVectorType::get()
{
  return MEMORY[0x24BED5D38]();
}

void llvm::IRBuilderFolder::~IRBuilderFolder(llvm::IRBuilderFolder *this)
{
  MEMORY[0x24BED5D40](this);
}

uint64_t llvm::InsertValueInst::init()
{
  return MEMORY[0x24BED5D48]();
}

uint64_t llvm::ResetStatistics(llvm *this)
{
  return MEMORY[0x24BED5F18](this);
}

uint64_t llvm::SmallVectorBase<unsigned int>::mallocForGrow()
{
  return off_24E1E6960();
}

uint64_t llvm::SmallVectorBase<unsigned int>::grow_pod()
{
  return off_24E1E6968();
}

uint64_t llvm::SmallVectorBase<unsigned long long>::grow_pod()
{
  return off_24E1E6970();
}

uint64_t llvm::ValueAsMetadata::get()
{
  return MEMORY[0x24BED5F70]();
}

uint64_t llvm::ValueHandleBase::AddToUseList(llvm::ValueHandleBase *this)
{
  return MEMORY[0x24BED5F78](this);
}

uint64_t llvm::ValueHandleBase::RemoveFromUseList(llvm::ValueHandleBase *this)
{
  return MEMORY[0x24BED5F80](this);
}

uint64_t llvm::ValueHandleBase::AddToExistingUseList(llvm::ValueHandleBase *this, llvm::ValueHandleBase **a2)
{
  return MEMORY[0x24BED5F88](this, a2);
}

uint64_t llvm::allocate_buffer(llvm *this)
{
  return MEMORY[0x24BED5F90](this);
}

uint64_t llvm::EnableStatistics(llvm *this)
{
  return MEMORY[0x24BED5FA0](this);
}

uint64_t llvm::ExtractValueInst::getIndexedType()
{
  return MEMORY[0x24BED5FA8]();
}

uint64_t llvm::ExtractValueInst::init()
{
  return MEMORY[0x24BED5FB0]();
}

uint64_t llvm::MetadataTracking::track()
{
  return MEMORY[0x24BED5FD8]();
}

uint64_t llvm::MetadataTracking::retrack()
{
  return MEMORY[0x24BED5FE0]();
}

uint64_t llvm::MetadataTracking::untrack()
{
  return MEMORY[0x24BED5FE8]();
}

uint64_t llvm::NamedRegionTimer::NamedRegionTimer()
{
  return MEMORY[0x24BED5FF0]();
}

uint64_t llvm::enableTimePasses(llvm *this)
{
  return MEMORY[0x24BED6028](this);
}

uint64_t llvm::initializeTarget(llvm *this, llvm::PassRegistry *a2)
{
  return MEMORY[0x24BED6040](this, a2);
}

uint64_t llvm::parseBitcodeFile()
{
  return MEMORY[0x24BED6050]();
}

uint64_t llvm::AtomicCmpXchgInst::AtomicCmpXchgInst()
{
  return MEMORY[0x24BED6068]();
}

uint64_t llvm::GetElementPtrInst::setIsInBounds(llvm::GetElementPtrInst *this)
{
  return MEMORY[0x24BED60A0](this);
}

uint64_t llvm::GetElementPtrInst::getIndexedType()
{
  return MEMORY[0x24BED60A8]();
}

uint64_t llvm::GetElementPtrInst::init()
{
  return MEMORY[0x24BED60B8]();
}

uint64_t llvm::InsertElementInst::InsertElementInst()
{
  return MEMORY[0x24BED60C8]();
}

uint64_t llvm::ShuffleVectorInst::getShuffleMask()
{
  return MEMORY[0x24BED60F8]();
}

uint64_t llvm::ShuffleVectorInst::ShuffleVectorInst()
{
  return MEMORY[0x24BED6100]();
}

uint64_t llvm::deallocate_buffer(llvm *this, void *a2)
{
  return MEMORY[0x24BED6130](this, a2);
}

uint64_t llvm::ConstantDataVector::getSplat()
{
  return MEMORY[0x24BED6170]();
}

uint64_t llvm::ExtractElementInst::ExtractElementInst()
{
  return MEMORY[0x24BED6190]();
}

uint64_t llvm::initializeAnalysis(llvm *this, llvm::PassRegistry *a2)
{
  return MEMORY[0x24BED6208](this, a2);
}

uint64_t llvm::ConstantPointerNull::get(llvm::ConstantPointerNull *this, llvm::PointerType *a2)
{
  return MEMORY[0x24BED6228](this, a2);
}

uint64_t llvm::SmallPtrSetImplBase::insert_imp_big(llvm::SmallPtrSetImplBase *this, const void *a2)
{
  return MEMORY[0x24BED6260](this, a2);
}

uint64_t llvm::SmallPtrSetImplBase::CopyFrom(llvm::SmallPtrSetImplBase *this, const llvm::SmallPtrSetImplBase *a2)
{
  return MEMORY[0x24BED6278](this, a2);
}

uint64_t llvm::createGlobalDCEPass(llvm *this)
{
  return MEMORY[0x24BED62A8](this);
}

uint64_t llvm::parseAssemblyString()
{
  return MEMORY[0x24BED62D0]();
}

uint64_t llvm::initializeScalarOpts(llvm *this, llvm::PassRegistry *a2)
{
  return MEMORY[0x24BED6368](this, a2);
}

uint64_t llvm::SymbolTableListTraits<llvm::BasicBlock>::transferNodesFromList()
{
  return off_24E1E6A78();
}

uint64_t llvm::SymbolTableListTraits<llvm::Instruction>::addNodeToList()
{
  return off_24E1E6A80();
}

uint64_t llvm::SymbolTableListTraits<llvm::Function>::addNodeToList()
{
  return off_24E1E6A88();
}

uint64_t llvm::SymbolTableListTraits<llvm::Function>::removeNodeFromList()
{
  return off_24E1E6A90();
}

uint64_t llvm::initializeInstCombine(llvm *this, llvm::PassRegistry *a2)
{
  return MEMORY[0x24BED63F0](this, a2);
}

uint64_t llvm::ConstantFoldTerminator()
{
  return MEMORY[0x24BED6400]();
}

uint64_t llvm::initializeVectorization(llvm *this, llvm::PassRegistry *a2)
{
  return MEMORY[0x24BED64C8](this, a2);
}

void llvm::IRBuilderDefaultInserter::~IRBuilderDefaultInserter(llvm::IRBuilderDefaultInserter *this)
{
  MEMORY[0x24BED64D8](this);
}

uint64_t llvm::initializeTransformUtils(llvm *this, llvm::PassRegistry *a2)
{
  return MEMORY[0x24BED6520](this, a2);
}

uint64_t llvm::MergeBlockIntoPredecessor()
{
  return MEMORY[0x24BED6528]();
}

uint64_t llvm::createGlobalOptimizerPass(llvm *this)
{
  return MEMORY[0x24BED6538](this);
}

uint64_t llvm::TargetLibraryInfoWrapperPass::TargetLibraryInfoWrapperPass()
{
  return MEMORY[0x24BED65C8]();
}

uint64_t llvm::createAlwaysInlinerLegacyPass(llvm *this)
{
  return MEMORY[0x24BED65F0](this);
}

uint64_t llvm::createDeadCodeEliminationPass(llvm *this)
{
  return MEMORY[0x24BED65F8](this);
}

uint64_t llvm::createInstructionCombiningPass(llvm *this)
{
  return MEMORY[0x24BED6640](this);
}

uint64_t llvm::AGX::AGXCompiler::createCompilePlan()
{
  return MEMORY[0x24BED6660]();
}

uint64_t llvm::AGX::AGXCompiler::getLastDiagnostics(llvm::AGX::AGXCompiler *this)
{
  return MEMORY[0x24BED6668](this);
}

uint64_t llvm::AGX::AGXCompiler::create()
{
  return MEMORY[0x24BED6670]();
}

uint64_t llvm::AGX::AGXCompiler::AGXCompiler()
{
  return MEMORY[0x24BED6678]();
}

void llvm::AGX::AGXCompiler::~AGXCompiler(llvm::AGX::AGXCompiler *this)
{
  MEMORY[0x24BED6680](this);
}

uint64_t llvm::AGX::CompileReply::getDiagnostics(llvm::AGX::CompileReply *this)
{
  return MEMORY[0x24BED6688](this);
}

uint64_t llvm::AGX::CompileReply::getBinary(llvm::AGX::CompileReply *this)
{
  return MEMORY[0x24BED6690](this);
}

uint64_t llvm::AGX::CompileReply::CompileReply()
{
  return MEMORY[0x24BED6698]();
}

void llvm::AGX::CompileReply::~CompileReply(llvm::AGX::CompileReply *this)
{
  MEMORY[0x24BED66A0](this);
}

uint64_t llvm::AGX::AGXCompilePlan::execute()
{
  return MEMORY[0x24BED66A8]();
}

uint64_t llvm::AGX::AGXCompilePlan::AGXCompilePlan()
{
  return MEMORY[0x24BED66B0]();
}

void llvm::AGX::AGXCompilePlan::~AGXCompilePlan(llvm::AGX::AGXCompilePlan *this)
{
  MEMORY[0x24BED66B8](this);
}

uint64_t llvm::AGX::CompileRequest::addDMAListEntry(llvm::AGX::CompileRequest *this)
{
  return MEMORY[0x24BED66C0](this);
}

uint64_t llvm::AGX::CompileRequest::setLoggingStream()
{
  return MEMORY[0x24BED66C8]();
}

uint64_t llvm::AGX::CompileRequest::CompileRequest()
{
  return MEMORY[0x24BED66D0]();
}

void llvm::AGX::CompileRequest::~CompileRequest(llvm::AGX::CompileRequest *this)
{
  MEMORY[0x24BED66D8](this);
}

uint64_t llvm::AGX::operator<<()
{
  return MEMORY[0x24BED66E0]();
}

{
  return MEMORY[0x24BED66E8]();
}

uint64_t llvm::RecursivelyDeleteTriviallyDeadInstructions()
{
  return MEMORY[0x24BED6B60]();
}

uint64_t llvm::Type::getFloatTy(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x24BED6BA0](this, a2);
}

uint64_t llvm::Type::getInt16Ty(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x24BED6BA8](this, a2);
}

uint64_t llvm::Type::getInt32Ty(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x24BED6BB0](this, a2);
}

uint64_t llvm::Type::getInt64Ty(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x24BED6BB8](this, a2);
}

uint64_t llvm::Type::getInt8PtrTy(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x24BED6BD0](this, a2);
}

uint64_t llvm::Type::getInt32PtrTy(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x24BED6BF0](this, a2);
}

uint64_t llvm::Type::getHalfTy(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x24BED6C10](this, a2);
}

uint64_t llvm::Type::getInt1Ty(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x24BED6C18](this, a2);
}

uint64_t llvm::Type::getInt8Ty(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x24BED6C20](this, a2);
}

uint64_t llvm::Type::getVoidTy(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x24BED6C30](this, a2);
}

uint64_t llvm::User::getDescriptor(llvm::User *this)
{
  return MEMORY[0x24BED6C38](this);
}

uint64_t llvm::User::allocHungoffUses(llvm::User *this)
{
  return MEMORY[0x24BED6C40](this);
}

uint64_t llvm::User::operator new(llvm::User *this)
{
  return MEMORY[0x24BED6C58](this);
}

{
  return MEMORY[0x24BED6C60](this);
}

{
  return MEMORY[0x24BED6C68](this);
}

uint64_t llvm::errs(llvm *this)
{
  return MEMORY[0x24BED6C78](this);
}

void llvm::Regex::~Regex(llvm::Regex *this)
{
  MEMORY[0x24BED6EC8](this);
}

uint64_t llvm::Timer::clear(llvm::Timer *this)
{
  return MEMORY[0x24BED6EE8](this);
}

uint64_t llvm::Timer::stopTimer(llvm::Timer *this)
{
  return MEMORY[0x24BED6EF0](this);
}

uint64_t llvm::Value::replaceAllUsesWith()
{
  return MEMORY[0x24BED6F18]();
}

uint64_t llvm::Value::setName()
{
  return MEMORY[0x24BED6F30]();
}

uint64_t llvm::Value::takeName()
{
  return MEMORY[0x24BED6F38]();
}

uint64_t llvm::Linker::linkModules()
{
  return MEMORY[0x24BED6F90]();
}

uint64_t llvm::Module::setDataLayout()
{
  return MEMORY[0x24BED7018]();
}

uint64_t llvm::Module::eraseNamedMetadata(llvm::Module *this, llvm::NamedMDNode *a2)
{
  return MEMORY[0x24BED7060](this, a2);
}

uint64_t llvm::Module::getOrInsertFunction()
{
  return MEMORY[0x24BED7068]();
}

{
  return MEMORY[0x24BED7070]();
}

uint64_t llvm::Module::getOrInsertNamedMetadata()
{
  return MEMORY[0x24BED7090]();
}

uint64_t llvm::Module::Module()
{
  return MEMORY[0x24BED70C8]();
}

void llvm::Module::~Module(llvm::Module *this)
{
  MEMORY[0x24BED70D8](this);
}

uint64_t llvm::Triple::Triple()
{
  return MEMORY[0x24BED7118]();
}

uint64_t llvm::detail::IEEEFloat::IEEEFloat(llvm::detail::IEEEFloat *this, double a2)
{
  return MEMORY[0x24BED7270](this, a2);
}

void llvm::detail::IEEEFloat::~IEEEFloat(llvm::detail::IEEEFloat *this)
{
  MEMORY[0x24BED7280](this);
}

uint64_t llvm::legacy::PassManager::run(llvm::legacy::PassManager *this, llvm::Module *a2)
{
  return MEMORY[0x24BED72A0](this, a2);
}

uint64_t llvm::legacy::PassManager::PassManager(llvm::legacy::PassManager *this)
{
  return MEMORY[0x24BED72A8](this);
}

uint64_t llvm::APFloat::Storage::Storage()
{
  return MEMORY[0x24BED7338]();
}

uint64_t llvm::APFloat::convert()
{
  return MEMORY[0x24BED7340]();
}

uint64_t llvm::CmpInst::CmpInst()
{
  return MEMORY[0x24BED7348]();
}

uint64_t llvm::MDTuple::getImpl()
{
  return MEMORY[0x24BED7350]();
}

uint64_t llvm::PHINode::growOperands(llvm::PHINode *this)
{
  return MEMORY[0x24BED7360](this);
}

uint64_t llvm::parseIR()
{
  return MEMORY[0x24BED7370]();
}

uint64_t llvm::remarks::RemarkStreamer::RemarkStreamer()
{
  return MEMORY[0x24BED7380]();
}

uint64_t llvm::remarks::YAMLRemarkSerializer::YAMLRemarkSerializer()
{
  return MEMORY[0x24BED7388]();
}

uint64_t llvm::CallInst::init()
{
  return MEMORY[0x24BED73B8]();
}

uint64_t llvm::CastInst::CreateFPCast()
{
  return MEMORY[0x24BED73C8]();
}

uint64_t llvm::CastInst::CreateIntegerCast()
{
  return MEMORY[0x24BED73D8]();
}

uint64_t llvm::CastInst::CreatePointerCast()
{
  return MEMORY[0x24BED73E0]();
}

uint64_t llvm::CastInst::CreateTruncOrBitCast()
{
  return MEMORY[0x24BED73F8]();
}

uint64_t llvm::CastInst::Create()
{
  return MEMORY[0x24BED7408]();
}

uint64_t llvm::Constant::getNullValue(llvm::Constant *this, llvm::Type *a2)
{
  return MEMORY[0x24BED7410](this, a2);
}

uint64_t llvm::Constant::getAllOnesValue(llvm::Constant *this, llvm::Type *a2)
{
  return MEMORY[0x24BED7420](this, a2);
}

uint64_t llvm::DebugLoc::DebugLoc()
{
  return MEMORY[0x24BED7440]();
}

uint64_t llvm::Function::addParamAttr()
{
  return MEMORY[0x24BED7458]();
}

uint64_t llvm::Function::removeFnAttr()
{
  return MEMORY[0x24BED7468]();
}

uint64_t llvm::Function::setSubprogram()
{
  return MEMORY[0x24BED7490]();
}

uint64_t llvm::Function::eraseFromParent(llvm::Function *this)
{
  return MEMORY[0x24BED7498](this);
}

uint64_t llvm::Function::addFnAttr()
{
  return MEMORY[0x24BED74D0]();
}

{
  return MEMORY[0x24BED74E0]();
}

uint64_t llvm::LoadInst::LoadInst()
{
  return MEMORY[0x24BED74F0]();
}

uint64_t llvm::MDString::get()
{
  return MEMORY[0x24BED74F8]();
}

uint64_t llvm::ArrayType::get(llvm::ArrayType *this, llvm::Type *a2)
{
  return MEMORY[0x24BED7548](this, a2);
}

uint64_t llvm::StoreInst::StoreInst()
{
  return MEMORY[0x24BED7870]();
}

uint64_t llvm::BasicBlock::getFirstNonPHI(llvm::BasicBlock *this)
{
  return MEMORY[0x24BED78A8](this);
}

uint64_t llvm::BasicBlock::getFirstInsertionPt(llvm::BasicBlock *this)
{
  return MEMORY[0x24BED78C8](this);
}

uint64_t llvm::BasicBlock::getSinglePredecessor(llvm::BasicBlock *this)
{
  return MEMORY[0x24BED78D8](this);
}

uint64_t llvm::BasicBlock::getModule(llvm::BasicBlock *this)
{
  return MEMORY[0x24BED78E8](this);
}

uint64_t llvm::ConstantFP::isExactlyValue()
{
  return MEMORY[0x24BED78F0]();
}

uint64_t llvm::DataLayout::getABITypeAlign(llvm::DataLayout *this, llvm::Type *a2)
{
  return MEMORY[0x24BED7928](this, a2);
}

uint64_t llvm::DataLayout::getStructLayout()
{
  return MEMORY[0x24BED7930]();
}

uint64_t llvm::DataLayout::getPrefTypeAlign(llvm::DataLayout *this, llvm::Type *a2)
{
  return MEMORY[0x24BED7938](this, a2);
}

uint64_t llvm::DataLayout::getABITypeAlignment(llvm::DataLayout *this, llvm::Type *a2)
{
  return MEMORY[0x24BED7940](this, a2);
}

uint64_t llvm::DataLayout::getPointerAlignElem(llvm::DataLayout *this)
{
  return MEMORY[0x24BED7948](this);
}

uint64_t llvm::DataLayout::getIndexedOffsetInType()
{
  return MEMORY[0x24BED7960]();
}

uint64_t llvm::StructType::getTypeAtIndex()
{
  return MEMORY[0x24BED7970]();
}

uint64_t llvm::GEPOperator::getSourceElementType(llvm::GEPOperator *this)
{
  return MEMORY[0x24BED7988](this);
}

uint64_t llvm::GlobalValue::isDeclaration(llvm::GlobalValue *this)
{
  return MEMORY[0x24BED79A8](this);
}

uint64_t llvm::GlobalValue::hasExternalWeakLinkage(llvm::GlobalValue *this)
{
  return MEMORY[0x24BED79D0](this);
}

uint64_t llvm::Instruction::getSuccessor(llvm::Instruction *this)
{
  return MEMORY[0x24BED79E8](this);
}

uint64_t llvm::Instruction::getFastMathFlags(llvm::Instruction *this)
{
  return MEMORY[0x24BED7A00](this);
}

uint64_t llvm::Instruction::getNumSuccessors(llvm::Instruction *this)
{
  return MEMORY[0x24BED7A08](this);
}

uint64_t llvm::Instruction::clone(llvm::Instruction *this)
{
  return MEMORY[0x24BED7A20](this);
}

uint64_t llvm::NamedMDNode::getOperand(llvm::NamedMDNode *this)
{
  return MEMORY[0x24BED7A68](this);
}

uint64_t llvm::NamedMDNode::getNumOperands(llvm::NamedMDNode *this)
{
  return MEMORY[0x24BED7A70](this);
}

uint64_t llvm::AttributeSet::addAttribute()
{
  return MEMORY[0x24BED7AE0]();
}

uint64_t llvm::AttributeSet::removeAttribute()
{
  return MEMORY[0x24BED7AF0]();
}

uint64_t llvm::DILocalScope::getNonLexicalBlockFileScope(llvm::DILocalScope *this)
{
  return MEMORY[0x24BED7B28](this);
}

uint64_t llvm::GlobalObject::getSectionImpl(llvm::GlobalObject *this)
{
  return MEMORY[0x24BED7B30](this);
}

uint64_t llvm::MemoryBuffer::getMemBufferRef(llvm::MemoryBuffer *this)
{
  return MEMORY[0x24BED7B38](this);
}

uint64_t llvm::SMDiagnostic::print(llvm::SMDiagnostic *this, const char *a2, llvm::raw_ostream *a3)
{
  return MEMORY[0x24BED7B60](this, a2, a3);
}

uint64_t llvm::AttributeList::getFnAttrs(llvm::AttributeList *this)
{
  return MEMORY[0x24BED7B78](this);
}

uint64_t llvm::AttributeList::addAttributeAtIndex()
{
  return MEMORY[0x24BED7BB0]();
}

uint64_t llvm::AttributeList::hasFnAttr()
{
  return MEMORY[0x24BED7BF8]();
}

uint64_t llvm::IRBuilderBase::getCurrentDebugLocation(llvm::IRBuilderBase *this)
{
  return MEMORY[0x24BED7C00](this);
}

uint64_t llvm::StringMapImpl::FindKey()
{
  return MEMORY[0x24BED7C08]();
}

uint64_t llvm::TargetExtType::getLayoutType(llvm::TargetExtType *this)
{
  return MEMORY[0x24BED7C10](this);
}

uint64_t llvm::GetElementPtrInst::isInBounds(llvm::GetElementPtrInst *this)
{
  return MEMORY[0x24BED7C58](this);
}

uint64_t llvm::GetElementPtrInst::hasAllConstantIndices(llvm::GetElementPtrInst *this)
{
  return MEMORY[0x24BED7C60](this);
}

uint64_t llvm::SmallPtrSetImplBase::FindBucketFor(llvm::SmallPtrSetImplBase *this, const void *a2)
{
  return MEMORY[0x24BED7C98](this, a2);
}

uint64_t llvm::AGX::Diagnostic::getMessage(llvm::AGX::Diagnostic *this)
{
  return MEMORY[0x24BED7CE0](this);
}

uint64_t llvm::AGX::AGXCompiler::isValid(llvm::AGX::AGXCompiler *this)
{
  return MEMORY[0x24BED7CE8](this);
}

uint64_t llvm::AGX::CompileReply::isValid(llvm::AGX::CompileReply *this)
{
  return MEMORY[0x24BED7CF0](this);
}

uint64_t llvm::AGX::AGXCompilePlan::isValid(llvm::AGX::AGXCompilePlan *this)
{
  return MEMORY[0x24BED7CF8](this);
}

uint64_t llvm::Use::getOperandNo(llvm::Use *this)
{
  return MEMORY[0x24BED7D08](this);
}

uint64_t llvm::Type::isIntegerTy(llvm::Type *this)
{
  return MEMORY[0x24BED7DB8](this);
}

uint64_t llvm::Type::getPointerTo(llvm::Type *this)
{
  return MEMORY[0x24BED7DC0](this);
}

uint64_t llvm::Type::isSizedDerivedType()
{
  return MEMORY[0x24BED7DD8]();
}

uint64_t llvm::Type::getScalarSizeInBits(llvm::Type *this)
{
  return MEMORY[0x24BED7DE0](this);
}

uint64_t llvm::Type::getPrimitiveSizeInBits(llvm::Type *this)
{
  return MEMORY[0x24BED7DE8](this);
}

uint64_t llvm::Type::print(llvm::Type *this, llvm::raw_ostream *a2)
{
  return MEMORY[0x24BED7DF0](this, a2);
}

uint64_t llvm::APInt::countLeadingZerosSlowCase(llvm::APInt *this)
{
  return MEMORY[0x24BED7E70](this);
}

uint64_t llvm::Twine::str(llvm::Twine *this)
{
  return MEMORY[0x24BED7F78](this);
}

uint64_t llvm::Value::getContext(llvm::Value *this)
{
  return MEMORY[0x24BED7F90](this);
}

uint64_t llvm::Value::getNumUses(llvm::Value *this)
{
  return MEMORY[0x24BED7F98](this);
}

uint64_t llvm::Value::stripPointerCasts(llvm::Value *this)
{
  return MEMORY[0x24BED7FB0](this);
}

uint64_t llvm::Value::print(llvm::Value *this, llvm::raw_ostream *a2)
{
  return MEMORY[0x24BED7FD8](this, a2);
}

uint64_t llvm::Value::getName(llvm::Value *this)
{
  return MEMORY[0x24BED7FE0](this);
}

uint64_t llvm::Module::getFunction()
{
  return MEMORY[0x24BED8000]();
}

uint64_t llvm::Module::getDataLayout(llvm::Module *this)
{
  return MEMORY[0x24BED8010](this);
}

uint64_t llvm::Module::getNamedMetadata(llvm::Module *this, const llvm::Twine *a2)
{
  return MEMORY[0x24BED8038](this, a2);
}

uint64_t llvm::Module::getGlobalVariable()
{
  return MEMORY[0x24BED8040]();
}

uint64_t llvm::Module::print()
{
  return MEMORY[0x24BED8050]();
}

uint64_t llvm::Argument::hasNoAliasAttr(llvm::Argument *this)
{
  return MEMORY[0x24BED81F8](this);
}

uint64_t llvm::CallBase::paramHasAttr()
{
  return MEMORY[0x24BED8208]();
}

uint64_t llvm::CallBase::hasReadingOperandBundles(llvm::CallBase *this)
{
  return MEMORY[0x24BED8220](this);
}

uint64_t llvm::CallBase::hasFnAttrOnCalledFunction()
{
  return MEMORY[0x24BED8228]();
}

uint64_t llvm::CallBase::getNumSubclassExtraOperandsDynamic(llvm::CallBase *this)
{
  return MEMORY[0x24BED8230](this);
}

uint64_t llvm::Constant::isNullValue(llvm::Constant *this)
{
  return MEMORY[0x24BED8240](this);
}

uint64_t llvm::Constant::isZeroValue(llvm::Constant *this)
{
  return MEMORY[0x24BED8248](this);
}

uint64_t llvm::Constant::getAggregateElement(llvm::Constant *this)
{
  return MEMORY[0x24BED8268](this);
}

uint64_t llvm::Constant::removeDeadConstantUsers(llvm::Constant *this)
{
  return MEMORY[0x24BED8270](this);
}

uint64_t llvm::Function::getSubprogram(llvm::Function *this)
{
  return MEMORY[0x24BED8290](this);
}

uint64_t llvm::Function::getFnAttribute()
{
  return MEMORY[0x24BED8298]();
}

uint64_t llvm::Function::hasFnAttribute()
{
  return MEMORY[0x24BED82A0]();
}

uint64_t llvm::Function::BuildLazyArguments(llvm::Function *this)
{
  return MEMORY[0x24BED82B8](this);
}

uint64_t llvm::MDString::getString(llvm::MDString *this)
{
  return MEMORY[0x24BED82D0](this);
}

uint64_t llvm::TypeSize::operator unsigned long long()
{
  return MEMORY[0x24BED82D8]();
}

uint64_t llvm::Attribute::getValueAsString(llvm::Attribute *this)
{
  return MEMORY[0x24BED8300](this);
}

uint64_t llvm::Attribute::isStringAttribute(llvm::Attribute *this)
{
  return MEMORY[0x24BED8308](this);
}

uint64_t llvm::StringRef::find()
{
  return MEMORY[0x24BED8380]();
}

std::string::size_type std::string::find(const std::string *this, const std::string::value_type *__s, std::string::size_type __pos, std::string::size_type __n)
{
  return MEMORY[0x24BEDA9A8](this, __s, __pos, __n);
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x24BEDA9B0](this, __c, __pos);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x24BEDA9C0](this, __s);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x24BEDA9E0]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC20](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC80](this, __pos, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC88](this, __pos, __s, __n);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x24BEDACE8](this, __str, __pos, __n, __a);
}

void std::string::~string(std::string *this)
{
  MEMORY[0x24BEDACF0](this);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x24BEDADD8]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x24BEDADF0]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x24BEDADF8]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x24BEDAE50]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x24BEDAE70]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x24BEDAEE0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x24BEDAEE8]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF50]();
}

{
  return MEMORY[0x24BEDAF60]();
}

{
  return MEMORY[0x24BEDAF80]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

uint64_t std::ofstream::open()
{
  return MEMORY[0x24BEDB020]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
  MEMORY[0x24BEDB1B8](__format);
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x24BEDB330](__str, __idx, *(_QWORD *)&__base);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x24BEDB610](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x24BEDB630](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x24BEDB638]();
}

uint64_t operator delete[]()
{
  return off_24E1E71A0();
}

void operator delete(void *__p)
{
  off_24E1E71A8(__p);
}

uint64_t operator delete()
{
  return off_24E1E71B0();
}

uint64_t operator new[]()
{
  return off_24E1E71B8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24E1E71C0(__sz);
}

uint64_t operator new()
{
  return off_24E1E71C8();
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

uint64_t analytics_send_event()
{
  return MEMORY[0x24BE1A1E8]();
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x24BDAD998](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

uint64_t createCompilerHelper()
{
  return MEMORY[0x24BE63560]();
}

uint64_t deleteCompilerHelper()
{
  return MEMORY[0x24BE63568]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

int dlclose(void *__handle)
{
  return MEMORY[0x24BDAE060](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
  MEMORY[0x24BDAEEB8](__b, __pattern4, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFE60](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0358](a1, a2, a3);
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0800](object);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

