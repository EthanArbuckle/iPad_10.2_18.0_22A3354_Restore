uint64_t mio_elf_hash(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  char *v3;
  unint64_t i;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if (a2 < 4)
  {
    v2 = 0;
    i = a2;
  }
  else
  {
    v2 = 0;
    v3 = (char *)(a1 + 3);
    for (i = a2; i > 3; i -= 4)
    {
      v5 = *(v3 - 3) + 16 * v2;
      v6 = *(v3 - 2) + 16 * ((v5 >> 24) & 0xF0 ^ v5);
      v7 = *(v3 - 1) + 16 * ((v6 >> 24) & 0xF0 ^ v6);
      v8 = *v3 + 16 * ((v7 >> 24) & 0xF0 ^ v7);
      v2 = (v8 >> 24) & 0xF0 ^ v8;
      v3 += 4;
    }
  }
  switch(i)
  {
    case 1uLL:
      goto LABEL_11;
    case 2uLL:
LABEL_10:
      v10 = *(char *)(a2 + a1 - 2) + 16 * v2;
      v2 = (v10 >> 24) & 0xF0 ^ v10;
LABEL_11:
      v11 = *(char *)(a2 + a1 - 1) + 16 * v2;
      return (v11 >> 24) & 0xF0 ^ v11;
    case 3uLL:
      v9 = *(char *)(a2 + a1 - 3) + 16 * v2;
      v2 = (v9 >> 24) & 0xF0 ^ v9;
      goto LABEL_10;
  }
  return v2;
}

uint64_t MIOVideoTrackTypeInfoFromUTI(void *a1)
{
  id v1;
  uint64_t v2;
  unint64_t v3;

  v1 = objc_retainAutorelease(a1);
  v2 = objc_msgSend(v1, "UTF8String");
  v3 = objc_msgSend(v1, "lengthOfBytesUsingEncoding:", 4);

  return mio_elf_hash(v2, v3);
}

id MIOKnownTrackTypeDescription(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MIOKnownTrackTypeDescription_knownTypes;
  if (!MIOKnownTrackTypeDescription_knownTypes)
  {
    v8[0] = &unk_24CA5B4F0;
    v8[1] = &unk_24CA5B508;
    v9[0] = CFSTR("com.apple.mio.tracktype.AlphaDataOnly");
    v9[1] = CFSTR("com.apple.mio.tracktype.NoVideoData");
    v8[2] = &unk_24CA5B520;
    v8[3] = &unk_24CA5B538;
    v9[2] = CFSTR("com.apple.mio.tracktype.IRData");
    v9[3] = CFSTR("com.apple.mio.tracktype.RasterOrientedVideoData");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)MIOKnownTrackTypeDescription_knownTypes;
    MIOKnownTrackTypeDescription_knownTypes = v3;

    v2 = (void *)MIOKnownTrackTypeDescription_knownTypes;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_21067790C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210677A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_210677CF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_210677FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_210678284(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_2106783FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21067875C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2106794C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210679534(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106795B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210679654(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106797BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21067992C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106799A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210679B08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210679B90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210679D0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210679E54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210679F9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067A924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  void *v24;
  void *v25;

  _Unwind_Resume(a1);
}

void sub_21067ADC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_21067AF60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21067B030(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067B204(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21067B358(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21067B3EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21067B498(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21067B5B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_21067B6E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_21067B83C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067B90C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067B9DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067BAAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067BBF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067BEA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067BF74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067C1C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067C278(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067C3C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067C5A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067C698(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067CA50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_21067CC20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067CDE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067D1D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067D280(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21067D344(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21067D5B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067D7B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067D8F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067DA24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067DB58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067E018(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067E338(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v8 = v4;

  _Unwind_Resume(a1);
}

void sub_21067E5AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21067E648(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067E6E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_21067E7D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21067E864(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067E8A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067EA94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21067EB78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_21067ECDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21067F768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21067FA98(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21067FBD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21067FCEC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_2106804C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_210680B6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210680BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MIOMonochrome2ByteToy416FrameProcessor;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_210680DB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210681140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_210681458(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_2106817F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210681888(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210681954(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210681C50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210681DC0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf)
{
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;

  if (a2 == 1)
  {
    v12 = objc_begin_catch(a1);
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_210675000, v13, OS_LOG_TYPE_ERROR, "Cannot convert pixel buffer. (%{public}@)", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot convert pixel buffer. (%@)"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", v11, v14, 20);

    objc_end_catch();
    JUMPOUT(0x210681D88);
  }
  _Unwind_Resume(a1);
}

void sub_21068213C(_Unwind_Exception *a1, int a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v7;

  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot create pixel buffer pool for adjusting Bytes Per Row. (%@)"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", v3, v7, 19);

    objc_end_catch();
    JUMPOUT(0x210682130);
  }

  _Unwind_Resume(a1);
}

void sub_210682660(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106828EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210682AA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_210682C50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_210682D88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210682E58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_210682FC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210683194(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2106832D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_210683498(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_210683574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21068366C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::vector<CMTime>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - (_BYTE *)*a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL)
      std::vector<CMTime>::__throw_length_error[abi:ne180100]();
    v5 = ((_BYTE *)a1[1] - (_BYTE *)*a1) / 24;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CMTime>>(v3, a2);
    v7 = &v6[24 * v5];
    v9 = &v6[24 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *(_OWORD *)(v10 - 24);
        *((_QWORD *)v12 - 1) = *((_QWORD *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v13;
        v12 -= 24;
        v10 -= 24;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void sub_210683998(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void std::vector<CMTime>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24CA43F48, MEMORY[0x24BEDAAF0]);
}

void sub_210683C2C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CMTime>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void sub_210683FB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210684054(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210684120(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106842A8(_Unwind_Exception *a1)
{
  id *v1;
  void *v2;
  uint64_t v3;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_21068477C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_210684A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v25 = v24;

  _Unwind_Resume(a1);
}

void sub_210684CFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_210684E9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_210685D08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210685DC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_210685F14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::vector<CMTimeRange>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;
  __int128 v14;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - (_BYTE *)*a1) >> 4) < a2)
  {
    if (a2 >= 0x555555555555556)
      std::vector<CMTime>::__throw_length_error[abi:ne180100]();
    v5 = ((_BYTE *)a1[1] - (_BYTE *)*a1) / 48;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CMTimeRange>>(v3, a2);
    v7 = &v6[48 * v5];
    v9 = &v6[48 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *((_OWORD *)v10 - 3);
        v14 = *((_OWORD *)v10 - 1);
        *((_OWORD *)v12 - 2) = *((_OWORD *)v10 - 2);
        *((_OWORD *)v12 - 1) = v14;
        *((_OWORD *)v12 - 3) = v13;
        v12 -= 48;
        v10 -= 48;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CMTimeRange>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(48 * a2);
}

void sub_21068685C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_210686AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MOVStreamWriter;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_210686CCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210686E50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

uint64_t std::map<std::string,`anonymous namespace'::StreamRecordingData>::count[abi:ne180100](uint64_t a1, const void **a2)
{
  const void **v2;
  uint64_t v4;
  uint64_t v5;

  v2 = *(const void ***)(a1 + 8);
  if (v2)
  {
    v4 = a1 + 16;
    v5 = 1;
    do
    {
      if (!std::less<std::string>::operator()[abi:ne180100](v4, a2, v2 + 4))
      {
        if (!std::less<std::string>::operator()[abi:ne180100](v4, v2 + 4, a2))
          return v5;
        ++v2;
      }
      v2 = (const void **)*v2;
    }
    while (v2);
  }
  return 0;
}

uint64_t *std::map<std::string,`anonymous namespace'::StreamRecordingData>::operator[](uint64_t **a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t **v5;
  uint64_t **v6;
  uint64_t **v7;
  const void **v8;
  uint64_t *v9;
  char *v10;
  std::string *v11;
  uint64_t *v12;
  uint64_t *v13;
  _QWORD v15[2];
  char v16;

  v5 = a1 + 1;
  v4 = a1[1];
  v6 = a1 + 1;
  v7 = a1 + 1;
  if (!v4)
    goto LABEL_10;
  v6 = a1 + 1;
  while (1)
  {
    while (1)
    {
      v7 = (uint64_t **)v4;
      v8 = (const void **)(v4 + 4);
      if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)(a1 + 2), (const void **)a2, (const void **)v4 + 4))break;
      v4 = *v7;
      v6 = v7;
      if (!*v7)
        goto LABEL_10;
    }
    if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)(a1 + 2), v8, (const void **)a2))
      break;
    v6 = v7 + 1;
    v4 = v7[1];
    if (!v4)
      goto LABEL_10;
  }
  v9 = *v6;
  if (!*v6)
  {
LABEL_10:
    v10 = (char *)operator new(0x110uLL);
    v15[0] = v10;
    v15[1] = v5;
    v16 = 0;
    v11 = (std::string *)(v10 + 32);
    if (*(char *)(a2 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
      v12 = (uint64_t *)v15[0];
    }
    else
    {
      *(_OWORD *)&v11->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
      *((_QWORD *)v10 + 6) = *(_QWORD *)(a2 + 16);
      v12 = (uint64_t *)v10;
    }
    *((_QWORD *)v10 + 33) = 0;
    *(_OWORD *)(v10 + 248) = 0u;
    *(_OWORD *)(v10 + 232) = 0u;
    *(_OWORD *)(v10 + 216) = 0u;
    *(_OWORD *)(v10 + 200) = 0u;
    *(_OWORD *)(v10 + 184) = 0u;
    *(_OWORD *)(v10 + 168) = 0u;
    *(_OWORD *)(v10 + 152) = 0u;
    *(_OWORD *)(v10 + 136) = 0u;
    *(_OWORD *)(v10 + 120) = 0u;
    *(_OWORD *)(v10 + 104) = 0u;
    *(_OWORD *)(v10 + 88) = 0u;
    *(_OWORD *)(v10 + 72) = 0u;
    *(_OWORD *)(v10 + 56) = 0u;
    v16 = 1;
    *v12 = 0;
    v12[1] = 0;
    v12[2] = (uint64_t)v7;
    *v6 = v12;
    v13 = (uint64_t *)**a1;
    if (v13)
    {
      *a1 = v13;
      v12 = *v6;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v12);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
    v9 = (uint64_t *)v15[0];
    v15[0] = 0;
  }
  return v9 + 7;
}

void sub_210687084(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Unwind_Resume(a1);
}

void sub_2106871AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

uint64_t *std::map<std::string,`anonymous namespace'::MetadataRecordingData>::operator[](uint64_t **a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t **v5;
  uint64_t **v6;
  uint64_t **v7;
  const void **v8;
  uint64_t *v9;
  char *v10;
  std::string *v11;
  uint64_t *v12;
  uint64_t *v13;
  _QWORD v15[2];
  char v16;

  v5 = a1 + 1;
  v4 = a1[1];
  v6 = a1 + 1;
  v7 = a1 + 1;
  if (!v4)
    goto LABEL_10;
  v6 = a1 + 1;
  while (1)
  {
    while (1)
    {
      v7 = (uint64_t **)v4;
      v8 = (const void **)(v4 + 4);
      if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)(a1 + 2), (const void **)a2, (const void **)v4 + 4))break;
      v4 = *v7;
      v6 = v7;
      if (!*v7)
        goto LABEL_10;
    }
    if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)(a1 + 2), v8, (const void **)a2))
      break;
    v6 = v7 + 1;
    v4 = v7[1];
    if (!v4)
      goto LABEL_10;
  }
  v9 = *v6;
  if (!*v6)
  {
LABEL_10:
    v10 = (char *)operator new(0x88uLL);
    v15[0] = v10;
    v15[1] = v5;
    v16 = 0;
    v11 = (std::string *)(v10 + 32);
    if (*(char *)(a2 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
      v12 = (uint64_t *)v15[0];
    }
    else
    {
      *(_OWORD *)&v11->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
      *((_QWORD *)v10 + 6) = *(_QWORD *)(a2 + 16);
      v12 = (uint64_t *)v10;
    }
    *(_OWORD *)(v10 + 120) = 0u;
    *(_OWORD *)(v10 + 104) = 0u;
    *(_OWORD *)(v10 + 88) = 0u;
    *(_OWORD *)(v10 + 72) = 0u;
    *(_OWORD *)(v10 + 56) = 0u;
    v16 = 1;
    *v12 = 0;
    v12[1] = 0;
    v12[2] = (uint64_t)v7;
    *v6 = v12;
    v13 = (uint64_t *)**a1;
    if (v13)
    {
      *a1 = v13;
      v12 = *v6;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v12);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
    v9 = (uint64_t *)v15[0];
    v15[0] = 0;
  }
  return v9 + 7;
}

void sub_21068733C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Unwind_Resume(a1);
}

void sub_21068762C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_21068775C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_210687844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_210687970(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_210687AA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_210687B80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_210687CB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_210687DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_210687ED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_210688104(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2106881B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210688220(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_2106882EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  objc_sync_exit(v11);

  _Unwind_Resume(a1);
}

void sub_2106885AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  if (a16 < 0)
    operator delete(__p);
  if (a22 < 0)
    operator delete(a17);

  _Unwind_Resume(a1);
}

uint64_t std::map<std::string,`anonymous namespace'::StreamRecordingData>::find[abi:ne180100](uint64_t a1, const void **a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t *v8;

  v2 = a1 + 8;
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
    return v2;
  v5 = a1 + 16;
  v6 = a1 + 8;
  do
  {
    v7 = std::less<std::string>::operator()[abi:ne180100](v5, (const void **)(v3 + 32), a2);
    v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      v8 = (uint64_t *)v3;
      v6 = v3;
    }
    v3 = *v8;
  }
  while (*v8);
  if (v6 == v2 || std::less<std::string>::operator()[abi:ne180100](v5, a2, (const void **)(v6 + 32)))
    return v2;
  return v6;
}

void sub_2106889E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210688B94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_210688D20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_210689004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  void *v25;
  _QWORD *v26;
  void *v27;
  uint64_t v28;

  v26[30] = v28;

  objc_sync_exit(v26);

  if (a25 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void `anonymous namespace'::MetadataRecordingData::~MetadataRecordingData(id *this)
{

}

void sub_21068930C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;

  if (a26 < 0)
    operator delete(__p);
  if (*(char *)(v29 - 49) < 0)
    operator delete(*(void **)(v29 - 72));

  _Unwind_Resume(a1);
}

uint64_t *std::map<std::string,std::map<std::string,`anonymous namespace'::MetadataRecordingData>>::operator[](uint64_t **a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t **v5;
  uint64_t **v6;
  uint64_t **v7;
  const void **v8;
  uint64_t *v9;
  _QWORD *v10;
  std::string *v11;
  uint64_t *v12;
  uint64_t *v13;
  _QWORD v15[2];
  char v16;

  v5 = a1 + 1;
  v4 = a1[1];
  v6 = a1 + 1;
  v7 = a1 + 1;
  if (!v4)
    goto LABEL_10;
  v6 = a1 + 1;
  while (1)
  {
    while (1)
    {
      v7 = (uint64_t **)v4;
      v8 = (const void **)(v4 + 4);
      if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)(a1 + 2), (const void **)a2, (const void **)v4 + 4))break;
      v4 = *v7;
      v6 = v7;
      if (!*v7)
        goto LABEL_10;
    }
    if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)(a1 + 2), v8, (const void **)a2))
      break;
    v6 = v7 + 1;
    v4 = v7[1];
    if (!v4)
      goto LABEL_10;
  }
  v9 = *v6;
  if (!*v6)
  {
LABEL_10:
    v10 = operator new(0x50uLL);
    v15[0] = v10;
    v15[1] = v5;
    v16 = 0;
    v11 = (std::string *)(v10 + 4);
    if (*(char *)(a2 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
      v12 = (uint64_t *)v15[0];
    }
    else
    {
      *(_OWORD *)&v11->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
      v10[6] = *(_QWORD *)(a2 + 16);
      v12 = v10;
    }
    v10[8] = 0;
    v10[9] = 0;
    v10[7] = v10 + 8;
    v16 = 1;
    *v12 = 0;
    v12[1] = 0;
    v12[2] = (uint64_t)v7;
    *v6 = v12;
    v13 = (uint64_t *)**a1;
    if (v13)
    {
      *a1 = v13;
      v12 = *v6;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v12);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
    v9 = (uint64_t *)v15[0];
    v15[0] = 0;
  }
  return v9 + 7;
}

void sub_2106894C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Unwind_Resume(a1);
}

void sub_210689D14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, ...)
{
  void *v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  va_list va;

  va_start(va, a6);
  v8[24] = v9;

  objc_sync_exit(v8);

  if (*(char *)(v11 - 105) < 0)
    operator delete(*(void **)(v11 - 128));

  _Unwind_Resume(a1);
}

void sub_210689D20()
{
  JUMPOUT(0x210689E80);
}

void sub_210689D2C()
{
  void *v0;

  JUMPOUT(0x210689E8CLL);
}

void sub_210689DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, ...)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  va_list va;

  va_start(va, a6);

  objc_end_catch();

  objc_sync_exit(v8);
  if (*(char *)(v11 - 105) < 0)
    operator delete(*(void **)(v11 - 128));

  _Unwind_Resume(a1);
}

void sub_210689E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, ...)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  va_list va;

  va_start(va, a6);

  objc_sync_exit(v8);

  if (*(char *)(v11 - 105) < 0)
    operator delete(*(void **)(v11 - 128));

  _Unwind_Resume(a1);
}

void sub_210689E14()
{
  void *v0;

  JUMPOUT(0x210689E78);
}

void sub_210689E34()
{
  JUMPOUT(0x210689E8CLL);
}

void sub_210689E3C()
{
  JUMPOUT(0x210689E84);
}

void sub_210689E50()
{
  JUMPOUT(0x210689EB0);
}

void sub_210689E58()
{
  JUMPOUT(0x210689E94);
}

void sub_210689E60()
{
  JUMPOUT(0x210689EA0);
}

void sub_210689E68()
{
  JUMPOUT(0x210689E78);
}

void `anonymous namespace'::StreamRecordingData::~StreamRecordingData(id *this)
{

}

void sub_21068A06C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_21068A314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  if (a27 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_21068A4C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  void *v16;
  void *v17;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_21068A778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  if (a27 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_21068A990(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_21068AACC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21068B45C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint8_t buf)
{
  void *v25;

  _Unwind_Resume(a1);
}

void sub_21068BBCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void sub_21068BC98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21068C0E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;
  uint64_t v19;

  if (*(char *)(v19 - 129) < 0)
    operator delete(*(void **)(v19 - 152));

  _Unwind_Resume(a1);
}

void sub_21068C714(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void __copy_helper_block_ea8_48c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(std::string *a1, uint64_t a2)
{
  std::string *v2;
  __int128 v3;

  v2 = a1 + 2;
  if (*(char *)(a2 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(v2, *(const std::string::value_type **)(a2 + 48), *(_QWORD *)(a2 + 56));
  }
  else
  {
    v3 = *(_OWORD *)(a2 + 48);
    v2->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 64);
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = v3;
  }
}

void __destroy_helper_block_ea8_48c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 71) < 0)
    operator delete(*(void **)(a1 + 48));
}

void sub_21068CCB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  if (*(char *)(v4 - 97) < 0)
    operator delete(*(void **)(v4 - 120));

  _Unwind_Resume(a1);
}

void sub_21068CDEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void __copy_helper_block_ea8_64c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1, uint64_t a2)
{
  std::string *v2;
  __int128 v3;

  v2 = (std::string *)(a1 + 64);
  if (*(char *)(a2 + 87) < 0)
  {
    std::string::__init_copy_ctor_external(v2, *(const std::string::value_type **)(a2 + 64), *(_QWORD *)(a2 + 72));
  }
  else
  {
    v3 = *(_OWORD *)(a2 + 64);
    v2->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 80);
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = v3;
  }
}

void __destroy_helper_block_ea8_64c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 87) < 0)
    operator delete(*(void **)(a1 + 64));
}

void sub_21068D1F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  if (*(char *)(v4 - 113) < 0)
    operator delete(*(void **)(v4 - 136));

  _Unwind_Resume(a1);
}

void sub_21068D5A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void __copy_helper_block_ea8_56c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1, uint64_t a2)
{
  std::string *v2;
  __int128 v3;

  v2 = (std::string *)(a1 + 56);
  if (*(char *)(a2 + 79) < 0)
  {
    std::string::__init_copy_ctor_external(v2, *(const std::string::value_type **)(a2 + 56), *(_QWORD *)(a2 + 64));
  }
  else
  {
    v3 = *(_OWORD *)(a2 + 56);
    v2->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 72);
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = v3;
  }
}

void __destroy_helper_block_ea8_56c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 79) < 0)
    operator delete(*(void **)(a1 + 56));
}

void sub_21068D984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *a18, void *a19)
{
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  objc_sync_exit(v19);
  _Unwind_Resume(a1);
}

void sub_21068DCE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;

  if (*(char *)(v23 - 137) < 0)
    operator delete(*(void **)(v23 - 160));

  _Unwind_Resume(a1);
}

void sub_21068DE60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v17 = v16;

  objc_sync_exit(v13);
  _Unwind_Resume(a1);
}

void sub_21068DF24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21068E058(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v4;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_21068E1C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v4;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_21068E328(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v4;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_21068E5D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  if (*(char *)(v4 - 113) < 0)
    operator delete(*(void **)(v4 - 136));

  _Unwind_Resume(a1);
}

void sub_21068E6C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21068EA6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  if (*(char *)(v3 - 153) < 0)
    operator delete(*(void **)(v3 - 176));

  _Unwind_Resume(a1);
}

void sub_21068ED00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21068EFA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  if (*(char *)(v4 - 97) < 0)
    operator delete(*(void **)(v4 - 120));

  _Unwind_Resume(a1);
}

void sub_21068F480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_21068F758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  objc_sync_exit(v21);
  if (a19 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_21068F9C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;

  if (a20 < 0)
    operator delete(__p);
  if (*(char *)(v23 - 89) < 0)
    operator delete(*(void **)(v23 - 112));
  if (*(char *)(v23 - 65) < 0)
    operator delete(*(void **)(v23 - 88));

  _Unwind_Resume(a1);
}

void sub_21068FB88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void __copy_helper_block_ea8_48c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE72c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(std::string *a1, uint64_t a2)
{
  __int128 v4;
  std::string *v5;
  __int128 v6;

  if (*(char *)(a2 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(a1 + 2, *(const std::string::value_type **)(a2 + 48), *(_QWORD *)(a2 + 56));
  }
  else
  {
    v4 = *(_OWORD *)(a2 + 48);
    a1[2].__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 64);
    *(_OWORD *)&a1[2].__r_.__value_.__l.__data_ = v4;
  }
  v5 = a1 + 3;
  if (*(char *)(a2 + 95) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)(a2 + 72), *(_QWORD *)(a2 + 80));
  }
  else
  {
    v6 = *(_OWORD *)(a2 + 72);
    a1[3].__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 88);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
}

void sub_21068FC40(_Unwind_Exception *exception_object)
{
  void **v1;
  uint64_t v2;

  if (*(char *)(v2 + 71) < 0)
    operator delete(*v1);
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_ea8_48c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE72c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  if (*(char *)(a1 + 71) < 0)
    operator delete(*(void **)(a1 + 48));
}

void sub_21068FEB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_sync_exit(v4);
  _Unwind_Resume(a1);
}

void sub_2106900B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  void *v20;

  if (a20 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2106903D8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 buf)
{
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  id v24;
  id v25;
  NSObject *v26;
  void *v27;
  id *v28;
  void *v29;

  v22 = v18;

  objc_sync_exit(v20);
  if (a2 == 1)
  {
    v24 = objc_begin_catch(a1);
    v25 = *(id *)(v17 + 32);
    objc_sync_enter(v25);
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v24;
      _os_log_impl(&dword_210675000, v26, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: appendTimedMetadataGroup exception: %{public}@ ⛔️⛔️⛔️", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(v17 + 32) + 80), "error");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *(id **)(v17 + 32);
    objc_msgSend(v28[45], "criticalErrorOccurred:context:", v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateNewState:byEvent:", v29, CFSTR("asyncWriteAssociatedMetadata"));

    objc_sync_exit(v25);
    objc_end_catch();
    JUMPOUT(0x21069039CLL);
  }
  _Unwind_Resume(a1);
}

void sub_21069077C(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  if (*(char *)(v2 - 49) < 0)
    operator delete(*(void **)(v2 - 72));

  _Unwind_Resume(a1);
}

void sub_2106908A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  void *v14;

  if (a14 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2106909E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210690B0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  void *v10;

  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_210690C24(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_210690D80(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_210690DF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_210690EB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  void *v10;

  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_2106910CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210691170(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  void *v10;

  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_210691294(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106916C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210691B44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210691D94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210691E84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210692454(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21069285C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_210692988(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210692AC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210692C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_210693BA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,void *__p,uint64_t a44,int a45,__int16 a46,char a47,char a48)
{

  _Unwind_Resume(a1);
}

void sub_210693E90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210693FF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210694514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *__p,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  void *v39;
  void *v40;

  if (a39 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_210694790(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210694B28(_Unwind_Exception *a1, int a2)
{
  void *v2;
  void *v3;
  void *v4;
  id *v5;
  os_signpost_id_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;

  if (*(char *)(v9 - 153) < 0)
    operator delete(*(void **)(v9 - 176));
  if (a2 == 1)
  {
    v12 = objc_begin_catch(a1);
    v13 = v5[54];
    v14 = v13;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)(v9 - 176) = 0;
      _os_signpost_emit_with_name_impl(&dword_210675000, v14, OS_SIGNPOST_INTERVAL_END, v6, "mio.att_appendTimedMetadataGroup", (const char *)&unk_2106EBECF, (uint8_t *)(v9 - 176), 2u);
    }

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Exception occurred during writing %@ for stream '%@'. Dropping sample."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v15, 21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "informDelegateAboutError:", v16);

    objc_end_catch();
    JUMPOUT(0x210694AD4);
  }

  _Unwind_Resume(a1);
}

void sub_210694F94(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, __int128 buf)
{
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v26;
  id v28;
  NSObject *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;

  v26 = v22;

  objc_sync_exit(v23);
  if (a2 == 1)
  {
    v28 = objc_begin_catch(a1);
    v29 = *(id *)(v20 + 432);
    v30 = v29;
    v31 = *(_QWORD *)(v20 + 440);
    if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_210675000, v30, OS_SIGNPOST_INTERVAL_END, v31, "mio.append.timed.metadata.group", (const char *)&unk_2106EBECF, (uint8_t *)&buf, 2u);
    }

    v32 = (id)v20;
    objc_sync_enter(v32);
    objc_msgSend(*(id *)(v24 + 2928), "defaultLog");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v28;
      _os_log_impl(&dword_210675000, v33, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: appendTimedMetadataGroup exception: %{public}@ ⛔️⛔️⛔️", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Exception occurred during writing %@ for stream '%@'. Dropping sample."));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v34, 21);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "informDelegateAboutError:", v35);

    objc_sync_exit(v32);
    objc_end_catch();
    JUMPOUT(0x210694F44);
  }
  if (a17 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_21069524C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  void *v16;
  void *v17;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_210695364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  void *v16;
  void *v17;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_210695470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  void *v16;
  void *v17;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2106967A4()
{
  void *v0;

  objc_end_catch();
  JUMPOUT(0x21069680CLL);
}

void sub_2106967BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36)
{
  void *v36;
  void *v37;

  JUMPOUT(0x21069681CLL);
}

void sub_2106967CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36)
{
  void *v36;
  void *v37;

  JUMPOUT(0x21069681CLL);
}

void sub_2106967DC()
{
  void *v0;
  void *v1;

  JUMPOUT(0x210696804);
}

void sub_2106967E8()
{
  void *v0;

  JUMPOUT(0x2106967F0);
}

void sub_2106967FC()
{
  void *v0;

  JUMPOUT(0x210696804);
}

void sub_210696D94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210697340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  if (a28 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_210697474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_210697674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  id *v8;
  void *v9;
  uint64_t v10;
  va_list va;

  va_start(va, a8);

  objc_destroyWeak(v8);
  _Block_object_dispose(va, 8);
  objc_destroyWeak((id *)(v10 - 40));
  _Unwind_Resume(a1);
}

void sub_210698164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33)
{

  _Unwind_Resume(a1);
}

void sub_210698350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_210698D80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *__p,uint64_t a40,int a41,__int16 a42,char a43,char a44)
{

  _Unwind_Resume(a1);
}

void sub_210698F30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210698F98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210699068(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106990D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210699170(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106991CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210699298(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210699304(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<std::string,`anonymous namespace'::StreamRecordingData>,std::__map_value_compare<std::string,std::__value_type<std::string,`anonymous namespace'::StreamRecordingData>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,`anonymous namespace'::StreamRecordingData>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    operator delete(a2);
  }
}

void std::allocator_traits<std::allocator<std::__tree_node<std::__value_type<std::string,`anonymous namespace'::StreamRecordingData>,void *>>>::destroy[abi:ne180100]<std::pair<std::string const,`anonymous namespace'::StreamRecordingData>,void,void>(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void std::__tree<std::__value_type<std::string,`anonymous namespace'::MetadataRecordingData>,std::__map_value_compare<std::string,std::__value_type<std::string,`anonymous namespace'::MetadataRecordingData>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,`anonymous namespace'::MetadataRecordingData>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    operator delete(a2);
  }
}

