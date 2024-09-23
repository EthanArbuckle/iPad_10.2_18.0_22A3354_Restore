@implementation ContentIndexListDumpVectorIndex

uint64_t __ContentIndexListDumpVectorIndex_block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  std::ios_base *v10;
  uint64_t v11;
  _QWORD *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  const std::locale::facet *v26;
  _QWORD *v27;
  int v28;
  int v29;
  unsigned int *v30;
  const char *v31;
  size_t v32;
  size_t v33;
  std::locale::__imp *p_dst;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  _QWORD *v39;
  void *locale;
  uint64_t v41;
  const std::locale::facet *v42;
  int v43;
  _QWORD *v44;
  _QWORD *v45;
  BOOL v46;
  _QWORD *v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  _QWORD *v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  _QWORD *v58;
  _QWORD *v59;
  _QWORD *v60;
  _QWORD *v61;
  const std::locale::facet *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v66;
  uint64_t v67;
  __CFString *theString;
  _QWORD *v69;
  _QWORD *v70;
  _QWORD v71[2];
  uint64_t (*v72)(uint64_t, int);
  void *v73;
  uint64_t v74;
  _QWORD v75[2];
  uint64_t v76;
  _OWORD v77[4];
  __int128 __p;
  __int128 v79;
  uint64_t v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  std::locale __dst;
  size_t v92;
  int64_t v93;
  std::locale v94;

  v2 = *(_QWORD *)(a2 + 4896);
  if (v2)
  {
    v3 = a1[7];
    theString = (__CFString *)a1[6];
    v69 = a1;
    v90 = 0u;
    v80 = 0;
    v89 = 0u;
    v88 = 0u;
    v87 = 0u;
    v86 = 0u;
    v85 = 0u;
    v84 = 0u;
    v83 = 0u;
    v82 = 0u;
    v79 = 0u;
    __p = 0u;
    v4 = MEMORY[0x1E0DE4FD0];
    memset(v77, 0, sizeof(v77));
    v5 = MEMORY[0x1E0DE4FD0] + 104;
    v81 = MEMORY[0x1E0DE4FD0] + 104;
    v6 = (_QWORD *)MEMORY[0x1E0DE4F50];
    v7 = MEMORY[0x1E0DE4FD0] + 64;
    v8 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 16);
    v9 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 24);
    v76 = MEMORY[0x1E0DE4FD0] + 64;
    v75[0] = v8;
    *(_QWORD *)((char *)v75 + *(_QWORD *)(v8 - 24)) = v9;
    v75[1] = 0;
    v10 = (std::ios_base *)((char *)v75 + *(_QWORD *)(v75[0] - 24));
    std::ios_base::init(v10, v77);
    v10[1].__vftable = 0;
    v10[1].__fmtflags_ = -1;
    v11 = v6[5];
    v76 = v6[4];
    *(uint64_t *)((char *)&v76 + *(_QWORD *)(v76 - 24)) = v11;
    v75[0] = v6[1];
    *(_QWORD *)((char *)v75 + *(_QWORD *)(v75[0] - 24)) = v6[6];
    v81 = v5;
    v75[0] = v4 + 24;
    v76 = v7;
    std::streambuf::basic_streambuf();
    *(_QWORD *)&v77[0] = MEMORY[0x1E0DE4FB8] + 16;
    __p = 0u;
    v79 = 0u;
    LODWORD(v80) = 24;
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 0x40000000;
    v72 = __vectorIndexDiagnoseDump_block_invoke;
    v73 = &__block_descriptor_tmp_10_6120;
    v74 = v3;
    v12 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(&v76, (uint64_t)"---- IVFVectorIndex ", 20);
    v13 = *(_BYTE *)(v2 + 87);
    v66 = v2 + 64;
    if (v13 >= 0)
      v14 = v2 + 64;
    else
      v14 = *(_QWORD *)(v2 + 64);
    if (v13 >= 0)
      v15 = *(unsigned __int8 *)(v2 + 87);
    else
      v15 = *(_QWORD *)(v2 + 72);
    v16 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v12, v14, v15);
    v17 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v16, (uint64_t)" ", 1);
    v67 = v2;
    v18 = v2 + 40;
    v19 = *(char *)(v2 + 63);
    if (v19 >= 0)
      v20 = v2 + 40;
    else
      v20 = *(_QWORD *)(v2 + 40);
    if (v19 >= 0)
      v21 = *(unsigned __int8 *)(v2 + 63);
    else
      v21 = *(_QWORD *)(v2 + 48);
    v22 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v17, v20, v21);
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v22, (uint64_t)"(", 1);
    v23 = (_QWORD *)std::ostream::operator<<();
    v24 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v23, (uint64_t)")", 1);
    v25 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v24, (uint64_t)" ----", 5);
    std::ios_base::getloc((const std::ios_base *)((char *)v25 + *(_QWORD *)(*v25 - 24)));
    v26 = std::locale::use_facet(&__dst, MEMORY[0x1E0DE4A90]);
    ((void (*)(const std::locale::facet *, uint64_t))v26->__vftable[2].~facet_0)(v26, 10);
    std::locale::~locale(&__dst);
    std::ostream::put();
    std::ostream::flush();
    v27 = *(_QWORD **)(v2 + 88);
    v70 = (_QWORD *)(v2 + 96);
    if (v27 != (_QWORD *)(v2 + 96))
    {
      v28 = 0;
      v29 = 0;
      while (1)
      {
        v30 = (unsigned int *)v27[5];
        v92 = 0;
        v93 = 0;
        __dst.__locale_ = 0;
        v31 = (const char *)v72((uint64_t)v71, v30[2]);
        v32 = strlen(v31);
        if (v32 >= 0x7FFFFFFFFFFFFFF8)
          abort();
        v33 = v32;
        if (v32 >= 0x17)
        {
          v35 = (v32 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v32 | 7) != 0x17)
            v35 = v32 | 7;
          v36 = v18;
          v37 = v35 + 1;
          p_dst = (std::locale::__imp *)operator new(v35 + 1);
          v38 = v37 | 0x8000000000000000;
          v18 = v36;
          v92 = v33;
          v93 = v38;
          __dst.__locale_ = p_dst;
        }
        else
        {
          HIBYTE(v93) = v32;
          p_dst = (std::locale::__imp *)&__dst;
          if (!v32)
            goto LABEL_24;
        }
        memmove(p_dst, v31, v33);
LABEL_24:
        *((_BYTE *)p_dst + v33) = 0;
        v39 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(&v76, (uint64_t)"property: ", 10);
        if (v93 >= 0)
          locale = &__dst;
        else
          locale = __dst.__locale_;
        if (v93 >= 0)
          v41 = HIBYTE(v93);
        else
          v41 = v92;
        std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v39, (uint64_t)locale, v41);
        std::ios_base::getloc((const std::ios_base *)((char *)&v76 + *(_QWORD *)(v76 - 24)));
        v42 = std::locale::use_facet(&v94, MEMORY[0x1E0DE4A90]);
        ((void (*)(const std::locale::facet *, uint64_t))v42->__vftable[2].~facet_0)(v42, 10);
        std::locale::~locale(&v94);
        std::ostream::put();
        std::ostream::flush();
        v43 = (*(uint64_t (**)(unsigned int *, uint64_t, uint64_t *, _QWORD))(*(_QWORD *)v30 + 320))(v30, v18, &v76, 0);
        if (SHIBYTE(v93) < 0)
          operator delete(__dst.__locale_);
        v44 = (_QWORD *)v27[1];
        if (v44)
        {
          do
          {
            v45 = v44;
            v44 = (_QWORD *)*v44;
          }
          while (v44);
        }
        else
        {
          do
          {
            v45 = (_QWORD *)v27[2];
            v46 = *v45 == (_QWORD)v27;
            v27 = v45;
          }
          while (!v46);
        }
        v28 += v43;
        ++v29;
        v27 = v45;
        if (v45 == v70)
          goto LABEL_41;
      }
    }
    v28 = 0;
