void std::__call_once_proxy[abi:ne180100]<std::tuple<textureTypeMap(void)::$_0 &&>>()
{
  uint64_t v0;
  uint64_t v1;
  std::string __p;
  std::string v3;
  std::string v4;
  std::string v5;
  std::string v6;
  std::string __s;
  std::string v8;
  std::string v9;
  std::string v10;
  std::string v11;
  std::string v12;
  std::string v13;
  std::string v14;
  std::string v15;
  std::string v16;
  std::string v17;
  std::string v18;
  uint64_t v19;
  std::string v20;
  uint64_t v21;
  std::string v22;
  uint64_t v23;
  std::string v24;
  uint64_t v25;
  std::string v26;
  uint64_t v27;
  std::string v28;
  uint64_t v29;
  std::string v30;
  uint64_t v31;
  std::string v32;
  uint64_t v33;
  std::string v34;
  uint64_t v35;
  std::string v36;
  uint64_t v37;
  std::string v38;
  uint64_t v39;
  std::string v40;
  uint64_t v41;
  std::string v42;
  uint64_t v43;
  std::string v44;
  uint64_t v45;
  std::string v46;
  uint64_t v47;
  std::string v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v0 = operator new();
  std::string::basic_string[abi:ne180100]<0>(&v17, "texture1d");
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v18, v17.__r_.__value_.__l.__data_, v17.__r_.__value_.__l.__size_);
  else
    v18 = v17;
  v19 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v16, "texture1d_array");
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v20, v16.__r_.__value_.__l.__data_, v16.__r_.__value_.__l.__size_);
  else
    v20 = v16;
  v21 = 1;
  std::string::basic_string[abi:ne180100]<0>(&v15, "texture2d");
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v22, v15.__r_.__value_.__l.__data_, v15.__r_.__value_.__l.__size_);
  else
    v22 = v15;
  v23 = 2;
  std::string::basic_string[abi:ne180100]<0>(&v14, "texture2d_array");
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v24, v14.__r_.__value_.__l.__data_, v14.__r_.__value_.__l.__size_);
  else
    v24 = v14;
  v25 = 3;
  std::string::basic_string[abi:ne180100]<0>(&v13, "texture3d");
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v26, v13.__r_.__value_.__l.__data_, v13.__r_.__value_.__l.__size_);
  else
    v26 = v13;
  v27 = 7;
  std::string::basic_string[abi:ne180100]<0>(&v12, "texturecube");
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v28, v12.__r_.__value_.__l.__data_, v12.__r_.__value_.__l.__size_);
  else
    v28 = v12;
  v29 = 5;
  std::string::basic_string[abi:ne180100]<0>(&v11, "texturecube_array");
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v30, v11.__r_.__value_.__l.__data_, v11.__r_.__value_.__l.__size_);
  else
    v30 = v11;
  v31 = 6;
  std::string::basic_string[abi:ne180100]<0>(&v10, "depthcube_array");
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v32, v10.__r_.__value_.__l.__data_, v10.__r_.__value_.__l.__size_);
  else
    v32 = v10;
  v33 = 0x100000006;
  std::string::basic_string[abi:ne180100]<0>(&v9, "texture2d_ms");
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v34, v9.__r_.__value_.__l.__data_, v9.__r_.__value_.__l.__size_);
  else
    v34 = v9;
  v35 = 4;
  std::string::basic_string[abi:ne180100]<0>(&v8, "texture2d_ms_array");
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v36, v8.__r_.__value_.__l.__data_, v8.__r_.__value_.__l.__size_);
  else
    v36 = v8;
  v37 = 8;
  std::string::basic_string[abi:ne180100]<0>(&__s, "depth2d_ms_array");
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v38, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
  else
    v38 = __s;
  v39 = 0x100000008;
  std::string::basic_string[abi:ne180100]<0>(&v6, "depth2d");
  if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v40, v6.__r_.__value_.__l.__data_, v6.__r_.__value_.__l.__size_);
  else
    v40 = v6;
  v41 = 0x100000002;
  std::string::basic_string[abi:ne180100]<0>(&v5, "depth2d_array");
  if (SHIBYTE(v5.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v42, v5.__r_.__value_.__l.__data_, v5.__r_.__value_.__l.__size_);
  else
    v42 = v5;
  v43 = 0x100000003;
  std::string::basic_string[abi:ne180100]<0>(&v4, "depthcube");
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v44, v4.__r_.__value_.__l.__data_, v4.__r_.__value_.__l.__size_);
  else
    v44 = v4;
  v45 = 0x100000005;
  std::string::basic_string[abi:ne180100]<0>(&v3, "depth2d_ms");
  if (SHIBYTE(v3.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v46, v3.__r_.__value_.__l.__data_, v3.__r_.__value_.__l.__size_);
  else
    v46 = v3;
  v47 = 0x100000004;
  std::string::basic_string[abi:ne180100]<0>(&__p, "texture_buffer");
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v48, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  else
    v48 = __p;
  v49 = 9;
  std::map<std::string,TextureTokenData>::map[abi:ne180100](v0, (const void **)&v18.__r_.__value_.__l.__data_, 16);
  textureTypeMap(void)::nonGlobalTextureTypeMap = v0;
  v1 = 64;
  do
  {
    if (SHIBYTE(v17.__r_.__value_.__r.__words[v1 + 1]) < 0)
      operator delete((void *)v16.__r_.__value_.__r.__words[v1 + 2]);
    v1 -= 4;
  }
  while (v1 * 8);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v3.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v3.__r_.__value_.__l.__data_);
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v4.__r_.__value_.__l.__data_);
  if (SHIBYTE(v5.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v5.__r_.__value_.__l.__data_);
  if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v6.__r_.__value_.__l.__data_);
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v8.__r_.__value_.__l.__data_);
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v9.__r_.__value_.__l.__data_);
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v10.__r_.__value_.__l.__data_);
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v11.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v13.__r_.__value_.__l.__data_);
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v15.__r_.__value_.__l.__data_);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__r_.__value_.__l.__data_);
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);
}

void sub_18278F374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,void *a41,uint64_t a42,int a43,__int16 a44,char a45,char a46,uint64_t a47,uint64_t a48,int a49,__int16 a50,char a51,char a52,uint64_t a53,uint64_t a54,int a55,__int16 a56,char a57,char a58,uint64_t a59,uint64_t a60,int a61,__int16 a62,char a63)
{
  char a64;
  char a70;
  char a72;
  char a73;
  char a74;
  char a75;
  char a76;
  char a77;
  char a78;
  uint64_t v78;
  char *v79;
  void **v80;

  if (a16 < 0)
    operator delete(__p);
  if (a22 < 0)
    operator delete(a17);
  if (a28 < 0)
    operator delete(a23);
  if (a34 < 0)
    operator delete(a29);
  if (a40 < 0)
    operator delete(a35);
  if (a46 < 0)
    operator delete(a41);
  if (a52 < 0)
    operator delete(v80[3]);
  if (a58 < 0)
    operator delete(v80[6]);
  if (a64 < 0)
    operator delete(v80[9]);
  if (a70 < 0)
    operator delete(v80[12]);
  if (a72 < 0)
    operator delete(v80[15]);
  if (a73 < 0)
    operator delete(v80[18]);
  if (a74 < 0)
    operator delete(v80[21]);
  if (a75 < 0)
    operator delete(v80[24]);
  if (a76 < 0)
    operator delete(v80[27]);
  if (a77 < 0)
    operator delete(v80[30]);
  for (; v79 != &a78; v79 -= 32)
  {
    if (*(v79 - 9) < 0)
      operator delete(*((void **)v79 - 4));
  }
  MEMORY[0x186DABFBC](v78, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

void sub_18278F5E8()
{
  JUMPOUT(0x18278F540);
}

void sub_18278F5F4()
{
  JUMPOUT(0x18278F580);
}

uint64_t std::map<std::string,TextureTokenData>::map[abi:ne180100](uint64_t a1, const void **a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v6;

  *(_QWORD *)(a1 + 8) = 0;
  v4 = (uint64_t *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  if (a3)
  {
    v6 = 32 * a3;
    do
    {
      std::__tree<std::__value_type<std::string,TextureTokenData>,std::__map_value_compare<std::string,std::__value_type<std::string,TextureTokenData>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TextureTokenData>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,TextureTokenData> const&>((uint64_t **)a1, v4, a2, (uint64_t)a2);
      a2 += 4;
      v6 -= 32;
    }
    while (v6);
  }
  return a1;
}

void sub_18278F660(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::destroy(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,TextureTokenData>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    if (*((char *)__p + 55) < 0)
      operator delete(__p[4]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t std::map<std::string,TokenData>::map[abi:ne180100](uint64_t a1, const void **a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v6;

  *(_QWORD *)(a1 + 8) = 0;
  v4 = (uint64_t *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  if (a3)
  {
    v6 = 40 * a3;
    do
    {
      std::__tree<std::__value_type<std::string,TokenData>,std::__map_value_compare<std::string,std::__value_type<std::string,TokenData>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TokenData>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,TokenData> const&>((uint64_t **)a1, v4, a2, (uint64_t)a2);
      a2 += 5;
      v6 -= 40;
    }
    while (v6);
  }
  return a1;
}

void sub_18278F730(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::destroy(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<pixelFormatTypeMap(void)::$_0 &&>>()
{
  uint64_t v0;
  uint64_t v1;
  void **v2;
  int v3;
  void *__p;
  char v5;
  int v6;
  void *v7[2];
  char v8;
  int v9;
  void *v10;
  char v11;
  int v12;
  void *v13[2];
  char v14;
  int v15;
  void *v16;
  char v17;
  int v18;
  __int128 v19;
  char v20;
  int v21;
  void *v22;
  char v23;
  int v24;
  __int128 v25;
  char v26;
  int v27;
  void *v28;
  char v29;
  int v30;
  __int128 v31;
  char v32;
  int v33;
  void *v34;
  char v35;
  int v36;
  __int128 v37;
  char v38;
  int v39;
  void *v40;
  char v41;
  int v42;
  __int128 v43;
  char v44;
  int v45;
  void *v46;
  char v47;
  int v48;
  __int128 v49;
  char v50;
  int v51;
  void *v52;
  char v53;
  int v54;
  __int128 v55;
  char v56;
  int v57;
  void *v58;
  char v59;
  int v60;
  __int128 v61;
  char v62;
  int v63;
  void *v64;
  char v65;
  int v66;
  __int128 v67;
  char v68;
  int v69;
  void *v70;
  char v71;
  int v72;
  __int128 v73;
  char v74;
  int v75;
  void *v76;
  char v77;
  int v78;
  __int128 v79;
  char v80;
  int v81;
  void *v82;
  char v83;
  int v84;
  __int128 v85;
  char v86;
  int v87;
  void *v88;
  char v89;
  int v90;
  __int128 v91;
  char v92;
  int v93;
  void *v94;
  char v95;
  int v96;
  __int128 v97;
  char v98;
  std::string v99;
  std::string v100[2];
  std::string v101[2];
  std::string v102[2];
  std::string v103[2];
  std::string v104[2];
  std::string v105[2];
  std::string v106[2];
  std::string v107[2];
  std::string v108[2];
  std::string v109[2];
  std::string v110[2];
  std::string v111[2];
  std::string v112[2];
  std::string v113[2];
  std::string v114[2];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v0 = operator new();
  std::string::basic_string[abi:ne180100]<0>(&v97, "r8unorm");
  v93 = 10;
  std::string::basic_string[abi:ne180100]<0>(&v94, "packed_uchar");
  v96 = 62;
  std::pair<std::string const,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>::pair[abi:ne180100]<true,0>(&v99, &v97, (uint64_t)&v93);
  std::string::basic_string[abi:ne180100]<0>(&v91, "r8snorm");
  v87 = 12;
  std::string::basic_string[abi:ne180100]<0>(&v88, "packed_uchar");
  v90 = 63;
  std::pair<std::string const,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>::pair[abi:ne180100]<true,0>(v100, &v91, (uint64_t)&v87);
  std::string::basic_string[abi:ne180100]<0>(&v85, "r16unorm");
  v81 = 20;
  std::string::basic_string[abi:ne180100]<0>(&v82, "packed_ushort");
  v84 = 64;
  std::pair<std::string const,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>::pair[abi:ne180100]<true,0>(v101, &v85, (uint64_t)&v81);
  std::string::basic_string[abi:ne180100]<0>(&v79, "r16snorm");
  v75 = 22;
  std::string::basic_string[abi:ne180100]<0>(&v76, "packed_ushort");
  v78 = 65;
  std::pair<std::string const,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>::pair[abi:ne180100]<true,0>(v102, &v79, (uint64_t)&v75);
  std::string::basic_string[abi:ne180100]<0>(&v73, "rg8unorm");
  v69 = 30;
  std::string::basic_string[abi:ne180100]<0>(&v70, "packed_uchar2");
  v72 = 66;
  std::pair<std::string const,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>::pair[abi:ne180100]<true,0>(v103, &v73, (uint64_t)&v69);
  std::string::basic_string[abi:ne180100]<0>(&v67, "rg8snorm");
  v63 = 32;
  std::string::basic_string[abi:ne180100]<0>(&v64, "packed_uchar2");
  v66 = 67;
  std::pair<std::string const,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>::pair[abi:ne180100]<true,0>(v104, &v67, (uint64_t)&v63);
  std::string::basic_string[abi:ne180100]<0>(&v61, "rg16unorm");
  v57 = 60;
  std::string::basic_string[abi:ne180100]<0>(&v58, "packed_ushort2");
  v60 = 68;
  std::pair<std::string const,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>::pair[abi:ne180100]<true,0>(v105, &v61, (uint64_t)&v57);
  std::string::basic_string[abi:ne180100]<0>(&v55, "rg16snorm");
  v51 = 62;
  std::string::basic_string[abi:ne180100]<0>(&v52, "packed_ushort2");
  v54 = 69;
  std::pair<std::string const,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>::pair[abi:ne180100]<true,0>(v106, &v55, (uint64_t)&v51);
  std::string::basic_string[abi:ne180100]<0>(&v49, "rgba8unorm");
  v45 = 70;
  std::string::basic_string[abi:ne180100]<0>(&v46, "packed_uchar4");
  v48 = 70;
  std::pair<std::string const,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>::pair[abi:ne180100]<true,0>(v107, &v49, (uint64_t)&v45);
  std::string::basic_string[abi:ne180100]<0>(&v43, "srgba8unorm");
  v39 = 71;
  std::string::basic_string[abi:ne180100]<0>(&v40, "packed_uchar4");
  v42 = 71;
  std::pair<std::string const,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>::pair[abi:ne180100]<true,0>(v108, &v43, (uint64_t)&v39);
  std::string::basic_string[abi:ne180100]<0>(&v37, "rgba8snorm");
  v33 = 72;
  std::string::basic_string[abi:ne180100]<0>(&v34, "packed_uchar4");
  v36 = 72;
  std::pair<std::string const,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>::pair[abi:ne180100]<true,0>(v109, &v37, (uint64_t)&v33);
  std::string::basic_string[abi:ne180100]<0>(&v31, "rgba16unorm");
  v27 = 110;
  std::string::basic_string[abi:ne180100]<0>(&v28, "packed_ushort4");
  v30 = 73;
  std::pair<std::string const,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>::pair[abi:ne180100]<true,0>(v110, &v31, (uint64_t)&v27);
  std::string::basic_string[abi:ne180100]<0>(&v25, "rgba16snorm");
  v21 = 112;
  std::string::basic_string[abi:ne180100]<0>(&v22, "packed_ushort4");
  v24 = 74;
  std::pair<std::string const,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>::pair[abi:ne180100]<true,0>(v111, &v25, (uint64_t)&v21);
  std::string::basic_string[abi:ne180100]<0>(&v19, "rgb10a2");
  v15 = 90;
  std::string::basic_string[abi:ne180100]<0>(&v16, "packed_uint");
  v18 = 75;
  std::pair<std::string const,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>::pair[abi:ne180100]<true,0>(v112, &v19, (uint64_t)&v15);
  std::string::basic_string[abi:ne180100]<0>(v13, "rg11b10f");
  v9 = 92;
  std::string::basic_string[abi:ne180100]<0>(&v10, "packed_uint");
  v12 = 76;
  std::pair<std::string const,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>::pair[abi:ne180100]<true,0>(v113, (__int128 *)v13, (uint64_t)&v9);
  std::string::basic_string[abi:ne180100]<0>(v7, "rgb9e5");
  v3 = 93;
  std::string::basic_string[abi:ne180100]<0>(&__p, "packed_uint");
  v6 = 77;
  std::pair<std::string const,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>::pair[abi:ne180100]<true,0>(v114, (__int128 *)v7, (uint64_t)&v3);
  std::map<std::string,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>::map[abi:ne180100](v0, (const void **)&v99.__r_.__value_.__l.__data_, 16);
  pixelFormatTypeMap(void)::nonGlobalPixelFormatTypeMap = v0;
  v1 = 1024;
  do
  {
    v2 = (void **)((char *)&v99.__r_.__value_.__l.__data_ + v1);
    if (*((char *)&v97 + v1 + 15) < 0)
      operator delete(*(v2 - 4));
    if (*((char *)v2 - 41) < 0)
      operator delete(*(v2 - 8));
    v1 -= 64;
  }
  while (v1);
  if (v5 < 0)
    operator delete(__p);
  if (v8 < 0)
    operator delete(v7[0]);
  if (v11 < 0)
    operator delete(v10);
  if (v14 < 0)
    operator delete(v13[0]);
  if (v17 < 0)
    operator delete(v16);
  if (v20 < 0)
    operator delete((void *)v19);
  if (v23 < 0)
    operator delete(v22);
  if (v26 < 0)
    operator delete((void *)v25);
  if (v29 < 0)
    operator delete(v28);
  if (v32 < 0)
    operator delete((void *)v31);
  if (v35 < 0)
    operator delete(v34);
  if (v38 < 0)
    operator delete((void *)v37);
  if (v41 < 0)
    operator delete(v40);
  if (v44 < 0)
    operator delete((void *)v43);
  if (v47 < 0)
    operator delete(v46);
  if (v50 < 0)
    operator delete((void *)v49);
  if (v53 < 0)
    operator delete(v52);
  if (v56 < 0)
    operator delete((void *)v55);
  if (v59 < 0)
    operator delete(v58);
  if (v62 < 0)
    operator delete((void *)v61);
  if (v65 < 0)
    operator delete(v64);
  if (v68 < 0)
    operator delete((void *)v67);
  if (v71 < 0)
    operator delete(v70);
  if (v74 < 0)
    operator delete((void *)v73);
  if (v77 < 0)
    operator delete(v76);
  if (v80 < 0)
    operator delete((void *)v79);
  if (v83 < 0)
    operator delete(v82);
  if (v86 < 0)
    operator delete((void *)v85);
  if (v89 < 0)
    operator delete(v88);
  if (v92 < 0)
    operator delete((void *)v91);
  if (v95 < 0)
    operator delete(v94);
  if (v98 < 0)
    operator delete((void *)v97);
}

void sub_18278FEC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,int a41,__int16 a42,char a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,int a48,__int16 a49,char a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,int a55,__int16 a56,char a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,int a62,__int16 a63)
{
  char a65;
  char a72;
  char a73;
  char a74;
  char a75;
  char a76;
  char a77;
  char a78;
  uint64_t v78;
  void **v79;
  uint64_t v80;

  std::__call_once_proxy[abi:ne180100]<std::tuple<pixelFormatTypeMap(void)::$_0 &&>>(v80 + 1024, (uint64_t)&STACK[0x408]);
  if (a16 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  if (a30 < 0)
    operator delete(a25);
  if (a37 < 0)
    operator delete(a32);
  if (a44 < 0)
    operator delete(v79[1]);
  if (a51 < 0)
    operator delete(v79[5]);
  if (a58 < 0)
    operator delete(v79[9]);
  if (a65 < 0)
    operator delete(v79[13]);
  if (a72 < 0)
    operator delete(v79[17]);
  if (a73 < 0)
    operator delete(v79[21]);
  if (a74 < 0)
    operator delete(v79[25]);
  if (a75 < 0)
    operator delete(v79[29]);
  if (a76 < 0)
    operator delete(v79[33]);
  if (a77 < 0)
    operator delete(v79[37]);
  if (a78 < 0)
    operator delete(v79[41]);
  if (SLOBYTE(STACK[0x207]) < 0)
    operator delete(v79[45]);
  if (SLOBYTE(STACK[0x227]) < 0)
    operator delete(v79[49]);
  if (SLOBYTE(STACK[0x247]) < 0)
    operator delete(v79[53]);
  if (SLOBYTE(STACK[0x267]) < 0)
    operator delete(v79[57]);
  if (SLOBYTE(STACK[0x287]) < 0)
    operator delete(v79[61]);
  if (SLOBYTE(STACK[0x2A7]) < 0)
    operator delete(v79[65]);
  if (SLOBYTE(STACK[0x2C7]) < 0)
    operator delete(v79[69]);
  if (SLOBYTE(STACK[0x2E7]) < 0)
    operator delete(v79[73]);
  if (SLOBYTE(STACK[0x307]) < 0)
    operator delete(v79[77]);
  if (SLOBYTE(STACK[0x327]) < 0)
    operator delete(v79[81]);
  if (SLOBYTE(STACK[0x347]) < 0)
    operator delete(v79[85]);
  if (SLOBYTE(STACK[0x367]) < 0)
    operator delete(v79[89]);
  if (SLOBYTE(STACK[0x387]) < 0)
    operator delete(v79[93]);
  if (SLOBYTE(STACK[0x3A7]) < 0)
    operator delete(v79[97]);
  if (SLOBYTE(STACK[0x3C7]) < 0)
    operator delete(v79[101]);
  if (SLOBYTE(STACK[0x3E7]) < 0)
    operator delete(v79[105]);
  if (SLOBYTE(STACK[0x407]) < 0)
    operator delete(v79[109]);
  MEMORY[0x186DABFBC](v78, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

void sub_1827901D4()
{
  JUMPOUT(0x182790024);
}

void sub_1827901E0()
{
  JUMPOUT(0x182790034);
}

void sub_1827901F0()
{
  JUMPOUT(0x182790044);
}

void sub_1827901FC()
{
  JUMPOUT(0x182790054);
}

void sub_18279020C()
{
  JUMPOUT(0x182790064);
}

void sub_182790218()
{
  JUMPOUT(0x182790074);
}

void sub_182790228()
{
  JUMPOUT(0x182790084);
}

void sub_182790234()
{
  JUMPOUT(0x182790094);
}

void sub_182790244()
{
  JUMPOUT(0x1827900A4);
}

void sub_182790250()
{
  JUMPOUT(0x1827900B4);
}

void sub_182790260()
{
  JUMPOUT(0x1827900C4);
}

void sub_18279026C()
{
  JUMPOUT(0x1827900D4);
}

void sub_18279027C()
{
  JUMPOUT(0x1827900E4);
}

void sub_182790288()
{
  JUMPOUT(0x1827900F4);
}

void sub_182790298()
{
  JUMPOUT(0x182790104);
}

void sub_1827902A4()
{
  JUMPOUT(0x182790114);
}

void sub_1827902B4()
{
  JUMPOUT(0x182790124);
}

void sub_1827902C0()
{
  JUMPOUT(0x182790134);
}

void sub_1827902D0()
{
  JUMPOUT(0x182790144);
}

void sub_1827902DC()
{
  JUMPOUT(0x182790154);
}

void sub_1827902E8()
{
  JUMPOUT(0x182790154);
}

void sub_1827902F8()
{
  JUMPOUT(0x182790164);
}

void sub_182790308()
{
  JUMPOUT(0x1827901B4);
}

std::string *std::pair<std::string const,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>::pair[abi:ne180100]<true,0>(std::string *this, __int128 *a2, uint64_t a3)
{
  __int128 v5;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v5 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v5;
  }
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,Air::PixelFormat,std::string,MTLCompilerDataType>::__tuple_impl(&this[1], a3);
  return this;
}

void sub_18279036C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t std::map<std::string,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>::map[abi:ne180100](uint64_t a1, const void **a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v6;

  *(_QWORD *)(a1 + 8) = 0;
  v4 = (uint64_t *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  if (a3)
  {
    v6 = a3 << 6;
    do
    {
      std::__tree<std::__value_type<std::string,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>> const&>((uint64_t **)a1, v4, a2, (__int128 *)a2);
      a2 += 8;
      v6 -= 64;
    }
    while (v6);
  }
  return a1;
}

void sub_1827903EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<std::string,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>>>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>::pair[abi:ne180100](std::string *this, __int128 *a2)
{
  __int128 v4;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,Air::PixelFormat,std::string,MTLCompilerDataType>::__tuple_impl(&this[1], (uint64_t)a2 + 24);
  return this;
}

void sub_18279045C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>,0>((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>,0>(uint64_t a1)
{
  if (*(char *)(a1 + 55) < 0)
    operator delete(*(void **)(a1 + 32));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void std::__tree<std::__value_type<std::string,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::tuple<Air::PixelFormat,std::string,MTLCompilerDataType>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

unint64_t _MTLGetAttachmentSize(void *a1, char a2, uint64_t *a3, unint64_t *a4)
{
  unint64_t v8;
  unint64_t result;
  uint64_t v10;
  unint64_t v11;

  v8 = objc_msgSend(a1, "width");
  result = objc_msgSend(a1, "height");
  v10 = v8 >> a2;
  v11 = result >> a2;
  if (v8 >> a2 <= 1)
    v10 = 1;
  if (v11 <= 1)
    v11 = 1;
  *a3 = v10;
  *a4 = v11;
  return result;
}

__n128 copyAttachmentPrivate(const MTLRenderPassAttachmentDescriptorPrivate *a1, MTLRenderPassAttachmentDescriptorPrivate *a2)
{
  MTLTextureImplementation *v4;
  MTLTextureImplementation *v5;
  __int128 v6;
  __n128 result;

  v4 = a1->texture;

  a2->texture = a1->texture;
  v5 = a1->resolveTexture;

  a2->resolveTexture = a1->resolveTexture;
  v6 = *(_OWORD *)&a1->clearColor.red;
  *(_OWORD *)&a2->clearColor.blue = *(_OWORD *)&a1->clearColor.blue;
  *(_OWORD *)&a2->clearColor.red = v6;
  a2->clearDepth = a1->clearDepth;
  a2->clearStencil = a1->clearStencil;
  a2->stencilResolveFilter = a1->stencilResolveFilter;
  *(_OWORD *)&a2->level = *(_OWORD *)&a1->level;
  *(_OWORD *)&a2->depthPlane = *(_OWORD *)&a1->depthPlane;
  *(_OWORD *)&a2->storeAction = *(_OWORD *)&a1->storeAction;
  *(_OWORD *)&a2->resolveLevel = *(_OWORD *)&a1->resolveLevel;
  a2->yInvert = a1->yInvert;
  result = *(__n128 *)&a1->resolveDepthPlane;
  *(__n128 *)&a2->resolveDepthPlane = result;
  return result;
}

uint64_t colorAttachmentFormattedDescription(uint64_t a1, const MTLRenderPassAttachmentDescriptorPrivate *a2)
{
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  MTLTextureImplementation *resolveTexture;
  const __CFString *v7;
  unint64_t loadAction;
  const __CFString *v9;
  unint64_t storeAction;
  const __CFString *v11;
  const __CFString *v12;
  unint64_t storeActionOptions;
  const __CFString *v14;
  uint64_t v16;
  const __CFString *v17;
  const __CFString *v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  const __CFString *v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  uint64_t v40;
  const __CFString *v41;
  const __CFString *v42;
  uint64_t v43;
  const __CFString *v44;
  const __CFString *v45;
  uint64_t v46;
  const __CFString *v47;
  const __CFString *v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  uint64_t v52;
  const __CFString *v53;
  const __CFString *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a1 + 4;
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a1 + 4, CFSTR(" "), 0);
  v16 = v4;
  v17 = CFSTR("texture =");
  if (a2->texture)
    v5 = (const __CFString *)-[MTLTextureImplementation formattedDescription:](a2->texture, "formattedDescription:", v3);
  else
    v5 = CFSTR("<null>");
  v18 = v5;
  v19 = v4;
  v20 = CFSTR("level =");
  v21 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2->level);
  v22 = v4;
  v23 = CFSTR("slice =");
  v24 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2->slice);
  v25 = v4;
  v26 = CFSTR("depthPlane =");
  v27 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2->depthPlane);
  v28 = v4;
  v29 = CFSTR("resolveTexture =");
  resolveTexture = a2->resolveTexture;
  if (resolveTexture)
    v7 = (const __CFString *)-[MTLTextureImplementation formattedDescription:](resolveTexture, "formattedDescription:", v3);
  else
    v7 = CFSTR("<null>");
  v30 = v7;
  v31 = v4;
  v32 = CFSTR("resolveLevel =");
  v33 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2->resolveLevel);
  v34 = v4;
  v35 = CFSTR("resolveSlice =");
  v36 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2->resolveSlice);
  v37 = v4;
  v38 = CFSTR("resolveDepthPlane =");
  v39 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2->resolveDepthPlane);
  v40 = v4;
  v41 = CFSTR("loadAction =");
  loadAction = a2->loadAction;
  if (loadAction > 2)
    v9 = CFSTR("Unknown");
  else
    v9 = (const __CFString *)*((_QWORD *)&off_1E0FE4AD0 + loadAction);
  v42 = v9;
  v43 = v4;
  v44 = CFSTR("storeAction =");
  storeAction = a2->storeAction;
  if (storeAction > 4)
    v11 = CFSTR("Unknown");
  else
    v11 = (const __CFString *)*((_QWORD *)&off_1E0FE4AE8 + storeAction);
  v45 = v11;
  v46 = v4;
  v12 = CFSTR("none");
  storeActionOptions = a2->storeActionOptions;
  if (storeActionOptions)
    v12 = 0;
  if ((storeActionOptions & 1) != 0)
    v12 = CFSTR("MTLStoreActionOptionCustomSamplePositions");
  v47 = CFSTR("storeActionOptions =");
  v48 = v12;
  v49 = v4;
  v50 = CFSTR("clearColor =");
  v51 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%g %g %g %g)"), *(_QWORD *)&a2->clearColor.red, *(_QWORD *)&a2->clearColor.green, *(_QWORD *)&a2->clearColor.blue, *(_QWORD *)&a2->clearColor.alpha, v16, v17);
  v52 = v4;
  if (a2->yInvert)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  v53 = CFSTR("yInvert =");
  v54 = v14;
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 39), "componentsJoinedByString:", CFSTR(" "));
}

uint64_t depthAttachmentFormattedDescription(uint64_t a1, const MTLRenderPassAttachmentDescriptorPrivate *a2)
{
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  unint64_t resolveLevel;
  MTLTextureImplementation *resolveTexture;
  unint64_t resolveFilter;
  const __CFString *v9;
  unint64_t loadAction;
  const __CFString *v11;
  unint64_t storeAction;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  _QWORD v18[43];

  v18[42] = *MEMORY[0x1E0C80C00];
  v3 = a1 + 4;
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a1 + 4, CFSTR(" "), 0);
  v18[0] = v4;
  v18[1] = CFSTR("texture =");
  if (a2->texture)
    v5 = (const __CFString *)-[MTLTextureImplementation formattedDescription:](a2->texture, "formattedDescription:", v3);
  else
    v5 = CFSTR("<null>");
  v18[2] = v5;
  v18[3] = v4;
  v18[4] = CFSTR("level =");
  v18[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2->level);
  v18[6] = v4;
  v18[7] = CFSTR("slice =");
  v18[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2->slice);
  v18[9] = v4;
  v18[10] = CFSTR("depthPlane =");
  v18[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2->depthPlane);
  v18[12] = v4;
  resolveTexture = a2->resolveTexture;
  resolveLevel = a2->resolveLevel;
  if (!resolveTexture)
    resolveTexture = (MTLTextureImplementation *)CFSTR("<null>");
  v18[13] = CFSTR("resolveTexture =");
  v18[14] = resolveTexture;
  v18[15] = v4;
  v18[16] = CFSTR("resolveLevel =");
  v18[17] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", resolveLevel);
  v18[18] = v4;
  v18[19] = CFSTR("resolveSlice =");
  v18[20] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2->resolveSlice);
  v18[21] = v4;
  v18[22] = CFSTR("resolveDepthPlane =");
  v18[23] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2->resolveDepthPlane);
  v18[24] = v4;
  v18[25] = CFSTR("resolveFilter =");
  resolveFilter = a2->resolveFilter;
  if (resolveFilter > 2)
    v9 = CFSTR("Unknown");
  else
    v9 = (const __CFString *)*((_QWORD *)&off_1E0FE4AB8 + resolveFilter);
  v18[26] = v9;
  v18[27] = v4;
  v18[28] = CFSTR("loadAction =");
  loadAction = a2->loadAction;
  if (loadAction > 2)
    v11 = CFSTR("Unknown");
  else
    v11 = (const __CFString *)*((_QWORD *)&off_1E0FE4AD0 + loadAction);
  v18[29] = v11;
  v18[30] = v4;
  v18[31] = CFSTR("storeAction =");
  storeAction = a2->storeAction;
  if (storeAction > 4)
    v13 = CFSTR("Unknown");
  else
    v13 = (const __CFString *)*((_QWORD *)&off_1E0FE4AE8 + storeAction);
  v18[32] = v13;
  v18[33] = v4;
  v14 = CFSTR("none");
  if (a2->storeActionOptions)
    v14 = 0;
  v15 = CFSTR("MTLStoreActionOptionCustomSamplePositions");
  if ((a2->storeActionOptions & 1) == 0)
    v15 = v14;
  v18[34] = CFSTR("storeActionOptions =");
  v18[35] = v15;
  v18[36] = v4;
  v18[37] = CFSTR("clearDepth =");
  v18[38] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2->clearDepth);
  v18[39] = v4;
  if (a2->yInvert)
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  v18[40] = CFSTR("yInvert =");
  v18[41] = v16;
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 42), "componentsJoinedByString:", CFSTR(" "));
}

uint64_t stencilAttachmentFormattedDescription(uint64_t a1, const MTLRenderPassAttachmentDescriptorPrivate *a2)
{
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  unint64_t resolveLevel;
  MTLTextureImplementation *resolveTexture;
  unint64_t loadAction;
  const __CFString *v9;
  unint64_t storeAction;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  unint64_t stencilResolveFilter;
  const __CFString *v16;
  BOOL v17;
  const __CFString *v18;
  const __CFString *v19;
  _QWORD v21[43];

  v21[42] = *MEMORY[0x1E0C80C00];
  v3 = a1 + 4;
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a1 + 4, CFSTR(" "), 0);
  v21[0] = v4;
  v21[1] = CFSTR("texture =");
  if (a2->texture)
    v5 = (const __CFString *)-[MTLTextureImplementation formattedDescription:](a2->texture, "formattedDescription:", v3);
  else
    v5 = CFSTR("<null>");
  v21[2] = v5;
  v21[3] = v4;
  v21[4] = CFSTR("level =");
  v21[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2->level);
  v21[6] = v4;
  v21[7] = CFSTR("slice =");
  v21[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2->slice);
  v21[9] = v4;
  v21[10] = CFSTR("depthPlane =");
  v21[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2->depthPlane);
  v21[12] = v4;
  resolveTexture = a2->resolveTexture;
  resolveLevel = a2->resolveLevel;
  if (!resolveTexture)
    resolveTexture = (MTLTextureImplementation *)CFSTR("<null>");
  v21[13] = CFSTR("resolveTexture =");
  v21[14] = resolveTexture;
  v21[15] = v4;
  v21[16] = CFSTR("resolveLevel =");
  v21[17] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", resolveLevel);
  v21[18] = v4;
  v21[19] = CFSTR("resolveSlice =");
  v21[20] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2->resolveSlice);
  v21[21] = v4;
  v21[22] = CFSTR("resolveDepthPlane =");
  v21[23] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2->resolveDepthPlane);
  v21[24] = v4;
  v21[25] = CFSTR("loadAction =");
  loadAction = a2->loadAction;
  if (loadAction > 2)
    v9 = CFSTR("Unknown");
  else
    v9 = (const __CFString *)*((_QWORD *)&off_1E0FE4AD0 + loadAction);
  v21[26] = v9;
  v21[27] = v4;
  v21[28] = CFSTR("storeAction =");
  storeAction = a2->storeAction;
  v11 = CFSTR("Unknown");
  if (storeAction <= 4)
    v11 = (const __CFString *)*((_QWORD *)&off_1E0FE4AE8 + storeAction);
  v21[29] = v11;
  v21[30] = v4;
  v12 = CFSTR("none");
  if (a2->storeActionOptions)
    v12 = 0;
  v13 = CFSTR("MTLStoreActionOptionCustomSamplePositions");
  if ((a2->storeActionOptions & 1) == 0)
    v13 = v12;
  v21[31] = CFSTR("storeActionOptions =");
  v21[32] = v13;
  v21[33] = v4;
  v21[34] = CFSTR("clearStencil =");
  v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2->clearStencil);
  stencilResolveFilter = a2->stencilResolveFilter;
  v16 = CFSTR("MTLMultisampleStencilResolveFilterDepthResolvedSample");
  if (stencilResolveFilter != 1)
    v16 = CFSTR("Unknown");
  v17 = stencilResolveFilter == 0;
  v18 = CFSTR("MTLMultisampleStencilResolveFilterSample0");
  v21[35] = v14;
  v21[36] = v4;
  if (!v17)
    v18 = v16;
  v21[37] = CFSTR("stencilResolveFilter =");
  v21[38] = v18;
  v21[39] = v4;
  v21[40] = CFSTR("yInvert =");
  v19 = CFSTR("YES");
  if (!a2->yInvert)
    v19 = CFSTR("NO");
  v21[41] = v19;
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 42), "componentsJoinedByString:", CFSTR(" "));
}

BOOL equalAttachmentPrivate(const MTLRenderPassAttachmentDescriptorPrivate *a1, const MTLRenderPassAttachmentDescriptorPrivate *a2)
{
  return a1->texture == a2->texture
      && a1->resolveTexture == a2->resolveTexture
      && a1->level == a2->level
      && a1->slice == a2->slice
      && a1->depthPlane == a2->depthPlane
      && a1->resolveFilter == a2->resolveFilter
      && a1->clearColor.red == a2->clearColor.red
      && a1->clearColor.green == a2->clearColor.green
      && a1->clearColor.blue == a2->clearColor.blue
      && a1->clearColor.alpha == a2->clearColor.alpha
      && a1->clearDepth == a2->clearDepth
      && a1->clearStencil == a2->clearStencil
      && a1->stencilResolveFilter == a2->stencilResolveFilter
      && a1->loadAction == a2->loadAction
      && a1->yInvert == a2->yInvert
      && a1->storeActionOptions == a2->storeActionOptions
      && a1->storeAction == a2->storeAction;
}

BOOL equalSampleBufferPrivate(const MTLRenderPassSampleBufferAttachmentDescriptorPrivate *a1, const MTLRenderPassSampleBufferAttachmentDescriptorPrivate *a2)
{
  return a1->sampleBuffer == a2->sampleBuffer
      && a1->startOfVertexSampleIndex == a2->startOfVertexSampleIndex
      && a1->endOfVertexSampleIndex == a2->endOfVertexSampleIndex
      && a1->startOfFragmentSampleIndex == a2->startOfFragmentSampleIndex
      && a1->endOfFragmentSampleIndex == a2->endOfFragmentSampleIndex;
}

void sub_182793E90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void validateMTLBindingAccess(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 >= 3)
    MTLReportFailure(0, "validateMTLBindingAccess", 42, (uint64_t)CFSTR("access (%lu) is not a valid MTLBindingAccess."), a5, a6, a7, a8, a1);
}

uint64_t _MTLCompatibleTextureDataTypeAndPixelFormat(uint64_t a1, uint64_t a2)
{
  _OWORD v4[3];
  uint64_t v5;

  v5 = 0;
  memset(v4, 0, sizeof(v4));
  MTLPixelFormatGetInfoForDevice(0, a2, (uint64_t)v4);
  return _MTLCompatibleTextureDataTypeAndPixelFormatInfo(a1, (uint64_t)v4);
}

uint64_t _MTLCompatibleTextureDataTypeAndPixelFormatInfo(uint64_t a1, uint64_t a2)
{
  int v2;

  if (a1 > 32)
  {
    if (a1 > 40)
    {
      if (a1 == 41)
      {
        v2 = 0x200000;
        return (*(_DWORD *)(a2 + 8) & v2) != 0;
      }
      if (a1 == 85)
      {
        v2 = 0x20000000;
        return (*(_DWORD *)(a2 + 8) & v2) != 0;
      }
    }
    else
    {
      if (a1 == 33)
      {
        v2 = 0x80000;
        return (*(_DWORD *)(a2 + 8) & v2) != 0;
      }
      if (a1 == 37)
      {
        v2 = 0x100000;
        return (*(_DWORD *)(a2 + 8) & v2) != 0;
      }
    }
LABEL_22:
    abort();
  }
  if (a1 > 15)
  {
    if (a1 == 16)
    {
      v2 = 0x20000;
      return (*(_DWORD *)(a2 + 8) & v2) != 0;
    }
    if (a1 == 29)
    {
      v2 = 0x40000;
      return (*(_DWORD *)(a2 + 8) & v2) != 0;
    }
    goto LABEL_22;
  }
  if (!a1)
    return 1;
  if (a1 != 3)
    goto LABEL_22;
  v2 = 0x10000;
  return (*(_DWORD *)(a2 + 8) & v2) != 0;
}

const __CFString *MTLDataTypeString(unint64_t a1)
{
  if (a1 > 0x87)
    return CFSTR("Unknown");
  else
    return off_1E0FE4C40[a1];
}

const __CFString *MTLTagTypeString(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("Unknown");
  else
    return off_1E0FE5080[a1];
}

const __CFString *argumentAccessNames(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("Unknown");
  else
    return off_1E0FE50A0[a1];
}

uint64_t MTLAddMessageObserver(void *a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  if (_MTLCreateNotifierArrayDispatchQueue(void)::once != -1)
    dispatch_once(&_MTLCreateNotifierArrayDispatchQueue(void)::once, &__block_literal_global_83);
  NSSelectorFromString(CFSTR("baseObject"));
  objc_msgSend(a1, "device");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a1, "setDevice:", objc_msgSend((id)objc_msgSend(a1, "device"), "baseObject"));
  if (!s_notifierArray)
    dispatch_sync((dispatch_queue_t)s_notifierArrayDispatchQueue, &__block_literal_global_17);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__11;
  v11 = __Block_byref_object_dispose__11;
  v12 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __MTLAddMessageObserver_block_invoke_60;
  block[3] = &unk_1E0FE50F0;
  block[4] = a1;
  block[5] = a2;
  block[6] = &v7;
  dispatch_sync((dispatch_queue_t)s_notifierArrayDispatchQueue, block);
  v4 = v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void MTLRemoveMessageObserver(uint64_t a1)
{
  _QWORD block[5];

  if (_MTLCreateNotifierArrayDispatchQueue(void)::once != -1)
    dispatch_once(&_MTLCreateNotifierArrayDispatchQueue(void)::once, &__block_literal_global_83);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __MTLRemoveMessageObserver_block_invoke;
  block[3] = &unk_1E0FE2880;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)s_notifierArrayDispatchQueue, block);
}

void _MTLNotifyMessageObservers(uint64_t a1, uint64_t a2)
{
  _QWORD v4[6];

  if (_MTLCreateNotifierArrayDispatchQueue(void)::once != -1)
    dispatch_once(&_MTLCreateNotifierArrayDispatchQueue(void)::once, &__block_literal_global_83);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = ___MTLNotifyMessageObservers_block_invoke;
  v4[3] = &unk_1E0FE34F0;
  v4[4] = a1;
  v4[5] = a2;
  dispatch_sync((dispatch_queue_t)s_notifierArrayDispatchQueue, v4);
}

uint64_t _MTLMessageTypeFromFailureType(unint64_t a1)
{
  if (a1 > 4)
    return 0;
  else
    return qword_18281B368[a1];
}

void ___ZL36_MTLCreateNotifierArrayDispatchQueuev_block_invoke()
{
  if (!s_notifierArrayDispatchQueue)
    s_notifierArrayDispatchQueue = (uint64_t)dispatch_queue_create("com.Metal.NotifierArray", 0);
}

uint64_t pipelineColorAttachmentFormattedDescription(uint64_t a1, void *a2)
{
  unint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;
  unint64_t v7;
  const __CFString *v8;
  unint64_t v9;
  const __CFString *v10;
  _QWORD v12[34];

  v12[33] = *MEMORY[0x1E0C80C00];
  v3 = (unint64_t *)objc_msgSend(a2, "_descriptorPrivate");
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a1 + 4, CFSTR(" "), 0);
  v12[2] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", MTLPixelFormatGetName(*v3 >> 36), v4, CFSTR("pixelFormat ="));
  v12[3] = v4;
  v12[4] = CFSTR("blending =");
  v5 = *v3;
  v6 = CFSTR("YES");
  if ((v5 & 1) == 0)
    v6 = CFSTR("NO");
  v12[5] = v6;
  v12[6] = v4;
  v12[7] = CFSTR("Source blend factors:");
  v12[8] = v4;
  v12[9] = CFSTR("RGB   =");
  v12[10] = MTLBlendFactorString((MTLBlendFactor)((v5 >> 7) & 0x1F));
  v12[11] = v4;
  v12[12] = CFSTR("Alpha =");
  v12[13] = MTLBlendFactorString((MTLBlendFactor)((v5 >> 12) & 0x1F));
  v12[14] = v4;
  v12[15] = CFSTR("Destination blend factors:");
  v12[16] = v4;
  v12[17] = CFSTR("RGB   =");
  v12[18] = MTLBlendFactorString((MTLBlendFactor)((v5 >> 17) & 0x1F));
  v12[19] = v4;
  v12[20] = CFSTR("Alpha =");
  v12[21] = MTLBlendFactorString((MTLBlendFactor)((v5 >> 22) & 0x1F));
  v12[22] = v4;
  v12[23] = CFSTR("Blend operations:");
  v12[24] = v4;
  v12[25] = CFSTR("RGB   =");
  v7 = (v5 >> 1) & 7;
  if (v7 > 4)
    v8 = CFSTR("Unknown");
  else
    v8 = off_1E0FE51F0[v7];
  v12[26] = v8;
  v12[27] = v4;
  v12[28] = CFSTR("Alpha =");
  v9 = (v5 >> 4) & 7;
  if (v9 > 4)
    v10 = CFSTR("Unknown");
  else
    v10 = off_1E0FE51F0[v9];
  v12[29] = v10;
  v12[30] = v4;
  v12[31] = CFSTR("writeMask =");
  v12[32] = MTLColorWriteMaskString((v5 >> 27) & 0xF);
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 33), "componentsJoinedByString:", CFSTR(" "));
}

const __CFString *MTLBlendFactorString(MTLBlendFactor a1)
{
  if (a1 > MTLBlendFactorOneMinusSource1Alpha)
    return CFSTR("Unknown");
  else
    return off_1E0FE5158[a1];
}

const __CFString *MTLColorWriteMaskString(uint64_t a1)
{
  char v1;
  void *v2;
  void *v3;

  if (!a1)
    return CFSTR("None");
  v1 = a1;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = v2;
  if ((v1 & 8) == 0)
  {
    if ((v1 & 4) == 0)
      goto LABEL_4;
LABEL_9:
    objc_msgSend(v3, "appendString:", CFSTR("G"));
    if ((v1 & 2) == 0)
    {
LABEL_5:
      if ((v1 & 1) == 0)
        return (const __CFString *)v3;
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  objc_msgSend(v2, "appendString:", CFSTR("R"));
  if ((v1 & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v1 & 2) == 0)
    goto LABEL_5;
LABEL_10:
  objc_msgSend(v3, "appendString:", CFSTR("B"));
  if ((v1 & 1) != 0)
LABEL_11:
    objc_msgSend(v3, "appendString:", CFSTR("A"));
  return (const __CFString *)v3;
}

uint64_t pipelineColorAttachmentDefaultFormattedDescription(uint64_t a1)
{
  void *v1;
  _QWORD v3[33];

  v3[32] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a1 + 4, CFSTR(" "), 0);
  v3[1] = CFSTR("pixelFormat =");
  v3[2] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", MTLPixelFormatGetName(0));
  v3[3] = v3[0];
  v3[4] = CFSTR("blending = NO");
  v3[5] = v3[0];
  v3[6] = CFSTR("Source blend factors:");
  v3[7] = v3[0];
  v3[8] = CFSTR("RGB   =");
  v3[9] = CFSTR("MTLBlendFactorOne");
  v3[10] = v3[0];
  v3[11] = CFSTR("Alpha =");
  v3[12] = CFSTR("MTLBlendFactorOne");
  v3[13] = v3[0];
  v3[14] = CFSTR("Destination blend factors:");
  v3[15] = v3[0];
  v3[16] = CFSTR("RGB   =");
  v3[17] = CFSTR("MTLBlendFactorZero");
  v3[18] = v3[0];
  v3[19] = CFSTR("Alpha =");
  v3[20] = CFSTR("MTLBlendFactorZero");
  v3[21] = v3[0];
  v3[22] = CFSTR("Blend operations:");
  v3[23] = v3[0];
  v3[24] = CFSTR("RGB   =");
  v3[25] = CFSTR("MTLBlendOperationAdd");
  v3[26] = v3[0];
  v3[27] = CFSTR("Alpha =");
  v3[28] = CFSTR("MTLBlendOperationAdd");
  v3[29] = v3[0];
  v3[30] = CFSTR("writeMask =");
  v1 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  objc_msgSend(v1, "appendString:", CFSTR("R"));
  objc_msgSend(v1, "appendString:", CFSTR("G"));
  objc_msgSend(v1, "appendString:", CFSTR("B"));
  objc_msgSend(v1, "appendString:", CFSTR("A"));
  v3[31] = v1;
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 32), "componentsJoinedByString:", CFSTR(" "));
}

uint64_t MTLRenderPipelineColorAttachmentDescriptorDescription(void *a1)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  const __CFString *v4;
  unint64_t v5;
  const __CFString *v6;
  _QWORD v8[9];
  _QWORD v9[10];

  v9[9] = *MEMORY[0x1E0C80C00];
  v1 = (unint64_t *)objc_msgSend(a1, "_descriptorPrivate");
  v8[0] = CFSTR("Pixel Format");
  v9[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", MTLPixelFormatGetName(*v1 >> 36));
  v8[1] = CFSTR("Blending Enabled");
  v9[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_DWORD *)v1 & 1);
  v8[2] = CFSTR("Source RGB Blend Factor");
  v2 = *v1;
  v9[2] = MTLBlendFactorString((MTLBlendFactor)((v2 >> 7) & 0x1F));
  v8[3] = CFSTR("Destination RGB Blend Factor");
  v9[3] = MTLBlendFactorString((MTLBlendFactor)((v2 >> 17) & 0x1F));
  v8[4] = CFSTR("Source Alpha Blend Factor");
  v9[4] = MTLBlendFactorString((MTLBlendFactor)((v2 >> 12) & 0x1F));
  v8[5] = CFSTR("Destination Alpha Blend Factor");
  v9[5] = MTLBlendFactorString((MTLBlendFactor)((v2 >> 22) & 0x1F));
  v8[6] = CFSTR("RGB Blend Operation");
  v3 = (v2 >> 1) & 7;
  if (v3 > 4)
    v4 = CFSTR("Unknown");
  else
    v4 = off_1E0FE51F0[v3];
  v9[6] = v4;
  v8[7] = CFSTR("Alpha Blend Operation");
  v5 = (v2 >> 4) & 7;
  if (v5 > 4)
    v6 = CFSTR("Unknown");
  else
    v6 = off_1E0FE51F0[v5];
  v9[7] = v6;
  v8[8] = CFSTR("Write Mask");
  v9[8] = MTLColorWriteMaskString((v2 >> 27) & 0xF);
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 9);
}

uint64_t MTLRenderPipelineColorAttachmentDescriptorDefaultDescription(void)
{
  void *v0;
  _QWORD v2[9];
  _QWORD v3[10];

  v3[9] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Pixel Format");
  v3[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", MTLPixelFormatGetName(0));
  v3[1] = MEMORY[0x1E0C9AAA0];
  v2[1] = CFSTR("Blending Enabled");
  v2[2] = CFSTR("Source RGB Blend Factor");
  v3[2] = CFSTR("MTLBlendFactorOne");
  v3[3] = CFSTR("MTLBlendFactorZero");
  v2[3] = CFSTR("Destination RGB Blend Factor");
  v2[4] = CFSTR("Source Alpha Blend Factor");
  v3[4] = CFSTR("MTLBlendFactorOne");
  v3[5] = CFSTR("MTLBlendFactorZero");
  v2[5] = CFSTR("Destination Alpha Blend Factor");
  v2[6] = CFSTR("RGB Blend Operation");
  v3[6] = CFSTR("MTLBlendOperationAdd");
  v3[7] = CFSTR("MTLBlendOperationAdd");
  v2[7] = CFSTR("Alpha Blend Operation");
  v2[8] = CFSTR("Write Mask");
  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  objc_msgSend(v0, "appendString:", CFSTR("R"));
  objc_msgSend(v0, "appendString:", CFSTR("G"));
  objc_msgSend(v0, "appendString:", CFSTR("B"));
  objc_msgSend(v0, "appendString:", CFSTR("A"));
  v3[8] = v0;
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 9);
}

void sub_18279A3C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37)
{
  if (__p)
    operator delete(__p);
  if (a36)
    operator delete(a36);
  _Unwind_Resume(exception_object);
}

MTLBufferBindingInternal *CreateTraceBufferBinding(unsigned int a1)
{
  MTLBufferBindingInternal *v1;
  uint64_t v3;

  LOBYTE(v3) = 0;
  v1 = -[MTLBufferBindingInternal initWithName:type:access:isActive:locationIndex:arraySize:dataType:pixelFormat:aluType:isConstantBuffer:dataSize:alignment:]([MTLBufferBindingInternal alloc], "initWithName:type:access:isActive:locationIndex:arraySize:dataType:pixelFormat:aluType:isConstantBuffer:dataSize:alignment:", CFSTR("__resource_tracking_impl_trace_buffer"), 0, 1, 1, a1, 0, 45, 0, 45, v3, 1, 1);
  -[MTLBindingInternal setIsArgument:](v1, "setIsArgument:", 1);
  return v1;
}

void sub_18279A990(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  _Unwind_Resume(exception_object);
}

void sub_18279AC04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_18279B710(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,void *__p,uint64_t a45)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

__CFString *inputPrimitiveTopologyName(MTLPrimitiveTopologyClass a1)
{
  if (a1 >= 4)
    abort();
  return off_1E0FE5218[a1];
}

BOOL isPrimitiveTopologyClassValid(MTLPrimitiveTopologyClass a1)
{
  return a1 < 4;
}

const __CFString *MTLVertexAmplificationModeString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Unknown");
  if (!a1)
    v1 = CFSTR("MTLVertexAmplificationModeCount");
  if (a1 == 1)
    return CFSTR("MTLVertexAmplificationModeMask");
  else
    return v1;
}

BOOL isVertexAmplificationModeValid(unint64_t a1)
{
  return a1 < 2;
}

void validateRenderRasterAndLater<MTLMeshRenderPipelineDescriptorPrivate>(uint64_t a1, void *a2, _QWORD *a3)
{
  unint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  int v24;
  unint64_t i;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int v40;
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
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  BOOL v66;
  uint64_t v67;
  BOOL v68;
  _QWORD *v69;
  __int128 v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char v109;
  uint64_t v110;
  unint64_t v111;
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
  const __CFString *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t Name;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  unint64_t v143;
  void *v144;
  BOOL v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  uint64_t v149;
  uint64_t v150[8];
  _QWORD v151[58];

  v151[56] = *MEMORY[0x1E0C80C00];
  v6 = a3[4];
  v7 = objc_msgSend(a2, "supportsSeparateVisibilityAndShadingRate");
  v13 = a3[5];
  if (!v7)
  {
    if (v13)
      _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("colorSampleCount expected to be 0."), v8, v9, v10, v11, v12, v141);
    goto LABEL_17;
  }
  v14 = a3[4];
  if (v13)
    v15 = v13 > v14;
  else
    v15 = 0;
  if (v15)
  {
    _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("colorSampleCount expected to be smaller or equal to rasterSampleCount"), v8, v9, v10, v11, v12, v141);
    v14 = a3[4];
    v13 = a3[5];
    if (v14)
    {
LABEL_7:
      if (v14 < v13)
      {
        _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("rasterSampleCount expected to be greater or equal to colorSampleCount"), v8, v9, v10, v11, v12, v141);
        v13 = a3[5];
      }
    }
  }
  else if (v14)
  {
    goto LABEL_7;
  }
  if (v13)
  {
    v16 = objc_msgSend(a2, "supportsTextureSampleCount:");
    v22 = a3[5];
    if ((v16 & 1) == 0)
    {
      _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("colorSampleCount (%lu) is not supported by device."), v17, v18, v19, v20, v21, a3[5]);
      v22 = a3[5];
    }
    if (v22)
      v6 = v22;
  }
LABEL_17:
  v142 = v6;
  v144 = a2;
  v143 = objc_msgSend(a2, "maxColorAttachments");
  v23 = 0;
  v24 = 0;
  v145 = 0;
  for (i = 0; i != 8; ++i)
  {
    v26 = *(_QWORD *)(*a3 + 8 + 8 * i);
    if (!v26)
      continue;
    v27 = *(_QWORD *)(v26 + 8) >> 36;
    if (!v27)
      continue;
    v149 = 0;
    v147 = 0u;
    v148 = 0u;
    v146 = 0u;
    MTLPixelFormatGetInfoForDevice(v144, v27, (uint64_t)&v146);
    v33 = *(_QWORD *)(v26 + 8);
    if ((v33 & 1) != 0)
    {
      if ((BYTE8(v146) & 8) == 0)
      {
        _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("Blending is enabled for render target %lu; however, the pixelformat %s for this render target is not blendable."),
          v28,
          v29,
          v30,
          v31,
          v32,
          i);
        v33 = *(_QWORD *)(v26 + 8);
      }
      if ((v33 & 0xF80) >= 0x980)
      {
        _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("factor is not a valid MTLBlendFactor."), v28, v29, v30, v31, v32, v141);
        v33 = *(_QWORD *)(v26 + 8);
      }
      if ((v33 & 0x1F000) >= 0x13000)
      {
        _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("factor is not a valid MTLBlendFactor."), v28, v29, v30, v31, v32, v141);
        v33 = *(_QWORD *)(v26 + 8);
      }
      if ((v33 & 0x3E0000) >= 0x260000)
      {
        _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("factor is not a valid MTLBlendFactor."), v28, v29, v30, v31, v32, v141);
        v33 = *(_QWORD *)(v26 + 8);
      }
      if (((v33 >> 22) & 0x1F) >= 0x13)
      {
        _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("factor is not a valid MTLBlendFactor."), v28, v29, v30, v31, v32, v141);
        v33 = *(_QWORD *)(v26 + 8);
      }
      if ((v33 & 0xE) >= 0xA)
      {
        _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("func is not a valid MTLBlendOperation."), v28, v29, v30, v31, v32, v141);
        v33 = *(_QWORD *)(v26 + 8);
      }
      if ((v33 & 0x70) >= 0x50)
      {
        _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("func is not a valid MTLBlendOperation."), v28, v29, v30, v31, v32, v141);
        v33 = *(_QWORD *)(v26 + 8);
      }
      validateMTLPixelFormat(v33 >> 36, a1);
      v40 = *(_DWORD *)(v26 + 8);
      v41 = (v40 >> 7) & 0x1F;
      if (i)
      {
        validateBlendFactorNotDualSourced(i, v41, a1, v35, v36, v37, v38, v39);
        validateBlendFactorNotDualSourced(i, (*(_DWORD *)(v26 + 8) >> 12) & 0x1F, a1, v42, v43, v44, v45, v46);
        validateBlendFactorNotDualSourced(i, (*(_DWORD *)(v26 + 8) >> 17) & 0x1F, a1, v47, v48, v49, v50, v51);
        validateBlendFactorNotDualSourced(i, (*(_DWORD *)(v26 + 8) >> 22) & 0x1F, a1, v52, v53, v54, v55, v56);
      }
      else
      {
        blendFactorSource((v40 >> 7) & 0x1F, v41, v34, v35, v36, v37, v38, v39);
        if (v59 == 2
          || (blendFactorSource((*(_DWORD *)(v26 + 8) >> 12) & 0x1F, v57, v58, v28, v29, v30, v31, v32), v62 == 2)
          || (blendFactorSource((*(_DWORD *)(v26 + 8) >> 17) & 0x1F, v60, v61, v28, v29, v30, v31, v32), v65 == 2))
        {
          v66 = 1;
        }
        else
        {
          blendFactorSource((*(_DWORD *)(v26 + 8) >> 22) & 0x1F, v63, v64, v28, v29, v30, v31, v32);
          v66 = v71 == 2;
        }
        v145 = v66;
      }
    }
    v67 = (*(_QWORD *)(*(_QWORD *)(*a3 + 8 + 8 * i) + 8) >> 27) & 0xFLL;
    if (v67)
      v68 = v67 == 15;
    else
      v68 = 1;
    if (!v68 && (BYTE9(v146) & 0x80) != 0)
      _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("writeMask(0x%lx) is not MTLColorWriteMaskAll or MTLColorWriteMaskNone for render target %lu; however, the pixelformat %s for this render target requires MTLColorWriteMaskAll or MTLColorWriteMaskNone."),
        v28,
        v29,
        v30,
        v31,
        v32,
        v67);
    if (i >= v143)
      _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("MTLRenderPipelineDescriptor color render target(%lu) exceeds platform max(%lu)."), v28, v29, v30, v31, v32, i);
    if ((BYTE8(v146) & 1) != 0)
    {
      if ((BYTE8(v146) & 0x10) == 0)
        goto LABEL_59;
    }
    else
    {
      _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("pixelFormat, for color render target(%lu), is not a valid MTLPixelFormat."), v28, v29, v30, v31, v32, i);
      if ((BYTE8(v146) & 0x10) == 0)
LABEL_59:
        _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("pixelFormat, for color render target(%lu), %s is not color renderable."), v28, v29, v30, v31, v32, i);
    }
    if (i != 0 && v145)
      _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("Dual source blending is used in combination with multiple render targets"), v28, v29, v30, v31, v32, v141);
    v150[v23] = v27;
    v69 = &v151[7 * v23++];
    v70 = v147;
    *(_OWORD *)v69 = v146;
    *((_OWORD *)v69 + 1) = v70;
    *((_OWORD *)v69 + 2) = v148;
    v69[6] = v149;
    v24 = 1;
  }
  v72 = *(_QWORD *)(*a3 + 8);
  if (v72)
  {
    v73 = *(_QWORD *)(v72 + 8) >> 36;
    if (v73)
    {
      v149 = 0;
      v147 = 0u;
      v148 = 0u;
      v146 = 0u;
      MTLPixelFormatGetInfoForDevice(v144, v73, (uint64_t)&v146);
      v79 = *(_QWORD *)((char *)a3 + 60);
      v80 = BYTE8(v146);
      if ((v79 & 1) != 0 && (BYTE8(v146) & 8) == 0)
      {
        _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("MTLRenderPipelineDescriptor with alphaToCoverageEnabled requires a float/unorm pixel format, but colorAttachments[0].pixelFormat(%s) is not blendable"), v74, v75, v76, v77, v78, v146);
        v80 = BYTE8(v146);
        if ((*(_QWORD *)((char *)a3 + 60) & 2) != 0)
          goto LABEL_65;
      }
      else if ((v79 & 2) != 0)
      {
LABEL_65:
        if ((v80 & 8) == 0)
          _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("MTLRenderPipelineDescriptor with alphaToOneEnabled requires a float/unorm pixel format, but colorAttachments[0].pixelFormat(%s) is not blendable"), v74, v75, v76, v77, v78, v146);
      }
    }
  }
  v81 = objc_msgSend(v144, "maxFramebufferStorageBits");
  v82 = MTLPixelFormatComputeTotalSizeUsed((uint64_t)v151, v150, v23, v142 > 1);
  if ((objc_msgSend(v144, "isLargeMRTSupported") & 1) == 0 && 8 * v82 > v81)
    _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("This set of render targets requires %lu bytes of pixel storage. This device supports %lu bytes."), v83, v84, v85, v86, v87, v82 & 0x1FFFFFFFFFFFFFFFLL);
  v88 = a3[1];
  if (v88)
  {
    MTLPixelFormatGetInfoForDevice(v144, v88, (uint64_t)&v146);
    v94 = v146;
    LOBYTE(v81) = BYTE8(v146);
    if ((BYTE8(v146) & 1) != 0)
    {
      if ((BYTE8(v146) & 0x20) != 0)
        goto LABEL_73;
LABEL_99:
      _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("depthAttachmentPixelFormat %s is not depth renderable."), v89, v90, v91, v92, v93, v94);
    }
    else
    {
      _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("depthAttachmentPixelFormat is not a valid MTLPixelFormat."), v89, v90, v91, v92, v93, v141);
      if ((v81 & 0x20) == 0)
        goto LABEL_99;
    }
LABEL_73:
    v24 = 1;
  }
  v95 = a3[2];
  if (v95)
  {
    MTLPixelFormatGetInfoForDevice(v144, v95, (uint64_t)&v146);
    v101 = v146;
    LOBYTE(i) = BYTE8(v146);
    if ((BYTE8(v146) & 1) != 0)
    {
      if ((BYTE8(v146) & 0x40) != 0)
        goto LABEL_77;
LABEL_101:
      _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("stencilAttachmentPixelFormat %s is not stencil renderable."), v96, v97, v98, v99, v100, v101);
    }
    else
    {
      _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("stencilAttachmentPixelFormat is not a valid MTLPixelFormat."), v96, v97, v98, v99, v100, v141);
      if ((i & 0x40) == 0)
        goto LABEL_101;
    }
LABEL_77:
    v24 = 1;
  }
  if (dyld_program_sdk_at_least()
    && ((objc_msgSend(v144, "supportsRenderPassWithoutRenderTarget") | v24) & 1) == 0)
  {
    _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("No valid pixelFormats set."), v102, v103, v104, v105, v106, v141);
  }
  v107 = a3[1];
  v108 = a3[2];
  if (v107 && v108 && i & 0x20 | v81 & 0x40 && v107 != v108)
  {
    Name = MTLPixelFormatGetName(v107);
    MTLPixelFormatGetName(a3[2]);
    _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("depthAttachmentPixelFormat (%s) and stencilAttachmentPixelFormat (%s) must match."), v130, v131, v132, v133, v134, Name);
    v108 = a3[2];
    if (a3[1])
      goto LABEL_86;
  }
  else if (v107)
  {
LABEL_86:
    if (v108)
    {
      v109 = objc_msgSend(v144, "supportsSeparateDepthStencil");
      if (i & 0x20 | v81 & 0x40 || (v109 & 1) == 0)
      {
        v110 = a3[1];
        if (v110 != a3[2])
        {
          v135 = MTLPixelFormatGetName(v110);
          MTLPixelFormatGetName(a3[2]);
          _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("depthAttachmentPixelFormat (%s) and stencilAttachmentPixelFormat (%s) must match."), v136, v137, v138, v139, v140, v135);
        }
      }
    }
  }
  v111 = *(_QWORD *)((char *)a3 + 60);
  if ((v111 & 0x7800000000) == 0)
  {
    _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("maxVertexAmplificationCount (%u) cannot be set to zero."), v102, v103, v104, v105, v106, 0);
    v111 = *(_QWORD *)((char *)a3 + 60);
  }
  if ((objc_msgSend(v144, "supportsVertexAmplificationCount:", (v111 >> 35) & 0xF) & 1) == 0)
    _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("maxVertexAmplificationCount (%u) is not supported on this device. See supportsVertexAmplificationCount:(NSUInteger)."), v112, v113, v114, v115, v116, (*(_QWORD *)((char *)a3 + 60) >> 35) & 0xFLL);
  if ((objc_msgSend(v144, "supportsTextureWriteRoundingMode:", a3[3]) & 1) == 0)
  {
    v123 = MTLRoundingModeString(a3[3]);
    _MTLMessageContextPush_(a1, 4, (uint64_t)CFSTR("device does not support %@"), v124, v125, v126, v127, v128, (uint64_t)v123);
  }
  validateMTLCompareFunction((*(_QWORD *)((char *)a3 + 60) >> 20) & 7, a1, v117, v118, v119, v120, v121, v122, v141);
  validateMTLPixelFormat(a3[1], a1);
  validateMTLPixelFormat(a3[2], a1);
}

dispatch_data_t createSerializedFragmentData<MTLMeshRenderPipelineDescriptorPrivate>(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  size_t v15;
  size_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _DWORD *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  uint64_t v42;
  uint64_t v44;
  const void **v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  size_t size;

  v5 = 0;
  v6 = 0;
  do
  {
    v7 = *(_QWORD *)(*(_QWORD *)a3 + 8 + v5);
    if (v7 && *(_QWORD *)(v7 + 8) >> 36)
      ++v6;
    v5 += 8;
  }
  while (v5 != 64);
  v8 = *(void **)(a3 + 224);
  if (v8
    && (objc_msgSend(v8, "functions") && objc_msgSend((id)objc_msgSend(*(id *)(a3 + 224), "functions"), "count")
     || objc_msgSend(*(id *)(a3 + 224), "privateFunctions")
     && objc_msgSend((id)objc_msgSend(*(id *)(a3 + 224), "privateFunctions"), "count")))
  {
    v9 = 1;
    v10 = 24;
  }
  else
  {
    v9 = 0;
    v10 = 16;
  }
  v11 = v10 + 2 * v6;
  v12 = MTLSerializePluginDataDictionary((void *)objc_msgSend((id)objc_msgSend(*(id *)(a3 + 104), "device"), "pluginData"), 0);
  v13 = MTLSerializePluginDataDictionary(*(void **)(a3 + 184), 0);
  v14 = v13 + v12 + v11;
  v46 = v12 + v11;
  v47 = v11;
  v48 = v12;
  v49 = v13;
  if (v9)
  {
    v44 = v13 + v12 + v11;
    v45 = (const void **)_MTLPopulateLinkedFunctionExtraData(*(MTLLinkedFunctions **)(a3 + 224));
    v15 = (size_t)v45[2];
    v16 = v15 + v14;
  }
  else
  {
    v15 = 0;
    v44 = 0;
    v45 = 0;
    v16 = v13 + v12 + v11;
  }
  size = v16;
  v17 = malloc_type_malloc(v16, 0xA19C7A3DuLL);
  v25 = v17;
  v26 = 0;
  v27 = 0;
  *v17 = 0;
  v17[1] = 0;
  *((_DWORD *)v17 + 2) = (a2 << 6) & 0x40000000 | v6 | (((*(_DWORD *)(a3 + 60) >> 4) & 1) << 29);
  v28 = 2;
  if (v9)
    v28 = 3;
  v29 = &v17[v28];
  do
  {
    v30 = *(_QWORD *)(*(_QWORD *)a3 + 8 + 8 * v26);
    if (v30)
    {
      v31 = *(_QWORD *)(v30 + 8);
      if (v31 >> 36)
      {
        *((_WORD *)v29 + v27++) = WORD2(v31) & 0xFFF0 | v26;
        v32 = *(_QWORD *)(v30 + 8);
        if ((v32 & 1) != 0)
        {
          blendFactorSource((v32 >> 7) & 0x1F, v18, v19, v20, v21, v22, v23, v24);
          if (v33 == 2
            || (blendFactorSource((*(_DWORD *)(v30 + 8) >> 12) & 0x1F, v18, v19, v20, v21, v22, v23, v24), v34 == 2)
            || (blendFactorSource((*(_DWORD *)(v30 + 8) >> 17) & 0x1F, v18, v19, v20, v21, v22, v23, v24), v35 == 2)
            || (blendFactorSource((*(_DWORD *)(v30 + 8) >> 22) & 0x1F, v18, v19, v20, v21, v22, v23, v24), v36 == 2))
          {
            v37 = v25[2] | (0x10000 << v26) & 0xFF0000;
            v25[2] = v37;
          }
          else
          {
            v37 = v25[2];
          }
          if ((v37 & 0xFF0000) != 0)
          {
            blendFactorSource((*(_DWORD *)(v30 + 8) >> 7) & 0x1F, v18, v19, v20, v21, v22, v23, v24);
            if (v38 == 2
              || (blendFactorSource((*(_DWORD *)(v30 + 8) >> 12) & 0x1F, v18, v19, v20, v21, v22, v23, v24), v39 == 2)
              || (blendFactorSource((*(_DWORD *)(v30 + 8) >> 17) & 0x1F, v18, v19, v20, v21, v22, v23, v24), v40 == 2)
              || (blendFactorSource((*(_DWORD *)(v30 + 8) >> 22) & 0x1F, v18, v19, v20, v21, v22, v23, v24), v41 == 2))
            {
              v25[2] |= (256 << v26) & 0xFF00;
            }
          }
        }
      }
    }
    ++v26;
  }
  while (v26 != 8);
  v42 = *(_QWORD *)(a3 + 16);
  *((_WORD *)v25 + 6) = *(_QWORD *)(a3 + 8);
  *((_WORD *)v25 + 7) = v42;
  if (v48)
  {
    *v25 = v47;
    MTLSerializePluginDataDictionary((void *)objc_msgSend((id)objc_msgSend(*(id *)(a3 + 104), "device"), "pluginData"), (_BYTE *)v25 + v47);
  }
  if (v49)
  {
    v25[1] = v46;
    MTLSerializePluginDataDictionary(*(void **)(a3 + 184), (_BYTE *)v25 + v46);
  }
  if (v15)
  {
    v25[2] |= 0x80000000;
    v25[4] = v44;
    v25[5] = v15;
    memcpy((char *)v25 + v44, *v45, v15);
    free((void *)*v45);
    MEMORY[0x186DABFBC](v45, 0x1010C40113C0ABBLL);
  }
  return dispatch_data_create(v25, size, 0, (dispatch_block_t)*MEMORY[0x1E0C80CE0]);
}

void MTLReleaseAssertionFailure(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;

  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (a4)
  {
    v15 = (id)objc_msgSend(v13, "initWithCString:encoding:", a4, 4);
    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v15, &a9);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed assertion %s at line %d in %s. %@"), a3, a2, a1, v16);
  }
  else
  {
    v14 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("failed assertion %s at line %d in %s"), a3, a2, a1, v17);
  }
  NSLog(CFSTR("%@"), v14);
  abort();
}

uint64_t MTLGetWarningMode()
{
  if (initFailureModes(void)::pred != -1)
    dispatch_once(&initFailureModes(void)::pred, &__block_literal_global_19);
  return dword_1ECD45180;
}

void MTLSetWarningMode(int a1)
{
  if (initFailureModes(void)::pred != -1)
    dispatch_once(&initFailureModes(void)::pred, &__block_literal_global_19);
  dword_1ECD45180 = a1;
}

void MTLFailureTypeSetErrorModeType(unint64_t a1, int a2)
{
  uint64_t v4;

  if (initFailureModes(void)::pred != -1)
    dispatch_once(&initFailureModes(void)::pred, &__block_literal_global_19);
  if (a1 >= 5)
    MTLFailureTypeSetErrorModeType_cold_1();
  if (a1 == 4)
    v4 = 1;
  else
    v4 = a1;
  errorModes[v4] = a2;
}

uint64_t MTLGetReportFailureBlock()
{
  return reportFailureBlock;
}

uint64_t MTLSetReportFailureBlock(uint64_t result)
{
  void *v1;

  if (reportFailureBlock != result)
  {
    v1 = (void *)result;

    result = objc_msgSend(v1, "copy");
    reportFailureBlock = result;
  }
  return result;
}

_QWORD *MTLIOAccelDeviceShmemPoolCreateShmem(uint64_t a1)
{
  os_unfair_lock_s *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v2 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  v3 = *(_QWORD **)(a1 + 8);
  if (v3)
  {
    v4 = v3 + 1;
    v5 = v3[2];
    v6 = (_QWORD *)v3[3];
    if (v5)
    {
      *(_QWORD *)(v5 + 24) = v6;
      v7 = v3[2];
      v6 = (_QWORD *)v3[3];
    }
    else
    {
      v7 = 0;
      *(_QWORD *)(a1 + 16) = v6;
    }
    *v6 = v7;
    --*(_DWORD *)(a1 + 28);
    v3[2] = 0;
    v3[3] = 0;
    os_unfair_lock_unlock(v2);
    goto LABEL_8;
  }
  os_unfair_lock_unlock(v2);
  v8 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithDevice:shmemSize:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
  v3 = (_QWORD *)v8;
  if (v8)
  {
    v4 = (_QWORD *)(v8 + 8);
LABEL_8:
    *v4 = a1;
    v9 = (id)a1;
  }
  return v3;
}

void *MTLIOAccelCommandBufferStorageCreate(uint64_t a1, int a2)
{
  return MTLIOAccelCommandBufferStorageCreateExt(a1, a1 + 624, a2);
}

void *MTLIOAccelCommandBufferStorageCreateExt(uint64_t a1, uint64_t a2, int a3)
{
  void *v6;
  _QWORD *Shmem;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  MTLResourceList *ResourceList;

  v6 = malloc_type_calloc(0x340uLL, 1uLL, 0xDB40AD81uLL);
  *(_QWORD *)v6 = a1;
  Shmem = MTLIOAccelDeviceShmemPoolCreateShmem(*(_QWORD *)a2);
  if (!Shmem)
    goto LABEL_6;
  v8 = Shmem[7];
  *((_QWORD *)v6 + 8) = Shmem;
  *((_QWORD *)v6 + 9) = v8;
  *((_QWORD *)v6 + 10) = Shmem[7] + *((unsigned int *)Shmem + 13);
  *((_QWORD *)v6 + 97) = v8;
  *((_DWORD *)v6 + 200) = -1;
  IOAccelResourceListInit();
  v9 = MTLIOAccelDeviceShmemPoolCreateShmem(*(_QWORD *)(a2 + 8));
  if (!v9)
  {
    MTLIOAccelDeviceShmemRelease(*((os_unfair_lock_s **)v6 + 8));
LABEL_6:
    free(v6);
    return 0;
  }
  v10 = v9[7];
  *((_QWORD *)v6 + 4) = v9;
  *((_QWORD *)v6 + 5) = v10;
  *((_QWORD *)v6 + 7) = v9[7] + *((unsigned int *)v9 + 13);
  *((_QWORD *)v6 + 6) = v9[7];
  v11 = *(unsigned int *)(a2 + 24);
  if ((_DWORD)v11)
  {
    *((_QWORD *)v6 + 94) = *(_QWORD *)(a2 + 16);
    v12 = malloc_type_calloc(1uLL, v11 << 6, 0x10B0040CDE4EDB6uLL);
    LODWORD(v11) = *(_DWORD *)(a2 + 24);
  }
  else
  {
    v12 = 0;
  }
  *((_QWORD *)v6 + 92) = v12;
  *((_DWORD *)v6 + 190) = v11;
  ResourceList = *(MTLResourceList **)(a2 + 40);
  if (ResourceList)
    ResourceList = MTLResourceListPoolCreateResourceList((MTLResourceListPool *)ResourceList);
  *((_QWORD *)v6 + 88) = ResourceList;
  if (a3)
    *((_QWORD *)v6 + 87) = MTLResourceListPoolCreateResourceList(*(MTLResourceListPool **)(a2 + 32));
  else
    *((_QWORD *)v6 + 87) = 0;
  return v6;
}

void MTLIOAccelCommandBufferStorageGrowSegmentList(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  _QWORD *Shmem;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL4 v28;
  uint64_t v29;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_DWORD *)(v2 + 52);
  if (v3 >= 0x200000)
    v4 = v3 + 0x100000;
  else
    v4 = 2 * v3;
  objc_msgSend(*(id *)(v2 + 8), "setShmemSize:", v4);
  Shmem = MTLIOAccelDeviceShmemPoolCreateShmem(*(_QWORD *)(v2 + 8));
  if (!Shmem)
  {
    v27 = *(_QWORD *)(a1 + 88);
    v28 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v27)
    {
      if (v28)
      {
        MTLIOAccelCommandBufferStorageGrowSegmentList_cold_2();
        abort();
      }
    }
    else if (v28)
    {
      MTLIOAccelCommandBufferStorageGrowSegmentList_cold_1();
    }
    abort();
  }
  v6 = Shmem;
  memcpy((void *)Shmem[7], *(const void **)(a1 + 72), *(unsigned int *)(*(_QWORD *)(a1 + 64) + 52));
  MTLIOAccelDeviceShmemRelease(*(os_unfair_lock_s **)(a1 + 64));
  *(_QWORD *)(a1 + 64) = v6;
  if (*(_DWORD *)(a1 + 804))
  {
    v11 = v6[7];
    v12 = *(_QWORD *)(a1 + 96) - *(_QWORD *)(a1 + 72);
    v13 = v11 + *((unsigned int *)v6 + 13);
    *(_QWORD *)(a1 + 72) = v11;
    *(_QWORD *)(a1 + 80) = v13;
    v14 = v11 + v12;
    *(_QWORD *)(a1 + 88) = v11;
    *(_QWORD *)(a1 + 96) = v14;
    *(_QWORD *)(a1 + 104) = v14 + 24;
LABEL_11:
    IOAccelResourceListReset();
    return;
  }
  v15 = *(_DWORD *)(a1 + 800);
  if (!v15)
  {
    v20 = *(_QWORD *)(a1 + 72);
    v21 = *(_QWORD *)(a1 + 88) - v20;
    v22 = *(_QWORD *)(a1 + 96) - v20;
    v23 = v6[7];
    v24 = v23 + *((unsigned int *)v6 + 13);
    *(_QWORD *)(a1 + 72) = v23;
    *(_QWORD *)(a1 + 80) = v24;
    v25 = v23 + v21;
    *(_QWORD *)(a1 + 776) = v25;
    v26 = v23 + v22;
    *(_QWORD *)(a1 + 88) = v25;
    *(_QWORD *)(a1 + 96) = v26;
    *(_QWORD *)(a1 + 104) = v26 + 24;
    goto LABEL_11;
  }
  if (v15 != 1)
    MTLReleaseAssertionFailure((uint64_t)"_mtlIOAccelCommandBufferStorageRebaseShmemHeader", 510, (uint64_t)"false", 0, v7, v8, v9, v10, v29);
  v16 = *(_QWORD *)(a1 + 784) - *(_QWORD *)(a1 + 72);
  v17 = v6[7];
  v18 = v17 + *((unsigned int *)v6 + 13);
  *(_QWORD *)(a1 + 72) = v17;
  *(_QWORD *)(a1 + 80) = v18;
  v19 = v17 + v16;
  *(_QWORD *)(a1 + 784) = v19;
  *(_QWORD *)(a1 + 776) = v19;
}

void MTLIOAccelCommandBufferStorageDealloc(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  os_unfair_lock_s *v9;

  if (*(_QWORD *)(a1 + 8))
  {
    MTLIOAccelCommandBufferStorageReset(a1);
    MTLIOAccelCommandBufferStoragePoolReturnStorage(*(uint64_t **)(a1 + 8), a1, v2, v3, v4, v5, v6, v7);
  }
  else
  {
    v8 = *(os_unfair_lock_s **)(a1 + 32);
    if (v8)
    {
      MTLIOAccelDeviceShmemRelease(v8);
      *(_QWORD *)(a1 + 32) = 0;
    }
    v9 = *(os_unfair_lock_s **)(a1 + 64);
    if (v9)
    {
      MTLIOAccelDeviceShmemRelease(v9);
      *(_QWORD *)(a1 + 64) = 0;
    }
    IOAccelResourceListDestroy();
    MTLIOAccelCommandBufferStorageReleaseAllResources(a1);
    free((void *)a1);
  }
}

void *MTLIOAccelCommandBufferStorageReset(uint64_t a1)
{
  void *v2;
  void *result;
  uint64_t v4;
  _QWORD *v5;

  MTLIOAccelCommandBufferStorageReleaseExtraResources(a1);
  v2 = *(void **)(a1 + 696);
  if (v2)
    objc_msgSend(v2, "releaseAllObjectsAndReset");
  result = *(void **)(a1 + 704);
  if (result)
    result = (void *)objc_msgSend(result, "releaseAllObjectsAndReset");
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 776) = *(_QWORD *)(a1 + 72);
  *(_DWORD *)(a1 + 800) = -1;
  *(_DWORD *)(a1 + 808) = 0;
  *(_QWORD *)(a1 + 784) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  v4 = *(unsigned int *)(a1 + 760);
  if ((_DWORD)v4)
  {
    v5 = (_QWORD *)(*(_QWORD *)(a1 + 736) + 24);
    do
    {
      *v5 = *(v5 - 2);
      v5 += 8;
      --v4;
    }
    while (v4);
  }
  *(_QWORD *)(a1 + 744) = 0;
  return result;
}

uint64_t MTLIOAccelCommandBufferStoragePoolReturnStorage(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_unfair_lock_s *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v14;

  *(_QWORD *)(a2 + 8) = 0;
  if (*(_DWORD *)(a2 + 800) != -1)
    MTLReleaseAssertionFailure((uint64_t)"MTLIOAccelCommandBufferStoragePoolReturnStorage", 922, (uint64_t)"storage->currentShmemHeaderType == -1", 0, a5, a6, a7, a8, v14);
  *(_DWORD *)(a2 + 800) = -2;
  v10 = (os_unfair_lock_s *)(a1 + 2);
  os_unfair_lock_lock((os_unfair_lock_t)a1 + 4);
  v11 = *a1;
  *(_QWORD *)(a2 + 16) = *a1;
  if (v11)
    v12 = (_QWORD *)(v11 + 24);
  else
    v12 = a1 + 1;
  *v12 = a2 + 16;
  *a1 = a2;
  *(_QWORD *)(a2 + 24) = a1;
  ++*((_DWORD *)a1 + 5);
  os_unfair_lock_unlock(v10);
  return objc_msgSend((id)a1[4], "kickCleanupQueue");
}

uint64_t MTLIOAccelCommandBufferStorageReleaseAllResources(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t i;
  uint64_t v6;
  os_unfair_lock_s *v7;
  void *v8;
  void *v9;

  v2 = *(void **)(a1 + 736);
  if (v2)
  {
    v3 = *(unsigned int *)(a1 + 760);
    if ((_DWORD)v3)
    {
      v4 = 0;
      for (i = 0; i < v3; ++i)
      {
        v6 = *(_QWORD *)(a1 + 736) + v4;
        v7 = *(os_unfair_lock_s **)(v6 + 32);
        if (v7)
        {
          MTLIOAccelPooledResourceRelease(v7);
          *(_QWORD *)(v6 + 32) = 0;
          *(_DWORD *)(v6 + 56) = 0;
          v3 = *(unsigned int *)(a1 + 760);
        }
        v4 += 64;
      }
      v2 = *(void **)(a1 + 736);
    }
    free(v2);
    *(_QWORD *)(a1 + 736) = 0;
  }
  MTLIOAccelCommandBufferStorageReleaseExtraResources(a1);
  v8 = *(void **)(a1 + 696);
  if (v8)
  {
    objc_msgSend(v8, "releaseAllObjectsAndReset");
    MTLResourceListRelease(*(_QWORD **)(a1 + 696));
    *(_QWORD *)(a1 + 696) = 0;
  }
  v9 = *(void **)(a1 + 704);
  if (v9)
  {
    objc_msgSend(v9, "releaseAllObjectsAndReset");
    MTLResourceListRelease(*(_QWORD **)(a1 + 704));
    *(_QWORD *)(a1 + 704) = 0;
  }
  return objc_msgSend(*(id *)a1, "kickCleanupQueue");
}

void MTLIOAccelCommandBufferStorageReleaseExtraResources(uint64_t a1)
{
  unint64_t v1;
  unint64_t v3;
  unint64_t *v4;
  os_unfair_lock_s *v5;

  v1 = *(_QWORD *)(a1 + 712);
  if (v1)
  {
    v3 = 0;
    v4 = (unint64_t *)(a1 + 712);
    do
    {
      v5 = *(os_unfair_lock_s **)(*(_QWORD *)(a1 + 728) + 8 * v3);
      if (v5)
      {
        MTLIOAccelPooledResourceRelease(v5);
        v1 = *v4;
      }
      ++v3;
    }
    while (v3 < v1);
    free(*(void **)(a1 + 728));
    *v4 = 0;
    v4[1] = 0;
    v4[2] = 0;
  }
}

char *MTLIOAccelCommandBufferStorageGrowKernelCommandBuffer(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  _QWORD *Shmem;
  uint64_t v9;
  char *result;
  size_t v11;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(v3 + 8);
  v6 = *(_DWORD *)(v5 + 48);
  while (v6 < a2 + *(_DWORD *)(a1 + 56) - (int)v4 + 24)
  {
    if (v6 >= 0x200000)
      v6 += 0x100000;
    else
      v6 *= 2;
  }
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(v3 + 8), "setShmemSize:");
  Shmem = MTLIOAccelDeviceShmemPoolCreateShmem(v5);
  *(_QWORD *)(a1 + 32) = Shmem;
  if (!Shmem)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      MTLIOAccelCommandBufferStorageGrowKernelCommandBuffer_cold_1();
    abort();
  }
  v9 = *((unsigned int *)Shmem + 13);
  result = (char *)Shmem[7];
  *(_QWORD *)(a1 + 40) = result;
  *(_QWORD *)(a1 + 56) = &result[v9];
  v11 = (v7 - v4);
  if (v3)
  {
    memcpy(result, *(const void **)(v3 + 56), v11);
    MTLIOAccelDeviceShmemRelease((os_unfair_lock_s *)v3);
    result = *(char **)(a1 + 40);
  }
  *(_QWORD *)(a1 + 48) = &result[v11];
  return result;
}

__n128 MTLIOAccelCommandBufferStorageAllocResourceAtIndex(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __n128 **v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  __n128 *PooledResource;
  __n128 *v15;
  uint64_t v16;
  unint64_t v17;
  __n128 result;

  v4 = *(_QWORD *)(a1 + 736);
  v5 = a2;
  v6 = v4 + ((unint64_t)a2 << 6);
  v9 = *(_QWORD *)(v6 + 32);
  v7 = (__n128 **)(v6 + 32);
  v8 = v9;
  if (v9)
  {
    v10 = *(_QWORD *)(a1 + 712);
    v11 = *(_QWORD *)(a1 + 720);
    if (v10 >= v11)
    {
      v13 = 2 * v11;
      if (!v11)
        v13 = 32;
      *(_QWORD *)(a1 + 720) = v13;
      v12 = malloc_type_realloc(*(void **)(a1 + 728), 8 * v13, 0x80040B8603338uLL);
      *(_QWORD *)(a1 + 728) = v12;
      v10 = *(_QWORD *)(a1 + 712);
    }
    else
    {
      v12 = *(_QWORD **)(a1 + 728);
    }
    *(_QWORD *)(a1 + 712) = v10 + 1;
    v12[v10] = v8;
  }
  PooledResource = (__n128 *)MTLIOAccelResourcePoolCreatePooledResource(*(_QWORD *)(*(_QWORD *)(a1 + 752) + 8 * v5));
  if (!PooledResource)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      MTLIOAccelCommandBufferStorageAllocResourceAtIndex_cold_1();
    abort();
  }
  v15 = PooledResource;
  if (MTLValidationEnabled())
    -[__n128 setLabel:](v15, "setLabel:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MTLIOAccelResourcePool (dbclass: %d)"), a2));
  v16 = v4 + (v5 << 6);
  *v7 = v15;
  v17 = v15[10].n128_u64[1];
  *(_QWORD *)(v16 + 8) = v17;
  *(_QWORD *)(v16 + 24) = v17;
  *(_QWORD *)(v16 + 16) = (v15[4].n128_u64[1] & 0xFFFFFFFFFFFFFFLL) + v17;
  *(_QWORD *)v16 = v15[6].n128_u64[1];
  result = v15[4];
  *(_QWORD *)(v16 + 56) = v15[5].n128_u64[0];
  *(__n128 *)(v16 + 40) = result;
  return result;
}

void MTLIOAccelCommandBufferStorageReleaseDeviceShmems(uint64_t a1)
{
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;

  v2 = *(os_unfair_lock_s **)(a1 + 32);
  if (v2)
  {
    MTLIOAccelDeviceShmemRelease(v2);
    *(_QWORD *)(a1 + 32) = 0;
  }
  v3 = *(os_unfair_lock_s **)(a1 + 64);
  if (v3)
  {
    MTLIOAccelDeviceShmemRelease(v3);
    *(_QWORD *)(a1 + 64) = 0;
  }
}

void MTLIOAccelCommandBufferStorageBeginKernelCommands(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  int v11;
  int v12;
  const char *v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  uint64_t v17;

  v10 = *(_QWORD *)(a1 + 784);
  if (v10)
  {
    v11 = a2 - *(_DWORD *)(a1 + 40);
  }
  else
  {
    v12 = *(_DWORD *)(a1 + 800);
    if (v12 == -1)
    {
      v10 = *(_QWORD *)(a1 + 776);
    }
    else
    {
      if (v12)
      {
        if (v12 == 1)
        {
          v13 = "storage->currentShmemHeaderType != eIOAccelSegmentListShmemHeaderTypeKernelCommandList";
          v14 = 566;
        }
        else
        {
          v13 = "false";
          v14 = 577;
        }
        MTLReleaseAssertionFailure((uint64_t)"_mtlIOAccelCommandBufferStorageBeginKernelCommandList", v14, (uint64_t)v13, 0, a5, a6, a7, a8, v17);
      }
      v10 = *(_QWORD *)(a1 + 96);
      *(_DWORD *)(*(_QWORD *)(a1 + 88) + 12) = v10 - *(_QWORD *)(a1 + 88);
      *(_QWORD *)(a1 + 776) = v10;
      *(_QWORD *)(a1 + 88) = 0;
      *(_OWORD *)(a1 + 96) = 0u;
      *(_OWORD *)(a1 + 816) = 0u;
    }
    *(_QWORD *)(a1 + 784) = v10;
    *(_DWORD *)(a1 + 800) = 1;
    *(_QWORD *)(a1 + 792) = 0;
    if ((unint64_t)(v10 + 48) >= *(_QWORD *)(a1 + 80))
    {
      MTLIOAccelCommandBufferStorageGrowSegmentList(a1);
      v10 = *(_QWORD *)(a1 + 784);
    }
    *(_QWORD *)v10 = *(_QWORD *)(a1 + 768);
    *(_QWORD *)(v10 + 8) = 0x4000000100000000;
    v11 = a2 - *(_DWORD *)(a1 + 40);
    *(_DWORD *)(v10 + 16) = v11;
  }
  v15 = *(_DWORD *)(a1 + 792);
  v16 = *(_DWORD *)(a1 + 796);
  if (v16)
  {
    if (*(_DWORD *)(v10 + 8 * (v16 - 1) + 20) == v11)
      return;
    ++v15;
  }
  if (v10 + 8 * (unint64_t)(v15 + 1) + 16 >= *(_QWORD *)(a1 + 80))
  {
    MTLIOAccelCommandBufferStorageGrowSegmentList(a1);
    v10 = *(_QWORD *)(a1 + 784);
  }
  *(_DWORD *)(v10 + 8 * v15 + 16) = v11;
  *(_DWORD *)(a1 + 792) = v15;
}

uint64_t MTLIOAccelCommandBufferStorageEndKernelCommands(uint64_t result, int a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *(_QWORD *)(result + 784);
  v3 = a2 - *(_DWORD *)(result + 40);
  v4 = *(unsigned int *)(result + 792);
  *(_DWORD *)(result + 796) = v4 + 1;
  *(_DWORD *)(v2 + 8 * v4 + 20) = v3;
  return result;
}

uint64_t MTLIOAccelCommandBufferStorageFinalizeShmemHeader(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;

  v8 = result;
  v9 = *(_QWORD *)(result + 776);
  v10 = *(_DWORD *)(result + 800);
  if (v10 == 1)
  {
    v12 = *(_QWORD *)(result + 784);
    v13 = *(_DWORD *)(result + 792) + 1;
    *(_DWORD *)(v12 + 8) = v13;
    *(_QWORD *)(result + 776) = v12 + 8 * v13 + 16;
    *(_DWORD *)(result + 800) = -1;
    *(_QWORD *)(result + 784) = 0;
    goto LABEL_7;
  }
  if (!v10)
    goto LABEL_5;
  if (v9 == *(_QWORD *)(result + 72))
  {
    result = _mtlIOAccelCommandBufferStorageBeginSegmentList(result, a2, a3, a4, a5, a6, a7, a8);
LABEL_5:
    v11 = *(_QWORD *)(v8 + 96);
    *(_DWORD *)(*(_QWORD *)(v8 + 88) + 12) = v11 - *(_QWORD *)(v8 + 88);
    *(_QWORD *)(v8 + 776) = v11;
    *(_DWORD *)(v8 + 800) = -1;
    *(_QWORD *)(v8 + 88) = 0;
    *(_OWORD *)(v8 + 96) = 0u;
    *(_OWORD *)(v8 + 816) = 0u;
  }
LABEL_7:
  *(_DWORD *)(v9 + 12) |= 0x80000000;
  return result;
}

uint64_t _mtlIOAccelCommandBufferStorageBeginSegmentList(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  const char *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t vars0;

  v8 = *(_DWORD *)(result + 800);
  if (v8 == -1)
  {
    v11 = *(_QWORD **)(result + 776);
  }
  else
  {
    if (v8 != 1)
    {
      if (v8)
      {
        v9 = "false";
        v10 = 648;
      }
      else
      {
        v9 = "storage->currentShmemHeaderType != eIOAccelSegmentListShmemHeaderTypeSegmentList";
        v10 = 637;
      }
      MTLReleaseAssertionFailure((uint64_t)"_mtlIOAccelCommandBufferStorageBeginSegmentList", v10, (uint64_t)v9, 0, a5, a6, a7, a8, vars0);
    }
    v12 = *(_QWORD *)(result + 784);
    v13 = *(_DWORD *)(result + 792) + 1;
    *(_DWORD *)(v12 + 8) = v13;
    v11 = (_QWORD *)(v12 + 8 * v13 + 16);
    *(_QWORD *)(result + 776) = v11;
    *(_QWORD *)(result + 784) = 0;
  }
  *(_DWORD *)(result + 800) = 0;
  *(_QWORD *)(result + 88) = v11;
  *v11 = *(_QWORD *)(result + 768);
  v11[1] = 0;
  *(_QWORD *)(result + 96) = v11 + 2;
  *(_QWORD *)(result + 104) = v11 + 5;
  return result;
}

uint64_t MTLIOAccelCommandBufferStorageGetSegmentListPointers(uint64_t result, _QWORD *a2, _QWORD *a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v11;

  v11 = (_QWORD *)result;
  if (*(_QWORD *)(result + 88))
  {
    if (!a2)
      goto LABEL_4;
    goto LABEL_3;
  }
  result = _mtlIOAccelCommandBufferStorageBeginSegmentList(result, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8);
  if (a2)
LABEL_3:
    *a2 = v11[11];
LABEL_4:
  if (a3)
    *a3 = v11[12];
  if (a4)
    *a4 = v11[10];
  return result;
}

uint64_t MTLIOAccelCommandBufferStorageBeginSegment(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  uint64_t v10;
  _DWORD *v11;
  uint64_t result;

  v8 = a2;
  v10 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(a1 + 88))
    _mtlIOAccelCommandBufferStorageBeginSegmentList(a1, a2, a3, a4, a5, a6, a7, a8);
  if ((unint64_t)(*(_QWORD *)(a1 + 104) + 2816) >= *(_QWORD *)(a1 + 80))
    MTLIOAccelCommandBufferStorageGrowSegmentList(a1);
  v11 = *(_DWORD **)(a1 + 96);
  v11[3] = 0;
  v11[4] = 0;
  v11[2] = v8 - v10;
  *(_OWORD *)(a1 + 816) = 0u;
  IOAccelResourceListReset();
  result = objc_msgSend(*(id *)(a1 + 744), "globalTraceObjectID");
  **(_QWORD **)(a1 + 96) = result;
  return result;
}

uint64_t MTLIOAccelCommandBufferStorageEndSegment(uint64_t result)
{
  unsigned int v1;
  int v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_DWORD *)(result + 656);
  v2 = *(_DWORD *)(result + 48) - *(_DWORD *)(result + 40);
  v4 = *(_QWORD *)(result + 88);
  v3 = *(_DWORD **)(result + 96);
  v3[4] = *(_DWORD *)(result + 652);
  v3[5] = v1;
  v3[3] = v2;
  ++*(_DWORD *)(v4 + 8);
  ++*(_DWORD *)(result + 808);
  v5 = *(_QWORD *)(result + 104);
  v6 = v5 + 88 * v1;
  *(_QWORD *)(result + 816) = v3;
  *(_QWORD *)(result + 824) = v5;
  *(_QWORD *)(result + 96) = v6;
  *(_QWORD *)(result + 104) = v6 + 24;
  return result;
}

uint64_t MTLIOAccelCommandBufferStorageResumeSegment(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 88);
  if (!v1)
    return 0;
  v2 = *(_QWORD *)(a1 + 816);
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(a1 + 824);
  if (!v3)
    return 0;
  *(_QWORD *)(a1 + 96) = v2;
  *(_QWORD *)(a1 + 104) = v3;
  *(_QWORD *)(a1 + 816) = 0;
  *(_QWORD *)(a1 + 824) = 0;
  --*(_DWORD *)(v1 + 8);
  --*(_DWORD *)(a1 + 808);
  *(_QWORD *)(v2 + 16) = 0;
  *(_DWORD *)(v2 + 12) = 0;
  return 1;
}

void MTLIOAccelCommandBufferStoragePoolCreate(uint64_t a1)
{
  void *v2;

  v2 = malloc_type_malloc(0x28uLL, 0x10A004062A34E2AuLL);
  if (v2)
  {
    *((_QWORD *)v2 + 4) = a1;
    *((_QWORD *)v2 + 1) = v2;
    *((_QWORD *)v2 + 2) = 0;
    atomic_store(1u, (unsigned int *)v2 + 6);
    *(_QWORD *)v2 = 0;
  }
}

void MTLIOAccelCommandBufferStoragePoolDealloc(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = *a1;
  if (v9)
  {
    do
    {
      v11 = *(_QWORD *)(v9 + 16);
      v10 = *(uint64_t **)(v9 + 24);
      if (v11)
      {
        *(_QWORD *)(v11 + 24) = v10;
        v10 = *(uint64_t **)(v9 + 24);
      }
      else
      {
        a1[1] = (uint64_t)v10;
      }
      *v10 = v11;
      --*((_DWORD *)a1 + 5);
      if (*(_DWORD *)(v9 + 800) != -2)
        MTLReleaseAssertionFailure((uint64_t)"MTLIOAccelCommandBufferStoragePoolDealloc", 838, (uint64_t)"storage->currentShmemHeaderType == -2", 0, a5, a6, a7, a8, v12);
      *(_DWORD *)(v9 + 800) = -1;
      MTLIOAccelCommandBufferStorageDealloc(v9);
      v9 = v11;
    }
    while (v11);
  }
  free(a1);
}

void MTLIOAccelCommandBufferStoragePoolPurge(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  v7 = *(_QWORD *)a1;
  if (*(_QWORD *)a1)
  {
    do
    {
      v9 = *(_QWORD *)(v7 + 16);
      v8 = *(uint64_t **)(v7 + 24);
      if (v9)
      {
        *(_QWORD *)(v9 + 24) = v8;
        v8 = *(uint64_t **)(v7 + 24);
      }
      else
      {
        *(_QWORD *)(a1 + 8) = v8;
      }
      *v8 = v9;
      --*(_DWORD *)(a1 + 20);
      if (*(_DWORD *)(v7 + 800) != -2)
        MTLReleaseAssertionFailure((uint64_t)"MTLIOAccelCommandBufferStoragePoolPurge", 858, (uint64_t)"storage->currentShmemHeaderType == -2", 0, v3, v4, v5, v6, v10);
      *(_DWORD *)(v7 + 800) = -1;
      MTLIOAccelCommandBufferStorageDealloc(v7);
      v7 = v9;
    }
    while (v9);
  }
  os_unfair_lock_unlock(v2);
}

_QWORD *MTLIOAccelCommandBufferStoragePoolCreateStorage(uint64_t a1, int a2)
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *Ext;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  MTLResourceList *ResourceList;
  uint64_t v15;

  v4 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  Ext = *(_QWORD **)a1;
  if (!*(_QWORD *)a1)
  {
    os_unfair_lock_unlock(v4);
    Ext = MTLIOAccelCommandBufferStorageCreateExt(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 32) + 624, a2);
    if (!Ext)
      return Ext;
    goto LABEL_14;
  }
  v10 = Ext[2];
  v11 = (_QWORD *)Ext[3];
  if (v10)
  {
    *(_QWORD *)(v10 + 24) = v11;
    v11 = (_QWORD *)Ext[3];
  }
  else
  {
    *(_QWORD *)(a1 + 8) = v11;
  }
  *v11 = v10;
  --*(_DWORD *)(a1 + 20);
  Ext[2] = 0;
  Ext[3] = 0;
  if (*((_DWORD *)Ext + 200) != -2)
    MTLReleaseAssertionFailure((uint64_t)"MTLIOAccelCommandBufferStoragePoolCreateStorage", 881, (uint64_t)"storage->currentShmemHeaderType == -2", 0, v5, v6, v7, v8, v15);
  *((_DWORD *)Ext + 200) = -1;
  os_unfair_lock_unlock(v4);
  v12 = (_QWORD *)Ext[87];
  if (!a2)
  {
    if (!v12)
    {
LABEL_14:
      Ext[1] = a1;
      return Ext;
    }
    MTLResourceListRelease(v12);
    ResourceList = 0;
LABEL_13:
    Ext[87] = ResourceList;
    goto LABEL_14;
  }
  if (!v12)
  {
    ResourceList = MTLResourceListPoolCreateResourceList(*(MTLResourceListPool **)(*(_QWORD *)(a1 + 32) + 656));
    goto LABEL_13;
  }
  return Ext;
}

void *MTLResourceListGrowAndReset(int32x2_t *a1)
{
  unsigned int v2;
  int v3;
  int32x2_t v4;
  void *result;
  uint8_t v6[16];

  if (a1->i32[0] == 2048)
  {
    v2 = 4096;
    v3 = a1->i32[1] + 1;
    a1->i32[0] = 4096;
    a1->i32[1] = v3;
  }
  else
  {
    free(*(void **)&a1[2]);
    free(*(void **)&a1[3]);
    free(*(void **)&a1[1]);
    v4.i32[0] = vadd_s32(*a1, *a1).u32[0];
    v2 = v4.i32[0];
    v4.i32[1] = vadd_s32(*a1, (int32x2_t)0x100000001).i32[1];
    *a1 = v4;
    if (v4.i32[0] < 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_fault_impl(&dword_182636000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "MTLResourceListRebuild() failed.  Hash limit reached", v6, 2u);
      }
      abort();
    }
  }
  a1[2] = (int32x2_t)malloc_type_calloc(v2, 4uLL, 0x100004052888210uLL);
  a1[3] = (int32x2_t)malloc_type_malloc(8 * a1->u32[0], 0x100004000313F17uLL);
  result = malloc_type_calloc((unint64_t)a1->u32[0] >> 3, 1uLL, 0x84E4621BuLL);
  a1[1] = (int32x2_t)result;
  return result;
}

const __CFString *MTLPurgeableStateString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("Unknown");
  else
    return off_1E0FE5290[a1 - 1];
}

void *MTLResourceOptionsString(int a1)
{
  void *v2;
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  const __CFString *v12;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = v2;
  v4 = CFSTR("MTLResourceCPUCacheModeInvalid ");
  if ((a1 & 0xF) == 0)
    v4 = CFSTR("MTLResourceCPUCacheModeDefaultCache ");
  if ((a1 & 0xF) == 1)
    v5 = CFSTR("MTLResourceCPUCacheModeWriteCombined ");
  else
    v5 = v4;
  objc_msgSend(v2, "appendString:", v5);
  v6 = CFSTR("MTLResourceStorageModePrivate ");
  v7 = CFSTR("MTLResourceStorageModeInvalid ");
  v8 = a1 & 0xF0;
  if ((a1 & 0xF0) == 0)
    v7 = CFSTR("MTLResourceStorageModeShared ");
  if (v8 != 32)
    v6 = v7;
  if (v8 == 48)
    v9 = CFSTR("MTLResourceStorageModeMemoryless ");
  else
    v9 = v6;
  objc_msgSend(v3, "appendString:", v9);
  v10 = a1 & 0x300;
  if ((a1 & 0x300) != 0)
  {
    v11 = CFSTR("MTLResourceHazardTrackingModeInvalid ");
    if (v10 == 512)
      v11 = CFSTR("MTLResourceHazardTrackingModeTracked ");
    if (v10 == 256)
      v12 = CFSTR("MTLResourceHazardTrackingModeUntracked ");
    else
      v12 = v11;
  }
  else
  {
    v12 = CFSTR("MTLResourceHazardTrackingModeDefault ");
  }
  objc_msgSend(v3, "appendString:", v12);
  if ((a1 & 0x1000000) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("MTLResourceReadOnly"));
  return v3;
}

const __CFString *MTLHazardTrackingModeString(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("Unknown");
  else
    return off_1E0FE52B0[a1];
}

uint64_t MTLDataTypeGetSignedType(uint64_t result)
{
  uint64_t v1;

  v1 = result - 33;
  if ((unint64_t)(result - 33) <= 0x17 && ((0xFF0F0Fu >> v1) & 1) != 0)
    return qword_18281B568[v1];
  return result;
}

uint64_t MTLDataTypeGetVectorDataType(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = (a2 - 1);
  if (a1 > 44)
  {
    if (a1 > 80)
    {
      v3 = v2 + 81;
      if (v2 >= 4)
        v3 = 0;
      v10 = v2 + 85;
      if (v2 >= 4)
        v10 = 0;
      v5 = v2 >= 4;
      v6 = v2 + 121;
      if (v5)
        v6 = 0;
      if (a1 != 121)
        v6 = 0;
      if (a1 == 85)
        v6 = v10;
      v7 = a1 == 81;
    }
    else
    {
      v3 = v2 + 45;
      if (v2 >= 4)
        v3 = 0;
      v8 = v2 + 49;
      if (v2 >= 4)
        v8 = 0;
      v5 = v2 >= 4;
      v6 = v2 + 53;
      if (v5)
        v6 = 0;
      if (a1 != 53)
        v6 = 0;
      if (a1 == 49)
        v6 = v8;
      v7 = a1 == 45;
    }
  }
  else if (a1 > 32)
  {
    v3 = v2 + 33;
    if (v2 >= 4)
      v3 = 0;
    v9 = v2 + 37;
    if (v2 >= 4)
      v9 = 0;
    v5 = v2 >= 4;
    v6 = v2 + 41;
    if (v5)
      v6 = 0;
    if (a1 != 41)
      v6 = 0;
    if (a1 == 37)
      v6 = v9;
    v7 = a1 == 33;
  }
  else
  {
    v3 = v2 + 3;
    if (v2 >= 4)
      v3 = 0;
    v4 = v2 + 16;
    if (v2 >= 4)
      v4 = 0;
    v5 = v2 >= 4;
    v6 = v2 + 29;
    if (v5)
      v6 = 0;
    if (a1 != 29)
      v6 = 0;
    if (a1 == 16)
      v6 = v4;
    v7 = a1 == 3;
  }
  if (v7)
    return v3;
  else
    return v6;
}

const char *MTLDataTypeGetShaderTypeName(uint64_t a1, int a2)
{
  const char *result;

  switch(a2)
  {
    case 1:
      if (a1 > 44)
      {
        if (a1 > 80)
        {
          switch(a1)
          {
            case 'Q':
              result = "long";
              break;
            case 'U':
              result = "ulong";
              break;
            case 'y':
              result = "bfloat";
              break;
            default:
              goto LABEL_78;
          }
        }
        else
        {
          switch(a1)
          {
            case '-':
              result = "char";
              break;
            case '1':
              result = "uchar";
              break;
            case '5':
              result = "BOOL";
              break;
            default:
              goto LABEL_78;
          }
        }
      }
      else if (a1 > 32)
      {
        switch(a1)
        {
          case '!':
            result = "uint";
            break;
          case '%':
            result = "short";
            break;
          case ')':
            result = "ushort";
            break;
          default:
            goto LABEL_78;
        }
      }
      else
      {
        switch(a1)
        {
          case 3:
            result = "float";
            break;
          case 16:
            result = "half";
            break;
          case 29:
            result = "int";
            break;
          default:
            goto LABEL_78;
        }
      }
      break;
    case 2:
      if (a1 > 44)
      {
        if (a1 > 80)
        {
          switch(a1)
          {
            case 'Q':
              result = "long2";
              break;
            case 'U':
              result = "ulong2";
              break;
            case 'y':
              result = "bfloat2";
              break;
            default:
              goto LABEL_78;
          }
        }
        else
        {
          switch(a1)
          {
            case '-':
              result = "char2";
              break;
            case '1':
              result = "uchar2";
              break;
            case '5':
              result = "BOOL2";
              break;
            default:
              goto LABEL_78;
          }
        }
      }
      else if (a1 > 32)
      {
        switch(a1)
        {
          case '!':
            result = "uint2";
            break;
          case '%':
            result = "short2";
            break;
          case ')':
            result = "ushort2";
            break;
          default:
            goto LABEL_78;
        }
      }
      else
      {
        switch(a1)
        {
          case 3:
            result = "float2";
            break;
          case 16:
            result = "half2";
            break;
          case 29:
            result = "int2";
            break;
          default:
            goto LABEL_78;
        }
      }
      break;
    case 3:
      if (a1 > 44)
      {
        if (a1 > 80)
        {
          switch(a1)
          {
            case 'Q':
              result = "long3";
              break;
            case 'U':
              result = "ulong3";
              break;
            case 'y':
              result = "bfloat3";
              break;
            default:
              goto LABEL_78;
          }
        }
        else
        {
          switch(a1)
          {
            case '-':
              result = "char3";
              break;
            case '1':
              result = "uchar3";
              break;
            case '5':
              result = "BOOL3";
              break;
            default:
              goto LABEL_78;
          }
        }
      }
      else if (a1 > 32)
      {
        switch(a1)
        {
          case '!':
            result = "uint3";
            break;
          case '%':
            result = "short3";
            break;
          case ')':
            result = "ushort3";
            break;
          default:
            goto LABEL_78;
        }
      }
      else
      {
        switch(a1)
        {
          case 3:
            result = "float3";
            break;
          case 16:
            result = "half3";
            break;
          case 29:
            result = "int3";
            break;
          default:
            goto LABEL_78;
        }
      }
      break;
    case 4:
      if (a1 > 44)
      {
        if (a1 > 80)
        {
          switch(a1)
          {
            case 'Q':
              result = "long4";
              break;
            case 'U':
              result = "ulong4";
              break;
            case 'y':
              result = "bfloat4";
              break;
            default:
              goto LABEL_78;
          }
        }
        else
        {
          switch(a1)
          {
            case '-':
              result = "char4";
              break;
            case '1':
              result = "uchar4";
              break;
            case '5':
              result = "BOOL4";
              break;
            default:
              goto LABEL_78;
          }
        }
      }
      else if (a1 > 32)
      {
        switch(a1)
        {
          case '!':
            result = "uint4";
            break;
          case '%':
            result = "short4";
            break;
          case ')':
            result = "ushort4";
            break;
          default:
            goto LABEL_78;
        }
      }
      else
      {
        switch(a1)
        {
          case 3:
            result = "float4";
            break;
          case 16:
            result = "half4";
            break;
          case 29:
            result = "int4";
            break;
          default:
            goto LABEL_78;
        }
      }
      break;
    default:
LABEL_78:
      result = "";
      break;
  }
  return result;
}

uint64_t MTLDataTypeGetAlignment(uint64_t a1)
{
  if ((unint64_t)(a1 - 3) > 0x84)
    return 0;
  else
    return qword_18281BA50[a1 - 3];
}

void validateMTLDataType(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 >= 0x3D && (a1 - 78 > 0x39 || ((1 << (a1 - 78)) & 0x3FE79E0000007FFLL) == 0))
    MTLReportFailure(0, "validateMTLDataType", 356, (uint64_t)CFSTR("type (%lu) is not a valid MTLDataType."), a5, a6, a7, a8, a1);
}

void validateMTLDataTypeConstant(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((unint64_t)(a1 - 3) >= 0x36
    && ((unint64_t)(a1 - 81) > 0x36 || ((1 << (a1 - 81)) & 0x7FCF00000000FFLL) == 0))
  {
    if (a1)
      MTLReportFailure(0, "validateMTLDataTypeConstant", 380, (uint64_t)CFSTR("type (%lu) is not a const-like MTLDataType."), a5, a6, a7, a8, a1);
  }
}

void MTLPipelineCollection::MTLPipelineCollection(MTLPipelineCollection *this, uint64_t a2)
{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 4) = (char *)this + 40;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 9) = 0;
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = (char *)this + 64;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_DWORD *)this + 28) = 1065353216;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *((_DWORD *)this + 38) = 1065353216;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((_OWORD *)this + 12) = 0u;
  *((_QWORD *)this + 26) = 0;
  *((_DWORD *)this + 54) = 1065353216;
  *((_QWORD *)this + 30) = 0;
  *((_QWORD *)this + 29) = 0;
  *((_QWORD *)this + 28) = (char *)this + 232;
  *(_OWORD *)((char *)this + 248) = 0u;
  *(_OWORD *)((char *)this + 264) = 0u;
  *((_DWORD *)this + 70) = 1065353216;
  *((_OWORD *)this + 18) = 0u;
  *((_OWORD *)this + 19) = 0u;
  *((_QWORD *)this + 40) = 0;
  *((_DWORD *)this + 82) = 1065353216;
  *((_OWORD *)this + 21) = 0u;
  *((_OWORD *)this + 22) = 0u;
  *((_OWORD *)this + 23) = 0u;
  *((_QWORD *)this + 48) = 0;
  *((_DWORD *)this + 98) = 1065353216;
  *((_OWORD *)this + 25) = 0u;
  *((_OWORD *)this + 26) = 0u;
  *((_OWORD *)this + 27) = 0u;
  *((_QWORD *)this + 56) = 0;
  *((_DWORD *)this + 114) = 1065353216;
  *((_QWORD *)this + 64) = 0;
  *((_OWORD *)this + 30) = 0u;
  *((_OWORD *)this + 31) = 0u;
  *((_OWORD *)this + 29) = 0u;
  *((_DWORD *)this + 130) = 1065353216;
  *((_QWORD *)this + 67) = 0;
  *((_QWORD *)this + 66) = 0;
  *((_QWORD *)this + 68) = 0;
  *((_QWORD *)this + 36) = dispatch_queue_create("pipelineCollection", 0);
  *((_QWORD *)this + 3) = a2;
}

void MTLPipelineCollection::~MTLPipelineCollection(MTLPipelineCollection *this)
{
  uint64_t *i;
  MTLPipelineLibrarySerializer::FunctionDescriptor *v3;
  __int128 *j;
  uint64_t *k;
  id *v6;
  MTLPipelineCollection *v7;
  id *v8;
  MTLPipelineCollection *v9;
  MTLPipelineCollection *v10;
  BOOL v11;
  MTLPipelineCollection *v12;
  id *v13;
  MTLPipelineCollection *v14;
  MTLPipelineCollection *v15;
  NSObject *v16;
  void *v17;
  std::string __p;
  id *v19;
  std::string v20;
  MTLPipelineLibrarySerializer::FunctionDescriptor *v21;
  uint64_t *v22;

  for (i = (uint64_t *)*((_QWORD *)this + 12); i; i = (uint64_t *)*i)
  {
    if (*((char *)i + 39) < 0)
      std::string::__init_copy_ctor_external(&v20, (const std::string::value_type *)i[2], i[3]);
    else
      v20 = *(std::string *)(i + 2);
    v3 = (MTLPipelineLibrarySerializer::FunctionDescriptor *)i[5];
    v21 = v3;
    if (v3)
    {
      MTLPipelineLibrarySerializer::FunctionDescriptor::~FunctionDescriptor(v3);
      MEMORY[0x186DABFBC]();
    }
    if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v20.__r_.__value_.__l.__data_);
  }
  for (j = (__int128 *)*((_QWORD *)this + 25); j; j = *(__int128 **)j)
  {
    std::pair<std::string const,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>::pair[abi:ne180100](&v20, j + 1);
    for (k = v22; k; k = (uint64_t *)*k)
    {
      if (*((char *)k + 39) < 0)
        std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)k[2], k[3]);
      else
        __p = *(std::string *)(k + 2);
      v6 = (id *)k[5];
      v19 = v6;
      if (v6)
      {
        MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor::~MTLSpecializedFunctionDescriptor(v6);
        MEMORY[0x186DABFBC]();
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table((uint64_t)&v21);
    if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v20.__r_.__value_.__l.__data_);
  }
  v7 = (MTLPipelineCollection *)*((_QWORD *)this + 4);
  if (v7 != (MTLPipelineCollection *)((char *)this + 40))
  {
    do
    {
      v8 = (id *)*((_QWORD *)v7 + 8);
      if (v8)
      {
        MTLPipelineLibrarySerializer::LibraryDescriptor::~LibraryDescriptor(v8);
        MEMORY[0x186DABFBC]();
      }
      v9 = (MTLPipelineCollection *)*((_QWORD *)v7 + 1);
      if (v9)
      {
        do
        {
          v10 = v9;
          v9 = *(MTLPipelineCollection **)v9;
        }
        while (v9);
      }
      else
      {
        do
        {
          v10 = (MTLPipelineCollection *)*((_QWORD *)v7 + 2);
          v11 = *(_QWORD *)v10 == (_QWORD)v7;
          v7 = v10;
        }
        while (!v11);
      }
      v7 = v10;
    }
    while (v10 != (MTLPipelineCollection *)((char *)this + 40));
  }
  v12 = (MTLPipelineCollection *)*((_QWORD *)this + 7);
  if (v12 != (MTLPipelineCollection *)((char *)this + 64))
  {
    do
    {
      v13 = (id *)*((_QWORD *)v12 + 8);
      if (v13)
      {
        MTLPipelineLibrarySerializer::StitchedLibraryDescriptor::~StitchedLibraryDescriptor(v13);
        MEMORY[0x186DABFBC]();
      }
      v14 = (MTLPipelineCollection *)*((_QWORD *)v12 + 1);
      if (v14)
      {
        do
        {
          v15 = v14;
          v14 = *(MTLPipelineCollection **)v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          v15 = (MTLPipelineCollection *)*((_QWORD *)v12 + 2);
          v11 = *(_QWORD *)v15 == (_QWORD)v12;
          v12 = v15;
        }
        while (!v11);
      }
      v12 = v15;
    }
    while (v15 != (MTLPipelineCollection *)((char *)this + 64));
  }
  v16 = *((_QWORD *)this + 36);
  if (v16)
    dispatch_release(v16);
  MTLPipelineDescriptorHash::~MTLPipelineDescriptorHash((MTLPipelineDescriptorHash *)((char *)this + 488));
  MTLPipelineDescriptorHash::~MTLPipelineDescriptorHash((MTLPipelineDescriptorHash *)((char *)this + 424));
  MTLPipelineDescriptorHash::~MTLPipelineDescriptorHash((MTLPipelineDescriptorHash *)((char *)this + 360));
  MTLPipelineDescriptorHash::~MTLPipelineDescriptorHash((MTLPipelineDescriptorHash *)((char *)this + 296));
  std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table((uint64_t)this + 248);
  std::__tree<unsigned long,flexbuffers::Builder::KeyOffsetCompare,std::allocator<unsigned long>>::destroy((uint64_t)this + 224, *((_QWORD **)this + 29));
  std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>>::~__hash_table((uint64_t)this + 184);
  v17 = (void *)*((_QWORD *)this + 20);
  if (v17)
  {
    *((_QWORD *)this + 21) = v17;
    operator delete(v17);
  }
  std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table((uint64_t)this + 120);
  std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table((uint64_t)this + 80);
  std::__tree<unsigned long,flexbuffers::Builder::KeyOffsetCompare,std::allocator<unsigned long>>::destroy((uint64_t)this + 56, *((_QWORD **)this + 8));
  std::__tree<unsigned long,flexbuffers::Builder::KeyOffsetCompare,std::allocator<unsigned long>>::destroy((uint64_t)this + 32, *((_QWORD **)this + 5));
  if (*((char *)this + 23) < 0)
    operator delete(*(void **)this);
}

uint64_t std::pair<std::string const,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>::~pair(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table(a1 + 24);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

void MTLPipelineCollection::addLibraryData(MTLPipelineCollection *this, char a2, char a3, MTLLibraryData *a4)
{
  NSObject *v4;
  _QWORD block[6];
  char v6;
  char v7;

  v4 = *((_QWORD *)this + 36);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___ZN21MTLPipelineCollection14addLibraryDataEbbP14MTLLibraryData_block_invoke;
  block[3] = &__block_descriptor_50_e5_v8__0l;
  block[4] = this;
  block[5] = a4;
  v6 = a2;
  v7 = a3;
  dispatch_sync(v4, block);
}

void ___ZN21MTLPipelineCollection14addLibraryDataEbbP14MTLLibraryData_block_invoke(uint64_t a1)
{
  __int128 *v2;
  void *v3;
  _OWORD *v4;
  __int128 v5;
  void *v6;
  void *v7;
  _OWORD *v8;
  __int128 v9;
  id *v10;
  _OWORD *v11;
  std::string __p;
  _OWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(__int128 **)(a1 + 32);
  v3 = (void *)MEMORY[0x186DAC640]();
  v4 = (_OWORD *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 296))(*(_QWORD *)(a1 + 40));
  v5 = v4[1];
  v13[0] = *v4;
  v13[1] = v5;
  if ((uint64_t *)((char *)v2 + 40) == std::__tree<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::__map_value_compare<MTLLibraryIdentifier,std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::less<MTLLibraryIdentifier>,true>,std::allocator<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>>>::find<MTLLibraryIdentifier>((uint64_t)(v2 + 2), (unsigned int *)v13))
  {
    if (*(_BYTE *)(a1 + 48))
      v6 = (void *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 32))(*(_QWORD *)(a1 + 40));
    else
      v6 = 0;
    if (*(_BYTE *)(a1 + 49))
      v7 = (void *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 304))(*(_QWORD *)(a1 + 40));
    else
      v7 = 0;
    v8 = (_OWORD *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 296))(*(_QWORD *)(a1 + 40));
    if (*((char *)v2 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v2, *((_QWORD *)v2 + 1));
    }
    else
    {
      v9 = *v2;
      __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v2 + 2);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v9;
    }
    v10 = (id *)libraryDescriptorFromLibraryData(v7, v8, v6, (uint64_t *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    v11 = (_OWORD *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 296))(*(_QWORD *)(a1 + 40));
    MTLPipelineCollection::addLibraryDescriptor((uint64_t **)v2, v10, v11);
  }
  objc_autoreleasePoolPop(v3);
}

void sub_1827A3EC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t libraryDescriptorFromLibraryData(void *a1, _OWORD *a2, void *a3, uint64_t *a4)
{
  void *v7;
  __int128 v8;
  std::string *p_p;
  uint64_t v10;
  id v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  std::string __p;
  _OWORD v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v7 = (void *)objc_msgSend(a1, "lastPathComponent");
  }
  else
  {
    v8 = a2[1];
    v17[0] = *a2;
    v17[1] = v8;
    HashToString((uint64_t)v17, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s.metallib"), p_p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  v10 = objc_msgSend(v7, "stringByDeletingPathExtension");
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (*((char *)a4 + 23) < 0)
    a4 = (uint64_t *)*a4;
  v12 = a1 == 0;
  v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%s%@"), a4, v10);
  v14 = operator new();
  *(_QWORD *)(v14 + 24) = 0;
  *(_QWORD *)v14 = 0;
  *(_QWORD *)(v14 + 8) = 0;
  *(_BYTE *)(v14 + 16) = 0;
  *(_QWORD *)v14 = objc_msgSend(v13, "copy");
  *(_QWORD *)(v14 + 8) = objc_msgSend(v7, "copy");
  *(_BYTE *)(v14 + 16) = v12;
  *(_QWORD *)(v14 + 24) = a3;

  return v14;
}

void sub_1827A4050(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_OWORD *MTLPipelineCollection::addLibraryDescriptor(uint64_t **a1, id *a2, _OWORD *a3)
{
  void *v6;
  char v7;
  char v8;
  void *v9;
  __int128 v10;
  void **v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  __int128 v23;
  _OWORD *result;
  void **v25;
  void *__p[2];
  __int128 v27;
  _OWORD v28[2];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(a2[1], "UTF8String"));
  v6 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string>((uint64_t)(a1 + 31), (unsigned __int8 *)__p, (uint64_t)__p);
  v8 = v7;
  if (SBYTE7(v27) < 0)
  {
    operator delete(__p[0]);
    if ((v8 & 1) != 0)
      goto LABEL_16;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_16;
  }
  v9 = (void *)MEMORY[0x186DAC640](v6);
  v10 = a3[1];
  v28[0] = *a3;
  v28[1] = v10;
  HashToString((uint64_t)v28, (std::string *)__p);
  if ((SBYTE7(v27) & 0x80u) == 0)
    v11 = __p;
  else
    v11 = (void **)__p[0];
  v12 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s.metallib"), v11);
  v13 = objc_msgSend(v12, "stringByDeletingPathExtension");
  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  v15 = (uint64_t *)a1;
  if (*((char *)a1 + 23) < 0)
    v15 = *a1;
  v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%s%@"), v15, v13);

  *a2 = (id)objc_msgSend(v16, "copy");
  a2[1] = (id)objc_msgSend(v12, "copy");

  if (SBYTE7(v27) < 0)
    operator delete(__p[0]);
  objc_autoreleasePoolPop(v9);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(a2[1], "UTF8String"));
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string>((uint64_t)(a1 + 31), (unsigned __int8 *)__p, (uint64_t)__p);
  v22 = v21;
  if (SBYTE7(v27) < 0)
    operator delete(__p[0]);
  if ((v22 & 1) == 0)
    MTLReportFailure(0, "addLibraryDescriptor", 184, (uint64_t)CFSTR("collected two libraries with the same name (%@)"), v17, v18, v19, v20, (uint64_t)a2[1]);
LABEL_16:
  NSLog(CFSTR("adding library with name: %s filePath: %s"), objc_msgSend(*a2, "UTF8String"), objc_msgSend(a2[1], "UTF8String"));
  v23 = a3[1];
  *(_OWORD *)__p = *a3;
  v27 = v23;
  v25 = __p;
  result = std::__tree<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::__map_value_compare<MTLLibraryIdentifier,std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::less<MTLLibraryIdentifier>,true>,std::allocator<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>>>::__emplace_unique_key_args<MTLLibraryIdentifier,std::piecewise_construct_t const&,std::tuple<MTLLibraryIdentifier&&>,std::tuple<>>(a1 + 4, (unsigned int *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v25);
  *((_QWORD *)result + 8) = a2;
  return result;
}

void sub_1827A42C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void MTLPipelineCollection::addDynamicLibraryData(uint64_t a1, char a2, char a3, uint64_t a4)
{
  NSObject *v4;
  _QWORD block[6];
  char v6;
  char v7;

  v4 = *(NSObject **)(a1 + 288);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___ZN21MTLPipelineCollection21addDynamicLibraryDataEbbPU28objcproto17MTLDynamicLibrary11objc_object_block_invoke;
  block[3] = &unk_1E0FE52F0;
  block[4] = a4;
  block[5] = a1;
  v6 = a2;
  v7 = a3;
  dispatch_sync(v4, block);
}

void ___ZN21MTLPipelineCollection21addDynamicLibraryDataEbbPU28objcproto17MTLDynamicLibrary11objc_object_block_invoke(uint64_t a1)
{
  __int128 *v2;
  void *v3;
  _OWORD *v4;
  __int128 v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_data_t v8;
  void *v9;
  __int128 v10;
  id *v11;
  std::string __p;
  _OWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(__int128 **)(a1 + 40);
  v3 = (void *)MEMORY[0x186DAC640]();
  v4 = (_OWORD *)objc_msgSend(*(id *)(a1 + 32), "libraryUUID");
  v5 = v4[1];
  v13[0] = *v4;
  v13[1] = v5;
  if ((uint64_t *)((char *)v2 + 40) == std::__tree<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::__map_value_compare<MTLLibraryIdentifier,std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::less<MTLLibraryIdentifier>,true>,std::allocator<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>>>::find<MTLLibraryIdentifier>((uint64_t)(v2 + 2), (unsigned int *)v13))
  {
    if (*(_BYTE *)(a1 + 48) && (v6 = objc_msgSend(*(id *)(a1 + 32), "airData"), (v7 = v6) != 0))
    {
      v8 = _MTLDispatchDataToNSData(v6, 0);
      dispatch_release(v7);
    }
    else
    {
      v8 = 0;
    }
    if (*(_BYTE *)(a1 + 49))
      v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "libraryPath");
    else
      v9 = 0;
    if (*((char *)v2 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v2, *((_QWORD *)v2 + 1));
    }
    else
    {
      v10 = *v2;
      __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v2 + 2);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v10;
    }
    v11 = (id *)libraryDescriptorFromLibraryData(v9, v4, v8, (uint64_t *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    MTLPipelineCollection::addLibraryDescriptor((uint64_t **)v2, v11, v4);
  }
  objc_autoreleasePoolPop(v3);
}

void sub_1827A44B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_1827A4554(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

BOOL shouldCollectLibraryData(uint64_t a1)
{
  return *(_QWORD *)(a1 + 456) != 0;
}

void MTLPipelineCollection::addLibrary(uint64_t a1, void *a2)
{
  uint64_t v4;
  BOOL v5;
  NSObject *v6;
  _QWORD block[6];
  BOOL v8;
  char v9;

  v4 = objc_msgSend(a2, "libraryData");
  *(_QWORD *)objc_msgSend(a2, "cacheEntry") = a1;
  v5 = *(_QWORD *)(objc_msgSend(a2, "device") + 456) != 0;
  v6 = *(NSObject **)(a1 + 288);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___ZN21MTLPipelineCollection14addLibraryDataEbbP14MTLLibraryData_block_invoke;
  block[3] = &__block_descriptor_50_e5_v8__0l;
  block[4] = a1;
  block[5] = v4;
  v8 = v5;
  v9 = 1;
  dispatch_sync(v6, block);
}

void MTLPipelineCollection::addDynamicLibrary(uint64_t a1, void *a2)
{
  BOOL v4;
  NSObject *v5;
  _QWORD block[6];
  BOOL v7;
  char v8;

  v4 = *(_QWORD *)(objc_msgSend(a2, "device") + 456) != 0;
  v5 = *(NSObject **)(a1 + 288);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___ZN21MTLPipelineCollection21addDynamicLibraryDataEbbPU28objcproto17MTLDynamicLibrary11objc_object_block_invoke;
  block[3] = &unk_1E0FE52F0;
  block[4] = a2;
  block[5] = a1;
  v7 = v4;
  v8 = 1;
  dispatch_sync(v5, block);
}

void MTLPipelineCollection::addFunction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v4;
  _QWORD v5[8];

  v4 = *(NSObject **)(a1 + 288);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ___ZN21MTLPipelineCollection11addFunctionEPU22objcproto11MTLFunction11objc_objectP14MTLLibraryDatam_block_invoke;
  v5[3] = &unk_1E0FE5318;
  v5[4] = a2;
  v5[5] = a1;
  v5[6] = a3;
  v5[7] = a4;
  dispatch_sync(v4, v5);
}

void ___ZN21MTLPipelineCollection11addFunctionEPU22objcproto11MTLFunction11objc_objectP14MTLLibraryDatam_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  _OWORD *v4;
  __int128 v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  MTLPipelineLibrarySerializer::FunctionDescriptor *v13;
  unint64_t v14;
  MTLPipelineLibrarySerializer::FunctionDescriptor **v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  MTLPipelineLibrarySerializer::FunctionDescriptor **v28;
  char *v29;
  char *v30;
  char *v31;
  MTLPipelineLibrarySerializer::FunctionDescriptor *v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  std::string __p;
  std::string *p_p;
  _OWORD v39[2];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 40);
  v3 = (void *)MEMORY[0x186DAC640]();
  v4 = (_OWORD *)objc_msgSend(*(id *)(a1 + 32), "bitCodeHash");
  v5 = v4[1];
  v39[0] = *v4;
  v39[1] = v5;
  HashToString((uint64_t)v39, &__p);
  v6 = std::__hash_table<std::__hash_value_type<std::string,DataBlock>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,DataBlock>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,DataBlock>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,DataBlock>>>::find<std::string>(v2 + 10, (unsigned __int8 *)&__p);
  v7 = v6;
  if (v6)
  {
    if ((*(_BYTE *)(a1 + 56) & 1) != 0)
    {
      v8 = *((_QWORD *)v6 + 5);
      v9 = *(_QWORD *)(v8 + 16);
      if ((v9 & 1) == 0)
      {
        *(_QWORD *)(v8 + 16) = v9 | 1;
        v10 = v2[22];
        v11 = (_QWORD *)v2[21];
        if ((unint64_t)v11 < v10)
        {
          *v11 = v8;
          v12 = v11 + 1;
LABEL_33:
          v2[21] = v12;
          goto LABEL_34;
        }
        v22 = v2[20];
        v23 = ((uint64_t)v11 - v22) >> 3;
        if ((unint64_t)(v23 + 1) >> 61)
          std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
        v24 = v10 - v22;
        v25 = v24 >> 2;
        if (v24 >> 2 <= (unint64_t)(v23 + 1))
          v25 = v23 + 1;
        if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8)
          v26 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v26 = v25;
        if (v26)
        {
          v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(v2 + 22), v26);
          v8 = *((_QWORD *)v7 + 5);
        }
        else
        {
          v27 = 0;
        }
        v33 = &v27[8 * v23];
        v34 = &v27[8 * v26];
        *(_QWORD *)v33 = v8;
        v12 = v33 + 8;
        v35 = (char *)v2[20];
        v30 = (char *)v2[21];
        if (v30 != v35)
        {
          do
          {
            v36 = *((_QWORD *)v30 - 1);
            v30 -= 8;
            *((_QWORD *)v33 - 1) = v36;
            v33 -= 8;
          }
          while (v30 != v35);
          v30 = (char *)v2[20];
        }
        v2[20] = v33;
        v2[21] = v12;
        v2[22] = v34;
        if (!v30)
          goto LABEL_33;
        goto LABEL_32;
      }
    }
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "stitchingAirScript"))
      std::__hash_table<std::__hash_value_type<std::string,DataBlock>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,DataBlock>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,DataBlock>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,DataBlock>>>::find<std::string>(v2 + 15, (unsigned __int8 *)&__p);
    v13 = (MTLPipelineLibrarySerializer::FunctionDescriptor *)operator new();
    MTLPipelineLibrarySerializer::FunctionDescriptor::FunctionDescriptor(v13, *(MTLLibraryData **)(a1 + 48), (NSString *)objc_msgSend(*(id *)(a1 + 32), "name"), (MTLFunctionType)objc_msgSend(*(id *)(a1 + 32), "functionType"), *(_QWORD *)(a1 + 56));
    p_p = &__p;
    *((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)(v2 + 10), (unsigned __int8 *)&__p, (uint64_t)&std::piecewise_construct, (__int128 **)&p_p)+ 5) = v13;
    if ((*(_BYTE *)(a1 + 56) & 1) != 0)
    {
      v14 = v2[22];
      v15 = (MTLPipelineLibrarySerializer::FunctionDescriptor **)v2[21];
      if ((unint64_t)v15 < v14)
      {
        *v15 = v13;
        v12 = v15 + 1;
        goto LABEL_33;
      }
      v16 = v2[20];
      v17 = ((uint64_t)v15 - v16) >> 3;
      if ((unint64_t)(v17 + 1) >> 61)
        std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
      v18 = v14 - v16;
      v19 = v18 >> 2;
      if (v18 >> 2 <= (unint64_t)(v17 + 1))
        v19 = v17 + 1;
      if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8)
        v20 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v20 = v19;
      if (v20)
        v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(v2 + 22), v20);
      else
        v21 = 0;
      v28 = (MTLPipelineLibrarySerializer::FunctionDescriptor **)&v21[8 * v17];
      v29 = &v21[8 * v20];
      *v28 = v13;
      v12 = v28 + 1;
      v31 = (char *)v2[20];
      v30 = (char *)v2[21];
      if (v30 != v31)
      {
        do
        {
          v32 = (MTLPipelineLibrarySerializer::FunctionDescriptor *)*((_QWORD *)v30 - 1);
          v30 -= 8;
          *--v28 = v32;
        }
        while (v30 != v31);
        v30 = (char *)v2[20];
      }
      v2[20] = v28;
      v2[21] = v12;
      v2[22] = v29;
      if (!v30)
        goto LABEL_33;
LABEL_32:
      operator delete(v30);
      goto LABEL_33;
    }
  }
LABEL_34:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  objc_autoreleasePoolPop(v3);
}

void sub_1827A4A0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void MTLPipelineCollection::addStitchedLibrary(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t **v6;
  __int128 *v7;
  __int128 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;
  _OWORD *v15;
  __int128 v16;
  __int128 *v17;
  void *v18;
  _QWORD *v19;
  __int128 *v20;
  __int128 v21;
  std::string __p;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  std::string *p_p;
  _OWORD v29[2];
  _OWORD v30[2];
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a2, "libraryData");
  v6 = (uint64_t **)(a1 + 56);
  v7 = (__int128 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 296))(v5);
  v8 = v7[1];
  v32 = *v7;
  v33 = v8;
  if ((uint64_t *)(a1 + 64) == std::__tree<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::__map_value_compare<MTLLibraryIdentifier,std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::less<MTLLibraryIdentifier>,true>,std::allocator<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>>>::find<MTLLibraryIdentifier>(a1 + 56, (unsigned int *)&v32))
  {
    if (!*(_QWORD *)objc_msgSend(a2, "cacheEntry"))
      *(_QWORD *)objc_msgSend(a2, "cacheEntry") = a1;
    v9 = (void *)objc_msgSend(a2, "functionHashes");
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v25;
      v12 = (_QWORD *)(a1 + 120);
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v13), "getValue:", &v32);
          v30[0] = v32;
          v30[1] = v33;
          HashToString((uint64_t)v30, &__p);
          if (!std::__hash_table<std::__hash_value_type<std::string,DataBlock>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,DataBlock>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,DataBlock>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,DataBlock>>>::find<std::string>(v12, (unsigned __int8 *)&__p))
          {
            p_p = &__p;
            *((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,MTLLibraryData *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLLibraryData *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLLibraryData *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLLibraryData *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)v12, (unsigned __int8 *)&__p, (uint64_t)&std::piecewise_construct, (__int128 **)&p_p)+ 5) = v5;
          }
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);
          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
      }
      while (v10);
    }
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    v15 = (_OWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 296))(v5);
    v16 = v15[1];
    v29[0] = *v15;
    v29[1] = v16;
    HashToString((uint64_t)v29, (std::string *)&v32);
    if ((SBYTE7(v33) & 0x80u) == 0)
      v17 = &v32;
    else
      v17 = (__int128 *)v32;
    v18 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("StitchedLib_%s"), v17);
    if (SBYTE7(v33) < 0)
      operator delete((void *)v32);
    v19 = (_QWORD *)operator new();
    *v19 = objc_msgSend(a3, "copy");
    v19[1] = objc_msgSend(v18, "copy");
    v20 = (__int128 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 296))(v5);
    v21 = v20[1];
    v32 = *v20;
    v33 = v21;
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v32;
    *((_QWORD *)std::__tree<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::__map_value_compare<MTLLibraryIdentifier,std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::less<MTLLibraryIdentifier>,true>,std::allocator<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>>>::__emplace_unique_key_args<MTLLibraryIdentifier,std::piecewise_construct_t const&,std::tuple<MTLLibraryIdentifier&&>,std::tuple<>>(v6, (unsigned int *)&v32, (uint64_t)&std::piecewise_construct, &__p)+ 8) = v19;

  }
}

void sub_1827A4D08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (*(char *)(v17 - 121) < 0)
    operator delete(*(void **)(v17 - 144));
  _Unwind_Resume(exception_object);
}

void MTLPipelineCollection::addSpecializedFunction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSObject *v5;
  _QWORD block[9];

  v5 = *(NSObject **)(a1 + 288);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___ZN21MTLPipelineCollection22addSpecializedFunctionEPU22objcproto11MTLFunction11objc_objectS1_PU21objcproto10MTLLibrary11objc_objectP21MTLFunctionDescriptor_block_invoke;
  block[3] = &unk_1E0FE5340;
  block[7] = a5;
  block[8] = a1;
  block[4] = a3;
  block[5] = a4;
  block[6] = a2;
  dispatch_sync(v5, block);
}

void ___ZN21MTLPipelineCollection22addSpecializedFunctionEPU22objcproto11MTLFunction11objc_objectS1_PU21objcproto10MTLLibrary11objc_objectP21MTLFunctionDescriptor_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _OWORD *v5;
  __int128 v6;
  unsigned __int8 *v7;
  _OWORD *v8;
  __int128 v9;
  _QWORD *v10;
  unsigned __int8 *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  __int128 v16;
  uint64_t v17;
  _OWORD *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD *v22;
  __int128 v23;
  id v24;
  uint64_t v25;
  std::string *p_p;
  NSString *v27;
  NSString *v28;
  NSString *v29;
  MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *v30;
  std::string __p;
  std::string v32;
  _BYTE v33[32];
  _OWORD v34[2];
  _OWORD v35[2];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 64);
  v3 = (void *)MEMORY[0x186DAC640]();
  v4 = *(void **)(a1 + 32);
  v5 = (_OWORD *)objc_msgSend(v4, "bitCodeHash");
  v6 = v5[1];
  v35[0] = *v5;
  v35[1] = v6;
  HashToString((uint64_t)v35, &v32);
  *(_QWORD *)v33 = &v32;
  v7 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v2 + 184, (unsigned __int8 *)&v32, (uint64_t)&std::piecewise_construct, (__int128 **)v33);
  v8 = (_OWORD *)objc_msgSend(v4, "functionConstantSpecializationHash");
  v9 = v8[1];
  v34[0] = *v8;
  v34[1] = v9;
  HashToString((uint64_t)v34, &__p);
  v10 = v7 + 40;
  v11 = std::__hash_table<std::__hash_value_type<std::string,DataBlock>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,DataBlock>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,DataBlock>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,DataBlock>>>::find<std::string>(v10, (unsigned __int8 *)&__p);
  if (v11)
  {
    v12 = *((_QWORD *)v11 + 5);
    v13 = *(_QWORD *)(v12 + 16);
    if (v13 != objc_msgSend(*(id *)(a1 + 56), "options"))
      *(_QWORD *)(v12 + 16) |= objc_msgSend(*(id *)(a1 + 56), "options");
  }
  else
  {
    v14 = objc_msgSend(*(id *)(a1 + 40), "libraryData");
    v15 = (_OWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v14 + 296))(v14);
    v16 = v15[1];
    *(_OWORD *)v33 = *v15;
    *(_OWORD *)&v33[16] = v16;
    std::__tree<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::__map_value_compare<MTLLibraryIdentifier,std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::less<MTLLibraryIdentifier>,true>,std::allocator<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>>>::find<MTLLibraryIdentifier>(v2 + 32, (unsigned int *)v33);
    if (objc_msgSend(*(id *)(a1 + 48), "stitchingAirScript"))
    {
      v17 = objc_msgSend(*(id *)(a1 + 40), "libraryData");
      v18 = (_OWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v17 + 296))(v17);
      v19 = v18[1];
      *(_OWORD *)v33 = *v18;
      *(_OWORD *)&v33[16] = v19;
      v20 = *(_QWORD *)(std::__tree<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::__map_value_compare<MTLLibraryIdentifier,std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::less<MTLLibraryIdentifier>,true>,std::allocator<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>>>::find<MTLLibraryIdentifier>(v2 + 56, (unsigned int *)v33)[8]+ 8);
    }
    else
    {
      v21 = objc_msgSend(*(id *)(a1 + 40), "libraryData");
      v22 = (_OWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v21 + 296))(v21);
      v23 = v22[1];
      *(_OWORD *)v33 = *v22;
      *(_OWORD *)&v33[16] = v23;
      v20 = *(_QWORD *)std::__tree<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::__map_value_compare<MTLLibraryIdentifier,std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::less<MTLLibraryIdentifier>,true>,std::allocator<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>>>::find<MTLLibraryIdentifier>(v2 + 32, (unsigned int *)v33)[8];
    }
    v24 = objc_alloc(MEMORY[0x1E0CB3940]);
    v25 = objc_msgSend(v4, "name");
    p_p = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    v27 = (NSString *)objc_msgSend(v24, "initWithFormat:", CFSTR("%@_%@_%s"), v20, v25, p_p);
    v28 = (NSString *)objc_msgSend(*(id *)(a1 + 48), "name");
    v29 = (NSString *)objc_msgSend(v4, "name");
    v30 = (MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *)operator new();
    MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor::MTLSpecializedFunctionDescriptor(v30, (MTLLibraryData *)objc_msgSend(*(id *)(a1 + 40), "libraryData"), v28, (MTLFunctionConstantValues *)objc_msgSend(*(id *)(a1 + 56), "constantValues"), v27, v29, (MTLFunctionType)objc_msgSend(*(id *)(a1 + 32), "functionType"), objc_msgSend(*(id *)(a1 + 56), "options"));
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external((std::string *)v33, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    else
      *(std::string *)v33 = __p;
    *(_QWORD *)&v33[24] = v30;
    std::__hash_table<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>((uint64_t)v10, v33, (uint64_t)v33);
    if ((v33[23] & 0x80000000) != 0)
      operator delete(*(void **)v33);

  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v32.__r_.__value_.__l.__data_);
  objc_autoreleasePoolPop(v3);
}

void sub_1827A50CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a18 < 0)
    operator delete(__p);
  if (a24 < 0)
    operator delete(a19);
  _Unwind_Resume(exception_object);
}

uint64_t MTLPipelineCollection::functionWasCollected(uint64_t a1, void *a2)
{
  _OWORD *v3;
  __int128 v4;
  _BOOL8 v5;
  std::string __p;
  _OWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!a2)
    return 1;
  v3 = (_OWORD *)objc_msgSend(a2, "bitCodeHash");
  v4 = v3[1];
  v8[0] = *v3;
  v8[1] = v4;
  HashToString((uint64_t)v8, &__p);
  if (std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>((_QWORD *)(a1 + 80), (unsigned __int8 *)&__p))
  {
    v5 = 1;
  }
  else
  {
    v5 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>((_QWORD *)(a1 + 184), (unsigned __int8 *)&__p) != 0;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v5;
}

void sub_1827A5224(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(exception_object);
}

void MTLPipelineDescriptorHash::~MTLPipelineDescriptorHash(MTLPipelineDescriptorHash *this)
{
  id *v2;
  id *v3;

  v2 = (id *)*((_QWORD *)this + 5);
  v3 = (id *)*((_QWORD *)this + 6);
  if (v2 != v3)
  {
    do

    while (v2 != v3);
    v2 = (id *)*((_QWORD *)this + 5);
  }
  if (v2)
  {
    *((_QWORD *)this + 6) = v2;
    operator delete(v2);
  }
  std::__hash_table<std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<NSObject *>>>>::~__hash_table((uint64_t)this);
}

uint64_t MTLPipelineDescriptorHash::addPipelineDescriptor(MTLPipelineDescriptorHash *this, NSObject *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  char **v6;
  id *v7;
  id *v8;
  uint64_t result;
  unint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  void *__p;
  void *v39;
  _QWORD *v40;
  uint64_t v41;

  v41 = -[NSObject hash](a2, "hash");
  v4 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>(this, (unint64_t *)&v41);
  if (v4)
  {
    v5 = v4;
    v7 = (id *)v4[3];
    v8 = (id *)v4[4];
    v6 = (char **)(v4 + 3);
    while (v7 != v8)
    {
      result = objc_msgSend(*v7, "isEqual:", a2);
      if ((result & 1) != 0)
        return result;
      ++v7;
    }
    v10 = v5[5];
    v11 = (_QWORD *)v5[4];
    if ((unint64_t)v11 >= v10)
    {
      v14 = ((char *)v11 - *v6) >> 3;
      if ((unint64_t)(v14 + 1) >> 61)
        std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
      v15 = v10 - (_QWORD)*v6;
      v16 = v15 >> 2;
      if (v15 >> 2 <= (unint64_t)(v14 + 1))
        v16 = v14 + 1;
      if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8)
        v17 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v17 = v16;
      if (v17)
        v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(v5 + 5), v17);
      else
        v18 = 0;
      v19 = &v18[8 * v14];
      v20 = &v18[8 * v17];
      *(_QWORD *)v19 = a2;
      v12 = v19 + 8;
      v22 = (char *)v5[3];
      v21 = (char *)v5[4];
      if (v21 != v22)
      {
        do
        {
          v23 = *((_QWORD *)v21 - 1);
          v21 -= 8;
          *((_QWORD *)v19 - 1) = v23;
          v19 -= 8;
        }
        while (v21 != v22);
        v21 = *v6;
      }
      v5[3] = v19;
      v5[4] = v12;
      v5[5] = v20;
      if (v21)
        operator delete(v21);
    }
    else
    {
      *v11 = a2;
      v12 = v11 + 1;
    }
    v5[4] = v12;
  }
  else
  {
    v13 = operator new(8uLL);
    __p = v13;
    *v13 = a2;
    v39 = v13 + 1;
    v40 = v13 + 1;
    std::__hash_table<std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<NSObject *>>>>::__emplace_unique_key_args<unsigned long,unsigned long &,std::vector<NSObject *>>((uint64_t)this, (unint64_t *)&v41, &v41, (uint64_t)&__p);
    if (__p)
    {
      v39 = __p;
      operator delete(__p);
    }
  }
  v24 = *((_QWORD *)this + 7);
  v25 = (_QWORD *)*((_QWORD *)this + 6);
  if ((unint64_t)v25 >= v24)
  {
    v27 = *((_QWORD *)this + 5);
    v28 = ((uint64_t)v25 - v27) >> 3;
    if ((unint64_t)(v28 + 1) >> 61)
      std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
    v29 = v24 - v27;
    v30 = v29 >> 2;
    if (v29 >> 2 <= (unint64_t)(v28 + 1))
      v30 = v28 + 1;
    if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8)
      v31 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v31 = v30;
    if (v31)
      v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)this + 56, v31);
    else
      v32 = 0;
    v33 = &v32[8 * v28];
    v34 = &v32[8 * v31];
    *(_QWORD *)v33 = a2;
    v26 = v33 + 8;
    v36 = (char *)*((_QWORD *)this + 5);
    v35 = (char *)*((_QWORD *)this + 6);
    if (v35 != v36)
    {
      do
      {
        v37 = *((_QWORD *)v35 - 1);
        v35 -= 8;
        *((_QWORD *)v33 - 1) = v37;
        v33 -= 8;
      }
      while (v35 != v36);
      v35 = (char *)*((_QWORD *)this + 5);
    }
    *((_QWORD *)this + 5) = v33;
    *((_QWORD *)this + 6) = v26;
    *((_QWORD *)this + 7) = v34;
    if (v35)
      operator delete(v35);
  }
  else
  {
    *v25 = a2;
    v26 = v25 + 1;
  }
  *((_QWORD *)this + 6) = v26;
  return (uint64_t)a2;
}

void sub_1827A54CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void MTLPipelineCollection::addRenderPipeline(MTLPipelineCollection *this, MTLRenderPipelineDescriptor *a2)
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = -[MTLRenderPipelineDescriptor vertexPreloadedLibraries](a2, "vertexPreloadedLibraries");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        MTLPipelineCollection::addDynamicLibrary((uint64_t)this, *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }
  v9 = -[MTLRenderPipelineDescriptor fragmentPreloadedLibraries](a2, "fragmentPreloadedLibraries");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        MTLPipelineCollection::addDynamicLibrary((uint64_t)this, *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v11);
  }
  v14 = *((_QWORD *)this + 36);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = ___ZN21MTLPipelineCollection17addRenderPipelineEP27MTLRenderPipelineDescriptor_block_invoke;
  v15[3] = &unk_1E0FE3128;
  v15[4] = a2;
  v15[5] = this;
  dispatch_sync(v14, v15);
}

void ___ZN21MTLPipelineCollection17addRenderPipelineEP27MTLRenderPipelineDescriptor_block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
  -[NSObject setBinaryArchives:](v2, "setBinaryArchives:", 0);
  if (MTLPipelineCollection::functionWasCollected(v1, (void *)-[NSObject vertexFunction](v2, "vertexFunction"))&& MTLPipelineCollection::functionWasCollected(v1, (void *)-[NSObject fragmentFunction](v2, "fragmentFunction")))
  {
    MTLPipelineDescriptorHash::addPipelineDescriptor((MTLPipelineDescriptorHash *)(v1 + 296), v2);
  }

}

void MTLPipelineCollection::addComputePipeline(MTLPipelineCollection *this, MTLComputePipelineDescriptor *a2)
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[6];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = -[MTLComputePipelineDescriptor preloadedLibraries](a2, "preloadedLibraries");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        MTLPipelineCollection::addDynamicLibrary((uint64_t)this, *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  v9 = *((_QWORD *)this + 36);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ___ZN21MTLPipelineCollection18addComputePipelineEP28MTLComputePipelineDescriptor_block_invoke;
  v10[3] = &unk_1E0FE3128;
  v10[4] = a2;
  v10[5] = this;
  dispatch_sync(v9, v10);
}

void ___ZN21MTLPipelineCollection18addComputePipelineEP28MTLComputePipelineDescriptor_block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
  -[NSObject setBinaryArchives:](v2, "setBinaryArchives:", 0);
  if (MTLPipelineCollection::functionWasCollected(v1, (void *)-[NSObject computeFunction](v2, "computeFunction")))MTLPipelineDescriptorHash::addPipelineDescriptor((MTLPipelineDescriptorHash *)(v1 + 360), v2);

}

void MTLPipelineCollection::addTileRenderPipeline(MTLPipelineCollection *this, MTLTileRenderPipelineDescriptor *a2)
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[6];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = -[MTLTileRenderPipelineDescriptor preloadedLibraries](a2, "preloadedLibraries");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        MTLPipelineCollection::addDynamicLibrary((uint64_t)this, *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  v9 = *((_QWORD *)this + 36);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ___ZN21MTLPipelineCollection21addTileRenderPipelineEP31MTLTileRenderPipelineDescriptor_block_invoke;
  v10[3] = &unk_1E0FE3128;
  v10[4] = a2;
  v10[5] = this;
  dispatch_sync(v9, v10);
}

void ___ZN21MTLPipelineCollection21addTileRenderPipelineEP31MTLTileRenderPipelineDescriptor_block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
  -[NSObject setBinaryArchives:](v2, "setBinaryArchives:", 0);
  if (MTLPipelineCollection::functionWasCollected(v1, (void *)-[NSObject tileFunction](v2, "tileFunction")))MTLPipelineDescriptorHash::addPipelineDescriptor((MTLPipelineDescriptorHash *)(v1 + 424), v2);

}

void MTLPipelineCollection::addMeshRenderPipeline(MTLPipelineCollection *this, MTLMeshRenderPipelineDescriptor *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[6];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = -[MTLMeshRenderPipelineDescriptor objectPreloadedLibraries](a2, "objectPreloadedLibraries");
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v4);
        MTLPipelineCollection::addDynamicLibrary((uint64_t)this, *(void **)(*((_QWORD *)&v29 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v6);
  }
  v9 = -[MTLMeshRenderPipelineDescriptor meshPreloadedLibraries](a2, "meshPreloadedLibraries");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        MTLPipelineCollection::addDynamicLibrary((uint64_t)this, *(void **)(*((_QWORD *)&v25 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v11);
  }
  v14 = -[MTLMeshRenderPipelineDescriptor fragmentPreloadedLibraries](a2, "fragmentPreloadedLibraries");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        MTLPipelineCollection::addDynamicLibrary((uint64_t)this, *(void **)(*((_QWORD *)&v21 + 1) + 8 * v18++));
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v16);
  }
  v19 = *((_QWORD *)this + 36);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = ___ZN21MTLPipelineCollection21addMeshRenderPipelineEP31MTLMeshRenderPipelineDescriptor_block_invoke;
  v20[3] = &unk_1E0FE3128;
  v20[4] = a2;
  v20[5] = this;
  dispatch_sync(v19, v20);
}

void ___ZN21MTLPipelineCollection21addMeshRenderPipelineEP31MTLMeshRenderPipelineDescriptor_block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
  -[NSObject setBinaryArchives:](v2, "setBinaryArchives:", 0);
  if (MTLPipelineCollection::functionWasCollected(v1, (void *)-[NSObject objectFunction](v2, "objectFunction"))&& MTLPipelineCollection::functionWasCollected(v1, (void *)-[NSObject meshFunction](v2, "meshFunction"))&& MTLPipelineCollection::functionWasCollected(v1, (void *)-[NSObject fragmentFunction](v2, "fragmentFunction")))
  {
    MTLPipelineDescriptorHash::addPipelineDescriptor((MTLPipelineDescriptorHash *)(v1 + 488), v2);
  }

}

__n128 MTLPipelineCollection::getFunctionData(uint64_t a1, __n128 *a2, __n128 *a3)
{
  _OWORD *v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  __n128 result;
  _OWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (_OWORD *)(*(uint64_t (**)(unint64_t))(*(_QWORD *)a2->n128_u64[0] + 296))(a2->n128_u64[0]);
  v7 = v6[1];
  v14[0] = *v6;
  v14[1] = v7;
  v12 = std::__tree<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::__map_value_compare<MTLLibraryIdentifier,std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::less<MTLLibraryIdentifier>,true>,std::allocator<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>>>::find<MTLLibraryIdentifier>(a1 + 224, (unsigned int *)v14);
  if ((uint64_t *)(a1 + 232) == v12)
    MTLReportFailure(0, "getFunctionData", 540, (uint64_t)CFSTR("library was not collected for function %@"), v8, v9, v10, v11, a2->n128_i64[1]);
  a3->n128_u32[0] = v12[8];
  a3->n128_u64[1] = a2->n128_u64[1];
  result = a2[1];
  a3[1] = result;
  return result;
}

void MTLPipelineCollection::getFunctionData(uint64_t a1, void *a2, uint64_t a3)
{
  _OWORD *v6;
  __int128 v7;
  unsigned __int8 *v8;
  _OWORD *v9;
  __int128 v10;
  uint64_t *v11;
  unsigned __int8 *v12;
  _OWORD *v13;
  __int128 v14;
  unsigned __int8 *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  std::string __p;
  std::string v28;
  _OWORD v29[2];
  _OWORD v30[3];
  _OWORD v31[2];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = (_OWORD *)objc_msgSend(a2, "bitCodeHash");
  v7 = v6[1];
  v31[0] = *v6;
  v31[1] = v7;
  HashToString((uint64_t)v31, &v28);
  v8 = std::__hash_table<std::__hash_value_type<std::string,DataBlock>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,DataBlock>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,DataBlock>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,DataBlock>>>::find<std::string>((_QWORD *)(a1 + 80), (unsigned __int8 *)&v28);
  if (v8)
  {
    v9 = (_OWORD *)(*(uint64_t (**)(_QWORD))(***((_QWORD ***)v8 + 5) + 296))(**((_QWORD **)v8 + 5));
    v10 = v9[1];
    v30[0] = *v9;
    v30[1] = v10;
    v11 = std::__tree<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::__map_value_compare<MTLLibraryIdentifier,std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::less<MTLLibraryIdentifier>,true>,std::allocator<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>>>::find<MTLLibraryIdentifier>(a1 + 224, (unsigned int *)v30);
    if ((uint64_t *)(a1 + 232) == v11)
    {
      v22 = objc_msgSend(a2, "name");
      MTLReportFailure(0, "getFunctionData", 568, (uint64_t)CFSTR("library was not collected for function %@"), v23, v24, v25, v26, v22);
    }
    *(_DWORD *)a3 = v11[8];
    *(_QWORD *)(a3 + 8) = objc_msgSend(a2, "name");
    *(_QWORD *)(a3 + 16) = objc_msgSend(a2, "options");
  }
  else
  {
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v28;
    v12 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1 + 184, (unsigned __int8 *)&v28, (uint64_t)&std::piecewise_construct, (__int128 **)&__p);
    std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>::unordered_map((uint64_t)v30, (uint64_t)(v12 + 40));
    v13 = (_OWORD *)objc_msgSend(a2, "functionConstantSpecializationHash");
    v14 = v13[1];
    v29[0] = *v13;
    v29[1] = v14;
    HashToString((uint64_t)v29, &__p);
    v15 = std::__hash_table<std::__hash_value_type<std::string,DataBlock>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,DataBlock>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,DataBlock>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,DataBlock>>>::find<std::string>(v30, (unsigned __int8 *)&__p);
    if (v15)
    {
      v16 = *((_QWORD *)v15 + 5);
      *(_DWORD *)a3 = -1;
      *(_QWORD *)(a3 + 8) = *(_QWORD *)(v16 + 40);
    }
    else
    {
      v17 = objc_msgSend(a2, "name");
      MTLReportFailure(0, "getFunctionData", 593, (uint64_t)CFSTR("function %@ was not collected but it is referenced in the descriptor"), v18, v19, v20, v21, v17);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table((uint64_t)v30);
  }
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v28.__r_.__value_.__l.__data_);
}

void sub_1827A5FD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  if (a15 < 0)
    operator delete(__p);
  std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table((uint64_t)&a27);
  if (a21 < 0)
    operator delete(a16);
  _Unwind_Resume(a1);
}

void MTLPipelineCollection::dumpLibraries(MTLPipelineCollection *this, NSString *a2)
{
  NSObject *v2;
  _QWORD v3[6];

  v2 = *((_QWORD *)this + 36);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = ___ZN21MTLPipelineCollection13dumpLibrariesEP8NSString_block_invoke;
  v3[3] = &unk_1E0FE3128;
  v3[4] = a2;
  v3[5] = this;
  dispatch_sync(v2, v3);
}

void ___ZN21MTLPipelineCollection13dumpLibrariesEP8NSString_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  BOOL v21;
  uint64_t v22;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)MEMORY[0x186DAC640]();
  v4 = objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = *(_QWORD **)(v2 + 32);
  if (v5 != (_QWORD *)(v2 + 40))
  {
    v6 = (void *)v4;
    do
    {
      v7 = v5[8];
      v8 = *(_QWORD *)(v7 + 8);
      v9 = objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", v8);
      if ((objc_msgSend(v6, "fileExistsAtPath:", v9) & 1) == 0)
      {
        v14 = *(void **)(v7 + 24);
        if (!v14)
          MTLReportFailure(0, "dumpLibraries_block_invoke", 668, (uint64_t)CFSTR("unable to load library data for %@"), v10, v11, v12, v13, v8);
        v22 = 0;
        if ((objc_msgSend(v14, "writeToFile:options:error:", v9, 0, &v22) & 1) == 0)
          MTLReportFailure(0, "dumpLibraries_block_invoke", 672, (uint64_t)CFSTR("unable to write library data to %@: %@"), v15, v16, v17, v18, v9);
      }
      v19 = (_QWORD *)v5[1];
      if (v19)
      {
        do
        {
          v20 = v19;
          v19 = (_QWORD *)*v19;
        }
        while (v19);
      }
      else
      {
        do
        {
          v20 = (_QWORD *)v5[2];
          v21 = *v20 == (_QWORD)v5;
          v5 = v20;
        }
        while (!v21);
      }
      v5 = v20;
    }
    while (v20 != (_QWORD *)(v2 + 40));
  }
  objc_autoreleasePoolPop(v3);
}

uint64_t MTLPipelineCollection::JSONData(MTLPipelineCollection *this)
{
  NSObject *v1;
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__12;
  v9 = __Block_byref_object_dispose__12;
  v10 = 0;
  v1 = *((_QWORD *)this + 36);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = ___ZN21MTLPipelineCollection8JSONDataEv_block_invoke;
  v4[3] = &unk_1E0FE3150;
  v4[4] = &v5;
  v4[5] = this;
  dispatch_sync(v1, v4);
  v2 = v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t ___ZN21MTLPipelineCollection8JSONDataEv_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = MTLPipelineCollection::JSONDataNoSync(*(MTLPipelineCollection **)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

uint64_t MTLPipelineCollection::JSONDataNoSync(MTLPipelineCollection *this)
{
  MTLPipelineCollection *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t **v5;
  __n128 *v6;
  __n128 v7;
  uint64_t v8;
  __n128 *v9;
  __n128 **v10;
  BOOL v11;
  __n128 *v12;
  __n128 *v13;
  __n128 v14;
  uint64_t v15;
  __n128 *v16;
  __n128 *v17;
  __int128 *v18;
  uint64_t v19;
  uint64_t *i;
  _QWORD *v21;
  uint64_t v22;
  __n128 v23;
  uint64_t v24;
  __n128 *v25;
  __n128 v26;
  uint64_t v27;
  _OWORD *v28;
  __n128 *v29;
  __n128 *v30;
  __n128 **v31;
  __n128 **j;
  __n128 *v33;
  __n128 FunctionData;
  _QWORD *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  _OWORD *v42;
  _OWORD *v43;
  _OWORD *v44;
  char *v45;
  void *v46;
  int64_t v47;
  unint64_t v48;
  unint64_t v49;
  char *v50;
  char *v51;
  char *v52;
  char *v53;
  uint64_t v54;
  std::string *v55;
  unint64_t v56;
  unsigned __int8 v57;
  _QWORD *v58;
  unint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t m;
  _OWORD *v65;
  _OWORD *v66;
  _OWORD *v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  char *v73;
  char *v74;
  char *v75;
  char *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t n;
  _OWORD *v82;
  _OWORD *v83;
  _OWORD *v84;
  uint64_t v85;
  _QWORD *v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  char *v90;
  char *v91;
  char *v92;
  char *v93;
  uint64_t v94;
  std::string *v95;
  unint64_t v96;
  unsigned __int8 v97;
  _QWORD *v98;
  unint64_t v99;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t ii;
  _OWORD *v105;
  _OWORD *v106;
  _OWORD *v107;
  char *v108;
  void *v109;
  int64_t v110;
  unint64_t v111;
  unint64_t v112;
  char *v113;
  char *v114;
  char *v115;
  char *v116;
  uint64_t v117;
  std::string *v118;
  unint64_t v119;
  unsigned __int8 v120;
  uint64_t v121;
  _QWORD *v122;
  unint64_t v123;
  void *v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t jj;
  _OWORD *v129;
  _OWORD *v130;
  _OWORD *v131;
  uint64_t v132;
  _QWORD *v133;
  uint64_t v134;
  unint64_t v135;
  unint64_t v136;
  char *v137;
  char *v138;
  char *v139;
  char *v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t kk;
  _OWORD *v146;
  _OWORD *v147;
  _OWORD *v148;
  uint64_t v149;
  _QWORD *v150;
  uint64_t v151;
  unint64_t v152;
  unint64_t v153;
  char *v154;
  char *v155;
  char *v156;
  char *v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t mm;
  _OWORD *v163;
  _OWORD *v164;
  _OWORD *v165;
  uint64_t v166;
  _QWORD *v167;
  uint64_t v168;
  unint64_t v169;
  unint64_t v170;
  char *v171;
  char *v172;
  char *v173;
  char *v174;
  uint64_t v175;
  std::string *v176;
  unint64_t v177;
  unsigned __int8 v178;
  MTLPipelineLibrarySerializer::PipelineLibraryJSONSerializer *v179;
  uint64_t v180;
  __int128 *v182;
  void *context;
  unint64_t v184;
  unint64_t v185;
  void *v186;
  uint64_t v187;
  MTLPipelineLibrarySerializer::PipelineLibraryJSONSerializer *MetalScriptSerializer;
  void *v189;
  unint64_t __val;
  unint64_t __vala;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  void *v220;
  _QWORD *v221;
  uint64_t v222;
  _OWORD *v223;
  _BYTE v224[128];
  _BYTE v225[128];
  _BYTE v226[128];
  __n128 v227[2];
  _BYTE v228[40];
  void *v229;
  int v230;
  uint64_t v231;
  uint64_t v232;
  void *v233;
  void *__p;
  _QWORD v235[2];
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  char *v242;
  _BYTE v243[128];
  _BYTE v244[128];
  _BYTE v245[128];
  _BYTE v246[128];
  _BYTE v247[32];
  _BYTE v248[32];
  uint64_t *v249;
  _QWORD v250[3];
  _QWORD *v251;
  uint64_t v252;

  v1 = this;
  v252 = *MEMORY[0x1E0C80C00];
  v2 = *((_QWORD *)this + 3);
  if ((v2 & 0x18) != 0)
  {
    v250[0] = &off_1E0FE1C98;
    v250[1] = this;
    v251 = v250;
    MetalScriptSerializer = (MTLPipelineLibrarySerializer::PipelineLibraryJSONSerializer *)MTLPipelineLibrarySerializer::PipelineLibrarySerializerInterface::createMetalScriptSerializer((v2 & 0x10) != 0, (uint64_t)v250);
    v3 = v251;
    if (v251 == v250)
    {
      v4 = 4;
      v3 = v250;
    }
    else
    {
      if (!v251)
        goto LABEL_8;
      v4 = 5;
    }
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  else
  {
    MetalScriptSerializer = (MTLPipelineLibrarySerializer::PipelineLibraryJSONSerializer *)operator new();
    MTLPipelineLibrarySerializer::PipelineLibraryJSONSerializer::PipelineLibraryJSONSerializer(MetalScriptSerializer, *((_QWORD *)v1 + 3));
  }
LABEL_8:
  context = (void *)MEMORY[0x186DAC640]();
  v5 = (uint64_t **)((char *)v1 + 32);
  v6 = (__n128 *)*((_QWORD *)v1 + 4);
  if (v6 != (__n128 *)((char *)v1 + 40))
  {
    do
    {
      v7 = v6[3];
      v227[0] = v6[2];
      v227[1] = v7;
      *(_QWORD *)v228 = v6[4].n128_u64[0];
      v8 = (**(uint64_t (***)(MTLPipelineLibrarySerializer::PipelineLibraryJSONSerializer *))MetalScriptSerializer)(MetalScriptSerializer);
      *(_QWORD *)v248 = v227;
      *((_QWORD *)std::__tree<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::__map_value_compare<MTLLibraryIdentifier,std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::less<MTLLibraryIdentifier>,true>,std::allocator<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>>>::__emplace_unique_key_args<MTLLibraryIdentifier,std::piecewise_construct_t const&,std::tuple<MTLLibraryIdentifier&&>,std::tuple<>>((uint64_t **)v1 + 28, (unsigned int *)v227, (uint64_t)&std::piecewise_construct, (_OWORD **)v248)+ 8) = v8;
      v9 = (__n128 *)v6->n128_u64[1];
      if (v9)
      {
        do
        {
          v10 = (__n128 **)v9;
          v9 = (__n128 *)v9->n128_u64[0];
        }
        while (v9);
      }
      else
      {
        do
        {
          v10 = (__n128 **)v6[1].n128_u64[0];
          v11 = *v10 == v6;
          v6 = (__n128 *)v10;
        }
        while (!v11);
      }
      v6 = (__n128 *)v10;
    }
    while (v10 != (__n128 **)((char *)v1 + 40));
  }
  v12 = (__n128 *)*((_QWORD *)v1 + 7);
  v13 = (__n128 *)((char *)v1 + 64);
  if (v12 != (__n128 *)((char *)v1 + 64))
  {
    do
    {
      v14 = v12[3];
      v227[0] = v12[2];
      v227[1] = v14;
      *(_QWORD *)v228 = v12[4].n128_u64[0];
      v15 = (*(uint64_t (**)(MTLPipelineLibrarySerializer::PipelineLibraryJSONSerializer *))(*(_QWORD *)MetalScriptSerializer + 40))(MetalScriptSerializer);
      *(_QWORD *)v248 = v227;
      *((_QWORD *)std::__tree<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::__map_value_compare<MTLLibraryIdentifier,std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::less<MTLLibraryIdentifier>,true>,std::allocator<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>>>::__emplace_unique_key_args<MTLLibraryIdentifier,std::piecewise_construct_t const&,std::tuple<MTLLibraryIdentifier&&>,std::tuple<>>((uint64_t **)v1 + 28, (unsigned int *)v227, (uint64_t)&std::piecewise_construct, (_OWORD **)v248)+ 8) = v15;
      v16 = (__n128 *)v12->n128_u64[1];
      if (v16)
      {
        do
        {
          v17 = v16;
          v16 = (__n128 *)v16->n128_u64[0];
        }
        while (v16);
      }
      else
      {
        do
        {
          v17 = (__n128 *)v12[1].n128_u64[0];
          v11 = v17->n128_u64[0] == (_QWORD)v12;
          v12 = v17;
        }
        while (!v11);
      }
      v12 = v17;
    }
    while (v17 != v13);
  }
  v18 = (__int128 *)*((_QWORD *)v1 + 25);
  v187 = (uint64_t)v1;
  if (v18)
  {
    v19 = (uint64_t)v1 + 224;
    do
    {
      std::pair<std::string const,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>::pair[abi:ne180100]((std::string *)v248, v18 + 1);
      for (i = v249; i; i = (uint64_t *)*i)
      {
        if (*((char *)i + 39) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)v247, (const std::string::value_type *)i[2], i[3]);
        }
        else
        {
          *(_OWORD *)v247 = *((_OWORD *)i + 1);
          *(_QWORD *)&v247[16] = i[4];
        }
        v21 = (_QWORD *)i[5];
        *(_QWORD *)&v247[24] = v21;
        v22 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*v21 + 296))(*v21);
        v23 = *(__n128 *)v22;
        v227[1] = *(__n128 *)(v22 + 16);
        v227[0] = v23;
        v24 = std::__tree<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::__map_value_compare<MTLLibraryIdentifier,std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::less<MTLLibraryIdentifier>,true>,std::allocator<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>>>::find<MTLLibraryIdentifier>(v19, (unsigned int *)v227)[8];
        v227[0].n128_u64[1] = 0;
        v227[1].n128_u64[0] = 0;
        memset(v228, 0, 32);
        *(_QWORD *)v228 = v21[4];
        v227[0].n128_u64[1] = v21[1];
        v227[0].n128_u32[0] = v24;
        *(int8x16_t *)&v228[8] = vextq_s8(*(int8x16_t *)(v21 + 5), *(int8x16_t *)(v21 + 5), 8uLL);
        *(_OWORD *)&v228[24] = *((_OWORD *)v21 + 1);
        (*(void (**)(MTLPipelineLibrarySerializer::PipelineLibraryJSONSerializer *, __n128 *))(*(_QWORD *)MetalScriptSerializer + 8))(MetalScriptSerializer, v227);
        if ((v247[23] & 0x80000000) != 0)
          operator delete(*(void **)v247);
      }
      std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table((uint64_t)&v248[24]);
      v1 = (MTLPipelineCollection *)v187;
      if ((v248[23] & 0x80000000) != 0)
        operator delete(*(void **)v248);
      v18 = *(__int128 **)v18;
    }
    while (v18);
  }
  v25 = (__n128 *)*((_QWORD *)v1 + 7);
  if (v25 != v13)
  {
    do
    {
      v26 = v25[3];
      v227[0] = v25[2];
      v227[1] = v26;
      *(_QWORD *)v228 = v25[4].n128_u64[0];
      v27 = **(_QWORD **)v228;
      *(_QWORD *)v248 = v227;
      v28 = std::__tree<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::__map_value_compare<MTLLibraryIdentifier,std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::less<MTLLibraryIdentifier>,true>,std::allocator<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>>>::__emplace_unique_key_args<MTLLibraryIdentifier,std::piecewise_construct_t const&,std::tuple<MTLLibraryIdentifier&&>,std::tuple<>>((uint64_t **)v1 + 28, (unsigned int *)v227, (uint64_t)&std::piecewise_construct, (_OWORD **)v248);
      (*(void (**)(MTLPipelineLibrarySerializer::PipelineLibraryJSONSerializer *, uint64_t, _QWORD))(*(_QWORD *)MetalScriptSerializer + 48))(MetalScriptSerializer, v27, *((_QWORD *)v28 + 8));
      v29 = (__n128 *)v25->n128_u64[1];
      if (v29)
      {
        do
        {
          v30 = v29;
          v29 = (__n128 *)v29->n128_u64[0];
        }
        while (v29);
      }
      else
      {
        do
        {
          v30 = (__n128 *)v25[1].n128_u64[0];
          v11 = v30->n128_u64[0] == (_QWORD)v25;
          v25 = v30;
        }
        while (!v11);
      }
      v25 = v30;
    }
    while (v30 != v13);
  }
  v31 = (__n128 **)*((_QWORD *)v1 + 20);
  for (j = (__n128 **)*((_QWORD *)v1 + 21); v31 != j; ++v31)
  {
    v33 = *v31;
    v227[0].n128_u32[0] = 0;
    v227[0].n128_u64[1] = 0;
    v227[1].n128_u64[0] = 0;
    FunctionData = MTLPipelineCollection::getFunctionData((uint64_t)v1, v33, v227);
    (*(void (**)(MTLPipelineLibrarySerializer::PipelineLibraryJSONSerializer *, __n128 *, __n128))(*(_QWORD *)MetalScriptSerializer + 16))(MetalScriptSerializer, v227, FunctionData);
  }
  v221 = 0;
  v220 = 0;
  v222 = 0;
  std::vector<NSObject *>::__init_with_size[abi:ne180100]<NSObject **,NSObject **>(&v220, *((const void **)v1 + 50), *((_QWORD *)v1 + 51), (uint64_t)(*((_QWORD *)v1 + 51) - *((_QWORD *)v1 + 50)) >> 3);
  v35 = v221;
  if (v221 != v220)
  {
    v36 = 0;
    v35 = v220;
    do
    {
      v37 = (void *)v35[v36];
      memset(v228, 0, sizeof(v228));
      memset(v227, 0, sizeof(v227));
      v230 = 0;
      v231 = 0;
      v232 = 0;
      __p = 0;
      v235[0] = 0;
      v233 = 0;
      v229 = v37;
      MTLPipelineCollection::getFunctionData(v187, (void *)objc_msgSend(v37, "computeFunction"), (uint64_t)&v230);
      v38 = (void *)objc_msgSend(v37, "preloadedLibraries");
      __val = v36;
      v218 = 0u;
      v219 = 0u;
      v216 = 0u;
      v217 = 0u;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v216, v246, 16);
      if (v39)
      {
        v40 = *(_QWORD *)v217;
        do
        {
          for (k = 0; k != v39; ++k)
          {
            if (*(_QWORD *)v217 != v40)
              objc_enumerationMutation(v38);
            v42 = (_OWORD *)objc_msgSend(*(id *)(*((_QWORD *)&v216 + 1) + 8 * k), "libraryUUID");
            *(_OWORD *)v248 = *v42;
            *(_OWORD *)&v248[16] = v42[1];
            *(_OWORD *)v247 = *(_OWORD *)v248;
            *(_OWORD *)&v247[16] = *(_OWORD *)&v248[16];
            v223 = v247;
            v43 = std::__tree<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::__map_value_compare<MTLLibraryIdentifier,std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::less<MTLLibraryIdentifier>,true>,std::allocator<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>>>::__emplace_unique_key_args<MTLLibraryIdentifier,std::piecewise_construct_t const&,std::tuple<MTLLibraryIdentifier&&>,std::tuple<>>(v5, (unsigned int *)v247, (uint64_t)&std::piecewise_construct, &v223);
            v44 = v43;
            v45 = (char *)__p;
            if ((unint64_t)__p >= v235[0])
            {
              v47 = ((_BYTE *)__p - (_BYTE *)v233) >> 3;
              if ((unint64_t)(v47 + 1) >> 61)
                std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
              v48 = (uint64_t)(v235[0] - (_QWORD)v233) >> 2;
              if (v48 <= v47 + 1)
                v48 = v47 + 1;
              if (v235[0] - (_QWORD)v233 >= 0x7FFFFFFFFFFFFFF8uLL)
                v49 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v49 = v48;
              if (v49)
                v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)v235, v49);
              else
                v50 = 0;
              v51 = &v50[8 * v47];
              *(_QWORD *)v51 = *((_QWORD *)v44 + 8);
              v46 = v51 + 8;
              v52 = (char *)__p;
              v53 = (char *)v233;
              if (__p != v233)
              {
                do
                {
                  v54 = *((_QWORD *)v52 - 1);
                  v52 -= 8;
                  *((_QWORD *)v51 - 1) = v54;
                  v51 -= 8;
                }
                while (v52 != v53);
                v52 = (char *)v233;
              }
              v233 = v51;
              __p = v46;
              v235[0] = &v50[8 * v49];
              if (v52)
                operator delete(v52);
            }
            else
            {
              *(_QWORD *)__p = *((_QWORD *)v43 + 8);
              v46 = v45 + 8;
            }
            __p = v46;
          }
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v216, v246, 16);
        }
        while (v39);
      }
      if ((*(_BYTE *)(v187 + 24) & 2) != 0)
      {
        std::to_string((std::string *)v248, __val);
        v55 = std::string::insert((std::string *)v248, 0, "ComputePipeline_");
        v56 = v55->__r_.__value_.__r.__words[0];
        *(_QWORD *)v247 = v55->__r_.__value_.__l.__size_;
        *(_QWORD *)&v247[7] = *(std::string::size_type *)((char *)&v55->__r_.__value_.__r.__words[1] + 7);
        v57 = HIBYTE(v55->__r_.__value_.__r.__words[2]);
        v55->__r_.__value_.__l.__size_ = 0;
        v55->__r_.__value_.__r.__words[2] = 0;
        v55->__r_.__value_.__r.__words[0] = 0;
        if (v227[1].n128_i8[7] < 0)
          operator delete((void *)v227[0].n128_u64[0]);
        v227[0].n128_u64[0] = v56;
        v227[0].n128_u64[1] = *(_QWORD *)v247;
        *(unint64_t *)((char *)&v227[0].n128_u64[1] + 7) = *(_QWORD *)&v247[7];
        v227[1].n128_u8[7] = v57;
        if ((v248[23] & 0x80000000) != 0)
          operator delete(*(void **)v248);
      }
      (*(void (**)(MTLPipelineLibrarySerializer::PipelineLibraryJSONSerializer *, __n128 *))(*(_QWORD *)MetalScriptSerializer + 24))(MetalScriptSerializer, v227);
      if (v233)
      {
        __p = v233;
        operator delete(v233);
      }
      if (*(_QWORD *)&v228[16])
      {
        *(_QWORD *)&v228[24] = *(_QWORD *)&v228[16];
        operator delete(*(void **)&v228[16]);
      }
      if (v227[1].n128_u64[1])
      {
        *(_QWORD *)v228 = v227[1].n128_u64[1];
        operator delete((void *)v227[1].n128_u64[1]);
      }
      if (v227[1].n128_i8[7] < 0)
        operator delete((void *)v227[0].n128_u64[0]);
      v36 = __val + 1;
      v35 = v220;
    }
    while (__val + 1 < ((char *)v221 - (_BYTE *)v220) >> 3);
  }
  if (v35)
  {
    v221 = v35;
    operator delete(v35);
  }
  v221 = 0;
  v220 = 0;
  v222 = 0;
  std::vector<NSObject *>::__init_with_size[abi:ne180100]<NSObject **,NSObject **>(&v220, *(const void **)(v187 + 336), *(_QWORD *)(v187 + 344), (uint64_t)(*(_QWORD *)(v187 + 344) - *(_QWORD *)(v187 + 336)) >> 3);
  v58 = v221;
  if (v221 != v220)
  {
    v59 = 0;
    v58 = v220;
    do
    {
      v60 = (void *)v58[v59];
      memset(v228, 0, sizeof(v228));
      memset(v227, 0, sizeof(v227));
      v231 = 0;
      v232 = 0;
      v230 = 0;
      LODWORD(v233) = 0;
      __p = 0;
      v235[0] = 0;
      v236 = 0u;
      v237 = 0u;
      v238 = 0u;
      v229 = v60;
      if (objc_msgSend(v60, "vertexFunction"))
        MTLPipelineCollection::getFunctionData(v187, (void *)objc_msgSend(v60, "vertexFunction"), (uint64_t)&v230);
      if (objc_msgSend(v60, "fragmentFunction"))
        MTLPipelineCollection::getFunctionData(v187, (void *)objc_msgSend(v60, "fragmentFunction"), (uint64_t)&v233);
      v61 = (void *)objc_msgSend(v60, "vertexPreloadedLibraries");
      v189 = v60;
      v185 = v59;
      v214 = 0u;
      v215 = 0u;
      v212 = 0u;
      v213 = 0u;
      v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v212, v245, 16);
      if (v62)
      {
        v63 = *(_QWORD *)v213;
        do
        {
          for (m = 0; m != v62; ++m)
          {
            if (*(_QWORD *)v213 != v63)
              objc_enumerationMutation(v61);
            v65 = (_OWORD *)objc_msgSend(*(id *)(*((_QWORD *)&v212 + 1) + 8 * m), "libraryUUID");
            *(_OWORD *)v248 = *v65;
            *(_OWORD *)&v248[16] = v65[1];
            *(_OWORD *)v247 = *(_OWORD *)v248;
            *(_OWORD *)&v247[16] = *(_OWORD *)&v248[16];
            v223 = v247;
            v66 = std::__tree<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::__map_value_compare<MTLLibraryIdentifier,std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::less<MTLLibraryIdentifier>,true>,std::allocator<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>>>::__emplace_unique_key_args<MTLLibraryIdentifier,std::piecewise_construct_t const&,std::tuple<MTLLibraryIdentifier&&>,std::tuple<>>(v5, (unsigned int *)v247, (uint64_t)&std::piecewise_construct, &v223);
            v67 = v66;
            v68 = *((_QWORD *)&v236 + 1);
            if (*((_QWORD *)&v236 + 1) >= (unint64_t)v237)
            {
              v70 = (uint64_t)(*((_QWORD *)&v236 + 1) - v236) >> 3;
              if ((unint64_t)(v70 + 1) >> 61)
                std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
              v71 = (uint64_t)(v237 - v236) >> 2;
              if (v71 <= v70 + 1)
                v71 = v70 + 1;
              if ((_QWORD)v237 - (_QWORD)v236 >= 0x7FFFFFFFFFFFFFF8uLL)
                v72 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v72 = v71;
              if (v72)
                v73 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v237, v72);
              else
                v73 = 0;
              v74 = &v73[8 * v70];
              *(_QWORD *)v74 = *((_QWORD *)v67 + 8);
              v69 = v74 + 8;
              v75 = (char *)*((_QWORD *)&v236 + 1);
              v76 = (char *)v236;
              if (*((_QWORD *)&v236 + 1) != (_QWORD)v236)
              {
                do
                {
                  v77 = *((_QWORD *)v75 - 1);
                  v75 -= 8;
                  *((_QWORD *)v74 - 1) = v77;
                  v74 -= 8;
                }
                while (v75 != v76);
                v75 = (char *)v236;
              }
              *(_QWORD *)&v236 = v74;
              *((_QWORD *)&v236 + 1) = v69;
              *(_QWORD *)&v237 = &v73[8 * v72];
              if (v75)
                operator delete(v75);
            }
            else
            {
              **((_QWORD **)&v236 + 1) = *((_QWORD *)v66 + 8);
              v69 = (_QWORD *)(v68 + 8);
            }
            *((_QWORD *)&v236 + 1) = v69;
          }
          v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v212, v245, 16);
        }
        while (v62);
      }
      v78 = (void *)objc_msgSend(v189, "fragmentPreloadedLibraries");
      v210 = 0u;
      v211 = 0u;
      v208 = 0u;
      v209 = 0u;
      v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v208, v244, 16);
      if (v79)
      {
        v80 = *(_QWORD *)v209;
        do
        {
          for (n = 0; n != v79; ++n)
          {
            if (*(_QWORD *)v209 != v80)
              objc_enumerationMutation(v78);
            v82 = (_OWORD *)objc_msgSend(*(id *)(*((_QWORD *)&v208 + 1) + 8 * n), "libraryUUID");
            *(_OWORD *)v248 = *v82;
            *(_OWORD *)&v248[16] = v82[1];
            *(_OWORD *)v247 = *(_OWORD *)v248;
            *(_OWORD *)&v247[16] = *(_OWORD *)&v248[16];
            v223 = v247;
            v83 = std::__tree<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::__map_value_compare<MTLLibraryIdentifier,std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::less<MTLLibraryIdentifier>,true>,std::allocator<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>>>::__emplace_unique_key_args<MTLLibraryIdentifier,std::piecewise_construct_t const&,std::tuple<MTLLibraryIdentifier&&>,std::tuple<>>(v5, (unsigned int *)v247, (uint64_t)&std::piecewise_construct, &v223);
            v84 = v83;
            v85 = v238;
            if ((unint64_t)v238 >= *((_QWORD *)&v238 + 1))
            {
              v87 = (uint64_t)(v238 - *((_QWORD *)&v237 + 1)) >> 3;
              if ((unint64_t)(v87 + 1) >> 61)
                std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
              v88 = (uint64_t)(*((_QWORD *)&v238 + 1) - *((_QWORD *)&v237 + 1)) >> 2;
              if (v88 <= v87 + 1)
                v88 = v87 + 1;
              if (*((_QWORD *)&v238 + 1) - *((_QWORD *)&v237 + 1) >= 0x7FFFFFFFFFFFFFF8uLL)
                v89 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v89 = v88;
              if (v89)
                v90 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v238 + 8, v89);
              else
                v90 = 0;
              v91 = &v90[8 * v87];
              *(_QWORD *)v91 = *((_QWORD *)v84 + 8);
              v86 = v91 + 8;
              v92 = (char *)v238;
              v93 = (char *)*((_QWORD *)&v237 + 1);
              if ((_QWORD)v238 != *((_QWORD *)&v237 + 1))
              {
                do
                {
                  v94 = *((_QWORD *)v92 - 1);
                  v92 -= 8;
                  *((_QWORD *)v91 - 1) = v94;
                  v91 -= 8;
                }
                while (v92 != v93);
                v92 = (char *)*((_QWORD *)&v237 + 1);
              }
              *((_QWORD *)&v237 + 1) = v91;
              *(_QWORD *)&v238 = v86;
              *((_QWORD *)&v238 + 1) = &v90[8 * v89];
              if (v92)
                operator delete(v92);
            }
            else
            {
              *(_QWORD *)v238 = *((_QWORD *)v83 + 8);
              v86 = (_QWORD *)(v85 + 8);
            }
            *(_QWORD *)&v238 = v86;
          }
          v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v208, v244, 16);
        }
        while (v79);
      }
      if ((*(_BYTE *)(v187 + 24) & 2) != 0)
      {
        std::to_string((std::string *)v248, v185);
        v95 = std::string::insert((std::string *)v248, 0, "RenderPipeline_");
        v96 = v95->__r_.__value_.__r.__words[0];
        *(_QWORD *)v247 = v95->__r_.__value_.__l.__size_;
        *(_QWORD *)&v247[7] = *(std::string::size_type *)((char *)&v95->__r_.__value_.__r.__words[1] + 7);
        v97 = HIBYTE(v95->__r_.__value_.__r.__words[2]);
        v95->__r_.__value_.__l.__size_ = 0;
        v95->__r_.__value_.__r.__words[2] = 0;
        v95->__r_.__value_.__r.__words[0] = 0;
        if (v227[1].n128_i8[7] < 0)
          operator delete((void *)v227[0].n128_u64[0]);
        v227[0].n128_u64[0] = v96;
        v227[0].n128_u64[1] = *(_QWORD *)v247;
        *(unint64_t *)((char *)&v227[0].n128_u64[1] + 7) = *(_QWORD *)&v247[7];
        v227[1].n128_u8[7] = v97;
        if ((v248[23] & 0x80000000) != 0)
          operator delete(*(void **)v248);
      }
      (*(void (**)(MTLPipelineLibrarySerializer::PipelineLibraryJSONSerializer *, __n128 *))(*(_QWORD *)MetalScriptSerializer + 32))(MetalScriptSerializer, v227);
      if (*((_QWORD *)&v237 + 1))
      {
        *(_QWORD *)&v238 = *((_QWORD *)&v237 + 1);
        operator delete(*((void **)&v237 + 1));
      }
      if ((_QWORD)v236)
      {
        *((_QWORD *)&v236 + 1) = v236;
        operator delete((void *)v236);
      }
      if (*(_QWORD *)&v228[16])
      {
        *(_QWORD *)&v228[24] = *(_QWORD *)&v228[16];
        operator delete(*(void **)&v228[16]);
      }
      if (v227[1].n128_u64[1])
      {
        *(_QWORD *)v228 = v227[1].n128_u64[1];
        operator delete((void *)v227[1].n128_u64[1]);
      }
      if (v227[1].n128_i8[7] < 0)
        operator delete((void *)v227[0].n128_u64[0]);
      v59 = v185 + 1;
      v58 = v220;
    }
    while (v185 + 1 < ((char *)v221 - (_BYTE *)v220) >> 3);
  }
  if (v58)
  {
    v221 = v58;
    operator delete(v58);
  }
  v221 = 0;
  v220 = 0;
  v222 = 0;
  std::vector<NSObject *>::__init_with_size[abi:ne180100]<NSObject **,NSObject **>(&v220, *(const void **)(v187 + 464), *(_QWORD *)(v187 + 472), (uint64_t)(*(_QWORD *)(v187 + 472) - *(_QWORD *)(v187 + 464)) >> 3);
  v98 = v221;
  if (v221 != v220)
  {
    v99 = 0;
    v98 = v220;
    do
    {
      v100 = (void *)v98[v99];
      memset(v228, 0, sizeof(v228));
      memset(v227, 0, sizeof(v227));
      v230 = 0;
      v231 = 0;
      v232 = 0;
      __p = 0;
      v235[0] = 0;
      v233 = 0;
      v229 = v100;
      if (objc_msgSend(v100, "tileFunction"))
        MTLPipelineCollection::getFunctionData(v187, (void *)objc_msgSend(v100, "tileFunction"), (uint64_t)&v230);
      v101 = (void *)objc_msgSend(v100, "preloadedLibraries");
      __vala = v99;
      v206 = 0u;
      v207 = 0u;
      v204 = 0u;
      v205 = 0u;
      v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v204, v243, 16);
      if (v102)
      {
        v103 = *(_QWORD *)v205;
        do
        {
          for (ii = 0; ii != v102; ++ii)
          {
            if (*(_QWORD *)v205 != v103)
              objc_enumerationMutation(v101);
            v105 = (_OWORD *)objc_msgSend(*(id *)(*((_QWORD *)&v204 + 1) + 8 * ii), "libraryUUID");
            *(_OWORD *)v248 = *v105;
            *(_OWORD *)&v248[16] = v105[1];
            *(_OWORD *)v247 = *(_OWORD *)v248;
            *(_OWORD *)&v247[16] = *(_OWORD *)&v248[16];
            v223 = v247;
            v106 = std::__tree<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::__map_value_compare<MTLLibraryIdentifier,std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::less<MTLLibraryIdentifier>,true>,std::allocator<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>>>::__emplace_unique_key_args<MTLLibraryIdentifier,std::piecewise_construct_t const&,std::tuple<MTLLibraryIdentifier&&>,std::tuple<>>(v5, (unsigned int *)v247, (uint64_t)&std::piecewise_construct, &v223);
            v107 = v106;
            v108 = (char *)__p;
            if ((unint64_t)__p >= v235[0])
            {
              v110 = ((_BYTE *)__p - (_BYTE *)v233) >> 3;
              if ((unint64_t)(v110 + 1) >> 61)
                std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
              v111 = (uint64_t)(v235[0] - (_QWORD)v233) >> 2;
              if (v111 <= v110 + 1)
                v111 = v110 + 1;
              if (v235[0] - (_QWORD)v233 >= 0x7FFFFFFFFFFFFFF8uLL)
                v112 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v112 = v111;
              if (v112)
                v113 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)v235, v112);
              else
                v113 = 0;
              v114 = &v113[8 * v110];
              *(_QWORD *)v114 = *((_QWORD *)v107 + 8);
              v109 = v114 + 8;
              v115 = (char *)__p;
              v116 = (char *)v233;
              if (__p != v233)
              {
                do
                {
                  v117 = *((_QWORD *)v115 - 1);
                  v115 -= 8;
                  *((_QWORD *)v114 - 1) = v117;
                  v114 -= 8;
                }
                while (v115 != v116);
                v115 = (char *)v233;
              }
              v233 = v114;
              __p = v109;
              v235[0] = &v113[8 * v112];
              if (v115)
                operator delete(v115);
            }
            else
            {
              *(_QWORD *)__p = *((_QWORD *)v106 + 8);
              v109 = v108 + 8;
            }
            __p = v109;
          }
          v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v204, v243, 16);
        }
        while (v102);
      }
      if ((*(_BYTE *)(v187 + 24) & 2) != 0)
      {
        std::to_string((std::string *)v248, __vala);
        v118 = std::string::insert((std::string *)v248, 0, "TileRenderPipeline_");
        v119 = v118->__r_.__value_.__r.__words[0];
        *(_QWORD *)v247 = v118->__r_.__value_.__l.__size_;
        *(_QWORD *)&v247[7] = *(std::string::size_type *)((char *)&v118->__r_.__value_.__r.__words[1] + 7);
        v120 = HIBYTE(v118->__r_.__value_.__r.__words[2]);
        v118->__r_.__value_.__l.__size_ = 0;
        v118->__r_.__value_.__r.__words[2] = 0;
        v118->__r_.__value_.__r.__words[0] = 0;
        if (v227[1].n128_i8[7] < 0)
          operator delete((void *)v227[0].n128_u64[0]);
        v227[0].n128_u64[0] = v119;
        v227[0].n128_u64[1] = *(_QWORD *)v247;
        *(unint64_t *)((char *)&v227[0].n128_u64[1] + 7) = *(_QWORD *)&v247[7];
        v227[1].n128_u8[7] = v120;
        if ((v248[23] & 0x80000000) != 0)
          operator delete(*(void **)v248);
      }
      (*(void (**)(MTLPipelineLibrarySerializer::PipelineLibraryJSONSerializer *, __n128 *))(*(_QWORD *)MetalScriptSerializer + 56))(MetalScriptSerializer, v227);
      if (v233)
      {
        __p = v233;
        operator delete(v233);
      }
      if (*(_QWORD *)&v228[16])
      {
        *(_QWORD *)&v228[24] = *(_QWORD *)&v228[16];
        operator delete(*(void **)&v228[16]);
      }
      if (v227[1].n128_u64[1])
      {
        *(_QWORD *)v228 = v227[1].n128_u64[1];
        operator delete((void *)v227[1].n128_u64[1]);
      }
      if (v227[1].n128_i8[7] < 0)
        operator delete((void *)v227[0].n128_u64[0]);
      v99 = __vala + 1;
      v98 = v220;
    }
    while (__vala + 1 < ((char *)v221 - (_BYTE *)v220) >> 3);
  }
  if (v98)
  {
    v221 = v98;
    operator delete(v98);
  }
  v221 = 0;
  v220 = 0;
  v222 = 0;
  v121 = v187;
  std::vector<NSObject *>::__init_with_size[abi:ne180100]<NSObject **,NSObject **>(&v220, *(const void **)(v187 + 528), *(_QWORD *)(v187 + 536), (uint64_t)(*(_QWORD *)(v187 + 536) - *(_QWORD *)(v187 + 528)) >> 3);
  v122 = v221;
  if (v221 != v220)
  {
    v123 = 0;
    v182 = &v241;
    v122 = v220;
    do
    {
      v124 = (void *)v122[v123];
      memset(v228, 0, sizeof(v228));
      memset(v227, 0, sizeof(v227));
      v231 = 0;
      v232 = 0;
      v230 = 0;
      LODWORD(v233) = 0;
      __p = 0;
      v235[0] = 0;
      LODWORD(v236) = 0;
      *((_QWORD *)&v236 + 1) = 0;
      *(_QWORD *)&v237 = 0;
      v238 = 0u;
      v239 = 0u;
      v240 = 0u;
      v241 = 0u;
      v242 = 0;
      v229 = v124;
      if (objc_msgSend(v124, "objectFunction", v182))
        MTLPipelineCollection::getFunctionData(v121, (void *)objc_msgSend(v124, "objectFunction"), (uint64_t)&v230);
      if (objc_msgSend(v124, "meshFunction"))
        MTLPipelineCollection::getFunctionData(v121, (void *)objc_msgSend(v124, "meshFunction"), (uint64_t)&v233);
      if (objc_msgSend(v124, "fragmentFunction"))
        MTLPipelineCollection::getFunctionData(v121, (void *)objc_msgSend(v124, "fragmentFunction"), (uint64_t)&v236);
      v125 = (void *)objc_msgSend(v124, "objectPreloadedLibraries");
      v184 = v123;
      v186 = v124;
      v202 = 0u;
      v203 = 0u;
      v200 = 0u;
      v201 = 0u;
      v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v200, v226, 16);
      if (v126)
      {
        v127 = *(_QWORD *)v201;
        do
        {
          for (jj = 0; jj != v126; ++jj)
          {
            if (*(_QWORD *)v201 != v127)
              objc_enumerationMutation(v125);
            v129 = (_OWORD *)objc_msgSend(*(id *)(*((_QWORD *)&v200 + 1) + 8 * jj), "libraryUUID");
            *(_OWORD *)v248 = *v129;
            *(_OWORD *)&v248[16] = v129[1];
            *(_OWORD *)v247 = *(_OWORD *)v248;
            *(_OWORD *)&v247[16] = *(_OWORD *)&v248[16];
            v223 = v247;
            v130 = std::__tree<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::__map_value_compare<MTLLibraryIdentifier,std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::less<MTLLibraryIdentifier>,true>,std::allocator<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>>>::__emplace_unique_key_args<MTLLibraryIdentifier,std::piecewise_construct_t const&,std::tuple<MTLLibraryIdentifier&&>,std::tuple<>>(v5, (unsigned int *)v247, (uint64_t)&std::piecewise_construct, &v223);
            v131 = v130;
            v132 = *((_QWORD *)&v238 + 1);
            if (*((_QWORD *)&v238 + 1) >= (unint64_t)v239)
            {
              v134 = (uint64_t)(*((_QWORD *)&v238 + 1) - v238) >> 3;
              if ((unint64_t)(v134 + 1) >> 61)
                std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
              v135 = (uint64_t)(v239 - v238) >> 2;
              if (v135 <= v134 + 1)
                v135 = v134 + 1;
              if ((_QWORD)v239 - (_QWORD)v238 >= 0x7FFFFFFFFFFFFFF8uLL)
                v136 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v136 = v135;
              if (v136)
                v137 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v239, v136);
              else
                v137 = 0;
              v138 = &v137[8 * v134];
              *(_QWORD *)v138 = *((_QWORD *)v131 + 8);
              v133 = v138 + 8;
              v139 = (char *)*((_QWORD *)&v238 + 1);
              v140 = (char *)v238;
              if (*((_QWORD *)&v238 + 1) != (_QWORD)v238)
              {
                do
                {
                  v141 = *((_QWORD *)v139 - 1);
                  v139 -= 8;
                  *((_QWORD *)v138 - 1) = v141;
                  v138 -= 8;
                }
                while (v139 != v140);
                v139 = (char *)v238;
              }
              *(_QWORD *)&v238 = v138;
              *((_QWORD *)&v238 + 1) = v133;
              *(_QWORD *)&v239 = &v137[8 * v136];
              if (v139)
                operator delete(v139);
            }
            else
            {
              **((_QWORD **)&v238 + 1) = *((_QWORD *)v130 + 8);
              v133 = (_QWORD *)(v132 + 8);
            }
            *((_QWORD *)&v238 + 1) = v133;
          }
          v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v200, v226, 16);
        }
        while (v126);
      }
      v142 = (void *)objc_msgSend(v186, "meshPreloadedLibraries");
      v198 = 0u;
      v199 = 0u;
      v196 = 0u;
      v197 = 0u;
      v143 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v196, v225, 16);
      if (v143)
      {
        v144 = *(_QWORD *)v197;
        do
        {
          for (kk = 0; kk != v143; ++kk)
          {
            if (*(_QWORD *)v197 != v144)
              objc_enumerationMutation(v142);
            v146 = (_OWORD *)objc_msgSend(*(id *)(*((_QWORD *)&v196 + 1) + 8 * kk), "libraryUUID");
            *(_OWORD *)v248 = *v146;
            *(_OWORD *)&v248[16] = v146[1];
            *(_OWORD *)v247 = *(_OWORD *)v248;
            *(_OWORD *)&v247[16] = *(_OWORD *)&v248[16];
            v223 = v247;
            v147 = std::__tree<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::__map_value_compare<MTLLibraryIdentifier,std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::less<MTLLibraryIdentifier>,true>,std::allocator<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>>>::__emplace_unique_key_args<MTLLibraryIdentifier,std::piecewise_construct_t const&,std::tuple<MTLLibraryIdentifier&&>,std::tuple<>>(v5, (unsigned int *)v247, (uint64_t)&std::piecewise_construct, &v223);
            v148 = v147;
            v149 = v240;
            if ((unint64_t)v240 >= *((_QWORD *)&v240 + 1))
            {
              v151 = (uint64_t)(v240 - *((_QWORD *)&v239 + 1)) >> 3;
              if ((unint64_t)(v151 + 1) >> 61)
                std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
              v152 = (uint64_t)(*((_QWORD *)&v240 + 1) - *((_QWORD *)&v239 + 1)) >> 2;
              if (v152 <= v151 + 1)
                v152 = v151 + 1;
              if (*((_QWORD *)&v240 + 1) - *((_QWORD *)&v239 + 1) >= 0x7FFFFFFFFFFFFFF8uLL)
                v153 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v153 = v152;
              if (v153)
                v154 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v240 + 8, v153);
              else
                v154 = 0;
              v155 = &v154[8 * v151];
              *(_QWORD *)v155 = *((_QWORD *)v148 + 8);
              v150 = v155 + 8;
              v156 = (char *)v240;
              v157 = (char *)*((_QWORD *)&v239 + 1);
              if ((_QWORD)v240 != *((_QWORD *)&v239 + 1))
              {
                do
                {
                  v158 = *((_QWORD *)v156 - 1);
                  v156 -= 8;
                  *((_QWORD *)v155 - 1) = v158;
                  v155 -= 8;
                }
                while (v156 != v157);
                v156 = (char *)*((_QWORD *)&v239 + 1);
              }
              *((_QWORD *)&v239 + 1) = v155;
              *(_QWORD *)&v240 = v150;
              *((_QWORD *)&v240 + 1) = &v154[8 * v153];
              if (v156)
                operator delete(v156);
            }
            else
            {
              *(_QWORD *)v240 = *((_QWORD *)v147 + 8);
              v150 = (_QWORD *)(v149 + 8);
            }
            *(_QWORD *)&v240 = v150;
          }
          v143 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v196, v225, 16);
        }
        while (v143);
      }
      v159 = (void *)objc_msgSend(v186, "fragmentPreloadedLibraries");
      v194 = 0u;
      v195 = 0u;
      v192 = 0u;
      v193 = 0u;
      v160 = objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v192, v224, 16);
      if (v160)
      {
        v161 = *(_QWORD *)v193;
        do
        {
          for (mm = 0; mm != v160; ++mm)
          {
            if (*(_QWORD *)v193 != v161)
              objc_enumerationMutation(v159);
            v163 = (_OWORD *)objc_msgSend(*(id *)(*((_QWORD *)&v192 + 1) + 8 * mm), "libraryUUID");
            *(_OWORD *)v248 = *v163;
            *(_OWORD *)&v248[16] = v163[1];
            *(_OWORD *)v247 = *(_OWORD *)v248;
            *(_OWORD *)&v247[16] = *(_OWORD *)&v248[16];
            v223 = v247;
            v164 = std::__tree<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::__map_value_compare<MTLLibraryIdentifier,std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::less<MTLLibraryIdentifier>,true>,std::allocator<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>>>::__emplace_unique_key_args<MTLLibraryIdentifier,std::piecewise_construct_t const&,std::tuple<MTLLibraryIdentifier&&>,std::tuple<>>(v5, (unsigned int *)v247, (uint64_t)&std::piecewise_construct, &v223);
            v165 = v164;
            v166 = *((_QWORD *)&v241 + 1);
            if (*((_QWORD *)&v241 + 1) >= (unint64_t)v242)
            {
              v168 = (uint64_t)(*((_QWORD *)&v241 + 1) - v241) >> 3;
              if ((unint64_t)(v168 + 1) >> 61)
                std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
              v169 = (uint64_t)&v242[-v241] >> 2;
              if (v169 <= v168 + 1)
                v169 = v168 + 1;
              if ((unint64_t)&v242[-v241] >= 0x7FFFFFFFFFFFFFF8)
                v170 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v170 = v169;
              if (v170)
                v171 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v242, v170);
              else
                v171 = 0;
              v172 = &v171[8 * v168];
              *(_QWORD *)v172 = *((_QWORD *)v165 + 8);
              v167 = v172 + 8;
              v173 = (char *)*((_QWORD *)&v241 + 1);
              v174 = (char *)v241;
              if (*((_QWORD *)&v241 + 1) != (_QWORD)v241)
              {
                do
                {
                  v175 = *((_QWORD *)v173 - 1);
                  v173 -= 8;
                  *((_QWORD *)v172 - 1) = v175;
                  v172 -= 8;
                }
                while (v173 != v174);
                v173 = (char *)v241;
              }
              *(_QWORD *)&v241 = v172;
              *((_QWORD *)&v241 + 1) = v167;
              v242 = &v171[8 * v170];
              if (v173)
                operator delete(v173);
            }
            else
            {
              **((_QWORD **)&v241 + 1) = *((_QWORD *)v164 + 8);
              v167 = (_QWORD *)(v166 + 8);
            }
            *((_QWORD *)&v241 + 1) = v167;
          }
          v160 = objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v192, v224, 16);
        }
        while (v160);
      }
      v121 = v187;
      if ((*(_BYTE *)(v187 + 24) & 2) != 0)
      {
        std::to_string((std::string *)v248, v184);
        v176 = std::string::insert((std::string *)v248, 0, "MeshRenderPipeline_");
        v177 = v176->__r_.__value_.__r.__words[0];
        *(_QWORD *)v247 = v176->__r_.__value_.__l.__size_;
        *(_QWORD *)&v247[7] = *(std::string::size_type *)((char *)&v176->__r_.__value_.__r.__words[1] + 7);
        v178 = HIBYTE(v176->__r_.__value_.__r.__words[2]);
        v176->__r_.__value_.__l.__size_ = 0;
        v176->__r_.__value_.__r.__words[2] = 0;
        v176->__r_.__value_.__r.__words[0] = 0;
        if (v227[1].n128_i8[7] < 0)
          operator delete((void *)v227[0].n128_u64[0]);
        v227[0].n128_u64[0] = v177;
        v227[0].n128_u64[1] = *(_QWORD *)v247;
        *(unint64_t *)((char *)&v227[0].n128_u64[1] + 7) = *(_QWORD *)&v247[7];
        v227[1].n128_u8[7] = v178;
        if ((v248[23] & 0x80000000) != 0)
          operator delete(*(void **)v248);
      }
      (*(void (**)(MTLPipelineLibrarySerializer::PipelineLibraryJSONSerializer *, __n128 *))(*(_QWORD *)MetalScriptSerializer + 64))(MetalScriptSerializer, v227);
      if ((_QWORD)v241)
      {
        *((_QWORD *)&v241 + 1) = v241;
        operator delete((void *)v241);
      }
      if (*((_QWORD *)&v239 + 1))
      {
        *(_QWORD *)&v240 = *((_QWORD *)&v239 + 1);
        operator delete(*((void **)&v239 + 1));
      }
      if ((_QWORD)v238)
      {
        *((_QWORD *)&v238 + 1) = v238;
        operator delete((void *)v238);
      }
      if (*(_QWORD *)&v228[16])
      {
        *(_QWORD *)&v228[24] = *(_QWORD *)&v228[16];
        operator delete(*(void **)&v228[16]);
      }
      if (v227[1].n128_u64[1])
      {
        *(_QWORD *)v228 = v227[1].n128_u64[1];
        operator delete((void *)v227[1].n128_u64[1]);
      }
      if (v227[1].n128_i8[7] < 0)
        operator delete((void *)v227[0].n128_u64[0]);
      v123 = v184 + 1;
      v122 = v220;
    }
    while (v184 + 1 < ((char *)v221 - (_BYTE *)v220) >> 3);
  }
  if (v122)
  {
    v221 = v122;
    operator delete(v122);
  }
  v179 = MetalScriptSerializer;
  objc_autoreleasePoolPop(context);
  v180 = (*(uint64_t (**)(MTLPipelineLibrarySerializer::PipelineLibraryJSONSerializer *))(*(_QWORD *)v179
                                                                                                  + 72))(v179);
  (*(void (**)(MTLPipelineLibrarySerializer::PipelineLibraryJSONSerializer *))(*(_QWORD *)v179 + 88))(v179);
  return v180;
}

void sub_1827A7A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  MEMORY[0x186DABFBC](a23, 0x10A1C40CA368B51);
  _Unwind_Resume(a1);
}

void MTLPipelineCollection::writeJSONToFile(MTLPipelineCollection *this, NSString *a2)
{
  NSObject *v2;
  _QWORD v3[6];

  v2 = *((_QWORD *)this + 36);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = ___ZN21MTLPipelineCollection15writeJSONToFileEP8NSString_block_invoke;
  v3[3] = &unk_1E0FE3128;
  v3[4] = a2;
  v3[5] = this;
  dispatch_sync(v2, v3);
}

void ___ZN21MTLPipelineCollection15writeJSONToFileEP8NSString_block_invoke(uint64_t a1)
{
  MTLPipelineCollection *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(MTLPipelineCollection **)(a1 + 40);
  v3 = (void *)MEMORY[0x186DAC640]();
  v4 = (void *)MTLPipelineCollection::JSONDataNoSync(v2);
  v9 = 0;
  if ((objc_msgSend(v4, "writeToFile:options:error:", *(_QWORD *)(a1 + 32), 1, &v9) & 1) == 0)
    MTLReportFailure(0, "writeJSONToFile_block_invoke", 701, (uint64_t)CFSTR("writing serialized pipelines to '%@' failed with error: %@"), v5, v6, v7, v8, *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v3);
}

void MTLPipelineLibrarySerializer::ComputePipelineDescriptor::~ComputePipelineDescriptor(MTLPipelineLibrarySerializer::ComputePipelineDescriptor *this)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)*((_QWORD *)this + 14);
  if (v2)
  {
    *((_QWORD *)this + 15) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 6);
  if (v3)
  {
    *((_QWORD *)this + 7) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 3);
  if (v4)
  {
    *((_QWORD *)this + 4) = v4;
    operator delete(v4);
  }
  if (*((char *)this + 23) < 0)
    operator delete(*(void **)this);
}

void MTLPipelineLibrarySerializer::RenderPipelineDescriptor::~RenderPipelineDescriptor(MTLPipelineLibrarySerializer::RenderPipelineDescriptor *this)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)*((_QWORD *)this + 21);
  if (v2)
  {
    *((_QWORD *)this + 22) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 18);
  if (v3)
  {
    *((_QWORD *)this + 19) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 6);
  if (v4)
  {
    *((_QWORD *)this + 7) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((_QWORD *)this + 3);
  if (v5)
  {
    *((_QWORD *)this + 4) = v5;
    operator delete(v5);
  }
  if (*((char *)this + 23) < 0)
    operator delete(*(void **)this);
}

void MTLPipelineLibrarySerializer::MeshRenderPipelineDescriptor::~MeshRenderPipelineDescriptor(MTLPipelineLibrarySerializer::MeshRenderPipelineDescriptor *this)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)*((_QWORD *)this + 28);
  if (v2)
  {
    *((_QWORD *)this + 29) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 25);
  if (v3)
  {
    *((_QWORD *)this + 26) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 22);
  if (v4)
  {
    *((_QWORD *)this + 23) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((_QWORD *)this + 6);
  if (v5)
  {
    *((_QWORD *)this + 7) = v5;
    operator delete(v5);
  }
  v6 = (void *)*((_QWORD *)this + 3);
  if (v6)
  {
    *((_QWORD *)this + 4) = v6;
    operator delete(v6);
  }
  if (*((char *)this + 23) < 0)
    operator delete(*(void **)this);
}

std::string *std::pair<std::string const,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>::pair[abi:ne180100](std::string *this, __int128 *a2)
{
  __int128 v4;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>::unordered_map((uint64_t)&this[1], (uint64_t)a2 + 24);
  return this;
}

void sub_1827A7EEC(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor::~MTLSpecializedFunctionDescriptor(id *this)
{

  MTLPipelineLibrarySerializer::FunctionDescriptor::~FunctionDescriptor(this);
}

void MTLPipelineLibrarySerializer::LibraryDescriptor::~LibraryDescriptor(id *this)
{

}

void MTLPipelineLibrarySerializer::StitchedLibraryDescriptor::~StitchedLibraryDescriptor(id *this)
{

}

MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor::MTLSpecializedFunctionDescriptor(MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *this, MTLLibraryData *a2, NSString *a3, MTLFunctionConstantValues *a4, NSString *a5, NSString *a6, MTLFunctionType a7, uint64_t a8)
{
  MTLPipelineLibrarySerializer::FunctionDescriptor *v12;

  v12 = MTLPipelineLibrarySerializer::FunctionDescriptor::FunctionDescriptor(this, a2, a3, a7, a8);
  *((_QWORD *)v12 + 4) = 0;
  *((_QWORD *)v12 + 5) = 0;
  *((_QWORD *)v12 + 6) = 0;
  *((_QWORD *)v12 + 4) = -[MTLFunctionConstantValues copy](a4, "copy");
  *((_QWORD *)this + 5) = -[NSString copy](a5, "copy");
  *((_QWORD *)this + 6) = -[NSString copy](a6, "copy");
  return this;
}

void sub_1827A802C(_Unwind_Exception *a1)
{
  id *v1;

  MTLPipelineLibrarySerializer::FunctionDescriptor::~FunctionDescriptor(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<NSObject *>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<NSObject *>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<NSObject *>>>>::__deallocate_node(int a1, _QWORD *__p)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (_QWORD *)*v2;
      v4 = (void *)v2[3];
      if (v4)
      {
        v2[4] = v4;
        operator delete(v4);
      }
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,0>(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table(a1 + 24);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>::unordered_map(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *i;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__rehash<true>(a1, *(_QWORD *)(a2 + 8));
  for (i = *(unsigned __int8 **)(a2 + 16); i; i = *(unsigned __int8 **)i)
    std::__hash_table<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *> const&>(a1, i + 16, (uint64_t)(i + 16));
  return a1;
}

void sub_1827A81C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *> const&>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  unsigned __int8 **v13;
  unsigned __int8 *i;
  unint64_t v15;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  _QWORD *v22;
  unint64_t v23;
  _QWORD v25[3];

  v7 = (_QWORD *)(a1 + 24);
  v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      v3 = v8;
      if (v8 >= v10)
        v3 = v8 % v10;
    }
    else
    {
      v3 = (v10 - 1) & v8;
    }
    v13 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v3);
    if (v13)
    {
      for (i = *v13; i; i = *(unsigned __int8 **)i)
      {
        v15 = *((_QWORD *)i + 1);
        if (v15 == v9)
        {
          if ((std::__tuple_equal<1ul>::operator()[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>>(a1 + 32, i + 16, a2) & 1) != 0)return i;
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10)
              v15 %= v10;
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>::__construct_node_hash<std::pair<std::string const,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *> const&>(a1, v9, a3, (uint64_t)v25);
  v16 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    v18 = 1;
    if (v10 >= 3)
      v18 = (v10 & (v10 - 1)) != 0;
    v19 = v18 | (2 * v10);
    v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20)
      v21 = v20;
    else
      v21 = v19;
    std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__rehash<true>(a1, v21);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v3 = v9 % v10;
      else
        v3 = v9;
    }
    else
    {
      v3 = (v10 - 1) & v9;
    }
  }
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v22)
  {
    *(_QWORD *)v25[0] = *v22;
    *v22 = v25[0];
  }
  else
  {
    *(_QWORD *)v25[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v25[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = a1 + 16;
    if (*(_QWORD *)v25[0])
    {
      v23 = *(_QWORD *)(*(_QWORD *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10)
          v23 %= v10;
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v23) = v25[0];
    }
  }
  i = (unsigned __int8 *)v25[0];
  ++*v7;
  return i;
}

void sub_1827A8438(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>::__construct_node_hash<std::pair<std::string const,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *> const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _QWORD *v8;
  std::string *v9;

  v7 = a1 + 16;
  v8 = operator new(0x30uLL);
  *(_QWORD *)(a4 + 8) = v7;
  *(_QWORD *)a4 = v8;
  *(_BYTE *)(a4 + 16) = 0;
  *v8 = 0;
  v8[1] = a2;
  v9 = (std::string *)(v8 + 2);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    v8[4] = *(_QWORD *)(a3 + 16);
  }
  v8[5] = *(_QWORD *)(a3 + 24);
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_1827A84E8(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  unsigned __int8 **v14;
  unsigned __int8 *i;
  unint64_t v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  _QWORD *v23;
  unint64_t v24;
  _QWORD v26[3];

  v8 = (_QWORD *)(a1 + 24);
  v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(unsigned __int8 **)i)
      {
        v16 = *((_QWORD *)i + 1);
        if (v16 == v10)
        {
          if ((std::__tuple_equal<1ul>::operator()[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>>(a1 + 32, i + 16, a2) & 1) != 0)return i;
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11)
              v16 %= v11;
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    v19 = 1;
    if (v11 >= 3)
      v19 = (v11 & (v11 - 1)) != 0;
    v20 = v19 | (2 * v11);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__rehash<true>(a1, v22);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v23 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v23)
  {
    *(_QWORD *)v26[0] = *v23;
    *v23 = v26[0];
  }
  else
  {
    *(_QWORD *)v26[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v26[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v26[0])
    {
      v24 = *(_QWORD *)(*(_QWORD *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11)
          v24 %= v11;
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v24) = v26[0];
    }
  }
  i = (unsigned __int8 *)v26[0];
  ++*v8;
  return i;
}

void sub_1827A8774(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **__p, uint64_t a13)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100]((uint64_t)&a13, __p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::FunctionDescriptor *>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _QWORD *v8;
  std::string *v9;
  __int128 *v10;
  __int128 v11;

  v7 = a1 + 16;
  v8 = operator new(0x30uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *v8 = 0;
  v8[1] = a2;
  v9 = (std::string *)(v8 + 2);
  v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((_QWORD *)v10 + 1));
  }
  else
  {
    v11 = *v10;
    v8[4] = *((_QWORD *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  v8[5] = 0;
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_1827A8824(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,MTLLibraryData *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLLibraryData *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLLibraryData *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLLibraryData *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  unsigned __int8 **v14;
  unsigned __int8 *i;
  unint64_t v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  _QWORD *v23;
  unint64_t v24;
  _QWORD v26[3];

  v8 = (_QWORD *)(a1 + 24);
  v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(unsigned __int8 **)i)
      {
        v16 = *((_QWORD *)i + 1);
        if (v16 == v10)
        {
          if ((std::__tuple_equal<1ul>::operator()[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>>(a1 + 32, i + 16, a2) & 1) != 0)return i;
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11)
              v16 %= v11;
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,MTLLibraryData *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLLibraryData *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLLibraryData *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLLibraryData *>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    v19 = 1;
    if (v11 >= 3)
      v19 = (v11 & (v11 - 1)) != 0;
    v20 = v19 | (2 * v11);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__rehash<true>(a1, v22);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v23 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v23)
  {
    *(_QWORD *)v26[0] = *v23;
    *v23 = v26[0];
  }
  else
  {
    *(_QWORD *)v26[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v26[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v26[0])
    {
      v24 = *(_QWORD *)(*(_QWORD *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11)
          v24 %= v11;
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v24) = v26[0];
    }
  }
  i = (unsigned __int8 *)v26[0];
  ++*v8;
  return i;
}

void sub_1827A8AB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **__p, uint64_t a13)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100]((uint64_t)&a13, __p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,MTLLibraryData *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLLibraryData *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLLibraryData *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLLibraryData *>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _QWORD *v8;
  std::string *v9;
  __int128 *v10;
  __int128 v11;

  v7 = a1 + 16;
  v8 = operator new(0x30uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *v8 = 0;
  v8[1] = a2;
  v9 = (std::string *)(v8 + 2);
  v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((_QWORD *)v10 + 1));
  }
  else
  {
    v11 = *v10;
    v8[4] = *((_QWORD *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  v8[5] = 0;
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_1827A8B60(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  unsigned __int8 **v14;
  unsigned __int8 *i;
  unint64_t v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  _QWORD *v23;
  unint64_t v24;
  _QWORD v26[3];

  v8 = (_QWORD *)(a1 + 24);
  v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(unsigned __int8 **)i)
      {
        v16 = *((_QWORD *)i + 1);
        if (v16 == v10)
        {
          if ((std::__tuple_equal<1ul>::operator()[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>>(a1 + 32, i + 16, a2) & 1) != 0)return i;
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11)
              v16 %= v11;
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    v19 = 1;
    if (v11 >= 3)
      v19 = (v11 & (v11 - 1)) != 0;
    v20 = v19 | (2 * v11);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__rehash<true>(a1, v22);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v23 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v23)
  {
    *(_QWORD *)v26[0] = *v23;
    *v23 = v26[0];
  }
  else
  {
    *(_QWORD *)v26[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v26[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v26[0])
    {
      v24 = *(_QWORD *)(*(_QWORD *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11)
          v24 %= v11;
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v24) = v26[0];
    }
  }
  i = (unsigned __int8 *)v26[0];
  v26[0] = 0;
  ++*v8;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,void *>>>>::reset[abi:ne180100]((uint64_t)v26, 0);
  return i;
}

void sub_1827A8DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

double std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  std::string *v9;
  __int128 *v10;
  __int128 v11;
  double result;

  v7 = a1 + 16;
  v8 = (char *)operator new(0x50uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  v9 = (std::string *)(v8 + 16);
  v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((_QWORD *)v10 + 1));
  }
  else
  {
    v11 = *v10;
    *((_QWORD *)v8 + 4) = *((_QWORD *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  result = 0.0;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  *((_DWORD *)v8 + 18) = 1065353216;
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_1827A8EA8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unordered_map<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>,0>((uint64_t)v2 + 16);
    operator delete(v2);
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  unsigned __int8 **v13;
  unsigned __int8 *i;
  unint64_t v15;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  _QWORD *v22;
  unint64_t v23;
  _QWORD v25[3];

  v7 = (_QWORD *)(a1 + 24);
  v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      v3 = v8;
      if (v8 >= v10)
        v3 = v8 % v10;
    }
    else
    {
      v3 = (v10 - 1) & v8;
    }
    v13 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v3);
    if (v13)
    {
      for (i = *v13; i; i = *(unsigned __int8 **)i)
      {
        v15 = *((_QWORD *)i + 1);
        if (v15 == v9)
        {
          if ((std::__tuple_equal<1ul>::operator()[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>>(a1 + 32, i + 16, a2) & 1) != 0)return i;
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10)
              v15 %= v10;
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>::__construct_node_hash<std::pair<std::string const,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>(a1, v9, a3, (uint64_t)v25);
  v16 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    v18 = 1;
    if (v10 >= 3)
      v18 = (v10 & (v10 - 1)) != 0;
    v19 = v18 | (2 * v10);
    v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20)
      v21 = v20;
    else
      v21 = v19;
    std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__rehash<true>(a1, v21);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v3 = v9 % v10;
      else
        v3 = v9;
    }
    else
    {
      v3 = (v10 - 1) & v9;
    }
  }
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v22)
  {
    *(_QWORD *)v25[0] = *v22;
    *v22 = v25[0];
  }
  else
  {
    *(_QWORD *)v25[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v25[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = a1 + 16;
    if (*(_QWORD *)v25[0])
    {
      v23 = *(_QWORD *)(*(_QWORD *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10)
          v23 %= v10;
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v23) = v25[0];
    }
  }
  i = (unsigned __int8 *)v25[0];
  ++*v7;
  return i;
}

void sub_1827A915C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>>::__construct_node_hash<std::pair<std::string const,MTLPipelineLibrarySerializer::MTLSpecializedFunctionDescriptor *>>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _QWORD *v8;
  std::string *v9;

  v7 = a1 + 16;
  v8 = operator new(0x30uLL);
  *(_QWORD *)(a4 + 8) = v7;
  *(_QWORD *)a4 = v8;
  *(_BYTE *)(a4 + 16) = 0;
  *v8 = 0;
  v8[1] = a2;
  v9 = (std::string *)(v8 + 2);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    v8[4] = *(_QWORD *)(a3 + 16);
  }
  v8[5] = *(_QWORD *)(a3 + 24);
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_1827A920C(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

char *std::__hash_table<std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<NSObject *>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<NSObject *>>>>::__emplace_unique_key_args<unsigned long,unsigned long &,std::vector<NSObject *>>(uint64_t a1, unint64_t *a2, _QWORD *a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  void **v11;
  char *v12;
  unint64_t v13;
  _QWORD *v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;

  v8 = *a2;
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v8 >= v9)
        v4 = v8 % v9;
    }
    else
    {
      v4 = (v9 - 1) & v8;
    }
    v11 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v11)
    {
      v12 = (char *)*v11;
      if (*v11)
      {
        do
        {
          v13 = *((_QWORD *)v12 + 1);
          if (v13 == v8)
          {
            if (*((_QWORD *)v12 + 2) == v8)
              return v12;
          }
          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9)
                v13 %= v9;
            }
            else
            {
              v13 &= v9 - 1;
            }
            if (v13 != v4)
              break;
          }
          v12 = *(char **)v12;
        }
        while (v12);
      }
    }
  }
  v14 = (_QWORD *)(a1 + 16);
  v12 = (char *)operator new(0x30uLL);
  *(_QWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = v8;
  *((_QWORD *)v12 + 2) = *a3;
  *(_OWORD *)(v12 + 24) = *(_OWORD *)a4;
  *((_QWORD *)v12 + 5) = *(_QWORD *)(a4 + 16);
  *(_QWORD *)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    v17 = 1;
    if (v9 >= 3)
      v17 = (v9 & (v9 - 1)) != 0;
    v18 = v17 | (2 * v9);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__rehash<true>(a1, v20);
    v9 = *(_QWORD *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v4 = v8 % v9;
      else
        v4 = v8;
    }
    else
    {
      v4 = (v9 - 1) & v8;
    }
  }
  v21 = *(_QWORD *)a1;
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v22)
  {
    *(_QWORD *)v12 = *v22;
LABEL_38:
    *v22 = v12;
    goto LABEL_39;
  }
  *(_QWORD *)v12 = *v14;
  *v14 = v12;
  *(_QWORD *)(v21 + 8 * v4) = v14;
  if (*(_QWORD *)v12)
  {
    v23 = *(_QWORD *)(*(_QWORD *)v12 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v23 >= v9)
        v23 %= v9;
    }
    else
    {
      v23 &= v9 - 1;
    }
    v22 = (_QWORD *)(*(_QWORD *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v12;
}

void sub_1827A946C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  _QWORD *v10;
  uint64_t v11;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long,std::vector<NSObject *>>,void *>>>::operator()[abi:ne180100](v11, v10);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long,std::vector<NSObject *>>,void *>>>::operator()[abi:ne180100](uint64_t a1, _QWORD *__p)
{
  void *v3;

  if (*(_BYTE *)(a1 + 8))
  {
    v3 = (void *)__p[3];
    if (v3)
    {
      __p[4] = v3;
      operator delete(v3);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

void std::__function::__func<MTLPipelineCollection::JSONDataNoSync(void)::$_0,std::allocator<MTLPipelineCollection::JSONDataNoSync(void)::$_0>,MTLPipelineLibrarySerializer::FunctionReference ()(_MTLFunction *)>::~__func()
{
  JUMPOUT(0x186DABFBCLL);
}

_QWORD *std::__function::__func<MTLPipelineCollection::JSONDataNoSync(void)::$_0,std::allocator<MTLPipelineCollection::JSONDataNoSync(void)::$_0>,MTLPipelineLibrarySerializer::FunctionReference ()(_MTLFunction *)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E0FE1C98;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<MTLPipelineCollection::JSONDataNoSync(void)::$_0,std::allocator<MTLPipelineCollection::JSONDataNoSync(void)::$_0>,MTLPipelineLibrarySerializer::FunctionReference ()(_MTLFunction *)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E0FE1C98;
  a2[1] = v2;
  return result;
}

void std::__function::__func<MTLPipelineCollection::JSONDataNoSync(void)::$_0,std::allocator<MTLPipelineCollection::JSONDataNoSync(void)::$_0>,MTLPipelineLibrarySerializer::FunctionReference ()(_MTLFunction *)>::operator()(uint64_t a1@<X0>, void **a2@<X1>, uint64_t a3@<X8>)
{
  void *v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *(_QWORD *)(a1 + 8);
  *(_DWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  MTLPipelineCollection::getFunctionData(v4, v3, a3);
}

uint64_t std::__function::__func<MTLPipelineCollection::JSONDataNoSync(void)::$_0,std::allocator<MTLPipelineCollection::JSONDataNoSync(void)::$_0>,MTLPipelineLibrarySerializer::FunctionReference ()(_MTLFunction *)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<MTLPipelineCollection::JSONDataNoSync(void)::$_0,std::allocator<MTLPipelineCollection::JSONDataNoSync(void)::$_0>,MTLPipelineLibrarySerializer::FunctionReference ()(_MTLFunction *)>::target_type()
{
}

_QWORD *std::vector<NSObject *>::__init_with_size[abi:ne180100]<NSObject **,NSObject **>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<MTLSerializer::ObjectSerializer *>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1827A95F8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

const __CFString *MTLCompareFunctionString(unint64_t a1)
{
  if (a1 > 7)
    return CFSTR("Unknown");
  else
    return off_1E0FE53A0[a1];
}

uint64_t ___ZL30shouldOutputNodePropertyRetainv_block_invoke()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  shouldOutputNodePropertyRetain(void)::result = result;
  return result;
}

const __CFString *MTLCommandEncoderErrorStateToString(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("Unknown");
  else
    return (const __CFString *)*((_QWORD *)&off_1E0FE54C8 + a1);
}

void _doMTLSyncDispatch(uint64_t a1, _QWORD **a2, _QWORD *a3, _DWORD *a4)
{
  _QWORD *v4;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;

  v4 = *a2;
  if (*a2)
  {
    v8 = 0;
    do
    {
      v9 = (_QWORD *)*v4;
      if (((*(uint64_t (**)(void))(v4[1] + 16))() & 1) != 0 || (*a4 & 0xFFFFFFFE) == 2)
      {
        _Block_release((const void *)v4[1]);
        if (v8)
          v10 = v8;
        else
          v10 = a2;
        *v10 = v9;
        if (!v9)
          *a3 = v8;
        free(v4);
      }
      else
      {
        v8 = v4;
      }
      v4 = v9;
    }
    while (v9);
  }
}

uint64_t OUTLINED_FUNCTION_1_2@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 8) = a2;
  return objc_msgSend(*a1, "localizedDescription");
}

void validateMTLAttributeFormat(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1 >= 0x38)
    _MTLMessageContextPush_(a2, 4, (uint64_t)CFSTR("format is not a valid MTLVertexFormat / MTLAttributeFormat."), a4, a5, a6, a7, a8, a9);
}

uint64_t MTLAttributeFormatAlignment(MTLAttributeFormat a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;

  if (a1 < (MTLAttributeFormatCharNormalized|MTLAttributeFormatUChar3Normalized))
    return qword_18281C068[a1];
  MTLReportFailure(0, "MTLAttributeFormatAlignment", 156, (uint64_t)CFSTR("format is not a valid MTLVertexFormat / MTLAttributeFormat."), a5, a6, a7, a8, vars0);
  return 0;
}

uint64_t MTLAttributeFormatComponentCount(MTLAttributeFormat a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;

  if (a1 < (MTLAttributeFormatCharNormalized|MTLAttributeFormatUChar3Normalized))
    return qword_18281C228[a1];
  MTLReportFailure(0, "MTLAttributeFormatComponentCount", 173, (uint64_t)CFSTR("format is not a valid MTLVertexFormat / MTLAttributeFormat."), a5, a6, a7, a8, vars0);
  return 0;
}

uint64_t MTLAttributeFormatSize(MTLAttributeFormat a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;

  if (a1 < (MTLAttributeFormatCharNormalized|MTLAttributeFormatUChar3Normalized))
    return qword_18281C3E8[a1];
  MTLReportFailure(0, "MTLAttributeFormatSize", 202, (uint64_t)CFSTR("format is not a valid MTLVertexFormat / MTLAttributeFormat."), a5, a6, a7, a8, vars0);
  return 0;
}

const __CFString *MTLAttributeFormatString(MTLAttributeFormat a1)
{
  if (a1 > MTLAttributeFormatFloatRGB9E5)
    return CFSTR("Unknown");
  else
    return (const __CFString *)*((_QWORD *)&off_1E0FE54F0 + a1);
}

uint64_t isVertexFormatInteger(MTLAttributeFormat a1, int *a2, BOOL *a3)
{
  uint64_t v3;
  int v4;
  BOOL v5;
  uint64_t result;

  v3 = a1 - 1;
  v4 = 1;
  v5 = 1;
  result = 1;
  switch(v3)
  {
    case 0:
    case 1:
    case 2:
    case 44:
      v5 = 0;
      break;
    case 3:
    case 4:
    case 5:
    case 45:
      break;
    case 12:
    case 13:
    case 14:
    case 48:
      v5 = 0;
      goto LABEL_4;
    case 15:
    case 16:
    case 17:
    case 49:
LABEL_4:
      v4 = 2;
      break;
    case 31:
    case 32:
    case 33:
    case 34:
      goto LABEL_6;
    case 35:
    case 36:
    case 37:
    case 38:
      v5 = 0;
LABEL_6:
      v4 = 4;
      break;
    default:
      v4 = 0;
      v5 = 0;
      result = 0;
      break;
  }
  *a2 = v4;
  *a3 = v5;
  return result;
}

uint64_t MTLVertexDescriptorDescription(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  _QWORD *v15;
  unint64_t v16;
  const __CFString *v17;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[8];
  _QWORD v26[6];
  _QWORD v27[3];
  _QWORD v28[2];
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[2];
  _QWORD v32[30];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v24 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a2 + 4, CFSTR(" "), 0);
    v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a2 + 8, CFSTR(" "), 0);
    v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a2 + 12, CFSTR(" "), 0);
    v33 = 0;
    memset(v32, 0, sizeof(v32));
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 31);
    for (i = 0; i != 31; ++i)
    {
      v12 = *(_QWORD *)(*(_QWORD *)(v3 + 16) + 8 + 8 * i);
      if (v12 && *(_QWORD *)(v12 + 8))
      {
        v13 = *(_QWORD *)(v12 + 24);
        if (v13 >= 0x1F)
          MTLReleaseAssertionFailure((uint64_t)"MTLVertexDescriptorDescription", 1085, (uint64_t)"bufferIndex < MTL_MAX_VERTEX_BUFFERS", 0, v6, v7, v8, v9, v23);
        v14 = (void *)v32[v13];
        if (!v14)
        {
          v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 128);
          v32[v13] = v14;
          v31[0] = v24;
          v31[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Buffer %lu:"), v13);
          objc_msgSend(v14, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2));
          v15 = *(_QWORD **)(*(_QWORD *)(v3 + 8) + 8 + 8 * v13);
          if (v15)
          {
            v30[0] = v4;
            v30[1] = CFSTR("stepFunction =");
            v16 = v15[2];
            v17 = CFSTR("Unknown");
            if (v16 <= 4)
              v17 = (const __CFString *)*((_QWORD *)&off_1E0FE56B0 + v16);
            v30[2] = v17;
            objc_msgSend(v14, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3));
            if (v15[2] == 2)
            {
              v29[0] = v4;
              v29[1] = CFSTR("stepRate =");
              v29[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15[3]);
              objc_msgSend(v14, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3));
            }
            if (objc_msgSend(v15, "isStrideDynamic"))
            {
              v28[0] = v4;
              v28[1] = CFSTR("stride = dynamic");
              v18 = (void *)MEMORY[0x1E0C99D20];
              v19 = v28;
              v20 = 2;
            }
            else
            {
              v27[0] = v4;
              v27[1] = CFSTR("stride =");
              v27[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15[1]);
              v18 = (void *)MEMORY[0x1E0C99D20];
              v19 = v27;
              v20 = 3;
            }
          }
          else
          {
            v26[0] = v4;
            v26[1] = CFSTR("stepFunction =");
            v26[2] = CFSTR("MTLVertexStepFunctionPerVertex");
            v26[3] = v4;
            v26[4] = CFSTR("stride =");
            v26[5] = &unk_1E103B498;
            v18 = (void *)MEMORY[0x1E0C99D20];
            v19 = v26;
            v20 = 6;
          }
          objc_msgSend(v14, "addObjectsFromArray:", objc_msgSend(v18, "arrayWithObjects:count:", v19, v20));
        }
        v25[0] = v4;
        v25[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attribute %u:"), i);
        v25[2] = v5;
        v25[3] = CFSTR("offset =");
        v25[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(v12 + 16));
        v25[5] = v5;
        v25[6] = CFSTR("format =");
        v25[7] = MTLAttributeFormatString(*(MTLAttributeFormat *)(v12 + 8));
        objc_msgSend(v14, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 8));
      }
    }
    for (j = 0; j != 31; ++j)
    {
      v22 = (void *)v32[j];
      if (v22)
        objc_msgSend(v10, "addObject:", objc_msgSend(v22, "componentsJoinedByString:", CFSTR(" ")));
    }
    return objc_msgSend(v10, "componentsJoinedByString:", CFSTR(" "));
  }
  return result;
}

uint64_t MTLVertexDescriptorEquivalent(MTLVertexDescriptorInternal *a1, MTLVertexDescriptorInternal *a2)
{
  return a1 == a2
      || _isDefaultVertexDescriptor(a1) && _isDefaultVertexDescriptor(a2)
      || -[MTLVertexDescriptorInternal isEqual:](a1, "isEqual:", a2);
}

BOOL _isDefaultVertexDescriptor(MTLVertexDescriptorInternal *a1)
{
  uint64_t i;
  MTLVertexBufferLayoutDescriptorInternal *v2;
  unint64_t v3;
  BOOL v4;
  MTLVertexAttributeDescriptorInternal *v5;

  if (a1)
  {
    for (i = 0; i != 31; ++i)
    {
      v2 = a1->_vertexBufferArray->_descriptors[i];
      if (v2 && (v2->_stride || v2->_stepFunction != 1 || v2->_instanceStepRate != 1))
        return 0;
    }
    v3 = 0;
    v4 = 0;
    do
    {
      v5 = a1->_attributeArray->_descriptors[v3];
      if (v5 && (v5->_vertexFormat || v5->_bufferIndex || v5->_offset))
        break;
      v4 = v3++ > 0x1D;
    }
    while (v3 != 31);
  }
  else
  {
    return 1;
  }
  return v4;
}

void _submitAvailableCommandBuffers(void *a1)
{
  objc_msgSend(a1, "_submitAvailableCommandBuffers");

}

char *mdb_strerror(int a1)
{
  if (!a1)
    return "Successful return: 0";
  if ((a1 + 30799) > 0x14)
    return strerror(a1);
  return mdb_errstr[a1 + 30799];
}

uint64_t mdb_cmp(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 80) + 48 * a2 + 16))(a3, a4);
}

uint64_t mdb_dcmp(uint64_t a1, unsigned int a2, _QWORD *a3, uint64_t a4)
{
  uint64_t (*v4)(uint64_t, uint64_t);

  v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 80) + 48 * a2 + 24);
  if (v4 == mdb_cmp_int)
  {
    if (*a3 == 8)
      return mdb_cmp_cint(a3, a4);
    v4 = mdb_cmp_int;
  }
  return v4((uint64_t)a3, a4);
}

uint64_t mdb_cmp_int(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  BOOL v4;
  _BOOL4 v5;

  v2 = **(_DWORD **)(a1 + 8);
  v3 = **(_DWORD **)(a2 + 8);
  v4 = v2 >= v3;
  v5 = v2 > v3;
  if (v4)
    return v5;
  else
    return 0xFFFFFFFFLL;
}

uint64_t mdb_cmp_cint(_QWORD *a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unsigned __int16 *v4;
  unsigned __int16 *v5;
  unsigned __int16 *v6;
  int v7;
  int v8;
  int v9;
  uint64_t result;
  BOOL v11;

  v2 = a1[1];
  v3 = *a1 - 2;
  v4 = (unsigned __int16 *)(v2 + v3);
  v5 = (unsigned __int16 *)(*(_QWORD *)(a2 + 8) + v3);
  v6 = v4;
  do
  {
    v8 = *v6--;
    v7 = v8;
    v9 = *v5--;
    result = (v7 - v9);
    v11 = v7 == v9 && (unint64_t)v4 > v2;
    v4 = v6;
  }
  while (v11);
  return result;
}

uint64_t mdb_env_sync0(uint64_t a1, int a2, uint64_t a3)
{
  int v3;
  uint64_t result;
  int v5;

  v3 = *(_DWORD *)(a1 + 12);
  if ((v3 & 0x20000) != 0)
    return 13;
  if (!a2 && (v3 & 0x10000) != 0)
    return 0;
  if ((v3 & 0x80000) == 0)
  {
    result = fsync(*(_DWORD *)a1);
    if (!(_DWORD)result)
      return result;
    return *__error();
  }
  if (((a2 == 0) & ((v3 & 0x100000u) >> 20)) != 0)
    v5 = 1;
  else
    v5 = 16;
  result = msync(*(void **)(a1 + 56), *(unsigned int *)(a1 + 16) * a3, v5);
  if ((_DWORD)result)
    return *__error();
  return result;
}

uint64_t mdb_env_sync(uint64_t a1, int a2)
{
  return mdb_env_sync0(a1, a2, *(_QWORD *)(*(_QWORD *)(a1+ 72+ 8* ((*(_DWORD *)(a1 + 12) >> 25) & 1 ^ (*(_QWORD *)(*(_QWORD *)(a1 + 72)+ 128) < *(_QWORD *)(*(_QWORD *)(a1 + 80) + 128))))+ 120)+ 1);
}

uint64_t mdb_txn_renew(uint64_t a1)
{
  if (!a1 || (~*(_DWORD *)(a1 + 124) & 0x20001) != 0)
    return 22;
  else
    return mdb_txn_renew0(a1);
}

uint64_t mdb_txn_renew0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  int v11;
  int v12;
  pthread_t v13;
  uint64_t v14;
  pthread_mutex_t *v15;
  int v16;
  unsigned int v17;
  int *v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  unint64_t v29;
  uint64_t v30;
  int v31;
  char v32;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 64);
  v4 = *(_DWORD *)(a1 + 124);
  if ((v4 & 0x20000) == 0)
  {
    if (v3)
    {
      v5 = pthread_mutex_lock((pthread_mutex_t *)(v3 + 128));
      if ((_DWORD)v5)
        return v5;
      v6 = *(_QWORD *)(v3 + 8);
      v7 = *(_QWORD *)(v2 + 8 * (v6 & 1) + 72);
    }
    else
    {
      v7 = *(_QWORD *)(v2
                     + 72
                     + 8
                     * ((*(_DWORD *)(v2 + 12) >> 25) & 1 ^ (*(_QWORD *)(*(_QWORD *)(v2 + 72) + 128) < *(_QWORD *)(*(_QWORD *)(v2 + 80) + 128))));
      v6 = *(_QWORD *)(v7 + 128);
    }
    *(_QWORD *)(a1 + 24) = v6 + 1;
    *(_QWORD *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 56) = 0;
    *(_DWORD *)(a1 + 128) = 0x1FFFF;
    v9 = *(_QWORD **)(v2 + 208);
    *(_QWORD *)(a1 + 72) = v9;
    *v9 = 0;
    v10 = *(_QWORD **)(v2 + 200);
    *(_QWORD *)(a1 + 40) = v10;
    *(_QWORD *)(a1 + 48) = 0;
    *v10 = 0;
    *(_QWORD *)(a1 + 64) = 0;
    *(_QWORD *)(v2 + 96) = a1;
    memcpy(*(void **)(a1 + 96), *(const void **)(v2 + 152), 4 * *(unsigned int *)(v2 + 36));
    v11 = 0;
    goto LABEL_35;
  }
  if (!v3)
  {
    v11 = 0;
    v7 = *(_QWORD *)(v2
                   + 72
                   + 8
                   * ((*(_DWORD *)(v2 + 12) >> 25) & 1 ^ (*(_QWORD *)(*(_QWORD *)(v2 + 72) + 128) < *(_QWORD *)(*(_QWORD *)(v2 + 80) + 128))));
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(v7 + 128);
    *(_QWORD *)(a1 + 72) = 0;
LABEL_35:
    v24 = *(_OWORD **)(a1 + 88);
    v25 = *(_OWORD *)(v7 + 40);
    *v24 = *(_OWORD *)(v7 + 24);
    v24[1] = v25;
    v26 = *(_OWORD *)(v7 + 56);
    v27 = *(_OWORD *)(v7 + 72);
    v28 = *(_OWORD *)(v7 + 104);
    v24[4] = *(_OWORD *)(v7 + 88);
    v24[5] = v28;
    v24[2] = v26;
    v24[3] = v27;
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(v7 + 120) + 1;
    LODWORD(v24) = *(_DWORD *)(v2 + 32);
    *(_DWORD *)(a1 + 120) = (_DWORD)v24;
    *(_DWORD *)(a1 + 124) = v4 & 0x20000;
    if (v24 >= 3)
    {
      v29 = 2;
      v30 = 100;
      do
      {
        v31 = *(__int16 *)(*(_QWORD *)(v2 + 144) + 2 * v29);
        *(_WORD *)(*(_QWORD *)(a1 + 88) + v30) = *(_WORD *)(*(_QWORD *)(v2 + 144) + 2 * v29) & 0x7FFF;
        if (v31 < 0)
          v32 = 26;
        else
          v32 = 0;
        *(_BYTE *)(*(_QWORD *)(a1 + 112) + v29++) = v32;
        v30 += 48;
      }
      while (v29 < *(unsigned int *)(a1 + 120));
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 112) + 1) = 24;
    **(_BYTE **)(a1 + 112) = 8;
    if ((*(_DWORD *)(v2 + 12) & 0x80000000) != 0)
    {
      v5 = 4294936501;
    }
    else
    {
      if (*(_QWORD *)(v2 + 128) >= *(_QWORD *)(a1 + 16))
        return 0;
      v5 = 4294936511;
    }
    mdb_txn_end((unsigned int *)a1, v11 | 5);
    return v5;
  }
  if ((*(_BYTE *)(v2 + 14) & 0x20) != 0)
  {
    v8 = *(_DWORD **)(a1 + 72);
    if (v8)
      goto LABEL_8;
  }
  else
  {
    v8 = pthread_getspecific(*(_QWORD *)(v2 + 160));
    if (v8)
    {
LABEL_8:
      if (v8[2] != *(_DWORD *)(v2 + 40) || *(_QWORD *)v8 != -1)
        return 4294936513;
      goto LABEL_32;
    }
  }
  v12 = *(_DWORD *)(v2 + 40);
  v13 = pthread_self();
  v14 = *(_QWORD *)(v2 + 64);
  if (!*(_DWORD *)(v2 + 224))
  {
    v5 = mdb_reader_pid(v2, 8, v12);
    if ((_DWORD)v5)
      return v5;
    *(_DWORD *)(v2 + 224) = 1;
  }
  v15 = (pthread_mutex_t *)(v14 + 24);
  v5 = pthread_mutex_lock((pthread_mutex_t *)(v14 + 24));
  if (!(_DWORD)v5)
  {
    v16 = *(_DWORD *)(v3 + 16);
    if (v16)
    {
      v17 = 0;
      v18 = (int *)(v3 + 200);
      while (1)
      {
        v19 = *v18;
        v18 += 16;
        if (!v19)
          break;
        if (v16 == ++v17)
        {
          v17 = *(_DWORD *)(v3 + 16);
          break;
        }
      }
    }
    else
    {
      v17 = 0;
    }
    if (v17 == *(_DWORD *)(v2 + 24))
    {
      pthread_mutex_unlock((pthread_mutex_t *)(v14 + 24));
      return 4294936506;
    }
    v20 = v3 + ((unint64_t)v17 << 6);
    *(_DWORD *)(v20 + 200) = 0;
    *(_QWORD *)(v20 + 192) = -1;
    v8 = (_DWORD *)(v20 + 192);
    *((_QWORD *)v8 + 2) = v13;
    if (v17 == v16)
      *(_DWORD *)(v3 + 16) = ++v16;
    *(_DWORD *)(v2 + 28) = v16;
    v8[2] = v12;
    pthread_mutex_unlock(v15);
    v21 = *(_DWORD *)(v2 + 12);
    if ((v21 & 0x200000) != 0)
    {
      v11 = v21 & 0x200000;
      goto LABEL_33;
    }
    v22 = pthread_setspecific(*(_QWORD *)(v2 + 160), v8);
    if ((_DWORD)v22)
    {
      v5 = v22;
      v8[2] = 0;
      return v5;
    }
LABEL_32:
    v11 = 0;
    do
LABEL_33:
      *(_QWORD *)v8 = *(_QWORD *)(v3 + 8);
    while (*(_QWORD *)v8 != *(_QWORD *)(v3 + 8));
    v23 = *(_QWORD *)v8;
    *(_QWORD *)(a1 + 24) = *(_QWORD *)v8;
    *(_QWORD *)(a1 + 72) = v8;
    v7 = *(_QWORD *)(v2 + 8 * (v23 & 1) + 72);
    goto LABEL_35;
  }
  return v5;
}

uint64_t mdb_txn_begin(uint64_t a1, uint64_t a2, int a3, uint64_t *a4)
{
  int v4;
  uint64_t v5;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  size_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  int *v23;
  int v24;
  _QWORD *v25;

  v4 = *(_DWORD *)(a1 + 12);
  if ((v4 & ~a3 & 0x20000) != 0)
    return 13;
  v10 = v4 & 0x80000 | a3 & 0x70000;
  if (a2)
  {
    v11 = *(_DWORD *)(a2 + 124);
    v10 |= v11;
    if ((v10 & 0xA0013) != 0)
    {
      if ((v11 & 0x20000) != 0)
        return 22;
      else
        return 4294936514;
    }
    v13 = 152;
    v14 = 57;
    v15 = 19;
  }
  else
  {
    if ((a3 & 0x20000) == 0)
    {
      v12 = *(_QWORD *)(a1 + 104);
      goto LABEL_28;
    }
    v15 = 17;
    v14 = 49;
    v13 = 136;
  }
  v16 = v13 + *(_DWORD *)(a1 + 36) * v14;
  v17 = malloc_type_calloc(1uLL, v16, 0xC111C8FuLL);
  if (!v17)
    return 12;
  v12 = (uint64_t)v17;
  v17[10] = *(_QWORD *)(a1 + 136);
  v17[11] = &v17[v15];
  v18 = *(unsigned int *)(a1 + 36);
  v17[14] = (char *)v17 + v16 - v18;
  *((_DWORD *)v17 + 31) = v10;
  v17[4] = a1;
  if (a2)
  {
    v17[12] = *(_QWORD *)(a2 + 96);
    v17[13] = &v17[6 * v18 + v15];
    v19 = malloc_type_malloc(0x200000uLL, 0x108004057E67DB5uLL);
    *(_QWORD *)(v12 + 72) = v19;
    if (v19)
    {
      v20 = mdb_midl_alloc(0x1FFFF);
      *(_QWORD *)(v12 + 40) = v20;
      v19 = *(_QWORD **)(v12 + 72);
      if (v20)
      {
        *(_DWORD *)(v12 + 128) = *(_DWORD *)(a2 + 128);
        *v19 = 0;
        *(_QWORD *)(v12 + 64) = 0;
        *(_OWORD *)(v12 + 16) = *(_OWORD *)(a2 + 16);
        v21 = *(unsigned int *)(a2 + 120);
        *(_DWORD *)(a2 + 124) |= 0x10u;
        *(_QWORD *)(a2 + 8) = v12;
        *(_QWORD *)v12 = a2;
        *(_DWORD *)(v12 + 120) = v21;
        memcpy(*(void **)(v12 + 88), *(const void **)(a2 + 88), 48 * v21);
        if (*(_DWORD *)(v12 + 120))
        {
          v22 = 0;
          do
          {
            *(_BYTE *)(*(_QWORD *)(v12 + 112) + v22) = *(_BYTE *)(*(_QWORD *)(a2 + 112) + v22) & 0xFB;
            ++v22;
          }
          while (v22 < *(unsigned int *)(v12 + 120));
        }
        *(_OWORD *)(v12 + 136) = *(_OWORD *)(a1 + 176);
        v23 = *(int **)(a1 + 176);
        if (v23)
        {
          v24 = *v23;
          v25 = mdb_midl_alloc(*v23);
          *(_QWORD *)(a1 + 176) = v25;
          if (!v25)
          {
            v5 = 12;
LABEL_31:
            mdb_txn_end((unsigned int *)v12, 6);
            goto LABEL_32;
          }
          memcpy(v25, *(const void **)(v12 + 136), 8 * v24 + 8);
        }
        v5 = mdb_cursor_shadow(a2, (_QWORD *)v12);
        if (!(_DWORD)v5)
          goto LABEL_29;
        goto LABEL_31;
      }
    }
    free(v19);
    free((void *)v12);
    return 12;
  }
  v17[12] = *(_QWORD *)(a1 + 152);
LABEL_28:
  v5 = mdb_txn_renew0(v12);
  if (!(_DWORD)v5)
  {
LABEL_29:
    v5 = 0;
    *(_DWORD *)(v12 + 124) |= v10;
    *a4 = v12;
    return v5;
  }
LABEL_32:
  if (v12 != *(_QWORD *)(a1 + 104))
    free((void *)v12);
  return v5;
}

uint64_t mdb_cursor_shadow(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  size_t v7;
  _QWORD **v8;
  _QWORD **v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(unsigned int *)(a1 + 120);
  if ((int)v2 < 1)
    return 0;
  while (1)
  {
    v5 = *(_QWORD **)(*(_QWORD *)(a1 + 104) + 8 * (v2 - 1));
    if (v5)
      break;
LABEL_10:
    if (v2-- <= 1)
      return 0;
  }
  v6 = (v2 - 1);
  if (v5[2])
    v7 = 888;
  else
    v7 = 392;
  while (1)
  {
    v8 = (_QWORD **)malloc_type_malloc(v7, 0xC8AE77B4uLL);
    if (!v8)
      return 12;
    v9 = v8;
    memcpy(v8, v5, 0x188uLL);
    v5[1] = v9;
    v5[5] = a2[11] + 48 * (v2 - 1);
    v5[3] = a2;
    v5[7] = a2[14] + v6;
    v10 = v5[2];
    if (v10)
    {
      memcpy(v9 + 49, (const void *)v5[2], 0x1F0uLL);
      *(_QWORD *)(v10 + 24) = a2;
    }
    v11 = a2[13];
    *v5 = *(_QWORD *)(v11 + 8 * v6);
    *(_QWORD *)(v11 + 8 * v6) = v5;
    v5 = *v9;
    if (!*v9)
      goto LABEL_10;
  }
}

void mdb_txn_end(unsigned int *a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  _OWORD *v15;
  unsigned int *v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  int v23;
  pthread_mutex_t *v24;

  v4 = *((_QWORD *)a1 + 4);
  v5 = a1[30];
  if ((int)v5 >= 3)
  {
    v6 = *((_QWORD *)a1 + 14);
    v7 = v5 + 1;
    do
    {
      v8 = (v7 - 2);
      if ((*(_BYTE *)(v6 + v8) & 4) != 0)
      {
        if ((a2 & 0x10) != 0)
        {
          *(_WORD *)(*(_QWORD *)(v4 + 144) + 2 * v8) = *(_WORD *)(*((_QWORD *)a1 + 11) + 48 * v8 + 4) | 0x8000;
        }
        else
        {
          v9 = *(_QWORD *)(v4 + 136);
          v10 = *(void **)(v9 + 48 * v8 + 8);
          if (v10)
          {
            v11 = (_QWORD *)(v9 + 48 * v8);
            *v11 = 0;
            v11[1] = 0;
            v12 = *(_QWORD *)(v4 + 152);
            *(_WORD *)(*(_QWORD *)(v4 + 144) + 2 * v8) = 0;
            ++*(_DWORD *)(v12 + 4 * v8);
            free(v10);
          }
        }
      }
      --v7;
    }
    while (v7 > 3);
  }
  if ((a2 & 0x10) != 0 && *(_DWORD *)(v4 + 32) < v5)
    *(_DWORD *)(v4 + 32) = v5;
  v13 = a1[31];
  if ((v13 & 0x20000) != 0)
  {
    v22 = (_QWORD *)*((_QWORD *)a1 + 9);
    if (v22)
    {
      *v22 = -1;
      if ((*(_BYTE *)(v4 + 14) & 0x20) == 0)
      {
LABEL_31:
        *((_QWORD *)a1 + 9) = 0;
        goto LABEL_32;
      }
      if ((a2 & 0x200000) != 0)
      {
        *(_DWORD *)(*((_QWORD *)a1 + 9) + 8) = 0;
        goto LABEL_31;
      }
    }
LABEL_32:
    v23 = a1[31] | 1;
    a1[30] = 0;
    a1[31] = v23;
    goto LABEL_33;
  }
  if ((v13 & 1) == 0)
  {
    v15 = (_OWORD *)(v4 + 176);
    v14 = *(_QWORD *)(v4 + 176);
    if ((a2 & 0x10) == 0)
      mdb_cursors_close((uint64_t)a1, 0);
    if ((*(_BYTE *)(v4 + 14) & 8) == 0)
    {
      v16 = (unsigned int *)*((_QWORD *)a1 + 9);
      v17 = *v16;
      if (*v16)
      {
        v18 = *((_QWORD *)a1 + 4);
        v19 = 1;
        do
        {
          v20 = *(_QWORD **)&v16[4 * v19 + 2];
          if ((*((_WORD *)v20 + 5) & 4) != 0 && *((_DWORD *)v20 + 3) != 1)
          {
            free(v20);
          }
          else
          {
            *v20 = *(_QWORD *)(v18 + 192);
            *(_QWORD *)(v18 + 192) = v20;
          }
          ++v19;
        }
        while (v19 <= v17);
      }
      *(_QWORD *)v16 = 0;
    }
    *((_QWORD *)a1 + 15) = 0x100000000;
    v21 = *(_QWORD *)a1;
    if (*(_QWORD *)a1)
    {
      *(_QWORD *)(v21 + 8) = 0;
      *(_DWORD *)(v21 + 124) &= ~0x10u;
      *v15 = *(_OWORD *)(a1 + 34);
      mdb_midl_free(*((_QWORD *)a1 + 5));
      free(*((void **)a1 + 9));
    }
    else
    {
      mdb_midl_shrink((uint64_t *)a1 + 5);
      *(_QWORD *)(v4 + 200) = *((_QWORD *)a1 + 5);
      *(_QWORD *)(v4 + 96) = 0;
      *(_QWORD *)v15 = 0;
      *(_QWORD *)(v4 + 184) = 0;
      v24 = *(pthread_mutex_t **)(v4 + 64);
      if (v24)
        pthread_mutex_unlock(v24 + 2);
      LOBYTE(a2) = 0;
    }
    mdb_midl_free(*((_QWORD *)a1 + 8));
    mdb_midl_free(v14);
    if ((a2 & 0x20) != 0)
      goto LABEL_39;
    return;
  }
LABEL_33:
  if ((a2 & 0x20) != 0)
LABEL_39:
    free(a1);
}

uint64_t mdb_txn_env(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

uint64_t mdb_txn_id(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

void mdb_txn_reset(uint64_t a1)
{
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 126) & 2) != 0)
      mdb_txn_end((unsigned int *)a1, 3);
  }
}

void mdb_txn_abort(uint64_t a1)
{
  if (a1)
  {
    if (*(_QWORD *)(a1 + 8))
      mdb_txn_abort();
    mdb_txn_end((unsigned int *)a1, 2097186);
  }
}

uint64_t mdb_txn_commit(uint64_t a1)
{
  uint64_t appended;
  int v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  unsigned int *v7;
  int **v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  unint64_t v17;
  int v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  unsigned int i;
  uint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unsigned int v34;
  unint64_t v35;
  uint64_t v36;
  unsigned int v37;
  uint64_t v39;
  unsigned int v40;
  int v41;
  int v42;
  int v44;
  unint64_t v45;
  int v46;
  unint64_t v47;
  int v48;
  uint64_t v49;
  unsigned int v50;
  unsigned int *v51;
  unint64_t v52;
  unsigned int *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  _QWORD *v57;
  _QWORD *v58;
  uint64_t v59;
  __int128 v60;
  _OWORD v61[24];
  uint64_t v62;

  if (!a1)
    return 22;
  if (*(_QWORD *)(a1 + 8))
  {
    appended = mdb_txn_commit();
    if ((_DWORD)appended)
      goto LABEL_9;
  }
  v3 = 2097201;
  v4 = *(_DWORD *)(a1 + 124);
  if ((v4 & 0x20000) != 0)
    goto LABEL_53;
  v5 = *(_QWORD *)a1;
  if ((v4 & 3) != 0)
  {
    if (v5)
      *(_DWORD *)(v5 + 124) |= 2u;
    appended = 4294936514;
LABEL_9:
    mdb_txn_abort(a1);
    return appended;
  }
  if (!v5)
  {
    v20 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v20 + 96) != a1)
    {
      appended = 22;
      goto LABEL_9;
    }
    mdb_cursors_close(a1, 0);
    if (**(_QWORD **)(a1 + 72) || (*(_BYTE *)(a1 + 124) & 0xC) != 0)
    {
      if (*(_DWORD *)(a1 + 120) >= 3u)
      {
        v62 = 0;
        memset(v61, 0, sizeof(v61));
        v60 = xmmword_18281C5C0;
        mdb_cursor_init((uint64_t)v61, a1, 1u, 0);
        v21 = *(unsigned int *)(a1 + 120);
        if (v21 >= 3)
        {
          v22 = 2;
          v23 = 96;
          do
          {
            if ((*(_BYTE *)(*(_QWORD *)(a1 + 112) + v22) & 1) != 0)
            {
              if (*(_DWORD *)(*(_QWORD *)(a1 + 96) + 4 * v22) != *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 152)
                                                                            + 4 * v22))
              {
                appended = 4294936516;
                goto LABEL_9;
              }
              v24 = *(_QWORD *)(a1 + 80);
              *((_QWORD *)&v60 + 1) = *(_QWORD *)(a1 + 88) + v23;
              v25 = mdb_cursor_put((uint64_t)v61, (size_t *)(v24 + v23), (uint64_t)&v60, 2);
              if ((_DWORD)v25)
              {
                appended = v25;
                goto LABEL_9;
              }
              v21 = *(unsigned int *)(a1 + 120);
            }
            ++v22;
            v23 += 48;
          }
          while (v22 < v21);
        }
      }
      appended = mdb_freelist_save(a1);
      if ((_DWORD)appended)
        goto LABEL_9;
      mdb_midl_free(*(_QWORD *)(v20 + 176));
      *(_QWORD *)(v20 + 176) = 0;
      mdb_midl_shrink((uint64_t *)(a1 + 40));
      appended = mdb_page_flush(a1, 0);
      if ((_DWORD)appended)
        goto LABEL_9;
      if ((*(_BYTE *)(a1 + 126) & 1) == 0)
      {
        appended = mdb_env_sync0(v20, 0, *(_QWORD *)(a1 + 16));
        if ((_DWORD)appended)
          goto LABEL_9;
      }
      appended = mdb_env_write_meta(a1);
      if ((_DWORD)appended)
        goto LABEL_9;
      v26 = *(_DWORD *)(v20 + 12);
      if ((v26 & 0x2000000) != 0)
      {
        if ((v26 & 0x400000) == 0)
        {
          appended = mdb_env_share_locks(v20, (int *)v61);
          if ((_DWORD)appended)
            goto LABEL_9;
          v26 = *(_DWORD *)(v20 + 12);
        }
        *(_DWORD *)(v20 + 12) = v26 ^ 0x2000000;
      }
      v3 = 16;
    }
LABEL_53:
    mdb_txn_end((unsigned int *)a1, v3);
    return 0;
  }
  appended = mdb_midl_append_list((uint64_t **)(v5 + 40), *(uint64_t **)(a1 + 40));
  if ((_DWORD)appended)
    goto LABEL_9;
  mdb_midl_free(*(_QWORD *)(a1 + 40));
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(a1 + 16);
  *(_DWORD *)(v5 + 124) = *(_DWORD *)(a1 + 124);
  mdb_cursors_close(a1, 1);
  memcpy(*(void **)(v5 + 88), *(const void **)(a1 + 88), 48 * *(unsigned int *)(a1 + 120));
  *(_DWORD *)(v5 + 120) = *(_DWORD *)(a1 + 120);
  **(_BYTE **)(v5 + 112) = **(_BYTE **)(a1 + 112);
  *(_BYTE *)(*(_QWORD *)(v5 + 112) + 1) = *(_BYTE *)(*(_QWORD *)(a1 + 112) + 1);
  if (*(_DWORD *)(a1 + 120) >= 3u)
  {
    v6 = 2;
    do
    {
      *(_BYTE *)(*(_QWORD *)(v5 + 112) + v6) = *(_BYTE *)(*(_QWORD *)(a1 + 112) + v6) | *(_BYTE *)(*(_QWORD *)(v5 + 112)
                                                                                                 + v6) & 4;
      ++v6;
    }
    while (v6 < *(unsigned int *)(a1 + 120));
  }
  v7 = *(unsigned int **)(v5 + 64);
  v9 = *(unsigned int **)(v5 + 72);
  v8 = (int **)(v5 + 64);
  v10 = *(unsigned int **)(a1 + 72);
  if (v7)
  {
    v11 = *v7;
    if (*v7)
    {
      *(_QWORD *)v7 = -1;
      v12 = *v10;
      if (*v10)
      {
        if (v12 + 1 > 2)
          v13 = v12 + 1;
        else
          v13 = 2;
        v14 = 1;
        v15 = v11;
        v16 = v11;
        do
        {
          v17 = 2 * *(_QWORD *)&v10[4 * v14];
          do
          {
            v18 = v16;
            v19 = *(_QWORD *)&v7[2 * v16--];
          }
          while (v17 > v19);
          if (v17 == v19)
          {
            *(_QWORD *)&v7[2 * v18] = 1;
            v15 = v16;
          }
          else
          {
            ++v16;
          }
          ++v14;
        }
        while (v14 != v13);
      }
      else
      {
        v15 = v11;
      }
      for (i = v15 + 1; i <= v11; ++i)
      {
        v29 = *(_QWORD *)&v7[2 * i];
        if ((v29 & 1) == 0)
          *(_QWORD *)&v7[2 * ++v15] = v29;
      }
      *(_QWORD *)v7 = v15;
    }
  }
  v30 = *(unint64_t **)(a1 + 64);
  if (v30 && *v30)
  {
    v31 = 1;
    do
    {
      v32 = v30[v31];
      if ((v32 & 1) == 0)
      {
        v33 = v32 >> 1;
        v34 = mdb_mid2l_search(v9, v32 >> 1);
        if (*(_QWORD *)v9 >= (unint64_t)v34)
        {
          v35 = v34;
          if (*(_QWORD *)&v9[4 * v34] == v33)
          {
            free(*(void **)&v9[4 * v34 + 2]);
            v36 = *(_QWORD *)v9;
            if (*(_QWORD *)v9 > v35)
            {
              v37 = v35 + 1;
              do
              {
                *(_OWORD *)&v9[4 * v35] = *(_OWORD *)&v9[4 * v37];
                v35 = v37;
                v36 = *(_QWORD *)v9;
              }
              while (*(_QWORD *)v9 > (unint64_t)v37++);
            }
            *(_QWORD *)v9 = v36 - 1;
          }
        }
      }
      v31 = (v31 + 1);
      v30 = *(unint64_t **)(a1 + 64);
    }
    while (*v30 >= v31);
  }
  v39 = *(_QWORD *)v9;
  *(_QWORD *)v9 = 0;
  if (*(_QWORD *)v5)
  {
    v40 = *v10 + v39;
    v41 = mdb_mid2l_search(v10, *(_QWORD *)&v9[4 * v39] + 1);
    v42 = v41 - 1;
    if (v41 != 1 && (_DWORD)v39 != 0)
    {
      v44 = v39;
      do
      {
        v45 = *(_QWORD *)&v10[4 * v42];
        v46 = v44 + 1;
        do
          v47 = *(_QWORD *)&v9[4 * --v46];
        while (v45 < v47);
        v48 = v45 == v47;
        v40 -= v48;
        if (!--v42)
          break;
        v44 = v46 - v48;
      }
      while (v44);
    }
  }
  else
  {
    v40 = 0x1FFFF - *(_DWORD *)(a1 + 128);
  }
  v49 = *v10;
  if (*v10)
  {
    v50 = v40;
    do
    {
      v51 = &v10[4 * v49];
      v52 = *(_QWORD *)v51;
      v53 = &v9[4 * v39];
      v54 = *(_QWORD *)v53;
      if (*(_QWORD *)v51 >= *(_QWORD *)v53)
      {
        v55 = v39;
      }
      else
      {
        do
        {
          *(_OWORD *)&v9[4 * v50--] = *(_OWORD *)v53;
          v39 = (v39 - 1);
          v53 = &v9[4 * v39];
          v54 = *(_QWORD *)v53;
        }
        while (v52 < *(_QWORD *)v53);
        v55 = v39;
      }
      if (v52 == v54)
      {
        LODWORD(v39) = v39 - 1;
        free(*(void **)&v9[4 * v55 + 2]);
      }
      *(_OWORD *)&v9[4 * v50--] = *(_OWORD *)v51;
      --v49;
    }
    while ((_DWORD)v49);
  }
  *(_QWORD *)v9 = v40;
  free(*(void **)(a1 + 72));
  *(_DWORD *)(v5 + 128) = *(_DWORD *)(a1 + 128);
  v56 = *(uint64_t **)(a1 + 64);
  if (v56)
  {
    if (*v8)
    {
      appended = mdb_midl_append_list((uint64_t **)(v5 + 64), v56);
      if ((_DWORD)appended)
        *(_DWORD *)(v5 + 124) |= 2u;
      mdb_midl_free(*(_QWORD *)(a1 + 64));
      mdb_midl_sort(*v8);
    }
    else
    {
      appended = 0;
      *v8 = (int *)v56;
    }
  }
  else
  {
    appended = 0;
  }
  v57 = (_QWORD *)(v5 + 48);
  do
  {
    v58 = v57;
    v59 = *v57;
    v57 = (_QWORD *)(*v57 + 48);
  }
  while (v59);
  *v58 = *(_QWORD *)(a1 + 48);
  *(_DWORD *)(v5 + 56) += *(_DWORD *)(a1 + 56);
  *(_QWORD *)(v5 + 8) = 0;
  mdb_midl_free(*(_QWORD *)(a1 + 136));
  free((void *)a1);
  return appended;
}

void mdb_cursors_close(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;

  v2 = *(unsigned int *)(a1 + 120);
  if ((int)v2 >= 1)
  {
    v4 = *(_QWORD *)(a1 + 104);
    do
    {
      v5 = *(_QWORD **)(v4 + 8 * (v2 - 1));
      while (v5)
      {
        v6 = v5;
        v5 = (_QWORD *)*v5;
        v7 = (_QWORD *)v6[1];
        if (v7)
        {
          if (a2)
          {
            *(_OWORD *)v6 = *(_OWORD *)v7;
            v6[3] = v7[3];
            v6[5] = v7[5];
            v6[7] = v7[7];
            v8 = v6[2];
            if (v8)
              *(_QWORD *)(v8 + 24) = v7[3];
          }
          else
          {
            memcpy(v6, (const void *)v6[1], 0x188uLL);
            v9 = (void *)v6[2];
            if (v9)
              memcpy(v9, v7 + 49, 0x1F0uLL);
          }
        }
        else
        {
          v7 = v6;
        }
        free(v7);
      }
      *(_QWORD *)(v4 + 8 * (v2 - 1)) = 0;
    }
    while (v2-- > 1);
  }
}

uint64_t mdb_cursor_init(uint64_t result, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)result = 0;
  *(_QWORD *)(result + 8) = 0;
  *(_DWORD *)(result + 32) = a3;
  *(_QWORD *)(result + 24) = a2;
  v4 = *(_QWORD *)(a2 + 80) + 48 * a3;
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 88) + 48 * a3;
  *(_QWORD *)(result + 48) = v4;
  v5 = (_BYTE *)(*(_QWORD *)(a2 + 112) + a3);
  *(_QWORD *)(result + 56) = v5;
  *(_DWORD *)(result + 64) = 0;
  *(_QWORD *)(result + 72) = 0;
  *(_WORD *)(result + 328) = 0;
  v6 = *(_DWORD *)(a2 + 124) & 0xA0000;
  *(_DWORD *)(result + 68) = v6;
  if ((*(_BYTE *)(*(_QWORD *)(a2 + 88) + 48 * a3 + 4) & 4) != 0)
  {
    *(_QWORD *)(result + 16) = a4;
    *(_QWORD *)(a4 + 16) = 0;
    *(_QWORD *)(a4 + 24) = a2;
    *(_QWORD *)(a4 + 40) = a4 + 392;
    *(_QWORD *)(a4 + 48) = a4 + 440;
    *(_DWORD *)(a4 + 32) = a3;
    *(_QWORD *)(a4 + 56) = a4 + 488;
    *(_DWORD *)(a4 + 64) = 0;
    *(_DWORD *)(a4 + 68) = v6 | 4;
    *(_QWORD *)(a4 + 440) = 0;
    *(_QWORD *)(a4 + 448) = 0;
    v7 = *(_QWORD *)(result + 48);
    v5 = *(_BYTE **)(result + 56);
    v9 = *(_QWORD *)(v7 + 24);
    v8 = *(_QWORD *)(v7 + 32);
    *(_QWORD *)(a4 + 456) = v9;
    *(_QWORD *)(a4 + 464) = 0;
    *(_QWORD *)(a4 + 472) = v8;
  }
  else
  {
    *(_QWORD *)(result + 16) = 0;
  }
  if ((*v5 & 2) != 0)
    return mdb_page_search();
  return result;
}

uint64_t mdb_cursor_put(uint64_t a1, size_t *a2, uint64_t a3, int a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  char *v25;
  __int16 v26;
  uint64_t v27;
  size_t *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int *v31;
  uint64_t v32;
  size_t v33;
  void *v34;
  const void *v35;
  uint64_t v36;
  int v37;
  __int16 v38;
  unsigned int *v39;
  char *v40;
  __int16 v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  size_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  int v49;
  size_t v50;
  char *v51;
  const void *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  int v57;
  char *v58;
  uint64_t v59;
  size_t v60;
  size_t v61;
  unsigned int v62;
  uint64_t v63;
  __int16 v64;
  int v65;
  unsigned __int16 v66;
  unint64_t v67;
  uint64_t v68;
  _WORD *v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  int v73;
  int v74;
  _QWORD *v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  _QWORD *v79;
  char *v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unsigned int v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  int v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  char *v102;
  size_t v103;
  int v104;
  char *v105;
  unsigned int v106;
  int v107;
  unsigned int v108;
  char *v109;
  int v110;
  uint64_t v111;
  int v112;
  int v113;
  unsigned int v114;
  char *v115[2];
  __int128 v116;
  int v117;
  _OWORD v118[2];
  __int128 v119;
  size_t v120;
  char *v121;
  size_t v122;
  char *v123;
  uint64_t v124;
  const char *v125;
  char *v126;

  v126 = 0;
  result = 22;
  if (!a1 || !a2)
    return result;
  v124 = 0;
  v125 = 0;
  v122 = 0;
  v123 = 0;
  v120 = 0;
  v121 = 0;
  v119 = 0u;
  memset(v118, 0, sizeof(v118));
  v9 = *(_QWORD *)(a1 + 24);
  v10 = *(_QWORD *)(v9 + 32);
  if ((a4 & 0x80000) != 0)
  {
    v11 = *(_DWORD *)(a3 + 16);
    *(_QWORD *)(a3 + 16) = 0;
    if ((*(_WORD *)(*(_QWORD *)(a1 + 40) + 4) & 0x10) == 0)
      return 4294936512;
  }
  else
  {
    v11 = 0;
  }
  v12 = *(_DWORD *)(v9 + 124);
  if ((v12 & 0x20013) != 0)
  {
    if ((v12 & 0x20000) != 0)
      return 13;
    else
      return 4294936514;
  }
  if (*a2 - 512 < 0xFFFFFFFFFFFFFE01)
    return 4294936515;
  v13 = *(_QWORD *)(a1 + 40);
  v14 = 511;
  if ((*(_WORD *)(v13 + 4) & 4) == 0)
    v14 = 0xFFFFFFFFLL;
  if (*(_QWORD *)a3 > v14)
    return 4294936515;
  v122 = 0;
  if ((a4 & 0x40) != 0)
  {
    v17 = *(_DWORD *)(a1 + 68);
    if ((v17 & 1) == 0)
      return result;
    LODWORD(v16) = 0;
  }
  else if (*(_QWORD *)(v13 + 40) == -1)
  {
    v17 = *(_DWORD *)(a1 + 68) & 0xFFFFFFFE;
    *(_DWORD *)(a1 + 64) = 0;
    *(_DWORD *)(a1 + 68) = v17;
    LODWORD(v16) = -30769;
  }
  else
  {
    v117 = 0;
    v116 = 0uLL;
    if ((a4 & 0x20000) != 0)
    {
      v115[0] = 0;
      v115[1] = 0;
      v16 = mdb_cursor_last(a1, v115, &v116);
      if (!(_DWORD)v16)
      {
        if ((*(int (**)(size_t *, char **))(*(_QWORD *)(a1 + 48) + 16))(a2, v115) < 1)
        {
          v16 = 4294936497;
        }
        else
        {
          v18 = a1 + 2 * *(unsigned __int16 *)(a1 + 66);
          ++*(_WORD *)(v18 + 328);
          v16 = 4294936498;
        }
      }
    }
    else
    {
      v15 = mdb_cursor_set(a1, a2, &v116, 15, &v117);
      v16 = v15;
      if ((a4 & 0x10) != 0 && !(_DWORD)v15)
      {
        *(_OWORD *)a3 = v116;
        return 4294936497;
      }
    }
    if ((_DWORD)v16 != -30798 && (_DWORD)v16)
      return v16;
    v17 = *(_DWORD *)(a1 + 68);
  }
  if ((v17 & 8) != 0)
    *(_DWORD *)(a1 + 68) = v17 ^ 8;
  if ((a4 & 0x8000) == 0)
  {
    v19 = (uint64_t *)a3;
    if ((a4 & 0x80000) != 0)
    {
      v124 = *(_QWORD *)a3 * v11;
      v19 = &v124;
    }
    result = mdb_page_spill(a1, a2, v19);
    if ((_DWORD)result)
      return result;
  }
  v20 = a4 & 0xFFFF7FFF;
  if ((_DWORD)v16 == -30769)
  {
    *(_QWORD *)&v116 = 0;
    result = mdb_page_new(a1, 2, 1, (char **)&v116);
    if ((_DWORD)result)
      return result;
    v21 = v116;
    v22 = *(unsigned __int16 *)(a1 + 64);
    if (v22 < 0x20)
    {
      *(_WORD *)(a1 + 64) = v22 + 1;
      *(_WORD *)(a1 + 66) = v22;
      *(_QWORD *)(a1 + 8 * v22 + 72) = v21;
      *(_WORD *)(a1 + 2 * v22 + 328) = 0;
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 24) + 124) |= 2u;
    }
    v24 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(v24 + 40) = *(_QWORD *)v21;
    ++*(_WORD *)(v24 + 6);
    **(_BYTE **)(a1 + 56) |= 1u;
    v23 = *(_WORD *)(*(_QWORD *)(a1 + 40) + 4);
    if ((v23 & 0x14) == 0x10)
      *(_WORD *)(v21 + 10) |= 0x20u;
    *(_DWORD *)(a1 + 68) |= 1u;
LABEL_51:
    if ((v23 & 4) == 0 || *a2 + *(_QWORD *)a3 + 8 <= *(unsigned int *)(v10 + 220))
    {
      v109 = 0;
      v110 = 0;
      v27 = 0;
      v28 = (size_t *)a3;
      goto LABEL_128;
    }
    v112 = v16;
    v110 = 0;
    v25 = *(char **)(v10 + 88);
    *((_WORD *)v25 + 4) = *(_QWORD *)a3;
    *((_DWORD *)v25 + 3) = 1048592;
    v120 = 16;
    v26 = 18;
    goto LABEL_111;
  }
  result = mdb_cursor_touch(a1);
  if ((_DWORD)result)
    return result;
  if ((_DWORD)v16)
  {
    v23 = *(_WORD *)(*(_QWORD *)(a1 + 40) + 4);
    goto LABEL_51;
  }
  v29 = *(unsigned __int16 *)(a1 + 66);
  v30 = *(_QWORD *)(a1 + 8 * v29 + 72);
  v31 = *(unsigned int **)(a1 + 40);
  if ((*(_WORD *)(v30 + 10) & 0x20) != 0)
  {
    v32 = *v31;
    v33 = *a2;
    if (*a2 == v32)
    {
      v34 = (void *)(v30 + v32 * *(unsigned __int16 *)(a1 + 2 * v29 + 328) + 16);
      v35 = (const void *)a2[1];
LABEL_59:
      memcpy(v34, v35, v33);
      v36 = *(unsigned __int16 *)(a1 + 66);
      if (*(_WORD *)(a1 + 66) && !*(_WORD *)(a1 + 2 * v36 + 328))
      {
        v37 = v36 - 1;
        *(_WORD *)(a1 + 66) = v36 - 1;
        if ((_WORD)v36 == 1)
        {
          LOWORD(v37) = 0;
          LOWORD(v36) = 1;
        }
        else
        {
          v38 = 1;
          while (!*(_WORD *)(a1 + 2 * (unsigned __int16)v37 + 328))
          {
            *(_WORD *)(a1 + 66) = --v37;
            ++v38;
            if (!(_WORD)v37)
            {
              LOWORD(v37) = 0;
              goto LABEL_68;
            }
          }
          LOWORD(v36) = v38;
        }
LABEL_68:
        if (*(_WORD *)(a1 + 2 * (unsigned __int16)v37 + 328))
        {
          result = mdb_update_key(a1, (uint64_t)a2);
          *(_WORD *)(a1 + 66) += v36;
          if ((_DWORD)result)
            return result;
        }
        else
        {
          *(_WORD *)(a1 + 66) = v37 + v36;
        }
      }
      return 0;
    }
    return 4294936515;
  }
  v114 = a4 & 0xFFFF7FFF;
  v109 = 0;
  v110 = 0;
  v27 = 0;
  while (1)
  {
    v39 = (unsigned int *)(v30 + *(unsigned __int16 *)(v30 + 2 * *(unsigned __int16 *)(a1 + 2 * v29 + 328) + 16));
    v120 = *v39;
    v121 = (char *)v39 + *((unsigned __int16 *)v39 + 3) + 8;
    if ((v31[1] & 4) != 0)
    {
      v40 = *(char **)(v10 + 88);
      v125 = v40;
      v126 = v40;
      *(_QWORD *)v40 = *(_QWORD *)v30;
      v41 = *((_WORD *)v39 + 2);
      if ((v41 & 4) != 0)
      {
        if ((v41 & 2) != 0)
        {
          v108 = v27;
          v113 = 0;
          v20 = v114 | 6;
          goto LABEL_161;
        }
        v25 = v121;
        if (v114 == 64)
          goto LABEL_201;
        if ((*(_WORD *)(*(_QWORD *)(a1 + 40) + 4) & 0x10) != 0)
        {
          v62 = *((unsigned __int16 *)v121 + 4);
          if (v62 <= (unsigned __int16)(*((_WORD *)v121 + 7) - *((_WORD *)v121 + 6)))
          {
LABEL_201:
            v108 = v27;
            v113 = 0;
            *((_WORD *)v121 + 5) |= 0x10u;
            *(_WORD *)v25 = *(_WORD *)v40;
            *((_WORD *)v25 + 1) = *((_WORD *)v40 + 1);
            *((_WORD *)v25 + 2) = *((_WORD *)v40 + 2);
            *((_WORD *)v25 + 3) = *((_WORD *)v40 + 3);
            *(_QWORD *)(*(_QWORD *)(a1 + 16) + 72) = v25;
            v20 = v114 | 4;
            goto LABEL_161;
          }
          v48 = 4 * v62;
        }
        else
        {
          v48 = (*(_DWORD *)a3 + 11) & 0xFFFFFFFE;
        }
        v60 = v120;
        v61 = v120 + v48;
        v124 = v61;
        v26 = *((_WORD *)v121 + 5);
        goto LABEL_109;
      }
      if (v114 != 64)
      {
        v42 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 24);
        if (v120 == 8 && v42 == mdb_cmp_int)
          v42 = (uint64_t (*)(uint64_t, uint64_t))mdb_cmp_cint;
        if (v42(a3, (uint64_t)&v120))
        {
          v44 = v120;
          v122 = v120;
          memcpy(v40 + 24, v121, v120);
          v123 = v40 + 24;
          *((_WORD *)v40 + 5) = 82;
          *((_WORD *)v40 + 6) = 16;
          v45 = *(_QWORD *)a3;
          v46 = v44 + *(_QWORD *)a3 + 16;
          if ((*(_BYTE *)(*(_QWORD *)(a1 + 40) + 4) & 0x10) != 0)
          {
            v26 = 114;
            *((_WORD *)v40 + 5) = 114;
            *((_WORD *)v40 + 4) = v45;
            v47 = 2 * v45;
          }
          else
          {
            v47 = ((*(_QWORD *)a3 & 1) + (v44 & 1)) | 0x14;
            v26 = 82;
          }
          LOWORD(v48) = 0;
          v60 = v47 + v46;
          v124 = v60;
          *((_WORD *)v40 + 7) = v60;
          v120 = v60;
          v61 = v60;
          v25 = v40;
LABEL_109:
          v112 = 0;
          if (*((unsigned __int16 *)v39 + 3) + v61 + 8 <= *(unsigned int *)(v10 + 220))
          {
            v65 = v114;
          }
          else
          {
            v112 = 0;
            v26 &= ~0x40u;
            v20 = v114;
LABEL_111:
            v63 = *(_QWORD *)(a1 + 40);
            if ((*(_WORD *)(v63 + 4) & 0x10) != 0)
            {
              v26 |= 0x20u;
              LODWORD(v118[0]) = *((unsigned __int16 *)v25 + 4);
              WORD2(v118[0]) = 16;
              if ((*(_WORD *)(v63 + 4) & 0x20) != 0)
                v64 = 24;
              else
                v64 = 16;
              WORD2(v118[0]) = v64;
            }
            else
            {
              LODWORD(v118[0]) = 0;
              WORD2(v118[0]) = 0;
            }
            WORD3(v118[0]) = 1;
            *(_OWORD *)((char *)v118 + 8) = xmmword_182809F60;
            *((_QWORD *)&v118[1] + 1) = 0;
            *(_QWORD *)&v119 = (*((unsigned __int16 *)v25 + 6) - 16) >> 1;
            v124 = 48;
            v125 = (const char *)v118;
            result = mdb_page_alloc(a1, 1, &v126);
            if ((_DWORD)result)
              return result;
            v60 = v120;
            v48 = *(_DWORD *)(v10 + 16) - v120;
            v65 = v20 | 6;
            v40 = v126;
            *((_QWORD *)&v119 + 1) = *(_QWORD *)v126;
            v109 = v126;
          }
          if (v40 != v25)
          {
            *((_WORD *)v40 + 5) = v26 | 0x10;
            *((_WORD *)v40 + 4) = *((_WORD *)v25 + 4);
            *((_WORD *)v40 + 6) = *((_WORD *)v25 + 6);
            v66 = *((_WORD *)v25 + 7) + v48;
            *((_WORD *)v40 + 7) = v66;
            if ((v26 & 0x20) != 0)
            {
              memcpy(v40 + 16, v25 + 16, ((*((unsigned __int16 *)v25 + 6) - 16) >> 1) * *((unsigned __int16 *)v25 + 4));
            }
            else
            {
              memcpy(&v40[v66], &v25[*((unsigned __int16 *)v25 + 7)], v60 - *((unsigned __int16 *)v25 + 7));
              memcpy(v40 + 16, v25 + 16, (*((unsigned __int16 *)v25 + 6) - 16) & 0xFFFFFFFE);
              if ((*((_WORD *)v25 + 6) & 0xFFFE) != 0x10)
              {
                v67 = 0;
                do
                  *(_WORD *)&v40[2 * v67++ + 16] += v48;
                while (v67 < (*((unsigned __int16 *)v25 + 6) - 16) >> 1);
              }
            }
          }
          v20 = v65 | 4;
          v27 = 1;
          v28 = (size_t *)&v124;
          LODWORD(v16) = v112;
          if (!v112)
          {
            mdb_node_del((_QWORD *)a1, 0);
            v28 = (size_t *)&v124;
          }
          goto LABEL_128;
        }
        if ((v114 & 0x40020) != 0)
          return 4294936497;
      }
    }
    v49 = *((unsigned __int16 *)v39 + 2);
    if (((v114 ^ v49) & 2) != 0)
      return 4294936512;
    if ((v49 & 1) == 0)
    {
      v50 = *(_QWORD *)a3;
      if (*(_QWORD *)a3 == v120)
      {
        if ((v114 & 0x10000) != 0)
        {
          result = 0;
          v105 = v121;
LABEL_216:
          *(_QWORD *)(a3 + 8) = v105;
          return result;
        }
        if ((*(_BYTE *)(a1 + 68) & 4) != 0)
        {
          v33 = *a2;
          v35 = (const void *)a2[1];
          v34 = v39 + 2;
          goto LABEL_59;
        }
        v51 = v121;
        v52 = *(const void **)(a3 + 8);
        goto LABEL_219;
      }
      goto LABEL_103;
    }
    v53 = v27;
    v115[0] = 0;
    v117 = 0;
    v54 = *(_QWORD *)a3;
    v55 = *(unsigned int *)(v10 + 16);
    v56 = *(_QWORD *)v121;
    result = mdb_page_get(a1, *(_QWORD *)v121, (unint64_t *)v115, &v117);
    if ((_DWORD)result)
      return result;
    v57 = (v54 + 15) / v55 + 1;
    v58 = v115[0];
    v59 = *((int *)v115[0] + 3);
    if ((int)v59 >= v57)
    {
      if ((*((_WORD *)v115[0] + 5) & 0x10) != 0)
        break;
      if (v117 || (*(_BYTE *)(v10 + 14) & 8) != 0)
      {
        result = mdb_page_unspill(*(_QWORD *)(a1 + 24), (uint64_t)v115[0], v115);
        if ((_DWORD)result)
          return result;
        v117 = 0;
        v58 = v115[0];
        if ((*((_WORD *)v115[0] + 5) & 0x10) != 0)
          break;
      }
    }
    result = mdb_ovpage_free(a1, (uint64_t)v58);
    v27 = v53;
    if ((_DWORD)result)
      return result;
LABEL_103:
    mdb_node_del((_QWORD *)a1, 0);
    LODWORD(v16) = 0;
    v28 = (size_t *)a3;
    v20 = v114;
LABEL_128:
    v68 = *(unsigned __int16 *)(a1 + 66);
    v69 = *(_WORD **)(a1 + 8 * v68 + 72);
    v70 = *a2;
    if ((v69[5] & 0x20) == 0)
    {
      v71 = v70 + *v28 + 8;
      v72 = 8 - *v28;
      if (v71 <= *(unsigned int *)(v10 + 220))
        v72 = 0;
      v70 = (v71 + v72 + 3) & 0xFFFFFFFFFFFFFFFELL;
    }
    if (v70 <= (unsigned __int16)(v69[7] - v69[6]))
    {
      result = mdb_node_add(a1, *(unsigned __int16 *)(a1 + 2 * v68 + 328), (const void **)a2, v28, 0, v20 & 0x30006);
      if ((_DWORD)result)
        goto LABEL_206;
      v75 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
      if (v75)
      {
        v76 = *(unsigned __int16 *)(a1 + 66);
        v77 = *(_QWORD *)(a1 + 8 * v76 + 72);
        v78 = *(_DWORD *)(a1 + 68);
        do
        {
          v79 = v75;
          if ((v78 & 4) != 0)
            v79 = (_QWORD *)v75[2];
          if (v79 != (_QWORD *)a1
            && *((unsigned __int16 *)v79 + 32) >= *(unsigned __int16 *)(a1 + 64)
            && v79[v76 + 9] == v77)
          {
            v80 = (char *)v79 + 2 * v76;
            v81 = *((unsigned __int16 *)v80 + 164);
            if ((_DWORD)v16 && v81 >= *(unsigned __int16 *)(a1 + 2 * v76 + 328))
            {
              LOWORD(v81) = v81 + 1;
              *((_WORD *)v80 + 164) = v81;
            }
            v82 = v79[2];
            if (v82)
            {
              if ((*(_BYTE *)(v82 + 68) & 1) != 0
                && (*(unsigned __int16 *)(v77 + 12) - 16) >> 1 > (unsigned __int16)v81)
              {
                v83 = v77 + *(unsigned __int16 *)(v77 + 2 * (unsigned __int16)v81 + 16);
                if ((*(_WORD *)(v83 + 4) & 6) == 4)
                  *(_QWORD *)(v82 + 72) = v83 + *(unsigned __int16 *)(v83 + 6) + 8;
              }
            }
          }
          v75 = (_QWORD *)*v75;
        }
        while (v75);
      }
    }
    else
    {
      if ((v20 & 6) == 4)
        v73 = v20 & 0x10006;
      else
        v73 = v20 & 0x30006;
      if ((_DWORD)v16)
        v74 = v73;
      else
        v74 = v73 | 0x40000;
      result = mdb_page_split(a1, (uint64_t)a2, v28, 0xFFFFFFFFFFFFFFFFLL, v74);
      if ((_DWORD)result)
        goto LABEL_206;
    }
    if (!(_DWORD)v27)
    {
      result = 0;
      v98 = v16;
      goto LABEL_192;
    }
    v113 = v16;
    v108 = 1;
LABEL_161:
    v124 = 0;
    v125 = "";
    v111 = *(_QWORD *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72)
         + *(unsigned __int16 *)(*(_QWORD *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72)
                               + 2 * *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328)
                               + 16);
    v84 = 32832;
    if ((v20 & 0x40040) != 0x40)
    {
      mdb_xcursor_init1(a1, v111);
      if ((v20 & 0x20) != 0)
        v84 = 32784;
      else
        v84 = 0x8000;
    }
    if (v109)
      *(_QWORD *)(*(_QWORD *)(a1 + 16) + 72) = v109;
    v107 = v122;
    if (v122)
    {
      LODWORD(result) = mdb_cursor_put(*(_QWORD *)(a1 + 16), &v122, &v124, v84);
      if ((_DWORD)result)
        goto LABEL_203;
      v122 = 0;
    }
    if (v109 || (*(_WORD *)(v111 + 4) & 2) == 0)
    {
      v85 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
      if (v85)
      {
        v86 = *(_QWORD *)(a1 + 16);
        v87 = *(unsigned __int16 *)(a1 + 66);
        v88 = *(_QWORD *)(a1 + 8 * v87 + 72);
        do
        {
          if (v85 != a1
            && *(unsigned __int16 *)(v85 + 64) >= *(unsigned __int16 *)(a1 + 64)
            && (*(_BYTE *)(v85 + 68) & 1) != 0
            && *(_QWORD *)(v85 + 8 * v87 + 72) == v88)
          {
            v89 = *(unsigned __int16 *)(v85 + 2 * v87 + 328);
            if (v89 == *(unsigned __int16 *)(a1 + 2 * v87 + 328))
            {
              v106 = v11;
              v90 = v84;
              v91 = v88;
              mdb_xcursor_init2(v85, v86, v107);
              v88 = v91;
              v84 = v90;
              v11 = v106;
            }
            else if (!v113)
            {
              v92 = *(_QWORD *)(v85 + 16);
              if (v92)
              {
                if ((*(_BYTE *)(v92 + 68) & 1) != 0 && v89 < (*(unsigned __int16 *)(v88 + 12) - 16) >> 1)
                {
                  v93 = v88 + *(unsigned __int16 *)(v88 + 2 * *(unsigned __int16 *)(v85 + 2 * v87 + 328) + 16);
                  if ((*(_WORD *)(v93 + 4) & 6) == 4)
                    *(_QWORD *)(v92 + 72) = v93 + *(unsigned __int16 *)(v93 + 6) + 8;
                }
              }
            }
          }
          v85 = *(_QWORD *)v85;
        }
        while (v85);
      }
    }
    v94 = *(_QWORD *)(a1 + 16);
    v16 = *(_QWORD *)(v94 + 424);
    result = mdb_cursor_put(v94, a3, &v124, v84 | (v20 >> 1) & 0x20000);
    if ((v20 & 2) != 0)
    {
      v95 = v111 + *(unsigned __int16 *)(v111 + 6);
      v97 = *(_OWORD *)(*(_QWORD *)(a1 + 16) + 408);
      v96 = *(_OWORD *)(*(_QWORD *)(a1 + 16) + 424);
      *(_OWORD *)(v95 + 8) = *(_OWORD *)(*(_QWORD *)(a1 + 16) + 392);
      *(_OWORD *)(v95 + 24) = v97;
      *(_OWORD *)(v95 + 40) = v96;
    }
    v98 = *(_DWORD *)(*(_QWORD *)(a1 + 16) + 424) - v16;
    LODWORD(v16) = v113;
    v27 = v108;
LABEL_192:
    if (v98)
      ++*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
    if ((_DWORD)v16)
    {
      if ((_DWORD)result)
      {
LABEL_203:
        if ((_DWORD)result == -30799)
          result = 4294936517;
        else
          result = result;
LABEL_206:
        *(_DWORD *)(*(_QWORD *)(a1 + 24) + 124) |= 2u;
        return result;
      }
      *(_DWORD *)(a1 + 68) |= 1u;
    }
    if ((v20 & 0x80000) == 0 || (_DWORD)result)
      return result;
    v99 = (v110 + 1);
    *(_QWORD *)(a3 + 16) = v99;
    if (v99 >= v11)
      return 0;
    ++v110;
    v114 = v20;
    *(_QWORD *)(a3 + 8) += *(_QWORD *)a3;
    v29 = *(unsigned __int16 *)(a1 + 66);
    v30 = *(_QWORD *)(a1 + 8 * v29 + 72);
    v31 = *(unsigned int **)(a1 + 40);
  }
  if (v117 <= 1)
  {
    v104 = v114 & 0x10000;
    v102 = v58;
    goto LABEL_214;
  }
  v100 = *(unsigned int *)(v10 + 16);
  v101 = mdb_page_malloc(*(_QWORD *)(a1 + 24), v59);
  if (v101)
  {
    v102 = v101;
    v103 = v100 * v59;
    *(_QWORD *)&v116 = v56;
    *((_QWORD *)&v116 + 1) = v101;
    mdb_mid2l_insert(*(unsigned int **)(*(_QWORD *)(a1 + 24) + 72), (unint64_t *)&v116);
    v104 = v114 & 0x10000;
    if ((v114 & 0x10000) == 0)
    {
      memcpy(&v102[(*(_QWORD *)a3 & 0xFFFFFFFFFFFFFFF8) + 16], &v58[(*(_QWORD *)a3 & 0xFFFFFFFFFFFFFFF8) + 16], v103 - ((*(_QWORD *)a3 & 0xFFFFFFFFFFFFFFF8) + 16));
      v103 = 16;
    }
    memcpy(v102, v58, v103);
LABEL_214:
    v50 = *(_QWORD *)a3;
    *v39 = *(_QWORD *)a3;
    v105 = v102 + 16;
    if (v104)
    {
      result = 0;
      goto LABEL_216;
    }
    v52 = *(const void **)(a3 + 8);
    v51 = v102 + 16;
LABEL_219:
    memcpy(v51, v52, v50);
    return 0;
  }
  return 12;
}

uint64_t mdb_freelist_save(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t **v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned int v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  int *v39;
  unsigned int v40;
  unsigned int v41;
  int64_t *v42;
  int64_t v43;
  int64_t v44;
  int v45;
  unint64_t v46;
  size_t v47;
  int64_t *v48;
  size_t v49;
  unint64_t *v50;
  unint64_t v51;
  _OWORD v52[24];
  uint64_t v53;

  v53 = 0;
  memset(v52, 0, sizeof(v52));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(int *)(v2 + 216);
  v51 = 0;
  mdb_cursor_init((uint64_t)v52, a1, 0, 0);
  v4 = (uint64_t **)(v2 + 176);
  if (!*(_QWORD *)(v2 + 176))
    goto LABEL_95;
  result = mdb_page_search((uint64_t)v52, 0, 5);
  if ((_DWORD)result && (_DWORD)result != -30798)
    return result;
  if (!*v4)
  {
LABEL_95:
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 72);
      result = mdb_midl_need((_DWORD **)(a1 + 40), *(_DWORD *)(a1 + 56));
      if ((_DWORD)result)
        return result;
      do
      {
        v8 = *(uint64_t **)(a1 + 40);
        v9 = *v8 + 1;
        *v8 = v9;
        v8[v9] = *(_QWORD *)v6;
        if ((*(_BYTE *)(a1 + 126) & 8) != 0)
        {
          if (*(_QWORD *)v7)
          {
            v10 = 1;
            do
            {
              if (*(_QWORD *)(v7 + 16 * v10) == *(_QWORD *)v6)
                break;
              v10 = (v10 + 1);
            }
            while (*(_QWORD *)v7 >= v10);
          }
          else
          {
            LODWORD(v10) = 1;
          }
        }
        else
        {
          LODWORD(v10) = mdb_mid2l_search((unsigned int *)v7, *(_QWORD *)v6);
          if ((*(_WORD *)(v6 + 10) & 4) != 0 && *(_DWORD *)(v6 + 12) != 1)
          {
            free((void *)v6);
          }
          else
          {
            *(_QWORD *)v6 = *(_QWORD *)(v2 + 192);
            *(_QWORD *)(v2 + 192) = v6;
          }
        }
        *(_QWORD *)(v7 + 16 * v10 + 8) = 0;
        v6 = *(_QWORD *)(v6 + 48);
      }
      while (v6);
      v11 = *(_QWORD *)v7;
      if (*(_QWORD *)(v7 + 24))
      {
        v12 = 1;
        while (v11 >= v12)
        {
          v12 = (v12 + 1);
          v13 = v12;
          if (!*(_QWORD *)(v7 + 16 * v12 + 8))
            goto LABEL_27;
        }
        v13 = v12;
      }
      else
      {
        v13 = 1;
        v12 = 1;
      }
LABEL_27:
      if (v11 >= v12)
      {
        LODWORD(v15) = v13;
        while (1)
        {
          do
          {
            v15 = (v15 + 1);
            if (*(_QWORD *)(v7 + 16 * v15 + 8))
              v16 = 0;
            else
              v16 = v11 >= v15;
          }
          while (v16);
          if (v11 < v15)
            break;
          *(_OWORD *)(v7 + 16 * v13++) = *(_OWORD *)(v7 + 16 * v15);
          v11 = *(_QWORD *)v7;
        }
        v14 = v13 - 1;
      }
      else
      {
        v14 = 0;
      }
      *(_QWORD *)v7 = v14;
      *(_QWORD *)(a1 + 48) = 0;
      *(_DWORD *)(a1 + 56) = 0;
    }
  }
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = *(_DWORD *)(v2 + 12) & 0x1080000;
  v45 = 1;
  while (1)
  {
LABEL_39:
    v49 = 0;
    v50 = 0;
    v47 = 0;
    v48 = 0;
    if (v17 < *(_QWORD *)(v2 + 184))
    {
      while (1)
      {
        result = mdb_cursor_first((uint64_t)v52, &v49, 0);
        if ((_DWORD)result)
          return result;
        v17 = *v50;
        v51 = *v50;
        result = mdb_cursor_del((uint64_t)v52, 0);
        if ((_DWORD)result)
          return result;
        if (v17 >= *(_QWORD *)(v2 + 184))
        {
          v19 = 0;
          v20 = 0;
          break;
        }
      }
    }
    if (v18 < **(_QWORD **)(a1 + 40))
    {
      if (v18 || (result = mdb_page_search((uint64_t)v52, 0, 9), !(_DWORD)result) || (_DWORD)result == -30798)
      {
        v22 = *(unint64_t **)(a1 + 40);
        v49 = 8;
        v50 = (unint64_t *)(a1 + 24);
        v23 = *v22;
        while (1)
        {
          v18 = v23;
          v47 = 8 * v23 + 8;
          result = mdb_cursor_put((uint64_t)v52, &v49, (uint64_t)&v47, 0x10000);
          if ((_DWORD)result)
            break;
          v24 = *(unint64_t **)(a1 + 40);
          v23 = *v24;
          if (v18 >= *v24)
          {
            mdb_midl_sort(*(int **)(a1 + 40));
            memcpy(v48, v24, v47);
            goto LABEL_39;
          }
        }
      }
      return result;
    }
    v25 = *v4;
    v26 = v21;
    v27 = *v4 ? *v25 : 0;
    v28 = *(int *)(a1 + 56);
    v29 = v27 + v28;
    if (v20 >= v27 + v28)
      break;
    v30 = v51;
    if (v19 >= v3 && v51 >= 2)
    {
      v19 = 0;
      v30 = --v51;
    }
LABEL_64:
    v32 = v20 - v19;
    v33 = v29 - (v20 - v19);
    if (v33 > v3 && v30 >= 2)
      v19 = v3 + (uint64_t)(v33 / v30) / ((int)v3 + 1) * ((int)v3 + 1);
    else
      v19 = v33 & ~(v33 >> 63);
    v21 = v26;
    v49 = 8;
    v50 = &v51;
    v47 = 8 * v19 + 8;
    result = mdb_cursor_put((uint64_t)v52, &v49, (uint64_t)&v47, 0x10000);
    if ((_DWORD)result)
      return result;
    if (v19 > v3 && (_DWORD)v21 == 0)
      v36 = v19;
    else
      v36 = 0;
    bzero(&v48[v36 & (v36 >> 63)], 8 * (v36 - (v36 & (v36 >> 63))) + 8);
    v20 = v19 + v32;
  }
  if (v20 != v27 + v28 && v45 >= 1)
  {
    --v45;
    v30 = v51;
    goto LABEL_64;
  }
  v37 = *(_QWORD **)(a1 + 48);
  if (v37)
  {
    v38 = *(unsigned int *)(a1 + 56);
    result = mdb_midl_need((_DWORD **)(v2 + 176), (2 * v28) | 1);
    if ((_DWORD)result)
      return result;
    v25 = *v4;
    v39 = (int *)&(*v4)[*(*v4 - 1) - v38];
    v40 = 1;
    do
    {
      v41 = v40;
      *(_QWORD *)&v39[2 * v40] = *v37;
      v37 = (_QWORD *)v37[6];
      ++v40;
    }
    while (v37);
    *(_QWORD *)v39 = v41;
    mdb_midl_sort(v39);
    mdb_midl_xmerge(v25, (uint64_t *)v39);
    *(_QWORD *)(a1 + 48) = 0;
    *(_DWORD *)(a1 + 56) = 0;
    v29 = *v25;
  }
  if (!v29)
    return 0;
  v49 = 0;
  v50 = 0;
  v47 = 0;
  v48 = 0;
  result = mdb_cursor_first((uint64_t)v52, &v49, &v47);
  if (!(_DWORD)result)
  {
    v42 = &v25[v29];
    do
    {
      v46 = 0;
      v46 = *v50;
      v43 = (v47 >> 3) - 1;
      v50 = &v46;
      if (v43 > v29)
      {
        v47 = 8 * v29 + 8;
        v43 = v29;
      }
      v42 -= v43;
      v48 = v42;
      v44 = *v42;
      *v42 = v43;
      result = mdb_cursor_put((uint64_t)v52, &v49, (uint64_t)&v47, 64);
      *v42 = v44;
      if ((_DWORD)result)
        break;
      v29 -= v43;
      if (!v29)
        break;
      result = mdb_cursor_next((uint64_t)v52, &v49, &v47, 8);
    }
    while (!(_DWORD)result);
  }
  return result;
}

uint64_t mdb_page_flush(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  off_t v7;
  uint64_t v8;
  size_t v9;
  off_t v10;
  int v11;
  unint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  unsigned int v18;
  _BOOL4 v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  ssize_t v24;
  uint64_t result;
  iovec *v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  _QWORD *v32;
  int v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t *v36;
  int v37;
  uint64_t v39;
  int v40;
  int v41;
  uint64_t v42;
  uint64_t *v43;
  int v44;
  uint64_t v45;
  iovec __buf[64];
  uint64_t v47;

  v2 = a1;
  v47 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(uint64_t **)(a1 + 72);
  v5 = *v4;
  if ((*(_BYTE *)(v3 + 14) & 8) == 0)
  {
    v39 = *(_QWORD *)(a1 + 32);
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = *(unsigned int *)(v3 + 16);
    v13 = *(_DWORD *)v3;
    v45 = (int)v5;
    v40 = v5 + 1;
    v14 = 1;
    v41 = 1 - v5;
    v42 = *v4;
    v37 = a2;
    v15 = a2;
    v43 = *(uint64_t **)(a1 + 72);
    while (1)
    {
      if (v15 >= (int)v5)
      {
        v19 = 0;
        v20 = v15++;
      }
      else
      {
        v16 = v15 + 1;
        v17 = &v4[2 * v16];
        v8 = v17[1];
        v18 = *(unsigned __int16 *)(v8 + 10);
        if (v18 >= 0x4000)
        {
          v16 = 0;
          while (1)
          {
            *(_WORD *)(v8 + 10) = v18 & 0x7FFF;
            *v17 = 0;
            if (!(v41 + v15 + (_DWORD)v16))
              break;
            v8 = v17[3];
            v18 = *(unsigned __int16 *)(v8 + 10);
            v17 += 2;
            ++v16;
            if (v18 < 0x4000)
            {
              v21 = v15 + v16;
              v19 = v21 < v45;
              v20 = v15 + v16;
              LODWORD(v16) = v21 + 1;
              goto LABEL_11;
            }
          }
          v19 = v15 + v16 + 1 < v45;
          v20 = v15 + v16 + 1;
          v15 = v40;
        }
        else
        {
          v19 = 1;
          v20 = v15;
LABEL_11:
          v15 = v16;
          v22 = *v17;
          *(_WORD *)(v8 + 10) = v18 & 0x3FEF;
          v7 = v22 * v12;
          if ((v18 & 4) != 0)
            v6 = *(unsigned int *)(v8 + 12) * (unint64_t)v12;
          else
            v6 = v12;
        }
      }
      if (v7 != v14 || v11 == 64 || v6 + v9 >= 0x40000001)
      {
        v44 = v20;
        if (v11)
        {
          v23 = v12;
          while (1)
          {
            if (v11 == 1)
            {
              v24 = pwrite(v13, __buf[0].iov_base, v9, v10);
            }
            else
            {
              while (lseek(v13, v10, 0) == -1)
              {
                result = *__error();
                if ((_DWORD)result != 4)
                  return result;
              }
              v24 = writev(v13, __buf, v11);
            }
            LODWORD(v5) = v42;
            v4 = v43;
            v12 = v23;
            if (v24 == v9)
              break;
            if ((v24 & 0x8000000000000000) == 0)
              return 5;
            result = *__error();
            if ((_DWORD)result != 4)
              return result;
          }
        }
        if (!v19)
        {
          if ((*(_BYTE *)(v39 + 14) & 8) != 0)
          {
            v27 = v37;
            a2 = v44;
          }
          else
          {
            a2 = v37;
            if ((int)v5 <= v37)
            {
              v27 = v37;
            }
            else
            {
              v27 = v37;
              v32 = v4 + 2;
              v33 = v37;
              do
              {
                v34 = v33;
                v35 = &v32[2 * v33];
                while (1)
                {
                  v36 = (uint64_t *)v35[1];
                  if (!*v35)
                    break;
                  if ((*((_WORD *)v36 + 5) & 4) != 0 && *((_DWORD *)v36 + 3) != 1)
                  {
                    free(v36);
                    LODWORD(v5) = v42;
                    v4 = v43;
                  }
                  else
                  {
                    *v36 = *(_QWORD *)(v39 + 192);
                    *(_QWORD *)(v39 + 192) = v36;
                  }
                  ++v34;
                  v35 += 2;
                  if (v34 >= v45)
                  {
                    a2 = v34;
                    goto LABEL_59;
                  }
                }
                v33 = v34 + 1;
                *(_OWORD *)&v4[2 * ++v27] = *(_OWORD *)v35;
                v4[2 * v27] = *v36;
              }
              while ((int)v34 + 1 < (int)v5);
              a2 = v34 + 1;
            }
          }
LABEL_59:
          v2 = a1;
          goto LABEL_41;
        }
        v9 = 0;
        v11 = 0;
        v10 = v7;
      }
      v26 = &__buf[v11];
      v26->iov_base = (void *)v8;
      v26->iov_len = v6;
      v14 = v7 + v6;
      v9 += v6;
      ++v11;
    }
  }
  if ((int)v5 <= a2)
  {
    v27 = a2;
  }
  else
  {
    v27 = a2;
    do
    {
      v28 = a2;
      v29 = (uint64_t)&v4[2 * a2 + 3];
      while (1)
      {
        v30 = *(_QWORD *)v29;
        v31 = *(unsigned __int16 *)(*(_QWORD *)v29 + 10);
        if (v31 >= 0x4000)
          break;
        ++v28;
        *(_WORD *)(v30 + 10) = v31 & 0xFFEF;
        v29 += 16;
        if (v28 >= (int)v5)
        {
          a2 = v28;
          goto LABEL_41;
        }
      }
      a2 = v28 + 1;
      *(_WORD *)(v30 + 10) = v31 & 0x7FFF;
      *(_OWORD *)&v4[2 * ++v27] = *(_OWORD *)(v29 - 8);
    }
    while ((int)v28 + 1 < (int)v5);
  }
LABEL_41:
  result = 0;
  *(_DWORD *)(v2 + 128) += a2 - v27;
  *v4 = v27;
  return result;
}

uint64_t mdb_env_write_meta(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  __int128 *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  off_t v13;
  int v14;
  int v15;
  uint64_t v16;
  __int128 *v17;
  __int128 v18;
  __int128 v19;
  _OWORD *v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v28;
  unint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_DWORD *)(v3 + 12) | *(_DWORD *)(a1 + 124);
  v5 = *(_QWORD *)(v3 + 72 + 8 * (v2 & 1));
  v6 = *(_QWORD *)(*(_QWORD *)(v3 + 72 + 8 * !(v2 & 1)) + 16);
  if (v6 <= *(_QWORD *)(v3 + 112))
    v6 = *(_QWORD *)(v3 + 112);
  if ((v4 & 0x80000) == 0)
  {
    v28 = *(_QWORD *)(v5 + 128);
    v7 = *(_QWORD *)(v5 + 120);
    v29 = v6;
    v8 = *(__int128 **)(a1 + 88);
    v9 = *v8;
    v10 = v8[2];
    v31 = v8[1];
    v32 = v10;
    v30 = v9;
    v12 = v8[4];
    v11 = v8[5];
    v33 = v8[3];
    v34 = v12;
    v35 = v11;
    v36 = *(_QWORD *)(a1 + 16) - 1;
    v37 = v2;
    v13 = v5 - *(_QWORD *)(v3 + 56) + 16;
    v14 = *(_DWORD *)(v3 + 8 * ((v4 & 0x50000) == 0));
    while (1)
    {
      v15 = pwrite(v14, &v29, 0x78uLL, v13);
      if (v15 == 120)
        goto LABEL_10;
      if ((v15 & 0x80000000) == 0)
      {
        v16 = 5;
LABEL_19:
        v36 = v7;
        v37 = v28;
        pwrite(*(_DWORD *)v3, &v29, 0x78uLL, v13);
        goto LABEL_20;
      }
      v16 = *__error();
      if ((_DWORD)v16 != 4)
        goto LABEL_19;
    }
  }
  *(_QWORD *)(v5 + 16) = v6;
  v17 = *(__int128 **)(a1 + 88);
  v18 = *v17;
  v19 = v17[1];
  *(_OWORD *)(v5 + 56) = v17[2];
  *(_OWORD *)(v5 + 40) = v19;
  *(_OWORD *)(v5 + 24) = v18;
  v20 = *(_OWORD **)(a1 + 88);
  v21 = v20[3];
  v22 = v20[4];
  *(_OWORD *)(v5 + 104) = v20[5];
  *(_OWORD *)(v5 + 88) = v22;
  *(_OWORD *)(v5 + 72) = v21;
  *(_QWORD *)(v5 + 120) = *(_QWORD *)(a1 + 16) - 1;
  *(_QWORD *)(v5 + 128) = *(_QWORD *)(a1 + 24);
  if ((v4 & 0x50000) != 0
    || ((*(_DWORD *)(v3 + 12) & 0x100000) != 0 ? (v24 = 1) : (v24 = 16),
        v25 = v5 - 16,
        v26 = (*(_DWORD *)(v3 + 20) - 1) & (v25 - *(_DWORD *)(v3 + 56)),
        !msync((void *)(v25 - v26), (v26 + *(_DWORD *)(v3 + 16)), v24)))
  {
LABEL_10:
    v23 = *(_QWORD *)(v3 + 64);
    v16 = 0;
    if (v23)
      *(_QWORD *)(v23 + 8) = *(_QWORD *)(a1 + 24);
    return v16;
  }
  v16 = *__error();
LABEL_20:
  *(_DWORD *)(v3 + 12) |= 0x80000000;
  return v16;
}

uint64_t mdb_cmp_long(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  _BOOL4 v5;

  v2 = **(_QWORD **)(a1 + 8);
  v3 = **(_QWORD **)(a2 + 8);
  v4 = v2 >= v3;
  v5 = v2 > v3;
  if (v4)
    return v5;
  else
    return 0xFFFFFFFFLL;
}

uint64_t mdb_get(uint64_t a1, unsigned int a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t result;
  int v9;
  _OWORD v10[31];
  _BYTE v11[384];
  uint64_t v12;

  v9 = 0;
  result = 22;
  if (a1)
  {
    if (a3)
    {
      if (a4)
      {
        if (*(_DWORD *)(a1 + 120) > a2)
        {
          v12 = 0;
          memset(v11, 0, sizeof(v11));
          memset(v10, 0, sizeof(v10));
          if ((*(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) & 0x10) != 0)
          {
            if ((*(_BYTE *)(a1 + 124) & 0x13) != 0)
            {
              return 4294936514;
            }
            else
            {
              mdb_cursor_init((uint64_t)v11, a1, a2, (uint64_t)v10);
              return mdb_cursor_set((uint64_t)v11, a3, a4, 15, &v9);
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t mdb_cursor_set(uint64_t a1, _QWORD *a2, _QWORD *a3, int a4, int *a5)
{
  uint64_t v10;
  uint64_t result;
  _WORD *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _WORD *v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  int v27;
  _BOOL4 v29;
  uint64_t v30;
  __int128 *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;

  if (!*a2)
    return 4294936515;
  v10 = *(_QWORD *)(a1 + 16);
  if (v10)
    *(_DWORD *)(v10 + 68) &= 0xFFFFFFFC;
  if ((*(_BYTE *)(a1 + 68) & 1) == 0)
  {
    *(_QWORD *)(a1 + 72) = 0;
LABEL_6:
    result = mdb_page_search(a1, a2, 0);
    if ((_DWORD)result)
      return result;
    v12 = *(_WORD **)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
    goto LABEL_8;
  }
  v35 = 0uLL;
  v15 = *(unsigned __int16 *)(a1 + 66);
  v12 = *(_WORD **)(a1 + 8 * v15 + 72);
  if ((v12[6] & 0xFFFE) == 0x10)
  {
    *(_WORD *)(a1 + 2 * v15 + 328) = 0;
    return 4294936498;
  }
  if ((v12[5] & 0x20) != 0)
  {
    v14 = 0;
    v16 = **(unsigned int **)(a1 + 40);
    v17 = v12 + 8;
  }
  else
  {
    v14 = (uint64_t)v12 + (unsigned __int16)v12[8];
    v16 = *(unsigned __int16 *)(v14 + 6);
    v17 = (_WORD *)(v14 + 8);
  }
  *(_QWORD *)&v35 = v16;
  *((_QWORD *)&v35 + 1) = v17;
  v18 = (*(uint64_t (**)(_QWORD *, __int128 *))(*(_QWORD *)(a1 + 48) + 16))(a2, &v35);
  if (!v18)
  {
    *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = 0;
    goto LABEL_27;
  }
  if (v18 <= 0)
  {
    LODWORD(v22) = *(unsigned __int16 *)(a1 + 66);
    goto LABEL_41;
  }
  v19 = (unsigned __int16)v12[6] - 16;
  v20 = v19 >> 1;
  if (v19 < 4)
  {
LABEL_33:
    v22 = *(unsigned __int16 *)(a1 + 66);
    if (*(_WORD *)(a1 + 66))
    {
      v24 = 0;
      while (((*(unsigned __int16 *)(*(_QWORD *)(a1 + 328 + 8 * v24 - 256) + 12) - 16) >> 1) - 1 <= *(unsigned __int16 *)(a1 + 328 + 2 * v24))
      {
        if (v22 == ++v24)
          goto LABEL_40;
      }
    }
    else
    {
      LODWORD(v24) = 0;
    }
    if ((_DWORD)v24 == (_DWORD)v22)
    {
LABEL_40:
      *(_WORD *)(a1 + 2 * v22 + 328) = v20;
      return 4294936498;
    }
LABEL_41:
    if (!(_DWORD)v22)
    {
      *(_WORD *)(a1 + 328) = 0;
      if (a4 != 17 || a5)
        return 4294936498;
      goto LABEL_46;
    }
    goto LABEL_6;
  }
  if ((v12[5] & 0x20) != 0)
  {
    v21 = (uint64_t)v12 + v35 * (v20 - 1) + 16;
  }
  else
  {
    v14 = (uint64_t)v12 + (unsigned __int16)v12[v20 + 7];
    *(_QWORD *)&v35 = *(unsigned __int16 *)(v14 + 6);
    v21 = v14 + 8;
  }
  *((_QWORD *)&v35 + 1) = v21;
  v23 = (*(uint64_t (**)(_QWORD *, __int128 *))(*(_QWORD *)(a1 + 48) + 16))(a2, &v35);
  if (!v23)
  {
    *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v20 - 1;
    goto LABEL_27;
  }
  if ((v23 & 0x80000000) == 0)
    goto LABEL_33;
  v33 = *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328);
  if (v33 < ((unsigned __int16)v12[6] - 16) >> 1)
  {
    if ((v12[5] & 0x20) != 0)
    {
      v34 = (uint64_t)v12 + v35 * v33 + 16;
    }
    else
    {
      v14 = (uint64_t)v12 + (unsigned __int16)v12[v33 + 8];
      *(_QWORD *)&v35 = *(unsigned __int16 *)(v14 + 6);
      v34 = v14 + 8;
    }
    *((_QWORD *)&v35 + 1) = v34;
    if (!(*(unsigned int (**)(_QWORD *, __int128 *))(*(_QWORD *)(a1 + 48) + 16))(a2, &v35))
    {
LABEL_27:
      if (a5)
        *a5 = 1;
      goto LABEL_46;
    }
  }
  *(_DWORD *)(a1 + 68) &= ~2u;
LABEL_8:
  v13 = mdb_node_search(a1, a2, a5);
  v14 = (uint64_t)v13;
  if (a5 && !*a5)
    return 4294936498;
  if (!v13)
  {
    result = mdb_cursor_sibling(a1, 1);
    if ((_DWORD)result)
    {
      *(_DWORD *)(a1 + 68) |= 2u;
      return result;
    }
    v12 = *(_WORD **)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
    v14 = (uint64_t)v12 + (unsigned __int16)v12[8];
  }
LABEL_46:
  *(_DWORD *)(a1 + 68) = *(_DWORD *)(a1 + 68) & 0xFFFFFFFC | 1;
  if ((v12[5] & 0x20) != 0)
  {
    result = 0;
    if ((a4 & 0xFFFFFFFE) == 0x10)
    {
      v30 = **(unsigned int **)(a1 + 40);
      *a2 = v30;
      a2[1] = (char *)v12
            + *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328)
            * (unint64_t)v30
            + 16;
    }
    return result;
  }
  if ((*(_WORD *)(v14 + 4) & 4) != 0)
  {
    mdb_xcursor_init1(a1, v14);
    if ((a4 - 15) > 2)
    {
      LODWORD(v35) = 0;
      if (a4 == 2)
        v31 = &v35;
      else
        v31 = 0;
      result = mdb_cursor_set(*(_QWORD *)(a1 + 16), a3, 0, 17, v31);
      if (!(_DWORD)result)
        goto LABEL_79;
      return result;
    }
    result = mdb_cursor_first(*(_QWORD *)(a1 + 16), a3, 0);
LABEL_79:
    if ((a4 & 0xFFFFFFFE) == 0x10)
    {
      *a2 = *(unsigned __int16 *)(v14 + 6);
      a2[1] = v14 + 8;
    }
    return result;
  }
  if (!a3)
  {
    result = 0;
    goto LABEL_79;
  }
  if ((a4 & 0xFFFFFFFE) == 2)
  {
    v35 = 0uLL;
    result = mdb_node_read(a1, (unsigned int *)v14, &v35);
    if ((_DWORD)result)
      return result;
    v25 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 24);
    if ((_QWORD)v35 == 8 && v25 == mdb_cmp_int)
      v25 = (uint64_t (*)(uint64_t, uint64_t))mdb_cmp_cint;
    v27 = v25((uint64_t)a3, (uint64_t)&v35);
    v29 = a4 == 2 || v27 > 0;
    if (!v27 || !v29)
    {
      result = 0;
      *(_OWORD *)a3 = v35;
      goto LABEL_79;
    }
    return 4294936498;
  }
  v32 = *(_QWORD *)(a1 + 16);
  if (v32)
    *(_DWORD *)(v32 + 68) &= 0xFFFFFFFC;
  result = mdb_node_read(a1, (unsigned int *)v14, a3);
  if (!(_DWORD)result)
    goto LABEL_79;
  return result;
}

uint64_t mdb_cursor_get(uint64_t a1, _QWORD *a2, _QWORD *a3, int a4)
{
  uint64_t result;
  uint64_t (*v7)(uint64_t, _QWORD *, _QWORD *);
  int *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;

  v29 = 0;
  if (!a1)
    return 22;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 24) + 124) & 0x13) != 0)
    return 4294936514;
  v7 = mdb_cursor_first;
  switch(a4)
  {
    case 0:
      result = mdb_cursor_first(a1, a2, a3);
      break;
    case 1:
      goto LABEL_32;
    case 2:
    case 3:
      if (!a3)
        goto LABEL_58;
      if (!*(_QWORD *)(a1 + 16))
        goto LABEL_47;
LABEL_10:
      if (!a2)
        goto LABEL_58;
      if (a4 == 17)
        v8 = 0;
      else
        v8 = &v29;
      result = mdb_cursor_set(a1, a2, a3, a4, v8);
      break;
    case 4:
      if ((*(_BYTE *)(a1 + 68) & 1) == 0)
        goto LABEL_58;
      v9 = *(unsigned __int16 *)(a1 + 66);
      v10 = *(_QWORD *)(a1 + 8 * v9 + 72);
      v11 = *(unsigned __int16 *)(v10 + 12) - 16;
      v12 = v11 >> 1;
      if (v11 < 2 || (v13 = *(unsigned __int16 *)(a1 + 2 * v9 + 328), v12 <= v13))
      {
        *(_WORD *)(a1 + 2 * v9 + 328) = v12;
        goto LABEL_56;
      }
      if ((*(_WORD *)(v10 + 10) & 0x20) != 0)
      {
        result = 0;
        v28 = **(unsigned int **)(a1 + 40);
        *a2 = v28;
        a2[1] = v10 + v28 * (unint64_t)v13 + 16;
      }
      else
      {
        v14 = v10 + *(unsigned __int16 *)(v10 + 2 * v13 + 16);
        if (a2)
        {
          *a2 = *(unsigned __int16 *)(v14 + 6);
          a2[1] = v14 + 8;
        }
        if (a3)
        {
          if ((*(_WORD *)(v14 + 4) & 4) == 0)
            goto LABEL_39;
          result = mdb_cursor_get(*(_QWORD *)(a1 + 16), a3, 0, 4);
        }
        else
        {
LABEL_29:
          result = 0;
        }
      }
      break;
    case 5:
      if (!a3 || (*(_BYTE *)(a1 + 68) & 1) == 0)
        goto LABEL_58;
      if ((*(_WORD *)(*(_QWORD *)(a1 + 40) + 4) & 0x10) == 0)
        goto LABEL_47;
      v15 = *(_QWORD *)(a1 + 16);
      if ((*(_DWORD *)(v15 + 68) & 3) != 1)
        goto LABEL_29;
      goto LABEL_54;
    case 6:
      result = mdb_cursor_last(a1, a2, a3);
      break;
    case 7:
      v7 = mdb_cursor_last;
LABEL_32:
      if (!a3)
        goto LABEL_58;
      v16 = *(_DWORD *)(a1 + 68);
      if ((v16 & 1) == 0)
        goto LABEL_58;
      v17 = *(_QWORD *)(a1 + 16);
      if (!v17)
        goto LABEL_47;
      v18 = *(unsigned __int16 *)(a1 + 66);
      v19 = a1 + 2 * v18;
      v20 = *(unsigned __int16 *)(v19 + 328);
      v21 = *(_QWORD *)(a1 + 8 * v18 + 72);
      v22 = *(unsigned __int16 *)(v21 + 12) - 16;
      if (v20 >= v22 >> 1)
      {
        *(_WORD *)(v19 + 328) = v22 >> 1;
        goto LABEL_56;
      }
      *(_DWORD *)(a1 + 68) = v16 & 0xFFFFFFFD;
      v14 = v21 + *(unsigned __int16 *)(v21 + 2 * v20 + 16);
      if ((*(_WORD *)(v14 + 4) & 4) != 0)
      {
        if ((*(_BYTE *)(v17 + 68) & 1) != 0)
          result = v7(v17, a3, 0);
        else
LABEL_58:
          result = 22;
      }
      else
      {
        if (a2)
        {
          *a2 = *(unsigned __int16 *)(v14 + 6);
          a2[1] = v14 + 8;
        }
LABEL_39:
        result = mdb_node_read(a1, (unsigned int *)v14, a3);
      }
      break;
    case 8:
    case 9:
    case 11:
      result = mdb_cursor_next(a1, a2, a3, a4);
      break;
    case 10:
      if (!a3)
        goto LABEL_58;
      if ((*(_WORD *)(*(_QWORD *)(a1 + 40) + 4) & 0x10) == 0)
        goto LABEL_47;
      result = mdb_cursor_next(a1, a2, a3, 9);
      if ((_DWORD)result)
        break;
      v15 = *(_QWORD *)(a1 + 16);
      if ((*(_BYTE *)(v15 + 68) & 1) == 0)
        goto LABEL_56;
      goto LABEL_54;
    case 12:
    case 13:
    case 14:
      result = mdb_cursor_prev(a1, a2, a3, a4);
      break;
    case 15:
    case 16:
    case 17:
      goto LABEL_10;
    case 18:
      if (!a3)
        goto LABEL_58;
      if ((*(_WORD *)(*(_QWORD *)(a1 + 40) + 4) & 0x10) != 0)
      {
        if ((*(_BYTE *)(a1 + 68) & 1) != 0 || (result = mdb_cursor_last(a1, a2, a3), !(_DWORD)result))
        {
          v23 = *(_QWORD *)(a1 + 16);
          if ((*(_BYTE *)(v23 + 68) & 1) != 0)
          {
            result = mdb_cursor_sibling(v23, 0);
            if (!(_DWORD)result)
            {
              v15 = *(_QWORD *)(a1 + 16);
LABEL_54:
              result = 0;
              v24 = *(unsigned __int16 *)(v15 + 66);
              v25 = v15 + 8 * v24;
              v26 = *(_QWORD *)(v25 + 72);
              *a3 = ((*(unsigned __int16 *)(v26 + 12) - 16) >> 1) * **(_DWORD **)(v15 + 40);
              a3[1] = v26 + 16;
              *(_WORD *)(v15 + 2 * v24 + 328) = ((*(unsigned __int16 *)(*(_QWORD *)(v25 + 72) + 12)
                                                + 131056) >> 1)
                                              - 1;
            }
          }
          else
          {
LABEL_56:
            result = 4294936498;
          }
        }
      }
      else
      {
LABEL_47:
        result = 4294936512;
      }
      break;
    default:
      goto LABEL_58;
  }
  v27 = *(_DWORD *)(a1 + 68);
  if ((v27 & 8) != 0)
    *(_DWORD *)(a1 + 68) = v27 ^ 8;
  return result;
}

uint64_t mdb_node_read(uint64_t a1, unsigned int *a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t result;
  unint64_t v6;

  if ((a2[1] & 1) != 0)
  {
    v6 = 0;
    *a3 = *a2;
    result = mdb_page_get(a1, *(_QWORD *)((char *)a2 + *((unsigned __int16 *)a2 + 3) + 8), &v6, 0);
    if ((_DWORD)result)
      return result;
    v4 = v6 + 16;
  }
  else
  {
    *a3 = *a2;
    v4 = (uint64_t)a2 + *((unsigned __int16 *)a2 + 3) + 8;
  }
  result = 0;
  a3[1] = v4;
  return result;
}

uint64_t mdb_cursor_next(uint64_t a1, _QWORD *a2, _QWORD *a3, int a4)
{
  int v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  v8 = *(_DWORD *)(a1 + 68);
  if (a4 == 9 && (v8 & 8) != 0)
    return 4294936498;
  if ((v8 & 1) == 0)
    return mdb_cursor_first(a1, a2, a3);
  v10 = *(unsigned __int16 *)(a1 + 66);
  v11 = *(_QWORD *)(a1 + 8 * v10 + 72);
  if ((v8 & 2) != 0)
  {
    if (((*(unsigned __int16 *)(v11 + 12) - 16) >> 1) - 1 <= *(unsigned __int16 *)(a1 + 2 * v10 + 328))
      return 4294936498;
    *(_DWORD *)(a1 + 68) = v8 ^ 2;
  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 40) + 4) & 4) != 0)
  {
    v12 = v11 + *(unsigned __int16 *)(v11 + 2 * *(unsigned __int16 *)(a1 + 2 * v10 + 328) + 16);
    if ((*(_WORD *)(v12 + 4) & 4) == 0)
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 16) + 68) &= 0xFFFFFFFC;
      if (a4 != 9)
        goto LABEL_17;
      return 4294936498;
    }
    if ((a4 & 0xFFFFFFFE) == 8)
    {
      result = mdb_cursor_next(*(_QWORD *)(a1 + 16), a3, 0, 8);
      if (a4 != 8 || (_DWORD)result != -30798)
      {
        if (a2 && !(_DWORD)result)
        {
          v17 = *(unsigned __int16 *)(v12 + 6);
          v18 = v12 + 8;
          goto LABEL_36;
        }
        return result;
      }
    }
  }
LABEL_17:
  v13 = *(_DWORD *)(a1 + 68);
  if ((v13 & 8) != 0)
  {
    *(_DWORD *)(a1 + 68) = v13 ^ 8;
  }
  else
  {
    v14 = a1 + 2 * *(unsigned __int16 *)(a1 + 66);
    v15 = *(unsigned __int16 *)(v14 + 328) + 1;
    if (v15 >= (*(unsigned __int16 *)(v11 + 12) - 16) >> 1)
    {
      result = mdb_cursor_sibling(a1, 1);
      if ((_DWORD)result)
      {
        *(_DWORD *)(a1 + 68) |= 2u;
        return result;
      }
      v11 = *(_QWORD *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
    }
    else
    {
      *(_WORD *)(v14 + 328) = v15;
    }
  }
  if ((*(_WORD *)(v11 + 10) & 0x20) != 0)
  {
    result = 0;
    v17 = **(unsigned int **)(a1 + 40);
    v18 = v11
        + *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) * (unint64_t)v17
        + 16;
LABEL_36:
    *a2 = v17;
    a2[1] = v18;
    return result;
  }
  v16 = v11
      + *(unsigned __int16 *)(v11 + 2 * *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) + 16);
  if ((*(_WORD *)(v16 + 4) & 4) != 0)
  {
    mdb_xcursor_init1(a1, v11+ *(unsigned __int16 *)(v11 + 2 * *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) + 16));
    result = mdb_cursor_first(*(_QWORD *)(a1 + 16), a3, 0);
    if ((_DWORD)result)
      return result;
  }
  else if (a3)
  {
    result = mdb_node_read(a1, (unsigned int *)(v11+ *(unsigned __int16 *)(v11+ 2* *(unsigned __int16 *)(a1+ 2 * *(unsigned __int16 *)(a1 + 66)+ 328)+ 16)), a3);
    if ((_DWORD)result)
      return result;
  }
  result = 0;
  if (a2)
  {
    v17 = *(unsigned __int16 *)(v16 + 6);
    v18 = v16 + 8;
    goto LABEL_36;
  }
  return result;
}

uint64_t mdb_cursor_last(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v6;
  int v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
    *(_DWORD *)(v6 + 68) &= 0xFFFFFFFC;
  v7 = *(_DWORD *)(a1 + 68);
  if ((v7 & 1) != 0 && !*(_WORD *)(a1 + 66))
  {
    v9 = 0;
  }
  else
  {
    result = mdb_page_search(a1, 0, 8);
    if ((_DWORD)result)
      return result;
    v9 = *(unsigned __int16 *)(a1 + 66);
    v7 = *(_DWORD *)(a1 + 68);
  }
  v10 = *(_QWORD *)(a1 + 8 * v9 + 72);
  v11 = ((*(unsigned __int16 *)(v10 + 12) + 131056) >> 1) - 1;
  *(_WORD *)(a1 + 2 * v9 + 328) = ((*(unsigned __int16 *)(v10 + 12) + 131056) >> 1) - 1;
  *(_DWORD *)(a1 + 68) = v7 | 3;
  if ((*(_BYTE *)(v10 + 10) & 0x20) != 0)
  {
    if (a2)
    {
      v13 = **(unsigned int **)(a1 + 40);
      *a2 = v13;
      v14 = v10 + v13 * (unint64_t)(unsigned __int16)v11 + 16;
LABEL_18:
      result = 0;
      a2[1] = v14;
      return result;
    }
    return 0;
  }
  v12 = v10 + *(unsigned __int16 *)(v10 + 2 * (unsigned __int16)v11 + 16);
  if ((*(_WORD *)(v12 + 4) & 4) != 0)
  {
    mdb_xcursor_init1(a1, v12);
    result = mdb_cursor_last(*(_QWORD *)(a1 + 16), a3, 0);
    if ((_DWORD)result)
      return result;
LABEL_16:
    if (a2)
    {
      *a2 = *(unsigned __int16 *)(v12 + 6);
      v14 = v12 + 8;
      goto LABEL_18;
    }
    return 0;
  }
  if (!a3)
    goto LABEL_16;
  result = mdb_node_read(a1, (unsigned int *)v12, a3);
  if (!(_DWORD)result)
    goto LABEL_16;
  return result;
}

uint64_t mdb_cursor_sibling(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t result;
  int v4;
  unsigned __int16 v6;
  uint64_t v7;
  _WORD *v8;
  int v9;
  unsigned int *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v2 = *(unsigned __int16 *)(a1 + 64);
  if (v2 < 2)
    return 4294936498;
  v4 = a2;
  *(_WORD *)(a1 + 64) = v2 - 1;
  v6 = *(_WORD *)(a1 + 66) - 1;
  *(_WORD *)(a1 + 66) = v6;
  v7 = v6;
  v8 = (_WORD *)(a1 + 2 * v6 + 328);
  v9 = (unsigned __int16)*v8;
  if ((_DWORD)a2)
  {
    if (++v9 >= (*(unsigned __int16 *)(*(_QWORD *)(a1 + 8 * v7 + 72) + 12) - 16) >> 1)
      goto LABEL_9;
LABEL_8:
    *v8 = v9;
    goto LABEL_12;
  }
  if (*v8)
  {
    LOWORD(v9) = v9 - 1;
    goto LABEL_8;
  }
LABEL_9:
  result = mdb_cursor_sibling(a1, a2);
  v7 = *(unsigned __int16 *)(a1 + 66);
  if ((_DWORD)result)
  {
    *(_WORD *)(a1 + 66) = v7 + 1;
    ++*(_WORD *)(a1 + 64);
    return result;
  }
  LOWORD(v9) = *(_WORD *)(a1 + 2 * v7 + 328);
LABEL_12:
  v13 = 0;
  v10 = (unsigned int *)(*(_QWORD *)(a1 + 8 * v7 + 72)
                       + *(unsigned __int16 *)(*(_QWORD *)(a1 + 8 * v7 + 72) + 2 * (unsigned __int16)v9 + 16));
  result = mdb_page_get(a1, *v10 | ((unint64_t)*((unsigned __int16 *)v10 + 2) << 32), &v13, 0);
  if ((_DWORD)result)
  {
    *(_DWORD *)(a1 + 68) &= 0xFFFFFFFC;
  }
  else
  {
    v11 = v13;
    v12 = *(unsigned __int16 *)(a1 + 64);
    if (v12 < 0x20)
    {
      *(_WORD *)(a1 + 64) = v12 + 1;
      *(_WORD *)(a1 + 66) = v12;
      *(_QWORD *)(a1 + 8 * v12 + 72) = v11;
      *(_WORD *)(a1 + 2 * v12 + 328) = 0;
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 24) + 124) |= 2u;
    }
    result = 0;
    if (!v4)
      *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = ((*(unsigned __int16 *)(v11 + 12)
                                                                    + 131056) >> 1)
                                                                  - 1;
  }
  return result;
}

uint64_t mdb_cursor_prev(uint64_t a1, _QWORD *a2, _QWORD *a3, int a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int16 v14;
  _WORD *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if ((*(_BYTE *)(a1 + 68) & 1) != 0)
  {
    v9 = *(unsigned __int16 *)(a1 + 66);
  }
  else
  {
    result = mdb_cursor_last(a1, a2, a3);
    if ((_DWORD)result)
      return result;
    v9 = *(unsigned __int16 *)(a1 + 66);
    ++*(_WORD *)(a1 + 2 * v9 + 328);
  }
  v10 = *(_QWORD *)(a1 + 8 * v9 + 72);
  if ((*(_WORD *)(*(_QWORD *)(a1 + 40) + 4) & 4) != 0)
  {
    v11 = *(unsigned __int16 *)(a1 + 2 * v9 + 328);
    if (v11 < (*(unsigned __int16 *)(v10 + 12) - 16) >> 1)
    {
      v12 = v10 + *(unsigned __int16 *)(v10 + 2 * v11 + 16);
      if ((*(_WORD *)(v12 + 4) & 4) != 0)
      {
        if ((a4 & 0xFFFFFFFE) == 0xC)
        {
          result = mdb_cursor_prev(*(_QWORD *)(a1 + 16), a3, 0, 12);
          if (a4 != 12 || (_DWORD)result != -30798)
          {
            if (!(_DWORD)result)
            {
              if (a2)
              {
                *a2 = *(unsigned __int16 *)(v12 + 6);
                a2[1] = v12 + 8;
              }
              result = 0;
              *(_DWORD *)(a1 + 68) &= ~2u;
            }
            return result;
          }
          v9 = *(unsigned __int16 *)(a1 + 66);
        }
      }
      else
      {
        *(_DWORD *)(*(_QWORD *)(a1 + 16) + 68) &= 0xFFFFFFFC;
        if (a4 == 13)
          return 4294936498;
      }
    }
  }
  *(_DWORD *)(a1 + 68) &= 0xFFFFFFF5;
  v13 = a1 + 2 * v9;
  v14 = *(_WORD *)(v13 + 328);
  if (v14)
  {
    v15 = (_WORD *)(v13 + 328);
    LOWORD(v13) = v14 - 1;
    *v15 = v14 - 1;
  }
  else
  {
    result = mdb_cursor_sibling(a1, 0);
    if ((_DWORD)result)
      return result;
    v18 = *(unsigned __int16 *)(a1 + 66);
    v10 = *(_QWORD *)(a1 + 8 * v18 + 72);
    LODWORD(v13) = ((*(unsigned __int16 *)(v10 + 12) + 131056) >> 1) - 1;
    *(_WORD *)(a1 + 2 * v18 + 328) = ((*(unsigned __int16 *)(v10 + 12) + 131056) >> 1) - 1;
  }
  v16 = *(_WORD *)(v10 + 10);
  if ((v16 & 2) == 0)
    return 4294936500;
  if ((v16 & 0x20) != 0)
  {
    result = 0;
    v19 = **(unsigned int **)(a1 + 40);
    *a2 = v19;
    a2[1] = v10 + (unsigned __int16)v13 * (unint64_t)v19 + 16;
    return result;
  }
  v17 = v10 + *(unsigned __int16 *)(v10 + 2 * (unsigned __int16)v13 + 16);
  if ((*(_WORD *)(v17 + 4) & 4) != 0)
  {
    mdb_xcursor_init1(a1, v17);
    result = mdb_cursor_last(*(_QWORD *)(a1 + 16), a3, 0);
    if ((_DWORD)result)
      return result;
    goto LABEL_27;
  }
  if (!a3 || (result = mdb_node_read(a1, (unsigned int *)v17, a3), !(_DWORD)result))
  {
LABEL_27:
    result = 0;
    if (a2)
    {
      *a2 = *(unsigned __int16 *)(v17 + 6);
      a2[1] = v17 + 8;
    }
  }
  return result;
}

uint64_t mdb_cursor_first(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v6;
  int v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
    *(_DWORD *)(v6 + 68) &= 0xFFFFFFFC;
  v7 = *(_DWORD *)(a1 + 68);
  if ((v7 & 1) != 0 && !*(_WORD *)(a1 + 66))
  {
    v9 = 0;
  }
  else
  {
    result = mdb_page_search(a1, 0, 4);
    if ((_DWORD)result)
      return result;
    v9 = *(unsigned __int16 *)(a1 + 66);
    v7 = *(_DWORD *)(a1 + 68);
  }
  v10 = *(_QWORD *)(a1 + 8 * v9 + 72);
  v11 = v10 + 16;
  v12 = *(unsigned __int16 *)(v10 + 16);
  *(_DWORD *)(a1 + 68) = v7 & 0xFFFFFFFC | 1;
  *(_WORD *)(a1 + 2 * v9 + 328) = 0;
  if ((*(_BYTE *)(v10 + 10) & 0x20) != 0)
  {
    if (a2)
    {
      *a2 = **(unsigned int **)(a1 + 40);
LABEL_18:
      result = 0;
      a2[1] = v11;
      return result;
    }
    return 0;
  }
  v13 = v10 + v12;
  if ((*(_WORD *)(v10 + v12 + 4) & 4) != 0)
  {
    mdb_xcursor_init1(a1, v10 + v12);
    result = mdb_cursor_first(*(_QWORD *)(a1 + 16), a3, 0);
    if ((_DWORD)result)
      return result;
LABEL_16:
    if (a2)
    {
      *a2 = *(unsigned __int16 *)(v13 + 6);
      v11 = v13 + 8;
      goto LABEL_18;
    }
    return 0;
  }
  if (!a3)
    goto LABEL_16;
  result = mdb_node_read(a1, (unsigned int *)(v10 + v12), a3);
  if (!(_DWORD)result)
    goto LABEL_16;
  return result;
}

uint64_t mdb_page_spill(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v4;
  int v5;
  unint64_t v6;
  uint64_t result;
  _DWORD *v8;
  _DWORD *v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  int v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  unsigned int *v24;
  unsigned int v25;
  _QWORD *v26;
  int v27;

  if ((*(_BYTE *)(a1 + 68) & 4) != 0)
    return 0;
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(unsigned __int16 *)(*(_QWORD *)(a1 + 40) + 6);
  if (*(_DWORD *)(a1 + 32) >= 2u)
    v5 += *(unsigned __int16 *)(*(_QWORD *)(v4 + 88) + 54);
  if (a2)
  {
    v6 = *(unsigned int *)(*(_QWORD *)(v4 + 32) + 16);
    v5 += (*a2 + *a3 + v6 + 8) / v6;
  }
  if (*(_DWORD *)(v4 + 128) > (2 * v5))
    return 0;
  v8 = *(_DWORD **)(v4 + 72);
  v9 = *(_DWORD **)(v4 + 64);
  if (v9)
  {
    v10 = *v9;
    if (*v9)
    {
      v11 = 0;
      if ((v10 + 1) > 2)
        v12 = (v10 + 1);
      else
        v12 = 2;
      v13 = (uint64_t *)(v9 + 2);
      v14 = v12 - 1;
      do
      {
        v16 = *v13++;
        v15 = v16;
        if ((v16 & 1) == 0)
          *(_QWORD *)&v9[2 * ++v11] = v15;
        --v14;
      }
      while (v14);
    }
    else
    {
      v11 = 0;
    }
    *(_QWORD *)v9 = v11;
  }
  else
  {
    v17 = mdb_midl_alloc(0x1FFFF);
    *(_QWORD *)(v4 + 64) = v17;
    if (!v17)
      return 12;
  }
  result = mdb_pages_xkeep(a1, 16, 1);
  if (!(_DWORD)result)
  {
    v18 = *v8;
    if (*v8)
    {
      if ((2 * v5) < 0x4000)
        v19 = 0x3FFF;
      else
        v19 = 2 * v5;
      do
      {
        v20 = &v8[4 * v18];
        v21 = v20[1];
        if ((*(_WORD *)(v21 + 10) & 0xC000) == 0)
        {
          v22 = 2 * *v20;
          v23 = *(_QWORD **)v4;
          if (*(_QWORD *)v4)
          {
            while (1)
            {
              v24 = (unsigned int *)v23[8];
              if (v24)
              {
                v25 = mdb_midl_search(v24, v22);
                v26 = (_QWORD *)v23[8];
                if (*v26 >= (unint64_t)v25 && v26[v25] == v22)
                  break;
              }
              v23 = (_QWORD *)*v23;
              if (!v23)
                goto LABEL_33;
            }
            *(_WORD *)(v21 + 10) |= 0x8000u;
          }
          else
          {
LABEL_33:
            result = mdb_midl_append((unint64_t **)(v4 + 64), v22);
            if ((_DWORD)result)
              goto LABEL_41;
            --v19;
          }
        }
        --v18;
      }
      while ((_DWORD)v18 && v19);
    }
    mdb_midl_sort(*(int **)(v4 + 64));
    result = mdb_page_flush(v4, v18);
    if (!(_DWORD)result)
      result = mdb_pages_xkeep(a1, 32784, v18);
  }
LABEL_41:
  if ((_DWORD)result)
    v27 = 2;
  else
    v27 = 8;
  *(_DWORD *)(v4 + 124) |= v27;
  return result;
}

uint64_t mdb_page_new(uint64_t a1, __int16 a2, signed int a3, char **a4)
{
  uint64_t result;
  char *v9;
  char *v10;

  v10 = 0;
  result = mdb_page_alloc(a1, a3, &v10);
  if (!(_DWORD)result)
  {
    v9 = v10;
    *((_WORD *)v10 + 5) = a2 | 0x10;
    *((_WORD *)v9 + 6) = 16;
    *((_WORD *)v9 + 7) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 32) + 16);
    if ((a2 & 1) != 0)
    {
      ++*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    }
    else if ((a2 & 2) != 0)
    {
      ++*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
    }
    else if ((a2 & 4) != 0)
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) += a3;
      *((_DWORD *)v9 + 3) = a3;
    }
    *a4 = v9;
  }
  return result;
}

uint64_t mdb_cursor_touch(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  unsigned int v4;
  unsigned __int16 v5;
  uint64_t v6;
  _OWORD v7[31];
  _OWORD v8[24];
  uint64_t v9;

  v2 = *(unsigned int *)(a1 + 32);
  if (v2 >= 2 && (**(_BYTE **)(a1 + 56) & 0x21) == 0)
  {
    v9 = 0;
    memset(v8, 0, sizeof(v8));
    memset(v7, 0, sizeof(v7));
    v6 = *(_QWORD *)(a1 + 24);
    if (*(_DWORD *)(*(_QWORD *)(v6 + 96) + 4 * v2) != *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 152) + 4 * v2))
      return 4294936516;
    mdb_cursor_init((uint64_t)v8, v6, 1u, (uint64_t)v7);
    result = mdb_page_search((uint64_t)v8, *(_QWORD **)(a1 + 48), 1);
    if ((_DWORD)result)
      return result;
    **(_BYTE **)(a1 + 56) |= 1u;
  }
  *(_WORD *)(a1 + 66) = 0;
  if (!*(_WORD *)(a1 + 64))
    return 0;
  do
  {
    result = mdb_page_touch(a1);
    v4 = *(unsigned __int16 *)(a1 + 64);
    if ((_DWORD)result)
      break;
    v5 = *(_WORD *)(a1 + 66) + 1;
    *(_WORD *)(a1 + 66) = v5;
  }
  while (v4 > v5);
  *(_WORD *)(a1 + 66) = v4 - 1;
  return result;
}

uint64_t mdb_update_key(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unsigned __int16 *v4;
  unsigned __int16 *v5;
  uint64_t v6;
  unsigned __int16 *v7;
  unsigned int v8;
  unsigned __int16 *v9;
  size_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  size_t v17;
  uint64_t v19;
  _WORD *v20;
  unsigned int v21;

  v3 = *(unsigned __int16 *)(a1 + 66);
  v4 = *(unsigned __int16 **)(a1 + 8 * v3 + 72);
  v5 = &v4[*(unsigned __int16 *)(a1 + 2 * v3 + 328)];
  v8 = v5[8];
  v7 = v5 + 8;
  v6 = v8;
  v9 = (unsigned __int16 *)((char *)v4 + v8);
  v10 = *(_QWORD *)a2;
  v11 = (*(_QWORD *)a2 + 1) & 0xFFFFFFFE;
  v12 = v9[3];
  v13 = (v12 + 1) & 0x1FFFE;
  v14 = v11 - v13;
  if (v11 != v13)
  {
    if (v14 <= 0)
    {
      v15 = v4[6];
    }
    else
    {
      v15 = v4[6];
      if (v14 > (unsigned __int16)(v4[7] - v15))
      {
        v17 = *(unsigned int *)v9 | ((unint64_t)v9[2] << 32);
        mdb_node_del((_QWORD *)a1, 0);
        return mdb_page_split(a1, a2, 0, v17, 0x40000);
      }
    }
    v19 = (unsigned __int16)((v15 + 131056) >> 1);
    if ((unsigned __int16)((v15 + 131056) >> 1))
    {
      v20 = v4 + 8;
      do
      {
        v21 = (unsigned __int16)*v20;
        if (v21 <= v6)
          *v20 = v21 - v14;
        ++v20;
        --v19;
      }
      while (v19);
    }
    memmove((char *)v4 + v4[7] - v14, (char *)v4 + v4[7], v6 - v4[7] + 8);
    v4[7] -= v14;
    v9 = (unsigned __int16 *)((char *)v4 + *v7);
    v12 = v9[3];
    v10 = *(_QWORD *)a2;
  }
  if (v10 != v12)
    v9[3] = v10;
  if (v10)
    memcpy(v9 + 4, *(const void **)(a2 + 8), v10);
  return 0;
}

uint64_t mdb_page_alloc(uint64_t a1, signed int a2, char **a3)
{
  signed int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t **v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  unint64_t oldest;
  uint64_t v13;
  char v14;
  int v15;
  uint64_t **v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  BOOL v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t *v24;
  char *v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t *v29;
  unsigned int v30;
  void (*v31)(_QWORD, uint64_t *);
  int v33;
  int v35;
  uint64_t v36;
  int *v37;
  _OWORD v38[24];
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(v4 + 32);
  v7 = (uint64_t **)(v5 + 176);
  v6 = *(uint64_t **)(v5 + 176);
  if (v6)
    v8 = *(_DWORD *)v6;
  else
    v8 = 0;
  v40 = 0;
  v39 = 0;
  memset(v38, 0, sizeof(v38));
  v9 = (a2 - 1);
  if (a2 == 1 && (v10 = *(_QWORD *)(v4 + 48)) != 0)
  {
    result = 0;
    *(_QWORD *)(v4 + 48) = *(_QWORD *)(v10 + 48);
    --*(_DWORD *)(v4 + 56);
    *a3 = (char *)v10;
  }
  else
  {
    *a3 = 0;
    if (*(_DWORD *)(v4 + 128))
    {
      oldest = 0;
      v13 = 0;
      v35 = 0;
      v14 = 1;
      v15 = 1 - a2;
      v33 = 60 * a2;
      while (1)
      {
        v41 = 0;
        v42 = 0;
        v36 = 0;
        v37 = 0;
        if (v8 > v9)
        {
          v16 = v7;
          v17 = v8;
          v18 = v8;
          while (1)
          {
            v19 = v6[v18];
            if (v6[v15 + v18] == v19 + v9)
              goto LABEL_41;
            if (--v18 <= v9)
            {
              v3 = a2;
              v20 = v33-- < 1;
              v8 = v17;
              if (v20)
                goto LABEL_39;
              v7 = v16;
              break;
            }
          }
        }
        if ((v14 & 1) != 0)
        {
          v40 = *(_QWORD *)(v5 + 184);
          oldest = *(_QWORD *)(v5 + 168);
          mdb_cursor_init((uint64_t)v38, v4, 0, 0);
          v21 = v40;
          if (v40)
          {
            v42 = (char *)&v40;
            v41 = 8;
            v13 = 17;
          }
          else
          {
            v13 = 0;
          }
        }
        else
        {
          v21 = v40;
        }
        v22 = v21 + 1;
        v40 = v22;
        if (oldest <= v22)
        {
          if (!v35)
          {
            oldest = mdb_find_oldest(v4);
            *(_QWORD *)(v5 + 168) = oldest;
            v22 = v40;
          }
          if (oldest <= v22)
            goto LABEL_39;
          v35 = 1;
        }
        result = mdb_cursor_get(v38, &v41, 0, v13);
        if ((_DWORD)result)
          break;
        v23 = *(_QWORD *)v42;
        v40 = v23;
        if (oldest <= v23)
        {
          if (!v35)
          {
            oldest = mdb_find_oldest(v4);
            *(_QWORD *)(v5 + 168) = oldest;
            v23 = v40;
          }
          if (oldest <= v23)
            goto LABEL_39;
          v35 = 1;
        }
        result = mdb_node_read((uint64_t)v38, (unsigned int *)(*((_QWORD *)&v38[4] + WORD1(v38[4]) + 1)+ *(unsigned __int16 *)(*((_QWORD *)&v38[4] + WORD1(v38[4]) + 1)+ 2 * *((unsigned __int16 *)&v38[20] + WORD1(v38[4]) + 4)+ 16)), &v36);
        if ((_DWORD)result)
          goto LABEL_55;
        v24 = (uint64_t *)v37;
        if (v6)
        {
          result = mdb_midl_need((_DWORD **)v7, *v37);
          if ((_DWORD)result)
            goto LABEL_55;
          v6 = *v7;
        }
        else
        {
          v6 = mdb_midl_alloc(*v37);
          *v7 = v6;
          if (!v6)
            goto LABEL_43;
        }
        *(_QWORD *)(v5 + 184) = v40;
        mdb_midl_xmerge(v6, v24);
        v14 = 0;
        v8 = *(_DWORD *)v6;
        v13 = 8;
      }
      if ((_DWORD)result != -30798)
        goto LABEL_55;
LABEL_39:
      v17 = v8;
      v19 = *(_QWORD *)(v4 + 16);
      if ((unint64_t)(v19 + v3) >= *(_QWORD *)(v5 + 128))
      {
        result = 4294936504;
        goto LABEL_55;
      }
      v18 = 0;
LABEL_41:
      if ((*(_BYTE *)(v5 + 14) & 8) != 0)
      {
        v25 = (char *)(*(_QWORD *)(v5 + 56) + v19 * *(unsigned int *)(v5 + 16));
      }
      else
      {
        v25 = mdb_page_malloc(v4, a2);
        if (!v25)
        {
LABEL_43:
          result = 12;
          goto LABEL_55;
        }
      }
      if (v18)
      {
        v26 = v17 - a2;
        *v6 = v26;
        v27 = v18 - a2;
        if (v18 - a2 < v26)
        {
          v28 = v26 - v27;
          v29 = &v6[v27 + 1];
          v30 = v18 + 1;
          do
          {
            *v29++ = v6[v30++];
            --v28;
          }
          while (v28);
        }
      }
      else
      {
        *(_QWORD *)(v4 + 16) = v19 + a2;
      }
      *(_QWORD *)v25 = v19;
      v31 = (void (*)(_QWORD, uint64_t *))mdb_mid2l_append;
      if ((*(_DWORD *)(v4 + 124) & 0x80000) == 0)
        v31 = (void (*)(_QWORD, uint64_t *))mdb_mid2l_insert;
      v41 = v19;
      v42 = v25;
      v31(*(_QWORD *)(v4 + 72), &v41);
      result = 0;
      --*(_DWORD *)(v4 + 128);
      *a3 = v25;
    }
    else
    {
      result = 4294936508;
LABEL_55:
      *(_DWORD *)(v4 + 124) |= 2u;
    }
  }
  return result;
}

_QWORD *mdb_node_del(_QWORD *result, int a2)
{
  uint64_t v2;
  _WORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  __int16 v7;
  uint64_t v8;
  char *v9;
  int v10;
  int v11;
  __int16 v12;
  int v13;
  char *v14;
  _WORD *v15;
  unsigned int v16;
  __int16 v17;
  __int16 v18;
  uint64_t v19;
  unsigned __int16 v20;
  unsigned __int16 *v21;
  __int16 v22;
  _WORD *v23;
  _WORD *v24;

  v2 = *((unsigned __int16 *)result + 33);
  v3 = (_WORD *)result[v2 + 9];
  v4 = *((unsigned __int16 *)result + v2 + 164);
  v5 = (unsigned __int16)v3[6];
  v6 = v5 + 131056;
  v7 = v3[5];
  if ((v7 & 0x20) != 0)
  {
    v12 = a2;
    v13 = ~(_DWORD)v4 + (unsigned __int16)(v6 >> 1);
    if (v13)
    {
      v14 = (char *)v3 + (int)v4 * (uint64_t)a2 + 16;
      result = memmove(v14, &v14[a2], v13 * a2);
      LOWORD(v5) = v3[6];
    }
    v17 = v3[7];
    v15 = v3 + 7;
    LOWORD(v16) = v17;
    *(v15 - 1) = v5 - 2;
    v18 = v12 - 2;
  }
  else
  {
    v8 = (unsigned __int16)v3[v4 + 8];
    v9 = (char *)v3 + v8;
    v10 = *(unsigned __int16 *)((char *)v3 + v8 + 6);
    v11 = v10 + 8;
    if ((v7 & 2) != 0)
    {
      if ((*((_WORD *)v9 + 2) & 1) != 0)
        v11 = v10 + 16;
      else
        v11 += *(_DWORD *)v9;
    }
    v16 = (v11 + 1) & 0xFFFFFFFE;
    v19 = (unsigned __int16)(v6 >> 1);
    if ((_DWORD)v19)
    {
      v20 = 0;
      v21 = v3 + 8;
      do
      {
        if (v4)
        {
          v22 = *v21;
          v23 = &v3[v20];
          v23[8] = *v21;
          v24 = v23 + 8;
          if (*v21 < v8)
            *v24 = v22 + v16;
          ++v20;
        }
        ++v21;
        --v4;
        --v19;
      }
      while (v19);
    }
    result = memmove((char *)v3 + (unsigned __int16)v3[7] + v16, (char *)v3 + (unsigned __int16)v3[7], v8 - (unsigned __int16)v3[7]);
    v3[6] -= 2;
    v18 = v3[7];
    v15 = v3 + 7;
  }
  *v15 = v18 + v16;
  return result;
}

uint64_t mdb_page_get(uint64_t a1, unint64_t a2, unint64_t *a3, int *a4)
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  _QWORD *v10;
  unsigned int *v11;
  unsigned int *v12;
  unsigned int v13;
  _QWORD *v14;
  unsigned int v15;
  unint64_t v16;
  uint64_t result;

  v7 = *(_QWORD *)(a1 + 24);
  if ((*(_BYTE *)(a1 + 70) & 0xA) != 0)
  {
LABEL_10:
    if (*(_QWORD *)(v7 + 16) <= a2)
    {
      *(_DWORD *)(v7 + 124) |= 2u;
      return 4294936499;
    }
    v9 = 0;
  }
  else
  {
    v8 = 2 * a2;
    v9 = 1;
    v10 = *(_QWORD **)(a1 + 24);
    while (1)
    {
      v11 = (unsigned int *)v10[8];
      v12 = (unsigned int *)v10[9];
      if (v11)
      {
        v13 = mdb_midl_search(v11, 2 * a2);
        v14 = (_QWORD *)v10[8];
        if (*v14 >= (unint64_t)v13 && v14[v13] == v8)
          break;
      }
      if (*(_QWORD *)v12)
      {
        v15 = mdb_mid2l_search(v12, a2);
        if (*(_QWORD *)v12 >= (unint64_t)v15 && *(_QWORD *)&v12[4 * v15] == a2)
        {
          v16 = *(_QWORD *)&v12[4 * v15 + 2];
          goto LABEL_13;
        }
      }
      ++v9;
      v10 = (_QWORD *)*v10;
      if (!v10)
        goto LABEL_10;
    }
  }
  v16 = *(_QWORD *)(*(_QWORD *)(v7 + 32) + 56) + *(unsigned int *)(*(_QWORD *)(v7 + 32) + 16) * a2;
LABEL_13:
  *a3 = v16;
  result = 0;
  if (a4)
    *a4 = v9;
  return result;
}

uint64_t mdb_page_unspill(uint64_t a1, uint64_t a2, char **a3)
{
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  unsigned int *v9;
  unsigned int v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t result;
  signed int v14;
  char *v15;
  char *v16;
  int v17;
  _QWORD *v18;
  void *v19;
  _QWORD v20[2];

  v6 = *(_QWORD *)(a1 + 32);
  v7 = 2 * *(_QWORD *)a2;
  v8 = (_QWORD *)a1;
  while (1)
  {
    v9 = (unsigned int *)v8[8];
    if (v9)
    {
      v10 = mdb_midl_search(v9, v7);
      v11 = (_QWORD *)v8[8];
      if (*v11 >= (unint64_t)v10)
      {
        v12 = v10;
        if (v11[v10] == v7)
          break;
      }
    }
    v8 = (_QWORD *)*v8;
    if (!v8)
      return 0;
  }
  if (!*(_DWORD *)(a1 + 128))
    return 4294936508;
  if ((*(_WORD *)(a2 + 10) & 4) != 0)
    v14 = *(_DWORD *)(a2 + 12);
  else
    v14 = 1;
  if ((*(_BYTE *)(v6 + 14) & 8) != 0)
  {
    v16 = (char *)a2;
  }
  else
  {
    v15 = mdb_page_malloc(a1, v14);
    if (!v15)
      return 12;
    v16 = v15;
    v17 = *(_DWORD *)(v6 + 16);
    if (v14 < 2)
      mdb_page_copy(v15, (_WORD *)a2, v17);
    else
      memcpy(v15, (const void *)a2, (v17 * v14));
  }
  if (v8 == (_QWORD *)a1)
  {
    v18 = *(_QWORD **)(a1 + 64);
    if (*v18 == v12)
      *v18 = v12 - 1;
    else
      v18[v12] |= 1uLL;
  }
  if ((*(_DWORD *)(a1 + 124) & 0x80000) != 0)
    v19 = mdb_mid2l_append;
  else
    v19 = mdb_mid2l_insert;
  v20[0] = *(_QWORD *)v16;
  v20[1] = v16;
  ((void (*)(_QWORD, _QWORD *))v19)(*(_QWORD *)(a1 + 72), v20);
  result = 0;
  --*(_DWORD *)(a1 + 128);
  *((_WORD *)v16 + 5) |= 0x10u;
  *a3 = v16;
  return result;
}

char *mdb_page_malloc(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  size_t v4;
  char *v5;
  uint64_t v6;
  size_t v7;
  char *v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(unsigned int *)(v3 + 16);
  if (a2 == 1)
  {
    v5 = *(char **)(v3 + 192);
    if (v5)
    {
      *(_QWORD *)(v3 + 192) = *(_QWORD *)v5;
      return v5;
    }
    v7 = v4 - 16;
    v6 = 16;
  }
  else
  {
    v6 = v4 * (unint64_t)a2 - v4;
    v7 = *(unsigned int *)(v3 + 16);
    v4 = v4 * (unint64_t)a2;
  }
  v8 = (char *)malloc_type_malloc(v4, 0x19F3F053uLL);
  v5 = v8;
  if (v8)
  {
    if ((*(_BYTE *)(v3 + 15) & 1) == 0)
    {
      bzero(&v8[v6], v7);
      *((_WORD *)v5 + 4) = 0;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 124) |= 2u;
  }
  return v5;
}

uint64_t mdb_ovpage_free(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int **v7;
  uint64_t result;
  _QWORD *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int *v23;
  unsigned int v24;
  unsigned int v25;
  unint64_t v26;
  unsigned int *v27;
  uint64_t v28;
  uint64_t *v29;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)a2;
  v5 = *(unsigned int *)(a2 + 12);
  v6 = *(_QWORD *)(v3 + 32);
  v7 = (unsigned int **)(v6 + 176);
  if (!*(_QWORD *)(v6 + 176) || *(_QWORD *)v3)
  {
LABEL_3:
    result = mdb_midl_append_range((uint64_t **)(v3 + 40), v4, v5);
    if ((_DWORD)result)
      return result;
    goto LABEL_4;
  }
  v10 = *(_QWORD **)(v3 + 64);
  if ((*(_WORD *)(a2 + 10) & 0x10) != 0)
  {
    v12 = 0;
  }
  else
  {
    if (!v10)
      goto LABEL_3;
    v11 = mdb_midl_search(*(unsigned int **)(v3 + 64), 2 * v4);
    if (*v10 < (unint64_t)v11)
      goto LABEL_3;
    v12 = v11;
    if (v10[v11] != 2 * v4)
      goto LABEL_3;
  }
  result = mdb_midl_need(v7, v5);
  if (!(_DWORD)result)
  {
    if ((*(_WORD *)(a2 + 10) & 0x10) == 0)
    {
      if (*v10 == v12)
        *v10 = v12 - 1;
      else
        v10[v12] |= 1uLL;
LABEL_23:
      v23 = *v7;
      v24 = **v7;
      if (v24)
      {
        while (1)
        {
          v25 = v5 + v24;
          v26 = *(_QWORD *)&v23[2 * v24];
          if (v26 >= v4)
            break;
          *(_QWORD *)&v23[2 * v25] = v26;
          if (!--v24)
          {
            v25 = v5;
            break;
          }
        }
      }
      else
      {
        v25 = v5;
      }
      if (v25 > v24)
      {
        v27 = &v23[2 * v25];
        do
        {
          *(_QWORD *)v27 = v4;
          v27 -= 2;
          ++v4;
          --v25;
        }
        while (v24 < v25);
      }
      *(_QWORD *)v23 += v5;
LABEL_4:
      result = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) -= v5;
      return result;
    }
    v13 = *(uint64_t **)(v3 + 72);
    v14 = (*v13)--;
    v15 = &v13[2 * v14];
    v16 = v15[1];
    if (v16 == a2)
    {
LABEL_20:
      ++*(_DWORD *)(v3 + 128);
      if ((*(_BYTE *)(v6 + 14) & 8) == 0)
        mdb_dpage_free(v6, (_QWORD *)a2);
      goto LABEL_23;
    }
    v17 = v14;
    v18 = *v15;
    v19 = v17 + 1;
    v20 = &v13[2 * v17 - 1];
    while ((unint64_t)--v19 >= 2)
    {
      v21 = *(v20 - 1);
      v22 = *v20;
      *(v20 - 1) = v18;
      *v20 = v16;
      v20 -= 2;
      v16 = v22;
      v18 = v21;
      if (v22 == a2)
        goto LABEL_20;
    }
    v28 = *v13 + 1;
    *v13 = v28;
    v29 = &v13[2 * v28];
    *v29 = v18;
    v29[1] = v16;
    *(_DWORD *)(v3 + 124) |= 2u;
    return 4294936517;
  }
  return result;
}

uint64_t mdb_page_split(uint64_t a1, uint64_t a2, size_t *a3, size_t a4, int a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t result;
  int v17;
  int v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  size_t *v23;
  char *v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  _WORD *v34;
  _QWORD *v35;
  _WORD *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  char *v42;
  size_t v43;
  signed int v44;
  int v45;
  int v46;
  int v47;
  uint64_t v48;
  size_t v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  char *v55;
  void *v56;
  char *v57;
  int v58;
  char *v59;
  int v60;
  int v61;
  unsigned int v62;
  _BOOL4 v63;
  size_t *v64;
  unsigned int v65;
  int v66;
  uint64_t v67;
  __int16 *v68;
  uint64_t v69;
  char *v70;
  __int16 v71;
  char *v72;
  int v73;
  int v74;
  int v75;
  uint64_t v76;
  signed int v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  int v81;
  uint64_t v82;
  int v83;
  size_t v84;
  uint64_t v85;
  uint64_t v86;
  unsigned __int16 v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  __int128 *v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  size_t v99;
  const void **v100;
  unint64_t v101;
  uint64_t v102;
  _WORD *v103;
  size_t v104;
  int v105;
  size_t *v106;
  signed int v107;
  unsigned int *v108;
  __int16 v109;
  uint64_t v110;
  unsigned int *v111;
  char *v112;
  uint64_t v113;
  unsigned int v114;
  unsigned int v115;
  unsigned __int16 v116;
  uint64_t v117;
  __int16 *v118;
  _WORD *v119;
  __int16 v120;
  uint64_t v121;
  unsigned int v122;
  uint64_t v123;
  uint64_t v124;
  unsigned __int16 v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unsigned __int16 v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t *v134;
  unsigned int v135;
  unsigned int v136;
  int v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t *v141;
  _WORD *v142;
  _QWORD *v143;
  uint64_t v144;
  _WORD *v145;
  _QWORD *v146;
  __int16 v147;
  uint64_t v148;
  unsigned __int16 v150;
  uint64_t v151;
  uint64_t v152;
  unsigned int v153;
  uint64_t v154;
  unsigned int v155;
  unint64_t v156;
  uint64_t *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  char *v165;
  unsigned int v166;
  unsigned __int16 v167;
  unint64_t v168;
  unsigned int v169;
  size_t v170;
  unsigned int v171;
  signed int v172;
  size_t *v173;
  unsigned int v174;
  uint64_t v175;
  signed int v176;
  char *v177;
  uint64_t v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  uint64_t v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  _OWORD v208[20];
  uint64_t v209;
  char *v210;
  char *v211;
  uint64_t v212;
  char *v213;
  size_t v214;
  unsigned int *v215;
  _OWORD v216[2];

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 32);
  v216[0] = 0uLL;
  v214 = 0;
  v215 = 0;
  v212 = 0;
  v213 = 0;
  v210 = 0;
  v211 = 0;
  v209 = 0;
  memset(v208, 0, sizeof(v208));
  v206 = 0u;
  v207 = 0u;
  v204 = 0u;
  v205 = 0u;
  v11 = *(unsigned __int16 *)(a1 + 66);
  v12 = *(_QWORD *)(a1 + 8 * v11 + 72);
  v13 = (void *)(a1 + 328);
  v14 = *(unsigned __int16 *)(a1 + 328 + 2 * v11);
  v15 = *(unsigned __int16 *)(v12 + 12);
  result = mdb_page_new(a1, *(_WORD *)(v12 + 10), 1, &v211);
  if ((_DWORD)result)
    return result;
  v173 = a3;
  v177 = v211;
  v178 = a2;
  *((_WORD *)v211 + 4) = *(_WORD *)(v12 + 8);
  v17 = *(unsigned __int16 *)(a1 + 66);
  if (*(_WORD *)(a1 + 66))
  {
    v170 = a4;
    v18 = a5;
    v19 = v10;
    v175 = v14;
    v20 = 0;
    v21 = v17 - 1;
  }
  else
  {
    result = mdb_page_new(a1, 1, 1, &v210);
    if ((_DWORD)result)
      goto LABEL_177;
    v170 = a4;
    v31 = *(unsigned __int16 *)(a1 + 64);
    if (*(_WORD *)(a1 + 64))
    {
      v32 = v31 + 1;
      v33 = (_QWORD *)(a1 + 8 * v31 + 72);
      v34 = (_WORD *)(a1 + 2 * v31 + 328);
      v35 = v33;
      v36 = v34;
      do
      {
        v37 = *--v35;
        *v33 = v37;
        LOWORD(v37) = *--v36;
        *v34 = v37;
        --v32;
        v34 = v36;
        v33 = v35;
      }
      while (v32 > 1);
    }
    v38 = v210;
    *(_QWORD *)(a1 + 72) = v210;
    *(_WORD *)(a1 + 328) = 0;
    v39 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(v39 + 40) = *(_QWORD *)v38;
    v20 = *(unsigned __int16 *)(v39 + 6);
    *(_WORD *)(v39 + 6) = v20 + 1;
    result = mdb_node_add(a1, 0, 0, 0, *(_QWORD *)v12, 0);
    if ((_DWORD)result)
    {
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a1 + 80);
      *(_WORD *)(a1 + 328) = *(_WORD *)(a1 + 330);
      v40 = *(_QWORD *)(a1 + 40);
      *(_QWORD *)(v40 + 40) = *(_QWORD *)v12;
      --*(_WORD *)(v40 + 6);
      goto LABEL_177;
    }
    v18 = a5;
    v19 = v10;
    v175 = v14;
    v21 = 0;
    ++*(_WORD *)(a1 + 64);
    LOWORD(v17) = *(_WORD *)(a1 + 66) + 1;
    *(_WORD *)(a1 + 66) = v17;
  }
  mdb_cursor_copy(a1, (uint64_t)&v204);
  *(_QWORD *)&v205 = 0;
  v22 = WORD1(v208[0]);
  v23 = (size_t *)v177;
  *((_QWORD *)v208 + WORD1(v208[0]) + 1) = v177;
  v24 = (char *)&v204 + 2 * v21;
  *((_WORD *)v24 + 164) = *(_WORD *)(a1 + 2 * v21 + 328) + 1;
  v171 = v21;
  v169 = v20;
  if ((v18 & 0x20000) != 0)
  {
    v41 = v21;
    v174 = 0;
    v42 = 0;
    *((_WORD *)&v208[16] + v22 + 4) = 0;
    v216[0] = *(_OWORD *)v178;
    v43 = *(_QWORD *)&v216[0];
    v44 = v175;
    v172 = v175;
    v28 = v19;
    v45 = v18;
    goto LABEL_71;
  }
  v25 = v15 - 16;
  v26 = v25 >> 1;
  v27 = ((v25 >> 1) + 1) >> 1;
  v28 = v19;
  v174 = v25 >> 1;
  v165 = v24;
  if ((*((_WORD *)v177 + 5) & 0x20) == 0)
  {
    v29 = (v26 + 1) >> 1;
    if ((*(_WORD *)(v12 + 10) & 2) != 0)
    {
      v53 = *(_QWORD *)v178 + *v173 + 8;
      v54 = 8 - *v173;
      if (v53 <= *(unsigned int *)(v28 + 220))
        LODWORD(v54) = 0;
      LODWORD(v30) = (v53 + v54 + 3) & 0xFFFFFFFE;
    }
    else if (v178)
    {
      v30 = *(_QWORD *)v178 + 10;
    }
    else
    {
      LODWORD(v30) = 10;
    }
    v58 = *(_DWORD *)(v28 + 16);
    v59 = mdb_page_malloc(*(_QWORD *)(a1 + 24), 1u);
    if (v59)
    {
      v42 = v59;
      v60 = v58 - 16;
      v61 = (v30 + 1) & 0xFFFFFFFE;
      *(_QWORD *)v59 = *(_QWORD *)v12;
      *((_WORD *)v59 + 5) = *(_WORD *)(v12 + 10);
      *((_WORD *)v59 + 6) = 16;
      *((_WORD *)v59 + 7) = *(_DWORD *)(v28 + 16);
      if (v25 > 1)
      {
        v66 = 0;
        v62 = v25 >> 1;
        if (v174 <= 1)
          v67 = 1;
        else
          v67 = v174;
        v68 = (__int16 *)(v12 + 16);
        v44 = v175;
        v69 = v175;
        v65 = v29;
        do
        {
          if (!v69)
          {
            v70 = &v59[2 * v66++];
            *((_WORD *)v70 + 8) = 0;
          }
          v71 = *v68++;
          v72 = &v59[2 * v66++];
          *((_WORD *)v72 + 8) = v71;
          --v69;
          --v67;
        }
        while (v67);
        if (v60 >= 0)
          v73 = v58 - 16;
        else
          v73 = v58 - 1;
        v63 = v174 > v175;
        v41 = v171;
        v23 = (size_t *)v177;
        v64 = (size_t *)v178;
        if (v25 >= 0x40 && v61 <= v73 >> 4 && v174 > v175)
        {
          v45 = v18;
          goto LABEL_68;
        }
      }
      else
      {
        v44 = v175;
        v23 = (size_t *)v177;
        v62 = v25 >> 1;
        v63 = v174 > v175;
        v41 = v171;
        v64 = (size_t *)v178;
        v65 = v29;
      }
      if (v65 < v44 && v63)
      {
        v74 = v65 - 1;
        v75 = -1;
        v63 = 1;
        LODWORD(v76) = v62;
      }
      else
      {
        if (v63)
        {
          v63 = 0;
          LODWORD(v76) = 0;
          v74 = v65 + ((*(unsigned __int16 *)(v12 + 10) >> 1) & 1) + 1;
          v75 = 1;
          v45 = v18;
          goto LABEL_54;
        }
        LODWORD(v76) = 0;
        v75 = 1;
        v74 = v62;
      }
      v45 = v18;
      if ((_DWORD)v76 != v74)
      {
LABEL_54:
        v77 = 0;
        v78 = v75;
        v79 = v74 - v75;
        v80 = -(int)v76;
        v81 = -v74;
        v76 = v76;
        while (1)
        {
          if (v44 == v76)
          {
            v77 += v61;
          }
          else
          {
            v82 = v12 + *(unsigned __int16 *)&v42[2 * v76 + 16];
            v83 = v77 + *(unsigned __int16 *)(v82 + 6) + 10;
            if ((*(_WORD *)(v12 + 10) & 2) != 0)
            {
              if ((*(_WORD *)(v82 + 4) & 1) != 0)
                v83 += 8;
              else
                v83 += *(_DWORD *)v82;
            }
            v77 = (v83 + 1) & 0xFFFFFFFE;
          }
          if (v77 > v60 || v79 == v76)
            break;
          v76 += v78;
          v80 -= v78;
          if (v81 == v80)
            goto LABEL_67;
        }
        v65 = v63 - v80;
LABEL_67:
        v23 = (size_t *)v177;
      }
LABEL_68:
      v24 = v165;
      if (v65 == v44)
      {
        v43 = *v64;
        v84 = v64[1];
        *(_QWORD *)&v216[0] = *v64;
        *((_QWORD *)&v216[0] + 1) = v84;
        v172 = v44;
      }
      else
      {
        v172 = v65;
        v85 = v12 + *(unsigned __int16 *)&v42[2 * v65 + 16];
        v43 = *(unsigned __int16 *)(v85 + 6);
        *(_QWORD *)&v216[0] = v43;
        *((_QWORD *)&v216[0] + 1) = v85 + 8;
      }
      goto LABEL_71;
    }
    result = 12;
LABEL_177:
    *(_DWORD *)(*(_QWORD *)(a1 + 24) + 124) |= 2u;
    return result;
  }
  v46 = *(unsigned __int16 *)(a1 + 2 * (unsigned __int16)v17 + 328);
  v47 = v46 - v27;
  v43 = **(unsigned int **)(a1 + 40);
  v48 = v12 + 16 + v43 * v27;
  v49 = v43 * (v26 - v27);
  *(_WORD *)(v12 + 12) -= 2 * (v26 - v27);
  *((_WORD *)v177 + 6) += 2 * (v26 - v27);
  v50 = v43 * (v26 - v27) - 2 * (v26 - v27);
  *(_WORD *)(v12 + 14) += v50;
  *((_WORD *)v177 + 7) -= v50;
  *(_QWORD *)&v216[0] = v43;
  v51 = v48;
  if (v27 == (_DWORD)v175)
    v51 = *(_QWORD *)(v178 + 8);
  *((_QWORD *)&v216[0] + 1) = v51;
  v163 = v28;
  v172 = ((v25 >> 1) + 1) >> 1;
  if (v47 < 0)
  {
    v55 = (char *)(v12 + 16 + v43 * *(unsigned __int16 *)(a1 + 328 + 2 * *(unsigned __int16 *)(a1 + 66)));
    memcpy(v177 + 16, (const void *)(v12 + 16 + v43 * v27), v49);
    *((_QWORD *)&v216[0] + 1) = v177 + 16;
    memmove(&v55[v43], v55, ((((v25 >> 1) + 1) >> 1) - *(unsigned __int16 *)(a1 + 328 + 2 * *(unsigned __int16 *)(a1 + 66)))* v43);
    v56 = v55;
    v28 = v163;
    memcpy(v56, *(const void **)(v178 + 8), v43);
    v44 = v175;
    v23 = (size_t *)v177;
    v41 = v171;
    v42 = 0;
    *(_WORD *)(v12 + 12) += 2;
    *(_WORD *)(v12 + 14) = *(_WORD *)(v12 + 14) - v43 + 2;
    v45 = v18;
    v24 = v165;
  }
  else
  {
    v52 = (v47 * v43);
    if (v46 != v27)
    {
      memcpy(v177 + 16, (const void *)(v12 + 16 + v43 * v27), (v47 * v43));
      v23 = (size_t *)v177;
    }
    v57 = (char *)v23 + v52 + 16;
    memcpy(v57, *(const void **)(v178 + 8), v43);
    memcpy(&v57[v43], (const void *)(v48 + v52), (v49 - v52));
    v23 = (size_t *)v177;
    v42 = 0;
    *((_WORD *)v177 + 6) += 2;
    *((_WORD *)v177 + 7) = *((_WORD *)v177 + 7) - v43 + 2;
    *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v47;
    v28 = v163;
    v24 = v165;
    v45 = v18;
    v44 = v175;
    v41 = v171;
  }
LABEL_71:
  v86 = *((_QWORD *)v208 + v41 + 1);
  v87 = *(_WORD *)(v86 + 14) - *(_WORD *)(v86 + 12);
  v168 = v43 + 10;
  if (v43 + 10 <= v87)
  {
    v167 = *(_WORD *)(v86 + 14) - *(_WORD *)(v86 + 12);
    --WORD1(v208[0]);
    LODWORD(result) = mdb_node_add((uint64_t)&v204, *((unsigned __int16 *)v24 + 164), (const void **)v216, 0, *v23, 0);
    ++WORD1(v208[0]);
    v99 = v170;
    v100 = (const void **)v178;
    if (!(_DWORD)result)
      goto LABEL_91;
    goto LABEL_82;
  }
  v176 = v44;
  v88 = v28;
  v166 = *(unsigned __int16 *)(a1 + 64);
  --LOWORD(v208[0]);
  --WORD1(v208[0]);
  v203 = 0;
  v201 = 0u;
  v202 = 0u;
  v199 = 0u;
  v200 = 0u;
  v197 = 0u;
  v198 = 0u;
  v195 = 0u;
  v196 = 0u;
  v193 = 0u;
  v194 = 0u;
  v191 = 0u;
  v192 = 0u;
  v189 = 0u;
  v190 = 0u;
  v187 = 0u;
  v188 = 0u;
  v185 = 0u;
  v186 = 0u;
  v183 = 0u;
  v184 = 0u;
  v181 = 0u;
  v182 = 0u;
  v179 = 0u;
  v180 = 0u;
  v89 = *(_QWORD *)(*((_QWORD *)&v205 + 1) + 104);
  v90 = v206;
  v91 = &v204;
  if ((BYTE4(v208[0]) & 4) != 0)
  {
    DWORD1(v183) = 1;
    *(_QWORD *)&v180 = &v204;
    v91 = &v179;
  }
  *(_QWORD *)v91 = *(_QWORD *)(v89 + 8 * v206);
  *(_QWORD *)(v89 + 8 * v90) = v91;
  result = mdb_page_split(&v204, v216, 0, *v23, 0);
  *(_QWORD *)(v89 + 8 * v90) = *(_QWORD *)v91;
  v28 = v88;
  if ((_DWORD)result)
    goto LABEL_174;
  v167 = v87;
  if (*(unsigned __int16 *)(a1 + 64) <= v166)
    v92 = v171;
  else
    v92 = v171 + 1;
  v93 = *((_QWORD *)v208 + v92 + 1);
  v94 = a1 + 8 * v92;
  v97 = *(_QWORD *)(v94 + 72);
  v95 = (_QWORD *)(v94 + 72);
  v96 = v97;
  v171 = v92;
  if (v93 == v97)
  {
    v44 = v176;
    v99 = v170;
    v100 = (const void **)v178;
    goto LABEL_91;
  }
  v98 = a1 + 2 * v92;
  v99 = v170;
  v100 = (const void **)v178;
  if (*(unsigned __int16 *)(v98 + 328) < (*(unsigned __int16 *)(v96 + 12) - 16) >> 1)
  {
    v44 = v176;
    goto LABEL_91;
  }
  if ((int)v92 >= 1)
  {
    v101 = 0;
    v102 = a1 + 328;
    do
    {
      *(_QWORD *)(v102 + 8 * v101 - 256) = *((_QWORD *)v208 + v101 + 1);
      *(_WORD *)(v102 + 2 * v101) = *((_WORD *)&v208[16] + v101 + 4);
      ++v101;
    }
    while (v101 < v92);
  }
  v103 = (_WORD *)(v98 + 328);
  *v95 = v93;
  v44 = v176;
  if (*((_WORD *)&v208[16] + v92 + 4))
  {
    *v103 = *((_WORD *)&v208[16] + v92 + 4) - 1;
    goto LABEL_91;
  }
  *v103 = 0;
  LODWORD(result) = mdb_cursor_sibling(a1, 0);
  if ((_DWORD)result)
  {
LABEL_82:
    if ((_DWORD)result == -30798)
      result = 4294936517;
    else
      result = result;
    goto LABEL_174;
  }
LABEL_91:
  if ((v45 & 0x20000) != 0)
  {
    v123 = *(unsigned __int16 *)(a1 + 66);
    *(_QWORD *)(a1 + 8 * v123 + 72) = v177;
    *(_WORD *)(a1 + 2 * v123 + 328) = 0;
    result = mdb_node_add(a1, 0, v100, v173, v99, v45);
    v116 = v167;
    if ((_DWORD)result)
      goto LABEL_174;
    v115 = v169;
    v122 = v171;
    if (*(_WORD *)(a1 + 66))
    {
      memcpy(v13, (char *)&v208[16] + 8, 2 * *(unsigned __int16 *)(a1 + 66));
      v122 = v171;
    }
    goto LABEL_139;
  }
  if ((*(_WORD *)(v12 + 10) & 0x20) != 0)
  {
    v115 = v169;
    v122 = v171;
    v116 = v167;
    if (v172 <= v44)
    {
      *(_QWORD *)(a1 + 72 + 8 * *(unsigned __int16 *)(a1 + 66)) = v177;
      v124 = a1 + 2 * v171;
      v125 = *(_WORD *)(v124 + 328) + 1;
      *(_WORD *)(v124 + 328) = v125;
      v126 = *(_QWORD *)(a1 + 72 + 8 * v171);
      if (*((_QWORD *)v208 + v171 + 1) != v126
        && (*(unsigned __int16 *)(v126 + 12) - 16) >> 1 <= v125
        && (v171 & 0x80000000) == 0)
      {
        v127 = 0;
        do
        {
          *(_QWORD *)(a1 + 8 * v127 + 72) = *((_QWORD *)v208 + v127 + 1);
          *(_WORD *)(a1 + 2 * v127 + 328) = *((_WORD *)&v208[16] + v127 + 4);
          ++v127;
        }
        while (v171 + 1 != v127);
      }
    }
LABEL_139:
    v134 = *(uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
    if (!v134)
    {
LABEL_173:
      result = 0;
      goto LABEL_174;
    }
    v135 = *(unsigned __int16 *)(v12 + 12) - 16;
    v136 = v135 >> 1;
    v137 = *(_DWORD *)(a1 + 68);
    v138 = v211;
    v139 = 2 * v115 + 330;
    v140 = 8 * v115 + 80;
    while (1)
    {
      v141 = v134;
      if ((v137 & 4) != 0)
        v141 = (uint64_t *)v134[2];
      if (v141 == (uint64_t *)a1 || (*((_DWORD *)v134 + 17) & *((_DWORD *)v141 + 17) & 1) == 0)
        goto LABEL_172;
      if (!v115)
        break;
      if (v141[9] == v12)
      {
        v142 = (_WORD *)((char *)v141 + v139);
        v143 = (uint64_t *)((char *)v141 + v140);
        v144 = v115 + 1;
        v145 = (_WORD *)((char *)v141 + v139);
        v146 = (uint64_t *)((char *)v141 + v140);
        do
        {
          v147 = *--v145;
          *v142 = v147;
          v148 = *--v146;
          *v143 = v148;
          v143 = v146;
          v142 = v145;
        }
        while (v144-- > 1);
        *((_WORD *)v141 + 164) = v136 <= *((unsigned __int16 *)v141 + 164);
        v141[9] = *(_QWORD *)(a1 + 72);
        ++*((_WORD *)v141 + 32);
        v150 = *((_WORD *)v141 + 33) + 1;
        *((_WORD *)v141 + 33) = v150;
        goto LABEL_152;
      }
LABEL_172:
      v134 = (uint64_t *)*v134;
      if (!v134)
        goto LABEL_173;
    }
    v150 = *((_WORD *)v141 + 33);
LABEL_152:
    v151 = *(unsigned __int16 *)(a1 + 66);
    if (v151 <= v150 && v141[v151 + 9] == v12)
    {
      v154 = (uint64_t)v141 + 2 * v151;
      v155 = *(unsigned __int16 *)(v154 + 328);
      if ((v45 & 0x40000) == 0 && v155 >= v44)
      {
        *(_WORD *)(v154 + 328) = v155 + 1;
        v151 = *(unsigned __int16 *)(a1 + 66);
        v155 = *((unsigned __int16 *)v141 + v151 + 164);
      }
      if (v136 <= v155)
      {
        v141[v151 + 9] = (uint64_t)v138;
        *((_WORD *)v141 + v151 + 164) = v155 - (v135 >> 1);
        if (*(_WORD *)(a1 + 66))
        {
          v156 = 0;
          v157 = v141 + 41;
          do
          {
            *((_WORD *)v157 + v156) = *((_WORD *)&v208[16] + v156 + 4);
            v157[v156 - 32] = *((_QWORD *)v208 + v156 + 1);
            ++v156;
          }
          while (v156 < *(unsigned __int16 *)(a1 + 66));
        }
      }
    }
    else if (v168 <= v116 && (int)v122 <= v150 && v141[v122 + 9] == *(_QWORD *)(a1 + 8 * v122 + 72))
    {
      v152 = (uint64_t)v141 + 2 * v122;
      v153 = *(unsigned __int16 *)(v152 + 328);
      if (v153 >= *(unsigned __int16 *)(a1 + 2 * v122 + 328))
        *(_WORD *)(v152 + 328) = v153 + 1;
    }
    if ((*(_WORD *)(v12 + 10) & 2) != 0)
    {
      v158 = v141[2];
      if (v158)
      {
        if ((*(_BYTE *)(v158 + 68) & 1) != 0)
        {
          v159 = *(unsigned __int16 *)(a1 + 66);
          v160 = v141[v159 + 9];
          v161 = *((unsigned __int16 *)v141 + v159 + 164);
          if (v161 < (*(unsigned __int16 *)(v160 + 12) - 16) >> 1)
          {
            v162 = v160 + *(unsigned __int16 *)(v160 + 2 * v161 + 16);
            if ((*(_WORD *)(v162 + 4) & 6) == 4)
              *(_QWORD *)(v158 + 72) = v162 + *(unsigned __int16 *)(v162 + 6) + 8;
          }
        }
      }
    }
    goto LABEL_172;
  }
  v164 = v28;
  v104 = 0;
  v105 = 0;
  *(_QWORD *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72) = v177;
  v106 = (size_t *)&v212;
  v107 = v172;
  while (1)
  {
    if (v107 == v44)
    {
      v108 = *(unsigned int **)(v178 + 8);
      v214 = *(_QWORD *)v178;
      v215 = v108;
      if ((*(_WORD *)(v12 + 10) & 2) != 0)
        v106 = v173;
      else
        v104 = v99;
      *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v105;
      v109 = *(_WORD *)(v12 + 10);
      LODWORD(v110) = v45;
    }
    else
    {
      v111 = (unsigned int *)(v12 + *(unsigned __int16 *)&v42[2 * v107 + 16]);
      v215 = v111 + 2;
      v112 = (char *)*((unsigned __int16 *)v111 + 3);
      v214 = (size_t)v112;
      v109 = *(_WORD *)(v12 + 10);
      if ((v109 & 2) != 0)
      {
        v212 = *v111;
        v213 = &v112[(_QWORD)(v111 + 2)];
        LODWORD(v110) = *((unsigned __int16 *)v111 + 2);
        v106 = (size_t *)&v212;
      }
      else
      {
        v110 = *((unsigned __int16 *)v111 + 2);
        v104 = *v111 | (unint64_t)(v110 << 32);
      }
    }
    if (!(v109 & 2 | v105))
      v214 = 0;
    result = mdb_node_add(a1, (unsigned __int16)v105, (const void **)&v214, v106, v104, v110);
    if ((_DWORD)result)
      break;
    if (v107 == v174)
    {
      v107 = 0;
      v105 = 0;
      *(_QWORD *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72) = v42;
    }
    else
    {
      ++v107;
      ++v105;
    }
    if (v107 == v172)
    {
      LODWORD(v113) = *((unsigned __int16 *)v42 + 6);
      v114 = (v113 - 16) >> 1;
      v28 = v164;
      v115 = v169;
      v116 = v167;
      if ((v113 - 16) >= 2)
      {
        if (v114 <= 1)
          v117 = 1;
        else
          v117 = v114;
        v118 = (__int16 *)(v42 + 16);
        v119 = (_WORD *)(v12 + 16);
        do
        {
          v120 = *v118++;
          *v119++ = v120;
          --v117;
        }
        while (v117);
        v113 = *((unsigned __int16 *)v42 + 6);
      }
      *(_WORD *)(v12 + 12) = v113;
      *(_WORD *)(v12 + 14) = *((_WORD *)v42 + 7);
      memcpy((void *)(v12 + *(unsigned __int16 *)(v12 + 2 * v114 - 2 + 16)), &v42[*(unsigned __int16 *)&v42[2 * v114 + 14]], *(_DWORD *)(v164 + 16) - *((unsigned __int16 *)v42 + 7));
      if (v172 <= v44)
      {
        v121 = *(unsigned __int16 *)(a1 + 66);
        *(_QWORD *)(a1 + 72 + 8 * v121) = v211;
        v122 = v171;
        v128 = a1 + 2 * v171;
        v129 = *(_WORD *)(v128 + 328) + 1;
        *(_WORD *)(v128 + 328) = v129;
        v130 = *(_QWORD *)(a1 + 72 + 8 * v171);
        if (*((_QWORD *)v208 + v171 + 1) != v130
          && (*(unsigned __int16 *)(v130 + 12) - 16) >> 1 <= v129
          && (v171 & 0x80000000) == 0)
        {
          v131 = 0;
          do
          {
            *(_QWORD *)(a1 + 8 * v131 + 72) = *((_QWORD *)v208 + v131 + 1);
            *(_WORD *)(a1 + 2 * v131 + 328) = *((_WORD *)&v208[16] + v131 + 4);
            ++v131;
          }
          while (v171 + 1 != v131);
        }
      }
      else
      {
        v121 = *(unsigned __int16 *)(a1 + 66);
        *(_QWORD *)(a1 + 8 * v121 + 72) = v12;
        v122 = v171;
      }
      if ((v45 & 0x10000) != 0)
      {
        v132 = *(_QWORD *)(a1 + 8 * v121 + 72);
        v133 = v132
             + *(unsigned __int16 *)(v132 + 2 * *(unsigned __int16 *)(a1 + 2 * v121 + 328) + 16);
        if ((*(_WORD *)(v133 + 4) & 1) == 0)
          v173[1] = v133 + *(unsigned __int16 *)(v133 + 6) + 8;
      }
      goto LABEL_139;
    }
  }
  v28 = v164;
LABEL_174:
  if (v42)
  {
    *(_QWORD *)v42 = *(_QWORD *)(v28 + 192);
    *(_QWORD *)(v28 + 192) = v42;
  }
  if ((_DWORD)result)
    goto LABEL_177;
  return result;
}

uint64_t mdb_node_add(uint64_t a1, int a2, const void **a3, size_t *a4, size_t a5, int a6)
{
  _WORD *v8;
  __int16 v9;
  int v10;
  int v13;
  uint64_t v14;
  size_t v15;
  int v16;
  uint64_t result;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  unsigned int v23;
  _WORD *v24;
  __int16 *v25;
  __int16 v26;
  unsigned __int16 v27;
  char *v28;
  unsigned __int16 v29;
  char *v30;
  char *v31;
  const void *v32;
  size_t v33;
  char *v34;
  char *v35;

  v8 = *(_WORD **)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
  v35 = 0;
  v9 = v8[5];
  if ((v9 & 0x20) != 0)
  {
    v15 = **(int **)(a1 + 40);
    v16 = (((unsigned __int16)v8[6] - 16) >> 1) - a2;
    if (v16 >= 1)
      memmove((char *)v8 + (int)v15 * (uint64_t)a2 + v15 + 16, (char *)v8 + (int)v15 * (uint64_t)a2 + 16, v16 * (int)v15);
    memcpy((char *)v8 + (int)v15 * (uint64_t)a2 + 16, a3[1], v15);
    result = 0;
    v8[6] += 2;
    v8[7] = v8[7] - v15 + 2;
    return result;
  }
  v10 = a6;
  v13 = (unsigned __int16)v8[6];
  if (a3)
    v14 = (uint64_t)*a3 + 8;
  else
    v14 = 8;
  v18 = (unsigned __int16)(v8[7] - v13) - 2;
  if ((v9 & 2) == 0)
  {
    v19 = v14;
    goto LABEL_16;
  }
  if ((a6 & 1) != 0)
  {
    v19 = v14 + 8;
LABEL_16:
    v22 = (v19 + 1) & 0xFFFFFFFFFFFFFFFELL;
    if (v22 > v18)
    {
      v20 = *(_QWORD *)(a1 + 24);
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v19 = *a4 + v14;
  v20 = *(_QWORD *)(a1 + 24);
  v21 = *(_QWORD *)(v20 + 32);
  if (v19 <= *(unsigned int *)(v21 + 220))
    goto LABEL_16;
  v22 = (v14 + 9) & 0xFFFFFFFFFFFFFFFELL;
  if (v22 > v18)
  {
LABEL_18:
    *(_DWORD *)(v20 + 124) |= 2u;
    return 4294936510;
  }
  result = mdb_page_new(a1, 4, ((*a4 + 15) / *(unsigned int *)(v21 + 16)) + 1, &v35);
  if ((_DWORD)result)
    return result;
  v10 |= 1u;
  v13 = (unsigned __int16)v8[6];
LABEL_19:
  v23 = (v13 - 16) >> 1;
  if (v23 > a2)
  {
    v24 = &v8[v23 + 8];
    v25 = &v8[v23 + 7];
    do
    {
      --v23;
      v26 = *v25--;
      *v24-- = v26;
    }
    while (v23 > a2);
    LOWORD(v13) = v8[6];
  }
  v27 = v8[7] - v22;
  v8[a2 + 8] = v27;
  v8[7] = v27;
  v8[6] = v13 + 2;
  v28 = (char *)v8 + v27;
  if (a3)
    v29 = *(_WORD *)a3;
  else
    v29 = 0;
  *((_WORD *)v28 + 3) = v29;
  *((_WORD *)v28 + 2) = v10;
  if ((v8[5] & 2) != 0)
    a5 = *a4;
  else
    *((_WORD *)v28 + 2) = WORD2(a5);
  *(_DWORD *)v28 = a5;
  if (a3)
    memcpy(v28 + 8, a3[1], (size_t)*a3);
  if ((v8[5] & 2) != 0)
  {
    v30 = &v28[v29 + 8];
    if (v35)
    {
      v31 = v35 + 16;
      *(_QWORD *)v30 = *(_QWORD *)v35;
      if ((v10 & 0x10000) != 0)
      {
        result = 0;
        a4[1] = (size_t)v31;
        return result;
      }
      v33 = *a4;
      v32 = (const void *)a4[1];
      v34 = v31;
    }
    else
    {
      if ((v10 & 1) != 0)
      {
        result = 0;
        *(_QWORD *)v30 = *(_QWORD *)a4[1];
        return result;
      }
      if ((v10 & 0x10000) != 0)
      {
        result = 0;
        a4[1] = (size_t)v30;
        return result;
      }
      v33 = *a4;
      v32 = (const void *)a4[1];
      v34 = &v28[v29 + 8];
    }
    memcpy(v34, v32, v33);
  }
  return 0;
}

uint64_t mdb_xcursor_init1(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  _WORD *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;

  v2 = *(_QWORD *)(result + 16);
  v3 = *(_DWORD *)(v2 + 68) & 0xA0004;
  *(_DWORD *)(v2 + 68) = v3;
  if ((*(_BYTE *)(a2 + 4) & 2) != 0)
  {
    v8 = a2 + *(unsigned __int16 *)(a2 + 6);
    v9 = *(_OWORD *)(v8 + 8);
    v10 = *(_OWORD *)(v8 + 40);
    *(_OWORD *)(v2 + 408) = *(_OWORD *)(v8 + 24);
    *(_OWORD *)(v2 + 424) = v10;
    *(_OWORD *)(v2 + 392) = v9;
    *(_QWORD *)(v2 + 72) = 0;
    *(_DWORD *)(v2 + 64) = 0;
  }
  else
  {
    v4 = a2 + *(unsigned __int16 *)(a2 + 6);
    *(_QWORD *)(v2 + 392) = 0x1000000000000;
    v6 = *(_WORD *)(v4 + 8);
    v5 = (_WORD *)(v4 + 8);
    *(_OWORD *)(v2 + 400) = xmmword_182809F60;
    *(_QWORD *)(v2 + 416) = 0;
    *(_QWORD *)(v2 + 424) = ((unsigned __int16)v5[6] - 16) >> 1;
    *(_WORD *)(v2 + 432) = v6;
    *(_WORD *)(v2 + 434) = v5[1];
    *(_WORD *)(v2 + 436) = v5[2];
    *(_WORD *)(v2 + 438) = v5[3];
    *(_DWORD *)(v2 + 64) = 1;
    *(_DWORD *)(v2 + 68) = v3 | 1;
    *(_QWORD *)(v2 + 72) = v5;
    *(_WORD *)(v2 + 328) = 0;
    v7 = *(_QWORD *)(result + 40);
    if ((*(_BYTE *)(v7 + 4) & 0x10) != 0)
    {
      *(_WORD *)(v2 + 396) = 16;
      *(_DWORD *)(v2 + 392) = (unsigned __int16)v5[4];
      if ((*(_BYTE *)(v7 + 4) & 0x20) != 0)
        *(_WORD *)(v2 + 396) = 24;
    }
  }
  *(_BYTE *)(v2 + 488) = 56;
  if (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 456) == mdb_cmp_int && *(_DWORD *)(v2 + 392) == 8)
    *(_QWORD *)(v2 + 456) = mdb_cmp_cint;
  return result;
}

__n128 mdb_xcursor_init2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int v4;
  __n128 result;
  __int128 v6;

  v3 = *(_QWORD *)(a1 + 16);
  if (a3)
  {
    v4 = *(_DWORD *)(v3 + 68) | 1;
    *(_DWORD *)(v3 + 64) = 1;
    *(_DWORD *)(v3 + 68) = v4;
    *(_WORD *)(v3 + 328) = 0;
    *(_BYTE *)(v3 + 488) = 56;
    *(_QWORD *)(v3 + 456) = *(_QWORD *)(a2 + 456);
  }
  else if ((*(_BYTE *)(v3 + 68) & 1) == 0)
  {
    return result;
  }
  result = *(__n128 *)(a2 + 392);
  v6 = *(_OWORD *)(a2 + 424);
  *(_OWORD *)(v3 + 408) = *(_OWORD *)(a2 + 408);
  *(_OWORD *)(v3 + 424) = v6;
  *(__n128 *)(v3 + 392) = result;
  *(_QWORD *)(v3 + 72) = *(_QWORD *)(a2 + 72);
  return result;
}

uint64_t mdb_cursor_del(uint64_t a1, int a2)
{
  int v2;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 24) + 124);
  if ((v2 & 0x20013) != 0)
  {
    if ((v2 & 0x20000) != 0)
      return 13;
    else
      return 4294936514;
  }
  if ((*(_BYTE *)(a1 + 68) & 1) == 0)
    return 22;
  if (*(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) >= (*(unsigned __int16 *)(*(_QWORD *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72) + 12)
                                                                                - 16) >> 1)
    return 4294936498;
  if ((a2 & 0x8000) != 0 || (result = mdb_page_spill(a1, 0, 0), !(_DWORD)result))
  {
    result = mdb_cursor_touch(a1);
    if (!(_DWORD)result)
    {
      v6 = *(unsigned __int16 *)(a1 + 66);
      v7 = *(_QWORD *)(a1 + 8 * v6 + 72);
      v8 = *(_WORD *)(v7 + 10);
      if ((v8 & 2) == 0)
        return 4294936500;
      if ((v8 & 0x20) != 0)
        return mdb_cursor_del0(a1);
      v9 = v7 + *(unsigned __int16 *)(v7 + 2 * *(unsigned __int16 *)(a1 + 2 * v6 + 328) + 16);
      v10 = *(unsigned __int16 *)(v9 + 4);
      if ((v10 & 4) == 0)
      {
        if (((v10 ^ a2) & 2) != 0)
        {
          result = 4294936512;
LABEL_45:
          *(_DWORD *)(*(_QWORD *)(a1 + 24) + 124) |= 2u;
          return result;
        }
        goto LABEL_41;
      }
      if ((a2 & 0x20) != 0)
      {
        v11 = *(_QWORD *)(a1 + 16);
        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32)
                                                 - *(_QWORD *)(v11 + 424)
                                                 + 1;
        *(_DWORD *)(v11 + 68) &= ~1u;
        if ((v10 & 2) == 0)
          goto LABEL_41;
        goto LABEL_38;
      }
      if ((v10 & 2) == 0)
        *(_QWORD *)(*(_QWORD *)(a1 + 16) + 72) = v9 + *(unsigned __int16 *)(v9 + 6) + 8;
      result = mdb_cursor_del(*(_QWORD *)(a1 + 16), 0x8000);
      if (!(_DWORD)result)
      {
        v11 = *(_QWORD *)(a1 + 16);
        if (*(_QWORD *)(v11 + 424))
        {
          if ((*(_WORD *)(v9 + 4) & 2) != 0)
          {
            v18 = v9 + *(unsigned __int16 *)(v9 + 6);
            v20 = *(_OWORD *)(v11 + 408);
            v19 = *(_OWORD *)(v11 + 424);
            *(_OWORD *)(v18 + 8) = *(_OWORD *)(v11 + 392);
            *(_OWORD *)(v18 + 24) = v20;
            *(_OWORD *)(v18 + 40) = v19;
          }
          else
          {
            mdb_node_shrink((char *)v7, *(unsigned __int16 *)(a1 + 328 + 2 * *(unsigned __int16 *)(a1 + 66)));
            v12 = *(unsigned __int16 *)(a1 + 66);
            v13 = v7 + *(unsigned __int16 *)(v7 + 2 * *(unsigned __int16 *)(a1 + 328 + 2 * v12) + 16);
            *(_QWORD *)(*(_QWORD *)(a1 + 16) + 72) = v13 + *(unsigned __int16 *)(v13 + 6) + 8;
            for (i = *(uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
                  i;
                  i = (uint64_t *)*i)
            {
              if (i != (uint64_t *)a1
                && *((unsigned __int16 *)i + 32) >= *(unsigned __int16 *)(a1 + 64)
                && (*((_BYTE *)i + 68) & 1) != 0
                && i[v12 + 9] == v7)
              {
                v15 = i[2];
                if (v15)
                {
                  if ((*(_BYTE *)(v15 + 68) & 1) != 0)
                  {
                    v16 = *((unsigned __int16 *)i + v12 + 164);
                    if (v16 < (*(unsigned __int16 *)(v7 + 12) - 16) >> 1)
                    {
                      v17 = v7 + *(unsigned __int16 *)(v7 + 2 * v16 + 16);
                      if ((*(_WORD *)(v17 + 4) & 6) == 4)
                        *(_QWORD *)(v15 + 72) = v17 + *(unsigned __int16 *)(v17 + 6) + 8;
                    }
                  }
                }
              }
            }
          }
          result = 0;
          --*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
          return result;
        }
        *(_DWORD *)(v11 + 68) &= ~1u;
        LOWORD(v10) = *(_WORD *)(v9 + 4);
        if ((v10 & 2) == 0)
        {
LABEL_41:
          if ((v10 & 1) != 0)
          {
            v21 = 0;
            result = mdb_page_get(a1, *(_QWORD *)(v9 + *(unsigned __int16 *)(v9 + 6) + 8), (unint64_t *)&v21, 0);
            if ((_DWORD)result)
              goto LABEL_45;
            result = mdb_ovpage_free(a1, v21);
            if ((_DWORD)result)
              goto LABEL_45;
          }
          return mdb_cursor_del0(a1);
        }
LABEL_38:
        result = mdb_drop0(v11, 0);
        if ((_DWORD)result)
          goto LABEL_45;
        LOWORD(v10) = *(_WORD *)(v9 + 4);
        goto LABEL_41;
      }
    }
  }
  return result;
}

char *mdb_node_shrink(char *result, int a2)
{
  char *v2;
  char *v3;
  unsigned __int16 *v4;
  int v5;
  char *v6;
  char *v7;
  _WORD *v8;
  int v9;
  unsigned __int16 v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unint64_t v17;
  char *v18;
  _WORD *v19;
  __int16 v20;
  unsigned int v21;

  v2 = result;
  v3 = &result[2 * a2];
  v5 = *((unsigned __int16 *)v3 + 8);
  v4 = (unsigned __int16 *)(v3 + 16);
  v6 = &result[v5];
  v7 = &v6[*((unsigned __int16 *)v6 + 3)];
  v8 = v7 + 8;
  v9 = *((unsigned __int16 *)v7 + 10);
  v10 = *((_WORD *)v7 + 11) - v9;
  v11 = *(_WORD *)v6 - v10;
  if ((*((_WORD *)v7 + 9) & 0x20) != 0)
  {
    if ((v11 & 1) != 0)
      return result;
    v12 = (unsigned __int16)(*((_WORD *)v7 + 11) - v9);
    v13 = (unsigned __int16)(*(_WORD *)v6 - v10);
  }
  else
  {
    v12 = (unsigned __int16)(*((_WORD *)v7 + 11) - v9);
    if ((v9 - 16) >= 2)
    {
      v14 = ((v9 - 16) >> 1) + 1;
      v13 = 16;
      do
      {
        *(_WORD *)((char *)&v8[(v14 - 2) + 8] + v10) = v8[(v14 - 2) + 8] - v10;
        --v14;
      }
      while (v14 > 1);
    }
    else
    {
      v13 = 16;
    }
  }
  v8[7] = v9;
  *(_QWORD *)v8 = *(_QWORD *)result;
  *(_WORD *)v6 = v11;
  *((_WORD *)v6 + 1) = 0;
  result = (char *)memmove(&result[*((unsigned __int16 *)result + 7) + v12], &result[*((unsigned __int16 *)result + 7)], (char *)v8 + v13 - &result[*((unsigned __int16 *)result + 7)]);
  v15 = *((unsigned __int16 *)v2 + 6) - 16;
  if (v15 >= 2)
  {
    v16 = *v4;
    v17 = (v15 >> 1) + 1;
    do
    {
      v18 = &v2[2 * (v17 - 2)];
      v21 = *((unsigned __int16 *)v18 + 8);
      v19 = v18 + 16;
      v20 = v21;
      if (v21 <= v16)
        *v19 = v20 + v10;
      --v17;
    }
    while (v17 > 1);
  }
  *((_WORD *)v2 + 7) += v10;
  return result;
}

uint64_t mdb_drop0(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  _WORD *v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int16 v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  unsigned __int16 *v22;
  unsigned int v23;
  unint64_t v24;
  uint64_t v25;
  int v26;
  __int16 v27;
  unsigned __int16 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t **v32;
  unint64_t v33;
  _OWORD v34[5];
  _OWORD v35[19];
  uint64_t v36;

  LODWORD(result) = mdb_page_search(a1, 0, 4);
  if ((_DWORD)result)
  {
    if ((_DWORD)result == -30798)
      result = 0;
    else
      result = result;
    goto LABEL_61;
  }
  v5 = *(_QWORD *)(a1 + 24);
  v36 = 0;
  memset(v35, 0, sizeof(v35));
  memset(v34, 0, sizeof(v34));
  v6 = *(_DWORD *)(a1 + 68);
  if (((v6 & 4) != 0 || !a2 && !*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24)) && *(_WORD *)(a1 + 64))
  {
    v7 = *(_WORD *)(a1 + 64) - 1;
    *(_WORD *)(a1 + 64) = v7;
    if (v7)
      --*(_WORD *)(a1 + 66);
    else
      *(_DWORD *)(a1 + 68) = v6 & 0xFFFFFFFE;
  }
  mdb_cursor_copy(a1, (uint64_t)v34);
  if (!*(_WORD *)(a1 + 64))
    goto LABEL_58;
  v31 = v5;
  v32 = (uint64_t **)(v5 + 40);
  v8 = a1 + 330;
  while (1)
  {
    v9 = *(_WORD **)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
    v10 = (unsigned __int16)v9[6] - 16;
    v11 = v10 >> 1;
    if ((v9[5] & 2) != 0)
    {
      if (v10 >= 2)
      {
        v13 = 0;
        if (v11 <= 1)
          v12 = 1;
        else
          v12 = v11;
        do
        {
          v14 = (uint64_t)v9 + (unsigned __int16)v9[v13 + 8];
          v15 = *(_WORD *)(v14 + 4);
          if ((v15 & 1) != 0)
          {
            v33 = 0;
            v16 = *(_QWORD *)(v14 + *(unsigned __int16 *)(v14 + 6) + 8);
            result = mdb_page_get(a1, v16, &v33, 0);
            if ((_DWORD)result
              || (v17 = v33, result = mdb_midl_append_range(v32, v16, *(_DWORD *)(v33 + 12)), (_DWORD)result))
            {
LABEL_55:
              v5 = v31;
              goto LABEL_60;
            }
            v18 = *(_QWORD *)(a1 + 40);
            v19 = *(_QWORD *)(v18 + 24) - *(unsigned int *)(v17 + 12);
            *(_QWORD *)(v18 + 24) = v19;
            if (!a2 && !v19)
            {
              v5 = v31;
              goto LABEL_47;
            }
          }
          else if (a2)
          {
            if ((v15 & 2) != 0)
            {
              mdb_xcursor_init1(a1, v14);
              result = mdb_drop0(*(_QWORD *)(a1 + 16), 0);
              if ((_DWORD)result)
                goto LABEL_55;
            }
          }
          ++v13;
        }
        while (v12 != v13);
        v5 = v31;
        if (a2)
          goto LABEL_42;
LABEL_35:
        if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24))
          goto LABEL_47;
        goto LABEL_42;
      }
      LOWORD(v12) = 0;
      if (!a2)
        goto LABEL_35;
    }
    else
    {
      result = mdb_midl_need((_DWORD **)v32, v10 >> 1);
      if ((_DWORD)result)
        goto LABEL_60;
      if (v10 >= 2)
      {
        v20 = *v32;
        v21 = v11 <= 1 ? 1 : v11;
        LOWORD(v12) = v21;
        v22 = v9 + 8;
        do
        {
          v23 = *v22++;
          v24 = *(unsigned int *)((char *)v9 + v23) | ((unint64_t)*(unsigned __int16 *)((char *)v9 + v23 + 4) << 32);
          v25 = *v20 + 1;
          *v20 = v25;
          v20[v25] = v24;
          --v21;
        }
        while (v21);
      }
      else
      {
        LOWORD(v12) = 0;
      }
    }
LABEL_42:
    if (!*(_WORD *)(a1 + 66))
      goto LABEL_58;
    *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v12;
    result = mdb_cursor_sibling(a1, 1);
    if ((_DWORD)result != -30798)
    {
      if ((_DWORD)result)
        goto LABEL_59;
      v26 = *(unsigned __int16 *)(a1 + 64);
      goto LABEL_53;
    }
LABEL_47:
    v27 = *(_WORD *)(a1 + 64);
    if (!v27)
      goto LABEL_57;
    v28 = v27 - 1;
    *(_WORD *)(a1 + 64) = v27 - 1;
    if (v27 == 1)
      break;
    --*(_WORD *)(a1 + 66);
    *(_WORD *)(a1 + 328) = 0;
    v26 = (unsigned __int16)(v27 - 1);
    if (v28 != 1)
    {
      v29 = 0;
      v30 = v28 - 1;
      do
      {
        *(_WORD *)(v8 + 2 * v29) = 0;
        *(_QWORD *)(v8 + 8 * v29 - 250) = *((_QWORD *)v35 + v29);
        ++v29;
      }
      while (v30 != v29);
      v26 = 1;
    }
LABEL_53:
    if (!v26)
      goto LABEL_58;
  }
  *(_DWORD *)(a1 + 68) &= ~1u;
LABEL_57:
  *(_WORD *)(a1 + 328) = 0;
LABEL_58:
  result = mdb_midl_append((unint64_t **)(v5 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
LABEL_59:
  if ((_DWORD)result)
LABEL_60:
    *(_DWORD *)(v5 + 124) |= 2u;
LABEL_61:
  *(_DWORD *)(a1 + 68) &= ~1u;
  return result;
}

uint64_t mdb_cursor_del0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t *i;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  _DWORD *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  __int16 v27;
  int v28;

  v2 = *(unsigned int *)(a1 + 32);
  v3 = *(unsigned __int16 *)(a1 + 66);
  v4 = *(unsigned __int16 *)(a1 + 2 * v3 + 328);
  v5 = *(_QWORD *)(a1 + 8 * v3 + 72);
  mdb_node_del((_QWORD *)a1, **(_DWORD **)(a1 + 40));
  --*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
  for (i = *(uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 104) + 8 * v2); i; i = (uint64_t *)*i)
  {
    v7 = i;
    if ((*(_BYTE *)(a1 + 68) & 4) != 0)
      v7 = (uint64_t *)i[2];
    if (v7 != (uint64_t *)a1)
    {
      v8 = *((_DWORD *)v7 + 17);
      if ((*((_DWORD *)i + 17) & v8 & 1) != 0
        && *((unsigned __int16 *)v7 + 32) >= *(unsigned __int16 *)(a1 + 64))
      {
        v9 = *(unsigned __int16 *)(a1 + 66);
        if (v7[v9 + 9] == v5)
        {
          v10 = (uint64_t)v7 + 2 * v9;
          v11 = *(unsigned __int16 *)(v10 + 328);
          if (v11 == v4)
          {
            *((_DWORD *)v7 + 17) = v8 | 8;
            if ((*(_WORD *)(*(_QWORD *)(a1 + 40) + 4) & 4) != 0)
              *(_DWORD *)(v7[2] + 68) &= 0xFFFFFFFC;
          }
          else
          {
            if (v11 > v4)
              *(_WORD *)(v10 + 328) = v11 - 1;
            v12 = v7[2];
            if (v12)
            {
              if ((*(_BYTE *)(v12 + 68) & 1) != 0)
              {
                v13 = *((unsigned __int16 *)v7 + *(unsigned __int16 *)(a1 + 66) + 164);
                if (v13 < (*(unsigned __int16 *)(v5 + 12) - 16) >> 1)
                {
                  v14 = v5 + *(unsigned __int16 *)(v5 + 2 * v13 + 16);
                  if ((*(_WORD *)(v14 + 4) & 6) == 4)
                    *(_QWORD *)(v12 + 72) = v14 + *(unsigned __int16 *)(v14 + 6) + 8;
                }
              }
            }
          }
        }
      }
    }
  }
  result = mdb_rebalance(a1);
  if (!(_DWORD)result)
  {
    if (!*(_WORD *)(a1 + 64))
    {
      result = 0;
      v16 = (_DWORD *)(a1 + 68);
      goto LABEL_22;
    }
    v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 104) + 8 * v2);
    if (!v18)
    {
LABEL_47:
      result = 0;
      v16 = (_DWORD *)(a1 + 68);
      v17 = 8;
      goto LABEL_48;
    }
    v19 = *(_QWORD *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
    v20 = (*(unsigned __int16 *)(v19 + 12) - 16) >> 1;
    while (1)
    {
      v21 = v18;
      if ((*(_BYTE *)(a1 + 68) & 4) != 0)
        v21 = *(_QWORD *)(v18 + 16);
      v22 = (_BYTE *)(v21 + 68);
      if ((*(_DWORD *)(v18 + 68) & *(_DWORD *)(v21 + 68) & 1) == 0)
        goto LABEL_46;
      if (*(unsigned __int16 *)(v21 + 64) < *(unsigned __int16 *)(a1 + 64))
        goto LABEL_46;
      v23 = *(unsigned __int16 *)(a1 + 66);
      if (*(_QWORD *)(v21 + 8 * v23 + 72) != v19)
        goto LABEL_46;
      v24 = *(unsigned __int16 *)(v21 + 2 * v23 + 328);
      if (v24 < *(unsigned __int16 *)(a1 + 2 * v23 + 328))
        goto LABEL_46;
      if (v20 <= v24)
      {
        result = mdb_cursor_sibling(v21, 1);
        if ((_DWORD)result == -30798)
        {
          v28 = 2;
          goto LABEL_45;
        }
        if ((_DWORD)result)
          break;
      }
      v25 = *(_QWORD *)(v21 + 16);
      if (!v25 || (*v22 & 2) != 0)
        goto LABEL_46;
      v26 = *(_QWORD *)(v21 + 8 * *(unsigned __int16 *)(v21 + 66) + 72)
          + *(unsigned __int16 *)(*(_QWORD *)(v21 + 8 * *(unsigned __int16 *)(v21 + 66) + 72)
                                + 2 * *(unsigned __int16 *)(v21 + 2 * *(unsigned __int16 *)(v21 + 66) + 328)
                                + 16);
      v27 = *(_WORD *)(v26 + 4);
      if ((v27 & 4) != 0)
      {
        if ((*(_BYTE *)(v25 + 68) & 1) != 0)
        {
          if ((v27 & 2) == 0)
            *(_QWORD *)(v25 + 72) = v26 + *(unsigned __int16 *)(v26 + 6) + 8;
        }
        else
        {
          mdb_xcursor_init1(v21, v26);
          result = mdb_cursor_first(*(_QWORD *)(v21 + 16), 0, 0);
          if ((_DWORD)result)
            break;
        }
      }
      v22 = (_BYTE *)(*(_QWORD *)(v21 + 16) + 68);
      v28 = 8;
LABEL_45:
      *(_DWORD *)v22 |= v28;
LABEL_46:
      v18 = *(_QWORD *)v18;
      if (!v18)
        goto LABEL_47;
    }
  }
  v16 = (_DWORD *)(*(_QWORD *)(a1 + 24) + 124);
LABEL_22:
  v17 = 2;
LABEL_48:
  *v16 |= v17;
  return result;
}

uint64_t mdb_cursor_open(uint64_t a1, unsigned int a2, _QWORD *a3)
{
  uint64_t result;
  int v7;
  size_t v8;
  _DWORD *v9;
  _DWORD *v10;
  uint64_t v11;

  result = 22;
  if (a1 && a3 && *(_DWORD *)(a1 + 120) > a2 && (*(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) & 8) != 0)
  {
    v7 = *(_DWORD *)(a1 + 124);
    if ((v7 & 0x13) != 0)
    {
      return 4294936514;
    }
    else if (v7 & 0x20000 | a2)
    {
      if ((*(_WORD *)(*(_QWORD *)(a1 + 88) + 48 * a2 + 4) & 4) != 0)
        v8 = 888;
      else
        v8 = 392;
      v9 = malloc_type_malloc(v8, 0xBC8215E7uLL);
      if (v9)
      {
        v10 = v9;
        mdb_cursor_init((uint64_t)v9, a1, a2, (uint64_t)(v9 + 98));
        v11 = *(_QWORD *)(a1 + 104);
        if (v11)
        {
          *(_QWORD *)v10 = *(_QWORD *)(v11 + 8 * a2);
          *(_QWORD *)(v11 + 8 * a2) = v10;
          v10[17] |= 0x40u;
        }
        result = 0;
        *a3 = v10;
      }
      else
      {
        return 12;
      }
    }
  }
  return result;
}

uint64_t mdb_cursor_renew(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  result = 22;
  if (a1 && a2)
  {
    v4 = *(unsigned int *)(a2 + 32);
    if (v4 >= *(_DWORD *)(a1 + 120)
      || (*(_BYTE *)(*(_QWORD *)(a1 + 112) + v4) & 8) == 0
      || (*(_BYTE *)(a2 + 68) & 0x40) != 0
      || *(_QWORD *)(a1 + 104))
    {
      return 22;
    }
    else if ((*(_BYTE *)(a1 + 124) & 0x13) != 0)
    {
      return 4294936514;
    }
    else
    {
      mdb_cursor_init(a2, a1, v4, *(_QWORD *)(a2 + 16));
      return 0;
    }
  }
  return result;
}

uint64_t mdb_cursor_count(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;

  v2 = 22;
  if (a1 && a2)
  {
    v3 = *(_QWORD *)(a1 + 16);
    if (!v3)
      return 4294936512;
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 24) + 124) & 0x13) != 0)
      return 4294936514;
    v4 = *(_DWORD *)(a1 + 68);
    if ((v4 & 1) == 0)
      return 22;
    if (*(_WORD *)(a1 + 64))
    {
      v5 = *(unsigned __int16 *)(a1 + 66);
      if ((v4 & 2) == 0)
      {
        v6 = *(_QWORD *)(a1 + 8 * v5 + 72);
        v7 = *(unsigned __int16 *)(a1 + 2 * v5 + 328);
        goto LABEL_14;
      }
      v7 = *(unsigned __int16 *)(a1 + 2 * v5 + 328);
      v6 = *(_QWORD *)(a1 + 8 * v5 + 72);
      if (v7 < (*(unsigned __int16 *)(v6 + 12) - 16) >> 1)
      {
        *(_DWORD *)(a1 + 68) = v4 ^ 2;
LABEL_14:
        if ((*(_WORD *)(v6 + *(unsigned __int16 *)(v6 + 2 * v7 + 16) + 4) & 4) != 0)
        {
          if ((*(_BYTE *)(v3 + 68) & 1) == 0)
            return 22;
          v8 = *(_QWORD *)(v3 + 424);
        }
        else
        {
          v8 = 1;
        }
        v2 = 0;
        *a2 = v8;
        return v2;
      }
    }
    return 4294936498;
  }
  return v2;
}

void mdb_cursor_close(void *a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  BOOL v4;

  if (a1 && !*((_QWORD *)a1 + 1))
  {
    if ((*((_BYTE *)a1 + 68) & 0x40) != 0)
    {
      v1 = *(_QWORD *)(*((_QWORD *)a1 + 3) + 104);
      if (v1)
      {
        v2 = (_QWORD *)(v1 + 8 * *((unsigned int *)a1 + 8));
        do
        {
          v3 = v2;
          v2 = (_QWORD *)*v2;
          if (v2)
            v4 = v2 == a1;
          else
            v4 = 1;
        }
        while (!v4);
        if (v2 == a1)
          *v3 = *(_QWORD *)a1;
      }
    }
    free(a1);
  }
}

uint64_t mdb_cursor_dbi(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t mdb_del(uint64_t a1, unsigned int a2, _QWORD *a3, __int128 *a4)
{
  uint64_t v4;
  int v6;

  v4 = 22;
  if (!a1 || !a3)
    return v4;
  if (*(_DWORD *)(a1 + 120) <= a2 || (*(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) & 0x10) == 0)
    return 22;
  v6 = *(_DWORD *)(a1 + 124);
  if ((v6 & 0x20013) != 0)
  {
    if ((v6 & 0x20000) != 0)
      return 13;
    else
      return 4294936514;
  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 88) + 48 * a2 + 4) & 4) == 0)
    a4 = 0;
  return mdb_del0(a1, a2, a3, a4, 0);
}

uint64_t mdb_del0(uint64_t a1, unsigned int a2, _QWORD *a3, __int128 *a4, int a5)
{
  __int128 *v10;
  int v11;
  uint64_t result;
  uint64_t v13;
  int v14;
  __int128 v15;
  _OWORD v16[31];
  _QWORD v17[50];

  memset(v17, 0, 392);
  memset(v16, 0, sizeof(v16));
  v15 = 0uLL;
  v14 = 0;
  mdb_cursor_init((uint64_t)v17, a1, a2, (uint64_t)v16);
  if (a4)
  {
    v15 = *a4;
    v10 = &v15;
    v11 = 2;
  }
  else
  {
    v10 = 0;
    a5 |= 0x20u;
    v11 = 15;
  }
  result = mdb_cursor_set((uint64_t)v17, a3, v10, v11, &v14);
  if (!(_DWORD)result)
  {
    v13 = *(_QWORD *)(a1 + 104);
    v17[0] = *(_QWORD *)(v13 + 8 * a2);
    *(_QWORD *)(v13 + 8 * a2) = v17;
    result = mdb_cursor_del((uint64_t)v17, a5);
    *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8 * a2) = v17[0];
  }
  return result;
}

uint64_t mdb_put(uint64_t a1, unsigned int a2, size_t *a3, uint64_t a4, int a5)
{
  uint64_t result;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD v13[31];
  _OWORD v14[24];
  uint64_t v15;

  result = 22;
  if (a1)
  {
    if (a3)
    {
      if (a4)
      {
        if (*(_DWORD *)(a1 + 120) > a2)
        {
          v15 = 0;
          memset(v14, 0, sizeof(v14));
          memset(v13, 0, sizeof(v13));
          if ((a5 & 0xFFF8FFCF) == 0 && (*(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) & 0x10) != 0)
          {
            v10 = *(_DWORD *)(a1 + 124);
            if ((v10 & 0x20013) != 0)
            {
              if ((v10 & 0x20000) != 0)
                return 13;
              else
                return 4294936514;
            }
            else
            {
              v11 = a2;
              mdb_cursor_init((uint64_t)v14, a1, a2, (uint64_t)v13);
              v12 = *(_QWORD *)(a1 + 104);
              *(_QWORD *)&v14[0] = *(_QWORD *)(v12 + 8 * v11);
              *(_QWORD *)(v12 + 8 * v11) = v14;
              result = mdb_cursor_put((uint64_t)v14, a3, a4, a5);
              *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8 * v11) = *(_QWORD *)&v14[0];
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t mdb_dbi_open(uint64_t a1, char *__s, int a3, unsigned int *a4)
{
  uint64_t v4;
  size_t v10;
  uint64_t v11;
  unsigned int v12;
  const char **v13;
  uint64_t i;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char v23;
  size_t *v24;
  uint64_t v25;
  _OWORD *v26;
  __int128 v27;
  __int128 v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  int v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _OWORD v67[20];
  uint64_t v68;
  uint64_t v69;
  __int128 *v70;
  size_t v71[3];

  if ((a3 & 0xFFFBFF81) != 0)
    return 22;
  if ((*(_BYTE *)(a1 + 124) & 0x13) != 0)
    return 4294936514;
  v68 = 0;
  memset(v67, 0, sizeof(v67));
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  if (!__s)
  {
    *a4 = 1;
    if ((a3 & 0x7FFF) != 0)
    {
      v17 = *(_QWORD *)(a1 + 88);
      v18 = *(unsigned __int16 *)(v17 + 52);
      v19 = a3 & 0x7FFF | v18;
      if (v19 != v18)
      {
        *(_WORD *)(v17 + 52) = v19;
        *(_DWORD *)(a1 + 124) |= 4u;
      }
    }
    mdb_default_cmp(a1, 1u);
    return 0;
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 80) + 64))
    mdb_default_cmp(a1, 1u);
  v69 = 0;
  v70 = 0;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v10 = strlen(__s);
  v11 = *(unsigned int *)(a1 + 120);
  if (v11 < 3)
    goto LABEL_20;
  v12 = 0;
  v13 = (const char **)(*(_QWORD *)(a1 + 80) + 104);
  for (i = 2; i != v11; ++i)
  {
    v15 = (uint64_t)*(v13 - 1);
    if (v15)
    {
      if (v10 == v15 && !strncmp(__s, *v13, v10))
      {
        v4 = 0;
        *a4 = i;
        return v4;
      }
    }
    else if (!v12)
    {
      v12 = i;
    }
    v13 += 6;
  }
  if (v12)
  {
    v16 = 0;
  }
  else
  {
LABEL_20:
    if (v11 >= *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36))
      return 4294936505;
    v12 = 0;
    v16 = 1;
  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 88) + 52) & 0xC) == 0)
  {
    v59 = 0;
    v71[0] = v10;
    v71[1] = (size_t)__s;
    mdb_cursor_init((uint64_t)&v63, a1, 1u, 0);
    v20 = mdb_cursor_set((uint64_t)&v63, v71, &v69, 15, &v59);
    if ((_DWORD)v20 == -30798)
    {
      if ((a3 & 0x40000) == 0)
        return 4294936498;
      if ((*(_BYTE *)(a1 + 126) & 2) != 0)
        return 13;
      v29 = strdup(__s);
      if (v29)
      {
        v22 = v29;
        v69 = 48;
        v70 = &v60;
        v60 = 0u;
        v61 = 0u;
        *(_QWORD *)&v62 = 0;
        *((_QWORD *)&v62 + 1) = -1;
        WORD2(v60) = a3 & 0x7FFF;
        v58 = 0;
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v30 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 104);
        v31 = v65;
        v32 = &v63;
        if ((BYTE4(v67[0]) & 4) != 0)
        {
          DWORD1(v38) = 1;
          *(_QWORD *)&v35 = &v63;
          v32 = &v34;
        }
        *(_QWORD *)v32 = *(_QWORD *)(v30 + 8 * v65);
        *(_QWORD *)(v30 + 8 * v31) = v32;
        v33 = mdb_cursor_put((uint64_t)&v63, v71, (uint64_t)&v69, 2);
        *(_QWORD *)(v30 + 8 * v31) = *(_QWORD *)v32;
        if ((_DWORD)v33)
        {
          v4 = v33;
          free(v22);
          return v4;
        }
        v23 = 29;
        if (!v16)
        {
LABEL_38:
          v24 = (size_t *)(*(_QWORD *)(a1 + 80) + 48 * v12);
          *v24 = v10;
          v24[1] = (size_t)v22;
          v24[4] = 0;
          *(_BYTE *)(*(_QWORD *)(a1 + 112) + v12) = v23;
          v25 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152);
          LODWORD(v24) = *(_DWORD *)(v25 + 4 * v12) + 1;
          *(_DWORD *)(v25 + 4 * v12) = (_DWORD)v24;
          *(_DWORD *)(*(_QWORD *)(a1 + 96) + 4 * v12) = (_DWORD)v24;
          v26 = (_OWORD *)(*(_QWORD *)(a1 + 88) + 48 * v12);
          v27 = *v70;
          v28 = v70[2];
          v26[1] = v70[1];
          v26[2] = v28;
          *v26 = v27;
          *a4 = v12;
          mdb_default_cmp(a1, v12);
          if (v16)
          {
            v4 = 0;
            ++*(_DWORD *)(a1 + 120);
            return v4;
          }
          return 0;
        }
LABEL_37:
        v12 = *(_DWORD *)(a1 + 120);
        goto LABEL_38;
      }
    }
    else
    {
      v4 = v20;
      if ((_DWORD)v20)
        return v4;
      if ((*(_WORD *)(*((_QWORD *)v67 + WORD1(v67[0]) + 1)
                     + *(unsigned __int16 *)(*((_QWORD *)v67 + WORD1(v67[0]) + 1)
                                           + 2 * *((unsigned __int16 *)&v67[16] + WORD1(v67[0]) + 4)
                                           + 16)
                     + 4) & 6) != 2)
        return 4294936512;
      v21 = strdup(__s);
      if (v21)
      {
        v22 = v21;
        v23 = 28;
        if (!v16)
          goto LABEL_38;
        goto LABEL_37;
      }
    }
    return 12;
  }
  if ((a3 & 0x40000) != 0)
    return 4294936512;
  else
    return 4294936498;
}

uint64_t mdb_default_cmp(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  void *v3;
  __int16 v4;
  void *v5;
  uint64_t (*v6)(_QWORD *, _QWORD *);

  v2 = *(_QWORD *)(result + 80);
  v3 = mdb_cmp_cint;
  v4 = *(_WORD *)(*(_QWORD *)(result + 88) + 48 * a2 + 4);
  if ((v4 & 8) != 0)
    v5 = mdb_cmp_cint;
  else
    v5 = mdb_cmp_memn;
  if ((v4 & 2) != 0)
    v5 = mdb_cmp_memnr;
  *(_QWORD *)(v2 + 48 * a2 + 16) = v5;
  if ((v4 & 0x40) != 0)
    v6 = mdb_cmp_memnr;
  else
    v6 = mdb_cmp_memn;
  if ((v4 & 0x10) != 0)
    v3 = mdb_cmp_int;
  if ((v4 & 0x20) != 0)
    v6 = (uint64_t (*)(_QWORD *, _QWORD *))v3;
  if ((v4 & 4) == 0)
    v6 = 0;
  *(_QWORD *)(v2 + 48 * a2 + 24) = v6;
  return result;
}

void mdb_dbi_close(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;

  if (a2 >= 2 && *(_DWORD *)(a1 + 36) > a2)
  {
    v2 = *(_QWORD *)(a1 + 136);
    v3 = *(void **)(v2 + 48 * a2 + 8);
    if (v3)
    {
      v4 = (_QWORD *)(v2 + 48 * a2);
      *v4 = 0;
      v4[1] = 0;
      v5 = *(_QWORD *)(a1 + 152);
      *(_WORD *)(*(_QWORD *)(a1 + 144) + 2 * a2) = 0;
      ++*(_DWORD *)(v5 + 4 * a2);
      free(v3);
    }
  }
}

uint64_t mdb_dbi_flags(uint64_t a1, unsigned int a2, int *a3)
{
  uint64_t result;

  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) & 0x10) == 0)
    return 22;
  result = 0;
  *a3 = *(_WORD *)(*(_QWORD *)(a1 + 88) + 48 * a2 + 4) & 0x7FFF;
  return result;
}

uint64_t mdb_drop(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t *i;
  int v9;
  uint64_t v10;
  _QWORD *v12;

  v3 = 22;
  if (a1)
  {
    if (a3 <= 1 && *(_DWORD *)(a1 + 120) > a2)
    {
      v12 = 0;
      if ((*(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) & 0x10) != 0)
      {
        if ((*(_BYTE *)(a1 + 126) & 2) != 0)
        {
          return 13;
        }
        else if (*(_DWORD *)(*(_QWORD *)(a1 + 96) + 4 * a2) == *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 152)
                                                                            + 4 * a2))
        {
          v3 = mdb_cursor_open(a1, a2, &v12);
          if (!(_DWORD)v3)
          {
            v7 = mdb_drop0((uint64_t)v12, *(_WORD *)(v12[5] + 4) & 4);
            v3 = v7;
            for (i = *(uint64_t **)(*(_QWORD *)(a1 + 104) + 8 * a2); i; i = (uint64_t *)*i)
              *((_DWORD *)i + 17) &= 0xFFFFFFFC;
            if ((_DWORD)v7)
              goto LABEL_20;
            if (a2 >= 2 && a3)
            {
              v3 = mdb_del0(a1, 1u, (_QWORD *)v12[6], 0, 2);
              if (!(_DWORD)v3)
              {
                *(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) = 2;
                mdb_dbi_close(*(_QWORD *)(a1 + 32), a2);
                goto LABEL_20;
              }
              v9 = *(_DWORD *)(a1 + 124) | 2;
            }
            else
            {
              v3 = 0;
              *(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) |= 1u;
              v10 = *(_QWORD *)(a1 + 88) + 48 * a2;
              *(_WORD *)(v10 + 38) = 0;
              *(_OWORD *)(v10 + 22) = 0u;
              *(_OWORD *)(v10 + 6) = 0u;
              *(_QWORD *)(v10 + 40) = -1;
              v9 = *(_DWORD *)(a1 + 124) | 4;
            }
            *(_DWORD *)(a1 + 124) = v9;
LABEL_20:
            mdb_cursor_close(v12);
          }
        }
        else
        {
          return 4294936516;
        }
      }
    }
  }
  return v3;
}

uint64_t mdb_set_compare(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t result;

  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) & 0x10) == 0)
    return 22;
  result = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 80) + 48 * a2 + 16) = a3;
  return result;
}

uint64_t mdb_set_dupsort(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t result;

  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) & 0x10) == 0)
    return 22;
  result = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 80) + 48 * a2 + 24) = a3;
  return result;
}

uint64_t mdb_set_relfunc(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t result;

  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) & 0x10) == 0)
    return 22;
  result = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 80) + 48 * a2 + 32) = a3;
  return result;
}

uint64_t mdb_set_relctx(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t result;

  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) & 0x10) == 0)
    return 22;
  result = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 80) + 48 * a2 + 40) = a3;
  return result;
}

uint64_t mdb_reader_pid(uint64_t a1, int a2, int a3)
{
  uint64_t v5;
  int i;
  uint64_t result;
  int v9;
  uint64_t v10;
  __int128 v11;

  v5 = a3;
  v10 = a3;
  v11 = xmmword_18281A700;
  WORD6(v11) = 3;
  for (i = fcntl(*(_DWORD *)(a1 + 4), a2, &v10); i; i = fcntl(*(_DWORD *)(a1 + 4), a2, &v10))
  {
    result = *__error();
    if ((_DWORD)result != 4)
      return result;
    v10 = v5;
    v11 = xmmword_18281A700;
    WORD6(v11) = 3;
  }
  v9 = a2 == 7 && WORD6(v11) != 2;
  return (v9 << 31 >> 31);
}

void mdb_dpage_free(uint64_t a1, _QWORD *a2)
{
  if ((*((_WORD *)a2 + 5) & 4) != 0 && *((_DWORD *)a2 + 3) != 1)
  {
    free(a2);
  }
  else
  {
    *a2 = *(_QWORD *)(a1 + 192);
    *(_QWORD *)(a1 + 192) = a2;
  }
}

uint64_t mdb_page_search(uint64_t a1, _QWORD *a2, char a3)
{
  uint64_t v4;
  uint64_t result;
  unint64_t v8;
  _QWORD *v9;
  char *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  int v14;
  uint64_t v15;
  __int128 *v16;
  _OWORD v17[24];
  uint64_t v18;

  v4 = *(_QWORD *)(a1 + 24);
  if ((*(_BYTE *)(v4 + 124) & 0x13) != 0)
    return 4294936514;
  if ((**(_BYTE **)(a1 + 56) & 2) == 0)
    goto LABEL_5;
  v18 = 0;
  memset(v17, 0, sizeof(v17));
  if (*(_DWORD *)(*(_QWORD *)(v4 + 96) + 4 * *(unsigned int *)(a1 + 32)) != *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 32) + 152)
                                                                                         + 4
                                                                                         * *(unsigned int *)(a1 + 32)))
    return 4294936516;
  mdb_cursor_init((uint64_t)v17, v4, 1u, 0);
  result = mdb_page_search(v17, *(_QWORD *)(a1 + 48), 0);
  if (!(_DWORD)result)
  {
    v15 = 0;
    v16 = 0;
    v14 = 0;
    v10 = mdb_node_search((uint64_t)v17, *(_QWORD **)(a1 + 48), &v14);
    if (!v14)
      return 4294936498;
    if ((*((_WORD *)v10 + 2) & 6) != 2)
      return 4294936512;
    result = mdb_node_read((uint64_t)v17, (unsigned int *)v10, &v15);
    if ((_DWORD)result)
      return result;
    v11 = *(_QWORD *)(a1 + 40);
    if ((*(_WORD *)(v11 + 4) & 0x7FFF) != *((_WORD *)v16 + 2))
      return 4294936512;
    v12 = *v16;
    v13 = v16[2];
    *(_OWORD *)(v11 + 16) = v16[1];
    *(_OWORD *)(v11 + 32) = v13;
    *(_OWORD *)v11 = v12;
    **(_BYTE **)(a1 + 56) &= ~2u;
LABEL_5:
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
    if (v8 != -1)
    {
      v9 = *(_QWORD **)(a1 + 72);
      if (v9 && *v9 == v8 || (result = mdb_page_get(a1, v8, (unint64_t *)(a1 + 72), 0), !(_DWORD)result))
      {
        *(_DWORD *)(a1 + 64) = 1;
        if ((a3 & 1) == 0 || (result = mdb_page_touch(a1), !(_DWORD)result))
        {
          if ((a3 & 2) != 0)
            return 0;
          else
            return mdb_page_search_root(a1, a2, a3);
        }
      }
      return result;
    }
    return 4294936498;
  }
  return result;
}

char *mdb_node_search(uint64_t a1, _QWORD *a2, int *a3)
{
  unsigned __int16 *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  uint64_t (*v11)(_QWORD *, uint64_t);
  int *v12;
  uint64_t v13;
  char *v14;
  int v15;
  int v16;
  int *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v5 = *(unsigned __int16 **)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
  v20 = 0;
  v21 = 0;
  v6 = v5[6] - 16;
  v7 = v6 >> 1;
  v8 = v5[5];
  v9 = ((v8 >> 1) & 1) == 0;
  v10 = (v6 >> 1) - 1;
  v11 = *(uint64_t (**)(_QWORD *, uint64_t))(*(_QWORD *)(a1 + 48) + 16);
  if (v11 == mdb_cmp_cint)
  {
    if ((v8 & 1) != 0)
    {
      if (*(unsigned __int16 *)((char *)v5 + v5[9] + 6) == 8)
        v11 = (uint64_t (*)(_QWORD *, uint64_t))mdb_cmp_long;
      else
        v11 = (uint64_t (*)(_QWORD *, uint64_t))mdb_cmp_int;
      if ((v8 & 0x20) == 0)
        goto LABEL_3;
    }
    else
    {
      v11 = mdb_cmp_cint;
      if ((v8 & 0x20) == 0)
        goto LABEL_3;
    }
  }
  else if ((v8 & 0x20) == 0)
  {
LABEL_3:
    if (v9 < v7)
    {
      v19 = v5[6] - 16;
      v12 = a3;
      while (1)
      {
        LODWORD(v13) = (int)(v10 + v9) >> 1;
        v14 = (char *)v5 + v5[v13 + 8];
        v20 = *((unsigned __int16 *)v14 + 3);
        v21 = (uint64_t)(v14 + 8);
        v15 = v11(a2, (uint64_t)&v20);
        if (!v15)
          break;
        if (v15 <= 0)
          v10 = v13 - 1;
        else
          v9 = v13 + 1;
        if ((int)v9 > v10)
        {
          a3 = v12;
          goto LABEL_27;
        }
      }
      v16 = 1;
      a3 = v12;
LABEL_43:
      v6 = v19;
      if (!a3)
        goto LABEL_36;
LABEL_33:
      if (v6 <= 1)
        v16 = 0;
      *a3 = v16;
      goto LABEL_36;
    }
    LODWORD(v13) = 0;
    v14 = 0;
LABEL_32:
    v16 = 1;
    if (!a3)
      goto LABEL_36;
    goto LABEL_33;
  }
  v20 = **(unsigned int **)(a1 + 40);
  v14 = (char *)v5 + v5[8];
  if (v9 >= v7)
  {
    LODWORD(v13) = 0;
    goto LABEL_32;
  }
  v19 = v6;
  v18 = a3;
  do
  {
    v13 = ((int)(v10 + v9) >> 1);
    v21 = (uint64_t)v5 + v20 * v13 + 16;
    v15 = v11(a2, (uint64_t)&v20);
    if (!v15)
    {
      v16 = 1;
      a3 = v18;
      goto LABEL_43;
    }
    if (v15 <= 0)
      v10 = v13 - 1;
    else
      v9 = v13 + 1;
  }
  while ((int)v9 <= v10);
  a3 = v18;
LABEL_27:
  v6 = v19;
  if (v15 < 1 || (LODWORD(v13) = v13 + 1, (v5[5] & 0x20) != 0))
  {
    v16 = 0;
    if (a3)
      goto LABEL_33;
  }
  else
  {
    v16 = 0;
    v14 = (char *)v5 + v5[v13 + 8];
    if (a3)
      goto LABEL_33;
  }
LABEL_36:
  *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v13;
  if (v13 >= v7)
    return 0;
  else
    return v14;
}

uint64_t mdb_page_touch(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __int16 v4;
  uint64_t **v5;
  uint64_t result;
  char *v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int v15;
  char *v16;
  uint64_t v17;
  uint64_t *v18;
  unsigned int v19;
  uint64_t *v20;
  char **v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  char **v29;
  uint64_t v30;
  unint64_t v31[2];
  void *__dst;

  v2 = *(_QWORD *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
  __dst = 0;
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_WORD *)(v2 + 10);
  if ((v4 & 0x10) == 0)
  {
    if ((*(_BYTE *)(v3 + 124) & 8) != 0)
    {
      result = mdb_page_unspill(*(_QWORD *)(a1 + 24), v2, (char **)&__dst);
      if ((_DWORD)result)
        goto LABEL_15;
      v7 = (char *)__dst;
      if (__dst)
      {
LABEL_20:
        v17 = *(unsigned __int16 *)(a1 + 66);
        *(_QWORD *)(a1 + 8 * v17 + 72) = v7;
        v18 = *(uint64_t **)(*(_QWORD *)(v3 + 104) + 8 * *(unsigned int *)(a1 + 32));
        if ((*(_BYTE *)(a1 + 68) & 4) != 0)
        {
          if (v18)
          {
            v26 = *(unsigned __int16 *)(a1 + 64);
            do
            {
              v27 = v18[2];
              if (*(unsigned __int16 *)(v27 + 64) >= v26)
              {
                v28 = v27 + 8 * v17;
                v30 = *(_QWORD *)(v28 + 72);
                v29 = (char **)(v28 + 72);
                if (v30 == v2)
                  *v29 = v7;
              }
              v18 = (uint64_t *)*v18;
            }
            while (v18);
          }
        }
        else if (v18)
        {
          v19 = *(unsigned __int16 *)(a1 + 64);
          do
          {
            if (v18 != (uint64_t *)a1 && *((unsigned __int16 *)v18 + 32) >= v19)
            {
              v20 = &v18[v17];
              v22 = v20[9];
              v21 = (char **)(v20 + 9);
              if (v22 == v2)
              {
                *v21 = v7;
                if ((*((_WORD *)v7 + 5) & 2) != 0)
                {
                  v23 = v18[2];
                  if (v23)
                  {
                    if ((*(_BYTE *)(v23 + 68) & 1) != 0)
                    {
                      v24 = *((unsigned __int16 *)v18 + v17 + 164);
                      if (v24 < (*((unsigned __int16 *)v7 + 6) - 16) >> 1)
                      {
                        v25 = &v7[*(unsigned __int16 *)&v7[2 * v24 + 16]];
                        if ((*((_WORD *)v25 + 2) & 6) == 4)
                          *(_QWORD *)(v23 + 72) = &v25[*((unsigned __int16 *)v25 + 3) + 8];
                      }
                    }
                  }
                }
              }
            }
            v18 = (uint64_t *)*v18;
          }
          while (v18);
        }
        return 0;
      }
    }
    v5 = (uint64_t **)(v3 + 40);
    result = mdb_midl_need((_DWORD **)(v3 + 40), 1);
    if (!(_DWORD)result)
    {
      result = mdb_page_alloc(a1, 1, (char **)&__dst);
      if (!(_DWORD)result)
      {
        v7 = (char *)__dst;
        v8 = *(_QWORD *)__dst;
        v9 = *v5;
        v10 = **v5 + 1;
        *v9 = v10;
        v9[v10] = *(_QWORD *)v2;
        if (*(_WORD *)(a1 + 66))
        {
          v11 = *(unsigned __int16 *)(a1 + 66) - 1;
          v12 = *(_QWORD *)(a1 + 8 * v11 + 72);
          v13 = v12 + *(unsigned __int16 *)(v12 + 2 * *(unsigned __int16 *)(a1 + 2 * v11 + 328) + 16);
          *(_DWORD *)v13 = v8;
          *(_WORD *)(v13 + 4) = WORD2(v8);
        }
        else
        {
          *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) = v8;
        }
        goto LABEL_18;
      }
    }
LABEL_15:
    *(_DWORD *)(v3 + 124) |= 2u;
    return result;
  }
  result = 0;
  if ((v4 & 0x40) == 0 && *(_QWORD *)v3)
  {
    v14 = *(unsigned int **)(v3 + 72);
    v8 = *(_QWORD *)v2;
    if (*(_QWORD *)v14)
    {
      v15 = mdb_mid2l_search(*(unsigned int **)(v3 + 72), *(_QWORD *)v2);
      if (*(_QWORD *)v14 >= (unint64_t)v15 && *(_QWORD *)&v14[4 * v15] == v8)
      {
        if (v2 != *(_QWORD *)&v14[4 * v15 + 2])
        {
          *(_DWORD *)(a1 + 68) &= 0xFFFFFFFC;
          *(_DWORD *)(v3 + 124) |= 2u;
          return 4294936517;
        }
        return 0;
      }
    }
    v16 = mdb_page_malloc(v3, 1u);
    if (v16)
    {
      v7 = v16;
      v31[0] = v8;
      v31[1] = (unint64_t)v16;
      mdb_mid2l_insert(v14, v31);
LABEL_18:
      mdb_page_copy(v7, (_WORD *)v2, *(_DWORD *)(*(_QWORD *)(v3 + 32) + 16));
      *(_QWORD *)v7 = v8;
      *((_WORD *)v7 + 5) |= 0x10u;
      goto LABEL_20;
    }
    return 12;
  }
  return result;
}

uint64_t mdb_page_search_root(uint64_t a1, _QWORD *a2, char a3)
{
  unint64_t v4;
  unint64_t v5;
  __int16 v6;
  int v9;
  unsigned int v10;
  unsigned int *v11;
  uint64_t result;
  int v13;
  unint64_t v14;

  v4 = *(unsigned __int16 *)(a1 + 66);
  v5 = *(_QWORD *)(a1 + 8 * v4 + 72);
  v14 = v5;
  v6 = *(_WORD *)(v5 + 10);
  if ((v6 & 1) != 0)
  {
    v9 = a3 & 0xC;
    do
    {
      if (v9)
      {
        if ((a3 & 8) != 0)
        {
          v10 = ((*(unsigned __int16 *)(v5 + 12) + 131056) >> 1) - 1;
          if ((*(_BYTE *)(a1 + 68) & 1) != 0
            && *(unsigned __int16 *)(a1 + 2 * (unsigned __int16)v4 + 328) == (unsigned __int16)v10)
          {
            v4 = *(unsigned __int16 *)(a1 + 64);
            *(_WORD *)(a1 + 64) = v4 + 1;
            *(_WORD *)(a1 + 66) = v4;
            v5 = *(_QWORD *)(a1 + 8 * v4 + 72);
            v14 = v5;
            if ((a3 & 1) != 0)
              goto LABEL_16;
            goto LABEL_18;
          }
        }
        else
        {
          LOWORD(v10) = 0;
        }
      }
      else
      {
        v13 = 0;
        if (mdb_node_search(a1, a2, &v13))
          LOWORD(v10) = *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) - (v13 == 0);
        else
          v10 = ((*(unsigned __int16 *)(v5 + 12) + 131056) >> 1) - 1;
      }
      v11 = (unsigned int *)(v5 + *(unsigned __int16 *)(v5 + 2 * (unsigned __int16)v10 + 16));
      result = mdb_page_get(a1, *v11 | ((unint64_t)*((unsigned __int16 *)v11 + 2) << 32), &v14, 0);
      if ((_DWORD)result)
        return result;
      *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v10;
      v4 = *(unsigned __int16 *)(a1 + 64);
      if (v4 > 0x1F)
      {
        *(_DWORD *)(*(_QWORD *)(a1 + 24) + 124) |= 2u;
        return 4294936509;
      }
      v5 = v14;
      *(_WORD *)(a1 + 64) = v4 + 1;
      *(_WORD *)(a1 + 66) = v4;
      *(_QWORD *)(a1 + 8 * v4 + 72) = v5;
      *(_WORD *)(a1 + 2 * v4 + 328) = 0;
      if ((a3 & 1) != 0)
      {
LABEL_16:
        result = mdb_page_touch(a1);
        if ((_DWORD)result)
          return result;
        v4 = *(unsigned __int16 *)(a1 + 66);
        v5 = *(_QWORD *)(a1 + 8 * v4 + 72);
        v14 = v5;
      }
LABEL_18:
      v6 = *(_WORD *)(v5 + 10);
    }
    while ((v6 & 1) != 0);
  }
  if ((v6 & 2) != 0)
  {
    result = 0;
    *(_DWORD *)(a1 + 68) = *(_DWORD *)(a1 + 68) & 0xFFFFFFFC | 1;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 24) + 124) |= 2u;
    return 4294936500;
  }
  return result;
}

void *mdb_page_copy(char *__dst, _WORD *__src, int a3)
{
  _WORD *v4;
  char *v5;
  unsigned __int16 v6;
  int v7;
  uint64_t v8;
  size_t v9;

  v4 = __src;
  v5 = __dst;
  v6 = __src[7];
  v7 = (unsigned __int16)__src[6];
  if (((v6 - (_WORD)v7) & 0xFFF8) == 0 || (__src[5] & 0x20) != 0)
  {
    v9 = a3 - ((v6 - (_WORD)v7) & 0xFFF8u);
  }
  else
  {
    v8 = v6 & 0xFFF8;
    memcpy(__dst, __src, (v7 + 7) & 0x1FFF8);
    __dst = &v5[v8];
    __src = (_WORD *)((char *)v4 + v8);
    v9 = (a3 - v8);
  }
  return memcpy(__dst, __src, v9);
}

uint64_t mdb_env_reader_dest(uint64_t a1)
{
  int v2;
  uint64_t result;

  v2 = *(_DWORD *)(a1 + 8);
  result = getpid();
  if (v2 == (_DWORD)result)
    *(_DWORD *)(a1 + 8) = 0;
  return result;
}

uint64_t mdb_pages_xkeep(uint64_t a1, int a2, int a3)
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  BOOL v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int16 v16;
  unsigned int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t result;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  __int16 v24;
  int v26;
  unint64_t v27;

  v5 = *(_QWORD *)(a1 + 24);
  v27 = 0;
  v26 = 0;
  v6 = *(_DWORD *)(v5 + 120);
  v7 = a1;
  v8 = v6;
  do
  {
LABEL_2:
    if ((*(_BYTE *)(v7 + 68) & 1) != 0)
    {
      v12 = v7;
      do
      {
        v13 = *(unsigned __int16 *)(v12 + 64);
        if (*(_WORD *)(v12 + 64))
        {
          v14 = 0;
          do
          {
            v15 = *(_QWORD *)(v12 + 72 + 8 * v14);
            v16 = *(_WORD *)(v15 + 10);
            if ((v16 & 0xC050) == a2)
              *(_WORD *)(v15 + 10) = v16 ^ 0x8000;
            ++v14;
          }
          while (v13 != v14);
          v17 = v14 - 1;
        }
        else
        {
          v15 = 0;
          v17 = -1;
        }
        v18 = *(_QWORD *)(v12 + 16);
        if (!v18)
          break;
        if (!v15)
          break;
        if ((*(_DWORD *)(v18 + 68) & 1) == 0)
          break;
        if ((*(_WORD *)(v15 + 10) & 2) == 0)
          break;
        v19 = *(_WORD *)(v15 + *(unsigned __int16 *)(v15 + 2 * *(unsigned __int16 *)(v12 + 2 * v17 + 328) + 16) + 4);
        v12 = *(_QWORD *)(v12 + 16);
      }
      while ((v19 & 2) != 0);
    }
    v7 = *(_QWORD *)v7;
    if (v7)
      v9 = v7 == a1;
    else
      v9 = 1;
  }
  while (!v9);
  v10 = 8 * v8 - 8;
  while (v10 != -8)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(v5 + 104) + v10);
    v10 -= 8;
    --v8;
    if (v7)
      v11 = v7 == a1;
    else
      v11 = 1;
    if (!v11)
      goto LABEL_2;
  }
  result = 0;
  if (a3 && v6)
  {
    v21 = 0;
    v22 = 40;
    do
    {
      if ((*(_BYTE *)(*(_QWORD *)(v5 + 112) + v21) & 1) != 0)
      {
        v23 = *(_QWORD *)(*(_QWORD *)(v5 + 88) + v22);
        if (v23 != -1)
        {
          result = mdb_page_get(a1, v23, &v27, &v26);
          if ((_DWORD)result)
            return result;
          v24 = *(_WORD *)(v27 + 10);
          if ((v24 & 0xC050) == a2 && v26 <= 1)
            *(_WORD *)(v27 + 10) = v24 ^ 0x8000;
        }
      }
      ++v21;
      v22 += 48;
    }
    while (v21 < *(unsigned int *)(v5 + 120));
    return 0;
  }
  return result;
}

unint64_t mdb_find_oldest(uint64_t a1)
{
  uint64_t v1;
  unint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v1 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD *)(a1 + 24) - 1;
  v3 = *(_QWORD *)(v1 + 64);
  if (v3)
  {
    v4 = *(unsigned int *)(v3 + 16);
    if ((int)v4 >= 1)
    {
      v5 = v3 + 192;
      v6 = v4 + 1;
      do
      {
        v7 = v5 + ((unint64_t)(v6 - 2) << 6);
        if (*(_DWORD *)(v7 + 8))
        {
          v8 = *(_QWORD *)v7;
          if (result >= v8)
            result = v8;
        }
        --v6;
      }
      while (v6 > 1);
    }
  }
  return result;
}

uint64_t mdb_rebalance(uint64_t a1)
{
  unint64_t *v2;
  uint64_t v3;
  _WORD *v4;
  unsigned int v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int16 v9;
  int v10;
  unint64_t v11;
  __int16 v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t updated;
  unsigned int v16;
  _QWORD *v17;
  _QWORD *v18;
  int v19;
  int v20;
  int v21;
  unsigned __int16 *v22;
  unsigned __int16 v23;
  _QWORD *v24;
  unsigned __int16 v25;
  unsigned int *v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  unsigned __int16 v30;
  unsigned int *v31;
  unint64_t v32;
  __int16 v33;
  int v34;
  uint64_t v35;
  __int16 v36;
  unsigned int *v37;
  uint64_t v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unsigned int *v44;
  __int128 *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  _QWORD *v52;
  int v53;
  _QWORD *v54;
  unint64_t v55;
  size_t v56;
  unint64_t v57;
  int64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 *v61;
  uint64_t v62;
  char v63;
  __int128 *v64;
  char *v65;
  unsigned int v66;
  _QWORD *v67;
  _QWORD *v68;
  uint64_t v69;
  char *v70;
  _WORD *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  __int128 *v79;
  char v80;
  __int128 *v81;
  _QWORD *v82;
  _QWORD *v83;
  uint64_t v84;
  __int16 *v85;
  __int16 v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v97;
  uint64_t v98;
  unsigned int *v99;
  __int16 v100;
  uint64_t v101;
  uint64_t v102;
  unsigned int *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  __int128 *v108;
  uint64_t v109;
  uint64_t v110;
  __int16 v111;
  __int128 *v112;
  uint64_t v113;
  uint64_t v114;
  __int16 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _OWORD v120[20];
  uint64_t v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  uint64_t v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  uint64_t v171;
  size_t v172;
  uint64_t v173;
  unint64_t v174;
  unsigned int *v175;

  v121 = 0;
  memset(v120, 0, sizeof(v120));
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v2 = (unint64_t *)(a1 + 72);
  v3 = *(unsigned __int16 *)(a1 + 66);
  v4 = *(_WORD **)(a1 + 72 + 8 * v3);
  if ((v4[5] & 1) != 0)
    v5 = 2;
  else
    v5 = 1;
  if ((v4[5] & 1) != 0)
    v6 = 1;
  else
    v6 = 250;
  v7 = *(_QWORD *)(a1 + 24);
  v8 = (*(_DWORD *)(*(_QWORD *)(v7 + 32) + 16) - 16);
  v9 = v4[7];
  v10 = (unsigned __int16)v4[6];
  if (1000 * (unint64_t)(v8 - (unsigned __int16)(v9 - v10)) / v8 >= v6
    && v5 <= (v10 - 16) >> 1)
  {
    return 0;
  }
  if (*(unsigned __int16 *)(a1 + 64) > 1u)
  {
    mdb_cursor_copy(a1, (uint64_t)&v116);
    v20 = *(unsigned __int16 *)(a1 + 328 + 2 * v3);
    v21 = *(unsigned __int16 *)(a1 + 328 + 2 * (v3 - 1));
    *(_QWORD *)&v117 = 0;
    v22 = (unsigned __int16 *)&v120[16] + (v3 - 1) + 4;
    v23 = *v22;
    v24 = (_QWORD *)(a1 + 8 * (v3 - 1) + 72);
    if (v21)
    {
      v25 = v23 - 1;
      *v22 = v25;
      v26 = (unsigned int *)(*v24 + *(unsigned __int16 *)(*v24 + 2 * v25 + 16));
      updated = mdb_page_get(a1, *v26 | ((unint64_t)*((unsigned __int16 *)v26 + 2) << 32), (unint64_t *)v120 + WORD1(v120[0]) + 1, 0);
      if ((_DWORD)updated)
        return updated;
      v27 = WORD1(v120[0]);
      v28 = *((_QWORD *)v120 + WORD1(v120[0]) + 1);
      v29 = ((*(unsigned __int16 *)(v28 + 12) + 131056) >> 1) - 1;
      *((_WORD *)&v120[16] + WORD1(v120[0]) + 4) = ((*(unsigned __int16 *)(v28 + 12) + 131056) >> 1) - 1;
      *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = 0;
    }
    else
    {
      v30 = v23 + 1;
      *v22 = v30;
      v31 = (unsigned int *)(*v24 + *(unsigned __int16 *)(*v24 + 2 * v30 + 16));
      updated = mdb_page_get(a1, *v31 | ((unint64_t)*((unsigned __int16 *)v31 + 2) << 32), (unint64_t *)v120 + WORD1(v120[0]) + 1, 0);
      if ((_DWORD)updated)
        return updated;
      LOWORD(v29) = 0;
      v27 = WORD1(v120[0]);
      *((_WORD *)&v120[16] + WORD1(v120[0]) + 4) = 0;
      *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = (*(unsigned __int16 *)(*(_QWORD *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72) + 12)
                                                                   + 131056) >> 1;
      v28 = *((_QWORD *)v120 + v27 + 1);
    }
    v32 = (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 32) + 16) - 16);
    v33 = *(_WORD *)(v28 + 14);
    v34 = *(unsigned __int16 *)(v28 + 12);
    if (1000 * (unint64_t)(v32 - (unsigned __int16)(v33 - v34)) / v32 < v6
      || v5 >= (v34 - 16) >> 1)
    {
      if (v21)
      {
        v45 = &v116;
        *((_WORD *)&v120[16] + v27 + 4) = *(_WORD *)(a1 + 2 * v27 + 328) + v29 + 1;
        v171 = 0;
        v170 = 0u;
        v169 = 0u;
        v20 += (v34 + 131056) >> 1;
        v168 = 0u;
        v167 = 0u;
        v166 = 0u;
        v165 = 0u;
        v164 = 0u;
        v163 = 0u;
        v162 = 0u;
        v160 = 0u;
        v161 = 0u;
        v158 = 0u;
        v159 = 0u;
        v156 = 0u;
        v157 = 0u;
        v154 = 0u;
        v155 = 0u;
        v152 = 0u;
        v153 = 0u;
        v150 = 0u;
        v151 = 0u;
        v148 = 0u;
        v149 = 0u;
        v147 = 0u;
        v46 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 104);
        v47 = v118;
        if ((BYTE4(v120[0]) & 4) != 0)
        {
          DWORD1(v151) = 1;
          *(_QWORD *)&v148 = &v116;
          v45 = &v147;
        }
        *(_QWORD *)v45 = *(_QWORD *)(v46 + 8 * v118);
        *(_QWORD *)(v46 + 8 * v47) = v45;
        updated = mdb_page_merge(a1, (uint64_t)&v116);
        *(_QWORD *)(v46 + 8 * v47) = *(_QWORD *)v45;
        mdb_cursor_copy((uint64_t)&v116, a1);
      }
      else
      {
        updated = mdb_page_merge((uint64_t)&v116, a1);
      }
      *(_DWORD *)(a1 + 68) &= ~2u;
      goto LABEL_119;
    }
    updated = mdb_page_touch((uint64_t)&v116);
    if ((_DWORD)updated)
      goto LABEL_117;
    updated = mdb_page_touch(a1);
    if ((_DWORD)updated)
      goto LABEL_117;
    v174 = 0;
    v175 = 0;
    v147 = 0u;
    v148 = 0u;
    v149 = 0u;
    v150 = 0u;
    v151 = 0u;
    v152 = 0u;
    v153 = 0u;
    v154 = 0u;
    v155 = 0u;
    v156 = 0u;
    v157 = 0u;
    v158 = 0u;
    v159 = 0u;
    v160 = 0u;
    v161 = 0u;
    v162 = 0u;
    v163 = 0u;
    v164 = 0u;
    v165 = 0u;
    v166 = 0u;
    v167 = 0u;
    v168 = 0u;
    v169 = 0u;
    v170 = 0u;
    v171 = 0;
    v35 = *((_QWORD *)v120 + WORD1(v120[0]) + 1);
    v36 = *(_WORD *)(v35 + 10);
    if ((v36 & 0x20) != 0)
    {
      v56 = 0;
      LODWORD(v39) = 0;
      v57 = v35
          + *((unsigned __int16 *)&v120[16] + WORD1(v120[0]) + 4)
          * (unint64_t)**((_DWORD **)&v118 + 1)
          + 16;
      v174 = **((_DWORD **)&v118 + 1);
      v175 = (unsigned int *)v57;
      v172 = 0;
      v173 = 0;
    }
    else
    {
      v37 = (unsigned int *)(v35
                           + *(unsigned __int16 *)(v35 + 2 * *((unsigned __int16 *)&v120[16] + WORD1(v120[0]) + 4) + 16));
      v38 = *v37;
      v39 = *((unsigned __int16 *)v37 + 2);
      if ((v36 & 1) == 0 || *((_WORD *)&v120[16] + WORD1(v120[0]) + 4))
      {
        v58 = *((unsigned __int16 *)v37 + 3);
        v174 = v58;
        v175 = v37 + 2;
      }
      else
      {
        v40 = v120[0];
        updated = mdb_page_search_lowest((uint64_t)&v116);
        if ((_DWORD)updated)
          goto LABEL_117;
        v41 = *((_QWORD *)v120 + WORD1(v120[0]) + 1);
        if ((*(_WORD *)(v41 + 10) & 0x20) != 0)
        {
          v43 = **((_DWORD **)&v118 + 1);
          v44 = (unsigned int *)(v41 + 16);
        }
        else
        {
          v42 = v41 + *(unsigned __int16 *)(v41 + 16);
          v43 = *(unsigned __int16 *)(v42 + 6);
          v44 = (unsigned int *)(v42 + 8);
        }
        v174 = v43;
        v175 = v44;
        LOWORD(v120[0]) = v40;
        WORD1(v120[0]) = v40 - 1;
        v58 = *((unsigned __int16 *)v37 + 3);
      }
      v56 = v38 | (v39 << 32);
      v172 = *v37;
      v173 = (uint64_t)v37 + v58 + 8;
    }
    *(_QWORD *)&v148 = 0;
    v59 = *(unsigned __int16 *)(a1 + 66);
    if ((*(_WORD *)(*(_QWORD *)(a1 + 8 * v59 + 72) + 10) & 1) != 0 && !*(_WORD *)(a1 + 2 * v59 + 328))
    {
      v77 = *(unsigned __int16 *)(a1 + 64);
      v122 = 0uLL;
      mdb_cursor_copy(a1, (uint64_t)&v147);
      v78 = mdb_page_search_lowest((uint64_t)&v147);
      if ((_DWORD)v78)
      {
        updated = v78;
        goto LABEL_117;
      }
      v104 = *((_QWORD *)&v151 + WORD1(v151) + 1);
      if ((*(_WORD *)(v104 + 10) & 0x20) != 0)
      {
        v106 = **((_DWORD **)&v149 + 1);
        v107 = v104 + 16;
      }
      else
      {
        v105 = v104 + *(unsigned __int16 *)(v104 + 16);
        v106 = *(unsigned __int16 *)(v105 + 6);
        v107 = v105 + 8;
      }
      *(_QWORD *)&v122 = v106;
      *((_QWORD *)&v122 + 1) = v107;
      LOWORD(v151) = v77;
      WORD1(v151) = v77 - 1;
      *((_WORD *)&v167 + (v77 - 1) + 4) = 0;
      updated = mdb_update_key((uint64_t)&v147, (uint64_t)&v122);
      if ((_DWORD)updated)
      {
LABEL_117:
        if (v21)
          LOWORD(v20) = v20 + 1;
LABEL_119:
        *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v20;
        return updated;
      }
      v59 = *(unsigned __int16 *)(a1 + 66);
    }
    updated = mdb_node_add(a1, *(unsigned __int16 *)(a1 + 2 * v59 + 328), (const void **)&v174, &v172, v56, v39);
    if (!(_DWORD)updated)
    {
      mdb_node_del(&v116, v174);
      v60 = *((_QWORD *)v120 + WORD1(v120[0]) + 1);
      if (v21)
      {
        v61 = *(__int128 **)(*(_QWORD *)(*((_QWORD *)&v117 + 1) + 104) + 8 * v118);
        if (v61)
        {
          v62 = *(_QWORD *)(a1 + 8 * WORD1(v120[0]) + 72);
          v63 = BYTE4(v120[0]);
          do
          {
            v64 = v61;
            if ((v63 & 4) != 0)
              v64 = (__int128 *)*((_QWORD *)v61 + 2);
            if ((*((_BYTE *)v64 + 68) & 1) != 0 && *((unsigned __int16 *)v64 + 33) >= WORD1(v120[0]))
            {
              if (v64 != (__int128 *)a1 && *((_QWORD *)v64 + WORD1(v120[0]) + 9) == v62)
              {
                v65 = (char *)v64 + 2 * WORD1(v120[0]);
                v66 = *((unsigned __int16 *)v65 + 164);
                if (v66 >= *(unsigned __int16 *)(a1 + 2 * WORD1(v120[0]) + 328))
                  *((_WORD *)v65 + 164) = v66 + 1;
              }
              if (v64 != &v116)
              {
                v67 = (_QWORD *)v64 + WORD1(v120[0]);
                v69 = v67[9];
                v68 = v67 + 9;
                if (v69 == v60)
                {
                  v70 = (char *)v64 + 2 * WORD1(v120[0]);
                  if (*((unsigned __int16 *)v70 + 164) == *((unsigned __int16 *)&v120[16] + WORD1(v120[0]) + 4))
                  {
                    v71 = v70 + 328;
                    v72 = *(unsigned __int16 *)(a1 + 66);
                    *v68 = *(_QWORD *)(a1 + 8 * v72 + 72);
                    *v71 = *(_WORD *)(a1 + 2 * v72 + 328);
                    ++*((_WORD *)v64 + WORD1(v120[0]) + 163);
                  }
                }
              }
              if ((*(_WORD *)(v60 + 10) & 2) != 0)
              {
                v73 = *((_QWORD *)v64 + 2);
                if (v73)
                {
                  if ((*(_BYTE *)(v73 + 68) & 1) != 0)
                  {
                    v74 = *((_QWORD *)v64 + WORD1(v120[0]) + 9);
                    v75 = *((unsigned __int16 *)v64 + WORD1(v120[0]) + 164);
                    if (v75 < (*(unsigned __int16 *)(v74 + 12) - 16) >> 1)
                    {
                      v76 = v74 + *(unsigned __int16 *)(v74 + 2 * v75 + 16);
                      if ((*(_WORD *)(v76 + 4) & 6) == 4)
                        *(_QWORD *)(v73 + 72) = v76 + *(unsigned __int16 *)(v76 + 6) + 8;
                    }
                  }
                }
              }
            }
            v61 = *(__int128 **)v61;
          }
          while (v61);
        }
      }
      else
      {
        v79 = *(__int128 **)(*(_QWORD *)(*((_QWORD *)&v117 + 1) + 104) + 8 * v118);
        if (v79)
        {
          v80 = BYTE4(v120[0]);
          do
          {
            v81 = v79;
            if ((v80 & 4) != 0)
              v81 = (__int128 *)*((_QWORD *)v79 + 2);
            if (v81 != &v116
              && (*((_BYTE *)v81 + 68) & 1) != 0
              && *((unsigned __int16 *)v81 + 33) >= WORD1(v120[0]))
            {
              v82 = (_QWORD *)v81 + WORD1(v120[0]);
              v84 = v82[9];
              v83 = v82 + 9;
              if (v84 == v60)
              {
                v85 = (__int16 *)v81 + WORD1(v120[0]) + 164;
                v86 = *v85;
                if (!*v85)
                {
                  v87 = *(unsigned __int16 *)(a1 + 66);
                  *v83 = *(_QWORD *)(a1 + 8 * v87 + 72);
                  *v85 = *(_WORD *)(a1 + 2 * v87 + 328);
                  v85 = (__int16 *)v81 + WORD1(v120[0]) + 163;
                  v86 = *v85;
                }
                *v85 = v86 - 1;
                if ((*(_WORD *)(v60 + 10) & 2) != 0)
                {
                  v88 = *((_QWORD *)v81 + 2);
                  if (v88)
                  {
                    if ((*(_BYTE *)(v88 + 68) & 1) != 0)
                    {
                      v89 = *((_QWORD *)v81 + WORD1(v120[0]) + 9);
                      v90 = *((unsigned __int16 *)v81 + WORD1(v120[0]) + 164);
                      if (v90 < (*(unsigned __int16 *)(v89 + 12) - 16) >> 1)
                      {
                        v91 = v89 + *(unsigned __int16 *)(v89 + 2 * v90 + 16);
                        if ((*(_WORD *)(v91 + 4) & 6) == 4)
                          *(_QWORD *)(v88 + 72) = v91 + *(unsigned __int16 *)(v91 + 6) + 8;
                      }
                    }
                  }
                }
              }
            }
            v79 = *(__int128 **)v79;
          }
          while (v79);
        }
      }
      v92 = WORD1(v120[0]);
      v93 = (char *)&v116 + 2 * WORD1(v120[0]);
      if (!*((_WORD *)v93 + 164))
      {
        if (*((_WORD *)v93 + 163))
        {
          v97 = *((_QWORD *)v120 + WORD1(v120[0]) + 1);
          if ((*(_WORD *)(v97 + 10) & 0x20) != 0)
          {
            v99 = (unsigned int *)(v97 + 16);
          }
          else
          {
            v98 = v97 + *(unsigned __int16 *)(v97 + 16);
            v174 = *(unsigned __int16 *)(v98 + 6);
            v99 = (unsigned int *)(v98 + 8);
          }
          v175 = v99;
          v108 = &v147;
          mdb_cursor_copy((uint64_t)&v116, (uint64_t)&v147);
          LOWORD(v151) = v151 - 1;
          --WORD1(v151);
          v146 = 0;
          v144 = 0u;
          v145 = 0u;
          v142 = 0u;
          v143 = 0u;
          v140 = 0u;
          v141 = 0u;
          v138 = 0u;
          v139 = 0u;
          v136 = 0u;
          v137 = 0u;
          v134 = 0u;
          v135 = 0u;
          v132 = 0u;
          v133 = 0u;
          v130 = 0u;
          v131 = 0u;
          v128 = 0u;
          v129 = 0u;
          v126 = 0u;
          v127 = 0u;
          v124 = 0u;
          v125 = 0u;
          v122 = 0u;
          v123 = 0u;
          v109 = *(_QWORD *)(*((_QWORD *)&v148 + 1) + 104);
          v110 = v149;
          if ((BYTE4(v151) & 4) != 0)
          {
            DWORD1(v126) = 1;
            *(_QWORD *)&v123 = &v147;
            v108 = &v122;
          }
          *(_QWORD *)v108 = *(_QWORD *)(v109 + 8 * v149);
          *(_QWORD *)(v109 + 8 * v110) = v108;
          updated = mdb_update_key((uint64_t)&v147, (uint64_t)&v174);
          *(_QWORD *)(v109 + 8 * v110) = *(_QWORD *)v108;
          if ((_DWORD)updated)
            goto LABEL_117;
          v92 = WORD1(v120[0]);
        }
        if ((*(_WORD *)(*((_QWORD *)v120 + v92 + 1) + 10) & 1) != 0)
        {
          v111 = *((_WORD *)&v120[16] + v92 + 4);
          v122 = 0uLL;
          *((_WORD *)&v120[16] + v92 + 4) = 0;
          mdb_update_key((uint64_t)&v116, (uint64_t)&v122);
          LODWORD(v92) = WORD1(v120[0]);
          *((_WORD *)&v120[16] + WORD1(v120[0]) + 4) = v111;
        }
      }
      v94 = *(unsigned __int16 *)(a1 + 66);
      v95 = a1 + 2 * v94;
      if (*(_WORD *)(v95 + 328))
        goto LABEL_116;
      if (*(_WORD *)(v95 + 326))
      {
        v100 = *(_WORD *)(*((_QWORD *)v120 + v92 + 1) + 10);
        v101 = *(_QWORD *)(a1 + 8 * v94 + 72);
        if ((v100 & 0x20) != 0)
        {
          v103 = (unsigned int *)(v101 + 16);
        }
        else
        {
          v102 = v101 + *(unsigned __int16 *)(v101 + 16);
          v174 = *(unsigned __int16 *)(v102 + 6);
          v103 = (unsigned int *)(v102 + 8);
        }
        v175 = v103;
        v112 = &v147;
        mdb_cursor_copy(a1, (uint64_t)&v147);
        LOWORD(v151) = v151 - 1;
        --WORD1(v151);
        v146 = 0;
        v144 = 0u;
        v145 = 0u;
        v142 = 0u;
        v143 = 0u;
        v140 = 0u;
        v141 = 0u;
        v138 = 0u;
        v139 = 0u;
        v136 = 0u;
        v137 = 0u;
        v134 = 0u;
        v135 = 0u;
        v132 = 0u;
        v133 = 0u;
        v130 = 0u;
        v131 = 0u;
        v128 = 0u;
        v129 = 0u;
        v126 = 0u;
        v127 = 0u;
        v124 = 0u;
        v125 = 0u;
        v122 = 0u;
        v123 = 0u;
        v113 = *(_QWORD *)(*((_QWORD *)&v148 + 1) + 104);
        v114 = v149;
        if ((BYTE4(v151) & 4) != 0)
        {
          DWORD1(v126) = 1;
          *(_QWORD *)&v123 = &v147;
          v112 = &v122;
        }
        *(_QWORD *)v112 = *(_QWORD *)(v113 + 8 * v149);
        *(_QWORD *)(v113 + 8 * v114) = v112;
        updated = mdb_update_key((uint64_t)&v147, (uint64_t)&v174);
        *(_QWORD *)(v113 + 8 * v114) = *(_QWORD *)v112;
        if ((_DWORD)updated)
          goto LABEL_117;
        v94 = *(unsigned __int16 *)(a1 + 66);
      }
      if ((*(_WORD *)(*(_QWORD *)(a1 + 8 * v94 + 72) + 10) & 1) == 0)
      {
LABEL_116:
        updated = 0;
      }
      else
      {
        v115 = *(_WORD *)(a1 + 328 + 2 * v94);
        v122 = 0uLL;
        *(_WORD *)(a1 + 328 + 2 * v94) = 0;
        mdb_update_key(a1, (uint64_t)&v122);
        updated = 0;
        *(_WORD *)(a1 + 328 + 2 * *(unsigned __int16 *)(a1 + 66)) = v115;
      }
    }
    goto LABEL_117;
  }
  v11 = *v2;
  v12 = *(_WORD *)(*v2 + 10);
  if ((v12 & 0x40) != 0)
    return 0;
  v13 = *(unsigned __int16 *)(v11 + 12) - 16;
  if (v13 <= 1)
  {
    v14 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(v14 + 40) = -1;
    *(_WORD *)(v14 + 6) = 0;
    *(_QWORD *)(v14 + 16) = 0;
    updated = mdb_midl_append((unint64_t **)(v7 + 40), *(_QWORD *)v11);
    if ((_DWORD)updated)
      return updated;
    v16 = *(_DWORD *)(a1 + 68) & 0xFFFFFFFE;
    *(_DWORD *)(a1 + 64) = 0;
    *(_DWORD *)(a1 + 68) = v16;
    v17 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
    if (v17)
    {
      do
      {
        v18 = v17;
        if ((*(_BYTE *)(a1 + 68) & 4) != 0)
          v18 = (_QWORD *)v17[2];
        v19 = *((_DWORD *)v18 + 17);
        if ((v19 & 1) != 0
          && *((unsigned __int16 *)v18 + 32) >= *(unsigned __int16 *)(a1 + 64)
          && v18[9] == v11)
        {
          *((_DWORD *)v18 + 16) = 0;
          *((_DWORD *)v18 + 17) = v19 & 0xFFFFFFFE;
        }
        updated = 0;
        v17 = (_QWORD *)*v17;
      }
      while (v17);
      return updated;
    }
    return 0;
  }
  updated = 0;
  if ((v12 & 1) == 0)
    return updated;
  if ((v13 & 0xFFFFFFFE) != 2)
    return updated;
  updated = mdb_midl_append((unint64_t **)(v7 + 40), *(_QWORD *)v11);
  if ((_DWORD)updated)
    return updated;
  v48 = *(unsigned int *)(v11 + *(unsigned __int16 *)(v11 + 16)) | ((unint64_t)*(unsigned __int16 *)(v11 + *(unsigned __int16 *)(v11 + 16) + 4) << 32);
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) = v48;
  updated = mdb_page_get(a1, v48, v2, 0);
  if ((_DWORD)updated)
    return updated;
  v49 = *(_QWORD *)(a1 + 40);
  --*(_WORD *)(v49 + 6);
  --*(_QWORD *)(v49 + 8);
  *(_WORD *)(a1 + 328) = *(_WORD *)(a1 + 330);
  if (*(unsigned __int16 *)(v49 + 6) >= 2u)
  {
    v50 = 0;
    do
    {
      *(_QWORD *)(a1 + 8 * v50 + 80) = *(_QWORD *)(a1 + 8 * v50 + 88);
      *(_WORD *)(a1 + 2 * v50 + 330) = *(_WORD *)(a1 + 2 * v50 + 332);
      v51 = v50 + 2;
      ++v50;
    }
    while (v51 < *(unsigned __int16 *)(v49 + 6));
  }
  v52 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
  if (!v52)
    return 0;
  v53 = *(_DWORD *)(a1 + 68);
  do
  {
    v54 = v52;
    if ((v53 & 4) != 0)
      v54 = (_QWORD *)v52[2];
    if (v54 != (_QWORD *)a1 && (*((_BYTE *)v54 + 68) & 1) != 0 && v54[9] == v11)
    {
      if (*(_WORD *)(v49 + 6))
      {
        v55 = 0;
        do
        {
          v54[v55 + 9] = v54[v55 + 10];
          *((_WORD *)v54 + v55 + 164) = *((_WORD *)v54 + v55 + 165);
          v49 = *(_QWORD *)(a1 + 40);
          ++v55;
        }
        while (v55 < *(unsigned __int16 *)(v49 + 6));
      }
      --*((_WORD *)v54 + 32);
      --*((_WORD *)v54 + 33);
    }
    updated = 0;
    v52 = (_QWORD *)*v52;
  }
  while (v52);
  return updated;
}

uint64_t mdb_cursor_copy(uint64_t result, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int16 v5;

  *(_QWORD *)(a2 + 24) = *(_QWORD *)(result + 24);
  *(_DWORD *)(a2 + 32) = *(_DWORD *)(result + 32);
  *(_OWORD *)(a2 + 40) = *(_OWORD *)(result + 40);
  *(_DWORD *)(a2 + 64) = *(_DWORD *)(result + 64);
  *(_DWORD *)(a2 + 68) = *(_DWORD *)(result + 68);
  if (*(_WORD *)(result + 64))
  {
    v2 = 0;
    v3 = result + 328;
    v4 = a2 + 328;
    do
    {
      v5 = *(_WORD *)(v3 + 2 * v2);
      *(_QWORD *)(v4 + 8 * v2 - 256) = *(_QWORD *)(v3 + 8 * v2 - 256);
      *(_WORD *)(v4 + 2 * v2++) = v5;
    }
    while (v2 < *(unsigned __int16 *)(result + 64));
  }
  return result;
}

uint64_t mdb_page_merge(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  unsigned int v7;
  unsigned __int16 v8;
  unsigned int v9;
  unsigned int *v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  unsigned __int16 v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  __int16 v22;
  _QWORD *v23;
  unsigned int v24;
  __int16 v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  char *v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int16 v42;
  __int16 v43;
  __int16 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _OWORD v49[20];
  uint64_t v50;
  size_t v51;
  uint64_t v52;
  unint64_t v53;
  unsigned int *v54;

  v51 = 0;
  v52 = 0;
  v4 = *(_QWORD *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
  result = mdb_page_touch(a2);
  if ((_DWORD)result)
    return result;
  v53 = 0;
  v54 = 0;
  v6 = *(_QWORD *)(a2 + 8 * *(unsigned __int16 *)(a2 + 66) + 72);
  v7 = *(unsigned __int16 *)(v6 + 12) + 131056;
  if ((*(_BYTE *)(v4 + 10) & 0x20) == 0)
  {
    if ((*(_WORD *)(v4 + 12) & 0xFFFE) != 0x10)
    {
      v8 = 0;
      v9 = v7 >> 1;
      do
      {
        v10 = (unsigned int *)(v4 + *(unsigned __int16 *)(v4 + 2 * v8 + 16));
        if (!v8 && (*(_WORD *)(v4 + 10) & 1) != 0)
        {
          v50 = 0;
          memset(v49, 0, sizeof(v49));
          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          mdb_cursor_copy(a1, (uint64_t)&v45);
          *(_QWORD *)&v46 = 0;
          result = mdb_page_search_lowest((uint64_t)&v45);
          if ((_DWORD)result)
            return result;
          v12 = *((_QWORD *)v49 + WORD1(v49[0]) + 1);
          if ((*(_WORD *)(v12 + 10) & 0x20) != 0)
          {
            v53 = **((_DWORD **)&v47 + 1);
            v14 = (unsigned int *)(v12 + 16);
          }
          else
          {
            v13 = v12 + *(unsigned __int16 *)(v12 + 16);
            v53 = *(unsigned __int16 *)(v13 + 6);
            v14 = (unsigned int *)(v13 + 8);
          }
          v54 = v14;
          v11 = *((unsigned __int16 *)v10 + 3);
        }
        else
        {
          v11 = *((unsigned __int16 *)v10 + 3);
          v53 = v11;
          v54 = v10 + 2;
        }
        v51 = *v10;
        v52 = (uint64_t)v10 + v11 + 8;
        result = mdb_node_add(a2, (unsigned __int16)v9, (const void **)&v53, &v51, v51 | ((unint64_t)*((unsigned __int16 *)v10 + 2) << 32), *((unsigned __int16 *)v10 + 2));
        if ((_DWORD)result)
          return result;
        ++v8;
        LOWORD(v9) = v9 + 1;
      }
      while ((*(unsigned __int16 *)(v4 + 12) - 16) >> 1 > v8);
    }
LABEL_21:
    --*(_WORD *)(a1 + 66);
    mdb_node_del((_QWORD *)a1, 0);
    v17 = *(unsigned __int16 *)(a1 + 66);
    if (!*(_WORD *)(a1 + 2 * v17 + 328))
    {
      v53 = 0;
      result = mdb_update_key(a1, (uint64_t)&v53);
      LOWORD(v17) = *(_WORD *)(a1 + 66);
      if ((_DWORD)result)
      {
        *(_WORD *)(a1 + 66) = v17 + 1;
        return result;
      }
    }
    v18 = v17 + 1;
    *(_WORD *)(a1 + 66) = v18;
    v19 = *(_QWORD *)(a1 + 8 * v18 + 72);
    v20 = *(_QWORD *)v19;
    v21 = *(_QWORD *)(a1 + 24);
    v22 = *(_WORD *)(v19 + 10);
    if ((v22 & 0x10) != 0 && *(_DWORD *)(a1 + 32))
    {
      if (!*(_QWORD *)v21)
      {
LABEL_35:
        *(_QWORD *)(v19 + 48) = *(_QWORD *)(v21 + 48);
        *(_QWORD *)(v21 + 48) = v19;
        ++*(_DWORD *)(v21 + 56);
        v25 = v22 | 0x4000;
        *(_WORD *)(v19 + 10) = v25;
LABEL_36:
        v26 = (v25 & 2) == 0;
        v27 = 16;
        if (v26)
          v27 = 8;
        --*(_QWORD *)(*(_QWORD *)(a1 + 40) + v27);
        v28 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
        if (v28)
        {
          v29 = *(unsigned __int16 *)(a1 + 66);
          v30 = *(_DWORD *)(a1 + 68);
          v31 = (v29 - 1);
          do
          {
            v32 = v28;
            if ((v30 & 4) != 0)
              v32 = (_QWORD *)v28[2];
            if (v32 != (_QWORD *)a1 && *((unsigned __int16 *)v32 + 32) >= *(unsigned __int16 *)(a1 + 64))
            {
              v33 = &v32[v29];
              v36 = v33[9];
              v35 = v33 + 9;
              v34 = v36;
              if (v36 == v19)
              {
                *v35 = v6;
                *((_WORD *)v32 + v29 + 164) += v7 >> 1;
                *((_WORD *)v32 + v31 + 164) = *(_WORD *)(a2 + 2 * v31 + 328);
                v34 = v6;
              }
              else if (v32[v31 + 9] == *(_QWORD *)(a1 + 8 * v31 + 72))
              {
                v37 = (char *)v32 + 2 * v31;
                v38 = *((unsigned __int16 *)v37 + 164);
                if (v38 > *(unsigned __int16 *)(a1 + 2 * v31 + 328))
                  *((_WORD *)v37 + 164) = v38 - 1;
              }
              if ((*(_WORD *)(v19 + 10) & 2) != 0)
              {
                v39 = v32[2];
                if (v39)
                {
                  if ((*(_BYTE *)(v39 + 68) & 1) != 0)
                  {
                    v40 = *((unsigned __int16 *)v32 + v29 + 164);
                    if (v40 < (*(unsigned __int16 *)(v34 + 12) - 16) >> 1)
                    {
                      v41 = v34 + *(unsigned __int16 *)(v34 + 2 * v40 + 16);
                      if ((*(_WORD *)(v41 + 4) & 6) == 4)
                        *(_QWORD *)(v39 + 72) = v41 + *(unsigned __int16 *)(v41 + 6) + 8;
                    }
                  }
                }
              }
            }
            v28 = (_QWORD *)*v28;
          }
          while (v28);
        }
        v42 = *(_WORD *)(a2 + 64);
        v43 = *(_WORD *)(*(_QWORD *)(a2 + 40) + 6);
        if (v42)
        {
          *(_WORD *)(a2 + 64) = v42 - 1;
          if (v42 == 1)
            *(_DWORD *)(a2 + 68) &= ~1u;
          else
            --*(_WORD *)(a2 + 66);
        }
        result = mdb_rebalance(a2);
        v44 = *(_WORD *)(*(_QWORD *)(a2 + 40) + 6) - v43 + v42;
        *(_WORD *)(a2 + 64) = v44;
        *(_WORD *)(a2 + 66) = v44 - 1;
        return result;
      }
      v23 = *(_QWORD **)(v21 + 72);
      if (*v23)
      {
        v24 = mdb_mid2l_search(*(unsigned int **)(v21 + 72), *(_QWORD *)v19);
        if (*v23 >= (unint64_t)v24 && v23[2 * v24] == v20)
        {
          if (v23[2 * v24 + 1] != v19)
          {
            *(_DWORD *)(a1 + 68) &= 0xFFFFFFFC;
            *(_DWORD *)(v21 + 124) |= 2u;
            return 4294936517;
          }
          v22 = *(_WORD *)(v19 + 10);
          goto LABEL_35;
        }
      }
    }
    result = mdb_midl_append((unint64_t **)(v21 + 40), v20);
    if ((_DWORD)result)
      return result;
    v25 = *(_WORD *)(v19 + 10);
    goto LABEL_36;
  }
  v53 = **(unsigned int **)(a1 + 40);
  v54 = (unsigned int *)(v4 + 16);
  if ((*(_WORD *)(v4 + 12) & 0xFFFE) == 0x10)
    goto LABEL_21;
  v15 = 0;
  v16 = v7 >> 1;
  while (1)
  {
    result = mdb_node_add(a2, (unsigned __int16)v16, (const void **)&v53, 0, 0, 0);
    if ((_DWORD)result)
      return result;
    v54 = (unsigned int *)((char *)v54 + v53);
    ++v15;
    LOWORD(v16) = v16 + 1;
    if ((*(unsigned __int16 *)(v4 + 12) - 16) >> 1 <= (unsigned __int16)v15)
      goto LABEL_21;
  }
}

uint64_t mdb_page_search_lowest(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v5 = *(_QWORD *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
  result = mdb_page_get(a1, *(unsigned int *)(v5 + *(unsigned __int16 *)(v5 + 16)) | ((unint64_t)*(unsigned __int16 *)(v5 + *(unsigned __int16 *)(v5 + 16) + 4) << 32), &v5, 0);
  if (!(_DWORD)result)
  {
    *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = 0;
    v3 = *(unsigned __int16 *)(a1 + 64);
    if (v3 < 0x20)
    {
      v4 = v5;
      *(_WORD *)(a1 + 64) = v3 + 1;
      *(_WORD *)(a1 + 66) = v3;
      *(_QWORD *)(a1 + 8 * v3 + 72) = v4;
      *(_WORD *)(a1 + 2 * v3 + 328) = 0;
      return mdb_page_search_root(a1, 0, 4);
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 24) + 124) |= 2u;
      return 4294936509;
    }
  }
  return result;
}

uint64_t mdb_cmp_memnr(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  int v8;
  int v9;
  int v10;
  uint64_t result;

  v2 = a1[1];
  v3 = v2 + *a1;
  v4 = *a1 - *a2;
  v5 = v2 + (v4 & ~(v4 >> 63));
  if (v4 >= 1)
    v6 = 1;
  else
    v6 = *a1 - *a2;
  v7 = (unsigned __int8 *)(*a2 + a2[1] - 1);
  while (v3 > v5)
  {
    v9 = *(unsigned __int8 *)--v3;
    v8 = v9;
    v10 = *v7--;
    result = (v8 - v10);
    if (v8 != v10)
      return result;
  }
  if (v6 < 0)
    return -1;
  else
    return v6;
}

uint64_t mdb_cmp_memn(uint64_t *a1, uint64_t *a2)
{
  const void *v2;
  uint64_t v3;
  const void *v4;
  uint64_t v5;
  BOOL v6;
  int v7;
  unsigned int v8;
  uint64_t result;

  v3 = *a1;
  v2 = (const void *)a1[1];
  v5 = *a2;
  v4 = (const void *)a2[1];
  v7 = v3 - v5;
  v6 = v3 <= v5;
  if (v3 < v5)
    v7 = -1;
  if (v3 > v5)
    LODWORD(v3) = v5;
  if (v6)
    v8 = v7;
  else
    v8 = 1;
  LODWORD(result) = memcmp(v2, v4, v3);
  if ((_DWORD)result)
    return result;
  else
    return v8;
}

uint64_t mdb_midl_search(unsigned int *a1, unint64_t a2)
{
  unsigned int v2;
  int v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;

  v2 = *a1;
  if (!*a1)
    return 1;
  v3 = 0;
  do
  {
    v4 = v2 >> 1;
    v5 = v3 + (v2 >> 1) + 1;
    v6 = *(_QWORD *)&a1[2 * v5];
    if (v6 >= a2)
    {
      if (v6 <= a2)
        return v5;
      v4 = v2 + ~v4;
      v3 += (v2 >> 1) + 1;
    }
    v2 = v4;
  }
  while (v4);
  if (v6 <= a2)
    return v5;
  else
    return (v5 + 1);
}

_QWORD *mdb_midl_alloc(int a1)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = malloc_type_malloc(8 * (a1 + 2), 0x100004000313F17uLL);
  if (!v2)
    return 0;
  v2[1] = 0;
  v3 = v2 + 1;
  *v2 = a1;
  return v3;
}

void mdb_midl_free(uint64_t a1)
{
  if (a1)
    free((void *)(a1 - 8));
}

_QWORD *mdb_midl_shrink(uint64_t *a1)
{
  uint64_t v2;
  _QWORD *result;
  unint64_t v4;

  v2 = *a1;
  v4 = *(_QWORD *)(v2 - 8);
  result = (_QWORD *)(v2 - 8);
  if (v4 >= 0x20000)
  {
    result = malloc_type_realloc(result, 0x100008uLL, 0x100004000313F17uLL);
    if (result)
    {
      *result++ = 0x1FFFFLL;
      *a1 = (uint64_t)result;
    }
  }
  return result;
}

uint64_t mdb_midl_need(_DWORD **a1, int a2)
{
  _DWORD *v3;
  unint64_t v4;
  _DWORD *v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t result;

  v3 = *a1;
  v4 = (*v3 + a2);
  v6 = *((_QWORD *)v3 - 1);
  v5 = v3 - 2;
  if (v6 >= v4)
    return 0;
  v7 = ((_DWORD)v4 + (v4 >> 2) + 258) & 0xFFFFFF00;
  v8 = malloc_type_realloc(v5, 8 * v7, 0x100004000313F17uLL);
  if (!v8)
    return 12;
  v9 = v8;
  result = 0;
  *v9 = (v7 - 2);
  *a1 = v9 + 1;
  return result;
}

uint64_t mdb_midl_append(unint64_t **a1, unint64_t a2)
{
  unint64_t *v3;
  unint64_t v4;
  uint64_t result;
  unint64_t v7;

  v3 = *a1;
  v4 = **a1;
  if (v4 >= *(*a1 - 1))
  {
    if (mdb_midl_grow(a1, 0x1FFFF))
      return 12;
    v3 = *a1;
    v4 = **a1;
  }
  result = 0;
  v7 = v4 + 1;
  *v3 = v7;
  v3[v7] = a2;
  return result;
}

uint64_t mdb_midl_grow(_QWORD *a1, int a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t result;

  v4 = malloc_type_realloc((void *)(*a1 - 8), 8 * (*(_QWORD *)(*a1 - 8) + a2) + 16, 0x100004000313F17uLL);
  if (!v4)
    return 12;
  v5 = v4;
  result = 0;
  *v5 += a2;
  *a1 = v5 + 1;
  return result;
}

uint64_t mdb_midl_append_list(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v3 = *a1;
  v4 = **a1;
  v5 = *a2;
  if (v5 + v4 >= (unint64_t)*(*a1 - 1))
  {
    if (mdb_midl_grow(a1, v5))
      return 12;
    v3 = *a1;
    v4 = **a1;
    v5 = *a2;
  }
  memcpy(&v3[v4 + 1], a2 + 1, 8 * v5);
  result = 0;
  *v3 += *a2;
  return result;
}

uint64_t mdb_midl_append_range(uint64_t **a1, uint64_t a2, unsigned int a3)
{
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v10;
  uint64_t *v11;

  v5 = *a1;
  v6 = **a1;
  v7 = v6 + a3;
  if (v7 > *(*a1 - 1))
  {
    if (mdb_midl_grow(a1, a3 | 0x1FFFF))
      return 12;
    v5 = *a1;
  }
  *v5 = v7;
  if (a3)
  {
    v10 = a3;
    v11 = &v5[v6];
    do
      v11[v10--] = a2++;
    while ((_DWORD)v10);
  }
  return 0;
}

uint64_t *mdb_midl_xmerge(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *a2;
  v3 = *result;
  v4 = *result + *a2;
  *result = -1;
  if (v2)
  {
    v5 = result[v3];
    v6 = v4;
    do
    {
      v7 = a2[v2];
      if (v5 >= v7)
      {
        v9 = v3;
        v8 = v6;
      }
      else
      {
        do
        {
          v8 = v6 - 1;
          result[v6] = v5;
          v9 = v3 - 1;
          v5 = result[v3 - 1];
          --v6;
          --v3;
        }
        while (v5 < v7);
      }
      v6 = v8 - 1;
      result[v8] = v7;
      v3 = v9;
      --v2;
    }
    while (v2);
  }
  *result = v4;
  return result;
}

int *mdb_midl_sort(int *result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  int v11;
  int *v12;
  unint64_t v13;
  unint64_t v14;
  int *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  BOOL v22;
  _DWORD v23[64];
  uint64_t v24;

  LODWORD(v1) = 0;
  v24 = *MEMORY[0x1E0C80C00];
  v2 = *result;
  LODWORD(v3) = 1;
LABEL_2:
  while (2)
  {
    v4 = (int)v3 + 1;
    while (v2 - (int)v3 > 7)
    {
      v5 = (v2 + (int)v3) >> 1;
      v6 = *(_QWORD *)&result[2 * v5];
      *(_QWORD *)&result[2 * v5] = *(_QWORD *)&result[2 * v4];
      *(_QWORD *)&result[2 * v4] = v6;
      v7 = *(_QWORD *)&result[2 * (int)v3];
      v8 = *(_QWORD *)&result[2 * v2];
      if (v7 < v8)
      {
        *(_QWORD *)&result[2 * (int)v3] = v8;
        *(_QWORD *)&result[2 * v2] = v7;
        v6 = *(_QWORD *)&result[2 * v4];
        v8 = v7;
      }
      if (v6 < v8)
      {
        *(_QWORD *)&result[2 * v4] = v8;
        *(_QWORD *)&result[2 * v2] = v6;
        v6 = *(_QWORD *)&result[2 * v4];
      }
      v9 = *(_QWORD *)&result[2 * (int)v3];
      if (v9 < v6)
      {
        *(_QWORD *)&result[2 * (int)v3] = v6;
        *(_QWORD *)&result[2 * v4] = v9;
        v6 = v9;
      }
      v10 = v3 + 1;
      v11 = v2;
      while (1)
      {
        v12 = &result[2 * v10 + 2];
        do
        {
          v14 = *(_QWORD *)v12;
          v12 += 2;
          v13 = v14;
          ++v10;
        }
        while (v14 > v6);
        v15 = &result[2 * v11];
        do
        {
          v17 = *((_QWORD *)v15 - 1);
          v15 -= 2;
          v16 = v17;
          --v11;
        }
        while (v17 < v6);
        if (v11 + 1 <= v10)
          break;
        *((_QWORD *)v12 - 1) = v16;
        *(_QWORD *)v15 = v13;
      }
      *(_QWORD *)&result[2 * v4] = v16;
      *(_QWORD *)v15 = v6;
      v18 = (int)v1;
      v1 = (int)v1 + 2;
      if (v2 - v10 + 1 < v11 - (int)v3)
      {
        v23[(int)v1] = v11 - 1;
        v23[v18 + 1] = v3;
        LODWORD(v3) = v10;
        goto LABEL_2;
      }
      v23[v1] = v2;
      v23[v18 + 1] = v10;
      v2 = v11 - 1;
    }
    if (v2 > (int)v3)
    {
      v3 = (int)v3;
      do
      {
        v19 = v3++;
        v20 = *(_QWORD *)&result[2 * v3];
        if (v19 >= 1)
        {
          while (1)
          {
            v21 = *(_QWORD *)&result[2 * v19];
            if (v21 >= v20)
              break;
            *(_QWORD *)&result[2 * (v19 + 1)] = v21;
            v22 = __OFSUB__((_DWORD)v19, 1);
            LODWORD(v19) = v19 - 1;
            if (((int)v19 < 0) ^ v22 | ((_DWORD)v19 == 0))
            {
              LODWORD(v19) = 0;
              break;
            }
          }
        }
        *(_QWORD *)&result[2 * (int)v19 + 2] = v20;
      }
      while (v3 != v2);
    }
    if ((_DWORD)v1)
    {
      LODWORD(v3) = v23[(int)v1 - 1];
      v2 = v23[(int)v1];
      LODWORD(v1) = v1 - 2;
      continue;
    }
    return result;
  }
}

uint64_t mdb_mid2l_search(unsigned int *a1, unint64_t a2)
{
  unsigned int v2;
  int v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;

  v2 = *a1;
  if (!*a1)
    return 1;
  v3 = 0;
  do
  {
    v4 = v2 >> 1;
    v5 = v3 + (v2 >> 1) + 1;
    v6 = *(_QWORD *)&a1[4 * v5];
    if (v6 <= a2)
    {
      if (v6 >= a2)
        return v5;
      v4 = v2 + ~v4;
      v3 += (v2 >> 1) + 1;
    }
    v2 = v4;
  }
  while (v4);
  if (v6 >= a2)
    return v5;
  else
    return (v5 + 1);
}

__n128 mdb_mid2l_insert(unsigned int *a1, unint64_t *a2)
{
  unint64_t v4;
  unsigned int v5;
  __n128 result;
  unint64_t v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  __int128 v11;

  v4 = *a2;
  v5 = mdb_mid2l_search(a1, *a2);
  if (v5)
  {
    v7 = *(_QWORD *)a1;
    if ((*(_QWORD *)a1 < (unint64_t)v5 || *(_QWORD *)&a1[4 * v5] != v4) && v7 <= 0x1FFFE)
    {
      v8 = v7 + 1;
      *(_QWORD *)a1 = v7 + 1;
      if (v5 < (int)v7 + 1)
      {
        v9 = &a1[4 * v7 + 4];
        v10 = &a1[4 * v7];
        do
        {
          v11 = *(_OWORD *)v10;
          v10 -= 4;
          *(_OWORD *)v9 = v11;
          v9 -= 4;
          --v8;
        }
        while (v5 < v8);
      }
      result = *(__n128 *)a2;
      *(_OWORD *)&a1[4 * v5] = *(_OWORD *)a2;
    }
  }
  return result;
}

__n128 mdb_mid2l_append(uint64_t *a1, __n128 *a2)
{
  uint64_t v2;
  __n128 result;

  if ((unint64_t)*a1 <= 0x1FFFE)
  {
    v2 = *a1 + 1;
    *a1 = v2;
    result = *a2;
    *(__n128 *)&a1[2 * v2] = *a2;
  }
  return result;
}

void MTLArchiveUsageDB::store(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_182636000, MEMORY[0x1E0C81028], a3, "mdb_put error: %s", (uint8_t *)a2);
}

void MTLArchiveUsageDB::prune(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_182636000, MEMORY[0x1E0C81028], a3, "mdb_cursor_open error: %s", (uint8_t *)a2);
}

void MultiLevelCacheBase::initialize()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_182636000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "The primary shader cache is null. No shaders will be cached. This should not occur on a live system.", v0, 2u);
}

void makeShaderCacheWritableByAllUsers_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_182636000, MEMORY[0x1E0C81028], a3, "Metal: Call to MTLMakeShaderCacheWritableByAllUsers after the FS cache was already initialized: call ignored", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void setShaderCacheMainFolder_cold_1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(v0, v1, v2, v3, v4, 0x20u);
}

void MTLCompilerFSCache::openSync(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_182636000, MEMORY[0x1E0C81028], a3, "fscache_open returned a NULL pointer but no error.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void MTLCompilerFSCache::copyShaderCache(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_182636000, MEMORY[0x1E0C81028], a3, "Path set to copy Metal shader cache (%s) is not a directory", (uint8_t *)a2);
}

{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_182636000, MEMORY[0x1E0C81028], a3, "Path set to copy Metal shader cache (%s) does not exist", (uint8_t *)a2);
}

void MTLCompilerFSCache::copyShaderCache(uint64_t a1, uint64_t a2, uint8_t *buf)
{
  *(_DWORD *)buf = 136315394;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2080;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_182636000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failed to create %s directory in shader cache at location: %s", buf, 0x16u);
}

void MTLCompilerFSCache::flushElement(int a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "flushElement";
  v3 = 1024;
  v4 = a1;
  _os_log_error_impl(&dword_182636000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "@ %s(): fscache_element_get_data() failed with error = %d\n", (uint8_t *)&v1, 0x12u);
}

void MTLPipelineDataCache::open(int *a1, uint64_t a2, NSObject *a3)
{
  int v3;

  v3 = *a1;
  *(_DWORD *)a2 = 67109120;
  *(_DWORD *)(a2 + 4) = v3;
  OUTLINED_FUNCTION_4(&dword_182636000, a2, a3, "Mapping the pipeline data cache failed, errno %d", (uint8_t *)a2);
}

{
  int v3;

  v3 = *a1;
  *(_DWORD *)a2 = 67109120;
  *(_DWORD *)(a2 + 4) = v3;
  OUTLINED_FUNCTION_4(&dword_182636000, a2, a3, "fstat failed for the pipeline data cache, errno %d", (uint8_t *)a2);
}

void MTLPipelineDataCache::parseDataFileHeader()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_182636000, v0, v1, "The pipeline data cache is empty", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_182636000, v0, v1, "The pipeline data cache has an invalid data section", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_182636000, v0, v1, "The pipeline data cache has an invalid number of entries", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_182636000, v0, v1, "The pipeline data cache is not valid for the given system", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

uint64_t MTLPipelineDataCache::parseDataFileHeader(uint64_t a1, unsigned __int8 *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v10;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_182636000, v3, v4, "The pipeline data cache has an invalid entry", v5, v6, v7, v8, v10);
  return *a2 >> 7;
}

void getCacheMainFolder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_182636000, MEMORY[0x1E0C81028], a3, "Failed to get cache main folder: search path for cache directory had path count of 0", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_2(&dword_182636000, MEMORY[0x1E0C81028], a3, "Failed to get cache main folder: caches directory path was nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void getCacheMainFolder()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  __error();
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(v0, v1, v2, v3, v4, 0x1Cu);
}

{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(v0, v1, v2, v3, v4, 0xCu);
}

void getCacheMainFolder(uint64_t a1, const char *a2)
{
  void *v3;
  os_log_t v4;
  os_log_type_t v5;
  const char *v6;
  uint8_t *v7;

  __error();
  strnlen(a2, 0x400uLL);
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(v3, v4, v5, v6, v7, 0x22u);
}

void MetalScriptSerializer::addStitchedLibrary(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void _MTLCompilerWarningLog(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "localizedDescription"), "description"), "UTF8String");
  _os_log_error_impl(&dword_182636000, a2, OS_LOG_TYPE_ERROR, "Warning: %s", (uint8_t *)&v3, 0xCu);
}

void _MTLAddCompileLibraryPerformanceStatistics_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_182636000, MEMORY[0x1E0C81028], a3, "Failed to add compile time dictionary for library fom source", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void _MTLAddCompileDynamicLibraryPerformanceStatistics_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_182636000, MEMORY[0x1E0C81028], a3, "Failed to add compile time dictionary for dynamic library", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void _MTLAddCompileBinaryFunctionPerformanceStatistics_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_182636000, MEMORY[0x1E0C81028], a3, "Failed to add compile time dictionary for binary function", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<-[_MTLDevice initProgressTracking]::$_1 &&>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_182636000, MEMORY[0x1E0C81028], a3, "[metalBundle URLForResource:@\"MTLECBE\" withExtension:@\"metallib\"] failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

{
  OUTLINED_FUNCTION_0_0(&dword_182636000, MEMORY[0x1E0C81028], a3, "[NSBundle bundleWithIdentifier:@\"com.apple.Metal\"] failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void ___ZN21XPCCompilerConnection24DispatchLogReplayRequestEP18MTLCompilerRequestPKcPU27objcproto16OS_dispatch_data8NSObjectb_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_182636000, MEMORY[0x1E0C81028], a3, "MTLCompilerService: log replay resulted in %u error", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void XPCCompilerConnection::checkConnectionActive(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_182636000, MEMORY[0x1E0C81028], a3, "MTLCompiler: XPC connection is down (due to prior XPC_ERROR_CONNECTION_INVALID, is the OS shutting down?)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void XPCCompilerConnection::checkConnectionActive(double a1)
{
  float v1;
  _DWORD v2[2];
  __int16 v3;
  double v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2[0] = 67109376;
  v2[1] = 10;
  v3 = 2048;
  v4 = v1;
  _os_log_fault_impl(&dword_182636000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "MTLCompiler: failed to ping the compiler service %u times over %f ms", (uint8_t *)v2, 0x12u);
  OUTLINED_FUNCTION_3_0();
}

void XPCCompilerConnection::checkConnectionActive(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = a1;
  _os_log_error_impl(&dword_182636000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "MTLCompiler: Compiler encountered XPC_ERROR_CONNECTION_INVALID: %s (is the OS shutting down?)", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_3_0();
}

void ___ZN21XPCCompilerConnection20BuildRequestInternalEP18MTLCompilerRequestPKcPU27objcproto16OS_dispatch_data8NSObjectibU13block_pointerFvjPKvmS3_E_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_182636000, MEMORY[0x1E0C81028], a3, "Compiler failed to build request", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void ___ZN21XPCCompilerConnection20BuildRequestInternalEP18MTLCompilerRequestPKcPU27objcproto16OS_dispatch_data8NSObjectibU13block_pointerFvjPKvmS3_E_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_182636000, MEMORY[0x1E0C81028], a3, "Compiler failed with XPC_ERROR_CONNECTION_INTERRUPTED", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void ___ZN21XPCCompilerConnection20BuildRequestInternalEP18MTLCompilerRequestPKcPU27objcproto16OS_dispatch_data8NSObjectibU13block_pointerFvjPKvmS3_E_block_invoke_cold_3(uint64_t a1, uint64_t a2)
{
  int v2;
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 96) + 1;
  v3[0] = 67109378;
  v3[1] = v2;
  v4 = 2080;
  v5 = a2;
  _os_log_error_impl(&dword_182636000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "MTLCompiler: Compilation failed with XPC_ERROR_CONNECTION_INVALID on %d try: %s (is the OS shutting down?)", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_3_0();
}

void ___ZN21XPCCompilerConnection20BuildRequestInternalEP18MTLCompilerRequestPKcPU27objcproto16OS_dispatch_data8NSObjectibU13block_pointerFvjPKvmS3_E_block_invoke_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_182636000, MEMORY[0x1E0C81028], a3, "Compiler failed with XPC_ERROR_CONNECTION_INVALID", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void ___ZN21XPCCompilerConnection20BuildRequestInternalEP18MTLCompilerRequestPKcPU27objcproto16OS_dispatch_data8NSObjectibU13block_pointerFvjPKvmS3_E_block_invoke_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_182636000, MEMORY[0x1E0C81028], a3, "Compiler failed with XPC_ERROR_TERMINATION_IMMINENT", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void ___ZN21XPCCompilerConnection20BuildRequestInternalEP18MTLCompilerRequestPKcPU27objcproto16OS_dispatch_data8NSObjectibU13block_pointerFvjPKvmS3_E_block_invoke_cold_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_182636000, MEMORY[0x1E0C81028], a3, "Compiler failed with unknown XPC error", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void ___ZN28MonolithicCompilerConnection24DispatchLogReplayRequestEP18MTLCompilerRequestPKcPU27objcproto16OS_dispatch_data8NSObject_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_182636000, MEMORY[0x1E0C81028], a3, "MTLCompilerService log replay resulted in %u error", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void CompilerPluginInterface::CompilerPluginInterface(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = a1;
  _os_log_fault_impl(&dword_182636000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Failed to dlopen MTLCompiler framework with error: %s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_3_0();
}

void MTLVersionedDB::openDB(int a1, int a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109376;
  v2[1] = a1;
  v3 = 1024;
  v4 = a2;
  _os_log_error_impl(&dword_182636000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "db version mismatch: file %u, current %u", (uint8_t *)v2, 0xEu);
  OUTLINED_FUNCTION_3_0();
}

void MTLVersionedDB::openDB(char *a1, _QWORD *a2, int a3)
{
  _QWORD *v3;
  int v4;
  _QWORD *v5;
  __int16 v6;
  char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*a1 >= 0)
    v3 = a2;
  else
    v3 = (_QWORD *)*a2;
  v4 = 136315394;
  v5 = v3;
  v6 = 2080;
  v7 = mdb_strerror(a3);
  _os_log_error_impl(&dword_182636000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "mdb_env_open(\"%s\") error: %s", (uint8_t *)&v4, 0x16u);
}

void MTLVersionedDB::openDB(int a1)
{
  char *v1;
  uint64_t v2;
  int v3;
  char *v4;

  v1 = OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x1E0C80C00]);
  v3 = 136315138;
  v4 = v1;
  OUTLINED_FUNCTION_0(&dword_182636000, MEMORY[0x1E0C81028], v2, "mdb_env_create error: %s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3_0();
}

void MTLVersionedDB::MTLVersionedDB(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*((char *)a1 + 23) >= 0)
    v3 = a1;
  else
    v3 = (uint64_t *)*a1;
  v4 = 136315138;
  v5 = v3;
  OUTLINED_FUNCTION_0(&dword_182636000, MEMORY[0x1E0C81028], a3, "Failed to drop database %s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3_0();
}

void MTLVersionedDB::MTLVersionedDB()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_182636000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Database invalid - resetting", v0, 2u);
}

void MTLVersionedDB::Transaction::Transaction(int a1)
{
  char *v1;
  uint64_t v2;
  int v3;
  char *v4;

  v1 = OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x1E0C80C00]);
  v3 = 136315138;
  v4 = v1;
  OUTLINED_FUNCTION_0(&dword_182636000, MEMORY[0x1E0C81028], v2, "mdb_dbi_open error: %s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3_0();
}

{
  char *v1;
  uint64_t v2;
  int v3;
  char *v4;

  v1 = OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x1E0C80C00]);
  v3 = 136315138;
  v4 = v1;
  OUTLINED_FUNCTION_0(&dword_182636000, MEMORY[0x1E0C81028], v2, "mdb_txn_begin error: %s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3_0();
}

void MTLVersionedDB::Transaction::~Transaction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_182636000, MEMORY[0x1E0C81028], a3, "mdb_txn_commit error: %s", (uint8_t *)a2);
}

void MTLArchiveMapDB::store(char *a1, _QWORD *a2, uint64_t *a3)
{
  _QWORD *v3;
  uint64_t *v4;
  int v5;
  _QWORD *v6;
  __int16 v7;
  uint64_t *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (*a1 >= 0)
    v3 = a2;
  else
    v3 = (_QWORD *)*a2;
  if (*((char *)a3 + 23) >= 0)
    v4 = a3;
  else
    v4 = (uint64_t *)*a3;
  v5 = 136315394;
  v6 = v3;
  v7 = 2080;
  v8 = v4;
  _os_log_error_impl(&dword_182636000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "storeArchive('%s', '%s') invalid payload", (uint8_t *)&v5, 0x16u);
}

void MTLLibraryDataWithArchive::parseDynamicHeaderSection(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_182636000, MEMORY[0x1E0C81028], a3, "Invalid metallib file (reached unexpected end of file)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void MTLLibraryDataWithArchive::getFunctionAtOffset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_182636000, MEMORY[0x1E0C81028], a3, "Invalid metallib file (missing token)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void ___ZN17MTLLibraryBuilder18newLibraryWithFileEPU19objcproto9MTLDevice11objc_objectP8NSStringPP7NSError_block_invoke_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = a1;
  _os_log_error_impl(&dword_182636000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failed to open metal library with error: %s", (uint8_t *)&v1, 0xCu);
}

void MTLCompilerMachORequest::CreateMachOFile(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *__error();
  v3 = 136315394;
  v4 = a1;
  v5 = 1024;
  v6 = v2;
  _os_log_error_impl(&dword_182636000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cannot open mach-O (%s) with error:%i", (uint8_t *)&v3, 0x12u);
}

void SerializedLibraryInfo::deserializeStringArray(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_182636000, MEMORY[0x1E0C81028], a3, "Compiler deserialization error, could not deserialize array length.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<pixelFormatTypeMap(void)::$_0 &&>>(uint64_t a1, uint64_t a2)
{
  do
  {
    if (*(char *)(a1 - 9) < 0)
      operator delete(*(void **)(a1 - 32));
    if (*(char *)(a1 - 41) < 0)
      operator delete(*(void **)(a1 - 64));
    a1 -= 64;
  }
  while (a1 != a2);
}

void MTLFailureTypeGetErrorModeType_cold_1()
{
  __assert_rtn("MTLFailureTypeGetErrorModeType", "MTLDebug.mm", 130, "failureType < MTLFailureTypeCount");
}

void MTLFailureTypeSetErrorModeType_cold_1()
{
  __assert_rtn("MTLFailureTypeSetErrorModeType", "MTLDebug.mm", 142, "failureType < MTLFailureTypeCount");
}

void MTLReportFailure_cold_1(void *a1, const char *a2, int a3)
{
  __assert_rtn((const char *)0xFFFFFFFFFFFFFFFFLL, a2, a3, (const char *)objc_msgSend(a1, "UTF8String"));
}

void MTLGetEnvCase<MTLErrorModeType>(const char *a1, const char ***a2, const char ***a3)
{
  FILE **v5;
  const char **v6;
  const char **v7;
  const char *v8;

  v5 = (FILE **)MEMORY[0x1E0C80C10];
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "Invalid option for %s, valid options are:\n", a1);
  v6 = *a2;
  v7 = *a3;
  while (v6 != v7)
  {
    v8 = *v6;
    v6 += 2;
    fprintf(*v5, "\t%s\n", v8);
  }
  __assert_rtn("MTLGetEnvCase", "MTLUtils_Internal.h", 65, "0");
}

void MTLIOAccelCommandBufferStorageGrowSegmentList_cold_1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(v0, v1, v2, v3, v4, 0xCu);
}

void MTLIOAccelCommandBufferStorageGrowSegmentList_cold_2()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(v0, v1, v2, v3, v4, 0x22u);
}

void MTLIOAccelCommandBufferStorageGrowKernelCommandBuffer_cold_1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(v0, v1, v2, v3, v4, 0x28u);
}

void MTLIOAccelCommandBufferStorageAllocResourceAtIndex_cold_1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(v0, v1, v2, v3, v4, 0x12u);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x1E0C97CE8](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

uint64_t CFCopySearchPathForDirectoriesInDomains()
{
  return MEMORY[0x1E0C98370]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FE0](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1E0C99180](theString, prefix);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1E0C992D8](anURL, pathStyle);
}

uint64_t FPCommandBufferCommitted()
{
  return MEMORY[0x1E0D227A0]();
}

uint64_t FPCommandBufferCompleted()
{
  return MEMORY[0x1E0D227A8]();
}

uint64_t FPCommandBufferCreated()
{
  return MEMORY[0x1E0D227B0]();
}

uint64_t FPCommandBufferScheduled()
{
  return MEMORY[0x1E0D227B8]();
}

uint64_t IOAccelCommandQueueCreateWithQoS()
{
  return MEMORY[0x1E0D39DA8]();
}

uint64_t IOAccelCommandQueueGetGlobalTraceObjectID()
{
  return MEMORY[0x1E0D39DB0]();
}

uint64_t IOAccelCommandQueueRelease()
{
  return MEMORY[0x1E0D39DB8]();
}

uint64_t IOAccelCommandQueueSetDispatchQueue()
{
  return MEMORY[0x1E0D39DC0]();
}

uint64_t IOAccelCommandQueueSetPriorityAndBackground()
{
  return MEMORY[0x1E0D39DC8]();
}

uint64_t IOAccelCommandQueueSubmitCommandBuffers()
{
  return MEMORY[0x1E0D39DD0]();
}

uint64_t IOAccelDeviceCreateWithAPIProperty()
{
  return MEMORY[0x1E0D39DD8]();
}

uint64_t IOAccelDeviceGetConfig64()
{
  return MEMORY[0x1E0D39DE0]();
}

uint64_t IOAccelDeviceGetGlobalTraceObjectID()
{
  return MEMORY[0x1E0D39DE8]();
}

uint64_t IOAccelDeviceGetMaxResourceSize()
{
  return MEMORY[0x1E0D39DF0]();
}

uint64_t IOAccelDeviceGetNextGlobalTraceID()
{
  return MEMORY[0x1E0D39DF8]();
}

uint64_t IOAccelDeviceGetSharedMemorySize()
{
  return MEMORY[0x1E0D39E00]();
}

uint64_t IOAccelDeviceTraceEvent()
{
  return MEMORY[0x1E0D39E08]();
}

uint64_t IOAccelDeviceTraceObjectLabel()
{
  return MEMORY[0x1E0D39E10]();
}

uint64_t IOAccelInitCommPage()
{
  return MEMORY[0x1E0D39E18]();
}

uint64_t IOAccelMemoryInfoDeregisterAPICollectionBlock()
{
  return MEMORY[0x1E0D39E20]();
}

uint64_t IOAccelMemoryInfoRegisterAPICollectionBlock()
{
  return MEMORY[0x1E0D39E28]();
}

uint64_t IOAccelResourceCreate()
{
  return MEMORY[0x1E0D39E30]();
}

uint64_t IOAccelResourceCreateAllocationIdentifierSet()
{
  return MEMORY[0x1E0D39E38]();
}

uint64_t IOAccelResourceFinishEvent()
{
  return MEMORY[0x1E0D39E40]();
}

uint64_t IOAccelResourceGetClientShared()
{
  return MEMORY[0x1E0D39E48]();
}

uint64_t IOAccelResourceGetDataBytes()
{
  return MEMORY[0x1E0D39E50]();
}

uint64_t IOAccelResourceGetGPUVirtualAddress()
{
  return MEMORY[0x1E0D39E58]();
}

uint64_t IOAccelResourceGetGlobalTraceObjectID()
{
  return MEMORY[0x1E0D39E60]();
}

uint64_t IOAccelResourceGetProtectionOptions()
{
  return MEMORY[0x1E0D39E68]();
}

uint64_t IOAccelResourceGetResidentDataSize()
{
  return MEMORY[0x1E0D39E70]();
}

uint64_t IOAccelResourceListAddResource()
{
  return MEMORY[0x1E0D39E78]();
}

uint64_t IOAccelResourceListDestroy()
{
  return MEMORY[0x1E0D39E80]();
}

uint64_t IOAccelResourceListInit()
{
  return MEMORY[0x1E0D39E88]();
}

uint64_t IOAccelResourceListReset()
{
  return MEMORY[0x1E0D39E90]();
}

uint64_t IOAccelResourceRelease()
{
  return MEMORY[0x1E0D39E98]();
}

uint64_t IOAccelResourceSetPurgeable()
{
  return MEMORY[0x1E0D39EA0]();
}

uint64_t IOAccelResourceTestEvent()
{
  return MEMORY[0x1E0D39EA8]();
}

uint64_t IOAccelSharedAllocateFenceMemory()
{
  return MEMORY[0x1E0D39EB0]();
}

uint64_t IOAccelSharedCreate()
{
  return MEMORY[0x1E0D39EB8]();
}

uint64_t IOAccelSharedCreateDeviceShmem()
{
  return MEMORY[0x1E0D39EC0]();
}

uint64_t IOAccelSharedDestroyDeviceShmem()
{
  return MEMORY[0x1E0D39EC8]();
}

uint64_t IOAccelSharedGetAllocatedSize()
{
  return MEMORY[0x1E0D39ED0]();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1E0CBB668](*(_QWORD *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x1E0CBB680](*(_QWORD *)&bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1E0CBB698](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x1E0CBB6A0](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB6B8](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x1E0CBB6F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x1E0CBB988](*(_QWORD *)&entry, entryID);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1E0CBB9F0](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

Boolean IOSurfaceAllowsPixelSizeCasting(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBAC8](buffer);
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0CBBAE8](buffer, key);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBAF0](properties);
}

mach_port_t IOSurfaceCreateMachPort(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB00](buffer);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB38](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1E0CBBB40](buffer);
}

size_t IOSurfaceGetBytesPerElement(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB80](buffer);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB90](buffer);
}

size_t IOSurfaceGetElementHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBBF0](buffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC28](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC48](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC70](buffer);
}

IOSurfaceRef IOSurfaceLookupFromMachPort(mach_port_t port)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBD40](*(_QWORD *)&port);
}

uint64_t IOSurfaceSetOwnershipIdentity()
{
  return MEMORY[0x1E0CBBE28]();
}

kern_return_t IOSurfaceSetPurgeable(IOSurfaceRef buffer, uint32_t newState, uint32_t *oldState)
{
  return MEMORY[0x1E0CBBE30](buffer, *(_QWORD *)&newState, oldState);
}

uint64_t IOSurfaceSharedEventAddEventListener()
{
  return MEMORY[0x1E0CBBE58]();
}

uint64_t IOSurfaceSharedEventNotifyEventListener()
{
  return MEMORY[0x1E0CBBE68]();
}

uint64_t IOSurfaceSharedEventRemoveEventListener()
{
  return MEMORY[0x1E0CBBE70]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MTLGPUCompilerHashFunctionScript()
{
  return MEMORY[0x1E0D23580]();
}

uint64_t MTLGPUCompilerTimeStamp()
{
  return MEMORY[0x1E0D235A0]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFMZEnabled()
{
  return MEMORY[0x1E0C9A260]();
}

uint64_t _CFXPreferencesRegisterDefaultValues()
{
  return MEMORY[0x1E0C9A838]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t flatbuffers::GenerateText()
{
  return MEMORY[0x1E0DE6B28]();
}

uint64_t flatbuffers::Parser::Deserialize(flatbuffers::Parser *this, const unsigned __int8 *a2)
{
  return MEMORY[0x1E0DE6B38](this, a2);
}

uint64_t flatbuffers::Parser::Parse(flatbuffers::Parser *this, const char *a2, const char **a3, const char *a4)
{
  return MEMORY[0x1E0DE6B48](this, a2, a3, a4);
}

std::string::size_type std::string::copy(const std::string *this, std::string::value_type *__s, std::string::size_type __n, std::string::size_type __pos)
{
  return MEMORY[0x1E0DE41B8](this, __s, __n, __pos);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1E0DE41F0]();
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x1E0DE4240](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

uint64_t std::time_put<char,std::ostreambuf_iterator<char>>::put()
{
  return MEMORY[0x1E0DE4268]();
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
  MEMORY[0x1E0DE43A8](a1, a2, a3);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x1E0DE43B0](this, *(_QWORD *)&__ecode);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4420](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4440](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4448](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4468](this, __pos, __s);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
  MEMORY[0x1E0DE44A8](this, __requested_capacity);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

std::string *__cdecl std::string::operator=(std::string *this, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1E0DE44E0](this, __c);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1E0DE47A8]();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x1E0DE47C8](__s, __icase);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1E0DE48F8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x1E0DE4910](retstr, __s);
}

uint64_t std::__sort<std::__less<unsigned short,unsigned short> &,unsigned short *>()
{
  return MEMORY[0x1E0DE4B20]();
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x1E0DE4B88](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x1E0DE4B90](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1E0DE4D58](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1E0DE4D70](retstr, __val);
}

{
  return (std::string *)MEMORY[0x1E0DE4D80](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1E0DE4D88]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E0FDDEB0();
}

void operator delete(void *__p)
{
  off_1E0FDDEB8(__p);
}

uint64_t operator delete()
{
  return off_1E0FDDEC0();
}

uint64_t operator new[]()
{
  return off_1E0FDDEC8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E0FDDED0(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_1E0FDDED8(__sz, a2);
}

uint64_t operator new()
{
  return off_1E0FDDEE0();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x1E0DE50B0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

int asprintf_l(char **a1, locale_t a2, const char *a3, ...)
{
  return MEMORY[0x1E0C81610](a1, a2, a3);
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x1E0C81648](a1);
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

uint64_t atol(const char *a1)
{
  return MEMORY[0x1E0C81678](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t change_fdguard_np()
{
  return MEMORY[0x1E0C82620]();
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C82638](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5270](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5280](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82C18](queue, context, work);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x1E0C82CA0](data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CB0](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CC0](data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CD0](data, buffer_ptr, size_ptr);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CD8](data, offset, length);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1E0C82CE8](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x1E0C82F40](source, value);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82FA0](queue, context, work);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1E0C83030](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

BOOL dlopen_preflight(const char *__path)
{
  return MEMORY[0x1E0C83048](__path);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x1E0C830A0]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1E0C833B0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fprintf_l(FILE *a1, locale_t a2, const char *a3, ...)
{
  return MEMORY[0x1E0C83480](a1, a2, a3);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t fscache_close()
{
  return MEMORY[0x1E0CD0D50]();
}

uint64_t fscache_element_get_data()
{
  return MEMORY[0x1E0CD0D58]();
}

uint64_t fscache_find_and_retain()
{
  return MEMORY[0x1E0CD0D60]();
}

uint64_t fscache_get_cache_keys()
{
  return MEMORY[0x1E0CD0D68]();
}

uint64_t fscache_insert_and_retain()
{
  return MEMORY[0x1E0CD0D70]();
}

uint64_t fscache_open_with_key()
{
  return MEMORY[0x1E0CD0D78]();
}

uint64_t fscache_release()
{
  return MEMORY[0x1E0CD0D80]();
}

uint64_t fscache_remove_all()
{
  return MEMORY[0x1E0CD0D88]();
}

uint64_t fscache_remove_and_release()
{
  return MEMORY[0x1E0CD0D90]();
}

uint64_t fscache_sync_element()
{
  return MEMORY[0x1E0CD0D98]();
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1E0C83530](a1, a2, *(_QWORD *)&a3);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x1E0C83578](*(_QWORD *)&a1);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1E0C83580](a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83610](a1, a2, a3, a4, *(_QWORD *)&a5);
}

char *__cdecl getcwd(char *a1, size_t a2)
{
  return (char *)MEMORY[0x1E0C83648](a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

uint64_t kdebug_trace_string()
{
  return MEMORY[0x1E0C83A28]();
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1E0C83BA8](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C83D58](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C83E60](a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x1E0C83F08](memptr, alignment, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int msync(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C84210](a1, a2, *(_QWORD *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1E0DE7D00](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84BC8](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D18](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D20](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1E0C84D28](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D30](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1E0C84D48](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1E0C84D50](a1, a2, a3, a4);
}

void pthread_exit(void *a1)
{
  MEMORY[0x1E0C84D88](a1);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x1E0C84DD8](a1, a2);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

int pthread_key_delete(pthread_key_t a1)
{
  return MEMORY[0x1E0C84DE8](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E40](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E48](a1);
}

int pthread_mutexattr_setpshared(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1E0C84E58](a1, *(_QWORD *)&a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

int pthread_sigmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x1E0C84F28](*(_QWORD *)&a1, a2, a3);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84F68](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x1E0C850B8](__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

int sigwait(const sigset_t *a1, int *a2)
{
  return MEMORY[0x1E0C85410](a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1E0C85530](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

char *__cdecl strncat(char *__s1, const char *__s2, size_t __n)
{
  return (char *)MEMORY[0x1E0C855A0](__s1, __s2, __n);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

double strtod(const char *a1, char **a2)
{
  double result;

  MEMORY[0x1E0C85618](a1, a2);
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1E0C85790](*(_QWORD *)&a1);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

void uuid_generate(uuid_t out)
{
  MEMORY[0x1E0C85A18](out);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return MEMORY[0x1E0C85D48](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

uint64_t xpc_connection_copy_invalidation_reason()
{
  return MEMORY[0x1E0C85F80]();
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1E0C85F90](name, targetq);
}

uint64_t xpc_connection_kill()
{
  return MEMORY[0x1E0C86010]();
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

uint64_t xpc_connection_set_instance()
{
  return MEMORY[0x1E0C86090]();
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1E0C86188](ddata);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_object_t xpc_fd_create(int fd)
{
  return (xpc_object_t)MEMORY[0x1E0C864A0](*(_QWORD *)&fd);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

uint64_t xpc_mach_send_copy_right()
{
  return MEMORY[0x1E0C865D8]();
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x1E0C865E0]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

const char *mdb_version(_DWORD *a1, _DWORD *a2, _DWORD *a3)
{
  if (a1)
    *a1 = 0;
  if (a2)
    *a2 = 9;
  if (a3)
    *a3 = 70;
  return "LMDB 0.9.70: (December 19, 2015)";
}

uint64_t mdb_env_share_locks(uint64_t a1, int *a2)
{
  uint64_t result;
  int v5;
  __int128 v6;
  uint64_t v7;

  *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) = *(_QWORD *)(*(_QWORD *)(a1
                                                                  + 72
                                                                  + 8
                                                                  * ((*(_DWORD *)(a1 + 12) >> 25) & 1 ^ (*(_QWORD *)(*(_QWORD *)(a1 + 72) + 128) < *(_QWORD *)(*(_QWORD *)(a1 + 80) + 128))))
                                                      + 128);
  v7 = 0x100000000;
  v6 = xmmword_182809F60;
  do
  {
    result = fcntl(*(_DWORD *)(a1 + 4), 8, &v6);
    if (!(_DWORD)result)
      break;
    result = *__error();
  }
  while ((_DWORD)result == 4);
  if ((_DWORD)result)
    v5 = -1;
  else
    v5 = 0;
  *a2 = v5;
  return result;
}

uint64_t mdb_env_create(_QWORD *a1)
{
  _DWORD *v2;
  _DWORD *v3;
  int v4;
  uint64_t result;

  v2 = malloc_type_calloc(1uLL, 0xF8uLL, 0x10B004020E85D84uLL);
  if (!v2)
    return 12;
  v3 = v2;
  v2[6] = 126;
  *((_QWORD *)v2 + 4) = 0x200000002;
  *(_QWORD *)v2 = -1;
  v2[2] = -1;
  v2[10] = getpid();
  v4 = sysconf(29);
  result = 0;
  v3[5] = v4;
  *a1 = v3;
  return result;
}

uint64_t mdb_env_set_mapsize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  void *v4;
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  char *v8;
  unint64_t v9;

  v2 = a2;
  v4 = *(void **)(a1 + 56);
  if (!v4)
    goto LABEL_12;
  if (*(_QWORD *)(a1 + 96))
    return 22;
  v6 = *(_QWORD *)(a1
                 + 72
                 + 8
                 * ((*(_DWORD *)(a1 + 12) >> 25) & 1 ^ (*(_QWORD *)(*(_QWORD *)(a1 + 72) + 128) < *(_QWORD *)(*(_QWORD *)(a1 + 80) + 128))));
  if (!a2)
    v2 = *(_QWORD *)(v6 + 16);
  v7 = *(unsigned int *)(a1 + 16) + *(unsigned int *)(a1 + 16) * *(_QWORD *)(v6 + 120);
  if (v2 <= v7)
    v2 = v7;
  munmap(v4, *(_QWORD *)(a1 + 112));
  *(_QWORD *)(a1 + 112) = v2;
  v8 = (*(_BYTE *)(a1 + 12) & 1) != 0 ? *(char **)(a1 + 56) : 0;
  result = mdb_env_map(a1, v8);
  if (!(_DWORD)result)
  {
LABEL_12:
    *(_QWORD *)(a1 + 112) = v2;
    v9 = *(unsigned int *)(a1 + 16);
    result = 0;
    if ((_DWORD)v9)
      *(_QWORD *)(a1 + 128) = v2 / v9;
  }
  return result;
}

uint64_t mdb_env_map(uint64_t a1, char *a2)
{
  int v4;
  int v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_DWORD *)(a1 + 12);
  if ((v4 & 0x80000) != 0)
  {
    if (ftruncate(*(_DWORD *)a1, *(_QWORD *)(a1 + 112)) < 0)
      return *__error();
    v5 = 3;
  }
  else
  {
    v5 = 1;
  }
  v6 = (char *)mmap(a2, *(_QWORD *)(a1 + 112), v5, 1, *(_DWORD *)a1, 0);
  *(_QWORD *)(a1 + 56) = v6;
  if (v6 == (char *)-1)
  {
    *(_QWORD *)(a1 + 56) = 0;
    return *__error();
  }
  if ((v4 & 0x800000) != 0)
  {
    madvise(v6, *(_QWORD *)(a1 + 112), 1);
    v6 = *(char **)(a1 + 56);
  }
  if (a2 && v6 != a2)
    return 16;
  v7 = 0;
  v8 = (uint64_t)&v6[*(unsigned int *)(a1 + 16) + 16];
  *(_QWORD *)(a1 + 72) = v6 + 16;
  *(_QWORD *)(a1 + 80) = v8;
  return v7;
}

uint64_t mdb_env_set_maxdbs(uint64_t a1, int a2)
{
  uint64_t result;

  if (*(_QWORD *)(a1 + 56))
    return 22;
  result = 0;
  *(_DWORD *)(a1 + 36) = a2 + 2;
  return result;
}

uint64_t mdb_env_set_maxreaders(uint64_t a1, int a2)
{
  uint64_t result;

  result = 22;
  if (a2)
  {
    if (!*(_QWORD *)(a1 + 56))
    {
      result = 0;
      *(_DWORD *)(a1 + 24) = a2;
    }
  }
  return result;
}

uint64_t mdb_env_get_maxreaders(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  result = 22;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      *a2 = *(_DWORD *)(a1 + 24);
    }
  }
  return result;
}

uint64_t mdb_env_open(uint64_t a1, const char *a2, int a3, unsigned int a4)
{
  uint64_t v4;
  int v8;
  unsigned int v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  void *v25;
  int v26;

  v26 = -1;
  v4 = 22;
  if ((a3 & 0xFC00BFFE) != 0)
    return v4;
  if (*(_DWORD *)a1 != -1)
    return v4;
  v24 = 0;
  v25 = 0;
  v8 = *(_DWORD *)(a1 + 12) | a3;
  v4 = mdb_fname_init(a2, v8, (uint64_t)&v24);
  if ((_DWORD)v4)
    return v4;
  v9 = v8 | 0x20000000;
  if ((v8 & 0x20000) != 0)
  {
    v9 = v8 & 0xDFF7FFFF | 0x20000000;
  }
  else
  {
    v10 = mdb_midl_alloc(0x1FFFF);
    *(_QWORD *)(a1 + 200) = v10;
    if (!v10
      || (v11 = malloc_type_calloc(0x20000uLL, 0x10uLL, 0x108004057E67DB5uLL), (*(_QWORD *)(a1 + 208) = v11) == 0))
    {
      *(_DWORD *)(a1 + 12) = v9;
LABEL_35:
      v4 = 12;
      goto LABEL_36;
    }
  }
  *(_DWORD *)(a1 + 12) = v9;
  *(_QWORD *)(a1 + 48) = strdup(a2);
  *(_QWORD *)(a1 + 136) = malloc_type_calloc(*(unsigned int *)(a1 + 36), 0x30uLL, 0x1080040226B62D8uLL);
  *(_QWORD *)(a1 + 144) = malloc_type_calloc(*(unsigned int *)(a1 + 36), 2uLL, 0x1000040BDFB0063uLL);
  v12 = malloc_type_calloc(*(unsigned int *)(a1 + 36), 4uLL, 0x100004052888210uLL);
  *(_QWORD *)(a1 + 152) = v12;
  v13 = *(_QWORD *)(a1 + 136);
  if (!v13 || !*(_QWORD *)(a1 + 48))
    goto LABEL_35;
  v4 = 12;
  if (!*(_QWORD *)(a1 + 144) || !v12)
    goto LABEL_36;
  *(_QWORD *)(v13 + 16) = mdb_cmp_long;
  if ((v9 & 0x420000) == 0)
  {
    v4 = mdb_env_setup_locks(a1, (int *)&v24, a4, &v26);
    if ((_DWORD)v4)
      goto LABEL_36;
    if ((v9 & 0x2000000) != 0 && !v26)
    {
      v4 = 35;
      goto LABEL_36;
    }
  }
  v14 = v9 & 0x20000;
  if ((v9 & 0x20000) != 0)
    v15 = 0;
  else
    v15 = 514;
  v4 = mdb_fopen((unsigned int *)a1, (int *)&v24, v15, a4, (int *)a1);
  if ((_DWORD)v4)
    goto LABEL_36;
  if ((v9 & 0x420000) == 0x20000)
  {
    v4 = mdb_env_setup_locks(a1, (int *)&v24, a4, &v26);
    if ((_DWORD)v4)
      goto LABEL_36;
  }
  v4 = mdb_env_open2(a1, v9 & 0x2000000);
  if ((_DWORD)v4)
    goto LABEL_36;
  v4 = mdb_fopen((unsigned int *)a1, (int *)&v24, 20971521, a4, (int *)(a1 + 8));
  if ((_DWORD)v4)
    goto LABEL_36;
  if ((v9 & 0x2000000) != 0 || v26 < 1)
  {
    if (v14)
    {
      v4 = 0;
      goto LABEL_37;
    }
LABEL_32:
    v17 = *(_DWORD *)(a1 + 36);
    v18 = malloc_type_calloc(1uLL, *(unsigned int *)(a1 + 16), 0x78DA1B97uLL);
    *(_QWORD *)(a1 + 88) = v18;
    if (v18)
    {
      v19 = malloc_type_calloc(1uLL, 61 * v17 + 136, 0xC025CA4FuLL);
      if (v19)
      {
        v4 = 0;
        v19[11] = v19 + 17;
        v20 = *(unsigned int *)(a1 + 36);
        v21 = (uint64_t)&v19[6 * v20 + 17];
        v22 = v21 + 8 * v20;
        v19[12] = v22;
        v19[13] = v21;
        v19[14] = v22 + 4 * v20;
        v19[4] = a1;
        v19[10] = *(_QWORD *)(a1 + 136);
        *((_DWORD *)v19 + 31) = 1;
        *(_QWORD *)(a1 + 104) = v19;
        goto LABEL_37;
      }
    }
    goto LABEL_35;
  }
  v16 = mdb_env_share_locks(a1, &v26);
  if (!(v16 | v14))
    goto LABEL_32;
  v4 = v16;
  if ((_DWORD)v16)
LABEL_36:
    mdb_env_close1(a1);
LABEL_37:
  if (HIDWORD(v24))
    free(v25);
  return v4;
}

uint64_t mdb_fname_init(const char *a1, int a2, uint64_t a3)
{
  int v5;
  int v6;
  uint64_t result;
  char *v8;

  v5 = ~a2 & 0x404000;
  *(_DWORD *)(a3 + 4) = 0;
  v6 = strlen(a1);
  *(_DWORD *)a3 = v6;
  if (v5)
  {
    v8 = (char *)malloc_type_malloc(v6 + 10, 0x2E9E0525uLL);
    *(_QWORD *)(a3 + 8) = v8;
    if (v8)
    {
      *(_DWORD *)(a3 + 4) = 1;
      strcpy(v8, a1);
      return 0;
    }
    else
    {
      return 12;
    }
  }
  else
  {
    result = 0;
    *(_QWORD *)(a3 + 8) = a1;
  }
  return result;
}

uint64_t mdb_env_setup_locks(uint64_t a1, int *a2, unsigned __int16 a3, int *a4)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  off_t v10;
  int64_t v11;
  char *v12;
  _OWORD *v13;
  pthread_mutexattr_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (int *)(a1 + 4);
  v7 = mdb_fopen((unsigned int *)a1, a2, 16777734, a3, (int *)(a1 + 4));
  if (!(_DWORD)v7)
  {
    if ((*(_BYTE *)(a1 + 14) & 0x20) == 0)
    {
      v8 = pthread_key_create((pthread_key_t *)(a1 + 160), (void (__cdecl *)(void *))mdb_env_reader_dest);
      if ((_DWORD)v8)
        return v8;
      *(_DWORD *)(a1 + 12) |= 0x10000000u;
    }
    v16 = 0x300000000;
    v15 = (pthread_mutexattr_t)xmmword_182809F60;
    do
    {
      if (!fcntl(*v6, 8, &v15))
        goto LABEL_12;
      v9 = *__error();
    }
    while (v9 == 4);
    if (v9)
    {
      WORD2(v16) = 1;
      do
      {
        if (!fcntl(*v6, 9, &v15))
        {
          LODWORD(v8) = 0;
          goto LABEL_13;
        }
        v8 = *__error();
      }
      while ((_DWORD)v8 == 4);
      if (!(_DWORD)v8)
        goto LABEL_13;
      return v8;
    }
LABEL_12:
    LODWORD(v8) = 1;
LABEL_13:
    *a4 = v8;
    v10 = lseek(*v6, 0, 2);
    if (v10 != -1)
    {
      v11 = ((unint64_t)(*(_DWORD *)(a1 + 24) - 1) << 6) + 256;
      if (v10 >= v11 || *a4 < 1)
      {
        *(_DWORD *)(a1 + 24) = ((unint64_t)(v10 + 0x3FFFFFFF00) >> 6) + 1;
        v11 = v10;
      }
      else if (ftruncate(*v6, ((unint64_t)(*(_DWORD *)(a1 + 24) - 1) << 6) + 256))
      {
        return *__error();
      }
      v12 = (char *)mmap(0, v11, 3, 1, *v6, 0);
      if (v12 != (char *)-1)
      {
        *(_QWORD *)(a1 + 64) = v12;
        if (*a4 < 1)
        {
          if (*(_DWORD *)v12 != -1091583778)
            return 4294936503;
          if (*((_DWORD *)v12 + 1) != 774479874)
            return 4294936502;
          v8 = *__error();
          if (v8 <= 0x23 && ((1 << v8) & 0x800002001) != 0)
            return 0;
        }
        else
        {
          v15.__sig = 0;
          *(_QWORD *)v15.__opaque = 0;
          *(_OWORD *)(v12 + 24) = 0u;
          *(_OWORD *)(v12 + 40) = 0u;
          *(_OWORD *)(v12 + 56) = 0u;
          *(_OWORD *)(v12 + 72) = 0u;
          v13 = *(_OWORD **)(a1 + 64);
          v13[8] = 0u;
          v13[9] = 0u;
          v13[10] = 0u;
          v13[11] = 0u;
          v8 = pthread_mutexattr_init(&v15);
          if (!(_DWORD)v8)
          {
            v8 = pthread_mutexattr_setpshared(&v15, 1);
            if ((_DWORD)v8
              || (v8 = pthread_mutex_init((pthread_mutex_t *)(*(_QWORD *)(a1 + 64) + 24), &v15), (_DWORD)v8))
            {
              pthread_mutexattr_destroy(&v15);
            }
            else
            {
              v8 = pthread_mutex_init((pthread_mutex_t *)(*(_QWORD *)(a1 + 64) + 128), &v15);
              pthread_mutexattr_destroy(&v15);
              if (!(_DWORD)v8)
              {
                **(_DWORD **)(a1 + 64) = -1091583778;
                *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4) = 774479874;
                *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) = 0;
                *(_DWORD *)(*(_QWORD *)(a1 + 64) + 16) = 0;
              }
            }
          }
        }
        return v8;
      }
    }
    return *__error();
  }
  v8 = v7;
  if ((_DWORD)v7 == 30)
  {
    if ((*(_BYTE *)(a1 + 14) & 2) == 0)
      return 30;
    return 0;
  }
  return v8;
}

uint64_t mdb_fopen(unsigned int *a1, int *a2, int a3, unsigned int a4, int *a5)
{
  int v10;
  int v11;
  uint64_t result;

  if (a2[1])
    strcpy((char *)(*((_QWORD *)a2 + 1) + *a2), (&(&mdb_suffixes)[2 * (a3 == 16777734)])[((unint64_t)a1[3] >> 14) & 1]);
  v10 = open(*((const char **)a2 + 1), a3 & 0x1400A03, a4);
  v11 = v10;
  if (v10 == -1)
  {
    result = *__error();
  }
  else
  {
    if (a3 == 16779777 && a1[4] >= a1[5])
      fcntl(v10, 48, 1);
    result = 0;
  }
  *a5 = v11;
  return result;
}

uint64_t mdb_env_open2(uint64_t a1, int a2)
{
  int v4;
  int v5;
  char v6;
  char v7;
  int v8;
  uint64_t result;
  unsigned int v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  char v15;
  char *v16;
  unint64_t v17;
  _OWORD v18[9];
  __int128 __buf;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  unint64_t v28;
  uint64_t v29;

  v4 = 0;
  v29 = *MEMORY[0x1E0C80C00];
  v5 = *(_DWORD *)(a1 + 12);
  memset(v18, 0, 136);
  v28 = 0;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = 1;
  __buf = 0u;
  while (1)
  {
    v7 = v6;
    v8 = pread(*(_DWORD *)a1, &__buf, 0x98uLL, v4);
    if (v8 != 152)
      break;
    result = 4294936503;
    if ((BYTE10(__buf) & 8) == 0 || (_DWORD)v20 != -1091583778)
      goto LABEL_20;
    if (DWORD1(v20) != 1)
    {
      result = 4294936502;
      goto LABEL_20;
    }
    if (!v4)
      goto LABEL_9;
    if (!a2)
    {
      if (v28 <= *(_QWORD *)&v18[8])
        goto LABEL_10;
LABEL_9:
      v18[0] = v20;
      v18[4] = v24;
      v18[3] = v23;
      v18[2] = v22;
      v18[1] = v21;
      *(_QWORD *)&v18[8] = v28;
      v18[7] = v27;
      v18[6] = v26;
      v18[5] = v25;
      goto LABEL_10;
    }
    if (v28 < *(_QWORD *)&v18[8])
      goto LABEL_9;
LABEL_10:
    v6 = 0;
    v10 = DWORD2(v18[1]);
    v4 += DWORD2(v18[1]);
    if ((v7 & 1) == 0)
      goto LABEL_44;
  }
  if (!(v4 | v8))
  {
    result = 2;
    goto LABEL_20;
  }
  if ((v8 & 0x80000000) == 0)
  {
    result = 4294936503;
    goto LABEL_20;
  }
  result = *__error();
  if ((_DWORD)result)
  {
LABEL_20:
    if ((_DWORD)result != 2)
      return result;
    v11 = 0;
    v10 = *(_DWORD *)(a1 + 20);
    if (v10 >= 0x8000)
      v10 = 0x8000;
    *(_DWORD *)(a1 + 16) = v10;
    memset((char *)&v18[1] + 8, 0, 112);
    *(_OWORD *)((char *)v18 + 8) = 0u;
    *(_QWORD *)&v18[0] = 0x1BEEFC0DELL;
    WORD6(v18[1]) = *(_WORD *)(a1 + 12) | 8;
    *(_QWORD *)&v18[4] = -1;
    *(_QWORD *)&v18[1] = 0x100000;
    v12 = *(_QWORD *)(a1 + 112);
    DWORD2(v18[1]) = v10;
    v18[7] = xmmword_1827FCE30;
    if (!v12)
      goto LABEL_24;
  }
  else
  {
    v10 = DWORD2(v18[1]);
LABEL_44:
    *(_DWORD *)(a1 + 16) = v10;
    v12 = *(_QWORD *)(a1 + 112);
    v11 = 1;
    if (!v12)
    {
LABEL_24:
      v12 = *(_QWORD *)&v18[1];
      *(_QWORD *)(a1 + 112) = *(_QWORD *)&v18[1];
    }
  }
  v13 = v10 * *((_QWORD *)&v18[7] + 1) + v10;
  if (v12 < v13)
  {
    *(_QWORD *)(a1 + 112) = v13;
    v12 = v13;
  }
  *(_QWORD *)&v18[1] = v12;
  v14 = v5 & 1;
  if ((v11 & 1) != 0)
  {
LABEL_28:
    v15 = 1;
LABEL_33:
    if (v14)
      v16 = (char *)*((_QWORD *)&v18[0] + 1);
    else
      v16 = 0;
    result = mdb_env_map(a1, v16);
    if (!(_DWORD)result)
    {
      if ((v15 & 1) != 0)
        goto LABEL_41;
      if (v14)
        *((_QWORD *)&v18[0] + 1) = *(_QWORD *)(a1 + 56);
      result = mdb_env_init_meta(a1, (uint64_t)v18);
      if (!(_DWORD)result)
      {
LABEL_41:
        result = 0;
        v17 = *(unsigned int *)(a1 + 16);
        *(_DWORD *)(a1 + 216) = ((v17 - 16) >> 3) - 1;
        *(_DWORD *)(a1 + 220) = (((v17 - 16) >> 1) & 0x7FFFFFFE) - 2;
        *(_QWORD *)(a1 + 128) = *(_QWORD *)(a1 + 112) / v17;
      }
    }
  }
  else
  {
    if ((v5 & 1) != 0)
    {
      v15 = 0;
      v14 = 1;
      goto LABEL_33;
    }
    result = mdb_env_init_meta(a1, (uint64_t)v18);
    if (!(_DWORD)result)
    {
      v14 = 0;
      goto LABEL_28;
    }
  }
  return result;
}

uint64_t mdb_env_close1(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;
  int v6;
  pid_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _DWORD *v11;
  int v12;

  if ((*(_BYTE *)(result + 15) & 0x20) != 0)
  {
    v1 = result;
    v2 = *(void **)(result + 136);
    if (v2)
    {
      v3 = *(unsigned int *)(v1 + 36);
      if ((int)v3 >= 3)
      {
        v4 = v3 + 1;
        do
          free(*(void **)(*(_QWORD *)(v1 + 136) + 48 * (v4-- - 2) + 8));
        while (v4 > 3);
        v2 = *(void **)(v1 + 136);
      }
      free(v2);
    }
    free(*(void **)(v1 + 88));
    free(*(void **)(v1 + 152));
    free(*(void **)(v1 + 144));
    free(*(void **)(v1 + 48));
    free(*(void **)(v1 + 208));
    free(*(void **)(v1 + 104));
    mdb_midl_free(*(_QWORD *)(v1 + 200));
    if ((*(_BYTE *)(v1 + 15) & 0x10) != 0)
      pthread_key_delete(*(_QWORD *)(v1 + 160));
    v5 = *(void **)(v1 + 56);
    if (v5)
      munmap(v5, *(_QWORD *)(v1 + 112));
    v6 = *(_DWORD *)(v1 + 8);
    if (v6 != -1)
      close(v6);
    if (*(_DWORD *)v1 != -1)
      close(*(_DWORD *)v1);
    if (*(_QWORD *)(v1 + 64))
    {
      v7 = getpid();
      v8 = *(unsigned int *)(v1 + 28);
      if ((int)v8 >= 1)
      {
        v9 = v8 + 1;
        do
        {
          v10 = *(_QWORD *)(v1 + 64) + ((unint64_t)(v9 - 2) << 6);
          v12 = *(_DWORD *)(v10 + 200);
          v11 = (_DWORD *)(v10 + 200);
          if (v12 == v7)
            *v11 = 0;
          --v9;
        }
        while (v9 > 1);
      }
      munmap(*(void **)(v1 + 64), ((unint64_t)(*(_DWORD *)(v1 + 24) - 1) << 6) + 256);
    }
    result = *(unsigned int *)(v1 + 4);
    if ((_DWORD)result != -1)
      result = close(result);
    *(_DWORD *)(v1 + 12) &= 0xCFFFFFFF;
  }
  return result;
}

void mdb_env_close(_QWORD *a1)
{
  _QWORD *v2;

  if (a1)
  {
    while (1)
    {
      v2 = (_QWORD *)a1[24];
      if (!v2)
        break;
      a1[24] = *v2;
      free(v2);
    }
    mdb_env_close1((uint64_t)a1);
    free(a1);
  }
}

size_t mdb_env_copyfd2(int *a1, int a2, char a3)
{
  size_t v5;
  void *v6;
  pthread_mutex_t *v7;
  uint64_t v8;
  size_t v9;
  int v10;
  uint64_t v11;
  char *v12;
  ssize_t v13;
  size_t v14;
  uint64_t v15;
  int v16;
  _QWORD *v17;
  uint64_t v19;
  uint64_t v20;
  int v21;
  off_t st_size;
  unint64_t v23;
  size_t v24;
  ssize_t v25;
  _WORD *v26;
  uint64_t v27;
  char *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD v45[2];
  stat memptr;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  unint64_t v63;
  pthread_t v64;
  _QWORD *v65;
  void *v66[2];
  pthread_mutex_t v67;
  pthread_cond_t v68;
  void *v69[2];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  if ((a3 & 1) != 0)
  {
    v73 = 0;
    v71 = 0u;
    v72 = 0u;
    *(_OWORD *)v69 = 0u;
    v70 = 0u;
    memset(&v68, 0, sizeof(v68));
    *(_OWORD *)v66 = 0u;
    memset(&v67, 0, sizeof(v67));
    v64 = 0;
    v65 = 0;
    v5 = pthread_mutex_init(&v67, 0);
    if ((_DWORD)v5)
      return v5;
    v9 = pthread_cond_init(&v68, 0);
    if ((_DWORD)v9)
    {
      v5 = v9;
      pthread_mutex_destroy(&v67);
      return v5;
    }
    *(_QWORD *)&memptr.st_dev = 0;
    v14 = malloc_type_posix_memalign((void **)&memptr, a1[5], 0x200000uLL, 0xA3EC04BCuLL);
    if ((_DWORD)v14)
    {
      v5 = v14;
      goto LABEL_59;
    }
    v15 = *(_QWORD *)&memptr.st_dev;
    v69[0] = *(void **)&memptr.st_dev;
    bzero(*(void **)&memptr.st_dev, 0x200000uLL);
    *(_QWORD *)&v72 = 2;
    v69[1] = (void *)(v15 + 0x100000);
    v66[0] = a1;
    DWORD2(v72) = a2;
    v5 = pthread_create(&v64, 0, (void *(__cdecl *)(void *))mdb_env_copythr, v66);
    if ((_DWORD)v5)
    {
LABEL_59:
      free(v69[0]);
      pthread_cond_destroy(&v68);
      pthread_mutex_destroy(&v67);
      if (!(_DWORD)v5)
        return HIDWORD(v73);
      return v5;
    }
    v63 = 0;
    v16 = mdb_txn_begin((uint64_t)a1, 0, 0x20000, (uint64_t *)&v65);
    if (v16)
    {
      v17 = v65;
      goto LABEL_57;
    }
    v26 = v69[0];
    bzero(v69[0], (2 * a1[4]));
    *(_QWORD *)v26 = 0;
    v26[5] = 8;
    *((_QWORD *)v26 + 2) = 0x1BEEFC0DELL;
    *((_QWORD *)v26 + 4) = *((_QWORD *)a1 + 14);
    v27 = a1[4];
    *((_DWORD *)v26 + 10) = v27;
    v26[22] = *((_WORD *)a1 + 6) | 8;
    *((_QWORD *)v26 + 10) = -1;
    *((_OWORD *)v26 + 8) = xmmword_1827FCE30;
    *((_QWORD *)v26 + 3) = *(_QWORD *)(*((_QWORD *)a1 + 9) + 8);
    v28 = (char *)v69[0] + v27;
    *(_QWORD *)v28 = 1;
    *((_WORD *)v28 + 5) = 8;
    *((_OWORD *)v28 + 1) = *((_OWORD *)v26 + 1);
    v29 = *((_OWORD *)v26 + 2);
    v30 = *((_OWORD *)v26 + 3);
    v31 = *((_OWORD *)v26 + 4);
    *((_OWORD *)v28 + 5) = *((_OWORD *)v26 + 5);
    *((_OWORD *)v28 + 4) = v31;
    *((_OWORD *)v28 + 3) = v30;
    *((_OWORD *)v28 + 2) = v29;
    v32 = *((_OWORD *)v26 + 6);
    v33 = *((_OWORD *)v26 + 7);
    v34 = *((_OWORD *)v26 + 8);
    *((_QWORD *)v28 + 18) = *((_QWORD *)v26 + 18);
    *((_OWORD *)v28 + 8) = v34;
    *((_OWORD *)v28 + 7) = v33;
    *((_OWORD *)v28 + 6) = v32;
    v17 = v65;
    v35 = v65[11];
    v63 = *(_QWORD *)(v35 + 88);
    if (v63 == -1)
    {
      v42 = *(unsigned __int16 *)(v35 + 52);
      *((_WORD *)v28 + 46) = v42;
      v38 = -1;
      if (!v42)
        goto LABEL_54;
    }
    else
    {
      v62 = 0;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v47 = 0u;
      memset(&memptr, 0, sizeof(memptr));
      v45[0] = 0;
      v45[1] = 0;
      v43 = 0;
      v44 = 0;
      mdb_cursor_init((uint64_t)&memptr, (uint64_t)v65, 0, 0);
      for (i = 0; ; i += *v44)
      {
        v16 = mdb_cursor_get((uint64_t)&memptr, v45, &v43, 8);
        if (v16)
          break;
      }
      if (v16 != -30798)
        goto LABEL_57;
      v37 = v17[11];
      v38 = v17[2] + ~(*(_QWORD *)(v37 + 8) + i + *(_QWORD *)(v37 + 16) + *(_QWORD *)(v37 + 24));
      *((_QWORD *)v28 + 17) = v38;
      v39 = *(_OWORD *)(v37 + 48);
      v40 = *(_OWORD *)(v37 + 64);
      v41 = *(_QWORD *)(v37 + 80);
      *(_OWORD *)(v28 + 104) = v40;
      *(_OWORD *)(v28 + 88) = v39;
      *((_QWORD *)v28 + 15) = v41;
      *((_QWORD *)v28 + 16) = v38;
    }
    *((_QWORD *)v28 + 18) = 1;
LABEL_54:
    LODWORD(v71) = 2 * a1[4];
    v66[1] = v17;
    v16 = mdb_env_cwalk((uint64_t)v66, &v63, 0);
    if (!v16)
    {
      if (v63 == v38)
      {
LABEL_58:
        mdb_env_cthr_toggle((uint64_t)v66, 17);
        v5 = pthread_join(v64, 0);
        mdb_txn_abort((uint64_t)v17);
        goto LABEL_59;
      }
      v16 = -30784;
    }
LABEL_57:
    HIDWORD(v73) = v16;
    goto LABEL_58;
  }
  v66[0] = 0;
  v5 = mdb_txn_begin((uint64_t)a1, 0, 0x20000, (uint64_t *)v66);
  if (!(_DWORD)v5)
  {
    if (*((_QWORD *)a1 + 8))
    {
      v6 = v66[0];
      mdb_txn_end((unsigned int *)v66[0], 4);
      v7 = (pthread_mutex_t *)(*((_QWORD *)a1 + 8) + 128);
      v5 = pthread_mutex_lock(v7);
      if ((_DWORD)v5)
      {
LABEL_28:
        mdb_txn_abort((uint64_t)v66[0]);
        return v5;
      }
      v8 = mdb_txn_renew0((uint64_t)v6);
      if ((_DWORD)v8)
      {
        v5 = v8;
        pthread_mutex_unlock(v7);
        goto LABEL_28;
      }
    }
    else
    {
      v7 = 0;
    }
    v10 = a1[4];
    v11 = (2 * v10);
    v12 = (char *)*((_QWORD *)a1 + 7);
    if ((_DWORD)v11)
    {
      v5 = (2 * v10);
      while (1)
      {
        v13 = write(a2, v12, v5);
        if (v13 < 0)
        {
          v5 = *__error();
          goto LABEL_25;
        }
        if (!v13)
          break;
        v12 += v13;
        v5 -= v13;
        if (!v5)
          goto LABEL_25;
      }
      v5 = 5;
    }
    else
    {
      v5 = 0;
    }
LABEL_25:
    if (v7)
      pthread_mutex_unlock(v7);
    if ((_DWORD)v5)
      goto LABEL_28;
    v19 = *((_QWORD *)v66[0] + 2);
    v20 = a1[4];
    v21 = *a1;
    memset(&memptr, 0, sizeof(memptr));
    if (fstat(v21, &memptr))
    {
      v5 = *__error();
      if ((_DWORD)v5)
        goto LABEL_28;
      st_size = 0;
    }
    else
    {
      st_size = v19 * v20;
      if ((unint64_t)(v19 * v20) >= memptr.st_size)
        st_size = memptr.st_size;
    }
    v23 = st_size - v11;
    if (st_size == v11)
    {
      v5 = 0;
    }
    else
    {
      while (1)
      {
        if (v23 >= 0x40000000)
          v24 = 0x40000000;
        else
          v24 = v23;
        v25 = write(a2, v12, v24);
        if (v25 < 0)
        {
          v5 = *__error();
          goto LABEL_28;
        }
        if (!v25)
          break;
        v5 = 0;
        v12 += v25;
        v23 -= v25;
        if (!v23)
          goto LABEL_28;
      }
      v5 = 5;
    }
    goto LABEL_28;
  }
  return v5;
}

size_t mdb_env_copyfd(int *a1, int a2)
{
  return mdb_env_copyfd2(a1, a2, 0);
}

size_t mdb_env_copy2(unsigned int *a1, const char *a2, char a3)
{
  size_t v5;
  int v6;
  int v8;
  uint64_t v9;
  void *v10;

  v9 = 0;
  v10 = 0;
  v8 = -1;
  v5 = mdb_fname_init(a2, a1[3] | 0x400000, (uint64_t)&v9);
  if (!(_DWORD)v5)
  {
    v5 = mdb_fopen(a1, (int *)&v9, 16779777, 0x1B6u, &v8);
    if (HIDWORD(v9))
      free(v10);
    if (!(_DWORD)v5)
    {
      v6 = v8;
      v5 = mdb_env_copyfd2((int *)a1, v8, a3);
      if (close(v6) < 0 && !(_DWORD)v5)
        return *__error();
    }
  }
  return v5;
}

size_t mdb_env_copy(unsigned int *a1, const char *a2)
{
  return mdb_env_copy2(a1, a2, 0);
}

uint64_t mdb_env_set_flags(uint64_t a1, int a2, int a3)
{
  uint64_t result;
  int v5;

  if ((a2 & 0xFEEAFFFF) != 0)
    return 22;
  result = 0;
  if (a3)
    v5 = *(_DWORD *)(a1 + 12) | a2;
  else
    v5 = *(_DWORD *)(a1 + 12) & ~a2;
  *(_DWORD *)(a1 + 12) = v5;
  return result;
}

uint64_t mdb_env_get_flags(uint64_t a1, int *a2)
{
  uint64_t result;

  result = 22;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      *a2 = *(_DWORD *)(a1 + 12) & 0x3FF4001;
    }
  }
  return result;
}

uint64_t mdb_env_set_userctx(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (!a1)
    return 22;
  result = 0;
  *(_QWORD *)(a1 + 232) = a2;
  return result;
}

uint64_t mdb_env_get_userctx(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 232);
  return result;
}

uint64_t mdb_env_set_assert(uint64_t a1)
{
  if (a1)
    return 0;
  else
    return 22;
}

uint64_t mdb_env_get_path(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  result = 22;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      *a2 = *(_QWORD *)(a1 + 48);
    }
  }
  return result;
}

uint64_t mdb_env_get_fd(_DWORD *a1, _DWORD *a2)
{
  uint64_t result;

  result = 22;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      *a2 = *a1;
    }
  }
  return result;
}

__n128 mdb_env_stat(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  __n128 result;

  if (a1)
  {
    if (a2)
    {
      v2 = *(_QWORD *)(a1
                     + 72
                     + 8
                     * ((*(_DWORD *)(a1 + 12) >> 25) & 1 ^ (*(_QWORD *)(*(_QWORD *)(a1 + 72) + 128) < *(_QWORD *)(*(_QWORD *)(a1 + 80) + 128))));
      v3 = *(unsigned __int16 *)(v2 + 78);
      *(_DWORD *)a2 = *(_DWORD *)(a1 + 16);
      *(_DWORD *)(a2 + 4) = v3;
      *(_OWORD *)(a2 + 8) = *(_OWORD *)(v2 + 80);
      result = *(__n128 *)(v2 + 96);
      *(__n128 *)(a2 + 24) = result;
    }
  }
  return result;
}

uint64_t mdb_env_info(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  int v8;

  v2 = 22;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 72);
    v5 = *(_QWORD *)(a1 + 80);
    v3 = a1 + 72;
    v6 = *(_QWORD **)(v3
                    + 8
                    * ((*(_DWORD *)(v3 - 60) >> 25) & 1 ^ (*(_QWORD *)(v4 + 128) < *(_QWORD *)(v5 + 128))));
    *(_QWORD *)a2 = v6[1];
    *(_QWORD *)(a2 + 16) = v6[15];
    *(_QWORD *)(a2 + 24) = v6[16];
    *(_QWORD *)(a2 + 8) = *(_QWORD *)(v3 + 40);
    *(_DWORD *)(a2 + 32) = *(_DWORD *)(v3 - 48);
    v7 = *(_QWORD *)(v3 - 8);
    if (v7)
      v8 = *(_DWORD *)(v7 + 16);
    else
      v8 = 0;
    v2 = 0;
    *(_DWORD *)(a2 + 36) = v8;
  }
  return v2;
}

__n128 mdb_stat(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  __n128 result;
  _OWORD v9[31];
  _OWORD v10[24];
  uint64_t v11;

  if (a1
    && a3
    && *(_DWORD *)(a1 + 120) > a2
    && (*(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) & 8) != 0
    && (*(_BYTE *)(a1 + 124) & 0x13) == 0)
  {
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) & 2) != 0)
    {
      v11 = 0;
      memset(v10, 0, sizeof(v10));
      memset(v9, 0, sizeof(v9));
      mdb_cursor_init((uint64_t)v10, a1, a2, (uint64_t)v9);
    }
    v6 = *(_QWORD *)(a1 + 88);
    *(_DWORD *)a3 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v7 = v6 + 48 * a2;
    *(_DWORD *)(a3 + 4) = *(unsigned __int16 *)(v7 + 6);
    *(_OWORD *)(a3 + 8) = *(_OWORD *)(v7 + 8);
    result = *(__n128 *)(v7 + 24);
    *(__n128 *)(a3 + 24) = result;
  }
  return result;
}

uint64_t mdb_env_get_maxkeysize()
{
  return 511;
}

uint64_t mdb_reader_list(uint64_t a1, uint64_t (*a2)(const char *, uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t (*v6)(const char *, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  char __str[64];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1)
  {
    v6 = a2;
    if (a2)
    {
      v7 = *(_QWORD *)(a1 + 64);
      if (v7)
      {
        v8 = *(unsigned int *)(v7 + 16);
        if (!(_DWORD)v8)
          return v6("(no active readers)\n", a3);
        result = 0;
        v9 = v7 + 208;
        v10 = 1;
        do
        {
          if (*(_DWORD *)(v9 - 8))
          {
            if (*(_QWORD *)(v9 - 16) == -1)
              snprintf(__str, 0x40uLL, "%10d %zx -\n");
            else
              snprintf(__str, 0x40uLL, "%10d %zx %zu\n");
            if (v10)
            {
              result = a2("    pid     thread     txnid\n", a3);
              if ((result & 0x80000000) != 0)
                return result;
            }
            result = a2(__str, a3);
            if ((result & 0x80000000) != 0)
              return result;
            v10 = 0;
            v6 = a2;
          }
          v9 += 64;
          --v8;
        }
        while (v8);
        if (v10)
          return v6("(no active readers)\n", a3);
      }
      else
      {
        return a2("(no reader locks)\n", a3);
      }
    }
  }
  return result;
}

uint64_t mdb_reader_check(uint64_t a1, _DWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int *v7;
  uint64_t v8;
  int v9;
  pthread_mutex_t *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  _DWORD *v26;
  uint64_t v27;
  uint64_t v29;

  if (!a1)
    return 22;
  if (a2)
    *a2 = 0;
  v4 = *(_QWORD *)(a1 + 64);
  if (!v4)
    return 0;
  v5 = *(unsigned int *)(v4 + 16);
  v6 = (unsigned int *)malloc_type_malloc(4 * (v5 + 1), 0x100004052888210uLL);
  if (!v6)
    return 12;
  v7 = v6;
  *v6 = 0;
  if ((_DWORD)v5)
  {
    v8 = 0;
    v9 = 0;
    v10 = (pthread_mutex_t *)(v4 + 24);
    v11 = *(_QWORD *)(a1 + 64);
    v12 = v11 + 192;
    v29 = v11 + 200;
    while (1)
    {
      v13 = *(_DWORD *)(v12 + (v8 << 6) + 8);
      if (v13 && v13 != *(_DWORD *)(a1 + 40))
      {
        v14 = *v7;
        if ((_DWORD)v14)
        {
          v15 = 0;
          v16 = *v7;
          do
          {
            while (1)
            {
              v17 = v16 >> 1;
              v18 = v15 + (v16 >> 1) + 1;
              v19 = v13 - v7[v18];
              if (v19 >= 0)
                break;
              v16 >>= 1;
              if (!v17)
                goto LABEL_17;
            }
            if (!v19)
              goto LABEL_36;
            v16 += ~v17;
            v15 = v18;
          }
          while (v16);
LABEL_17:
          v20 = v19 <= 0 ? v18 : v18 + 1;
        }
        else
        {
          v20 = 1;
        }
        v21 = (v14 + 1);
        *v7 = v21;
        if (v21 > v20)
        {
          v22 = v21;
          do
            v7[v22--] = v7[v14--];
          while (v20 < (int)v14 + 1);
          v21 = v14 + 1;
        }
        v7[v21] = v13;
        if (!mdb_reader_pid(a1, 7, v13))
        {
          v23 = pthread_mutex_lock(v10);
          if ((_DWORD)v23)
          {
            v27 = v23;
            goto LABEL_43;
          }
          if (mdb_reader_pid(a1, 7, v13))
            v24 = v5;
          else
            v24 = v8;
          if (v24 < v5)
          {
            v25 = v5 - v24;
            v26 = (_DWORD *)(v29 + (v24 << 6));
            do
            {
              if (*v26 == v13)
              {
                *v26 = 0;
                ++v9;
              }
              v26 += 16;
              --v25;
            }
            while (v25);
          }
          pthread_mutex_unlock(v10);
        }
      }
LABEL_36:
      if (++v8 == v5)
        goto LABEL_42;
    }
  }
  v9 = 0;
LABEL_42:
  v27 = 0;
LABEL_43:
  free(v7);
  if (a2)
    *a2 = v9;
  return v27;
}

uint64_t mdb_env_init_meta(uint64_t a1, uint64_t a2)
{
  size_t v4;
  char *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  char *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  size_t v20;
  int v21;
  uint64_t v22;

  v4 = *(unsigned int *)(a1 + 16);
  v5 = (char *)malloc_type_calloc(2uLL, v4, 0xB4D7345BuLL);
  if (!v5)
    return 12;
  v6 = v5;
  *(_QWORD *)v5 = 0;
  *((_WORD *)v5 + 5) = 8;
  *((_OWORD *)v5 + 1) = *(_OWORD *)a2;
  v7 = *(_OWORD *)(a2 + 16);
  v8 = *(_OWORD *)(a2 + 32);
  v9 = *(_OWORD *)(a2 + 48);
  *((_OWORD *)v5 + 5) = *(_OWORD *)(a2 + 64);
  *((_OWORD *)v5 + 4) = v9;
  *((_OWORD *)v5 + 3) = v8;
  *((_OWORD *)v5 + 2) = v7;
  v10 = *(_OWORD *)(a2 + 80);
  v11 = *(_OWORD *)(a2 + 96);
  v12 = *(_OWORD *)(a2 + 112);
  *((_QWORD *)v5 + 18) = *(_QWORD *)(a2 + 128);
  *((_OWORD *)v5 + 8) = v12;
  *((_OWORD *)v5 + 7) = v11;
  *((_OWORD *)v5 + 6) = v10;
  v13 = &v5[v4];
  *(_QWORD *)v13 = 1;
  *((_WORD *)v13 + 5) = 8;
  *((_OWORD *)v13 + 1) = *(_OWORD *)a2;
  v14 = *(_OWORD *)(a2 + 16);
  v15 = *(_OWORD *)(a2 + 32);
  v16 = *(_OWORD *)(a2 + 48);
  *((_OWORD *)v13 + 5) = *(_OWORD *)(a2 + 64);
  *((_OWORD *)v13 + 4) = v16;
  *((_OWORD *)v13 + 3) = v15;
  *((_OWORD *)v13 + 2) = v14;
  v17 = *(_OWORD *)(a2 + 80);
  v18 = *(_OWORD *)(a2 + 96);
  v19 = *(_OWORD *)(a2 + 112);
  *((_QWORD *)v13 + 18) = *(_QWORD *)(a2 + 128);
  *((_OWORD *)v13 + 8) = v19;
  *((_OWORD *)v13 + 7) = v18;
  *((_OWORD *)v13 + 6) = v17;
  v20 = (2 * v4);
  while (1)
  {
    v21 = pwrite(*(_DWORD *)a1, v6, v20, 0);
    if (v21 != -1)
      break;
    if (*__error() != 4)
      goto LABEL_11;
  }
  if (v21 < 0)
  {
LABEL_11:
    v22 = *__error();
    goto LABEL_12;
  }
  if ((_DWORD)v20 == v21)
    v22 = 0;
  else
    v22 = 28;
LABEL_12:
  free(v6);
  return v22;
}

uint64_t mdb_env_copythr(uint64_t a1)
{
  int v2;
  uint64_t i;
  int v4;
  uint64_t v5;
  _DWORD *v6;
  int v7;
  int v8;
  uint64_t v9;
  char *v10;
  int *v11;
  const void **v12;
  unsigned int v13;
  BOOL v14;
  int v15;
  int v17;
  sigset_t v18;

  v18 = 4096;
  v2 = pthread_sigmask(1, &v18, 0);
  if (v2)
    *(_DWORD *)(a1 + 196) = v2;
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  for (i = 0; ; i ^= 1uLL)
  {
    while (1)
    {
      v4 = *(_DWORD *)(a1 + 192);
      if (v4)
        break;
      pthread_cond_wait((pthread_cond_t *)(a1 + 80), (pthread_mutex_t *)(a1 + 16));
    }
    if (v4 == 16)
      break;
    v5 = a1 + 4 * i;
    v8 = *(_DWORD *)(v5 + 160);
    v6 = (_DWORD *)(v5 + 160);
    v7 = v8;
    v9 = a1 + 8 * i;
    v10 = *(char **)(v9 + 128);
    v11 = v6 + 2;
    v12 = (const void **)(v9 + 144);
    while (1)
    {
      if (v7 >= 1)
      {
        while (1)
        {
          if (*(_DWORD *)(a1 + 196))
            goto LABEL_20;
          v13 = write(*(_DWORD *)(a1 + 184), v10, v7);
          if ((v13 & 0x80000000) != 0)
            break;
          if (!v13)
          {
            v15 = 5;
LABEL_19:
            *(_DWORD *)(a1 + 196) = v15;
            goto LABEL_20;
          }
          v10 += v13;
          v14 = __OFSUB__(v7, v13);
          v7 -= v13;
          if ((v7 < 0) ^ v14 | (v7 == 0))
            goto LABEL_20;
        }
        v15 = *__error();
        if (!v15)
          goto LABEL_20;
        if (v15 == 32)
        {
          v17 = 0;
          sigwait(&v18, &v17);
          v15 = 32;
        }
        goto LABEL_19;
      }
LABEL_20:
      v7 = *v11;
      if (!*v11)
        break;
      v10 = (char *)*v12;
      *v11 = 0;
    }
    *v6 = 0;
    --*(_DWORD *)(a1 + 192);
    pthread_cond_signal((pthread_cond_t *)(a1 + 80));
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  return 0;
}

uint64_t mdb_env_cwalk(uint64_t a1, unint64_t *a2, char a3)
{
  unint64_t v4;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int16 v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  int v15;
  _WORD *v16;
  unsigned int v17;
  unsigned int v18;
  __int16 v19;
  char *v20;
  unsigned __int16 v21;
  char *i;
  uint64_t v23;
  __int16 v24;
  char *v25;
  char **v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _WORD *v31;
  char *v32;
  __int16 v33;
  char *v34;
  __int128 v35;
  __int128 v36;
  char *v37;
  __int128 v38;
  __int128 v39;
  char *v40;
  unint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  unsigned int *v47;
  uint64_t v48;
  unsigned int v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  int v59;
  uint64_t v60;
  void *__src[2];
  __int128 v62;
  __int128 v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _OWORD v69[20];
  uint64_t v70;

  v70 = 0;
  memset(v69, 0, sizeof(v69));
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v4 = *a2;
  if (v4 == -1)
    return 0;
  LOWORD(v69[0]) = 1;
  *((_QWORD *)&v66 + 1) = *(_QWORD *)(a1 + 8);
  DWORD1(v69[0]) = *(_DWORD *)(*((_QWORD *)&v66 + 1) + 124) & 0xA0000;
  v7 = mdb_page_get((uint64_t)&v65, v4, (unint64_t *)v69 + 1, 0);
  if (!(_DWORD)v7)
  {
    v7 = mdb_page_search_root((uint64_t)&v65, 0, 4);
    if (!(_DWORD)v7)
    {
      v8 = malloc_type_malloc(*(_DWORD *)(*(_QWORD *)a1 + 16) * LOWORD(v69[0]), 0xFFCC827BuLL);
      if (v8)
      {
        v9 = v8;
        v10 = WORD1(v69[0]);
        if (WORD1(v69[0]))
        {
          v11 = 0;
          LODWORD(v12) = *(_DWORD *)(*(_QWORD *)a1 + 16);
          v13 = (char *)v8;
          do
          {
            mdb_page_copy(v13, *((_WORD **)v69 + v11 + 1), v12);
            *((_QWORD *)v69 + v11 + 1) = v13;
            v12 = *(unsigned int *)(*(_QWORD *)a1 + 16);
            v13 += v12;
            ++v11;
            v10 = WORD1(v69[0]);
          }
          while (v11 < WORD1(v69[0]));
        }
        else
        {
          v13 = (char *)v8;
        }
        if (LOWORD(v69[0]))
        {
          v58 = v9;
          v15 = *(_DWORD *)(a1 + 188);
          v59 = a3 & 4;
          while (1)
          {
            v16 = (_WORD *)*((_QWORD *)v69 + v10 + 1);
            v64 = v16;
            v17 = (unsigned __int16)v16[6] - 16;
            v18 = v17 >> 1;
            v19 = v16[5];
            if ((v19 & 2) != 0)
            {
              if (v19 & 0x20 | v59)
                v27 = 0;
              else
                v27 = v17 >= 2;
              if (v27)
              {
                if (v18 <= 1)
                  v28 = 1;
                else
                  v28 = v18;
                v29 = -v28;
                v30 = 8;
                v60 = -v28;
                do
                {
                  v31 = v64;
                  v32 = (char *)v64 + *((unsigned __int16 *)v64 + v30);
                  v33 = *((_WORD *)v32 + 2);
                  if ((v33 & 1) != 0)
                  {
                    __src[0] = 0;
                    if (v64 != v13)
                    {
                      *((_QWORD *)v69 + WORD1(v69[0]) + 1) = v13;
                      mdb_page_copy(v13, v31, *(_DWORD *)(*(_QWORD *)a1 + 16));
                      v64 = v13;
                      v32 = &v13[*(unsigned __int16 *)&v13[2 * v30]];
                    }
                    v40 = &v32[*((unsigned __int16 *)v32 + 3)];
                    v41 = *((_QWORD *)v40 + 1);
                    *((_QWORD *)v40 + 1) = *(_QWORD *)(a1 + 176);
                    v23 = mdb_page_get((uint64_t)&v65, v41, (unint64_t *)__src, 0);
                    if ((_DWORD)v23)
                      goto LABEL_59;
                    v42 = *(_DWORD *)(a1 + 4 * v15 + 160);
                    if (v42 < 0x100000)
                    {
                      v43 = v15;
                    }
                    else
                    {
                      v23 = mdb_env_cthr_toggle(a1, 1);
                      if ((_DWORD)v23)
                        goto LABEL_59;
                      v15 = *(_DWORD *)(a1 + 188);
                      v43 = v15;
                      v42 = *(_DWORD *)(a1 + 4 * v15 + 160);
                    }
                    v44 = a1 + 8 * v43;
                    v45 = a1 + 4 * v43;
                    v46 = (_QWORD *)(*(_QWORD *)(v44 + 128) + v42);
                    v47 = (unsigned int *)__src[0];
                    memcpy(v46, __src[0], *(unsigned int *)(*(_QWORD *)a1 + 16));
                    *v46 = *(_QWORD *)(a1 + 176);
                    *(_QWORD *)(a1 + 176) += v47[3];
                    v48 = *(_QWORD *)a1;
                    *(_DWORD *)(v45 + 160) += *(_DWORD *)(*(_QWORD *)a1 + 16);
                    v49 = v47[3];
                    if (v49 >= 2)
                    {
                      *(_DWORD *)(v45 + 168) = *(_DWORD *)(v48 + 16) * (v49 - 1);
                      *(_QWORD *)(v44 + 144) = (char *)v47 + *(unsigned int *)(v48 + 16);
                      v23 = mdb_env_cthr_toggle(a1, 1);
                      if ((_DWORD)v23)
                        goto LABEL_59;
                      v15 = *(_DWORD *)(a1 + 188);
                    }
                    v29 = v60;
                  }
                  else if ((v33 & 2) != 0)
                  {
                    v62 = 0u;
                    v63 = 0u;
                    *(_OWORD *)__src = 0u;
                    if (v64 != v13)
                    {
                      *((_QWORD *)v69 + WORD1(v69[0]) + 1) = v13;
                      mdb_page_copy(v13, v31, *(_DWORD *)(*(_QWORD *)a1 + 16));
                      v64 = v13;
                      v32 = &v13[*(unsigned __int16 *)&v13[2 * v30]];
                    }
                    v34 = &v32[*((unsigned __int16 *)v32 + 3) + 8];
                    v35 = *(_OWORD *)v34;
                    v36 = *((_OWORD *)v34 + 2);
                    v62 = *((_OWORD *)v34 + 1);
                    v63 = v36;
                    *(_OWORD *)__src = v35;
                    *(_DWORD *)(a1 + 188) = v15;
                    v23 = mdb_env_cwalk(a1, (char *)&v63 + 8, *((_WORD *)v32 + 2) & 4);
                    if ((_DWORD)v23)
                      goto LABEL_59;
                    v15 = *(_DWORD *)(a1 + 188);
                    v37 = &v32[*((unsigned __int16 *)v32 + 3) + 8];
                    v39 = v62;
                    v38 = v63;
                    *(_OWORD *)v37 = *(_OWORD *)__src;
                    *((_OWORD *)v37 + 1) = v39;
                    *((_OWORD *)v37 + 2) = v38;
                  }
                  ++v30;
                }
                while (v29 + v30 != 8);
              }
            }
            else
            {
              v20 = (char *)&v65 + 2 * v10;
              v21 = *((_WORD *)v20 + 164) + 1;
              *((_WORD *)v20 + 164) = v21;
              if (v18 > v21)
              {
                for (i = (char *)v16 + (unsigned __int16)v16[v21 + 8];
                      ;
                      i = &v25[*(unsigned __int16 *)&v25[2 * *((unsigned __int16 *)&v69[16] + WORD1(v69[0]) + 4) + 16]])
                {
                  v23 = mdb_page_get((uint64_t)&v65, *(unsigned int *)i | ((unint64_t)*((unsigned __int16 *)i + 2) << 32), (unint64_t *)&v64, 0);
                  if ((_DWORD)v23)
                    break;
                  v10 = WORD1(v69[0]) + 1;
                  WORD1(v69[0]) = v10;
                  v24 = ++LOWORD(v69[0]);
                  *((_WORD *)&v69[16] + v10 + 4) = 0;
                  v25 = (char *)v64;
                  v26 = (char **)v69 + v10 + 1;
                  if ((*((_BYTE *)v64 + 10) & 1) == 0)
                  {
                    *v26 = (char *)v64;
                    goto LABEL_56;
                  }
                  mdb_page_copy(*v26, v64, *(_DWORD *)(*(_QWORD *)a1 + 16));
                }
LABEL_59:
                v7 = v23;
                goto LABEL_60;
              }
            }
            v50 = *(_DWORD *)(a1 + 4 * v15 + 160);
            if (v50 < 0x100000)
            {
              v51 = v15;
            }
            else
            {
              v23 = mdb_env_cthr_toggle(a1, 1);
              if ((_DWORD)v23)
                goto LABEL_59;
              v15 = *(_DWORD *)(a1 + 188);
              v51 = v15;
              v50 = *(_DWORD *)(a1 + 4 * v15 + 160);
            }
            v52 = a1 + 4 * v51;
            v53 = *(_QWORD *)(a1 + 8 * v51 + 128) + v50;
            mdb_page_copy((char *)v53, v64, *(_DWORD *)(*(_QWORD *)a1 + 16));
            v54 = *(_QWORD *)(a1 + 176);
            *(_QWORD *)(a1 + 176) = v54 + 1;
            *(_QWORD *)v53 = v54;
            *(_DWORD *)(v52 + 160) += *(_DWORD *)(*(_QWORD *)a1 + 16);
            v55 = WORD1(v69[0]);
            if (!WORD1(v69[0]))
            {
              v7 = 0;
              *a2 = *(_QWORD *)v53;
              goto LABEL_60;
            }
            v56 = *((_QWORD *)v69 + WORD1(v69[0]));
            v57 = v56
                + *(unsigned __int16 *)(v56
                                      + 2 * *((unsigned __int16 *)&v69[16] + WORD1(v69[0]) + 3)
                                      + 16);
            *(_DWORD *)v57 = *(_QWORD *)v53;
            *(_WORD *)(v57 + 4) = *(_DWORD *)(v53 + 4);
            if (!LOWORD(v69[0]))
              goto LABEL_63;
            if (!--LOWORD(v69[0]))
              break;
            v10 = v55 - 1;
            WORD1(v69[0]) = v10;
            v24 = 1;
LABEL_56:
            if (!v24)
            {
LABEL_63:
              v7 = 0;
              goto LABEL_60;
            }
          }
          v7 = 0;
          DWORD1(v69[0]) &= ~1u;
LABEL_60:
          v9 = v58;
        }
        else
        {
          v7 = 0;
        }
        free(v9);
      }
      else
      {
        return 12;
      }
    }
  }
  return v7;
}

uint64_t mdb_env_cthr_toggle(uint64_t a1, int a2)
{
  pthread_mutex_t *v4;
  int v5;

  v4 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  *(_DWORD *)(a1 + 192) += a2;
  pthread_cond_signal((pthread_cond_t *)(a1 + 80));
  while ((*(_BYTE *)(a1 + 192) & 2) != 0)
    pthread_cond_wait((pthread_cond_t *)(a1 + 80), v4);
  pthread_mutex_unlock(v4);
  v5 = *(_DWORD *)(a1 + 188) ^ a2 & 1;
  *(_DWORD *)(a1 + 188) = v5;
  *(_DWORD *)(a1 + 4 * v5 + 160) = 0;
  return *(unsigned int *)(a1 + 196);
}

