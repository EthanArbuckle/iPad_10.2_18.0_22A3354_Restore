void sub_191D39488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<unsigned long long,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  unsigned __int8 *i;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v10;

  for (i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    v10 = 0;
    i = google::protobuf::internal::VarintParse<unsigned long long>((char *)i, &v10);
    if (!i)
      break;
    v6 = v10;
    v7 = *a3;
    if ((_DWORD)v7 == a3[1])
    {
      v8 = v7 + 1;
      google::protobuf::RepeatedField<unsigned long long>::Reserve(a3, v7 + 1);
      *(_QWORD *)(google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a3) + 8 * v7) = v6;
    }
    else
    {
      *(_QWORD *)(google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a3) + 8 * v7) = v6;
      v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<int,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(uint64_t a1, google::protobuf::internal *this, int *a3)
{
  int v5;
  unsigned __int8 *result;
  int v7;
  unint64_t v8;
  int v9;
  signed int v10;
  std::string *v11;
  int v12;
  std::string *v13;
  unint64_t v14;
  unsigned __int8 *v15;
  BOOL v16;
  char v17;
  std::string v18;
  __int16 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    result = (unsigned __int8 *)google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result)
      return result;
    v5 = v7;
  }
  else
  {
    result = (unsigned __int8 *)this + 1;
  }
  v8 = *(_QWORD *)(a1 + 8);
  v9 = v8 - (_DWORD)result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    v14 = (unint64_t)&result[v5];
    result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<int,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v14, a3);
    if ((unsigned __int8 *)v14 != result)
      return 0;
  }
  else
  {
    while (1)
    {
      result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<int,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v8, a3);
      if (!result)
        break;
      v10 = (_DWORD)result - *(_QWORD *)(a1 + 8);
      if (v10 >= 0x11)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        v11 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(_QWORD *)(a1 + 8);
        v15 = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<int,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15)
          v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        else
          v16 = 0;
        if (!v16)
          return 0;
        return (unsigned __int8 *)(*(_QWORD *)(a1 + 8) + v12);
      }
      v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        v13 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: (size) > (0): ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      if (*(int *)(a1 + 28) < 17)
        return 0;
      result = (unsigned __int8 *)google::protobuf::internal::EpsCopyInputStream::Next((google::protobuf::internal::EpsCopyInputStream *)a1);
      if (!result)
        return result;
      result += v10;
      v8 = *(_QWORD *)(a1 + 8);
      v9 = v8 - (_DWORD)result;
      if (v5 <= (int)v8 - (int)result)
        goto LABEL_15;
    }
  }
  return result;
}

void sub_191D39754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<int,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  unsigned __int8 *i;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v10;

  for (i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    v10 = 0;
    i = google::protobuf::internal::VarintParse<unsigned long long>((char *)i, &v10);
    if (!i)
      break;
    v6 = -(v10 & 1) ^ (v10 >> 1);
    v7 = *a3;
    if ((_DWORD)v7 == a3[1])
    {
      v8 = v7 + 1;
      google::protobuf::RepeatedField<int>::Reserve(a3, v7 + 1);
      *(_DWORD *)(google::protobuf::RepeatedField<int>::elements((uint64_t)a3) + 4 * v7) = v6;
    }
    else
    {
      *(_DWORD *)(google::protobuf::RepeatedField<int>::elements((uint64_t)a3) + 4 * v7) = v6;
      v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<long long,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(uint64_t a1, google::protobuf::internal *this, int *a3)
{
  int v5;
  unsigned __int8 *result;
  int v7;
  unint64_t v8;
  int v9;
  signed int v10;
  std::string *v11;
  int v12;
  std::string *v13;
  unint64_t v14;
  unsigned __int8 *v15;
  BOOL v16;
  char v17;
  std::string v18;
  __int16 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    result = (unsigned __int8 *)google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result)
      return result;
    v5 = v7;
  }
  else
  {
    result = (unsigned __int8 *)this + 1;
  }
  v8 = *(_QWORD *)(a1 + 8);
  v9 = v8 - (_DWORD)result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    v14 = (unint64_t)&result[v5];
    result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<long long,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v14, a3);
    if ((unsigned __int8 *)v14 != result)
      return 0;
  }
  else
  {
    while (1)
    {
      result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<long long,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v8, a3);
      if (!result)
        break;
      v10 = (_DWORD)result - *(_QWORD *)(a1 + 8);
      if (v10 >= 0x11)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        v11 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(_QWORD *)(a1 + 8);
        v15 = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<long long,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15)
          v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        else
          v16 = 0;
        if (!v16)
          return 0;
        return (unsigned __int8 *)(*(_QWORD *)(a1 + 8) + v12);
      }
      v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        v13 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: (size) > (0): ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      if (*(int *)(a1 + 28) < 17)
        return 0;
      result = (unsigned __int8 *)google::protobuf::internal::EpsCopyInputStream::Next((google::protobuf::internal::EpsCopyInputStream *)a1);
      if (!result)
        return result;
      result += v10;
      v8 = *(_QWORD *)(a1 + 8);
      v9 = v8 - (_DWORD)result;
      if (v5 <= (int)v8 - (int)result)
        goto LABEL_15;
    }
  }
  return result;
}

void sub_191D39A2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<long long,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  unsigned __int8 *i;
  unint64_t v6;
  uint64_t v7;
  int v8;
  unint64_t v10;

  for (i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    v10 = 0;
    i = google::protobuf::internal::VarintParse<unsigned long long>((char *)i, &v10);
    if (!i)
      break;
    v6 = -(uint64_t)(v10 & 1) ^ (v10 >> 1);
    v7 = *a3;
    if ((_DWORD)v7 == a3[1])
    {
      v8 = v7 + 1;
      google::protobuf::RepeatedField<long long>::Reserve(a3, v7 + 1);
      *(_QWORD *)(google::protobuf::RepeatedField<long long>::elements((uint64_t)a3) + 8 * v7) = v6;
    }
    else
    {
      *(_QWORD *)(google::protobuf::RepeatedField<long long>::elements((uint64_t)a3) + 8 * v7) = v6;
      v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<BOOL,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(uint64_t a1, google::protobuf::internal *this, int *a3)
{
  int v5;
  unsigned __int8 *result;
  int v7;
  unint64_t v8;
  int v9;
  signed int v10;
  std::string *v11;
  int v12;
  std::string *v13;
  unint64_t v14;
  unsigned __int8 *v15;
  BOOL v16;
  char v17;
  std::string v18;
  __int16 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    result = (unsigned __int8 *)google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result)
      return result;
    v5 = v7;
  }
  else
  {
    result = (unsigned __int8 *)this + 1;
  }
  v8 = *(_QWORD *)(a1 + 8);
  v9 = v8 - (_DWORD)result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    v14 = (unint64_t)&result[v5];
    result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<BOOL,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v14, a3);
    if ((unsigned __int8 *)v14 != result)
      return 0;
  }
  else
  {
    while (1)
    {
      result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<BOOL,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v8, a3);
      if (!result)
        break;
      v10 = (_DWORD)result - *(_QWORD *)(a1 + 8);
      if (v10 >= 0x11)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        v11 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(_QWORD *)(a1 + 8);
        v15 = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<BOOL,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15)
          v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        else
          v16 = 0;
        if (!v16)
          return 0;
        return (unsigned __int8 *)(*(_QWORD *)(a1 + 8) + v12);
      }
      v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        v13 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: (size) > (0): ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      if (*(int *)(a1 + 28) < 17)
        return 0;
      result = (unsigned __int8 *)google::protobuf::internal::EpsCopyInputStream::Next((google::protobuf::internal::EpsCopyInputStream *)a1);
      if (!result)
        return result;
      result += v10;
      v8 = *(_QWORD *)(a1 + 8);
      v9 = v8 - (_DWORD)result;
      if (v5 <= (int)v8 - (int)result)
        goto LABEL_15;
    }
  }
  return result;
}