void std::allocator_traits<std::allocator<std::__tree_node<std::__value_type<std::string,`anonymous namespace'::MetadataRecordingData>,void *>>>::destroy[abi:ne180100]<std::pair<std::string const,`anonymous namespace'::MetadataRecordingData>,void,void>(uint64_t a1)
{

  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void std::__tree<std::__value_type<std::string,std::map<std::string,`anonymous namespace'::MetadataRecordingData>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,`anonymous namespace'::MetadataRecordingData>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,`anonymous namespace'::MetadataRecordingData>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    operator delete(a2);
  }
}

void std::allocator_traits<std::allocator<std::__tree_node<std::__value_type<std::string,std::map<std::string,`anonymous namespace'::MetadataRecordingData>>,void *>>>::destroy[abi:ne180100]<std::pair<std::string const,std::map<std::string,`anonymous namespace'::MetadataRecordingData>>,void,void>(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

BOOL std::less<std::string>::operator()[abi:ne180100](uint64_t a1, const void **a2, const void **a3)
{
  int v3;
  int v4;
  size_t v5;
  const void *v6;
  size_t v7;
  const void *v8;
  size_t v9;
  int v10;

  v3 = *((char *)a3 + 23);
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = *((unsigned __int8 *)a2 + 23);
  else
    v5 = (size_t)a2[1];
  if (v4 >= 0)
    v6 = a2;
  else
    v6 = *a2;
  if (v3 >= 0)
    v7 = *((unsigned __int8 *)a3 + 23);
  else
    v7 = (size_t)a3[1];
  if (v3 >= 0)
    v8 = a3;
  else
    v8 = *a3;
  if (v7 >= v5)
    v9 = v5;
  else
    v9 = v7;
  v10 = memcmp(v6, v8, v9);
  if (v10)
    return v10 < 0;
  else
    return v5 < v7;
}

uint64_t std::unique_ptr<std::__tree_node<std::__value_type<std::string,`anonymous namespace'::StreamRecordingData>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,`anonymous namespace'::StreamRecordingData>,void *>>>>::~unique_ptr[abi:ne180100](uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
    operator delete(v2);
  }
  return a1;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

uint64_t std::unique_ptr<std::__tree_node<std::__value_type<std::string,`anonymous namespace'::MetadataRecordingData>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,`anonymous namespace'::MetadataRecordingData>,void *>>>>::~unique_ptr[abi:ne180100](uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
    operator delete(v2);
  }
  return a1;
}

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  std::string *v10;
  std::__split_buffer<std::string>::pointer end;
  __int128 v12;
  uint64_t v13;
  std::__split_buffer<std::string> __v;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<CMTime>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9)
    v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<CMTime>>(v7, v9);
  else
    v10 = 0;
  end = v10 + v4;
  __v.__first_ = v10;
  __v.__begin_ = end;
  __v.__end_ = end;
  __v.__end_cap_.__value_ = &v10[v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(end, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
    end = __v.__end_;
  }
  else
  {
    v12 = *a2;
    end->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v12;
  }
  __v.__end_ = end + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  v13 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v13;
}

void sub_210699D08(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a10);
  _Unwind_Resume(a1);
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::string *v4;
  std::string *begin;
  std::string *end;
  std::string *value;

  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  _QWORD v12[3];
  char v13;
  __int128 v14;
  __int128 v15;

  v7 = a7;
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    v9 = a7;
    do
    {
      v10 = *(_OWORD *)(a3 - 24);
      *(_QWORD *)(v9 - 8) = *(_QWORD *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 8) = 0;
      *(_QWORD *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((_QWORD *)&v15 + 1) = v9;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100]((uint64_t)this, (void **)&this->__begin_->__r_.__value_.__l.__data_);
  if (this->__first_)
    operator delete(this->__first_);
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 3;
      *(_QWORD *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

uint64_t *std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, __int128 **a4)
{
  uint64_t **v6;
  uint64_t *result;
  uint64_t *v8;
  uint64_t v9;

  v6 = (uint64_t **)std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__find_equal<std::string>((uint64_t)a1, &v9, a2);
  result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__insert_node_at(a1, v9, v6, v8);
    return v8;
  }
  return result;
}

_QWORD *std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__find_equal<std::string>(uint64_t a1, _QWORD *a2, const void **a3)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;
  const void **v9;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    v7 = a1 + 16;
    do
    {
      while (1)
      {
        v8 = (_QWORD *)v4;
        v9 = (const void **)(v4 + 32);
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32)))
          break;
        v4 = *v8;
        v5 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (!std::less<std::string>::operator()[abi:ne180100](v7, v9, a3))
        break;
      v5 = v8 + 1;
      v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    v8 = (_QWORD *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

void std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, __int128 **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5;
  _QWORD *v6;
  std::string *v7;
  __int128 *v8;
  __int128 v9;

  v5 = a1 + 8;
  v6 = operator new(0x50uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  v7 = (std::string *)(v6 + 4);
  v8 = *a2;
  if (*((char *)*a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)v8, *((_QWORD *)v8 + 1));
  }
  else
  {
    v9 = *v8;
    v6[6] = *((_QWORD *)v8 + 2);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v9;
  }
  v6[7] = 0;
  v6[8] = 0;
  v6[9] = 0;
  *(_BYTE *)(a3 + 16) = 1;
}

void sub_21069A0E8(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,CMTime>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,CMTime>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
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

uint64_t std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::map<std::string,`anonymous namespace'::MetadataRecordingData>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::map<std::string,`anonymous namespace'::MetadataRecordingData>>,void *>>>>::~unique_ptr[abi:ne180100](uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
    operator delete(v2);
  }
  return a1;
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0)
      operator delete(*(void **)(i - 24));
  }
  a1[1] = v2;
}

void std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::destroy(a1, *(_QWORD *)a2);
    std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::destroy(a1, *((_QWORD *)a2 + 1));
    if (a2[55] < 0)
      operator delete(*((void **)a2 + 4));
    operator delete(a2);
  }
}

void sub_21069A6B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_21069AABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21069B178(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_21069C1A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_21069C380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21069D2A8(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  NSObject *v5;

  if (a2 == 1)
  {
    v4 = objc_begin_catch(exception_object);
    objc_msgSend(*(id *)(v2 + 2928), "defaultLog");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)(v3 - 112) = 0;
      _os_log_impl(&dword_210675000, v5, OS_LOG_TYPE_ERROR, "AVAssetWriter.requiresInProcessOperation not supported.", (uint8_t *)(v3 - 112), 2u);
    }

    objc_end_catch();
    JUMPOUT(0x21069CD88);
  }
  _Unwind_Resume(exception_object);
}

void sub_21069E0E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  void *v9;

  objc_sync_exit(v9);
  _Unwind_Resume(a1);
}

