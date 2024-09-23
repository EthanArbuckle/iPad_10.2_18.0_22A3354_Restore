void sub_21F4E219C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void cfDeallocateBackingObject(void *a1, CFTypeRef cf)
{
  CFRelease(cf);
}

uint64_t AFBIsValidUTF8(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  unsigned int v7;
  int v8;
  int v9;
  unint64_t v10;
  unsigned int v11;

  v1 = 0;
  while (1)
  {
    v2 = v1;
    v3 = v1 + 1;
    v4 = *(char *)(a1 + v1);
    v5 = v4;
    if ((v4 & 0x80000000) == 0)
      goto LABEL_19;
    if ((_DWORD)v3 == -1)
      return 0;
    if (v4 >= 0xE0u)
      break;
    if (v4 < 0xC2u)
      return 0;
    v8 = v4 & 0x1F;
LABEL_17:
    v11 = *(unsigned __int8 *)(a1 + (int)v3) ^ 0x80;
    if (v11 > 0x3F)
      return 0;
    v5 = v11 | (v8 << 6);
    LODWORD(v3) = v3 + 1;
LABEL_19:
    v1 = v3;
    if (!v5)
      return 1;
  }
  if (v4 <= 0xEFu)
  {
    v6 = v4 & 0xF;
    if (((a00000000000000[v6] >> (*(_BYTE *)(a1 + v3) >> 5)) & 1) == 0)
      return 0;
    v7 = *(_BYTE *)(a1 + v3) & 0x3F;
    goto LABEL_15;
  }
  if (v4 <= 0xF4u)
  {
    v9 = v4 - 240;
    v10 = *(unsigned __int8 *)(a1 + v3);
    if (((byte_21F4F3CAB[v10 >> 4] >> (v5 + 16)) & 1) != 0)
    {
      v3 = v2 + 2;
      if ((_DWORD)v2 != -3)
      {
        v7 = *(unsigned __int8 *)(a1 + v3) ^ 0x80;
        if (v7 <= 0x3F)
        {
          LODWORD(v6) = v10 & 0x3F | (v9 << 6);
LABEL_15:
          LODWORD(v3) = v3 + 1;
          if ((_DWORD)v3 == -1)
            return 0;
          v8 = v7 | ((_DWORD)v6 << 6);
          goto LABEL_17;
        }
      }
    }
  }
  return 0;
}

void sub_21F4E25E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)AFBBufRef;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_21F4E2924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  void *v13;
  void *v14;
  void *v15;

  if (a13)
    (*(void (**)(uint64_t))(*(_QWORD *)a13 + 16))(a13);

  _Unwind_Resume(a1);
}

void sub_21F4E2C18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_21F4E2DC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4E2FA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4E31EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

unint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector(apple::aiml::flatbuffers2::FlatBufferBuilder *this, uint64_t a2, unint64_t a3)
{
  uint64_t v6;

  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)this);
  *((_BYTE *)this + 70) = 1;
  v6 = a3 * a2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::PreAlign(this, v6, 4uLL);
  return apple::aiml::flatbuffers2::FlatBufferBuilder::PreAlign(this, v6, a3);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<BOOL>(uint64_t a1, char a2)
{
  _BYTE *v4;

  apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a1, 1uLL);
  v4 = (_BYTE *)(*(_QWORD *)(a1 + 48)
               - apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a1, 1uLL));
  *(_QWORD *)(a1 + 48) = v4;
  *v4 = a2;
  return (*(_DWORD *)(a1 + 32) - (_DWORD)v4 + *(_DWORD *)(a1 + 40));
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector(apple::aiml::flatbuffers2::FlatBufferBuilder *this, int a2)
{
  if (!*((_BYTE *)this + 70))
    apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector();
  *((_BYTE *)this + 70) = 0;
  return apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<int>((uint64_t)this, a2);
}