LABEL_41:
    v47 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(&v76, (uint64_t)"---- IVFVectorIndex ", 20);
    v48 = *(_BYTE *)(v67 + 87);
    if (v48 >= 0)
      v49 = v66;
    else
      v49 = *(_QWORD *)(v67 + 64);
    if (v48 >= 0)
      v50 = *(unsigned __int8 *)(v67 + 87);
    else
      v50 = *(_QWORD *)(v67 + 72);
    v51 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v47, v49, v50);
    v52 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v51, (uint64_t)" ", 1);
    v53 = *(char *)(v67 + 63);
    if (v53 >= 0)
      v54 = v18;
    else
      v54 = *(_QWORD *)(v67 + 40);
    if (v53 >= 0)
      v55 = *(unsigned __int8 *)(v67 + 63);
    else
      v55 = *(_QWORD *)(v67 + 48);
    v56 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v52, v54, v55);
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v56, (uint64_t)"(", 1);
    v57 = (_QWORD *)std::ostream::operator<<();
    v58 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v57, (uint64_t)")", 1);
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v58, (uint64_t)" has ", 5);
    v59 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v59, (uint64_t)" vectors in ", 12);
    v60 = (_QWORD *)std::ostream::operator<<();
    v61 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v60, (uint64_t)" indexes ----", 13);
    std::ios_base::getloc((const std::ios_base *)((char *)v61 + *(_QWORD *)(*v61 - 24)));
    v62 = std::locale::use_facet(&__dst, MEMORY[0x1E0DE4A90]);
    ((void (*)(const std::locale::facet *, uint64_t))v62->__vftable[2].~facet_0)(v62, 10);
    std::locale::~locale(&__dst);
    std::ostream::put();
    std::ostream::flush();
    std::stringbuf::str();
    if (v93 >= 0)
      v63 = (const char *)&__dst;
    else
      v63 = (const char *)__dst.__locale_;
    CFStringAppendCString(theString, v63, 0x8000100u);
    if (SHIBYTE(v93) < 0)
      operator delete(__dst.__locale_);
    v75[0] = *MEMORY[0x1E0DE4F50];
    v64 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 72);
    *(_QWORD *)((char *)v75 + *(_QWORD *)(v75[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 64);
    v76 = v64;
    *(_QWORD *)&v77[0] = MEMORY[0x1E0DE4FB8] + 16;
    if (SBYTE7(v79) < 0)
      operator delete((void *)__p);
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    MEMORY[0x1BCCB0650](&v81);
    a1 = v69;
  }
  else
  {
    v28 = 0;
  }
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) += v28;
  ++*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  return 1;
}

@end