void sub_21069E430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21069ED10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21069EE9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21069EF54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21069F00C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21069F250(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21069F2B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MIONonPlanarToL008FrameProcessor;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_21069F458(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21069F830(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21069F964(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21069FC18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

void sub_21069FD98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21069FE68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_21069FFCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106A01D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106A0414(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A0628(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106A0794(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106A0884(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A09D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_2106A0A90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A0B80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106A0C24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A0CE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106A0D98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106A0E44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106A0EF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106A0F94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A1040(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106A10EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106A11C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106A128C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106A1514(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106A173C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_2106A1958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;

  _Unwind_Resume(a1);
}

void sub_2106A1B48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2106A1C58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106A1D08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A1E10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2106A1EC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A1F68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106A2014(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106A2340(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2106A25B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2106A2744(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106A2850(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_2106A2910(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A2974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MIORawBayerFrameProcessor;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_2106A2AC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A2BEC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2106A2C40(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2106A2CB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2106A2D0C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double MIOCVPixelBufferGetBytesPerPixelOfPlaneFromLookup(__CVBuffer *a1, uint64_t a2)
{
  uint64_t PixelFormatType;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  return MIOCVPixelBufferGetBytesPerPixelOfPlaneFromLookupForFormat(PixelFormatType, a2);
}

double MIOCVPixelBufferGetBytesPerPixelOfPlaneFromLookupForFormat(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d_%zu"), a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  +[MIOPixelBufferUtility sharedBytesPerPixelLookUp](MIOPixelBufferUtility, "sharedBytesPerPixelLookUp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_sync_exit(v3);
  return v7;
}

void sub_2106A2E24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void MIOCVPixelBufferSetBytesPerPixelOfPlaneToLookup(__CVBuffer *a1, uint64_t a2, double a3)
{
  uint64_t PixelFormatType;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  MIOCVPixelBufferSetBytesPerPixelOfPlaneToLookupForFormat(PixelFormatType, a2, a3);
}

void MIOCVPixelBufferSetBytesPerPixelOfPlaneToLookupForFormat(uint64_t a1, uint64_t a2, double a3)
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  double v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d_%zu"), a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v10 = a3;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_210675000, v6, OS_LOG_TYPE_INFO, "BytesPerPixelLookUp: Register %f for %@", buf, 0x16u);
  }

  +[MIOPixelBufferUtility sharedBytesPerPixelLookUp](MIOPixelBufferUtility, "sharedBytesPerPixelLookUp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, v4);

  objc_sync_exit(v5);
}

void sub_2106A2FE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

CVPixelBufferRef MIOCVCreatePixelBuffer(OSType a1, size_t a2, size_t a3)
{
  const __CFDictionary *v6;
  CVPixelBufferRef v7;
  CVPixelBufferRef v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  v10 = *MEMORY[0x24BDC5668];
  v11[0] = MEMORY[0x24BDBD1B8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, a3, a1, v6, &v9);
  v7 = v9;

  return v7;
}

void sub_2106A3104(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double MIOCVPixelBufferGetBytesPerPixel(__CVBuffer *a1)
{
  uint64_t PixelFormatType;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  return MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(PixelFormatType, 0);
}

double MIOCVPixelBufferGetBytesPerPixelOfPlane(__CVBuffer *a1, size_t a2)
{
  uint64_t PixelFormatType;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  return MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(PixelFormatType, a2);
}

double MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(uint64_t a1, size_t a2)
{
  double BytesPerPixelOfPlaneFromLookupForFormat;
  const __CFDictionary *v5;
  size_t BytesPerRowOfPlane;
  size_t WidthOfPlane;
  unint64_t v8;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[16];
  size_t extraColumnsOnRight;
  CVPixelBufferRef pixelBufferOut;
  size_t extraColumnsOnLeft;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  BytesPerPixelOfPlaneFromLookupForFormat = MIOCVPixelBufferGetBytesPerPixelOfPlaneFromLookupForFormat(a1, a2);
  if (BytesPerPixelOfPlaneFromLookupForFormat == 0.0)
  {
    pixelBufferOut = 0;
    v18 = *MEMORY[0x24BDC5668];
    v19[0] = MEMORY[0x24BDBD1B8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0x280uLL, 0x1E0uLL, a1, v5, &pixelBufferOut);
    if (!pixelBufferOut)
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LODWORD(extraColumnsOnLeft) = 67109120;
        HIDWORD(extraColumnsOnLeft) = a1;
        _os_log_impl(&dword_210675000, v10, OS_LOG_TYPE_ERROR, "Cannot allocate reference buffer (Format: %d).", (uint8_t *)&extraColumnsOnLeft, 8u);
      }

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot allocate reference buffer (Format: %d)."), a1);
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], objc_claimAutoreleasedReturnValue(), 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v11);
    }
    if (CVPixelBufferGetPlaneCount(pixelBufferOut))
    {
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBufferOut, a2);
      WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBufferOut, a2);
    }
    else
    {
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRow(pixelBufferOut);
      WidthOfPlane = 640;
    }
    extraColumnsOnLeft = 0;
    extraColumnsOnRight = 0;
    CVPixelBufferGetExtendedPixels(pixelBufferOut, &extraColumnsOnLeft, &extraColumnsOnRight, 0, 0);
    CVPixelBufferRelease(pixelBufferOut);
    if (WidthOfPlane - 641 <= 0xFFFFFFFFFFFFFD7FLL)
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210675000, v12, OS_LOG_TYPE_ERROR, "Invalid pixel buffer configuration.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Invalid pixel buffer configuration."), 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v13);
    }
    v8 = 0x280u / (unsigned __int16)WidthOfPlane;
    extraColumnsOnLeft /= v8;
    extraColumnsOnRight /= v8;
    BytesPerPixelOfPlaneFromLookupForFormat = (double)BytesPerRowOfPlane
                                            / (double)(extraColumnsOnLeft + WidthOfPlane + extraColumnsOnRight);
    MIOCVPixelBufferSetBytesPerPixelOfPlaneToLookupForFormat(a1, a2, BytesPerPixelOfPlaneFromLookupForFormat);

  }
  return BytesPerPixelOfPlaneFromLookupForFormat;
}

void sub_2106A3428(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

size_t MIOCVPixelBufferUsablePlaneCount(__CVBuffer *a1)
{
  size_t result;

  result = CVPixelBufferGetPlaneCount(a1);
  if (result <= 1)
    return 1;
  return result;
}

void sub_2106A381C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106A3E30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A3F88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A41C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106A44BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A4618(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A4AFC(_Unwind_Exception *a1)
{
  FILE *v1;

  fclose(v1);
  _Unwind_Resume(a1);
}

void sub_2106A4C80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A4FA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A5128(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A5324(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A5540(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A5768(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A5950(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A5F4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A6038(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A6124(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A682C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A6948(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A6AE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A6D44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106A7028(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A7218(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A7408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{

  _Unwind_Resume(a1);
}

void sub_2106A75C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A778C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A7C20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A7FEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

MOVStreamFrame *MIOMakeFrame(uint64_t a1, void *a2, double a3)
{
  id v5;
  MOVStreamFrame *v6;

  v5 = a2;
  v6 = -[MOVStreamFrame initWithPixelBuffer:timeStamp:context:]([MOVStreamFrame alloc], "initWithPixelBuffer:timeStamp:context:", a1, v5, a3);

  return v6;
}

void sub_2106A88F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106A8A24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106A8B80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106A8CEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A8E20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A8F44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106A91DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A955C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_2106A98EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2106A9CFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A9E58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106A9F34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106A9FF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106AA1A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106AA6A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_2106AA8A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106AAB04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106AAC84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2106AB264(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106AB36C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106AB4C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106AB5BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106AB6BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106AB938(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106ABB74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106AC0E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_2106AC1E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106AC290(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106AC310(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_2106AC408(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

char *std::vector<CMTimeRange>::__assign_with_size[abi:ne180100]<CMTimeRange*,CMTimeRange*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void **v13;
  char *v14;
  _BYTE *v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - *(_QWORD *)result) >> 4) < a4)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 > 0x555555555555555)
      std::vector<CMTime>::__throw_length_error[abi:ne180100]();
    v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 4);
    v11 = 2 * v10;
    if (2 * v10 <= a4)
      v11 = a4;
    if (v10 >= 0x2AAAAAAAAAAAAAALL)
      v12 = 0x555555555555555;
    else
      v12 = v11;
    result = std::vector<CMTimeRange>::__vallocate[abi:ne180100](v7, v12);
    v14 = (char *)v7[1];
    v13 = (void **)(v7 + 1);
    v9 = v14;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v13 = (void **)(result + 8);
  v15 = (_BYTE *)*((_QWORD *)result + 1);
  if (0xAAAAAAAAAAAAAAABLL * ((v15 - v9) >> 4) >= a4)
    goto LABEL_16;
  v16 = &__src[16 * ((v15 - v9) >> 4)];
  if (v15 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v15 - v9);
    v9 = (char *)*v13;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v13 = &v9[v17];
  return result;
}

char *std::vector<CMTimeRange>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x555555555555556)
    std::vector<CMTime>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CMTimeRange>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[48 * v4];
  return result;
}

void sub_2106ACDC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106ACF88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106AD084(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106AD28C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106AD394(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106AD538(_Unwind_Exception *a1)
{
  id *v1;
  void *v2;
  uint64_t v3;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 120));
  _Unwind_Resume(a1);
}

void sub_2106AD834(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2106AD94C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106AE26C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, __int16 buf)
{
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  os_signpost_id_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  if (a2 == 1)
  {
    v13 = objc_begin_catch(exception_object);
    v14 = v12;
    v15 = objc_msgSend(v11, "avfAppendSignPostID");
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210675000, v14, OS_SIGNPOST_INTERVAL_END, v15, "mio.append.timed.metadata.group", (const char *)&unk_2106EBECF, (uint8_t *)&buf, 2u);
    }

    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v11, "streamId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Exception occurred during appendTimedMetadataGroup %@ for stream '%@'."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v17, 21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "writer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "reportError:", v18);

    objc_end_catch();
    JUMPOUT(0x2106AE230);
  }
  _Unwind_Resume(exception_object);
}

void sub_2106AE5B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106AE9C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2106AEB44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106AEBA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106AEBF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106AEC58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MIOPixelBufferPool;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_2106AED4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106AEEB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_2106AF03C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_2106AF20C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_2106AF3D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_2106AF5BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_2106AF7A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_2106AF990(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106AFB78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106B0BC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2106B1118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17, void *a18, void *a19)
{
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_2106B1644(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106B17CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106B1878(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void *GetPixelBufferBaseAddress(__CVBuffer *a1)
{
  if (CVPixelBufferIsPlanar(a1))
    return CVPixelBufferGetBaseAddressOfPlane(a1, 0);
  else
    return CVPixelBufferGetBaseAddress(a1);
}

size_t GetPixelBufferRowBytes(__CVBuffer *a1)
{
  if (CVPixelBufferIsPlanar(a1))
    return CVPixelBufferGetBytesPerRowOfPlane(a1, 0);
  else
    return CVPixelBufferGetBytesPerRow(a1);
}

void sub_2106B2974(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106B2FFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106B3210(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106B328C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MIOq8q2ToL010FrameProcessor;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_2106B36AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_2106B48D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int16 buf)
{
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  os_signpost_id_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  if (a2 == 1)
  {
    v17 = objc_begin_catch(exception_object);
    v18 = v16;
    v19 = objc_msgSend(v15, "avfAppendSignPostID");
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210675000, v18, OS_SIGNPOST_INTERVAL_END, v19, "mio.append.sample.buffer.attachments", (const char *)&unk_2106EBECF, (uint8_t *)&buf, 2u);
    }

    v20 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v15, "streamId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("Exception occurred during appendTimedMetadataGroup %@ for stream '%@'."));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v21, 21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "writer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "reportError:", v22);

    objc_end_catch();
    JUMPOUT(0x2106B4898);
  }
  _Unwind_Resume(exception_object);
}

void sub_2106B4D5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106B4E20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106B4EAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106B5000(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106B5270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_2106B5474(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2106B5674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_2106B57D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106B58DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_2106B5AB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106B5B74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106B5D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2106B5EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_2106B5F54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2106B6070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_2106B6138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2106B61EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106B62B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106B65AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v6;

  _Unwind_Resume(a1);
}

void sub_2106B670C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

uint64_t std::map<std::string,`anonymous namespace'::StreamRecordingData>::operator[](uint64_t **a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  const void **v8;
  uint64_t v9;
  char *v10;
  std::string *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v15[2];
  char v16;

  v5 = (uint64_t)(a1 + 1);
  v4 = (uint64_t)a1[1];
  v6 = (uint64_t *)(a1 + 1);
  v7 = (uint64_t *)(a1 + 1);
  if (!v4)
    goto LABEL_10;
  v6 = (uint64_t *)(a1 + 1);
  while (1)
  {
    while (1)
    {
      v7 = (uint64_t *)v4;
      v8 = (const void **)(v4 + 32);
      if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)(a1 + 2), (const void **)a2, (const void **)(v4 + 32)))break;
      v4 = *v7;
      v6 = v7;
      if (!*v7)
        goto LABEL_10;
    }
    if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)(a1 + 2), v8, (const void **)a2))
      break;
    v6 = v7 + 1;
    v4 = v7[1];
    if (!v4)
      goto LABEL_10;
  }
  v9 = *v6;
  if (!*v6)
  {
LABEL_10:
    v10 = (char *)operator new(0x110uLL);
    v15[0] = (uint64_t)v10;
    v15[1] = v5;
    v16 = 0;
    v11 = (std::string *)(v10 + 32);
    if (*(char *)(a2 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
      v12 = (uint64_t *)v15[0];
    }
    else
    {
      *(_OWORD *)&v11->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
      *((_QWORD *)v10 + 6) = *(_QWORD *)(a2 + 16);
      v12 = (uint64_t *)v10;
    }
    *((_QWORD *)v10 + 33) = 0;
    *(_OWORD *)(v10 + 248) = 0u;
    *(_OWORD *)(v10 + 232) = 0u;
    *(_OWORD *)(v10 + 216) = 0u;
    *(_OWORD *)(v10 + 200) = 0u;
    *(_OWORD *)(v10 + 184) = 0u;
    *(_OWORD *)(v10 + 168) = 0u;
    *(_OWORD *)(v10 + 152) = 0u;
    *(_OWORD *)(v10 + 136) = 0u;
    *(_OWORD *)(v10 + 120) = 0u;
    *(_OWORD *)(v10 + 104) = 0u;
    *(_OWORD *)(v10 + 88) = 0u;
    *(_OWORD *)(v10 + 72) = 0u;
    *(_OWORD *)(v10 + 56) = 0u;
    v16 = 1;
    *v12 = 0;
    v12[1] = 0;
    v12[2] = (uint64_t)v7;
    *v6 = (uint64_t)v12;
    v13 = (uint64_t *)**a1;
    if (v13)
    {
      *a1 = v13;
      v12 = (uint64_t *)*v6;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v12);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
    v9 = v15[0];
    v15[0] = 0;
  }
  return v9 + 56;
}

void sub_2106B68B8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Unwind_Resume(a1);
}

void sub_2106B6D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_2106B6F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, _QWORD *a11)
{
  void *v11;
  void *v12;
  void *v13;

  std::__tree<unsigned int>::destroy((uint64_t)&a10, a11);
  _Unwind_Resume(a1);
}

void sub_2106B7034(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106B7288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  void *v27;

  if (a27 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2106B752C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  void *v27;

  if (a27 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

uint64_t std::map<std::string,`anonymous namespace'::MetadataRecordingData>::operator[](uint64_t **a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  const void **v8;
  uint64_t v9;
  char *v10;
  std::string *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v15[2];
  char v16;

  v5 = (uint64_t)(a1 + 1);
  v4 = (uint64_t)a1[1];
  v6 = (uint64_t *)(a1 + 1);
  v7 = (uint64_t *)(a1 + 1);
  if (!v4)
    goto LABEL_10;
  v6 = (uint64_t *)(a1 + 1);
  while (1)
  {
    while (1)
    {
      v7 = (uint64_t *)v4;
      v8 = (const void **)(v4 + 32);
      if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)(a1 + 2), (const void **)a2, (const void **)(v4 + 32)))break;
      v4 = *v7;
      v6 = v7;
      if (!*v7)
        goto LABEL_10;
    }
    if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)(a1 + 2), v8, (const void **)a2))
      break;
    v6 = v7 + 1;
    v4 = v7[1];
    if (!v4)
      goto LABEL_10;
  }
  v9 = *v6;
  if (!*v6)
  {
LABEL_10:
    v10 = (char *)operator new(0x88uLL);
    v15[0] = (uint64_t)v10;
    v15[1] = v5;
    v16 = 0;
    v11 = (std::string *)(v10 + 32);
    if (*(char *)(a2 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
      v12 = (uint64_t *)v15[0];
    }
    else
    {
      *(_OWORD *)&v11->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
      *((_QWORD *)v10 + 6) = *(_QWORD *)(a2 + 16);
      v12 = (uint64_t *)v10;
    }
    *(_OWORD *)(v10 + 120) = 0u;
    *(_OWORD *)(v10 + 104) = 0u;
    *(_OWORD *)(v10 + 88) = 0u;
    *(_OWORD *)(v10 + 72) = 0u;
    *(_OWORD *)(v10 + 56) = 0u;
    v16 = 1;
    *v12 = 0;
    v12[1] = 0;
    v12[2] = (uint64_t)v7;
    *v6 = (uint64_t)v12;
    v13 = (uint64_t *)**a1;
    if (v13)
    {
      *a1 = v13;
      v12 = (uint64_t *)*v6;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v12);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
    v9 = v15[0];
    v15[0] = 0;
  }
  return v9 + 56;
}

void sub_2106B7710(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Unwind_Resume(a1);
}

void sub_2106B7850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  void *v20;
  void *v21;
  void *v22;

  if (a20 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2106B7A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  void *v20;
  void *v21;
  void *v22;

  if (a20 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2106B7B64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  void *v16;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2106B7C28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2106B7CCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106B7DD0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106B7EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v18 = v17;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2106B8060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  void *v16;
  void *v17;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2106B81D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  void *v16;
  void *v17;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2106B8314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v18 = v17;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2106B83DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106B8474(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106B85B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2106B888C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2106B8B54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106B8C4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106B8CE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_2106B8D98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t *std::unique_ptr<std::__tree_node<std::__value_type<std::string,`anonymous namespace'::StreamRecordingData>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,`anonymous namespace'::StreamRecordingData>,void *>>>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((_BYTE *)a1 + 16))
    {

      if (*(char *)(v2 + 55) < 0)
        operator delete(*(void **)(v2 + 32));
    }
    operator delete((void *)v2);
  }
  return a1;
}

uint64_t std::set<unsigned int>::set[abi:ne180100](uint64_t a1, unsigned int *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v6;

  *(_QWORD *)(a1 + 8) = 0;
  v4 = (uint64_t *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  if (a3)
  {
    v6 = 4 * a3;
    do
    {
      std::__tree<unsigned int>::__emplace_hint_unique_key_args<unsigned int,unsigned int const&>((uint64_t **)a1, v4, a2, a2);
      ++a2;
      v6 -= 4;
    }
    while (v6);
  }
  return a1;
}

void sub_2106B8EE4(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<unsigned int>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<unsigned int>::__emplace_hint_unique_key_args<unsigned int,unsigned int const&>(uint64_t **a1, uint64_t *a2, unsigned int *a3, _DWORD *a4)
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t v10;
  uint64_t *v11;

  v6 = std::__tree<unsigned int>::__find_equal<unsigned int>(a1, a2, &v11, &v10, a3);
  v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = (uint64_t *)operator new(0x20uLL);
    *((_DWORD *)v7 + 7) = *a4;
    std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__insert_node_at(a1, (uint64_t)v11, v8, v7);
  }
  return v7;
}

uint64_t *std::__tree<unsigned int>::__find_equal<unsigned int>(_QWORD *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, unsigned int *a5)
{
  uint64_t *v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  BOOL v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t *v17;
  unsigned int v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  unsigned int v22;

  v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, v7 = *((_DWORD *)a2 + 7), *a5 < v7))
  {
    v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      v9 = (uint64_t *)*a2;
      do
      {
        v10 = v9;
        v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      v13 = a2;
      do
      {
        v10 = (uint64_t *)v13[2];
        v14 = *v10 == (_QWORD)v13;
        v13 = v10;
      }
      while (v14);
    }
    v15 = *a5;
    if (*((_DWORD *)v10 + 7) < *a5)
      goto LABEL_17;
    v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v17 = (uint64_t *)v16;
          v18 = *(_DWORD *)(v16 + 28);
          if (v15 >= v18)
            break;
          v16 = *v17;
          v5 = v17;
          if (!*v17)
            goto LABEL_29;
        }
        if (v18 >= v15)
          break;
        v5 = v17 + 1;
        v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  v11 = a2[1];
  if (v11)
  {
    v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      v14 = *a4 == (_QWORD)v19;
      v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 7))
  {
    v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v21 = (uint64_t *)v20;
          v22 = *(_DWORD *)(v20 + 28);
          if (v6 >= v22)
            break;
          v20 = *v21;
          v5 = v21;
          if (!*v21)
            goto LABEL_48;
        }
        if (v22 >= v6)
          break;
        v5 = v21 + 1;
        v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

void std::__tree<unsigned int>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<unsigned int>::destroy(a1, *a2);
    std::__tree<unsigned int>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *std::unique_ptr<std::__tree_node<std::__value_type<std::string,`anonymous namespace'::MetadataRecordingData>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,`anonymous namespace'::MetadataRecordingData>,void *>>>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((_BYTE *)a1 + 16))
    {

      if (*(char *)(v2 + 55) < 0)
        operator delete(*(void **)(v2 + 32));
    }
    operator delete((void *)v2);
  }
  return a1;
}

void sub_2106B959C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106B9910(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2106B9B18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106B9E84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106BA0EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void MOVStreamHEVCLosslessEncoder::MOVStreamHEVCLosslessEncoder(MOVStreamHEVCLosslessEncoder *this)
{
  this->var2 = 0;
  *(_QWORD *)&this->var9 = *(_QWORD *)"";
  *(_WORD *)&this->var12 = 0;
  *(_QWORD *)&this->var3 = 0x2D000000500;
  this->var5 = 30.0;
  this->var6 = 0;
  *(_WORD *)&this->var0 = 0;
  *(_OWORD *)&this->var7.var0 = xmmword_2106E4690;
  this->var7.var4 = 1.0;
  *(_DWORD *)&this->var7.var5 = 257;
  this->var7.var9 = 0;
  this->var7.var10 = 4;
}

void MOVStreamHEVCLosslessEncoder::~MOVStreamHEVCLosslessEncoder(MOVStreamHEVCLosslessEncoder *this)
{

}

{

}

MOVStreamHEVCLosslessEncoder *MOVStreamHEVCLosslessEncoder::useQPCompression(MOVStreamHEVCLosslessEncoder *this, int a2)
{
  this->var7.var10 = a2;
  this->var7.var9 = 1;
  this->var7.var5 = 0;
  return this;
}

uint64_t MOVStreamHEVCLosslessEncoder::Open(uint64_t a1, int32_t a2, int32_t a3, int a4, char a5, const opaqueCMFormatDescription *a6, void (__cdecl *a7)(void *, void *, OSStatus, VTEncodeInfoFlags, CMSampleBufferRef), void *a8, double a9)
{
  NSObject *v16;
  uint64_t *v17;
  int v18;
  int v19;
  int v20;
  int *v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  MOVStreamHEVCLosslessEncoder *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  int v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  const __CFAllocator *v39;
  CFNumberRef v40;
  NSObject *v41;
  int v42;
  OSStatus v43;
  NSObject *v44;
  int v45;
  const __CFString *v46;
  NSObject *v47;
  int v48;
  NSObject *v49;
  const __CFString **v50;
  int v51;
  NSObject *v52;
  CFNumberRef v54;
  NSObject *v55;
  int v56;
  OSStatus v57;
  const void *v58;
  const void *v59;
  const void *v60;
  NSObject *v61;
  int v62;
  CFNumberRef v63;
  NSObject *v64;
  uint64_t v65;
  OSStatus v66;
  CFNumberRef v67;
  NSObject *v68;
  uint64_t v69;
  OSStatus v70;
  CFNumberRef v71;
  OSStatus v72;
  NSObject *v73;
  CFNumberRef v74;
  NSObject *v75;
  OSStatus v76;
  CFNumberRef v77;
  OSStatus v78;
  CFNumberRef v79;
  OSStatus v80;
  CFNumberRef v81;
  OSStatus v82;
  const void *v83;
  const void *v84;
  NSObject *v85;
  int v86;
  OSStatus v87;
  NSObject *v88;
  int v89;
  OSStatus v90;
  const void *v91;
  NSObject *v92;
  int v93;
  OSStatus v94;
  CFNumberRef v95;
  NSObject *v96;
  int v97;
  OSStatus v98;
  void *outputCallbackRefCon;
  void *v100;
  VTSessionRef *v101;
  VTSessionRef *v103;
  uint64_t v104;
  uint8_t valuePtr[4];
  int v106;
  uint64_t v107;
  uint64_t v108;
  _QWORD v109[2];
  _QWORD v110[2];
  _BYTE buf[28];
  __int16 v112;
  int v113;
  uint64_t v114;

  v114 = *MEMORY[0x24BDAC8D0];
  v104 = a1;
  if (a2 < 64 || a3 <= 63)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "Frame size too small";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCLosslessEncoder.mm";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 114;
      _os_log_impl(&dword_210675000, v16, OS_LOG_TYPE_ERROR, "Assert: %s - f: %s, l: %d\n", buf, 0x1Cu);
    }

    a1 = v104;
  }
  *(double *)(a1 + 24) = a9;
  v17 = (uint64_t *)(a1 + 24);
  *(_DWORD *)(a1 + 16) = a2;
  *(_DWORD *)(a1 + 20) = a3;
  *(_DWORD *)(a1 + 112) = 1752589105;
  *(_BYTE *)(a1 + 1) = a5;
  v103 = (VTSessionRef *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
LABEL_7:
    *(_BYTE *)(a1 + 116) = 0;
    v18 = a4 - 1;
    if ((a4 - 1) > 9)
    {
      v19 = 8;
      v20 = 1;
    }
    else
    {
      v19 = dword_2106E46A8[v18];
      v20 = dword_2106E46D0[v18];
    }
    *(_DWORD *)(a1 + 108) = v19;
    v21 = (int *)(a1 + 108);
    *(_DWORD *)(a1 + 48) = v20;
    *(_BYTE *)(a1 + 64) = 1;
    v22 = *(void **)(a1 + 8);
    if (v22)
    {
      if (!objc_msgSend(v22, "configureSessionOverride:", *v103))
        return 4294954394;
      if (!+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
        goto LABEL_17;
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        goto LABEL_16;
      *(_WORD *)buf = 0;
      v24 = "Custom video encoder configuration.";
      goto LABEL_15;
    }
    if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210675000, v38, OS_LOG_TYPE_DEBUG, "*-----------------------------------------------------------------------------*", buf, 2u);
      }

    }
    v39 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v40 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, (const void *)(v104 + 44));
    if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        v42 = *(_DWORD *)(v104 + 44);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v42;
        _os_log_impl(&dword_210675000, v41, OS_LOG_TYPE_DEBUG, "Encoder Config >> kVTCompressionPropertyKey_Usage = %d", buf, 8u);
      }

    }
    v43 = VTSessionSetProperty(*v103, (CFStringRef)*MEMORY[0x24BDF9370], v40);
    CFRelease(v40);
    if (v43)
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v43;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = "kVTCompressionPropertyKey_Usage failed";
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCLosslessEncoder.mm";
        v112 = 1024;
        v113 = 443;
        _os_log_impl(&dword_210675000, v44, OS_LOG_TYPE_ERROR, "Assert: (%d) %s - f: %s, l: %d\n", buf, 0x22u);
      }
      goto LABEL_95;
    }
    v45 = *(_DWORD *)(v104 + 48);
    if (v45 > 121)
    {
      switch(v45)
      {
        case 1308:
          v46 = CFSTR("HEVC_Main444_AutoLevel");
          goto LABEL_88;
        case 1309:
          goto LABEL_75;
        case 1310:
          v46 = CFSTR("HEVC_Main44410_AutoLevel");
          goto LABEL_88;
        case 1311:
          v46 = CFSTR("HEVC_Monochrome12_AutoLevel");
          goto LABEL_88;
        case 1312:
          v50 = (const __CFString **)MEMORY[0x24BDF97F8];
          goto LABEL_87;
        case 1313:
          v46 = CFSTR("HEVC_Monochrome10_AutoLevel");
          goto LABEL_88;
        default:
          if (v45 == 122)
          {
            v50 = (const __CFString **)MEMORY[0x24BDF9718];
          }
          else
          {
            if (v45 != 244)
              goto LABEL_75;
            v50 = (const __CFString **)MEMORY[0x24BDF9720];
          }
          break;
      }
      goto LABEL_87;
    }
    if (v45 <= 65)
    {
      switch(v45)
      {
        case 1:
          v46 = CFSTR("HEVC_Main_AutoLevel");
          goto LABEL_88;
        case 2:
          v46 = CFSTR("HEVC_Main10_AutoLevel");
          goto LABEL_88;
        case 3:
          v46 = CFSTR("HEVC_MainStill_AutoLevel");
          goto LABEL_88;
      }
LABEL_75:
      +[MIOLog defaultLog](MIOLog, "defaultLog", outputCallbackRefCon, v100, v101);
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v51 = *(_DWORD *)(v104 + 48);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v51;
        _os_log_impl(&dword_210675000, v44, OS_LOG_TYPE_ERROR, "Profile passed unrecognized (%d). exit.", buf, 8u);
      }
      goto LABEL_95;
    }
    switch(v45)
    {
      case 'B':
        v50 = (const __CFString **)MEMORY[0x24BDF9700];
        break;
      case 'M':
        v50 = (const __CFString **)MEMORY[0x24BDF97C0];
        break;
      case 'd':
        v50 = (const __CFString **)MEMORY[0x24BDF9770];
        break;
      default:
        goto LABEL_75;
    }
LABEL_87:
    v46 = *v50;
LABEL_88:
    if (+[MIOLog debugEnabled](MIOLog, "debugEnabled", outputCallbackRefCon, v100, v101))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v46;
        _os_log_impl(&dword_210675000, v52, OS_LOG_TYPE_DEBUG, "Encoder Config >> kVTCompressionPropertyKey_ProfileLevel = %{public}@", buf, 0xCu);
      }

    }
    if (VTSessionSetProperty(*v103, (CFStringRef)*MEMORY[0x24BDF9330], v46))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "VTVideoEncoderSetProperty failed";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCLosslessEncoder.mm";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 516;
        _os_log_impl(&dword_210675000, v44, OS_LOG_TYPE_ERROR, "Assert: %s - f: %s, l: %d\n", buf, 0x1Cu);
      }
      goto LABEL_95;
    }
    v54 = CFNumberCreate(v39, kCFNumberSInt32Type, (const void *)(v104 + 52));
    if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
      {
        v56 = *(_DWORD *)(v104 + 52);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v56;
        _os_log_impl(&dword_210675000, v55, OS_LOG_TYPE_DEBUG, "Encoder Config >> kVTCompressionPropertyKey_Priority = %d", buf, 8u);
      }

    }
    v57 = VTSessionSetProperty(*v103, (CFStringRef)*MEMORY[0x24BDF9328], v54);
    CFRelease(v54);
    if (v57)
    {
      if (!+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
        return 2;
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "kVTCompressionPropertyKey_Priority failed";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCLosslessEncoder.mm";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 533;
        _os_log_impl(&dword_210675000, v44, OS_LOG_TYPE_DEBUG, "Assert: %s - f: %s, l: %d\n", buf, 0x1Cu);
      }
LABEL_95:

      return 2;
    }
    v58 = (const void *)*MEMORY[0x24BDBD270];
    v59 = (const void *)*MEMORY[0x24BDBD268];
    if (*(_BYTE *)(v104 + 67))
      v60 = (const void *)*MEMORY[0x24BDBD270];
    else
      v60 = (const void *)*MEMORY[0x24BDBD268];
    if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
      {
        v62 = *(unsigned __int8 *)(v104 + 67);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v62;
        _os_log_impl(&dword_210675000, v61, OS_LOG_TYPE_DEBUG, "Encoder Config >> kVTCompressionPropertyKey_AllowFrameReordering = %d", buf, 8u);
      }

    }
    if (VTSessionSetProperty(*v103, (CFStringRef)*MEMORY[0x24BDF91F8], v60))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "VTVideoEncoderSetProperty failed";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCLosslessEncoder.mm";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 549;
        _os_log_impl(&dword_210675000, v44, OS_LOG_TYPE_ERROR, "Assert: %s - f: %s, l: %d\n", buf, 0x1Cu);
      }
      goto LABEL_95;
    }
    v63 = CFNumberCreate(v39, kCFNumberDoubleType, (const void *)(v104 + 56));
    if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
        v65 = *(_QWORD *)(v104 + 56);
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v65;
        _os_log_impl(&dword_210675000, v64, OS_LOG_TYPE_DEBUG, "Encoder Config >> kVTCompressionPropertyKey_MaxKeyFrameIntervalDuration = %f", buf, 0xCu);
      }

    }
    v66 = VTSessionSetProperty(*v103, (CFStringRef)*MEMORY[0x24BDF92D0], v63);
    CFRelease(v63);
    if (v66)
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "VTVideoEncoderSetProperty kVTCompressionPropertyKey_MaxKeyFrameIntervalDuration failed";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCLosslessEncoder.mm";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 568;
        _os_log_impl(&dword_210675000, v44, OS_LOG_TYPE_ERROR, "Assert: %s - f: %s, l: %d\n", buf, 0x1Cu);
      }
      goto LABEL_95;
    }
    v67 = CFNumberCreate(v39, kCFNumberDoubleType, v17);
    if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
      {
        v69 = *v17;
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v69;
        _os_log_impl(&dword_210675000, v68, OS_LOG_TYPE_DEBUG, "Encoder Config >> kVTCompressionPropertyKey_ExpectedFrameRate = %f", buf, 0xCu);
      }

    }
    v70 = VTSessionSetProperty(*v103, (CFStringRef)*MEMORY[0x24BDF9260], v67);
    CFRelease(v67);
    if (v70)
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "VTVideoEncoderSetProperty kVTCompressionPropertyKey_ExpectedFrameRate failed";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCLosslessEncoder.mm";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 586;
        _os_log_impl(&dword_210675000, v44, OS_LOG_TYPE_ERROR, "Assert: %s - f: %s, l: %d\n", buf, 0x1Cu);
      }
      goto LABEL_95;
    }
    if (*(_BYTE *)(v104 + 68))
    {
      *(_DWORD *)valuePtr = 3;
      v71 = CFNumberCreate(v39, kCFNumberSInt32Type, valuePtr);
      v72 = VTSessionSetProperty(*v103, CFSTR("EnableRCFW"), v71);
      CFRelease(v71);
      if (v72)
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "VTVideoEncoderSetProperty my_kVTCompressionPropertyKey_EnableRCFW failed";
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCLosslessEncoder.mm";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 605;
          _os_log_impl(&dword_210675000, v73, OS_LOG_TYPE_ERROR, "Assert: %s - f: %s, l: %d\n", buf, 0x1Cu);
        }
        goto LABEL_203;
      }
      if (VTSessionSetProperty(*v103, CFSTR("EnableQPMod"), v59))
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "VTVideoEncoderSetProperty my_kVTCompressionPropertyKey_EnableQPMod failed";
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCLosslessEncoder.mm";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 633;
          _os_log_impl(&dword_210675000, v73, OS_LOG_TYPE_ERROR, "Assert: %s - f: %s, l: %d\n", buf, 0x1Cu);
        }
        goto LABEL_203;
      }
      *(float *)valuePtr = *(float *)(v104 + 72);
      v77 = CFNumberCreate(v39, kCFNumberSInt32Type, valuePtr);
      v78 = VTSessionSetProperty(*(VTSessionRef *)(v104 + 32), CFSTR("InitialQPI"), v77);
      CFRelease(v77);
      if (v78)
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "VTVideoEncoderSetProperty  my_kVTCompressionPropertyKey_InitialQPI failed";
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCLosslessEncoder.mm";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 649;
LABEL_160:
          _os_log_impl(&dword_210675000, v73, OS_LOG_TYPE_ERROR, "Assert: %s - f: %s, l: %d\n", buf, 0x1Cu);
          goto LABEL_203;
        }
        goto LABEL_203;
      }
      v79 = CFNumberCreate(v39, kCFNumberSInt32Type, valuePtr);
      v80 = VTSessionSetProperty(*v103, CFSTR("InitialQPP"), v79);
      CFRelease(v79);
      if (v80)
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "VTVideoEncoderSetProperty my_kVTCompressionPropertyKey_InitialQPP failed";
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCLosslessEncoder.mm";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 663;
          goto LABEL_160;
        }