void sub_191D39D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<BOOL,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  unsigned __int8 *i;
  BOOL v6;
  uint64_t v7;
  int v8;
  uint64_t v10;

  for (i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    v10 = 0;
    i = google::protobuf::internal::VarintParse<unsigned long long>((char *)i, &v10);
    if (!i)
      break;
    v6 = v10 != 0;
    v7 = *a3;
    if ((_DWORD)v7 == a3[1])
    {
      v8 = v7 + 1;
      google::protobuf::RepeatedField<BOOL>::Reserve(a3, v7 + 1);
      *(_BYTE *)(google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a3) + v7) = v6;
    }
    else
    {
      *(_BYTE *)(google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a3) + v7) = v6;
      v8 = v7 + 1;
    }
  }
  return i;
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<unsigned int>(google::protobuf::internal::EpsCopyInputStream *a1, char *a2, int a3, int *a4)
{
  int v5;
  char *v6;
  int v7;
  void *v9;
  google::protobuf::internal::EpsCopyInputStream *result;
  void *v11;

  v5 = a3;
  v6 = a2;
  v7 = *((_DWORD *)a1 + 2) - (_DWORD)a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    google::protobuf::RepeatedField<unsigned int>::Reserve(a4, *a4 + (v5 >> 2));
    v11 = (void *)google::protobuf::RepeatedField<unsigned int>::AddNAlreadyReserved((uint64_t)a4, v5 >> 2);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFFC));
    if (v5 == (v5 & 0xFFFFFFFC))
      return (google::protobuf::internal::EpsCopyInputStream *)&v6[v5 & 0xFFFFFFFC];
    else
      return 0;
  }
  else
  {
    while (1)
    {
      google::protobuf::RepeatedField<unsigned int>::Reserve(a4, *a4 + (v7 >> 2));
      v9 = (void *)google::protobuf::RepeatedField<unsigned int>::AddNAlreadyReserved((uint64_t)a4, v7 >> 2);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFFC));
      if (*((int *)a1 + 7) < 17)
        return 0;
      result = google::protobuf::internal::EpsCopyInputStream::Next(a1);
      if (!result)
        return result;
      v5 -= v7 & 0xFFFFFFFC;
      v6 = (char *)result - (v7 & 3) + 16;
      v7 = *((_DWORD *)a1 + 2) - ((_DWORD)result - (v7 & 3));
      if (v5 <= v7)
        goto LABEL_5;
    }
  }
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<int>(google::protobuf::internal::EpsCopyInputStream *a1, char *a2, int a3, int *a4)
{
  int v5;
  char *v6;
  int v7;
  void *v9;
  google::protobuf::internal::EpsCopyInputStream *result;
  void *v11;

  v5 = a3;
  v6 = a2;
  v7 = *((_DWORD *)a1 + 2) - (_DWORD)a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    google::protobuf::RepeatedField<int>::Reserve(a4, *a4 + (v5 >> 2));
    v11 = (void *)google::protobuf::RepeatedField<int>::AddNAlreadyReserved((uint64_t)a4, v5 >> 2);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFFC));
    if (v5 == (v5 & 0xFFFFFFFC))
      return (google::protobuf::internal::EpsCopyInputStream *)&v6[v5 & 0xFFFFFFFC];
    else
      return 0;
  }
  else
  {
    while (1)
    {
      google::protobuf::RepeatedField<int>::Reserve(a4, *a4 + (v7 >> 2));
      v9 = (void *)google::protobuf::RepeatedField<int>::AddNAlreadyReserved((uint64_t)a4, v7 >> 2);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFFC));
      if (*((int *)a1 + 7) < 17)
        return 0;
      result = google::protobuf::internal::EpsCopyInputStream::Next(a1);
      if (!result)
        return result;
      v5 -= v7 & 0xFFFFFFFC;
      v6 = (char *)result - (v7 & 3) + 16;
      v7 = *((_DWORD *)a1 + 2) - ((_DWORD)result - (v7 & 3));
      if (v5 <= v7)
        goto LABEL_5;
    }
  }
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<unsigned long long>(google::protobuf::internal::EpsCopyInputStream *a1, char *a2, int a3, int *a4)
{
  int v5;
  char *v6;
  int v7;
  void *v9;
  google::protobuf::internal::EpsCopyInputStream *result;
  void *v11;

  v5 = a3;
  v6 = a2;
  v7 = *((_DWORD *)a1 + 2) - (_DWORD)a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    google::protobuf::RepeatedField<unsigned long long>::Reserve(a4, *a4 + (v5 >> 3));
    v11 = (void *)google::protobuf::RepeatedField<unsigned long long>::AddNAlreadyReserved((uint64_t)a4, v5 >> 3);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFF8));
    if (v5 == (v5 & 0xFFFFFFF8))
      return (google::protobuf::internal::EpsCopyInputStream *)&v6[v5 & 0xFFFFFFF8];
    else
      return 0;
  }
  else
  {
    while (1)
    {
      google::protobuf::RepeatedField<unsigned long long>::Reserve(a4, *a4 + (v7 >> 3));
      v9 = (void *)google::protobuf::RepeatedField<unsigned long long>::AddNAlreadyReserved((uint64_t)a4, v7 >> 3);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFF8));
      if (*((int *)a1 + 7) < 17)
        return 0;
      result = google::protobuf::internal::EpsCopyInputStream::Next(a1);
      if (!result)
        return result;
      v5 -= v7 & 0xFFFFFFF8;
      v6 = (char *)result - (v7 & 7) + 16;
      v7 = *((_DWORD *)a1 + 2) - ((_DWORD)result - (v7 & 7));
      if (v5 <= v7)
        goto LABEL_5;
    }
  }
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<long long>(google::protobuf::internal::EpsCopyInputStream *a1, char *a2, int a3, int *a4)
{
  int v5;
  char *v6;
  int v7;
  void *v9;
  google::protobuf::internal::EpsCopyInputStream *result;
  void *v11;

  v5 = a3;
  v6 = a2;
  v7 = *((_DWORD *)a1 + 2) - (_DWORD)a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    google::protobuf::RepeatedField<long long>::Reserve(a4, *a4 + (v5 >> 3));
    v11 = (void *)google::protobuf::RepeatedField<long long>::AddNAlreadyReserved((uint64_t)a4, v5 >> 3);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFF8));
    if (v5 == (v5 & 0xFFFFFFF8))
      return (google::protobuf::internal::EpsCopyInputStream *)&v6[v5 & 0xFFFFFFF8];
    else
      return 0;
  }
  else
  {
    while (1)
    {
      google::protobuf::RepeatedField<long long>::Reserve(a4, *a4 + (v7 >> 3));
      v9 = (void *)google::protobuf::RepeatedField<long long>::AddNAlreadyReserved((uint64_t)a4, v7 >> 3);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFF8));
      if (*((int *)a1 + 7) < 17)
        return 0;
      result = google::protobuf::internal::EpsCopyInputStream::Next(a1);
      if (!result)
        return result;
      v5 -= v7 & 0xFFFFFFF8;
      v6 = (char *)result - (v7 & 7) + 16;
      v7 = *((_DWORD *)a1 + 2) - ((_DWORD)result - (v7 & 7));
      if (v5 <= v7)
        goto LABEL_5;
    }
  }
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<float>(google::protobuf::internal::EpsCopyInputStream *a1, char *a2, int a3, int *a4)
{
  int v5;
  char *v6;
  int v7;
  void *v9;
  google::protobuf::internal::EpsCopyInputStream *result;
  void *v11;

  v5 = a3;
  v6 = a2;
  v7 = *((_DWORD *)a1 + 2) - (_DWORD)a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    google::protobuf::RepeatedField<float>::Reserve(a4, *a4 + (v5 >> 2));
    v11 = (void *)google::protobuf::RepeatedField<float>::AddNAlreadyReserved((uint64_t)a4, v5 >> 2);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFFC));
    if (v5 == (v5 & 0xFFFFFFFC))
      return (google::protobuf::internal::EpsCopyInputStream *)&v6[v5 & 0xFFFFFFFC];
    else
      return 0;
  }
  else
  {
    while (1)
    {
      google::protobuf::RepeatedField<float>::Reserve(a4, *a4 + (v7 >> 2));
      v9 = (void *)google::protobuf::RepeatedField<float>::AddNAlreadyReserved((uint64_t)a4, v7 >> 2);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFFC));
      if (*((int *)a1 + 7) < 17)
        return 0;
      result = google::protobuf::internal::EpsCopyInputStream::Next(a1);
      if (!result)
        return result;
      v5 -= v7 & 0xFFFFFFFC;
      v6 = (char *)result - (v7 & 3) + 16;
      v7 = *((_DWORD *)a1 + 2) - ((_DWORD)result - (v7 & 3));
      if (v5 <= v7)
        goto LABEL_5;
    }
  }
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<double>(google::protobuf::internal::EpsCopyInputStream *a1, char *a2, int a3, int *a4)
{
  int v5;
  char *v6;
  int v7;
  void *v9;
  google::protobuf::internal::EpsCopyInputStream *result;
  void *v11;

  v5 = a3;
  v6 = a2;
  v7 = *((_DWORD *)a1 + 2) - (_DWORD)a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    google::protobuf::RepeatedField<double>::Reserve(a4, *a4 + (v5 >> 3));
    v11 = (void *)google::protobuf::RepeatedField<double>::AddNAlreadyReserved((uint64_t)a4, v5 >> 3);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFF8));
    if (v5 == (v5 & 0xFFFFFFF8))
      return (google::protobuf::internal::EpsCopyInputStream *)&v6[v5 & 0xFFFFFFF8];
    else
      return 0;
  }
  else
  {
    while (1)
    {
      google::protobuf::RepeatedField<double>::Reserve(a4, *a4 + (v7 >> 3));
      v9 = (void *)google::protobuf::RepeatedField<double>::AddNAlreadyReserved((uint64_t)a4, v7 >> 3);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFF8));
      if (*((int *)a1 + 7) < 17)
        return 0;
      result = google::protobuf::internal::EpsCopyInputStream::Next(a1);
      if (!result)
        return result;
      v5 -= v7 & 0xFFFFFFF8;
      v6 = (char *)result - (v7 & 7) + 16;
      v7 = *((_DWORD *)a1 + 2) - ((_DWORD)result - (v7 & 7));
      if (v5 <= v7)
        goto LABEL_5;
    }
  }
}

void google::protobuf::internal::UnknownFieldLiteParserHelper::AddVarint(std::string **this, int a2, unint64_t a3)
{
  std::string *v3;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  std::string *v9;
  unint64_t v10;
  unint64_t v11;

  v3 = *this;
  if (*this)
  {
    v6 = (8 * a2);
    if (v6 < 0x80)
    {
      LOBYTE(v7) = 8 * a2;
    }
    else
    {
      do
      {
        std::string::push_back(v3, v6 | 0x80);
        v7 = v6 >> 7;
        v8 = v6 >> 14;
        v6 >>= 7;
      }
      while (v8);
    }
    std::string::push_back(v3, v7);
    v9 = *this;
    if (a3 < 0x80)
    {
      LOBYTE(v10) = a3;
    }
    else
    {
      do
      {
        std::string::push_back(v9, a3 | 0x80);
        v10 = a3 >> 7;
        v11 = a3 >> 14;
        a3 >>= 7;
      }
      while (v11);
    }
    std::string::push_back(v9, v10);
  }
}

std::string *google::protobuf::internal::UnknownFieldLiteParserHelper::AddFixed64(std::string *this, int a2, uint64_t a3)
{
  std::string *v3;
  std::string **v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (std::string *)this->__r_.__value_.__r.__words[0];
  if (this->__r_.__value_.__r.__words[0])
  {
    v5 = (std::string **)this;
    v6 = (8 * a2) | 1u;
    if (v6 < 0x80)
    {
      LOBYTE(v7) = (8 * a2) | 1;
    }
    else
    {
      do
      {
        std::string::push_back(v3, v6 | 0x80);
        v7 = v6 >> 7;
        v8 = v6 >> 14;
        v6 >>= 7;
      }
      while (v8);
    }
    std::string::push_back(v3, v7);
    v9[0] = a3;
    return std::string::append(*v5, (const std::string::value_type *)v9, 8uLL);
  }
  return this;
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::UnknownFieldLiteParserHelper::ParseLengthDelimited(std::string **this, int a2, std::string::value_type *a3, google::protobuf::internal::ParseContext *a4)
{
  int v7;
  std::string::value_type *v8;
  google::protobuf::internal::EpsCopyInputStream *result;
  int v10;
  std::string *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  std::string *v16;
  unint64_t v17;
  unint64_t v18;

  v7 = *a3;
  if (*a3 < 0)
  {
    result = (google::protobuf::internal::EpsCopyInputStream *)google::protobuf::internal::ReadSizeFallback((google::protobuf::internal *)a3, (const char *)*a3);
    if (!result)
      return result;
    v8 = (std::string::value_type *)result;
    v7 = v10;
  }
  else
  {
    v8 = a3 + 1;
  }
  v11 = *this;
  if (*this)
  {
    v12 = (8 * a2) | 2u;
    if (v12 < 0x80)
    {
      LOBYTE(v13) = v12;
    }
    else
    {
      do
      {
        std::string::push_back(v11, v12 | 0x80);
        v13 = v12 >> 7;
        v14 = v12 >> 14;
        v12 >>= 7;
      }
      while (v14);
    }
    std::string::push_back(v11, v13);
    v15 = v7;
    v16 = *this;
    if (v7 < 0x80)
    {
      LOBYTE(v17) = v7;
    }
    else
    {
      do
      {
        std::string::push_back(v16, v15 | 0x80);
        v17 = v15 >> 7;
        v18 = v15 >> 14;
        v15 >>= 7;
      }
      while (v18);
    }
    std::string::push_back(v16, v17);
    return google::protobuf::internal::EpsCopyInputStream::AppendString((uint64_t)a4, v8, v7, *this);
  }
  else if (*((_QWORD *)a4 + 1) - (_QWORD)v8 + 16 >= v7)
  {
    return (google::protobuf::internal::EpsCopyInputStream *)&v8[v7];
  }
  else
  {
    return google::protobuf::internal::EpsCopyInputStream::SkipFallback(a4, v8, v7);
  }
}

char *google::protobuf::internal::UnknownFieldLiteParserHelper::ParseGroup(std::string **this, int a2, char *a3, int32x2_t *a4)
{
  std::string *v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  BOOL v13;
  char *v14;
  __int32 v15;
  char *v17;
  std::string *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;

  v7 = *this;
  v8 = 8 * a2;
  if (*this)
  {
    v9 = v8 | 3u;
    if (v9 < 0x80)
    {
      LOBYTE(v10) = v8 | 3;
    }
    else
    {
      do
      {
        std::string::push_back(v7, v9 | 0x80);
        v10 = v9 >> 7;
        v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
    }
    std::string::push_back(v7, v10);
  }
  v12 = a4[11].i32[0];
  v13 = __OFSUB__(v12--, 1);
  a4[11].i32[0] = v12;
  if (v12 < 0 != v13)
    return 0;
  ++a4[11].i32[1];
  v14 = google::protobuf::internal::WireFormatParser<google::protobuf::internal::UnknownFieldLiteParserHelper>((google::protobuf::internal::UnknownFieldLiteParserHelper *)this, a3, (google::protobuf::internal::EpsCopyInputStream *)a4);
  a4[11] = vadd_s32(a4[11], (int32x2_t)0xFFFFFFFF00000001);
  v15 = a4[10].i32[0];
  a4[10].i32[0] = 0;
  if (v15 != (v8 | 3) || v14 == 0)
    return 0;
  v17 = v14;
  v18 = *this;
  if (v18)
  {
    v19 = v8 | 4u;
    if (v19 < 0x80)
    {
      LOBYTE(v20) = v8 | 4;
    }
    else
    {
      do
      {
        std::string::push_back(v18, v19 | 0x80);
        v20 = v19 >> 7;
        v21 = v19 >> 14;
        v19 >>= 7;
      }
      while (v21);
    }
    std::string::push_back(v18, v20);
  }
  return v17;
}

std::string *google::protobuf::internal::UnknownFieldLiteParserHelper::AddFixed32(std::string *this, int a2, int a3)
{
  std::string *v3;
  std::string **v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  std::string::value_type __s[4];

  v3 = (std::string *)this->__r_.__value_.__r.__words[0];
  if (this->__r_.__value_.__r.__words[0])
  {
    v5 = (std::string **)this;
    v6 = (8 * a2) | 5u;
    if (v6 < 0x80)
    {
      LOBYTE(v7) = (8 * a2) | 5;
    }
    else
    {
      do
      {
        std::string::push_back(v3, v6 | 0x80);
        v7 = v6 >> 7;
        v8 = v6 >> 14;
        v6 >>= 7;
      }
      while (v8);
    }
    std::string::push_back(v3, v7);
    *(_DWORD *)__s = a3;
    return std::string::append(*v5, __s, 4uLL);
  }
  return this;
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::AppendString(uint64_t a1, std::string::value_type *__s, int a3, std::string *this)
{
  uint64_t v6;

  if (*(_QWORD *)(a1 + 8) - (_QWORD)__s + 16 < a3)
    return google::protobuf::internal::EpsCopyInputStream::AppendStringFallback(a1, __s, a3, this);
  v6 = a3;
  std::string::append(this, __s, a3);
  return (google::protobuf::internal::EpsCopyInputStream *)&__s[v6];
}

void google::protobuf::RepeatedField<BOOL>::Reserve(int *a1, int a2)
{
  int v2;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  std::string *v8;
  unsigned int v9;
  int v10;
  unint64_t v11;
  _QWORD *AlignedNoHook;
  void *v13;
  char v14;
  std::string v15[2];

  v2 = a1[1];
  if (v2 >= a2)
    return;
  if (v2 < 1)
  {
    v5 = 0;
    if (v2)
    {
LABEL_4:
      v6 = *(_QWORD *)(google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            v8 = google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v8->__r_.__value_.__l.__data_);
            google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
          }
          v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    v5 = (_QWORD *)(google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a1) - 8);
    if (a1[1])
      goto LABEL_4;
  }
  v6 = *((_QWORD *)a1 + 1);
  if (a2 >= 4)
  {
    v7 = 0;
LABEL_13:
    v10 = 2 * v7;
    if (v10 <= a2)
      v9 = a2;
    else
      v9 = v10;
    goto LABEL_16;
  }
LABEL_11:
  v9 = 4;
LABEL_16:
  if (v6)
  {
    v11 = (v9 + 15) & 0x1FFFFFFF8;
    if ((*(_BYTE *)(v6 + 24) & 1) != 0)
      (*(void (**)(_QWORD, _QWORD, unint64_t))(**(_QWORD **)(*(_QWORD *)(v6 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 32), MEMORY[0x1E0DE4EC8], v11);
    AlignedNoHook = (_QWORD *)google::protobuf::Arena::AllocateAlignedNoHook((google::protobuf::Arena *)v6, v11);
  }
  else
  {
    AlignedNoHook = operator new(v9 + 8);
  }
  *AlignedNoHook = v6;
  a1[1] = v9;
  *((_QWORD *)a1 + 1) = AlignedNoHook + 1;
  google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a1);
  if (*a1 >= 1)
  {
    v13 = (void *)google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a1);
    memcpy(v13, v5 + 1, *a1);
  }
  if (v5)
  {
    if (!*v5)
      operator delete(v5);
  }
}

void sub_191D3AA54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<BOOL>::AddNAlreadyReserved(uint64_t a1, int a2)
{
  int v4;
  std::string *v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  uint64_t result;
  char v10;
  std::string v11[2];

  v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    v5 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    v6 = google::protobuf::internal::LogMessage::operator<<(v5, *(_DWORD *)(a1 + 4));
    v7 = google::protobuf::internal::LogMessage::operator<<(v6, ", ");
    v8 = google::protobuf::internal::LogMessage::operator<<(v7, *(_DWORD *)a1);
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    v4 = *(_DWORD *)a1;
  }
  result = *(_QWORD *)(a1 + 8) + v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_191D3AB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<BOOL>::Mutable(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a1) + a2;
}

void sub_191D3ABE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<BOOL>::Get(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a1) + a2;
}