void sub_21F4E3578(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

unint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment(apple::aiml::flatbuffers2::FlatBufferBuilder *this, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint8x8_t v4;

  if (a4 - 1 > 0xF || (v4 = (uint8x8_t)vcnt_s8((int8x8_t)a4), v4.i16[0] = vaddlv_u8(v4), v4.u32[0] >= 2uLL))
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment();
  return apple::aiml::flatbuffers2::FlatBufferBuilder::PreAlign(this, a3 * a2, a4);
}

void sub_21F4E3864(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4E3AE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4E3DBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4E4060(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4E43B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<signed char>(uint64_t a1, char a2)
{
  _BYTE *v4;

  apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a1, 1uLL);
  v4 = (_BYTE *)(*(_QWORD *)(a1 + 48)
               - apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a1, 1uLL));
  *(_QWORD *)(a1 + 48) = v4;
  *v4 = a2;
  return (*(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40));
}

void sub_21F4E46C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4E4974(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4E4BF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4E4ECC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4E516C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4E54BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4E5778(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4E5A28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4E5CAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4E5F80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4E6220(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4E64BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4E6760(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4E6AB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<short>(uint64_t a1, __int16 a2)
{
  _WORD *v4;

  apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a1, 2uLL);
  v4 = (_WORD *)(*(_QWORD *)(a1 + 48)
               - apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a1, 2uLL));
  *(_QWORD *)(a1 + 48) = v4;
  *v4 = a2;
  return (*(_DWORD *)(a1 + 32) - (_DWORD)v4 + *(_DWORD *)(a1 + 40));
}

void sub_21F4E6DC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4E7074(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4E72FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4E75D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4E7874(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4E7BC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4E7E84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4E8134(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4E83BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4E8690(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4E8934(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4E8C84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<int>(uint64_t a1, int a2)
{
  _DWORD *v4;

  apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a1, 4uLL);
  v4 = (_DWORD *)(*(_QWORD *)(a1 + 48)
                - apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a1, 4uLL));
  *(_QWORD *)(a1 + 48) = v4;
  *v4 = a2;
  return (*(_DWORD *)(a1 + 32) - (_DWORD)v4 + *(_DWORD *)(a1 + 40));
}

void sub_21F4E8F98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4E9248(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4E94D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4E97A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4E9A48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4E9D98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4EA058(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4EA308(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4EA590(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4EA864(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4EAB08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4EAE58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<long long>(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;

  apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a1, 8uLL);
  v4 = (_QWORD *)(*(_QWORD *)(a1 + 48)
                - apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a1, 8uLL));
  *(_QWORD *)(a1 + 48) = v4;
  *v4 = a2;
  return (*(_DWORD *)(a1 + 32) - (_DWORD)v4 + *(_DWORD *)(a1 + 40));
}

void sub_21F4EB16C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4EB41C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4EB6A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4EB978(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4EBC1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4EBF6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4EC22C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4EC4DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4EC764(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4ECA38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4ECCDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4ED028(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<float>(uint64_t a1, float a2)
{
  float *v4;

  apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a1, 4uLL);
  v4 = (float *)(*(_QWORD *)(a1 + 48)
               - apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a1, 4uLL));
  *(_QWORD *)(a1 + 48) = v4;
  *v4 = a2;
  return (*(_DWORD *)(a1 + 32) - (_DWORD)v4 + *(_DWORD *)(a1 + 40));
}

void sub_21F4ED344(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4ED5F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4ED87C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4EDB50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4EDDF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4EE140(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<double>(uint64_t a1, double a2)
{
  double *v4;

  apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a1, 8uLL);
  v4 = (double *)(*(_QWORD *)(a1 + 48)
                - apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a1, 8uLL));
  *(_QWORD *)(a1 + 48) = v4;
  *v4 = a2;
  return (*(_DWORD *)(a1 + 32) - (_DWORD)v4 + *(_DWORD *)(a1 + 40));
}

void sub_21F4EE45C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4EE70C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4EE994(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4EEC68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4EEF0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4EF0A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4EF21C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4EF318(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4EF49C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

unint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::ForceStringAlignment(apple::aiml::flatbuffers2::FlatBufferBuilder *this, uint64_t a2, unint64_t a3)
{
  uint8x8_t v3;

  if (a3 - 1 > 0xF || (v3 = (uint8x8_t)vcnt_s8((int8x8_t)a3), v3.i16[0] = vaddlv_u8(v3), v3.u32[0] >= 2uLL))
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceStringAlignment();
  return apple::aiml::flatbuffers2::FlatBufferBuilder::PreAlign(this, a2 + 1, a3);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString(apple::aiml::flatbuffers2::FlatBufferBuilder *this, const char *a2, unint64_t a3)
{
  _BYTE *v6;
  void *v7;

  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)this);
  apple::aiml::flatbuffers2::FlatBufferBuilder::PreAlign(this, a3 + 1, 4uLL);
  v6 = (_BYTE *)(*((_QWORD *)this + 6) - apple::aiml::flatbuffers2::vector_downward::ensure_space(this, 1uLL));
  *((_QWORD *)this + 6) = v6;
  *v6 = 0;
  if (a3)
  {
    v7 = (void *)(*((_QWORD *)this + 6) - apple::aiml::flatbuffers2::vector_downward::ensure_space(this, a3));
    *((_QWORD *)this + 6) = v7;
    memcpy(v7, a2, a3);
  }
  apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<int>((uint64_t)this, a3);
  return (*((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10));
}

void sub_21F4EF780(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4EF94C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21F4EFAEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4EFE8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  int v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 2)
  {
    if (a2 >> 62)
      std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    v9 = &v6[4 * v8];
    v10 = (char *)*a1;
    v11 = (char *)a1[1];
    v12 = v7;
    if (v11 != *a1)
    {
      v12 = v7;
      do
      {
        v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void sub_21F4F0124(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21F4F04B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_21F4F099C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  void *v28;

  _Unwind_Resume(a1);
}

void apple::aiml::flatbuffers2::vector_downward::~vector_downward(apple::aiml::flatbuffers2::vector_downward *this)
{
  apple::aiml::flatbuffers2::vector_downward::clear_buffer(this);
  if (*((_BYTE *)this + 8) && *(_QWORD *)this)
    (*(void (**)(_QWORD))(**(_QWORD **)this + 8))(*(_QWORD *)this);
  *(_QWORD *)this = 0;
  *((_BYTE *)this + 8) = 0;
}

_QWORD *apple::aiml::flatbuffers2::vector_downward::clear_buffer(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = this;
  v2 = this[5];
  if (v2)
  {
    v3 = *this;
    if (*v1)
      this = (_QWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
    else
      this = (_QWORD *)MEMORY[0x2207C92C8](v2, 0x1000C8077774924);
  }
  v1[5] = 0;
  return this;
}

void apple::aiml::flatbuffers2::DefaultAllocator::deallocate(apple::aiml::flatbuffers2::DefaultAllocator *this, unsigned __int8 *a2)
{
  if (a2)
    JUMPOUT(0x2207C92C8);
}

void apple::aiml::flatbuffers2::DefaultAllocator::~DefaultAllocator(apple::aiml::flatbuffers2::DefaultAllocator *this)
{
  JUMPOUT(0x2207C92E0);
}

uint64_t apple::aiml::flatbuffers2::DefaultAllocator::allocate(apple::aiml::flatbuffers2::DefaultAllocator *this)
{
  return operator new[]();
}

char *apple::aiml::flatbuffers2::Allocator::reallocate_downward(apple::aiml::flatbuffers2::Allocator *this, unsigned __int8 *a2, unint64_t a3, unint64_t a4, size_t a5, size_t a6)
{
  char *v12;

  if (a4 <= a3)
    apple::aiml::flatbuffers2::Allocator::reallocate_downward();
  v12 = (char *)(*(uint64_t (**)(apple::aiml::flatbuffers2::Allocator *, unint64_t))(*(_QWORD *)this + 16))(this, a4);
  memcpy(&v12[a4 - a5], &a2[a3 - a5], a5);
  memcpy(v12, a2, a6);
  (*(void (**)(apple::aiml::flatbuffers2::Allocator *, unsigned __int8 *, unint64_t))(*(_QWORD *)this + 24))(this, a2, a3);
  return v12;
}

void apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder(apple::aiml::flatbuffers2::FlatBufferBuilder *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 11);
  if (v2)
  {
    std::__tree<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,apple::aiml::flatbuffers2::FlatBufferBuilder::StringOffsetCompare,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>::destroy(*((_QWORD *)this + 11), *(_QWORD **)(v2 + 8));
    MEMORY[0x2207C92E0](v2, 0x1060C40C2B13FB5);
  }
  apple::aiml::flatbuffers2::vector_downward::~vector_downward(this);
}

void std::__tree<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,apple::aiml::flatbuffers2::FlatBufferBuilder::StringOffsetCompare,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,apple::aiml::flatbuffers2::FlatBufferBuilder::StringOffsetCompare,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>::destroy(a1, *a2);
    std::__tree<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,apple::aiml::flatbuffers2::FlatBufferBuilder::StringOffsetCompare,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested(uint64_t this)
{
  if (*(_BYTE *)(this + 70))
    apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested();
  if (*(_DWORD *)(this + 64))
    apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested();
  return this;
}

unint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::PreAlign(apple::aiml::flatbuffers2::FlatBufferBuilder *this, uint64_t a2, unint64_t a3)
{
  if (*((_QWORD *)this + 9) < a3)
    *((_QWORD *)this + 9) = a3;
  return apple::aiml::flatbuffers2::vector_downward::fill(this, (a3 - 1) & (-a2 - (*((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10))));
}

unint64_t apple::aiml::flatbuffers2::vector_downward::fill(apple::aiml::flatbuffers2::vector_downward *this, unint64_t a2)
{
  unint64_t result;
  uint64_t v5;

  result = apple::aiml::flatbuffers2::vector_downward::ensure_space(this, a2);
  *((_QWORD *)this + 6) -= result;
  if (a2)
  {
    v5 = 0;
    do
      *(_BYTE *)(*((_QWORD *)this + 6) + v5++) = 0;
    while (a2 != v5);
  }
  return result;
}

unint64_t apple::aiml::flatbuffers2::vector_downward::ensure_space(apple::aiml::flatbuffers2::vector_downward *this, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v5;

  v2 = *((_QWORD *)this + 6);
  v3 = *((_QWORD *)this + 7);
  if (v2 < v3 || (v5 = *((_QWORD *)this + 5), v3 < v5))
    apple::aiml::flatbuffers2::vector_downward::ensure_space();
  if (v2 - v3 < a2)
  {
    apple::aiml::flatbuffers2::vector_downward::reallocate(this, a2);
    v5 = *((_QWORD *)this + 5);
    v2 = *((_QWORD *)this + 6);
  }
  if ((*((_DWORD *)this + 8) - v2 + v5) >= 0x7FFFFFFF)
    apple::aiml::flatbuffers2::vector_downward::ensure_space();
  return a2;
}

uint64_t apple::aiml::flatbuffers2::vector_downward::reallocate(apple::aiml::flatbuffers2::vector_downward *this, unint64_t a2)
{
  unsigned __int8 *v4;
  unint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  void (**v13)(apple::aiml::flatbuffers2::DefaultAllocator *__hidden);

  v5 = *((_QWORD *)this + 4);
  v4 = (unsigned __int8 *)*((_QWORD *)this + 5);
  v6 = &v4[v5 - *((_QWORD *)this + 6)];
  v7 = *((_QWORD *)this + 7) - (_QWORD)v4;
  if (v5)
    v8 = v5 >> 1;
  else
    v8 = *((_QWORD *)this + 2);
  if (v8 > a2)
    a2 = v8;
  v9 = (*((_QWORD *)this + 3) + v5 + a2 - 1) & -*((_QWORD *)this + 3);
  *((_QWORD *)this + 4) = v9;
  v10 = *(_QWORD *)this;
  if (v4)
  {
    if (v10)
    {
      result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 32))(v10);
    }
    else
    {
      v13 = &off_24E436B38;
      result = (uint64_t)apple::aiml::flatbuffers2::Allocator::reallocate_downward((apple::aiml::flatbuffers2::Allocator *)&v13, v4, v5, v9, v6, v7);
    }
  }
  else if (v10)
  {
    result = (*(uint64_t (**)(uint64_t, unint64_t))(*(_QWORD *)v10 + 16))(v10, v9);
  }
  else
  {
    result = operator new[]();
  }
  v12 = result + *((_QWORD *)this + 4) - v6;
  *((_QWORD *)this + 5) = result;
  *((_QWORD *)this + 6) = v12;
  *((_QWORD *)this + 7) = result + v7;
  return result;
}

unint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::Align(apple::aiml::flatbuffers2::FlatBufferBuilder *this, unint64_t a2)
{
  if (*((_QWORD *)this + 9) < a2)
    *((_QWORD *)this + 9) = a2;
  return apple::aiml::flatbuffers2::vector_downward::fill(this, (a2 - 1) & -(uint64_t)(*((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10)));
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>(apple::aiml::flatbuffers2::FlatBufferBuilder *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector(a1, a3, 4uLL);
  if (a3)
  {
    v6 = a2 - 4;
    v7 = a3;
    do
    {
      v8 = v7 - 1;
      v9 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(a1, *(_DWORD *)(v6 + 4 * v7));
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<int>((uint64_t)a1, v9);
      v7 = v8;
    }
    while (v8);
  }
  return apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector(a1, a3);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(apple::aiml::flatbuffers2::FlatBufferBuilder *this, unsigned int a2)
{
  unsigned int v4;
  BOOL v5;
  unsigned int v6;

  apple::aiml::flatbuffers2::FlatBufferBuilder::Align(this, 4uLL);
  if (!a2
    || (v4 = *((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10), v5 = v4 >= a2, v6 = v4 - a2, !v5))
  {
    apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo();
  }
  return v6 + 4;
}

void std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24E4367B8, MEMORY[0x24BEDAAF0]);
}

void sub_21F4F1104(_Unwind_Exception *a1)
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void sub_21F4F1778(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t cfAllocateAlwaysFailing(uint64_t a1, unint64_t a2, void *a3)
{
  return 0;
}

unint64_t apple::aiml::flatbuffers2::objc_apple::page_align_rounddown(unint64_t this)
{
  return this / *MEMORY[0x24BDB03C8] * *MEMORY[0x24BDB03C8];
}

unint64_t apple::aiml::flatbuffers2::objc_apple::page_align_roundup(apple::aiml::flatbuffers2::objc_apple *this)
{
  return ((unint64_t)this + *MEMORY[0x24BDB03C8] - 1) / *MEMORY[0x24BDB03C8] * *MEMORY[0x24BDB03C8];
}

_QWORD *apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::PageAlignedMemmove(_QWORD *this, uint64_t a2)
{
  *this = &off_24E436AD8;
  this[1] = a2;
  return this;
}

void apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::~PageAlignedMemmove(apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *this)
{
  JUMPOUT(0x2207C92E0);
}

void apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::sync(apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *this, unsigned __int8 **a2, unint64_t *a3)
{
  if (*a2 && (unint64_t)*a2 % *MEMORY[0x24BDB03C8])
    apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::sync();
  *a2 = 0;
  *a3 = 0;
}

uint64_t apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_down(apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *this, unint64_t __dst, const unsigned __int8 *__src, size_t a4)
{
  size_t v8;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unsigned __int8 *v19;
  unint64_t v20;
  size_t v21;
  unsigned __int8 *v22;
  unint64_t v23;
  unint64_t v25;
  unsigned __int8 *v26;

  if ((unint64_t)__src <= __dst)
    apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_down();
  v8 = 0;
  v9 = *((_QWORD *)this + 1);
  v10 = (unint64_t *)MEMORY[0x24BDB03C8];
  v11 = *MEMORY[0x24BDB03C8];
  if (v9 <= *MEMORY[0x24BDB03C8])
    v9 = *MEMORY[0x24BDB03C8];
  v12 = (v11 - 1 + v9) / v11 * v11;
  v13 = (v11 - 1 + __dst) / v11 * v11;
  v25 = 0;
  v26 = 0;
  v14 = v13 > __dst;
  v15 = v13 - __dst;
  if (v14)
  {
    v8 = v15 >= a4 ? a4 : v15;
    memmove((void *)__dst, __src, v8);
    v16 = *v10;
    v17 = __dst / *v10 * *v10;
    v25 = v16;
    v26 = (unsigned __int8 *)v17;
    if (v16 >= v12)
    {
      if (v17 > __dst)
        apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_down();
      if (v17 + v16 < __dst + v8)
        apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_down();
      (**(void (***)(apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *, unsigned __int8 **, unint64_t *))this)(this, &v26, &v25);
    }
  }
  if (v8 < a4)
  {
    v18 = *v10;
    do
    {
      v19 = (unsigned __int8 *)(__dst + v8);
      if ((__dst + v8) % v18)
        apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_down();
      v20 = v25;
      if (v12 <= v25)
        apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_down();
      if (v12 - v25 >= a4 - v8)
        v21 = a4 - v8;
      else
        v21 = v12 - v25;
      if (!v21)
        apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_down();
      memmove((void *)(__dst + v8), &__src[v8], v21);
      v22 = v26;
      if (!v26)
      {
        v26 = (unsigned __int8 *)(__dst + v8);
        v22 = (unsigned __int8 *)(__dst + v8);
      }
      v18 = *v10;
      v23 = v20 + (v21 + *v10 - 1) / *v10 * *v10;
      v25 = v23;
      if (v23 >= v12)
      {
        if (v22 > v19)
          apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_down();
        if (&v22[v23] < &v19[v21])
          apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_down();
        (**(void (***)(apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *, unsigned __int8 **, unint64_t *))this)(this, &v26, &v25);
        v18 = *v10;
      }
      v8 += v21;
    }
    while (v8 < a4);
  }
  return (**(uint64_t (***)(apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *, unsigned __int8 **, unint64_t *))this)(this, &v26, &v25);
}

uint64_t apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_up(apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *this, unsigned __int8 *a2, unsigned __int8 *a3, unint64_t a4)
{
  size_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  unint64_t v12;
  unint64_t v13;
  const unsigned __int8 *v14;
  unint64_t v15;
  unsigned __int8 *v16;
  unint64_t v17;
  size_t v18;
  size_t v19;
  unint64_t v20;
  unint64_t v22;
  unint64_t v23;

  if (a3 >= a2)
    apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_up();
  v7 = 0;
  v8 = *((_QWORD *)this + 1);
  v9 = *MEMORY[0x24BDB03C8];
  if (v8 <= *MEMORY[0x24BDB03C8])
    v8 = *MEMORY[0x24BDB03C8];
  v10 = (v9 + v8 - 1) / v9 * v9;
  v22 = 0;
  v23 = 0;
  v11 = &a2[a4];
  v12 = (unint64_t)&a2[a4] / v9 * v9;
  if ((unint64_t)&a2[a4] % v9 != 0 && (unint64_t)&a2[a4] >= v12)
  {
    v7 = (unint64_t)&a2[a4] % v9 >= a4 ? a4 : (unint64_t)&a2[a4] % v9;
    memmove(&v11[-v7], &a3[a4 - v7], v7);
    v23 = v12;
    v13 = *MEMORY[0x24BDB03C8];
    v22 = v13;
    if (v13 >= v10)
    {
      if ((unint64_t)&v11[-v7] < v12)
        apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_up();
      if (v12 + v13 < (unint64_t)v11)
        apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_up();
      (**(void (***)(apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *, unint64_t *, unint64_t *))this)(this, &v23, &v22);
    }
  }
  if (v7 < a4)
  {
    v14 = &a3[a4];
    v15 = *MEMORY[0x24BDB03C8];
    do
    {
      v16 = &v11[-v7];
      if ((unint64_t)&v11[-v7] % v15)
        apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_up();
      v17 = v22;
      if (v10 <= v22)
        apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_up();
      if (v10 - v22 >= a4 - v7)
        v18 = a4 - v7;
      else
        v18 = v10 - v22;
      if (!v18)
        apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_up();
      memmove(&v16[-v18], &v14[-v7 - v18], v18);
      v15 = *MEMORY[0x24BDB03C8];
      v19 = (unint64_t)&v16[-v18] / *MEMORY[0x24BDB03C8] * *MEMORY[0x24BDB03C8];
      v20 = v17 + (v18 + *MEMORY[0x24BDB03C8] - 1) / *MEMORY[0x24BDB03C8] * *MEMORY[0x24BDB03C8];
      v22 = v20;
      v23 = v19;
      if (v20 >= v10)
      {
        if ((unint64_t)&v16[-v18] < v19)
          apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_up();
        if (v19 + v20 < (unint64_t)v16)
          apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_up();
        (**(void (***)(apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *, unint64_t *, unint64_t *))this)(this, &v23, &v22);
        v15 = *MEMORY[0x24BDB03C8];
      }
      v7 += v18;
    }
    while (v7 < a4);
  }
  return (**(uint64_t (***)(apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *, unint64_t *, unint64_t *))this)(this, &v23, &v22);
}

apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove(apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *this, unsigned __int8 *a2, unsigned __int8 *a3, unint64_t a4)
{
  if (a2 != a3 && a4)
  {
    if (a2 <= a3)
      return (apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *)apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_down(this, (unint64_t)a2, a3, a4);
    else
      return (apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *)apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_up(this, a2, a3, a4);
  }
  return this;
}

_QWORD *apple::aiml::flatbuffers2::objc_apple::MemmoveWithMsync::MemmoveWithMsync(_QWORD *this, uint64_t a2)
{
  *this = &off_24E436A88;
  this[1] = a2;
  return this;
}

unint64_t apple::aiml::flatbuffers2::objc_apple::MemmoveWithMsync::sync(apple::aiml::flatbuffers2::objc_apple::MemmoveWithMsync *this, unsigned __int8 **a2, unint64_t *a3)
{
  unint64_t result;

  result = (unint64_t)*a2;
  if (*a2)
  {
    if (result % *MEMORY[0x24BDB03C8])
      apple::aiml::flatbuffers2::objc_apple::MemmoveWithMsync::sync();
    if (*a3)
    {
      result = msync((void *)result, *a3, 16);
      if ((_DWORD)result)
        apple::aiml::flatbuffers2::objc_apple::MemmoveWithMsync::sync();
    }
    *a2 = 0;
    *a3 = 0;
  }
  return result;
}

__n128 apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::MappedFileAllocator(uint64_t a1, __n128 *a2, uint64_t *a3)
{
  __n128 result;
  uint64_t v4;

  *(_QWORD *)a1 = &off_24E436B00;
  result = *a2;
  *(_QWORD *)(a1 + 24) = a2[1].n128_u64[0];
  *(__n128 *)(a1 + 8) = result;
  v4 = *a3;
  *a3 = 0;
  *(_QWORD *)(a1 + 32) = v4;
  *(_DWORD *)(a1 + 40) = -1;
  *(_DWORD *)(a1 + 84) = 0;
  *(_QWORD *)(a1 + 48) = -1;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  *(_BYTE *)(a1 + 80) = 0;
  return result;
}

uint64_t apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::init(apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator *this, const char *a2, int a3, int *a4)
{
  uint64_t result;
  int v7;

  if (*((_BYTE *)this + 80))
    apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::init();
  if (*((_DWORD *)this + 2) == 1)
  {
    result = 0;
    if (a4)
      *a4 = *((_DWORD *)this + 6);
  }
  else
  {
    v7 = open_dprotected_np(a2, 1538, a3, 0, 420);
    *((_DWORD *)this + 10) = v7;
    if (v7 < 0)
    {
      if (a4)
        *a4 = *__error();
      result = 0;
      *((_BYTE *)this + 80) = 1;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

void apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::~MappedFileAllocator(apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator *this)
{
  void *v2;
  int v3;
  uint64_t v4;

  *(_QWORD *)this = &off_24E436B00;
  v2 = (void *)*((_QWORD *)this + 6);
  if (v2 != (void *)-1)
    munmap(v2, *((_QWORD *)this + 7));
  v3 = *((_DWORD *)this + 10);
  if ((v3 & 0x80000000) == 0)
    close(v3);
  v4 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 16))(v4);
}

{
  apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::~MappedFileAllocator(this);
  JUMPOUT(0x2207C92E0);
}

uint64_t apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::allocate(apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator *this, uint64_t a2)
{
  int v3;
  _QWORD *v5;
  _QWORD *exception;
  __int128 v7;

  if (*((_BYTE *)this + 80))
    apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::allocate();
  if (*((_DWORD *)this + 2) == 3)
  {
    v3 = *((_DWORD *)this + 21);
    if (v3 == *((_DWORD *)this + 7))
    {
      exception = __cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(&v7, "(Test mode) allocation failure");
      apple::aiml::flatbuffers2::objc_apple::AllocatorException::AllocatorException(exception, &v7);
    }
    *((_DWORD *)this + 21) = v3 + 1;
  }
  if (*((_QWORD *)this + 8))
  {
    v5 = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v7, "Only one region can be allocated from the mmap");
    apple::aiml::flatbuffers2::objc_apple::AllocatorException::AllocatorException(v5, &v7);
  }
  (*(void (**)(apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator *, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)this + 32))(this, 0, *((_QWORD *)this + 9), a2, 0, 0);
  return *((_QWORD *)this + 8);
}

void sub_21F4F2238(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  char v16;

  if (a15 < 0)
    operator delete(__p);
  if ((v16 & 1) != 0)
    __cxa_free_exception(v15);
  _Unwind_Resume(exception_object);
}

void apple::aiml::flatbuffers2::objc_apple::AllocatorException::~AllocatorException(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)off_24E436AB0;
  if (SHIBYTE(this[3].__vftable) < 0)
    operator delete(this[1].__vftable);
  std::exception::~exception(this);
}

{
  this->__vftable = (std::exception_vtbl *)off_24E436AB0;
  if (SHIBYTE(this[3].__vftable) < 0)
    operator delete(this[1].__vftable);
  std::exception::~exception(this);
  JUMPOUT(0x2207C92E0);
}

uint64_t apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::deallocate(uint64_t this, unsigned __int8 *a2)
{
  if (*(_BYTE *)(this + 80))
    apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::deallocate();
  *(_QWORD *)(this + 64) = 0;
  *(_QWORD *)(this + 72) = 0;
  return this;
}

unint64_t apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::reallocate_downward(apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator *this, unsigned __int8 *a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  int v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v16;
  _QWORD *exception;
  __int128 v18;
  __int128 __str[32];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (*((_BYTE *)this + 80))
    apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::reallocate_downward();
  if (a6 + a5 > a4)
    apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::reallocate_downward();
  if (*((_DWORD *)this + 2) == 4)
  {
    v11 = *((_DWORD *)this + 21);
    if (v11 == *((_DWORD *)this + 7))
    {
      exception = __cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(__str, "(Test mode) realloc failure");
      apple::aiml::flatbuffers2::objc_apple::AllocatorException::AllocatorException(exception, __str);
    }
    *((_DWORD *)this + 21) = v11 + 1;
  }
  if (*((unsigned __int8 **)this + 8) != a2 || *((_QWORD *)this + 9) != a3)
  {
    snprintf((char *)__str, 0x200uLL, "Mismatched region reallocation (exp %p, act %p)", *((const void **)this + 8), a2);
    v16 = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v18, (char *)__str);
    apple::aiml::flatbuffers2::objc_apple::AllocatorException::AllocatorException(v16, &v18);
  }
  v12 = *((_QWORD *)this + 7);
  if (v12 < a4)
  {
    apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::increase_map_size(this, a4);
    v12 = *((_QWORD *)this + 7);
    a2 = (unsigned __int8 *)*((_QWORD *)this + 8);
  }
  v13 = *((_QWORD *)this + 6) + v12;
  v14 = v13 - a4;
  if (a2)
    apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::memmove_downward(this, a2, a3, (unsigned __int8 *)(v13 - a4), a4, a5, a6);
  *((_QWORD *)this + 8) = v14;
  *((_QWORD *)this + 9) = a4;
  return v14;
}

void sub_21F4F24A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;
  int v23;

  if (a22 < 0)
  {
    operator delete(__p);
    if ((v23 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v22);
  goto LABEL_6;
}

char *apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::increase_map_size(apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator *this, unint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  off_t v6;
  char *result;
  uint64_t v8;
  int v9;
  char *v10;
  _QWORD *v11;
  int v12;
  char *v13;
  _QWORD *v14;
  int v15;
  char *v16;
  _QWORD *exception;
  int v18;
  char *v19;
  _QWORD *v20;
  __int128 v21;
  char __str[512];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = *((_QWORD *)this + 6);
  if (v4 != -1)
  {
    if (msync(*((void **)this + 6), *((_QWORD *)this + 7), 16))
    {
      v15 = *__error();
      v16 = strerror(v15);
      snprintf(__str, 0x200uLL, "Unable to sync memory to disk: %s (%d)", v16, v15);
      exception = __cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(&v21, __str);
      apple::aiml::flatbuffers2::objc_apple::AllocatorException::AllocatorException(exception, &v21);
    }
    if (munmap(*((void **)this + 6), *((_QWORD *)this + 7)))
    {
      v18 = *__error();
      v19 = strerror(v18);
      snprintf(__str, 0x200uLL, "Unable to release memory mapping: %s (%d)", v19, v18);
      v20 = __cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(&v21, __str);
      apple::aiml::flatbuffers2::objc_apple::AllocatorException::AllocatorException(v20, &v21);
    }
  }
  v5 = *((_QWORD *)this + 7);
  if (v5 <= a2)
    v5 = a2;
  v6 = (v5 + *MEMORY[0x24BDB03C8] - 1) / *MEMORY[0x24BDB03C8] * *MEMORY[0x24BDB03C8];
  *((_QWORD *)this + 7) = v6;
  if (ftruncate(*((_DWORD *)this + 10), v6))
  {
    v9 = *__error();
    v10 = strerror(v9);
    snprintf(__str, 0x200uLL, "Unable to extend file: %s (%d)", v10, v9);
    v11 = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v21, __str);
    apple::aiml::flatbuffers2::objc_apple::AllocatorException::AllocatorException(v11, &v21);
  }
  result = (char *)mmap(0, *((_QWORD *)this + 7), 3, 1, *((_DWORD *)this + 10), 0);
  *((_QWORD *)this + 6) = result;
  if (result == (char *)-1)
  {
    v12 = *__error();
    v13 = strerror(v12);
    snprintf(__str, 0x200uLL, "Unable to map file: %s (%d)", v13, v12);
    v14 = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v21, __str);
    apple::aiml::flatbuffers2::objc_apple::AllocatorException::AllocatorException(v14, &v21);
  }
  v8 = *((_QWORD *)this + 8);
  if (v8)
    *((_QWORD *)this + 8) = &result[v8 - v4];
  return result;
}

void sub_21F4F27B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  void *v16;
  int v17;

  if (a16 < 0)
  {
    operator delete(__p);
    if ((v17 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v17)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v16);
  goto LABEL_6;
}

apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::memmove_downward(apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator *this, unsigned __int8 *a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5, unint64_t a6, unint64_t a7)
{
  apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *v14;
  apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *v15;
  unsigned __int8 *v16;
  unsigned __int8 *v17;
  unint64_t v18;

  v14 = (apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *)*((_QWORD *)this + 4);
  if (a4 <= a2)
  {
    apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove(v14, a4, a2, a7);
    v15 = (apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *)*((_QWORD *)this + 4);
    v16 = &a4[a5 - a6];
    v17 = &a2[a3 - a6];
    v18 = a6;
  }
  else
  {
    apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove(v14, &a4[a5 - a6], &a2[a3 - a6], a6);
    v15 = (apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *)*((_QWORD *)this + 4);
    v16 = a4;
    v17 = a2;
    v18 = a7;
  }
  return apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove(v15, v16, v17, v18);
}

uint64_t apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::truncate_to_region(apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator *this, unsigned __int8 *a2, unint64_t a3, int *a4)
{
  unsigned __int8 *v8;
  uint64_t result;
  int v10;
  int *v11;
  int v12;
  int v13;

  if (*((_BYTE *)this + 80))
    apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::truncate_to_region();
  v8 = (unsigned __int8 *)*((_QWORD *)this + 6);
  if (v8 == (unsigned __int8 *)-1)
  {
    if (a4)
    {
      result = 0;
      v10 = 2;
      goto LABEL_9;
    }
    return 0;
  }
  if (v8 > a2 || &a2[a3] > &v8[*((_QWORD *)this + 7)])
  {
    if (a4)
    {
      result = 0;
      v10 = 22;
LABEL_9:
      *a4 = v10;
      return result;
    }
    return 0;
  }
  *((_BYTE *)this + 80) = 1;
  if (*((_DWORD *)this + 2) == 2)
  {
    if (a4)
    {
      result = 0;
      v10 = *((_DWORD *)this + 6);
      goto LABEL_9;
    }
    return 0;
  }
  apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove(*((apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove **)this + 4), v8, a2, a3);
  if (msync(*((void **)this + 6), (a3 + *MEMORY[0x24BDB03C8] - 1) / *MEMORY[0x24BDB03C8] * *MEMORY[0x24BDB03C8], 16)
    || munmap(*((void **)this + 6), *((_QWORD *)this + 7)))
  {
    if (a4)
    {
      v11 = __error();
      result = 0;
      v10 = *v11;
      goto LABEL_9;
    }
    return 0;
  }
  *((_QWORD *)this + 6) = -1;
  v12 = ftruncate(*((_DWORD *)this + 10), a3);
  if (a4 && v12)
    *a4 = *__error();
  v13 = close(*((_DWORD *)this + 10));
  if (a4)
  {
    if (v13)
      *a4 = *__error();
  }
  *((_DWORD *)this + 10) = -1;
  return 1;
}

void apple::aiml::flatbuffers2::objc_apple::MemmoveWithMsync::~MemmoveWithMsync(apple::aiml::flatbuffers2::objc_apple::MemmoveWithMsync *this)
{
  JUMPOUT(0x2207C92E0);
}

_QWORD *apple::aiml::flatbuffers2::objc_apple::AllocatorException::AllocatorException(_QWORD *a1, __int128 *a2)
{
  std::string *v3;
  __int128 v4;

  *a1 = off_24E436AB0;
  v3 = (std::string *)(a1 + 1);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v3, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    v3->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&v3->__r_.__value_.__l.__data_ = v4;
  }
  return a1;
}

void sub_21F4F2A7C(_Unwind_Exception *a1)
{
  std::exception *v1;

  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::objc_apple::AllocatorException::what(apple::aiml::flatbuffers2::objc_apple::AllocatorException *this)
{
  uint64_t result;

  result = (uint64_t)this + 8;
  if (*((char *)this + 31) < 0)
    return *(_QWORD *)result;
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

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
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

void apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector()
{
  __assert_rtn("EndVector", "flatbuffers.h", 1672, "nested");
}

void apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment()
{
  __assert_rtn("ForceVectorAlignment", "flatbuffers.h", 1690, "VerifyAlignmentRequirements(alignment)");
}

void apple::aiml::flatbuffers2::FlatBufferBuilder::ForceStringAlignment()
{
  __assert_rtn("ForceStringAlignment", "flatbuffers.h", 1696, "VerifyAlignmentRequirements(alignment)");
}

void apple::aiml::flatbuffers2::Allocator::reallocate_downward()
{
  __assert_rtn("reallocate_downward", "flatbuffers.h", 687, "new_size > old_size");
}

void apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested()
{
  __assert_rtn("NotNested", "flatbuffers.h", 1434, "!num_field_loc");
}

{
  __assert_rtn("NotNested", "flatbuffers.h", 1432, "!nested");
}

void apple::aiml::flatbuffers2::vector_downward::ensure_space()
{
  __assert_rtn("ensure_space", "flatbuffers.h", 988, "cur_ >= scratch_ && scratch_ >= buf_");
}

{
  __assert_rtn("ensure_space", "flatbuffers.h", 992, "size() < FLATBUFFERS_MAX_BUFFER_SIZE");
}

void apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo()
{
  __assert_rtn("ReferTo", "flatbuffers.h", 1419, "off && off <= GetSize()");
}

void apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::sync()
{
  __assert_rtn("sync", "AFBMappedFileAllocator.mm", 62, "page_align_rounddown(aligned_dirty_start) == aligned_dirty_start");
}

void apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_down()
{
  __assert_rtn("memmove_down", "AFBMappedFileAllocator.mm", 106, "bytes_this_time != 0");
}

{
  __assert_rtn("memmove_down", "AFBMappedFileAllocator.mm", 113, "aligned_dirty_start <= dest + bytes_transferred");
}

{
  __assert_rtn("memmove_down", "AFBMappedFileAllocator.mm", 114, "aligned_dirty_start + aligned_bytes_dirtied >= dest + bytes_transferred + bytes_this_time");
}

{
  __assert_rtn("memmove_down", "AFBMappedFileAllocator.mm", 104, "max_dirty_size > aligned_bytes_dirtied");
}

{
  __assert_rtn("memmove_down", "AFBMappedFileAllocator.mm", 102, "dest + bytes_transferred == page_align_rounddown(dest + bytes_transferred)");
}

{
  __assert_rtn("memmove_down", "AFBMappedFileAllocator.mm", 90, "aligned_dirty_start <= dest");
}

{
  __assert_rtn("memmove_down", "AFBMappedFileAllocator.mm", 91, "aligned_dirty_start + aligned_bytes_dirtied >= dest + bytes_this_time");
}

{
  __assert_rtn("memmove_down", "AFBMappedFileAllocator.mm", 73, "src > dest");
}

void apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_up()
{
  __assert_rtn("memmove_up", "AFBMappedFileAllocator.mm", 162, "bytes_this_time != 0");
}

{
  __assert_rtn("memmove_up", "AFBMappedFileAllocator.mm", 167, "aligned_dirty_start <= dest + size - bytes_transferred - bytes_this_time");
}

{
  __assert_rtn("memmove_up", "AFBMappedFileAllocator.mm", 168, "aligned_dirty_start + aligned_bytes_dirtied >= dest + size - bytes_transferred");
}

{
  __assert_rtn("memmove_up", "AFBMappedFileAllocator.mm", 160, "max_dirty_size > aligned_bytes_dirtied");
}

{
  __assert_rtn("memmove_up", "AFBMappedFileAllocator.mm", 158, "dest + size - bytes_transferred == page_align_rounddown(dest + size - bytes_transferred)");
}

{
  __assert_rtn("memmove_up", "AFBMappedFileAllocator.mm", 146, "aligned_dirty_start <= dest + size - bytes_this_time");
}

{
  __assert_rtn("memmove_up", "AFBMappedFileAllocator.mm", 147, "aligned_dirty_start + aligned_bytes_dirtied >= dest + size");
}

{
  __assert_rtn("memmove_up", "AFBMappedFileAllocator.mm", 129, "src < dest");
}

void apple::aiml::flatbuffers2::objc_apple::MemmoveWithMsync::sync()
{
  __assert_rtn("sync", "AFBMappedFileAllocator.mm", 198, "rc == 0");
}

{
  __assert_rtn("sync", "AFBMappedFileAllocator.mm", 195, "page_align_rounddown(aligned_dirty_start) == aligned_dirty_start");
}

void apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::init()
{
  __assert_rtn("init", "AFBMappedFileAllocator.mm", 214, "!file_complete");
}

void apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::allocate()
{
  __assert_rtn("allocate", "AFBMappedFileAllocator.mm", 241, "!file_complete");
}

void apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::deallocate()
{
  __assert_rtn("deallocate", "AFBMappedFileAllocator.mm", 260, "!file_complete");
}

void apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::reallocate_downward()
{
  __assert_rtn("reallocate_downward", "AFBMappedFileAllocator.mm", 275, "in_use_back + in_use_front <= new_size");
}

{
  __assert_rtn("reallocate_downward", "AFBMappedFileAllocator.mm", 274, "!file_complete");
}

void apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::truncate_to_region()
{
  __assert_rtn("truncate_to_region", "AFBMappedFileAllocator.mm", 358, "!file_complete");
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x24BDBB798](allocator, context);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
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

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_24E4367D0();
}

void operator delete(void *__p)
{
  off_24E4367D8(__p);
}

uint64_t operator delete()
{
  return off_24E4367E0();
}

uint64_t operator new[]()
{
  return off_24E4367E8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24E4367F0(__sz);
}

uint64_t operator new()
{
  return off_24E4367F8();
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

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x24BDAE548](*(_QWORD *)&a1, a2);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int msync(void *a1, size_t a2, int a3)
{
  return MEMORY[0x24BDAEFE0](a1, a2, *(_QWORD *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x24BDAF230](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