LABEL_203:

        return 2;
      }
      v81 = CFNumberCreate(v39, kCFNumberSInt32Type, valuePtr);
      v82 = VTSessionSetProperty(*v103, CFSTR("InitialQPB"), v81);
      CFRelease(v81);
      if (v82)
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "VTVideoEncoderSetProperty my_kVTCompressionPropertyKey_InitialQPB failed";
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCLosslessEncoder.mm";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 677;
          goto LABEL_160;
        }
        goto LABEL_203;
      }
    }
    else
    {
      *(float *)valuePtr = 1.0;
      v74 = CFNumberCreate(v39, kCFNumberFloat32Type, valuePtr);
      if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v75 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)&buf[4] = *(float *)valuePtr;
          _os_log_impl(&dword_210675000, v75, OS_LOG_TYPE_DEBUG, "Encoder Config >> kVTCompressionPropertyKey_Quality = %f", buf, 0xCu);
        }

      }
      v76 = VTSessionSetProperty(*v103, (CFStringRef)*MEMORY[0x24BDF9338], v74);
      CFRelease(v74);
      if (v76)
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "VTVideoEncoderSetProperty kVTCompressionPropertyKey_Quality failed";
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCLosslessEncoder.mm";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 697;
          _os_log_impl(&dword_210675000, v73, OS_LOG_TYPE_ERROR, "Assert: %s - f: %s, l: %d\n", buf, 0x1Cu);
        }
        goto LABEL_203;
      }
    }
    if (*(_BYTE *)(v104 + 65))
      v83 = v58;
    else
      v83 = v59;
    if (*(_BYTE *)v104)
      v84 = v59;
    else
      v84 = v83;
    if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
      {
        v86 = *(unsigned __int8 *)(v104 + 65);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v86;
        _os_log_impl(&dword_210675000, v85, OS_LOG_TYPE_DEBUG, "Encoder Config >> kVTCompressionPropertyKey_RealTime = %d", buf, 8u);
      }

    }
    v87 = VTSessionSetProperty(*v103, (CFStringRef)*MEMORY[0x24BDF9348], v84);
    if (v87)
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v87;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = "VTVideoEncoderSetProperty kVTCompressionPropertyKey_RealTime failed";
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCLosslessEncoder.mm";
        v112 = 1024;
        v113 = 723;
        _os_log_impl(&dword_210675000, v73, OS_LOG_TYPE_ERROR, "Assert: (%d) %s - f: %s, l: %d\n", buf, 0x22u);
      }
    }
    else
    {
      if (!*(_BYTE *)v104)
        goto LABEL_209;
      if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v88 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
        {
          v89 = *(unsigned __int8 *)(v104 + 65);
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v89;
          _os_log_impl(&dword_210675000, v88, OS_LOG_TYPE_DEBUG, "Encoder Config >> kVTCompressionPropertyKey_MaximizePowerEfficiency = %d", buf, 8u);
        }

      }
      v90 = VTSessionSetProperty(*v103, (CFStringRef)*MEMORY[0x24BDF92D8], v59);
      if (v90)
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&buf[4] = v90;
          *(_WORD *)&buf[8] = 2080;
          *(_QWORD *)&buf[10] = "VTVideoEncoderSetProperty kVTCompressionPropertyKey_MaximizePowerEfficiency failed";
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCLosslessEncoder.mm";
          v112 = 1024;
          v113 = 741;
          _os_log_impl(&dword_210675000, v73, OS_LOG_TYPE_ERROR, "Assert: (%d) %s - f: %s, l: %d\n", buf, 0x22u);
        }
      }
      else
      {
LABEL_209:
        if (*(_BYTE *)(v104 + 66))
          v91 = v58;
        else
          v91 = v59;
        if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
        {
          +[MIOLog defaultLog](MIOLog, "defaultLog");
          v92 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
          {
            v93 = *(unsigned __int8 *)(v104 + 66);
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v93;
            _os_log_impl(&dword_210675000, v92, OS_LOG_TYPE_DEBUG, "Encoder Config >> my_kVTCompressionPropertyKey_DebugMetadataSEI2 = %d", buf, 8u);
          }

        }
        v94 = VTSessionSetProperty(*v103, CFSTR("DebugMetadataSEI"), v91);
        if (v94)
        {
          +[MIOLog defaultLog](MIOLog, "defaultLog");
          v73 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)&buf[4] = v94;
            *(_WORD *)&buf[8] = 2080;
            *(_QWORD *)&buf[10] = "VTVideoEncoderSetProperty my_kVTCompressionPropertyKey_DebugMetadataSEI2 failed";
            *(_WORD *)&buf[18] = 2080;
            *(_QWORD *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCL"
                                  "osslessEncoder.mm";
            v112 = 1024;
            v113 = 756;
            _os_log_impl(&dword_210675000, v73, OS_LOG_TYPE_ERROR, "Assert: (%d) %s - f: %s, l: %d\n", buf, 0x22u);
          }
        }
        else
        {
          v95 = CFNumberCreate(v39, kCFNumberSInt32Type, v21);
          if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
          {
            +[MIOLog defaultLog](MIOLog, "defaultLog");
            v96 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
            {
              v97 = *v21;
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v97;
              _os_log_impl(&dword_210675000, v96, OS_LOG_TYPE_DEBUG, "Encoder Config >> my_kVTCompressionPropertyKey_OutputBitDepth = %d", buf, 8u);
            }

          }
          v98 = VTSessionSetProperty(*v103, CFSTR("OutputBitDepth"), v95);
          CFRelease(v95);
          if (!v98)
          {
            if (!+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
              goto LABEL_17;
            +[MIOLog defaultLog](MIOLog, "defaultLog");
            v23 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
LABEL_16:

LABEL_17:
              *(_QWORD *)buf = *MEMORY[0x24BDBD268];
              if (VTSessionCopyProperty(*v103, (CFStringRef)*MEMORY[0x24BDF91F8], (CFAllocatorRef)*MEMORY[0x24BDBD240], buf))
              {
                v25 = (MOVStreamHEVCLosslessEncoder *)(id)objc_msgSend(MEMORY[0x24BDD1540], "writerWarningWithMessage:code:", CFSTR("Cannot check AllowFrameReordering status of encoding session. Assuming disabled."), 0);
              }
              else
              {
                *(_BYTE *)(v104 + 117) = *(_QWORD *)buf == *MEMORY[0x24BDBD270];
                if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
                {
                  +[MIOLog defaultLog](MIOLog, "defaultLog");
                  v47 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                  {
                    v48 = *(unsigned __int8 *)(v104 + 117);
                    *(float *)valuePtr = 1.5047e-36;
                    v106 = v48;
                    _os_log_impl(&dword_210675000, v47, OS_LOG_TYPE_DEBUG, "AllowFrameReordering: %d", valuePtr, 8u);
                  }

                }
                CFRelease(*(CFTypeRef *)buf);
              }
              if (a6)
              {
                MOVStreamHEVCLosslessEncoder::propagateColorAttachments(v25, a6, (OpaqueVTCompressionSession *)*v103);
              }
              else if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
              {
                +[MIOLog defaultLog](MIOLog, "defaultLog");
                v49 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)valuePtr = 0;
                  _os_log_impl(&dword_210675000, v49, OS_LOG_TYPE_DEBUG, "Missing format discription for VTCompressionSession.", valuePtr, 2u);
                }

              }
              return 0;
            }
            *(_WORD *)buf = 0;
            v24 = "*-----------------------------------------------------------------------------*";
LABEL_15:
            _os_log_impl(&dword_210675000, v23, OS_LOG_TYPE_DEBUG, v24, buf, 2u);
            goto LABEL_16;
          }
          +[MIOLog defaultLog](MIOLog, "defaultLog");
          v73 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "VTVideoEncoderSetProperty my_kVTCompressionPropertyKey_OutputBitDepth failed";
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCL"
                                  "osslessEncoder.mm";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 774;
            _os_log_impl(&dword_210675000, v73, OS_LOG_TYPE_ERROR, "Assert: %s - f: %s, l: %d\n", buf, 0x1Cu);
          }
        }
      }
    }
    goto LABEL_203;
  }
  v26 = MEMORY[0x24BDBD1C8];
  v27 = *MEMORY[0x24BDF99C0];
  v109[0] = *MEMORY[0x24BDF99B8];
  v109[1] = v27;
  v110[0] = MEMORY[0x24BDBD1C8];
  v110[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v110, v109, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v104;
  v30 = *(void **)(v104 + 8);
  if (v30)
  {
    objc_msgSend(v30, "overrideVideoEncoderSpecification");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
    {
      v33 = v31;

      v28 = v33;
      v29 = v104;
    }
    v34 = objc_msgSend(*(id *)(v29 + 8), "codecTypeOverride");
    if (v34)
      *(_DWORD *)(v29 + 112) = v34;

    v29 = v104;
  }
  if (!*(_BYTE *)(v29 + 1))
    goto LABEL_46;
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210675000, v35, OS_LOG_TYPE_INFO, "VTCompressionSession: Enabling kVTCompressionSessionOption_AllowClientProcessEncode", buf, 2u);
  }

  v107 = *MEMORY[0x24BDF93B8];
  v108 = v26;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = v103;
  outputCallbackRefCon = a8;
  v36 = VTCompressionSessionCreateWithOptions();

  v29 = v104;
  if (!*(_BYTE *)(v104 + 1))
  {
LABEL_46:
    v36 = VTCompressionSessionCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, a3, *(_DWORD *)(v29 + 112), (CFDictionaryRef)v28, 0, 0, a7, a8, (VTCompressionSessionRef *)v103);
    if ((_DWORD)v36)
      goto LABEL_30;
LABEL_47:

    a1 = v104;
    goto LABEL_7;
  }
  if (!(_DWORD)v36)
    goto LABEL_47;
LABEL_30:
  +[MIOLog defaultLog](MIOLog, "defaultLog", outputCallbackRefCon, v100, v101);
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&buf[4] = v36;
    *(_WORD *)&buf[8] = 2080;
    *(_QWORD *)&buf[10] = "VTCompressionSessionCreate failed\n";
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCLosslessEncoder.mm";
    v112 = 1024;
    v113 = 196;
    _os_log_impl(&dword_210675000, v37, OS_LOG_TYPE_ERROR, "Assert: (%d) %s - f: %s, l: %d\n", buf, 0x22u);
  }

  return v36;
}

void sub_2106BBA50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t MOVStreamHEVCLosslessEncoder::propagateColorAttachments(MOVStreamHEVCLosslessEncoder *this, CMFormatDescriptionRef desc, OpaqueVTCompressionSession *a3)
{
  const __CFDictionary *Extensions;
  const __CFDictionary *v5;
  const void *Value;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  const void *v11;

  Extensions = CMFormatDescriptionGetExtensions(desc);
  if (Extensions)
  {
    v5 = Extensions;
    Value = CFDictionaryGetValue(Extensions, (const void *)*MEMORY[0x24BDC5570]);
    if (Value)
      VTSessionSetProperty(a3, (CFStringRef)*MEMORY[0x24BDF93A0], Value);
    v7 = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x24BDC5490]);
    if (v7)
      VTSessionSetProperty(a3, (CFStringRef)*MEMORY[0x24BDF9228], v7);
    v8 = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x24BDC5510]);
    if (v8)
    {
      v9 = v8;
      VTSessionSetProperty(a3, (CFStringRef)*MEMORY[0x24BDF9368], v8);
      if (CFEqual(v9, (CFTypeRef)*MEMORY[0x24BDC5560]))
      {
        v10 = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x24BDC54F0]);
        if (v10)
          VTSessionSetProperty(a3, (CFStringRef)*MEMORY[0x24BDF9270], v10);
      }
    }
    v11 = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x24BDC0B70]);
    if (v11)
      VTSessionSetProperty(a3, (CFStringRef)*MEMORY[0x24BDF9288], v11);
  }
  return 0;
}

MOVStreamHEVCLosslessEncoder *MOVStreamHEVCLosslessEncoder::invalidateSession(MOVStreamHEVCLosslessEncoder *this)
{
  if (!this->var12)
    this->var12 = 1;
  return this;
}

uint64_t MOVStreamHEVCLosslessEncoder::Close(MOVStreamHEVCLosslessEncoder *this)
{
  OpaqueVTCompressionSession *var6;
  OpaqueVTCompressionSession *v3;
  CMTime v5;

  if (!this->var12)
  {
    this->var12 = 1;
    var6 = this->var6;
    v5 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D38];
    VTCompressionSessionCompleteFrames(var6, &v5);
    v3 = this->var6;
    if (v3)
    {
      CFRelease(v3);
      this->var6 = 0;
    }
  }
  return 0;
}

void MOVStreamHEVCLosslessEncoder::InvalidateEncoder(MOVStreamHEVCLosslessEncoder *this)
{
  OpaqueVTCompressionSession *var6;

  if (!this->var12)
  {
    this->var12 = 1;
    var6 = this->var6;
    if (var6)
    {
      CFRelease(var6);
      this->var6 = 0;
    }
  }
}

BOOL MOVStreamHEVCLosslessEncoder::isSessionClosed(MOVStreamHEVCLosslessEncoder *this)
{
  return this->var12;
}

BOOL MOVStreamHEVCLosslessEncoder::frameReorderingEnabled(MOVStreamHEVCLosslessEncoder *this)
{
  return this->var13;
}

uint64_t MOVStreamHEVCLosslessEncoder::EncodeFrame(MOVStreamHEVCLosslessEncoder *this, __CVBuffer *a2, CMTime *a3, CFDictionaryRef frameProperties, void *sourceFrameRefcon)
{
  OpaqueVTCompressionSession *var6;
  uint64_t v8;
  NSObject *v9;
  __int128 v10;
  CMTime v12;
  CMTime presentationTimeStamp;
  VTEncodeInfoFlags infoFlagsOut;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  infoFlagsOut = 0;
  var6 = this->var6;
  presentationTimeStamp = *a3;
  v12 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D38];
  v8 = VTCompressionSessionEncodeFrame(var6, a2, &presentationTimeStamp, &v12, frameProperties, sourceFrameRefcon, &infoFlagsOut);
  if ((_DWORD)v8)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109890;
      v16 = v8;
      v17 = 2080;
      v18 = "VTCompressionSessionEncodeFrame failed\n";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamHEVCLosslessEncoder.mm";
      v21 = 1024;
      v22 = 389;
      _os_log_impl(&dword_210675000, v9, OS_LOG_TYPE_ERROR, "Assert: (%d) %s - f: %s, l: %d\n", buf, 0x22u);
    }

  }
  else
  {
    v10 = *(_OWORD *)&a3->value;
    this->var8.var3 = a3->epoch;
    *(_OWORD *)&this->var8.var0 = v10;
    ++this->var9;
  }
  return v8;
}

void sub_2106BC1BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106BC2CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106BC8C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24,void *a25)
{
  void *v25;
  void *v26;
  void *v27;

  _Unwind_Resume(a1);
}

void sub_2106BCD20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_2106BD0BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_2106BDA3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,uint64_t a21,void *a22)
{
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  _Unwind_Resume(a1);
}

void sub_2106BE6C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30)
{
  void *v30;
  void *v31;

  _Unwind_Resume(a1);
}

void sub_2106C00FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,uint64_t a29,void *a30,void *a31,void *a32,uint64_t a33,void *a34,uint64_t a35,void *a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *a41,void *a42,void *a43,void *a44,void *a45,void *a46)
{
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;

  _Unwind_Resume(a1);
}