void sub_191D3ACC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<BOOL>::~RepeatedField(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (*(int *)(a1 + 4) >= 1)
  {
    v2 = google::protobuf::RepeatedField<BOOL>::elements(a1);
    v4 = *(_QWORD *)(v2 - 8);
    v3 = (void *)(v2 - 8);
    if (!v4)
      operator delete(v3);
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<BOOL>::elements(uint64_t a1)
{
  std::string *v2;
  char v4;
  std::string v5[2];

  if (*(int *)(a1 + 4) <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    v2 = google::protobuf::internal::LogMessage::operator<<(v5, "CHECK failed: (total_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
  }
  return *(_QWORD *)(a1 + 8);
}

void sub_191D3AD98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<BOOL>::MergeFrom(int *a1, int *a2)
{
  std::string *v4;
  int v5;
  void *v6;
  std::string *v7;
  const void *v8;
  char v9;
  std::string v10[2];

  if (a2 == a1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    v4 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (&other) != (this): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (*a2)
  {
    v5 = *a1;
    google::protobuf::RepeatedField<BOOL>::Reserve(a1, *a1 + *a2);
    google::protobuf::RepeatedField<BOOL>::AddNAlreadyReserved((uint64_t)a1, *a2);
    v6 = (void *)google::protobuf::RepeatedField<BOOL>::Mutable(a1, v5);
    if (*a2 <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (index) < (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    }
    v8 = (const void *)google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a2);
    memcpy(v6, v8, *a2);
  }
}

void sub_191D3AEB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<int>::Reserve(int *a1, int a2)
{
  int v2;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  std::string *v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *AlignedNoHook;
  void *v14;
  char v15;
  std::string v16[2];

  v2 = a1[1];
  if (v2 >= a2)
    return;
  if (v2 < 1)
  {
    v5 = 0;
    if (v2)
    {
LABEL_4:
      v6 = *(_QWORD *)(google::protobuf::RepeatedField<int>::elements((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            v8 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
          }
          v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    v5 = (_QWORD *)(google::protobuf::RepeatedField<int>::elements((uint64_t)a1) - 8);
    if (a1[1])
      goto LABEL_4;
  }
  v6 = *((_QWORD *)a1 + 1);
  if (a2 >= 4)
  {
    v7 = 0;
LABEL_13:
    v10 = 2 * v7;
    if (v10 <= a2)
      v9 = a2;
    else
      v9 = v10;
    goto LABEL_16;
  }
LABEL_11:
  v9 = 4;
LABEL_16:
  v11 = 4 * v9;
  if (v6)
  {
    v12 = (v11 + 15) & 0x7FFFFFFF8;
    if ((*(_BYTE *)(v6 + 24) & 1) != 0)
      (*(void (**)(_QWORD, _QWORD, unint64_t))(**(_QWORD **)(*(_QWORD *)(v6 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 32), MEMORY[0x1E0DE4EC8], v12);
    AlignedNoHook = (_QWORD *)google::protobuf::Arena::AllocateAlignedNoHook((google::protobuf::Arena *)v6, v12);
  }
  else
  {
    AlignedNoHook = operator new(v11 + 8);
  }
  *AlignedNoHook = v6;
  a1[1] = v9;
  *((_QWORD *)a1 + 1) = AlignedNoHook + 1;
  google::protobuf::RepeatedField<int>::elements((uint64_t)a1);
  if (*a1 >= 1)
  {
    v14 = (void *)google::protobuf::RepeatedField<int>::elements((uint64_t)a1);
    memcpy(v14, v5 + 1, 4 * *a1);
  }
  if (v5)
  {
    if (!*v5)
      operator delete(v5);
  }
}

void sub_191D3B078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<int>::AddNAlreadyReserved(uint64_t a1, int a2)
{
  int v4;
  std::string *v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  uint64_t result;
  char v10;
  std::string v11[2];

  v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    v5 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    v6 = google::protobuf::internal::LogMessage::operator<<(v5, *(_DWORD *)(a1 + 4));
    v7 = google::protobuf::internal::LogMessage::operator<<(v6, ", ");
    v8 = google::protobuf::internal::LogMessage::operator<<(v7, *(_DWORD *)a1);
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    v4 = *(_DWORD *)a1;
  }
  result = *(_QWORD *)(a1 + 8) + 4 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_191D3B134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<int>::Mutable(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<int>::elements((uint64_t)a1) + 4 * a2;
}

void sub_191D3B208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<int>::Get(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<int>::elements((uint64_t)a1) + 4 * a2;
}

void sub_191D3B2E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<int>::~RepeatedField(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (*(int *)(a1 + 4) >= 1)
  {
    v2 = google::protobuf::RepeatedField<int>::elements(a1);
    v4 = *(_QWORD *)(v2 - 8);
    v3 = (void *)(v2 - 8);
    if (!v4)
      operator delete(v3);
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<int>::elements(uint64_t a1)
{
  std::string *v2;
  char v4;
  std::string v5[2];

  if (*(int *)(a1 + 4) <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    v2 = google::protobuf::internal::LogMessage::operator<<(v5, "CHECK failed: (total_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
  }
  return *(_QWORD *)(a1 + 8);
}

void sub_191D3B3BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<int>::MergeFrom(int *a1, int *a2)
{
  std::string *v4;
  int v5;
  void *v6;
  std::string *v7;
  const void *v8;
  char v9;
  std::string v10[2];

  if (a2 == a1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    v4 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (&other) != (this): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (*a2)
  {
    v5 = *a1;
    google::protobuf::RepeatedField<int>::Reserve(a1, *a1 + *a2);
    google::protobuf::RepeatedField<int>::AddNAlreadyReserved((uint64_t)a1, *a2);
    v6 = (void *)google::protobuf::RepeatedField<int>::Mutable(a1, v5);
    if (*a2 <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (index) < (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    }
    v8 = (const void *)google::protobuf::RepeatedField<int>::elements((uint64_t)a2);
    memcpy(v6, v8, 4 * *a2);
  }
}

void sub_191D3B4E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<unsigned int>::Reserve(int *a1, int a2)
{
  int v2;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  std::string *v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *AlignedNoHook;
  void *v14;
  char v15;
  std::string v16[2];

  v2 = a1[1];
  if (v2 >= a2)
    return;
  if (v2 < 1)
  {
    v5 = 0;
    if (v2)
    {
LABEL_4:
      v6 = *(_QWORD *)(google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            v8 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
          }
          v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    v5 = (_QWORD *)(google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)a1) - 8);
    if (a1[1])
      goto LABEL_4;
  }
  v6 = *((_QWORD *)a1 + 1);
  if (a2 >= 4)
  {
    v7 = 0;
LABEL_13:
    v10 = 2 * v7;
    if (v10 <= a2)
      v9 = a2;
    else
      v9 = v10;
    goto LABEL_16;
  }
LABEL_11:
  v9 = 4;
LABEL_16:
  v11 = 4 * v9;
  if (v6)
  {
    v12 = (v11 + 15) & 0x7FFFFFFF8;
    if ((*(_BYTE *)(v6 + 24) & 1) != 0)
      (*(void (**)(_QWORD, _QWORD, unint64_t))(**(_QWORD **)(*(_QWORD *)(v6 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 32), MEMORY[0x1E0DE4EC8], v12);
    AlignedNoHook = (_QWORD *)google::protobuf::Arena::AllocateAlignedNoHook((google::protobuf::Arena *)v6, v12);
  }
  else
  {
    AlignedNoHook = operator new(v11 + 8);
  }
  *AlignedNoHook = v6;
  a1[1] = v9;
  *((_QWORD *)a1 + 1) = AlignedNoHook + 1;
  google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)a1);
  if (*a1 >= 1)
  {
    v14 = (void *)google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)a1);
    memcpy(v14, v5 + 1, 4 * *a1);
  }
  if (v5)
  {
    if (!*v5)
      operator delete(v5);
  }
}

void sub_191D3B6A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned int>::AddNAlreadyReserved(uint64_t a1, int a2)
{
  int v4;
  std::string *v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  uint64_t result;
  char v10;
  std::string v11[2];

  v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    v5 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    v6 = google::protobuf::internal::LogMessage::operator<<(v5, *(_DWORD *)(a1 + 4));
    v7 = google::protobuf::internal::LogMessage::operator<<(v6, ", ");
    v8 = google::protobuf::internal::LogMessage::operator<<(v7, *(_DWORD *)a1);
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    v4 = *(_DWORD *)a1;
  }
  result = *(_QWORD *)(a1 + 8) + 4 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_191D3B75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned int>::Mutable(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)a1) + 4 * a2;
}

void sub_191D3B830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned int>::Get(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)a1) + 4 * a2;
}

void sub_191D3B90C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned int>::~RepeatedField(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (*(int *)(a1 + 4) >= 1)
  {
    v2 = google::protobuf::RepeatedField<unsigned int>::elements(a1);
    v4 = *(_QWORD *)(v2 - 8);
    v3 = (void *)(v2 - 8);
    if (!v4)
      operator delete(v3);
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<unsigned int>::elements(uint64_t a1)
{
  std::string *v2;
  char v4;
  std::string v5[2];

  if (*(int *)(a1 + 4) <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    v2 = google::protobuf::internal::LogMessage::operator<<(v5, "CHECK failed: (total_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
  }
  return *(_QWORD *)(a1 + 8);
}

void sub_191D3B9E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<unsigned int>::MergeFrom(int *a1, int *a2)
{
  std::string *v4;
  int v5;
  void *v6;
  std::string *v7;
  const void *v8;
  char v9;
  std::string v10[2];

  if (a2 == a1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    v4 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (&other) != (this): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (*a2)
  {
    v5 = *a1;
    google::protobuf::RepeatedField<unsigned int>::Reserve(a1, *a1 + *a2);
    google::protobuf::RepeatedField<unsigned int>::AddNAlreadyReserved((uint64_t)a1, *a2);
    v6 = (void *)google::protobuf::RepeatedField<unsigned int>::Mutable(a1, v5);
    if (*a2 <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (index) < (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    }
    v8 = (const void *)google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)a2);
    memcpy(v6, v8, 4 * *a2);
  }
}

void sub_191D3BB08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<long long>::Reserve(int *a1, int a2)
{
  int v2;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  std::string *v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *AlignedNoHook;
  void *v14;
  char v15;
  std::string v16[2];

  v2 = a1[1];
  if (v2 >= a2)
    return;
  if (v2 < 1)
  {
    v5 = 0;
    if (v2)
    {
LABEL_4:
      v6 = *(_QWORD *)(google::protobuf::RepeatedField<long long>::elements((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            v8 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
          }
          v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    v5 = (_QWORD *)(google::protobuf::RepeatedField<long long>::elements((uint64_t)a1) - 8);
    if (a1[1])
      goto LABEL_4;
  }
  v6 = *((_QWORD *)a1 + 1);
  if (a2 >= 4)
  {
    v7 = 0;
LABEL_13:
    v10 = 2 * v7;
    if (v10 <= a2)
      v9 = a2;
    else
      v9 = v10;
    goto LABEL_16;
  }
LABEL_11:
  v9 = 4;
LABEL_16:
  v11 = 8 * v9;
  if (v6)
  {
    v12 = (v11 + 15) & 0xFFFFFFFF8;
    if ((*(_BYTE *)(v6 + 24) & 1) != 0)
      (*(void (**)(_QWORD, _QWORD, unint64_t))(**(_QWORD **)(*(_QWORD *)(v6 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 32), MEMORY[0x1E0DE4EC8], v12);
    AlignedNoHook = (_QWORD *)google::protobuf::Arena::AllocateAlignedNoHook((google::protobuf::Arena *)v6, v12);
  }
  else
  {
    AlignedNoHook = operator new(v11 + 8);
  }
  *AlignedNoHook = v6;
  a1[1] = v9;
  *((_QWORD *)a1 + 1) = AlignedNoHook + 1;
  google::protobuf::RepeatedField<long long>::elements((uint64_t)a1);
  if (*a1 >= 1)
  {
    v14 = (void *)google::protobuf::RepeatedField<long long>::elements((uint64_t)a1);
    memcpy(v14, v5 + 1, 8 * *a1);
  }
  if (v5)
  {
    if (!*v5)
      operator delete(v5);
  }
}

void sub_191D3BCC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<long long>::AddNAlreadyReserved(uint64_t a1, int a2)
{
  int v4;
  std::string *v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  uint64_t result;
  char v10;
  std::string v11[2];

  v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    v5 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    v6 = google::protobuf::internal::LogMessage::operator<<(v5, *(_DWORD *)(a1 + 4));
    v7 = google::protobuf::internal::LogMessage::operator<<(v6, ", ");
    v8 = google::protobuf::internal::LogMessage::operator<<(v7, *(_DWORD *)a1);
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    v4 = *(_DWORD *)a1;
  }
  result = *(_QWORD *)(a1 + 8) + 8 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_191D3BD84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<long long>::Mutable(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<long long>::elements((uint64_t)a1) + 8 * a2;
}

void sub_191D3BE58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<long long>::Get(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<long long>::elements((uint64_t)a1) + 8 * a2;
}

void sub_191D3BF34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<long long>::~RepeatedField(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (*(int *)(a1 + 4) >= 1)
  {
    v2 = google::protobuf::RepeatedField<long long>::elements(a1);
    v4 = *(_QWORD *)(v2 - 8);
    v3 = (void *)(v2 - 8);
    if (!v4)
      operator delete(v3);
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<long long>::elements(uint64_t a1)
{
  std::string *v2;
  char v4;
  std::string v5[2];

  if (*(int *)(a1 + 4) <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    v2 = google::protobuf::internal::LogMessage::operator<<(v5, "CHECK failed: (total_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
  }
  return *(_QWORD *)(a1 + 8);
}

void sub_191D3C00C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<long long>::MergeFrom(int *a1, int *a2)
{
  std::string *v4;
  int v5;
  void *v6;
  std::string *v7;
  const void *v8;
  char v9;
  std::string v10[2];

  if (a2 == a1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    v4 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (&other) != (this): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (*a2)
  {
    v5 = *a1;
    google::protobuf::RepeatedField<long long>::Reserve(a1, *a1 + *a2);
    google::protobuf::RepeatedField<long long>::AddNAlreadyReserved((uint64_t)a1, *a2);
    v6 = (void *)google::protobuf::RepeatedField<long long>::Mutable(a1, v5);
    if (*a2 <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (index) < (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    }
    v8 = (const void *)google::protobuf::RepeatedField<long long>::elements((uint64_t)a2);
    memcpy(v6, v8, 8 * *a2);
  }
}

void sub_191D3C130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<unsigned long long>::Reserve(int *a1, int a2)
{
  int v2;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  std::string *v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *AlignedNoHook;
  void *v14;
  char v15;
  std::string v16[2];

  v2 = a1[1];
  if (v2 >= a2)
    return;
  if (v2 < 1)
  {
    v5 = 0;
    if (v2)
    {
LABEL_4:
      v6 = *(_QWORD *)(google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            v8 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
          }
          v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    v5 = (_QWORD *)(google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1) - 8);
    if (a1[1])
      goto LABEL_4;
  }
  v6 = *((_QWORD *)a1 + 1);
  if (a2 >= 4)
  {
    v7 = 0;
LABEL_13:
    v10 = 2 * v7;
    if (v10 <= a2)
      v9 = a2;
    else
      v9 = v10;
    goto LABEL_16;
  }
LABEL_11:
  v9 = 4;
LABEL_16:
  v11 = 8 * v9;
  if (v6)
  {
    v12 = (v11 + 15) & 0xFFFFFFFF8;
    if ((*(_BYTE *)(v6 + 24) & 1) != 0)
      (*(void (**)(_QWORD, _QWORD, unint64_t))(**(_QWORD **)(*(_QWORD *)(v6 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 32), MEMORY[0x1E0DE4EC8], v12);
    AlignedNoHook = (_QWORD *)google::protobuf::Arena::AllocateAlignedNoHook((google::protobuf::Arena *)v6, v12);
  }
  else
  {
    AlignedNoHook = operator new(v11 + 8);
  }
  *AlignedNoHook = v6;
  a1[1] = v9;
  *((_QWORD *)a1 + 1) = AlignedNoHook + 1;
  google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1);
  if (*a1 >= 1)
  {
    v14 = (void *)google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1);
    memcpy(v14, v5 + 1, 8 * *a1);
  }
  if (v5)
  {
    if (!*v5)
      operator delete(v5);
  }
}

void sub_191D3C2F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::AddNAlreadyReserved(uint64_t a1, int a2)
{
  int v4;
  std::string *v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  uint64_t result;
  char v10;
  std::string v11[2];

  v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    v5 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    v6 = google::protobuf::internal::LogMessage::operator<<(v5, *(_DWORD *)(a1 + 4));
    v7 = google::protobuf::internal::LogMessage::operator<<(v6, ", ");
    v8 = google::protobuf::internal::LogMessage::operator<<(v7, *(_DWORD *)a1);
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    v4 = *(_DWORD *)a1;
  }
  result = *(_QWORD *)(a1 + 8) + 8 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_191D3C3AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::Mutable(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1) + 8 * a2;
}

void sub_191D3C480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::Get(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1) + 8 * a2;
}

void sub_191D3C55C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::~RepeatedField(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (*(int *)(a1 + 4) >= 1)
  {
    v2 = google::protobuf::RepeatedField<unsigned long long>::elements(a1);
    v4 = *(_QWORD *)(v2 - 8);
    v3 = (void *)(v2 - 8);
    if (!v4)
      operator delete(v3);
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::elements(uint64_t a1)
{
  std::string *v2;
  char v4;
  std::string v5[2];

  if (*(int *)(a1 + 4) <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    v2 = google::protobuf::internal::LogMessage::operator<<(v5, "CHECK failed: (total_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
  }
  return *(_QWORD *)(a1 + 8);
}

void sub_191D3C634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<unsigned long long>::MergeFrom(int *a1, int *a2)
{
  std::string *v4;
  int v5;
  void *v6;
  std::string *v7;
  const void *v8;
  char v9;
  std::string v10[2];

  if (a2 == a1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    v4 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (&other) != (this): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (*a2)
  {
    v5 = *a1;
    google::protobuf::RepeatedField<unsigned long long>::Reserve(a1, *a1 + *a2);
    google::protobuf::RepeatedField<unsigned long long>::AddNAlreadyReserved((uint64_t)a1, *a2);
    v6 = (void *)google::protobuf::RepeatedField<unsigned long long>::Mutable(a1, v5);
    if (*a2 <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (index) < (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    }
    v8 = (const void *)google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a2);
    memcpy(v6, v8, 8 * *a2);
  }
}

void sub_191D3C758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<float>::Reserve(int *a1, int a2)
{
  int v2;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  std::string *v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *AlignedNoHook;
  void *v14;
  char v15;
  std::string v16[2];

  v2 = a1[1];
  if (v2 >= a2)
    return;
  if (v2 < 1)
  {
    v5 = 0;
    if (v2)
    {
LABEL_4:
      v6 = *(_QWORD *)(google::protobuf::RepeatedField<float>::elements((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            v8 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
          }
          v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    v5 = (_QWORD *)(google::protobuf::RepeatedField<float>::elements((uint64_t)a1) - 8);
    if (a1[1])
      goto LABEL_4;
  }
  v6 = *((_QWORD *)a1 + 1);
  if (a2 >= 4)
  {
    v7 = 0;
LABEL_13:
    v10 = 2 * v7;
    if (v10 <= a2)
      v9 = a2;
    else
      v9 = v10;
    goto LABEL_16;
  }
LABEL_11:
  v9 = 4;
LABEL_16:
  v11 = 4 * v9;
  if (v6)
  {
    v12 = (v11 + 15) & 0x7FFFFFFF8;
    if ((*(_BYTE *)(v6 + 24) & 1) != 0)
      (*(void (**)(_QWORD, _QWORD, unint64_t))(**(_QWORD **)(*(_QWORD *)(v6 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 32), MEMORY[0x1E0DE4EC8], v12);
    AlignedNoHook = (_QWORD *)google::protobuf::Arena::AllocateAlignedNoHook((google::protobuf::Arena *)v6, v12);
  }
  else
  {
    AlignedNoHook = operator new(v11 + 8);
  }
  *AlignedNoHook = v6;
  a1[1] = v9;
  *((_QWORD *)a1 + 1) = AlignedNoHook + 1;
  google::protobuf::RepeatedField<float>::elements((uint64_t)a1);
  if (*a1 >= 1)
  {
    v14 = (void *)google::protobuf::RepeatedField<float>::elements((uint64_t)a1);
    memcpy(v14, v5 + 1, 4 * *a1);
  }
  if (v5)
  {
    if (!*v5)
      operator delete(v5);
  }
}

void sub_191D3C918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<float>::AddNAlreadyReserved(uint64_t a1, int a2)
{
  int v4;
  std::string *v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  uint64_t result;
  char v10;
  std::string v11[2];

  v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    v5 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    v6 = google::protobuf::internal::LogMessage::operator<<(v5, *(_DWORD *)(a1 + 4));
    v7 = google::protobuf::internal::LogMessage::operator<<(v6, ", ");
    v8 = google::protobuf::internal::LogMessage::operator<<(v7, *(_DWORD *)a1);
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    v4 = *(_DWORD *)a1;
  }
  result = *(_QWORD *)(a1 + 8) + 4 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_191D3C9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<float>::Mutable(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<float>::elements((uint64_t)a1) + 4 * a2;
}

void sub_191D3CAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<float>::Get(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<float>::elements((uint64_t)a1) + 4 * a2;
}

void sub_191D3CB84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<float>::~RepeatedField(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (*(int *)(a1 + 4) >= 1)
  {
    v2 = google::protobuf::RepeatedField<float>::elements(a1);
    v4 = *(_QWORD *)(v2 - 8);
    v3 = (void *)(v2 - 8);
    if (!v4)
      operator delete(v3);
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<float>::elements(uint64_t a1)
{
  std::string *v2;
  char v4;
  std::string v5[2];

  if (*(int *)(a1 + 4) <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    v2 = google::protobuf::internal::LogMessage::operator<<(v5, "CHECK failed: (total_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
  }
  return *(_QWORD *)(a1 + 8);
}

void sub_191D3CC5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<float>::MergeFrom(int *a1, int *a2)
{
  std::string *v4;
  int v5;
  void *v6;
  std::string *v7;
  const void *v8;
  char v9;
  std::string v10[2];

  if (a2 == a1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    v4 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (&other) != (this): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (*a2)
  {
    v5 = *a1;
    google::protobuf::RepeatedField<float>::Reserve(a1, *a1 + *a2);
    google::protobuf::RepeatedField<float>::AddNAlreadyReserved((uint64_t)a1, *a2);
    v6 = (void *)google::protobuf::RepeatedField<float>::Mutable(a1, v5);
    if (*a2 <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (index) < (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    }
    v8 = (const void *)google::protobuf::RepeatedField<float>::elements((uint64_t)a2);
    memcpy(v6, v8, 4 * *a2);
  }
}

void sub_191D3CD80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<double>::Reserve(int *a1, int a2)
{
  int v2;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  std::string *v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *AlignedNoHook;
  void *v14;
  char v15;
  std::string v16[2];

  v2 = a1[1];
  if (v2 >= a2)
    return;
  if (v2 < 1)
  {
    v5 = 0;
    if (v2)
    {
LABEL_4:
      v6 = *(_QWORD *)(google::protobuf::RepeatedField<double>::elements((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            v8 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
          }
          v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    v5 = (_QWORD *)(google::protobuf::RepeatedField<double>::elements((uint64_t)a1) - 8);
    if (a1[1])
      goto LABEL_4;
  }
  v6 = *((_QWORD *)a1 + 1);
  if (a2 >= 4)
  {
    v7 = 0;
LABEL_13:
    v10 = 2 * v7;
    if (v10 <= a2)
      v9 = a2;
    else
      v9 = v10;
    goto LABEL_16;
  }
LABEL_11:
  v9 = 4;
LABEL_16:
  v11 = 8 * v9;
  if (v6)
  {
    v12 = (v11 + 15) & 0xFFFFFFFF8;
    if ((*(_BYTE *)(v6 + 24) & 1) != 0)
      (*(void (**)(_QWORD, _QWORD, unint64_t))(**(_QWORD **)(*(_QWORD *)(v6 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 32), MEMORY[0x1E0DE4EC8], v12);
    AlignedNoHook = (_QWORD *)google::protobuf::Arena::AllocateAlignedNoHook((google::protobuf::Arena *)v6, v12);
  }
  else
  {
    AlignedNoHook = operator new(v11 + 8);
  }
  *AlignedNoHook = v6;
  a1[1] = v9;
  *((_QWORD *)a1 + 1) = AlignedNoHook + 1;
  google::protobuf::RepeatedField<double>::elements((uint64_t)a1);
  if (*a1 >= 1)
  {
    v14 = (void *)google::protobuf::RepeatedField<double>::elements((uint64_t)a1);
    memcpy(v14, v5 + 1, 8 * *a1);
  }
  if (v5)
  {
    if (!*v5)
      operator delete(v5);
  }
}

void sub_191D3CF40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<double>::AddNAlreadyReserved(uint64_t a1, int a2)
{
  int v4;
  std::string *v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  uint64_t result;
  char v10;
  std::string v11[2];

  v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    v5 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    v6 = google::protobuf::internal::LogMessage::operator<<(v5, *(_DWORD *)(a1 + 4));
    v7 = google::protobuf::internal::LogMessage::operator<<(v6, ", ");
    v8 = google::protobuf::internal::LogMessage::operator<<(v7, *(_DWORD *)a1);
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    v4 = *(_DWORD *)a1;
  }
  result = *(_QWORD *)(a1 + 8) + 8 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_191D3CFFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<double>::Mutable(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<double>::elements((uint64_t)a1) + 8 * a2;
}

void sub_191D3D0D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<double>::Get(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<double>::elements((uint64_t)a1) + 8 * a2;
}

void sub_191D3D1AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<double>::~RepeatedField(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (*(int *)(a1 + 4) >= 1)
  {
    v2 = google::protobuf::RepeatedField<double>::elements(a1);
    v4 = *(_QWORD *)(v2 - 8);
    v3 = (void *)(v2 - 8);
    if (!v4)
      operator delete(v3);
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<double>::elements(uint64_t a1)
{
  std::string *v2;
  char v4;
  std::string v5[2];

  if (*(int *)(a1 + 4) <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    v2 = google::protobuf::internal::LogMessage::operator<<(v5, "CHECK failed: (total_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
  }
  return *(_QWORD *)(a1 + 8);
}

void sub_191D3D284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<double>::MergeFrom(int *a1, int *a2)
{
  std::string *v4;
  int v5;
  void *v6;
  std::string *v7;
  const void *v8;
  char v9;
  std::string v10[2];

  if (a2 == a1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    v4 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (&other) != (this): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (*a2)
  {
    v5 = *a1;
    google::protobuf::RepeatedField<double>::Reserve(a1, *a1 + *a2);
    google::protobuf::RepeatedField<double>::AddNAlreadyReserved((uint64_t)a1, *a2);
    v6 = (void *)google::protobuf::RepeatedField<double>::Mutable(a1, v5);
    if (*a2 <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (index) < (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    }
    v8 = (const void *)google::protobuf::RepeatedField<double>::elements((uint64_t)a2);
    memcpy(v6, v8, 8 * *a2);
  }
}

void sub_191D3D3A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedPtrField<std::string>::~RepeatedPtrField(google::protobuf::internal::RepeatedPtrFieldBase *a1)
{
  google::protobuf::internal::RepeatedPtrFieldBase::Destroy<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(a1);
  google::protobuf::internal::RepeatedPtrFieldBase::~RepeatedPtrFieldBase(a1);
}

void google::protobuf::internal::RepeatedPtrFieldBase::Destroy<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(_QWORD *a1)
{
  unsigned int *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (unsigned int *)a1[2];
  if (v2 && !*a1)
  {
    v3 = (uint64_t *)(v2 + 2);
    v4 = *v2;
    if ((int)v4 >= 1)
    {
      do
      {
        v5 = *v3;
        if (*v3)
        {
          if (*(char *)(v5 + 23) < 0)
            operator delete(*(void **)v5);
          MEMORY[0x19401E994](v5, 0x1012C40EC159624);
        }
        ++v3;
        --v4;
      }
      while (v4);
      v2 = (unsigned int *)a1[2];
    }
    operator delete(v2);
  }
  a1[2] = 0;
}

unsigned int *google::protobuf::internal::RepeatedPtrFieldBase::Reserve(unsigned int *this, int a2)
{
  unsigned int v2;
  BOOL v3;
  int v4;

  v2 = this[2];
  v3 = __OFSUB__(a2, v2);
  v4 = a2 - v2;
  if (!((v4 < 0) ^ v3 | (v4 == 0)))
    return google::protobuf::internal::RepeatedPtrFieldBase::InternalExtend((google::protobuf::internal::RepeatedPtrFieldBase *)this, v4);
  return this;
}

unsigned int *google::protobuf::internal::RepeatedPtrFieldBase::InternalExtend(google::protobuf::internal::RepeatedPtrFieldBase *this, int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int *v5;
  uint64_t v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v11;
  unsigned int *AlignedNoHook;
  uint64_t v13;

  v2 = *((_DWORD *)this + 2);
  v3 = *((_DWORD *)this + 3);
  v4 = v2 + a2;
  v5 = (unsigned int *)*((_QWORD *)this + 2);
  if (v3 < v2 + a2)
  {
    v7 = *(_QWORD *)this;
    v8 = 2 * v3;
    if (2 * v3 <= v4)
      v8 = v4;
    if (v8 <= 4)
      v9 = 4;
    else
      v9 = v8;
    v10 = 8 * v9;
    if (v7)
    {
      v11 = (v10 + 15) & 0x7FFFFFFF8;
      if ((*(_BYTE *)(v7 + 24) & 1) != 0)
        (*(void (**)(_QWORD, _QWORD, unint64_t))(**(_QWORD **)(*(_QWORD *)(v7 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v7 + 32) + 32), MEMORY[0x1E0DE4EC8], v11);
      AlignedNoHook = (unsigned int *)google::protobuf::Arena::AllocateAlignedNoHook((google::protobuf::Arena *)v7, v11);
    }
    else
    {
      AlignedNoHook = (unsigned int *)operator new(v10 + 8);
    }
    *((_QWORD *)this + 2) = AlignedNoHook;
    *((_DWORD *)this + 3) = v9;
    if (v5 && (v13 = *v5, (int)v13 >= 1))
    {
      memcpy(AlignedNoHook + 2, v5 + 2, 8 * v13);
      AlignedNoHook = (unsigned int *)*((_QWORD *)this + 2);
      *AlignedNoHook = *v5;
      if (!v7)
        goto LABEL_17;
    }
    else
    {
      *AlignedNoHook = 0;
      if (!v7)
      {
LABEL_17:
        operator delete(v5);
        AlignedNoHook = (unsigned int *)*((_QWORD *)this + 2);
      }
    }
    v2 = *((_DWORD *)this + 2);
    v5 = AlignedNoHook;
  }
  return &v5[2 * v2 + 2];
}

uint64_t sentencepiece::MemoryMappedModelProto::MemoryMappedModelProto(uint64_t a1, _DWORD *a2, unint64_t a3)
{
  uint64_t *v6;
  _DWORD *v8;

  *(_QWORD *)a1 = &off_1E2DF0BB8;
  *(_QWORD *)(a1 + 16) = &off_1E2DF1000;
  *(_DWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = &off_1E2DF1000;
  *(_DWORD *)(a1 + 40) = 0;
  v6 = (uint64_t *)(a1 + 88);
  sentencepiece::util::Status::Status((_QWORD *)(a1 + 88));
  sentencepiece::MemoryMappedModelProto::Init(a1, a2, a3, (sentencepiece::util::Status *)&v8);
  sentencepiece::util::Status::operator=(v6, &v8);
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v8);
  return a1;
}

void sub_191D3D634(_Unwind_Exception *a1, uint64_t a2, ...)
{
  sentencepiece::util::Status *v2;
  va_list va;

  va_start(va, a2);
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)va);
  sentencepiece::util::Status::~Status(v2);
  _Unwind_Resume(a1);
}

_QWORD *sentencepiece::MemoryMappedModelProto::Init@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X1>, unint64_t a3@<X2>, sentencepiece::util::Status *a4@<X8>)
{
  _QWORD *result;
  int v7;
  unint64_t v8;
  _QWORD *v9;
  int v10;
  int v11;
  int v12;
  _DWORD *v13;
  unint64_t v14;

  v13 = a2;
  v14 = a3;
  v12 = 0;
  result = sentencepiece::mmap_util::DecodePrefix<unsigned int>(a2, a3, &v12, a4);
  if (!*(_QWORD *)a4)
  {
    sentencepiece::util::Status::~Status(a4);
    result = sentencepiece::mmap_util::RemovePrefix(&v13, 4uLL, a4);
    if (!*(_QWORD *)a4)
    {
      sentencepiece::util::Status::~Status(a4);
      *(_DWORD *)(a1 + 8) = v12;
      v11 = 0;
      result = sentencepiece::mmap_util::DecodePrefix<unsigned int>(v13, v14, &v11, a4);
      if (!*(_QWORD *)a4)
      {
        sentencepiece::util::Status::~Status(a4);
        result = sentencepiece::mmap_util::RemovePrefix(&v13, 4uLL, a4);
        if (!*(_QWORD *)a4)
        {
          sentencepiece::util::Status::~Status(a4);
          *(_DWORD *)(a1 + 24) = v11;
          v10 = 0;
          result = sentencepiece::mmap_util::DecodePrefix<unsigned int>(v13, v14, &v10, a4);
          if (!*(_QWORD *)a4)
          {
            sentencepiece::util::Status::~Status(a4);
            result = sentencepiece::mmap_util::RemovePrefix(&v13, 4uLL, a4);
            if (!*(_QWORD *)a4)
            {
              sentencepiece::util::Status::~Status(a4);
              v7 = v10;
              *(_DWORD *)(a1 + 48) = 0;
              *(_DWORD *)(a1 + 40) = v7;
              result = sentencepiece::mmap_util::DecodePrefix<int>(v13, v14, (_DWORD *)(a1 + 48), a4);
              if (!*(_QWORD *)a4)
              {
                sentencepiece::util::Status::~Status(a4);
                result = sentencepiece::mmap_util::RemovePrefix(&v13, 4uLL, a4);
                if (!*(_QWORD *)a4)
                {
                  sentencepiece::util::Status::~Status(a4);
                  *(_QWORD *)(a1 + 56) = v13;
                  v8 = sentencepiece::mmap_util::RoundUp((sentencepiece::mmap_util *)*(int *)(a1 + 48), 4uLL);
                  result = sentencepiece::mmap_util::RemovePrefix(&v13, v8, a4);
                  if (!*(_QWORD *)a4)
                  {
                    sentencepiece::util::Status::~Status(a4);
                    *(_QWORD *)(a1 + 64) = v13;
                    result = sentencepiece::mmap_util::RemovePrefix(&v13, 4 * *(int *)(a1 + 48), a4);
                    if (!*(_QWORD *)a4)
                    {
                      sentencepiece::util::Status::~Status(a4);
                      *(_QWORD *)(a1 + 72) = v13;
                      result = sentencepiece::mmap_util::RemovePrefix(&v13, 4 * *(int *)(a1 + 48) + 20, a4);
                      if (!*(_QWORD *)a4)
                      {
                        sentencepiece::util::Status::~Status(a4);
                        *(_QWORD *)(a1 + 80) = v13;
                        return sentencepiece::util::Status::Status(v9);
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
  return result;
}

void sentencepiece::MemoryMappedNormalizerSpec::~MemoryMappedNormalizerSpec(sentencepiece::MemoryMappedNormalizerSpec *this)
{
  JUMPOUT(0x19401E994);
}

uint64_t sentencepiece::MemoryMappedNormalizerSpec::add_dummy_prefix(sentencepiece::MemoryMappedNormalizerSpec *this)
{
  return *((_DWORD *)this + 2) & 1;
}

uint64_t sentencepiece::MemoryMappedNormalizerSpec::remove_extra_whitespaces(sentencepiece::MemoryMappedNormalizerSpec *this)
{
  return (*((unsigned __int8 *)this + 8) >> 1) & 1;
}

uint64_t sentencepiece::MemoryMappedNormalizerSpec::escape_whitespaces(sentencepiece::MemoryMappedNormalizerSpec *this)
{
  return (*((unsigned __int8 *)this + 8) >> 2) & 1;
}

uint64_t sentencepiece::MemoryMappedNormalizerSpec::add_suffix_space(sentencepiece::MemoryMappedNormalizerSpec *this)
{
  return (*((unsigned __int8 *)this + 8) >> 3) & 1;
}

void sentencepiece::MemoryMappedModelProto::~MemoryMappedModelProto(sentencepiece::MemoryMappedModelProto *this)
{
  *(_QWORD *)this = &off_1E2DF0BB8;
  sentencepiece::util::Status::~Status((sentencepiece::MemoryMappedModelProto *)((char *)this + 88));
}

{
  *(_QWORD *)this = &off_1E2DF0BB8;
  sentencepiece::util::Status::~Status((sentencepiece::MemoryMappedModelProto *)((char *)this + 88));
  JUMPOUT(0x19401E994);
}

uint64_t sentencepiece::MemoryMappedModelProto::PieceSize(sentencepiece::MemoryMappedModelProto *this)
{
  return *((unsigned int *)this + 12);
}

const char *sentencepiece::MemoryMappedModelProto::UnkSurface(sentencepiece::MemoryMappedModelProto *this)
{
  const char *v1;

  v1 = (const char *)(*((_QWORD *)this + 10) + **((unsigned int **)this + 9));
  strlen(v1);
  return v1;
}

const char *sentencepiece::MemoryMappedModelProto::UnkPiece(sentencepiece::MemoryMappedModelProto *this)
{
  const char *v1;

  v1 = (const char *)(*((_QWORD *)this + 10) + *(unsigned int *)(*((_QWORD *)this + 9) + 4));
  strlen(v1);
  return v1;
}

const char *sentencepiece::MemoryMappedModelProto::BosPiece(sentencepiece::MemoryMappedModelProto *this)
{
  const char *v1;

  v1 = (const char *)(*((_QWORD *)this + 10) + *(unsigned int *)(*((_QWORD *)this + 9) + 8));
  strlen(v1);
  return v1;
}

const char *sentencepiece::MemoryMappedModelProto::EosPiece(sentencepiece::MemoryMappedModelProto *this)
{
  const char *v1;

  v1 = (const char *)(*((_QWORD *)this + 10) + *(unsigned int *)(*((_QWORD *)this + 9) + 12));
  strlen(v1);
  return v1;
}

const char *sentencepiece::MemoryMappedModelProto::PadPiece(sentencepiece::MemoryMappedModelProto *this)
{
  const char *v1;

  v1 = (const char *)(*((_QWORD *)this + 10) + *(unsigned int *)(*((_QWORD *)this + 9) + 16));
  strlen(v1);
  return v1;
}

uint64_t sentencepiece::MemoryMappedModelProto::ByteFallback(sentencepiece::MemoryMappedModelProto *this)
{
  return *((_DWORD *)this + 2) & 1;
}

uint64_t sentencepiece::MemoryMappedModelProto::HasUnkSurface(sentencepiece::MemoryMappedModelProto *this)
{
  return (*((unsigned __int8 *)this + 8) >> 1) & 1;
}

uint64_t sentencepiece::MemoryMappedModelProto::GetModelType(sentencepiece::MemoryMappedModelProto *this)
{
  return *((_DWORD *)this + 2) >> 30;
}

const char *sentencepiece::MemoryMappedModelProto::IdToPiece(sentencepiece::MemoryMappedModelProto *this, int a2)
{
  const char *v2;

  v2 = (const char *)(*((_QWORD *)this + 10) + *(unsigned int *)(*((_QWORD *)this + 9) + 4 * (a2 + 5)));
  strlen(v2);
  return v2;
}

float sentencepiece::MemoryMappedModelProto::GetScore(sentencepiece::MemoryMappedModelProto *this, int a2)
{
  return *(float *)(*((_QWORD *)this + 8) + 4 * a2);
}

BOOL sentencepiece::MemoryMappedModelProto::PieceIsNormal(sentencepiece::MemoryMappedModelProto *this, int a2)
{
  return *(_BYTE *)(*((_QWORD *)this + 7) + a2) == 1;
}

BOOL sentencepiece::MemoryMappedModelProto::PieceIsUnknown(sentencepiece::MemoryMappedModelProto *this, int a2)
{
  return *(_BYTE *)(*((_QWORD *)this + 7) + a2) == 2;
}

BOOL sentencepiece::MemoryMappedModelProto::PieceIsControl(sentencepiece::MemoryMappedModelProto *this, int a2)
{
  return *(_BYTE *)(*((_QWORD *)this + 7) + a2) == 3;
}

BOOL sentencepiece::MemoryMappedModelProto::PieceIsUnused(sentencepiece::MemoryMappedModelProto *this, int a2)
{
  return *(_BYTE *)(*((_QWORD *)this + 7) + a2) == 4;
}

BOOL sentencepiece::MemoryMappedModelProto::PieceIsUserDefined(sentencepiece::MemoryMappedModelProto *this, int a2)
{
  return *(_BYTE *)(*((_QWORD *)this + 7) + a2) == 5;
}

BOOL sentencepiece::MemoryMappedModelProto::PieceIsByte(sentencepiece::MemoryMappedModelProto *this, int a2)
{
  return *(_BYTE *)(*((_QWORD *)this + 7) + a2) == 6;
}

uint64_t sentencepiece::MemoryMappedModelProto::NormalizerSpec(sentencepiece::MemoryMappedModelProto *this)
{
  return (uint64_t)this + 16;
}

uint64_t sentencepiece::MemoryMappedModelProto::DenormalizerSpec(sentencepiece::MemoryMappedModelProto *this)
{
  return (uint64_t)this + 32;
}

char *nlp::temporaryFile@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  const char *v5;
  char *v6;

  if (*(char *)(a1 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)a2, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
    *(_QWORD *)(a2 + 16) = *(_QWORD *)(a1 + 16);
  }
  v3 = *(unsigned __int8 *)(a2 + 23);
  if ((v3 & 0x80u) != 0)
    v3 = *(_QWORD *)(a2 + 8);
  if (!v3)
  {
    v4 = getenv("TMPDIR");
    if (v4)
      v5 = v4;
    else
      v5 = "/tmp";
    MEMORY[0x19401E64C](a2, v5);
  }
  std::string::append((std::string *)a2, "/nlptemp-XXXXXX");
  if (*(char *)(a2 + 23) >= 0)
    v6 = (char *)a2;
  else
    v6 = *(char **)a2;
  return mktemp(v6);
}

void sub_191D3DBA8(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t _MRLNeuralNetworkGetOutput()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return CoreNLP::KoreanLineBreakConnector::connectionRules(v0);
}

void CoreNLP::KoreanLineBreakConnector::connectionRules(uint64_t a1)
{
  _QWORD *v1;
  char v2;
  uint64_t v3;

  do
  {
    v1 = (_QWORD *)OUTLINED_FUNCTION_1(a1);
    if (v2)
    {
      v1 = (_QWORD *)OUTLINED_FUNCTION_4();
    }
    else
    {
      if (!v1)
        goto LABEL_6;
      v3 = 5;
    }
    OUTLINED_FUNCTION_0(v1, v3);
LABEL_6:
    a1 = OUTLINED_FUNCTION_3();
  }
  while (!v2);
  OUTLINED_FUNCTION_2();
}

void CoreNLP::AbstractEmbedding::fillWordFragmentVectors(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_191C5D000, log, OS_LOG_TYPE_ERROR, "NLEmbeddingShape_Batch_Components_Words_Fragments shape is supported by fragment based embedding type", v1, 2u);
}

void getLocaleAsString()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_191C5D000, v0, v1, "Received unsupported CFType for locale.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void getModelNameAsString()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_191C5D000, v0, v1, "Received unsupported model format. Could be either Montreal or Espresso", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_191C5D000, v0, v1, "Received unsupported engine format. Could be either CPU or ANE", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void CoreLMCreate_cold_1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(_QWORD *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_191C5D000, log, OS_LOG_TYPE_DEBUG, "Created vocab with size %zu", buf, 0xCu);
}

void CoreLMCreate_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_191C5D000, v0, (uint64_t)v0, "%s", v1);
  OUTLINED_FUNCTION_5();
}

void CoreLMCreate_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_191C5D000, v1, OS_LOG_TYPE_ERROR, "%s=%@", v2, 0x16u);
  OUTLINED_FUNCTION_5();
}

void CoreLMCreate_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_191C5D000, v0, v1, "%s", v2);
  OUTLINED_FUNCTION_5();
}

void CoreLMCopyTextForTokenIds_cold_1(uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    *(_QWORD *)(a1 + 8) = v2;
    operator delete(v2);
  }
}

void CoreLMCopyVocabulary_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_191C5D000, v0, v1, "vocabulary ids are not incremental from 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void CoreLMUpdateWithContext_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_191C5D000, v0, OS_LOG_TYPE_DEBUG, "RECEIVED EMPTY CONTEXT. No update to the language model state.", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

void CoreLMCopyPredictions_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_191C5D000, v0, v1, "Missing sampling method specified by kCoreLMSamplingMethodKey", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void CoreLMCopyPredictions_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_191C5D000, v0, v1, "Missing kCoreLMSamplingMaxLengthKey\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void CoreLMCopyPredictions_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_191C5D000, v0, v1, "Missing kCoreLMSamplingNumberKey\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void CoreLMCopyPredictions_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_191C5D000, v0, v1, "Invalid sampling method\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void CoreLMCopyPredictions_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_191C5D000, v0, v1, "Missing kCoreLMSamplingTopPKey\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void CoreLMCopyPredictions_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_191C5D000, v0, v1, "Missing kCoreLMSamplingTopKKey\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void CoreNLP::AbstractEmbedding::processModelConfig(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_191C5D000, MEMORY[0x1E0C81028], a3, "modelInfo.plist for embedding model is expected to contain an entry for batch size 1 in the SupportedBatchSizesAndSequenceLengths config", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

{
  OUTLINED_FUNCTION_0_0(&dword_191C5D000, MEMORY[0x1E0C81028], a3, "modelInfo.plist should have keys EmbeddingNodeNameOnCPU, EmbeddingNodeNameOnANE, EmbeddingDimension, SupportedBatchSizesAndSequenceLengths", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

{
  OUTLINED_FUNCTION_0_0(&dword_191C5D000, MEMORY[0x1E0C81028], a3, "modelInfo.plist not found in the embedding model bundle", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void NLEmbeddingSubwordVocabCreate_cold_1(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  v2 = 136315138;
  v3 = v1;
  _os_log_error_impl(&dword_191C5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to load sentence piece tokenizer: %s", (uint8_t *)&v2, 0xCu);
}

void NLEmbeddingSubwordVocabCreate_cold_2()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_191C5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to load sentence piece tokenizer", v0, 2u);
}

void CoreNLP::EmbeddingManager::EmbeddingManager()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_191C5D000, MEMORY[0x1E0C81028], v0, "Unable to locate Asset for sentence embedding model for local %s.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_191C5D000, MEMORY[0x1E0C81028], v0, "Unable to locate Asset for contextual word embedding model for local %s.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_191C5D000, MEMORY[0x1E0C81028], v0, "Unable to locate Asset for multilingual BERT embedding with '%s' locale.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void CoreNLP::EmbeddingManager::EmbeddingManager(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_191C5D000, MEMORY[0x1E0C81028], a3, "Missing model path for multilingual BERT.", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0_0(&dword_191C5D000, MEMORY[0x1E0C81028], a3, "ELMo arcitecture is not supported on ANE. Loading on CPU instead.", a5, a6, a7, a8, 0);
}

void CoreNLP::EmbeddingManager::EmbeddingManager(char *a1, uint8_t *buf, uint64_t a3)
{
  char *v4;

  if (a1[23] >= 0)
    v4 = a1;
  else
    v4 = *(char **)a1;
  *(_DWORD *)buf = 134218242;
  *(_QWORD *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2080;
  *(_QWORD *)(buf + 14) = v4;
  _os_log_error_impl(&dword_191C5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to load model for version '%ld', architecture '%s' .", buf, 0x16u);
  if (a1[23] < 0)
    operator delete(*(void **)a1);
}

void CoreNLP::EmbeddingManager::systemAssetName()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_191C5D000, MEMORY[0x1E0C81028], v0, "Unsupported locale %s.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void NLGazetteerCreate_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  v4 = 136315138;
  v5 = v3;
  _os_log_error_impl(&dword_191C5D000, a2, OS_LOG_TYPE_ERROR, "failed to create gazetteer: %s", (uint8_t *)&v4, 0xCu);
}

void BloomFilter::loadFromBuffer(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_191C5D000, a2, OS_LOG_TYPE_ERROR, "bloom filter buffer is too short: %zu", (uint8_t *)&v2, 0xCu);
}

void BloomFilter::loadFromBuffer(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_191C5D000, a1, a3, "failed to read V1 header", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0_0(&dword_191C5D000, a1, a3, "failed to read V2 header", a5, a6, a7, a8, 0);
}

uint64_t ___ZL21getMLCTensorDataClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL25getMLCLSTMDescriptorClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL25getMLCLSTMDescriptorClassv_block_invoke_cold_1()
{
  abort_report_np();
  return ___ZL31getMLCActivationDescriptorClassv_block_invoke_cold_1();
}

uint64_t ___ZL31getMLCActivationDescriptorClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL20getMLCLSTMLayerClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL20getMLCLSTMLayerClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL17getMLCTensorClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL17getMLCTensorClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL27getMLCTensorDescriptorClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL27getMLCTensorDescriptorClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL32getMLCConvolutionDescriptorClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL32getMLCConvolutionDescriptorClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL27getMLCConvolutionLayerClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL27getMLCConvolutionLayerClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL26getMLCArithmeticLayerClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL26getMLCArithmeticLayerClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL23getMLCDropoutLayerClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL23getMLCDropoutLayerClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL25getMLCLossDescriptorClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL25getMLCLossDescriptorClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL20getMLCLossLayerClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL20getMLCLossLayerClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL30getMLCOptimizerDescriptorClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL30getMLCOptimizerDescriptorClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL24getMLCAdamOptimizerClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL24getMLCAdamOptimizerClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL24getMLCTrainingGraphClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL24getMLCTrainingGraphClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL26getMLCTensorParameterClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL26getMLCTensorParameterClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL23getMLCSoftmaxLayerClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL23getMLCSoftmaxLayerClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL25getMLCInferenceGraphClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL25getMLCInferenceGraphClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL17getMLCDeviceClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL17getMLCDeviceClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL16getMLCGraphClassv_block_invoke_cold_1(v0);
}

void ___ZL16getMLCGraphClassv_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;

  v0 = abort_report_np();
  CoreNLP::EmotionModel::CreateModel(v0, v1, v2);
}

void CoreNLP::EmotionModel::CreateModel(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_191C5D000, a2, a3, "Failed to locate emotion model for '%s' locale", (uint8_t *)a2);
}

void CoreNLP::EmotionModel::vinference(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_191C5D000, a2, a3, "Failed to load contextual embeddings for '%s' locale", (uint8_t *)a2);
}

void CoreNLP::EmotionModel::vinference(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_191C5D000, log, OS_LOG_TYPE_DEBUG, "Tokenization: %s", buf, 0xCu);
}

void ___ZN7CoreNLP11OrthographyC2EPK10__CFString7CFRangeb_block_invoke_cold_1(uint8_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 16))(a2);
  *(_DWORD *)a1 = 136315138;
  *a3 = v5;
  _os_log_error_impl(&dword_191C5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unexpected exception %s: ", a1, 0xCu);
}

void ___ZN7CoreNLP11OrthographyC2EPK10__CFString7CFRangeb_block_invoke_cold_2(uint8_t *buf, _BYTE *a2)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_191C5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unexpected unknown exception caught in Orthography", buf, 2u);
}

void corelm::TokenListVocabulary::idToToken()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1(&dword_191C5D000, MEMORY[0x1E0C81028], v0, "%s", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_5();
}

void CoreNLP::CRFModel::load(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_191C5D000, a2, a3, "CRFModel V2 file for %{public}d scheme too small", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0_3(&dword_191C5D000, a2, a3, "CRFModel V3 file for %{public}d scheme too small", a5, a6, a7, a8, 0);
}

void CoreNLP::Gazetteer::loadBloomFilters(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_4(&dword_191C5D000, a1, a3, "Gazetteer buffer is too short", v3);
}

{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_4(&dword_191C5D000, a1, a3, "Failed to read label from Gazetter buffer", v3);
}

void CoreNLP::Gazetteer::loadBloomFilters(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_4(&dword_191C5D000, a3, (uint64_t)a3, "Failed to read filter size from Gazetteer buffer", a1);
}

{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_4(&dword_191C5D000, a3, (uint64_t)a3, "Failed to read filter from Gazetteer buffer", a1);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CC0]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D10](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1E0C97D30](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D78](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DD0](theArray, idx, value);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x1E0C98040](locArray, prefArray);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1E0C98080](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1E0C980E8](bundleID);
}

uint64_t CFBurstTrieAddUTF8String()
{
  return MEMORY[0x1E0C981C8]();
}

uint64_t CFBurstTrieContainsUTF8String()
{
  return MEMORY[0x1E0C981D8]();
}

uint64_t CFBurstTrieCreate()
{
  return MEMORY[0x1E0C981E0]();
}

uint64_t CFBurstTrieCreateFromMapBytes()
{
  return MEMORY[0x1E0C981F0]();
}

uint64_t CFBurstTrieRelease()
{
  return MEMORY[0x1E0C98208]();
}

uint64_t CFBurstTrieSerializeWithFileDescriptor()
{
  return MEMORY[0x1E0C98218]();
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982E8](alloc, theString);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982F0](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1E0C98320](theSet, theChar);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x1E0C983B0](allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98538](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C985F8](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFArrayRef CFLocaleCopyPreferredLanguages(void)
{
  return (CFArrayRef)MEMORY[0x1E0C98790]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1E0C98798](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLanguageIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987A0](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987D8](locale);
}

CFTypeID CFLocaleGetTypeID(void)
{
  return MEMORY[0x1E0C987F8]();
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x1E0C98800](locale, key);
}

uint64_t CFLog()
{
  return MEMORY[0x1E0C98808]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1E0C989A8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
  MEMORY[0x1E0C98EE8](theString, chars, numChars);
}

void CFStringCapitalize(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x1E0C98F00](theString, locale);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1E0C98FE8](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FF8](alloc, chars, numChars, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99030](alloc, str, range.location, range.length);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
  MEMORY[0x1E0C99038](theString, range.location, range.length);
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C99058](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1E0C99060](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1E0C99068](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1E0C990B0](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

void CFStringGetParagraphBounds(CFStringRef string, CFRange range, CFIndex *parBeginIndex, CFIndex *parEndIndex, CFIndex *contentsEndIndex)
{
  MEMORY[0x1E0C99140](string, range.location, range.length, parBeginIndex, parEndIndex, contentsEndIndex);
}

CFRange CFStringGetRangeOfComposedCharactersAtIndex(CFStringRef theString, CFIndex theIndex)
{
  CFIndex v2;
  CFIndex v3;
  CFRange result;

  v2 = MEMORY[0x1E0C99160](theString, theIndex);
  result.length = v3;
  result.location = v2;
  return result;
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1E0C99180](theString, prefix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x1E0C991D0](theString, locale);
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
  MEMORY[0x1E0C991D8](theString, theForm);
}

uint64_t CFStringOpenUText()
{
  return MEMORY[0x1E0C991E0]();
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x1E0C99248](string, range, transform, reverse);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1E0C992D8](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1E0C992F8](url);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C99318](anURL);
}

CFURLRef CFURLCreateWithBytes(CFAllocatorRef allocator, const UInt8 *URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C99418](allocator, URLBytes, length, *(_QWORD *)&encoding, baseURL);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C99490](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C994A0](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1E0C994B8]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t ThaiTokenizerAdvanceToNextToken()
{
  return MEMORY[0x1E0DE3B58]();
}

uint64_t ThaiTokenizerCreate()
{
  return MEMORY[0x1E0DE3B60]();
}

uint64_t ThaiTokenizerDestroy()
{
  return MEMORY[0x1E0DE3B68]();
}

uint64_t ThaiTokenizerGetCurrentTokenRange()
{
  return MEMORY[0x1E0DE3B70]();
}

uint64_t ThaiTokenizerGoToTokenAtIndex()
{
  return MEMORY[0x1E0DE3B78]();
}

uint64_t ThaiTokenizerSetStringWithRange()
{
  return MEMORY[0x1E0DE3B80]();
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

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x1E0DE41C8](this, __c, __pos);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x1E0DE41D8](this, __s);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1E0DE41F0]();
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x1E0DE4208](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__parent_path(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x1E0DE4218](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4298](this, a2);
}

void std::out_of_range::~out_of_range(std::out_of_range *this)
{
  MEMORY[0x1E0DE42E0](this);
}

{
  MEMORY[0x1E0DE42E8](this);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4308](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x1E0DE4320](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4310](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x1E0DE4328](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x1E0DE4338](this);
}

{
  MEMORY[0x1E0DE4340](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

void std::istrstream::~istrstream(std::istrstream *this)
{
  MEMORY[0x1E0DE4398](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4408](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4420](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1E0DE4438](this, __n, __c);
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

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4470](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x1E0DE4480](this, __n, __c);
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4488](this, __pos, __n1, __s);
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s, std::string::size_type __n2)
{
  return (std::string *)MEMORY[0x1E0DE4490](this, __pos, __n1, __s, __n2);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
  MEMORY[0x1E0DE44A8](this, __requested_capacity);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x1E0DE44B0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1E0DE44C8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

std::strstreambuf *__cdecl std::strstreambuf::strstreambuf(std::strstreambuf *this, const char *__gnext, std::streamsize __n)
{
  return (std::strstreambuf *)MEMORY[0x1E0DE4548](this, __gnext, __n);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x1E0DE4590]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x1E0DE4598]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x1E0DE45A8]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x1E0DE45B0]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x1E0DE45D0]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x1E0DE45E8]();
}

uint64_t std::istream::tellg()
{
  return MEMORY[0x1E0DE45F0]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x1E0DE4608]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x1E0DE4628]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x1E0DE4648]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1E0DE4698]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1E0DE46A0]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x1E0DE46A8]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1E0DE46C8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE46D8]();
}

{
  return MEMORY[0x1E0DE46E0]();
}

{
  return MEMORY[0x1E0DE46E8]();
}

{
  return MEMORY[0x1E0DE46F8]();
}

{
  return MEMORY[0x1E0DE4700]();
}

{
  return MEMORY[0x1E0DE4708]();
}

{
  return MEMORY[0x1E0DE4710]();
}

{
  return MEMORY[0x1E0DE4718]();
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return (std::random_device *)MEMORY[0x1E0DE4770](this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
  MEMORY[0x1E0DE4778](this);
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return MEMORY[0x1E0DE4780](this);
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1E0DE47A8]();
}

uint64_t std::ofstream::open()
{
  return MEMORY[0x1E0DE47B8]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

const std::error_category *std::iostream_category(void)
{
  return (const std::error_category *)MEMORY[0x1E0DE4880]();
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

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x1E0DE4A48](a1, __ec);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA0](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA8](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x1E0DE4AB8](this);
}

uint64_t std::__sort<std::__less<int,int> &,int *>()
{
  return MEMORY[0x1E0DE4AF8]();
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

std::ios_base::failure *__cdecl std::ios_base::failure::failure(std::ios_base::failure *this, const char *__msg, const std::error_code *__ec)
{
  return (std::ios_base::failure *)MEMORY[0x1E0DE4CA0](this, __msg, __ec);
}

std::ios_base::failure *__cdecl std::ios_base::failure::failure(std::ios_base::failure *this, const std::string *__msg, const std::error_code *__ec)
{
  return (std::ios_base::failure *)MEMORY[0x1E0DE4CA8](this, __msg, __ec);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, float __val)
{
  return (std::string *)MEMORY[0x1E0DE4D50](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1E0DE4D58](retstr, *(_QWORD *)&__val);
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
  return off_1E2DEEA50();
}

void operator delete(void *__p)
{
  off_1E2DEEA58(__p);
}

void operator delete(void *__p, std::align_val_t a2)
{
  off_1E2DEEA60(__p, a2);
}

uint64_t operator delete()
{
  return off_1E2DEEA68();
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_1E2DEEA70(__sz);
}

uint64_t operator new[]()
{
  return off_1E2DEEA78();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E2DEEA80(__sz);
}

void *__cdecl operator new(size_t __sz, std::align_val_t a2)
{
  return (void *)off_1E2DEEA88(__sz, a2);
}

uint64_t operator new()
{
  return off_1E2DEEA90();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1E0C80A98](lpfunc, obj, lpdso_handle);
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

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)MEMORY[0x1E0DE50A8](a1);
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

void __cxa_rethrow(void)
{
  MEMORY[0x1E0DE50D0]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1E0DE50E0](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

float __exp10f(float a1)
{
  float result;

  MEMORY[0x1E0C80AD0](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C78](*(_QWORD *)&a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

uint64_t crfsuite_create_instance()
{
  return MEMORY[0x1E0DDFD70]();
}

uint64_t crfsuite_data_append()
{
  return MEMORY[0x1E0DDFD78]();
}

uint64_t crfsuite_data_finish()
{
  return MEMORY[0x1E0DDFD80]();
}

uint64_t crfsuite_data_init()
{
  return MEMORY[0x1E0DDFD88]();
}

uint64_t crfsuite_dictionary_get_count()
{
  return MEMORY[0x1E0DDFD90]();
}

uint64_t crfsuite_dictionary_get_id_for_string()
{
  return MEMORY[0x1E0DDFD98]();
}

uint64_t crfsuite_dictionary_release()
{
  return MEMORY[0x1E0DDFDA0]();
}

uint64_t crfsuite_instance_finish()
{
  return MEMORY[0x1E0DDFDA8]();
}

uint64_t crfsuite_instance_init_n()
{
  return MEMORY[0x1E0DDFDB0]();
}

uint64_t crfsuite_item_append_attribute()
{
  return MEMORY[0x1E0DDFDB8]();
}

uint64_t crfsuite_item_init_with_capacity()
{
  return MEMORY[0x1E0DDFDC0]();
}

uint64_t crfsuite_model_create_from_buffer()
{
  return MEMORY[0x1E0DDFDC8]();
}

uint64_t crfsuite_model_get_tagger()
{
  return MEMORY[0x1E0DDFDD0]();
}

uint64_t crfsuite_model_release()
{
  return MEMORY[0x1E0DDFDD8]();
}

uint64_t crfsuite_tagger_marginal_point()
{
  return MEMORY[0x1E0DDFDE0]();
}

uint64_t crfsuite_tagger_set_instance()
{
  return MEMORY[0x1E0DDFDE8]();
}

uint64_t crfsuite_tagger_viterbi()
{
  return MEMORY[0x1E0DDFDF0]();
}

uint64_t crfsuite_trainer_get_params()
{
  return MEMORY[0x1E0DDFDF8]();
}

uint64_t crfsuite_trainer_release()
{
  return MEMORY[0x1E0DDFE00]();
}

uint64_t crfsuite_trainer_set_message_callback()
{
  return MEMORY[0x1E0DDFE08]();
}

uint64_t crfsuite_trainer_train_model_to_file_pointer()
{
  return MEMORY[0x1E0DDFE10]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x1E0C83298](a1);
  return result;
}

long double expm1(long double __x)
{
  long double result;

  MEMORY[0x1E0C832A0](__x);
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

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
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

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1E0C83530](a1, a2, *(_QWORD *)&a3);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1E0C83580](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

uint64_t germantok_tokenize()
{
  return MEMORY[0x1E0DE5868]();
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

uint64_t langid_consume_string()
{
  return MEMORY[0x1E0DE6AE8]();
}

uint64_t langid_create()
{
  return MEMORY[0x1E0DE6AF0]();
}

uint64_t langid_dispose()
{
  return MEMORY[0x1E0DE6AF8]();
}

uint64_t langid_highest_score()
{
  return MEMORY[0x1E0DE6B00]();
}

uint64_t langid_languagecode()
{
  return MEMORY[0x1E0DE6B08]();
}

uint64_t langid_numlanguages()
{
  return MEMORY[0x1E0DE6B10]();
}

uint64_t langid_reset()
{
  return MEMORY[0x1E0DE6B18]();
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

float log10f(float a1)
{
  float result;

  MEMORY[0x1E0C83BC8](a1);
  return result;
}

float log1pf(float a1)
{
  float result;

  MEMORY[0x1E0C83BD8](a1);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x1E0C83C00](a1);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

uint64_t mecab_destroy()
{
  return MEMORY[0x1E0DE6DD0]();
}

uint64_t mecab_get_feature()
{
  return MEMORY[0x1E0DE6DD8]();
}

uint64_t mecab_get_lastname_length()
{
  return MEMORY[0x1E0DE6DE0]();
}

uint64_t mecab_nbest_init2()
{
  return MEMORY[0x1E0DE6DE8]();
}

uint64_t mecab_nbest_next_tonode()
{
  return MEMORY[0x1E0DE6DF0]();
}

uint64_t mecab_new2()
{
  return MEMORY[0x1E0DE6E00]();
}

uint64_t mecab_sparse_tonode2()
{
  return MEMORY[0x1E0DE6E08]();
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

char *__cdecl mktemp(char *a1)
{
  return (char *)MEMORY[0x1E0C841C0](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int openat_authenticated_np(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x1E0C844A8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C844C0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84F68](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int rand(void)
{
  return MEMORY[0x1E0C84FB0]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C85008](a1);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85460](a1, a2);
}

void srand(unsigned int a1)
{
  MEMORY[0x1E0C85478](*(_QWORD *)&a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x1E0C85550](*(_QWORD *)&__errnum, __strerrbuf, __buflen);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
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

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

FILE *tmpfile(void)
{
  return (FILE *)MEMORY[0x1E0C85978]();
}

int8_t u_charType(UChar32 c)
{
  return MEMORY[0x1E0DE5978](*(_QWORD *)&c);
}

UBool u_hasBinaryProperty(UChar32 c, UProperty which)
{
  return MEMORY[0x1E0DE59E0](*(_QWORD *)&c, *(_QWORD *)&which);
}

UBool u_ispunct(UChar32 c)
{
  return MEMORY[0x1E0DE5A48](*(_QWORD *)&c);
}

UBool u_isspace(UChar32 c)
{
  return MEMORY[0x1E0DE5A50](*(_QWORD *)&c);
}

UChar *__cdecl u_strFromUTF8(UChar *dest, int32_t destCapacity, int32_t *pDestLength, const char *src, int32_t srcLength, UErrorCode *pErrorCode)
{
  return (UChar *)MEMORY[0x1E0DE5AA0](dest, *(_QWORD *)&destCapacity, pDestLength, src, *(_QWORD *)&srcLength, pErrorCode);
}

uint64_t ubrk_close()
{
  return MEMORY[0x1E0DE5C98]();
}

uint64_t ubrk_first()
{
  return MEMORY[0x1E0DE5CB0]();
}

uint64_t ubrk_following()
{
  return MEMORY[0x1E0DE5CB8]();
}

uint64_t ubrk_getRuleStatus()
{
  return MEMORY[0x1E0DE5CC8]();
}

uint64_t ubrk_next()
{
  return MEMORY[0x1E0DE5CE0]();
}

uint64_t ubrk_open()
{
  return MEMORY[0x1E0DE5CE8]();
}

uint64_t ubrk_preceding()
{
  return MEMORY[0x1E0DE5CF0]();
}

uint64_t ubrk_previous()
{
  return MEMORY[0x1E0DE5CF8]();
}

uint64_t ubrk_setText()
{
  return MEMORY[0x1E0DE5D08]();
}

uint64_t ubrk_setUText()
{
  return MEMORY[0x1E0DE5D10]();
}

uint64_t uloc_addLikelySubtags()
{
  return MEMORY[0x1E0DE6388]();
}

uint64_t uloc_getLanguage()
{
  return MEMORY[0x1E0DE6430]();
}

uint64_t uloc_getScript()
{
  return MEMORY[0x1E0DE6448]();
}

uint64_t uloc_setKeywordValue()
{
  return MEMORY[0x1E0DE6468]();
}

uint64_t ulocdata_close()
{
  return MEMORY[0x1E0DE6488]();
}

uint64_t ulocdata_getExemplarSet()
{
  return MEMORY[0x1E0DE64A0]();
}

uint64_t ulocdata_open()
{
  return MEMORY[0x1E0DE64B0]();
}

uint64_t unorm2_getNFKCInstance()
{
  return MEMORY[0x1E0DE64E0]();
}

uint64_t unorm2_getNFKDInstance()
{
  return MEMORY[0x1E0DE64E8]();
}

uint64_t unorm2_quickCheck()
{
  return MEMORY[0x1E0DE6508]();
}

uint64_t urbtok57_openBinaryRulesNoCopy()
{
  return MEMORY[0x1E0DE66F8]();
}

uint64_t urbtok57_tokenize()
{
  return MEMORY[0x1E0DE6700]();
}

uint64_t uset_add()
{
  return MEMORY[0x1E0DE6938]();
}

uint64_t uset_addAll()
{
  return MEMORY[0x1E0DE6940]();
}

uint64_t uset_addRange()
{
  return MEMORY[0x1E0DE6950]();
}

uint64_t uset_close()
{
  return MEMORY[0x1E0DE6988]();
}

uint64_t uset_contains()
{
  return MEMORY[0x1E0DE6998]();
}

uint64_t uset_freeze()
{
  return MEMORY[0x1E0DE69A8]();
}

uint64_t uset_openEmpty()
{
  return MEMORY[0x1E0DE69D8]();
}

uint64_t uset_openPattern()
{
  return MEMORY[0x1E0DE69E0]();
}

UText *__cdecl utext_close(UText *ut)
{
  return (UText *)MEMORY[0x1E0DE6A50](ut);
}

UText *__cdecl utext_openUChars(UText *ut, const UChar *s, int64_t length, UErrorCode *status)
{
  return (UText *)MEMORY[0x1E0DE6A90](ut, s, length, status);
}

UText *__cdecl utext_openUTF8(UText *ut, const char *s, int64_t length, UErrorCode *status)
{
  return (UText *)MEMORY[0x1E0DE6A98](ut, s, length, status);
}

void vDSP_distancesq(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C0B0](__A, __IA, __B, __IB, __C, __N);
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C0D0](__A, __IA, __B, __IB, __C, __N);
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C1E8](__A, __IA, __C, __N);
}

void vDSP_mtrans(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N)
{
  MEMORY[0x1E0C8C260](__A, __IA, __C, __IC, __M, __N);
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C368](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vsdiv(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C860](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C8E0](__A, __IA, __B, __C, __IC, __N);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C85B98](__str, __size, __format, a4);
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return (__int32 *)MEMORY[0x1E0C85CB8](__s, *(_QWORD *)&__c, __n);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