void sub_2106C079C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106C0884(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106C08E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2106C09B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106C0A5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106C0AD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106C0C98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2106C0F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_2106C1000(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106C1054(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106C10BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106C11CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106C1554(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106C181C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106C1A68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106C1C88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106C1D60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106C1E0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106C266C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  void *v11;
  void *v12;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  if (a2 == 1)
  {
    v15 = objc_begin_catch(a1);
    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v11, "streamId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Cannot read sample buffer for '%@': %@"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a11, v17, 27);
    objc_end_catch();
    JUMPOUT(0x2106C25FCLL);
  }
  _Unwind_Resume(a1);
}

void sub_2106C29AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106C2D3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_2106C2E98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2106C33C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_2106C355C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106C36EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106C3808(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106C39C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106C3E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_2106C3FD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2106C417C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2106C434C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2106C48D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_2106C4C00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106C4DB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106C4E78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106C519C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2106C53B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2106C54AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106C5878(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2106C5F70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106C6C84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106C6CE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MIOL010ToL010Stride16FrameProcessor;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_2106C71F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_2106C764C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106C77AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_2106C7A20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106C7BF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2106C7C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MOVStreamReader;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_2106C80B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_2106C9C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,void *a24,void *a25)
{
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  _Unwind_Resume(a1);
}

void sub_2106CA2A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_2106CA42C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106CA7DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_2106CA9DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106CAD30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_2106CB074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2106CB154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_2106CB1F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2106CB5DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{

  _Unwind_Resume(a1);
}

void sub_2106CB7C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106CB934(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106CBA04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106CBA94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106CBC18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106CBCD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106CBD68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106CBDF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106CBE60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106CBEB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106CBF10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106CC024(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106CC148(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_2106CC1F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106CC280(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106CC314(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106CC380(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106CC400(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106CC4A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_2106CC57C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2106CC5F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106CC668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2106CC85C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106CC910(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106CC998(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106CCA2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106CCABC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106CCC18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106CCCA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106CCD38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106CCDC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106CCE78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106CCFA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106CD0E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106CD238(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106CD38C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106CD4E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106CD634(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106CD7F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106CD970(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106CDAB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106CDBD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106CDC40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106CDC8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106CDCD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106CDE04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106CDF90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106CE114(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106CE578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18)
{

  _Unwind_Resume(a1);
}

void sub_2106CE770(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2106CE858(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106CE90C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106CEB24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106CEC14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106CECA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t unpack_buffer(uint64_t result, uint64_t a2, uint64_t *a3, int a4, double a5, double a6, double a7, int8x16_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  int8x16_t v15;
  uint64_t v16;
  unsigned __int8 *v17;
  unsigned int v18;
  int8x16_t v19;
  uint16x4_t v20;
  int8x16_t v21;
  unsigned int v22;

  v8 = a3[1];
  if (v8)
  {
    v9 = 0;
    v10 = *a3;
    v11 = a3[2];
    v12 = a3[3];
    v13 = v11 >> 2;
    if (v11 >> 2 <= 1)
      v13 = 1;
    v14 = (unsigned __int8 *)(result + 4);
    v15.i64[0] = 0x3000000030;
    v15.i64[1] = 0x3000000030;
    do
    {
      if (v11 >= 4)
      {
        v16 = 0;
        v17 = v14;
        do
        {
          v18 = *v17;
          *(uint32x2_t *)v19.i8 = vshl_u32((uint32x2_t)vdup_n_s32(v18), (uint32x2_t)0x200000004);
          result = v18 >> 2;
          a8.i32[0] = *((_DWORD *)v17 - 1);
          v20 = (uint16x4_t)vmovl_u8(*(uint8x8_t *)a8.i8).u64[0];
          v19.i32[2] = v18;
          v19.i32[3] = v18 >> 2;
          v21 = vorrq_s8((int8x16_t)vshll_n_u16(v20, 6uLL), vandq_s8(v19, v15));
          a8 = vorrq_s8(v21, (int8x16_t)vshrq_n_u32(vmovl_u16(v20), 4uLL));
          if (a4)
            v22 = -1;
          else
            v22 = 0;
          *(int16x4_t *)(v10 + 8 * v16++) = vmovn_s32((int32x4_t)vbslq_s8((int8x16_t)vdupq_n_s32(v22), a8, v21));
          v17 += 5;
        }
        while (v13 != v16);
      }
      v10 += v12;
      ++v9;
      v14 += a2;
    }
    while (v9 != v8);
  }
  return result;
}

{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  int8x16_t v15;
  uint64_t v16;
  unsigned __int8 *v17;
  unsigned int v18;
  int8x16_t v19;
  uint16x4_t v20;
  int8x16_t v21;
  unsigned int v22;

  v8 = a3[1];
  if (v8)
  {
    v9 = 0;
    v10 = *a3;
    v11 = a3[2];
    v12 = a3[3];
    v13 = v11 >> 2;
    if (v11 >> 2 <= 1)
      v13 = 1;
    v14 = (unsigned __int8 *)(result + 4);
    v15.i64[0] = 0xC0000000C0;
    v15.i64[1] = 0xC0000000C0;
    do
    {
      if (v11 >= 4)
      {
        v16 = 0;
        v17 = v14;
        do
        {
          v18 = *v17;
          *(uint32x2_t *)v19.i8 = vshl_u32((uint32x2_t)vdup_n_s32(v18), (uint32x2_t)0x400000006);
          result = 4 * v18;
          a8.i32[0] = *((_DWORD *)v17 - 1);
          v20 = (uint16x4_t)vmovl_u8(*(uint8x8_t *)a8.i8).u64[0];
          v19.i32[2] = 4 * v18;
          v19.i32[3] = v18;
          v21 = vorrq_s8((int8x16_t)vshll_n_u16(v20, 8uLL), vandq_s8(v19, v15));
          a8 = vorrq_s8(v21, (int8x16_t)vshrq_n_u32(vmovl_u16(v20), 2uLL));
          if (a4)
            v22 = -1;
          else
            v22 = 0;
          *(int16x4_t *)(v10 + 8 * v16++) = vmovn_s32((int32x4_t)vbslq_s8((int8x16_t)vdupq_n_s32(v22), a8, v21));
          v17 += 5;
        }
        while (v13 != v16);
      }
      v10 += v12;
      ++v9;
      v14 += a2;
    }
    while (v9 != v8);
  }
  return result;
}

__int16 **pack_buffer(__int16 **result, uint64_t a2, _BYTE *a3)
{
  unint64_t v3;
  unint64_t v4;
  __int16 *v5;
  unint64_t v6;
  unint64_t v7;
  __int16 *v8;
  _BYTE *v9;
  __int16 v10;
  unsigned int v11;
  unsigned int v12;
  __int16 v13;

  v3 = (unint64_t)result[1];
  if (v3)
  {
    v4 = 0;
    v5 = *result;
    v6 = (unint64_t)result[2];
    do
    {
      if (v6 >= 4)
      {
        v7 = 0;
        v8 = v5;
        v9 = a3;
        do
        {
          v10 = *v8;
          v11 = (unsigned __int16)v8[1];
          v12 = (unsigned __int16)v8[2];
          v13 = v8[3];
          *v9 = HIBYTE(*v8);
          v9[1] = BYTE1(v11);
          v9[2] = BYTE1(v12);
          v9[3] = HIBYTE(v13);
          v9[4] = (v11 >> 4) & 0xC | (v10 >> 6) | (v12 >> 2) & 0x30 | v13 & 0xC0;
          ++v7;
          v6 = (unint64_t)result[2];
          v8 += 4;
          v9 += 5;
        }
        while (v7 < v6 >> 2);
        v3 = (unint64_t)result[1];
      }
      a3 += a2;
      v5 = (__int16 *)((char *)result[3] + (_QWORD)v5);
      ++v4;
    }
    while (v3 > v4);
  }
  return result;
}

uint64_t conv_q8q2_to_L010(uint64_t result, int a2, int16x8_t *a3, int a4, unsigned int a5, int a6)
{
  int v6;
  unsigned int v7;
  int8x16_t v8;
  int i;
  BOOL v10;
  uint64_t v11;
  int8x16_t *v12;
  uint64_t v13;
  int8x16_t v14;
  int16x8_t *v15;

  if (a6)
  {
    v6 = 0;
    v7 = (a5 + 7) >> 3;
    if (v7 <= 1)
      v7 = 1;
    v8.i64[0] = 0xC000C000C000C0;
    v8.i64[1] = 0xC000C000C000C0;
    do
    {
      if (a5 + 7 >= 8)
      {
        for (i = 0; i != v7; ++i)
        {
          v10 = (a5 & 7) != 0 && i == 1;
          if (v10)
            v11 = -5;
          else
            v11 = 0;
          v12 = (int8x16_t *)(result + v11);
          if (v10)
            v13 = -8;
          else
            v13 = 0;
          v14 = *v12;
          result = (uint64_t)&v12->i64[1] + 2;
          v15 = (int16x8_t *)((char *)a3 + v13);
          *v15 = vsliq_n_s16((int16x8_t)vandq_s8((int8x16_t)vshlq_u16(vmovl_u8((uint8x8_t)vqtbl1_s8(v14, (int8x8_t)0x909090904040404)), (uint16x8_t)xmmword_2106E47A0), v8), (int16x8_t)vmovl_u8((uint8x8_t)vqtbl1_s8(v14, (int8x8_t)0x807060503020100)), 8uLL);
          a3 = v15 + 1;
        }
      }
      result += a2 - 5 * (a5 >> 2);
      a3 = (int16x8_t *)((char *)a3 + 2 * ((a4 - 2 * a5) >> 1));
      ++v6;
    }
    while (v6 != a6);
  }
  return result;
}

int16x8_t *conv_L010_to_q8q2(int16x8_t *result, int a2, unsigned __int8 *a3, int a4, unsigned int a5, int a6)
{
  int v6;
  unsigned int v7;
  uint64_t v8;
  int8x16_t v9;
  int i;
  BOOL v11;
  uint64_t v12;
  unsigned __int8 *v13;
  uint64_t v14;
  int16x8_t *v15;
  int16x8_t v16;
  int8x16_t v17;
  int8x8_t v18;
  int8x8_t v19;
  int8x16_t v20;

  if (a6)
  {
    v6 = 0;
    v7 = (a5 + 7) >> 3;
    v8 = (a2 - 2 * a5) >> 1;
    if (v7 <= 1)
      v7 = 1;
    v9.i64[0] = 0xC000C000C000C0;
    v9.i64[1] = 0xC000C000C000C0;
    do
    {
      if (a5 + 7 >= 8)
      {
        for (i = 0; i != v7; ++i)
        {
          v11 = (a5 & 7) != 0 && i == 1;
          if (v11)
            v12 = -5;
          else
            v12 = 0;
          v13 = &a3[v12];
          if (v11)
            v14 = -8;
          else
            v14 = 0;
          v15 = (int16x8_t *)((char *)result + v14);
          v16 = *v15;
          result = v15 + 1;
          *(int8x8_t *)v17.i8 = vshrn_n_s16(v16, 8uLL);
          v18 = vmovn_s16((int16x8_t)vshlq_u16((uint16x8_t)vandq_s8((int8x16_t)v16, v9), (uint16x8_t)xmmword_2106E47B0));
          v19 = vpadd_s8(v18, v18);
          v17.u64[1] = (unint64_t)vpadd_s8(v19, v19);
          v20 = vqtbl1q_s8(v17, (int8x16_t)xmmword_2106E47C0);
          *((_WORD *)v13 + 4) = v20.i16[4];
          *(_QWORD *)v13 = v20.i64[0];
          a3 = v13 + 10;
        }
      }
      result = (int16x8_t *)((char *)result + 2 * v8);
      a3 += a4 - 5 * (a5 >> 2);
      ++v6;
    }
    while (v6 != a6);
  }
  return result;
}

void sub_2106CF358(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106CF414(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106CF4F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106CF774(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_2106CFB04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106CFBF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

char *std::vector<CMTime>::__assign_with_size[abi:ne180100]<CMTime*,CMTime*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void **v13;
  char *v14;
  _BYTE *v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - *(_QWORD *)result) >> 3) < a4)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 > 0xAAAAAAAAAAAAAAALL)
      std::vector<CMTime>::__throw_length_error[abi:ne180100]();
    v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    v11 = 2 * v10;
    if (2 * v10 <= a4)
      v11 = a4;
    if (v10 >= 0x555555555555555)
      v12 = 0xAAAAAAAAAAAAAAALL;
    else
      v12 = v11;
    result = std::vector<CMTime>::__vallocate[abi:ne180100](v7, v12);
    v14 = (char *)v7[1];
    v13 = (void **)(v7 + 1);
    v9 = v14;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v13 = (void **)(result + 8);
  v15 = (_BYTE *)*((_QWORD *)result + 1);
  if (0xAAAAAAAAAAAAAAABLL * ((v15 - v9) >> 3) >= a4)
    goto LABEL_16;
  v16 = &__src[8 * ((v15 - v9) >> 3)];
  if (v15 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v15 - v9);
    v9 = (char *)*v13;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v13 = &v9[v17];
  return result;
}

char *std::vector<CMTime>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::vector<CMTime>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CMTime>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void sub_2106CFF40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106CFFAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106D00C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106D0478(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106D0620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_2106D0710(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106D081C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2106D09B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106D0D78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106D0F18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_2106D1060(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_2106D126C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106D1490(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106D1840(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106D198C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106D1C18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106D1F7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106D232C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106D26B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106D29C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106D2D48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106D30D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106D331C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106D3580(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2106D36F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106D37A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106D3848(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106D3988(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v6;

  _Unwind_Resume(a1);
}

void sub_2106D3BFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106D3D88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double timerEnd(uint64_t a1)
{
  uint64_t v1;
  double v2;
  unsigned __int8 v3;
  unsigned __int8 v4;
  int v5;
  int v6;
  double v7;
  double v8;
  double v9;
  mach_timebase_info info;

  v1 = mach_absolute_time() - a1;
  mach_timebase_info(&info);
  v2 = (double)(v1 * info.numer / info.denom) / 1000000.0;
  v3 = atomic_load((unsigned __int8 *)&qword_254A70240);
  if ((v3 & 1) == 0 && __cxa_guard_acquire(&qword_254A70240))
  {
    qword_254A70238 = *(_QWORD *)&v2;
    __cxa_guard_release(&qword_254A70240);
  }
  v4 = atomic_load((unsigned __int8 *)&qword_254A70250);
  if ((v4 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_254A70250))
    {
      qword_254A70248 = *(_QWORD *)&v2;
      __cxa_guard_release(&qword_254A70250);
    }
  }
  v5 = _MergedGlobals;
  v6 = ++_MergedGlobals;
  if (v5)
  {
    v7 = *(double *)&qword_254A70238;
    if (v2 >= *(double *)&qword_254A70238)
    {
      v8 = *(double *)&qword_254A70248;
      if (v2 <= *(double *)&qword_254A70248)
        goto LABEL_6;
LABEL_10:
      qword_254A70248 = *(_QWORD *)&v2;
      v8 = v2;
      v9 = v2 + *(double *)&qword_254A70258;
      *(double *)&qword_254A70258 = v2 + *(double *)&qword_254A70258;
      if (v6 != 480)
        return v2;
      goto LABEL_11;
    }
    qword_254A70238 = *(_QWORD *)&v2;
    v7 = v2;
    v8 = *(double *)&qword_254A70248;
    if (v2 > *(double *)&qword_254A70248)
      goto LABEL_10;
  }
  else
  {
    qword_254A70238 = *(_QWORD *)&v2;
    qword_254A70248 = *(_QWORD *)&v2;
    qword_254A70258 = 0;
    v7 = v2;
    v8 = v2;
  }
LABEL_6:
  v9 = v2 + *(double *)&qword_254A70258;
  *(double *)&qword_254A70258 = v2 + *(double *)&qword_254A70258;
  if (v6 != 480)
    return v2;
LABEL_11:
  printf("duration = %5.3f msec, min/max/avg/count = %5.3f/%5.3f/%5.3f/%d\n", v2, v7, v8, v9 / 480.0, 480);
  _MergedGlobals = 0;
  return v2;
}

unsigned __int16 *right_shift_uint16_buffer(unsigned __int16 *result, uint16x8_t *a2, unint64_t a3, char a4)
{
  int16x8_t v4;
  uint16x8_t *v5;
  uint16x8_t *v6;
  unint64_t v7;
  uint16x8_t v8;
  uint64_t v9;
  uint16x8_t v10;
  uint64_t v11;

  v4 = vdupq_n_s16(a4);
  v5 = (uint16x8_t *)result;
  v6 = a2;
  if (a3 >= 0x40)
  {
    v7 = a3 >> 6;
    v8 = (uint16x8_t)vnegq_s16(v4);
    v6 = a2;
    v5 = (uint16x8_t *)result;
    do
    {
      *v6 = vshlq_u16(*v5, v8);
      v6[1] = vshlq_u16(v5[1], v8);
      v6[2] = vshlq_u16(v5[2], v8);
      v6[3] = vshlq_u16(v5[3], v8);
      v5 += 4;
      v6 += 4;
      --v7;
    }
    while (v7);
  }
  v9 = (a3 >> 4) & 3;
  if (v9)
  {
    v10 = (uint16x8_t)vnegq_s16(v4);
    *v6 = vshlq_u16(*v5, v10);
    if (v9 != 1)
    {
      v6[1] = vshlq_u16(v5[1], v10);
      if (v9 != 2)
        v6[2] = vshlq_u16(v5[2], v10);
    }
  }
  v11 = (a3 >> 1) & 7;
  if (v11)
  {
    a2->i16[0] = *result >> a4;
    if (v11 != 1)
    {
      a2->i16[1] = result[1] >> a4;
      if (v11 != 2)
      {
        a2->i16[2] = result[2] >> a4;
        if (v11 != 3)
        {
          a2->i16[3] = result[3] >> a4;
          if (v11 != 4)
          {
            a2->i16[4] = result[4] >> a4;
            if (v11 != 5)
            {
              a2->i16[5] = result[5] >> a4;
              if (v11 != 6)
                a2->i16[6] = result[6] >> a4;
            }
          }
        }
      }
    }
  }
  return result;
}

unsigned __int16 *left_shift_uint16_buffer(unsigned __int16 *result, uint16x8_t *a2, unint64_t a3, char a4)
{
  uint16x8_t v4;
  uint16x8_t *v5;
  uint16x8_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = (uint16x8_t)vdupq_n_s16(a4);
  v5 = (uint16x8_t *)result;
  v6 = a2;
  if (a3 >= 0x40)
  {
    v7 = a3 >> 6;
    v6 = a2;
    v5 = (uint16x8_t *)result;
    do
    {
      *v6 = vshlq_u16(*v5, v4);
      v6[1] = vshlq_u16(v5[1], v4);
      v6[2] = vshlq_u16(v5[2], v4);
      v6[3] = vshlq_u16(v5[3], v4);
      v5 += 4;
      v6 += 4;
      --v7;
    }
    while (v7);
  }
  v8 = (a3 >> 4) & 3;
  if (v8)
  {
    *v6 = vshlq_u16(*v5, v4);
    if (v8 != 1)
    {
      v6[1] = vshlq_u16(v5[1], v4);
      if (v8 != 2)
        v6[2] = vshlq_u16(v5[2], v4);
    }
  }
  v9 = (a3 >> 1) & 7;
  if (v9)
  {
    a2->i16[0] = *result << a4;
    if (v9 != 1)
    {
      a2->i16[1] = result[1] << a4;
      if (v9 != 2)
      {
        a2->i16[2] = result[2] << a4;
        if (v9 != 3)
        {
          a2->i16[3] = result[3] << a4;
          if (v9 != 4)
          {
            a2->i16[4] = result[4] << a4;
            if (v9 != 5)
            {
              a2->i16[5] = result[5] << a4;
              if (v9 != 6)
                a2->i16[6] = result[6] << a4;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t join_bayer_buffer_yuv(uint64_t result, const unsigned __int16 *a2, unsigned __int16 *a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7, unint64_t a8, unsigned int a9, BOOL a10)
{
  uint64_t v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint16x8_t v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  int8x16_t v28;
  int8x16_t v29;
  int8x16_t v30;
  int8x16_t v31;
  unsigned int v32;
  int8x16_t v33;
  unsigned __int16 *v34;
  uint64_t v35;
  uint64_t v36;
  const unsigned __int16 *v37;
  unsigned __int16 *v38;
  unsigned __int16 *v39;
  unsigned __int16 *v40;
  unsigned __int16 *v41;
  int v42;
  int8x16x2_t v43;
  int8x16x2_t v44;

  if (a5)
  {
    v10 = 0;
    v11 = 0;
    v12 = 2 * a4;
    v13 = (a4 >> 3) & 0xFFFFFFFFFFFFFFFLL;
    v14 = a6 >> 1;
    v15 = a7 >> 1;
    v16 = a8 >> 1;
    v17 = ((2 * a4) >> 2) & 3;
    v18 = 2 * (a6 >> 1);
    v19 = 2 * (a8 >> 1);
    v20 = 2 * (a7 >> 1);
    v21 = 8 * v13;
    v22 = (uint16x8_t)vnegq_s16(vdupq_n_s16(a9));
    do
    {
      if (v12 >= 0x10)
      {
        v23 = 0;
        v24 = (char *)&a3[v18 / 2] + v18 * v11;
        v25 = (unint64_t)v11 >> 1;
        v26 = (char *)a2 + v19 * v25;
        v27 = result + v20 * v25;
        do
        {
          v28 = (int8x16_t)vshlq_u16(*(uint16x8_t *)(v27 + 16 * v23), v22);
          v29 = (int8x16_t)vshlq_u16(*(uint16x8_t *)&v26[16 * v23], v22);
          v30 = (int8x16_t)vshrq_n_u16((uint16x8_t)v28, 0xAuLL);
          v31 = (int8x16_t)vshrq_n_u16((uint16x8_t)v29, 0xAuLL);
          if (a10)
            v32 = -1;
          else
            v32 = 0;
          v33 = (int8x16_t)vdupq_n_s16(v32);
          v44.val[1] = vorrq_s8(vandq_s8(v30, v33), v28);
          v43.val[0] = vandq_s8(v31, v33);
          v44.val[0] = vorrq_s8(v43.val[0], v29);
          *(int16x4_t *)v43.val[0].i8 = vmovn_s32((int32x4_t)v44.val[1]);
          v43.val[1] = *(int8x16_t *)&v24[16 * v23];
          *(int8x16_t *)&v24[16 * v23] = vqtbl2q_s8(v43, (int8x16_t)xmmword_2106E4870);
          *(int8x16_t *)((char *)&a3[8 * v23] + v18 * v11) = vqtbl2q_s8(v44, (int8x16_t)xmmword_2106E4880);
          v43.val[0] = (int8x16_t)vuzp2q_s16((int16x8_t)v44.val[0], (int16x8_t)xmmword_2106E4870);
          v43.val[1] = *(int8x16_t *)&v24[16 * v23];
          *(int8x16_t *)&v24[16 * v23++] = vqtbl2q_s8(v43, (int8x16_t)xmmword_2106E4890);
        }
        while (v13 > v23);
      }
      if (!v17)
        goto LABEL_4;
      v34 = &a3[v10 * v14];
      v35 = v11 >> 1;
      v36 = result + 2 * v15 * v35;
      v37 = &a2[v16 * v35];
      v38 = &v34[v21];
      v39 = &a3[v14 * (v11 | 1) + v21];
      v40 = (unsigned __int16 *)(v36 + v21 * 2);
      v41 = (unsigned __int16 *)&v37[v21];
      *v39 = *v40 >> a9;
      v38[1] = v40[1] >> a9;
      *v38 = v37[8 * v13] >> a9;
      v39[1] = v37[v21 + 1] >> a9;
      if (a10)
      {
        *v39 |= *v39 >> 10;
        v38[1] |= v38[1] >> 10;
        *v38 |= *v38 >> 10;
        v39[1] |= v39[1] >> 10;
        if (v17 == 1)
          goto LABEL_4;
        v39[1] = v40[1] >> a9;
        v38[2] = v40[2] >> a9;
        v38[1] = v41[1] >> a9;
        v39[2] = v41[2] >> a9;
        v39[1] |= v39[1] >> 10;
        v38[2] |= v38[2] >> 10;
        v38[1] |= v38[1] >> 10;
        v39[2] |= v39[2] >> 10;
        if (v17 == 2)
          goto LABEL_4;
        v39[2] = v40[2] >> a9;
        v38[3] = v40[3] >> a9;
        v38[2] = v41[2] >> a9;
        v39[3] = v41[3] >> a9;
        v39[2] |= v39[2] >> 10;
        v38[3] |= v38[3] >> 10;
        v38[2] |= v38[2] >> 10;
        v42 = v39[3] | (v39[3] >> 10);
      }
      else
      {
        if (v17 == 1)
          goto LABEL_4;
        v39[1] = v40[1] >> a9;
        v38[2] = v40[2] >> a9;
        v38[1] = v41[1] >> a9;
        v39[2] = v41[2] >> a9;
        if (v17 == 2)
          goto LABEL_4;
        v39[2] = v40[2] >> a9;
        v38[3] = v40[3] >> a9;
        v38[2] = v41[2] >> a9;
        v42 = v41[3] >> a9;
      }
      v39[3] = v42;
LABEL_4:
      v11 += 2;
      v10 = v11;
    }
    while (v11 < a5);
  }
  return result;
}

uint64_t copy_alpha_channel_to_monochrome(uint64_t result, unsigned __int16 *a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int16 *v12;
  uint64_t v13;
  const __int16 *v14;
  unsigned __int128 v15;
  unsigned __int16 *v16;
  unsigned __int16 *v17;
  unsigned __int16 *v18;
  uint64_t v19;
  unsigned __int16 *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __int16 *v27;
  unsigned __int128 v28;

  if (a4)
  {
    v6 = (a3 >> 3) & 0xFFFFFFFFFFFFFFFLL;
    v7 = a6 >> 1;
    v8 = a3 & 7;
    v9 = a5 >> 1;
    if (v6)
    {
      if ((a3 & 7) != 0)
      {
        v10 = 0;
        v11 = result;
        v12 = a2;
        do
        {
          v13 = 0;
          do
          {
            v14 = (const __int16 *)(v11 + (v13 << 6));
            v15 = (unsigned __int128)vld4q_s16(v14);
            *(_OWORD *)&v12[8 * v13++] = v15;
          }
          while (v6 > v13);
          v16 = (unsigned __int16 *)(result + 2 * v10 * v7 + (v6 << 6));
          v17 = &a2[8 * v6 + v10 * v9];
          *v17 = *v16;
          if (v8 != 1)
          {
            v17[1] = v16[4];
            if (v8 != 2)
            {
              v17[2] = v16[8];
              if (v8 != 3)
              {
                v17[3] = v16[12];
                if (v8 != 4)
                {
                  v17[4] = v16[16];
                  if (v8 != 5)
                  {
                    v17[5] = v16[20];
                    if (v8 != 6)
                      v17[6] = v16[24];
                  }
                }
              }
            }
          }
          ++v10;
          v12 += v9;
          v11 += 2 * v7;
        }
        while (a4 > v10);
      }
      else
      {
        v24 = 2 * v9;
        v25 = 2 * v7;
        do
        {
          v26 = 0;
          do
          {
            v27 = (const __int16 *)(result + (v26 << 6));
            v28 = (unsigned __int128)vld4q_s16(v27);
            *(_OWORD *)&a2[8 * v26++] = v28;
          }
          while (v6 > v26);
          ++v8;
          a2 = (unsigned __int16 *)((char *)a2 + v24);
          result += v25;
        }
        while (a4 > v8);
      }
    }
    else if ((a3 & 7) != 0)
    {
      v18 = a2 + 3;
      v19 = 2 * v9;
      v20 = (unsigned __int16 *)(result + 24);
      v21 = 2 * v7;
      v22 = 1;
      do
      {
        *(v18 - 3) = *(v20 - 12);
        if (v8 != 1)
        {
          *(v18 - 2) = *(v20 - 8);
          if (v8 != 2)
          {
            *(v18 - 1) = *(v20 - 4);
            if (v8 != 3)
            {
              *v18 = *v20;
              if (v8 != 4)
              {
                v18[1] = v20[4];
                if (v8 != 5)
                {
                  v18[2] = v20[8];
                  if (v8 != 6)
                    v18[3] = v20[12];
                }
              }
            }
          }
        }
        v23 = a4 > v22++;
        v18 = (unsigned __int16 *)((char *)v18 + v19);
        v20 = (unsigned __int16 *)((char *)v20 + v21);
      }
      while (v23);
    }
  }
  return result;
}

uint64_t copy_monochrome_to_alpha_channel(uint64_t result, unsigned __int16 *a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  unsigned __int16 *v13;
  uint64_t v14;
  int8x16_t *v15;
  __int128 v16;
  unsigned __int16 *v17;
  unsigned __int16 *v18;
  unsigned __int16 *v19;
  uint64_t v20;
  unsigned __int16 *v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  int8x16_t *v29;
  __int128 v30;

  if (a4)
  {
    v6 = (a3 >> 3) & 0xFFFFFFFFFFFFFFFLL;
    v7 = a5 >> 1;
    v8 = a3 & 7;
    v9 = a6 >> 1;
    if (v6)
    {
      if ((a3 & 7) != 0)
      {
        v10 = 0;
        *(_QWORD *)&v11 = 0x8000800080008000;
        *((_QWORD *)&v11 + 1) = 0x8000800080008000;
        v12 = result;
        v13 = a2;
        do
        {
          v14 = 0;
          do
          {
            v15 = (int8x16_t *)&v13[32 * v14];
            v16 = *(_OWORD *)(v12 + 16 * v14);
            v15[2] = vqtbl2q_s8(*(int8x16x2_t *)&v11, (int8x16_t)xmmword_2106E48C0);
            v15[3] = vqtbl2q_s8(*(int8x16x2_t *)&v11, (int8x16_t)xmmword_2106E48D0);
            *v15 = vqtbl2q_s8(*(int8x16x2_t *)&v11, (int8x16_t)xmmword_2106E48A0);
            v15[1] = vqtbl2q_s8(*(int8x16x2_t *)&v11, (int8x16_t)xmmword_2106E48B0);
            ++v14;
          }
          while (v6 > v14);
          v17 = (unsigned __int16 *)(result + 2 * v10 * v7 + 16 * v6);
          v18 = &a2[32 * v6 + v10 * v9];
          *v18 = *v17;
          if (v8 != 1)
          {
            v18[4] = v17[1];
            if (v8 != 2)
            {
              v18[8] = v17[2];
              if (v8 != 3)
              {
                v18[12] = v17[3];
                if (v8 != 4)
                {
                  v18[16] = v17[4];
                  if (v8 != 5)
                  {
                    v18[20] = v17[5];
                    if (v8 != 6)
                      v18[24] = v17[6];
                  }
                }
              }
            }
          }
          ++v10;
          v13 += v9;
          v12 += 2 * v7;
        }
        while (a4 > v10);
      }
      else
      {
        v25 = 2 * v9;
        v26 = 2 * v7;
        *(_QWORD *)&v27 = 0x8000800080008000;
        *((_QWORD *)&v27 + 1) = 0x8000800080008000;
        do
        {
          v28 = 0;
          do
          {
            v29 = (int8x16_t *)&a2[32 * v28];
            v30 = *(_OWORD *)(result + 16 * v28);
            v29[2] = vqtbl2q_s8(*(int8x16x2_t *)&v27, (int8x16_t)xmmword_2106E48C0);
            v29[3] = vqtbl2q_s8(*(int8x16x2_t *)&v27, (int8x16_t)xmmword_2106E48D0);
            *v29 = vqtbl2q_s8(*(int8x16x2_t *)&v27, (int8x16_t)xmmword_2106E48A0);
            v29[1] = vqtbl2q_s8(*(int8x16x2_t *)&v27, (int8x16_t)xmmword_2106E48B0);
            ++v28;
          }
          while (v6 > v28);
          ++v8;
          a2 = (unsigned __int16 *)((char *)a2 + v25);
          result += v26;
        }
        while (a4 > v8);
      }
    }
    else if ((a3 & 7) != 0)
    {
      v19 = a2 + 12;
      v20 = 2 * v9;
      v21 = (unsigned __int16 *)(result + 6);
      v22 = 2 * v7;
      v23 = 1;
      do
      {
        *(v19 - 12) = *(v21 - 3);
        if (v8 != 1)
        {
          *(v19 - 8) = *(v21 - 2);
          if (v8 != 2)
          {
            *(v19 - 4) = *(v21 - 1);
            if (v8 != 3)
            {
              *v19 = *v21;
              if (v8 != 4)
              {
                v19[4] = v21[1];
                if (v8 != 5)
                {
                  v19[8] = v21[2];
                  if (v8 != 6)
                    v19[12] = v21[3];
                }
              }
            }
          }
        }
        v24 = a4 > v23++;
        v19 = (unsigned __int16 *)((char *)v19 + v20);
        v21 = (unsigned __int16 *)((char *)v21 + v22);
      }
      while (v24);
    }
  }
  return result;
}

unint64_t split_bayer_buffer_yuv(unint64_t result, unsigned __int16 *a2, unsigned __int16 *a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7, unint64_t a8, double a9, double a10, int16x8_t a11, double a12, int16x8_t a13, double a14, double a15, int16x8_t a16, unsigned int a17)
{
  int16x8_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned __int16 *v25;
  uint64_t v26;
  _WORD *v27;
  uint64_t v28;
  _WORD *v29;
  uint64_t v30;
  unsigned int v31;
  unsigned __int16 *v32;
  uint64_t v33;
  unsigned int v34;
  int8x16_t v35;
  uint64_t v36;
  int16x4_t v37;
  uint64_t v38;
  unsigned __int16 *v39;
  unsigned __int16 *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unsigned __int16 *v44;
  unsigned __int16 *v45;
  uint64_t v46;
  const __int16 *v47;
  const __int16 *v48;
  uint16x4_t v49;
  uint16x4_t v50;
  uint16x4_t v51;
  uint16x4_t v52;
  unsigned __int16 *v53;
  unsigned __int16 *v54;
  unsigned __int16 *v55;
  unsigned __int16 *v56;

  if (a5)
  {
    v18 = (a4 >> 3) & 0xFFFFFFFFFFFFFFFLL;
    v19 = a6 >> 1;
    v20 = a7 >> 1;
    v21 = a8 >> 1;
    v22 = ((2 * a4) >> 2) & 3;
    if (2 * a4 >= 0x10)
    {
      v33 = 0;
      v34 = 0;
      v35 = (int8x16_t)vdupq_n_s16(a17);
      v36 = 2 * v19;
      v37 = (int16x4_t)vextq_s8(v35, v35, 8uLL).u64[0];
      v38 = 8 * v18;
      v39 = a2;
      v40 = a3;
      do
      {
        v41 = 0;
        v42 = result + 2 * v33 * v19;
        v43 = v34 >> 1;
        v44 = &a2[v20 * v43];
        v45 = &a3[v21 * v43];
        do
        {
          v46 = 8 * v41;
          v47 = (const __int16 *)(result + v36 + v36 * v34 + 16 * v41);
          a11 = (int16x8_t)vld2_s16(v47);
          v48 = (const __int16 *)(result + v36 * v34 + 16 * v41);
          a13 = (int16x8_t)vld2_s16(v48);
          v49 = (uint16x4_t)vuzp1_s16(*(int16x4_t *)v35.i8, v37);
          *(uint16x4_t *)a16.i8 = vshl_u16(*(uint16x4_t *)a11.i8, v49);
          v50 = (uint16x4_t)vuzp2_s16(*(int16x4_t *)v35.i8, v37);
          *(uint16x4_t *)v17.i8 = vshl_u16(v51, v50);
          a16 = vzip1q_s16(a16, v17);
          *(int16x8_t *)&v39[v46] = a16;
          *(uint16x4_t *)a13.i8 = vshl_u16(*(uint16x4_t *)a13.i8, v49);
          *(uint16x4_t *)a11.i8 = vshl_u16(v52, v50);
          a11 = vzip1q_s16(a13, a11);
          *(int16x8_t *)&v40[v46] = a11;
          ++v41;
        }
        while (v18 > v41);
        if (v22)
        {
          v53 = (unsigned __int16 *)(v42 + v38 * 2);
          v54 = (unsigned __int16 *)(result + 2 * v19 * (v34 | 1) + v38 * 2);
          v55 = &v44[v38];
          v56 = &v45[v38];
          *v55 = *v54 << a17;
          v55[1] = v53[1] << a17;
          *v56 = *v53 << a17;
          v56[1] = v54[1] << a17;
          if (v22 != 1)
          {
            v55[1] = v54[1] << a17;
            v55[2] = v53[2] << a17;
            v56[1] = v53[1] << a17;
            v56[2] = v54[2] << a17;
            if (v22 != 2)
            {
              v55[2] = v54[2] << a17;
              v55[3] = v53[3] << a17;
              v56[2] = v53[2] << a17;
              v56[3] = v54[3] << a17;
            }
          }
        }
        v40 += v21;
        v39 += v20;
        v34 += 2;
        v33 = v34;
      }
      while (v34 < a5);
    }
    else if (v22)
    {
      v23 = v19;
      v24 = (16 * (a4 >> 3)) | 4;
      v25 = (unsigned __int16 *)(result + v24);
      v26 = 4 * v19;
      v27 = (unsigned __int16 *)((char *)a2 + v24);
      v28 = 2 * v20;
      v29 = (unsigned __int16 *)((char *)a3 + v24);
      v30 = 2 * v21;
      v31 = 2;
      do
      {
        v32 = &v25[v23];
        *(v27 - 2) = v25[v23 - 2] << a17;
        *(v27 - 1) = *(v25 - 1) << a17;
        *(v29 - 2) = *(v25 - 2) << a17;
        *(v29 - 1) = v25[v23 - 1] << a17;
        if (v22 != 1)
        {
          *(v27 - 1) = *(v32 - 1) << a17;
          *v27 = *v25 << a17;
          *(v29 - 1) = *(v25 - 1) << a17;
          *v29 = *v32 << a17;
          if (v22 != 2)
          {
            *v27 = v25[v23] << a17;
            v27[1] = v25[1] << a17;
            *v29 = *v25 << a17;
            v29[1] = v25[v23 + 1] << a17;
          }
        }
        result = v31;
        v25 = (unsigned __int16 *)((char *)v25 + v26);
        v27 = (_WORD *)((char *)v27 + v28);
        v29 = (_WORD *)((char *)v29 + v30);
        v31 += 2;
      }
      while (result < a5);
    }
  }
  return result;
}

unsigned __int16 *split_bayer_buffer(unsigned __int16 *result, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int16 *a4, unsigned __int16 *a5, unint64_t a6, unint64_t a7, unint64_t a8, unsigned int a9, BOOL a10)
{
  unint64_t v10;
  unint64_t v11;
  unsigned __int16 *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unsigned __int16 *v16;
  unsigned __int16 *v17;
  unsigned __int16 *v18;
  unsigned int v19;
  unsigned __int16 *v20;
  unsigned __int16 *v21;
  BOOL v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  int8x16_t v26;
  int16x4_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  const __int16 *v33;
  const __int16 *v34;
  uint16x4_t v35;
  __int128 v36;
  uint16x4_t v37;
  uint16x4_t v38;
  uint16x4_t v39;
  unsigned __int16 *v40;
  unsigned __int16 *v41;
  unsigned __int16 *v42;
  unsigned __int16 *v43;
  unsigned __int16 *v44;
  unsigned __int16 *v45;
  unsigned __int16 *v46;
  unsigned __int16 *v47;
  unsigned __int16 *v48;
  unsigned __int16 *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  const __int16 *v55;
  const __int16 *v56;
  int16x4_t v57;
  int16x4_t v58;
  int16x4_t v59;
  int16x4_t v60;
  unsigned __int16 *v61;
  unsigned __int16 *v62;
  unsigned __int16 *v63;
  unsigned __int16 *v64;
  unsigned __int16 *v65;
  unsigned __int16 *v66;
  unsigned __int16 *v67;
  unsigned __int16 *v68;
  unsigned __int16 *v69;
  unsigned int v70;
  uint64_t v71;
  unsigned __int16 *v72;
  unsigned __int16 *v73;
  int16x4x2_t v74;
  int16x4x2_t v75;
  int16x4x2_t v76;
  int16x4x2_t v77;
  int16x4x2_t v78;
  int16x4x2_t v79;
  int16x4x2_t v80;
  int16x4x2_t v81;

  if (a6 / a7 < 2)
    return result;
  v10 = a7 >> 4;
  LODWORD(v11) = a9;
  v12 = (unsigned __int16 *)((char *)result + a7);
  v13 = a7 & 0x1F;
  v14 = (a6 / a7) >> 1;
  if (a7 >= 0x20)
  {
    v23 = a7 >> 5;
    v24 = (a8 >> 4) & 0xFFFFFFFFFFFFFFELL;
    if (a9)
    {
      LODWORD(v25) = 0;
      v26 = (int8x16_t)vdupq_n_s16(a9);
      v27 = (int16x4_t)vextq_s8(v26, v26, 8uLL).u64[0];
      v28 = 8 * v10;
      v29 = 16 * v24;
      while (1)
      {
        v30 = 0;
        v31 = 0;
        v32 = 1;
        do
        {
          v33 = (const __int16 *)&result[v30];
          v75 = vld2_s16(v33);
          v33 += 8;
          v77 = vld2_s16(v33);
          v34 = (const __int16 *)&v12[v30];
          v79 = vld2_s16(v34);
          v34 += 8;
          v81 = vld2_s16(v34);
          v35 = (uint16x4_t)vuzp1_s16(*(int16x4_t *)v26.i8, v27);
          *(uint16x4_t *)&v36 = vshl_u16((uint16x4_t)v75.val[0], v35);
          *((uint16x4_t *)&v36 + 1) = vshl_u16((uint16x4_t)v77.val[0], v35);
          *(_OWORD *)&a2[v31] = v36;
          *(int16x4_t *)&v36 = vuzp2_s16(*(int16x4_t *)v26.i8, v27);
          v75.val[0] = (int16x4_t)vshl_u16((uint16x4_t)v75.val[1], *(uint16x4_t *)&v36);
          v37 = vshl_u16((uint16x4_t)v77.val[1], *(uint16x4_t *)&v36);
          *(int16x4x2_t *)&a3[v31] = v75;
          v75.val[0] = (int16x4_t)vshl_u16((uint16x4_t)v79.val[0], v35);
          v38 = vshl_u16((uint16x4_t)v81.val[0], v35);
          *(int16x4x2_t *)&a4[v31] = v75;
          v75.val[0] = (int16x4_t)vshl_u16((uint16x4_t)v79.val[1], *(uint16x4_t *)&v36);
          v39 = vshl_u16((uint16x4_t)v81.val[1], *(uint16x4_t *)&v36);
          *(int16x4x2_t *)&a5[v31] = v75;
          v22 = v23 > v32++;
          v31 += 8;
          v30 += 16;
        }
        while (v22);
        v40 = &result[v30];
        v41 = &v12[v30];
        if (!v13)
          goto LABEL_49;
        a2[v31] = *v40 << a9;
        a3[v31] = v40[1] << a9;
        a4[v31] = *v41 << a9;
        a5[v31] = v41[1] << a9;
        if (v13 <= 4)
        {
          v40 += 2;
          v41 += 2;
          if (a10)
            goto LABEL_50;
          goto LABEL_25;
        }
        a2[v31 + 1] = v40[2] << a9;
        v42 = &result[v30];
        a3[v31 + 1] = result[v30 + 3] << a9;
        a4[v31 + 1] = v41[2] << a9;
        v43 = &v12[v30];
        a5[v31 + 1] = v12[v30 + 3] << a9;
        if (v13 < 9)
        {
          v40 = v42 + 4;
          v41 = v43 + 4;
          if (a10)
            goto LABEL_50;
          goto LABEL_25;
        }
        a2[v31 + 2] = v42[4] << a9;
        a3[v31 + 2] = v42[5] << a9;
        a4[v31 + 2] = v43[4] << a9;
        a5[v31 + 2] = v43[5] << a9;
        if (v13 < 0xD)
        {
          v40 = v42 + 6;
          v41 = v43 + 6;
          if (a10)
            goto LABEL_50;
          goto LABEL_25;
        }
        a2[v31 + 3] = v42[6] << a9;
        v44 = &result[v30];
        a3[v31 + 3] = result[v30 + 7] << a9;
        a4[v31 + 3] = v43[6] << a9;
        v45 = &v12[v30];
        a5[v31 + 3] = v12[v30 + 7] << a9;
        if (v13 < 0x11)
        {
          v40 = v44 + 8;
          v41 = v45 + 8;
          if (a10)
            goto LABEL_50;
          goto LABEL_25;
        }
        a2[v31 + 4] = v44[8] << a9;
        a3[v31 + 4] = v44[9] << a9;
        a4[v31 + 4] = v45[8] << a9;
        a5[v31 + 4] = v45[9] << a9;
        if (v13 < 0x15)
        {
          v40 = v44 + 10;
          v41 = v45 + 10;
          if (a10)
            goto LABEL_50;
          goto LABEL_25;
        }
        a2[v31 + 5] = v44[10] << a9;
        v46 = &result[v30];
        a3[v31 + 5] = result[v30 + 11] << a9;
        a4[v31 + 5] = v45[10] << a9;
        v47 = &v12[v30];
        a5[v31 + 5] = v12[v30 + 11] << a9;
        if (v13 < 0x19)
          break;
        a2[v31 + 6] = v46[12] << a9;
        a3[v31 + 6] = v46[13] << a9;
        a4[v31 + 6] = v47[12] << a9;
        a5[v31 + 6] = v47[13] << a9;
        if (v13 < 0x1D)
        {
          v40 = v46 + 14;
          v41 = v47 + 14;
          if (!a10)
            goto LABEL_25;
LABEL_50:
          a2 = (unsigned __int16 *)((char *)a2 + v29);
          a3 = (unsigned __int16 *)((char *)a3 + v29);
          a4 = (unsigned __int16 *)((char *)a4 + v29);
          a5 = (unsigned __int16 *)((char *)a5 + v29);
          goto LABEL_25;
        }
        a2[v31 + 7] = v46[14] << a9;
        v48 = &result[v30];
        a3[v31 + 7] = v48[15] << a9;
        v40 = v48 + 16;
        a4[v31 + 7] = v47[14] << a9;
        v49 = &v12[v30];
        a5[v31 + 7] = v49[15] << a9;
        v41 = v49 + 16;
        if (a10)
          goto LABEL_50;
LABEL_25:
        result = &v40[v28];
        v12 = &v41[v28];
        v25 = (v25 + 1);
        if (v14 <= v25)
          return result;
      }
      v40 = v46 + 12;
      v41 = v47 + 12;
LABEL_49:
      if (a10)
        goto LABEL_50;
      goto LABEL_25;
    }
    v50 = 8 * v10;
    v51 = 16 * v24;
    while (1)
    {
      v52 = 0;
      v53 = 0;
      v54 = 1;
      do
      {
        v55 = (const __int16 *)&result[v52];
        v74 = vld2_s16(v55);
        v55 += 8;
        v76 = vld2_s16(v55);
        v56 = (const __int16 *)&v12[v52];
        v78 = vld2_s16(v56);
        v56 += 8;
        v80 = vld2_s16(v56);
        v57 = v76.val[0];
        *(int16x4x2_t *)&a2[v53] = v74;
        v58 = v76.val[1];
        *(int16x4x2_t *)&a3[v53] = *(int16x4x2_t *)((char *)&v74 + 8);
        v59 = v80.val[0];
        *(int16x4x2_t *)&a4[v53] = v78;
        v60 = v80.val[1];
        *(int16x4x2_t *)&a5[v53] = *(int16x4x2_t *)((char *)&v78 + 8);
        v22 = v23 > v54++;
        v53 += 8;
        v52 += 16;
      }
      while (v22);
      v61 = &result[v52];
      v62 = &v12[v52];
      if (!v13)
        goto LABEL_78;
      a2[v53] = *v61;
      a3[v53] = v61[1];
      a4[v53] = *v62;
      a5[v53] = v62[1];
      if (v13 <= 4)
      {
        v61 += 2;
        v62 += 2;
        if (a10)
          goto LABEL_79;
        goto LABEL_54;
      }
      a2[v53 + 1] = v61[2];
      v63 = &result[v52];
      a3[v53 + 1] = result[v52 + 3];
      a4[v53 + 1] = v62[2];
      v64 = &v12[v52];
      a5[v53 + 1] = v12[v52 + 3];
      if (v13 < 9)
      {
        v61 = v63 + 4;
        v62 = v64 + 4;
        if (a10)
          goto LABEL_79;
        goto LABEL_54;
      }
      a2[v53 + 2] = v63[4];
      a3[v53 + 2] = v63[5];
      a4[v53 + 2] = v64[4];
      a5[v53 + 2] = v64[5];
      if (v13 < 0xD)
      {
        v61 = v63 + 6;
        v62 = v64 + 6;
        if (a10)
          goto LABEL_79;
        goto LABEL_54;
      }
      a2[v53 + 3] = v63[6];
      v65 = &result[v52];
      a3[v53 + 3] = result[v52 + 7];
      a4[v53 + 3] = v64[6];
      v66 = &v12[v52];
      a5[v53 + 3] = v12[v52 + 7];
      if (v13 < 0x11)
      {
        v61 = v65 + 8;
        v62 = v66 + 8;
        if (a10)
          goto LABEL_79;
        goto LABEL_54;
      }
      a2[v53 + 4] = v65[8];
      a3[v53 + 4] = v65[9];
      a4[v53 + 4] = v66[8];
      a5[v53 + 4] = v66[9];
      if (v13 < 0x15)
      {
        v61 = v65 + 10;
        v62 = v66 + 10;
        if (a10)
          goto LABEL_79;
        goto LABEL_54;
      }
      a2[v53 + 5] = v65[10];
      v67 = &result[v52];
      a3[v53 + 5] = result[v52 + 11];
      a4[v53 + 5] = v66[10];
      v68 = &v12[v52];
      a5[v53 + 5] = v12[v52 + 11];
      if (v13 < 0x19)
        break;
      a2[v53 + 6] = v67[12];
      a3[v53 + 6] = v67[13];
      a4[v53 + 6] = v68[12];
      a5[v53 + 6] = v68[13];
      if (v13 < 0x1D)
      {
        v61 = v67 + 14;
        v62 = v68 + 14;
        if (!a10)
          goto LABEL_54;
LABEL_79:
        a2 = (unsigned __int16 *)((char *)a2 + v51);
        a3 = (unsigned __int16 *)((char *)a3 + v51);
        a4 = (unsigned __int16 *)((char *)a4 + v51);
        a5 = (unsigned __int16 *)((char *)a5 + v51);
        goto LABEL_54;
      }
      a2[v53 + 7] = v67[14];
      a3[v53 + 7] = result[v52 + 15];
      v61 = &result[v52 + 16];
      a4[v53 + 7] = v68[14];
      v69 = &v12[v52];
      a5[v53 + 7] = v69[15];
      v62 = v69 + 16;
      if (a10)
        goto LABEL_79;
LABEL_54:
      result = &v61[v50];
      v12 = &v62[v50];
      v11 = (v11 + 1);
      if (v14 <= v11)
        return result;
    }
    v61 = v67 + 12;
    v62 = v68 + 12;
LABEL_78:
    if (a10)
      goto LABEL_79;
    goto LABEL_54;
  }
  if ((a7 & 0x1F) != 0)
  {
    if (a10)
    {
      v15 = 0;
      v16 = a2 + 7;
      v17 = a3 + 7;
      v18 = a4 + 7;
      v19 = 1;
      do
      {
        *(unsigned __int16 *)((char *)v16 + v15 - 14) = *result << a9;
        *(unsigned __int16 *)((char *)a3 + v15) = result[1] << a9;
        *(unsigned __int16 *)((char *)a4 + v15) = *v12 << a9;
        *(unsigned __int16 *)((char *)a5 + v15) = v12[1] << a9;
        if (v13 < 5)
        {
          v20 = result + 2;
          v21 = v12 + 2;
        }
        else
        {
          *(unsigned __int16 *)((char *)v16 + v15 - 12) = result[2] << a9;
          *(unsigned __int16 *)((char *)v17 + v15 - 12) = result[3] << a9;
          *(unsigned __int16 *)((char *)v18 + v15 - 12) = v12[2] << a9;
          *(unsigned __int16 *)((char *)a5 + v15 + 2) = v12[3] << a9;
          if (v13 < 9)
          {
            v20 = result + 4;
            v21 = v12 + 4;
          }
          else
          {
            *(unsigned __int16 *)((char *)v16 + v15 - 10) = result[4] << a9;
            *(unsigned __int16 *)((char *)v17 + v15 - 10) = result[5] << a9;
            *(unsigned __int16 *)((char *)v18 + v15 - 10) = v12[4] << a9;
            *(unsigned __int16 *)((char *)a5 + v15 + 4) = v12[5] << a9;
            if (v13 < 0xD)
            {
              v20 = result + 6;
              v21 = v12 + 6;
            }
            else
            {
              *(unsigned __int16 *)((char *)v16 + v15 - 8) = result[6] << a9;
              *(unsigned __int16 *)((char *)v17 + v15 - 8) = result[7] << a9;
              *(unsigned __int16 *)((char *)v18 + v15 - 8) = v12[6] << a9;
              *(unsigned __int16 *)((char *)a5 + v15 + 6) = v12[7] << a9;
              if (v13 < 0x11)
              {
                v20 = result + 8;
                v21 = v12 + 8;
              }
              else
              {
                *(unsigned __int16 *)((char *)v16 + v15 - 6) = result[8] << a9;
                *(unsigned __int16 *)((char *)v17 + v15 - 6) = result[9] << a9;
                *(unsigned __int16 *)((char *)v18 + v15 - 6) = v12[8] << a9;
                *(unsigned __int16 *)((char *)a5 + v15 + 8) = v12[9] << a9;
                if (v13 < 0x15)
                {
                  v20 = result + 10;
                  v21 = v12 + 10;
                }
                else
                {
                  *(unsigned __int16 *)((char *)v16 + v15 - 4) = result[10] << a9;
                  *(unsigned __int16 *)((char *)v17 + v15 - 4) = result[11] << a9;
                  *(unsigned __int16 *)((char *)v18 + v15 - 4) = v12[10] << a9;
                  *(unsigned __int16 *)((char *)a5 + v15 + 10) = v12[11] << a9;
                  if (v13 < 0x19)
                  {
                    v20 = result + 12;
                    v21 = v12 + 12;
                  }
                  else
                  {
                    *(unsigned __int16 *)((char *)v16 + v15 - 2) = result[12] << a9;
                    *(unsigned __int16 *)((char *)v17 + v15 - 2) = result[13] << a9;
                    *(unsigned __int16 *)((char *)v18 + v15 - 2) = v12[12] << a9;
                    *(unsigned __int16 *)((char *)a5 + v15 + 12) = v12[13] << a9;
                    if (v13 < 0x1D)
                    {
                      v20 = result + 14;
                      v21 = v12 + 14;
                    }
                    else
                    {
                      *(unsigned __int16 *)((char *)v16 + v15) = result[14] << a9;
                      *(unsigned __int16 *)((char *)v17 + v15) = result[15] << a9;
                      v20 = result + 16;
                      *(unsigned __int16 *)((char *)v18 + v15) = v12[14] << a9;
                      *(unsigned __int16 *)((char *)a5 + v15 + 14) = v12[15] << a9;
                      v21 = v12 + 16;
                    }
                  }
                }
              }
            }
          }
        }
        result = &v20[8 * v10];
        v12 = &v21[8 * v10];
        v22 = v14 > v19++;
        v15 += a8 & 0xFFFFFFFFFFFFFFE0;
      }
      while (v22);
    }
    else
    {
      v70 = 1;
      v71 = 8 * v10;
      do
      {
        *a2 = *result << a9;
        *a3 = result[1] << a9;
        *a4 = *v12 << a9;
        *a5 = v12[1] << a9;
        if (v13 < 5)
        {
          v72 = result + 2;
          v73 = v12 + 2;
        }
        else
        {
          a2[1] = result[2] << a9;
          a3[1] = result[3] << a9;
          a4[1] = v12[2] << a9;
          a5[1] = v12[3] << a9;
          if (v13 < 9)
          {
            v72 = result + 4;
            v73 = v12 + 4;
          }
          else
          {
            a2[2] = result[4] << a9;
            a3[2] = result[5] << a9;
            a4[2] = v12[4] << a9;
            a5[2] = v12[5] << a9;
            if (v13 < 0xD)
            {
              v72 = result + 6;
              v73 = v12 + 6;
            }
            else
            {
              a2[3] = result[6] << a9;
              a3[3] = result[7] << a9;
              a4[3] = v12[6] << a9;
              a5[3] = v12[7] << a9;
              if (v13 < 0x11)
              {
                v72 = result + 8;
                v73 = v12 + 8;
              }
              else
              {
                a2[4] = result[8] << a9;
                a3[4] = result[9] << a9;
                a4[4] = v12[8] << a9;
                a5[4] = v12[9] << a9;
                if (v13 < 0x15)
                {
                  v72 = result + 10;
                  v73 = v12 + 10;
                }
                else
                {
                  a2[5] = result[10] << a9;
                  a3[5] = result[11] << a9;
                  a4[5] = v12[10] << a9;
                  a5[5] = v12[11] << a9;
                  if (v13 < 0x19)
                  {
                    v72 = result + 12;
                    v73 = v12 + 12;
                  }
                  else
                  {
                    a2[6] = result[12] << a9;
                    a3[6] = result[13] << a9;
                    a4[6] = v12[12] << a9;
                    a5[6] = v12[13] << a9;
                    if (v13 < 0x1D)
                    {
                      v72 = result + 14;
                      v73 = v12 + 14;
                    }
                    else
                    {
                      a2[7] = result[14] << a9;
                      a3[7] = result[15] << a9;
                      v72 = result + 16;
                      a4[7] = v12[14] << a9;
                      a5[7] = v12[15] << a9;
                      v73 = v12 + 16;
                    }
                  }
                }
              }
            }
          }
        }
        result = &v72[v71];
        v12 = &v73[v71];
        v22 = v14 > v70++;
      }
      while (v22);
    }
  }
  return result;
}

unsigned __int16 *join_bayer_buffer(unsigned __int16 *result, const unsigned __int16 *a2, const unsigned __int16 *a3, const unsigned __int16 *a4, unsigned __int16 *a5, unint64_t a6, unint64_t a7, unint64_t a8, unint64_t a9, unsigned int a10, BOOL a11, BOOL a12)
{
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unsigned __int16 *v19;
  uint64_t v20;
  uint16x8_t v21;
  unsigned __int16 *v22;
  unsigned __int16 *v23;
  unsigned __int16 *v24;
  const unsigned __int16 *v25;
  const unsigned __int16 *v26;
  const unsigned __int16 *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  int16x8_t *v31;
  int16x8_t *v32;
  BOOL v33;
  int16x8_t v34;
  int16x8_t v35;
  int16x8_t v36;
  int16x8_t v37;
  int v38;
  uint64_t v39;

  if (a7 <= a6)
  {
    LODWORD(v12) = 0;
    v13 = a7 - a9;
    v14 = (a7 - a9) >> 4;
    v15 = (a7 - a9) & 0xF;
    v16 = a7 >> 1;
    v17 = a8 >> 1;
    v18 = a6 / a7;
    v19 = &a5[v17];
    v20 = 4 * v17;
    v21 = (uint16x8_t)vnegq_s16(vdupq_n_s16(a10));
    do
    {
      v22 = a5;
      v23 = v19;
      v24 = result;
      v25 = a2;
      v26 = a3;
      v27 = a4;
      if (v13 >= 0x10)
      {
        v28 = 0;
        v29 = 0;
        v30 = 1;
        do
        {
          v34 = *(int16x8_t *)&result[v29];
          v35 = *(int16x8_t *)&a2[v29];
          v36 = *(int16x8_t *)&a3[v29];
          v37 = *(int16x8_t *)&a4[v29];
          if (a10)
          {
            v34 = (int16x8_t)vshlq_u16((uint16x8_t)v34, v21);
            v35 = (int16x8_t)vshlq_u16((uint16x8_t)v35, v21);
            v36 = (int16x8_t)vshlq_u16((uint16x8_t)v36, v21);
            v37 = (int16x8_t)vshlq_u16((uint16x8_t)v37, v21);
          }
          if (a12)
          {
            v34 = (int16x8_t)vorrq_s8((int8x16_t)vshrq_n_u16((uint16x8_t)v34, 0xAuLL), (int8x16_t)v34);
            v35 = (int16x8_t)vorrq_s8((int8x16_t)vshrq_n_u16((uint16x8_t)v35, 0xAuLL), (int8x16_t)v35);
            v36 = (int16x8_t)vorrq_s8((int8x16_t)vshrq_n_u16((uint16x8_t)v36, 0xAuLL), (int8x16_t)v36);
            v37 = (int16x8_t)vorrq_s8((int8x16_t)vshrq_n_u16((uint16x8_t)v37, 0xAuLL), (int8x16_t)v37);
          }
          v31 = (int16x8_t *)&v19[v28];
          v32 = (int16x8_t *)&a5[v28];
          *v32 = vzip1q_s16(v34, v35);
          v32[1] = vzip1q_s16((int16x8_t)vextq_s8((int8x16_t)v34, (int8x16_t)v34, 8uLL), (int16x8_t)vextq_s8((int8x16_t)v35, (int8x16_t)v35, 8uLL));
          *v31 = vzip1q_s16(v36, v37);
          v31[1] = vzip1q_s16((int16x8_t)vextq_s8((int8x16_t)v36, (int8x16_t)v36, 8uLL), (int16x8_t)vextq_s8((int8x16_t)v37, (int8x16_t)v37, 8uLL));
          v33 = v14 > v30++;
          v29 += 8;
          v28 += 16;
        }
        while (v33);
        v27 = &a4[v29];
        v26 = &a3[v29];
        v25 = &a2[v29];
        v24 = &result[v29];
        v23 = &v19[v28];
        v22 = &a5[v28];
      }
      if (!v15)
        goto LABEL_31;
      *v22 = *v24 >> a10;
      v22[1] = *v25 >> a10;
      *v23 = *v26 >> a10;
      v23[1] = *v27 >> a10;
      if (a12)
      {
        *v22 |= *v22 >> 10;
        v22[1] |= v22[1] >> 10;
        *v23 |= *v23 >> 10;
        v23[1] |= v23[1] >> 10;
        if (v15 >= 3)
        {
          v22[2] = v24[1] >> a10;
          v22[3] = v25[1] >> a10;
          v23[2] = v26[1] >> a10;
          v23[3] = v27[1] >> a10;
          v22[2] |= v22[2] >> 10;
          v22[3] |= v22[3] >> 10;
          v23[2] |= v23[2] >> 10;
          v23[3] |= v23[3] >> 10;
          if (v15 >= 5)
          {
            v22[4] = v24[2] >> a10;
            v22[5] = v25[2] >> a10;
            v23[4] = v26[2] >> a10;
            v23[5] = v27[2] >> a10;
            v22[4] |= v22[4] >> 10;
            v22[5] |= v22[5] >> 10;
            v23[4] |= v23[4] >> 10;
            v23[5] |= v23[5] >> 10;
            if (v15 >= 7)
            {
              v22[6] = v24[3] >> a10;
              v22[7] = v25[3] >> a10;
              v23[6] = v26[3] >> a10;
              v23[7] = v27[3] >> a10;
              v22[6] |= v22[6] >> 10;
              v22[7] |= v22[7] >> 10;
              v23[6] |= v23[6] >> 10;
              v23[7] |= v23[7] >> 10;
              if (v15 >= 9)
              {
                v22[8] = v24[4] >> a10;
                v22[9] = v25[4] >> a10;
                v23[8] = v26[4] >> a10;
                v23[9] = v27[4] >> a10;
                v22[8] |= v22[8] >> 10;
                v22[9] |= v22[9] >> 10;
                v23[8] |= v23[8] >> 10;
                v23[9] |= v23[9] >> 10;
                if (v15 >= 0xB)
                {
                  v22[10] = v24[5] >> a10;
                  v22[11] = v25[5] >> a10;
                  v23[10] = v26[5] >> a10;
                  v23[11] = v27[5] >> a10;
                  v22[10] |= v22[10] >> 10;
                  v22[11] |= v22[11] >> 10;
                  v23[10] |= v23[10] >> 10;
                  v23[11] |= v23[11] >> 10;
                  if (v15 >= 0xD)
                  {
                    v22[12] = v24[6] >> a10;
                    v22[13] = v25[6] >> a10;
                    v23[12] = v26[6] >> a10;
                    v23[13] = v27[6] >> a10;
                    v22[12] |= v22[12] >> 10;
                    v22[13] |= v22[13] >> 10;
                    v23[12] |= v23[12] >> 10;
                    v23[13] |= v23[13] >> 10;
                    if (v15 == 15)
                    {
                      v22[14] = v24[7] >> a10;
                      v22[15] = v25[7] >> a10;
                      v23[14] = v26[7] >> a10;
                      v23[15] = v27[7] >> a10;
                      v22[14] |= v22[14] >> 10;
                      v22[15] |= v22[15] >> 10;
                      v23[14] |= v23[14] >> 10;
                      v38 = v23[15] | (v23[15] >> 10);
LABEL_30:
                      v23[15] = v38;
                    }
                  }
                }
              }
            }
          }
        }
      }
      else if (v15 >= 3)
      {
        v22[2] = v24[1] >> a10;
        v22[3] = v25[1] >> a10;
        v23[2] = v26[1] >> a10;
        v23[3] = v27[1] >> a10;
        if (v15 >= 5)
        {
          v22[4] = v24[2] >> a10;
          v22[5] = v25[2] >> a10;
          v23[4] = v26[2] >> a10;
          v23[5] = v27[2] >> a10;
          if (v15 >= 7)
          {
            v22[6] = v24[3] >> a10;
            v22[7] = v25[3] >> a10;
            v23[6] = v26[3] >> a10;
            v23[7] = v27[3] >> a10;
            if (v15 >= 9)
            {
              v22[8] = v24[4] >> a10;
              v22[9] = v25[4] >> a10;
              v23[8] = v26[4] >> a10;
              v23[9] = v27[4] >> a10;
              if (v15 >= 0xB)
              {
                v22[10] = v24[5] >> a10;
                v22[11] = v25[5] >> a10;
                v23[10] = v26[5] >> a10;
                v23[11] = v27[5] >> a10;
                if (v15 >= 0xD)
                {
                  v22[12] = v24[6] >> a10;
                  v22[13] = v25[6] >> a10;
                  v23[12] = v26[6] >> a10;
                  v23[13] = v27[6] >> a10;
                  if (v15 == 15)
                  {
                    v22[14] = v24[7] >> a10;
                    v22[15] = v25[7] >> a10;
                    v23[14] = v26[7] >> a10;
                    v38 = v27[7] >> a10;
                    goto LABEL_30;
                  }
                }
              }
            }
          }
        }
      }
LABEL_31:
      v39 = 2 * v16;
      result += v16;
      a2 += v16;
      a3 += v16;
      a4 += v16;
      if (a11)
      {
        result = (unsigned __int16 *)((char *)result + v39);
        a2 = (const unsigned __int16 *)((char *)a2 + v39);
        a3 = (const unsigned __int16 *)((char *)a3 + v39);
        a4 = (const unsigned __int16 *)((char *)a4 + v39);
      }
      a5 = (unsigned __int16 *)((char *)a5 + v20);
      v19 = (unsigned __int16 *)((char *)v19 + v20);
      v12 = (v12 + 1);
    }
    while (v18 > v12);
  }
  return result;
}

unsigned __int8 *split_companded_bayer_buffer(unsigned __int8 *result, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 *a4, unsigned __int8 *a5, unint64_t a6, unint64_t a7, unint64_t a8, unint64_t a9, unint64_t a10)
{
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  uint64_t v16;
  unsigned __int8 *v17;
  unsigned __int8 *v18;
  unsigned int v19;
  unsigned __int8 *v20;
  unsigned __int8 *v21;
  unsigned __int8 *v22;
  BOOL v23;
  unsigned __int8 *v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unsigned __int8 *v29;
  _BYTE *v30;
  _BYTE *v31;
  uint64_t v32;
  unsigned __int8 *v33;
  unsigned int v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  int8x8_t v38;
  int8x8_t v39;
  int8x8_t v40;
  int8x8_t v41;
  unsigned __int8 *v42;
  unsigned __int8 *v43;
  unsigned __int8 *v44;
  unsigned __int8 *v45;
  unsigned __int8 *v46;
  unsigned __int8 *v47;
  unsigned __int8 *v48;
  unsigned __int8 *v49;
  unsigned __int8 *v50;
  unsigned __int8 *v51;
  uint64_t v52;
  uint64_t v53;
  unsigned __int8 *v54;
  uint64_t v55;
  const char *v56;
  const char *v57;
  int8x8_t v58;
  uint64_t v59;
  int8x8_t v60;
  int8x8_t v61;
  int8x8_t v62;
  int8x8x2_t v63;
  int8x8x2_t v64;
  int8x8x2_t v65;
  int8x8x2_t v66;
  int8x8x2_t v67;
  int8x8x2_t v68;
  int8x8x2_t v69;
  int8x8x2_t v70;

  if (a6 / a7 >= 2)
  {
    v10 = a9 & 0x1F;
    v11 = (a6 / a7) >> 1;
    v12 = a7 - a9;
    v13 = a8 >> 4;
    if (a9 >= 0x20)
    {
      v25 = a9 >> 5;
      if ((a9 & 0x1F) != 0)
      {
        v26 = 0;
        LODWORD(v27) = 0;
        v28 = 16 * v13;
        v29 = result;
        do
        {
          v32 = 0;
          v33 = &v29[a7];
          v34 = 1;
          v35 = v26;
          do
          {
            v36 = (const char *)&result[v32];
            v63 = vld2_s8(v36);
            v36 += 16;
            v65 = vld2_s8(v36);
            v37 = (const char *)&v33[v32];
            v67 = vld2_s8(v37);
            v37 += 16;
            v69 = vld2_s8(v37);
            v38 = v65.val[0];
            *(int8x8x2_t *)&a2[v35] = v63;
            v39 = v65.val[1];
            *(int8x8x2_t *)&a3[v35] = *(int8x8x2_t *)((char *)&v63 + 8);
            v40 = v69.val[0];
            *(int8x8x2_t *)&a4[v35] = v67;
            v41 = v69.val[1];
            *(int8x8x2_t *)&a5[v35] = *(int8x8x2_t *)((char *)&v67 + 8);
            v32 += 32;
            v35 += 16;
            v23 = v25 > v34++;
          }
          while (v23);
          v42 = &result[v32];
          a2[v35] = result[v32];
          a3[v35] = result[v32 + 1];
          v43 = &v33[v32];
          a4[v35] = v33[v32];
          a5[v35] = v33[v32 + 1];
          if (v10 <= 4)
          {
            v30 = v42 + 2;
            v31 = v43 + 2;
          }
          else
          {
            a2[v35 + 1] = v42[2];
            a3[v35 + 1] = v42[3];
            a4[v35 + 1] = v43[2];
            a5[v35 + 1] = v43[3];
            if (v10 < 9)
            {
              v30 = v42 + 4;
              v31 = v43 + 4;
            }
            else
            {
              a2[v35 + 2] = v42[4];
              v44 = &result[v32];
              a3[v35 + 2] = result[v32 + 5];
              a4[v35 + 2] = v43[4];
              v45 = &v33[v32];
              a5[v35 + 2] = v33[v32 + 5];
              if (v10 < 0xD)
              {
                v30 = v44 + 6;
                v31 = v45 + 6;
              }
              else
              {
                a2[v35 + 3] = v44[6];
                a3[v35 + 3] = v44[7];
                a4[v35 + 3] = v45[6];
                a5[v35 + 3] = v45[7];
                if (v10 < 0x11)
                {
                  v30 = v44 + 8;
                  v31 = v45 + 8;
                }
                else
                {
                  a2[v35 + 4] = v44[8];
                  v46 = &result[v32];
                  a3[v35 + 4] = result[v32 + 9];
                  a4[v35 + 4] = v45[8];
                  v47 = &v33[v32];
                  a5[v35 + 4] = v33[v32 + 9];
                  if (v10 < 0x15)
                  {
                    v30 = v46 + 10;
                    v31 = v47 + 10;
                  }
                  else
                  {
                    a2[v35 + 5] = v46[10];
                    a3[v35 + 5] = v46[11];
                    a4[v35 + 5] = v47[10];
                    a5[v35 + 5] = v47[11];
                    if (v10 < 0x19)
                    {
                      v30 = v46 + 12;
                      v31 = v47 + 12;
                    }
                    else
                    {
                      a2[v35 + 6] = v46[12];
                      v48 = &result[v32];
                      a3[v35 + 6] = v48[13];
                      a4[v35 + 6] = v47[12];
                      v49 = &v33[v32];
                      a5[v35 + 6] = v49[13];
                      if (v10 < 0x1D)
                      {
                        v30 = v48 + 14;
                        v31 = v49 + 14;
                      }
                      else
                      {
                        v50 = &a5[v35];
                        v51 = &a4[v35];
                        a2[v35 + 7] = v48[14];
                        a3[v35 + 7] = v48[15];
                        v30 = v48 + 16;
                        v51[7] = v49[14];
                        v50[7] = v49[15];
                        v31 = v49 + 16;
                      }
                    }
                  }
                }
              }
            }
          }
          v29 = &v31[v12];
          result = &v30[v12 + a7];
          v27 = (v27 + 1);
          v26 += v28;
        }
        while (v11 > v27);
      }
      else
      {
        v52 = 2 * a7 - a9;
        v53 = 16 * v13;
        v54 = result;
        do
        {
          v55 = 0;
          do
          {
            v56 = (const char *)result;
            v64 = vld2_s8(v56);
            v56 += 16;
            v66 = vld2_s8(v56);
            v57 = (const char *)&v54[a7];
            v68 = vld2_s8(v57);
            v57 += 16;
            v70 = vld2_s8(v57);
            v58 = v66.val[0];
            v59 = 16 * v55;
            *(int8x8x2_t *)&a2[v59] = v64;
            v60 = v66.val[1];
            *(int8x8x2_t *)&a3[v59] = *(int8x8x2_t *)((char *)&v64 + 8);
            v61 = v70.val[0];
            *(int8x8x2_t *)&a4[v59] = v68;
            v62 = v70.val[1];
            result += 32;
            ++v55;
            v54 += 32;
            *(int8x8x2_t *)&a5[v59] = *(int8x8x2_t *)((char *)&v68 + 8);
          }
          while (v25 > v55);
          v54 += v52;
          result += v52;
          v10 = (v10 + 1);
          a5 += v53;
          a4 += v53;
          a3 += v53;
          a2 += v53;
        }
        while (v11 > v10);
      }
    }
    else if ((a9 & 0x1F) != 0)
    {
      v14 = 0;
      v15 = a3 + 7;
      v16 = 16 * v13;
      v17 = a4 + 7;
      v18 = a5 + 7;
      v19 = 1;
      v20 = result;
      do
      {
        v24 = &v20[a7];
        a2[v14] = *result;
        a3[v14] = result[1];
        a4[v14] = *v24;
        a5[v14] = v24[1];
        if (v10 < 5)
        {
          v21 = result + 2;
          v22 = v24 + 2;
        }
        else
        {
          a2[v14 + 1] = result[2];
          v15[v14 - 6] = result[3];
          v17[v14 - 6] = v24[2];
          v18[v14 - 6] = v24[3];
          if (v10 < 9)
          {
            v21 = result + 4;
            v22 = v24 + 4;
          }
          else
          {
            a2[v14 + 2] = result[4];
            v15[v14 - 5] = result[5];
            v17[v14 - 5] = v24[4];
            v18[v14 - 5] = v24[5];
            if (v10 < 0xD)
            {
              v21 = result + 6;
              v22 = v24 + 6;
            }
            else
            {
              a2[v14 + 3] = result[6];
              v15[v14 - 4] = result[7];
              v17[v14 - 4] = v24[6];
              v18[v14 - 4] = v24[7];
              if (v10 < 0x11)
              {
                v21 = result + 8;
                v22 = v24 + 8;
              }
              else
              {
                a2[v14 + 4] = result[8];
                v15[v14 - 3] = result[9];
                v17[v14 - 3] = v24[8];
                v18[v14 - 3] = v24[9];
                if (v10 < 0x15)
                {
                  v21 = result + 10;
                  v22 = v24 + 10;
                }
                else
                {
                  a2[v14 + 5] = result[10];
                  v15[v14 - 2] = result[11];
                  v17[v14 - 2] = v24[10];
                  v18[v14 - 2] = v24[11];
                  if (v10 < 0x19)
                  {
                    v21 = result + 12;
                    v22 = v24 + 12;
                  }
                  else
                  {
                    a2[v14 + 6] = result[12];
                    v15[v14 - 1] = result[13];
                    v17[v14 - 1] = v24[12];
                    v18[v14 - 1] = v24[13];
                    if (v10 < 0x1D)
                    {
                      v21 = result + 14;
                      v22 = v24 + 14;
                    }
                    else
                    {
                      a2[v14 + 7] = result[14];
                      v15[v14] = result[15];
                      v21 = result + 16;
                      v17[v14] = v24[14];
                      v18[v14] = v24[15];
                      v22 = v24 + 16;
                    }
                  }
                }
              }
            }
          }
        }
        v20 = &v22[v12];
        result = &v21[v12 + a7];
        v14 += v16;
        v23 = v11 > v19++;
      }
      while (v23);
    }
  }
  return result;
}

uint64_t join_companded_bayer_buffer(uint64_t result, const unsigned __int8 *a2, const unsigned __int8 *a3, const unsigned __int8 *a4, int8x16_t *a5, unint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9, BOOL a10)
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 *v13;
  unsigned int v14;
  uint64_t v15;
  unint64_t v16;
  unsigned __int8 *v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  unint64_t v21;
  uint64_t v22;
  unsigned int v23;
  int8x16_t *v24;
  int8x16_t v25;
  int8x16_t v26;
  int8x16_t v27;
  int8x16_t v28;
  int8x16_t *v29;
  BOOL v30;
  __int8 *v31;
  __int8 *v32;
  __int8 *v33;
  __int8 *v34;
  unsigned __int8 *v35;
  unsigned int v36;
  uint64_t v37;
  unint64_t v38;
  unsigned __int8 *v39;
  unsigned __int8 *v40;
  unsigned __int8 *v41;
  unsigned __int8 *v42;

  if (a6)
  {
    v10 = a7 & 0xF;
    v11 = a9 + a7;
    v12 = 2 * a8;
    if (a7 >= 0x10)
    {
      LODWORD(v21) = 0;
      do
      {
        v22 = 0;
        v23 = 1;
        v24 = a5;
        do
        {
          v25 = *(int8x16_t *)(result + v22);
          v26 = *(int8x16_t *)&a2[v22];
          v27 = *(int8x16_t *)&a3[v22];
          v28 = *(int8x16_t *)&a4[v22];
          v29 = (int8x16_t *)((char *)v24 + a8);
          *v24 = vzip1q_s8(v25, v26);
          v24[1] = vzip1q_s8(vextq_s8(v25, v25, 8uLL), vextq_s8(v26, v26, 8uLL));
          v24 += 2;
          *v29 = vzip1q_s8(v27, v28);
          v29[1] = vzip1q_s8(vextq_s8(v27, v27, 8uLL), vextq_s8(v28, v28, 8uLL));
          v30 = a7 >> 4 > v23++;
          v22 += 16;
        }
        while (v30);
        if ((a7 & 0xF) != 0)
        {
          v24->i8[0] = *(_BYTE *)(result + v22);
          v24->i8[1] = a2[v22];
          v31 = &v24->i8[a8];
          *v31 = a3[v22];
          v31[1] = a4[v22];
          if (v10 > 2)
          {
            v24->i8[2] = *(_BYTE *)(result + v22 + 1);
            v24->i8[3] = a2[v22 + 1];
            v31[2] = a3[v22 + 1];
            v31[3] = a4[v22 + 1];
            if (v10 >= 5)
            {
              v32 = &v24->i8[a8];
              v24->i8[4] = *(_BYTE *)(result + v22 + 2);
              v24->i8[5] = a2[v22 + 2];
              v32[4] = a3[v22 + 2];
              v32[5] = a4[v22 + 2];
              if (v10 >= 7)
              {
                v24->i8[6] = *(_BYTE *)(result + v22 + 3);
                v24->i8[7] = a2[v22 + 3];
                v32[6] = a3[v22 + 3];
                v32[7] = a4[v22 + 3];
                if (v10 >= 9)
                {
                  v33 = &v24->i8[a8];
                  v24->i8[8] = *(_BYTE *)(result + v22 + 4);
                  v24->i8[9] = a2[v22 + 4];
                  v33[8] = a3[v22 + 4];
                  v33[9] = a4[v22 + 4];
                  if (v10 >= 0xB)
                  {
                    v24->i8[10] = *(_BYTE *)(result + v22 + 5);
                    v24->i8[11] = a2[v22 + 5];
                    v33[10] = a3[v22 + 5];
                    v33[11] = a4[v22 + 5];
                    if (v10 >= 0xD)
                    {
                      v34 = &v24->i8[a8];
                      v24->i8[12] = *(_BYTE *)(result + v22 + 6);
                      v24->i8[13] = a2[v22 + 6];
                      v34[12] = a3[v22 + 6];
                      v34[13] = a4[v22 + 6];
                      if (v10 == 15)
                      {
                        v24->i8[14] = *(_BYTE *)(result + v22 + 7);
                        v24->i8[15] = a2[v22 + 7];
                        v34[14] = a3[v22 + 7];
                        v34[15] = a4[v22 + 7];
                      }
                    }
                  }
                }
              }
            }
          }
        }
        result += v11;
        a2 += v11;
        a3 += v11;
        a4 += v11;
        if (a10)
        {
          result += a7;
          a2 += a7;
          a3 += a7;
          a4 += a7;
        }
        a5 = (int8x16_t *)((char *)a5 + v12);
        v21 = (v21 + 1);
      }
      while (v21 < a6);
    }
    else if ((a7 & 0xF) != 0)
    {
      if (a10)
      {
        v13 = &a5->u8[7];
        v14 = 1;
        v15 = 7;
        do
        {
          v17 = &v13[a8];
          *(v13 - 7) = *(_BYTE *)(result + v15 - 7);
          *(v13 - 6) = a2[v15 - 7];
          *(v17 - 7) = a3[v15 - 7];
          *(v17 - 6) = a4[v15 - 7];
          if (v10 >= 3)
          {
            *(v13 - 5) = *(_BYTE *)(result + v15 - 6);
            *(v13 - 4) = a2[v15 - 6];
            *(v17 - 5) = a3[v15 - 6];
            *(v17 - 4) = a4[v15 - 6];
            if (v10 >= 5)
            {
              v18 = &v13[a8];
              *(v13 - 3) = *(_BYTE *)(result + v15 - 5);
              *(v13 - 2) = a2[v15 - 5];
              *(v18 - 3) = a3[v15 - 5];
              *(v18 - 2) = a4[v15 - 5];
              if (v10 >= 7)
              {
                *(v13 - 1) = *(_BYTE *)(result + v15 - 4);
                *v13 = a2[v15 - 4];
                *(v18 - 1) = a3[v15 - 4];
                *v18 = a4[v15 - 4];
                if (v10 >= 9)
                {
                  v19 = &v13[a8];
                  v13[1] = *(_BYTE *)(result + v15 - 3);
                  v13[2] = a2[v15 - 3];
                  v19[1] = a3[v15 - 3];
                  v19[2] = a4[v15 - 3];
                  if (v10 >= 0xB)
                  {
                    v13[3] = *(_BYTE *)(result + v15 - 2);
                    v13[4] = a2[v15 - 2];
                    v19[3] = a3[v15 - 2];
                    v19[4] = a4[v15 - 2];
                    if (v10 >= 0xD)
                    {
                      v20 = &v13[a8];
                      v13[5] = *(_BYTE *)(result + v15 - 1);
                      v13[6] = a2[v15 - 1];
                      v20[5] = a3[v15 - 1];
                      v20[6] = a4[v15 - 1];
                      if (v10 == 15)
                      {
                        v13[7] = *(_BYTE *)(result + v15);
                        v13[8] = a2[v15];
                        v20[7] = a3[v15];
                        v20[8] = a4[v15];
                      }
                    }
                  }
                }
              }
            }
          }
          v16 = v14++;
          v15 += a9 + 2 * a7;
          v13 += v12;
        }
        while (v16 < a6);
      }
      else
      {
        v35 = &a5->u8[7];
        v36 = 1;
        v37 = 7;
        do
        {
          v39 = &v35[a8];
          *(v35 - 7) = *(_BYTE *)(result + v37 - 7);
          *(v35 - 6) = a2[v37 - 7];
          *(v39 - 7) = a3[v37 - 7];
          *(v39 - 6) = a4[v37 - 7];
          if (v10 >= 3)
          {
            *(v35 - 5) = *(_BYTE *)(result + v37 - 6);
            *(v35 - 4) = a2[v37 - 6];
            *(v39 - 5) = a3[v37 - 6];
            *(v39 - 4) = a4[v37 - 6];
            if (v10 >= 5)
            {
              v40 = &v35[a8];
              *(v35 - 3) = *(_BYTE *)(result + v37 - 5);
              *(v35 - 2) = a2[v37 - 5];
              *(v40 - 3) = a3[v37 - 5];
              *(v40 - 2) = a4[v37 - 5];
              if (v10 >= 7)
              {
                *(v35 - 1) = *(_BYTE *)(result + v37 - 4);
                *v35 = a2[v37 - 4];
                *(v40 - 1) = a3[v37 - 4];
                *v40 = a4[v37 - 4];
                if (v10 >= 9)
                {
                  v41 = &v35[a8];
                  v35[1] = *(_BYTE *)(result + v37 - 3);
                  v35[2] = a2[v37 - 3];
                  v41[1] = a3[v37 - 3];
                  v41[2] = a4[v37 - 3];
                  if (v10 >= 0xB)
                  {
                    v35[3] = *(_BYTE *)(result + v37 - 2);
                    v35[4] = a2[v37 - 2];
                    v41[3] = a3[v37 - 2];
                    v41[4] = a4[v37 - 2];
                    if (v10 >= 0xD)
                    {
                      v42 = &v35[a8];
                      v35[5] = *(_BYTE *)(result + v37 - 1);
                      v35[6] = a2[v37 - 1];
                      v42[5] = a3[v37 - 1];
                      v42[6] = a4[v37 - 1];
                      if (v10 == 15)
                      {
                        v35[7] = *(_BYTE *)(result + v37);
                        v35[8] = a2[v37];
                        v42[7] = a3[v37];
                        v42[8] = a4[v37];
                      }
                    }
                  }
                }
              }
            }
          }
          v38 = v36++;
          v37 += v11;
          v35 += v12;
        }
        while (v38 < a6);
      }
    }
  }
  return result;
}

void sub_2106D69B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106D6A58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106D6B6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_2106D6DD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106D7158(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_2106D7214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MIOWriterStereoPixelBufferStreamInput;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_2106D728C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106D7340(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106D74D4(_Unwind_Exception *a1)
{
  id *v1;
  void *v2;
  uint64_t v3;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_2106D7EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_2106D8340(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void VTCompressionOutputCallbackImpl(void *a1, char *a2, uint64_t a3, uint64_t a4, opaqueCMSampleBuffer *a5)
{
  void *v7;
  NSObject *v9;
  __int128 v10;
  uint64_t v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)*((_QWORD *)a2 + 4);
  if (a5)
  {
    v10 = *(_OWORD *)(a2 + 8);
    v11 = *((_QWORD *)a2 + 3);
    objc_msgSend(v7, "writeSampleBuffer:pts:metadata:withStatus:andFlags:", a5, &v10, *(_QWORD *)a2, a3, a4);

    MEMORY[0x212BC98B8](a2, 0x1080C4028F97B41);
  }
  else
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v13 = a3;
      _os_log_impl(&dword_210675000, v9, OS_LOG_TYPE_ERROR, "No sample buffer received. VTCompressionSession failed with status: %d", buf, 8u);
    }

    objc_msgSend(v7, "skipFrameWithStatus:andFlags:", a3, a4);
  }

}

void sub_2106D84B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106D85C0(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = v2;
  MEMORY[0x212BC98B8](v3, 0x10A0C40F82F6DA6);

  _Unwind_Resume(a1);
}

void sub_2106D8688(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106D8730(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106D87B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MOVStreamVideoEncoderInterface;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_2106D884C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106D8B04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106D907C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106D91C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106D9284(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106D9618(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106D9748(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106D98AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2106D9968(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106D9A00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106D9A7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106D9AF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106DA094(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106DA3BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106DA59C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106DA7F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106DA85C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MIOCompandedRawBayerFrameProcessor;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_2106DA98C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106DB840(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106DB8A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MIOL016Raw14FrameProcessor;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_2106DB9AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106DBB64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2106DBD70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2106DBDF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MIOWriterPixelBufferStreamInput;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_2106DBF44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106DC05C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106DC3C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2106DC498(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106DC63C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106DC6C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2106DC9EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_2106DCB14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106DCCF8(_Unwind_Exception *a1)
{
  id *v1;
  void *v2;
  uint64_t v3;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 120));
  _Unwind_Resume(a1);
}

void sub_2106DD630(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_2106DD828(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2106DD96C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v11;

  _Unwind_Resume(a1);
}

void sub_2106DDAAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_2106DDB30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106DDB8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106DDBE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2106DE000(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x24BDBB7A8]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x24BDC00C8](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x24BDC00E0](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

OSStatus CMBlockBufferReplaceDataBytes(const void *sourceBytes, CMBlockBufferRef destinationBuffer, size_t offsetIntoDestination, size_t dataLength)
{
  return MEMORY[0x24BDC00F0](sourceBytes, destinationBuffer, offsetIntoDestination, dataLength);
}

CFDictionaryRef CMCopyDictionaryOfAttachments(CFAllocatorRef allocator, CMAttachmentBearerRef target, CMAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x24BDC0178](allocator, target, *(_QWORD *)&attachmentMode);
}

Boolean CMFormatDescriptionEqual(CMFormatDescriptionRef formatDescription, CMFormatDescriptionRef otherFormatDescription)
{
  return MEMORY[0x24BDC0198](formatDescription, otherFormatDescription);
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x24BDC01A0](desc, extensionKey);
}

CFDictionaryRef CMFormatDescriptionGetExtensions(CMFormatDescriptionRef desc)
{
  return (CFDictionaryRef)MEMORY[0x24BDC01B0](desc);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x24BDC01C8](desc);
}

CMMediaType CMFormatDescriptionGetMediaType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x24BDC01D8](desc);
}

OSStatus CMMetadataFormatDescriptionCreateWithKeys(CFAllocatorRef allocator, CMMetadataFormatType metadataType, CFArrayRef keys, CMMetadataFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x24BDC0200](allocator, *(_QWORD *)&metadataType, keys, formatDescriptionOut);
}

OSStatus CMMetadataFormatDescriptionCreateWithMetadataSpecifications(CFAllocatorRef allocator, CMMetadataFormatType metadataType, CFArrayRef metadataSpecifications, CMMetadataFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x24BDC0210](allocator, *(_QWORD *)&metadataType, metadataSpecifications, formatDescriptionOut);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC0278](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

OSStatus CMSampleBufferCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC0288](allocator, imageBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, sampleTiming, sampleBufferOut);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x24BDC02C0](sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x24BDC02D8](sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x24BDC02F0](sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x24BDC02F8](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x24BDC0318](retstr, sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x24BDC0328](sbuf, createIfNecessary);
}

size_t CMSampleBufferGetTotalSampleSize(CMSampleBufferRef sbuf)
{
  return MEMORY[0x24BDC0350](sbuf);
}

void CMSetAttachments(CMAttachmentBearerRef target, CFDictionaryRef theAttachments, CMAttachmentMode attachmentMode)
{
  MEMORY[0x24BDC0390](target, theAttachments, *(_QWORD *)&attachmentMode);
}

OSStatus CMSimpleQueueCreate(CFAllocatorRef allocator, int32_t capacity, CMSimpleQueueRef *queueOut)
{
  return MEMORY[0x24BDC0398](allocator, *(_QWORD *)&capacity, queueOut);
}

const void *__cdecl CMSimpleQueueDequeue(CMSimpleQueueRef queue)
{
  return (const void *)MEMORY[0x24BDC03A8](queue);
}

OSStatus CMSimpleQueueEnqueue(CMSimpleQueueRef queue, const void *element)
{
  return MEMORY[0x24BDC03C0](queue, element);
}

int32_t CMSimpleQueueGetCount(CMSimpleQueueRef queue)
{
  return MEMORY[0x24BDC03D0](queue);
}

CMTime *__cdecl CMTimeAbsoluteValue(CMTime *__return_ptr retstr, CMTime *time)
{
  return (CMTime *)MEMORY[0x24BDC0410](retstr, time);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x24BDC0428](retstr, lhs, rhs);
}

OSStatus CMTimeCodeFormatDescriptionCreate(CFAllocatorRef allocator, CMTimeCodeFormatType timeCodeFormatType, CMTime *frameDuration, uint32_t frameQuanta, uint32_t flags, CFDictionaryRef extensions, CMTimeCodeFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x24BDC0438](allocator, *(_QWORD *)&timeCodeFormatType, frameDuration, *(_QWORD *)&frameQuanta, *(_QWORD *)&flags, extensions, formatDescriptionOut);
}

uint32_t CMTimeCodeFormatDescriptionGetFrameQuanta(CMTimeCodeFormatDescriptionRef timeCodeFormatDescription)
{
  return MEMORY[0x24BDC0440](timeCodeFormatDescription);
}

uint32_t CMTimeCodeFormatDescriptionGetTimeCodeFlags(CMTimeCodeFormatDescriptionRef desc)
{
  return MEMORY[0x24BDC0448](desc);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x24BDC0458](time1, time2);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x24BDC0470](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x24BDC0488](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x24BDC04A0](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x24BDC04B0](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x24BDC04B8](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMapTimeFromRangeToRange(CMTime *__return_ptr retstr, CMTime *t, CMTimeRange *fromRange, CMTimeRange *toRange)
{
  return (CMTime *)MEMORY[0x24BDC04C8](retstr, t, fromRange, toRange);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x24BDC0500](range, time);
}

Boolean CMTimeRangeContainsTimeRange(CMTimeRange *range, CMTimeRange *otherRange)
{
  return MEMORY[0x24BDC0518](range, otherRange);
}

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return (CFStringRef)MEMORY[0x24BDC0528](allocator, range);
}

Boolean CMTimeRangeEqual(CMTimeRange *range1, CMTimeRange *range2)
{
  return MEMORY[0x24BDC0540](range1, range2);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x24BDC0548](retstr, start, end);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x24BDC0560](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeGetUnion(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x24BDC0578](retstr, range, otherRange);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x24BDC0588](retstr, start, duration);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x24BDC0598](retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCopyTagCollectionArray(CMVideoFormatDescriptionRef formatDescription, CFArrayRef *tagCollectionsOut)
{
  return MEMORY[0x24BDC0630](formatDescription, tagCollectionsOut);
}

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x24BDC0640](allocator, imageBuffer, formatDescriptionOut);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x24BDC0660](videoDesc);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x24BDC5138](buffer, key, attachmentMode);
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x24BDC5140](buffer, *(_QWORD *)&attachmentMode);
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
  MEMORY[0x24BDC5160](sourceBuffer, destinationBuffer);
}

void CVBufferRemoveAttachment(CVBufferRef buffer, CFStringRef key)
{
  MEMORY[0x24BDC5170](buffer, key);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
  MEMORY[0x24BDC5180](buffer, key, value, *(_QWORD *)&attachmentMode);
}

void CVBufferSetAttachments(CVBufferRef buffer, CFDictionaryRef theAttachments, CVAttachmentMode attachmentMode)
{
  MEMORY[0x24BDC5188](buffer, theAttachments, *(_QWORD *)&attachmentMode);
}

CFStringRef CVColorPrimariesGetStringForIntegerCodePoint(int colorPrimariesCodePoint)
{
  return (CFStringRef)MEMORY[0x24BDC5198](*(_QWORD *)&colorPrimariesCodePoint);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5248](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5258](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x24BDC5278](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x24BDC5288](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC5290](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC5298](pixelBuffer, planeIndex);
}

void CVPixelBufferGetExtendedPixels(CVPixelBufferRef pixelBuffer, size_t *extraColumnsOnLeft, size_t *extraColumnsOnRight, size_t *extraRowsOnTop, size_t *extraRowsOnBottom)
{
  MEMORY[0x24BDC52A8](pixelBuffer, extraColumnsOnLeft, extraColumnsOnRight, extraRowsOnTop, extraRowsOnBottom);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52B0](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC52B8](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x24BDC52C0](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D0](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D8](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52E8](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC52F0](pixelBuffer, planeIndex);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52F8](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x24BDC5308](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x24BDC5318](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5320](allocator, pixelBufferPool, pixelBufferOut);
}

CVReturn CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CFDictionaryRef auxAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5330](allocator, pixelBufferPool, auxAttributes, pixelBufferOut);
}

void CVPixelBufferPoolFlush(CVPixelBufferPoolRef pool, CVPixelBufferPoolFlushFlags options)
{
  MEMORY[0x24BDC5338](pool, options);
}

CFDictionaryRef CVPixelBufferPoolGetAttributes(CVPixelBufferPoolRef pool)
{
  return (CFDictionaryRef)MEMORY[0x24BDC5340](pool);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
  MEMORY[0x24BDC5358](pixelBufferPool);
}

CVPixelBufferPoolRef CVPixelBufferPoolRetain(CVPixelBufferPoolRef pixelBufferPool)
{
  return (CVPixelBufferPoolRef)MEMORY[0x24BDC5368](pixelBufferPool);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x24BDC53A0](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

CFDictionaryRef CVPixelFormatDescriptionCreateWithPixelFormatType(CFAllocatorRef allocator, OSType pixelFormat)
{
  return (CFDictionaryRef)MEMORY[0x24BDC53C0](allocator, *(_QWORD *)&pixelFormat);
}

CFStringRef CVTransferFunctionGetStringForIntegerCodePoint(int transferFunctionCodePoint)
{
  return (CFStringRef)MEMORY[0x24BDC53E0](*(_QWORD *)&transferFunctionCodePoint);
}

CFStringRef CVYCbCrMatrixGetStringForIntegerCodePoint(int yCbCrMatrixCodePoint)
{
  return (CFStringRef)MEMORY[0x24BDC53F0](*(_QWORD *)&yCbCrMatrixCodePoint);
}

uint64_t FigHEVCBridge_CopyHEVCSEIPayloadData()
{
  return MEMORY[0x24BDC08F0]();
}

uint64_t FigHEVCBridge_Get3DLayerIDs()
{
  return MEMORY[0x24BDC0900]();
}

uint64_t FigHEVCBridge_GetHEVCParameterSetAtIndex()
{
  return MEMORY[0x24BDC0910]();
}

uint64_t FigHEVCBridge_GetNALUnitHeaderLengthFromHVCC()
{
  return MEMORY[0x24BDC0918]();
}

uint64_t FigHEVCBridge_GetSPSChromaFormatAndBitDepths()
{
  return MEMORY[0x24BDC0928]();
}

uint64_t FigSampleBufferGetTaggedBufferGroup()
{
  return MEMORY[0x24BDC09A8]();
}

uint64_t FigTagCollectionCreate()
{
  return MEMORY[0x24BDC0A20]();
}

uint64_t FigTagCollectionGetTagsWithCategory()
{
  return MEMORY[0x24BDC0A28]();
}

uint64_t FigTagGetSInt64Value()
{
  return MEMORY[0x24BDC0A38]();
}

uint64_t FigTagMakeWithSInt64Value()
{
  return MEMORY[0x24BDC0A40]();
}

uint64_t FigTaggedBufferGroupCreate()
{
  return MEMORY[0x24BDC0A48]();
}

uint64_t FigTaggedBufferGroupGetCVPixelBufferAtIndex()
{
  return MEMORY[0x24BDC0A50]();
}

uint64_t FigTaggedBufferGroupGetCount()
{
  return MEMORY[0x24BDC0A58]();
}

uint64_t FigTaggedBufferGroupGetTagCollectionAtIndex()
{
  return MEMORY[0x24BDC0A60]();
}

uint64_t IOSurfaceGetProhibitUseCount()
{
  return MEMORY[0x24BDD8C90]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

OSStatus VTCompressionSessionCompleteFrames(VTCompressionSessionRef session, CMTime *completeUntilPresentationTimeStamp)
{
  return MEMORY[0x24BDF8FD0](session, completeUntilPresentationTimeStamp);
}

OSStatus VTCompressionSessionCreate(CFAllocatorRef allocator, int32_t width, int32_t height, CMVideoCodecType codecType, CFDictionaryRef encoderSpecification, CFDictionaryRef sourceImageBufferAttributes, CFAllocatorRef compressedDataAllocator, VTCompressionOutputCallback outputCallback, void *outputCallbackRefCon, VTCompressionSessionRef *compressionSessionOut)
{
  return MEMORY[0x24BDF8FD8](allocator, *(_QWORD *)&width, *(_QWORD *)&height, *(_QWORD *)&codecType, encoderSpecification, sourceImageBufferAttributes, compressedDataAllocator, outputCallback);
}

uint64_t VTCompressionSessionCreateWithOptions()
{
  return MEMORY[0x24BDF8FE0]();
}

OSStatus VTCompressionSessionEncodeFrame(VTCompressionSessionRef session, CVImageBufferRef imageBuffer, CMTime *presentationTimeStamp, CMTime *duration, CFDictionaryRef frameProperties, void *sourceFrameRefcon, VTEncodeInfoFlags *infoFlagsOut)
{
  return MEMORY[0x24BDF8FE8](session, imageBuffer, presentationTimeStamp, duration, frameProperties, sourceFrameRefcon, infoFlagsOut);
}

void VTCompressionSessionInvalidate(VTCompressionSessionRef session)
{
  MEMORY[0x24BDF9008](session);
}

OSStatus VTCopyVideoEncoderList(CFDictionaryRef options, CFArrayRef *listOfVideoEncodersOut)
{
  return MEMORY[0x24BDF9018](options, listOfVideoEncodersOut);
}

OSStatus VTPixelRotationSessionCreate(CFAllocatorRef allocator, VTPixelRotationSessionRef *pixelRotationSessionOut)
{
  return MEMORY[0x24BDF9148](allocator, pixelRotationSessionOut);
}

void VTPixelRotationSessionInvalidate(VTPixelRotationSessionRef session)
{
  MEMORY[0x24BDF9150](session);
}

OSStatus VTPixelRotationSessionRotateImage(VTPixelRotationSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x24BDF9158](session, sourceBuffer, destinationBuffer);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x24BDF9168](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
  MEMORY[0x24BDF9170](session);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x24BDF9178](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionCopyProperty(VTSessionRef session, CFStringRef propertyKey, CFAllocatorRef allocator, void *propertyValueOut)
{
  return MEMORY[0x24BDF9198](session, propertyKey, allocator, propertyValueOut);
}

OSStatus VTSessionCopySupportedPropertyDictionary(VTSessionRef session, CFDictionaryRef *supportedPropertyDictionaryOut)
{
  return MEMORY[0x24BDF91A0](session, supportedPropertyDictionaryOut);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x24BDF91A8](session, propertyKey, propertyValue);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24CA43F60(__p);
}

uint64_t operator delete()
{
  return off_24CA43F68();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24CA43F70(__sz);
}

uint64_t operator new()
{
  return off_24CA43F78();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x24BDAD9C0](*(_QWORD *)&__clock_id);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x24BDADD10](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

int getpagesize(void)
{
  return MEMORY[0x24BDAE6B8]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
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

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
  MEMORY[0x24BDAEEB8](__b, __pattern4, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

