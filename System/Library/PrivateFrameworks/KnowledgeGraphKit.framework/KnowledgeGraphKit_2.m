uint64_t degas::Statement::bindBitmap(degas::Statement *this, const Bitmap *a2, const degas::Bitmap *a3)
{
  int v3;
  _DWORD *v5;
  _DWORD *v6;
  uint64_t v7;

  v3 = (int)a2;
  degas::LiteralBitmap::makeLiteralBitmap(a3, a2);
  v6 = v5;
  v7 = degas::Statement::bindLiteralBitmap((uint64_t)this, v3, v5);
  MEMORY[0x1CAA4ADC8](v6, 0x1000C4000313F17);
  return v7;
}

uint64_t degas::Statement::bindLiteralBitmap(uint64_t a1, int a2, _DWORD *a3)
{
  int v4;
  uint64_t result;

  v4 = sqlite3_bind_blob(*(sqlite3_stmt **)a1, a2, a3, (144 * a3[1]) | 8, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  *(_DWORD *)(a1 + 16) = v4;
  result = 3;
  if (v4 > 99)
  {
    if (v4 == 100)
    {
      return 1;
    }
    else if (v4 == 101)
    {
      return 2;
    }
  }
  else if (v4)
  {
    if (v4 == 17)
      return 4;
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t degas::Statement::bindBitmapPointer(sqlite3_stmt **this, int a2, Bitmap *a3)
{
  uint64_t result;
  BOOL v5;
  unsigned int v6;

  result = sqlite3_bind_pointer(*this, a2, a3, (const char *)degas::kBitmapPointerTypeName, 0);
  *((_DWORD *)this + 4) = result;
  if ((int)result > 99)
  {
    if ((_DWORD)result == 100)
      return 1;
    v5 = (_DWORD)result == 101;
    v6 = 2;
  }
  else
  {
    if (!(_DWORD)result)
      return result;
    v5 = (_DWORD)result == 17;
    v6 = 4;
  }
  if (v5)
    return v6;
  else
    return 3;
}

uint64_t degas::Statement::bindArrayPointer(sqlite3_stmt **this, int a2, void *a3)
{
  uint64_t result;
  BOOL v5;
  unsigned int v6;

  result = sqlite3_bind_pointer(*this, a2, a3, (const char *)degas::kArrayPointerTypeName, 0);
  *((_DWORD *)this + 4) = result;
  if ((int)result > 99)
  {
    if ((_DWORD)result == 100)
      return 1;
    v5 = (_DWORD)result == 101;
    v6 = 2;
  }
  else
  {
    if (!(_DWORD)result)
      return result;
    v5 = (_DWORD)result == 17;
    v6 = 4;
  }
  if (v5)
    return v6;
  else
    return 3;
}

uint64_t degas::Statement::bindNull(sqlite3_stmt **this, int a2)
{
  int v3;
  int v4;
  unsigned int v5;
  unsigned int v6;

  v3 = sqlite3_bind_null(*this, a2);
  *((_DWORD *)this + 4) = v3;
  if (v3 == 101)
    v4 = 2;
  else
    v4 = 3;
  if (v3 == 100)
    v5 = 1;
  else
    v5 = v4;
  if (v3 == 17)
    v6 = 4;
  else
    v6 = 3;
  if (!v3)
    v6 = 0;
  if (v3 <= 99)
    return v6;
  else
    return v5;
}

uint64_t degas::Statement::next(sqlite3_stmt **this)
{
  int v2;
  NSObject *v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = sqlite3_step(*this);
  *((_DWORD *)this + 4) = v2;
  if ((v2 - 102) <= 0xFFFFFFFD)
  {
    if (degas::DegasLoggingConnection(void)::onceToken[0] != -1)
      dispatch_once(degas::DegasLoggingConnection(void)::onceToken, &__block_literal_global_5020);
    v3 = degas::DegasLoggingConnection(void)::log;
    if (os_log_type_enabled((os_log_t)degas::DegasLoggingConnection(void)::log, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109120;
      v8[1] = v2;
      _os_log_error_impl(&dword_1CA0A5000, v3, OS_LOG_TYPE_ERROR, "statement step error: %d", (uint8_t *)v8, 8u);
    }
  }
  if (v2 == 101)
    v4 = 2;
  else
    v4 = 3;
  if (v2 == 100)
    v5 = 1;
  else
    v5 = v4;
  if (v2 == 17)
    v6 = 4;
  else
    v6 = 3;
  if (!v2)
    v6 = 0;
  if (v2 <= 99)
    return v6;
  else
    return v5;
}

uint64_t degas::Statement::finishStatementCursor(degas::Statement *this)
{
  int v1;
  unsigned int v2;
  int v5;
  int v6;
  unsigned int v7;
  unsigned int v8;

  v1 = *((_DWORD *)this + 4);
  if (v1 > 99)
  {
    if (v1 == 100)
    {
      v5 = sqlite3_reset(*(sqlite3_stmt **)this);
      *((_DWORD *)this + 4) = 101;
      if (v5 == 101)
        v6 = 2;
      else
        v6 = 3;
      if (v5 == 100)
        v7 = 1;
      else
        v7 = v6;
      if (v5 == 17)
        v8 = 4;
      else
        v8 = 3;
      if (!v5)
        v8 = 0;
      if (v5 <= 99)
        return v8;
      else
        return v7;
    }
    else if (v1 == 101)
    {
      return 2;
    }
    else
    {
      return 3;
    }
  }
  else
  {
    if (v1 == 17)
      v2 = 4;
    else
      v2 = 3;
    if (v1)
      return v2;
    else
      return 0;
  }
}

uint64_t degas::Statement::update(sqlite3_stmt **this)
{
  int v2;
  NSObject *v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = sqlite3_step(*this);
  *((_DWORD *)this + 4) = v2;
  if ((v2 - 102) <= 0xFFFFFFFD)
  {
    if (degas::DegasLoggingConnection(void)::onceToken[0] != -1)
      dispatch_once(degas::DegasLoggingConnection(void)::onceToken, &__block_literal_global_5020);
    v3 = degas::DegasLoggingConnection(void)::log;
    if (os_log_type_enabled((os_log_t)degas::DegasLoggingConnection(void)::log, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109120;
      v8[1] = v2;
      _os_log_error_impl(&dword_1CA0A5000, v3, OS_LOG_TYPE_ERROR, "statement update error: %d", (uint8_t *)v8, 8u);
    }
  }
  if (v2 == 101)
    v4 = 0;
  else
    v4 = v2;
  if (v4 == 100)
    v5 = 1;
  else
    v5 = 3;
  if (v4 == 17)
    v6 = 4;
  else
    v6 = 3;
  if (!v4)
    v6 = 0;
  if (v4 <= 99)
    return v6;
  else
    return v5;
}

BOOL degas::Statement::isError(degas::Statement *this)
{
  int v1;

  v1 = *((_DWORD *)this + 4);
  return (v1 - 100) >= 2 && v1 != 0;
}

sqlite3_int64 degas::Statement::integerColumnValue(sqlite3_stmt **this, int a2)
{
  return sqlite3_column_int64(*this, a2);
}

double degas::Statement::realColumnValue(sqlite3_stmt **this, int a2)
{
  return sqlite3_column_double(*this, a2);
}

void degas::Statement::stringColumnValue(sqlite3_stmt **a1, int a2, uint64_t a3)
{
  char *v4;
  __int128 v5;
  uint64_t v6;

  v4 = (char *)sqlite3_column_text(*a1, a2);
  if (v4)
  {
    std::string::basic_string[abi:ne180100]<0>(&v5, v4);
    if (*(char *)(a3 + 23) < 0)
      operator delete(*(void **)a3);
    *(_OWORD *)a3 = v5;
    *(_QWORD *)(a3 + 16) = v6;
  }
  else
  {
    if (*(char *)(a3 + 23) < 0)
      operator delete(*(void **)a3);
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
  }
}

void degas::Statement::bitmapColumnValue(sqlite3_stmt **this, int a2, degas::Bitmap *a3)
{
  const degas::LiteralBitmap *v4;
  _QWORD v5[2];
  uint64_t v6;
  void **v7;

  v4 = (const degas::LiteralBitmap *)sqlite3_column_blob(*this, a2);
  degas::Bitmap::Bitmap((degas::Bitmap *)v5, v4);
  degas::Bitmap::operator=(a3, v5);
  v7 = (void **)&v6;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v7);
}

void sub_1CA1B2250(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 24) = v1 + 16;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v2 - 24));
  _Unwind_Resume(a1);
}

const void *degas::Statement::literalBitmapColumnValue(sqlite3_stmt **this, int a2)
{
  return sqlite3_column_blob(*this, a2);
}

const void *degas::Statement::blobColumnValue(sqlite3_stmt **this, int a2)
{
  return sqlite3_column_blob(*this, a2);
}

uint64_t degas::Statement::sqliteDataType(sqlite3_stmt **this, int a2)
{
  return sqlite3_column_type(*this, a2);
}

uint64_t degas::Statement::measureIO(sqlite3 **this, degas::IOAccountingEntry *a2)
{
  int v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  int pHiwtr;

  pHiwtr = 0;
  v4 = sqlite3_db_status(this[1], 8, (int *)a2 + 1, &pHiwtr, 0);
  if (!v4)
  {
    v4 = sqlite3_db_status(this[1], 7, (int *)a2, &pHiwtr, 0);
    if (!v4)
      v4 = sqlite3_db_status(this[1], 12, (int *)a2 + 2, &pHiwtr, 0);
  }
  if (v4 == 101)
    v5 = 2;
  else
    v5 = 3;
  if (v4 == 100)
    v6 = 1;
  else
    v6 = v5;
  if (v4 == 17)
    v7 = 4;
  else
    v7 = 3;
  if (!v4)
    v7 = 0;
  if (v4 <= 99)
    return v7;
  else
    return v6;
}

_QWORD *degas::Cursor::Cursor(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = a2[1];
  *result = *a2;
  result[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = a2[1];
  *result = *a2;
  result[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = a2[1];
  *result = *a2;
  result[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = a2[1];
  *result = *a2;
  result[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

__n128 degas::Cursor::Cursor(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  return result;
}

{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  return result;
}

void degas::Cursor::~Cursor(degas::Statement **this)
{
  degas::Statement::finishStatementCursor(*this);
  std::shared_ptr<degas::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)this);
}

uint64_t degas::Cursor::columnDataType(sqlite3_stmt ***this, int a2)
{
  uint64_t result;

  LODWORD(result) = sqlite3_column_type(**this, a2);
  if ((result - 1) >= 3)
    return 0;
  else
    return result;
}

void degas::EdgeTable::~EdgeTable(degas::EdgeTable *this)
{
  *(_QWORD *)this = off_1E83E43A8;
  *((_QWORD *)this + 4) = 0;
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
}

{
  *(_QWORD *)this = off_1E83E43A8;
  *((_QWORD *)this + 4) = 0;
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
  JUMPOUT(0x1CAA4ADC8);
}

{
  *(_QWORD *)this = off_1E83E43A8;
  *((_QWORD *)this + 4) = 0;
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
}

uint64_t degas::EdgeTable::createTable(degas::EdgeTable *this)
{
  int v2;
  char *v3;
  uint64_t v4;
  sqlite3 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  char *v10;
  uint64_t v11;
  int v12;
  char *v13;
  uint64_t v14;
  sqlite3 *v15;
  void *v16;
  void *v17;
  int v18;
  char *v19;
  uint64_t v20;
  int v21;
  char *v22;
  uint64_t v23;
  sqlite3 *v24;
  void *v26;
  char v27;
  sqlite3_stmt *v28[3];
  void *v29[2];
  char v30;
  void *v31;
  char v32;
  uint64_t v33;
  sqlite3_stmt *v34[3];
  void *__p[2];
  char v36;
  void *v37;
  char v38;
  uint64_t v39;
  sqlite3_stmt *ppStmt[3];
  _QWORD v41[11];
  char v42;
  uint64_t v43;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v41);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v41, (uint64_t)"create table ", 13);
  v2 = *((char *)this + 31);
  if (v2 >= 0)
    v3 = (char *)this + 8;
  else
    v3 = (char *)*((_QWORD *)this + 1);
  if (v2 >= 0)
    v4 = *((unsigned __int8 *)this + 31);
  else
    v4 = *((_QWORD *)this + 2);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v41, (uint64_t)v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v41, (uint64_t)" (identifier integer primary key autoincrement, labels blob, sourceNodeId integer, targetNodeId integer)", 104);
  v5 = (sqlite3 *)*((_QWORD *)this + 4);
  std::stringbuf::str();
  degas::Statement::Statement(ppStmt, v5, (uint64_t)__p);
  if (v36 < 0)
    operator delete(__p[0]);
  v6 = degas::Statement::update(ppStmt);
  v7 = MEMORY[0x1E0DE4F60];
  v8 = MEMORY[0x1E0DE4FB8];
  if (!(_DWORD)v6)
  {
    if (*((_BYTE *)this + 49))
    {
      std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)__p);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__p, (uint64_t)"create index ", 13);
      v9 = *((char *)this + 31);
      if (v9 >= 0)
        v10 = (char *)this + 8;
      else
        v10 = (char *)*((_QWORD *)this + 1);
      if (v9 >= 0)
        v11 = *((unsigned __int8 *)this + 31);
      else
        v11 = *((_QWORD *)this + 2);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__p, (uint64_t)v10, v11);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__p, (uint64_t)"_source_idx on ", 15);
      v12 = *((char *)this + 31);
      if (v12 >= 0)
        v13 = (char *)this + 8;
      else
        v13 = (char *)*((_QWORD *)this + 1);
      if (v12 >= 0)
        v14 = *((unsigned __int8 *)this + 31);
      else
        v14 = *((_QWORD *)this + 2);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__p, (uint64_t)v13, v14);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__p, (uint64_t)" (sourceNodeId)", 15);
      v15 = (sqlite3 *)*((_QWORD *)this + 4);
      std::stringbuf::str();
      degas::Statement::Statement(v34, v15, (uint64_t)v29);
      if (v30 < 0)
        operator delete(v29[0]);
      v6 = degas::Statement::update(v34);
      if ((_DWORD)v6)
      {
        v16 = *(void **)v7;
        v17 = *(void **)(v7 + 24);
      }
      else
      {
        std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v29);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v29, (uint64_t)"create index ", 13);
        v18 = *((char *)this + 31);
        if (v18 >= 0)
          v19 = (char *)this + 8;
        else
          v19 = (char *)*((_QWORD *)this + 1);
        if (v18 >= 0)
          v20 = *((unsigned __int8 *)this + 31);
        else
          v20 = *((_QWORD *)this + 2);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v29, (uint64_t)v19, v20);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v29, (uint64_t)"_target_idx on ", 15);
        v21 = *((char *)this + 31);
        if (v21 >= 0)
          v22 = (char *)this + 8;
        else
          v22 = (char *)*((_QWORD *)this + 1);
        if (v21 >= 0)
          v23 = *((unsigned __int8 *)this + 31);
        else
          v23 = *((_QWORD *)this + 2);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v29, (uint64_t)v22, v23);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v29, (uint64_t)" (targetNodeId)", 15);
        v24 = (sqlite3 *)*((_QWORD *)this + 4);
        std::stringbuf::str();
        degas::Statement::Statement(v28, v24, (uint64_t)&v26);
        if (v27 < 0)
          operator delete(v26);
        v6 = degas::Statement::update(v28);
        degas::Statement::~Statement((degas::Statement *)v28);
        v16 = *(void **)v7;
        v29[0] = v16;
        v17 = *(void **)(v7 + 24);
        *(void **)((char *)v29 + *((_QWORD *)v16 - 3)) = v17;
        v29[1] = (void *)(v8 + 16);
        if (v32 < 0)
          operator delete(v31);
        std::streambuf::~streambuf();
        std::ostream::~ostream();
        MEMORY[0x1CAA4AD98](&v33);
      }
      degas::Statement::~Statement((degas::Statement *)v34);
      __p[0] = v16;
      *(void **)((char *)__p + *((_QWORD *)v16 - 3)) = v17;
      __p[1] = (void *)(v8 + 16);
      if (v38 < 0)
        operator delete(v37);
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      MEMORY[0x1CAA4AD98](&v39);
    }
    else
    {
      v6 = 0;
    }
  }
  degas::Statement::~Statement((degas::Statement *)ppStmt);
  v41[0] = *(_QWORD *)v7;
  *(_QWORD *)((char *)v41 + *(_QWORD *)(v41[0] - 24)) = *(_QWORD *)(v7 + 24);
  v41[1] = v8 + 16;
  if (v42 < 0)
    operator delete((void *)v41[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1CAA4AD98](&v43);
  return v6;
}

void sub_1CA1B286C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,void *a52)
{
  degas::Statement::~Statement((degas::Statement *)&a13);
  std::ostringstream::~ostringstream((uint64_t)&a16);
  degas::Statement::~Statement((degas::Statement *)&a49);
  std::ostringstream::~ostringstream((uint64_t)&a52);
  degas::Statement::~Statement((degas::Statement *)&STACK[0x260]);
  std::ostringstream::~ostringstream((uint64_t)&STACK[0x278]);
  _Unwind_Resume(a1);
}

uint64_t degas::EdgeTable::deleteEntry(degas::EdgeTable *this, sqlite3_int64 a2)
{
  unsigned int v4;
  uint64_t v5;
  uint64_t *Statement;
  uint64_t v7;
  const char *v9;
  __int128 v10;
  uint64_t (*v11)@<X0>(uint64_t@<X0>, _QWORD *@<X8>);
  void *v12;
  degas::EdgeTable *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (*((unsigned __int8 *)this + 48) << 16) | 0x500;
  v5 = *((_QWORD *)this + 5);
  *(_QWORD *)&v10 = MEMORY[0x1E0C809B0];
  *((_QWORD *)&v10 + 1) = 0x40000000;
  v11 = ___ZNK5degas9EdgeTable15deleteStatementEv_block_invoke;
  v12 = &__block_descriptor_tmp_5;
  v13 = this;
  Statement = degas::StatementCache::getStatement(v5, v4, (uint64_t)&v10);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  v7 = degas::Statement::update((sqlite3_stmt **)*Statement);
  if ((_DWORD)v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = sqlite3_errmsg(*((sqlite3 **)this + 4));
    LODWORD(v10) = 136315138;
    *(_QWORD *)((char *)&v10 + 4) = v9;
    _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "edge delete failed: %s", (uint8_t *)&v10, 0xCu);
  }
  return v7;
}

uint64_t *degas::EdgeTable::deleteStatement(degas::EdgeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x500;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9EdgeTable15deleteStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_5;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas9EdgeTable15deleteStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"delete from ", 12);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" where identifier=?1", 20);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1B2C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t degas::EdgeTable::EdgeTable(uint64_t a1, uint64_t a2, __int128 *a3, char a4, char a5, uint64_t a6)
{
  std::string *v11;
  __int128 v12;

  *(_QWORD *)a1 = off_1E83E43A8;
  v11 = (std::string *)(a1 + 8);
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v12 = *a3;
    v11->__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 2);
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
  }
  *(_QWORD *)(a1 + 32) = a2;
  *(_QWORD *)(a1 + 40) = a6;
  *(_QWORD *)a1 = off_1E83E4918;
  *(_BYTE *)(a1 + 49) = a4;
  *(_BYTE *)(a1 + 48) = a5;
  return a1;
}

{
  std::string *v11;
  __int128 v12;

  *(_QWORD *)a1 = off_1E83E43A8;
  v11 = (std::string *)(a1 + 8);
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v12 = *a3;
    v11->__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 2);
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
  }
  *(_QWORD *)(a1 + 32) = a2;
  *(_QWORD *)(a1 + 40) = a6;
  *(_QWORD *)a1 = off_1E83E4918;
  *(_BYTE *)(a1 + 49) = a4;
  *(_BYTE *)(a1 + 48) = a5;
  return a1;
}

uint64_t *degas::EdgeTable::insertStatement(degas::EdgeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x300;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9EdgeTable15insertStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_3520;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas9EdgeTable15insertStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"insert into ", 12);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" (identifier, labels, sourceNodeId, targetNodeId) values(?1, ?2, ?3, ?4)", 72);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1B2F68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::EdgeTable::readByIdentifierStatement(degas::EdgeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x600;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9EdgeTable25readByIdentifierStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_7_3523;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas9EdgeTable25readByIdentifierStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"select identifier, labels, sourceNodeId, targetNodeId from ", 59);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" where identifier=?1", 20);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1B3178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::EdgeTable::readByBitmapStatement(degas::EdgeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x800;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9EdgeTable21readByBitmapStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_10_3525;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas9EdgeTable21readByBitmapStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"select e.identifier, e.labels, e.sourceNodeId, e.targetNodeId from ", 67);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" e, identifierBitmap(?) b where e.identifier = b.value", 54);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1B3388(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::EdgeTable::readByLabelStatement(degas::EdgeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x801;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9EdgeTable20readByLabelStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_12_3528;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas9EdgeTable20readByLabelStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"select identifier, labels, sourceNodeId, targetNodeId from ", 59);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" where bitmapContainsIdentifier(labels, ?1)", 43);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1B3598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::EdgeTable::readByAllLabelsStatement(degas::EdgeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x802;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9EdgeTable24readByAllLabelsStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_14_3530;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas9EdgeTable24readByAllLabelsStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"select identifier, labels, sourceNodeId, targetNodeId from ", 59);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" where bitmapContainsBitmap(labels, ?1)", 39);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1B37A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::EdgeTable::readByAllLabelsAndIdentifiersStatement(degas::EdgeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x803;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9EdgeTable38readByAllLabelsAndIdentifiersStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_16_3532;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas9EdgeTable38readByAllLabelsAndIdentifiersStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"select e.identifier, e.labels, e.sourceNodeId, e.targetNodeId from ", 67);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" e, identifierBitmap(?1) b where e.identifier = b.value and bitmapContainsBitmap(e.labels, ?2)", 94);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1B39B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::EdgeTable::readByAnyLabelsStatement(degas::EdgeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x804;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9EdgeTable24readByAnyLabelsStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_18_3534;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas9EdgeTable24readByAnyLabelsStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"select identifier, labels, sourceNodeId, targetNodeId from ", 59);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" where bitmapOverlapsBitmap(labels, ?1)", 39);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1B3BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::EdgeTable::readByAnyLabelsAndIdentifiersStatement(degas::EdgeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x805;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9EdgeTable38readByAnyLabelsAndIdentifiersStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_20_3536;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas9EdgeTable38readByAnyLabelsAndIdentifiersStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"select e.identifier, e.labels, e.sourceNodeId, e.targetNodeId from ", 67);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" e, identifierBitmap(?1) b where e.identifier = b.value and bitmapOverlapsBitmap(e.labels, ?2)", 94);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1B3DD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::EdgeTable::readAllStatement(degas::EdgeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x700;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9EdgeTable16readAllStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_22_3538;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas9EdgeTable16readAllStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"select identifier, labels, sourceNodeId, targetNodeId from ", 59);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" order by identifier", 20);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1B3FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t degas::EdgeTable::insert(degas::EdgeTable *this, sqlite3_int64 *a2, const degas::Bitmap *a3, sqlite3_int64 a4, sqlite3_int64 a5)
{
  unsigned int v10;
  uint64_t v11;
  degas::Statement **Statement;
  degas::Statement *v13;
  uint64_t v14;
  const char *v15;
  __int128 v17;
  uint64_t (*v18)@<X0>(uint64_t@<X0>, _QWORD *@<X8>);
  void *v19;
  degas::EdgeTable *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = (*((unsigned __int8 *)this + 48) << 16) | 0x300;
  v11 = *((_QWORD *)this + 5);
  *(_QWORD *)&v17 = MEMORY[0x1E0C809B0];
  *((_QWORD *)&v17 + 1) = 0x40000000;
  v18 = ___ZNK5degas9EdgeTable15insertStatementEv_block_invoke;
  v19 = &__block_descriptor_tmp_3520;
  v20 = this;
  Statement = (degas::Statement **)degas::StatementCache::getStatement(v11, v10, (uint64_t)&v17);
  v13 = *Statement;
  if (*a2)
    degas::Statement::bindInteger((sqlite3_stmt **)v13, 1, *a2);
  else
    degas::Statement::bindNull((sqlite3_stmt **)v13, 1);
  degas::Statement::bindBitmap(*Statement, (const Bitmap *)2, a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 3, a4);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 4, a5);
  v14 = degas::Statement::update((sqlite3_stmt **)*Statement);
  if ((_DWORD)v14)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v15 = sqlite3_errmsg(*((sqlite3 **)this + 4));
      LODWORD(v17) = 136315138;
      *(_QWORD *)((char *)&v17 + 4) = v15;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "edge insert failed: %s", (uint8_t *)&v17, 0xCu);
    }
  }
  else if (!*a2)
  {
    *a2 = sqlite3_last_insert_rowid(*((sqlite3 **)this + 4));
  }
  return v14;
}

uint64_t *degas::EdgeTable::prepareStatementToReadByIdentifier(degas::EdgeTable *this, sqlite3_int64 a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t *Statement;
  _QWORD v7[5];

  v3 = (*((unsigned __int8 *)this + 48) << 16) | 0x600;
  v4 = *((_QWORD *)this + 5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___ZNK5degas9EdgeTable25readByIdentifierStatementEv_block_invoke;
  v7[3] = &__block_descriptor_tmp_7_3523;
  v7[4] = this;
  Statement = degas::StatementCache::getStatement(v4, v3, (uint64_t)v7);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  return Statement;
}

uint64_t *degas::EdgeTable::prepareStatementToReadByBitmap(degas::EdgeTable *this, Bitmap *a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t *Statement;
  _QWORD v7[5];

  v3 = (*((unsigned __int8 *)this + 48) << 16) | 0x800;
  v4 = *((_QWORD *)this + 5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___ZNK5degas9EdgeTable21readByBitmapStatementEv_block_invoke;
  v7[3] = &__block_descriptor_tmp_10_3525;
  v7[4] = this;
  Statement = degas::StatementCache::getStatement(v4, v3, (uint64_t)v7);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*Statement, 1, a2);
  return Statement;
}

uint64_t *degas::EdgeTable::prepareStatementToReadByLabel(degas::EdgeTable *this, sqlite3_int64 a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t *Statement;
  _QWORD v7[5];

  v3 = (*((unsigned __int8 *)this + 48) << 16) | 0x801;
  v4 = *((_QWORD *)this + 5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___ZNK5degas9EdgeTable20readByLabelStatementEv_block_invoke;
  v7[3] = &__block_descriptor_tmp_12_3528;
  v7[4] = this;
  Statement = degas::StatementCache::getStatement(v4, v3, (uint64_t)v7);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  return Statement;
}

uint64_t *degas::EdgeTable::prepareStatementToReadByAllLabels(degas::EdgeTable *this, const degas::Bitmap *a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t *Statement;
  _QWORD v7[5];

  v3 = (*((unsigned __int8 *)this + 48) << 16) | 0x802;
  v4 = *((_QWORD *)this + 5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___ZNK5degas9EdgeTable24readByAllLabelsStatementEv_block_invoke;
  v7[3] = &__block_descriptor_tmp_14_3530;
  v7[4] = this;
  Statement = degas::StatementCache::getStatement(v4, v3, (uint64_t)v7);
  degas::Statement::bindBitmap((degas::Statement *)*Statement, (const Bitmap *)1, a2);
  return Statement;
}

uint64_t *degas::EdgeTable::prepareStatementToReadByAllLabelsAndIdentifiers(degas::EdgeTable *this, const degas::Bitmap *a2, Bitmap *a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t *Statement;
  _QWORD v9[5];

  v5 = (*((unsigned __int8 *)this + 48) << 16) | 0x803;
  v6 = *((_QWORD *)this + 5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = ___ZNK5degas9EdgeTable38readByAllLabelsAndIdentifiersStatementEv_block_invoke;
  v9[3] = &__block_descriptor_tmp_16_3532;
  v9[4] = this;
  Statement = degas::StatementCache::getStatement(v6, v5, (uint64_t)v9);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*Statement, 1, a3);
  degas::Statement::bindBitmap((degas::Statement *)*Statement, (const Bitmap *)2, a2);
  return Statement;
}

uint64_t *degas::EdgeTable::prepareStatementToReadByAnyLabels(degas::EdgeTable *this, const degas::Bitmap *a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t *Statement;
  _QWORD v7[5];

  v3 = (*((unsigned __int8 *)this + 48) << 16) | 0x804;
  v4 = *((_QWORD *)this + 5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___ZNK5degas9EdgeTable24readByAnyLabelsStatementEv_block_invoke;
  v7[3] = &__block_descriptor_tmp_18_3534;
  v7[4] = this;
  Statement = degas::StatementCache::getStatement(v4, v3, (uint64_t)v7);
  degas::Statement::bindBitmap((degas::Statement *)*Statement, (const Bitmap *)1, a2);
  return Statement;
}

uint64_t *degas::EdgeTable::prepareStatementToReadByAnyLabelsAndIdentifiers(degas::EdgeTable *this, const degas::Bitmap *a2, Bitmap *a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t *Statement;
  _QWORD v9[5];

  v5 = (*((unsigned __int8 *)this + 48) << 16) | 0x805;
  v6 = *((_QWORD *)this + 5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = ___ZNK5degas9EdgeTable38readByAnyLabelsAndIdentifiersStatementEv_block_invoke;
  v9[3] = &__block_descriptor_tmp_20_3536;
  v9[4] = this;
  Statement = degas::StatementCache::getStatement(v6, v5, (uint64_t)v9);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*Statement, 1, a3);
  degas::Statement::bindBitmap((degas::Statement *)*Statement, (const Bitmap *)2, a2);
  return Statement;
}

uint64_t *degas::EdgeTable::prepareStatementToReadAll(degas::EdgeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x700;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9EdgeTable16readAllStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_22_3538;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

_QWORD *degas::EdgeCursor::EdgeCursor(_QWORD *this)
{
  *this = 0;
  this[1] = 0;
  return this;
}

_QWORD *degas::EdgeCursor::setForSelectAll(degas::EdgeCursor *this, const degas::EdgeTable *a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t *Statement;
  _QWORD v7[5];

  v3 = (*((unsigned __int8 *)a2 + 48) << 16) | 0x700;
  v4 = *((_QWORD *)a2 + 5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___ZNK5degas9EdgeTable16readAllStatementEv_block_invoke;
  v7[3] = &__block_descriptor_tmp_22_3538;
  v7[4] = a2;
  Statement = degas::StatementCache::getStatement(v4, v3, (uint64_t)v7);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](this, *Statement, Statement[1]);
}

_QWORD *degas::EdgeCursor::setForIdentifier(degas::EdgeCursor *this, sqlite3_int64 a2, const degas::EdgeTable *a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t *Statement;
  _QWORD v9[5];

  v5 = (*((unsigned __int8 *)a3 + 48) << 16) | 0x600;
  v6 = *((_QWORD *)a3 + 5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = ___ZNK5degas9EdgeTable25readByIdentifierStatementEv_block_invoke;
  v9[3] = &__block_descriptor_tmp_7_3523;
  v9[4] = a3;
  Statement = degas::StatementCache::getStatement(v6, v5, (uint64_t)v9);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](this, *Statement, Statement[1]);
}

_QWORD *degas::EdgeCursor::setForIdentifiers(degas::EdgeCursor *this, Bitmap *a2, const degas::EdgeTable *a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t *Statement;
  _QWORD v9[5];

  v5 = (*((unsigned __int8 *)a3 + 48) << 16) | 0x800;
  v6 = *((_QWORD *)a3 + 5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = ___ZNK5degas9EdgeTable21readByBitmapStatementEv_block_invoke;
  v9[3] = &__block_descriptor_tmp_10_3525;
  v9[4] = a3;
  Statement = degas::StatementCache::getStatement(v6, v5, (uint64_t)v9);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*Statement, 1, a2);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](this, *Statement, Statement[1]);
}

_QWORD *degas::EdgeCursor::setForLabel(degas::EdgeCursor *this, sqlite3_int64 a2, const degas::EdgeTable *a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t *Statement;
  _QWORD v9[5];

  v5 = (*((unsigned __int8 *)a3 + 48) << 16) | 0x801;
  v6 = *((_QWORD *)a3 + 5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = ___ZNK5degas9EdgeTable20readByLabelStatementEv_block_invoke;
  v9[3] = &__block_descriptor_tmp_12_3528;
  v9[4] = a3;
  Statement = degas::StatementCache::getStatement(v6, v5, (uint64_t)v9);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](this, *Statement, Statement[1]);
}

_QWORD *degas::EdgeCursor::setForAllLabels(degas::EdgeCursor *this, const degas::Bitmap *a2, const degas::EdgeTable *a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t *Statement;
  _QWORD v9[5];

  v5 = (*((unsigned __int8 *)a3 + 48) << 16) | 0x802;
  v6 = *((_QWORD *)a3 + 5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = ___ZNK5degas9EdgeTable24readByAllLabelsStatementEv_block_invoke;
  v9[3] = &__block_descriptor_tmp_14_3530;
  v9[4] = a3;
  Statement = degas::StatementCache::getStatement(v6, v5, (uint64_t)v9);
  degas::Statement::bindBitmap((degas::Statement *)*Statement, (const Bitmap *)1, a2);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](this, *Statement, Statement[1]);
}

_QWORD *degas::EdgeCursor::setForAllLabelsAndIdentifiers(degas::EdgeCursor *this, const degas::Bitmap *a2, Bitmap *a3, const degas::EdgeTable *a4)
{
  uint64_t *v5;

  v5 = degas::EdgeTable::prepareStatementToReadByAllLabelsAndIdentifiers(a4, a2, a3);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](this, *v5, v5[1]);
}

_QWORD *degas::EdgeCursor::setForAnyLabels(degas::EdgeCursor *this, const degas::Bitmap *a2, const degas::EdgeTable *a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t *Statement;
  _QWORD v9[5];

  v5 = (*((unsigned __int8 *)a3 + 48) << 16) | 0x804;
  v6 = *((_QWORD *)a3 + 5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = ___ZNK5degas9EdgeTable24readByAnyLabelsStatementEv_block_invoke;
  v9[3] = &__block_descriptor_tmp_18_3534;
  v9[4] = a3;
  Statement = degas::StatementCache::getStatement(v6, v5, (uint64_t)v9);
  degas::Statement::bindBitmap((degas::Statement *)*Statement, (const Bitmap *)1, a2);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](this, *Statement, Statement[1]);
}

_QWORD *degas::EdgeCursor::setForAnyLabelsAndIdentifiers(degas::EdgeCursor *this, const degas::Bitmap *a2, Bitmap *a3, const degas::EdgeTable *a4)
{
  uint64_t *v5;

  v5 = degas::EdgeTable::prepareStatementToReadByAnyLabelsAndIdentifiers(a4, a2, a3);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](this, *v5, v5[1]);
}

sqlite3_int64 degas::EdgeCursor::identifier(sqlite3_stmt ***this)
{
  return sqlite3_column_int64(**this, 0);
}

void degas::EdgeCursor::labels(sqlite3_stmt ***this, degas::Bitmap *a2)
{
  degas::Statement::bitmapColumnValue(*this, 1, a2);
}

const void *degas::EdgeCursor::literalLabels(sqlite3_stmt ***this)
{
  return sqlite3_column_blob(**this, 1);
}

sqlite3_int64 degas::EdgeCursor::sourceNodeId(sqlite3_stmt ***this)
{
  return sqlite3_column_int64(**this, 2);
}

sqlite3_int64 degas::EdgeCursor::targetNodeId(sqlite3_stmt ***this)
{
  return sqlite3_column_int64(**this, 3);
}

void sub_1CA1B5370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj, id a16)
{
  objc_sync_exit(obj);
  objc_sync_exit(a16);
  _Unwind_Resume(a1);
}

void sub_1CA1B54E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CA1B5678(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CA1B5798(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CA1B5EDC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CA1B6044(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CA1B6728(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CA1B68B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CA1B6DCC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CA1B6F34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

_QWORD *degas::Migration::Migration(_QWORD *result, uint64_t a2, uint64_t a3)
{
  *result = a2;
  result[1] = a3;
  return result;
}

{
  *result = a2;
  result[1] = a3;
  return result;
}

uint64_t degas::Migration::migrateAttributeSchema(degas::Migration *this)
{
  uint64_t v1;
  unsigned int v3;
  sqlite3_int64 v4;
  degas::Statement **AllStatement;
  degas::Statement *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  sqlite3_int64 v11;
  sqlite3_int64 v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  sqlite3_int64 v16;
  uint64_t v17;
  int v18;
  degas::Statement **v19;
  degas::Statement *v20;
  unint64_t *v21;
  unint64_t v22;
  sqlite3_int64 v23;
  sqlite3_int64 v24;
  uint64_t v25;
  double v26;
  sqlite3_int64 v27;
  void *__p;
  uint64_t v30;
  uint64_t v31;
  degas::Statement *v32;
  degas::Statement *v33;
  _BYTE v34[192];
  void *v35[2];
  uint64_t v36;
  degas::Statement *v37[2];

  degas::AttributeCursor::AttributeCursor((degas::AttributeCursor *)v37, (const degas::AttributeTable *)(*(_QWORD *)this + 304));
  while (1)
  {
    v3 = degas::Statement::next((sqlite3_stmt **)v37[0]);
    if (v3 != 1)
      break;
    v4 = sqlite3_column_int64(*(sqlite3_stmt **)v37[0], 0);
    v35[0] = 0;
    v35[1] = 0;
    v36 = 0;
    degas::Statement::stringColumnValue((sqlite3_stmt **)v37[0], 1, (uint64_t)v35);
    degas::AttributeInstanceTable::AttributeInstanceTable((uint64_t)v34, *((_QWORD *)this + 1), (uint64_t)v35, 0, 1, *(_QWORD *)this + 40);
    AllStatement = degas::AttributeInstanceTable::readAllStatement((degas::AttributeInstanceTable *)v34);
    v6 = AllStatement[1];
    v32 = *AllStatement;
    v33 = v6;
    if (v6)
    {
      v7 = (unint64_t *)((char *)v6 + 8);
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }
    while (1)
    {
      v9 = degas::Statement::next((sqlite3_stmt **)v32);
      v10 = v9;
      if ((_DWORD)v9 != 1)
        break;
      v11 = sqlite3_column_int64(*(sqlite3_stmt **)v32, 0);
      switch(sqlite3_column_int64(*(sqlite3_stmt **)v32, 4))
      {
        case 1u:
          v12 = sqlite3_column_int64(*(sqlite3_stmt **)v32, 1);
          v13 = degas::Database::setNodeAttributeValue(*(degas::Database **)this, v11, v4, v12);
          goto LABEL_14;
        case 2u:
          v15 = sqlite3_column_double(*(sqlite3_stmt **)v32, 2);
          v13 = degas::Database::setNodeAttributeValue(*(degas::Database **)this, v11, v4, v15);
          goto LABEL_14;
        case 3u:
          __p = 0;
          v30 = 0;
          v31 = 0;
          degas::Statement::stringColumnValue((sqlite3_stmt **)v32, 3, (uint64_t)&__p);
          v14 = degas::Database::setNodeAttributeValue(*(_QWORD *)this, v11, v4, (uint64_t *)&__p);
          if (SHIBYTE(v31) < 0)
            operator delete(__p);
          break;
        case 4u:
          v16 = sqlite3_column_int64(*(sqlite3_stmt **)v32, 1);
          v13 = degas::Database::setNodeAttributeValueUnsigned(*(degas::Database **)this, v11, v4, v16);
LABEL_14:
          v14 = v13;
          break;
        default:
          v14 = 1;
          break;
      }
      v17 = v14;
      if (v14 >= 2)
        goto LABEL_18;
    }
    v14 = v1;
    v17 = v9;
LABEL_18:
    degas::Cursor::~Cursor(&v32);
    degas::AttributeInstanceTable::~AttributeInstanceTable((degas::AttributeInstanceTable *)v34);
    if (v10 == 1)
    {
      v18 = 1;
    }
    else
    {
      degas::AttributeInstanceTable::AttributeInstanceTable((uint64_t)v34, *((_QWORD *)this + 1), (uint64_t)v35, 0, 2, *(_QWORD *)this + 40);
      v19 = degas::AttributeInstanceTable::readAllStatement((degas::AttributeInstanceTable *)v34);
      v20 = v19[1];
      v32 = *v19;
      v33 = v20;
      if (v20)
      {
        v21 = (unint64_t *)((char *)v20 + 8);
        do
          v22 = __ldxr(v21);
        while (__stxr(v22 + 1, v21));
      }
      while (degas::Statement::next((sqlite3_stmt **)v32) == 1)
      {
        v23 = sqlite3_column_int64(*(sqlite3_stmt **)v32, 0);
        switch(sqlite3_column_int64(*(sqlite3_stmt **)v32, 4))
        {
          case 1u:
            v24 = sqlite3_column_int64(*(sqlite3_stmt **)v32, 1);
            v25 = degas::Database::setEdgeAttributeValue(*(degas::Database **)this, v23, v4, v24);
            goto LABEL_30;
          case 2u:
            v26 = sqlite3_column_double(*(sqlite3_stmt **)v32, 2);
            v25 = degas::Database::setEdgeAttributeValue(*(degas::Database **)this, v23, v4, v26);
            goto LABEL_30;
          case 3u:
            __p = 0;
            v30 = 0;
            v31 = 0;
            degas::Statement::stringColumnValue((sqlite3_stmt **)v32, 3, (uint64_t)&__p);
            v17 = degas::Database::setEdgeAttributeValue(*(_QWORD *)this, v23, v4, (uint64_t *)&__p);
            if (SHIBYTE(v31) < 0)
              operator delete(__p);
            break;
          case 4u:
            v27 = sqlite3_column_int64(*(sqlite3_stmt **)v32, 1);
            v25 = degas::Database::setEdgeAttributeValueUnsigned(*(degas::Database **)this, v23, v4, v27);
LABEL_30:
            v17 = v25;
            break;
          default:
            break;
        }
        if (v17 >= 2)
        {
          v18 = 1;
          v14 = v17;
          goto LABEL_34;
        }
      }
      v18 = 0;
LABEL_34:
      degas::Cursor::~Cursor(&v32);
      degas::AttributeInstanceTable::~AttributeInstanceTable((degas::AttributeInstanceTable *)v34);
    }
    v1 = v14;
    if (SHIBYTE(v36) < 0)
      operator delete(v35[0]);
    if (v18)
      goto LABEL_42;
  }
  if (v3 == 2)
    v1 = 0;
  else
    v1 = v3;
LABEL_42:
  degas::Cursor::~Cursor(v37);
  return v1;
}

void sub_1CA1B8700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, uint64_t a16, char a17)
{
  uint64_t v17;

  degas::AttributeInstanceTable::~AttributeInstanceTable((degas::AttributeInstanceTable *)&a17);
  if (*(char *)(v17 - 97) < 0)
    operator delete(*(void **)(v17 - 120));
  degas::Cursor::~Cursor((degas::Statement **)(v17 - 96));
  _Unwind_Resume(a1);
}

uint64_t degas::Migration::migrateBitmapSchema(sqlite3 **this)
{
  uint64_t v1;
  sqlite3 *v3;
  const degas::LabelTable *v4;
  uint64_t v5;
  NSObject *v6;
  sqlite3_int64 v7;
  char v8;
  const char *v9;
  sqlite3 *v10;
  sqlite3 *v11;
  NSObject *v12;
  int v13;
  BOOL v14;
  sqlite3_int64 v15;
  int v16;
  const char *v17;
  sqlite3 *v18;
  sqlite3 *v19;
  sqlite3_int64 v20;
  const char *v21;
  degas::Statement *v23[2];
  _BYTE v24[40];
  unsigned __int8 *v25;
  unsigned __int8 *v26;
  unsigned __int8 *v27;
  degas::Statement *v28[2];
  sqlite3_stmt *ppStmt[2];
  _BYTE v30[32];
  void *__p[2];
  char v32[32];
  _BYTE v33[12];
  _BYTE buf[24];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = *this;
  v4 = (sqlite3 *)((char *)*this + 80);
  degas::LabelCursor::LabelCursor((degas::LabelCursor *)v23, v4);
  v5 = 0;
  v6 = MEMORY[0x1E0C81028];
  while (degas::Statement::next((sqlite3_stmt **)v23[0]) == 1)
  {
    v7 = sqlite3_column_int64(*(sqlite3_stmt **)v23[0], 0);
    v28[0] = (degas::Statement *)sqlite3_column_blob(*(sqlite3_stmt **)v23[0], 2);
    *(_OWORD *)__p = 0u;
    memset(v32, 0, 25);
    if (v28[0]
      && (degas::Bitmap::replaceFromEncodedBuffer((degas::Bitmap *)__p, (const unsigned __int8 **)v28) & 1) == 0)
    {
      ppStmt[0] = (sqlite3_stmt *)v32;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)ppStmt);
      v1 = 4;
LABEL_36:
      degas::Cursor::~Cursor(v23);
      return v1;
    }
    *(_QWORD *)v33 = sqlite3_column_blob(*(sqlite3_stmt **)v23[0], 3);
    *(_OWORD *)ppStmt = 0u;
    memset(v30, 0, 25);
    if (*(_QWORD *)v33
      && (degas::Bitmap::replaceFromEncodedBuffer((degas::Bitmap *)ppStmt, (const unsigned __int8 **)v33) & 1) == 0)
    {
      v8 = 0;
      v5 = 4;
      v1 = 4;
    }
    else
    {
      v5 = degas::LabelTable::update(v4, v7, (const degas::Bitmap *)__p, (const degas::Bitmap *)ppStmt);
      if ((_DWORD)v5)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v9 = sqlite3_errmsg(*((sqlite3 **)v3 + 14));
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v9;
          _os_log_error_impl(&dword_1CA0A5000, v6, OS_LOG_TYPE_ERROR, "node update failed: %s", buf, 0xCu);
        }
        v8 = 0;
        v1 = v5;
      }
      else
      {
        v8 = 1;
      }
    }
    *(_QWORD *)buf = v30;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    ppStmt[0] = (sqlite3_stmt *)v32;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)ppStmt);
    if ((v8 & 1) == 0)
      goto LABEL_36;
  }
  degas::Cursor::~Cursor(v23);
  v10 = *this;
  degas::NodeCursor::NodeCursor(v28);
  degas::NodeCursor::setForSelectAll((degas::NodeCursor *)v28, (sqlite3 *)((char *)v10 + 192));
  v11 = this[1];
  std::string::basic_string[abi:ne180100]<0>(__p, "update Node set labels=?2, edgesIn=?3, edgesOut=?4 where identifier=?1");
  degas::Statement::Statement((sqlite3_stmt **)buf, v11, (uint64_t)__p);
  if (v32[7] < 0)
    operator delete(__p[0]);
  v12 = MEMORY[0x1E0C81028];
  while (1)
  {
    v13 = degas::Statement::next((sqlite3_stmt **)v28[0]);
    v14 = v13 == 1;
    if (v13 != 1)
      break;
    v15 = sqlite3_column_int64(*(sqlite3_stmt **)v28[0], 0);
    v27 = (unsigned __int8 *)sqlite3_column_blob(*(sqlite3_stmt **)v28[0], 1);
    *(_OWORD *)__p = 0u;
    memset(v32, 0, 25);
    if (v27 && (degas::Bitmap::replaceFromEncodedBuffer((degas::Bitmap *)__p, (const unsigned __int8 **)&v27) & 1) == 0)
    {
      ppStmt[0] = (sqlite3_stmt *)v32;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)ppStmt);
      v5 = 4;
      v14 = 1;
      v1 = 4;
      break;
    }
    v26 = (unsigned __int8 *)sqlite3_column_blob(*(sqlite3_stmt **)v28[0], 2);
    *(_OWORD *)ppStmt = 0u;
    memset(v30, 0, 25);
    if (v26
      && (degas::Bitmap::replaceFromEncodedBuffer((degas::Bitmap *)ppStmt, (const unsigned __int8 **)&v26) & 1) == 0)
    {
      v5 = 4;
      v16 = 1;
      v1 = 4;
    }
    else
    {
      v25 = (unsigned __int8 *)sqlite3_column_blob(*(sqlite3_stmt **)v28[0], 3);
      *(_OWORD *)v23 = 0u;
      memset(v24, 0, 25);
      if (v25
        && (degas::Bitmap::replaceFromEncodedBuffer((degas::Bitmap *)v23, (const unsigned __int8 **)&v25) & 1) == 0)
      {
        v5 = 4;
        v16 = 1;
        v1 = 4;
      }
      else
      {
        degas::Statement::prepareForUse((degas::Statement *)buf);
        degas::Statement::bindInteger((sqlite3_stmt **)buf, 1, v15);
        degas::Statement::bindBitmap((degas::Statement *)buf, (const Bitmap *)2, (const degas::Bitmap *)__p);
        degas::Statement::bindBitmap((degas::Statement *)buf, (const Bitmap *)3, (const degas::Bitmap *)ppStmt);
        degas::Statement::bindBitmap((degas::Statement *)buf, (const Bitmap *)4, (const degas::Bitmap *)v23);
        v5 = degas::Statement::update((sqlite3_stmt **)buf);
        if ((_DWORD)v5)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v17 = sqlite3_errmsg(*((sqlite3 **)v10 + 28));
            *(_DWORD *)v33 = 136315138;
            *(_QWORD *)&v33[4] = v17;
            _os_log_error_impl(&dword_1CA0A5000, v12, OS_LOG_TYPE_ERROR, "node update failed: %s", v33, 0xCu);
          }
          v16 = 1;
          v1 = v5;
        }
        else
        {
          v16 = 0;
        }
      }
      *(_QWORD *)v33 = v24;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v33);
    }
    v23[0] = (degas::Statement *)v30;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v23);
    ppStmt[0] = (sqlite3_stmt *)v32;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)ppStmt);
    if (v16)
    {
      v14 = 1;
      break;
    }
  }
  degas::Statement::~Statement((degas::Statement *)buf);
  degas::Cursor::~Cursor(v28);
  if (!v14)
  {
    v18 = *this;
    degas::EdgeCursor::EdgeCursor(v23);
    degas::EdgeCursor::setForSelectAll((degas::EdgeCursor *)v23, (sqlite3 *)((char *)v18 + 248));
    v19 = this[1];
    std::string::basic_string[abi:ne180100]<0>(__p, "update Edge set labels=?2 where identifier=?1");
    degas::Statement::Statement(ppStmt, v19, (uint64_t)__p);
    if (v32[7] < 0)
      operator delete(__p[0]);
    while (degas::Statement::next((sqlite3_stmt **)v23[0]) == 1)
    {
      v20 = sqlite3_column_int64(*(sqlite3_stmt **)v23[0], 0);
      v28[0] = (degas::Statement *)sqlite3_column_blob(*(sqlite3_stmt **)v23[0], 1);
      *(_OWORD *)__p = 0u;
      memset(v32, 0, 25);
      if (v28[0]
        && (degas::Bitmap::replaceFromEncodedBuffer((degas::Bitmap *)__p, (const unsigned __int8 **)v28) & 1) == 0)
      {
        v5 = 4;
LABEL_49:
        *(_QWORD *)buf = v32;
        std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
        break;
      }
      degas::Statement::prepareForUse((degas::Statement *)ppStmt);
      degas::Statement::bindInteger(ppStmt, 1, v20);
      degas::Statement::bindBitmap((degas::Statement *)ppStmt, (const Bitmap *)2, (const degas::Bitmap *)__p);
      v5 = degas::Statement::update(ppStmt);
      if ((_DWORD)v5)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v21 = sqlite3_errmsg(*((sqlite3 **)v18 + 35));
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v21;
          _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "edge update failed: %s", buf, 0xCu);
        }
        goto LABEL_49;
      }
      *(_QWORD *)buf = v32;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    }
    degas::Statement::~Statement((degas::Statement *)ppStmt);
    degas::Cursor::~Cursor(v23);
    return v5;
  }
  return v1;
}

void sub_1CA1B8D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  uint64_t v34;
  uint64_t v35;

  *(_QWORD *)(v35 - 128) = v34;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v35 - 128));
  degas::Statement::~Statement((degas::Statement *)&a23);
  degas::Cursor::~Cursor((degas::Statement **)&a11);
  _Unwind_Resume(a1);
}

uint64_t degas::Migration::migrateWeights(degas::Database **this)
{
  degas::Database *v2;
  sqlite3_int64 v3;
  uint64_t v4;
  sqlite3_int64 v5;
  double v6;
  uint64_t v7;
  const char *v8;
  degas::Database *v9;
  degas::Database *v10;
  sqlite3_int64 v11;
  double v12;
  const char *v13;
  sqlite3 *v14;
  const char *v15;
  const char *v16;
  sqlite3 *v17;
  const char *v19;
  degas::Statement *v20[2];
  degas::Statement *v21[2];
  degas::Statement *v22[2];
  void *v23[2];
  char v24;
  _BYTE v25[12];
  char v26;
  _BYTE __p[12];
  char v28;
  _BYTE buf[12];
  char v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  std::string::basic_string[abi:ne180100]<0>(v23, (char *)kgDefaultWeightPropertyName);
  v2 = *this;
  degas::AttributeCursor::AttributeCursor((uint64_t *)v22, (uint64_t *)v23, (uint64_t)*this + 304);
  v3 = 0;
  while (degas::Statement::next((sqlite3_stmt **)v22[0]) == 1)
    v3 = sqlite3_column_int64(*(sqlite3_stmt **)v22[0], 0);
  if (v3)
    goto LABEL_5;
  v9 = *this;
  if (*((_BYTE *)*this + 32))
  {
    v7 = 8;
    goto LABEL_25;
  }
  *(_QWORD *)buf = 0;
  v7 = degas::AttributeTable::insert((uint64_t)v9 + 304, (sqlite3_int64 *)buf, (uint64_t *)v23);
  if ((_DWORD)v7)
  {
LABEL_25:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v16 = sqlite3_errmsg(*((sqlite3 **)v2 + 42));
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v16;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "weight migration failed: %s", buf, 0xCu);
    }
    goto LABEL_36;
  }
  v3 = *(_QWORD *)buf;
LABEL_5:
  v4 = (uint64_t)*this;
  std::string::basic_string[abi:ne180100]<0>(buf, "select identifier, weight from Node");
  degas::Database::cursorForAdhocStatement(v4, (uint64_t)buf, v21);
  if (v30 < 0)
    operator delete(*(void **)buf);
  while (degas::Statement::next((sqlite3_stmt **)v21[0]) == 1)
  {
    v5 = sqlite3_column_int64(*(sqlite3_stmt **)v21[0], 0);
    v6 = sqlite3_column_double(*(sqlite3_stmt **)v21[0], 1);
    v7 = degas::Database::setNodeAttributeValue(*this, v5, v3, v6);
    if ((_DWORD)v7)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v8 = sqlite3_errmsg(*((sqlite3 **)v2 + 42));
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v8;
        _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "weight migration failed: %s", buf, 0xCu);
      }
      goto LABEL_35;
    }
  }
  v10 = *this;
  std::string::basic_string[abi:ne180100]<0>(buf, "select identifier, weight from Edge");
  degas::Database::cursorForAdhocStatement((uint64_t)v10, (uint64_t)buf, v20);
  if (v30 < 0)
    operator delete(*(void **)buf);
  while (degas::Statement::next((sqlite3_stmt **)v20[0]) == 1)
  {
    v11 = sqlite3_column_int64(*(sqlite3_stmt **)v20[0], 0);
    v12 = sqlite3_column_double(*(sqlite3_stmt **)v20[0], 1);
    v7 = degas::Database::setEdgeAttributeValue(*this, v11, v3, v12);
    if ((_DWORD)v7)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v13 = sqlite3_errmsg(*((sqlite3 **)v2 + 42));
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v13;
        _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "weight migration failed: %s", buf, 0xCu);
      }
      goto LABEL_34;
    }
  }
  v14 = this[1];
  std::string::basic_string[abi:ne180100]<0>(__p, "alter table Node drop column weight");
  degas::Statement::Statement((sqlite3_stmt **)buf, v14, (uint64_t)__p);
  if (v28 < 0)
    operator delete(*(void **)__p);
  v7 = degas::Statement::update((sqlite3_stmt **)buf);
  if ((_DWORD)v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v15 = sqlite3_errmsg(*((sqlite3 **)*this + 28));
      *(_DWORD *)__p = 136315138;
      *(_QWORD *)&__p[4] = v15;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "weight migration failed trying to drop weight column: %s", __p, 0xCu);
    }
  }
  else
  {
    v17 = this[1];
    std::string::basic_string[abi:ne180100]<0>(v25, "alter table Edge drop column weight");
    degas::Statement::Statement((sqlite3_stmt **)__p, v17, (uint64_t)v25);
    if (v26 < 0)
      operator delete(*(void **)v25);
    v7 = degas::Statement::update((sqlite3_stmt **)__p);
    if ((_DWORD)v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v19 = sqlite3_errmsg(*((sqlite3 **)*this + 35));
      *(_DWORD *)v25 = 136315138;
      *(_QWORD *)&v25[4] = v19;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "weight migration failed trying to drop weight column: %s", v25, 0xCu);
    }
    degas::Statement::~Statement((degas::Statement *)__p);
  }
  degas::Statement::~Statement((degas::Statement *)buf);
LABEL_34:
  degas::Cursor::~Cursor(v20);
LABEL_35:
  degas::Cursor::~Cursor(v21);
LABEL_36:
  degas::Cursor::~Cursor(v22);
  if (v24 < 0)
    operator delete(v23[0]);
  return v7;
}

void sub_1CA1B931C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, degas::Statement *a10, uint64_t a11, degas::Statement *a12, uint64_t a13, degas::Statement *a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  uint64_t v34;

  degas::Statement::~Statement((degas::Statement *)&a29);
  degas::Statement::~Statement((degas::Statement *)(v34 - 80));
  degas::Cursor::~Cursor(&a10);
  degas::Cursor::~Cursor(&a12);
  degas::Cursor::~Cursor(&a14);
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t degas::Migration::migrateEdgeIndex(degas::Migration *this)
{
  sqlite3 *v2;
  uint64_t v3;
  sqlite3 *v4;
  void *v6[2];
  char v7;
  void *__p[2];
  char v9;
  sqlite3_stmt *ppStmt[3];

  v2 = (sqlite3 *)*((_QWORD *)this + 1);
  std::string::basic_string[abi:ne180100]<0>(__p, "create index edge_source_idx on edge (sourceNodeId)");
  degas::Statement::Statement(ppStmt, v2, (uint64_t)__p);
  if (v9 < 0)
    operator delete(__p[0]);
  v3 = degas::Statement::update(ppStmt);
  if (!(_DWORD)v3)
  {
    v4 = (sqlite3 *)*((_QWORD *)this + 1);
    std::string::basic_string[abi:ne180100]<0>(v6, "create index edge_target_idx on edge (targetNodeId)");
    degas::Statement::Statement((sqlite3_stmt **)__p, v4, (uint64_t)v6);
    if (v7 < 0)
      operator delete(v6[0]);
    v3 = degas::Statement::update((sqlite3_stmt **)__p);
    degas::Statement::~Statement((degas::Statement *)__p);
  }
  degas::Statement::~Statement((degas::Statement *)ppStmt);
  return v3;
}

void sub_1CA1B94EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  uint64_t v16;

  degas::Statement::~Statement((degas::Statement *)&a16);
  degas::Statement::~Statement((degas::Statement *)(v16 - 40));
  _Unwind_Resume(a1);
}

void sub_1CA1B952C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
    operator delete(__p);
  JUMPOUT(0x1CA1B9524);
}

uint64_t degas::Migration::migratePruneSchema(sqlite3 **this)
{
  uint64_t v2;
  sqlite3 *v3;
  sqlite3 *v4;
  sqlite3 *v5;
  sqlite3 *v6;
  sqlite3 *v7;
  sqlite3 *v8;
  void *__p[2];
  char v11;
  sqlite3_stmt *ppStmt[3];

  if (sqlite3_table_column_metadata(this[1], 0, "Attribute", "dataType", 0, 0, 0, 0, 0))
    goto LABEL_34;
  v3 = this[1];
  std::string::basic_string[abi:ne180100]<0>(__p, "alter table Attribute drop column dataType");
  degas::Statement::Statement(ppStmt, v3, (uint64_t)__p);
  if (v11 < 0)
    operator delete(__p[0]);
  v2 = degas::Statement::update(ppStmt);
  degas::Statement::~Statement((degas::Statement *)ppStmt);
  if (!(_DWORD)v2)
  {
LABEL_34:
    if (sqlite3_table_column_metadata(this[1], 0, "Attribute", "flags", 0, 0, 0, 0, 0))
      goto LABEL_35;
    v4 = this[1];
    std::string::basic_string[abi:ne180100]<0>(__p, "alter table Attribute drop column flags");
    degas::Statement::Statement(ppStmt, v4, (uint64_t)__p);
    if (v11 < 0)
      operator delete(__p[0]);
    v2 = degas::Statement::update(ppStmt);
    degas::Statement::~Statement((degas::Statement *)ppStmt);
    if (!(_DWORD)v2)
    {
LABEL_35:
      if (sqlite3_table_column_metadata(this[1], 0, "Node", "attrIds", 0, 0, 0, 0, 0))
        goto LABEL_36;
      v5 = this[1];
      std::string::basic_string[abi:ne180100]<0>(__p, "alter table Node drop column attrIds");
      degas::Statement::Statement(ppStmt, v5, (uint64_t)__p);
      if (v11 < 0)
        operator delete(__p[0]);
      v2 = degas::Statement::update(ppStmt);
      degas::Statement::~Statement((degas::Statement *)ppStmt);
      if (!(_DWORD)v2)
      {
LABEL_36:
        if (sqlite3_table_column_metadata(this[1], 0, "Edge", "attrIds", 0, 0, 0, 0, 0))
          goto LABEL_37;
        v6 = this[1];
        std::string::basic_string[abi:ne180100]<0>(__p, "alter table Edge drop column attrIds");
        degas::Statement::Statement(ppStmt, v6, (uint64_t)__p);
        if (v11 < 0)
          operator delete(__p[0]);
        v2 = degas::Statement::update(ppStmt);
        degas::Statement::~Statement((degas::Statement *)ppStmt);
        if (!(_DWORD)v2)
        {
LABEL_37:
          if (sqlite3_table_column_metadata(this[1], 0, "TombstoneNode", "attrIds", 0, 0, 0, 0, 0))
            goto LABEL_38;
          v7 = this[1];
          std::string::basic_string[abi:ne180100]<0>(__p, "alter table TombstoneNode drop column attrIds");
          degas::Statement::Statement(ppStmt, v7, (uint64_t)__p);
          if (v11 < 0)
            operator delete(__p[0]);
          v2 = degas::Statement::update(ppStmt);
          degas::Statement::~Statement((degas::Statement *)ppStmt);
          if (!(_DWORD)v2)
          {
LABEL_38:
            if (sqlite3_table_column_metadata(this[1], 0, "TombstoneEdge", "attrIds", 0, 0, 0, 0, 0))
            {
              return 0;
            }
            else
            {
              v8 = this[1];
              std::string::basic_string[abi:ne180100]<0>(__p, "alter table TombstoneEdge drop column attrIds");
              degas::Statement::Statement(ppStmt, v8, (uint64_t)__p);
              if (v11 < 0)
                operator delete(__p[0]);
              v2 = degas::Statement::update(ppStmt);
              degas::Statement::~Statement((degas::Statement *)ppStmt);
            }
          }
        }
      }
    }
  }
  return v2;
}

void sub_1CA1B9884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  degas::Statement::~Statement((degas::Statement *)&a17);
  _Unwind_Resume(a1);
}

uint64_t degas::Migration::migrate(degas::Migration *this, int a2, int a3)
{
  _BOOL4 v5;
  BOOL v6;
  _BOOL4 v7;
  BOOL v8;
  _BOOL4 v9;
  BOOL v10;
  _BOOL4 v11;
  uint64_t result;

  if (!a2)
    goto LABEL_39;
  v5 = a3 > 1 && a2 < 2;
  v6 = a2 >= 4 || a3 <= 3;
  v7 = !v6;
  v8 = a2 >= 6 || a3 <= 5;
  v9 = !v8;
  v10 = a2 >= 8 || a3 <= 7;
  v11 = !v10;
  if (a2 > 2 || a3 < 3 || (result = degas::Migration::migrateBitmapSchema((sqlite3 **)this), !(_DWORD)result))
  {
    if (!v11 || (result = degas::Migration::migratePruneSchema((sqlite3 **)this), !(_DWORD)result))
    {
      if (!v5 || (result = degas::Migration::migrateAttributeSchema(this), !(_DWORD)result))
      {
        if (!v7 || (result = degas::Migration::migrateWeights((degas::Database **)this), !(_DWORD)result))
        {
          if (!v9 || (result = degas::Migration::migrateEdgeIndex(this), !(_DWORD)result))
          {
LABEL_39:
            if (!*(_BYTE *)(*(_QWORD *)this + 32))
              degas::MetadataTable::insertOrUpdate((degas::MetadataTable *)(*(_QWORD *)this + 136), 3, a3);
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t degas::BitsetPoolPage::BitsetPoolPage(uint64_t this, os_unfair_lock_s *a2)
{
  *(_QWORD *)(this + 8352) = 0;
  *(_QWORD *)(this + 8360) = a2;
  return this;
}

{
  *(_QWORD *)(this + 8352) = 0;
  *(_QWORD *)(this + 8360) = a2;
  return this;
}

uint64_t degas::BitsetPoolPage::allocBitsetSlot(degas::BitsetPoolPage *this)
{
  unsigned int v2;

  v2 = degas::BitsetPoolPage::provideFreeSlot(this);
  *((_QWORD *)this + 1044) |= 1 << v2;
  return (uint64_t)this + 144 * v2;
}

uint64_t degas::BitsetPoolPage::provideFreeSlot(degas::BitsetPoolPage *this)
{
  unint64_t v1;
  uint64_t result;

  v1 = *((_QWORD *)this + 1044);
  if ((~v1 & 0x3FFFFFFFFFFFFFFLL) == 0)
    __assert_rtn("provideFreeSlot", "bitsetPool.cpp", 129, "!isFull()");
  result = 0;
  while (((v1 >> result) & 1) != 0)
  {
    if (++result == 58)
      return 0;
  }
  return result;
}

void degas::BitsetPoolPage::allocBitset(degas::BitsetPoolPage *this, degas::BitsetPtr *a2, uint64_t a3)
{
  unsigned int v6;
  char *v7;

  v6 = degas::BitsetPoolPage::provideFreeSlot(this);
  *((_QWORD *)this + 1044) |= 1 << v6;
  v7 = (char *)this + 144 * v6;
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = a3;
  *((_OWORD *)v7 + 1) = 0u;
  *((_OWORD *)v7 + 2) = 0u;
  *((_OWORD *)v7 + 3) = 0u;
  *((_OWORD *)v7 + 4) = 0u;
  *((_OWORD *)v7 + 5) = 0u;
  *((_OWORD *)v7 + 6) = 0u;
  *((_OWORD *)v7 + 7) = 0u;
  *((_OWORD *)v7 + 8) = 0u;
  degas::BitsetPtr::releaseBitset(a2);
  *(_QWORD *)a2 = v7;
  *((_QWORD *)a2 + 1) = this;
  ++*(_DWORD *)v7;
}

void degas::BitsetPoolPage::allocBitset(degas::BitsetPoolPage *this, degas::BitsetPtr *a2, const degas::Bitset *a3)
{
  unsigned int v6;
  char *v7;
  int v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v6 = degas::BitsetPoolPage::provideFreeSlot(this);
  v7 = (char *)this + 144 * v6;
  *((_QWORD *)this + 1044) |= 1 << v6;
  v8 = *((_DWORD *)a3 + 1);
  *(_DWORD *)v7 = 0;
  *((_DWORD *)v7 + 1) = v8;
  *((_QWORD *)v7 + 1) = *((_QWORD *)a3 + 1);
  v9 = *((_OWORD *)a3 + 4);
  v11 = *((_OWORD *)a3 + 1);
  v10 = *((_OWORD *)a3 + 2);
  *((_OWORD *)v7 + 3) = *((_OWORD *)a3 + 3);
  *((_OWORD *)v7 + 4) = v9;
  *((_OWORD *)v7 + 1) = v11;
  *((_OWORD *)v7 + 2) = v10;
  v12 = *((_OWORD *)a3 + 8);
  v14 = *((_OWORD *)a3 + 5);
  v13 = *((_OWORD *)a3 + 6);
  *((_OWORD *)v7 + 7) = *((_OWORD *)a3 + 7);
  *((_OWORD *)v7 + 8) = v12;
  *((_OWORD *)v7 + 5) = v14;
  *((_OWORD *)v7 + 6) = v13;
  degas::BitsetPtr::releaseBitset(a2);
  *(_QWORD *)a2 = v7;
  *((_QWORD *)a2 + 1) = this;
  ++*(_DWORD *)v7;
}

void degas::BitsetPoolPage::allocBitset(degas::BitsetPoolPage *this, degas::BitsetPtr *a2, const unsigned __int8 **a3)
{
  unsigned int v6;
  degas::Bitset *v7;

  v6 = degas::BitsetPoolPage::provideFreeSlot(this);
  v7 = (degas::BitsetPoolPage *)((char *)this + 144 * v6);
  *((_QWORD *)this + 1044) |= 1 << v6;
  degas::Bitset::Bitset(v7, a3);
  degas::BitsetPtr::releaseBitset(a2);
  *(_QWORD *)a2 = v7;
  *((_QWORD *)a2 + 1) = this;
  ++*(_DWORD *)v7;
}

void degas::BitsetPoolPage::releaseBitset(os_unfair_lock_t *this, degas::Bitset *a2)
{
  int v2;

  v2 = (int)a2;
  os_unfair_lock_lock(this[1045]);
  this[1044] = (os_unfair_lock_t)((unint64_t)this[1044] & ~(1 << ((v2 - (int)this) / 0x90u)));
  os_unfair_lock_unlock(this[1045]);
}

BOOL degas::BitsetPoolPage::isFull(degas::BitsetPoolPage *this)
{
  return (~*((_QWORD *)this + 1044) & 0x3FFFFFFFFFFFFFFLL) == 0;
}

BOOL degas::BitsetPoolPage::isEmpty(degas::BitsetPoolPage *this)
{
  return *((_QWORD *)this + 1044) == 0;
}

uint64_t degas::BitsetPool::BitsetPool(uint64_t this)
{
  *(_QWORD *)this = this;
  *(_QWORD *)(this + 8) = this;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)(this + 24) = this;
  *(_DWORD *)(this + 32) = 0;
  return this;
}

{
  *(_QWORD *)this = this;
  *(_QWORD *)(this + 8) = this;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)(this + 24) = this;
  *(_DWORD *)(this + 32) = 0;
  return this;
}

uint64_t degas::BitsetPool::getPageWithSlotFree(degas::BitsetPool *this)
{
  degas::BitsetPool *v2;
  degas::BitsetPool *v3;
  uint64_t v4;
  degas::BitsetPool *v5;
  _QWORD *v6;
  uint64_t v7;

  v2 = (degas::BitsetPool *)*((_QWORD *)this + 3);
  if (v2 == this)
  {
LABEL_5:
    v5 = this;
    while (1)
    {
      v5 = (degas::BitsetPool *)*((_QWORD *)v5 + 1);
      *((_QWORD *)this + 3) = v5;
      if (v5 == v2)
        break;
      v4 = *((_QWORD *)v5 + 2);
      if ((~*(_QWORD *)(v4 + 8352) & 0x3FFFFFFFFFFFFFFLL) != 0)
        return v4;
    }
    v4 = operator new();
    *(_QWORD *)(v4 + 8352) = 0;
    *(_QWORD *)(v4 + 8360) = (char *)this + 32;
    v6 = operator new(0x18uLL);
    v6[1] = this;
    v6[2] = v4;
    v7 = *(_QWORD *)this;
    *v6 = *(_QWORD *)this;
    *(_QWORD *)(v7 + 8) = v6;
    *(_QWORD *)this = v6;
    ++*((_QWORD *)this + 2);
    *((_QWORD *)this + 3) = v6;
  }
  else
  {
    v3 = (degas::BitsetPool *)*((_QWORD *)this + 3);
    while (1)
    {
      v4 = *((_QWORD *)v3 + 2);
      if ((~*(_QWORD *)(v4 + 8352) & 0x3FFFFFFFFFFFFFFLL) != 0)
        break;
      v3 = (degas::BitsetPool *)*((_QWORD *)v3 + 1);
      *((_QWORD *)this + 3) = v3;
      if (v3 == this)
        goto LABEL_5;
    }
  }
  return v4;
}

void degas::BitsetPool::allocBitset(os_unfair_lock_s *this, degas::BitsetPtr *a2, uint64_t a3)
{
  os_unfair_lock_s *v6;
  degas::BitsetPoolPage *PageWithSlotFree;

  v6 = this + 8;
  os_unfair_lock_lock(this + 8);
  PageWithSlotFree = (degas::BitsetPoolPage *)degas::BitsetPool::getPageWithSlotFree((degas::BitsetPool *)this);
  degas::BitsetPoolPage::allocBitset(PageWithSlotFree, a2, a3);
  os_unfair_lock_unlock(v6);
}

void degas::BitsetPool::allocBitset(os_unfair_lock_s *this, degas::BitsetPtr *a2, const degas::Bitset *a3)
{
  os_unfair_lock_s *v6;
  degas::BitsetPoolPage *PageWithSlotFree;

  v6 = this + 8;
  os_unfair_lock_lock(this + 8);
  PageWithSlotFree = (degas::BitsetPoolPage *)degas::BitsetPool::getPageWithSlotFree((degas::BitsetPool *)this);
  degas::BitsetPoolPage::allocBitset(PageWithSlotFree, a2, a3);
  os_unfair_lock_unlock(v6);
}

void degas::BitsetPool::allocBitset(os_unfair_lock_s *this, degas::BitsetPtr *a2, const unsigned __int8 **a3)
{
  os_unfair_lock_s *v6;
  degas::BitsetPoolPage *PageWithSlotFree;

  v6 = this + 8;
  os_unfair_lock_lock(this + 8);
  PageWithSlotFree = (degas::BitsetPoolPage *)degas::BitsetPool::getPageWithSlotFree((degas::BitsetPool *)this);
  degas::BitsetPoolPage::allocBitset(PageWithSlotFree, a2, a3);
  os_unfair_lock_unlock(v6);
}

void degas::BitsetPool::purgeEmptyPages(os_unfair_lock_s *this)
{
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  os_unfair_lock_s *v7;

  v2 = this + 8;
  os_unfair_lock_lock(this + 8);
  v3 = *(os_unfair_lock_s **)&this[2]._os_unfair_lock_opaque;
  while (v3 != this)
  {
    v4 = *(_QWORD *)&v3[4]._os_unfair_lock_opaque;
    if (*(_QWORD *)(v4 + 8352))
    {
      v3 = *(os_unfair_lock_s **)&v3[2]._os_unfair_lock_opaque;
    }
    else
    {
      v5 = *(_QWORD *)&this[6]._os_unfair_lock_opaque;
      if (*(_QWORD *)(v5 + 16) == v4)
        *(_QWORD *)&this[6]._os_unfair_lock_opaque = *(_QWORD *)(v5 + 8);
      v6 = *(_QWORD *)&v3->_os_unfair_lock_opaque;
      v7 = *(os_unfair_lock_s **)&v3[2]._os_unfair_lock_opaque;
      *(_QWORD *)(v6 + 8) = v7;
      **(_QWORD **)&v3[2]._os_unfair_lock_opaque = v6;
      --*(_QWORD *)&this[4]._os_unfair_lock_opaque;
      operator delete(v3);
      MEMORY[0x1CAA4ADC8](v4, 0x1020C4058D1BB3BLL);
      v3 = v7;
    }
  }
  os_unfair_lock_unlock(v2);
}

uint64_t degas::getBitsetPool(degas *this)
{
  if (degas::getBitsetPool(void)::onceToken != -1)
    dispatch_once(&degas::getBitsetPool(void)::onceToken, &__block_literal_global_3736);
  return degas::getBitsetPool(void)::sPool;
}

uint64_t ___ZN5degas13getBitsetPoolEv_block_invoke()
{
  uint64_t result;

  result = operator new();
  *(_QWORD *)result = result;
  *(_QWORD *)(result + 8) = result;
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = result;
  *(_DWORD *)(result + 32) = 0;
  degas::getBitsetPool(void)::sPool = result;
  return result;
}

_QWORD *degas::BitsetPtr::BitsetPtr(_QWORD *this, degas::Bitset *a2, degas::BitsetPoolPage *a3)
{
  *this = a2;
  this[1] = a3;
  ++*(_DWORD *)a2;
  return this;
}

{
  *this = a2;
  this[1] = a3;
  ++*(_DWORD *)a2;
  return this;
}

__n128 degas::BitsetPtr::BitsetPtr(__n128 *this, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *this = *a2;
  ++*(_DWORD *)result.n128_u64[0];
  return result;
}

{
  __n128 result;

  result = *a2;
  *this = *a2;
  ++*(_DWORD *)result.n128_u64[0];
  return result;
}

void degas::BitsetPtr::releaseBitset(degas::BitsetPtr *this)
{
  os_unfair_lock_t *v2;
  degas::Bitset *v3;

  v2 = (os_unfair_lock_t *)*((_QWORD *)this + 1);
  if (v2)
  {
    v3 = *(degas::Bitset **)this;
    if (*(_QWORD *)this)
    {
      if ((*(_DWORD *)v3)-- == 1)
        degas::BitsetPoolPage::releaseBitset(v2, v3);
    }
  }
  *(_QWORD *)this = 0;
}

void degas::BitsetPtr::~BitsetPtr(degas::BitsetPtr *this)
{
  degas::BitsetPtr::releaseBitset(this);
  *((_QWORD *)this + 1) = 0;
}

{
  degas::BitsetPtr::releaseBitset(this);
  *((_QWORD *)this + 1) = 0;
}

degas::BitsetPtr *degas::BitsetPtr::operator=(degas::BitsetPtr *a1, __int128 *a2)
{
  __int128 v4;

  degas::BitsetPtr::releaseBitset(a1);
  v4 = *a2;
  *(_OWORD *)a1 = *a2;
  if ((_QWORD)v4)
    ++*(_DWORD *)v4;
  return a1;
}

BOOL degas::BitsetPtr::operator==(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void degas::BitsetPtr::reset(degas::BitsetPtr *this, degas::Bitset *a2, degas::BitsetPoolPage *a3)
{
  degas::BitsetPtr::releaseBitset(this);
  *(_QWORD *)this = a2;
  if (a3)
    *((_QWORD *)this + 1) = a3;
  ++*(_DWORD *)a2;
}

BOOL degas::BitsetPtr::unique(degas::BitsetPtr *this)
{
  return *(_QWORD *)this && **(_DWORD **)this == 1;
}

void degas::NodeFilter_Labels::~NodeFilter_Labels(degas::NodeFilter_Labels *this)
{
  void **v1;

  *(_QWORD *)this = &off_1E83E4B38;
  v1 = (void **)((char *)this + 32);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
}

{
  void **v1;

  *(_QWORD *)this = &off_1E83E4B38;
  v1 = (void **)((char *)this + 32);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x1CAA4ADC8);
}

{
  void **v1;

  *(_QWORD *)this = &off_1E83E4B38;
  v1 = (void **)((char *)this + 32);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
}

uint64_t degas::NodeFilter_Labels::resolveNodes(degas::NodeFilter_Labels *this, degas::Bitmap *a2)
{
  uint64_t v3;
  Bitmap *v4;
  sqlite3_int64 Bit;
  const degas::NodeTable *v7[2];

  v3 = *((_QWORD *)this + 1);
  v7[0] = (const degas::NodeTable *)(v3 + 192);
  v7[1] = (const degas::NodeTable *)v3;
  v4 = (Bitmap *)((char *)this + 16);
  if (degas::Bitmap::count((degas::NodeFilter_Labels *)((char *)this + 16)) != 1)
    return degas::NodeLabelQuery::nodesForAllLabels(v7, v4, a2);
  Bit = degas::Bitmap::firstBit((degas::Bitmap *)v4);
  return degas::NodeLabelQuery::nodesForLabel(v7, Bit, a2);
}

void degas::NodeFilter_Attribute::~NodeFilter_Attribute(void **this)
{
  *this = off_1E83E4B60;
  if (*((char *)this + 71) < 0)
    operator delete(this[6]);
}

{
  *this = off_1E83E4B60;
  if (*((char *)this + 71) < 0)
    operator delete(this[6]);
  JUMPOUT(0x1CAA4ADC8);
}

{
  *this = off_1E83E4B60;
  if (*((char *)this + 71) < 0)
    operator delete(this[6]);
}

uint64_t degas::NodeFilter_Attribute::resolveNodes(degas::NodeFilter_Attribute *this, degas::Bitmap *a2)
{
  degas::Database *v4;
  int v5;
  uint64_t v7[2];

  v4 = (degas::Database *)*((_QWORD *)this + 1);
  v7[0] = (uint64_t)v4 + 472;
  v7[1] = degas::Database::nodeCount(v4);
  v5 = *((_DWORD *)this + 4);
  switch(v5)
  {
    case 3:
      return degas::AttributeQuery::elementsForAttributeValue(v7, *((_QWORD *)this + 3), (uint64_t)this + 48, 1, a2);
    case 2:
      return degas::AttributeQuery::elementsForAttributeValue(v7, *((_QWORD *)this + 3), 1, a2, *((double *)this + 5));
    case 1:
      return degas::AttributeQuery::elementsForAttributeValue(v7, *((_QWORD *)this + 3), *((_QWORD *)this + 4), 1, a2);
  }
  return 3;
}

void degas::NodeFilter_Or::~NodeFilter_Or(degas::NodeFilter_Or *this)
{
  void **v1;

  *(_QWORD *)this = &off_1E83E4B88;
  v1 = (void **)((char *)this + 16);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

{
  void **v1;

  *(_QWORD *)this = &off_1E83E4B88;
  v1 = (void **)((char *)this + 16);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x1CAA4ADC8);
}

{
  void **v1;

  *(_QWORD *)this = &off_1E83E4B88;
  v1 = (void **)((char *)this + 16);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

uint64_t degas::NodeFilter_Or::resolveNodes(degas::NodeFilter_Or *this, degas::Bitmap *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  __int128 v7;
  _BYTE v8[32];
  __int128 v9;
  _BYTE v10[40];
  void **v11;

  v9 = 0u;
  memset(v10, 0, 25);
  v3 = (_QWORD *)*((_QWORD *)this + 2);
  v4 = (_QWORD *)*((_QWORD *)this + 3);
  if (v3 == v4)
  {
LABEL_4:
    degas::Bitmap::operator=(a2, &v9);
    v5 = 0;
  }
  else
  {
    while (1)
    {
      v7 = 0u;
      memset(v8, 0, 25);
      v5 = (*(uint64_t (**)(_QWORD, __int128 *))(*(_QWORD *)*v3 + 16))(*v3, &v7);
      if ((_DWORD)v5)
        break;
      degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)&v9, (uint64_t)&v7);
      v11 = (void **)v8;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v11);
      v3 += 2;
      if (v3 == v4)
        goto LABEL_4;
    }
    v11 = (void **)v8;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v11);
  }
  *(_QWORD *)&v7 = v10;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  return v5;
}

void sub_1CA1BA694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  a9 = (void **)&a17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void degas::NodeFilter_And::~NodeFilter_And(degas::NodeFilter_And *this)
{
  void **v1;

  *(_QWORD *)this = &off_1E83E4BB0;
  v1 = (void **)((char *)this + 16);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

{
  void **v1;

  *(_QWORD *)this = &off_1E83E4BB0;
  v1 = (void **)((char *)this + 16);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x1CAA4ADC8);
}

{
  void **v1;

  *(_QWORD *)this = &off_1E83E4BB0;
  v1 = (void **)((char *)this + 16);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

uint64_t degas::NodeFilter_And::resolveNodes(degas::NodeFilter_And *this, degas::Bitmap *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  char v5;
  uint64_t v6;
  __int128 v8;
  _BYTE v9[32];
  __int128 v10;
  _BYTE v11[40];
  void **v12;

  v10 = 0u;
  memset(v11, 0, 25);
  v3 = (_QWORD *)*((_QWORD *)this + 2);
  v4 = (_QWORD *)*((_QWORD *)this + 3);
  if (v3 == v4)
  {
LABEL_8:
    degas::Bitmap::operator=(a2, &v10);
    v6 = 0;
  }
  else
  {
    v5 = 1;
    while (1)
    {
      v8 = 0u;
      memset(v9, 0, 25);
      v6 = (*(uint64_t (**)(_QWORD, __int128 *))(*(_QWORD *)*v3 + 16))(*v3, &v8);
      if ((_DWORD)v6)
        break;
      if ((v5 & 1) != 0)
        degas::Bitmap::operator=(&v10, &v8);
      else
        degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)&v10, (degas::Bitmap *)&v8);
      v12 = (void **)v9;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v12);
      v5 = 0;
      v3 += 2;
      if (v3 == v4)
        goto LABEL_8;
    }
    v12 = (void **)v9;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v12);
  }
  *(_QWORD *)&v8 = v11;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v8);
  return v6;
}

void sub_1CA1BA854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  a9 = (void **)&a17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

_QWORD *degas::NodeFilter::NodeFilter(_QWORD *result, uint64_t a2)
{
  *result = off_1E83E4B10;
  result[1] = a2;
  return result;
}

degas::NodeFilter_Labels *degas::NodeFilter_Labels::NodeFilter_Labels(degas::NodeFilter_Labels *this, degas::Database *a2, __int128 **a3)
{
  *(_QWORD *)this = &off_1E83E4B38;
  *((_QWORD *)this + 1) = a2;
  *((_QWORD *)this + 2) = *a3;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 32, a3[2], a3[3], a3[3] - a3[2]);
  *((_BYTE *)this + 56) = *((_BYTE *)a3 + 40);
  return this;
}

{
  *(_QWORD *)this = &off_1E83E4B38;
  *((_QWORD *)this + 1) = a2;
  *((_QWORD *)this + 2) = *a3;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 32, a3[2], a3[3], a3[3] - a3[2]);
  *((_BYTE *)this + 56) = *((_BYTE *)a3 + 40);
  return this;
}

degas::NodeFilter_Labels *degas::NodeFilter_Labels::NodeFilter_Labels(degas::NodeFilter_Labels *this, degas::Database *a2, unint64_t a3)
{
  *(_QWORD *)this = &off_1E83E4B38;
  *((_QWORD *)this + 1) = a2;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)((char *)this + 41) = 0u;
  *((_OWORD *)this + 1) = 0u;
  degas::Bitmap::setBit((degas::NodeFilter_Labels *)((char *)this + 16), a3);
  return this;
}

void sub_1CA1BA9A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  uint64_t v10;

  a10 = (void **)(v10 + 32);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

uint64_t degas::NodeFilter_Labels::addLabel(degas::NodeFilter_Labels *this, unint64_t a2)
{
  return degas::Bitmap::setBit((degas::NodeFilter_Labels *)((char *)this + 16), a2);
}

double degas::NodeFilter_Attribute::NodeFilter_Attribute(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double result;

  *(_QWORD *)a1 = off_1E83E4B60;
  *(_QWORD *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 24) = a3;
  *(_QWORD *)(a1 + 32) = a4;
  result = 0.0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  return result;
}

{
  double result;

  *(_QWORD *)a1 = off_1E83E4B60;
  *(_QWORD *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 24) = a3;
  *(_QWORD *)(a1 + 32) = a4;
  result = 0.0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  return result;
}

uint64_t degas::NodeFilter_Attribute::NodeFilter_Attribute(uint64_t result, uint64_t a2, uint64_t a3, double a4)
{
  *(_QWORD *)result = off_1E83E4B60;
  *(_QWORD *)(result + 8) = a2;
  *(_DWORD *)(result + 16) = 2;
  *(_QWORD *)(result + 24) = a3;
  *(_QWORD *)(result + 32) = 0;
  *(double *)(result + 40) = a4;
  *(_QWORD *)(result + 56) = 0;
  *(_QWORD *)(result + 64) = 0;
  *(_QWORD *)(result + 48) = 0;
  return result;
}

{
  *(_QWORD *)result = off_1E83E4B60;
  *(_QWORD *)(result + 8) = a2;
  *(_DWORD *)(result + 16) = 2;
  *(_QWORD *)(result + 24) = a3;
  *(_QWORD *)(result + 32) = 0;
  *(double *)(result + 40) = a4;
  *(_QWORD *)(result + 56) = 0;
  *(_QWORD *)(result + 64) = 0;
  *(_QWORD *)(result + 48) = 0;
  return result;
}

uint64_t degas::NodeFilter_Attribute::NodeFilter_Attribute(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4)
{
  std::string *v5;
  __int128 v6;

  *(_QWORD *)a1 = off_1E83E4B60;
  *(_QWORD *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = 3;
  v5 = (std::string *)(a1 + 48);
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 24) = a3;
  if (*((char *)a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)a4, *((_QWORD *)a4 + 1));
  }
  else
  {
    v6 = *a4;
    v5->__r_.__value_.__r.__words[2] = *((_QWORD *)a4 + 2);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  return a1;
}

_QWORD *degas::NodeFilter_Or::NodeFilter_Or(_QWORD *result, uint64_t a2)
{
  *result = &off_1E83E4B88;
  result[1] = a2;
  result[3] = 0;
  result[4] = 0;
  result[2] = 0;
  return result;
}

{
  *result = &off_1E83E4B88;
  result[1] = a2;
  result[3] = 0;
  result[4] = 0;
  result[2] = 0;
  return result;
}

_QWORD *degas::NodeFilter_Or::NodeFilter_Or(_QWORD *a1, uint64_t a2, _QWORD **a3)
{
  *a1 = &off_1E83E4B88;
  a1[1] = a2;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  std::vector<std::shared_ptr<degas::NodeFilter>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::NodeFilter>*,std::shared_ptr<degas::NodeFilter>*>(a1 + 2, *a3, a3[1], ((char *)a3[1] - (char *)*a3) >> 4);
  return a1;
}

{
  *a1 = &off_1E83E4B88;
  a1[1] = a2;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  std::vector<std::shared_ptr<degas::NodeFilter>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::NodeFilter>*,std::shared_ptr<degas::NodeFilter>*>(a1 + 2, *a3, a3[1], ((char *)a3[1] - (char *)*a3) >> 4);
  return a1;
}

_QWORD *std::vector<std::shared_ptr<degas::NodeFilter>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::NodeFilter>*,std::shared_ptr<degas::NodeFilter>*>(_QWORD *result, _QWORD *a2, _QWORD *a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  if (a4)
  {
    if (a4 >> 60)
      std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
    v6 = result;
    result = std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<degas::Predicate>>>(a4);
    *v6 = result;
    v6[1] = result;
    v6[2] = &result[2 * v7];
    while (a2 != a3)
    {
      *result = *a2;
      v8 = a2[1];
      result[1] = v8;
      if (v8)
      {
        v9 = (unint64_t *)(v8 + 8);
        do
          v10 = __ldxr(v9);
        while (__stxr(v10 + 1, v9));
      }
      a2 += 2;
      result += 2;
    }
    v6[1] = result;
  }
  return result;
}

void sub_1CA1BAC70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void degas::NodeFilter_Or::addSubFilter(uint64_t a1, __int128 *a2)
{
  std::vector<std::shared_ptr<degas::Predicate>>::push_back[abi:ne180100]((char **)(a1 + 16), a2);
}

_QWORD *degas::NodeFilter_And::NodeFilter_And(_QWORD *result, uint64_t a2)
{
  *result = &off_1E83E4BB0;
  result[1] = a2;
  result[3] = 0;
  result[4] = 0;
  result[2] = 0;
  return result;
}

{
  *result = &off_1E83E4BB0;
  result[1] = a2;
  result[3] = 0;
  result[4] = 0;
  result[2] = 0;
  return result;
}

_QWORD *degas::NodeFilter_And::NodeFilter_And(_QWORD *a1, uint64_t a2, _QWORD **a3)
{
  *a1 = &off_1E83E4BB0;
  a1[1] = a2;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  std::vector<std::shared_ptr<degas::NodeFilter>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::NodeFilter>*,std::shared_ptr<degas::NodeFilter>*>(a1 + 2, *a3, a3[1], ((char *)a3[1] - (char *)*a3) >> 4);
  return a1;
}

{
  *a1 = &off_1E83E4BB0;
  a1[1] = a2;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  std::vector<std::shared_ptr<degas::NodeFilter>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::NodeFilter>*,std::shared_ptr<degas::NodeFilter>*>(a1 + 2, *a3, a3[1], ((char *)a3[1] - (char *)*a3) >> 4);
  return a1;
}

void degas::NodeFilter_And::addSubFilter(uint64_t a1, __int128 *a2)
{
  std::vector<std::shared_ptr<degas::Predicate>>::push_back[abi:ne180100]((char **)(a1 + 16), a2);
}

uint64_t kgWaitForProtectedAccess(unsigned int a1, const char *a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD block[12];
  unsigned int v11;
  _QWORD v12[7];
  _QWORD v13[3];
  int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  _QWORD v19[3];
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  if (kgDeviceCanProceedForProtectionClass(a1, a2) == 1)
    return 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2000000000;
  v24 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2000000000;
  v20 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2000000000;
  v18 = 0;
  v5 = dispatch_queue_create("com.apple.photos.knowledge.unlock", 0);
  v6 = dispatch_semaphore_create(0);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2000000000;
  v14 = -1;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 0x40000000;
  v12[2] = __kgWaitForProtectedAccess_block_invoke;
  v12[3] = &unk_1E83E4C40;
  v12[4] = v19;
  v12[5] = &v21;
  v12[6] = v6;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = __kgWaitForProtectedAccess_block_invoke_2;
  block[3] = &unk_1E83E4C68;
  v11 = a1;
  block[4] = v12;
  block[5] = v13;
  block[6] = &v15;
  block[7] = &v21;
  block[8] = v19;
  block[9] = v5;
  block[10] = a2;
  block[11] = v6;
  dispatch_sync(v5, block);
  if (*((_DWORD *)v16 + 6) == 1)
  {
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    v9[0] = v7;
    v9[1] = 0x40000000;
    v9[2] = __kgWaitForProtectedAccess_block_invoke_4;
    v9[3] = &unk_1E83E4C90;
    v9[4] = v13;
    dispatch_sync(v5, v9);
  }
  dispatch_release(v6);
  dispatch_release(v5);
  v4 = *((unsigned int *)v22 + 6);
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);
  return v4;
}

uint64_t kgDeviceCanProceedForProtectionClass(unsigned int a1, const char *a2)
{
  uint64_t v3;
  unsigned int v5;
  stat v8;
  void *values[3];

  values[2] = *(void **)MEMORY[0x1E0C80C00];
  if (a1 < 2)
  {
    *(_OWORD *)&v8.st_dev = xmmword_1E83E4CB0;
    values[0] = *(void **)MEMORY[0x1E0C9AE50];
    values[1] = 0;
    v3 = 1;
    CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&v8, (const void **)values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v5 = MKBGetDeviceLockState();
    if (v5 <= 7 && ((1 << v5) & 0x89) != 0)
      return v3;
    if (a1 == 1)
    {
      memset(&v8, 0, sizeof(v8));
      if (stat(a2, &v8) == -1 && *__error() == 2)
        return 1;
    }
    return 0;
  }
  if (a1 != 2)
    return a1 == 3;
  return MKBDeviceUnlockedSinceBoot();
}

_QWORD *__kgWaitForProtectedAccess_block_invoke(_QWORD *result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result[4] + 8);
  if (!*(_DWORD *)(v1 + 24))
  {
    *(_DWORD *)(v1 + 24) = 1;
    v3 = result[5];
    v2 = result[6];
    *(_DWORD *)(*(_QWORD *)(v3 + 8) + 24) = 1;
    return (_QWORD *)dispatch_semaphore_signal(v2);
  }
  return result;
}

void __kgWaitForProtectedAccess_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  uint8_t v5[16];

  v2 = *(unsigned int *)(a1 + 96);
  if (v2 > 2)
    v3 = 0;
  else
    v3 = off_1E83E4CC0[v2];
  if (notify_register_dispatch(v3, (int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(dispatch_queue_t *)(a1 + 72), *(notify_handler_t *)(a1 + 32)))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to register for protected device access notification", v5, 2u);
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    if (kgDeviceCanProceedForProtectionClass(*(_DWORD *)(a1 + 96), *(const char **)(a1 + 80)) == 1)
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      if (!*(_DWORD *)(v4 + 24))
      {
        *(_DWORD *)(v4 + 24) = 1;
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 88));
      }
    }
  }
}

uint64_t __kgWaitForProtectedAccess_block_invoke_4(uint64_t a1)
{
  return notify_cancel(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

void sub_1CA1BBCD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CA1BBDDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CA1BBE74(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

_QWORD *degas::AttributeQuery::AttributeQuery(_QWORD *result, uint64_t a2, uint64_t a3)
{
  *result = a2;
  result[1] = a3;
  return result;
}

{
  *result = a2;
  result[1] = a3;
  return result;
}

uint64_t degas::AttributeQuery::elementsForAttributeValue(uint64_t *a1, sqlite3_int64 a2, sqlite3_int64 a3, int a4, degas::Bitmap *a5)
{
  uint64_t v9;
  uint64_t *v10;
  unsigned int v11;
  uint64_t v12;
  degas::Statement *v14[2];

  v9 = *a1;
  degas::AggregateValueCursor::AggregateValueCursor(v14);
  v10 = degas::AggregateValueTable::prepareStatementToReadByValue(v9, a2, a3, a4);
  std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v14, *v10, v10[1]);
  while (1)
  {
    v11 = degas::Statement::next((sqlite3_stmt **)v14[0]);
    if (v11 != 1)
      break;
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v14[0], 0, a5);
  }
  if (v11 == 2)
    v12 = 0;
  else
    v12 = v11;
  degas::Cursor::~Cursor(v14);
  return v12;
}

void sub_1CA1BC884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::AttributeQuery::elementsForAttributeValue(uint64_t *a1, sqlite3_int64 a2, int a3, degas::Bitmap *a4, double a5)
{
  uint64_t v9;
  uint64_t *v10;
  unsigned int v11;
  uint64_t v12;
  degas::Statement *v14[2];

  v9 = *a1;
  degas::AggregateValueCursor::AggregateValueCursor(v14);
  v10 = degas::AggregateValueTable::prepareStatementToReadByValue(v9, a2, a3, a5);
  std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v14, *v10, v10[1]);
  while (1)
  {
    v11 = degas::Statement::next((sqlite3_stmt **)v14[0]);
    if (v11 != 1)
      break;
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v14[0], 0, a4);
  }
  if (v11 == 2)
    v12 = 0;
  else
    v12 = v11;
  degas::Cursor::~Cursor(v14);
  return v12;
}

void sub_1CA1BC940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::AttributeQuery::elementsForAttributeValue(uint64_t *a1, sqlite3_int64 a2, uint64_t a3, int a4, degas::Bitmap *a5)
{
  uint64_t v9;
  uint64_t *v10;
  unsigned int v11;
  std::string __p;
  degas::Statement *v14[2];

  if (*(char *)(a3 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  else
    __p = *(std::string *)a3;
  v9 = *a1;
  degas::AggregateValueCursor::AggregateValueCursor(v14);
  v10 = degas::AggregateValueTable::prepareStatementToReadByValue(v9, a2, (uint64_t *)&__p, a4);
  std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v14, *v10, v10[1]);
  while (1)
  {
    v11 = degas::Statement::next((sqlite3_stmt **)v14[0]);
    if (v11 != 1)
      break;
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v14[0], 0, a5);
  }
  degas::Cursor::~Cursor(v14);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v11 == 2)
    return 0;
  else
    return v11;
}

void sub_1CA1BCA2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, degas::Statement *a16)
{
  degas::Cursor::~Cursor(&a16);
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t degas::AttributeQuery::elementsForAttributeValues(uint64_t *a1, sqlite3_int64 a2, void *a3, int a4, int a5, degas::Bitmap *a6)
{
  uint64_t v11;
  uint64_t *v12;
  unsigned int v13;
  uint64_t v14;
  degas::Statement *v16[2];

  v11 = *a1;
  degas::AggregateValueCursor::AggregateValueCursor(v16);
  v12 = degas::AggregateValueTable::prepareStatementToReadByValues(v11, a2, a3, a4, a5);
  std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v16, *v12, v12[1]);
  while (1)
  {
    v13 = degas::Statement::next((sqlite3_stmt **)v16[0]);
    if (v13 != 1)
      break;
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v16[0], 0, a6);
  }
  if (v13 == 2)
    v14 = 0;
  else
    v14 = v13;
  degas::Cursor::~Cursor(v16);
  return v14;
}

{
  uint64_t v11;
  uint64_t *v12;
  unsigned int v13;
  uint64_t v14;
  degas::Statement *v16[2];

  v11 = *a1;
  degas::AggregateValueCursor::AggregateValueCursor(v16);
  v12 = degas::AggregateValueTable::prepareStatementToReadByValues(v11, a2, a3, a4, a5);
  std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v16, *v12, v12[1]);
  while (1)
  {
    v13 = degas::Statement::next((sqlite3_stmt **)v16[0]);
    if (v13 != 1)
      break;
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v16[0], 0, a6);
  }
  if (v13 == 2)
    v14 = 0;
  else
    v14 = v13;
  degas::Cursor::~Cursor(v16);
  return v14;
}

{
  return degas::implElementsForAttributeValues<char const*>(a2, a3, a4, a5, a6, *a1);
}

void sub_1CA1BCB08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

void sub_1CA1BCBCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::implElementsForAttributeValues<char const*>(sqlite3_int64 a1, void *a2, int a3, int a4, degas::Bitmap *a5, uint64_t a6)
{
  uint64_t *v12;
  unsigned int v13;
  uint64_t v14;
  degas::Statement *v16[2];

  degas::AggregateValueCursor::AggregateValueCursor(v16);
  v12 = degas::AggregateValueTable::prepareStatementToReadByValues(a6, a1, a2, a3, a4);
  std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v16, *v12, v12[1]);
  while (1)
  {
    v13 = degas::Statement::next((sqlite3_stmt **)v16[0]);
    if (v13 != 1)
      break;
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v16[0], 0, a5);
  }
  if (v13 == 2)
    v14 = 0;
  else
    v14 = v13;
  degas::Cursor::~Cursor(v16);
  return v14;
}

void sub_1CA1BCCB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::AttributeQuery::elementsForAttributeValues(uint64_t *a1, sqlite3_int64 a2, uint64_t *a3, int a4, int a5, degas::Bitmap *a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *__p[3];

  v12 = a4;
  std::vector<char const*>::vector(__p, a4);
  if (a4)
  {
    v13 = 0;
    do
    {
      v14 = a3;
      if (*((char *)a3 + 23) < 0)
        v14 = (uint64_t *)*a3;
      *((_QWORD *)__p[0] + v13++) = v14;
      a3 += 3;
    }
    while (v12 != v13);
  }
  v15 = degas::implElementsForAttributeValues<char const*>(a2, __p[0], a4, a5, a6, *a1);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v15;
}

void sub_1CA1BCD8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<char const*>::vector(_QWORD *a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    if (a2 >> 61)
      std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
    v4 = 8 * a2;
    v5 = (char *)operator new(8 * a2);
    *a1 = v5;
    a1[2] = &v5[8 * a2];
    bzero(v5, 8 * a2);
    a1[1] = &v5[v4];
  }
  return a1;
}

void sub_1CA1BCE1C(_Unwind_Exception *exception_object)
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

uint64_t degas::AttributeQuery::elementsForAttributeValueRange(uint64_t *a1, sqlite3_int64 a2, sqlite3_int64 a3, sqlite3_int64 a4, int a5, degas::Bitmap *a6)
{
  uint64_t v11;
  uint64_t *v12;
  unsigned int v13;
  uint64_t v14;
  degas::Statement *v16[2];

  v11 = *a1;
  degas::AggregateValueCursor::AggregateValueCursor(v16);
  v12 = degas::AggregateValueTable::prepareStatementToReadByRange(v11, a2, a3, a4, a5);
  std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v16, *v12, v12[1]);
  while (1)
  {
    v13 = degas::Statement::next((sqlite3_stmt **)v16[0]);
    if (v13 != 1)
      break;
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v16[0], 0, a6);
  }
  if (v13 == 2)
    v14 = 0;
  else
    v14 = v13;
  degas::Cursor::~Cursor(v16);
  return v14;
}

void sub_1CA1BCEE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::AttributeQuery::elementsForAttributeValueRange(uint64_t *a1, sqlite3_int64 a2, int a3, degas::Bitmap *a4, double a5, double a6)
{
  uint64_t v11;
  uint64_t *v12;
  unsigned int v13;
  uint64_t v14;
  degas::Statement *v16[2];

  v11 = *a1;
  degas::AggregateValueCursor::AggregateValueCursor(v16);
  v12 = degas::AggregateValueTable::prepareStatementToReadByRange(v11, a2, a3, a5, a6);
  std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v16, *v12, v12[1]);
  while (1)
  {
    v13 = degas::Statement::next((sqlite3_stmt **)v16[0]);
    if (v13 != 1)
      break;
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v16[0], 0, a4);
  }
  if (v13 == 2)
    v14 = 0;
  else
    v14 = v13;
  degas::Cursor::~Cursor(v16);
  return v14;
}

void sub_1CA1BCFA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::AttributeQuery::elementsForAttributeValueRange(uint64_t *a1, sqlite3_int64 a2, uint64_t a3, uint64_t a4, int a5, degas::Bitmap *a6)
{
  uint64_t v11;
  uint64_t *v12;
  unsigned int v13;
  std::string __p;
  std::string v16;
  degas::Statement *v17[2];

  if (*(char *)(a3 + 23) < 0)
    std::string::__init_copy_ctor_external(&v16, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  else
    v16 = *(std::string *)a3;
  if (*(char *)(a4 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a4, *(_QWORD *)(a4 + 8));
  else
    __p = *(std::string *)a4;
  v11 = *a1;
  degas::AggregateValueCursor::AggregateValueCursor(v17);
  v12 = degas::AggregateValueTable::prepareStatementToReadByRange(v11, a2, (uint64_t *)&v16, (uint64_t *)&__p, a5);
  std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v17, *v12, v12[1]);
  while (1)
  {
    v13 = degas::Statement::next((sqlite3_stmt **)v17[0]);
    if (v13 != 1)
      break;
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v17[0], 0, a6);
  }
  degas::Cursor::~Cursor(v17);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__r_.__value_.__l.__data_);
  if (v13 == 2)
    return 0;
  else
    return v13;
}

void sub_1CA1BD0DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,char a23)
{
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t degas::filterElementsForAggregateCursor(sqlite3_stmt ***this, degas::AggregateValueCursor *a2, degas::Bitmap *a3, const degas::Bitmap *a4)
{
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  _BYTE v11[40];
  void **v12;

  v10 = 0u;
  memset(v11, 0, 25);
  while (1)
  {
    v7 = degas::Statement::next(*this);
    v8 = v7;
    if ((_DWORD)v7 != 1)
      break;
    degas::Statement::bitmapColumnValue(*this, 0, (degas::Bitmap *)&v10);
  }
  if ((_DWORD)v7 == 2)
  {
    if (*((_QWORD *)a3 + 2) != *((_QWORD *)a3 + 3))
      degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)&v10, a3);
    degas::Bitmap::operator=(a2, &v10);
    v8 = 0;
  }
  v12 = (void **)v11;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v12);
  return v8;
}

void sub_1CA1BD1D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;

  *(_QWORD *)(v11 - 40) = &a11;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v11 - 40));
  _Unwind_Resume(a1);
}

BOOL degas::chooseFiltering(degas *this, const degas::Bitmap *a2)
{
  return (double)(unint64_t)degas::Bitmap::count(this) / (double)(unint64_t)a2 < 0.1;
}

uint64_t degas::AttributeQuery::filterElementsForAttributeValue(uint64_t *a1, sqlite3_int64 a2, sqlite3_int64 a3, int a4, Bitmap *a5, degas::AggregateValueCursor *a6)
{
  uint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  degas::Bitmap *v14;
  const degas::Bitmap *v15;
  uint64_t *v16;
  uint64_t v17;
  sqlite3_stmt **v19[2];

  v11 = *a1;
  v12 = a1[1];
  degas::AggregateValueCursor::AggregateValueCursor(v19);
  if ((double)(unint64_t)degas::Bitmap::count((degas::Bitmap *)a5) / (double)v12 >= 0.1)
  {
    v16 = degas::AggregateValueTable::prepareStatementToReadByValue(v11, a2, a3, a4);
    std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v19, *v16, v16[1]);
  }
  else
  {
    v13 = degas::AggregateValueTable::prepareStatementToReadByValueIdentifiers(v11, a2, a3, a4, a5);
    v14 = (degas::Bitmap *)std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v19, *v13, v13[1]);
    degas::Bitmap::emptyBitmap(v14);
    a5 = (Bitmap *)&degas::Bitmap::emptyBitmap(void)::bitmap;
  }
  v17 = degas::filterElementsForAggregateCursor(v19, a6, (degas::Bitmap *)a5, v15);
  degas::Cursor::~Cursor((degas::Statement **)v19);
  return v17;
}

void sub_1CA1BD328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::AttributeQuery::filterElementsForAttributeValue(uint64_t *a1, sqlite3_int64 a2, int a3, Bitmap *a4, degas::AggregateValueCursor *a5, double a6)
{
  uint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  degas::Bitmap *v14;
  const degas::Bitmap *v15;
  uint64_t *v16;
  uint64_t v17;
  sqlite3_stmt **v19[2];

  v11 = *a1;
  v12 = a1[1];
  degas::AggregateValueCursor::AggregateValueCursor(v19);
  if ((double)(unint64_t)degas::Bitmap::count((degas::Bitmap *)a4) / (double)v12 >= 0.1)
  {
    v16 = degas::AggregateValueTable::prepareStatementToReadByValue(v11, a2, a3, a6);
    std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v19, *v16, v16[1]);
  }
  else
  {
    v13 = degas::AggregateValueTable::prepareStatementToReadByValueIdentifiers(v11, a2, a3, a4, a6);
    v14 = (degas::Bitmap *)std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v19, *v13, v13[1]);
    degas::Bitmap::emptyBitmap(v14);
    a4 = (Bitmap *)&degas::Bitmap::emptyBitmap(void)::bitmap;
  }
  v17 = degas::filterElementsForAggregateCursor(v19, a5, (degas::Bitmap *)a4, v15);
  degas::Cursor::~Cursor((degas::Statement **)v19);
  return v17;
}

void sub_1CA1BD430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::AttributeQuery::filterElementsForAttributeValue(uint64_t *a1, sqlite3_int64 a2, uint64_t a3, int a4, Bitmap *a5, degas::AggregateValueCursor *a6)
{
  uint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  degas::Bitmap *v14;
  const degas::Bitmap *v15;
  uint64_t *v16;
  uint64_t v17;
  std::string __p;
  sqlite3_stmt **v20[2];

  if (*(char *)(a3 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  else
    __p = *(std::string *)a3;
  v11 = *a1;
  v12 = a1[1];
  degas::AggregateValueCursor::AggregateValueCursor(v20);
  if ((double)(unint64_t)degas::Bitmap::count((degas::Bitmap *)a5) / (double)v12 >= 0.1)
  {
    v16 = degas::AggregateValueTable::prepareStatementToReadByValue(v11, a2, (uint64_t *)&__p, a4);
    std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v20, *v16, v16[1]);
  }
  else
  {
    v13 = degas::AggregateValueTable::prepareStatementToReadByValueIdentifiers(v11, a2, (uint64_t *)&__p, a4, a5);
    v14 = (degas::Bitmap *)std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v20, *v13, v13[1]);
    degas::Bitmap::emptyBitmap(v14);
    a5 = (Bitmap *)&degas::Bitmap::emptyBitmap(void)::bitmap;
  }
  v17 = degas::filterElementsForAggregateCursor(v20, a6, (degas::Bitmap *)a5, v15);
  degas::Cursor::~Cursor((degas::Statement **)v20);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v17;
}

void sub_1CA1BD564(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t degas::AttributeQuery::filterElementsForAttributeValues(uint64_t *a1, sqlite3_int64 a2, void *a3, int a4, int a5, Bitmap *a6, degas::AggregateValueCursor *a7)
{
  uint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  degas::Bitmap *v16;
  const degas::Bitmap *v17;
  uint64_t *v18;
  uint64_t v19;
  sqlite3_stmt **v21[2];

  v13 = *a1;
  v14 = a1[1];
  degas::AggregateValueCursor::AggregateValueCursor(v21);
  if ((double)(unint64_t)degas::Bitmap::count((degas::Bitmap *)a6) / (double)v14 >= 0.1)
  {
    v18 = degas::AggregateValueTable::prepareStatementToReadByValues(v13, a2, a3, a4, a5);
    std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v21, *v18, v18[1]);
  }
  else
  {
    v15 = degas::AggregateValueTable::prepareStatementToReadByValuesIdentifiers(v13, a2, a3, a4, a5, a6);
    v16 = (degas::Bitmap *)std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v21, *v15, v15[1]);
    degas::Bitmap::emptyBitmap(v16);
    a6 = (Bitmap *)&degas::Bitmap::emptyBitmap(void)::bitmap;
  }
  v19 = degas::filterElementsForAggregateCursor(v21, a7, (degas::Bitmap *)a6, v17);
  degas::Cursor::~Cursor((degas::Statement **)v21);
  return v19;
}

{
  uint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  degas::Bitmap *v16;
  const degas::Bitmap *v17;
  uint64_t *v18;
  uint64_t v19;
  sqlite3_stmt **v21[2];

  v13 = *a1;
  v14 = a1[1];
  degas::AggregateValueCursor::AggregateValueCursor(v21);
  if ((double)(unint64_t)degas::Bitmap::count((degas::Bitmap *)a6) / (double)v14 >= 0.1)
  {
    v18 = degas::AggregateValueTable::prepareStatementToReadByValues(v13, a2, a3, a4, a5);
    std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v21, *v18, v18[1]);
  }
  else
  {
    v15 = degas::AggregateValueTable::prepareStatementToReadByValuesIdentifiers(v13, a2, a3, a4, a5, a6);
    v16 = (degas::Bitmap *)std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v21, *v15, v15[1]);
    degas::Bitmap::emptyBitmap(v16);
    a6 = (Bitmap *)&degas::Bitmap::emptyBitmap(void)::bitmap;
  }
  v19 = degas::filterElementsForAggregateCursor(v21, a7, (degas::Bitmap *)a6, v17);
  degas::Cursor::~Cursor((degas::Statement **)v21);
  return v19;
}

void sub_1CA1BD698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

void sub_1CA1BD7B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::AttributeQuery::filterElementsForAttributeValues(uint64_t a1, sqlite3_int64 a2, void *a3, int a4, int a5, Bitmap *a6, degas::AggregateValueCursor *a7)
{
  return degas::implFilterElementsForAttributeValues<char const*>(a2, a3, a4, a5, a6, a7, *(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

uint64_t degas::implFilterElementsForAttributeValues<char const*>(sqlite3_int64 a1, void *a2, int a3, int a4, Bitmap *a5, degas::AggregateValueCursor *a6, uint64_t a7, unint64_t a8)
{
  uint64_t *v16;
  degas::Bitmap *v17;
  const degas::Bitmap *v18;
  uint64_t *v19;
  uint64_t v20;
  sqlite3_stmt **v22[2];

  degas::AggregateValueCursor::AggregateValueCursor(v22);
  if ((double)(unint64_t)degas::Bitmap::count((degas::Bitmap *)a5) / (double)a8 >= 0.1)
  {
    v19 = degas::AggregateValueTable::prepareStatementToReadByValues(a7, a1, a2, a3, a4);
    std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v22, *v19, v19[1]);
  }
  else
  {
    v16 = degas::AggregateValueTable::prepareStatementToReadByValuesIdentifiers(a7, a1, a2, a3, a4, a5);
    v17 = (degas::Bitmap *)std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v22, *v16, v16[1]);
    degas::Bitmap::emptyBitmap(v17);
    a5 = (Bitmap *)&degas::Bitmap::emptyBitmap(void)::bitmap;
  }
  v20 = degas::filterElementsForAggregateCursor(v22, a6, (degas::Bitmap *)a5, v18);
  degas::Cursor::~Cursor((degas::Statement **)v22);
  return v20;
}

void sub_1CA1BD8EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::AttributeQuery::filterElementsForAttributeValues(uint64_t a1, sqlite3_int64 a2, uint64_t *a3, int a4, int a5, Bitmap *a6, degas::AggregateValueCursor *a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *__p[3];

  v14 = a4;
  std::vector<char const*>::vector(__p, a4);
  if (a4)
  {
    v15 = 0;
    do
    {
      v16 = a3;
      if (*((char *)a3 + 23) < 0)
        v16 = (uint64_t *)*a3;
      *((_QWORD *)__p[0] + v15++) = v16;
      a3 += 3;
    }
    while (v14 != v15);
  }
  v17 = degas::implFilterElementsForAttributeValues<char const*>(a2, __p[0], a4, a5, a6, a7, *(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v17;
}

void sub_1CA1BD9CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t degas::AttributeQuery::filterElementsForAttributeValueRange(uint64_t *a1, sqlite3_int64 a2, sqlite3_int64 a3, sqlite3_int64 a4, int a5, Bitmap *a6, degas::AggregateValueCursor *a7)
{
  uint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  degas::Bitmap *v16;
  const degas::Bitmap *v17;
  uint64_t *v18;
  uint64_t v19;
  sqlite3_stmt **v21[2];

  v13 = *a1;
  v14 = a1[1];
  degas::AggregateValueCursor::AggregateValueCursor(v21);
  if ((double)(unint64_t)degas::Bitmap::count((degas::Bitmap *)a6) / (double)v14 >= 0.1)
  {
    v18 = degas::AggregateValueTable::prepareStatementToReadByRange(v13, a2, a3, a4, a5);
    std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v21, *v18, v18[1]);
  }
  else
  {
    v15 = degas::AggregateValueTable::prepareStatementToReadByRangeIdentifiers(v13, a2, a3, a4, a5, a6);
    v16 = (degas::Bitmap *)std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v21, *v15, v15[1]);
    degas::Bitmap::emptyBitmap(v16);
    a6 = (Bitmap *)&degas::Bitmap::emptyBitmap(void)::bitmap;
  }
  v19 = degas::filterElementsForAggregateCursor(v21, a7, (degas::Bitmap *)a6, v17);
  degas::Cursor::~Cursor((degas::Statement **)v21);
  return v19;
}

void sub_1CA1BDAF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::AttributeQuery::filterElementsForAttributeValueRange(uint64_t *a1, sqlite3_int64 a2, int a3, Bitmap *a4, degas::AggregateValueCursor *a5, double a6, double a7)
{
  uint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  degas::Bitmap *v16;
  const degas::Bitmap *v17;
  uint64_t *v18;
  uint64_t v19;
  sqlite3_stmt **v21[2];

  v13 = *a1;
  v14 = a1[1];
  degas::AggregateValueCursor::AggregateValueCursor(v21);
  if ((double)(unint64_t)degas::Bitmap::count((degas::Bitmap *)a4) / (double)v14 >= 0.1)
  {
    v18 = degas::AggregateValueTable::prepareStatementToReadByRange(v13, a2, a3, a6, a7);
    std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v21, *v18, v18[1]);
  }
  else
  {
    v15 = degas::AggregateValueTable::prepareStatementToReadByRangeIdentifiers(v13, a2, a3, a4, a6, a7);
    v16 = (degas::Bitmap *)std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v21, *v15, v15[1]);
    degas::Bitmap::emptyBitmap(v16);
    a4 = (Bitmap *)&degas::Bitmap::emptyBitmap(void)::bitmap;
  }
  v19 = degas::filterElementsForAggregateCursor(v21, a5, (degas::Bitmap *)a4, v17);
  degas::Cursor::~Cursor((degas::Statement **)v21);
  return v19;
}

void sub_1CA1BDC0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::AttributeQuery::filterElementsForAttributeValueRange(uint64_t *a1, sqlite3_int64 a2, uint64_t a3, uint64_t a4, int a5, Bitmap *a6, degas::AggregateValueCursor *a7)
{
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  degas::Bitmap *v16;
  const degas::Bitmap *v17;
  uint64_t *v18;
  uint64_t v19;
  std::string __p;
  std::string v22;
  sqlite3_stmt **v23[2];

  if (*(char *)(a3 + 23) < 0)
    std::string::__init_copy_ctor_external(&v22, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  else
    v22 = *(std::string *)a3;
  if (*(char *)(a4 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a4, *(_QWORD *)(a4 + 8));
  else
    __p = *(std::string *)a4;
  v14 = *a1;
  v13 = a1[1];
  degas::AggregateValueCursor::AggregateValueCursor(v23);
  if ((double)(unint64_t)degas::Bitmap::count((degas::Bitmap *)a6) / (double)v13 >= 0.1)
  {
    v18 = degas::AggregateValueTable::prepareStatementToReadByRange(v14, a2, (uint64_t *)&v22, (uint64_t *)&__p, a5);
    std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v23, *v18, v18[1]);
  }
  else
  {
    v15 = degas::AggregateValueTable::prepareStatementToReadByRangeIdentifiers(v14, a2, (uint64_t *)&v22, (uint64_t *)&__p, a5, a6);
    v16 = (degas::Bitmap *)std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v23, *v15, v15[1]);
    degas::Bitmap::emptyBitmap(v16);
    a6 = (Bitmap *)&degas::Bitmap::emptyBitmap(void)::bitmap;
  }
  v19 = degas::filterElementsForAggregateCursor(v23, a7, (degas::Bitmap *)a6, v17);
  degas::Cursor::~Cursor((degas::Statement **)v23);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v22.__r_.__value_.__l.__data_);
  return v19;
}

void sub_1CA1BDD84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,char a23)
{
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double degas::UncountedPathCollection::UncountedPathCollection(degas::UncountedPathCollection *this)
{
  double result;

  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 1) = 0;
  *(_QWORD *)this = (char *)this + 8;
  result = 0.0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 49) = 0u;
  return result;
}

{
  double result;

  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 1) = 0;
  *(_QWORD *)this = (char *)this + 8;
  result = 0.0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 49) = 0u;
  return result;
}

degas::UncountedPathCollection *degas::UncountedPathCollection::UncountedPathCollection(degas::UncountedPathCollection *this, __int128 **a2)
{
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = (char *)this + 8;
  *((_QWORD *)this + 3) = *a2;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 40, a2[2], a2[3], a2[3] - a2[2]);
  *((_BYTE *)this + 64) = *((_BYTE *)a2 + 40);
  return this;
}

void sub_1CA1BDE7C(_Unwind_Exception *a1)
{
  _QWORD **v1;

  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>>>::destroy(*v1);
  _Unwind_Resume(a1);
}

uint64_t degas::UncountedPathCollection::addPath(degas::UncountedPathCollection *this, unint64_t a2, unint64_t a3)
{
  _QWORD *v6;
  degas::Bitmap **v7;
  unint64_t v8;
  BOOL v9;
  _QWORD *v10;
  _OWORD *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v22[2];
  std::__shared_weak_count *v23;
  _OWORD *v24;
  std::__shared_weak_count *v25;

  v6 = (_QWORD *)*((_QWORD *)this + 1);
  if (!v6)
    goto LABEL_12;
  v7 = (degas::Bitmap **)((char *)this + 8);
  do
  {
    v8 = v6[4];
    v9 = v8 >= a3;
    if (v8 >= a3)
      v10 = v6;
    else
      v10 = v6 + 1;
    if (v9)
      v7 = (degas::Bitmap **)v6;
    v6 = (_QWORD *)*v10;
  }
  while (*v10);
  if (v7 != (degas::Bitmap **)((char *)this + 8) && (unint64_t)v7[4] <= a3)
  {
    degas::Bitmap::setBit(v7[5], a2);
  }
  else
  {
LABEL_12:
    v11 = (_OWORD *)operator new();
    *v11 = 0u;
    v11[1] = 0u;
    *(_OWORD *)((char *)v11 + 25) = 0u;
    v24 = v11;
    v12 = (std::__shared_weak_count *)operator new();
    v12->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    v12->__vftable = (std::__shared_weak_count_vtbl *)&off_1E83E4D38;
    v12->__shared_weak_owners_ = 0;
    v12[1].__vftable = (std::__shared_weak_count_vtbl *)v11;
    v25 = v12;
    v22[0] = 0;
    std::unique_ptr<degas::Bitmap>::reset[abi:ne180100](v22);
    degas::Bitmap::setBit((degas::Bitmap *)v11, a2);
    v22[0] = a3;
    v22[1] = (uint64_t)v11;
    v23 = v12;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
    std::__tree<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,std::shared_ptr<degas::Bitmap>>>((uint64_t *)this, a3, (uint64_t)v22);
    v15 = v23;
    if (v23)
    {
      v16 = (unint64_t *)&v23->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    v18 = v25;
    if (v25)
    {
      v19 = (unint64_t *)&v25->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }
  return degas::Bitmap::setBit((degas::UncountedPathCollection *)((char *)this + 24), a3);
}

void sub_1CA1BE050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v5;
  va_list va;

  va_start(va, a5);
  std::shared_ptr<degas::Predicate>::~shared_ptr[abi:ne180100](v5);
  std::shared_ptr<degas::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,std::shared_ptr<degas::Bitmap>>>(uint64_t *result, unint64_t a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t **v6;
  uint64_t **v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t *v11;

  v4 = result;
  v6 = (uint64_t **)(result + 1);
  v5 = (uint64_t *)result[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        v7 = (uint64_t **)v5;
        v8 = v5[4];
        if (v8 <= a2)
          break;
        v5 = *v7;
        v6 = v7;
        if (!*v7)
          goto LABEL_9;
      }
      if (v8 >= a2)
        break;
      v5 = v7[1];
      if (!v5)
      {
        v6 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    v7 = (uint64_t **)(result + 1);
LABEL_9:
    v9 = (char *)operator new(0x38uLL);
    *((_QWORD *)v9 + 4) = *(_QWORD *)a3;
    *(_OWORD *)(v9 + 40) = *(_OWORD *)(a3 + 8);
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)v9 = 0;
    *((_QWORD *)v9 + 1) = 0;
    *((_QWORD *)v9 + 2) = v7;
    *v6 = (uint64_t *)v9;
    v10 = *(_QWORD *)*v4;
    if (v10)
    {
      *v4 = v10;
      v11 = *v6;
    }
    else
    {
      v11 = (uint64_t *)v9;
    }
    result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v4[1], v11);
    ++v4[2];
  }
  return result;
}

uint64_t *std::unique_ptr<degas::Bitmap>::reset[abi:ne180100](uint64_t *result)
{
  uint64_t v1;
  void **v2;

  v1 = *result;
  *result = 0;
  if (v1)
  {
    v2 = (void **)(v1 + 16);
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v2);
    JUMPOUT(0x1CAA4ADC8);
  }
  return result;
}

void std::__shared_ptr_pointer<degas::Bitmap *,std::shared_ptr<degas::Bitmap>::__shared_ptr_default_delete<degas::Bitmap,degas::Bitmap>,std::allocator<degas::Bitmap>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1CAA4ADC8);
}

uint64_t std::__shared_ptr_pointer<degas::Bitmap *,std::shared_ptr<degas::Bitmap>::__shared_ptr_default_delete<degas::Bitmap,degas::Bitmap>,std::allocator<degas::Bitmap>>::__on_zero_shared(uint64_t result)
{
  uint64_t v1;
  void **v2;

  v1 = *(_QWORD *)(result + 24);
  if (v1)
  {
    v2 = (void **)(v1 + 16);
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v2);
    JUMPOUT(0x1CAA4ADC8);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<degas::Bitmap *,std::shared_ptr<degas::Bitmap>::__shared_ptr_default_delete<degas::Bitmap,degas::Bitmap>,std::allocator<degas::Bitmap>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), 0x80000001CA1FE536))
    return a1 + 24;
  else
    return 0;
}

uint64_t degas::UncountedPathCollection::addPaths(uint64_t *a1, unint64_t a2, uint64_t *a3)
{
  _QWORD *v5;
  uint64_t *v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  _QWORD v18[2];
  std::__shared_weak_count *v19;

  v5 = (_QWORD *)a1[1];
  if (!v5)
    goto LABEL_12;
  v6 = a1 + 1;
  do
  {
    v7 = v5[4];
    v8 = v7 >= a2;
    if (v7 >= a2)
      v9 = v5;
    else
      v9 = v5 + 1;
    if (v8)
      v6 = v5;
    v5 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6 != a1 + 1 && v6[4] <= a2)
  {
    degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)v6[5], *a3);
  }
  else
  {
LABEL_12:
    v11 = *a3;
    v10 = a3[1];
    v18[0] = a2;
    v18[1] = v11;
    v19 = (std::__shared_weak_count *)v10;
    if (v10)
    {
      v12 = (unint64_t *)(v10 + 8);
      do
        v13 = __ldxr(v12);
      while (__stxr(v13 + 1, v12));
    }
    std::__tree<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,std::shared_ptr<degas::Bitmap>>>(a1, a2, (uint64_t)v18);
    v14 = v19;
    if (v19)
    {
      p_shared_owners = (unint64_t *)&v19->__shared_owners_;
      do
        v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
  }
  return degas::Bitmap::setBit((degas::Bitmap *)(a1 + 3), a2);
}

void sub_1CA1BE36C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<degas::Predicate>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void degas::UncountedPathCollection::clear(degas::UncountedPathCollection *this)
{
  _OWORD *v2;
  uint64_t v3;
  uint64_t i;

  v2 = (_OWORD *)((char *)this + 8);
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>>>::destroy(*((_QWORD **)this + 1));
  *(_QWORD *)this = v2;
  *v2 = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  v3 = *((_QWORD *)this + 5);
  for (i = *((_QWORD *)this + 6); i != v3; i -= 16)
  {
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(i - 16));
    *(_QWORD *)(i - 8) = 0;
  }
  *((_QWORD *)this + 6) = v3;
}

unint64_t degas::UncountedPathCollection::addToCollectionWithFilter(degas::UncountedPathCollection *this, degas::UncountedPathCollection *a2, const degas::Bitmap *a3)
{
  unint64_t result;
  _QWORD *v7;
  unint64_t v8;
  BOOL v9;
  _QWORD *v10;
  _QWORD *v11;
  unint64_t v12;
  BOOL v13;
  _QWORD *v14;
  char *v15;
  char *v16;
  char *v17;
  unint64_t v18;
  char *v19;
  char *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;

  result = degas::Bitmap::count(a3);
  if (result < *((_QWORD *)this + 2))
  {
    result = (unint64_t)degas::Bitmap::begin(a3, &v21);
    v7 = (_QWORD *)((char *)this + 8);
    while (1)
    {
      v8 = v22;
      v9 = (const degas::Bitmap *)v21 == a3 && v22 == -1;
      if (v9)
      {
        if (v23 == *((_QWORD *)a3 + 3))
          return result;
        v8 = -1;
      }
      v10 = (_QWORD *)*v7;
      if (*v7)
      {
        v11 = v7;
        do
        {
          v12 = v10[4];
          v13 = v12 >= v8;
          if (v12 >= v8)
            v14 = v10;
          else
            v14 = v10 + 1;
          if (v13)
            v11 = v10;
          v10 = (_QWORD *)*v14;
        }
        while (*v14);
        if (v11 != v7 && v8 >= v11[4])
          degas::UncountedPathCollection::addPaths((uint64_t *)a2, v8, v11 + 5);
      }
      result = (unint64_t)degas::Bitmap::iterator::operator++(&v21);
    }
  }
  v17 = *(char **)this;
  v15 = (char *)this + 8;
  v16 = v17;
  if (v17 != v15)
  {
    do
    {
      v18 = *((_QWORD *)v16 + 4);
      result = degas::Bitmap::isSet(a3, v18);
      if ((_DWORD)result)
        result = degas::UncountedPathCollection::addPaths((uint64_t *)a2, v18, (uint64_t *)v16 + 5);
      v19 = (char *)*((_QWORD *)v16 + 1);
      if (v19)
      {
        do
        {
          v20 = v19;
          v19 = *(char **)v19;
        }
        while (v19);
      }
      else
      {
        do
        {
          v20 = (char *)*((_QWORD *)v16 + 2);
          v9 = *(_QWORD *)v20 == (_QWORD)v16;
          v16 = v20;
        }
        while (!v9);
      }
      v16 = v20;
    }
    while (v20 != v15);
  }
  return result;
}

uint64_t degas::UncountedPathCollection::targetNodes(degas::UncountedPathCollection *this)
{
  return (uint64_t)this + 24;
}

BOOL degas::UncountedPathCollection::hasPaths(degas::UncountedPathCollection *this)
{
  return *((_QWORD *)this + 2) != 0;
}

char *degas::UncountedPathCollection::sourceNodesForTargetNodeId(degas::UncountedPathCollection *this, unint64_t a2)
{
  unsigned __int8 v2;
  char *v3;
  _QWORD *v4;
  _QWORD *v5;
  char *v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;
  void *v10;
  unint64_t v11;
  char *v12;
  int v14;
  unint64_t v15;
  degas::UncountedPathCollection *v16;

  if ((v2 & 1) == 0)
  {
    v15 = a2;
    v16 = this;
    a2 = v15;
    this = v16;
    if (v14)
    {
      __cxa_atexit((void (*)(void *))std::shared_ptr<degas::Bitmap>::~shared_ptr[abi:ne180100], &degas::UncountedPathCollection::sourceNodesForTargetNodeId(unsigned long long)const::emptyBitmap, &dword_1CA0A5000);
      a2 = v15;
      this = v16;
    }
  }
  v5 = (_QWORD *)*((_QWORD *)this + 1);
  v3 = (char *)this + 8;
  v4 = v5;
  if (!v5)
    return (char *)&degas::UncountedPathCollection::sourceNodesForTargetNodeId(unsigned long long)const::emptyBitmap;
  v6 = v3;
  do
  {
    v7 = v4[4];
    v8 = v7 >= a2;
    if (v7 >= a2)
      v9 = v4;
    else
      v9 = v4 + 1;
    if (v8)
      v6 = (char *)v4;
    v4 = (_QWORD *)*v9;
  }
  while (*v9);
  v10 = &degas::UncountedPathCollection::sourceNodesForTargetNodeId(unsigned long long)const::emptyBitmap;
  if (v6 != v3)
  {
    v11 = *((_QWORD *)v6 + 4);
    v12 = v6 + 40;
    if (v11 <= a2)
      return v12;
  }
  return (char *)v10;
}

double degas::CountedPathCollection::CountedPathCollection(degas::CountedPathCollection *this)
{
  double result;

  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 1) = 0;
  *(_QWORD *)this = (char *)this + 8;
  result = 0.0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 49) = 0u;
  return result;
}

{
  double result;

  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 1) = 0;
  *(_QWORD *)this = (char *)this + 8;
  result = 0.0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 49) = 0u;
  return result;
}

degas::CountedPathCollection *degas::CountedPathCollection::CountedPathCollection(degas::CountedPathCollection *this, __int128 **a2)
{
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = (char *)this + 8;
  *((_QWORD *)this + 3) = *a2;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 40, a2[2], a2[3], a2[3] - a2[2]);
  *((_BYTE *)this + 64) = *((_BYTE *)a2 + 40);
  return this;
}

void sub_1CA1BE6CC(_Unwind_Exception *a1)
{
  _QWORD **v1;

  std::__tree<std::__value_type<unsigned long long,std::map<unsigned long long,int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::map<unsigned long long,int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::map<unsigned long long,int>>>>::destroy(*v1);
  _Unwind_Resume(a1);
}

void degas::CountedPathCollection::addPath(degas::CountedPathCollection *this, unint64_t a2, unint64_t a3, int a4)
{
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  BOOL v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  unint64_t v15;
  BOOL v16;
  _QWORD *v17;
  unint64_t v18;
  _QWORD *v19[3];
  _QWORD **v20;
  _QWORD *v21[2];

  v6 = (_QWORD *)*((_QWORD *)this + 1);
  if (!v6)
    goto LABEL_12;
  v7 = (_QWORD *)((char *)this + 8);
  do
  {
    v8 = v6[4];
    v9 = v8 >= a3;
    if (v8 >= a3)
      v10 = v6;
    else
      v10 = v6 + 1;
    if (v9)
      v7 = v6;
    v6 = (_QWORD *)*v10;
  }
  while (*v10);
  if (v7 != (_QWORD *)((char *)this + 8) && v7[4] <= a3)
  {
    v13 = (_QWORD *)v7[6];
    v11 = v7 + 6;
    v12 = v13;
    if (!v13)
      goto LABEL_25;
    v14 = v11;
    do
    {
      v15 = v12[4];
      v16 = v15 >= a2;
      if (v15 >= a2)
        v17 = v12;
      else
        v17 = v12 + 1;
      if (v16)
        v14 = v12;
      v12 = (_QWORD *)*v17;
    }
    while (*v17);
    if (v14 != v11 && v14[4] <= a2)
      *((_DWORD *)v14 + 10) += a4;
    else
LABEL_25:
      std::__tree<std::__value_type<unsigned long long,int>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,int>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,int>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,int>>(v11 - 1, a2, a2, a4);
  }
  else
  {
LABEL_12:
    v21[0] = 0;
    v21[1] = 0;
    v20 = v21;
    std::__tree<std::__value_type<unsigned long long,int>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,int>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,int>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,int>>((uint64_t *)&v20, a2, a2, a4);
    v18 = a3;
    std::map<unsigned long long,int>::map[abi:ne180100]((uint64_t)v19, &v20);
    std::__tree<std::__value_type<unsigned long long,std::map<unsigned long long,int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::map<unsigned long long,int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::map<unsigned long long,int>>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,std::map<unsigned long long,int>>>((uint64_t *)this, a3, (uint64_t *)&v18);
    std::__tree<unsigned long long>::destroy(v19[1]);
    degas::Bitmap::setBit((degas::CountedPathCollection *)((char *)this + 24), a3);
    std::__tree<unsigned long long>::destroy(v21[0]);
  }
}

void sub_1CA1BE80C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _QWORD *a15)
{
  std::__tree<unsigned long long>::destroy(a15);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<unsigned long long,int>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,int>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,int>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,int>>(uint64_t *result, unint64_t a2, uint64_t a3, int a4)
{
  uint64_t **v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t **v9;
  unint64_t v10;
  _QWORD *v11;

  v6 = (uint64_t **)result;
  v8 = (uint64_t **)(result + 1);
  v7 = (uint64_t *)result[1];
  if (v7)
  {
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v7;
        v10 = v7[4];
        if (v10 <= a2)
          break;
        v7 = *v9;
        v8 = v9;
        if (!*v9)
          goto LABEL_9;
      }
      if (v10 >= a2)
        break;
      v7 = v9[1];
      if (!v7)
      {
        v8 = v9 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    v9 = (uint64_t **)(result + 1);
LABEL_9:
    v11 = operator new(0x30uLL);
    v11[4] = a3;
    *((_DWORD *)v11 + 10) = a4;
    return std::__tree<std::__value_type<unsigned long long,degas::Bitmap>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,degas::Bitmap>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,degas::Bitmap>>>::__insert_node_at(v6, (uint64_t)v9, v8, v11);
  }
  return result;
}

uint64_t std::map<unsigned long long,int>::map[abi:ne180100](uint64_t a1, _QWORD *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  unint64_t *v6;
  uint64_t *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  BOOL v11;
  unint64_t v12;
  uint64_t **v13;
  uint64_t **v14;
  uint64_t *v15;
  _QWORD *v16;
  _QWORD *v17;
  unint64_t v18;

  *(_QWORD *)(a1 + 8) = 0;
  v3 = (_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  v4 = a2 + 1;
  v5 = (_QWORD *)*a2;
  if ((_QWORD *)*a2 != a2 + 1)
  {
    do
    {
      v6 = v5 + 4;
      v7 = *(uint64_t **)(a1 + 8);
      v8 = v3;
      if (*(_QWORD **)a1 == v3)
        goto LABEL_8;
      v9 = *(_QWORD **)(a1 + 8);
      v10 = v3;
      if (v7)
      {
        do
        {
          v8 = v9;
          v9 = (_QWORD *)v9[1];
        }
        while (v9);
      }
      else
      {
        do
        {
          v8 = (_QWORD *)v10[2];
          v11 = *v8 == (_QWORD)v10;
          v10 = v8;
        }
        while (v11);
      }
      v12 = *v6;
      if (v8[4] < *v6)
      {
LABEL_8:
        if (v7)
          v13 = (uint64_t **)v8;
        else
          v13 = (uint64_t **)v3;
        if (v7)
          v14 = (uint64_t **)(v8 + 1);
        else
          v14 = (uint64_t **)v3;
      }
      else
      {
        v13 = (uint64_t **)v3;
        v14 = (uint64_t **)v3;
        if (v7)
        {
          v14 = (uint64_t **)v3;
          while (1)
          {
            while (1)
            {
              v13 = (uint64_t **)v7;
              v18 = v7[4];
              if (v12 >= v18)
                break;
              v7 = *v13;
              v14 = v13;
              if (!*v13)
                goto LABEL_15;
            }
            if (v18 >= v12)
              break;
            v14 = v13 + 1;
            v7 = v13[1];
            if (!v7)
              goto LABEL_15;
          }
        }
      }
      if (!*v14)
      {
LABEL_15:
        v15 = (uint64_t *)operator new(0x30uLL);
        *((_OWORD *)v15 + 2) = *(_OWORD *)v6;
        std::__tree<std::__value_type<unsigned long long,degas::Bitmap>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,degas::Bitmap>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,degas::Bitmap>>>::__insert_node_at((uint64_t **)a1, (uint64_t)v13, v14, v15);
      }
      v16 = (_QWORD *)v5[1];
      if (v16)
      {
        do
        {
          v17 = v16;
          v16 = (_QWORD *)*v16;
        }
        while (v16);
      }
      else
      {
        do
        {
          v17 = (_QWORD *)v5[2];
          v11 = *v17 == (_QWORD)v5;
          v5 = v17;
        }
        while (!v11);
      }
      v5 = v17;
    }
    while (v17 != v4);
  }
  return a1;
}

void sub_1CA1BEA50(_Unwind_Exception *a1)
{
  _QWORD **v1;

  std::__tree<unsigned long long>::destroy(*v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<unsigned long long,std::map<unsigned long long,int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::map<unsigned long long,int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::map<unsigned long long,int>>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,std::map<unsigned long long,int>>>(uint64_t *result, unint64_t a2, uint64_t *a3)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t **v6;
  uint64_t **v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = result;
  v6 = (uint64_t **)(result + 1);
  v5 = (uint64_t *)result[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        v7 = (uint64_t **)v5;
        v8 = v5[4];
        if (v8 <= a2)
          break;
        v5 = *v7;
        v6 = v7;
        if (!*v7)
          goto LABEL_9;
      }
      if (v8 >= a2)
        break;
      v5 = v7[1];
      if (!v5)
      {
        v6 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    v7 = (uint64_t **)(result + 1);
LABEL_9:
    v9 = (uint64_t *)operator new(0x40uLL);
    v10 = v9;
    v11 = a3[1];
    v12 = a3 + 2;
    v13 = a3[2];
    v9[4] = *a3;
    v9[5] = v11;
    v9[6] = v13;
    v14 = v9 + 6;
    v15 = a3[3];
    v9[7] = v15;
    if (v15)
    {
      *(_QWORD *)(v13 + 16) = v14;
      a3[1] = (uint64_t)v12;
      *v12 = 0;
      a3[3] = 0;
    }
    else
    {
      v9[5] = (uint64_t)v14;
    }
    *v9 = 0;
    v9[1] = 0;
    v9[2] = (uint64_t)v7;
    *v6 = v9;
    v16 = *(_QWORD *)*v4;
    if (v16)
    {
      *v4 = v16;
      v10 = *v6;
    }
    result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v4[1], v10);
    ++v4[2];
  }
  return result;
}

uint64_t degas::CountedPathCollection::addPaths(uint64_t *a1, unint64_t a2, _QWORD *a3)
{
  _QWORD *v5;
  uint64_t *v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t *v13;
  _QWORD *v14;
  unint64_t v15;
  int v16;
  _QWORD *v17;
  _QWORD *v18;
  unint64_t v19;
  BOOL v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  BOOL v24;
  unint64_t v25;
  _QWORD *v26[3];

  v5 = (_QWORD *)a1[1];
  if (!v5)
    goto LABEL_12;
  v6 = a1 + 1;
  do
  {
    v7 = v5[4];
    v8 = v7 >= a2;
    if (v7 >= a2)
      v9 = v5;
    else
      v9 = v5 + 1;
    if (v8)
      v6 = v5;
    v5 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6 != a1 + 1 && v6[4] <= a2)
  {
    v11 = a3 + 1;
    v12 = (_QWORD *)*a3;
    if ((_QWORD *)*a3 != a3 + 1)
    {
      v13 = v6 + 5;
      v14 = v6 + 6;
      do
      {
        v15 = v12[4];
        v16 = *((_DWORD *)v12 + 10);
        v17 = (_QWORD *)*v14;
        if (!*v14)
          goto LABEL_27;
        v18 = v14;
        do
        {
          v19 = v17[4];
          v20 = v19 >= v15;
          if (v19 >= v15)
            v21 = v17;
          else
            v21 = v17 + 1;
          if (v20)
            v18 = v17;
          v17 = (_QWORD *)*v21;
        }
        while (*v21);
        if (v18 != v14 && v15 >= v18[4])
          *((_DWORD *)v18 + 10) += v16;
        else
LABEL_27:
          std::__tree<std::__value_type<unsigned long long,int>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,int>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,int>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,int>>(v13, v15, v12[4], v16);
        v22 = (_QWORD *)v12[1];
        if (v22)
        {
          do
          {
            v23 = v22;
            v22 = (_QWORD *)*v22;
          }
          while (v22);
        }
        else
        {
          do
          {
            v23 = (_QWORD *)v12[2];
            v24 = *v23 == (_QWORD)v12;
            v12 = v23;
          }
          while (!v24);
        }
        v12 = v23;
      }
      while (v23 != v11);
    }
  }
  else
  {
LABEL_12:
    v25 = a2;
    std::map<unsigned long long,int>::map[abi:ne180100]((uint64_t)v26, a3);
    std::__tree<std::__value_type<unsigned long long,std::map<unsigned long long,int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::map<unsigned long long,int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::map<unsigned long long,int>>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,std::map<unsigned long long,int>>>(a1, v25, (uint64_t *)&v25);
    std::__tree<unsigned long long>::destroy(v26[1]);
  }
  return degas::Bitmap::setBit((degas::Bitmap *)(a1 + 3), a2);
}

void sub_1CA1BECAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _QWORD *a11)
{
  std::__tree<unsigned long long>::destroy(a11);
  _Unwind_Resume(a1);
}

unint64_t degas::CountedPathCollection::addToCollectionWithFilter(degas::CountedPathCollection *this, degas::CountedPathCollection *a2, const degas::Bitmap *a3)
{
  unint64_t result;
  _QWORD *v7;
  unint64_t v8;
  BOOL v9;
  _QWORD *v10;
  _QWORD *v11;
  unint64_t v12;
  BOOL v13;
  _QWORD *v14;
  char *v15;
  char *v16;
  char *v17;
  unint64_t v18;
  char *v19;
  char *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;

  result = degas::Bitmap::count(a3);
  if (result < *((_QWORD *)this + 2))
  {
    result = (unint64_t)degas::Bitmap::begin(a3, &v21);
    v7 = (_QWORD *)((char *)this + 8);
    while (1)
    {
      v8 = v22;
      v9 = (const degas::Bitmap *)v21 == a3 && v22 == -1;
      if (v9)
      {
        if (v23 == *((_QWORD *)a3 + 3))
          return result;
        v8 = -1;
      }
      v10 = (_QWORD *)*v7;
      if (*v7)
      {
        v11 = v7;
        do
        {
          v12 = v10[4];
          v13 = v12 >= v8;
          if (v12 >= v8)
            v14 = v10;
          else
            v14 = v10 + 1;
          if (v13)
            v11 = v10;
          v10 = (_QWORD *)*v14;
        }
        while (*v14);
        if (v11 != v7 && v8 >= v11[4])
          degas::CountedPathCollection::addPaths((uint64_t *)a2, v8, v11 + 5);
      }
      result = (unint64_t)degas::Bitmap::iterator::operator++(&v21);
    }
  }
  v17 = *(char **)this;
  v15 = (char *)this + 8;
  v16 = v17;
  if (v17 != v15)
  {
    do
    {
      v18 = *((_QWORD *)v16 + 4);
      result = degas::Bitmap::isSet(a3, v18);
      if ((_DWORD)result)
        result = degas::CountedPathCollection::addPaths((uint64_t *)a2, v18, (_QWORD *)v16 + 5);
      v19 = (char *)*((_QWORD *)v16 + 1);
      if (v19)
      {
        do
        {
          v20 = v19;
          v19 = *(char **)v19;
        }
        while (v19);
      }
      else
      {
        do
        {
          v20 = (char *)*((_QWORD *)v16 + 2);
          v9 = *(_QWORD *)v20 == (_QWORD)v16;
          v16 = v20;
        }
        while (!v9);
      }
      v16 = v20;
    }
    while (v20 != v15);
  }
  return result;
}

BOOL degas::CountedPathCollection::hasPaths(degas::CountedPathCollection *this)
{
  return *((_QWORD *)this + 2) != 0;
}

uint64_t degas::CountedPathCollection::targetNodes(degas::CountedPathCollection *this)
{
  return (uint64_t)this + 24;
}

uint64_t *degas::CountedPathCollection::sourcePathsForTargetNodeId(degas::CountedPathCollection *this, unint64_t a2)
{
  unsigned __int8 v2;
  char *v3;
  _QWORD *v4;
  _QWORD *v5;
  char *v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;
  uint64_t *v10;
  unint64_t v11;
  char *v12;
  int v14;
  unint64_t v15;
  degas::CountedPathCollection *v16;

  if ((v2 & 1) == 0)
  {
    v15 = a2;
    v16 = this;
    a2 = v15;
    this = v16;
    if (v14)
    {
      qword_1EF93ED18 = 0;
      qword_1EF93ED10 = 0;
      degas::CountedPathCollection::sourcePathsForTargetNodeId(unsigned long long)const::emptyEntry = (uint64_t)&qword_1EF93ED10;
      __cxa_atexit((void (*)(void *))std::map<unsigned long long,int>::~map[abi:ne180100], &degas::CountedPathCollection::sourcePathsForTargetNodeId(unsigned long long)const::emptyEntry, &dword_1CA0A5000);
      a2 = v15;
      this = v16;
    }
  }
  v5 = (_QWORD *)*((_QWORD *)this + 1);
  v3 = (char *)this + 8;
  v4 = v5;
  if (!v5)
    return &degas::CountedPathCollection::sourcePathsForTargetNodeId(unsigned long long)const::emptyEntry;
  v6 = v3;
  do
  {
    v7 = v4[4];
    v8 = v7 >= a2;
    if (v7 >= a2)
      v9 = v4;
    else
      v9 = v4 + 1;
    if (v8)
      v6 = (char *)v4;
    v4 = (_QWORD *)*v9;
  }
  while (*v9);
  v10 = &degas::CountedPathCollection::sourcePathsForTargetNodeId(unsigned long long)const::emptyEntry;
  if (v6 != v3)
  {
    v11 = *((_QWORD *)v6 + 4);
    v12 = v6 + 40;
    if (v11 <= a2)
      return (uint64_t *)v12;
  }
  return v10;
}

uint64_t std::map<unsigned long long,int>::~map[abi:ne180100](uint64_t a1)
{
  std::__tree<unsigned long long>::destroy(*(_QWORD **)(a1 + 8));
  return a1;
}

double degas::Distribution::Distribution(degas::Distribution *this)
{
  double result;

  result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  return result;
}

{
  double result;

  result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  return result;
}

_QWORD *degas::Distribution::setCountedPathCollection(_QWORD *a1, uint64_t *a2)
{
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](a1, *a2, a2[1]);
}

_QWORD *degas::Distribution::setUncountedPathCollection(uint64_t a1, uint64_t *a2)
{
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100]((_QWORD *)(a1 + 16), *a2, a2[1]);
}

_QWORD *degas::Distribution::enumeratePaths(_QWORD *result, uint64_t a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  unint64_t v19[3];

  v3 = (_QWORD *)result[2];
  if (v3)
  {
    v6 = (_QWORD *)*v3;
    v4 = v3 + 1;
    v5 = v6;
    if (v6 != v4)
    {
      do
      {
        for (result = degas::Bitmap::begin((_QWORD *)v5[5], v19); ; result = degas::Bitmap::iterator::operator++(v19))
        {
          v7 = v5[5];
          v8 = v19[0] == v7 && v19[1] == -1;
          if (v8 && v19[2] == *(_QWORD *)(v7 + 24))
            break;
          (*(void (**)(uint64_t))(a2 + 16))(a2);
        }
        v9 = (_QWORD *)v5[1];
        if (v9)
        {
          do
          {
            v10 = v9;
            v9 = (_QWORD *)*v9;
          }
          while (v9);
        }
        else
        {
          do
          {
            v10 = (_QWORD *)v5[2];
            v8 = *v10 == (_QWORD)v5;
            v5 = v10;
          }
          while (!v8);
        }
        v5 = v10;
      }
      while (v10 != v4);
    }
  }
  else
  {
    v11 = *result + 8;
    v12 = *(_QWORD **)*result;
    if (v12 != (_QWORD *)v11)
    {
      do
      {
        v13 = (_QWORD *)v12[5];
        if (v13 != v12 + 6)
        {
          v14 = v12[4];
          do
          {
            result = (_QWORD *)(*(uint64_t (**)(uint64_t, _QWORD, uint64_t, _QWORD))(a2 + 16))(a2, v13[4], v14, *((unsigned int *)v13 + 10));
            v15 = (_QWORD *)v13[1];
            if (v15)
            {
              do
              {
                v16 = v15;
                v15 = (_QWORD *)*v15;
              }
              while (v15);
            }
            else
            {
              do
              {
                v16 = (_QWORD *)v13[2];
                v8 = *v16 == (_QWORD)v13;
                v13 = v16;
              }
              while (!v8);
            }
            v13 = v16;
          }
          while (v16 != v12 + 6);
        }
        v17 = (_QWORD *)v12[1];
        if (v17)
        {
          do
          {
            v18 = v17;
            v17 = (_QWORD *)*v17;
          }
          while (v17);
        }
        else
        {
          do
          {
            v18 = (_QWORD *)v12[2];
            v8 = *v18 == (_QWORD)v12;
            v12 = v18;
          }
          while (!v8);
        }
        v12 = v18;
      }
      while (v18 != (_QWORD *)v11);
    }
  }
  return result;
}

uint64_t kg_errorCodeFromDegasReturnCode(int a1)
{
  if ((a1 - 2) > 8)
    return -1;
  else
    return qword_1CA1FE588[a1 - 2];
}

void sub_1CA1BF75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4129(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4130(uint64_t a1)
{

}

void sub_1CA1C2464(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CA1C25BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CA1C2630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CA1C2688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CA1C27B4(_Unwind_Exception *exception_object, int a2)
{
  id v2;

  if (a2)
  {
    if (a2 == 2)
    {
      v2 = objc_begin_catch(exception_object);
      objc_exception_rethrow();
    }
    objc_begin_catch(exception_object);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1CA1C2880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CA1C3198(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1CA1C3254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1CA1C33AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1CA1C3510(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1CA1C35A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1CA1C3658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  void *v12;
  uint64_t v13;

  *(_QWORD *)(v13 - 40) = &a12;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v13 - 40));

  _Unwind_Resume(a1);
}

void sub_1CA1C37A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1CA1C37F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1CA1C3848(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1CA1C38E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1CA1C399C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1CA1C3C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  a10 = (void **)&a15;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

void sub_1CA1C3CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;

  *(_QWORD *)(v11 - 24) = &a11;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v11 - 24));
  _Unwind_Resume(a1);
}

void sub_1CA1C3D0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1CA1C3D64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1CA1C3DCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1CA1C3E40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1CA1C3EB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1CA1C3F28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1CA1C401C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  void *v22;

  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1CA1C40D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1CA1C4134(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1CA1C41B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1CA1C4204(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1CA1C4410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1CA1C4474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1CA1C44D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1CA1C453C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void degas::Bitmap::symmetricDiffWith<degas::Bitmap>(degas::Bitmap *this, uint64_t a2)
{
  uint64_t v2;
  unsigned int Offset;
  unsigned int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  int32x4_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  _QWORD v21[2];

  v2 = (*(_QWORD *)(a2 + 24) - *(_QWORD *)(a2 + 16)) >> 4;
  if ((_DWORD)v2)
  {
    Offset = 0;
    v6 = 0;
    do
    {
      v7 = *((_QWORD *)this + 2);
      v8 = (*((_QWORD *)this + 3) - v7) >> 4;
      if (v8 <= Offset)
        break;
      v9 = *(_QWORD *)(*(_QWORD *)(a2 + 16) + 16 * v6);
      v10 = *(_QWORD *)(*(_QWORD *)(v7 + 16 * Offset) + 8);
      v11 = *(_QWORD *)(v9 + 8);
      if (v10 >= v11)
      {
        if (v10 > v11)
        {
          v12 = *(_QWORD *)this;
          if (*(_QWORD *)this != 0xFFFFFFFFLL)
          {
            v13 = *(_DWORD *)(v9 + 4);
            if (v13 == -1)
            {
              v14 = 0;
              v15 = 0uLL;
              do
              {
                do
                {
                  v15 = (int32x4_t)vpadalq_u16((uint32x4_t)v15, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v9 + 4 * v14 + 16))));
                  v14 += 4;
                }
                while (v14 != 32);
                v14 = 0;
                v13 = vaddvq_s32(v15);
                v15 = 0uLL;
              }
              while (v13 == -1);
              *(_DWORD *)(v9 + 4) = v13;
            }
            *(_QWORD *)this = v12 + v13;
          }
          degas::Bitmap::insertBitset(this, Offset++, (const degas::Bitset *)v9);
          ++v6;
          *((_BYTE *)this + 40) = 1;
        }
        else
        {
          degas::Bitmap::unshadowedBitSetAtIndex(this, Offset, (degas::BitsetPtr *)v21);
          v16 = 0;
          v17 = v21[0];
          v18 = v21[0] + 16;
          do
          {
            *(_DWORD *)(v18 + v16) ^= *(_DWORD *)(v9 + 16 + v16);
            v16 += 4;
          }
          while (v16 != 128);
          *(_DWORD *)(v17 + 4) = -1;
          ++Offset;
          ++v6;
          *(_QWORD *)this = 0xFFFFFFFFLL;
          *((_BYTE *)this + 40) = 1;
          degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)v21);
        }
      }
      else
      {
        Offset = degas::Bitmap::findOffset(this, v11, Offset, v8);
      }
    }
    while (v6 < v2);
    v19 = v2 - v6;
    if (v2 > v6)
    {
      v20 = 16 * v6;
      do
      {
        degas::Bitmap::appendBitset(this, *(const degas::Bitset **)(*(_QWORD *)(a2 + 16) + v20));
        *((_BYTE *)this + 40) = 1;
        v20 += 16;
        --v19;
      }
      while (v19);
    }
  }
}

uint64_t __Block_byref_object_copy__4447(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4448(uint64_t a1)
{

}

BOOL degas::Bitmap::isSubsetOf<degas::Bitmap>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  uint64_t v10;
  int v11;

  if (a1 == a2)
    return 1;
  if (((a4 - a3) & 0xFFFFFFFF0) != 0)
  {
    v4 = 0;
    while (1)
    {
      v5 = *(_QWORD *)(a3 + 16 * v4);
      v6 = *(_QWORD *)(*(_QWORD *)a1 + 8);
      v7 = *(_QWORD *)(v5 + 8);
      if (v6 < v7)
        break;
      if (v6 <= v7)
      {
        v8 = 0;
        v9 = 0;
        v10 = v5 + 16;
        do
        {
          v11 = *(_DWORD *)(*(_QWORD *)a1 + 16 + 4 * v9);
          if (v11 && (v11 & ~*(_DWORD *)(v10 + 4 * v9)) != 0)
            break;
          v8 = v9++ > 0x1E;
        }
        while (v9 != 32);
        if (!v8)
          return 0;
        a1 += 16;
      }
      if (a1 != a2 && ++v4 < (unint64_t)((unint64_t)(a4 - a3) >> 4))
        continue;
      return a1 == a2;
    }
  }
  return 0;
}

uint64_t degas::LiteralBitmap::sizeForPageCount(degas::LiteralBitmap *this)
{
  return (144 * this) | 8;
}

_DWORD *degas::LiteralBitmap::LiteralBitmap(_DWORD *this, int a2)
{
  *this = 7;
  this[1] = a2;
  return this;
}

{
  *this = 7;
  this[1] = a2;
  return this;
}

_BYTE *degas::LiteralBitmap::stampMetadataWithVersion(_BYTE *this)
{
  *this = 7;
  return this;
}

__n128 degas::LiteralBitmap::makeLiteralBitmap(degas::LiteralBitmap *this, const Bitmap *a2)
{
  uint64_t v3;
  _DWORD *v4;
  __n128 result;
  uint64_t *v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  _DWORD *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  int v15;

  v3 = (*((_QWORD *)this + 3) - *((_QWORD *)this + 2)) >> 4;
  v4 = operator new((144 * v3) | 8);
  *v4 = 7;
  v4[1] = v3;
  v6 = (uint64_t *)*((_QWORD *)this + 2);
  v7 = (uint64_t *)*((_QWORD *)this + 3);
  if (v6 != v7)
  {
    v8 = 0;
    do
    {
      v9 = *v6;
      v6 += 2;
      v10 = &v4[36 * v8];
      v11 = *(_OWORD *)(v9 + 96);
      *(_OWORD *)(v10 + 22) = *(_OWORD *)(v9 + 80);
      *(_OWORD *)(v10 + 26) = v11;
      v12 = *(_OWORD *)(v9 + 128);
      *(_OWORD *)(v10 + 30) = *(_OWORD *)(v9 + 112);
      *(_OWORD *)(v10 + 34) = v12;
      v13 = *(_OWORD *)(v9 + 32);
      *(_OWORD *)(v10 + 6) = *(_OWORD *)(v9 + 16);
      *(_OWORD *)(v10 + 10) = v13;
      result = *(__n128 *)(v9 + 48);
      v14 = *(_OWORD *)(v9 + 64);
      *(__n128 *)(v10 + 14) = result;
      v15 = *(_DWORD *)(v9 + 4);
      v10[2] = 0;
      v10[3] = v15;
      *((_QWORD *)v10 + 2) = *(_QWORD *)(v9 + 8);
      ++v8;
      *(_OWORD *)(v10 + 18) = v14;
    }
    while (v6 != v7);
  }
  return result;
}

BOOL degas::LiteralBitmap::operator==(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  uint64_t *v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a2 == a1)
    return 1;
  v2 = *(unsigned int *)(a2 + 4);
  if ((_DWORD)v2 != *(_DWORD *)(a1 + 4))
    return 0;
  if (!(_DWORD)v2)
    return 1;
  if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v3 = 0;
  v4 = (uint64_t *)(a2 + 160);
  v5 = (uint64_t *)(a1 + 160);
  v6 = 1;
  do
  {
    if (memcmp(v5 - 17, v4 - 17, 0x80uLL))
      break;
    v3 = v6 >= v2;
    if (v2 == v6)
      break;
    v8 = *v5;
    v5 += 18;
    v7 = v8;
    v9 = *v4;
    v4 += 18;
    ++v6;
  }
  while (v7 == v9);
  return v3;
}

uint64_t degas::LiteralBitmap::rangeCompare(degas::LiteralBitmap *this, unint64_t a2, unint64_t a3)
{
  unint64_t v3;
  unsigned int v4;

  if (*((unsigned int *)this + 1) <= a3)
    return 0xFFFFFFFFLL;
  v3 = *((_QWORD *)this + 18 * a3 + 2);
  if (v3 + 1024 > a2)
    v4 = 0;
  else
    v4 = -1;
  if (v3 > a2)
    return 1;
  else
    return v4;
}

unint64_t degas::LiteralBitmap::findOffset(degas::LiteralBitmap *this, unint64_t a2)
{
  unsigned int v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;

  v2 = *((_DWORD *)this + 1);
  if (!v2)
  {
    v6 = 0;
    return degas::LiteralBitmap::findOffset(this, a2, v6, v2);
  }
  v3 = *((_QWORD *)this + 2);
  if (v3 + 1024 > a2)
    v4 = 0;
  else
    v4 = -1;
  if (v3 > a2)
    v5 = 1;
  else
    v5 = v4;
  if ((_DWORD)v5 == -1)
  {
    v6 = 1;
    return degas::LiteralBitmap::findOffset(this, a2, v6, v2);
  }
  if ((_DWORD)v5)
  {
    v6 = 0;
    v2 = 0;
    return degas::LiteralBitmap::findOffset(this, a2, v6, v2);
  }
  return v5;
}

unint64_t degas::LiteralBitmap::findOffset(degas::LiteralBitmap *this, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  int v6;

  if (a3 != a4)
  {
    while (1)
    {
      v4 = (a3 + a4) >> 1;
      if (v4 >= *((unsigned int *)this + 1))
        goto LABEL_10;
      v5 = *((_QWORD *)this + 18 * v4 + 2);
      if (v5 <= a2)
        break;
      a4 = (a3 + a4) >> 1;
LABEL_11:
      v4 = a4;
      if (a3 == a4)
        return v4;
    }
    if (v5 + 1024 > a2)
      v6 = 0;
    else
      v6 = -1;
    if (v6 != -1)
      return v4;
LABEL_10:
    a3 = v4 + 1;
    goto LABEL_11;
  }
  return a3;
}

uint64_t degas::LiteralBitmap::isSet(degas::LiteralBitmap *this, unint64_t a2)
{
  unint64_t Offset;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;
  BOOL v9;

  Offset = degas::LiteralBitmap::findOffset(this, a2);
  if (Offset < *((unsigned int *)this + 1)
    && ((v5 = *((_QWORD *)this + 18 * Offset + 2), v6 = v5 + 1024, v7 = a2 >= v5, v8 = a2 - v5, v7)
      ? (v9 = v6 > a2)
      : (v9 = 0),
        v9))
  {
    return (*((_DWORD *)this + 36 * Offset + (v8 >> 5) + 6) >> v8) & 1;
  }
  else
  {
    return 0;
  }
}

unint64_t degas::LiteralBitmap::bitAtIndex(degas::LiteralBitmap *this, unint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  char *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  int32x4_t v11;
  unint64_t v12;
  degas::Bitset *v13;
  unint64_t v15;

  v2 = *((unsigned int *)this + 1);
  if (!(_DWORD)v2)
    return -1;
  v4 = 0;
  v5 = 0;
  while (1)
  {
    v6 = (char *)this + 144 * v4;
    v9 = *((_DWORD *)v6 + 3);
    v7 = (unsigned int *)(v6 + 12);
    v8 = v9;
    if (v9 == -1)
    {
      v10 = 0;
      v11 = 0uLL;
      do
      {
        do
        {
          v11 = (int32x4_t)vpadalq_u16((uint32x4_t)v11, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)this + 144 * v4 + 4 * v10 + 24))));
          v10 += 4;
        }
        while (v10 != 32);
        v10 = 0;
        v8 = vaddvq_s32(v11);
        v11 = 0uLL;
      }
      while (v8 == -1);
      *v7 = v8;
    }
    if (v5 + v8 > a2)
      break;
    ++v4;
    v5 += v8;
    if (v4 == v2)
      return -1;
  }
  v13 = (degas::LiteralBitmap *)((char *)this + 144 * v4 + 8);
  v12 = -1;
  v15 = -1;
  do
  {
    degas::Bitset::nextBit(v13, &v15, v12);
    v12 = v15;
    ++v5;
  }
  while (v5 <= a2);
  return v12;
}

uint64_t degas::LiteralBitmap::count(degas::LiteralBitmap *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  int32x4_t v9;

  v1 = *((unsigned int *)this + 1);
  if (!(_DWORD)v1)
    return 0;
  v2 = 0;
  v3 = 0;
  do
  {
    v4 = (char *)this + 144 * v2;
    v7 = *((_DWORD *)v4 + 3);
    v5 = (unsigned int *)(v4 + 12);
    v6 = v7;
    if (v7 == -1)
    {
      v8 = 0;
      v9 = 0uLL;
      do
      {
        do
        {
          v9 = (int32x4_t)vpadalq_u16((uint32x4_t)v9, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)this + 144 * v2 + 4 * v8 + 24))));
          v8 += 4;
        }
        while (v8 != 32);
        v8 = 0;
        v6 = vaddvq_s32(v9);
        v9 = 0uLL;
      }
      while (v6 == -1);
      *v5 = v6;
    }
    v3 += v6;
    ++v2;
  }
  while (v2 != v1);
  return v3;
}

uint64_t degas::LiteralBitmap::countBitsInRange(degas::LiteralBitmap *this, unint64_t a2, unint64_t a3)
{
  unint64_t Offset;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int32x4_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;
  unint64_t v16;
  unint64_t v17;
  char *v19;
  unsigned int *v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  unint64_t v24;

  if (a2 > a3)
    return 0;
  Offset = degas::LiteralBitmap::findOffset(this, a2);
  v7 = *((unsigned int *)this + 1);
  if (Offset >= v7)
    return 0;
  v8 = Offset;
  v9 = degas::LiteralBitmap::findOffset(this, a3, Offset, *((unsigned int *)this + 1));
  v11 = v9 - (v9 >= v7);
  v12 = *((_QWORD *)this + 18 * v8 + 2);
  if (v12 <= a3 && v12 + 1024 >= a2)
    v14 = degas::Bitset::countBitsInRange((degas::LiteralBitmap *)((char *)this + 144 * v8 + 8), a2, a3, *(int8x8_t *)v10.i8);
  else
    v14 = 0;
  if (v8 != v11)
  {
    v16 = v8 + 1;
    if (v8 + 1 < v11)
    {
      do
      {
        v17 = *((_QWORD *)this + 18 * v16 + 2);
        if (v17 <= a3 && v17 + 1024 >= a2)
        {
          v19 = (char *)this + 144 * v16;
          v22 = *((_DWORD *)v19 + 3);
          v20 = (unsigned int *)(v19 + 12);
          v21 = v22;
          if (v22 == -1)
          {
            v23 = 0;
            v10 = 0uLL;
            do
            {
              do
              {
                v10 = (int32x4_t)vpadalq_u16((uint32x4_t)v10, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)this + 144 * v16+ 4 * v23+ 24))));
                v23 += 4;
              }
              while (v23 != 32);
              v23 = 0;
              v21 = vaddvq_s32(v10);
              v10 = 0uLL;
            }
            while (v21 == -1);
            *v20 = v21;
          }
          v14 += v21;
        }
        ++v16;
      }
      while (v16 != v11);
    }
    v24 = *((_QWORD *)this + 18 * v11 + 2);
    if (v24 <= a3 && v24 + 1024 >= a2)
      v14 += degas::Bitset::countBitsInRange((degas::LiteralBitmap *)((char *)this + 144 * v11 + 8), a2, a3, *(int8x8_t *)v10.i8);
  }
  return v14;
}

unint64_t degas::LiteralBitmap::firstBit(degas::LiteralBitmap *this)
{
  unint64_t v1;
  unint64_t v3;

  v1 = -1;
  v3 = -1;
  if (*((_DWORD *)this + 1))
  {
    v1 = *((_QWORD *)this + 2);
    if (v1 > 0xFFFFFFFFFFFFFBFFLL || (*((_BYTE *)this + 24) & 1) == 0)
    {
      degas::Bitset::nextBit((degas::LiteralBitmap *)((char *)this + 8), &v3, v1);
      return v3;
    }
  }
  return v1;
}

unint64_t degas::LiteralBitmap::lastBit(degas::LiteralBitmap *this)
{
  int v1;
  unsigned int v2;
  uint64_t i;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *((_DWORD *)this + 1);
  if (!v1)
    return 0;
  v2 = v1 - 1;
  for (i = 37; i != 6; --i)
  {
    v4 = *((_DWORD *)this + 36 * v2 + i);
    if (v4)
    {
      v5 = i - 6;
      return (__clz(v4) ^ 0x1F | (unint64_t)(32 * v5)) + *((_QWORD *)this + 18 * v2 + 2);
    }
  }
  v5 = 0;
  v6 = 0;
  v4 = *((_DWORD *)this + 36 * v2 + 6);
  if (!v4)
    return v6;
  return (__clz(v4) ^ 0x1F | (unint64_t)(32 * v5)) + *((_QWORD *)this + 18 * v2 + 2);
}

char *degas::LiteralBitmap::emptyBitmap(degas::LiteralBitmap *this)
{
  unsigned __int8 v1;

  {
    *(_QWORD *)&degas::LiteralBitmap::emptyBitmap(void)::bitmap = 7;
  }
  return &degas::LiteralBitmap::emptyBitmap(void)::bitmap;
}

void degas::AggregateValueTable::~AggregateValueTable(degas::AggregateValueTable *this)
{
  *(_QWORD *)this = off_1E83E43A8;
  *((_QWORD *)this + 4) = 0;
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
}

{
  *(_QWORD *)this = off_1E83E43A8;
  *((_QWORD *)this + 4) = 0;
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
  JUMPOUT(0x1CAA4ADC8);
}

{
  *(_QWORD *)this = off_1E83E43A8;
  *((_QWORD *)this + 4) = 0;
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
}

uint64_t degas::AggregateValueTable::createTable(degas::AggregateValueTable *this)
{
  return 0;
}

uint64_t degas::AggregateValueTable::deleteEntry(degas::AggregateValueTable *this)
{
  return 2;
}

uint64_t degas::AggregateValueTable::AggregateValueTable(uint64_t a1, uint64_t a2, __int128 *a3, char a4, uint64_t a5)
{
  std::string *v9;
  __int128 v10;

  *(_QWORD *)a1 = off_1E83E43A8;
  v9 = (std::string *)(a1 + 8);
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v10 = *a3;
    v9->__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v10;
  }
  *(_QWORD *)(a1 + 32) = a2;
  *(_QWORD *)(a1 + 40) = a5;
  *(_QWORD *)a1 = off_1E83E4E78;
  *(_BYTE *)(a1 + 48) = a4;
  return a1;
}

{
  std::string *v9;
  __int128 v10;

  *(_QWORD *)a1 = off_1E83E43A8;
  v9 = (std::string *)(a1 + 8);
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v10 = *a3;
    v9->__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v10;
  }
  *(_QWORD *)(a1 + 32) = a2;
  *(_QWORD *)(a1 + 40) = a5;
  *(_QWORD *)a1 = off_1E83E4E78;
  *(_BYTE *)(a1 + 48) = a4;
  return a1;
}

uint64_t *degas::AggregateValueTable::readByIdentifierStatement(degas::AggregateValueTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x600;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas19AggregateValueTable25readByIdentifierStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_4537;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas19AggregateValueTable25readByIdentifierStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" where elementId=?1", 19);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1C57A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByAttrIdIdentifierStatement(degas::AggregateValueTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x800;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas19AggregateValueTable31readByAttrIdIdentifierStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_4_4541;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas19AggregateValueTable31readByAttrIdIdentifierStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" where elementId=?1 and attributeId=?2", 38);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1C59B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByBitmapStatement(degas::AggregateValueTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x801;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas19AggregateValueTable21readByBitmapStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_7_4543;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas19AggregateValueTable21readByBitmapStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"select mergeLiteralBitmap(v.elementId) from ", 44);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" v, identifierBitmap(?1) b where v.elementId = b.value", 54);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1C5BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByIntValueStatement(uint64_t a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  _QWORD v5[5];
  int v6;

  v2 = a2 | (*(unsigned __int8 *)(a1 + 48) << 16) | 0x900;
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable23readByIntValueStatementENS_14BinaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_10_4546;
  v5[4] = a1;
  v6 = a2;
  return degas::StatementCache::getStatement(v3, v2, (uint64_t)v5);
}

uint64_t ___ZNK5degas19AggregateValueTable23readByIntValueStatementENS_14BinaryOperatorE_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  size_t v10;
  sqlite3_stmt **v11;
  sqlite3 *v12;
  void *__p;
  char v15;
  _QWORD v16[11];
  char v17;
  uint64_t v18;

  v4 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  v5 = *(char *)(v4 + 31);
  if (v5 >= 0)
    v6 = v4 + 8;
  else
    v6 = *(_QWORD *)(v4 + 8);
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(v4 + 31);
  else
    v7 = *(_QWORD *)(v4 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)" where attributeId=?1 and intValue", 34);
  v8 = *(unsigned int *)(a1 + 40);
  if (v8 > 8)
    v9 = " == ";
  else
    v9 = (const char *)*((_QWORD *)&off_1E83E3198 + v8);
  v10 = strlen(v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)v9, v10);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"?2 order by elementId", 21);
  v11 = (sqlite3_stmt **)operator new();
  v12 = *(sqlite3 **)(v4 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v11, v12, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v11);
  if (v15 < 0)
    operator delete(__p);
  v16[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v16 + *(_QWORD *)(v16[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v16[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v17 < 0)
    operator delete((void *)v16[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v18);
}

void sub_1CA1C5E34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByRealValueStatement(uint64_t a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  _QWORD v5[5];
  int v6;

  v2 = a2 | (*(unsigned __int8 *)(a1 + 48) << 16) | 0xA00;
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable24readByRealValueStatementENS_14BinaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_12_4549;
  v5[4] = a1;
  v6 = a2;
  return degas::StatementCache::getStatement(v3, v2, (uint64_t)v5);
}

uint64_t ___ZNK5degas19AggregateValueTable24readByRealValueStatementENS_14BinaryOperatorE_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  size_t v10;
  sqlite3_stmt **v11;
  sqlite3 *v12;
  void *__p;
  char v15;
  _QWORD v16[11];
  char v17;
  uint64_t v18;

  v4 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  v5 = *(char *)(v4 + 31);
  if (v5 >= 0)
    v6 = v4 + 8;
  else
    v6 = *(_QWORD *)(v4 + 8);
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(v4 + 31);
  else
    v7 = *(_QWORD *)(v4 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)" where attributeId=?1 and realValue", 35);
  v8 = *(unsigned int *)(a1 + 40);
  if (v8 > 8)
    v9 = " == ";
  else
    v9 = (const char *)*((_QWORD *)&off_1E83E3198 + v8);
  v10 = strlen(v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)v9, v10);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"?2 order by elementId", 21);
  v11 = (sqlite3_stmt **)operator new();
  v12 = *(sqlite3 **)(v4 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v11, v12, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v11);
  if (v15 < 0)
    operator delete(__p);
  v16[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v16 + *(_QWORD *)(v16[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v16[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v17 < 0)
    operator delete((void *)v16[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v18);
}

void sub_1CA1C60A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByStringValueStatement(uint64_t a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  _QWORD v5[5];
  int v6;

  v2 = a2 | (*(unsigned __int8 *)(a1 + 48) << 16) | 0xB00;
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable26readByStringValueStatementENS_14BinaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_14_4551;
  v5[4] = a1;
  v6 = a2;
  return degas::StatementCache::getStatement(v3, v2, (uint64_t)v5);
}

uint64_t ___ZNK5degas19AggregateValueTable26readByStringValueStatementENS_14BinaryOperatorE_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  size_t v10;
  sqlite3_stmt **v11;
  sqlite3 *v12;
  void *__p;
  char v15;
  _QWORD v16[11];
  char v17;
  uint64_t v18;

  v4 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  v5 = *(char *)(v4 + 31);
  if (v5 >= 0)
    v6 = v4 + 8;
  else
    v6 = *(_QWORD *)(v4 + 8);
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(v4 + 31);
  else
    v7 = *(_QWORD *)(v4 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)" where attributeId=?1 and stringValue", 37);
  v8 = *(unsigned int *)(a1 + 40);
  if (v8 > 8)
    v9 = " == ";
  else
    v9 = (const char *)*((_QWORD *)&off_1E83E3198 + v8);
  v10 = strlen(v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)v9, v10);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"?2 order by elementId", 21);
  v11 = (sqlite3_stmt **)operator new();
  v12 = *(sqlite3 **)(v4 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v11, v12, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v11);
  if (v15 < 0)
    operator delete(__p);
  v16[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v16 + *(_QWORD *)(v16[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v16[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v17 < 0)
    operator delete((void *)v16[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v18);
}

void sub_1CA1C631C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByIntValuesStatement(uint64_t a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  _QWORD v5[5];
  int v6;

  v2 = a2 | (*(unsigned __int8 *)(a1 + 48) << 16) | 0xC00;
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable24readByIntValuesStatementENS_14BinaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_16_4553;
  v5[4] = a1;
  v6 = a2;
  return degas::StatementCache::getStatement(v3, v2, (uint64_t)v5);
}

uint64_t ___ZNK5degas19AggregateValueTable24readByIntValuesStatementENS_14BinaryOperatorE_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  size_t v9;
  sqlite3_stmt **v10;
  sqlite3 *v11;
  void *__p;
  char v14;
  _QWORD v15[11];
  char v16;
  uint64_t v17;

  v4 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v15);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  v5 = *(char *)(v4 + 31);
  if (v5 >= 0)
    v6 = v4 + 8;
  else
    v6 = *(_QWORD *)(v4 + 8);
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(v4 + 31);
  else
    v7 = *(_QWORD *)(v4 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" where attributeId=?1 and intValue", 34);
  v8 = degas::AttributeValueTable::listOperatorText(*(_DWORD *)(a1 + 40));
  v9 = strlen(v8);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)v8, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"valueArray(?2, ?3, 'int64') order by elementId", 46);
  v10 = (sqlite3_stmt **)operator new();
  v11 = *(sqlite3 **)(v4 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v10, v11, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v10);
  if (v14 < 0)
    operator delete(__p);
  v15[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v15 + *(_QWORD *)(v15[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v15[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v16 < 0)
    operator delete((void *)v15[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v17);
}

void sub_1CA1C6570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByRealValuesStatement(uint64_t a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  _QWORD v5[5];
  int v6;

  v2 = a2 | (*(unsigned __int8 *)(a1 + 48) << 16) | 0xD00;
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable25readByRealValuesStatementENS_14BinaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_18_4555;
  v5[4] = a1;
  v6 = a2;
  return degas::StatementCache::getStatement(v3, v2, (uint64_t)v5);
}

uint64_t ___ZNK5degas19AggregateValueTable25readByRealValuesStatementENS_14BinaryOperatorE_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  size_t v9;
  sqlite3_stmt **v10;
  sqlite3 *v11;
  void *__p;
  char v14;
  _QWORD v15[11];
  char v16;
  uint64_t v17;

  v4 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v15);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  v5 = *(char *)(v4 + 31);
  if (v5 >= 0)
    v6 = v4 + 8;
  else
    v6 = *(_QWORD *)(v4 + 8);
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(v4 + 31);
  else
    v7 = *(_QWORD *)(v4 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" where attributeId=?1 and realValue", 35);
  v8 = degas::AttributeValueTable::listOperatorText(*(_DWORD *)(a1 + 40));
  v9 = strlen(v8);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)v8, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"valueArray(?2, ?3, 'double') order by elementId", 47);
  v10 = (sqlite3_stmt **)operator new();
  v11 = *(sqlite3 **)(v4 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v10, v11, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v10);
  if (v14 < 0)
    operator delete(__p);
  v15[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v15 + *(_QWORD *)(v15[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v15[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v16 < 0)
    operator delete((void *)v15[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v17);
}

void sub_1CA1C67C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByStringValuesStatement(uint64_t a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  _QWORD v5[5];
  int v6;

  v2 = a2 | (*(unsigned __int8 *)(a1 + 48) << 16) | 0xE00;
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable27readByStringValuesStatementENS_14BinaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_20_4557;
  v5[4] = a1;
  v6 = a2;
  return degas::StatementCache::getStatement(v3, v2, (uint64_t)v5);
}

uint64_t ___ZNK5degas19AggregateValueTable27readByStringValuesStatementENS_14BinaryOperatorE_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  size_t v9;
  sqlite3_stmt **v10;
  sqlite3 *v11;
  void *__p;
  char v14;
  _QWORD v15[11];
  char v16;
  uint64_t v17;

  v4 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v15);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  v5 = *(char *)(v4 + 31);
  if (v5 >= 0)
    v6 = v4 + 8;
  else
    v6 = *(_QWORD *)(v4 + 8);
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(v4 + 31);
  else
    v7 = *(_QWORD *)(v4 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" where attributeId=?1 and stringValue", 37);
  v8 = degas::AttributeValueTable::listOperatorText(*(_DWORD *)(a1 + 40));
  v9 = strlen(v8);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)v8, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"valueArray(?2, ?3, 'char*') order by elementId", 46);
  v10 = (sqlite3_stmt **)operator new();
  v11 = *(sqlite3 **)(v4 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v10, v11, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v10);
  if (v14 < 0)
    operator delete(__p);
  v15[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v15 + *(_QWORD *)(v15[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v15[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v16 < 0)
    operator delete((void *)v15[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v17);
}

void sub_1CA1C6A1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByIntValueIdentifiersStatement(uint64_t a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  _QWORD v5[5];
  int v6;

  v2 = (a2 + 16) | (*(unsigned __int8 *)(a1 + 48) << 16) | 0x900;
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable34readByIntValueIdentifiersStatementENS_14BinaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_23;
  v5[4] = a1;
  v6 = a2;
  return degas::StatementCache::getStatement(v3, v2, (uint64_t)v5);
}

uint64_t ___ZNK5degas19AggregateValueTable34readByIntValueIdentifiersStatementENS_14BinaryOperatorE_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  size_t v10;
  sqlite3_stmt **v11;
  sqlite3 *v12;
  void *__p;
  char v15;
  _QWORD v16[11];
  char v17;
  uint64_t v18;

  v4 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  v5 = *(char *)(v4 + 31);
  if (v5 >= 0)
    v6 = v4 + 8;
  else
    v6 = *(_QWORD *)(v4 + 8);
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(v4 + 31);
  else
    v7 = *(_QWORD *)(v4 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)" where elementId in identifierBitmap(?1) and attributeId = ?2 and +intValue", 75);
  v8 = *(unsigned int *)(a1 + 40);
  if (v8 > 8)
    v9 = " == ";
  else
    v9 = (const char *)*((_QWORD *)&off_1E83E3198 + v8);
  v10 = strlen(v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)v9, v10);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"?3", 2);
  v11 = (sqlite3_stmt **)operator new();
  v12 = *(sqlite3 **)(v4 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v11, v12, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v11);
  if (v15 < 0)
    operator delete(__p);
  v16[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v16 + *(_QWORD *)(v16[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v16[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v17 < 0)
    operator delete((void *)v16[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v18);
}

void sub_1CA1C6C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByRealValueIdentifiersStatement(uint64_t a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  _QWORD v5[5];
  int v6;

  v2 = (a2 + 16) | (*(unsigned __int8 *)(a1 + 48) << 16) | 0xA00;
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable35readByRealValueIdentifiersStatementENS_14BinaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_25;
  v5[4] = a1;
  v6 = a2;
  return degas::StatementCache::getStatement(v3, v2, (uint64_t)v5);
}

uint64_t ___ZNK5degas19AggregateValueTable35readByRealValueIdentifiersStatementENS_14BinaryOperatorE_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  size_t v10;
  sqlite3_stmt **v11;
  sqlite3 *v12;
  void *__p;
  char v15;
  _QWORD v16[11];
  char v17;
  uint64_t v18;

  v4 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  v5 = *(char *)(v4 + 31);
  if (v5 >= 0)
    v6 = v4 + 8;
  else
    v6 = *(_QWORD *)(v4 + 8);
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(v4 + 31);
  else
    v7 = *(_QWORD *)(v4 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)" where elementId in identifierBitmap(?1) and attributeId = ?2 and +realValue", 76);
  v8 = *(unsigned int *)(a1 + 40);
  if (v8 > 8)
    v9 = " == ";
  else
    v9 = (const char *)*((_QWORD *)&off_1E83E3198 + v8);
  v10 = strlen(v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)v9, v10);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"?3", 2);
  v11 = (sqlite3_stmt **)operator new();
  v12 = *(sqlite3 **)(v4 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v11, v12, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v11);
  if (v15 < 0)
    operator delete(__p);
  v16[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v16 + *(_QWORD *)(v16[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v16[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v17 < 0)
    operator delete((void *)v16[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v18);
}

void sub_1CA1C6F0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByStringValueIdentifiersStatement(uint64_t a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  _QWORD v5[5];
  int v6;

  v2 = (a2 + 16) | (*(unsigned __int8 *)(a1 + 48) << 16) | 0xB00;
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable37readByStringValueIdentifiersStatementENS_14BinaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_27;
  v5[4] = a1;
  v6 = a2;
  return degas::StatementCache::getStatement(v3, v2, (uint64_t)v5);
}

uint64_t ___ZNK5degas19AggregateValueTable37readByStringValueIdentifiersStatementENS_14BinaryOperatorE_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  size_t v10;
  sqlite3_stmt **v11;
  sqlite3 *v12;
  void *__p;
  char v15;
  _QWORD v16[11];
  char v17;
  uint64_t v18;

  v4 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  v5 = *(char *)(v4 + 31);
  if (v5 >= 0)
    v6 = v4 + 8;
  else
    v6 = *(_QWORD *)(v4 + 8);
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(v4 + 31);
  else
    v7 = *(_QWORD *)(v4 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)" where elementId in identifierBitmap(?1) and attributeId = ?2 and +stringValue", 78);
  v8 = *(unsigned int *)(a1 + 40);
  if (v8 > 8)
    v9 = " == ";
  else
    v9 = (const char *)*((_QWORD *)&off_1E83E3198 + v8);
  v10 = strlen(v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)v9, v10);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"?3", 2);
  v11 = (sqlite3_stmt **)operator new();
  v12 = *(sqlite3 **)(v4 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v11, v12, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v11);
  if (v15 < 0)
    operator delete(__p);
  v16[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v16 + *(_QWORD *)(v16[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v16[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v17 < 0)
    operator delete((void *)v16[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v18);
}

void sub_1CA1C7184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByIntValuesIdentifiersStatement(uint64_t a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  _QWORD v5[5];
  int v6;

  v2 = (a2 + 16) | (*(unsigned __int8 *)(a1 + 48) << 16) | 0xC00;
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable35readByIntValuesIdentifiersStatementENS_14BinaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_29;
  v5[4] = a1;
  v6 = a2;
  return degas::StatementCache::getStatement(v3, v2, (uint64_t)v5);
}

uint64_t ___ZNK5degas19AggregateValueTable35readByIntValuesIdentifiersStatementENS_14BinaryOperatorE_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  size_t v9;
  sqlite3_stmt **v10;
  sqlite3 *v11;
  void *__p;
  char v14;
  _QWORD v15[11];
  char v16;
  uint64_t v17;

  v4 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v15);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  v5 = *(char *)(v4 + 31);
  if (v5 >= 0)
    v6 = v4 + 8;
  else
    v6 = *(_QWORD *)(v4 + 8);
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(v4 + 31);
  else
    v7 = *(_QWORD *)(v4 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" where elementId in identifierBitmap(?1) and attributeId = ?2 and +intValue", 75);
  v8 = degas::AttributeValueTable::listOperatorText(*(_DWORD *)(a1 + 40));
  v9 = strlen(v8);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)v8, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"valueArray(?3, ?4, 'int64') order by elementId", 46);
  v10 = (sqlite3_stmt **)operator new();
  v11 = *(sqlite3 **)(v4 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v10, v11, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v10);
  if (v14 < 0)
    operator delete(__p);
  v15[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v15 + *(_QWORD *)(v15[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v15[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v16 < 0)
    operator delete((void *)v15[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v17);
}

void sub_1CA1C73DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByRealValuesIdentifiersStatement(uint64_t a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  _QWORD v5[5];
  int v6;

  v2 = (a2 + 16) | (*(unsigned __int8 *)(a1 + 48) << 16) | 0xD00;
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable36readByRealValuesIdentifiersStatementENS_14BinaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_31_4564;
  v5[4] = a1;
  v6 = a2;
  return degas::StatementCache::getStatement(v3, v2, (uint64_t)v5);
}

uint64_t ___ZNK5degas19AggregateValueTable36readByRealValuesIdentifiersStatementENS_14BinaryOperatorE_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  size_t v9;
  sqlite3_stmt **v10;
  sqlite3 *v11;
  void *__p;
  char v14;
  _QWORD v15[11];
  char v16;
  uint64_t v17;

  v4 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v15);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  v5 = *(char *)(v4 + 31);
  if (v5 >= 0)
    v6 = v4 + 8;
  else
    v6 = *(_QWORD *)(v4 + 8);
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(v4 + 31);
  else
    v7 = *(_QWORD *)(v4 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" where elementId in identifierBitmap(?1) and attributeId = ?2 and +realValue", 76);
  v8 = degas::AttributeValueTable::listOperatorText(*(_DWORD *)(a1 + 40));
  v9 = strlen(v8);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)v8, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"valueArray(?3, ?4, 'double') order by elementId", 47);
  v10 = (sqlite3_stmt **)operator new();
  v11 = *(sqlite3 **)(v4 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v10, v11, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v10);
  if (v14 < 0)
    operator delete(__p);
  v15[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v15 + *(_QWORD *)(v15[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v15[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v16 < 0)
    operator delete((void *)v15[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v17);
}

void sub_1CA1C7638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByStringValuesIdentifiersStatement(uint64_t a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  _QWORD v5[5];
  int v6;

  v2 = (a2 + 16) | (*(unsigned __int8 *)(a1 + 48) << 16) | 0xE00;
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable38readByStringValuesIdentifiersStatementENS_14BinaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_33;
  v5[4] = a1;
  v6 = a2;
  return degas::StatementCache::getStatement(v3, v2, (uint64_t)v5);
}

uint64_t ___ZNK5degas19AggregateValueTable38readByStringValuesIdentifiersStatementENS_14BinaryOperatorE_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  size_t v9;
  sqlite3_stmt **v10;
  sqlite3 *v11;
  void *__p;
  char v14;
  _QWORD v15[11];
  char v16;
  uint64_t v17;

  v4 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v15);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  v5 = *(char *)(v4 + 31);
  if (v5 >= 0)
    v6 = v4 + 8;
  else
    v6 = *(_QWORD *)(v4 + 8);
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(v4 + 31);
  else
    v7 = *(_QWORD *)(v4 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" where elementId in identifierBitmap(?1) and attributeId = ?2 and +stringValue", 78);
  v8 = degas::AttributeValueTable::listOperatorText(*(_DWORD *)(a1 + 40));
  v9 = strlen(v8);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)v8, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"valueArray(?3, ?4, 'char*') order by elementId", 46);
  v10 = (sqlite3_stmt **)operator new();
  v11 = *(sqlite3 **)(v4 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v10, v11, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v10);
  if (v14 < 0)
    operator delete(__p);
  v15[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v15 + *(_QWORD *)(v15[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v15[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v16 < 0)
    operator delete((void *)v15[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v17);
}

void sub_1CA1C7890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByIntRangeStatement(uint64_t a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  _QWORD v5[5];
  int v6;

  v2 = (a2 + 32) | (*(unsigned __int8 *)(a1 + 48) << 16) | 0x900;
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable23readByIntRangeStatementENS_15TernaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_37_4567;
  v5[4] = a1;
  v6 = a2;
  return degas::StatementCache::getStatement(v3, v2, (uint64_t)v5);
}

uint64_t ___ZNK5degas19AggregateValueTable23readByIntRangeStatementENS_15TernaryOperatorE_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void **v8;
  uint64_t v9;
  sqlite3_stmt **v10;
  sqlite3 *v11;
  void *__p[2];
  unsigned __int8 v14;
  _QWORD v15[11];
  char v16;
  uint64_t v17;

  v4 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v15);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  v5 = *(char *)(v4 + 31);
  if (v5 >= 0)
    v6 = v4 + 8;
  else
    v6 = *(_QWORD *)(v4 + 8);
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(v4 + 31);
  else
    v7 = *(_QWORD *)(v4 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" where attributeId=?1 and ", 26);
  degas::AttributeValueTable::rangeOperatorText("intValue", *(_DWORD *)(a1 + 40));
  if ((v14 & 0x80u) == 0)
    v8 = __p;
  else
    v8 = (void **)__p[0];
  if ((v14 & 0x80u) == 0)
    v9 = v14;
  else
    v9 = (uint64_t)__p[1];
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)v8, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" order by elementId", 19);
  if ((char)v14 < 0)
    operator delete(__p[0]);
  v10 = (sqlite3_stmt **)operator new();
  v11 = *(sqlite3 **)(v4 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v10, v11, (uint64_t)__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v10);
  if ((char)v14 < 0)
    operator delete(__p[0]);
  v15[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v15 + *(_QWORD *)(v15[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v15[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v16 < 0)
    operator delete((void *)v15[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v17);
}

void sub_1CA1C7B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByRealRangeStatement(uint64_t a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  _QWORD v5[5];
  int v6;

  v2 = (a2 + 32) | (*(unsigned __int8 *)(a1 + 48) << 16) | 0xA00;
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable24readByRealRangeStatementENS_15TernaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_39_4570;
  v5[4] = a1;
  v6 = a2;
  return degas::StatementCache::getStatement(v3, v2, (uint64_t)v5);
}

uint64_t ___ZNK5degas19AggregateValueTable24readByRealRangeStatementENS_15TernaryOperatorE_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void **v8;
  uint64_t v9;
  sqlite3_stmt **v10;
  sqlite3 *v11;
  void *__p[2];
  unsigned __int8 v14;
  _QWORD v15[11];
  char v16;
  uint64_t v17;

  v4 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v15);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  v5 = *(char *)(v4 + 31);
  if (v5 >= 0)
    v6 = v4 + 8;
  else
    v6 = *(_QWORD *)(v4 + 8);
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(v4 + 31);
  else
    v7 = *(_QWORD *)(v4 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" where attributeId=?1 and ", 26);
  degas::AttributeValueTable::rangeOperatorText("realValue", *(_DWORD *)(a1 + 40));
  if ((v14 & 0x80u) == 0)
    v8 = __p;
  else
    v8 = (void **)__p[0];
  if ((v14 & 0x80u) == 0)
    v9 = v14;
  else
    v9 = (uint64_t)__p[1];
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)v8, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" order by elementId", 19);
  if ((char)v14 < 0)
    operator delete(__p[0]);
  v10 = (sqlite3_stmt **)operator new();
  v11 = *(sqlite3 **)(v4 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v10, v11, (uint64_t)__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v10);
  if ((char)v14 < 0)
    operator delete(__p[0]);
  v15[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v15 + *(_QWORD *)(v15[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v15[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v16 < 0)
    operator delete((void *)v15[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v17);
}

void sub_1CA1C7DB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByStringRangeStatement(uint64_t a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  _QWORD v5[5];
  int v6;

  v2 = (a2 + 32) | (*(unsigned __int8 *)(a1 + 48) << 16) | 0xB00;
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable26readByStringRangeStatementENS_15TernaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_41_4572;
  v5[4] = a1;
  v6 = a2;
  return degas::StatementCache::getStatement(v3, v2, (uint64_t)v5);
}

uint64_t ___ZNK5degas19AggregateValueTable26readByStringRangeStatementENS_15TernaryOperatorE_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void **v8;
  uint64_t v9;
  sqlite3_stmt **v10;
  sqlite3 *v11;
  void *__p[2];
  unsigned __int8 v14;
  _QWORD v15[11];
  char v16;
  uint64_t v17;

  v4 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v15);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  v5 = *(char *)(v4 + 31);
  if (v5 >= 0)
    v6 = v4 + 8;
  else
    v6 = *(_QWORD *)(v4 + 8);
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(v4 + 31);
  else
    v7 = *(_QWORD *)(v4 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" where attributeId=?1 and ", 26);
  degas::AttributeValueTable::rangeOperatorText("stringValue", *(_DWORD *)(a1 + 40));
  if ((v14 & 0x80u) == 0)
    v8 = __p;
  else
    v8 = (void **)__p[0];
  if ((v14 & 0x80u) == 0)
    v9 = v14;
  else
    v9 = (uint64_t)__p[1];
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)v8, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" order by elementId", 19);
  if ((char)v14 < 0)
    operator delete(__p[0]);
  v10 = (sqlite3_stmt **)operator new();
  v11 = *(sqlite3 **)(v4 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v10, v11, (uint64_t)__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v10);
  if ((char)v14 < 0)
    operator delete(__p[0]);
  v15[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v15 + *(_QWORD *)(v15[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v15[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v16 < 0)
    operator delete((void *)v15[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v17);
}

void sub_1CA1C8054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByIntRangeIdentifiersStatement(uint64_t a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  _QWORD v5[5];
  int v6;

  v2 = (a2 + 64) | (*(unsigned __int8 *)(a1 + 48) << 16) | 0x900;
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable34readByIntRangeIdentifiersStatementENS_15TernaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_44_4574;
  v5[4] = a1;
  v6 = a2;
  return degas::StatementCache::getStatement(v3, v2, (uint64_t)v5);
}

uint64_t ___ZNK5degas19AggregateValueTable34readByIntRangeIdentifiersStatementENS_15TernaryOperatorE_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void **v8;
  uint64_t v9;
  sqlite3_stmt **v10;
  sqlite3 *v11;
  void *__p[2];
  unsigned __int8 v14;
  _QWORD v15[11];
  char v16;
  uint64_t v17;

  v4 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v15);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  v5 = *(char *)(v4 + 31);
  if (v5 >= 0)
    v6 = v4 + 8;
  else
    v6 = *(_QWORD *)(v4 + 8);
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(v4 + 31);
  else
    v7 = *(_QWORD *)(v4 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" where attributeId=?1 and ", 26);
  degas::AttributeValueTable::rangeOperatorText("+intValue", *(_DWORD *)(a1 + 40));
  if ((v14 & 0x80u) == 0)
    v8 = __p;
  else
    v8 = (void **)__p[0];
  if ((v14 & 0x80u) == 0)
    v9 = v14;
  else
    v9 = (uint64_t)__p[1];
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)v8, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" and elementId in identifierBitmap(?4) order by elementId", 57);
  if ((char)v14 < 0)
    operator delete(__p[0]);
  v10 = (sqlite3_stmt **)operator new();
  v11 = *(sqlite3 **)(v4 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v10, v11, (uint64_t)__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v10);
  if ((char)v14 < 0)
    operator delete(__p[0]);
  v15[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v15 + *(_QWORD *)(v15[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v15[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v16 < 0)
    operator delete((void *)v15[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v17);
}

void sub_1CA1C82F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByRealRangeIdentifiersStatement(uint64_t a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  _QWORD v5[5];
  int v6;

  v2 = (a2 + 64) | (*(unsigned __int8 *)(a1 + 48) << 16) | 0xA00;
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable35readByRealRangeIdentifiersStatementENS_15TernaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_46_4577;
  v5[4] = a1;
  v6 = a2;
  return degas::StatementCache::getStatement(v3, v2, (uint64_t)v5);
}

uint64_t ___ZNK5degas19AggregateValueTable35readByRealRangeIdentifiersStatementENS_15TernaryOperatorE_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void **v8;
  uint64_t v9;
  sqlite3_stmt **v10;
  sqlite3 *v11;
  void *__p[2];
  unsigned __int8 v14;
  _QWORD v15[11];
  char v16;
  uint64_t v17;

  v4 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v15);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  v5 = *(char *)(v4 + 31);
  if (v5 >= 0)
    v6 = v4 + 8;
  else
    v6 = *(_QWORD *)(v4 + 8);
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(v4 + 31);
  else
    v7 = *(_QWORD *)(v4 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" where attributeId=?1 and ", 26);
  degas::AttributeValueTable::rangeOperatorText("+realValue", *(_DWORD *)(a1 + 40));
  if ((v14 & 0x80u) == 0)
    v8 = __p;
  else
    v8 = (void **)__p[0];
  if ((v14 & 0x80u) == 0)
    v9 = v14;
  else
    v9 = (uint64_t)__p[1];
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)v8, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" and elementId in identifierBitmap(?4) order by elementId", 57);
  if ((char)v14 < 0)
    operator delete(__p[0]);
  v10 = (sqlite3_stmt **)operator new();
  v11 = *(sqlite3 **)(v4 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v10, v11, (uint64_t)__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v10);
  if ((char)v14 < 0)
    operator delete(__p[0]);
  v15[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v15 + *(_QWORD *)(v15[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v15[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v16 < 0)
    operator delete((void *)v15[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v17);
}

void sub_1CA1C8594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByStringRangeIdentifiersStatement(uint64_t a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  _QWORD v5[5];
  int v6;

  v2 = (a2 + 64) | (*(unsigned __int8 *)(a1 + 48) << 16) | 0xB00;
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable37readByStringRangeIdentifiersStatementENS_15TernaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_48_4579;
  v5[4] = a1;
  v6 = a2;
  return degas::StatementCache::getStatement(v3, v2, (uint64_t)v5);
}

uint64_t ___ZNK5degas19AggregateValueTable37readByStringRangeIdentifiersStatementENS_15TernaryOperatorE_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void **v8;
  uint64_t v9;
  sqlite3_stmt **v10;
  sqlite3 *v11;
  void *__p[2];
  unsigned __int8 v14;
  _QWORD v15[11];
  char v16;
  uint64_t v17;

  v4 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v15);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  v5 = *(char *)(v4 + 31);
  if (v5 >= 0)
    v6 = v4 + 8;
  else
    v6 = *(_QWORD *)(v4 + 8);
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(v4 + 31);
  else
    v7 = *(_QWORD *)(v4 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" where attributeId=?1 and ", 26);
  degas::AttributeValueTable::rangeOperatorText("+stringValue", *(_DWORD *)(a1 + 40));
  if ((v14 & 0x80u) == 0)
    v8 = __p;
  else
    v8 = (void **)__p[0];
  if ((v14 & 0x80u) == 0)
    v9 = v14;
  else
    v9 = (uint64_t)__p[1];
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)v8, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" and elementId in identifierBitmap(?4) order by elementId", 57);
  if ((char)v14 < 0)
    operator delete(__p[0]);
  v10 = (sqlite3_stmt **)operator new();
  v11 = *(sqlite3 **)(v4 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v10, v11, (uint64_t)__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v10);
  if ((char)v14 < 0)
    operator delete(__p[0]);
  v15[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v15 + *(_QWORD *)(v15[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v15[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v16 < 0)
    operator delete((void *)v15[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v17);
}

void sub_1CA1C8834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readAllStatement(degas::AggregateValueTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x700;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas19AggregateValueTable16readAllStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_49_4581;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas19AggregateValueTable16readAllStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" order by elementId", 19);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1C8A60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByIdentifier(degas::AggregateValueTable *this, sqlite3_int64 a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t *Statement;
  _QWORD v7[5];

  v3 = (*((unsigned __int8 *)this + 48) << 16) | 0x600;
  v4 = *((_QWORD *)this + 5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___ZNK5degas19AggregateValueTable25readByIdentifierStatementEv_block_invoke;
  v7[3] = &__block_descriptor_tmp_4537;
  v7[4] = this;
  Statement = degas::StatementCache::getStatement(v4, v3, (uint64_t)v7);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  return Statement;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByAttrIdIdentifier(degas::AggregateValueTable *this, sqlite3_int64 a2, sqlite3_int64 a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t *Statement;
  _QWORD v9[5];

  v5 = (*((unsigned __int8 *)this + 48) << 16) | 0x800;
  v6 = *((_QWORD *)this + 5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = ___ZNK5degas19AggregateValueTable31readByAttrIdIdentifierStatementEv_block_invoke;
  v9[3] = &__block_descriptor_tmp_4_4541;
  v9[4] = this;
  Statement = degas::StatementCache::getStatement(v6, v5, (uint64_t)v9);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 2, a2);
  return Statement;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByBitmap(degas::AggregateValueTable *this, Bitmap *a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t *Statement;
  _QWORD v7[5];

  v3 = (*((unsigned __int8 *)this + 48) << 16) | 0x801;
  v4 = *((_QWORD *)this + 5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___ZNK5degas19AggregateValueTable21readByBitmapStatementEv_block_invoke;
  v7[3] = &__block_descriptor_tmp_7_4543;
  v7[4] = this;
  Statement = degas::StatementCache::getStatement(v4, v3, (uint64_t)v7);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*Statement, 1, a2);
  return Statement;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadAll(degas::AggregateValueTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x700;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas19AggregateValueTable16readAllStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_49_4581;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByValue(uint64_t a1, sqlite3_int64 a2, sqlite3_int64 a3, int a4)
{
  unsigned int v6;
  uint64_t v7;
  uint64_t *Statement;
  _QWORD v10[5];
  int v11;

  v6 = a4 | (*(unsigned __int8 *)(a1 + 48) << 16) | 0x900;
  v7 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 0x40000000;
  v10[2] = ___ZNK5degas19AggregateValueTable23readByIntValueStatementENS_14BinaryOperatorE_block_invoke;
  v10[3] = &__block_descriptor_tmp_10_4546;
  v10[4] = a1;
  v11 = a4;
  Statement = degas::StatementCache::getStatement(v7, v6, (uint64_t)v10);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 2, a3);
  return Statement;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByValue(uint64_t a1, sqlite3_int64 a2, int a3, double a4)
{
  unsigned int v6;
  uint64_t v7;
  uint64_t *Statement;
  _QWORD v10[5];
  int v11;

  v6 = a3 | (*(unsigned __int8 *)(a1 + 48) << 16) | 0xA00;
  v7 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 0x40000000;
  v10[2] = ___ZNK5degas19AggregateValueTable24readByRealValueStatementENS_14BinaryOperatorE_block_invoke;
  v10[3] = &__block_descriptor_tmp_12_4549;
  v10[4] = a1;
  v11 = a3;
  Statement = degas::StatementCache::getStatement(v7, v6, (uint64_t)v10);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  degas::Statement::bindDouble((sqlite3_stmt **)*Statement, 2, a4);
  return Statement;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByValue(uint64_t a1, sqlite3_int64 a2, uint64_t *a3, int a4)
{
  unsigned int v6;
  uint64_t v7;
  uint64_t *Statement;
  _QWORD v10[5];
  int v11;

  v6 = a4 | (*(unsigned __int8 *)(a1 + 48) << 16) | 0xB00;
  v7 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 0x40000000;
  v10[2] = ___ZNK5degas19AggregateValueTable26readByStringValueStatementENS_14BinaryOperatorE_block_invoke;
  v10[3] = &__block_descriptor_tmp_14_4551;
  v10[4] = a1;
  v11 = a4;
  Statement = degas::StatementCache::getStatement(v7, v6, (uint64_t)v10);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  degas::Statement::bindString(*Statement, 2, a3);
  return Statement;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByValues(uint64_t a1, sqlite3_int64 a2, void *a3, int a4, int a5)
{
  unsigned int v8;
  uint64_t v9;
  uint64_t *Statement;
  _QWORD v12[5];
  int v13;

  v8 = a5 | (*(unsigned __int8 *)(a1 + 48) << 16) | 0xC00;
  v9 = *(_QWORD *)(a1 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 0x40000000;
  v12[2] = ___ZNK5degas19AggregateValueTable24readByIntValuesStatementENS_14BinaryOperatorE_block_invoke;
  v12[3] = &__block_descriptor_tmp_16_4553;
  v12[4] = a1;
  v13 = a5;
  Statement = degas::StatementCache::getStatement(v9, v8, (uint64_t)v12);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  degas::Statement::bindArrayPointer((sqlite3_stmt **)*Statement, 2, a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 3, a4);
  return Statement;
}

{
  int v8;
  uint64_t v9;
  uint64_t *Statement;
  _QWORD v12[5];
  int v13;

  v8 = a5 | (*(unsigned __int8 *)(a1 + 48) << 16);
  v9 = *(_QWORD *)(a1 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[2] = ___ZNK5degas19AggregateValueTable25readByRealValuesStatementENS_14BinaryOperatorE_block_invoke;
  v12[3] = &__block_descriptor_tmp_18_4555;
  v12[1] = 0x40000000;
  v12[4] = a1;
  v13 = a5;
  Statement = degas::StatementCache::getStatement(v9, v8 | 0xD00u, (uint64_t)v12);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  degas::Statement::bindArrayPointer((sqlite3_stmt **)*Statement, 2, a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 3, a4);
  return Statement;
}

{
  unsigned int v8;
  uint64_t v9;
  uint64_t *Statement;
  _QWORD v12[5];
  int v13;

  v8 = a5 | (*(unsigned __int8 *)(a1 + 48) << 16) | 0xE00;
  v9 = *(_QWORD *)(a1 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 0x40000000;
  v12[2] = ___ZNK5degas19AggregateValueTable27readByStringValuesStatementENS_14BinaryOperatorE_block_invoke;
  v12[3] = &__block_descriptor_tmp_20_4557;
  v12[4] = a1;
  v13 = a5;
  Statement = degas::StatementCache::getStatement(v9, v8, (uint64_t)v12);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  degas::Statement::bindArrayPointer((sqlite3_stmt **)*Statement, 2, a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 3, a4);
  return Statement;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByValueIdentifiers(uint64_t a1, sqlite3_int64 a2, sqlite3_int64 a3, int a4, Bitmap *a5)
{
  uint64_t *v8;

  v8 = degas::AggregateValueTable::readByIntValueIdentifiersStatement(a1, a4);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v8, 1, a5);
  degas::Statement::bindInteger((sqlite3_stmt **)*v8, 2, a2);
  degas::Statement::bindInteger((sqlite3_stmt **)*v8, 3, a3);
  return v8;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByValueIdentifiers(uint64_t a1, sqlite3_int64 a2, int a3, Bitmap *a4, double a5)
{
  uint64_t *v8;

  v8 = degas::AggregateValueTable::readByRealValueIdentifiersStatement(a1, a3);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v8, 1, a4);
  degas::Statement::bindInteger((sqlite3_stmt **)*v8, 2, a2);
  degas::Statement::bindDouble((sqlite3_stmt **)*v8, 3, a5);
  return v8;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByValueIdentifiers(uint64_t a1, sqlite3_int64 a2, uint64_t *a3, int a4, Bitmap *a5)
{
  uint64_t *v8;

  v8 = degas::AggregateValueTable::readByStringValueIdentifiersStatement(a1, a4);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v8, 1, a5);
  degas::Statement::bindInteger((sqlite3_stmt **)*v8, 2, a2);
  degas::Statement::bindString(*v8, 3, a3);
  return v8;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByValuesIdentifiers(uint64_t a1, sqlite3_int64 a2, void *a3, int a4, int a5, Bitmap *a6)
{
  uint64_t *v10;

  v10 = degas::AggregateValueTable::readByIntValuesIdentifiersStatement(a1, a5);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v10, 1, a6);
  degas::Statement::bindInteger((sqlite3_stmt **)*v10, 2, a2);
  degas::Statement::bindArrayPointer((sqlite3_stmt **)*v10, 3, a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*v10, 4, a4);
  return v10;
}

{
  uint64_t *v10;

  v10 = degas::AggregateValueTable::readByRealValuesIdentifiersStatement(a1, a5);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v10, 1, a6);
  degas::Statement::bindInteger((sqlite3_stmt **)*v10, 2, a2);
  degas::Statement::bindArrayPointer((sqlite3_stmt **)*v10, 3, a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*v10, 4, a4);
  return v10;
}

{
  uint64_t *v10;

  v10 = degas::AggregateValueTable::readByStringValuesIdentifiersStatement(a1, a5);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v10, 1, a6);
  degas::Statement::bindInteger((sqlite3_stmt **)*v10, 2, a2);
  degas::Statement::bindArrayPointer((sqlite3_stmt **)*v10, 3, a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*v10, 4, a4);
  return v10;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByRange(uint64_t a1, sqlite3_int64 a2, sqlite3_int64 a3, sqlite3_int64 a4, int a5)
{
  uint64_t *v8;

  v8 = degas::AggregateValueTable::readByIntRangeStatement(a1, a5);
  degas::Statement::bindInteger((sqlite3_stmt **)*v8, 1, a2);
  degas::Statement::bindInteger((sqlite3_stmt **)*v8, 2, a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*v8, 3, a4);
  return v8;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByRange(uint64_t a1, sqlite3_int64 a2, int a3, double a4, double a5)
{
  uint64_t *v8;

  v8 = degas::AggregateValueTable::readByRealRangeStatement(a1, a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*v8, 1, a2);
  degas::Statement::bindDouble((sqlite3_stmt **)*v8, 2, a4);
  degas::Statement::bindDouble((sqlite3_stmt **)*v8, 3, a5);
  return v8;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByRange(uint64_t a1, sqlite3_int64 a2, uint64_t *a3, uint64_t *a4, int a5)
{
  uint64_t *v8;

  v8 = degas::AggregateValueTable::readByStringRangeStatement(a1, a5);
  degas::Statement::bindInteger((sqlite3_stmt **)*v8, 1, a2);
  degas::Statement::bindString(*v8, 2, a3);
  degas::Statement::bindString(*v8, 3, a4);
  return v8;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByRangeIdentifiers(uint64_t a1, sqlite3_int64 a2, sqlite3_int64 a3, sqlite3_int64 a4, int a5, Bitmap *a6)
{
  uint64_t *v10;

  v10 = degas::AggregateValueTable::readByIntRangeIdentifiersStatement(a1, a5);
  degas::Statement::bindInteger((sqlite3_stmt **)*v10, 1, a2);
  degas::Statement::bindInteger((sqlite3_stmt **)*v10, 2, a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*v10, 3, a4);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v10, 4, a6);
  return v10;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByRangeIdentifiers(uint64_t a1, sqlite3_int64 a2, int a3, Bitmap *a4, double a5, double a6)
{
  uint64_t *v10;

  v10 = degas::AggregateValueTable::readByRealRangeIdentifiersStatement(a1, a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*v10, 1, a2);
  degas::Statement::bindDouble((sqlite3_stmt **)*v10, 2, a5);
  degas::Statement::bindDouble((sqlite3_stmt **)*v10, 3, a6);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v10, 4, a4);
  return v10;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByRangeIdentifiers(uint64_t a1, sqlite3_int64 a2, uint64_t *a3, uint64_t *a4, int a5, Bitmap *a6)
{
  uint64_t *v10;

  v10 = degas::AggregateValueTable::readByStringRangeIdentifiersStatement(a1, a5);
  degas::Statement::bindInteger((sqlite3_stmt **)*v10, 1, a2);
  degas::Statement::bindString(*v10, 2, a3);
  degas::Statement::bindString(*v10, 3, a4);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v10, 4, a6);
  return v10;
}

_QWORD *degas::AggregateValueCursor::AggregateValueCursor(_QWORD *this)
{
  *this = 0;
  this[1] = 0;
  return this;
}

degas::AggregateValueCursor *degas::AggregateValueCursor::AggregateValueCursor(degas::AggregateValueCursor *this, const degas::AggregateValueTable *a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t *Statement;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  _QWORD v10[5];

  v3 = (*((unsigned __int8 *)a2 + 48) << 16) | 0x700;
  v4 = *((_QWORD *)a2 + 5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 0x40000000;
  v10[2] = ___ZNK5degas19AggregateValueTable16readAllStatementEv_block_invoke;
  v10[3] = &__block_descriptor_tmp_49_4581;
  v10[4] = a2;
  Statement = degas::StatementCache::getStatement(v4, v3, (uint64_t)v10);
  *(_QWORD *)this = *Statement;
  v6 = Statement[1];
  *((_QWORD *)this + 1) = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  return this;
}

{
  unsigned int v3;
  uint64_t v4;
  uint64_t *Statement;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  _QWORD v10[5];

  v3 = (*((unsigned __int8 *)a2 + 48) << 16) | 0x700;
  v4 = *((_QWORD *)a2 + 5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 0x40000000;
  v10[2] = ___ZNK5degas19AggregateValueTable16readAllStatementEv_block_invoke;
  v10[3] = &__block_descriptor_tmp_49_4581;
  v10[4] = a2;
  Statement = degas::StatementCache::getStatement(v4, v3, (uint64_t)v10);
  *(_QWORD *)this = *Statement;
  v6 = Statement[1];
  *((_QWORD *)this + 1) = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  return this;
}

degas::AggregateValueCursor *degas::AggregateValueCursor::AggregateValueCursor(degas::AggregateValueCursor *this, sqlite3_int64 a2, const degas::AggregateValueTable *a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t *Statement;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  _QWORD v12[5];

  v5 = (*((unsigned __int8 *)a3 + 48) << 16) | 0x600;
  v6 = *((_QWORD *)a3 + 5);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 0x40000000;
  v12[2] = ___ZNK5degas19AggregateValueTable25readByIdentifierStatementEv_block_invoke;
  v12[3] = &__block_descriptor_tmp_4537;
  v12[4] = a3;
  Statement = degas::StatementCache::getStatement(v6, v5, (uint64_t)v12);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  *(_QWORD *)this = *Statement;
  v8 = Statement[1];
  *((_QWORD *)this + 1) = v8;
  if (v8)
  {
    v9 = (unint64_t *)(v8 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  return this;
}

degas::AggregateValueCursor *degas::AggregateValueCursor::AggregateValueCursor(degas::AggregateValueCursor *this, sqlite3_int64 a2, sqlite3_int64 a3, const degas::AggregateValueTable *a4)
{
  uint64_t *v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;

  v5 = degas::AggregateValueTable::prepareStatementToReadByAttrIdIdentifier(a4, a2, a3);
  v6 = v5[1];
  *(_QWORD *)this = *v5;
  *((_QWORD *)this + 1) = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  return this;
}

{
  uint64_t *v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;

  v5 = degas::AggregateValueTable::prepareStatementToReadByAttrIdIdentifier(a4, a2, a3);
  v6 = v5[1];
  *(_QWORD *)this = *v5;
  *((_QWORD *)this + 1) = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  return this;
}

degas::AggregateValueCursor *degas::AggregateValueCursor::AggregateValueCursor(degas::AggregateValueCursor *this, Bitmap *a2, const degas::AggregateValueTable *a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t *Statement;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  _QWORD v12[5];

  v5 = (*((unsigned __int8 *)a3 + 48) << 16) | 0x801;
  v6 = *((_QWORD *)a3 + 5);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 0x40000000;
  v12[2] = ___ZNK5degas19AggregateValueTable21readByBitmapStatementEv_block_invoke;
  v12[3] = &__block_descriptor_tmp_7_4543;
  v12[4] = a3;
  Statement = degas::StatementCache::getStatement(v6, v5, (uint64_t)v12);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*Statement, 1, a2);
  *(_QWORD *)this = *Statement;
  v8 = Statement[1];
  *((_QWORD *)this + 1) = v8;
  if (v8)
  {
    v9 = (unint64_t *)(v8 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  return this;
}

_QWORD *degas::AggregateValueCursor::setForValue(_QWORD *a1, sqlite3_int64 a2, sqlite3_int64 a3, int a4, uint64_t a5)
{
  uint64_t *v6;

  v6 = degas::AggregateValueTable::prepareStatementToReadByValue(a5, a2, a3, a4);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](a1, *v6, v6[1]);
}

_QWORD *degas::AggregateValueCursor::setForValue(_QWORD *a1, sqlite3_int64 a2, int a3, uint64_t a4, double a5)
{
  uint64_t *v6;

  v6 = degas::AggregateValueTable::prepareStatementToReadByValue(a4, a2, a3, a5);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](a1, *v6, v6[1]);
}

_QWORD *degas::AggregateValueCursor::setForValue(_QWORD *a1, sqlite3_int64 a2, uint64_t *a3, int a4, uint64_t a5)
{
  uint64_t *v6;

  v6 = degas::AggregateValueTable::prepareStatementToReadByValue(a5, a2, a3, a4);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](a1, *v6, v6[1]);
}

_QWORD *degas::AggregateValueCursor::setForValues(_QWORD *a1, sqlite3_int64 a2, void *a3, int a4, int a5, uint64_t a6)
{
  uint64_t *v7;

  v7 = degas::AggregateValueTable::prepareStatementToReadByValues(a6, a2, a3, a4, a5);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](a1, *v7, v7[1]);
}

{
  uint64_t *v7;

  v7 = degas::AggregateValueTable::prepareStatementToReadByValues(a6, a2, a3, a4, a5);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](a1, *v7, v7[1]);
}

{
  uint64_t *v7;

  v7 = degas::AggregateValueTable::prepareStatementToReadByValues(a6, a2, a3, a4, a5);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](a1, *v7, v7[1]);
}

_QWORD *degas::AggregateValueCursor::setToFilterForValue(_QWORD *a1, sqlite3_int64 a2, sqlite3_int64 a3, int a4, Bitmap *a5, uint64_t a6)
{
  uint64_t *v7;

  v7 = degas::AggregateValueTable::prepareStatementToReadByValueIdentifiers(a6, a2, a3, a4, a5);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](a1, *v7, v7[1]);
}

_QWORD *degas::AggregateValueCursor::setToFilterForValue(_QWORD *a1, sqlite3_int64 a2, int a3, Bitmap *a4, uint64_t a5, double a6)
{
  uint64_t *v7;

  v7 = degas::AggregateValueTable::prepareStatementToReadByValueIdentifiers(a5, a2, a3, a4, a6);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](a1, *v7, v7[1]);
}

_QWORD *degas::AggregateValueCursor::setToFilterForValue(_QWORD *a1, sqlite3_int64 a2, uint64_t *a3, int a4, Bitmap *a5, uint64_t a6)
{
  uint64_t *v7;

  v7 = degas::AggregateValueTable::prepareStatementToReadByValueIdentifiers(a6, a2, a3, a4, a5);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](a1, *v7, v7[1]);
}

_QWORD *degas::AggregateValueCursor::setToFilterForValues(_QWORD *a1, sqlite3_int64 a2, void *a3, int a4, int a5, Bitmap *a6, uint64_t a7)
{
  uint64_t *v8;

  v8 = degas::AggregateValueTable::prepareStatementToReadByValuesIdentifiers(a7, a2, a3, a4, a5, a6);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](a1, *v8, v8[1]);
}

{
  uint64_t *v8;

  v8 = degas::AggregateValueTable::prepareStatementToReadByValuesIdentifiers(a7, a2, a3, a4, a5, a6);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](a1, *v8, v8[1]);
}

{
  uint64_t *v8;

  v8 = degas::AggregateValueTable::prepareStatementToReadByValuesIdentifiers(a7, a2, a3, a4, a5, a6);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](a1, *v8, v8[1]);
}

_QWORD *degas::AggregateValueCursor::setForRange(_QWORD *a1, sqlite3_int64 a2, sqlite3_int64 a3, sqlite3_int64 a4, int a5, uint64_t a6)
{
  uint64_t *v7;

  v7 = degas::AggregateValueTable::prepareStatementToReadByRange(a6, a2, a3, a4, a5);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](a1, *v7, v7[1]);
}

_QWORD *degas::AggregateValueCursor::setForRange(_QWORD *a1, sqlite3_int64 a2, int a3, uint64_t a4, double a5, double a6)
{
  uint64_t *v7;

  v7 = degas::AggregateValueTable::prepareStatementToReadByRange(a4, a2, a3, a5, a6);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](a1, *v7, v7[1]);
}

_QWORD *degas::AggregateValueCursor::setForRange(_QWORD *a1, sqlite3_int64 a2, uint64_t *a3, uint64_t *a4, int a5, uint64_t a6)
{
  uint64_t *v7;

  v7 = degas::AggregateValueTable::prepareStatementToReadByRange(a6, a2, a3, a4, a5);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](a1, *v7, v7[1]);
}

_QWORD *degas::AggregateValueCursor::setToFilterForRange(_QWORD *a1, sqlite3_int64 a2, sqlite3_int64 a3, sqlite3_int64 a4, int a5, Bitmap *a6, uint64_t a7)
{
  uint64_t *v8;

  v8 = degas::AggregateValueTable::prepareStatementToReadByRangeIdentifiers(a7, a2, a3, a4, a5, a6);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](a1, *v8, v8[1]);
}

_QWORD *degas::AggregateValueCursor::setToFilterForRange(_QWORD *a1, sqlite3_int64 a2, int a3, Bitmap *a4, uint64_t a5, double a6, double a7)
{
  uint64_t *v8;

  v8 = degas::AggregateValueTable::prepareStatementToReadByRangeIdentifiers(a5, a2, a3, a4, a6, a7);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](a1, *v8, v8[1]);
}

_QWORD *degas::AggregateValueCursor::setToFilterForRange(_QWORD *a1, sqlite3_int64 a2, uint64_t *a3, uint64_t *a4, int a5, Bitmap *a6, uint64_t a7)
{
  uint64_t *v8;

  v8 = degas::AggregateValueTable::prepareStatementToReadByRangeIdentifiers(a7, a2, a3, a4, a5, a6);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](a1, *v8, v8[1]);
}

const void *degas::AggregateValueCursor::identifiers(sqlite3_stmt ***this)
{
  return sqlite3_column_blob(**this, 0);
}

void degas::AggregateValueCursor::identifiers(sqlite3_stmt ***this, degas::Bitmap *a2)
{
  degas::Statement::bitmapColumnValue(*this, 0, a2);
}

void degas::NodeTable::~NodeTable(degas::NodeTable *this)
{
  *(_QWORD *)this = off_1E83E43A8;
  *((_QWORD *)this + 4) = 0;
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
}

{
  *(_QWORD *)this = off_1E83E43A8;
  *((_QWORD *)this + 4) = 0;
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
  JUMPOUT(0x1CAA4ADC8);
}

{
  *(_QWORD *)this = off_1E83E43A8;
  *((_QWORD *)this + 4) = 0;
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
}

uint64_t degas::NodeTable::createTable(degas::NodeTable *this)
{
  int v2;
  char *v3;
  uint64_t v4;
  sqlite3 *v5;
  uint64_t v6;
  void *__p;
  char v9;
  sqlite3_stmt *ppStmt[3];
  _QWORD v11[11];
  char v12;
  uint64_t v13;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v11);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"create table ", 13);
  v2 = *((char *)this + 31);
  if (v2 >= 0)
    v3 = (char *)this + 8;
  else
    v3 = (char *)*((_QWORD *)this + 1);
  if (v2 >= 0)
    v4 = *((unsigned __int8 *)this + 31);
  else
    v4 = *((_QWORD *)this + 2);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)" (identifier integer primary key autoincrement, labels blob, edgesIn blob, edgesOut blob)", 89);
  v5 = (sqlite3 *)*((_QWORD *)this + 4);
  std::stringbuf::str();
  degas::Statement::Statement(ppStmt, v5, (uint64_t)&__p);
  if (v9 < 0)
    operator delete(__p);
  v6 = degas::Statement::update(ppStmt);
  degas::Statement::~Statement((degas::Statement *)ppStmt);
  v11[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v11 + *(_QWORD *)(v11[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v11[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v12 < 0)
    operator delete((void *)v11[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1CAA4AD98](&v13);
  return v6;
}

void sub_1CA1CB3FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, char a19)
{
  degas::Statement::~Statement((degas::Statement *)&a16);
  std::ostringstream::~ostringstream((uint64_t)&a19);
  _Unwind_Resume(a1);
}

uint64_t degas::NodeTable::deleteEntry(degas::NodeTable *this, sqlite3_int64 a2)
{
  unsigned int v4;
  uint64_t v5;
  uint64_t *Statement;
  uint64_t v7;
  const char *v9;
  __int128 v10;
  uint64_t (*v11)@<X0>(uint64_t@<X0>, _QWORD *@<X8>);
  void *v12;
  degas::NodeTable *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (*((unsigned __int8 *)this + 48) << 16) | 0x500;
  v5 = *((_QWORD *)this + 5);
  *(_QWORD *)&v10 = MEMORY[0x1E0C809B0];
  *((_QWORD *)&v10 + 1) = 0x40000000;
  v11 = ___ZNK5degas9NodeTable15deleteStatementEv_block_invoke;
  v12 = &__block_descriptor_tmp_8_4686;
  v13 = this;
  Statement = degas::StatementCache::getStatement(v5, v4, (uint64_t)&v10);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  v7 = degas::Statement::update((sqlite3_stmt **)*Statement);
  if ((_DWORD)v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = sqlite3_errmsg(*((sqlite3 **)this + 4));
    LODWORD(v10) = 136315138;
    *(_QWORD *)((char *)&v10 + 4) = v9;
    _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "node delete failed: %s", (uint8_t *)&v10, 0xCu);
  }
  return v7;
}

uint64_t *degas::NodeTable::deleteStatement(degas::NodeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x500;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable15deleteStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_8_4686;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas9NodeTable15deleteStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"delete from ", 12);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" where identifier=?1", 20);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1CB718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t degas::NodeTable::NodeTable(uint64_t a1, uint64_t a2, __int128 *a3, char a4, char a5, uint64_t a6)
{
  std::string *v11;
  __int128 v12;

  *(_QWORD *)a1 = off_1E83E43A8;
  v11 = (std::string *)(a1 + 8);
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v12 = *a3;
    v11->__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 2);
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
  }
  *(_QWORD *)(a1 + 32) = a2;
  *(_QWORD *)(a1 + 40) = a6;
  *(_QWORD *)a1 = off_1E83E51B8;
  *(_BYTE *)(a1 + 49) = a4;
  *(_BYTE *)(a1 + 48) = a5;
  return a1;
}

{
  std::string *v11;
  __int128 v12;

  *(_QWORD *)a1 = off_1E83E43A8;
  v11 = (std::string *)(a1 + 8);
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v12 = *a3;
    v11->__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 2);
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
  }
  *(_QWORD *)(a1 + 32) = a2;
  *(_QWORD *)(a1 + 40) = a6;
  *(_QWORD *)a1 = off_1E83E51B8;
  *(_BYTE *)(a1 + 49) = a4;
  *(_BYTE *)(a1 + 48) = a5;
  return a1;
}

uint64_t *degas::NodeTable::insertStatement(degas::NodeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x300;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable15insertStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_4692;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas9NodeTable15insertStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"insert into ", 12);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" (identifier, labels, edgesIn, edgesOut) values(?1, ?2, ?3, ?4)", 63);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1CBA78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::updateStatement(degas::NodeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x400;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable15updateStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_5_4695;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas9NodeTable15updateStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"update ", 7);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" set edgesIn=?2, edgesOut=?3 where identifier=?1", 48);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1CBC88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::readByIdentifierStatement(degas::NodeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x600;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable25readByIdentifierStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_10_4698;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas9NodeTable25readByIdentifierStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"select identifier, labels, edgesIn, edgesOut from ", 50);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" where identifier=?1", 20);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1CBE98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::readByBitmapStatement(degas::NodeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x800;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable21readByBitmapStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_13;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas9NodeTable21readByBitmapStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"select n.identifier, n.labels, n.edgesIn, n.edgesOut from ", 58);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" n, identifierBitmap(?) b where n.identifier = b.value", 54);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1CC0A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::readByLabelStatement(degas::NodeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x801;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable20readByLabelStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_15;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas9NodeTable20readByLabelStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"select identifier, labels, edgesIn, edgesOut from ", 50);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" where bitmapContainsIdentifier(labels, ?1)", 43);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1CC2B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::readByAllLabelsStatement(degas::NodeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x802;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable24readByAllLabelsStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_17_4703;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas9NodeTable24readByAllLabelsStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"select identifier, labels, edgesIn, edgesOut from ", 50);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" where bitmapContainsBitmap(labels, ?1)", 39);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1CC4C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::readByAllLabelsAndIdentifiersStatement(degas::NodeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x803;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable38readByAllLabelsAndIdentifiersStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_19_4705;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas9NodeTable38readByAllLabelsAndIdentifiersStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"select n.identifier, n.labels, n.edgesIn, n.edgesOut from ", 58);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" n, identifierBitmap(?1) b where n.identifier = b.value and bitmapContainsBitmap(n.labels, ?2)", 94);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1CC6D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::readByAnyLabelsStatement(degas::NodeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x804;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable24readByAnyLabelsStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_21;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas9NodeTable24readByAnyLabelsStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"select identifier, labels, edgesIn, edgesOut from ", 50);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" where bitmapOverlapsBitmap(labels, ?1)", 39);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1CC8E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::readByAnyLabelsAndIdentifiersStatement(degas::NodeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x805;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable38readByAnyLabelsAndIdentifiersStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_23_4708;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas9NodeTable38readByAnyLabelsAndIdentifiersStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"select n.identifier, n.labels, n.edgesIn, n.edgesOut from ", 58);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" n, identifierBitmap(?1) b where n.identifier = b.value and bitmapOverlapsBitmap(n.labels, ?2)", 94);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1CCAF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::readAllStatement(degas::NodeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x700;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable16readAllStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_25_4710;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas9NodeTable16readAllStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"select identifier, labels, edgesIn, edgesOut from ", 50);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" order by identifier", 20);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1CCD08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::readWhereNoEdgesStatement(degas::NodeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x806;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable25readWhereNoEdgesStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_27_4712;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas9NodeTable25readWhereNoEdgesStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"select n.identifier, n.labels, n.edgesIn, n.edgesOut from ", 58);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" n where not exists (select * from Edge e where e.sourceNodeId = n.identifier or e.targetNodeId = n.identifier)", 111);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1CCF18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::readWhereNoInEdgesStatement(degas::NodeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x807;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable27readWhereNoInEdgesStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_29_4714;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas9NodeTable27readWhereNoInEdgesStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"select n.identifier, n.labels, n.edgesIn, n.edgesOut from ", 58);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" n where not exists (select * from Edge e where e.targetNodeId = n.identifier)", 78);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1CD128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::readWhereNoOutEdgesStatement(degas::NodeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x808;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable28readWhereNoOutEdgesStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_31_4716;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t ___ZNK5degas9NodeTable28readWhereNoOutEdgesStatementEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt **v7;
  sqlite3 *v8;
  void *__p;
  char v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"select n.identifier, n.labels, n.edgesIn, n.edgesOut from ", 58);
  v4 = *(char *)(v3 + 31);
  if (v4 >= 0)
    v5 = v3 + 8;
  else
    v5 = *(_QWORD *)(v3 + 8);
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(v3 + 31);
  else
    v6 = *(_QWORD *)(v3 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" n where not exists (select * from Edge e where e.sourceNodeId = n.identifier)", 78);
  v7 = (sqlite3_stmt **)operator new();
  v8 = *(sqlite3 **)(v3 + 32);
  std::stringbuf::str();
  degas::Statement::Statement(v7, v8, (uint64_t)&__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v7);
  if (v11 < 0)
    operator delete(__p);
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1CD338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t degas::NodeTable::insert(degas::NodeTable *this, sqlite3_int64 *a2, const degas::Bitmap *a3)
{
  unsigned int v6;
  uint64_t v7;
  degas::Statement **Statement;
  degas::Statement *v9;
  uint64_t v10;
  const char *v11;
  __int128 v13;
  _QWORD v14[4];
  _BYTE buf[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = (*((unsigned __int8 *)this + 48) << 16) | 0x300;
  v7 = *((_QWORD *)this + 5);
  *(_QWORD *)&v13 = MEMORY[0x1E0C809B0];
  *((_QWORD *)&v13 + 1) = 0x40000000;
  v14[0] = ___ZNK5degas9NodeTable15insertStatementEv_block_invoke;
  v14[1] = &__block_descriptor_tmp_4692;
  v14[2] = this;
  Statement = (degas::Statement **)degas::StatementCache::getStatement(v7, v6, (uint64_t)&v13);
  v9 = *Statement;
  if (*a2)
    degas::Statement::bindInteger((sqlite3_stmt **)v9, 1, *a2);
  else
    degas::Statement::bindNull((sqlite3_stmt **)v9, 1);
  degas::Statement::bindBitmap(*Statement, (const Bitmap *)2, a3);
  v13 = 0u;
  memset(v14, 0, 25);
  degas::Statement::bindBitmap(*Statement, (const Bitmap *)3, (const degas::Bitmap *)&v13);
  degas::Statement::bindBitmap(*Statement, (const Bitmap *)4, (const degas::Bitmap *)&v13);
  v10 = degas::Statement::update((sqlite3_stmt **)*Statement);
  if ((_DWORD)v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v11 = sqlite3_errmsg(*((sqlite3 **)this + 4));
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v11;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "node insert failed: %s", buf, 0xCu);
    }
  }
  else if (!*a2)
  {
    *a2 = sqlite3_last_insert_rowid(*((sqlite3 **)this + 4));
  }
  *(_QWORD *)buf = v14;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  return v10;
}

void sub_1CA1CD528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void **a15)
{
  a15 = (void **)&a11;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::prepareStatementToReadByIdentifier(degas::NodeTable *this, sqlite3_int64 a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t *Statement;
  _QWORD v7[5];

  v3 = (*((unsigned __int8 *)this + 48) << 16) | 0x600;
  v4 = *((_QWORD *)this + 5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___ZNK5degas9NodeTable25readByIdentifierStatementEv_block_invoke;
  v7[3] = &__block_descriptor_tmp_10_4698;
  v7[4] = this;
  Statement = degas::StatementCache::getStatement(v4, v3, (uint64_t)v7);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  return Statement;
}

uint64_t *degas::NodeTable::prepareStatementToReadByBitmap(degas::NodeTable *this, Bitmap *a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t *Statement;
  _QWORD v7[5];

  v3 = (*((unsigned __int8 *)this + 48) << 16) | 0x800;
  v4 = *((_QWORD *)this + 5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___ZNK5degas9NodeTable21readByBitmapStatementEv_block_invoke;
  v7[3] = &__block_descriptor_tmp_13;
  v7[4] = this;
  Statement = degas::StatementCache::getStatement(v4, v3, (uint64_t)v7);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*Statement, 1, a2);
  return Statement;
}

uint64_t *degas::NodeTable::prepareStatementToReadByLabel(degas::NodeTable *this, sqlite3_int64 a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t *Statement;
  _QWORD v7[5];

  v3 = (*((unsigned __int8 *)this + 48) << 16) | 0x801;
  v4 = *((_QWORD *)this + 5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___ZNK5degas9NodeTable20readByLabelStatementEv_block_invoke;
  v7[3] = &__block_descriptor_tmp_15;
  v7[4] = this;
  Statement = degas::StatementCache::getStatement(v4, v3, (uint64_t)v7);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  return Statement;
}

uint64_t *degas::NodeTable::prepareStatementToReadByAllLabels(degas::NodeTable *this, const degas::Bitmap *a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t *Statement;
  _QWORD v7[5];

  v3 = (*((unsigned __int8 *)this + 48) << 16) | 0x802;
  v4 = *((_QWORD *)this + 5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___ZNK5degas9NodeTable24readByAllLabelsStatementEv_block_invoke;
  v7[3] = &__block_descriptor_tmp_17_4703;
  v7[4] = this;
  Statement = degas::StatementCache::getStatement(v4, v3, (uint64_t)v7);
  degas::Statement::bindBitmap((degas::Statement *)*Statement, (const Bitmap *)1, a2);
  return Statement;
}

uint64_t *degas::NodeTable::prepareStatementToReadByAllLabelsAndIdentifiers(degas::NodeTable *this, const degas::Bitmap *a2, Bitmap *a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t *Statement;
  _QWORD v9[5];

  v5 = (*((unsigned __int8 *)this + 48) << 16) | 0x803;
  v6 = *((_QWORD *)this + 5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = ___ZNK5degas9NodeTable38readByAllLabelsAndIdentifiersStatementEv_block_invoke;
  v9[3] = &__block_descriptor_tmp_19_4705;
  v9[4] = this;
  Statement = degas::StatementCache::getStatement(v6, v5, (uint64_t)v9);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*Statement, 1, a3);
  degas::Statement::bindBitmap((degas::Statement *)*Statement, (const Bitmap *)2, a2);
  return Statement;
}

uint64_t *degas::NodeTable::prepareStatementToReadByAnyLabels(degas::NodeTable *this, const degas::Bitmap *a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t *Statement;
  _QWORD v7[5];

  v3 = (*((unsigned __int8 *)this + 48) << 16) | 0x804;
  v4 = *((_QWORD *)this + 5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___ZNK5degas9NodeTable24readByAnyLabelsStatementEv_block_invoke;
  v7[3] = &__block_descriptor_tmp_21;
  v7[4] = this;
  Statement = degas::StatementCache::getStatement(v4, v3, (uint64_t)v7);
  degas::Statement::bindBitmap((degas::Statement *)*Statement, (const Bitmap *)1, a2);
  return Statement;
}

uint64_t *degas::NodeTable::prepareStatementToReadByAnyLabelsAndIdentifiers(degas::NodeTable *this, const degas::Bitmap *a2, Bitmap *a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t *Statement;
  _QWORD v9[5];

  v5 = (*((unsigned __int8 *)this + 48) << 16) | 0x805;
  v6 = *((_QWORD *)this + 5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = ___ZNK5degas9NodeTable38readByAnyLabelsAndIdentifiersStatementEv_block_invoke;
  v9[3] = &__block_descriptor_tmp_23_4708;
  v9[4] = this;
  Statement = degas::StatementCache::getStatement(v6, v5, (uint64_t)v9);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*Statement, 1, a3);
  degas::Statement::bindBitmap((degas::Statement *)*Statement, (const Bitmap *)2, a2);
  return Statement;
}

uint64_t *degas::NodeTable::prepareStatementToReadAll(degas::NodeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x700;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable16readAllStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_25_4710;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t *degas::NodeTable::prepareStatementToReadWhereNoEdges(degas::NodeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x806;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable25readWhereNoEdgesStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_27_4712;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t *degas::NodeTable::prepareStatementToReadWhereNoInEdges(degas::NodeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x807;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable27readWhereNoInEdgesStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_29_4714;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t *degas::NodeTable::prepareStatementToReadWhereNoOutEdges(degas::NodeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x808;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable28readWhereNoOutEdgesStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_31_4716;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

uint64_t degas::NodeTable::update(degas::NodeTable *this, sqlite3_int64 a2, const degas::Bitmap *a3, const degas::Bitmap *a4)
{
  unsigned int v8;
  uint64_t v9;
  uint64_t *Statement;
  uint64_t v11;
  const char *v13;
  __int128 v14;
  uint64_t (*v15)@<X0>(uint64_t@<X0>, _QWORD *@<X8>);
  void *v16;
  degas::NodeTable *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = (*((unsigned __int8 *)this + 48) << 16) | 0x400;
  v9 = *((_QWORD *)this + 5);
  *(_QWORD *)&v14 = MEMORY[0x1E0C809B0];
  *((_QWORD *)&v14 + 1) = 0x40000000;
  v15 = ___ZNK5degas9NodeTable15updateStatementEv_block_invoke;
  v16 = &__block_descriptor_tmp_5_4695;
  v17 = this;
  Statement = degas::StatementCache::getStatement(v9, v8, (uint64_t)&v14);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  degas::Statement::bindBitmap((degas::Statement *)*Statement, (const Bitmap *)2, a3);
  degas::Statement::bindBitmap((degas::Statement *)*Statement, (const Bitmap *)3, a4);
  v11 = degas::Statement::update((sqlite3_stmt **)*Statement);
  if ((_DWORD)v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = sqlite3_errmsg(*((sqlite3 **)this + 4));
    LODWORD(v14) = 136315138;
    *(_QWORD *)((char *)&v14 + 4) = v13;
    _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "node update failed: %s", (uint8_t *)&v14, 0xCu);
  }
  return v11;
}

uint64_t degas::NodeTable::update(degas::NodeTable *this, sqlite3_int64 a2, const degas::LiteralBitmap *a3, const degas::LiteralBitmap *a4)
{
  unsigned int v8;
  uint64_t v9;
  uint64_t *Statement;
  uint64_t v11;
  const char *v13;
  __int128 v14;
  uint64_t (*v15)@<X0>(uint64_t@<X0>, _QWORD *@<X8>);
  void *v16;
  degas::NodeTable *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = (*((unsigned __int8 *)this + 48) << 16) | 0x400;
  v9 = *((_QWORD *)this + 5);
  *(_QWORD *)&v14 = MEMORY[0x1E0C809B0];
  *((_QWORD *)&v14 + 1) = 0x40000000;
  v15 = ___ZNK5degas9NodeTable15updateStatementEv_block_invoke;
  v16 = &__block_descriptor_tmp_5_4695;
  v17 = this;
  Statement = degas::StatementCache::getStatement(v9, v8, (uint64_t)&v14);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  degas::Statement::bindLiteralBitmap(*Statement, 2, a3);
  degas::Statement::bindLiteralBitmap(*Statement, 3, a4);
  v11 = degas::Statement::update((sqlite3_stmt **)*Statement);
  if ((_DWORD)v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = sqlite3_errmsg(*((sqlite3 **)this + 4));
    LODWORD(v14) = 136315138;
    *(_QWORD *)((char *)&v14 + 4) = v13;
    _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "node update failed: %s", (uint8_t *)&v14, 0xCu);
  }
  return v11;
}

_QWORD *degas::NodeCursor::NodeCursor(_QWORD *this)
{
  *this = 0;
  this[1] = 0;
  return this;
}

_QWORD *degas::NodeCursor::setForSelectAll(degas::NodeCursor *this, const degas::NodeTable *a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t *Statement;
  _QWORD v7[5];

  v3 = (*((unsigned __int8 *)a2 + 48) << 16) | 0x700;
  v4 = *((_QWORD *)a2 + 5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___ZNK5degas9NodeTable16readAllStatementEv_block_invoke;
  v7[3] = &__block_descriptor_tmp_25_4710;
  v7[4] = a2;
  Statement = degas::StatementCache::getStatement(v4, v3, (uint64_t)v7);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](this, *Statement, Statement[1]);
}

_QWORD *degas::NodeCursor::setForIdentifier(degas::NodeCursor *this, sqlite3_int64 a2, const degas::NodeTable *a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t *Statement;
  _QWORD v9[5];

  v5 = (*((unsigned __int8 *)a3 + 48) << 16) | 0x600;
  v6 = *((_QWORD *)a3 + 5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = ___ZNK5degas9NodeTable25readByIdentifierStatementEv_block_invoke;
  v9[3] = &__block_descriptor_tmp_10_4698;
  v9[4] = a3;
  Statement = degas::StatementCache::getStatement(v6, v5, (uint64_t)v9);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](this, *Statement, Statement[1]);
}

_QWORD *degas::NodeCursor::setForIdentifiers(degas::NodeCursor *this, Bitmap *a2, const degas::NodeTable *a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t *Statement;
  _QWORD v9[5];

  v5 = (*((unsigned __int8 *)a3 + 48) << 16) | 0x800;
  v6 = *((_QWORD *)a3 + 5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = ___ZNK5degas9NodeTable21readByBitmapStatementEv_block_invoke;
  v9[3] = &__block_descriptor_tmp_13;
  v9[4] = a3;
  Statement = degas::StatementCache::getStatement(v6, v5, (uint64_t)v9);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*Statement, 1, a2);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](this, *Statement, Statement[1]);
}

_QWORD *degas::NodeCursor::setForLabel(degas::NodeCursor *this, sqlite3_int64 a2, const degas::NodeTable *a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t *Statement;
  _QWORD v9[5];

  v5 = (*((unsigned __int8 *)a3 + 48) << 16) | 0x801;
  v6 = *((_QWORD *)a3 + 5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = ___ZNK5degas9NodeTable20readByLabelStatementEv_block_invoke;
  v9[3] = &__block_descriptor_tmp_15;
  v9[4] = a3;
  Statement = degas::StatementCache::getStatement(v6, v5, (uint64_t)v9);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](this, *Statement, Statement[1]);
}

_QWORD *degas::NodeCursor::setForAllLabels(degas::NodeCursor *this, const degas::Bitmap *a2, const degas::NodeTable *a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t *Statement;
  _QWORD v9[5];

  v5 = (*((unsigned __int8 *)a3 + 48) << 16) | 0x802;
  v6 = *((_QWORD *)a3 + 5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = ___ZNK5degas9NodeTable24readByAllLabelsStatementEv_block_invoke;
  v9[3] = &__block_descriptor_tmp_17_4703;
  v9[4] = a3;
  Statement = degas::StatementCache::getStatement(v6, v5, (uint64_t)v9);
  degas::Statement::bindBitmap((degas::Statement *)*Statement, (const Bitmap *)1, a2);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](this, *Statement, Statement[1]);
}

_QWORD *degas::NodeCursor::setForAllLabelsAndIdentifiers(degas::NodeCursor *this, const degas::Bitmap *a2, Bitmap *a3, const degas::NodeTable *a4)
{
  uint64_t *v5;

  v5 = degas::NodeTable::prepareStatementToReadByAllLabelsAndIdentifiers(a4, a2, a3);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](this, *v5, v5[1]);
}

_QWORD *degas::NodeCursor::setForAnyLabels(degas::NodeCursor *this, const degas::Bitmap *a2, const degas::NodeTable *a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t *Statement;
  _QWORD v9[5];

  v5 = (*((unsigned __int8 *)a3 + 48) << 16) | 0x804;
  v6 = *((_QWORD *)a3 + 5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = ___ZNK5degas9NodeTable24readByAnyLabelsStatementEv_block_invoke;
  v9[3] = &__block_descriptor_tmp_21;
  v9[4] = a3;
  Statement = degas::StatementCache::getStatement(v6, v5, (uint64_t)v9);
  degas::Statement::bindBitmap((degas::Statement *)*Statement, (const Bitmap *)1, a2);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](this, *Statement, Statement[1]);
}

_QWORD *degas::NodeCursor::setForAnyLabelsAndIdentifiers(degas::NodeCursor *this, const degas::Bitmap *a2, Bitmap *a3, const degas::NodeTable *a4)
{
  uint64_t *v5;

  v5 = degas::NodeTable::prepareStatementToReadByAnyLabelsAndIdentifiers(a4, a2, a3);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](this, *v5, v5[1]);
}

_QWORD *degas::NodeCursor::setForNoEdges(degas::NodeCursor *this, const degas::NodeTable *a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t *Statement;
  _QWORD v7[5];

  v3 = (*((unsigned __int8 *)a2 + 48) << 16) | 0x806;
  v4 = *((_QWORD *)a2 + 5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___ZNK5degas9NodeTable25readWhereNoEdgesStatementEv_block_invoke;
  v7[3] = &__block_descriptor_tmp_27_4712;
  v7[4] = a2;
  Statement = degas::StatementCache::getStatement(v4, v3, (uint64_t)v7);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](this, *Statement, Statement[1]);
}

_QWORD *degas::NodeCursor::setForNoInEdges(degas::NodeCursor *this, const degas::NodeTable *a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t *Statement;
  _QWORD v7[5];

  v3 = (*((unsigned __int8 *)a2 + 48) << 16) | 0x807;
  v4 = *((_QWORD *)a2 + 5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___ZNK5degas9NodeTable27readWhereNoInEdgesStatementEv_block_invoke;
  v7[3] = &__block_descriptor_tmp_29_4714;
  v7[4] = a2;
  Statement = degas::StatementCache::getStatement(v4, v3, (uint64_t)v7);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](this, *Statement, Statement[1]);
}

_QWORD *degas::NodeCursor::setForNoOutEdges(degas::NodeCursor *this, const degas::NodeTable *a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t *Statement;
  _QWORD v7[5];

  v3 = (*((unsigned __int8 *)a2 + 48) << 16) | 0x808;
  v4 = *((_QWORD *)a2 + 5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___ZNK5degas9NodeTable28readWhereNoOutEdgesStatementEv_block_invoke;
  v7[3] = &__block_descriptor_tmp_31_4716;
  v7[4] = a2;
  Statement = degas::StatementCache::getStatement(v4, v3, (uint64_t)v7);
  return std::shared_ptr<degas::Statement>::operator=[abi:ne180100](this, *Statement, Statement[1]);
}

sqlite3_int64 degas::NodeCursor::identifier(sqlite3_stmt ***this)
{
  return sqlite3_column_int64(**this, 0);
}

void degas::NodeCursor::labels(sqlite3_stmt ***this, degas::Bitmap *a2)
{
  degas::Statement::bitmapColumnValue(*this, 1, a2);
}

const void *degas::NodeCursor::literalLabels(sqlite3_stmt ***this)
{
  return sqlite3_column_blob(**this, 1);
}

void degas::NodeCursor::edgesIn(sqlite3_stmt ***this, degas::Bitmap *a2)
{
  degas::Statement::bitmapColumnValue(*this, 2, a2);
}

const void *degas::NodeCursor::literalEdgesIn(sqlite3_stmt ***this)
{
  return sqlite3_column_blob(**this, 2);
}

void degas::NodeCursor::edgesOut(sqlite3_stmt ***this, degas::Bitmap *a2)
{
  degas::Statement::bitmapColumnValue(*this, 3, a2);
}

const void *degas::NodeCursor::literalEdgesOut(sqlite3_stmt ***this)
{
  return sqlite3_column_blob(**this, 3);
}

void sub_1CA1CEE40(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

BOOL degas::callstack(uint64_t a1)
{
  int v2;
  uint64_t v3;
  const void **v4;
  const char *dli_sname;
  char *v6;
  char *v7;
  size_t v8;
  size_t v9;
  const std::locale::facet *v10;
  int status;
  Dl_info v13;
  _QWORD v14[11];
  char v15;
  uint64_t v16;
  char v17;
  _OWORD v18[15];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  memset(v18, 0, sizeof(v18));
  v2 = backtrace((void **)v18, 30);
  if (v2 >= 1)
  {
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v14);
    if (v2 != 1)
    {
      v3 = v2 - 1;
      v4 = (const void **)v18 + 1;
      do
      {
        if (dladdr(*v4, &v13))
        {
          dli_sname = v13.dli_sname;
          if (v13.dli_sname)
          {
            status = 0;
            v6 = __cxa_demangle(v13.dli_sname, 0, 0, &status);
            if (status || (v7 = v6) == 0)
            {
              v9 = strlen(dli_sname);
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)dli_sname, v9);
              v17 = 10;
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)&v17, 1);
            }
            else
            {
              v8 = strlen(v6);
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)v7, v8);
              v17 = 10;
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)&v17, 1);
              free(v7);
            }
          }
          else
          {
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)"(redacted)\n", 11);
          }
        }
        ++v4;
        --v3;
      }
      while (v3);
    }
    std::ios_base::getloc((const std::ios_base *)((char *)v14 + *(_QWORD *)(v14[0] - 24)));
    v10 = std::locale::use_facet((const std::locale *)&v13, MEMORY[0x1E0DE4A90]);
    ((void (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 10);
    std::locale::~locale((std::locale *)&v13);
    std::ostream::put();
    std::ostream::flush();
    std::stringbuf::str();
    if (*(char *)(a1 + 23) < 0)
      operator delete(*(void **)a1);
    *(_OWORD *)a1 = *(_OWORD *)&v13.dli_fname;
    *(_QWORD *)(a1 + 16) = v13.dli_sname;
    v14[0] = *MEMORY[0x1E0DE4F60];
    *(_QWORD *)((char *)v14 + *(_QWORD *)(v14[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
    v14[1] = MEMORY[0x1E0DE4FB8] + 16;
    if (v15 < 0)
      operator delete((void *)v14[9]);
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x1CAA4AD98](&v16);
  }
  return v2 > 0;
}

void sub_1CA1D107C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::locale a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t degas::DegasLoggingConnection(degas *this)
{
  if (degas::DegasLoggingConnection(void)::onceToken[0] != -1)
    dispatch_once(degas::DegasLoggingConnection(void)::onceToken, &__block_literal_global_5020);
  return degas::DegasLoggingConnection(void)::log;
}

os_log_t ___ZN5degas22DegasLoggingConnectionEv_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.photos.graph", "KnowledgeGraphDatabase");
  degas::DegasLoggingConnection(void)::log = (uint64_t)result;
  return result;
}

_DWORD *degas::LocalLogFile::LocalLogFile(_DWORD *a1, __int128 *a2)
{
  std::string *v3;
  __int128 v4;

  *a1 = -1;
  v3 = (std::string *)(a1 + 2);
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

{
  std::string *v3;
  __int128 v4;

  *a1 = -1;
  v3 = (std::string *)(a1 + 2);
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

void degas::LocalLogFile::open(degas::LocalLogFile *this)
{
  _BYTE *v2;
  int v3;
  std::__fs::filesystem::path *v4;
  unint64_t v5;
  char v6;
  std::string::size_type size;
  std::__fs::filesystem::path *v8;
  std::string::size_type v9;
  std::string::value_type *p_p;
  BOOL v11;
  std::__fs::filesystem::path *v12;
  std::string::value_type *v13;
  unint64_t v14;
  std::string::value_type v15;
  uint64_t v16;
  uint64_t v17;
  std::string::value_type v18;
  const std::string::value_type *v19;
  std::string::size_type v20;
  std::__fs::filesystem::path *v21;
  NSObject *v22;
  std::__fs::filesystem::path *v23;
  std::__fs::filesystem::path v24;
  __int128 __p;
  int64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  std::__fs::filesystem::__temp_directory_path(&v24, 0);
  if (*((char *)this + 31) < 0)
  {
    if (!*((_QWORD *)this + 2))
      goto LABEL_9;
    v2 = (_BYTE *)*((_QWORD *)this + 1);
  }
  else
  {
    v2 = (char *)this + 8;
    if (!*((_BYTE *)this + 31))
      goto LABEL_9;
  }
  if (*v2 == 47)
  {
    if (SHIBYTE(v24.__pn_.__r_.__value_.__r.__words[2]) < 0)
    {
      *v24.__pn_.__r_.__value_.__l.__data_ = 0;
      v24.__pn_.__r_.__value_.__l.__size_ = 0;
    }
    else
    {
      v24.__pn_.__r_.__value_.__s.__data_[0] = 0;
      *((_BYTE *)&v24.__pn_.__r_.__value_.__s + 23) = 0;
    }
    goto LABEL_12;
  }
LABEL_9:
  if (std::__fs::filesystem::path::__filename(&v24).__size_)
    std::string::push_back(&v24.__pn_, 47);
LABEL_12:
  v3 = *((char *)this + 31);
  if (v3 >= 0)
    v4 = (std::__fs::filesystem::path *)((char *)this + 8);
  else
    v4 = (std::__fs::filesystem::path *)*((_QWORD *)this + 1);
  if (v3 >= 0)
    v5 = *((unsigned __int8 *)this + 31);
  else
    v5 = *((_QWORD *)this + 2);
  v6 = HIBYTE(v24.__pn_.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v24.__pn_.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!v5)
      goto LABEL_51;
    size = v24.__pn_.__r_.__value_.__l.__size_;
    v9 = (v24.__pn_.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
    v8 = (std::__fs::filesystem::path *)v24.__pn_.__r_.__value_.__r.__words[0];
    v6 = HIBYTE(v24.__pn_.__r_.__value_.__r.__words[2]);
  }
  else
  {
    if (!v5)
      goto LABEL_49;
    size = HIBYTE(v24.__pn_.__r_.__value_.__r.__words[2]);
    v8 = &v24;
    v9 = 22;
  }
  if (v8 > v4 || (std::__fs::filesystem::path *)((char *)&v8->__pn_.__r_.__value_.__l.__data_ + size + 1) <= v4)
  {
    if (v9 - size < v5)
    {
      std::string::__grow_by(&v24.__pn_, v9, size - v9 + v5, size, size, 0, 0);
      v24.__pn_.__r_.__value_.__l.__size_ = size;
      v6 = HIBYTE(v24.__pn_.__r_.__value_.__r.__words[2]);
    }
    v11 = v6 < 0;
    v12 = &v24;
    if (v11)
      v12 = (std::__fs::filesystem::path *)v24.__pn_.__r_.__value_.__r.__words[0];
    v13 = (char *)v12 + size;
    v14 = v5;
    do
    {
      v15 = v4->__pn_.__r_.__value_.__s.__data_[0];
      v4 = (std::__fs::filesystem::path *)((char *)v4 + 1);
      *v13++ = v15;
      --v14;
    }
    while (v14);
    *v13 = 0;
    if (SHIBYTE(v24.__pn_.__r_.__value_.__r.__words[2]) < 0)
    {
      v24.__pn_.__r_.__value_.__l.__size_ = v5 + size;
      goto LABEL_51;
    }
    *((_BYTE *)&v24.__pn_.__r_.__value_.__s + 23) = (v5 + size) & 0x7F;
LABEL_49:
    v21 = &v24;
    goto LABEL_52;
  }
  if (v5 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v5 > 0x16)
  {
    v16 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17)
      v16 = v5 | 7;
    v17 = v16 + 1;
    p_p = (std::string::value_type *)operator new(v16 + 1);
    *((_QWORD *)&__p + 1) = v5;
    v26 = v17 | 0x8000000000000000;
    *(_QWORD *)&__p = p_p;
  }
  else
  {
    HIBYTE(v26) = v5;
    p_p = (std::string::value_type *)&__p;
  }
  do
  {
    v18 = v4->__pn_.__r_.__value_.__s.__data_[0];
    v4 = (std::__fs::filesystem::path *)((char *)v4 + 1);
    *p_p++ = v18;
    --v5;
  }
  while (v5);
  *p_p = 0;
  if (v26 >= 0)
    v19 = (const std::string::value_type *)&__p;
  else
    v19 = (const std::string::value_type *)__p;
  if (v26 >= 0)
    v20 = HIBYTE(v26);
  else
    v20 = *((_QWORD *)&__p + 1);
  std::string::append(&v24.__pn_, v19, v20);
  if (SHIBYTE(v26) < 0)
    operator delete((void *)__p);
  if ((SHIBYTE(v24.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    goto LABEL_49;
LABEL_51:
  v21 = (std::__fs::filesystem::path *)v24.__pn_.__r_.__value_.__r.__words[0];
LABEL_52:
  *(_DWORD *)this = open((const char *)v21, 513, 438);
  if (degas::DegasLoggingConnection(void)::onceToken[0] != -1)
    dispatch_once(degas::DegasLoggingConnection(void)::onceToken, &__block_literal_global_5020);
  v22 = degas::DegasLoggingConnection(void)::log;
  if (os_log_type_enabled((os_log_t)degas::DegasLoggingConnection(void)::log, OS_LOG_TYPE_INFO))
  {
    v23 = &v24;
    if ((v24.__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v23 = (std::__fs::filesystem::path *)v24.__pn_.__r_.__value_.__r.__words[0];
    LODWORD(__p) = 136315138;
    *(_QWORD *)((char *)&__p + 4) = v23;
    _os_log_impl(&dword_1CA0A5000, v22, OS_LOG_TYPE_INFO, "local log file open at %s\n", (uint8_t *)&__p, 0xCu);
  }
  if (SHIBYTE(v24.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v24.__pn_.__r_.__value_.__l.__data_);
}

void sub_1CA1D14D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

uint64_t degas::LocalLogFile::writeText(degas::LocalLogFile *this, const void **a2)
{
  int v4;
  int v5;
  const void *v6;
  size_t v7;

  v4 = *(_DWORD *)this;
  if (v4 <= 0)
  {
    degas::LocalLogFile::open(this);
    v4 = *(_DWORD *)this;
  }
  v5 = *((char *)a2 + 23);
  if (v5 >= 0)
    v6 = a2;
  else
    v6 = *a2;
  if (v5 >= 0)
    v7 = *((unsigned __int8 *)a2 + 23);
  else
    v7 = (size_t)a2[1];
  write(v4, v6, v7);
  return fsync(*(_DWORD *)this);
}

uint64_t degas::LocalLogFile::close(degas::LocalLogFile *this)
{
  uint64_t result;

  result = *(unsigned int *)this;
  if ((int)result >= 1)
  {
    result = close(result);
    *(_DWORD *)this = -1;
  }
  return result;
}

void degas::YesNodePredicate::~YesNodePredicate(degas::YesNodePredicate *this)
{
  JUMPOUT(0x1CAA4ADC8);
}

uint64_t degas::YesNodePredicate::elements(degas::YesNodePredicate *this, degas::Bitmap *a2)
{
  uint64_t v2;
  const degas::NodeTable *v4[2];

  v2 = *((_QWORD *)this + 1);
  v4[0] = (const degas::NodeTable *)(v2 + 192);
  v4[1] = (const degas::NodeTable *)v2;
  return degas::NodeLabelQuery::allNodes(v4, a2);
}

uint64_t degas::YesNodePredicate::filterElements(degas::YesNodePredicate *this, const degas::Bitmap *a2, degas::Bitmap *a3)
{
  degas::Bitmap::operator=(a3, a2);
  return 0;
}

void degas::YesNodePredicate::decomposeLabelsPredicate(_QWORD *a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  *a2 = 0;
  a2[1] = 0;
  v2 = a1[1];
  a2[2] = *a1;
  a2[3] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
}

uint64_t degas::YesNodePredicate::allLabelIds(degas::YesNodePredicate *this, Bitmap *a2)
{
  return 0;
}

uint64_t degas::YesNodePredicate::isTrivialYes(degas::YesNodePredicate *this)
{
  return 1;
}

uint64_t degas::YesNodePredicate::isTrivialNo(degas::YesNodePredicate *this)
{
  return 0;
}

_QWORD *degas::YesNodePredicate::debugDescription@<X0>(_QWORD *a1@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a1, "yes(node)");
}

void degas::YesEdgePredicate::~YesEdgePredicate(degas::YesEdgePredicate *this)
{
  JUMPOUT(0x1CAA4ADC8);
}

uint64_t degas::YesEdgePredicate::elements(degas::YesEdgePredicate *this, degas::Bitmap *a2)
{
  uint64_t v2;
  const degas::EdgeTable *v4[2];

  v2 = *((_QWORD *)this + 1);
  v4[0] = (const degas::EdgeTable *)(v2 + 248);
  v4[1] = (const degas::EdgeTable *)v2;
  return degas::EdgeLabelQuery::allEdges(v4, a2);
}

uint64_t degas::YesEdgePredicate::filterElements(degas::YesEdgePredicate *this, const degas::Bitmap *a2, degas::Bitmap *a3)
{
  degas::Bitmap::operator=(a3, a2);
  return 0;
}

void degas::YesEdgePredicate::decomposeLabelsPredicate(_QWORD *a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  *a2 = 0;
  a2[1] = 0;
  v2 = a1[1];
  a2[2] = *a1;
  a2[3] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
}

uint64_t degas::YesEdgePredicate::allLabelIds(degas::YesEdgePredicate *this, Bitmap *a2)
{
  return 0;
}

uint64_t degas::YesEdgePredicate::isTrivialYes(degas::YesEdgePredicate *this)
{
  return 1;
}

uint64_t degas::YesEdgePredicate::isTrivialNo(degas::YesEdgePredicate *this)
{
  return 0;
}

_QWORD *degas::YesEdgePredicate::debugDescription@<X0>(_QWORD *a1@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a1, "yes(edge)");
}

void degas::NoPredicate::~NoPredicate(degas::NoPredicate *this)
{
  JUMPOUT(0x1CAA4ADC8);
}

uint64_t degas::NoPredicate::elements(degas::NoPredicate *this, Bitmap *a2)
{
  BitsetPtr *begin;
  BitsetPtr *i;

  a2->_bitCount = 0;
  a2->_lastOffsetFoundAt = 0;
  begin = a2->_bitSets.__begin_;
  for (i = a2->_bitSets.__end_; i != begin; i = (BitsetPtr *)((char *)i - 16))
  {
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)((char *)i - 16));
    *((_QWORD *)i - 1) = 0;
  }
  a2->_bitSets.__end_ = begin;
  return 0;
}

uint64_t degas::NoPredicate::filterElements(degas::NoPredicate *this, const Bitmap *a2, Bitmap *a3)
{
  BitsetPtr *begin;
  BitsetPtr *i;

  a3->_bitCount = 0;
  a3->_lastOffsetFoundAt = 0;
  begin = a3->_bitSets.__begin_;
  for (i = a3->_bitSets.__end_; i != begin; i = (BitsetPtr *)((char *)i - 16))
  {
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)((char *)i - 16));
    *((_QWORD *)i - 1) = 0;
  }
  a3->_bitSets.__end_ = begin;
  return 0;
}

void degas::NoPredicate::decomposeLabelsPredicate(_QWORD *a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  *a2 = 0;
  a2[1] = 0;
  v2 = a1[1];
  a2[2] = *a1;
  a2[3] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
}

uint64_t degas::NoPredicate::allLabelIds(degas::NoPredicate *this, Bitmap *a2)
{
  return 0;
}

uint64_t degas::NoPredicate::isTrivialYes(degas::NoPredicate *this)
{
  return 0;
}

uint64_t degas::NoPredicate::isTrivialNo(degas::NoPredicate *this)
{
  return 1;
}

_QWORD *degas::NoPredicate::debugDescription@<X0>(_QWORD *a1@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a1, "no");
}

void degas::AllLabelsNodePredicate::~AllLabelsNodePredicate(degas::AllLabelsNodePredicate *this)
{
  void **v1;

  *(_QWORD *)this = &off_1E83E5538;
  v1 = (void **)((char *)this + 24);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
}

{
  void **v1;

  *(_QWORD *)this = &off_1E83E5538;
  v1 = (void **)((char *)this + 24);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x1CAA4ADC8);
}

uint64_t degas::AllLabelsNodePredicate::elements(degas::AllLabelsNodePredicate *this, degas::Bitmap *a2)
{
  __int128 v3;

  v3 = *(_OWORD *)((char *)this + 56);
  return degas::NodeLabelQuery::nodesForAllLabels((const degas::NodeTable **)&v3, (Bitmap *)((char *)this + 8), a2);
}

uint64_t degas::AllLabelsNodePredicate::filterElements(degas::AllLabelsNodePredicate *this, Bitmap *a2, degas::Bitmap *a3)
{
  __int128 v4;

  v4 = *(_OWORD *)((char *)this + 56);
  return degas::NodeLabelQuery::filterNodesForAllLabels((degas::NodeTable **)&v4, (degas::AllLabelsNodePredicate *)((char *)this + 8), a2, a3);
}

void degas::AllLabelsNodePredicate::decomposeLabelsPredicate(_QWORD *a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  a2[2] = 0;
  a2[3] = 0;
}

uint64_t degas::AllLabelsNodePredicate::allLabelIds(degas::AllLabelsNodePredicate *this, degas::Bitmap *a2)
{
  degas::Bitmap::operator=(a2, (_QWORD *)this + 1);
  return 1;
}

uint64_t degas::AllLabelsNodePredicate::isTrivialYes(degas::AllLabelsNodePredicate *this)
{
  return 0;
}

uint64_t degas::AllLabelsNodePredicate::isTrivialNo(degas::AllLabelsNodePredicate *this)
{
  return 0;
}

uint64_t degas::AllLabelsNodePredicate::debugDescription(degas::AllLabelsNodePredicate *this, const degas::Database *a2)
{
  uint64_t v3;
  char i;
  sqlite3_int64 v5;
  BOOL v6;
  void *p_p;
  uint64_t v9;
  void *__p;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  sqlite3_int64 v15;
  uint64_t v16;
  _QWORD v17[11];
  char v18;
  uint64_t v19;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v17);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)"all these labels:(", 18);
  degas::Bitmap::begin((_QWORD *)this + 1, &v14);
  v3 = *((_QWORD *)this + 4);
  for (i = 1; ; i = 0)
  {
    v5 = v15;
    v6 = (degas::AllLabelsNodePredicate *)v14 == (degas::AllLabelsNodePredicate *)((char *)this + 8) && v15 == -1;
    if (v6 && v16 == v3)
      break;
    if ((i & 1) == 0)
    {
      LOBYTE(__p) = 44;
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)&__p, 1);
    }
    __p = 0;
    v12 = 0;
    v13 = 0;
    degas::Database::getLabelName(*((_QWORD *)this + 8), v5, (uint64_t)&__p);
    if (v13 >= 0)
      p_p = &__p;
    else
      p_p = __p;
    if (v13 >= 0)
      v9 = HIBYTE(v13);
    else
      v9 = v12;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)p_p, v9);
    if (SHIBYTE(v13) < 0)
      operator delete(__p);
    degas::Bitmap::iterator::operator++(&v14);
  }
  LOBYTE(v14) = 41;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)&v14, 1);
  std::stringbuf::str();
  v17[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v17 + *(_QWORD *)(v17[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v17[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v18 < 0)
    operator delete((void *)v17[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v19);
}

void sub_1CA1D1AF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  std::ostringstream::~ostringstream((uint64_t)&a19);
  _Unwind_Resume(a1);
}

void degas::AnyLabelsNodePredicate::~AnyLabelsNodePredicate(degas::AnyLabelsNodePredicate *this)
{
  void **v1;

  *(_QWORD *)this = &off_1E83E5590;
  v1 = (void **)((char *)this + 24);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
}

{
  void **v1;

  *(_QWORD *)this = &off_1E83E5590;
  v1 = (void **)((char *)this + 24);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x1CAA4ADC8);
}

uint64_t degas::AnyLabelsNodePredicate::elements(degas::AnyLabelsNodePredicate *this, degas::Bitmap *a2)
{
  __int128 v3;

  v3 = *(_OWORD *)((char *)this + 56);
  return degas::NodeLabelQuery::nodesForAnyLabels((const degas::NodeTable **)&v3, (Bitmap *)((char *)this + 8), a2);
}

uint64_t degas::AnyLabelsNodePredicate::filterElements(degas::AnyLabelsNodePredicate *this, Bitmap *a2, degas::Bitmap *a3)
{
  __int128 v4;

  v4 = *(_OWORD *)((char *)this + 56);
  return degas::NodeLabelQuery::filterNodesForAnyLabels((degas::NodeTable **)&v4, (degas::AnyLabelsNodePredicate *)((char *)this + 8), a2, a3);
}

void degas::AnyLabelsNodePredicate::decomposeLabelsPredicate(_QWORD *a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  *a2 = 0;
  a2[1] = 0;
  v2 = a1[1];
  a2[2] = *a1;
  a2[3] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
}

uint64_t degas::AnyLabelsNodePredicate::allLabelIds(degas::AnyLabelsNodePredicate *this, Bitmap *a2)
{
  return 0;
}

uint64_t degas::AnyLabelsNodePredicate::isTrivialYes(degas::AnyLabelsNodePredicate *this)
{
  return 0;
}

uint64_t degas::AnyLabelsNodePredicate::isTrivialNo(degas::AnyLabelsNodePredicate *this)
{
  return 0;
}

uint64_t degas::AnyLabelsNodePredicate::debugDescription(degas::AnyLabelsNodePredicate *this, const degas::Database *a2)
{
  uint64_t v3;
  char i;
  sqlite3_int64 v5;
  BOOL v6;
  void *p_p;
  uint64_t v9;
  void *__p;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  sqlite3_int64 v15;
  uint64_t v16;
  _QWORD v17[11];
  char v18;
  uint64_t v19;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v17);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)"any of these labels:(", 21);
  degas::Bitmap::begin((_QWORD *)this + 1, &v14);
  v3 = *((_QWORD *)this + 4);
  for (i = 1; ; i = 0)
  {
    v5 = v15;
    v6 = (degas::AnyLabelsNodePredicate *)v14 == (degas::AnyLabelsNodePredicate *)((char *)this + 8) && v15 == -1;
    if (v6 && v16 == v3)
      break;
    if ((i & 1) == 0)
    {
      LOBYTE(__p) = 44;
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)&__p, 1);
    }
    __p = 0;
    v12 = 0;
    v13 = 0;
    degas::Database::getLabelName(*((_QWORD *)this + 8), v5, (uint64_t)&__p);
    if (v13 >= 0)
      p_p = &__p;
    else
      p_p = __p;
    if (v13 >= 0)
      v9 = HIBYTE(v13);
    else
      v9 = v12;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)p_p, v9);
    if (SHIBYTE(v13) < 0)
      operator delete(__p);
    degas::Bitmap::iterator::operator++(&v14);
  }
  LOBYTE(v14) = 41;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)&v14, 1);
  std::stringbuf::str();
  v17[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v17 + *(_QWORD *)(v17[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v17[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v18 < 0)
    operator delete((void *)v17[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v19);
}

void sub_1CA1D1DF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  std::ostringstream::~ostringstream((uint64_t)&a19);
  _Unwind_Resume(a1);
}

void degas::AllLabelsEdgePredicate::~AllLabelsEdgePredicate(degas::AllLabelsEdgePredicate *this)
{
  void **v1;

  *(_QWORD *)this = &off_1E83E55E8;
  v1 = (void **)((char *)this + 24);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
}

{
  void **v1;

  *(_QWORD *)this = &off_1E83E55E8;
  v1 = (void **)((char *)this + 24);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x1CAA4ADC8);
}

uint64_t degas::AllLabelsEdgePredicate::elements(degas::AllLabelsEdgePredicate *this, degas::Bitmap *a2)
{
  __int128 v3;

  v3 = *(_OWORD *)((char *)this + 56);
  return degas::EdgeLabelQuery::edgesForAllLabels((const degas::EdgeTable **)&v3, (Bitmap *)((char *)this + 8), a2);
}

uint64_t degas::AllLabelsEdgePredicate::filterElements(degas::AllLabelsEdgePredicate *this, Bitmap *a2, degas::Bitmap *a3)
{
  __int128 v4;

  v4 = *(_OWORD *)((char *)this + 56);
  return degas::EdgeLabelQuery::filterEdgesForAllLabels((degas::EdgeTable **)&v4, (degas::AllLabelsEdgePredicate *)((char *)this + 8), a2, a3);
}

void degas::AllLabelsEdgePredicate::decomposeLabelsPredicate(_QWORD *a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  a2[2] = 0;
  a2[3] = 0;
}

uint64_t degas::AllLabelsEdgePredicate::allLabelIds(degas::AllLabelsEdgePredicate *this, degas::Bitmap *a2)
{
  degas::Bitmap::operator=(a2, (_QWORD *)this + 1);
  return 1;
}

uint64_t degas::AllLabelsEdgePredicate::isTrivialYes(degas::AllLabelsEdgePredicate *this)
{
  return 0;
}

uint64_t degas::AllLabelsEdgePredicate::isTrivialNo(degas::AllLabelsEdgePredicate *this)
{
  return 0;
}

uint64_t degas::AllLabelsEdgePredicate::debugDescription(degas::AllLabelsEdgePredicate *this, const degas::Database *a2)
{
  uint64_t v3;
  char i;
  sqlite3_int64 v5;
  BOOL v6;
  void *p_p;
  uint64_t v9;
  void *__p;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  sqlite3_int64 v15;
  uint64_t v16;
  _QWORD v17[11];
  char v18;
  uint64_t v19;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v17);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)"all these labels:(", 18);
  degas::Bitmap::begin((_QWORD *)this + 1, &v14);
  v3 = *((_QWORD *)this + 4);
  for (i = 1; ; i = 0)
  {
    v5 = v15;
    v6 = (degas::AllLabelsEdgePredicate *)v14 == (degas::AllLabelsEdgePredicate *)((char *)this + 8) && v15 == -1;
    if (v6 && v16 == v3)
      break;
    if ((i & 1) == 0)
    {
      LOBYTE(__p) = 44;
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)&__p, 1);
    }
    __p = 0;
    v12 = 0;
    v13 = 0;
    degas::Database::getLabelName(*((_QWORD *)this + 8), v5, (uint64_t)&__p);
    if (v13 >= 0)
      p_p = &__p;
    else
      p_p = __p;
    if (v13 >= 0)
      v9 = HIBYTE(v13);
    else
      v9 = v12;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)p_p, v9);
    if (SHIBYTE(v13) < 0)
      operator delete(__p);
    degas::Bitmap::iterator::operator++(&v14);
  }
  LOBYTE(v14) = 41;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)&v14, 1);
  std::stringbuf::str();
  v17[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v17 + *(_QWORD *)(v17[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v17[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v18 < 0)
    operator delete((void *)v17[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v19);
}

void sub_1CA1D210C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  std::ostringstream::~ostringstream((uint64_t)&a19);
  _Unwind_Resume(a1);
}

void degas::AnyLabelsEdgePredicate::~AnyLabelsEdgePredicate(degas::AnyLabelsEdgePredicate *this)
{
  void **v1;

  *(_QWORD *)this = &off_1E83E5640;
  v1 = (void **)((char *)this + 24);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
}

{
  void **v1;

  *(_QWORD *)this = &off_1E83E5640;
  v1 = (void **)((char *)this + 24);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x1CAA4ADC8);
}

uint64_t degas::AnyLabelsEdgePredicate::elements(degas::AnyLabelsEdgePredicate *this, degas::Bitmap *a2)
{
  __int128 v3;

  v3 = *(_OWORD *)((char *)this + 56);
  return degas::EdgeLabelQuery::edgesForAnyLabels((const degas::EdgeTable **)&v3, (Bitmap *)((char *)this + 8), a2);
}

uint64_t degas::AnyLabelsEdgePredicate::filterElements(degas::AnyLabelsEdgePredicate *this, Bitmap *a2, degas::Bitmap *a3)
{
  __int128 v4;

  v4 = *(_OWORD *)((char *)this + 56);
  return degas::EdgeLabelQuery::filterEdgesForAnyLabels((degas::EdgeTable **)&v4, (degas::AnyLabelsEdgePredicate *)((char *)this + 8), a2, a3);
}

void degas::AnyLabelsEdgePredicate::decomposeLabelsPredicate(_QWORD *a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  *a2 = 0;
  a2[1] = 0;
  v2 = a1[1];
  a2[2] = *a1;
  a2[3] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
}

uint64_t degas::AnyLabelsEdgePredicate::allLabelIds(degas::AnyLabelsEdgePredicate *this, Bitmap *a2)
{
  return 0;
}

uint64_t degas::AnyLabelsEdgePredicate::isTrivialYes(degas::AnyLabelsEdgePredicate *this)
{
  return 0;
}

uint64_t degas::AnyLabelsEdgePredicate::isTrivialNo(degas::AnyLabelsEdgePredicate *this)
{
  return 0;
}

uint64_t degas::AnyLabelsEdgePredicate::debugDescription(degas::AnyLabelsEdgePredicate *this, const degas::Database *a2)
{
  uint64_t v3;
  char i;
  sqlite3_int64 v5;
  BOOL v6;
  void *p_p;
  uint64_t v9;
  void *__p;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  sqlite3_int64 v15;
  uint64_t v16;
  _QWORD v17[11];
  char v18;
  uint64_t v19;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v17);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)"any of these labels:(", 21);
  degas::Bitmap::begin((_QWORD *)this + 1, &v14);
  v3 = *((_QWORD *)this + 4);
  for (i = 1; ; i = 0)
  {
    v5 = v15;
    v6 = (degas::AnyLabelsEdgePredicate *)v14 == (degas::AnyLabelsEdgePredicate *)((char *)this + 8) && v15 == -1;
    if (v6 && v16 == v3)
      break;
    if ((i & 1) == 0)
    {
      LOBYTE(__p) = 44;
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)&__p, 1);
    }
    __p = 0;
    v12 = 0;
    v13 = 0;
    degas::Database::getLabelName(*((_QWORD *)this + 8), v5, (uint64_t)&__p);
    if (v13 >= 0)
      p_p = &__p;
    else
      p_p = __p;
    if (v13 >= 0)
      v9 = HIBYTE(v13);
    else
      v9 = v12;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)p_p, v9);
    if (SHIBYTE(v13) < 0)
      operator delete(__p);
    degas::Bitmap::iterator::operator++(&v14);
  }
  LOBYTE(v14) = 41;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)&v14, 1);
  std::stringbuf::str();
  v17[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v17 + *(_QWORD *)(v17[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v17[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v18 < 0)
    operator delete((void *)v17[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v19);
}

void sub_1CA1D2408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  std::ostringstream::~ostringstream((uint64_t)&a19);
  _Unwind_Resume(a1);
}

void degas::IntersectPredicate::~IntersectPredicate(degas::IntersectPredicate *this)
{
  void **v1;

  *(_QWORD *)this = &off_1E83E5698;
  v1 = (void **)((char *)this + 8);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

{
  void **v1;

  *(_QWORD *)this = &off_1E83E5698;
  v1 = (void **)((char *)this + 8);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x1CAA4ADC8);
}

uint64_t degas::IntersectPredicate::elements(degas::IntersectPredicate *this, degas::Bitmap *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  void **v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t (**v11)(void **, _OWORD *);
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  int32x4_t v22;
  unint64_t *v23;
  unint64_t v24;
  void **v26[2];
  __int128 v27;
  _QWORD v28[4];

  v27 = 0u;
  memset(v28, 0, 25);
  v4 = *((_QWORD *)this + 1);
  v5 = *((_QWORD *)this + 2);
  if (v4 == v5)
  {
    v13 = 0;
    goto LABEL_34;
  }
  v6 = 1;
  while (1)
  {
    v7 = *(void ***)v4;
    v8 = *(std::__shared_weak_count **)(v4 + 8);
    v26[0] = *(void ***)v4;
    v26[1] = (void **)&v8->__vftable;
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    v11 = (uint64_t (**)(void **, _OWORD *))*v7;
    if ((v6 & 1) != 0)
      v12 = v11[2](v7, &v27);
    else
      v12 = v11[3](v7, &v27);
    v13 = v12;
    if ((_DWORD)v12)
    {
      v14 = 0;
      v15 = 1;
      v2 = v12;
      if (!v8)
        goto LABEL_29;
LABEL_25:
      v23 = (unint64_t *)&v8->__shared_owners_;
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
      goto LABEL_29;
    }
    v16 = v27;
    if ((_QWORD)v27 == 0xFFFFFFFFLL)
    {
      v17 = (uint64_t *)v28[0];
      v18 = (uint64_t *)v28[1];
      if (v28[0] == v28[1])
      {
        v16 = 0;
      }
      else
      {
        v16 = 0;
        do
        {
          v19 = *v17;
          v20 = *(_DWORD *)(*v17 + 4);
          if (v20 == -1)
          {
            v21 = 0;
            v22 = 0uLL;
            do
            {
              do
              {
                v22 = (int32x4_t)vpadalq_u16((uint32x4_t)v22, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v19 + 4 * v21 + 16))));
                v21 += 4;
              }
              while (v21 != 32);
              v21 = 0;
              v20 = vaddvq_s32(v22);
              v22 = 0uLL;
            }
            while (v20 == -1);
            *(_DWORD *)(v19 + 4) = v20;
          }
          v16 += v20;
          v17 += 2;
        }
        while (v17 != v18);
      }
      *(_QWORD *)&v27 = v16;
    }
    v14 = v16 != 0;
    v15 = 2 * (v16 == 0);
    if (v8)
      goto LABEL_25;
LABEL_29:
    if (!v14)
      break;
    v6 = 0;
    v4 += 16;
    if (v4 == v5)
      goto LABEL_34;
  }
  if (v15 == 2)
  {
LABEL_34:
    degas::Bitmap::operator=(a2, &v27);
    v2 = v13;
  }
  v26[0] = (void **)v28;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v26);
  return v2;
}

void sub_1CA1D26BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  a9 = (void **)&a13;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

__int128 **degas::IntersectPredicate::filterElements(degas::IntersectPredicate *this, __int128 **a2, degas::Bitmap *a3)
{
  __int128 **v4;
  uint64_t v6;
  uint64_t v7;
  void **v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  __int128 **v13;
  BOOL v14;
  int v15;
  __int128 *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  int32x4_t v22;
  unint64_t *v23;
  unint64_t v24;
  void **v26[2];
  __int128 *v27;
  __int128 v28;
  __int128 v29;
  char v30;

  v4 = a2;
  v27 = *a2;
  v28 = 0u;
  v29 = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v28 + 8, a2[2], v4[3], v4[3] - a2[2]);
  v30 = *((_BYTE *)v4 + 40);
  v6 = *((_QWORD *)this + 1);
  v7 = *((_QWORD *)this + 2);
  if (v6 == v7)
  {
    v13 = 0;
    goto LABEL_30;
  }
  while (1)
  {
    v8 = *(void ***)v6;
    v9 = *(std::__shared_weak_count **)(v6 + 8);
    v26[0] = *(void ***)v6;
    v26[1] = (void **)&v9->__vftable;
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v11 = __ldxr(p_shared_owners);
      while (__stxr(v11 + 1, p_shared_owners));
    }
    v12 = (*((uint64_t (**)(void **, __int128 **, __int128 **))*v8 + 3))(v8, &v27, &v27);
    v13 = (__int128 **)v12;
    if ((_DWORD)v12)
    {
      v14 = 0;
      v15 = 1;
      v4 = (__int128 **)v12;
      if (!v9)
        goto LABEL_25;
LABEL_21:
      v23 = (unint64_t *)&v9->__shared_owners_;
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
      goto LABEL_25;
    }
    v16 = v27;
    if (v27 == (__int128 *)0xFFFFFFFFLL)
    {
      v17 = (uint64_t *)*((_QWORD *)&v28 + 1);
      v18 = (uint64_t *)v29;
      if (*((_QWORD *)&v28 + 1) == (_QWORD)v29)
      {
        v16 = 0;
      }
      else
      {
        v16 = 0;
        do
        {
          v19 = *v17;
          v20 = *(_DWORD *)(*v17 + 4);
          if (v20 == -1)
          {
            v21 = 0;
            v22 = 0uLL;
            do
            {
              do
              {
                v22 = (int32x4_t)vpadalq_u16((uint32x4_t)v22, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v19 + 4 * v21 + 16))));
                v21 += 4;
              }
              while (v21 != 32);
              v21 = 0;
              v20 = vaddvq_s32(v22);
              v22 = 0uLL;
            }
            while (v20 == -1);
            *(_DWORD *)(v19 + 4) = v20;
          }
          v16 = (__int128 *)((char *)v16 + v20);
          v17 += 2;
        }
        while (v17 != v18);
      }
      v27 = v16;
    }
    v14 = v16 != 0;
    v15 = 2 * (v16 == 0);
    if (v9)
      goto LABEL_21;
LABEL_25:
    if (!v14)
      break;
    v6 += 16;
    if (v6 == v7)
      goto LABEL_30;
  }
  if (v15 == 2)
  {
LABEL_30:
    degas::Bitmap::operator=(a3, &v27);
    v4 = v13;
  }
  v26[0] = (void **)&v28 + 1;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v26);
  return v4;
}

void sub_1CA1D28E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void degas::IntersectPredicate::decomposeLabelsPredicate(uint64_t a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  void **v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  void ***v30;
  void ***v31;
  void **v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  __int128 *v36;
  unint64_t *v37;
  unint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  unint64_t *v41;
  unint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  unint64_t v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  std::__shared_weak_count *v56;
  unint64_t *v57;
  unint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  std::__shared_weak_count *v62;
  char **v63;
  std::__shared_weak_count *v64;
  void **v65;
  std::__shared_weak_count *v66;
  uint64_t v67;
  std::__shared_weak_count *v68;
  uint64_t v69;
  std::__shared_weak_count *v70;

  v69 = 0;
  v70 = 0;
  v67 = 0;
  v68 = 0;
  v65 = 0;
  v66 = 0;
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 16);
  while (v6 != v7)
  {
    v8 = *(void ***)v6;
    v9 = *(_QWORD *)(v6 + 8);
    v63 = *(char ***)v6;
    v64 = (std::__shared_weak_count *)v9;
    if (v9)
    {
      v10 = (unint64_t *)(v9 + 8);
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    (*((void (**)(char **__return_ptr, void **, char ***))*v8 + 4))(&v59, v8, &v63);
    if (v59)
    {
      std::shared_ptr<degas::Statement>::operator=[abi:ne180100](&v69, (uint64_t)v59, (uint64_t)v60);
      std::shared_ptr<degas::Statement>::operator=[abi:ne180100](&v67, v61, (uint64_t)v62);
      std::shared_ptr<degas::Statement>::operator=[abi:ne180100](&v65, (uint64_t)v63, (uint64_t)v64);
      v21 = v62;
      if (v62)
      {
        p_shared_owners = (unint64_t *)&v62->__shared_owners_;
        do
          v23 = __ldaxr(p_shared_owners);
        while (__stlxr(v23 - 1, p_shared_owners));
        if (!v23)
        {
          ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
          std::__shared_weak_count::__release_weak(v21);
        }
      }
      v24 = (std::__shared_weak_count *)v60;
      if (v60)
      {
        v25 = (unint64_t *)(v60 + 8);
        do
          v26 = __ldaxr(v25);
        while (__stlxr(v26 - 1, v25));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
          std::__shared_weak_count::__release_weak(v24);
        }
      }
      v27 = v64;
      if (v64)
      {
        v28 = (unint64_t *)&v64->__shared_owners_;
        do
          v29 = __ldaxr(v28);
        while (__stlxr(v29 - 1, v28));
        if (!v29)
        {
          ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
          std::__shared_weak_count::__release_weak(v27);
        }
      }
      break;
    }
    v12 = v62;
    if (v62)
    {
      v13 = (unint64_t *)&v62->__shared_owners_;
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    v15 = (std::__shared_weak_count *)v60;
    if (v60)
    {
      v16 = (unint64_t *)(v60 + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    v18 = v64;
    if (v64)
    {
      v19 = (unint64_t *)&v64->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    v6 += 16;
  }
  if (!v69)
  {
    *a3 = 0;
    a3[1] = 0;
    v40 = a2[1];
    a3[2] = *a2;
    a3[3] = v40;
    if (v40)
    {
      v41 = (unint64_t *)(v40 + 8);
      do
        v42 = __ldxr(v41);
      while (__stxr(v42 + 1, v41));
    }
    goto LABEL_71;
  }
  v59 = 0;
  v60 = 0;
  v61 = 0;
  v31 = *(void ****)(a1 + 8);
  v30 = *(void ****)(a1 + 16);
  if (v31 == v30)
  {
    v63 = 0;
    v64 = 0;
    goto LABEL_61;
  }
  do
  {
    v32 = *v31;
    v33 = (std::__shared_weak_count *)v31[1];
    v63 = (char **)*v31;
    v64 = v33;
    if (v33)
    {
      v34 = (unint64_t *)&v33->__shared_owners_;
      do
        v35 = __ldxr(v34);
      while (__stxr(v35 + 1, v34));
    }
    if (v32 != v65)
    {
      v36 = (__int128 *)&v63;
LABEL_47:
      std::vector<std::shared_ptr<degas::Predicate>>::push_back[abi:ne180100](&v59, v36);
      goto LABEL_48;
    }
    if (v67)
    {
      v36 = (__int128 *)&v67;
      goto LABEL_47;
    }
LABEL_48:
    if (v33)
    {
      v37 = (unint64_t *)&v33->__shared_owners_;
      do
        v38 = __ldaxr(v37);
      while (__stlxr(v38 - 1, v37));
      if (!v38)
      {
        ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
        std::__shared_weak_count::__release_weak(v33);
      }
    }
    v31 += 2;
  }
  while (v31 != v30);
  v63 = 0;
  v64 = 0;
  if (v60 != v59)
  {
    v39 = (_QWORD *)operator new();
    *v39 = &off_1E83E5698;
    v39[2] = 0;
    v39[3] = 0;
    v39[1] = 0;
    std::vector<std::shared_ptr<degas::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::Predicate>*,std::shared_ptr<degas::Predicate>*>(v39 + 1, v59, v60, (v60 - v59) >> 4);
    std::shared_ptr<degas::Predicate>::reset[abi:ne180100]<degas::IntersectPredicate,void>(&v63, (uint64_t)v39);
  }
LABEL_61:
  v43 = v70;
  *a3 = v69;
  a3[1] = v43;
  if (v43)
  {
    v44 = (unint64_t *)&v43->__shared_owners_;
    do
      v45 = __ldxr(v44);
    while (__stxr(v45 + 1, v44));
  }
  v46 = v64;
  a3[2] = v63;
  a3[3] = v46;
  if (v46)
  {
    v47 = (unint64_t *)&v46->__shared_owners_;
    do
      v48 = __ldxr(v47);
    while (__stxr(v48 + 1, v47));
    do
      v49 = __ldaxr(v47);
    while (__stlxr(v49 - 1, v47));
    if (!v49)
    {
      ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
      std::__shared_weak_count::__release_weak(v46);
    }
  }
  v63 = &v59;
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v63);
LABEL_71:
  v50 = v66;
  if (v66)
  {
    v51 = (unint64_t *)&v66->__shared_owners_;
    do
      v52 = __ldaxr(v51);
    while (__stlxr(v52 - 1, v51));
    if (!v52)
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
  }
  v53 = v68;
  if (v68)
  {
    v54 = (unint64_t *)&v68->__shared_owners_;
    do
      v55 = __ldaxr(v54);
    while (__stlxr(v55 - 1, v54));
    if (!v55)
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
    }
  }
  v56 = v70;
  if (v70)
  {
    v57 = (unint64_t *)&v70->__shared_owners_;
    do
      v58 = __ldaxr(v57);
    while (__stlxr(v58 - 1, v57));
    if (!v58)
    {
      ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
      std::__shared_weak_count::__release_weak(v56);
    }
  }
}

void sub_1CA1D2D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void **a13, uint64_t a14, char a15, uint64_t a16, char a17)
{
  uint64_t v17;
  uint64_t v18;

  MEMORY[0x1CAA4ADC8](v17, 0xA1C4030951706);
  std::shared_ptr<degas::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  a13 = (void **)&a9;
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&a13);
  std::shared_ptr<degas::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a15);
  std::shared_ptr<degas::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a17);
  std::shared_ptr<degas::Predicate>::~shared_ptr[abi:ne180100](v18 - 64);
  _Unwind_Resume(a1);
}

uint64_t degas::IntersectPredicate::allLabelIds(degas::IntersectPredicate *this, Bitmap *a2)
{
  return 0;
}

uint64_t degas::IntersectPredicate::isTrivialYes(degas::IntersectPredicate *this)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  char v10;

  v1 = (uint64_t *)*((_QWORD *)this + 1);
  v2 = (uint64_t *)*((_QWORD *)this + 2);
  if (v1 == v2)
    return 1;
  do
  {
    v3 = *v1;
    v4 = (std::__shared_weak_count *)v1[1];
    if (v4)
    {
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
    }
    v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 48))(v3);
    if (v4)
    {
      v8 = (unint64_t *)&v4->__shared_owners_;
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    v1 += 2;
    if (v1 == v2)
      v10 = 0;
    else
      v10 = v7;
  }
  while ((v10 & 1) != 0);
  return v7;
}

void sub_1CA1D2E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<degas::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::IntersectPredicate::isTrivialNo(degas::IntersectPredicate *this)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  int v10;

  v1 = (uint64_t *)*((_QWORD *)this + 1);
  v2 = (uint64_t *)*((_QWORD *)this + 2);
  if (v1 == v2)
    return 0;
  do
  {
    v3 = *v1;
    v4 = (std::__shared_weak_count *)v1[1];
    if (v4)
    {
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
    }
    v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 56))(v3);
    if (v4)
    {
      v8 = (unint64_t *)&v4->__shared_owners_;
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    v1 += 2;
    if (v1 == v2)
      v10 = 1;
    else
      v10 = v7;
  }
  while (v10 != 1);
  return v7;
}

void sub_1CA1D2F68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<degas::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::IntersectPredicate::debugDescription(degas::IntersectPredicate *this, const degas::Database *a2)
{
  uint64_t *v4;
  uint64_t *v5;
  char v6;
  std::__shared_weak_count *v7;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void **v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  void *__p[2];
  unsigned __int8 v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  _QWORD v20[11];
  char v21;
  uint64_t v22;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v20);
  LOBYTE(__p[0]) = 40;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)__p, 1);
  v4 = (uint64_t *)*((_QWORD *)this + 1);
  v5 = (uint64_t *)*((_QWORD *)this + 2);
  if (v4 != v5)
  {
    v6 = 1;
    do
    {
      v8 = *v4;
      v7 = (std::__shared_weak_count *)v4[1];
      v18 = *v4;
      v19 = v7;
      if (v7)
      {
        p_shared_owners = (unint64_t *)&v7->__shared_owners_;
        do
          v10 = __ldxr(p_shared_owners);
        while (__stxr(v10 + 1, p_shared_owners));
      }
      if ((v6 & 1) == 0)
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)" and ", 5);
      (*(void (**)(void **__return_ptr, uint64_t, const degas::Database *))(*(_QWORD *)v8 + 64))(__p, v8, a2);
      if ((v17 & 0x80u) == 0)
        v11 = __p;
      else
        v11 = (void **)__p[0];
      if ((v17 & 0x80u) == 0)
        v12 = v17;
      else
        v12 = (uint64_t)__p[1];
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)v11, v12);
      if ((char)v17 < 0)
      {
        operator delete(__p[0]);
        if (v7)
        {
LABEL_18:
          v13 = (unint64_t *)&v7->__shared_owners_;
          do
            v14 = __ldaxr(v13);
          while (__stlxr(v14 - 1, v13));
          if (!v14)
          {
            ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
            std::__shared_weak_count::__release_weak(v7);
          }
        }
      }
      else if (v7)
      {
        goto LABEL_18;
      }
      v6 = 0;
      v4 += 2;
    }
    while (v4 != v5);
  }
  LOBYTE(__p[0]) = 41;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)__p, 1);
  std::stringbuf::str();
  v20[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v20 + *(_QWORD *)(v20[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v20[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v21 < 0)
    operator delete((void *)v20[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v22);
}

void sub_1CA1D3154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, uint64_t a16, char a17)
{
  std::ostringstream::~ostringstream((uint64_t)&a17);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<std::shared_ptr<degas::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::Predicate>*,std::shared_ptr<degas::Predicate>*>(_QWORD *result, _QWORD *a2, _QWORD *a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  if (a4)
  {
    if (a4 >> 60)
      std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
    v6 = result;
    result = std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<degas::Predicate>>>(a4);
    *v6 = result;
    v6[1] = result;
    v6[2] = &result[2 * v7];
    while (a2 != a3)
    {
      *result = *a2;
      v8 = a2[1];
      result[1] = v8;
      if (v8)
      {
        v9 = (unint64_t *)(v8 + 8);
        do
          v10 = __ldxr(v9);
        while (__stxr(v10 + 1, v9));
      }
      a2 += 2;
      result += 2;
    }
    v6[1] = result;
  }
  return result;
}

void sub_1CA1D323C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void degas::UnionPredicate::~UnionPredicate(degas::UnionPredicate *this)
{
  void **v1;

  *(_QWORD *)this = &off_1E83E56F0;
  v1 = (void **)((char *)this + 8);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

{
  void **v1;

  *(_QWORD *)this = &off_1E83E56F0;
  v1 = (void **)((char *)this + 8);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x1CAA4ADC8);
}

uint64_t degas::UnionPredicate::elements(degas::UnionPredicate *this, degas::Bitmap *a2)
{
  uint64_t v2;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  __int128 v16;
  _BYTE v17[32];
  uint64_t v18;
  std::__shared_weak_count *v19;
  __int128 v20;
  _BYTE v21[40];
  void **v22;

  v20 = 0u;
  memset(v21, 0, 25);
  v4 = (uint64_t *)*((_QWORD *)this + 1);
  v5 = (uint64_t *)*((_QWORD *)this + 2);
  if (v4 == v5)
  {
LABEL_14:
    degas::Bitmap::operator=(a2, &v20);
    v12 = 0;
  }
  else
  {
    while (1)
    {
      v6 = *v4;
      v7 = (std::__shared_weak_count *)v4[1];
      v18 = *v4;
      v19 = v7;
      if (v7)
      {
        p_shared_owners = (unint64_t *)&v7->__shared_owners_;
        do
          v9 = __ldxr(p_shared_owners);
        while (__stxr(v9 + 1, p_shared_owners));
      }
      v16 = 0u;
      memset(v17, 0, 25);
      v10 = (*(uint64_t (**)(uint64_t, __int128 *))(*(_QWORD *)v6 + 16))(v6, &v16);
      v11 = v10;
      v12 = v10;
      if (!(_DWORD)v10)
      {
        degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)&v20, (uint64_t)&v16);
        v12 = v2;
      }
      v22 = (void **)v17;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v22);
      if (v7)
      {
        v13 = (unint64_t *)&v7->__shared_owners_;
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
      }
      if (v11)
        break;
      v4 += 2;
      v2 = v12;
      if (v4 == v5)
        goto LABEL_14;
    }
  }
  *(_QWORD *)&v16 = v21;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v16);
  return v12;
}

void sub_1CA1D3418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  a9 = (void **)&a19;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::UnionPredicate::filterElements(degas::UnionPredicate *this, const degas::Bitmap *a2, degas::Bitmap *a3)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  __int128 v18;
  _BYTE v19[32];
  uint64_t v20;
  std::__shared_weak_count *v21;
  __int128 v22;
  _BYTE v23[40];
  void **v24;

  v22 = 0u;
  memset(v23, 0, 25);
  v5 = (uint64_t *)*((_QWORD *)this + 1);
  v6 = (uint64_t *)*((_QWORD *)this + 2);
  if (v5 == v6)
  {
LABEL_14:
    degas::Bitmap::operator=(a3, &v22);
    v14 = 0;
  }
  else
  {
    while (1)
    {
      v8 = *v5;
      v9 = (std::__shared_weak_count *)v5[1];
      v20 = *v5;
      v21 = v9;
      if (v9)
      {
        p_shared_owners = (unint64_t *)&v9->__shared_owners_;
        do
          v11 = __ldxr(p_shared_owners);
        while (__stxr(v11 + 1, p_shared_owners));
      }
      v18 = 0u;
      memset(v19, 0, 25);
      v12 = (*(uint64_t (**)(uint64_t, const degas::Bitmap *, __int128 *))(*(_QWORD *)v8 + 24))(v8, a2, &v18);
      v13 = v12;
      v14 = v12;
      if (!(_DWORD)v12)
      {
        degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)&v22, (uint64_t)&v18);
        v14 = v3;
      }
      v24 = (void **)v19;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v24);
      if (v9)
      {
        v15 = (unint64_t *)&v9->__shared_owners_;
        do
          v16 = __ldaxr(v15);
        while (__stlxr(v16 - 1, v15));
        if (!v16)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
      }
      if (v13)
        break;
      v5 += 2;
      v3 = v14;
      if (v5 == v6)
        goto LABEL_14;
    }
  }
  *(_QWORD *)&v18 = v23;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v18);
  return v14;
}

void sub_1CA1D3594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  a9 = (void **)&a19;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::UnionPredicate::decomposeLabelsPredicate@<X0>(uint64_t result@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  v3 = *(_QWORD **)(result + 8);
  if (*(_QWORD *)(result + 16) - (_QWORD)v3 == 16)
    return (*(uint64_t (**)(_QWORD, _QWORD *))(*(_QWORD *)*v3 + 32))(*v3, v3);
  *a3 = 0;
  a3[1] = 0;
  v4 = a2[1];
  a3[2] = *a2;
  a3[3] = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  return result;
}

uint64_t degas::UnionPredicate::allLabelIds(degas::UnionPredicate *this, Bitmap *a2)
{
  return 0;
}

uint64_t degas::UnionPredicate::isTrivialYes(degas::UnionPredicate *this)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  int v10;

  v1 = (uint64_t *)*((_QWORD *)this + 1);
  v2 = (uint64_t *)*((_QWORD *)this + 2);
  if (v1 == v2)
    return 0;
  do
  {
    v3 = *v1;
    v4 = (std::__shared_weak_count *)v1[1];
    if (v4)
    {
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
    }
    v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 48))(v3);
    if (v4)
    {
      v8 = (unint64_t *)&v4->__shared_owners_;
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    v1 += 2;
    if (v1 == v2)
      v10 = 1;
    else
      v10 = v7;
  }
  while (v10 != 1);
  return v7;
}

void sub_1CA1D36DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<degas::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::UnionPredicate::isTrivialNo(degas::UnionPredicate *this)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  char v10;

  v1 = (uint64_t *)*((_QWORD *)this + 1);
  v2 = (uint64_t *)*((_QWORD *)this + 2);
  if (v1 == v2)
    return 1;
  do
  {
    v3 = *v1;
    v4 = (std::__shared_weak_count *)v1[1];
    if (v4)
    {
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
    }
    v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 56))(v3);
    if (v4)
    {
      v8 = (unint64_t *)&v4->__shared_owners_;
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    v1 += 2;
    if (v1 == v2)
      v10 = 0;
    else
      v10 = v7;
  }
  while ((v10 & 1) != 0);
  return v7;
}

void sub_1CA1D37A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<degas::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::UnionPredicate::debugDescription(degas::UnionPredicate *this, const degas::Database *a2)
{
  uint64_t *v4;
  uint64_t *v5;
  char v6;
  std::__shared_weak_count *v7;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void **v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  void *__p[2];
  unsigned __int8 v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  _QWORD v20[11];
  char v21;
  uint64_t v22;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v20);
  LOBYTE(__p[0]) = 40;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)__p, 1);
  v4 = (uint64_t *)*((_QWORD *)this + 1);
  v5 = (uint64_t *)*((_QWORD *)this + 2);
  if (v4 != v5)
  {
    v6 = 1;
    do
    {
      v8 = *v4;
      v7 = (std::__shared_weak_count *)v4[1];
      v18 = *v4;
      v19 = v7;
      if (v7)
      {
        p_shared_owners = (unint64_t *)&v7->__shared_owners_;
        do
          v10 = __ldxr(p_shared_owners);
        while (__stxr(v10 + 1, p_shared_owners));
      }
      if ((v6 & 1) == 0)
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)" or ", 4);
      (*(void (**)(void **__return_ptr, uint64_t, const degas::Database *))(*(_QWORD *)v8 + 64))(__p, v8, a2);
      if ((v17 & 0x80u) == 0)
        v11 = __p;
      else
        v11 = (void **)__p[0];
      if ((v17 & 0x80u) == 0)
        v12 = v17;
      else
        v12 = (uint64_t)__p[1];
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)v11, v12);
      if ((char)v17 < 0)
      {
        operator delete(__p[0]);
        if (v7)
        {
LABEL_18:
          v13 = (unint64_t *)&v7->__shared_owners_;
          do
            v14 = __ldaxr(v13);
          while (__stlxr(v14 - 1, v13));
          if (!v14)
          {
            ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
            std::__shared_weak_count::__release_weak(v7);
          }
        }
      }
      else if (v7)
      {
        goto LABEL_18;
      }
      v6 = 0;
      v4 += 2;
    }
    while (v4 != v5);
  }
  LOBYTE(__p[0]) = 41;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)__p, 1);
  std::stringbuf::str();
  v20[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v20 + *(_QWORD *)(v20[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v20[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v21 < 0)
    operator delete((void *)v20[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v22);
}

void sub_1CA1D3990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, uint64_t a16, char a17)
{
  std::ostringstream::~ostringstream((uint64_t)&a17);
  _Unwind_Resume(a1);
}

void *degas::Predicate::nullPtr(degas::Predicate *this)
{
  unsigned __int8 v1;

  {
    __cxa_atexit((void (*)(void *))std::shared_ptr<degas::Predicate>::~shared_ptr[abi:ne180100], &degas::Predicate::nullPtr(void)::nullPtr, &dword_1CA0A5000);
  }
  return &degas::Predicate::nullPtr(void)::nullPtr;
}

_QWORD *degas::YesNodePredicate::YesNodePredicate(_QWORD *result, uint64_t a2)
{
  *result = &off_1E83E5430;
  result[1] = a2;
  return result;
}

{
  *result = &off_1E83E5430;
  result[1] = a2;
  return result;
}

_QWORD *degas::YesEdgePredicate::YesEdgePredicate(_QWORD *result, uint64_t a2)
{
  *result = &off_1E83E5488;
  result[1] = a2;
  return result;
}

{
  *result = &off_1E83E5488;
  result[1] = a2;
  return result;
}

_QWORD *degas::NoPredicate::NoPredicate(_QWORD *this)
{
  *this = &off_1E83E54E0;
  return this;
}

{
  *this = &off_1E83E54E0;
  return this;
}

degas::AllLabelsNodePredicate *degas::AllLabelsNodePredicate::AllLabelsNodePredicate(degas::AllLabelsNodePredicate *this, __int128 **a2, const degas::NodeTable *a3, const degas::Database *a4)
{
  __int128 *v8;

  v8 = *a2;
  *(_QWORD *)this = &off_1E83E5538;
  *((_QWORD *)this + 1) = v8;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 24, a2[2], a2[3], a2[3] - a2[2]);
  *((_BYTE *)this + 48) = *((_BYTE *)a2 + 40);
  *((_QWORD *)this + 7) = a3;
  *((_QWORD *)this + 8) = a4;
  return this;
}

{
  __int128 *v8;

  v8 = *a2;
  *(_QWORD *)this = &off_1E83E5538;
  *((_QWORD *)this + 1) = v8;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 24, a2[2], a2[3], a2[3] - a2[2]);
  *((_BYTE *)this + 48) = *((_BYTE *)a2 + 40);
  *((_QWORD *)this + 7) = a3;
  *((_QWORD *)this + 8) = a4;
  return this;
}

degas::AnyLabelsNodePredicate *degas::AnyLabelsNodePredicate::AnyLabelsNodePredicate(degas::AnyLabelsNodePredicate *this, __int128 **a2, const degas::NodeTable *a3, const degas::Database *a4)
{
  __int128 *v8;

  v8 = *a2;
  *(_QWORD *)this = &off_1E83E5590;
  *((_QWORD *)this + 1) = v8;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 24, a2[2], a2[3], a2[3] - a2[2]);
  *((_BYTE *)this + 48) = *((_BYTE *)a2 + 40);
  *((_QWORD *)this + 7) = a3;
  *((_QWORD *)this + 8) = a4;
  return this;
}

{
  __int128 *v8;

  v8 = *a2;
  *(_QWORD *)this = &off_1E83E5590;
  *((_QWORD *)this + 1) = v8;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 24, a2[2], a2[3], a2[3] - a2[2]);
  *((_BYTE *)this + 48) = *((_BYTE *)a2 + 40);
  *((_QWORD *)this + 7) = a3;
  *((_QWORD *)this + 8) = a4;
  return this;
}

degas::AllLabelsEdgePredicate *degas::AllLabelsEdgePredicate::AllLabelsEdgePredicate(degas::AllLabelsEdgePredicate *this, __int128 **a2, const degas::EdgeTable *a3, const degas::Database *a4)
{
  __int128 *v8;

  v8 = *a2;
  *(_QWORD *)this = &off_1E83E55E8;
  *((_QWORD *)this + 1) = v8;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 24, a2[2], a2[3], a2[3] - a2[2]);
  *((_BYTE *)this + 48) = *((_BYTE *)a2 + 40);
  *((_QWORD *)this + 7) = a3;
  *((_QWORD *)this + 8) = a4;
  return this;
}

{
  __int128 *v8;

  v8 = *a2;
  *(_QWORD *)this = &off_1E83E55E8;
  *((_QWORD *)this + 1) = v8;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 24, a2[2], a2[3], a2[3] - a2[2]);
  *((_BYTE *)this + 48) = *((_BYTE *)a2 + 40);
  *((_QWORD *)this + 7) = a3;
  *((_QWORD *)this + 8) = a4;
  return this;
}

degas::AnyLabelsEdgePredicate *degas::AnyLabelsEdgePredicate::AnyLabelsEdgePredicate(degas::AnyLabelsEdgePredicate *this, __int128 **a2, const degas::EdgeTable *a3, const degas::Database *a4)
{
  __int128 *v8;

  v8 = *a2;
  *(_QWORD *)this = &off_1E83E5640;
  *((_QWORD *)this + 1) = v8;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 24, a2[2], a2[3], a2[3] - a2[2]);
  *((_BYTE *)this + 48) = *((_BYTE *)a2 + 40);
  *((_QWORD *)this + 7) = a3;
  *((_QWORD *)this + 8) = a4;
  return this;
}

{
  __int128 *v8;

  v8 = *a2;
  *(_QWORD *)this = &off_1E83E5640;
  *((_QWORD *)this + 1) = v8;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 24, a2[2], a2[3], a2[3] - a2[2]);
  *((_BYTE *)this + 48) = *((_BYTE *)a2 + 40);
  *((_QWORD *)this + 7) = a3;
  *((_QWORD *)this + 8) = a4;
  return this;
}

_QWORD *degas::IntersectPredicate::IntersectPredicate(_QWORD *a1, _QWORD **a2)
{
  *a1 = &off_1E83E5698;
  a1[2] = 0;
  a1[3] = 0;
  a1[1] = 0;
  std::vector<std::shared_ptr<degas::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::Predicate>*,std::shared_ptr<degas::Predicate>*>(a1 + 1, *a2, a2[1], ((char *)a2[1] - (char *)*a2) >> 4);
  return a1;
}

{
  *a1 = &off_1E83E5698;
  a1[2] = 0;
  a1[3] = 0;
  a1[1] = 0;
  std::vector<std::shared_ptr<degas::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::Predicate>*,std::shared_ptr<degas::Predicate>*>(a1 + 1, *a2, a2[1], ((char *)a2[1] - (char *)*a2) >> 4);
  return a1;
}

_QWORD *degas::UnionPredicate::UnionPredicate(_QWORD *a1, _QWORD **a2)
{
  *a1 = &off_1E83E56F0;
  a1[2] = 0;
  a1[3] = 0;
  a1[1] = 0;
  std::vector<std::shared_ptr<degas::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::Predicate>*,std::shared_ptr<degas::Predicate>*>(a1 + 1, *a2, a2[1], ((char *)a2[1] - (char *)*a2) >> 4);
  return a1;
}

{
  *a1 = &off_1E83E56F0;
  a1[2] = 0;
  a1[3] = 0;
  a1[1] = 0;
  std::vector<std::shared_ptr<degas::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::Predicate>*,std::shared_ptr<degas::Predicate>*>(a1 + 1, *a2, a2[1], ((char *)a2[1] - (char *)*a2) >> 4);
  return a1;
}

void sub_1CA1D4B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5119(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5120(uint64_t a1)
{

}

_QWORD *degas::NodeLabelQuery::NodeLabelQuery(_QWORD *result, uint64_t a2, uint64_t a3)
{
  *result = a2;
  result[1] = a3;
  return result;
}

{
  *result = a2;
  result[1] = a3;
  return result;
}

_QWORD *degas::EdgeLabelQuery::EdgeLabelQuery(_QWORD *result, uint64_t a2, uint64_t a3)
{
  *result = a2;
  result[1] = a3;
  return result;
}

{
  *result = a2;
  result[1] = a3;
  return result;
}

uint64_t degas::implAllElementsFromLabels(degas::LabelTable *a1, degas::Bitmap *a2, uint64_t a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  _BYTE v10[40];
  degas::Statement *v11[2];
  void **v12;

  degas::LabelCursor::LabelCursor((degas::LabelCursor *)v11, a1);
  while (1)
  {
    v5 = degas::Statement::next((sqlite3_stmt **)v11[0]);
    if (v5 != 1)
      break;
    v9 = 0u;
    memset(v10, 0, 25);
    v6 = *(_QWORD *)(a3 + 24);
    if (!v6)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t, degas::Statement **, __int128 *))(*(_QWORD *)v6 + 48))(v6, v11, &v9);
    degas::Bitmap::unionWith<degas::Bitmap>(a2, (uint64_t)&v9);
    v12 = (void **)v10;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v12);
  }
  if (v5 == 2)
    v7 = 0;
  else
    v7 = v5;
  degas::Cursor::~Cursor(v11);
  return v7;
}

void sub_1CA1D59A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  uint64_t v9;
  va_list va;

  va_start(va, a8);
  *(_QWORD *)(v9 - 40) = v8;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v9 - 40));
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x1CAA4ADC8);
}

uint64_t degas::NodeLabelQuery::allNodes(const degas::NodeTable **this, degas::Bitmap *a2)
{
  const degas::NodeTable *v3;
  degas::LabelTable *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unsigned int v8;
  sqlite3_int64 v9;
  degas::Statement *v11[2];
  _QWORD v12[3];
  _QWORD *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = *this;
  if (*((_BYTE *)*this + 49))
  {
    v4 = (const degas::NodeTable *)((char *)this[1] + 80);
    v12[0] = &off_1E83E58D0;
    v13 = v12;
    v5 = degas::implAllElementsFromLabels(v4, a2, (uint64_t)v12);
    v6 = v13;
    if (v13 == v12)
    {
      v7 = 4;
      v6 = v12;
      goto LABEL_13;
    }
    if (v13)
    {
      v7 = 5;
LABEL_13:
      (*(void (**)(void))(*v6 + 8 * v7))();
    }
  }
  else
  {
    degas::NodeCursor::NodeCursor(v11);
    degas::NodeCursor::setForSelectAll((degas::NodeCursor *)v11, v3);
    while (1)
    {
      v8 = degas::Statement::next((sqlite3_stmt **)v11[0]);
      if (v8 != 1)
        break;
      v9 = sqlite3_column_int64(*(sqlite3_stmt **)v11[0], 0);
      degas::Bitmap::setBit(a2, v9);
    }
    if (v8 == 2)
      v5 = 0;
    else
      v5 = v8;
    degas::Cursor::~Cursor(v11);
  }
  return v5;
}

void sub_1CA1D5B3C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

void std::__function::__func<degas::NodeLabelQuery::allNodes(degas::Bitmap &)::$_0,std::allocator<degas::NodeLabelQuery::allNodes(degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::~__func()
{
  JUMPOUT(0x1CAA4ADC8);
}

_QWORD *std::__function::__func<degas::NodeLabelQuery::allNodes(degas::Bitmap &)::$_0,std::allocator<degas::NodeLabelQuery::allNodes(degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E83E58D0;
  return result;
}

void std::__function::__func<degas::NodeLabelQuery::allNodes(degas::Bitmap &)::$_0,std::allocator<degas::NodeLabelQuery::allNodes(degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_1E83E58D0;
}

void std::__function::__func<degas::NodeLabelQuery::allNodes(degas::Bitmap &)::$_0,std::allocator<degas::NodeLabelQuery::allNodes(degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::operator()(uint64_t a1, sqlite3_stmt ***a2, degas::Bitmap *a3)
{
  degas::Statement::bitmapColumnValue(*a2, 2, a3);
}

uint64_t std::__function::__func<degas::NodeLabelQuery::allNodes(degas::Bitmap &)::$_0,std::allocator<degas::NodeLabelQuery::allNodes(degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN5degas14NodeLabelQuery8allNodesERNS_6BitmapEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<degas::NodeLabelQuery::allNodes(degas::Bitmap &)::$_0,std::allocator<degas::NodeLabelQuery::allNodes(degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::target_type()
{
}

uint64_t degas::EdgeLabelQuery::allEdges(const degas::EdgeTable **this, degas::Bitmap *a2)
{
  const degas::EdgeTable *v3;
  degas::LabelTable *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unsigned int v8;
  sqlite3_int64 v9;
  degas::Statement *v11[2];
  _QWORD v12[3];
  _QWORD *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = *this;
  if (*((_BYTE *)*this + 49))
  {
    v4 = (const degas::EdgeTable *)((char *)this[1] + 80);
    v12[0] = &off_1E83E5960;
    v13 = v12;
    v5 = degas::implAllElementsFromLabels(v4, a2, (uint64_t)v12);
    v6 = v13;
    if (v13 == v12)
    {
      v7 = 4;
      v6 = v12;
      goto LABEL_13;
    }
    if (v13)
    {
      v7 = 5;
LABEL_13:
      (*(void (**)(void))(*v6 + 8 * v7))();
    }
  }
  else
  {
    degas::EdgeCursor::EdgeCursor(v11);
    degas::EdgeCursor::setForSelectAll((degas::EdgeCursor *)v11, v3);
    while (1)
    {
      v8 = degas::Statement::next((sqlite3_stmt **)v11[0]);
      if (v8 != 1)
        break;
      v9 = sqlite3_column_int64(*(sqlite3_stmt **)v11[0], 0);
      degas::Bitmap::setBit(a2, v9);
    }
    if (v8 == 2)
      v5 = 0;
    else
      v5 = v8;
    degas::Cursor::~Cursor(v11);
  }
  return v5;
}

void sub_1CA1D5D44(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

void std::__function::__func<degas::EdgeLabelQuery::allEdges(degas::Bitmap &)::$_0,std::allocator<degas::EdgeLabelQuery::allEdges(degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::~__func()
{
  JUMPOUT(0x1CAA4ADC8);
}

_QWORD *std::__function::__func<degas::EdgeLabelQuery::allEdges(degas::Bitmap &)::$_0,std::allocator<degas::EdgeLabelQuery::allEdges(degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E83E5960;
  return result;
}

void std::__function::__func<degas::EdgeLabelQuery::allEdges(degas::Bitmap &)::$_0,std::allocator<degas::EdgeLabelQuery::allEdges(degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_1E83E5960;
}

void std::__function::__func<degas::EdgeLabelQuery::allEdges(degas::Bitmap &)::$_0,std::allocator<degas::EdgeLabelQuery::allEdges(degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::operator()(uint64_t a1, sqlite3_stmt ***a2, degas::Bitmap *a3)
{
  degas::Statement::bitmapColumnValue(*a2, 3, a3);
}

uint64_t std::__function::__func<degas::EdgeLabelQuery::allEdges(degas::Bitmap &)::$_0,std::allocator<degas::EdgeLabelQuery::allEdges(degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN5degas14EdgeLabelQuery8allEdgesERNS_6BitmapEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<degas::EdgeLabelQuery::allEdges(degas::Bitmap &)::$_0,std::allocator<degas::EdgeLabelQuery::allEdges(degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::target_type()
{
}

uint64_t degas::implElementsForLabelFromLabels(degas::LabelTable *a1, sqlite3_int64 a2, degas::Bitmap *a3, uint64_t a4)
{
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  _BYTE v11[40];
  degas::Statement *v12[2];
  void **v13;

  degas::LabelCursor::LabelCursor((degas::LabelCursor *)v12, a2, a1);
  while (1)
  {
    v6 = degas::Statement::next((sqlite3_stmt **)v12[0]);
    if (v6 != 1)
      break;
    v10 = 0u;
    memset(v11, 0, 25);
    v7 = *(_QWORD *)(a4 + 24);
    if (!v7)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t, degas::Statement **, __int128 *))(*(_QWORD *)v7 + 48))(v7, v12, &v10);
    degas::Bitmap::unionWith<degas::Bitmap>(a3, (uint64_t)&v10);
    v13 = (void **)v11;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v13);
  }
  if (v6 == 2)
    v8 = 0;
  else
    v8 = v6;
  degas::Cursor::~Cursor(v12);
  return v8;
}

void sub_1CA1D5EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  uint64_t v9;
  va_list va;

  va_start(va, a8);
  *(_QWORD *)(v9 - 40) = v8;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v9 - 40));
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

uint64_t degas::NodeLabelQuery::nodesForLabel(const degas::NodeTable **this, sqlite3_int64 a2, degas::Bitmap *a3)
{
  const degas::NodeTable *v5;
  degas::LabelTable *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unsigned int v10;
  sqlite3_int64 v11;
  degas::Statement *v13[2];
  _QWORD v14[3];
  _QWORD *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = *this;
  if (*((_BYTE *)*this + 49))
  {
    v6 = (const degas::NodeTable *)((char *)this[1] + 80);
    v14[0] = &off_1E83E59E0;
    v15 = v14;
    v7 = degas::implElementsForLabelFromLabels(v6, a2, a3, (uint64_t)v14);
    v8 = v15;
    if (v15 == v14)
    {
      v9 = 4;
      v8 = v14;
      goto LABEL_13;
    }
    if (v15)
    {
      v9 = 5;
LABEL_13:
      (*(void (**)(void))(*v8 + 8 * v9))();
    }
  }
  else
  {
    degas::NodeCursor::NodeCursor(v13);
    degas::NodeCursor::setForLabel((degas::NodeCursor *)v13, a2, v5);
    while (1)
    {
      v10 = degas::Statement::next((sqlite3_stmt **)v13[0]);
      if (v10 != 1)
        break;
      v11 = sqlite3_column_int64(*(sqlite3_stmt **)v13[0], 0);
      degas::Bitmap::setBit(a3, v11);
    }
    if (v10 == 2)
      v7 = 0;
    else
      v7 = v10;
    degas::Cursor::~Cursor(v13);
  }
  return v7;
}

void sub_1CA1D6040(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

void std::__function::__func<degas::NodeLabelQuery::nodesForLabel(unsigned long long,degas::Bitmap &)::$_0,std::allocator<degas::NodeLabelQuery::nodesForLabel(unsigned long long,degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::~__func()
{
  JUMPOUT(0x1CAA4ADC8);
}

_QWORD *std::__function::__func<degas::NodeLabelQuery::nodesForLabel(unsigned long long,degas::Bitmap &)::$_0,std::allocator<degas::NodeLabelQuery::nodesForLabel(unsigned long long,degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E83E59E0;
  return result;
}

void std::__function::__func<degas::NodeLabelQuery::nodesForLabel(unsigned long long,degas::Bitmap &)::$_0,std::allocator<degas::NodeLabelQuery::nodesForLabel(unsigned long long,degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_1E83E59E0;
}

void std::__function::__func<degas::NodeLabelQuery::nodesForLabel(unsigned long long,degas::Bitmap &)::$_0,std::allocator<degas::NodeLabelQuery::nodesForLabel(unsigned long long,degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::operator()(uint64_t a1, sqlite3_stmt ***a2, degas::Bitmap *a3)
{
  degas::Statement::bitmapColumnValue(*a2, 2, a3);
}

uint64_t std::__function::__func<degas::NodeLabelQuery::nodesForLabel(unsigned long long,degas::Bitmap &)::$_0,std::allocator<degas::NodeLabelQuery::nodesForLabel(unsigned long long,degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN5degas14NodeLabelQuery13nodesForLabelEyRNS_6BitmapEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<degas::NodeLabelQuery::nodesForLabel(unsigned long long,degas::Bitmap &)::$_0,std::allocator<degas::NodeLabelQuery::nodesForLabel(unsigned long long,degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::target_type()
{
}

uint64_t degas::EdgeLabelQuery::edgesForLabel(const degas::EdgeTable **this, sqlite3_int64 a2, degas::Bitmap *a3)
{
  const degas::EdgeTable *v5;
  degas::LabelTable *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unsigned int v10;
  sqlite3_int64 v11;
  degas::Statement *v13[2];
  _QWORD v14[3];
  _QWORD *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = *this;
  if (*((_BYTE *)*this + 49))
  {
    v6 = (const degas::EdgeTable *)((char *)this[1] + 80);
    v14[0] = &off_1E83E5A60;
    v15 = v14;
    v7 = degas::implElementsForLabelFromLabels(v6, a2, a3, (uint64_t)v14);
    v8 = v15;
    if (v15 == v14)
    {
      v9 = 4;
      v8 = v14;
      goto LABEL_13;
    }
    if (v15)
    {
      v9 = 5;
LABEL_13:
      (*(void (**)(void))(*v8 + 8 * v9))();
    }
  }
  else
  {
    degas::EdgeCursor::EdgeCursor(v13);
    degas::EdgeCursor::setForLabel((degas::EdgeCursor *)v13, a2, v5);
    while (1)
    {
      v10 = degas::Statement::next((sqlite3_stmt **)v13[0]);
      if (v10 != 1)
        break;
      v11 = sqlite3_column_int64(*(sqlite3_stmt **)v13[0], 0);
      degas::Bitmap::setBit(a3, v11);
    }
    if (v10 == 2)
      v7 = 0;
    else
      v7 = v10;
    degas::Cursor::~Cursor(v13);
  }
  return v7;
}

void sub_1CA1D625C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

void std::__function::__func<degas::EdgeLabelQuery::edgesForLabel(unsigned long long,degas::Bitmap &)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForLabel(unsigned long long,degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::~__func()
{
  JUMPOUT(0x1CAA4ADC8);
}

_QWORD *std::__function::__func<degas::EdgeLabelQuery::edgesForLabel(unsigned long long,degas::Bitmap &)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForLabel(unsigned long long,degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E83E5A60;
  return result;
}

void std::__function::__func<degas::EdgeLabelQuery::edgesForLabel(unsigned long long,degas::Bitmap &)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForLabel(unsigned long long,degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_1E83E5A60;
}

void std::__function::__func<degas::EdgeLabelQuery::edgesForLabel(unsigned long long,degas::Bitmap &)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForLabel(unsigned long long,degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::operator()(uint64_t a1, sqlite3_stmt ***a2, degas::Bitmap *a3)
{
  degas::Statement::bitmapColumnValue(*a2, 3, a3);
}

uint64_t std::__function::__func<degas::EdgeLabelQuery::edgesForLabel(unsigned long long,degas::Bitmap &)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForLabel(unsigned long long,degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN5degas14EdgeLabelQuery13edgesForLabelEyRNS_6BitmapEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<degas::EdgeLabelQuery::edgesForLabel(unsigned long long,degas::Bitmap &)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForLabel(unsigned long long,degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::target_type()
{
}

uint64_t degas::implElementsForAllLabelsFromLabels(degas::LabelTable *a1, Bitmap *a2, degas::Bitmap *a3, uint64_t a4)
{
  char i;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  _BYTE v12[40];
  degas::Statement *v13[2];
  void **v14;

  degas::LabelCursor::LabelCursor((degas::LabelCursor *)v13, a2, a1);
  for (i = 1; ; i = 0)
  {
    v7 = degas::Statement::next((sqlite3_stmt **)v13[0]);
    if (v7 != 1)
      break;
    v11 = 0u;
    memset(v12, 0, 25);
    v8 = *(_QWORD *)(a4 + 24);
    if (!v8)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t, degas::Statement **, __int128 *))(*(_QWORD *)v8 + 48))(v8, v13, &v11);
    if ((i & 1) != 0)
      degas::Bitmap::operator=(a3, &v11);
    else
      degas::Bitmap::intersectWith<degas::Bitmap>(a3, (degas::Bitmap *)&v11);
    v14 = (void **)v12;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v14);
  }
  if (v7 == 2)
    v9 = 0;
  else
    v9 = v7;
  degas::Cursor::~Cursor(v13);
  return v9;
}

void sub_1CA1D6424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  uint64_t v9;
  va_list va;

  va_start(va, a8);
  *(_QWORD *)(v9 - 40) = v8;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v9 - 40));
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

uint64_t degas::NodeLabelQuery::nodesForAllLabels(const degas::NodeTable **this, Bitmap *a2, degas::Bitmap *a3)
{
  const degas::NodeTable *v5;
  degas::LabelTable *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unsigned int v10;
  sqlite3_int64 v11;
  degas::Statement *v13[2];
  _QWORD v14[3];
  _QWORD *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = *this;
  if (*((_BYTE *)*this + 49))
  {
    v6 = (const degas::NodeTable *)((char *)this[1] + 80);
    v14[0] = &off_1E83E5AE0;
    v15 = v14;
    v7 = degas::implElementsForAllLabelsFromLabels(v6, a2, a3, (uint64_t)v14);
    v8 = v15;
    if (v15 == v14)
    {
      v9 = 4;
      v8 = v14;
      goto LABEL_13;
    }
    if (v15)
    {
      v9 = 5;
LABEL_13:
      (*(void (**)(void))(*v8 + 8 * v9))();
    }
  }
  else
  {
    degas::NodeCursor::NodeCursor(v13);
    degas::NodeCursor::setForAllLabels((degas::NodeCursor *)v13, (const degas::Bitmap *)a2, v5);
    while (1)
    {
      v10 = degas::Statement::next((sqlite3_stmt **)v13[0]);
      if (v10 != 1)
        break;
      v11 = sqlite3_column_int64(*(sqlite3_stmt **)v13[0], 0);
      degas::Bitmap::setBit(a3, v11);
    }
    if (v10 == 2)
      v7 = 0;
    else
      v7 = v10;
    degas::Cursor::~Cursor(v13);
  }
  return v7;
}

void sub_1CA1D6574(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

void std::__function::__func<degas::NodeLabelQuery::nodesForAllLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::nodesForAllLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::~__func()
{
  JUMPOUT(0x1CAA4ADC8);
}

_QWORD *std::__function::__func<degas::NodeLabelQuery::nodesForAllLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::nodesForAllLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E83E5AE0;
  return result;
}

void std::__function::__func<degas::NodeLabelQuery::nodesForAllLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::nodesForAllLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_1E83E5AE0;
}

void std::__function::__func<degas::NodeLabelQuery::nodesForAllLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::nodesForAllLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::operator()(uint64_t a1, sqlite3_stmt ***a2, degas::Bitmap *a3)
{
  degas::Statement::bitmapColumnValue(*a2, 2, a3);
}

uint64_t std::__function::__func<degas::NodeLabelQuery::nodesForAllLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::nodesForAllLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN5degas14NodeLabelQuery17nodesForAllLabelsERKNS_6BitmapERS1_E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<degas::NodeLabelQuery::nodesForAllLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::nodesForAllLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target_type()
{
}

uint64_t degas::NodeLabelQuery::filterNodesForAllLabels(degas::NodeTable **this, const degas::Bitmap *a2, Bitmap *a3, degas::Bitmap *a4)
{
  degas::NodeTable *v7;
  degas::LabelTable *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t *v12;
  unsigned int v13;
  sqlite3_int64 v14;
  degas::Statement *v16[2];
  _BYTE v17[32];
  void **v18;
  _QWORD v19[3];
  _QWORD *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = *this;
  if (!*((_BYTE *)*this + 49))
  {
    degas::NodeCursor::NodeCursor(v16);
    v12 = degas::NodeTable::prepareStatementToReadByAllLabelsAndIdentifiers(v7, a2, a3);
    std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v16, *v12, v12[1]);
    while (1)
    {
      v13 = degas::Statement::next((sqlite3_stmt **)v16[0]);
      if (v13 != 1)
        break;
      v14 = sqlite3_column_int64(*(sqlite3_stmt **)v16[0], 0);
      degas::Bitmap::setBit(a4, v14);
    }
    if (v13 == 2)
      v9 = 0;
    else
      v9 = v13;
    degas::Cursor::~Cursor(v16);
    return v9;
  }
  *(_OWORD *)v16 = 0u;
  memset(v17, 0, 25);
  v8 = (degas::NodeTable *)((char *)this[1] + 80);
  v19[0] = &off_1E83E5B60;
  v20 = v19;
  v9 = degas::implElementsForAllLabelsFromLabels(v8, (Bitmap *)a2, (degas::Bitmap *)v16, (uint64_t)v19);
  v10 = v20;
  if (v20 == v19)
  {
    v11 = 4;
    v10 = v19;
    goto LABEL_13;
  }
  if (v20)
  {
    v11 = 5;
LABEL_13:
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  if (!(_DWORD)v9)
  {
    degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)v16, (degas::Bitmap *)a3);
    degas::Bitmap::operator=(a4, v16);
  }
  v18 = (void **)v17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v18);
  return v9;
}

void sub_1CA1D67DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  degas::Cursor::~Cursor((degas::Statement **)&a9);
  _Unwind_Resume(a1);
}

void std::__function::__func<degas::NodeLabelQuery::filterNodesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::filterNodesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::~__func()
{
  JUMPOUT(0x1CAA4ADC8);
}

_QWORD *std::__function::__func<degas::NodeLabelQuery::filterNodesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::filterNodesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E83E5B60;
  return result;
}

void std::__function::__func<degas::NodeLabelQuery::filterNodesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::filterNodesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_1E83E5B60;
}

void std::__function::__func<degas::NodeLabelQuery::filterNodesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::filterNodesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::operator()(uint64_t a1, sqlite3_stmt ***a2, degas::Bitmap *a3)
{
  degas::Statement::bitmapColumnValue(*a2, 2, a3);
}

uint64_t std::__function::__func<degas::NodeLabelQuery::filterNodesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::filterNodesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN5degas14NodeLabelQuery23filterNodesForAllLabelsERKNS_6BitmapES3_RS1_E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<degas::NodeLabelQuery::filterNodesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::filterNodesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target_type()
{
}

uint64_t degas::EdgeLabelQuery::edgesForAllLabels(const degas::EdgeTable **this, Bitmap *a2, degas::Bitmap *a3)
{
  const degas::EdgeTable *v5;
  degas::LabelTable *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unsigned int v10;
  sqlite3_int64 v11;
  degas::Statement *v13[2];
  _QWORD v14[3];
  _QWORD *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = *this;
  if (*((_BYTE *)*this + 49))
  {
    v6 = (const degas::EdgeTable *)((char *)this[1] + 80);
    v14[0] = &off_1E83E5BE0;
    v15 = v14;
    v7 = degas::implElementsForAllLabelsFromLabels(v6, a2, a3, (uint64_t)v14);
    v8 = v15;
    if (v15 == v14)
    {
      v9 = 4;
      v8 = v14;
      goto LABEL_13;
    }
    if (v15)
    {
      v9 = 5;
LABEL_13:
      (*(void (**)(void))(*v8 + 8 * v9))();
    }
  }
  else
  {
    degas::EdgeCursor::EdgeCursor(v13);
    degas::EdgeCursor::setForAllLabels((degas::EdgeCursor *)v13, (const degas::Bitmap *)a2, v5);
    while (1)
    {
      v10 = degas::Statement::next((sqlite3_stmt **)v13[0]);
      if (v10 != 1)
        break;
      v11 = sqlite3_column_int64(*(sqlite3_stmt **)v13[0], 0);
      degas::Bitmap::setBit(a3, v11);
    }
    if (v10 == 2)
      v7 = 0;
    else
      v7 = v10;
    degas::Cursor::~Cursor(v13);
  }
  return v7;
}

void sub_1CA1D6A14(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

void std::__function::__func<degas::EdgeLabelQuery::edgesForAllLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForAllLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::~__func()
{
  JUMPOUT(0x1CAA4ADC8);
}

_QWORD *std::__function::__func<degas::EdgeLabelQuery::edgesForAllLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForAllLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E83E5BE0;
  return result;
}

void std::__function::__func<degas::EdgeLabelQuery::edgesForAllLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForAllLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_1E83E5BE0;
}

void std::__function::__func<degas::EdgeLabelQuery::edgesForAllLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForAllLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::operator()(uint64_t a1, sqlite3_stmt ***a2, degas::Bitmap *a3)
{
  degas::Statement::bitmapColumnValue(*a2, 3, a3);
}

uint64_t std::__function::__func<degas::EdgeLabelQuery::edgesForAllLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForAllLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN5degas14EdgeLabelQuery17edgesForAllLabelsERKNS_6BitmapERS1_E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<degas::EdgeLabelQuery::edgesForAllLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForAllLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target_type()
{
}

uint64_t degas::EdgeLabelQuery::filterEdgesForAllLabels(degas::EdgeTable **this, const degas::Bitmap *a2, Bitmap *a3, degas::Bitmap *a4)
{
  degas::EdgeTable *v7;
  degas::LabelTable *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t *v12;
  unsigned int v13;
  sqlite3_int64 v14;
  degas::Statement *v16[2];
  _BYTE v17[32];
  void **v18;
  _QWORD v19[3];
  _QWORD *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = *this;
  if (!*((_BYTE *)*this + 49))
  {
    degas::EdgeCursor::EdgeCursor(v16);
    v12 = degas::EdgeTable::prepareStatementToReadByAllLabelsAndIdentifiers(v7, a2, a3);
    std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v16, *v12, v12[1]);
    while (1)
    {
      v13 = degas::Statement::next((sqlite3_stmt **)v16[0]);
      if (v13 != 1)
        break;
      v14 = sqlite3_column_int64(*(sqlite3_stmt **)v16[0], 0);
      degas::Bitmap::setBit(a4, v14);
    }
    if (v13 == 2)
      v9 = 0;
    else
      v9 = v13;
    degas::Cursor::~Cursor(v16);
    return v9;
  }
  *(_OWORD *)v16 = 0u;
  memset(v17, 0, 25);
  v8 = (degas::EdgeTable *)((char *)this[1] + 80);
  v19[0] = &off_1E83E5C60;
  v20 = v19;
  v9 = degas::implElementsForAllLabelsFromLabels(v8, (Bitmap *)a2, (degas::Bitmap *)v16, (uint64_t)v19);
  v10 = v20;
  if (v20 == v19)
  {
    v11 = 4;
    v10 = v19;
    goto LABEL_13;
  }
  if (v20)
  {
    v11 = 5;
LABEL_13:
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  if (!(_DWORD)v9)
  {
    degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)v16, (degas::Bitmap *)a3);
    degas::Bitmap::operator=(a4, v16);
  }
  v18 = (void **)v17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v18);
  return v9;
}

void sub_1CA1D6C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  degas::Cursor::~Cursor((degas::Statement **)&a9);
  _Unwind_Resume(a1);
}

void std::__function::__func<degas::EdgeLabelQuery::filterEdgesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::filterEdgesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::~__func()
{
  JUMPOUT(0x1CAA4ADC8);
}

_QWORD *std::__function::__func<degas::EdgeLabelQuery::filterEdgesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::filterEdgesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E83E5C60;
  return result;
}

void std::__function::__func<degas::EdgeLabelQuery::filterEdgesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::filterEdgesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_1E83E5C60;
}

void std::__function::__func<degas::EdgeLabelQuery::filterEdgesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::filterEdgesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::operator()(uint64_t a1, sqlite3_stmt ***a2, degas::Bitmap *a3)
{
  degas::Statement::bitmapColumnValue(*a2, 3, a3);
}

uint64_t std::__function::__func<degas::EdgeLabelQuery::filterEdgesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::filterEdgesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN5degas14EdgeLabelQuery23filterEdgesForAllLabelsERKNS_6BitmapES3_RS1_E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<degas::EdgeLabelQuery::filterEdgesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::filterEdgesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target_type()
{
}

uint64_t degas::implElementsForAnyLabelsFromLabels(degas::LabelTable *a1, Bitmap *a2, degas::Bitmap *a3, uint64_t a4)
{
  char i;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  _BYTE v12[40];
  degas::Statement *v13[2];
  void **v14;

  degas::LabelCursor::LabelCursor((degas::LabelCursor *)v13, a2, a1);
  for (i = 1; ; i = 0)
  {
    v7 = degas::Statement::next((sqlite3_stmt **)v13[0]);
    if (v7 != 1)
      break;
    v11 = 0u;
    memset(v12, 0, 25);
    v8 = *(_QWORD *)(a4 + 24);
    if (!v8)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t, degas::Statement **, __int128 *))(*(_QWORD *)v8 + 48))(v8, v13, &v11);
    if ((i & 1) != 0)
      degas::Bitmap::operator=(a3, &v11);
    else
      degas::Bitmap::unionWith<degas::Bitmap>(a3, (uint64_t)&v11);
    v14 = (void **)v12;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v14);
  }
  if (v7 == 2)
    v9 = 0;
  else
    v9 = v7;
  degas::Cursor::~Cursor(v13);
  return v9;
}

void sub_1CA1D6E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  uint64_t v9;
  va_list va;

  va_start(va, a8);
  *(_QWORD *)(v9 - 40) = v8;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v9 - 40));
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

uint64_t degas::NodeLabelQuery::nodesForAnyLabels(const degas::NodeTable **this, Bitmap *a2, degas::Bitmap *a3)
{
  const degas::NodeTable *v5;
  degas::LabelTable *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unsigned int v10;
  sqlite3_int64 v11;
  degas::Statement *v13[2];
  _QWORD v14[3];
  _QWORD *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = *this;
  if (*((_BYTE *)*this + 49))
  {
    v6 = (const degas::NodeTable *)((char *)this[1] + 80);
    v14[0] = &off_1E83E5CE0;
    v15 = v14;
    v7 = degas::implElementsForAnyLabelsFromLabels(v6, a2, a3, (uint64_t)v14);
    v8 = v15;
    if (v15 == v14)
    {
      v9 = 4;
      v8 = v14;
      goto LABEL_13;
    }
    if (v15)
    {
      v9 = 5;
LABEL_13:
      (*(void (**)(void))(*v8 + 8 * v9))();
    }
  }
  else
  {
    degas::NodeCursor::NodeCursor(v13);
    degas::NodeCursor::setForAnyLabels((degas::NodeCursor *)v13, (const degas::Bitmap *)a2, v5);
    while (1)
    {
      v10 = degas::Statement::next((sqlite3_stmt **)v13[0]);
      if (v10 != 1)
        break;
      v11 = sqlite3_column_int64(*(sqlite3_stmt **)v13[0], 0);
      degas::Bitmap::setBit(a3, v11);
    }
    if (v10 == 2)
      v7 = 0;
    else
      v7 = v10;
    degas::Cursor::~Cursor(v13);
  }
  return v7;
}

void sub_1CA1D6FB0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

void std::__function::__func<degas::NodeLabelQuery::nodesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::nodesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::~__func()
{
  JUMPOUT(0x1CAA4ADC8);
}

_QWORD *std::__function::__func<degas::NodeLabelQuery::nodesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::nodesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E83E5CE0;
  return result;
}

void std::__function::__func<degas::NodeLabelQuery::nodesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::nodesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_1E83E5CE0;
}

void std::__function::__func<degas::NodeLabelQuery::nodesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::nodesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::operator()(uint64_t a1, sqlite3_stmt ***a2, degas::Bitmap *a3)
{
  degas::Statement::bitmapColumnValue(*a2, 2, a3);
}

uint64_t std::__function::__func<degas::NodeLabelQuery::nodesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::nodesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN5degas14NodeLabelQuery17nodesForAnyLabelsERKNS_6BitmapERS1_E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<degas::NodeLabelQuery::nodesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::nodesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target_type()
{
}

uint64_t degas::NodeLabelQuery::filterNodesForAnyLabels(degas::NodeTable **this, const degas::Bitmap *a2, Bitmap *a3, degas::Bitmap *a4)
{
  degas::NodeTable *v7;
  degas::LabelTable *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t *v12;
  unsigned int v13;
  sqlite3_int64 v14;
  degas::Statement *v16[2];
  _BYTE v17[32];
  void **v18;
  _QWORD v19[3];
  _QWORD *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = *this;
  if (!*((_BYTE *)*this + 49))
  {
    degas::NodeCursor::NodeCursor(v16);
    v12 = degas::NodeTable::prepareStatementToReadByAnyLabelsAndIdentifiers(v7, a2, a3);
    std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v16, *v12, v12[1]);
    while (1)
    {
      v13 = degas::Statement::next((sqlite3_stmt **)v16[0]);
      if (v13 != 1)
        break;
      v14 = sqlite3_column_int64(*(sqlite3_stmt **)v16[0], 0);
      degas::Bitmap::setBit(a4, v14);
    }
    if (v13 == 2)
      v9 = 0;
    else
      v9 = v13;
    degas::Cursor::~Cursor(v16);
    return v9;
  }
  *(_OWORD *)v16 = 0u;
  memset(v17, 0, 25);
  v8 = (degas::NodeTable *)((char *)this[1] + 80);
  v19[0] = &off_1E83E5D60;
  v20 = v19;
  v9 = degas::implElementsForAnyLabelsFromLabels(v8, (Bitmap *)a2, (degas::Bitmap *)v16, (uint64_t)v19);
  v10 = v20;
  if (v20 == v19)
  {
    v11 = 4;
    v10 = v19;
    goto LABEL_13;
  }
  if (v20)
  {
    v11 = 5;
LABEL_13:
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  if (!(_DWORD)v9)
  {
    degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)v16, (degas::Bitmap *)a3);
    degas::Bitmap::operator=(a4, v16);
  }
  v18 = (void **)v17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v18);
  return v9;
}

void sub_1CA1D7218(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  degas::Cursor::~Cursor((degas::Statement **)&a9);
  _Unwind_Resume(a1);
}

void std::__function::__func<degas::NodeLabelQuery::filterNodesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::filterNodesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::~__func()
{
  JUMPOUT(0x1CAA4ADC8);
}

_QWORD *std::__function::__func<degas::NodeLabelQuery::filterNodesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::filterNodesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E83E5D60;
  return result;
}

void std::__function::__func<degas::NodeLabelQuery::filterNodesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::filterNodesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_1E83E5D60;
}

void std::__function::__func<degas::NodeLabelQuery::filterNodesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::filterNodesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::operator()(uint64_t a1, sqlite3_stmt ***a2, degas::Bitmap *a3)
{
  degas::Statement::bitmapColumnValue(*a2, 2, a3);
}

uint64_t std::__function::__func<degas::NodeLabelQuery::filterNodesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::filterNodesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN5degas14NodeLabelQuery23filterNodesForAnyLabelsERKNS_6BitmapES3_RS1_E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<degas::NodeLabelQuery::filterNodesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::filterNodesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target_type()
{
}

uint64_t degas::EdgeLabelQuery::edgesForAnyLabels(const degas::EdgeTable **this, Bitmap *a2, degas::Bitmap *a3)
{
  const degas::EdgeTable *v5;
  degas::LabelTable *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unsigned int v10;
  sqlite3_int64 v11;
  degas::Statement *v13[2];
  _QWORD v14[3];
  _QWORD *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = *this;
  if (*((_BYTE *)*this + 49))
  {
    v6 = (const degas::EdgeTable *)((char *)this[1] + 80);
    v14[0] = &off_1E83E5DE0;
    v15 = v14;
    v7 = degas::implElementsForAnyLabelsFromLabels(v6, a2, a3, (uint64_t)v14);
    v8 = v15;
    if (v15 == v14)
    {
      v9 = 4;
      v8 = v14;
      goto LABEL_13;
    }
    if (v15)
    {
      v9 = 5;
LABEL_13:
      (*(void (**)(void))(*v8 + 8 * v9))();
    }
  }
  else
  {
    degas::EdgeCursor::EdgeCursor(v13);
    degas::EdgeCursor::setForAnyLabels((degas::EdgeCursor *)v13, (const degas::Bitmap *)a2, v5);
    while (1)
    {
      v10 = degas::Statement::next((sqlite3_stmt **)v13[0]);
      if (v10 != 1)
        break;
      v11 = sqlite3_column_int64(*(sqlite3_stmt **)v13[0], 0);
      degas::Bitmap::setBit(a3, v11);
    }
    if (v10 == 2)
      v7 = 0;
    else
      v7 = v10;
    degas::Cursor::~Cursor(v13);
  }
  return v7;
}

void sub_1CA1D7450(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

void std::__function::__func<degas::EdgeLabelQuery::edgesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::~__func()
{
  JUMPOUT(0x1CAA4ADC8);
}

_QWORD *std::__function::__func<degas::EdgeLabelQuery::edgesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E83E5DE0;
  return result;
}

void std::__function::__func<degas::EdgeLabelQuery::edgesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_1E83E5DE0;
}

void std::__function::__func<degas::EdgeLabelQuery::edgesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::operator()(uint64_t a1, sqlite3_stmt ***a2, degas::Bitmap *a3)
{
  degas::Statement::bitmapColumnValue(*a2, 3, a3);
}

uint64_t std::__function::__func<degas::EdgeLabelQuery::edgesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN5degas14EdgeLabelQuery17edgesForAnyLabelsERKNS_6BitmapERS1_E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<degas::EdgeLabelQuery::edgesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target_type()
{
}

uint64_t degas::EdgeLabelQuery::filterEdgesForAnyLabels(degas::EdgeTable **this, const degas::Bitmap *a2, Bitmap *a3, degas::Bitmap *a4)
{
  degas::EdgeTable *v7;
  degas::LabelTable *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t *v12;
  unsigned int v13;
  sqlite3_int64 v14;
  degas::Statement *v16[2];
  _BYTE v17[32];
  void **v18;
  _QWORD v19[3];
  _QWORD *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = *this;
  if (!*((_BYTE *)*this + 49))
  {
    degas::EdgeCursor::EdgeCursor(v16);
    v12 = degas::EdgeTable::prepareStatementToReadByAnyLabelsAndIdentifiers(v7, a2, a3);
    std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v16, *v12, v12[1]);
    while (1)
    {
      v13 = degas::Statement::next((sqlite3_stmt **)v16[0]);
      if (v13 != 1)
        break;
      v14 = sqlite3_column_int64(*(sqlite3_stmt **)v16[0], 0);
      degas::Bitmap::setBit(a4, v14);
    }
    if (v13 == 2)
      v9 = 0;
    else
      v9 = v13;
    degas::Cursor::~Cursor(v16);
    return v9;
  }
  *(_OWORD *)v16 = 0u;
  memset(v17, 0, 25);
  v8 = (degas::EdgeTable *)((char *)this[1] + 80);
  v19[0] = &off_1E83E5E60;
  v20 = v19;
  v9 = degas::implElementsForAnyLabelsFromLabels(v8, (Bitmap *)a2, (degas::Bitmap *)v16, (uint64_t)v19);
  v10 = v20;
  if (v20 == v19)
  {
    v11 = 4;
    v10 = v19;
    goto LABEL_13;
  }
  if (v20)
  {
    v11 = 5;
LABEL_13:
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  if (!(_DWORD)v9)
  {
    degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)v16, (degas::Bitmap *)a3);
    degas::Bitmap::operator=(a4, v16);
  }
  v18 = (void **)v17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v18);
  return v9;
}

void sub_1CA1D76B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  degas::Cursor::~Cursor((degas::Statement **)&a9);
  _Unwind_Resume(a1);
}

void std::__function::__func<degas::EdgeLabelQuery::filterEdgesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::filterEdgesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::~__func()
{
  JUMPOUT(0x1CAA4ADC8);
}

_QWORD *std::__function::__func<degas::EdgeLabelQuery::filterEdgesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::filterEdgesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E83E5E60;
  return result;
}

void std::__function::__func<degas::EdgeLabelQuery::filterEdgesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::filterEdgesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_1E83E5E60;
}

void std::__function::__func<degas::EdgeLabelQuery::filterEdgesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::filterEdgesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::operator()(uint64_t a1, sqlite3_stmt ***a2, degas::Bitmap *a3)
{
  degas::Statement::bitmapColumnValue(*a2, 3, a3);
}

uint64_t std::__function::__func<degas::EdgeLabelQuery::filterEdgesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::filterEdgesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN5degas14EdgeLabelQuery23filterEdgesForAnyLabelsERKNS_6BitmapES3_RS1_E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<degas::EdgeLabelQuery::filterEdgesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::filterEdgesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target_type()
{
}

void degas::EdgeFilter_Labels::~EdgeFilter_Labels(degas::EdgeFilter_Labels *this)
{
  void **v1;

  *(_QWORD *)this = &off_1E83E5F08;
  v1 = (void **)((char *)this + 32);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
}

{
  void **v1;

  *(_QWORD *)this = &off_1E83E5F08;
  v1 = (void **)((char *)this + 32);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x1CAA4ADC8);
}

{
  void **v1;

  *(_QWORD *)this = &off_1E83E5F08;
  v1 = (void **)((char *)this + 32);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
}

uint64_t degas::EdgeFilter_Labels::resolveEdges(degas::EdgeFilter_Labels *this, degas::Bitmap *a2)
{
  uint64_t v3;
  Bitmap *v4;
  sqlite3_int64 Bit;
  const degas::EdgeTable *v7[2];

  v3 = *((_QWORD *)this + 1);
  v7[0] = (const degas::EdgeTable *)(v3 + 248);
  v7[1] = (const degas::EdgeTable *)v3;
  v4 = (Bitmap *)((char *)this + 16);
  if (degas::Bitmap::count((degas::EdgeFilter_Labels *)((char *)this + 16)) != 1)
    return degas::EdgeLabelQuery::edgesForAllLabels(v7, v4, a2);
  Bit = degas::Bitmap::firstBit((degas::Bitmap *)v4);
  return degas::EdgeLabelQuery::edgesForLabel(v7, Bit, a2);
}

void degas::EdgeFilter_Attribute::~EdgeFilter_Attribute(void **this)
{
  *this = off_1E83E5F30;
  if (*((char *)this + 71) < 0)
    operator delete(this[6]);
}

{
  *this = off_1E83E5F30;
  if (*((char *)this + 71) < 0)
    operator delete(this[6]);
  JUMPOUT(0x1CAA4ADC8);
}

{
  *this = off_1E83E5F30;
  if (*((char *)this + 71) < 0)
    operator delete(this[6]);
}

uint64_t degas::EdgeFilter_Attribute::resolveEdges(degas::EdgeFilter_Attribute *this, degas::Bitmap *a2)
{
  degas::Database *v4;
  int v5;
  uint64_t v7[2];

  v4 = (degas::Database *)*((_QWORD *)this + 1);
  v7[0] = (uint64_t)v4 + 528;
  v7[1] = degas::Database::edgeCount(v4);
  v5 = *((_DWORD *)this + 4);
  switch(v5)
  {
    case 3:
      return degas::AttributeQuery::elementsForAttributeValue(v7, *((_QWORD *)this + 3), (uint64_t)this + 48, 1, a2);
    case 2:
      return degas::AttributeQuery::elementsForAttributeValue(v7, *((_QWORD *)this + 3), 1, a2, *((double *)this + 5));
    case 1:
      return degas::AttributeQuery::elementsForAttributeValue(v7, *((_QWORD *)this + 3), *((_QWORD *)this + 4), 1, a2);
  }
  return 3;
}

void degas::EdgeFilter_Or::~EdgeFilter_Or(degas::EdgeFilter_Or *this)
{
  void **v1;

  *(_QWORD *)this = &off_1E83E5F58;
  v1 = (void **)((char *)this + 16);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

{
  void **v1;

  *(_QWORD *)this = &off_1E83E5F58;
  v1 = (void **)((char *)this + 16);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x1CAA4ADC8);
}

{
  void **v1;

  *(_QWORD *)this = &off_1E83E5F58;
  v1 = (void **)((char *)this + 16);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

uint64_t degas::EdgeFilter_Or::resolveEdges(degas::EdgeFilter_Or *this, degas::Bitmap *a2)
{
  uint64_t v2;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  __int128 v16;
  _BYTE v17[32];
  uint64_t v18;
  std::__shared_weak_count *v19;
  __int128 v20;
  _BYTE v21[40];
  void **v22;

  v20 = 0u;
  memset(v21, 0, 25);
  v4 = (uint64_t *)*((_QWORD *)this + 2);
  v5 = (uint64_t *)*((_QWORD *)this + 3);
  if (v4 == v5)
  {
LABEL_14:
    degas::Bitmap::operator=(a2, &v20);
    v12 = 0;
  }
  else
  {
    while (1)
    {
      v6 = *v4;
      v7 = (std::__shared_weak_count *)v4[1];
      v18 = *v4;
      v19 = v7;
      if (v7)
      {
        p_shared_owners = (unint64_t *)&v7->__shared_owners_;
        do
          v9 = __ldxr(p_shared_owners);
        while (__stxr(v9 + 1, p_shared_owners));
      }
      v16 = 0u;
      memset(v17, 0, 25);
      v10 = (*(uint64_t (**)(uint64_t, __int128 *))(*(_QWORD *)v6 + 16))(v6, &v16);
      v11 = v10;
      v12 = v10;
      if (!(_DWORD)v10)
      {
        degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)&v20, (uint64_t)&v16);
        v12 = v2;
      }
      v22 = (void **)v17;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v22);
      if (v7)
      {
        v13 = (unint64_t *)&v7->__shared_owners_;
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
      }
      if (v11)
        break;
      v4 += 2;
      v2 = v12;
      if (v4 == v5)
        goto LABEL_14;
    }
  }
  *(_QWORD *)&v16 = v21;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v16);
  return v12;
}

void sub_1CA1D7E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  a9 = (void **)&a19;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void degas::EdgeFilter_And::~EdgeFilter_And(degas::EdgeFilter_And *this)
{
  void **v1;

  *(_QWORD *)this = &off_1E83E5F80;
  v1 = (void **)((char *)this + 16);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

{
  void **v1;

  *(_QWORD *)this = &off_1E83E5F80;
  v1 = (void **)((char *)this + 16);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x1CAA4ADC8);
}

{
  void **v1;

  *(_QWORD *)this = &off_1E83E5F80;
  v1 = (void **)((char *)this + 16);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

uint64_t degas::EdgeFilter_And::resolveEdges(degas::EdgeFilter_And *this, degas::Bitmap *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  char v5;
  uint64_t v6;
  __int128 v8;
  _BYTE v9[32];
  __int128 v10;
  _BYTE v11[40];
  void **v12;

  v10 = 0u;
  memset(v11, 0, 25);
  v3 = (_QWORD *)*((_QWORD *)this + 2);
  v4 = (_QWORD *)*((_QWORD *)this + 3);
  if (v3 == v4)
  {
LABEL_8:
    degas::Bitmap::operator=(a2, &v10);
    v6 = 0;
  }
  else
  {
    v5 = 1;
    while (1)
    {
      v8 = 0u;
      memset(v9, 0, 25);
      v6 = (*(uint64_t (**)(_QWORD, __int128 *))(*(_QWORD *)*v3 + 16))(*v3, &v8);
      if ((_DWORD)v6)
        break;
      if ((v5 & 1) != 0)
        degas::Bitmap::operator=(&v10, &v8);
      else
        degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)&v10, (degas::Bitmap *)&v8);
      v12 = (void **)v9;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v12);
      v5 = 0;
      v3 += 2;
      if (v3 == v4)
        goto LABEL_8;
    }
    v12 = (void **)v9;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v12);
  }
  *(_QWORD *)&v8 = v11;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v8);
  return v6;
}

void sub_1CA1D8044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  a9 = (void **)&a17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

_QWORD *degas::EdgeFilter::EdgeFilter(_QWORD *result, uint64_t a2)
{
  *result = off_1E83E5EE0;
  result[1] = a2;
  return result;
}

degas::EdgeFilter_Labels *degas::EdgeFilter_Labels::EdgeFilter_Labels(degas::EdgeFilter_Labels *this, degas::Database *a2, __int128 **a3)
{
  *(_QWORD *)this = &off_1E83E5F08;
  *((_QWORD *)this + 1) = a2;
  *((_QWORD *)this + 2) = *a3;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 32, a3[2], a3[3], a3[3] - a3[2]);
  *((_BYTE *)this + 56) = *((_BYTE *)a3 + 40);
  return this;
}

{
  *(_QWORD *)this = &off_1E83E5F08;
  *((_QWORD *)this + 1) = a2;
  *((_QWORD *)this + 2) = *a3;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 32, a3[2], a3[3], a3[3] - a3[2]);
  *((_BYTE *)this + 56) = *((_BYTE *)a3 + 40);
  return this;
}

degas::EdgeFilter_Labels *degas::EdgeFilter_Labels::EdgeFilter_Labels(degas::EdgeFilter_Labels *this, degas::Database *a2, unint64_t a3)
{
  *(_QWORD *)this = &off_1E83E5F08;
  *((_QWORD *)this + 1) = a2;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)((char *)this + 41) = 0u;
  *((_OWORD *)this + 1) = 0u;
  degas::Bitmap::setBit((degas::EdgeFilter_Labels *)((char *)this + 16), a3);
  return this;
}

void sub_1CA1D8198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  uint64_t v10;

  a10 = (void **)(v10 + 32);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

uint64_t degas::EdgeFilter_Labels::addLabel(degas::EdgeFilter_Labels *this, unint64_t a2)
{
  return degas::Bitmap::setBit((degas::EdgeFilter_Labels *)((char *)this + 16), a2);
}

double degas::EdgeFilter_Attribute::EdgeFilter_Attribute(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double result;

  *(_QWORD *)a1 = off_1E83E5F30;
  *(_QWORD *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 24) = a3;
  *(_QWORD *)(a1 + 32) = a4;
  result = 0.0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  return result;
}

{
  double result;

  *(_QWORD *)a1 = off_1E83E5F30;
  *(_QWORD *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 24) = a3;
  *(_QWORD *)(a1 + 32) = a4;
  result = 0.0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  return result;
}

uint64_t degas::EdgeFilter_Attribute::EdgeFilter_Attribute(uint64_t result, uint64_t a2, uint64_t a3, double a4)
{
  *(_QWORD *)result = off_1E83E5F30;
  *(_QWORD *)(result + 8) = a2;
  *(_DWORD *)(result + 16) = 2;
  *(_QWORD *)(result + 24) = a3;
  *(_QWORD *)(result + 32) = 0;
  *(double *)(result + 40) = a4;
  *(_QWORD *)(result + 56) = 0;
  *(_QWORD *)(result + 64) = 0;
  *(_QWORD *)(result + 48) = 0;
  return result;
}

{
  *(_QWORD *)result = off_1E83E5F30;
  *(_QWORD *)(result + 8) = a2;
  *(_DWORD *)(result + 16) = 2;
  *(_QWORD *)(result + 24) = a3;
  *(_QWORD *)(result + 32) = 0;
  *(double *)(result + 40) = a4;
  *(_QWORD *)(result + 56) = 0;
  *(_QWORD *)(result + 64) = 0;
  *(_QWORD *)(result + 48) = 0;
  return result;
}

uint64_t degas::EdgeFilter_Attribute::EdgeFilter_Attribute(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4)
{
  std::string *v5;
  __int128 v6;

  *(_QWORD *)a1 = off_1E83E5F30;
  *(_QWORD *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = 3;
  v5 = (std::string *)(a1 + 48);
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 24) = a3;
  if (*((char *)a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)a4, *((_QWORD *)a4 + 1));
  }
  else
  {
    v6 = *a4;
    v5->__r_.__value_.__r.__words[2] = *((_QWORD *)a4 + 2);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  return a1;
}

_QWORD *degas::EdgeFilter_Or::EdgeFilter_Or(_QWORD *result, uint64_t a2)
{
  *result = &off_1E83E5F58;
  result[1] = a2;
  result[3] = 0;
  result[4] = 0;
  result[2] = 0;
  return result;
}

{
  *result = &off_1E83E5F58;
  result[1] = a2;
  result[3] = 0;
  result[4] = 0;
  result[2] = 0;
  return result;
}

_QWORD *degas::EdgeFilter_Or::EdgeFilter_Or(_QWORD *a1, uint64_t a2, _QWORD **a3)
{
  *a1 = &off_1E83E5F58;
  a1[1] = a2;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  std::vector<std::shared_ptr<degas::EdgeFilter>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::EdgeFilter>*,std::shared_ptr<degas::EdgeFilter>*>(a1 + 2, *a3, a3[1], ((char *)a3[1] - (char *)*a3) >> 4);
  return a1;
}

{
  *a1 = &off_1E83E5F58;
  a1[1] = a2;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  std::vector<std::shared_ptr<degas::EdgeFilter>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::EdgeFilter>*,std::shared_ptr<degas::EdgeFilter>*>(a1 + 2, *a3, a3[1], ((char *)a3[1] - (char *)*a3) >> 4);
  return a1;
}

_QWORD *std::vector<std::shared_ptr<degas::EdgeFilter>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::EdgeFilter>*,std::shared_ptr<degas::EdgeFilter>*>(_QWORD *result, _QWORD *a2, _QWORD *a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  if (a4)
  {
    if (a4 >> 60)
      std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
    v6 = result;
    result = std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<degas::Predicate>>>(a4);
    *v6 = result;
    v6[1] = result;
    v6[2] = &result[2 * v7];
    while (a2 != a3)
    {
      *result = *a2;
      v8 = a2[1];
      result[1] = v8;
      if (v8)
      {
        v9 = (unint64_t *)(v8 + 8);
        do
          v10 = __ldxr(v9);
        while (__stxr(v10 + 1, v9));
      }
      a2 += 2;
      result += 2;
    }
    v6[1] = result;
  }
  return result;
}

void sub_1CA1D8460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void degas::EdgeFilter_Or::addSubFilter(uint64_t a1, __int128 *a2)
{
  std::vector<std::shared_ptr<degas::Predicate>>::push_back[abi:ne180100]((char **)(a1 + 16), a2);
}

_QWORD *degas::EdgeFilter_And::EdgeFilter_And(_QWORD *result, uint64_t a2)
{
  *result = &off_1E83E5F80;
  result[1] = a2;
  result[3] = 0;
  result[4] = 0;
  result[2] = 0;
  return result;
}

{
  *result = &off_1E83E5F80;
  result[1] = a2;
  result[3] = 0;
  result[4] = 0;
  result[2] = 0;
  return result;
}

_QWORD *degas::EdgeFilter_And::EdgeFilter_And(_QWORD *a1, uint64_t a2, _QWORD **a3)
{
  *a1 = &off_1E83E5F80;
  a1[1] = a2;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  std::vector<std::shared_ptr<degas::EdgeFilter>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::EdgeFilter>*,std::shared_ptr<degas::EdgeFilter>*>(a1 + 2, *a3, a3[1], ((char *)a3[1] - (char *)*a3) >> 4);
  return a1;
}

{
  *a1 = &off_1E83E5F80;
  a1[1] = a2;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  std::vector<std::shared_ptr<degas::EdgeFilter>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::EdgeFilter>*,std::shared_ptr<degas::EdgeFilter>*>(a1 + 2, *a3, a3[1], ((char *)a3[1] - (char *)*a3) >> 4);
  return a1;
}

void degas::EdgeFilter_And::addSubFilter(uint64_t a1, __int128 *a2)
{
  std::vector<std::shared_ptr<degas::Predicate>>::push_back[abi:ne180100]((char **)(a1 + 16), a2);
}

uint64_t degas::returnCodeFromSqlite(int a1, unsigned int a2)
{
  int v2;
  unsigned int v3;
  unsigned int v4;

  if (a1 == 101)
    v2 = 2;
  else
    v2 = a2;
  if (a1 == 100)
    v3 = 1;
  else
    v3 = v2;
  if (a1 == 17)
    v4 = 4;
  else
    v4 = a2;
  if (!a1)
    v4 = 0;
  if (a1 <= 99)
    return v4;
  else
    return v3;
}

uint64_t degas::sqliteFlagFromDataProtectionClass(int a1)
{
  if ((a1 - 1) > 2)
    return 0x100000;
  else
    return dword_1CA1FF5C8[a1 - 1];
}

degas::Database *degas::Database::Database(degas::Database *this)
{
  degas::StatementCache *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  std::string *v7;
  int v8;
  std::string *v9;
  int v10;
  std::string *v11;
  int v12;
  std::string *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  std::string *v22;
  int v23;
  void *__p[2];
  uint64_t v26;

  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 5) = (char *)this + 48;
  v2 = (degas::Database *)((char *)this + 40);
  *((_BYTE *)this + 32) = 0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 8) = 0x2800000000;
  *((_QWORD *)this + 9) = 0;
  degas::LabelTable::LabelTable((degas::Database *)((char *)this + 80), 0, (degas::Database *)((char *)this + 40));
  degas::MetadataTable::MetadataTable((degas::Database *)((char *)this + 136), 0, v2);
  std::string::basic_string[abi:ne180100]<0>(__p, "Node");
  *((_QWORD *)this + 24) = off_1E83E43A8;
  if (SHIBYTE(v26) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 200), (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    v3 = SHIBYTE(v26);
    *((_QWORD *)this + 28) = 0;
    *((_QWORD *)this + 29) = v2;
    *((_QWORD *)this + 24) = off_1E83E51B8;
    *((_WORD *)this + 120) = 262;
    if (v3 < 0)
      operator delete(__p[0]);
  }
  else
  {
    *(_OWORD *)((char *)this + 200) = *(_OWORD *)__p;
    *((_QWORD *)this + 27) = v26;
    *((_QWORD *)this + 28) = 0;
    *((_QWORD *)this + 29) = v2;
    *((_QWORD *)this + 24) = off_1E83E51B8;
    *((_WORD *)this + 120) = 262;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "Edge");
  *((_QWORD *)this + 31) = off_1E83E43A8;
  if (SHIBYTE(v26) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 256), (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    v4 = SHIBYTE(v26);
    *((_QWORD *)this + 35) = 0;
    *((_QWORD *)this + 36) = v2;
    *((_QWORD *)this + 31) = off_1E83E4918;
    *((_WORD *)this + 148) = 258;
    if (v4 < 0)
      operator delete(__p[0]);
  }
  else
  {
    *((_OWORD *)this + 16) = *(_OWORD *)__p;
    *((_QWORD *)this + 34) = v26;
    *((_QWORD *)this + 35) = 0;
    *((_QWORD *)this + 36) = v2;
    *((_QWORD *)this + 31) = off_1E83E4918;
    *((_WORD *)this + 148) = 258;
  }
  degas::AttributeTable::AttributeTable((degas::Database *)((char *)this + 304), 0, v2);
  std::string::basic_string[abi:ne180100]<0>(__p, "NodeValue");
  *((_QWORD *)this + 45) = off_1E83E43A8;
  if (SHIBYTE(v26) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 368), (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    v5 = SHIBYTE(v26);
    *((_QWORD *)this + 49) = 0;
    *((_QWORD *)this + 50) = v2;
    *((_QWORD *)this + 45) = off_1E83E2ED8;
    *((_BYTE *)this + 408) = 7;
    if (v5 < 0)
      operator delete(__p[0]);
  }
  else
  {
    *((_OWORD *)this + 23) = *(_OWORD *)__p;
    *((_QWORD *)this + 48) = v26;
    *((_QWORD *)this + 49) = 0;
    *((_QWORD *)this + 50) = v2;
    *((_QWORD *)this + 45) = off_1E83E2ED8;
    *((_BYTE *)this + 408) = 7;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "EdgeValue");
  *((_QWORD *)this + 52) = off_1E83E43A8;
  if (SHIBYTE(v26) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 424), (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    v6 = SHIBYTE(v26);
    *((_QWORD *)this + 56) = 0;
    *((_QWORD *)this + 57) = v2;
    *((_QWORD *)this + 52) = off_1E83E2ED8;
    *((_BYTE *)this + 464) = 3;
    if (v6 < 0)
      operator delete(__p[0]);
  }
  else
  {
    *(_OWORD *)((char *)this + 424) = *(_OWORD *)__p;
    *((_QWORD *)this + 55) = v26;
    *((_QWORD *)this + 56) = 0;
    *((_QWORD *)this + 57) = v2;
    *((_QWORD *)this + 52) = off_1E83E2ED8;
    *((_BYTE *)this + 464) = 3;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "NodeValue");
  *((_QWORD *)this + 59) = off_1E83E43A8;
  v7 = (std::string *)((char *)this + 480);
  if (SHIBYTE(v26) < 0)
  {
    std::string::__init_copy_ctor_external(v7, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    v8 = SHIBYTE(v26);
    *((_QWORD *)this + 63) = 0;
    *((_QWORD *)this + 64) = v2;
    *((_QWORD *)this + 59) = off_1E83E4E78;
    *((_BYTE *)this + 520) = 9;
    if (v8 < 0)
      operator delete(__p[0]);
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    *((_QWORD *)this + 62) = v26;
    *((_QWORD *)this + 63) = 0;
    *((_QWORD *)this + 64) = v2;
    *((_QWORD *)this + 59) = off_1E83E4E78;
    *((_BYTE *)this + 520) = 9;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "EdgeValue");
  *((_QWORD *)this + 66) = off_1E83E43A8;
  v9 = (std::string *)((char *)this + 536);
  if (SHIBYTE(v26) < 0)
  {
    std::string::__init_copy_ctor_external(v9, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    v10 = SHIBYTE(v26);
    *((_QWORD *)this + 70) = 0;
    *((_QWORD *)this + 71) = v2;
    *((_QWORD *)this + 66) = off_1E83E4E78;
    *((_BYTE *)this + 576) = 10;
    if (v10 < 0)
      operator delete(__p[0]);
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    *((_QWORD *)this + 69) = v26;
    *((_QWORD *)this + 70) = 0;
    *((_QWORD *)this + 71) = v2;
    *((_QWORD *)this + 66) = off_1E83E4E78;
    *((_BYTE *)this + 576) = 10;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "NodeValue");
  *((_QWORD *)this + 73) = off_1E83E43A8;
  v11 = (std::string *)((char *)this + 592);
  if (SHIBYTE(v26) < 0)
  {
    std::string::__init_copy_ctor_external(v11, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    v12 = SHIBYTE(v26);
    *((_QWORD *)this + 77) = 0;
    *((_QWORD *)this + 78) = v2;
    *((_QWORD *)this + 73) = off_1E83E2780;
    *((_BYTE *)this + 632) = 11;
    if (v12 < 0)
      operator delete(__p[0]);
  }
  else
  {
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    *((_QWORD *)this + 76) = v26;
    *((_QWORD *)this + 77) = 0;
    *((_QWORD *)this + 78) = v2;
    *((_QWORD *)this + 73) = off_1E83E2780;
    *((_BYTE *)this + 632) = 11;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "EdgeValue");
  *((_QWORD *)this + 80) = off_1E83E43A8;
  v13 = (std::string *)((char *)this + 648);
  if (SHIBYTE(v26) < 0)
  {
    std::string::__init_copy_ctor_external(v13, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    v14 = SHIBYTE(v26);
    *((_QWORD *)this + 84) = 0;
    *((_QWORD *)this + 85) = v2;
    *((_QWORD *)this + 80) = off_1E83E2780;
    *((_BYTE *)this + 688) = 12;
    if (v14 < 0)
      operator delete(__p[0]);
  }
  else
  {
    *(_OWORD *)&v13->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    *((_QWORD *)this + 83) = v26;
    *((_QWORD *)this + 84) = 0;
    *((_QWORD *)this + 85) = v2;
    *((_QWORD *)this + 80) = off_1E83E2780;
    *((_BYTE *)this + 688) = 12;
  }
  degas::TransactionLogTable::TransactionLogTable((degas::Database *)((char *)this + 696), 0, v2);
  degas::ClientLogTable::ClientLogTable((degas::Database *)((char *)this + 752), 0, v2);
  std::string::basic_string[abi:ne180100]<0>(__p, "TombstoneNode");
  *((_QWORD *)this + 101) = off_1E83E43A8;
  if (SHIBYTE(v26) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)this + 34, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    v15 = SHIBYTE(v26);
    *((_QWORD *)this + 105) = 0;
    *((_QWORD *)this + 106) = v2;
    *((_QWORD *)this + 101) = off_1E83E51B8;
    *((_WORD *)this + 428) = 15;
    if (v15 < 0)
      operator delete(__p[0]);
  }
  else
  {
    *((_OWORD *)this + 51) = *(_OWORD *)__p;
    *((_QWORD *)this + 104) = v26;
    *((_QWORD *)this + 105) = 0;
    *((_QWORD *)this + 106) = v2;
    *((_QWORD *)this + 101) = off_1E83E51B8;
    *((_WORD *)this + 428) = 15;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "TombstoneEdge");
  *((_QWORD *)this + 108) = off_1E83E43A8;
  if (SHIBYTE(v26) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 872), (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    v16 = SHIBYTE(v26);
    *((_QWORD *)this + 112) = 0;
    *((_QWORD *)this + 113) = v2;
    *((_QWORD *)this + 108) = off_1E83E4918;
    *((_WORD *)this + 456) = 16;
    if (v16 < 0)
      operator delete(__p[0]);
  }
  else
  {
    *(_OWORD *)((char *)this + 872) = *(_OWORD *)__p;
    *((_QWORD *)this + 111) = v26;
    *((_QWORD *)this + 112) = 0;
    *((_QWORD *)this + 113) = v2;
    *((_QWORD *)this + 108) = off_1E83E4918;
    *((_WORD *)this + 456) = 16;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "TombstoneNodeValue");
  *((_QWORD *)this + 115) = off_1E83E43A8;
  if (SHIBYTE(v26) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 928), (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    v17 = SHIBYTE(v26);
    *((_QWORD *)this + 119) = 0;
    *((_QWORD *)this + 120) = v2;
    *((_QWORD *)this + 115) = off_1E83E2ED8;
    *((_BYTE *)this + 968) = 17;
    if (v17 < 0)
      operator delete(__p[0]);
  }
  else
  {
    *((_OWORD *)this + 58) = *(_OWORD *)__p;
    *((_QWORD *)this + 118) = v26;
    *((_QWORD *)this + 119) = 0;
    *((_QWORD *)this + 120) = v2;
    *((_QWORD *)this + 115) = off_1E83E2ED8;
    *((_BYTE *)this + 968) = 17;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "TombstoneEdgeValue");
  *((_QWORD *)this + 122) = off_1E83E43A8;
  if (SHIBYTE(v26) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)this + 41, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    v18 = SHIBYTE(v26);
    *((_QWORD *)this + 126) = 0;
    *((_QWORD *)this + 127) = v2;
    *((_QWORD *)this + 122) = off_1E83E2ED8;
    *((_BYTE *)this + 1024) = 18;
    if (v18 < 0)
      operator delete(__p[0]);
  }
  else
  {
    *(_OWORD *)((char *)this + 984) = *(_OWORD *)__p;
    *((_QWORD *)this + 125) = v26;
    *((_QWORD *)this + 126) = 0;
    *((_QWORD *)this + 127) = v2;
    *((_QWORD *)this + 122) = off_1E83E2ED8;
    *((_BYTE *)this + 1024) = 18;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "TombstoneNodeValue");
  *((_QWORD *)this + 129) = off_1E83E43A8;
  if (SHIBYTE(v26) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 1040), (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    v19 = SHIBYTE(v26);
    *((_QWORD *)this + 133) = 0;
    *((_QWORD *)this + 134) = v2;
    *((_QWORD *)this + 129) = off_1E83E4E78;
    *((_BYTE *)this + 1080) = 19;
    if (v19 < 0)
      operator delete(__p[0]);
  }
  else
  {
    *((_OWORD *)this + 65) = *(_OWORD *)__p;
    *((_QWORD *)this + 132) = v26;
    *((_QWORD *)this + 133) = 0;
    *((_QWORD *)this + 134) = v2;
    *((_QWORD *)this + 129) = off_1E83E4E78;
    *((_BYTE *)this + 1080) = 19;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "TombstoneEdgeValue");
  *((_QWORD *)this + 136) = off_1E83E43A8;
  if (SHIBYTE(v26) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 1096), (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    v20 = SHIBYTE(v26);
    *((_QWORD *)this + 140) = 0;
    *((_QWORD *)this + 141) = v2;
    *((_QWORD *)this + 136) = off_1E83E4E78;
    *((_BYTE *)this + 1136) = 20;
    if (v20 < 0)
      operator delete(__p[0]);
  }
  else
  {
    *(_OWORD *)((char *)this + 1096) = *(_OWORD *)__p;
    *((_QWORD *)this + 139) = v26;
    *((_QWORD *)this + 140) = 0;
    *((_QWORD *)this + 141) = v2;
    *((_QWORD *)this + 136) = off_1E83E4E78;
    *((_BYTE *)this + 1136) = 20;
  }
  degas::LabelledEdgeTable::LabelledEdgeTable((degas::Database *)((char *)this + 1144), 0, v2);
  *((_OWORD *)this + 75) = 0u;
  std::string::basic_string[abi:ne180100]<0>(__p, "identifierBitmap");
  if (SHIBYTE(v26) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 1216), (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    v21 = SHIBYTE(v26);
    *((_QWORD *)this + 155) = 0;
    if (v21 < 0)
      operator delete(__p[0]);
  }
  else
  {
    *((_OWORD *)this + 76) = *(_OWORD *)__p;
    *((_QWORD *)this + 154) = v26;
    *((_QWORD *)this + 155) = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "valueArray");
  v22 = (std::string *)((char *)this + 1248);
  if (SHIBYTE(v26) < 0)
  {
    std::string::__init_copy_ctor_external(v22, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    v23 = SHIBYTE(v26);
    *((_QWORD *)this + 159) = 0;
    if (v23 < 0)
      operator delete(__p[0]);
  }
  else
  {
    *(_OWORD *)&v22->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    *((_QWORD *)this + 158) = v26;
    *((_QWORD *)this + 159) = 0;
  }
  *((_QWORD *)this + 161) = -1;
  *((_QWORD *)this + 160) = -1;
  *((_DWORD *)this + 324) = 0;
  *(_OWORD *)((char *)this + 1336) = 0u;
  *((_QWORD *)this + 163) = 0;
  *((_QWORD *)this + 165) = 0;
  *((_QWORD *)this + 164) = 0;
  *((_BYTE *)this + 1328) = 0;
  *((_DWORD *)this + 338) = 3;
  *((_WORD *)this + 678) = 0;
  *((_OWORD *)this + 85) = 0u;
  *((_OWORD *)this + 86) = 0u;
  *(_OWORD *)((char *)this + 1385) = 0u;
  *((_OWORD *)this + 88) = 0u;
  *((_OWORD *)this + 89) = 0u;
  *(_OWORD *)((char *)this + 1433) = 0u;
  *((_OWORD *)this + 92) = 0u;
  *((_OWORD *)this + 91) = 0u;
  *(_OWORD *)((char *)this + 1481) = 0u;
  *(_OWORD *)((char *)this + 1529) = 0u;
  *((_OWORD *)this + 95) = 0u;
  *((_OWORD *)this + 94) = 0u;
  *((_OWORD *)this + 97) = 0u;
  *((_OWORD *)this + 98) = 0u;
  *(_OWORD *)((char *)this + 1577) = 0u;
  *((_OWORD *)this + 100) = 0u;
  *((_OWORD *)this + 101) = 0u;
  *(_OWORD *)((char *)this + 1625) = 0u;
  *((_OWORD *)this + 103) = 0u;
  *((_OWORD *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 1673) = 0u;
  return this;
}

void sub_1CA1D8F28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **a10, void **a11, void **a12, void **a13, void **a14, void **a15, void **a16, void **a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  uint64_t v23;
  void **v24;
  void **v25;
  void **v26;
  void **v27;
  void **v28;
  void **v29;
  uint64_t v30;
  void **v31;

  if (a23 < 0)
    operator delete(__p);
  if (*(char *)(v23 + 1239) < 0)
    operator delete(*v31);
  *(_QWORD *)(v23 + 1144) = v30;
  *(_QWORD *)(v23 + 1176) = 0;
  if (*(char *)(v23 + 1175) < 0)
    operator delete(*(void **)(v23 + 1152));
  *(_QWORD *)(v23 + 1088) = v30;
  *(_QWORD *)(v23 + 1120) = 0;
  if (*(char *)(v23 + 1119) < 0)
    operator delete(*v29);
  *(_QWORD *)(v23 + 1032) = v30;
  *(_QWORD *)(v23 + 1064) = 0;
  if (*(char *)(v23 + 1063) < 0)
    operator delete(*v28);
  *(_QWORD *)(v23 + 976) = v30;
  *(_QWORD *)(v23 + 1008) = 0;
  if (*(char *)(v23 + 1007) < 0)
    operator delete(*v27);
  *(_QWORD *)(v23 + 920) = v30;
  *(_QWORD *)(v23 + 952) = 0;
  if (*(char *)(v23 + 951) < 0)
    operator delete(*v26);
  *(_QWORD *)(v23 + 864) = v30;
  *(_QWORD *)(v23 + 896) = 0;
  if (*(char *)(v23 + 895) < 0)
    operator delete(*v25);
  *(_QWORD *)(v23 + 808) = v30;
  *(_QWORD *)(v23 + 840) = 0;
  if (*(char *)(v23 + 839) < 0)
    operator delete(*v24);
  *(_QWORD *)(v23 + 752) = v30;
  *(_QWORD *)(v23 + 784) = 0;
  if (*(char *)(v23 + 783) < 0)
    operator delete(*(void **)(v23 + 760));
  *(_QWORD *)(v23 + 696) = v30;
  *(_QWORD *)(v23 + 728) = 0;
  if (*(char *)(v23 + 727) < 0)
    operator delete(*(void **)(v23 + 704));
  *(_QWORD *)(v23 + 640) = v30;
  *(_QWORD *)(v23 + 672) = 0;
  if (*(char *)(v23 + 671) < 0)
    operator delete(*a10);
  *(_QWORD *)(v23 + 584) = v30;
  *(_QWORD *)(v23 + 616) = 0;
  if (*(char *)(v23 + 615) < 0)
    operator delete(*a11);
  *(_QWORD *)(v23 + 528) = v30;
  *(_QWORD *)(v23 + 560) = 0;
  if (*(char *)(v23 + 559) < 0)
    operator delete(*a12);
  *(_QWORD *)(v23 + 472) = v30;
  *(_QWORD *)(v23 + 504) = 0;
  if (*(char *)(v23 + 503) < 0)
    operator delete(*a13);
  *(_QWORD *)(v23 + 416) = v30;
  *(_QWORD *)(v23 + 448) = 0;
  if (*(char *)(v23 + 447) < 0)
    operator delete(*a14);
  *(_QWORD *)(v23 + 360) = v30;
  *(_QWORD *)(v23 + 392) = 0;
  if (*(char *)(v23 + 391) < 0)
    operator delete(*a15);
  *(_QWORD *)(v23 + 304) = v30;
  *(_QWORD *)(v23 + 336) = 0;
  if (*(char *)(v23 + 335) < 0)
    operator delete(*(void **)(v23 + 312));
  *(_QWORD *)(v23 + 248) = v30;
  *(_QWORD *)(v23 + 280) = 0;
  if (*(char *)(v23 + 279) < 0)
    operator delete(*a16);
  *(_QWORD *)(v23 + 192) = v30;
  *(_QWORD *)(v23 + 224) = 0;
  if (*(char *)(v23 + 223) < 0)
    operator delete(*a17);
  *(_QWORD *)(v23 + 136) = off_1E83E43A8;
  *(_QWORD *)(v23 + 168) = 0;
  if (*(char *)(v23 + 167) < 0)
    operator delete(*(void **)(v23 + 144));
  *(_QWORD *)(v23 + 80) = off_1E83E43A8;
  *(_QWORD *)(v23 + 112) = 0;
  if (*(char *)(v23 + 111) < 0)
    operator delete(*(void **)(v23 + 88));
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>>>::destroy(*(_QWORD **)(v23 + 48));
  if (*(char *)(v23 + 23) < 0)
    operator delete(*(void **)v23);
  _Unwind_Resume(a1);
}

void sub_1CA1D92D8()
{
  JUMPOUT(0x1CA1D9120);
}

void sub_1CA1D92E0()
{
  JUMPOUT(0x1CA1D9138);
}

void sub_1CA1D92E8()
{
  JUMPOUT(0x1CA1D9150);
}

void sub_1CA1D92F0()
{
  JUMPOUT(0x1CA1D9168);
}

void sub_1CA1D92F8()
{
  JUMPOUT(0x1CA1D9180);
}

void sub_1CA1D9300()
{
  JUMPOUT(0x1CA1D919CLL);
}

void sub_1CA1D9308()
{
  JUMPOUT(0x1CA1D91B8);
}

void sub_1CA1D9310()
{
  JUMPOUT(0x1CA1D91D4);
}

void sub_1CA1D9318()
{
  JUMPOUT(0x1CA1D91F0);
}

void sub_1CA1D9320()
{
  JUMPOUT(0x1CA1D920CLL);
}

void sub_1CA1D9328()
{
  JUMPOUT(0x1CA1D9228);
}

void sub_1CA1D9330()
{
  JUMPOUT(0x1CA1D9240);
}

void sub_1CA1D9338()
{
  JUMPOUT(0x1CA1D925CLL);
}

void sub_1CA1D9340()
{
  JUMPOUT(0x1CA1D9278);
}

void sub_1CA1D9348()
{
  JUMPOUT(0x1CA1D9298);
}

void sub_1CA1D9350()
{
  JUMPOUT(0x1CA1D92B8);
}

void degas::Database::TransactionChanges::~TransactionChanges(degas::Database::TransactionChanges *this)
{
  void **v2;

  v2 = (void **)((char *)this + 256);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v2);
  v2 = (void **)((char *)this + 208);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v2);
  v2 = (void **)((char *)this + 160);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v2);
  v2 = (void **)((char *)this + 112);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v2);
  v2 = (void **)((char *)this + 64);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v2);
  v2 = (void **)((char *)this + 16);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v2);
}

void degas::Database::~Database(void **this)
{
  void **v2;

  degas::Database::close((degas::Database *)this);
  v2 = this + 208;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v2);
  v2 = this + 202;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v2);
  v2 = this + 196;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v2);
  v2 = this + 190;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v2);
  v2 = this + 184;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v2);
  v2 = this + 178;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v2);
  v2 = this + 172;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v2);
  std::shared_ptr<degas::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)(this + 167));
  if (*((char *)this + 1327) < 0)
    operator delete(this[163]);
  if (*((char *)this + 1271) < 0)
    operator delete(this[156]);
  if (*((char *)this + 1239) < 0)
    operator delete(this[152]);
  this[143] = off_1E83E43A8;
  this[147] = 0;
  if (*((char *)this + 1175) < 0)
    operator delete(this[144]);
  this[136] = off_1E83E43A8;
  this[140] = 0;
  if (*((char *)this + 1119) < 0)
    operator delete(this[137]);
  this[129] = off_1E83E43A8;
  this[133] = 0;
  if (*((char *)this + 1063) < 0)
    operator delete(this[130]);
  this[122] = off_1E83E43A8;
  this[126] = 0;
  if (*((char *)this + 1007) < 0)
    operator delete(this[123]);
  this[115] = off_1E83E43A8;
  this[119] = 0;
  if (*((char *)this + 951) < 0)
    operator delete(this[116]);
  this[108] = off_1E83E43A8;
  this[112] = 0;
  if (*((char *)this + 895) < 0)
    operator delete(this[109]);
  this[101] = off_1E83E43A8;
  this[105] = 0;
  if (*((char *)this + 839) < 0)
    operator delete(this[102]);
  this[94] = off_1E83E43A8;
  this[98] = 0;
  if (*((char *)this + 783) < 0)
    operator delete(this[95]);
  this[87] = off_1E83E43A8;
  this[91] = 0;
  if (*((char *)this + 727) < 0)
    operator delete(this[88]);
  this[80] = off_1E83E43A8;
  this[84] = 0;
  if (*((char *)this + 671) < 0)
    operator delete(this[81]);
  this[73] = off_1E83E43A8;
  this[77] = 0;
  if (*((char *)this + 615) < 0)
    operator delete(this[74]);
  this[66] = off_1E83E43A8;
  this[70] = 0;
  if (*((char *)this + 559) < 0)
    operator delete(this[67]);
  this[59] = off_1E83E43A8;
  this[63] = 0;
  if (*((char *)this + 503) < 0)
    operator delete(this[60]);
  this[52] = off_1E83E43A8;
  this[56] = 0;
  if (*((char *)this + 447) < 0)
    operator delete(this[53]);
  this[45] = off_1E83E43A8;
  this[49] = 0;
  if (*((char *)this + 391) < 0)
    operator delete(this[46]);
  this[38] = off_1E83E43A8;
  this[42] = 0;
  if (*((char *)this + 335) < 0)
    operator delete(this[39]);
  this[31] = off_1E83E43A8;
  this[35] = 0;
  if (*((char *)this + 279) < 0)
    operator delete(this[32]);
  this[24] = off_1E83E43A8;
  this[28] = 0;
  if (*((char *)this + 223) < 0)
    operator delete(this[25]);
  this[17] = off_1E83E43A8;
  this[21] = 0;
  if (*((char *)this + 167) < 0)
    operator delete(this[18]);
  this[10] = off_1E83E43A8;
  this[14] = 0;
  if (*((char *)this + 111) < 0)
    operator delete(this[11]);
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>>>::destroy(this[6]);
  if (*((char *)this + 23) < 0)
    operator delete(*this);
}

uint64_t degas::Database::close(degas::Database *this)
{
  degas::Statement *v2;
  degas::Statement *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  sqlite3 *v7;
  degas *v8;
  int pnCkpt[2];
  uint8_t buf[4];
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (degas::Statement *)*((_QWORD *)this + 150);
  if (v2)
  {
    degas::Statement::~Statement(v2);
    MEMORY[0x1CAA4ADC8]();
    *((_QWORD *)this + 150) = 0;
  }
  v3 = (degas::Statement *)*((_QWORD *)this + 151);
  if (v3)
  {
    degas::Statement::~Statement(v3);
    MEMORY[0x1CAA4ADC8]();
    *((_QWORD *)this + 151) = 0;
  }
  degas::StatementCache::purgeAllStatements((os_unfair_lock_s *)this + 10);
  v4 = (std::__shared_weak_count *)*((_QWORD *)this + 168);
  *(_OWORD *)((char *)this + 1336) = 0u;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  v7 = (sqlite3 *)*((_QWORD *)this + 3);
  if (v7)
  {
    if (!*((_BYTE *)this + 32))
    {
      *(_QWORD *)pnCkpt = 0;
      sqlite3_wal_checkpoint_v2(v7, 0, 0, &pnCkpt[1], pnCkpt);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109376;
        v12 = pnCkpt[1];
        v13 = 1024;
        v14 = pnCkpt[0];
        _os_log_debug_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[KGDB] checkpoint on closing, total wal pages %d, checkpointed %d", buf, 0xEu);
      }
      sqlite3_exec(*((sqlite3 **)this + 3), "pragma incremental_vacuum(3)", 0, 0, 0);
      v7 = (sqlite3 *)*((_QWORD *)this + 3);
    }
    v8 = (degas *)sqlite3_close(v7);
    if (degas::sDatabasePathTracking == 1 && *((_BYTE *)this + 1328))
    {
      degas::databaseMap(v8);
      degas::DatabaseMap::deregisterDatabase((uint64_t)&degas::databaseMap(void)::databaseMap, (uint64_t *)this, (uint64_t *)this);
    }
    *((_QWORD *)this + 3) = 0;
    degas::Database::updateTableInstances(this);
  }
  return 0;
}

void degas::databaseMap(degas *this)
{
  unsigned __int8 v1;

  if ((v1 & 1) == 0)
  {
    {
      qword_1EF93ED48 = 0;
      degas::databaseMap(void)::databaseMap = (uint64_t)&qword_1EF93ED48;
      qword_1EF93ED68 = 0;
      qword_1EF93ED60 = 0;
      qword_1EF93ED50 = 0;
      unk_1EF93ED58 = &qword_1EF93ED60;
      dword_1EF93ED70 = 0;
      __cxa_atexit((void (*)(void *))degas::DatabaseMap::~DatabaseMap, &degas::databaseMap(void)::databaseMap, &dword_1CA0A5000);
    }
  }
}

_QWORD *degas::Database::updateTableInstances(_QWORD *this)
{
  uint64_t v1;

  v1 = this[3];
  this[14] = v1;
  this[21] = v1;
  this[28] = v1;
  this[35] = v1;
  this[42] = v1;
  this[49] = v1;
  this[56] = v1;
  this[63] = v1;
  this[70] = v1;
  this[77] = v1;
  this[84] = v1;
  this[105] = v1;
  this[112] = v1;
  this[119] = v1;
  this[126] = v1;
  this[133] = v1;
  this[140] = v1;
  this[91] = v1;
  this[98] = v1;
  this[155] = v1;
  this[159] = v1;
  this[147] = v1;
  return this;
}

void degas::DatabaseMap::~DatabaseMap(degas::DatabaseMap *this)
{
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(*((_QWORD **)this + 4));
  std::__tree<std::__value_type<std::string,degas::Database *>,std::__map_value_compare<std::string,std::__value_type<std::string,degas::Database *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,degas::Database *>>>::destroy(*((char **)this + 1));
}

void std::__tree<std::__value_type<std::string,degas::Database *>,std::__map_value_compare<std::string,std::__value_type<std::string,degas::Database *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,degas::Database *>>>::destroy(char *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,degas::Database *>,std::__map_value_compare<std::string,std::__value_type<std::string,degas::Database *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,degas::Database *>>>::destroy(*(_QWORD *)a1);
    std::__tree<std::__value_type<std::string,degas::Database *>,std::__map_value_compare<std::string,std::__value_type<std::string,degas::Database *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,degas::Database *>>>::destroy(*((_QWORD *)a1 + 1));
    if (a1[55] < 0)
      operator delete(*((void **)a1 + 4));
    operator delete(a1);
  }
}

void degas::Database::setEnableQueryLogging(degas::Database *this)
{
  degas::sQueryLogging = 1;
}

void degas::Database::setEnableQueryProfiling(degas::Database *this)
{
  degas::sQueryProfiling = 1;
}

void degas::Database::setEnableDatabasePathTracking(degas::Database *this)
{
  degas::sDatabasePathTracking = 1;
}

void degas::Database::setEnableInsertLabelTracking(degas::Database *this)
{
  degas::sDatabaseInsertLabelTracking = 1;
}

void degas::Database::setEnableLabelReferenceChecking(degas::Database *this)
{
  degas::sDatabaseLabelReferenceChecking = 1;
}

uint64_t degas::Database::setEnableChangeTracking(uint64_t this)
{
  *(_WORD *)(this + 1356) |= 0x10u;
  return this;
}

uint64_t degas::Database::setDeliberateFail(uint64_t this)
{
  *(_WORD *)(this + 1356) |= 8u;
  return this;
}

uint64_t degas::Database::setEnableLabelElementCache(uint64_t this)
{
  *(_WORD *)(this + 1356) |= 2u;
  return this;
}

uint64_t degas::Database::setDisableLabelElementCache(uint64_t this)
{
  *(_WORD *)(this + 1356) ^= 2u;
  return this;
}

uint64_t degas::Database::setTraceCallback(uint64_t this)
{
  unsigned int v1;

  if ((degas::sQueryProfiling & 1) != 0 || degas::sQueryLogging)
  {
    if (degas::sQueryProfiling)
      v1 = degas::sQueryLogging | 2;
    else
      v1 = degas::sQueryLogging;
    return sqlite3_trace_v2(*(sqlite3 **)(this + 24), v1, (int (__cdecl *)(unsigned int, void *, void *, void *))degas::degasTraceHandler, 0);
  }
  return this;
}

uint64_t degas::degasTraceHandler(degas *this, unsigned int a2, sqlite3_stmt *pStmt, uint64_t *a4, void *a5)
{
  uint64_t v6;
  char *v7;
  int v9;
  double v10;
  __int16 v11;
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((_DWORD)this == 2)
  {
    v6 = *a4;
    v7 = sqlite3_expanded_sql(pStmt);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v9 = 134218242;
      v10 = (double)v6 * 0.000000001;
      v11 = 2080;
      v12 = v7;
      _os_log_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "timing:%lfs  sql:%s", (uint8_t *)&v9, 0x16u);
    }
    sqlite3_free(v7);
  }
  else if ((_DWORD)this == 1 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v9 = 136315138;
    v10 = *(double *)&a4;
    _os_log_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "sql:%s", (uint8_t *)&v9, 0xCu);
  }
  return 0;
}

void degas::Database::setDataProtectionClass(uint64_t a1, int a2)
{
  uint8_t v4[16];

  if (*(_QWORD *)(a1 + 24) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "trying to set data protection class after database is open - that isn't going to work", v4, 2u);
  }
  *(_DWORD *)(a1 + 1352) = a2;
}

uint64_t degas::Database::isReadOnly(degas::Database *this)
{
  return *((unsigned __int8 *)this + 32);
}

uint64_t degas::Database::openReadOnly(std::string::size_type a1, std::string::size_type a2)
{
  std::string::size_type v2;
  unsigned int v4;
  unsigned int v5;
  int v6;
  uint64_t collation;
  const char *v8;
  sqlite3 **v9;
  degas *v10;
  int v11;
  int v12;
  uint64_t DatabaseHealth;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  __int128 v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  int AggregateFunctions;
  NSObject *v23;
  const char *v24;
  uint8_t *v25;
  BOOL v26;
  uint8_t v27[4];
  uint8_t *v28;
  uint8_t buf[8];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v2 = a2;
  v32 = *MEMORY[0x1E0C80C00];
  v4 = *(_DWORD *)(a1 + 1352);
  if (*(char *)(a2 + 23) < 0)
    a2 = *(_QWORD *)a2;
  if (kgWaitForProtectedAccess(v4, (const char *)a2) != 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failed to get data protected access to graph database file", buf, 2u);
    }
    return 3;
  }
  v5 = *(_DWORD *)(a1 + 1352) - 1;
  if (v5 > 2)
    v6 = 1048577;
  else
    v6 = dword_1CA1FF5D4[v5];
  std::string::operator=((std::string *)a1, (const std::string *)v2);
  *(_BYTE *)(a1 + 32) = 1;
  if (*(char *)(v2 + 23) >= 0)
    v8 = (const char *)v2;
  else
    v8 = *(const char **)v2;
  v9 = (sqlite3 **)(a1 + 24);
  v10 = (degas *)sqlite3_open_v2(v8, (sqlite3 **)(a1 + 24), v6, 0);
  if ((_DWORD)v10)
  {
    collation = 3;
LABEL_37:
    if (*v9)
      degas::Database::close((degas::Database *)a1);
    return collation;
  }
  if (degas::sDatabasePathTracking == 1)
  {
    degas::databaseMap(v10);
    degas::DatabaseMap::registerDatabase((_QWORD **)&degas::databaseMap(void)::databaseMap, v2, a1);
    *(_BYTE *)(a1 + 1328) = 1;
  }
  sqlite3_extended_result_codes(*(sqlite3 **)(a1 + 24), 1);
  sqlite3_busy_handler(*(sqlite3 **)(a1 + 24), (int (__cdecl *)(void *, int))degas::busyHandler, 0);
  degas::Database::setTraceCallback(a1);
  degas::Database::updateTableInstances((_QWORD *)a1);
  degas::Database::beginTransaction((sqlite3 **)a1);
  if (!degas::Database::checkSchema((degas::Database *)a1, 0))
    goto LABEL_28;
  *(_QWORD *)buf = 0;
  v11 = degas::Database::metadataValue((degas::Database *)a1, 3, (sqlite3_int64 *)buf);
  if (v11)
  {
    if ((v11 & 1) != 0)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
LABEL_21:
        collation = 10;
        goto LABEL_29;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = 1;
      v23 = MEMORY[0x1E0C81028];
      v24 = "failed to read database format version, unable to open rc=%d";
LABEL_51:
      _os_log_error_impl(&dword_1CA0A5000, v23, OS_LOG_TYPE_ERROR, v24, buf, 8u);
      goto LABEL_21;
    }
  }
  else
  {
    v12 = *(_DWORD *)buf;
    if (*(_DWORD *)buf)
      goto LABEL_24;
  }
  v12 = *(_DWORD *)(a1 + 1296);
  if (v12 == 2)
  {
LABEL_28:
    collation = 4;
    goto LABEL_29;
  }
LABEL_24:
  if (v12 != 8)
    goto LABEL_28;
  v26 = 0;
  *(_QWORD *)buf = 0;
  v30 = 0;
  v31 = 0;
  DatabaseHealth = degas::Database::getDatabaseHealth((degas::Database *)a1, &v26, (uint64_t)buf);
  if (v26)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v25 = buf;
      if (v31 < 0)
        v25 = *(uint8_t **)buf;
      *(_DWORD *)v27 = 136315138;
      v28 = v25;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "not opening graph database for read due to fatal problem: %s", v27, 0xCu);
    }
    collation = 9;
  }
  else
  {
    collation = DatabaseHealth;
  }
  if (SHIBYTE(v31) < 0)
    operator delete(*(void **)buf);
  if (!(_DWORD)collation)
  {
    AggregateFunctions = degas::Database::createAggregateFunctions((sqlite3 **)a1);
    if (AggregateFunctions)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = AggregateFunctions;
      v23 = MEMORY[0x1E0C81028];
      v24 = "failed to create sqlite functions and aggregates, unable to open rc=%d";
      goto LABEL_51;
    }
    collation = sqlite3_create_collation(*v9, "nocasenodiacritics", 1, 0, (int (__cdecl *)(void *, int, const void *, int, const void *))degas::noCaseNoDiacriticsCollation);
    if ((_DWORD)collation)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = collation;
      v23 = MEMORY[0x1E0C81028];
      v24 = "failed to add collations, unable to open rc=%d";
      goto LABEL_51;
    }
  }
LABEL_29:
  degas::Database::commitTransaction((degas::Database *)a1);
  if ((*(_WORD *)(a1 + 1356) & 2) != 0)
  {
    v15 = operator new();
    degas::LabelIndex_Snapshot::LabelIndex_Snapshot(v15, v2, a1 + 80);
    v16 = (_QWORD *)operator new();
    *v16 = &off_1E83E6018;
    v16[1] = 0;
    v16[2] = 0;
    v16[3] = v15;
    *(_QWORD *)&v17 = v15;
    *((_QWORD *)&v17 + 1) = v16;
    v18 = *(std::__shared_weak_count **)(a1 + 1344);
    *(_OWORD *)(a1 + 1336) = v17;
    if (v18)
    {
      p_shared_owners = (unint64_t *)&v18->__shared_owners_;
      do
        v20 = __ldaxr(p_shared_owners);
      while (__stlxr(v20 - 1, p_shared_owners));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }
  else
  {
    v14 = (_QWORD *)operator new();
    *v14 = &off_1E83E2A28;
    v14[1] = a1 + 80;
    std::shared_ptr<degas::LabelIndex>::reset[abi:ne180100]<degas::LabelIndex_Immediate,void>(a1 + 1336, (uint64_t)v14);
  }
  if ((_DWORD)collation)
    goto LABEL_37;
  return collation;
}

void sub_1CA1DA108(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t degas::busyHandler(degas *this, void *a2)
{
  uint64_t v2;

  if ((int)a2 > 19)
    return 0;
  v2 = 1;
  usleep((_DWORD)a2 + (1 << (char)a2) + 1);
  return v2;
}

uint64_t degas::Database::beginTransaction(sqlite3 **this)
{
  sqlite3_stmt **v2;
  uint64_t v3;
  sqlite3 *v4;
  const char *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (sqlite3_stmt **)degas::Database::beginStatement((degas::Database *)this);
  v3 = degas::Statement::update(v2);
  if ((_DWORD)v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = sqlite3_errmsg(this[3]);
    v7 = 136315138;
    v8 = v6;
    _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "begin failed: %s", (uint8_t *)&v7, 0xCu);
  }
  v4 = this[167];
  if (v4)
    (*(void (**)(sqlite3 *))(*(_QWORD *)v4 + 48))(v4);
  return v3;
}

BOOL degas::Database::checkSchema(degas::Database *this, int a2)
{
  _BOOL8 result;
  int v5;
  _BOOL4 v6;
  _BOOL4 v7;
  int Table;
  int v9;
  _BOOL4 v10;
  int v11;
  int v12;
  int v13;
  degas::EdgeTable *v14;
  degas::AttributeValueTable *v15;
  int v16;
  degas::TransactionLogTable *v17;
  degas::NodeTable *v18;
  degas::AttributeValueTable *v19;
  int v20;
  int v21;
  void *__p[2];
  char v23;

  if (*((_BYTE *)this + 32) && (a2 & 1) != 0)
    return 0;
  v5 = a2 ^ 1;
  v6 = degas::Table::checkTableExists((degas::Database *)((char *)this + 80));
  v7 = v6;
  if (((v6 | v5) & 1) != 0)
  {
    Table = 0;
    v9 = v6 | a2;
  }
  else
  {
    Table = degas::LabelTable::createTable((degas::Database *)((char *)this + 80));
    v9 = a2;
  }
  result = 0;
  if (v9 && !Table)
  {
    v10 = degas::Table::checkTableExists((degas::Database *)((char *)this + 136));
    if (((v10 | v5) & 1) != 0)
    {
      v11 = v10;
      v12 = 0;
      v13 = !v7 || !v10;
    }
    else
    {
      v12 = degas::MetadataTable::createTable((degas::Database *)((char *)this + 136));
      v11 = 1;
      v13 = 1;
    }
    result = 0;
    if (v11)
    {
      if (!v12)
      {
        if ((*((_WORD *)this + 678) & 8) != 0)
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "simulated failure");
          degas::Database::setDatabaseFatalProblem((uint64_t)this, (uint64_t *)__p);
          if (v23 < 0)
            operator delete(__p[0]);
          return 0;
        }
        if (degas::Table::checkTableExists((degas::Database *)((char *)this + 192)))
        {
          v14 = (degas::Database *)((char *)this + 248);
          if (degas::Table::checkTableExists((degas::Database *)((char *)this + 248)))
            goto LABEL_27;
          if (!a2)
            return 0;
        }
        else
        {
          if (!a2 || degas::NodeTable::createTable((degas::Database *)((char *)this + 192)))
            return 0;
          v14 = (degas::Database *)((char *)this + 248);
          if (degas::Table::checkTableExists((degas::Database *)((char *)this + 248)))
          {
LABEL_26:
            v13 = 1;
LABEL_27:
            if (degas::Table::checkTableExists((degas::Database *)((char *)this + 304)))
            {
              v15 = (degas::Database *)((char *)this + 360);
              if (degas::Table::checkTableExists((degas::Database *)((char *)this + 360)))
              {
LABEL_29:
                v16 = 0;
                goto LABEL_30;
              }
              if (!a2)
                return 0;
            }
            else
            {
              if (!a2 || degas::AttributeTable::createTable((degas::Database *)((char *)this + 304)))
                return 0;
              v15 = (degas::Database *)((char *)this + 360);
              v13 = 1;
              if (degas::Table::checkTableExists((degas::Database *)((char *)this + 360)))
                goto LABEL_29;
            }
            if (degas::AttributeValueTable::createTable(v15))
              return 0;
            v16 = 1;
LABEL_30:
            if (degas::Table::checkTableExists((degas::Database *)((char *)this + 416)))
            {
              v17 = (degas::Database *)((char *)this + 696);
              if (degas::Table::checkTableExists((degas::Database *)((char *)this + 696)))
                goto LABEL_45;
              if (!a2)
                return 0;
            }
            else
            {
              if (!a2 || degas::AttributeValueTable::createTable((degas::Database *)((char *)this + 416)))
                return 0;
              v17 = (degas::Database *)((char *)this + 696);
              v16 = 1;
              if (degas::Table::checkTableExists((degas::Database *)((char *)this + 696)))
                goto LABEL_45;
            }
            if (degas::TransactionLogTable::createTable(v17))
              return 0;
LABEL_45:
            if (degas::Table::checkTableExists((degas::Database *)((char *)this + 752)))
            {
              v18 = (degas::Database *)((char *)this + 808);
              if (degas::Table::checkTableExists((degas::Database *)((char *)this + 808)))
                goto LABEL_53;
              if (!a2)
                return 0;
            }
            else
            {
              if (!a2 || degas::ClientLogTable::createTable((degas::Database *)((char *)this + 752)))
                return 0;
              v18 = (degas::Database *)((char *)this + 808);
              if (degas::Table::checkTableExists((degas::Database *)((char *)this + 808)))
                goto LABEL_53;
            }
            if (degas::NodeTable::createTable(v18))
              return 0;
LABEL_53:
            if (degas::Table::checkTableExists((degas::Database *)((char *)this + 864)))
            {
              v19 = (degas::Database *)((char *)this + 920);
              if (!degas::Table::checkTableExists((degas::Database *)((char *)this + 920)))
              {
                if (!a2)
                  return 0;
                goto LABEL_60;
              }
            }
            else
            {
              if (!a2 || degas::EdgeTable::createTable((degas::Database *)((char *)this + 864)))
                return 0;
              v19 = (degas::Database *)((char *)this + 920);
              if (!degas::Table::checkTableExists((degas::Database *)((char *)this + 920)))
              {
LABEL_60:
                if (degas::AttributeValueTable::createTable(v19))
                  return 0;
              }
            }
            if (degas::Table::checkTableExists((degas::Database *)((char *)this + 976))
              || a2 && !degas::AttributeValueTable::createTable((degas::Database *)((char *)this + 976)))
            {
              if (v16)
                v20 = 1;
              else
                v20 = 2;
              if (v13)
                v20 = 0;
              *((_DWORD *)this + 324) = v20;
              v21 = degas::BitmapTable::createTable((degas::Database *)((char *)this + 1216));
              result = 0;
              if (!v21)
                return degas::ArrayTable::createTable((degas::Database *)((char *)this + 1248)) == 0;
              return result;
            }
            return 0;
          }
        }
        if (degas::EdgeTable::createTable(v14))
          return 0;
        goto LABEL_26;
      }
    }
  }
  return result;
}

void sub_1CA1DA5A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t degas::Database::metadataValue(degas::Database *this, sqlite3_int64 a2, sqlite3_int64 *a3)
{
  sqlite3_int64 v4;
  uint64_t v5;
  degas::Statement *v7[2];

  degas::MetadataCursor::MetadataCursor((degas::MetadataCursor *)v7, a2, (degas::Database *)((char *)this + 136));
  if (degas::Statement::next((sqlite3_stmt **)v7[0]) == 1)
  {
    v4 = sqlite3_column_int64(*(sqlite3_stmt **)v7[0], 1);
    v5 = 0;
  }
  else
  {
    v4 = 0;
    v5 = 2;
  }
  *a3 = v4;
  degas::Cursor::~Cursor(v7);
  return v5;
}

void sub_1CA1DA62C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::getDatabaseHealth(degas::Database *a1, BOOL *a2, uint64_t a3)
{
  int v6;
  BOOL v7;
  uint64_t result;
  unint64_t v9;

  v9 = 0;
  v6 = degas::Database::metadataValue(a1, 4, (sqlite3_int64 *)&v9);
  if (v6 == 2)
  {
    result = 0;
    *a2 = 0;
  }
  else if (v6)
  {
    return 1;
  }
  else
  {
    v7 = v9 == 1;
    *a2 = v9 == 1;
    if (v7)
      return degas::Database::metadataValue((uint64_t)a1, 5, a3);
    else
      return 0;
  }
  return result;
}

uint64_t degas::Database::createAggregateFunctions(sqlite3 **this)
{
  uint64_t result;
  sqlite3 *v3;

  result = sqlite3_create_function(this[3], "literalBitmapUnion", 1, 1, 0, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))degas::literalBitmapUnionStep, (void (__cdecl *)(sqlite3_context *))degas::literalBitmapUnionFinal);
  if (!(_DWORD)result)
  {
    result = sqlite3_create_function(this[3], "literalBitmapIntersection", 1, 1, 0, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))degas::literalBitmapIntersectionStep, (void (__cdecl *)(sqlite3_context *))degas::literalBitmapIntersectionFinal);
    if (!(_DWORD)result)
    {
      result = sqlite3_create_function(this[3], "mergeLiteralBitmap", 1, 1, 0, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))degas::mergeLiteralBitmapStep, (void (__cdecl *)(sqlite3_context *))degas::mergeLiteralBitmapFinal);
      if (!(_DWORD)result)
        return degas::createBitmapFunctions(this[3], v3);
    }
  }
  return result;
}

CFComparisonResult degas::noCaseNoDiacriticsCollation(degas *this, void *a2, UInt8 *bytes, const void *a4, const UInt8 *a5, const void *a6)
{
  int v7;
  const __CFAllocator *v8;
  const __CFString *v9;
  const __CFString *v10;
  CFComparisonResult v11;

  v7 = (int)a4;
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v9 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], bytes, (int)a2, 0x8000100u, 0);
  v10 = CFStringCreateWithBytes(v8, a5, v7, 0x8000100u, 0);
  v11 = CFStringCompare(v9, v10, 0x191uLL);
  CFRelease(v9);
  CFRelease(v10);
  return v11;
}

uint64_t degas::Database::commitTransaction(degas::Database *this)
{
  uint64_t v2;
  int v3;
  sqlite3_int64 v4;
  BOOL v5;
  BOOL v6;
  uint64_t v7;
  uint64_t i;
  sqlite3_stmt **v9;
  unsigned int v10;
  const char *v12;
  const char *v13;
  const char *v14;
  degas::Statement *v15[2];
  uint8_t v16[4];
  const char *v17;
  uint8_t buf[16];
  _BYTE v19[40];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((*((_WORD *)this + 678) & 0x10) != 0
    && (*((_QWORD *)this + 172) != *((_QWORD *)this + 173)
     || *((_QWORD *)this + 178) != *((_QWORD *)this + 179)
     || *((_QWORD *)this + 184) != *((_QWORD *)this + 185)
     || *((_QWORD *)this + 196) != *((_QWORD *)this + 197)
     || *((_QWORD *)this + 202) != *((_QWORD *)this + 203)
     || *((_QWORD *)this + 190) != *((_QWORD *)this + 191)))
  {
    if (degas::TransactionLogTable::insert((degas::Database *)((char *)this + 696), (sqlite3_int64 *)v15, (degas::Database *)((char *)this + 1360), (degas::Database *)((char *)this + 1408), (degas::Database *)((char *)this + 1456), (degas::Database *)((char *)this + 1504), (degas::Database *)((char *)this + 1552), (degas::Database *)((char *)this + 1600))&& os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v13 = sqlite3_errmsg(*((sqlite3 **)this + 3));
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v13;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "logging of changes failed: %s", buf, 0xCu);
    }
    degas::Database::TransactionChanges::clear((degas::Database *)((char *)this + 1360));
  }
  v2 = *((_QWORD *)this + 167);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 56))(v2);
  if (degas::sDatabaseInsertLabelTracking == 1 && degas::Bitmap::count((degas::Database *)((char *)this + 1648)))
  {
    *(_OWORD *)buf = 0u;
    memset(v19, 0, 25);
    degas::LabelCursor::LabelCursor((degas::LabelCursor *)v15, (Bitmap *)((char *)this + 1648), (degas::Database *)((char *)this + 80));
    while (1)
    {
      v3 = degas::Statement::next((sqlite3_stmt **)v15[0]);
      if (v3 != 1)
        break;
      v4 = sqlite3_column_int64(*(sqlite3_stmt **)v15[0], 0);
      degas::Bitmap::setBit((degas::Bitmap *)buf, v4);
    }
    if (v3 != 2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v14 = sqlite3_errmsg(*((sqlite3 **)this + 3));
      *(_DWORD *)v16 = 136315138;
      v17 = v14;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "checking for missing labels failed: %s", v16, 0xCu);
    }
    v6 = degas::Bitmap::operator==((uint64_t)buf, (uint64_t)this + 1648);
    if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_fault_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "missing labels on insert commit", v16, 2u);
    }
    v5 = !v6;
    *((_QWORD *)this + 206) = 0;
    *((_QWORD *)this + 207) = 0;
    v7 = *((_QWORD *)this + 209);
    for (i = *((_QWORD *)this + 208); v7 != i; v7 -= 16)
    {
      degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(v7 - 16));
      *(_QWORD *)(v7 - 8) = 0;
    }
    *((_QWORD *)this + 209) = i;
    degas::Cursor::~Cursor(v15);
    v15[0] = (degas::Statement *)v19;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v15);
  }
  else
  {
    v5 = 0;
  }
  v9 = (sqlite3_stmt **)degas::Database::commitStatement(this);
  v10 = degas::Statement::update(v9);
  if (v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = sqlite3_errmsg(*((sqlite3 **)this + 3));
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v12;
    _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "commit failed: %s", buf, 0xCu);
  }
  if (v5 && v10 == 0)
    return 3;
  else
    return v10;
}

void sub_1CA1DABAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t *a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15)
{
  degas::Cursor::~Cursor((degas::Statement **)&a9);
  a9 = &a15;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&a9);
  _Unwind_Resume(a1);
}

void std::shared_ptr<degas::LabelIndex>::reset[abi:ne180100]<degas::LabelIndex_Immediate,void>(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  __int128 v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;

  v4 = (_QWORD *)operator new();
  *v4 = &off_1E83E6068;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  *(_QWORD *)&v5 = a2;
  *((_QWORD *)&v5 + 1) = v4;
  v6 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v5;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_1CA1DAC7C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<degas::LabelIndex_Immediate *,std::shared_ptr<degas::LabelIndex>::__shared_ptr_default_delete<degas::LabelIndex,degas::LabelIndex_Immediate>,std::allocator<degas::LabelIndex_Immediate>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1CAA4ADC8);
}

uint64_t std::__shared_ptr_pointer<degas::LabelIndex_Immediate *,std::shared_ptr<degas::LabelIndex>::__shared_ptr_default_delete<degas::LabelIndex,degas::LabelIndex_Immediate>,std::allocator<degas::LabelIndex_Immediate>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<degas::LabelIndex_Immediate *,std::shared_ptr<degas::LabelIndex>::__shared_ptr_default_delete<degas::LabelIndex,degas::LabelIndex_Immediate>,std::allocator<degas::LabelIndex_Immediate>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), 0x80000001CA1FF43DLL))
    return a1 + 24;
  else
    return 0;
}

void std::__shared_ptr_pointer<degas::LabelIndex_Snapshot *,std::shared_ptr<degas::LabelIndex>::__shared_ptr_default_delete<degas::LabelIndex,degas::LabelIndex_Snapshot>,std::allocator<degas::LabelIndex_Snapshot>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1CAA4ADC8);
}

uint64_t std::__shared_ptr_pointer<degas::LabelIndex_Snapshot *,std::shared_ptr<degas::LabelIndex>::__shared_ptr_default_delete<degas::LabelIndex,degas::LabelIndex_Snapshot>,std::allocator<degas::LabelIndex_Snapshot>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<degas::LabelIndex_Snapshot *,std::shared_ptr<degas::LabelIndex>::__shared_ptr_default_delete<degas::LabelIndex,degas::LabelIndex_Snapshot>,std::allocator<degas::LabelIndex_Snapshot>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), 0x80000001CA1FF33BLL))
    return a1 + 24;
  else
    return 0;
}

void degas::Database::TransactionChanges::clear(degas::Database::TransactionChanges *this)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  uint64_t j;
  uint64_t v6;
  uint64_t k;
  uint64_t v8;
  uint64_t m;
  uint64_t v10;
  uint64_t n;
  uint64_t v12;
  uint64_t ii;

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  v2 = *((_QWORD *)this + 2);
  for (i = *((_QWORD *)this + 3); i != v2; i -= 16)
  {
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(i - 16));
    *(_QWORD *)(i - 8) = 0;
  }
  *((_QWORD *)this + 3) = v2;
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = 0;
  v4 = *((_QWORD *)this + 8);
  for (j = *((_QWORD *)this + 9); j != v4; j -= 16)
  {
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(j - 16));
    *(_QWORD *)(j - 8) = 0;
  }
  *((_QWORD *)this + 9) = v4;
  *((_QWORD *)this + 12) = 0;
  *((_QWORD *)this + 13) = 0;
  v6 = *((_QWORD *)this + 14);
  for (k = *((_QWORD *)this + 15); k != v6; k -= 16)
  {
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(k - 16));
    *(_QWORD *)(k - 8) = 0;
  }
  *((_QWORD *)this + 15) = v6;
  *((_QWORD *)this + 18) = 0;
  *((_QWORD *)this + 19) = 0;
  v8 = *((_QWORD *)this + 20);
  for (m = *((_QWORD *)this + 21); m != v8; m -= 16)
  {
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(m - 16));
    *(_QWORD *)(m - 8) = 0;
  }
  *((_QWORD *)this + 21) = v8;
  *((_QWORD *)this + 24) = 0;
  *((_QWORD *)this + 25) = 0;
  v10 = *((_QWORD *)this + 26);
  for (n = *((_QWORD *)this + 27); n != v10; n -= 16)
  {
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(n - 16));
    *(_QWORD *)(n - 8) = 0;
  }
  *((_QWORD *)this + 27) = v10;
  *((_QWORD *)this + 30) = 0;
  *((_QWORD *)this + 31) = 0;
  v12 = *((_QWORD *)this + 32);
  for (ii = *((_QWORD *)this + 33); ii != v12; ii -= 16)
  {
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(ii - 16));
    *(_QWORD *)(ii - 8) = 0;
  }
  *((_QWORD *)this + 33) = v12;
}

uint64_t degas::Database::commitStatement(degas::Database *this)
{
  sqlite3_stmt **v2;
  sqlite3 *v3;
  void *__p[2];
  char v6;

  v2 = (sqlite3_stmt **)*((_QWORD *)this + 151);
  if (!v2)
  {
    v2 = (sqlite3_stmt **)operator new();
    v3 = (sqlite3 *)*((_QWORD *)this + 3);
    std::string::basic_string[abi:ne180100]<0>(__p, "commit");
    degas::Statement::Statement(v2, v3, (uint64_t)__p);
    *((_QWORD *)this + 151) = v2;
    if (v6 < 0)
    {
      operator delete(__p[0]);
      v2 = (sqlite3_stmt **)*((_QWORD *)this + 151);
    }
  }
  degas::Statement::prepareForUse((degas::Statement *)v2);
  return *((_QWORD *)this + 151);
}

void sub_1CA1DAF80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  if (a15 < 0)
    operator delete(__p);
  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::metadataValue(uint64_t a1, sqlite3_int64 a2, uint64_t a3)
{
  uint64_t v4;
  degas::Statement *v6[2];

  degas::MetadataCursor::MetadataCursor((degas::MetadataCursor *)v6, a2, (const degas::MetadataTable *)(a1 + 136));
  if (degas::Statement::next((sqlite3_stmt **)v6[0]) == 1)
  {
    degas::Statement::stringColumnValue((sqlite3_stmt **)v6[0], 1, a3);
    v4 = 0;
  }
  else
  {
    v4 = 2;
  }
  degas::Cursor::~Cursor(v6);
  return v4;
}

void sub_1CA1DB024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::setDatabaseFatalProblem(uint64_t a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v5;

  if (*(_BYTE *)(a1 + 32))
    return 8;
  v5 = a1 + 136;
  result = degas::MetadataTable::insertOrUpdate((degas::MetadataTable *)(a1 + 136), 4, 1);
  if (!(_DWORD)result)
  {
    if (*(_BYTE *)(a1 + 32))
      return 8;
    return degas::MetadataTable::insertOrUpdate(v5, 5, a2);
  }
  return result;
}

uint64_t degas::Database::beginStatement(degas::Database *this)
{
  sqlite3_stmt **v2;
  sqlite3 *v3;
  void *__p[2];
  char v6;

  v2 = (sqlite3_stmt **)*((_QWORD *)this + 150);
  if (!v2)
  {
    v2 = (sqlite3_stmt **)operator new();
    v3 = (sqlite3 *)*((_QWORD *)this + 3);
    std::string::basic_string[abi:ne180100]<0>(__p, "begin");
    degas::Statement::Statement(v2, v3, (uint64_t)__p);
    *((_QWORD *)this + 150) = v2;
    if (v6 < 0)
    {
      operator delete(__p[0]);
      v2 = (sqlite3_stmt **)*((_QWORD *)this + 150);
    }
  }
  degas::Statement::prepareForUse((degas::Statement *)v2);
  return *((_QWORD *)this + 150);
}

void sub_1CA1DB144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  if (a15 < 0)
    operator delete(__p);
  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::databaseFormatVersion(degas::Database *a1, _DWORD *a2)
{
  uint64_t result;
  unint64_t v4;

  v4 = 0;
  result = degas::Database::metadataValue(a1, 3, (sqlite3_int64 *)&v4);
  if (!(_DWORD)result)
    *a2 = v4;
  return result;
}

uint64_t degas::Database::addCollations(sqlite3 **this)
{
  return sqlite3_create_collation(this[3], "nocasenodiacritics", 1, 0, (int (__cdecl *)(void *, int, const void *, int, const void *))degas::noCaseNoDiacriticsCollation);
}

uint64_t degas::Database::openWrite(std::string::size_type a1, std::string::size_type a2)
{
  std::string::size_type v2;
  unsigned int v4;
  unsigned int v5;
  int v6;
  uint64_t collation;
  const char *v8;
  sqlite3 **v9;
  degas *v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t DatabaseHealth;
  int AggregateFunctions;
  BOOL v16;
  _QWORD *v17;
  uint64_t v18;
  uint8_t *v20;
  BOOL v21;
  uint8_t v22[4];
  uint8_t *v23;
  uint8_t buf[8];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = a2;
  v27 = *MEMORY[0x1E0C80C00];
  v4 = *(_DWORD *)(a1 + 1352);
  if (*(char *)(a2 + 23) < 0)
    a2 = *(_QWORD *)a2;
  if (kgWaitForProtectedAccess(v4, (const char *)a2) != 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failed to get data protected access to graph database file", buf, 2u);
    }
    return 3;
  }
  v5 = *(_DWORD *)(a1 + 1352) - 1;
  if (v5 > 2)
    v6 = 1048578;
  else
    v6 = dword_1CA1FF5E0[v5];
  std::string::operator=((std::string *)a1, (const std::string *)v2);
  if (*(char *)(v2 + 23) >= 0)
    v8 = (const char *)v2;
  else
    v8 = *(const char **)v2;
  v9 = (sqlite3 **)(a1 + 24);
  v10 = (degas *)sqlite3_open_v2(v8, (sqlite3 **)(a1 + 24), v6, 0);
  if ((_DWORD)v10)
  {
    collation = 3;
LABEL_51:
    if (*v9)
      degas::Database::close((degas::Database *)a1);
    return collation;
  }
  if (degas::sDatabasePathTracking == 1)
  {
    degas::databaseMap(v10);
    degas::DatabaseMap::registerDatabase((_QWORD **)&degas::databaseMap(void)::databaseMap, v2, a1);
    *(_BYTE *)(a1 + 1328) = 1;
  }
  sqlite3_extended_result_codes(*(sqlite3 **)(a1 + 24), 1);
  sqlite3_busy_handler(*(sqlite3 **)(a1 + 24), (int (__cdecl *)(void *, int))degas::busyHandler, 0);
  sqlite3_wal_autocheckpoint(*(sqlite3 **)(a1 + 24), 100);
  degas::Database::setTraceCallback(a1);
  degas::Database::updateTableInstances((_QWORD *)a1);
  degas::Database::beginTransaction((sqlite3 **)a1);
  if (!degas::Database::checkSchema((degas::Database *)a1, 1))
  {
    degas::Database::commitTransaction((degas::Database *)a1);
    collation = 4;
    goto LABEL_47;
  }
  *(_QWORD *)buf = 0;
  v11 = degas::Database::metadataValue((degas::Database *)a1, 3, (sqlite3_int64 *)buf);
  if (!v11)
  {
    v12 = *(_DWORD *)buf;
    if (*(_DWORD *)buf)
      goto LABEL_31;
    goto LABEL_25;
  }
  if ((v11 & 1) == 0)
  {
LABEL_25:
    v12 = *(_DWORD *)(a1 + 1296);
    if (v12)
    {
      if (v12 == 2)
        v12 = 1;
    }
    else
    {
      v12 = 8;
    }
    if (!*(_BYTE *)(a1 + 32))
      degas::MetadataTable::insertOrUpdate((degas::MetadataTable *)(a1 + 136), 3, v12);
LABEL_31:
    if (v12 != 8)
    {
      v13 = *(_QWORD *)(a1 + 24);
      *(_QWORD *)buf = a1;
      v25 = v13;
      if (degas::Migration::migrate((degas::Migration *)buf, v12, 8))
      {
        degas::Database::commitTransaction((degas::Database *)a1);
        collation = 4;
LABEL_46:
        sqlite3_exec(*v9, "pragma incremental_vacuum(5)", 0, 0, 0);
        goto LABEL_47;
      }
    }
    v21 = 0;
    *(_QWORD *)buf = 0;
    v25 = 0;
    v26 = 0;
    DatabaseHealth = degas::Database::getDatabaseHealth((degas::Database *)a1, &v21, (uint64_t)buf);
    if (v21)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v20 = buf;
        if (v26 < 0)
          v20 = *(uint8_t **)buf;
        *(_DWORD *)v22 = 136315138;
        v23 = v20;
        _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "not opening graph database for write due to fatal problem: %s", v22, 0xCu);
      }
      collation = 9;
    }
    else
    {
      collation = DatabaseHealth;
    }
    if (SHIBYTE(v26) < 0)
      operator delete(*(void **)buf);
    if ((_DWORD)collation)
      goto LABEL_44;
    AggregateFunctions = degas::Database::createAggregateFunctions((sqlite3 **)a1);
    if (AggregateFunctions)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        collation = 10;
LABEL_44:
        v16 = v12 == 8;
        degas::Database::commitTransaction((degas::Database *)a1);
        goto LABEL_45;
      }
      v16 = v12 == 8;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = AggregateFunctions;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failed to create sqlite functions and aggregates, unable to open rc=%d", buf, 8u);
      degas::Database::commitTransaction((degas::Database *)a1);
    }
    else
    {
      collation = sqlite3_create_collation(*v9, "nocasenodiacritics", 1, 0, (int (__cdecl *)(void *, int, const void *, int, const void *))degas::noCaseNoDiacriticsCollation);
      if (!(_DWORD)collation)
        goto LABEL_44;
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        collation = 10;
        goto LABEL_44;
      }
      v16 = v12 == 8;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = collation;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failed to add collations, unable to open rc=%d", buf, 8u);
      degas::Database::commitTransaction((degas::Database *)a1);
    }
    collation = 10;
LABEL_45:
    if (v16)
      goto LABEL_47;
    goto LABEL_46;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = 1;
    _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failed to read database format version, unable to open rc=%d", buf, 8u);
  }
  degas::Database::commitTransaction((degas::Database *)a1);
  collation = 10;
LABEL_47:
  if ((*(_WORD *)(a1 + 1356) & 2) != 0)
  {
    v18 = operator new();
    degas::LabelIndex_Transaction::LabelIndex_Transaction(v18, v2, a1 + 80);
    std::shared_ptr<degas::LabelIndex>::reset[abi:ne180100]<degas::LabelIndex_Transaction,void>(a1 + 1336, v18);
  }
  else
  {
    v17 = (_QWORD *)operator new();
    *v17 = &off_1E83E2A28;
    v17[1] = a1 + 80;
    std::shared_ptr<degas::LabelIndex>::reset[abi:ne180100]<degas::LabelIndex_Immediate,void>(a1 + 1336, (uint64_t)v17);
  }
  if ((_DWORD)collation)
    goto LABEL_51;
  return collation;
}

void sub_1CA1DB714(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::shared_ptr<degas::LabelIndex>::reset[abi:ne180100]<degas::LabelIndex_Transaction,void>(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  __int128 v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;

  v4 = (_QWORD *)operator new();
  *v4 = &off_1E83E60B8;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  *(_QWORD *)&v5 = a2;
  *((_QWORD *)&v5 + 1) = v4;
  v6 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v5;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_1CA1DB7EC(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<degas::LabelIndex_Transaction *,std::shared_ptr<degas::LabelIndex>::__shared_ptr_default_delete<degas::LabelIndex,degas::LabelIndex_Transaction>,std::allocator<degas::LabelIndex_Transaction>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1CAA4ADC8);
}

uint64_t std::__shared_ptr_pointer<degas::LabelIndex_Transaction *,std::shared_ptr<degas::LabelIndex>::__shared_ptr_default_delete<degas::LabelIndex,degas::LabelIndex_Transaction>,std::allocator<degas::LabelIndex_Transaction>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<degas::LabelIndex_Transaction *,std::shared_ptr<degas::LabelIndex>::__shared_ptr_default_delete<degas::LabelIndex,degas::LabelIndex_Transaction>,std::allocator<degas::LabelIndex_Transaction>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), 0x80000001CA1FF542))
    return a1 + 24;
  else
    return 0;
}

uint64_t degas::Database::setDatabaseFormatVersion(uint64_t a1, unsigned int a2)
{
  if (*(_BYTE *)(a1 + 32))
    return 8;
  else
    return degas::MetadataTable::insertOrUpdate((degas::MetadataTable *)(a1 + 136), 3, a2);
}

uint64_t degas::Database::openCreate(std::string::size_type a1, std::string::size_type a2)
{
  std::string::size_type v2;
  unsigned int v4;
  unsigned int v5;
  int v6;
  uint64_t collation;
  const char *v8;
  sqlite3 **v9;
  degas *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t DatabaseHealth;
  int AggregateFunctions;
  BOOL v19;
  _QWORD *v20;
  uint64_t v21;
  uint8_t *v23;
  BOOL v24;
  uint8_t v25[4];
  uint8_t *v26;
  uint8_t buf[8];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v2 = a2;
  v30 = *MEMORY[0x1E0C80C00];
  v4 = *(_DWORD *)(a1 + 1352);
  if (*(char *)(a2 + 23) < 0)
    a2 = *(_QWORD *)a2;
  if (kgWaitForProtectedAccess(v4, (const char *)a2) != 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failed to get data protected access to graph database file", buf, 2u);
    }
    return 3;
  }
  v5 = *(_DWORD *)(a1 + 1352) - 1;
  if (v5 > 2)
    v6 = 1048582;
  else
    v6 = dword_1CA1FF5EC[v5];
  std::string::operator=((std::string *)a1, (const std::string *)v2);
  if (*(char *)(v2 + 23) >= 0)
    v8 = (const char *)v2;
  else
    v8 = *(const char **)v2;
  v9 = (sqlite3 **)(a1 + 24);
  v10 = (degas *)sqlite3_open_v2(v8, (sqlite3 **)(a1 + 24), v6, 0);
  if ((_DWORD)v10)
  {
    collation = 3;
LABEL_58:
    if (*v9)
      degas::Database::close((degas::Database *)a1);
    return collation;
  }
  if (degas::sDatabasePathTracking == 1)
  {
    degas::databaseMap(v10);
    degas::DatabaseMap::registerDatabase((_QWORD **)&degas::databaseMap(void)::databaseMap, v2, a1);
    *(_BYTE *)(a1 + 1328) = 1;
  }
  sqlite3_extended_result_codes(*(sqlite3 **)(a1 + 24), 1);
  sqlite3_busy_handler(*(sqlite3 **)(a1 + 24), (int (__cdecl *)(void *, int))degas::busyHandler, 0);
  sqlite3_wal_autocheckpoint(*(sqlite3 **)(a1 + 24), 100);
  degas::Database::setTraceCallback(a1);
  v11 = sqlite3_exec(*(sqlite3 **)(a1 + 24), "pragma journal_mode=WAL;", 0, 0, 0);
  if (v11)
  {
    v12 = v11;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v12;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "setting WAL mode failed, rc=%d, continuing", buf, 8u);
    }
  }
  degas::Database::updateTableInstances((_QWORD *)a1);
  if (!degas::Table::checkTableExists((degas::Table *)(a1 + 80)))
  {
    v13 = sqlite3_exec(*v9, "pragma autovacuum=incremental", 0, 0, 0);
    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v13;
        _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "setting autovacuum mode failed, rc=%d, continuing", buf, 8u);
      }
    }
  }
  degas::Database::beginTransaction((sqlite3 **)a1);
  if (!degas::Database::checkSchema((degas::Database *)a1, 1))
  {
    degas::Database::commitTransaction((degas::Database *)a1);
    collation = 4;
    goto LABEL_54;
  }
  *(_QWORD *)buf = 0;
  v14 = degas::Database::metadataValue((degas::Database *)a1, 3, (sqlite3_int64 *)buf);
  if (!v14)
  {
    v15 = *(_DWORD *)buf;
    if (*(_DWORD *)buf)
      goto LABEL_38;
    goto LABEL_32;
  }
  if ((v14 & 1) == 0)
  {
LABEL_32:
    v15 = *(_DWORD *)(a1 + 1296);
    if (v15)
    {
      if (v15 == 2)
        v15 = 1;
    }
    else
    {
      v15 = 8;
    }
    if (!*(_BYTE *)(a1 + 32))
      degas::MetadataTable::insertOrUpdate((degas::MetadataTable *)(a1 + 136), 3, v15);
LABEL_38:
    if (v15 != 8)
    {
      v16 = *(_QWORD *)(a1 + 24);
      *(_QWORD *)buf = a1;
      v28 = v16;
      if (degas::Migration::migrate((degas::Migration *)buf, v15, 8))
      {
        degas::Database::commitTransaction((degas::Database *)a1);
        collation = 4;
LABEL_53:
        sqlite3_exec(*v9, "pragma incremental_vacuum(5)", 0, 0, 0);
        goto LABEL_54;
      }
    }
    v24 = 0;
    *(_QWORD *)buf = 0;
    v28 = 0;
    v29 = 0;
    DatabaseHealth = degas::Database::getDatabaseHealth((degas::Database *)a1, &v24, (uint64_t)buf);
    if (v24)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v23 = buf;
        if (v29 < 0)
          v23 = *(uint8_t **)buf;
        *(_DWORD *)v25 = 136315138;
        v26 = v23;
        _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "not opening graph database for write/create due to fatal problem: %s", v25, 0xCu);
      }
      collation = 9;
    }
    else
    {
      collation = DatabaseHealth;
    }
    if (SHIBYTE(v29) < 0)
      operator delete(*(void **)buf);
    if ((_DWORD)collation)
      goto LABEL_51;
    AggregateFunctions = degas::Database::createAggregateFunctions((sqlite3 **)a1);
    if (AggregateFunctions)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        collation = 10;
LABEL_51:
        v19 = v15 == 8;
        degas::Database::commitTransaction((degas::Database *)a1);
        goto LABEL_52;
      }
      v19 = v15 == 8;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = AggregateFunctions;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failed to create sqlite functions and aggregates, unable to open rc=%d", buf, 8u);
      degas::Database::commitTransaction((degas::Database *)a1);
    }
    else
    {
      collation = sqlite3_create_collation(*v9, "nocasenodiacritics", 1, 0, (int (__cdecl *)(void *, int, const void *, int, const void *))degas::noCaseNoDiacriticsCollation);
      if (!(_DWORD)collation)
        goto LABEL_51;
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        collation = 10;
        goto LABEL_51;
      }
      v19 = v15 == 8;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = collation;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failed to add collations, unable to open rc=%d", buf, 8u);
      degas::Database::commitTransaction((degas::Database *)a1);
    }
    collation = 10;
LABEL_52:
    if (v19)
      goto LABEL_54;
    goto LABEL_53;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = 1;
    _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failed to read database format version, unable to open rc=%d", buf, 8u);
  }
  degas::Database::commitTransaction((degas::Database *)a1);
  collation = 10;
LABEL_54:
  if ((*(_WORD *)(a1 + 1356) & 2) != 0)
  {
    v21 = operator new();
    degas::LabelIndex_Transaction::LabelIndex_Transaction(v21, v2, a1 + 80);
    std::shared_ptr<degas::LabelIndex>::reset[abi:ne180100]<degas::LabelIndex_Transaction,void>(a1 + 1336, v21);
  }
  else
  {
    v20 = (_QWORD *)operator new();
    *v20 = &off_1E83E2A28;
    v20[1] = a1 + 80;
    std::shared_ptr<degas::LabelIndex>::reset[abi:ne180100]<degas::LabelIndex_Immediate,void>(a1 + 1336, (uint64_t)v20);
  }
  if ((_DWORD)collation)
    goto LABEL_58;
  return collation;
}

void sub_1CA1DBED8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL degas::Database::databaseIsEmpty(degas::Database *this)
{
  return !degas::Table::checkTableExists((degas::Database *)((char *)this + 80));
}

uint64_t degas::Database::truncateDatabase(degas::Database *this)
{
  uint64_t v3;
  int v4;

  if (*((_BYTE *)this + 32))
    return 8;
  v3 = *((_QWORD *)this + 167);
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 72))(v3);
  v4 = 129;
  if (sqlite3_file_control(*((sqlite3 **)this + 3), 0, 101, &v4))
    return 3;
  else
    return 0;
}

uint64_t degas::Database::backupDatabase(uint64_t a1, uint64_t a2)
{
  const char *v4;
  sqlite3_backup *v6;
  sqlite3_backup *v7;
  int v8;
  degas *v9;
  int v10;
  sqlite3 *ppDb;

  ppDb = 0;
  if (*(char *)(a2 + 23) >= 0)
    v4 = (const char *)a2;
  else
    v4 = *(const char **)a2;
  if (sqlite3_open_v2(v4, &ppDb, 6, 0))
    return 3;
  v10 = 129;
  if (sqlite3_file_control(ppDb, 0, 101, &v10))
    return 3;
  sqlite3_busy_handler(ppDb, (int (__cdecl *)(void *, int))degas::busyHandler, 0);
  sqlite3_extended_result_codes(ppDb, 1);
  v6 = sqlite3_backup_init(ppDb, "main", *(sqlite3 **)(a1 + 24), "main");
  if (!v6)
    return 3;
  v7 = v6;
  do
  {
    do
      v8 = sqlite3_backup_step(v7, 100);
    while (!v8);
  }
  while (v8 == 5);
  if (v8 != 101 || sqlite3_backup_finish(v7))
    return 3;
  v9 = (degas *)sqlite3_close(ppDb);
  ppDb = 0;
  degas::indexDirectory(v9);
  degas::LabelIndexDirectory::resetIndexForDatabasePath((os_unfair_lock_s *)&degas::indexDirectory(void)::sIndexDirectory, (_QWORD *)a2);
  return 0;
}

uint64_t degas::Database::copyDatabase(uint64_t a1, _QWORD *a2)
{
  degas *v3;
  int v4;
  uint64_t result;

  v3 = (degas *)_sqlite3_db_copy();
  v4 = (int)v3;
  degas::indexDirectory(v3);
  degas::LabelIndexDirectory::resetIndexForDatabasePath((os_unfair_lock_s *)&degas::indexDirectory(void)::sIndexDirectory, a2);
  result = 3;
  if (v4 > 99)
  {
    if (v4 == 100)
    {
      return 1;
    }
    else if (v4 == 101)
    {
      return 2;
    }
  }
  else if (v4)
  {
    if (v4 == 17)
      return 4;
    else
      return 3;
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t degas::Database::copyDatabaseFromTo(const char *a1, _QWORD *a2)
{
  int v4;
  degas *v5;
  BOOL v6;
  unsigned int v7;
  sqlite3 *ppDb;

  ppDb = 0;
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  if (sqlite3_open_v2(a1, &ppDb, 6, 0))
    return 3;
  v4 = _sqlite3_db_copy();
  v5 = (degas *)sqlite3_close(ppDb);
  degas::indexDirectory(v5);
  degas::LabelIndexDirectory::resetIndexForDatabasePath((os_unfair_lock_s *)&degas::indexDirectory(void)::sIndexDirectory, a2);
  if (v4 > 99)
  {
    if (v4 == 100)
      return 1;
    v6 = v4 == 101;
    v7 = 2;
  }
  else
  {
    if (!v4)
      return 0;
    v6 = v4 == 17;
    v7 = 4;
  }
  if (v6)
    return v7;
  else
    return 3;
}

uint64_t degas::Database::truncateDatabaseAtPath(uint64_t *a1)
{
  _QWORD *v1;
  int v3;
  degas *v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  sqlite3 *ppDb;

  v1 = a1;
  ppDb = 0;
  if (*((char *)a1 + 23) < 0)
    a1 = (uint64_t *)*a1;
  if (sqlite3_open_v2((const char *)a1, &ppDb, 6, 0))
    return 3;
  v8 = 129;
  v3 = sqlite3_file_control(ppDb, 0, 101, &v8);
  v4 = (degas *)sqlite3_close(ppDb);
  degas::indexDirectory(v4);
  degas::LabelIndexDirectory::resetIndexForDatabasePath((os_unfair_lock_s *)&degas::indexDirectory(void)::sIndexDirectory, v1);
  if (v3 == 101)
    v5 = 2;
  else
    v5 = 3;
  if (v3 == 100)
    v6 = 1;
  else
    v6 = v5;
  if (v3 == 17)
    v7 = 4;
  else
    v7 = 3;
  if (!v3)
    v7 = 0;
  if (v3 <= 99)
    return v7;
  else
    return v6;
}

uint64_t degas::Database::isEmptyDatabaseAtPath(const char *a1)
{
  uint64_t v1;
  sqlite3 *v2;
  void *__p[2];
  char v5;
  sqlite3_stmt *ppStmt[3];
  sqlite3 *ppDb;

  ppDb = 0;
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  if (sqlite3_open_v2(a1, &ppDb, 1, 0))
    return 3;
  v2 = ppDb;
  std::string::basic_string[abi:ne180100]<0>(__p, "select * from sqlite_master where type = 'table'");
  degas::Statement::Statement(ppStmt, v2, (uint64_t)__p);
  if (v5 < 0)
    operator delete(__p[0]);
  v1 = degas::Statement::next(ppStmt);
  if ((_DWORD)v1 == 1)
    degas::Statement::finishStatementCursor((degas::Statement *)ppStmt);
  degas::Statement::~Statement((degas::Statement *)ppStmt);
  sqlite3_close(ppDb);
  return v1;
}

void sub_1CA1DC394(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t degas::Database::rollbackTransaction(degas::Database *this)
{
  uint64_t v2;
  sqlite3 *v3;
  uint64_t v4;
  const char *v6;
  sqlite3_stmt *ppStmt[3];
  _BYTE __p[12];
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *((_QWORD *)this + 167);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 64))(v2);
  degas::Database::TransactionChanges::clear((degas::Database *)((char *)this + 1360));
  v3 = (sqlite3 *)*((_QWORD *)this + 3);
  std::string::basic_string[abi:ne180100]<0>(__p, "rollback");
  degas::Statement::Statement(ppStmt, v3, (uint64_t)__p);
  if (v9 < 0)
    operator delete(*(void **)__p);
  v4 = degas::Statement::update(ppStmt);
  if ((_DWORD)v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = sqlite3_errmsg(*((sqlite3 **)this + 3));
    *(_DWORD *)__p = 136315138;
    *(_QWORD *)&__p[4] = v6;
    _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "rollback failed: %s", __p, 0xCu);
  }
  degas::Statement::~Statement((degas::Statement *)ppStmt);
  return v4;
}

void sub_1CA1DC4D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  degas::Statement::~Statement((degas::Statement *)&a10);
  _Unwind_Resume(a1);
}

sqlite3_int64 degas::Database::addLabel(uint64_t a1, uint64_t a2)
{
  sqlite3_int64 v2;
  uint64_t v4;
  char v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  degas::Statement *v10[2];
  sqlite3_int64 v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  sqlite3_int64 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 32))
    return 0;
  v4 = a1 + 80;
  degas::LabelCursor::LabelCursor((uint64_t *)v10, (uint64_t *)a2, a1 + 80);
  v2 = 0;
  v5 = 1;
  v6 = MEMORY[0x1E0C81028];
  while (1)
  {
    v7 = degas::Statement::next((sqlite3_stmt **)v10[0]);
    if (v7 != 1)
      break;
    v2 = sqlite3_column_int64(*(sqlite3_stmt **)v10[0], 0);
    v5 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      if (*(char *)(a2 + 23) >= 0)
        v8 = a2;
      else
        v8 = *(_QWORD *)a2;
      *(_DWORD *)buf = 136446466;
      v13 = v8;
      v14 = 2050;
      v15 = v2;
      _os_log_error_impl(&dword_1CA0A5000, v6, OS_LOG_TYPE_ERROR, "adding a label %{public}s that already exists in database with identifier %{public}llu", buf, 0x16u);
      v5 = 0;
    }
  }
  if (v7 == 2)
  {
    v11 = v2;
    if ((v5 & 1) != 0)
    {
      degas::LabelTable::insert(v4, &v11, (uint64_t *)a2);
      v2 = v11;
    }
  }
  degas::Cursor::~Cursor(v10);
  return v2;
}

void sub_1CA1DC674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::getLabelName(uint64_t a1, sqlite3_int64 a2, uint64_t a3)
{
  uint64_t v4;
  degas::Statement *v6[2];

  degas::LabelCursor::LabelCursor((degas::LabelCursor *)v6, a2, (const degas::LabelTable *)(a1 + 80));
  v4 = 2;
  while (degas::Statement::next((sqlite3_stmt **)v6[0]) == 1)
  {
    degas::Statement::stringColumnValue((sqlite3_stmt **)v6[0], 1, a3);
    v4 = 0;
  }
  degas::Cursor::~Cursor(v6);
  return v4;
}

void sub_1CA1DC6FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::setMetadataValue(uint64_t a1, sqlite3_int64 a2, uint64_t *a3)
{
  if (*(_BYTE *)(a1 + 32))
    return 8;
  else
    return degas::MetadataTable::insertOrUpdate(a1 + 136, a2, a3);
}

uint64_t degas::Database::setMetadataValue(degas::Database *this, sqlite3_int64 a2, sqlite3_int64 a3)
{
  if (*((_BYTE *)this + 32))
    return 8;
  else
    return degas::MetadataTable::insertOrUpdate((degas::Database *)((char *)this + 136), a2, a3);
}

uint64_t degas::Database::verifyLabels(degas::Database *this, const degas::Bitmap *a2)
{
  uint64_t v3;
  uint64_t v4;
  sqlite3_int64 v5;
  void **v7;
  void *__p[2];
  char v9;
  void **v10[5];
  char v11;
  __int128 v12;
  _BYTE v13[32];
  degas::Statement *v14[2];
  uint8_t buf[4];
  void **v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  degas::LabelCursor::LabelCursor((degas::LabelCursor *)v14, (Bitmap *)a2, (degas::Database *)((char *)this + 80));
  v12 = 0u;
  memset(v13, 0, 25);
  while (1)
  {
    v3 = degas::Statement::next((sqlite3_stmt **)v14[0]);
    v4 = v3;
    if ((_DWORD)v3 != 1)
      break;
    v5 = sqlite3_column_int64(*(sqlite3_stmt **)v14[0], 0);
    degas::Bitmap::setBit((degas::Bitmap *)&v12, v5);
  }
  if ((_DWORD)v3 == 2)
  {
    if (degas::Bitmap::operator==((uint64_t)&v12, (uint64_t)a2))
    {
      v4 = 0;
    }
    else
    {
      v10[0] = *(void ***)a2;
      memset(&v10[1], 0, 32);
      std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v10[2], *((__int128 **)a2 + 2), *((__int128 **)a2 + 3), (uint64_t)(*((_QWORD *)a2 + 3) - *((_QWORD *)a2 + 2)) >> 4);
      v11 = *((_BYTE *)a2 + 40);
      degas::Bitmap::diffWith<degas::Bitmap>((degas::Bitmap *)v10, (degas::Bitmap *)&v12);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        degas::Bitmap::description((uint64_t *)__p, (degas::Bitmap *)v10);
        if (v9 >= 0)
          v7 = __p;
        else
          v7 = (void **)__p[0];
        *(_DWORD *)buf = 136315138;
        v16 = v7;
        _os_log_fault_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "element insert refers to non-existent labels:%s", buf, 0xCu);
        if (v9 < 0)
          operator delete(__p[0]);
      }
      __p[0] = &v10[2];
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
      v4 = 7;
    }
  }
  v10[0] = (void **)v13;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v10);
  degas::Cursor::~Cursor(v14);
  return v4;
}

void sub_1CA1DC8F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10, uint64_t a11, uint64_t a12, void **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;

  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a10);
  a13 = (void **)&a21;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a13);
  degas::Cursor::~Cursor((degas::Statement **)(v21 - 64));
  _Unwind_Resume(a1);
}

uint64_t degas::Database::insertNode(degas::Database *this, sqlite3_int64 *a2)
{
  uint64_t v2;
  unint64_t v5;
  BOOL v6;
  uint64_t v8;
  unint64_t v10[3];
  __int128 v11;
  _BYTE v12[32];

  if (*((_BYTE *)this + 32))
    return 8;
  if (degas::sDatabaseLabelReferenceChecking != 1
    || (v2 = degas::Database::verifyLabels(this, (const degas::Bitmap *)(a2 + 1)), !(_DWORD)v2))
  {
    v11 = 0u;
    memset(v12, 0, 25);
    v2 = degas::NodeTable::insert((degas::Database *)((char *)this + 192), a2, (const degas::Bitmap *)(a2 + 1));
    if (!(_DWORD)v2)
    {
      degas::Bitmap::begin(a2 + 1, v10);
      v5 = a2[4];
      while (1)
      {
        v6 = (sqlite3_int64 *)v10[0] == a2 + 1 && v10[1] == -1;
        if (v6 && v10[2] == v5)
          break;
        (*(void (**)(_QWORD))(**((_QWORD **)this + 167) + 80))(*((_QWORD *)this + 167));
        degas::Bitmap::iterator::operator++(v10);
      }
      v8 = *((_QWORD *)this + 160);
      if ((v8 & 0x8000000000000000) == 0)
        *((_QWORD *)this + 160) = v8 + 1;
      if ((*((_WORD *)this + 678) & 0x10) != 0)
        degas::Bitmap::setBit((degas::Database *)((char *)this + 1360), *a2);
      if (degas::sDatabaseInsertLabelTracking == 1)
        degas::Bitmap::unionWith<degas::Bitmap>((degas::Database *)((char *)this + 1648), (uint64_t)(a2 + 1));
    }
    v10[0] = (unint64_t)v12;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v10);
  }
  return v2;
}

void sub_1CA1DCA70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  a10 = (void **)&a15;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::updateNodeEdges(degas::Database *this, unint64_t a2, const degas::Bitmap *a3, const degas::Bitmap *a4, const degas::Bitmap *a5, const degas::Bitmap *a6)
{
  uint64_t v6;
  __int128 v14;
  _BYTE v15[32];
  __int128 v16;
  _BYTE v17[40];
  degas::Statement *v18[2];
  void **v19;
  uint8_t buf[16];
  _BYTE v21[40];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (*((_BYTE *)this + 32))
    return 8;
  degas::NodeCursor::NodeCursor(v18);
  degas::NodeCursor::setForIdentifier((degas::NodeCursor *)v18, a2, (degas::Database *)((char *)this + 192));
  if (degas::Statement::next((sqlite3_stmt **)v18[0]) != 1)
    goto LABEL_23;
  *(_OWORD *)buf = 0u;
  memset(v21, 0, 25);
  v16 = 0u;
  memset(v17, 0, 25);
  v14 = 0u;
  memset(v15, 0, 25);
  degas::Statement::bitmapColumnValue((sqlite3_stmt **)v18[0], 2, (degas::Bitmap *)buf);
  degas::Statement::bitmapColumnValue((sqlite3_stmt **)v18[0], 3, (degas::Bitmap *)&v16);
  if (*((_QWORD *)a3 + 2) != *((_QWORD *)a3 + 3))
    degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)buf, (uint64_t)a3);
  if (*((_QWORD *)a4 + 2) != *((_QWORD *)a4 + 3))
    degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)&v16, (uint64_t)a4);
  if (*((_QWORD *)a5 + 2) != *((_QWORD *)a5 + 3))
    degas::Bitmap::diffWith<degas::Bitmap>((degas::Bitmap *)buf, a5);
  if (*((_QWORD *)a6 + 2) != *((_QWORD *)a6 + 3))
    degas::Bitmap::diffWith<degas::Bitmap>((degas::Bitmap *)&v16, a6);
  v6 = degas::NodeTable::update((degas::Database *)((char *)this + 192), a2, (const degas::Bitmap *)buf, (const degas::Bitmap *)&v16);
  if (!(_DWORD)v6 && (*((_WORD *)this + 678) & 0x10) != 0)
    degas::Database::TransactionChanges::updateNode((degas::Database *)((char *)this + 1360), a2);
  v19 = (void **)v15;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v19);
  *(_QWORD *)&v14 = v17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);
  *(_QWORD *)&v16 = v21;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v16);
  if ((_DWORD)v6 == 2)
  {
LABEL_23:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = a2;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failed to find node %llu when updating its edges", buf, 0xCu);
    }
    v6 = 2;
  }
  degas::Cursor::~Cursor(v18);
  return v6;
}

void sub_1CA1DCCCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::TransactionChanges::updateNode(degas::Database::TransactionChanges *this, unint64_t a2)
{
  uint64_t result;

  result = degas::Bitmap::isSet(this, a2);
  if ((result & 1) == 0)
  {
    result = degas::Bitmap::isSet((degas::Database::TransactionChanges *)((char *)this + 192), a2);
    if ((result & 1) == 0)
      return degas::Bitmap::setBit((degas::Database::TransactionChanges *)((char *)this + 96), a2);
  }
  return result;
}

uint64_t degas::Database::insertEdge(uint64_t a1, sqlite3_int64 *a2)
{
  uint64_t updated;
  sqlite3_int64 v5;
  BOOL v6;
  sqlite3_int64 v8;
  NSObject *v9;
  const char *v10;
  uint64_t v12;
  sqlite3_int64 v13;
  unint64_t v14[3];
  __int128 v15;
  uint8_t v16[32];
  uint8_t buf[16];
  _BYTE v18[40];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (degas::Database::checkNodeExistsForIdentifier((degas::Database *)a1, a2[7]) != 1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return 3;
    v8 = a2[7];
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v8;
    v9 = MEMORY[0x1E0C81028];
    v10 = "failed edge insert because source node %llu does not exist";
LABEL_31:
    _os_log_error_impl(&dword_1CA0A5000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0xCu);
    return 3;
  }
  if (degas::Database::checkNodeExistsForIdentifier((degas::Database *)a1, a2[8]) != 1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return 3;
    v13 = a2[8];
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v13;
    v9 = MEMORY[0x1E0C81028];
    v10 = "failed edge insert because target node %llu does not exist";
    goto LABEL_31;
  }
  if (degas::sDatabaseLabelReferenceChecking != 1
    || (updated = degas::Database::verifyLabels((degas::Database *)a1, (const degas::Bitmap *)(a2 + 1)), !(_DWORD)updated))
  {
    updated = degas::EdgeTable::insert((degas::EdgeTable *)(a1 + 248), a2, (const degas::Bitmap *)(a2 + 1), a2[7], a2[8]);
    if (!(_DWORD)updated)
    {
      *(_OWORD *)buf = 0u;
      memset(v18, 0, 25);
      degas::Bitmap::setBit((degas::Bitmap *)buf, *a2);
      v15 = 0u;
      memset(v16, 0, 25);
      degas::Bitmap::begin(a2 + 1, v14);
      v5 = a2[4];
      while (1)
      {
        v6 = (sqlite3_int64 *)v14[0] == a2 + 1 && v14[1] == -1;
        if (v6 && v14[2] == v5)
          break;
        (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 1336) + 96))(*(_QWORD *)(a1 + 1336));
        degas::Bitmap::iterator::operator++(v14);
      }
      updated = degas::Database::updateNodeEdges((degas::Database *)a1, a2[7], (const degas::Bitmap *)&v15, (const degas::Bitmap *)buf, (const degas::Bitmap *)&v15, (const degas::Bitmap *)&v15);
      if (!(_DWORD)updated)
      {
        updated = degas::Database::updateNodeEdges((degas::Database *)a1, a2[8], (const degas::Bitmap *)buf, (const degas::Bitmap *)&v15, (const degas::Bitmap *)&v15, (const degas::Bitmap *)&v15);
        if (!(_DWORD)updated)
        {
          v12 = *(_QWORD *)(a1 + 1288);
          if ((v12 & 0x8000000000000000) == 0)
            *(_QWORD *)(a1 + 1288) = v12 + 1;
          if ((*(_WORD *)(a1 + 1356) & 0x10) != 0)
            degas::Bitmap::setBit((degas::Bitmap *)(a1 + 1408), *a2);
          if (degas::sDatabaseInsertLabelTracking == 1)
            degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)(a1 + 1648), (uint64_t)(a2 + 1));
          updated = 0;
        }
      }
      v14[0] = (unint64_t)v16;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v14);
      *(_QWORD *)&v15 = v18;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v15);
    }
  }
  return updated;
}

void sub_1CA1DD000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  a13 = (void **)&a21;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a13);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::checkNodeExistsForIdentifier(degas::Database *this, sqlite3_int64 a2)
{
  uint64_t v4;
  degas::Statement *v6[2];

  degas::NodeCursor::NodeCursor(v6);
  degas::NodeCursor::setForIdentifier((degas::NodeCursor *)v6, a2, (degas::Database *)((char *)this + 192));
  v4 = degas::Statement::next((sqlite3_stmt **)v6[0]);
  if ((_DWORD)v4 == 1)
  {
    if (sqlite3_column_int64(*(sqlite3_stmt **)v6[0], 0) == a2)
      v4 = 1;
    else
      v4 = 3;
  }
  degas::Cursor::~Cursor(v6);
  return v4;
}

void sub_1CA1DD0BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::insertNodes(degas::Database *this, sqlite3_int64 **a2)
{
  sqlite3_int64 *v3;
  sqlite3_int64 *v4;
  uint64_t v6;
  sqlite3_int64 v7;
  BOOL v8;
  uint64_t v10;
  unint64_t v11[3];
  __int128 v12;
  _BYTE v13[40];
  char **v14;
  char *v15[2];

  v3 = *a2;
  v4 = a2[1];
  if ((char *)v4 - (char *)*a2 == 56)
    return degas::Database::insertNode(this, *a2);
  v15[0] = 0;
  v15[1] = 0;
  v14 = v15;
  v12 = 0u;
  memset(v13, 0, 25);
  if (v3 == v4)
  {
LABEL_23:
    v6 = 0;
  }
  else
  {
    while (1)
    {
      if (degas::sDatabaseLabelReferenceChecking == 1)
      {
        v6 = degas::Database::verifyLabels(this, (const degas::Bitmap *)(v3 + 1));
        if ((_DWORD)v6)
          break;
      }
      v6 = degas::NodeTable::insert((degas::Database *)((char *)this + 192), v3, (const degas::Bitmap *)(v3 + 1));
      if ((_DWORD)v6)
        break;
      degas::Bitmap::begin(v3 + 1, v11);
      v7 = v3[4];
      while (1)
      {
        v8 = (sqlite3_int64 *)v11[0] == v3 + 1 && v11[1] == -1;
        if (v8 && v11[2] == v7)
          break;
        (*(void (**)(_QWORD))(**((_QWORD **)this + 167) + 80))(*((_QWORD *)this + 167));
        degas::Bitmap::iterator::operator++(v11);
      }
      v10 = *((_QWORD *)this + 160);
      if ((v10 & 0x8000000000000000) == 0)
        *((_QWORD *)this + 160) = v10 + 1;
      if ((*((_WORD *)this + 678) & 0x10) != 0)
        degas::Bitmap::setBit((degas::Database *)((char *)this + 1360), *v3);
      if (degas::sDatabaseInsertLabelTracking == 1)
        degas::Bitmap::unionWith<degas::Bitmap>((degas::Database *)((char *)this + 1648), (uint64_t)(v3 + 1));
      v3 += 7;
      if (v3 == v4)
        goto LABEL_23;
    }
  }
  v11[0] = (unint64_t)v13;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v11);
  std::__tree<std::__value_type<unsigned long long,degas::Bitmap>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,degas::Bitmap>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,degas::Bitmap>>>::destroy(v15[0]);
  return v6;
}

void sub_1CA1DD278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char *a21)
{
  a10 = (void **)&a15;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a10);
  std::__tree<std::__value_type<unsigned long long,degas::Bitmap>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,degas::Bitmap>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,degas::Bitmap>>>::destroy(a21);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::insertEdges(degas::Database *this, sqlite3_int64 **a2)
{
  sqlite3_int64 *v2;
  sqlite3_int64 *v3;
  unint64_t v4;
  uint64_t v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  int32x4_t v15;
  sqlite3_int64 *v16;
  sqlite3_int64 *v17;
  sqlite3_int64 v18;
  BOOL v19;
  char *v21;
  unint64_t v22;
  char **v23;
  char *v24;
  char **v25;
  unint64_t v26;
  char **v27;
  _QWORD *v28;
  char *v29;
  unint64_t v30;
  char **v31;
  char *v32;
  char **v33;
  unint64_t v34;
  char **v35;
  _QWORD *v36;
  uint64_t v37;
  degas::Bitmap *v38;
  degas::Bitmap *v39;
  degas::Bitmap *v40;
  degas::Bitmap *v41;
  degas::Bitmap *v42;
  degas::Bitmap *v43;
  char *v44;
  uint64_t updated;
  char *v46;
  char **v47;
  char *v48;
  uint64_t v49;
  char *v50;
  char **v51;
  int v52;
  __int128 v53;
  _OWORD v54[2];
  __int128 v55;
  _QWORD v56[4];
  __int128 v57;
  _BYTE v58[32];
  __int128 v59;
  _BYTE v60[40];
  char **v61;
  char *v62[2];
  char **v63;
  char *v64[2];
  void **v65;
  uint8_t buf[8];
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  char v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v2 = *a2;
  v3 = a2[1];
  v4 = 0x8E38E38E38E38E39 * (v3 - *a2);
  if (!v4)
    return 0;
  if (v4 == 1)
    return degas::Database::insertEdge((uint64_t)this, *a2);
  v64[0] = 0;
  v64[1] = 0;
  v62[1] = 0;
  v63 = v64;
  v61 = v62;
  v62[0] = 0;
  v59 = 0u;
  memset(v60, 0, 25);
  v57 = 0u;
  memset(v58, 0, 25);
  v55 = 0u;
  memset(v56, 0, 25);
  while (v2 != v3)
  {
    degas::Bitmap::setBit((degas::Bitmap *)&v57, v2[7]);
    degas::Bitmap::setBit((degas::Bitmap *)&v57, v2[8]);
    v2 += 9;
  }
  degas::Database::findMissingNodesForIdentifiers(this, (__int128 **)&v57, (degas::Bitmap *)&v55);
  v9 = v55;
  if ((_QWORD)v55 == 0xFFFFFFFFLL)
  {
    v10 = (uint64_t *)v56[0];
    v11 = (uint64_t *)v56[1];
    if (v56[0] == v56[1])
    {
      v9 = 0;
    }
    else
    {
      v9 = 0;
      do
      {
        v12 = *v10;
        v13 = *(_DWORD *)(*v10 + 4);
        if (v13 == -1)
        {
          v14 = 0;
          v15 = 0uLL;
          do
          {
            do
            {
              v15 = (int32x4_t)vpadalq_u16((uint32x4_t)v15, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v12 + 4 * v14 + 16))));
              v14 += 4;
            }
            while (v14 != 32);
            v14 = 0;
            v13 = vaddvq_s32(v15);
            v15 = 0uLL;
          }
          while (v13 == -1);
          *(_DWORD *)(v12 + 4) = v13;
        }
        v9 += v13;
        v10 += 2;
      }
      while (v10 != v11);
    }
    *(_QWORD *)&v55 = v9;
  }
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v52 = degas::Bitmap::count((degas::Bitmap *)&v55);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v52;
      _os_log_fault_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "failed edge insert because %d source or target nodes do not exist", buf, 8u);
    }
    v7 = 3;
  }
  else
  {
    v16 = *a2;
    v17 = a2[1];
    if (*a2 == v17)
    {
LABEL_77:
      v44 = (char *)v63;
      if (v63 == v64)
        goto LABEL_86;
      do
      {
        updated = degas::Database::updateNodeEdges(this, *((_QWORD *)v44 + 4), (const degas::Bitmap *)&v59, (const degas::Bitmap *)(v44 + 40), (const degas::Bitmap *)&v59, (const degas::Bitmap *)&v59);
        v7 = updated;
        v46 = (char *)*((_QWORD *)v44 + 1);
        if (v46)
        {
          do
          {
            v47 = (char **)v46;
            v46 = *(char **)v46;
          }
          while (v46);
        }
        else
        {
          do
          {
            v47 = (char **)*((_QWORD *)v44 + 2);
            v19 = *v47 == v44;
            v44 = (char *)v47;
          }
          while (!v19);
        }
        if (v47 == v64)
          break;
        v44 = (char *)v47;
      }
      while (!(_DWORD)updated);
      if (!(_DWORD)updated)
      {
LABEL_86:
        v48 = (char *)v61;
        if (v61 == v62)
        {
          v7 = 0;
        }
        else
        {
          do
          {
            v49 = degas::Database::updateNodeEdges(this, *((_QWORD *)v48 + 4), (const degas::Bitmap *)(v48 + 40), (const degas::Bitmap *)&v59, (const degas::Bitmap *)&v59, (const degas::Bitmap *)&v59);
            v7 = v49;
            v50 = (char *)*((_QWORD *)v48 + 1);
            if (v50)
            {
              do
              {
                v51 = (char **)v50;
                v50 = *(char **)v50;
              }
              while (v50);
            }
            else
            {
              do
              {
                v51 = (char **)*((_QWORD *)v48 + 2);
                v19 = *v51 == v48;
                v48 = (char *)v51;
              }
              while (!v19);
            }
            if (v51 == v62)
              break;
            v48 = (char *)v51;
          }
          while (!(_DWORD)v49);
        }
      }
    }
    else
    {
      while (1)
      {
        if (degas::sDatabaseLabelReferenceChecking == 1)
        {
          v7 = degas::Database::verifyLabels(this, (const degas::Bitmap *)(v16 + 1));
          if ((_DWORD)v7)
            break;
        }
        v7 = degas::EdgeTable::insert((degas::Database *)((char *)this + 248), v16, (const degas::Bitmap *)(v16 + 1), v16[7], v16[8]);
        if ((_DWORD)v7)
          break;
        degas::Bitmap::begin(v16 + 1, buf);
        v18 = v16[4];
        while (1)
        {
          v19 = *(sqlite3_int64 **)buf == v16 + 1 && v67 == -1;
          if (v19 && (_QWORD)v68 == v18)
            break;
          (*(void (**)(_QWORD))(**((_QWORD **)this + 167) + 96))(*((_QWORD *)this + 167));
          degas::Bitmap::iterator::operator++((unint64_t *)buf);
        }
        v21 = v64[0];
        if (!v64[0])
          goto LABEL_49;
        v22 = v16[7];
        v23 = v64;
        do
        {
          v24 = v21;
          v25 = v23;
          v26 = *((_QWORD *)v21 + 4);
          v27 = (char **)(v21 + 8);
          if (v26 >= v22)
          {
            v27 = (char **)v24;
            v23 = (char **)v24;
          }
          v21 = *v27;
        }
        while (v21);
        if (v23 != v64 && (v26 >= v22 ? (v28 = v24) : (v28 = v25), v22 >= v28[4]))
        {
          v38 = (degas::Bitmap *)(v25 + 5);
          v39 = (degas::Bitmap *)(v24 + 40);
          if (v26 >= v22)
            v40 = v39;
          else
            v40 = v38;
          degas::Bitmap::setBit(v40, *v16);
        }
        else
        {
LABEL_49:
          v53 = 0u;
          memset(v54, 0, 25);
          degas::Bitmap::setBit((degas::Bitmap *)&v53, *v16);
          *(_QWORD *)buf = v16[7];
          v67 = v53;
          v68 = 0u;
          v69 = 0u;
          std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v68 + 8, *(__int128 **)&v54[0], *((__int128 **)&v54[0] + 1), (uint64_t)(*((_QWORD *)&v54[0] + 1) - *(_QWORD *)&v54[0]) >> 4);
          v70 = BYTE8(v54[1]);
          std::__tree<std::__value_type<unsigned long long,degas::Bitmap>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,degas::Bitmap>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,degas::Bitmap>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long const,degas::Bitmap>>((uint64_t *)&v63, *(unint64_t *)buf, (uint64_t)buf);
          v65 = (void **)&v68 + 1;
          std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v65);
          *(_QWORD *)buf = v54;
          std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
        }
        v29 = v62[0];
        if (!v62[0])
          goto LABEL_60;
        v30 = v16[8];
        v31 = v62;
        do
        {
          v32 = v29;
          v33 = v31;
          v34 = *((_QWORD *)v29 + 4);
          v35 = (char **)(v29 + 8);
          if (v34 >= v30)
          {
            v35 = (char **)v32;
            v31 = (char **)v32;
          }
          v29 = *v35;
        }
        while (v29);
        if (v31 != v62 && (v34 >= v30 ? (v36 = v32) : (v36 = v33), v30 >= v36[4]))
        {
          v41 = (degas::Bitmap *)(v33 + 5);
          v42 = (degas::Bitmap *)(v32 + 40);
          if (v34 >= v30)
            v43 = v42;
          else
            v43 = v41;
          degas::Bitmap::setBit(v43, *v16);
        }
        else
        {
LABEL_60:
          v53 = 0u;
          memset(v54, 0, 25);
          degas::Bitmap::setBit((degas::Bitmap *)&v53, *v16);
          *(_QWORD *)buf = v16[8];
          v67 = v53;
          v68 = 0u;
          v69 = 0u;
          std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v68 + 8, *(__int128 **)&v54[0], *((__int128 **)&v54[0] + 1), (uint64_t)(*((_QWORD *)&v54[0] + 1) - *(_QWORD *)&v54[0]) >> 4);
          v70 = BYTE8(v54[1]);
          std::__tree<std::__value_type<unsigned long long,degas::Bitmap>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,degas::Bitmap>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,degas::Bitmap>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long const,degas::Bitmap>>((uint64_t *)&v61, *(unint64_t *)buf, (uint64_t)buf);
          v65 = (void **)&v68 + 1;
          std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v65);
          *(_QWORD *)buf = v54;
          std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
        }
        v37 = *((_QWORD *)this + 161);
        if ((v37 & 0x8000000000000000) == 0)
          *((_QWORD *)this + 161) = v37 + 1;
        if ((*((_WORD *)this + 678) & 0x10) != 0)
          degas::Bitmap::setBit((degas::Database *)((char *)this + 1408), *v16);
        if (degas::sDatabaseInsertLabelTracking == 1)
          degas::Bitmap::unionWith<degas::Bitmap>((degas::Database *)((char *)this + 1648), (uint64_t)(v16 + 1));
        v16 += 9;
        if (v16 == v17)
          goto LABEL_77;
      }
    }
  }
  *(_QWORD *)buf = v56;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  *(_QWORD *)buf = v58;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  *(_QWORD *)buf = v60;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  std::__tree<std::__value_type<unsigned long long,degas::Bitmap>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,degas::Bitmap>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,degas::Bitmap>>>::destroy(v62[0]);
  std::__tree<std::__value_type<unsigned long long,degas::Bitmap>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,degas::Bitmap>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,degas::Bitmap>>>::destroy(v64[0]);
  return v7;
}

void sub_1CA1DD8E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  uint64_t v33;

  *(_QWORD *)(v33 - 160) = &a21;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v33 - 160));
  *(_QWORD *)(v33 - 160) = &a27;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v33 - 160));
  *(_QWORD *)(v33 - 160) = &a33;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v33 - 160));
  std::__tree<std::__value_type<unsigned long long,degas::Bitmap>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,degas::Bitmap>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,degas::Bitmap>>>::destroy(*(char **)(v33 - 208));
  std::__tree<std::__value_type<unsigned long long,degas::Bitmap>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,degas::Bitmap>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,degas::Bitmap>>>::destroy(*(char **)(v33 - 184));
  _Unwind_Resume(a1);
}

uint64_t degas::Database::findMissingNodesForIdentifiers(degas::Database *this, __int128 **a2, degas::Bitmap *a3)
{
  unsigned int v6;
  sqlite3_int64 v7;
  uint64_t v8;
  degas::Statement *v10[2];
  degas::BitsetPtr *v11[5];
  char v12;

  v11[0] = (degas::BitsetPtr *)*a2;
  memset(&v11[1], 0, 32);
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v11[2], a2[2], a2[3], a2[3] - a2[2]);
  v12 = *((_BYTE *)a2 + 40);
  degas::NodeCursor::NodeCursor(v10);
  degas::NodeCursor::setForIdentifiers((degas::NodeCursor *)v10, (Bitmap *)a2, (degas::Database *)((char *)this + 192));
  while (1)
  {
    v6 = degas::Statement::next((sqlite3_stmt **)v10[0]);
    if (v6 != 1)
      break;
    v7 = sqlite3_column_int64(*(sqlite3_stmt **)v10[0], 0);
    degas::Bitmap::clearBit(v11, v7);
  }
  if (v6 == 2)
    v8 = 0;
  else
    v8 = v6;
  if (!(_DWORD)v8)
    degas::Bitmap::operator=(a3, v11);
  degas::Cursor::~Cursor(v10);
  v10[0] = (degas::Statement *)&v11[2];
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v10);
  return v8;
}

void sub_1CA1DDA78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  degas::Cursor::~Cursor((degas::Statement **)&a9);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&a9);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<unsigned long long,degas::Bitmap>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,degas::Bitmap>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,degas::Bitmap>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long const,degas::Bitmap>>(uint64_t *result, unint64_t a2, uint64_t a3)
{
  uint64_t **v4;
  uint64_t *v5;
  uint64_t **v6;
  uint64_t **v7;
  unint64_t v8;
  void *v9;

  v4 = (uint64_t **)result;
  v6 = (uint64_t **)(result + 1);
  v5 = (uint64_t *)result[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        v7 = (uint64_t **)v5;
        v8 = v5[4];
        if (v8 <= a2)
          break;
        v5 = *v7;
        v6 = v7;
        if (!*v7)
          goto LABEL_9;
      }
      if (v8 >= a2)
        break;
      v5 = v7[1];
      if (!v5)
      {
        v6 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    v7 = (uint64_t **)(result + 1);
LABEL_9:
    v9 = operator new(0x58uLL);
    *((_OWORD *)v9 + 2) = *(_OWORD *)a3;
    *((_OWORD *)v9 + 3) = 0u;
    *((_OWORD *)v9 + 4) = 0u;
    std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)v9 + 56, *(__int128 **)(a3 + 24), *(__int128 **)(a3 + 32), (uint64_t)(*(_QWORD *)(a3 + 32) - *(_QWORD *)(a3 + 24)) >> 4);
    *((_BYTE *)v9 + 80) = *(_BYTE *)(a3 + 48);
    return std::__tree<std::__value_type<unsigned long long,degas::Bitmap>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,degas::Bitmap>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,degas::Bitmap>>>::__insert_node_at(v4, (uint64_t)v7, v6, (uint64_t *)v9);
  }
  return result;
}

void sub_1CA1DDB7C(_Unwind_Exception *a1)
{
  void **v1;

  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<unsigned long long,degas::Bitmap>,void *>>>::operator()[abi:ne180100](0, v1);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::removeNode(degas::Database *this, unint64_t a2)
{
  uint64_t v2;
  const void *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v9;
  BOOL v10;
  degas::Statement *v13;
  unint64_t v14;
  uint64_t v15;
  __int128 v16;
  _QWORD v17[4];
  __int128 v18;
  _QWORD v19[4];

  if (*((_BYTE *)this + 32))
    return 8;
  v18 = 0u;
  memset(v19, 0, 25);
  v16 = 0u;
  memset(v17, 0, 25);
  degas::NodeCursor::NodeCursor(&v13);
  degas::NodeCursor::setForIdentifier((degas::NodeCursor *)&v13, a2, (degas::Database *)((char *)this + 192));
  if (degas::Statement::next((sqlite3_stmt **)v13) == 1)
  {
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v13, 2, (degas::Bitmap *)&v18);
    v5 = sqlite3_column_blob(*(sqlite3_stmt **)v13, 3);
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v13, 1, (degas::Bitmap *)&v16);
    degas::Bitmap::unionWith<degas::LiteralBitmap>((degas::Bitmap *)&v18, (uint64_t)v5);
    degas::Cursor::~Cursor(&v13);
    if ((*((_WORD *)this + 678) & 0x10) != 0)
    {
      v13 = (degas::Statement *)*((_QWORD *)this + 3);
      v14 = (unint64_t)this + 40;
      degas::TombstoneCopier::copyNode((degas::TombstoneCopier *)&v13, a2);
    }
    degas::Bitmap::begin(&v18, &v13);
    v6 = v19[1];
    while (1)
    {
      v7 = v13 == (degas::Statement *)&v18 && v14 == -1;
      if (v7 && v15 == v6)
        break;
      degas::Database::removeEdge(this, v14, a2);
      degas::Bitmap::iterator::operator++((unint64_t *)&v13);
    }
    degas::Bitmap::begin(&v16, &v13);
    v9 = v17[1];
    while (1)
    {
      v10 = v13 == (degas::Statement *)&v16 && v14 == -1;
      if (v10 && v15 == v9)
        break;
      (*(void (**)(_QWORD))(**((_QWORD **)this + 167) + 88))(*((_QWORD *)this + 167));
      degas::Bitmap::iterator::operator++((unint64_t *)&v13);
    }
    v2 = degas::AttributeValueTable::deleteEntry((degas::Database *)((char *)this + 360), a2);
    if (!(_DWORD)v2)
    {
      v2 = degas::NodeTable::deleteEntry((degas::Database *)((char *)this + 192), a2);
      if (!(_DWORD)v2)
      {
        if ((*((_WORD *)this + 678) & 0x10) != 0)
          degas::Database::TransactionChanges::deleteNode((degas::BitsetPtr **)this + 170, a2);
        v2 = 0;
      }
    }
  }
  else
  {
    degas::Cursor::~Cursor(&v13);
    v2 = 2;
  }
  v13 = (degas::Statement *)v17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v13);
  *(_QWORD *)&v16 = v19;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v16);
  return v2;
}

void sub_1CA1DDD90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10, uint64_t a11, uint64_t a12, void **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  a10 = (void **)&a15;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a10);
  a13 = (void **)&a21;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a13);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::removeEdge(degas::Database *this, unint64_t a2, uint64_t a3)
{
  uint64_t updated;
  degas::EdgeCursor *v7;
  sqlite3_int64 v8;
  sqlite3_int64 v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v14[3];
  __int128 v15;
  _BYTE v16[32];
  __int128 v17;
  _BYTE v18[32];
  __int128 v19;
  _QWORD v20[4];
  degas::Statement *v21[2];

  if (*((_BYTE *)this + 32))
    return 8;
  v7 = (degas::EdgeCursor *)degas::EdgeCursor::EdgeCursor(v21);
  degas::EdgeCursor::setForIdentifier(v7, a2, (degas::Database *)((char *)this + 248));
  if (degas::Statement::next((sqlite3_stmt **)v21[0]) == 1)
  {
    if ((*((_WORD *)this + 678) & 0x10) != 0)
    {
      *(_QWORD *)&v19 = *((_QWORD *)this + 3);
      *((_QWORD *)&v19 + 1) = (char *)this + 40;
      degas::TombstoneCopier::copyEdge((degas::TombstoneCopier *)&v19, a2);
    }
    v8 = sqlite3_column_int64(*(sqlite3_stmt **)v21[0], 2);
    v9 = sqlite3_column_int64(*(sqlite3_stmt **)v21[0], 3);
    memset(v20, 0, 25);
    v19 = 0u;
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v21[0], 1, (degas::Bitmap *)&v19);
    v17 = 0u;
    memset(v18, 0, 25);
    v15 = 0u;
    memset(v16, 0, 25);
    degas::Bitmap::setBit((degas::Bitmap *)&v17, a2);
    if (v8 == a3
      || (updated = degas::Database::updateNodeEdges(this, v8, (const degas::Bitmap *)&v15, (const degas::Bitmap *)&v15, (const degas::Bitmap *)&v15, (const degas::Bitmap *)&v17), !(_DWORD)updated))
    {
      if (v9 == a3
        || (updated = degas::Database::updateNodeEdges(this, v9, (const degas::Bitmap *)&v15, (const degas::Bitmap *)&v15, (const degas::Bitmap *)&v17, (const degas::Bitmap *)&v15), !(_DWORD)updated))
      {
        degas::Bitmap::begin(&v19, v14);
        v10 = v20[1];
        while (1)
        {
          v11 = (__int128 *)v14[0] == &v19 && v14[1] == -1;
          if (v11 && v14[2] == v10)
            break;
          (*(void (**)(_QWORD))(**((_QWORD **)this + 167) + 104))(*((_QWORD *)this + 167));
          degas::Bitmap::iterator::operator++(v14);
        }
        degas::AttributeValueTable::deleteEntry((degas::Database *)((char *)this + 416), a2);
        updated = degas::EdgeTable::deleteEntry((degas::Database *)((char *)this + 248), a2);
        if (!(_DWORD)updated)
        {
          if ((*((_WORD *)this + 678) & 0x10) != 0)
            degas::Bitmap::setBit((degas::Database *)((char *)this + 1408), a2);
          updated = 0;
        }
      }
    }
    v14[0] = (unint64_t)v16;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v14);
    *(_QWORD *)&v15 = v18;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v15);
    *(_QWORD *)&v17 = v20;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v17);
  }
  else
  {
    updated = 2;
  }
  degas::Cursor::~Cursor(v21);
  return updated;
}

void sub_1CA1DE028(_Unwind_Exception *a1)
{
  uint64_t v1;

  degas::Cursor::~Cursor((degas::Statement **)(v1 - 80));
  _Unwind_Resume(a1);
}

uint64_t degas::Database::TransactionChanges::deleteNode(degas::BitsetPtr **this, unint64_t a2)
{
  if (degas::Bitmap::isSet((degas::Bitmap *)this, a2))
    return degas::Bitmap::clearBit(this, a2);
  if (degas::Bitmap::isSet((degas::Bitmap *)(this + 12), a2))
    degas::Bitmap::clearBit(this + 12, a2);
  return degas::Bitmap::setBit((degas::Bitmap *)(this + 24), a2);
}

uint64_t degas::Database::removeNodes(degas::Database *this, Bitmap *a2)
{
  uint64_t v2;
  const void *v5;
  const void *v6;
  const void *v7;
  sqlite3_int64 v8;
  BitsetPtr *end;
  unint64_t v10;
  BOOL v11;
  unint64_t v14;
  unint64_t v15;
  BitsetPtr *v16;
  degas::Statement *v17[2];
  __int128 v18;
  _BYTE v19[32];
  Bitmap v20;
  __int128 v21;
  _BYTE v22[32];

  if (*((_BYTE *)this + 32))
    return 8;
  if (a2->_bitSets.__begin_ == a2->_bitSets.__end_)
    return 0;
  if ((*((_WORD *)this + 678) & 0x10) != 0)
  {
    *(_QWORD *)&v21 = *((_QWORD *)this + 3);
    *((_QWORD *)&v21 + 1) = (char *)this + 40;
    degas::TombstoneCopier::copyNodes((degas::TombstoneCopier *)&v21, a2);
  }
  v21 = 0u;
  memset(v22, 0, 25);
  memset(&v20, 0, 41);
  v18 = 0u;
  memset(v19, 0, 25);
  degas::NodeCursor::NodeCursor(v17);
  degas::NodeCursor::setForIdentifiers((degas::NodeCursor *)v17, a2, (degas::Database *)((char *)this + 192));
  while (degas::Statement::next((sqlite3_stmt **)v17[0]) == 1)
  {
    v5 = sqlite3_column_blob(*(sqlite3_stmt **)v17[0], 2);
    v6 = sqlite3_column_blob(*(sqlite3_stmt **)v17[0], 3);
    v7 = sqlite3_column_blob(*(sqlite3_stmt **)v17[0], 1);
    degas::Bitmap::unionWith<degas::LiteralBitmap>((degas::Bitmap *)&v20, (uint64_t)v5);
    degas::Bitmap::unionWith<degas::LiteralBitmap>((degas::Bitmap *)&v20, (uint64_t)v6);
    degas::Bitmap::unionWith<degas::LiteralBitmap>((degas::Bitmap *)&v18, (uint64_t)v7);
    v8 = sqlite3_column_int64(*(sqlite3_stmt **)v17[0], 0);
    v2 = degas::AttributeValueTable::deleteEntry((degas::Database *)((char *)this + 360), v8);
    if ((_DWORD)v2)
      goto LABEL_25;
  }
  (*(void (**)(_QWORD, __int128 *, Bitmap *))(**((_QWORD **)this + 167) + 112))(*((_QWORD *)this + 167), &v18, a2);
  v2 = degas::Database::removeEdges(this, &v20, (const degas::Bitmap *)a2);
  if (!(_DWORD)v2)
  {
    degas::Bitmap::begin(a2, &v14);
    end = a2->_bitSets.__end_;
    while (1)
    {
      v10 = v15;
      v11 = (Bitmap *)v14 == a2 && v15 == -1;
      if (v11 && v16 == end)
        break;
      v2 = degas::NodeTable::deleteEntry((degas::Database *)((char *)this + 192), v15);
      if ((_DWORD)v2)
        goto LABEL_25;
      if ((*((_WORD *)this + 678) & 0x10) != 0)
        degas::Database::TransactionChanges::deleteNode((degas::BitsetPtr **)this + 170, v10);
      degas::Bitmap::iterator::operator++(&v14);
    }
    v2 = 0;
  }
LABEL_25:
  degas::Cursor::~Cursor(v17);
  v14 = (unint64_t)v19;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);
  *(_QWORD *)&v18 = &v20._bitSets;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v18);
  v20._bitCount = (unint64_t)v22;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v20);
  return v2;
}

void sub_1CA1DE344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void **a21,uint64_t a22,uint64_t a23)
{
  uint64_t v23;

  a10 = (void **)&a17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a10);
  a15 = (void **)&a23;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a15);
  a21 = (void **)(v23 - 96);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a21);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::removeEdges(degas::Database *this, Bitmap *a2, const degas::Bitmap *a3)
{
  uint64_t updated;
  degas::EdgeCursor *v7;
  sqlite3_int64 v8;
  sqlite3_int64 v9;
  const void *v10;
  sqlite3_int64 v11;
  BitsetPtr *v12;
  BOOL v13;
  BitsetPtr *v15;
  BOOL v16;
  BitsetPtr *end;
  unint64_t v19;
  BOOL v20;
  unint64_t v23;
  unint64_t v24;
  BitsetPtr *v25;
  __int128 v26;
  _BYTE v27[32];
  __int128 v28;
  _BYTE v29[32];
  __int128 v30;
  _QWORD v31[4];
  __int128 v32;
  _QWORD v33[4];
  degas::Statement *v34[2];

  if (*((_BYTE *)this + 32))
    return 8;
  if (a2->_bitSets.__begin_ == a2->_bitSets.__end_)
    return 0;
  if ((*((_WORD *)this + 678) & 0x10) != 0)
  {
    *(_QWORD *)&v32 = *((_QWORD *)this + 3);
    *((_QWORD *)&v32 + 1) = (char *)this + 40;
    degas::TombstoneCopier::copyEdges((degas::TombstoneCopier *)&v32, a2);
  }
  v7 = (degas::EdgeCursor *)degas::EdgeCursor::EdgeCursor(v34);
  degas::EdgeCursor::setForIdentifiers(v7, a2, (degas::Database *)((char *)this + 248));
  v32 = 0u;
  memset(v33, 0, 25);
  memset(v31, 0, 25);
  v30 = 0u;
  v28 = 0u;
  memset(v29, 0, 25);
  updated = 2;
  v26 = 0u;
  memset(v27, 0, 25);
  while (degas::Statement::next((sqlite3_stmt **)v34[0]) == 1)
  {
    v8 = sqlite3_column_int64(*(sqlite3_stmt **)v34[0], 2);
    degas::Bitmap::setBit((degas::Bitmap *)&v32, v8);
    v9 = sqlite3_column_int64(*(sqlite3_stmt **)v34[0], 3);
    degas::Bitmap::setBit((degas::Bitmap *)&v30, v9);
    v10 = sqlite3_column_blob(*(sqlite3_stmt **)v34[0], 1);
    degas::Bitmap::unionWith<degas::LiteralBitmap>((degas::Bitmap *)&v28, (uint64_t)v10);
    v11 = sqlite3_column_int64(*(sqlite3_stmt **)v34[0], 0);
    updated = degas::AttributeValueTable::deleteEntry((degas::Database *)((char *)this + 416), v11);
  }
  degas::Bitmap::diffWith<degas::Bitmap>((degas::Bitmap *)&v32, a3);
  degas::Bitmap::begin(&v32, &v23);
  v12 = (BitsetPtr *)v33[1];
  while (1)
  {
    v13 = (__int128 *)v23 == &v32 && v24 == -1;
    if (v13 && v25 == v12)
      break;
    updated = degas::Database::updateNodeEdges(this, v24, (const degas::Bitmap *)&v26, (const degas::Bitmap *)&v26, (const degas::Bitmap *)&v26, (const degas::Bitmap *)a2);
    if ((_DWORD)updated)
      goto LABEL_48;
    degas::Bitmap::iterator::operator++(&v23);
  }
  degas::Bitmap::diffWith<degas::Bitmap>((degas::Bitmap *)&v30, a3);
  degas::Bitmap::begin(&v30, &v23);
  v15 = (BitsetPtr *)v31[1];
  while (1)
  {
    v16 = (__int128 *)v23 == &v30 && v24 == -1;
    if (v16 && v25 == v15)
      break;
    updated = degas::Database::updateNodeEdges(this, v24, (const degas::Bitmap *)&v26, (const degas::Bitmap *)&v26, (const degas::Bitmap *)a2, (const degas::Bitmap *)&v26);
    if ((_DWORD)updated)
      goto LABEL_48;
    degas::Bitmap::iterator::operator++(&v23);
  }
  (*(void (**)(_QWORD, __int128 *, Bitmap *))(**((_QWORD **)this + 167) + 120))(*((_QWORD *)this + 167), &v28, a2);
  if (!(_DWORD)updated)
  {
    degas::Bitmap::begin(a2, &v23);
    end = a2->_bitSets.__end_;
    while (1)
    {
      v19 = v24;
      v20 = (Bitmap *)v23 == a2 && v24 == -1;
      if (v20 && v25 == end)
        break;
      updated = degas::EdgeTable::deleteEntry((degas::Database *)((char *)this + 248), v24);
      if ((_DWORD)updated)
        goto LABEL_48;
      if ((*((_WORD *)this + 678) & 0x10) != 0)
      {
        if (degas::Bitmap::isSet((degas::Database *)((char *)this + 1408), v19))
        {
          degas::Bitmap::clearBit((degas::BitsetPtr **)this + 176, v19);
        }
        else
        {
          if (degas::Bitmap::isSet((degas::Database *)((char *)this + 1504), v19))
            degas::Bitmap::clearBit((degas::BitsetPtr **)this + 188, v19);
          degas::Bitmap::setBit((degas::Database *)((char *)this + 1600), v19);
        }
      }
      degas::Bitmap::iterator::operator++(&v23);
    }
    updated = 0;
  }
LABEL_48:
  v23 = (unint64_t)v27;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v23);
  *(_QWORD *)&v26 = v29;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v26);
  *(_QWORD *)&v28 = v31;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v28);
  *(_QWORD *)&v30 = v33;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v30);
  degas::Cursor::~Cursor(v34);
  return updated;
}

void sub_1CA1DE700(_Unwind_Exception *a1)
{
  uint64_t v1;

  degas::Cursor::~Cursor((degas::Statement **)(v1 - 96));
  _Unwind_Resume(a1);
}

uint64_t degas::Database::removeEdge(degas::Database *this, unint64_t a2)
{
  return degas::Database::removeEdge(this, a2, 0);
}

uint64_t degas::Database::removeEdges(degas::Database *this, Bitmap *a2)
{
  uint64_t v2;
  __int128 v4;
  _BYTE v5[40];
  void **v6;

  v4 = 0u;
  memset(v5, 0, 25);
  v2 = degas::Database::removeEdges(this, a2, (const degas::Bitmap *)&v4);
  v6 = (void **)v5;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v6);
  return v2;
}

void sub_1CA1DE7E4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 24) = v1 + 16;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t degas::Database::getNodeInfo(degas::Database *this, sqlite3_int64 a2, degas::Bitmap *a3, degas::Bitmap *a4, degas::Bitmap *a5)
{
  uint64_t v10;
  degas::Statement *v12[2];

  degas::NodeCursor::NodeCursor(v12);
  degas::NodeCursor::setForIdentifier((degas::NodeCursor *)v12, a2, (degas::Database *)((char *)this + 192));
  if (degas::Statement::next((sqlite3_stmt **)v12[0]) == 1)
  {
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v12[0], 1, a3);
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v12[0], 2, a4);
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v12[0], 3, a5);
    v10 = 0;
  }
  else
  {
    v10 = 2;
  }
  degas::Cursor::~Cursor(v12);
  return v10;
}

void sub_1CA1DE8B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::appendSourceNodesForEdges(degas::Database *this, Bitmap *a2, degas::Bitmap *a3)
{
  sqlite3_int64 v6;
  degas::Statement *v8[2];

  degas::EdgeCursor::EdgeCursor(v8);
  degas::EdgeCursor::setForIdentifiers((degas::EdgeCursor *)v8, a2, (degas::Database *)((char *)this + 248));
  while (degas::Statement::next((sqlite3_stmt **)v8[0]) == 1)
  {
    v6 = sqlite3_column_int64(*(sqlite3_stmt **)v8[0], 2);
    degas::Bitmap::setBit(a3, v6);
  }
  degas::Cursor::~Cursor(v8);
  return 0;
}

void sub_1CA1DE950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::appendTargetNodesForEdges(degas::Database *this, Bitmap *a2, degas::Bitmap *a3)
{
  sqlite3_int64 v6;
  degas::Statement *v8[2];

  degas::EdgeCursor::EdgeCursor(v8);
  degas::EdgeCursor::setForIdentifiers((degas::EdgeCursor *)v8, a2, (degas::Database *)((char *)this + 248));
  while (degas::Statement::next((sqlite3_stmt **)v8[0]) == 1)
  {
    v6 = sqlite3_column_int64(*(sqlite3_stmt **)v8[0], 3);
    degas::Bitmap::setBit(a3, v6);
  }
  degas::Cursor::~Cursor(v8);
  return 0;
}

void sub_1CA1DE9F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::appendAllNodesForEdges(degas::Database *this, Bitmap *a2, degas::Bitmap *a3)
{
  sqlite3_int64 v6;
  sqlite3_int64 v7;
  degas::Statement *v9[2];

  degas::EdgeCursor::EdgeCursor(v9);
  degas::EdgeCursor::setForIdentifiers((degas::EdgeCursor *)v9, a2, (degas::Database *)((char *)this + 248));
  while (degas::Statement::next((sqlite3_stmt **)v9[0]) == 1)
  {
    v6 = sqlite3_column_int64(*(sqlite3_stmt **)v9[0], 3);
    degas::Bitmap::setBit(a3, v6);
    v7 = sqlite3_column_int64(*(sqlite3_stmt **)v9[0], 2);
    degas::Bitmap::setBit(a3, v7);
  }
  degas::Cursor::~Cursor(v9);
  return 0;
}

void sub_1CA1DEAB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::appendSourceAndTargetNodesForEdges(degas::Database *this, Bitmap *a2, degas::Bitmap *a3, degas::Bitmap *a4)
{
  sqlite3_int64 v8;
  sqlite3_int64 v9;
  degas::Statement *v11[2];

  degas::EdgeCursor::EdgeCursor(v11);
  degas::EdgeCursor::setForIdentifiers((degas::EdgeCursor *)v11, a2, (degas::Database *)((char *)this + 248));
  while (degas::Statement::next((sqlite3_stmt **)v11[0]) == 1)
  {
    v8 = sqlite3_column_int64(*(sqlite3_stmt **)v11[0], 3);
    degas::Bitmap::setBit(a4, v8);
    v9 = sqlite3_column_int64(*(sqlite3_stmt **)v11[0], 2);
    degas::Bitmap::setBit(a3, v9);
  }
  degas::Cursor::~Cursor(v11);
  return 0;
}

void sub_1CA1DEB7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::sortNodesByIntAttribute(uint64_t a1, sqlite3_int64 a2, int a3, sqlite3_int64 a4, Bitmap *a5, uint64_t a6)
{
  uint64_t *v12;
  unsigned int v13;
  sqlite3_int64 v14;
  sqlite3_int64 v15;
  uint64_t v16;
  degas::Statement *v18[2];

  degas::SortAttributeValueCursor::SortAttributeValueCursor(v18);
  v12 = degas::SortAttributeValueTable::prepareStatementToReadByIntAttrIdentifiers((degas::SortAttributeValueTable *)(a1 + 584), a2, a3, a4, a5);
  std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v18, *v12, v12[1]);
  while (1)
  {
    v13 = degas::Statement::next((sqlite3_stmt **)v18[0]);
    if (v13 != 1)
      break;
    v14 = sqlite3_column_int64(*(sqlite3_stmt **)v18[0], 0);
    v15 = sqlite3_column_int64(*(sqlite3_stmt **)v18[0], 1);
    (*(void (**)(uint64_t, sqlite3_int64, sqlite3_int64))(a6 + 16))(a6, v14, v15);
  }
  if (v13 == 2)
    v16 = 0;
  else
    v16 = v13;
  degas::Cursor::~Cursor(v18);
  return v16;
}

void sub_1CA1DEC70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::sortNodesByRealAttribute(uint64_t a1, sqlite3_int64 a2, int a3, sqlite3_int64 a4, Bitmap *a5, uint64_t a6)
{
  uint64_t *v12;
  unsigned int v13;
  sqlite3_int64 v14;
  double v15;
  uint64_t v16;
  degas::Statement *v18[2];

  degas::SortAttributeValueCursor::SortAttributeValueCursor(v18);
  v12 = degas::SortAttributeValueTable::prepareStatementToReadByRealAttrIdentifiers((degas::SortAttributeValueTable *)(a1 + 584), a2, a3, a4, a5);
  std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v18, *v12, v12[1]);
  while (1)
  {
    v13 = degas::Statement::next((sqlite3_stmt **)v18[0]);
    if (v13 != 1)
      break;
    v14 = sqlite3_column_int64(*(sqlite3_stmt **)v18[0], 0);
    v15 = sqlite3_column_double(*(sqlite3_stmt **)v18[0], 1);
    (*(void (**)(uint64_t, sqlite3_int64, double))(a6 + 16))(a6, v14, v15);
  }
  if (v13 == 2)
    v16 = 0;
  else
    v16 = v13;
  degas::Cursor::~Cursor(v18);
  return v16;
}

void sub_1CA1DED60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::sortNodesByStringAttribute(uint64_t a1, sqlite3_int64 a2, int a3, sqlite3_int64 a4, Bitmap *a5, uint64_t a6)
{
  uint64_t *v12;
  unsigned int v13;
  sqlite3_int64 v14;
  uint64_t v15;
  void *__p[2];
  uint64_t v18;
  degas::Statement *v19[2];

  degas::SortAttributeValueCursor::SortAttributeValueCursor(v19);
  v12 = degas::SortAttributeValueTable::prepareStatementToReadByStringAttrIdentifiers((degas::SortAttributeValueTable *)(a1 + 584), a2, a3, a4, a5);
  std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v19, *v12, v12[1]);
  while (1)
  {
    v13 = degas::Statement::next((sqlite3_stmt **)v19[0]);
    if (v13 != 1)
      break;
    v14 = sqlite3_column_int64(*(sqlite3_stmt **)v19[0], 0);
    __p[0] = 0;
    __p[1] = 0;
    v18 = 0;
    degas::Statement::stringColumnValue((sqlite3_stmt **)v19[0], 1, (uint64_t)__p);
    (*(void (**)(uint64_t, sqlite3_int64, void **))(a6 + 16))(a6, v14, __p);
    if (SHIBYTE(v18) < 0)
      operator delete(__p[0]);
  }
  if (v13 == 2)
    v15 = 0;
  else
    v15 = v13;
  degas::Cursor::~Cursor(v19);
  return v15;
}

void sub_1CA1DEE6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, degas::Statement *a16)
{
  degas::Cursor::~Cursor(&a16);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::sortEdgesByIntAttribute(uint64_t a1, sqlite3_int64 a2, int a3, sqlite3_int64 a4, Bitmap *a5, uint64_t a6)
{
  uint64_t *v12;
  unsigned int v13;
  sqlite3_int64 v14;
  sqlite3_int64 v15;
  uint64_t v16;
  degas::Statement *v18[2];

  degas::SortAttributeValueCursor::SortAttributeValueCursor(v18);
  v12 = degas::SortAttributeValueTable::prepareStatementToReadByIntAttrIdentifiers((degas::SortAttributeValueTable *)(a1 + 640), a2, a3, a4, a5);
  std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v18, *v12, v12[1]);
  while (1)
  {
    v13 = degas::Statement::next((sqlite3_stmt **)v18[0]);
    if (v13 != 1)
      break;
    v14 = sqlite3_column_int64(*(sqlite3_stmt **)v18[0], 0);
    v15 = sqlite3_column_int64(*(sqlite3_stmt **)v18[0], 1);
    (*(void (**)(uint64_t, sqlite3_int64, sqlite3_int64))(a6 + 16))(a6, v14, v15);
  }
  if (v13 == 2)
    v16 = 0;
  else
    v16 = v13;
  degas::Cursor::~Cursor(v18);
  return v16;
}

void sub_1CA1DEF74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::sortEdgesByRealAttribute(uint64_t a1, sqlite3_int64 a2, int a3, sqlite3_int64 a4, Bitmap *a5, uint64_t a6)
{
  uint64_t *v12;
  unsigned int v13;
  sqlite3_int64 v14;
  double v15;
  uint64_t v16;
  degas::Statement *v18[2];

  degas::SortAttributeValueCursor::SortAttributeValueCursor(v18);
  v12 = degas::SortAttributeValueTable::prepareStatementToReadByRealAttrIdentifiers((degas::SortAttributeValueTable *)(a1 + 640), a2, a3, a4, a5);
  std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v18, *v12, v12[1]);
  while (1)
  {
    v13 = degas::Statement::next((sqlite3_stmt **)v18[0]);
    if (v13 != 1)
      break;
    v14 = sqlite3_column_int64(*(sqlite3_stmt **)v18[0], 0);
    v15 = sqlite3_column_double(*(sqlite3_stmt **)v18[0], 1);
    (*(void (**)(uint64_t, sqlite3_int64, double))(a6 + 16))(a6, v14, v15);
  }
  if (v13 == 2)
    v16 = 0;
  else
    v16 = v13;
  degas::Cursor::~Cursor(v18);
  return v16;
}

void sub_1CA1DF064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::sortEdgesByStringAttribute(uint64_t a1, sqlite3_int64 a2, int a3, sqlite3_int64 a4, Bitmap *a5, uint64_t a6)
{
  uint64_t *v12;
  unsigned int v13;
  sqlite3_int64 v14;
  uint64_t v15;
  void *__p[2];
  uint64_t v18;
  degas::Statement *v19[2];

  degas::SortAttributeValueCursor::SortAttributeValueCursor(v19);
  v12 = degas::SortAttributeValueTable::prepareStatementToReadByStringAttrIdentifiers((degas::SortAttributeValueTable *)(a1 + 640), a2, a3, a4, a5);
  std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v19, *v12, v12[1]);
  while (1)
  {
    v13 = degas::Statement::next((sqlite3_stmt **)v19[0]);
    if (v13 != 1)
      break;
    v14 = sqlite3_column_int64(*(sqlite3_stmt **)v19[0], 0);
    __p[0] = 0;
    __p[1] = 0;
    v18 = 0;
    degas::Statement::stringColumnValue((sqlite3_stmt **)v19[0], 1, (uint64_t)__p);
    (*(void (**)(uint64_t, sqlite3_int64, void **))(a6 + 16))(a6, v14, __p);
    if (SHIBYTE(v18) < 0)
      operator delete(__p[0]);
  }
  if (v13 == 2)
    v15 = 0;
  else
    v15 = v13;
  degas::Cursor::~Cursor(v19);
  return v15;
}

void sub_1CA1DF170(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, degas::Statement *a16)
{
  degas::Cursor::~Cursor(&a16);
  _Unwind_Resume(a1);
}

unint64_t degas::Database::nodeCount(degas::Database *this)
{
  unint64_t result;
  unint64_t v3;

  result = *((_QWORD *)this + 160);
  if (result == -1)
  {
    v3 = 0;
    if (degas::Table::rowCount((degas::Database *)((char *)this + 192), (sqlite3_int64 *)&v3))
    {
      return *((_QWORD *)this + 160);
    }
    else
    {
      result = v3;
      *((_QWORD *)this + 160) = v3;
    }
  }
  return result;
}

unint64_t degas::Database::edgeCount(degas::Database *this)
{
  unint64_t result;
  unint64_t v3;

  result = *((_QWORD *)this + 161);
  if (result == -1)
  {
    v3 = 0;
    if (degas::Table::rowCount((degas::Database *)((char *)this + 248), (sqlite3_int64 *)&v3))
    {
      return *((_QWORD *)this + 161);
    }
    else
    {
      result = v3;
      *((_QWORD *)this + 161) = v3;
    }
  }
  return result;
}

uint64_t degas::Database::checkEdgeExistsForIdentifier(degas::Database *this, sqlite3_int64 a2)
{
  uint64_t v4;
  degas::Statement *v6[2];

  degas::EdgeCursor::EdgeCursor(v6);
  degas::EdgeCursor::setForIdentifier((degas::EdgeCursor *)v6, a2, (degas::Database *)((char *)this + 248));
  v4 = degas::Statement::next((sqlite3_stmt **)v6[0]);
  if ((_DWORD)v4 == 1)
  {
    if (sqlite3_column_int64(*(sqlite3_stmt **)v6[0], 0) == a2)
      v4 = 1;
    else
      v4 = 3;
  }
  degas::Cursor::~Cursor(v6);
  return v4;
}

void sub_1CA1DF2C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::edgesOfNodes(uint64_t a1, sqlite3_stmt ***a2, _QWORD *a3, unsigned int a4)
{
  unsigned int v7;
  unsigned int v8;
  const void *v9;
  const void *v10;
  uint64_t v11;
  __int128 v13;
  _BYTE v14[40];
  void **v15;

  v13 = 0u;
  memset(v14, 0, 25);
  v7 = a4 & 0xFFFFFFFD;
  while (1)
  {
    v8 = degas::Statement::next(*a2);
    if (v8 != 1)
      break;
    if (a4 <= 1)
    {
      v9 = sqlite3_column_blob(**a2, 3);
      degas::Bitmap::unionWith<degas::LiteralBitmap>((degas::Bitmap *)&v13, (uint64_t)v9);
    }
    if (!v7)
    {
      v10 = sqlite3_column_blob(**a2, 2);
      degas::Bitmap::unionWith<degas::LiteralBitmap>((degas::Bitmap *)&v13, (uint64_t)v10);
    }
  }
  degas::Bitmap::operator=(a3, &v13);
  if (v8 == 2)
    v11 = 0;
  else
    v11 = v8;
  v15 = (void **)v14;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v15);
  return v11;
}

void sub_1CA1DF3B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void **a16)
{
  a16 = (void **)&a11;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a16);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::edgesOfNode(uint64_t a1, sqlite3_int64 a2, _QWORD *a3, unsigned int a4)
{
  degas::NodeCursor *v8;
  _QWORD *v9;
  uint64_t v10;

  v8 = (degas::NodeCursor *)operator new();
  degas::NodeCursor::NodeCursor(v8);
  v9 = degas::NodeCursor::setForIdentifier(v8, a2, (const degas::NodeTable *)(a1 + 192));
  v10 = degas::Database::edgesOfNodes((uint64_t)v9, (sqlite3_stmt ***)v8, a3, a4);
  degas::Cursor::~Cursor((degas::Statement **)v8);
  MEMORY[0x1CAA4ADC8]();
  return v10;
}

void sub_1CA1DF488(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1CAA4ADC8](v1, 0x20C40A4A59CD2);
  _Unwind_Resume(a1);
}

degas::Statement **std::unique_ptr<degas::NodeCursor>::reset[abi:ne180100](degas::Statement ***a1)
{
  degas::Statement **result;

  result = *a1;
  *a1 = 0;
  if (result)
  {
    degas::Cursor::~Cursor(result);
    JUMPOUT(0x1CAA4ADC8);
  }
  return result;
}

uint64_t degas::Database::edgesOfNodes(uint64_t a1, Bitmap *a2, _QWORD *a3, unsigned int a4)
{
  degas::NodeCursor *v8;
  _QWORD *v9;
  uint64_t v10;

  v8 = (degas::NodeCursor *)operator new();
  degas::NodeCursor::NodeCursor(v8);
  v9 = degas::NodeCursor::setForIdentifiers(v8, a2, (const degas::NodeTable *)(a1 + 192));
  v10 = degas::Database::edgesOfNodes((uint64_t)v9, (sqlite3_stmt ***)v8, a3, a4);
  degas::Cursor::~Cursor((degas::Statement **)v8);
  MEMORY[0x1CAA4ADC8]();
  return v10;
}

void sub_1CA1DF5A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1CAA4ADC8](v1, 0x20C40A4A59CD2);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::filterEdgesOfNodes(uint64_t a1, Bitmap *a2, degas::Bitmap *a3, _QWORD *a4, unsigned int a5)
{
  degas::NodeCursor *v10;
  _QWORD *v11;
  uint64_t v12;
  __int128 v14;
  _BYTE v15[32];
  degas::NodeCursor *v16;
  void **v17;

  v10 = (degas::NodeCursor *)operator new();
  degas::NodeCursor::NodeCursor(v10);
  v16 = v10;
  v11 = degas::NodeCursor::setForIdentifiers(v10, a2, (const degas::NodeTable *)(a1 + 192));
  v14 = 0u;
  memset(v15, 0, 25);
  v12 = degas::Database::edgesOfNodes((uint64_t)v11, (sqlite3_stmt ***)v10, &v14, a5);
  if (!(_DWORD)v12)
  {
    degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)&v14, a3);
    degas::Bitmap::operator=(a4, &v14);
  }
  v17 = (void **)v15;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v17);
  degas::Cursor::~Cursor((degas::Statement **)v10);
  MEMORY[0x1CAA4ADC8]();
  return v12;
}

void sub_1CA1DF6C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  std::unique_ptr<degas::NodeCursor>::reset[abi:ne180100]((degas::Statement ***)va);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::filterEdgesBetweenNodes(degas::Database *this, const degas::Bitmap *a2, Bitmap *a3, const degas::Bitmap *a4, degas::Bitmap *a5)
{
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  __int128 v14;
  _BYTE v15[40];
  void **v16;

  v14 = 0u;
  memset(v15, 0, 25);
  v10 = degas::Bitmap::count(a2);
  if (v10 <= degas::Bitmap::count((degas::Bitmap *)a3))
  {
    v11 = degas::Database::filterEdgesOfNodes((uint64_t)this, (Bitmap *)a2, a4, &v14, 1u);
    if (!(_DWORD)v11)
    {
      v12 = 2;
      goto LABEL_6;
    }
  }
  else
  {
    v11 = degas::Database::filterEdgesOfNodes((uint64_t)this, a3, a4, &v14, 2u);
    if (!(_DWORD)v11)
    {
      v12 = 1;
      a3 = (Bitmap *)a2;
LABEL_6:
      v11 = degas::Database::filterEdgesOfNodes((uint64_t)this, a3, (degas::Bitmap *)&v14, a5, v12);
    }
  }
  v16 = (void **)v15;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v16);
  return v11;
}

void sub_1CA1DF7F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void **a16)
{
  a16 = (void **)&a11;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a16);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::edgesBetweenNodes(degas::Database *this, const degas::Bitmap *a2, Bitmap *a3, degas::Bitmap *a4)
{
  unint64_t v8;
  uint64_t v9;
  unsigned int v10;
  __int128 v12;
  _BYTE v13[40];
  void **v14;

  v12 = 0u;
  memset(v13, 0, 25);
  v8 = degas::Bitmap::count(a2);
  if (v8 <= degas::Bitmap::count((degas::Bitmap *)a3))
  {
    v9 = degas::Database::edgesOfNodes((uint64_t)this, (Bitmap *)a2, &v12, 1u);
    if (!(_DWORD)v9)
    {
      v10 = 2;
      goto LABEL_6;
    }
  }
  else
  {
    v9 = degas::Database::edgesOfNodes((uint64_t)this, a3, &v12, 2u);
    if (!(_DWORD)v9)
    {
      v10 = 1;
      a3 = (Bitmap *)a2;
LABEL_6:
      v9 = degas::Database::filterEdgesOfNodes((uint64_t)this, a3, (degas::Bitmap *)&v12, a4, v10);
    }
  }
  v14 = (void **)v13;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v14);
  return v9;
}

void sub_1CA1DF8F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void **a16)
{
  a16 = (void **)&a11;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a16);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::nodeNeighbors(degas::Database *a1, sqlite3_stmt ***a2, _QWORD *a3, unsigned int a4)
{
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  _DWORD *v12;
  Bitmap v14;
  Bitmap v15;
  __int128 v16;
  _BYTE v17[40];
  vector<degas::BitsetPtr, std::allocator<degas::BitsetPtr>> *p_bitSets;

  v16 = 0u;
  memset(v17, 0, 25);
  memset(&v15, 0, 41);
  v8 = a4 & 0xFFFFFFFD;
  memset(&v14, 0, 41);
  while (1)
  {
    v9 = degas::Statement::next(*a2);
    v10 = v9;
    if ((_DWORD)v9 != 1)
      break;
    if (a4 <= 1)
    {
      v11 = sqlite3_column_blob(**a2, 3);
      if (v11[1])
        degas::Bitmap::unionWith<degas::LiteralBitmap>((degas::Bitmap *)&v15, (uint64_t)v11);
    }
    if (!v8)
    {
      v12 = sqlite3_column_blob(**a2, 2);
      if (v12[1])
        degas::Bitmap::unionWith<degas::LiteralBitmap>((degas::Bitmap *)&v14, (uint64_t)v12);
    }
  }
  if ((_DWORD)v9 == 2)
  {
    if (v15._bitSets.__begin_ != v15._bitSets.__end_)
      degas::Database::appendTargetNodesForEdges(a1, &v15, (degas::Bitmap *)&v16);
    if (v14._bitSets.__begin_ != v14._bitSets.__end_)
      degas::Database::appendSourceNodesForEdges(a1, &v14, (degas::Bitmap *)&v16);
    degas::Bitmap::operator=(a3, &v16);
    v10 = 0;
  }
  p_bitSets = &v14._bitSets;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_bitSets);
  v14._bitCount = (unint64_t)&v15._bitSets;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);
  v15._bitCount = (unint64_t)v17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v15);
  return v10;
}

void sub_1CA1DFA74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  uint64_t v23;

  *(_QWORD *)(v23 - 56) = &a11;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v23 - 56));
  a9 = (void **)&a17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a9);
  a15 = (void **)&a23;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a15);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::nodeNeighbors(uint64_t a1, unint64_t a2, degas::Bitmap *a3, unsigned int a4)
{
  uint64_t v7;
  Bitmap v9;
  vector<degas::BitsetPtr, std::allocator<degas::BitsetPtr>> *p_bitSets;

  memset(&v9, 0, 41);
  degas::Bitmap::setBit((degas::Bitmap *)&v9, a2);
  v7 = degas::Database::nodeNeighbors(a1, &v9, a3, a4);
  p_bitSets = &v9._bitSets;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_bitSets);
  return v7;
}

void sub_1CA1DFB4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void **a16)
{
  uint64_t v16;

  a16 = (void **)(v16 + 16);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a16);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::nodeNeighbors(uint64_t a1, Bitmap *a2, degas::Bitmap *a3, unsigned int a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  degas::Statement *v12[2];
  __int128 v13;
  _BYTE v14[32];

  if (a4 > 1)
  {
    v9 = 0;
  }
  else
  {
    v13 = 0u;
    memset(v14, 0, 25);
    degas::LabelledEdgeCursor::LabelledEdgeCursor(v12);
    degas::LabelledEdgeCursor::setForTargetNodesFromSourceNodes((degas::LabelledEdgeCursor *)v12, a2, (const degas::LabelledEdgeTable *)(a1 + 1144));
    while (1)
    {
      v8 = degas::Statement::next((sqlite3_stmt **)v12[0]);
      v9 = v8;
      if ((_DWORD)v8 != 1)
        break;
      degas::Statement::bitmapColumnValue((sqlite3_stmt **)v12[0], 0, (degas::Bitmap *)&v13);
    }
    if ((_DWORD)v8 == 2)
    {
      degas::Bitmap::operator=(a3, &v13);
      v9 = 0;
    }
    degas::Cursor::~Cursor(v12);
    v12[0] = (degas::Statement *)v14;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v12);
  }
  if ((a4 & 0xFFFFFFFD) == 0)
  {
    v13 = 0u;
    memset(v14, 0, 25);
    degas::LabelledEdgeCursor::LabelledEdgeCursor(v12);
    degas::LabelledEdgeCursor::setForSourceNodesFromTargetNodes((degas::LabelledEdgeCursor *)v12, a2, (const degas::LabelledEdgeTable *)(a1 + 1144));
    while (1)
    {
      v10 = degas::Statement::next((sqlite3_stmt **)v12[0]);
      v9 = v10;
      if ((_DWORD)v10 != 1)
        break;
      degas::Statement::bitmapColumnValue((sqlite3_stmt **)v12[0], 0, (degas::Bitmap *)&v13);
    }
    if ((_DWORD)v10 == 2)
    {
      degas::Bitmap::unionWith<degas::Bitmap>(a3, (uint64_t)&v13);
      v9 = 0;
    }
    degas::Cursor::~Cursor(v12);
    v12[0] = (degas::Statement *)v14;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v12);
  }
  return v9;
}

void sub_1CA1DFCC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  a9 = (void **)&a13;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::nodeNeighbors(uint64_t a1, Bitmap *a2, degas::Bitmap *a3, const degas::Bitmap *a4, unsigned int a5)
{
  uint64_t *TargetNodesByLabelIdentifiersSourceNodeIdentifiers;
  uint64_t v11;
  uint64_t v12;
  uint64_t *SourceNodesByLabelIdentifiersTargetNodeIdentifiers;
  uint64_t v14;
  degas::Statement *v16[2];
  __int128 v17;
  _BYTE v18[32];

  if (a5 > 1)
  {
    v12 = 0;
  }
  else
  {
    v17 = 0u;
    memset(v18, 0, 25);
    degas::LabelledEdgeCursor::LabelledEdgeCursor(v16);
    TargetNodesByLabelIdentifiersSourceNodeIdentifiers = degas::LabelledEdgeTable::prepareStatementToReadTargetNodesByLabelIdentifiersSourceNodeIdentifiers((degas::LabelledEdgeTable *)(a1 + 1144), a4, a2);
    std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v16, *TargetNodesByLabelIdentifiersSourceNodeIdentifiers, TargetNodesByLabelIdentifiersSourceNodeIdentifiers[1]);
    while (1)
    {
      v11 = degas::Statement::next((sqlite3_stmt **)v16[0]);
      v12 = v11;
      if ((_DWORD)v11 != 1)
        break;
      degas::Statement::bitmapColumnValue((sqlite3_stmt **)v16[0], 0, (degas::Bitmap *)&v17);
    }
    if ((_DWORD)v11 == 2)
    {
      degas::Bitmap::operator=(a3, &v17);
      v12 = 0;
    }
    degas::Cursor::~Cursor(v16);
    v16[0] = (degas::Statement *)v18;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v16);
  }
  if ((a5 & 0xFFFFFFFD) == 0)
  {
    v17 = 0u;
    memset(v18, 0, 25);
    degas::LabelledEdgeCursor::LabelledEdgeCursor(v16);
    SourceNodesByLabelIdentifiersTargetNodeIdentifiers = degas::LabelledEdgeTable::prepareStatementToReadSourceNodesByLabelIdentifiersTargetNodeIdentifiers((degas::LabelledEdgeTable *)(a1 + 1144), a4, a2);
    std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v16, *SourceNodesByLabelIdentifiersTargetNodeIdentifiers, SourceNodesByLabelIdentifiersTargetNodeIdentifiers[1]);
    while (1)
    {
      v14 = degas::Statement::next((sqlite3_stmt **)v16[0]);
      v12 = v14;
      if ((_DWORD)v14 != 1)
        break;
      degas::Statement::bitmapColumnValue((sqlite3_stmt **)v16[0], 0, (degas::Bitmap *)&v17);
    }
    if ((_DWORD)v14 == 2)
    {
      degas::Bitmap::unionWith<degas::Bitmap>(a3, (uint64_t)&v17);
      v12 = 0;
    }
    degas::Cursor::~Cursor(v16);
    v16[0] = (degas::Statement *)v18;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v16);
  }
  return v12;
}

void sub_1CA1DFE7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  a9 = (void **)&a13;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::nodeNeighborsViaEdges(degas::Database *a1, sqlite3_stmt ***a2, degas::Bitmap *a3, _QWORD *a4, unsigned int a5)
{
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  _DWORD *v14;
  Bitmap v16;
  Bitmap v17;
  __int128 v18;
  _BYTE v19[40];
  vector<degas::BitsetPtr, std::allocator<degas::BitsetPtr>> *p_bitSets;

  v18 = 0u;
  memset(v19, 0, 25);
  memset(&v17, 0, 41);
  v10 = a5 & 0xFFFFFFFD;
  memset(&v16, 0, 41);
  while (1)
  {
    v11 = degas::Statement::next(*a2);
    v12 = v11;
    if ((_DWORD)v11 != 1)
      break;
    if (a5 <= 1)
    {
      v13 = sqlite3_column_blob(**a2, 3);
      if (v13[1])
        degas::Bitmap::unionWith<degas::LiteralBitmap>((degas::Bitmap *)&v17, (uint64_t)v13);
    }
    if (!v10)
    {
      v14 = sqlite3_column_blob(**a2, 2);
      if (v14[1])
        degas::Bitmap::unionWith<degas::LiteralBitmap>((degas::Bitmap *)&v16, (uint64_t)v14);
    }
  }
  if ((_DWORD)v11 == 2)
  {
    if (v17._bitSets.__begin_ != v17._bitSets.__end_)
    {
      degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)&v17, a3);
      degas::Database::appendTargetNodesForEdges(a1, &v17, (degas::Bitmap *)&v18);
    }
    if (v16._bitSets.__begin_ != v16._bitSets.__end_)
    {
      degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)&v16, a3);
      degas::Database::appendSourceNodesForEdges(a1, &v16, (degas::Bitmap *)&v18);
    }
    degas::Bitmap::operator=(a4, &v18);
    v12 = 0;
  }
  p_bitSets = &v16._bitSets;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_bitSets);
  v16._bitCount = (unint64_t)&v17._bitSets;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v16);
  v17._bitCount = (unint64_t)v19;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v17);
  return v12;
}

void sub_1CA1E003C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  uint64_t v23;

  *(_QWORD *)(v23 - 72) = &a11;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v23 - 72));
  a9 = (void **)&a17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a9);
  a15 = (void **)&a23;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a15);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::nodeNeighborsViaEdges(uint64_t a1, unint64_t a2, Bitmap *a3, degas::Bitmap *a4, unsigned int a5)
{
  uint64_t v9;
  Bitmap v11;
  vector<degas::BitsetPtr, std::allocator<degas::BitsetPtr>> *p_bitSets;

  memset(&v11, 0, 41);
  degas::Bitmap::setBit((degas::Bitmap *)&v11, a2);
  v9 = degas::Database::nodeNeighborsViaEdges(a1, &v11, a3, a4, a5);
  p_bitSets = &v11._bitSets;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_bitSets);
  return v9;
}

void sub_1CA1E011C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void **a16)
{
  uint64_t v16;

  a16 = (void **)(v16 + 16);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a16);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::nodeNeighborsViaEdges(uint64_t a1, Bitmap *a2, Bitmap *a3, degas::Bitmap *a4, unsigned int a5)
{
  uint64_t *TargetNodesByEdgeIdentifiersSourceNodeIdentifiersJoinBoth;
  uint64_t v11;
  uint64_t v12;
  uint64_t *SourceNodesByEdgeIdentifiersTargetNodeIdentifiersJoinBoth;
  uint64_t v14;
  degas::Statement *v16[2];
  __int128 v17;
  _BYTE v18[32];

  if (a5 > 1)
  {
    v12 = 0;
  }
  else
  {
    v17 = 0u;
    memset(v18, 0, 25);
    degas::LabelledEdgeCursor::LabelledEdgeCursor(v16);
    TargetNodesByEdgeIdentifiersSourceNodeIdentifiersJoinBoth = degas::LabelledEdgeTable::prepareStatementToReadTargetNodesByEdgeIdentifiersSourceNodeIdentifiersJoinBoth((degas::LabelledEdgeTable *)(a1 + 1144), a3, a2);
    std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v16, *TargetNodesByEdgeIdentifiersSourceNodeIdentifiersJoinBoth, TargetNodesByEdgeIdentifiersSourceNodeIdentifiersJoinBoth[1]);
    while (1)
    {
      v11 = degas::Statement::next((sqlite3_stmt **)v16[0]);
      v12 = v11;
      if ((_DWORD)v11 != 1)
        break;
      degas::Statement::bitmapColumnValue((sqlite3_stmt **)v16[0], 0, (degas::Bitmap *)&v17);
    }
    if ((_DWORD)v11 == 2)
    {
      degas::Bitmap::operator=(a4, &v17);
      v12 = 0;
    }
    degas::Cursor::~Cursor(v16);
    v16[0] = (degas::Statement *)v18;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v16);
  }
  if ((a5 & 0xFFFFFFFD) == 0)
  {
    v17 = 0u;
    memset(v18, 0, 25);
    degas::LabelledEdgeCursor::LabelledEdgeCursor(v16);
    SourceNodesByEdgeIdentifiersTargetNodeIdentifiersJoinBoth = degas::LabelledEdgeTable::prepareStatementToReadSourceNodesByEdgeIdentifiersTargetNodeIdentifiersJoinBoth((degas::LabelledEdgeTable *)(a1 + 1144), a3, a2);
    std::shared_ptr<degas::Statement>::operator=[abi:ne180100](v16, *SourceNodesByEdgeIdentifiersTargetNodeIdentifiersJoinBoth, SourceNodesByEdgeIdentifiersTargetNodeIdentifiersJoinBoth[1]);
    while (1)
    {
      v14 = degas::Statement::next((sqlite3_stmt **)v16[0]);
      v12 = v14;
      if ((_DWORD)v14 != 1)
        break;
      degas::Statement::bitmapColumnValue((sqlite3_stmt **)v16[0], 0, (degas::Bitmap *)&v17);
    }
    if ((_DWORD)v14 == 2)
    {
      degas::Bitmap::unionWith<degas::Bitmap>(a4, (uint64_t)&v17);
      v12 = 0;
    }
    degas::Cursor::~Cursor(v16);
    v16[0] = (degas::Statement *)v18;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v16);
  }
  return v12;
}

void sub_1CA1E02B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  a9 = (void **)&a13;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::addAttribute(uint64_t a1, _QWORD *a2, uint64_t *a3)
{
  uint64_t result;
  sqlite3_int64 v5;

  if (*(_BYTE *)(a1 + 32))
    return 8;
  v5 = 0;
  result = degas::AttributeTable::insert(a1 + 304, &v5, a3);
  if (!(_DWORD)result)
    *a2 = v5;
  return result;
}

uint64_t degas::Database::getAttributeProperties(uint64_t a1, sqlite3_int64 a2, uint64_t a3)
{
  uint64_t v4;
  degas::Statement *v6[2];

  degas::AttributeCursor::AttributeCursor((degas::AttributeCursor *)v6, a2, (const degas::AttributeTable *)(a1 + 304));
  if (degas::Statement::next((sqlite3_stmt **)v6[0]) == 1)
  {
    degas::Statement::stringColumnValue((sqlite3_stmt **)v6[0], 1, a3);
    v4 = 0;
  }
  else
  {
    v4 = 2;
  }
  degas::Cursor::~Cursor(v6);
  return v4;
}

void sub_1CA1E03A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::removeAttribute(degas::Database *this, sqlite3_int64 a2)
{
  if (*((_BYTE *)this + 32))
    return 8;
  else
    return degas::AttributeTable::deleteEntry((degas::Database *)((char *)this + 304), a2);
}

uint64_t degas::Database::nodeAttributeValue(degas::Database *this, sqlite3_int64 a2, sqlite3_int64 a3, uint64_t *a4)
{
  uint64_t *v5;
  degas::Statement *v6;
  degas::Statement *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  degas::Statement *v12[2];

  v5 = degas::AttributeValueTable::prepareStatementToReadByAttrIdIdentifier((degas::Database *)((char *)this + 360), a3, a2);
  v6 = (degas::Statement *)*v5;
  v7 = (degas::Statement *)v5[1];
  v12[0] = v6;
  v12[1] = v7;
  if (v7)
  {
    v8 = (unint64_t *)((char *)v7 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  if (degas::Statement::next((sqlite3_stmt **)v6) == 1)
  {
    v10 = 0;
    *a4 = sqlite3_column_int64(*(sqlite3_stmt **)v12[0], 2);
  }
  else
  {
    v10 = 2;
  }
  degas::Cursor::~Cursor(v12);
  return v10;
}

void sub_1CA1E046C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::nodeAttributeValue(degas::Database *this, sqlite3_int64 a2, sqlite3_int64 a3, double *a4)
{
  uint64_t *v5;
  degas::Statement *v6;
  degas::Statement *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  degas::Statement *v12[2];

  v5 = degas::AttributeValueTable::prepareStatementToReadByAttrIdIdentifier((degas::Database *)((char *)this + 360), a3, a2);
  v6 = (degas::Statement *)*v5;
  v7 = (degas::Statement *)v5[1];
  v12[0] = v6;
  v12[1] = v7;
  if (v7)
  {
    v8 = (unint64_t *)((char *)v7 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  if (degas::Statement::next((sqlite3_stmt **)v6) == 1)
  {
    v10 = 0;
    *a4 = sqlite3_column_double(*(sqlite3_stmt **)v12[0], 3);
  }
  else
  {
    v10 = 2;
  }
  degas::Cursor::~Cursor(v12);
  return v10;
}

void sub_1CA1E0518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::nodeAttributeValue(uint64_t a1, sqlite3_int64 a2, sqlite3_int64 a3, uint64_t a4)
{
  uint64_t *v5;
  degas::Statement *v6;
  degas::Statement *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  degas::Statement *v12[2];

  v5 = degas::AttributeValueTable::prepareStatementToReadByAttrIdIdentifier((degas::AttributeValueTable *)(a1 + 360), a3, a2);
  v6 = (degas::Statement *)*v5;
  v7 = (degas::Statement *)v5[1];
  v12[0] = v6;
  v12[1] = v7;
  if (v7)
  {
    v8 = (unint64_t *)((char *)v7 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  if (degas::Statement::next((sqlite3_stmt **)v6) == 1)
  {
    degas::Statement::stringColumnValue((sqlite3_stmt **)v12[0], 4, a4);
    v10 = 0;
  }
  else
  {
    v10 = 2;
  }
  degas::Cursor::~Cursor(v12);
  return v10;
}

void sub_1CA1E05C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::edgeAttributeValue(degas::Database *this, sqlite3_int64 a2, sqlite3_int64 a3, uint64_t *a4)
{
  uint64_t *v5;
  degas::Statement *v6;
  degas::Statement *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  degas::Statement *v12[2];

  v5 = degas::AttributeValueTable::prepareStatementToReadByAttrIdIdentifier((degas::Database *)((char *)this + 416), a3, a2);
  v6 = (degas::Statement *)*v5;
  v7 = (degas::Statement *)v5[1];
  v12[0] = v6;
  v12[1] = v7;
  if (v7)
  {
    v8 = (unint64_t *)((char *)v7 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  if (degas::Statement::next((sqlite3_stmt **)v6) == 1)
  {
    v10 = 0;
    *a4 = sqlite3_column_int64(*(sqlite3_stmt **)v12[0], 2);
  }
  else
  {
    v10 = 2;
  }
  degas::Cursor::~Cursor(v12);
  return v10;
}

void sub_1CA1E066C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::edgeAttributeValue(degas::Database *this, sqlite3_int64 a2, sqlite3_int64 a3, double *a4)
{
  uint64_t *v5;
  degas::Statement *v6;
  degas::Statement *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  degas::Statement *v12[2];

  v5 = degas::AttributeValueTable::prepareStatementToReadByAttrIdIdentifier((degas::Database *)((char *)this + 416), a3, a2);
  v6 = (degas::Statement *)*v5;
  v7 = (degas::Statement *)v5[1];
  v12[0] = v6;
  v12[1] = v7;
  if (v7)
  {
    v8 = (unint64_t *)((char *)v7 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  if (degas::Statement::next((sqlite3_stmt **)v6) == 1)
  {
    v10 = 0;
    *a4 = sqlite3_column_double(*(sqlite3_stmt **)v12[0], 3);
  }
  else
  {
    v10 = 2;
  }
  degas::Cursor::~Cursor(v12);
  return v10;
}

void sub_1CA1E0718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::edgeAttributeValue(uint64_t a1, sqlite3_int64 a2, sqlite3_int64 a3, uint64_t a4)
{
  uint64_t *v5;
  degas::Statement *v6;
  degas::Statement *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  degas::Statement *v12[2];

  v5 = degas::AttributeValueTable::prepareStatementToReadByAttrIdIdentifier((degas::AttributeValueTable *)(a1 + 416), a3, a2);
  v6 = (degas::Statement *)*v5;
  v7 = (degas::Statement *)v5[1];
  v12[0] = v6;
  v12[1] = v7;
  if (v7)
  {
    v8 = (unint64_t *)((char *)v7 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  if (degas::Statement::next((sqlite3_stmt **)v6) == 1)
  {
    degas::Statement::stringColumnValue((sqlite3_stmt **)v12[0], 4, a4);
    v10 = 0;
  }
  else
  {
    v10 = 2;
  }
  degas::Cursor::~Cursor(v12);
  return v10;
}

void sub_1CA1E07C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
  degas::Cursor::~Cursor(&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::setNodeAttributeValue(degas::Database *this, unint64_t a2, sqlite3_int64 a3, sqlite3_int64 a4)
{
  uint64_t result;

  if (*((_BYTE *)this + 32))
    return 8;
  result = degas::AttributeValueTable::insertOrUpdate((degas::Database *)((char *)this + 360), a3, a2, a4);
  if (!(_DWORD)result)
  {
    if ((*((_WORD *)this + 678) & 0x10) != 0)
      degas::Database::TransactionChanges::updateNode((degas::Database *)((char *)this + 1360), a2);
    return 0;
  }
  return result;
}

uint64_t degas::Database::setNodeAttributeValueUnsigned(degas::Database *this, unint64_t a2, sqlite3_int64 a3, sqlite3_int64 a4)
{
  uint64_t result;

  if (*((_BYTE *)this + 32))
    return 8;
  result = degas::AttributeValueTable::insertOrUpdateUnsigned((degas::Database *)((char *)this + 360), a3, a2, a4);
  if (!(_DWORD)result)
  {
    if ((*((_WORD *)this + 678) & 0x10) != 0)
      degas::Database::TransactionChanges::updateNode((degas::Database *)((char *)this + 1360), a2);
    return 0;
  }
  return result;
}

uint64_t degas::Database::setNodeAttributeValue(degas::Database *this, unint64_t a2, sqlite3_int64 a3, double a4)
{
  uint64_t result;

  if (*((_BYTE *)this + 32))
    return 8;
  result = degas::AttributeValueTable::insertOrUpdate((degas::Database *)((char *)this + 360), a3, a2, a4);
  if (!(_DWORD)result)
  {
    if ((*((_WORD *)this + 678) & 0x10) != 0)
      degas::Database::TransactionChanges::updateNode((degas::Database *)((char *)this + 1360), a2);
    return 0;
  }
  return result;
}

uint64_t degas::Database::setNodeAttributeValue(uint64_t a1, unint64_t a2, sqlite3_int64 a3, uint64_t *a4)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 32))
    return 8;
  result = degas::AttributeValueTable::insertOrUpdate(a1 + 360, a3, a2, a4);
  if (!(_DWORD)result)
  {
    if ((*(_WORD *)(a1 + 1356) & 0x10) != 0)
      degas::Database::TransactionChanges::updateNode((degas::Database::TransactionChanges *)(a1 + 1360), a2);
    return 0;
  }
  return result;
}

uint64_t degas::Database::removeNodeAttributeValues(degas::Database *this, unint64_t a2, const degas::Bitmap *a3)
{
  uint64_t result;
  uint64_t v7;
  BOOL v8;
  unint64_t v10;
  sqlite3_int64 v11;
  uint64_t v12;

  if (*((_BYTE *)this + 32))
    return 8;
  degas::Bitmap::begin(a3, &v10);
  v7 = *((_QWORD *)a3 + 3);
  while (1)
  {
    v8 = (const degas::Bitmap *)v10 == a3 && v11 == -1;
    if (v8 && v12 == v7)
      break;
    result = degas::AttributeValueTable::deleteValue((degas::Database *)((char *)this + 360), v11, a2);
    if ((_DWORD)result)
      return result;
    degas::Bitmap::iterator::operator++(&v10);
  }
  if ((*((_WORD *)this + 678) & 0x10) != 0)
    degas::Database::TransactionChanges::updateNode((degas::Database *)((char *)this + 1360), a2);
  return 0;
}

uint64_t degas::Database::setEdgeAttributeValue(degas::Database *this, unint64_t a2, sqlite3_int64 a3, sqlite3_int64 a4)
{
  uint64_t result;

  if (*((_BYTE *)this + 32))
    return 8;
  result = degas::AttributeValueTable::insertOrUpdate((degas::Database *)((char *)this + 416), a3, a2, a4);
  if (!(_DWORD)result)
  {
    if ((*((_WORD *)this + 678) & 0x10) != 0)
      degas::Database::TransactionChanges::updateEdge((degas::Database *)((char *)this + 1360), a2);
    return 0;
  }
  return result;
}

uint64_t degas::Database::TransactionChanges::updateEdge(degas::Database::TransactionChanges *this, unint64_t a2)
{
  uint64_t result;

  result = degas::Bitmap::isSet((degas::Database::TransactionChanges *)((char *)this + 48), a2);
  if ((result & 1) == 0)
  {
    result = degas::Bitmap::isSet((degas::Database::TransactionChanges *)((char *)this + 240), a2);
    if ((result & 1) == 0)
      return degas::Bitmap::setBit((degas::Database::TransactionChanges *)((char *)this + 144), a2);
  }
  return result;
}

uint64_t degas::Database::setEdgeAttributeValueUnsigned(degas::Database *this, unint64_t a2, sqlite3_int64 a3, sqlite3_int64 a4)
{
  uint64_t result;

  if (*((_BYTE *)this + 32))
    return 8;
  result = degas::AttributeValueTable::insertOrUpdateUnsigned((degas::Database *)((char *)this + 416), a3, a2, a4);
  if (!(_DWORD)result)
  {
    if ((*((_WORD *)this + 678) & 0x10) != 0)
      degas::Database::TransactionChanges::updateEdge((degas::Database *)((char *)this + 1360), a2);
    return 0;
  }
  return result;
}

uint64_t degas::Database::setEdgeAttributeValue(degas::Database *this, unint64_t a2, sqlite3_int64 a3, double a4)
{
  uint64_t result;

  if (*((_BYTE *)this + 32))
    return 8;
  result = degas::AttributeValueTable::insertOrUpdate((degas::Database *)((char *)this + 416), a3, a2, a4);
  if (!(_DWORD)result)
  {
    if ((*((_WORD *)this + 678) & 0x10) != 0)
      degas::Database::TransactionChanges::updateEdge((degas::Database *)((char *)this + 1360), a2);
    return 0;
  }
  return result;
}

uint64_t degas::Database::setEdgeAttributeValue(uint64_t a1, unint64_t a2, sqlite3_int64 a3, uint64_t *a4)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 32))
    return 8;
  result = degas::AttributeValueTable::insertOrUpdate(a1 + 416, a3, a2, a4);
  if (!(_DWORD)result)
  {
    if ((*(_WORD *)(a1 + 1356) & 0x10) != 0)
      degas::Database::TransactionChanges::updateEdge((degas::Database::TransactionChanges *)(a1 + 1360), a2);
    return 0;
  }
  return result;
}

uint64_t degas::Database::removeEdgeAttributeValues(degas::Database *this, unint64_t a2, const degas::Bitmap *a3)
{
  uint64_t result;
  uint64_t v7;
  BOOL v8;
  unint64_t v10;
  sqlite3_int64 v11;
  uint64_t v12;

  if (*((_BYTE *)this + 32))
    return 8;
  degas::Bitmap::begin(a3, &v10);
  v7 = *((_QWORD *)a3 + 3);
  while (1)
  {
    v8 = (const degas::Bitmap *)v10 == a3 && v11 == -1;
    if (v8 && v12 == v7)
      break;
    result = degas::AttributeValueTable::deleteValue((degas::Database *)((char *)this + 416), v11, a2);
    if ((_DWORD)result)
      return result;
    degas::Bitmap::iterator::operator++(&v10);
  }
  if ((*((_WORD *)this + 678) & 0x10) != 0)
    degas::Database::TransactionChanges::updateEdge((degas::Database *)((char *)this + 1360), a2);
  return 0;
}

uint64_t degas::Database::enumerateTransactionChangesAfterTransactionId(uint64_t a1, sqlite3_int64 a2, unsigned int a3, uint64_t a4)
{
  unsigned int v4;
  void **v5;
  const degas::LiteralBitmap *v6;
  const degas::LiteralBitmap *v7;
  const degas::LiteralBitmap *v8;
  const degas::LiteralBitmap *v9;
  const degas::LiteralBitmap *v10;
  const degas::LiteralBitmap *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v16[16];
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
  degas::Statement *v28[2];
  void **v29[2];

  degas::TransactionLogCursor::TransactionLogCursor((degas::TransactionLogCursor *)v28, a2, a3, (const degas::TransactionLogTable *)(a1 + 696));
  while (1)
  {
    v4 = degas::Statement::next((sqlite3_stmt **)v28[0]);
    if (v4 != 1)
      break;
    v5 = (void **)sqlite3_column_int64(*(sqlite3_stmt **)v28[0], 0);
    v6 = (const degas::LiteralBitmap *)sqlite3_column_blob(*(sqlite3_stmt **)v28[0], 1);
    v7 = (const degas::LiteralBitmap *)sqlite3_column_blob(*(sqlite3_stmt **)v28[0], 2);
    v8 = (const degas::LiteralBitmap *)sqlite3_column_blob(*(sqlite3_stmt **)v28[0], 3);
    v9 = (const degas::LiteralBitmap *)sqlite3_column_blob(*(sqlite3_stmt **)v28[0], 4);
    v10 = (const degas::LiteralBitmap *)sqlite3_column_blob(*(sqlite3_stmt **)v28[0], 5);
    v11 = (const degas::LiteralBitmap *)sqlite3_column_blob(*(sqlite3_stmt **)v28[0], 6);
    degas::Bitmap::Bitmap((degas::Bitmap *)v16, v6);
    degas::Bitmap::Bitmap((degas::Bitmap *)&v18, v7);
    degas::Bitmap::Bitmap((degas::Bitmap *)&v20, v8);
    degas::Bitmap::Bitmap((degas::Bitmap *)&v22, v9);
    degas::Bitmap::Bitmap((degas::Bitmap *)&v24, v10);
    degas::Bitmap::Bitmap((degas::Bitmap *)&v26, v11);
    v29[0] = v5;
    v12 = *(_QWORD *)(a4 + 24);
    if (!v12)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t, void ***, _BYTE *))(*(_QWORD *)v12 + 48))(v12, v29, v16);
    v29[0] = (void **)&v27;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v29);
    v29[0] = (void **)&v25;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v29);
    v29[0] = (void **)&v23;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v29);
    v29[0] = (void **)&v21;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v29);
    v29[0] = (void **)&v19;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v29);
    v29[0] = (void **)&v17;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v29);
  }
  if (v4 == 2)
    v13 = 0;
  else
    v13 = v4;
  degas::Cursor::~Cursor(v28);
  return v13;
}

void sub_1CA1E0E74(_Unwind_Exception *a1)
{
  uint64_t v1;

  degas::Cursor::~Cursor((degas::Statement **)(v1 - 112));
  _Unwind_Resume(a1);
}

void degas::Database::cursorForAdhocStatement(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  sqlite3_stmt **v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v6 = (sqlite3_stmt **)operator new();
  degas::Statement::Statement(v6, *(sqlite3 **)(a1 + 24), a2);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(&v13, (uint64_t)v6);
  v7 = v14;
  *a3 = v13;
  a3[1] = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
    v10 = v14;
    if (v14)
    {
      v11 = (unint64_t *)&v14->__shared_owners_;
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }
}

void sub_1CA1E0FDC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1CAA4ADC8](v1, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::validateLabelReferences(degas::Database *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 *v6;
  __int128 *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 *v10;
  __int128 *v11;
  __int128 *v12;
  __int128 *v13;
  __int128 *v14;
  __int128 *v15;
  void **v17;
  void **v18;
  void **v19;
  void **v20;
  void *v21[2];
  char v22;
  void **v23;
  __int128 v24;
  __int128 v25;
  char v26;
  __int128 v27;
  uint64_t v28[4];
  __int128 v29;
  uint64_t v30[4];
  __int128 v31;
  uint64_t v32[4];
  degas::Statement *v33[2];
  __int128 v34;
  uint64_t v35[4];
  __int128 __p;
  uint64_t v37[4];
  degas::Statement *v38[2];
  __int128 v39;
  uint64_t v40[4];
  __int128 v41;
  uint64_t v42[4];
  degas::Statement *v43[2];
  uint8_t buf[4];
  void **v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  std::string::basic_string[abi:ne180100]<0>(&v41, "select mergeLiteralBitmap(identifier), literalBitmapUnion(labels) from Node");
  degas::Database::cursorForAdhocStatement((uint64_t)this, (uint64_t)&v41, v43);
  if (SHIBYTE(v42[0]) < 0)
    operator delete((void *)v41);
  v41 = 0u;
  memset(v42, 0, 25);
  v39 = 0u;
  memset(v40, 0, 25);
  while (1)
  {
    v2 = degas::Statement::next((sqlite3_stmt **)v43[0]);
    v3 = v2;
    if ((_DWORD)v2 != 1)
      break;
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v43[0], 0, (degas::Bitmap *)&v41);
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v43[0], 1, (degas::Bitmap *)&v39);
  }
  if ((_DWORD)v2 == 2)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "select mergeLiteralBitmap(identifier), literalBitmapUnion(labels) from Edge");
    degas::Database::cursorForAdhocStatement((uint64_t)this, (uint64_t)&__p, v38);
    if (SHIBYTE(v37[0]) < 0)
      operator delete((void *)__p);
    __p = 0u;
    memset(v37, 0, 25);
    v34 = 0u;
    memset(v35, 0, 25);
    while (1)
    {
      v4 = degas::Statement::next((sqlite3_stmt **)v38[0]);
      v3 = v4;
      if ((_DWORD)v4 != 1)
        break;
      degas::Statement::bitmapColumnValue((sqlite3_stmt **)v38[0], 0, (degas::Bitmap *)&__p);
      degas::Statement::bitmapColumnValue((sqlite3_stmt **)v38[0], 1, (degas::Bitmap *)&v34);
    }
    if ((_DWORD)v4 == 2)
    {
      std::string::basic_string[abi:ne180100]<0>(&v31, "select mergeLiteralBitmap(identifier) L, literalBitmapUnion(nodeIds) N2, literalBitmapUnion(edgeIds) E2 from Label");
      degas::Database::cursorForAdhocStatement((uint64_t)this, (uint64_t)&v31, v33);
      if (SHIBYTE(v32[0]) < 0)
        operator delete((void *)v31);
      v31 = 0u;
      memset(v32, 0, 25);
      memset(v30, 0, 25);
      v29 = 0u;
      v27 = 0u;
      memset(v28, 0, 25);
      while (1)
      {
        v5 = degas::Statement::next((sqlite3_stmt **)v33[0]);
        v3 = v5;
        if ((_DWORD)v5 != 1)
          break;
        degas::Statement::bitmapColumnValue((sqlite3_stmt **)v33[0], 0, (degas::Bitmap *)&v31);
        degas::Statement::bitmapColumnValue((sqlite3_stmt **)v33[0], 1, (degas::Bitmap *)&v29);
        degas::Statement::bitmapColumnValue((sqlite3_stmt **)v33[0], 2, (degas::Bitmap *)&v27);
      }
      if ((_DWORD)v5 == 2)
      {
        v6 = (__int128 *)v40[0];
        v7 = (__int128 *)v40[1];
        v8 = v32[0];
        v9 = v32[1];
        if (degas::Bitmap::isSubsetOf<degas::Bitmap>(v40[0], v40[1], v32[0], v32[1]))
        {
          v3 = 0;
        }
        else
        {
          v23 = (void **)v39;
          v24 = 0u;
          v25 = 0u;
          std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v24 + 8, v6, v7, v7 - v6);
          v26 = v40[3];
          degas::Bitmap::diffWith<degas::Bitmap>((degas::Bitmap *)&v23, (degas::Bitmap *)&v31);
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            degas::Bitmap::description((uint64_t *)v21, (degas::Bitmap *)&v23);
            v17 = v22 >= 0 ? v21 : (void **)v21[0];
            *(_DWORD *)buf = 136315138;
            v45 = v17;
            _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "some node has a label we don't know:%s", buf, 0xCu);
            if (v22 < 0)
              operator delete(v21[0]);
          }
          v21[0] = (char *)&v24 + 8;
          std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v21);
          v3 = 9;
          v8 = v32[0];
          v9 = v32[1];
        }
        v10 = (__int128 *)v35[0];
        v11 = (__int128 *)v35[1];
        if (!degas::Bitmap::isSubsetOf<degas::Bitmap>(v35[0], v35[1], v8, v9))
        {
          v23 = (void **)v34;
          v24 = 0u;
          v25 = 0u;
          std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v24 + 8, v10, v11, v11 - v10);
          v26 = v35[3];
          degas::Bitmap::diffWith<degas::Bitmap>((degas::Bitmap *)&v23, (degas::Bitmap *)&v31);
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            degas::Bitmap::description((uint64_t *)v21, (degas::Bitmap *)&v23);
            v18 = v22 >= 0 ? v21 : (void **)v21[0];
            *(_DWORD *)buf = 136315138;
            v45 = v18;
            _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "some edge has a label we don't know:%s", buf, 0xCu);
            if (v22 < 0)
              operator delete(v21[0]);
          }
          v21[0] = (char *)&v24 + 8;
          std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v21);
          v3 = 9;
        }
        v12 = (__int128 *)v30[0];
        v13 = (__int128 *)v30[1];
        if (!degas::Bitmap::isSubsetOf<degas::Bitmap>(v30[0], v30[1], v42[0], v42[1]))
        {
          v23 = (void **)v29;
          v24 = 0u;
          v25 = 0u;
          std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v24 + 8, v12, v13, v13 - v12);
          v26 = v30[3];
          degas::Bitmap::diffWith<degas::Bitmap>((degas::Bitmap *)&v23, (degas::Bitmap *)&v41);
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            degas::Bitmap::description((uint64_t *)v21, (degas::Bitmap *)&v23);
            v19 = v22 >= 0 ? v21 : (void **)v21[0];
            *(_DWORD *)buf = 136315138;
            v45 = v19;
            _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "some label thinks it has a node we don't know:%s", buf, 0xCu);
            if (v22 < 0)
              operator delete(v21[0]);
          }
          v21[0] = (char *)&v24 + 8;
          std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v21);
          v3 = 9;
        }
        v14 = (__int128 *)v28[0];
        v15 = (__int128 *)v28[1];
        if (!degas::Bitmap::isSubsetOf<degas::Bitmap>(v28[0], v28[1], v37[0], v37[1]))
        {
          v23 = (void **)v27;
          v24 = 0u;
          v25 = 0u;
          std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v24 + 8, v14, v15, v15 - v14);
          v26 = v28[3];
          degas::Bitmap::diffWith<degas::Bitmap>((degas::Bitmap *)&v23, (degas::Bitmap *)&__p);
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            degas::Bitmap::description((uint64_t *)v21, (degas::Bitmap *)&v23);
            if (v22 >= 0)
              v20 = v21;
            else
              v20 = (void **)v21[0];
            *(_DWORD *)buf = 136315138;
            v45 = v20;
            _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "some label thinks it has an edge we don't know:%s", buf, 0xCu);
            if (v22 < 0)
              operator delete(v21[0]);
          }
          v21[0] = (char *)&v24 + 8;
          std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v21);
          v3 = 9;
        }
      }
      v23 = (void **)v28;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v23);
      *(_QWORD *)&v27 = v30;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v27);
      *(_QWORD *)&v29 = v32;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v29);
      degas::Cursor::~Cursor(v33);
    }
    *(_QWORD *)&v31 = v35;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v31);
    *(_QWORD *)&v34 = v37;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v34);
    degas::Cursor::~Cursor(v38);
  }
  *(_QWORD *)&__p = v40;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  *(_QWORD *)&v39 = v42;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v39);
  degas::Cursor::~Cursor(v43);
  return v3;
}

void sub_1CA1E1698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,degas::Statement *a40,uint64_t a41,int *a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,void *a48,uint64_t a49,int a50,__int16 a51,char a52,char a53)
{
  uint64_t v53;

  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  a13 = &a21;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&a13);
  a19 = &a27;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  a25 = &a33;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&a25);
  degas::Cursor::~Cursor(&a40);
  __p = &a44;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  a42 = &a50;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&a42);
  degas::Cursor::~Cursor((degas::Statement **)(v53 - 224));
  a48 = (void *)(v53 - 192);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&a48);
  *(_QWORD *)(v53 - 208) = v53 - 144;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v53 - 208));
  degas::Cursor::~Cursor((degas::Statement **)(v53 - 112));
  _Unwind_Resume(a1);
}

uint64_t degas::Database::releaseSqliteMemory(sqlite3 **this)
{
  return sqlite3_db_release_memory(this[3]);
}

void degas::Database::purgeEmptyBitsetPages(degas::Database *this)
{
  if (degas::getBitsetPool(void)::onceToken != -1)
    dispatch_once(&degas::getBitsetPool(void)::onceToken, &__block_literal_global_3736);
  degas::BitsetPool::purgeEmptyPages((os_unfair_lock_s *)degas::getBitsetPool(void)::sPool);
}

void sub_1CA1E1A30(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CA1E1B5C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CA1E1BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t degas::StatementCacheEntry::StatementCacheEntry(uint64_t result, int a2, _QWORD *a3)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = a3[1];
  *(_QWORD *)result = *a3;
  *(_QWORD *)(result + 8) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  *(_DWORD *)(result + 16) = a2;
  *(_DWORD *)(result + 20) = 1;
  *(_QWORD *)(result + 24) = 0;
  *(_QWORD *)(result + 32) = 0;
  return result;
}

{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = a3[1];
  *(_QWORD *)result = *a3;
  *(_QWORD *)(result + 8) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  *(_DWORD *)(result + 16) = a2;
  *(_DWORD *)(result + 20) = 1;
  *(_QWORD *)(result + 24) = 0;
  *(_QWORD *)(result + 32) = 0;
  return result;
}

double degas::StatementCacheEntry::StatementCacheEntry(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  double result;

  v2 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  result = *(double *)(a2 + 16);
  *(double *)(a1 + 16) = result;
  return result;
}

{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  double result;

  v2 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  result = *(double *)(a2 + 16);
  *(double *)(a1 + 16) = result;
  return result;
}

_QWORD *degas::StatementCacheEntry::operator=(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  result = std::shared_ptr<degas::Statement>::operator=[abi:ne180100]((_QWORD *)a1, *(_QWORD *)a2, *(_QWORD *)(a2 + 8));
  *((_DWORD *)result + 5) = *(_DWORD *)(a2 + 20);
  return result;
}

BOOL degas::StatementCacheEntry::operator==(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16);
}

degas::Statement **degas::StatementCacheEntry::getStatement(degas::Statement **this)
{
  degas::Statement::prepareForUse(*this);
  return this;
}

uint64_t degas::StatementCacheEntry::boostAttention(uint64_t this)
{
  int v1;

  v1 = *(_DWORD *)(this + 20);
  if (v1 <= 3)
    *(_DWORD *)(this + 20) = v1 + 1;
  return this;
}

BOOL degas::StatementCacheEntry::fadeAttention(degas::StatementCacheEntry *this)
{
  int v1;

  v1 = *((_DWORD *)this + 5);
  *((_DWORD *)this + 5) = v1 - 1;
  return v1 < 2;
}

const degas::StatementCacheEntry *degas::StatementCacheEntry::insertInClock(const degas::StatementCacheEntry *this, const degas::StatementCacheEntry *a2)
{
  const degas::StatementCacheEntry *v2;
  uint64_t v3;

  v2 = a2;
  if (a2 != this)
  {
    v3 = *((_QWORD *)a2 + 4);
    *((_QWORD *)this + 4) = v3;
    *(_QWORD *)(v3 + 24) = this;
    v2 = this;
  }
  *((_QWORD *)a2 + 4) = v2;
  *((_QWORD *)this + 3) = a2;
  return this;
}

uint64_t degas::StatementCacheEntry::removeFromClock(degas::StatementCacheEntry *this)
{
  _QWORD *v1;
  degas::StatementCacheEntry *v2;
  uint64_t v3;
  uint64_t result;

  v1 = (_QWORD *)((char *)this + 24);
  v2 = (degas::StatementCacheEntry *)*((_QWORD *)this + 3);
  if (v2 == this)
  {
    result = 0;
  }
  else
  {
    v3 = *((_QWORD *)this + 4);
    *(_QWORD *)(v3 + 24) = v2;
    result = *((_QWORD *)this + 3);
    *(_QWORD *)(result + 32) = v3;
  }
  *v1 = 0;
  v1[1] = 0;
  return result;
}

double degas::StatementCache::StatementCache(degas::StatementCache *this)
{
  double result;

  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 1) = 0;
  *(_QWORD *)this = (char *)this + 8;
  *(_QWORD *)&result = 0x2800000000;
  *((_QWORD *)this + 3) = 0x2800000000;
  *((_QWORD *)this + 4) = 0;
  return result;
}

{
  double result;

  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 1) = 0;
  *(_QWORD *)this = (char *)this + 8;
  *(_QWORD *)&result = 0x2800000000;
  *((_QWORD *)this + 3) = 0x2800000000;
  *((_QWORD *)this + 4) = 0;
  return result;
}

void degas::StatementCache::purgeAllStatements(os_unfair_lock_s *this)
{
  os_unfair_lock_s *v2;

  v2 = this + 6;
  os_unfair_lock_lock(this + 6);
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>>>::destroy(*(_QWORD **)&this[2]._os_unfair_lock_opaque);
  *(_QWORD *)&this->_os_unfair_lock_opaque = this + 2;
  *(_QWORD *)&this[4]._os_unfair_lock_opaque = 0;
  *(_QWORD *)&this[2]._os_unfair_lock_opaque = 0;
  *(_QWORD *)&this[8]._os_unfair_lock_opaque = 0;
  os_unfair_lock_unlock(v2);
}

uint64_t *degas::StatementCache::getStatement(uint64_t a1, unsigned int a2, uint64_t a3)
{
  os_unfair_lock_s *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  BOOL v10;
  uint64_t *v11;
  uint64_t *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  int v16;
  uint64_t v18;
  std::__shared_weak_count *v19;

  v6 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  v7 = *(_QWORD *)(a1 + 8);
  if (!v7)
    goto LABEL_12;
  v8 = a1 + 8;
  do
  {
    v9 = *(_DWORD *)(v7 + 32);
    v10 = v9 >= a2;
    if (v9 >= a2)
      v11 = (uint64_t *)v7;
    else
      v11 = (uint64_t *)(v7 + 8);
    if (v10)
      v8 = v7;
    v7 = *v11;
  }
  while (*v11);
  if (v8 != a1 + 8 && *(_DWORD *)(v8 + 32) <= a2)
  {
    v12 = (uint64_t *)(v8 + 40);
    v16 = *(_DWORD *)(v8 + 60);
    if (v16 <= 3)
      *(_DWORD *)(v8 + 60) = v16 + 1;
  }
  else
  {
LABEL_12:
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(a3 + 16))(&v18, a3);
    *(_DWORD *)(v18 + 20) = a2;
    v12 = degas::StatementCache::addStatement((uint64_t **)a1, a2, &v18);
    v13 = v19;
    if (v19)
    {
      p_shared_owners = (unint64_t *)&v19->__shared_owners_;
      do
        v15 = __ldaxr(p_shared_owners);
      while (__stlxr(v15 - 1, p_shared_owners));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }
  degas::Statement::prepareForUse((degas::Statement *)*v12);
  os_unfair_lock_unlock(v6);
  return v12;
}

void sub_1CA1E24E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<degas::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t *degas::StatementCache::addStatement(uint64_t **a1, unsigned int a2, uint64_t *a3)
{
  uint64_t *v6;
  uint64_t **v7;
  uint64_t **v8;
  unsigned int v9;
  BOOL v10;
  uint64_t **v11;
  uint64_t *v12;
  int v13;
  int v14;
  unsigned int v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *result;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  unsigned int v24;
  BOOL v25;
  uint64_t **v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  BOOL v30;
  std::__shared_weak_count *v31;
  uint64_t *v32;
  unint64_t *p_shared_owners;
  unint64_t v34;
  unint64_t *v35;
  unint64_t v36;
  uint64_t **v37;
  uint64_t *v38;
  unsigned int v39;
  uint64_t **v40;
  uint64_t **v41;
  unint64_t *v42;
  unint64_t v43;
  uint64_t *v44;
  uint64_t *v45;
  unint64_t *v46;
  unint64_t v47;
  unint64_t *v48;
  unint64_t v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t v52;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = a1 + 1;
    do
    {
      v9 = *((_DWORD *)v6 + 8);
      v10 = v9 >= a2;
      if (v9 >= a2)
        v11 = (uint64_t **)v6;
      else
        v11 = (uint64_t **)(v6 + 1);
      if (v10)
        v8 = (uint64_t **)v6;
      v6 = *v11;
    }
    while (*v11);
    if (v8 != v7 && *((_DWORD *)v8 + 8) <= a2)
      return 0;
  }
  if ((unint64_t)a1[2] >= *((unsigned int *)a1 + 7))
  {
    v12 = a1[4];
    v13 = *((_DWORD *)v12 + 5);
    *((_DWORD *)v12 + 5) = v13 - 1;
    if (v13 >= 2)
    {
      do
      {
        v12 = (uint64_t *)v12[3];
        v14 = *((_DWORD *)v12 + 5);
        *((_DWORD *)v12 + 5) = v14 - 1;
      }
      while (v14 >= 2);
      a1[4] = v12;
    }
    v15 = *((_DWORD *)v12 + 4);
    v16 = v12 + 3;
    v17 = (uint64_t *)v12[3];
    if (v17 == v12)
    {
      v19 = 0;
    }
    else
    {
      v18 = v12[4];
      *(_QWORD *)(v18 + 24) = v17;
      v19 = (uint64_t *)v12[3];
      v19[4] = v18;
    }
    *v16 = 0;
    v16[1] = 0;
    a1[4] = v19;
    v21 = a1[1];
    if (v21)
    {
      v22 = (uint64_t *)v7;
      v23 = a1[1];
      do
      {
        v24 = *((_DWORD *)v23 + 8);
        v25 = v24 >= v15;
        if (v24 >= v15)
          v26 = (uint64_t **)v23;
        else
          v26 = (uint64_t **)(v23 + 1);
        if (v25)
          v22 = v23;
        v23 = *v26;
      }
      while (*v26);
      if (v22 != (uint64_t *)v7 && v15 >= *((_DWORD *)v22 + 8))
      {
        v27 = (uint64_t *)v22[1];
        if (v27)
        {
          do
          {
            v28 = v27;
            v27 = (uint64_t *)*v27;
          }
          while (v27);
        }
        else
        {
          v29 = v22;
          do
          {
            v28 = (uint64_t *)v29[2];
            v30 = *v28 == (_QWORD)v29;
            v29 = v28;
          }
          while (!v30);
        }
        if (*a1 == v22)
          *a1 = v28;
        a1[2] = (uint64_t *)((char *)a1[2] - 1);
        std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v21, v22);
        std::shared_ptr<degas::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)(v22 + 5));
        operator delete(v22);
      }
    }
  }
  v32 = *a3;
  v31 = (std::__shared_weak_count *)a3[1];
  if (v31)
  {
    p_shared_owners = (unint64_t *)&v31->__shared_owners_;
    do
      v34 = __ldxr(p_shared_owners);
    while (__stxr(v34 + 1, p_shared_owners));
  }
  if (v31)
  {
    v35 = (unint64_t *)&v31->__shared_owners_;
    do
      v36 = __ldxr(v35);
    while (__stxr(v36 + 1, v35));
  }
  v37 = v7;
  v38 = *v7;
  if (*v7)
  {
    while (1)
    {
      while (1)
      {
        v37 = (uint64_t **)v38;
        v39 = *((_DWORD *)v38 + 8);
        if (v39 <= a2)
          break;
        v38 = *v37;
        v7 = v37;
        if (!*v37)
          goto LABEL_53;
      }
      if (v39 >= a2)
        break;
      v38 = v37[1];
      if (!v38)
      {
        v7 = v37 + 1;
        goto LABEL_53;
      }
    }
    v41 = v37;
    if (v31)
      goto LABEL_61;
  }
  else
  {
LABEL_53:
    v40 = (uint64_t **)operator new(0x50uLL);
    v41 = v40;
    *((_DWORD *)v40 + 8) = a2;
    v40[5] = (uint64_t *)v32;
    v40[6] = (uint64_t *)v31;
    if (v31)
    {
      v42 = (unint64_t *)&v31->__shared_owners_;
      do
        v43 = __ldxr(v42);
      while (__stxr(v43 + 1, v42));
    }
    v40[7] = (uint64_t *)(a2 | 0x100000000);
    *v40 = 0;
    v40[1] = 0;
    v40[2] = (uint64_t *)v37;
    *v7 = (uint64_t *)v40;
    v44 = (uint64_t *)**a1;
    v45 = (uint64_t *)v40;
    if (v44)
    {
      *a1 = v44;
      v45 = *v7;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v45);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
    if (v31)
    {
LABEL_61:
      v46 = (unint64_t *)&v31->__shared_owners_;
      do
        v47 = __ldaxr(v46);
      while (__stlxr(v47 - 1, v46));
      if (!v47)
      {
        ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
        std::__shared_weak_count::__release_weak(v31);
      }
    }
  }
  if (v31)
  {
    v48 = (unint64_t *)&v31->__shared_owners_;
    do
      v49 = __ldaxr(v48);
    while (__stlxr(v49 - 1, v48));
    if (!v49)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  result = (uint64_t *)(v41 + 5);
  v50 = a1[4];
  if (!v50)
  {
    a1[4] = result;
    v51 = (uint64_t *)(v41 + 9);
    goto LABEL_74;
  }
  v51 = v50 + 4;
  if (v50 == result)
  {
LABEL_74:
    v50 = (uint64_t *)(v41 + 5);
    goto LABEL_75;
  }
  v52 = *v51;
  v41[9] = (uint64_t *)*v51;
  *(_QWORD *)(v52 + 24) = result;
LABEL_75:
  *v51 = (uint64_t)result;
  v41[8] = v50;
  return result;
}

void sub_1CA1E285C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  va_list va;

  va_start(va, a2);
  std::shared_ptr<degas::Predicate>::~shared_ptr[abi:ne180100](v2);
  std::shared_ptr<degas::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

double degas::Bitmap::Bitmap(degas::Bitmap *this)
{
  double result;

  result = 0.0;
  *(_OWORD *)((char *)this + 25) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  return result;
}

{
  double result;

  result = 0.0;
  *(_OWORD *)((char *)this + 25) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  return result;
}

degas::Bitmap *degas::Bitmap::Bitmap(degas::Bitmap *this, __int128 **a2)
{
  *(_QWORD *)this = *a2;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 16, a2[2], a2[3], a2[3] - a2[2]);
  *((_BYTE *)this + 40) = *((_BYTE *)a2 + 40);
  return this;
}

{
  *(_QWORD *)this = *a2;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 16, a2[2], a2[3], a2[3] - a2[2]);
  *((_BYTE *)this + 40) = *((_BYTE *)a2 + 40);
  return this;
}

char *std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;
  _OWORD *v7;
  __int128 v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<degas::BitsetPtr>::__vallocate[abi:ne180100](result, a4);
    v7 = (_OWORD *)*((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2++;
      *v7++ = v8;
      ++*(_DWORD *)v8;
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_1CA1E39B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<degas::BitsetPtr>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<degas::Predicate>>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

degas::Bitmap *degas::Bitmap::Bitmap(degas::Bitmap *this, const degas::LiteralBitmap *a2)
{
  uint64_t v4;
  os_unfair_lock_s *v5;
  const degas::Bitset *v6;
  __int128 v8;

  *(_QWORD *)this = 0xFFFFFFFFLL;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_BYTE *)this + 40) = 0;
  if (degas::getBitsetPool(void)::onceToken != -1)
    dispatch_once(&degas::getBitsetPool(void)::onceToken, &__block_literal_global_3736);
  v4 = *((unsigned int *)a2 + 1);
  if ((_DWORD)v4)
  {
    v5 = (os_unfair_lock_s *)degas::getBitsetPool(void)::sPool;
    v6 = (const degas::LiteralBitmap *)((char *)a2 + 8);
    do
    {
      v8 = 0uLL;
      degas::BitsetPool::allocBitset(v5, (degas::BitsetPtr *)&v8, v6);
      std::vector<degas::BitsetPtr>::push_back[abi:ne180100]((uint64_t *)this + 2, &v8);
      degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)&v8);
      v6 = (const degas::Bitset *)((char *)v6 + 144);
      --v4;
    }
    while (v4);
  }
  return this;
}

void sub_1CA1E3B20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)&a9);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&a9);
  _Unwind_Resume(a1);
}

uint64_t *std::vector<degas::BitsetPtr>::push_back[abi:ne180100](uint64_t *result, __int128 *a2)
{
  uint64_t *v3;
  _QWORD *v4;
  unint64_t v5;
  __int128 *v6;
  __int128 v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  __int128 *v14;
  __int128 v15;
  _QWORD v16[5];

  v3 = result;
  v4 = result + 2;
  v5 = result[2];
  v6 = (__int128 *)result[1];
  if ((unint64_t)v6 >= v5)
  {
    v9 = ((uint64_t)v6 - *result) >> 4;
    if ((unint64_t)(v9 + 1) >> 60)
      std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
    v10 = v5 - *result;
    v11 = v10 >> 3;
    if (v10 >> 3 <= (unint64_t)(v9 + 1))
      v11 = v9 + 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    v16[4] = v4;
    if (v12)
      v12 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<degas::Predicate>>>(v12);
    else
      v13 = 0;
    v14 = (__int128 *)(v12 + 16 * v9);
    v16[0] = v12;
    v16[1] = v14;
    v16[3] = v12 + 16 * v13;
    v15 = *a2;
    *v14 = *a2;
    ++*(_DWORD *)v15;
    v16[2] = v14 + 1;
    std::vector<degas::BitsetPtr>::__swap_out_circular_buffer(v3, v16);
    v8 = (_OWORD *)v3[1];
    result = (uint64_t *)std::__split_buffer<degas::BitsetPtr>::~__split_buffer((uint64_t)v16);
  }
  else
  {
    v7 = *a2;
    *v6 = *a2;
    v8 = v6 + 1;
    ++*(_DWORD *)v7;
    result[1] = (uint64_t)v8;
  }
  v3[1] = (uint64_t)v8;
  return result;
}

uint64_t *std::vector<degas::BitsetPtr>::__swap_out_circular_buffer(uint64_t *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *result;
  v2 = result[1];
  v4 = a2[1];
  while (v2 != v3)
  {
    v5 = *(_OWORD *)(v2 - 16);
    v2 -= 16;
    *(_OWORD *)(v4 - 16) = v5;
    v4 -= 16;
    ++*(_DWORD *)v5;
  }
  a2[1] = v4;
  v6 = *result;
  *result = v4;
  a2[1] = v6;
  v7 = result[1];
  result[1] = a2[2];
  a2[2] = v7;
  v8 = result[2];
  result[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<degas::BitsetPtr>::~__split_buffer(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v2; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 16;
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(i - 16));
    *(_QWORD *)(i - 8) = 0;
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t degas::Bitmap::Bitmap(uint64_t a1, __int128 **a2)
{
  *(_QWORD *)(a1 + 32) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)(a1 + 16), *a2, a2[1], a2[1] - *a2);
  *(_BYTE *)(a1 + 40) = 0;
  return a1;
}

{
  *(_QWORD *)(a1 + 32) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)(a1 + 16), *a2, a2[1], a2[1] - *a2);
  *(_BYTE *)(a1 + 40) = 0;
  return a1;
}

_QWORD *degas::Bitmap::operator=(_QWORD *a1, _QWORD *a2)
{
  degas::BitsetPtr *v4;
  void **v5;
  char *v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  degas::BitsetPtr *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  _OWORD *v14;
  __int128 v15;
  degas::BitsetPtr *v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  if (a1 != a2)
  {
    v5 = (void **)(a1 + 2);
    v4 = (degas::BitsetPtr *)a1[2];
    v7 = (char *)a2[2];
    v6 = (char *)a2[3];
    v8 = (v6 - v7) >> 4;
    v9 = a1[4];
    if (v8 <= (v9 - (uint64_t)v4) >> 4)
    {
      v16 = (degas::BitsetPtr *)a1[3];
      v17 = (v16 - v4) >> 4;
      if (v17 >= v8)
      {
        if (v7 != v6)
        {
          do
          {
            degas::BitsetPtr::releaseBitset(v4);
            v22 = *(_OWORD *)v7;
            *(_OWORD *)v4 = *(_OWORD *)v7;
            if ((_QWORD)v22)
              ++*(_DWORD *)v22;
            v7 += 16;
            v4 = (degas::BitsetPtr *)((char *)v4 + 16);
          }
          while (v7 != v6);
          v16 = (degas::BitsetPtr *)a1[3];
        }
        for (; v16 != v4; v16 = (degas::BitsetPtr *)((char *)v16 - 16))
        {
          degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)((char *)v16 - 16));
          *((_QWORD *)v16 - 1) = 0;
        }
      }
      else
      {
        v18 = &v7[16 * v17];
        if (v16 != v4)
        {
          v19 = 16 * v17;
          do
          {
            degas::BitsetPtr::releaseBitset(v4);
            v20 = *(_OWORD *)v7;
            *(_OWORD *)v4 = *(_OWORD *)v7;
            if ((_QWORD)v20)
              ++*(_DWORD *)v20;
            v7 += 16;
            v4 = (degas::BitsetPtr *)((char *)v4 + 16);
            v19 -= 16;
          }
          while (v19);
          v4 = (degas::BitsetPtr *)a1[3];
        }
        while (v18 != v6)
        {
          v21 = *(_OWORD *)v18;
          v18 += 16;
          *(_OWORD *)v4 = v21;
          v4 = (degas::BitsetPtr *)((char *)v4 + 16);
          ++*(_DWORD *)v21;
        }
      }
      a1[3] = v4;
    }
    else
    {
      if (v4)
      {
        v10 = (degas::BitsetPtr *)a1[3];
        v11 = (void *)a1[2];
        if (v10 != v4)
        {
          do
          {
            degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)((char *)v10 - 16));
            *((_QWORD *)v10 - 1) = 0;
            v10 = (degas::BitsetPtr *)((char *)v10 - 16);
          }
          while (v10 != v4);
          v11 = *v5;
        }
        a1[3] = v4;
        operator delete(v11);
        v9 = 0;
        *v5 = 0;
        a1[3] = 0;
        a1[4] = 0;
      }
      if (v6 - v7 < 0)
        std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
      v12 = v9 >> 3;
      if (v9 >> 3 <= v8)
        v12 = (v6 - v7) >> 4;
      if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF0)
        v13 = 0xFFFFFFFFFFFFFFFLL;
      else
        v13 = v12;
      std::vector<degas::BitsetPtr>::__vallocate[abi:ne180100](a1 + 2, v13);
      v14 = (_OWORD *)a1[3];
      while (v7 != v6)
      {
        v15 = *(_OWORD *)v7;
        v7 += 16;
        *v14++ = v15;
        ++*(_DWORD *)v15;
      }
      a1[3] = v14;
    }
  }
  *a1 = *a2;
  a1[1] = 0;
  return a1;
}

BOOL degas::Bitmap::operator==(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v5;
  degas::Bitset **v6;
  degas::Bitset **v7;
  degas::Bitset *v8;
  unint64_t v9;
  _BOOL8 result;
  degas::Bitset **v11;
  degas::Bitset **v12;
  degas::Bitset *v13;
  uint64_t v14;
  uint64_t i;
  unsigned int v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t j;
  unsigned int v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24[9];

  if (a2 == a1)
    return 1;
  v24[7] = v2;
  v24[8] = v3;
  v5 = -1;
  v24[0] = -1;
  v6 = *(degas::Bitset ***)(a1 + 16);
  v7 = *(degas::Bitset ***)(a1 + 24);
  if (v6 == v7)
  {
    v9 = -1;
  }
  else
  {
    v8 = *v6;
    v9 = *((_QWORD *)*v6 + 1);
    if (v9 > 0xFFFFFFFFFFFFFBFFLL || (*((_BYTE *)v8 + 16) & 1) == 0)
    {
      degas::Bitset::nextBit(v8, v24, *((_QWORD *)*v6 + 1));
      v9 = v24[0];
    }
  }
  v24[0] = -1;
  v12 = *(degas::Bitset ***)(a2 + 16);
  v11 = *(degas::Bitset ***)(a2 + 24);
  if (v12 != v11)
  {
    v13 = *v12;
    v5 = *((_QWORD *)*v12 + 1);
    if (v5 > 0xFFFFFFFFFFFFFBFFLL || (*((_BYTE *)v13 + 16) & 1) == 0)
    {
      degas::Bitset::nextBit(v13, v24, *((_QWORD *)*v12 + 1));
      v5 = v24[0];
    }
  }
  if (v9 != v5)
    return 0;
  if (v6 == v7)
  {
    v18 = 0;
  }
  else
  {
    v14 = (uint64_t)*(v7 - 2);
    for (i = 35; i != 4; --i)
    {
      v16 = *(_DWORD *)(v14 + 4 * i);
      if (v16)
      {
        v17 = i - 4;
        goto LABEL_21;
      }
    }
    v17 = 0;
    v18 = 0;
    v16 = *(_DWORD *)(v14 + 16);
    if (!v16)
      goto LABEL_22;
LABEL_21:
    v18 = (__clz(v16) ^ 0x1F | (unint64_t)(32 * v17)) + *(_QWORD *)(v14 + 8);
  }
LABEL_22:
  if (v12 == v11)
  {
    v23 = 0;
  }
  else
  {
    v19 = (uint64_t)*(v11 - 2);
    for (j = 35; j != 4; --j)
    {
      v21 = *(_DWORD *)(v19 + 4 * j);
      if (v21)
      {
        v22 = j - 4;
        goto LABEL_30;
      }
    }
    v22 = 0;
    v23 = 0;
    v21 = *(_DWORD *)(v19 + 16);
    if (!v21)
      goto LABEL_31;
LABEL_30:
    v23 = (__clz(v21) ^ 0x1F | (unint64_t)(32 * v22)) + *(_QWORD *)(v19 + 8);
  }
LABEL_31:
  if (v18 != v23)
    return 0;
  result = (char *)v7 - (char *)v6 == (char *)v11 - (char *)v12;
  if ((char *)v7 - (char *)v6 == (char *)v11 - (char *)v12)
  {
    while (v6 != v7)
    {
      if (*((_QWORD *)*v6 + 1) != *((_QWORD *)*v12 + 1) || memcmp((char *)*v6 + 16, (char *)*v12 + 16, 0x80uLL))
        return 0;
      v6 += 2;
      v12 += 2;
      result = 1;
    }
  }
  return result;
}

unint64_t degas::Bitmap::firstBit(degas::Bitmap *this)
{
  unint64_t v1;
  degas::Bitset **v2;
  degas::Bitset *v3;
  unint64_t v5;

  v1 = -1;
  v5 = -1;
  v2 = (degas::Bitset **)*((_QWORD *)this + 2);
  if (v2 != *((degas::Bitset ***)this + 3))
  {
    v3 = *v2;
    v1 = *((_QWORD *)*v2 + 1);
    if (v1 > 0xFFFFFFFFFFFFFBFFLL || (*((_BYTE *)v3 + 16) & 1) == 0)
    {
      degas::Bitset::nextBit(v3, &v5, v1);
      return v5;
    }
  }
  return v1;
}

uint64_t degas::Bitmap::lastBit(degas::Bitmap *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t i;
  unsigned int v4;
  uint64_t v5;
  uint64_t result;

  v1 = *((_QWORD *)this + 3);
  if (*((_QWORD *)this + 2) == v1)
    return 0;
  v2 = *(_QWORD *)(v1 - 16);
  for (i = 35; i != 4; --i)
  {
    v4 = *(_DWORD *)(v2 + 4 * i);
    if (v4)
    {
      v5 = i - 4;
      return (__clz(v4) ^ 0x1F | (unint64_t)(32 * v5)) + *(_QWORD *)(v2 + 8);
    }
  }
  v5 = 0;
  result = 0;
  v4 = *(_DWORD *)(v2 + 16);
  if (!v4)
    return result;
  return (__clz(v4) ^ 0x1F | (unint64_t)(32 * v5)) + *(_QWORD *)(v2 + 8);
}

uint64_t degas::Bitmap::replaceFromEncodedBuffer(degas::Bitmap *this, const unsigned __int8 **a2)
{
  const unsigned __int8 **v4;
  uint64_t UnsignedInt;
  uint64_t *i;
  uint64_t v7;
  uint64_t v8;
  os_unfair_lock_s *v9;
  const unsigned __int8 **v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const unsigned __int8 **v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int v22;
  uint64_t v23;
  int *v24;
  int v25;
  int v26;
  int v27;
  const unsigned __int8 **v28;
  uint64_t j;
  unint64_t v30;
  unint64_t v32;
  int v33;
  uint64_t v34;
  int *v35;
  int v36;
  int v37;
  int v38;
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  uint64_t v43;
  int32x4_t v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;

  UnsignedInt = degas::_getUnsignedInt((degas *)a2, a2);
  v7 = *((_QWORD *)this + 2);
  v8 = *((_QWORD *)this + 3);
  for (i = (uint64_t *)((char *)this + 16); v8 != v7; v8 -= 16)
  {
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(v8 - 16));
    *(_QWORD *)(v8 - 8) = 0;
  }
  *((_QWORD *)this + 3) = v7;
  if (degas::getBitsetPool(void)::onceToken != -1)
    dispatch_once(&degas::getBitsetPool(void)::onceToken, &__block_literal_global_3736);
  v9 = (os_unfair_lock_s *)degas::getBitsetPool(void)::sPool;
  if (UnsignedInt == 2)
  {
    v16 = degas::_getUnsignedInt((degas *)a2, v4);
    if (v16)
    {
      v18 = v16;
      *(_QWORD *)this = v16;
      v19 = degas::_getUnsignedInt((degas *)a2, v17);
      v45 = 0uLL;
      degas::BitsetPool::allocBitset(v9, (degas::BitsetPtr *)&v45, v19 & 0xFFFFFFFFFFFFFC00);
      v20 = v45;
      v21 = v19 - *(_QWORD *)(v45 + 8);
      v22 = 1 << v21;
      v23 = v45 + 4 * (v21 >> 5);
      v26 = *(_DWORD *)(v23 + 16);
      v24 = (int *)(v23 + 16);
      v25 = v26;
      if ((v22 & v26) == 0)
      {
        *v24 = v22 | v25;
        v27 = *(_DWORD *)(v20 + 4);
        if (v27 != -1)
          *(_DWORD *)(v20 + 4) = v27 + 1;
      }
      std::vector<degas::BitsetPtr>::push_back[abi:ne180100](i, &v45);
      for (j = v18 - 1; j; --j)
      {
        v19 += degas::_getUnsignedInt((degas *)a2, v28);
        v30 = *(_QWORD *)(v20 + 8);
        if (v30 > v19 || v30 + 1024 <= v19)
        {
          degas::BitsetPool::allocBitset(v9, (degas::BitsetPtr *)&v45, v19 & 0xFFFFFFFFFFFFFC00);
          std::vector<degas::BitsetPtr>::push_back[abi:ne180100](i, &v45);
          v20 = v45;
          v30 = *(_QWORD *)(v45 + 8);
        }
        v32 = v19 - v30;
        v33 = 1 << (v19 - v30);
        v34 = v20 + 4 * (v32 >> 5);
        v37 = *(_DWORD *)(v34 + 16);
        v35 = (int *)(v34 + 16);
        v36 = v37;
        if ((v33 & v37) == 0)
        {
          *v35 = v33 | v36;
          v38 = *(_DWORD *)(v20 + 4);
          if (v38 != -1)
            *(_DWORD *)(v20 + 4) = v38 + 1;
        }
      }
      degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)&v45);
    }
    return 1;
  }
  if (UnsignedInt != 1)
    return 0;
  degas::_getUnsignedInt((degas *)a2, v4);
  v11 = degas::_getUnsignedInt((degas *)a2, v10);
  v12 = v11;
  v13 = *((_QWORD *)this + 2);
  if (v11 > (*((_QWORD *)this + 4) - v13) >> 4)
  {
    if (v11 >> 60)
      std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
    v14 = *((_QWORD *)this + 3) - v13;
    v48 = (char *)this + 32;
    *(_QWORD *)&v45 = std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<degas::Predicate>>>(v11);
    *((_QWORD *)&v45 + 1) = v45 + v14;
    v46 = v45 + v14;
    v47 = v45 + 16 * v15;
    std::vector<degas::BitsetPtr>::__swap_out_circular_buffer((uint64_t *)this + 2, &v45);
    std::__split_buffer<degas::BitsetPtr>::~__split_buffer((uint64_t)&v45);
    goto LABEL_27;
  }
  if (v11)
  {
LABEL_27:
    v40 = 0;
    v41 = 0;
    do
    {
      v45 = 0uLL;
      degas::BitsetPool::allocBitset(v9, (degas::BitsetPtr *)&v45, a2);
      v42 = *(_DWORD *)(v45 + 4);
      if (v42 == -1)
      {
        v43 = 0;
        v44 = 0uLL;
        do
        {
          do
          {
            v44 = (int32x4_t)vpadalq_u16((uint32x4_t)v44, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v45 + 4 * v43 + 16))));
            v43 += 4;
          }
          while (v43 != 32);
          v43 = 0;
          v42 = vaddvq_s32(v44);
          v44 = 0uLL;
        }
        while (v42 == -1);
        *(_DWORD *)(v45 + 4) = v42;
      }
      std::vector<degas::BitsetPtr>::push_back[abi:ne180100]((uint64_t *)this + 2, &v45);
      v41 += v42;
      degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)&v45);
      ++v40;
    }
    while (v40 != v12);
    goto LABEL_34;
  }
  v41 = 0;
LABEL_34:
  *(_QWORD *)this = v41;
  return 1;
}

void sub_1CA1E4528(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)va);
  _Unwind_Resume(a1);
}

uint64_t degas::Bitmap::useV2Encoding(degas::Bitmap *this, unint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  degas::Bitset **v6;
  degas::Bitset **v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  degas::Bitset *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v26;

  v4 = *(_QWORD *)this;
  if (*(_QWORD *)this == 0xFFFFFFFFLL)
  {
    degas::Bitmap::count(this);
    v4 = *(_QWORD *)this;
  }
  v5 = v4 + 2;
  if (v4)
  {
    v7 = (degas::Bitset **)*((_QWORD *)this + 2);
    v6 = (degas::Bitset **)*((_QWORD *)this + 3);
    v8 = 34 * (((char *)v6 - (char *)v7) >> 4) + 3;
    if (v5 > v8)
      return 0;
    if (v4 < 0x80)
    {
      v5 = 2;
    }
    else
    {
      v9 = -1;
      do
      {
        v10 = v4 >> 14;
        v4 >>= 7;
        ++v9;
      }
      while (v10);
      v5 = v9 + 3;
    }
    if (v7 != v6)
    {
      v11 = -1;
      do
      {
        v26 = -1;
        v12 = *v7;
        v13 = *((_QWORD *)*v7 + 1);
        if (v13 <= 0xFFFFFFFFFFFFFBFFLL && (*((_BYTE *)v12 + 16) & 1) != 0)
        {
          v26 = *((_QWORD *)*v7 + 1);
        }
        else
        {
          if (!degas::Bitset::nextBit(*v7, &v26, *((_QWORD *)*v7 + 1)))
            goto LABEL_38;
          v13 = v26;
        }
        if (v11 == -1)
        {
          if (v13 >= 0x80)
          {
            v18 = -1;
            v19 = v13;
            do
            {
              v20 = v19 >> 14;
              v19 >>= 7;
              ++v18;
            }
            while (v20);
            v17 = v18 + 2;
            goto LABEL_27;
          }
        }
        else
        {
          v14 = v13 - v11;
          if (v13 - v11 >= 0x80)
          {
            v15 = -1;
            do
            {
              v16 = v14 >> 14;
              v14 >>= 7;
              ++v15;
            }
            while (v16);
            v17 = v15 + 2;
            goto LABEL_27;
          }
        }
        v17 = 1;
LABEL_27:
        v5 += v17;
        while (degas::Bitset::nextBit(v12, &v26, v13))
        {
          v11 = v26;
          v21 = v26 - v13;
          if (v26 - v13 < 0x80)
          {
            v24 = 1;
          }
          else
          {
            v22 = -1;
            do
            {
              v23 = v21 >> 14;
              v21 >>= 7;
              ++v22;
            }
            while (v23);
            v24 = v22 + 2;
          }
          v5 += v24;
          v13 = v26;
          if (v5 > v8)
            goto LABEL_37;
        }
        v11 = v13;
LABEL_37:
        if (v5 > v8)
          break;
LABEL_38:
        v7 += 2;
      }
      while (v7 != v6);
    }
    if (v5 > v8)
      return 0;
  }
  *a2 = v5;
  return 1;
}

uint64_t degas::Bitmap::count(degas::Bitmap *this)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  int32x4_t v7;

  v1 = *(_QWORD *)this;
  if (*(_QWORD *)this == 0xFFFFFFFFLL)
  {
    v2 = (uint64_t *)*((_QWORD *)this + 2);
    v3 = (uint64_t *)*((_QWORD *)this + 3);
    if (v2 == v3)
    {
      v1 = 0;
    }
    else
    {
      v1 = 0;
      do
      {
        v4 = *v2;
        v5 = *(_DWORD *)(*v2 + 4);
        if (v5 == -1)
        {
          v6 = 0;
          v7 = 0uLL;
          do
          {
            do
            {
              v7 = (int32x4_t)vpadalq_u16((uint32x4_t)v7, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v4 + 4 * v6 + 16))));
              v6 += 4;
            }
            while (v6 != 32);
            v6 = 0;
            v5 = vaddvq_s32(v7);
            v7 = 0uLL;
          }
          while (v5 == -1);
          *(_DWORD *)(v4 + 4) = v5;
        }
        v1 += v5;
        v2 += 2;
      }
      while (v2 != v3);
    }
    *(_QWORD *)this = v1;
  }
  return v1;
}

unint64_t degas::Bitmap::lengthOfEncodedData(degas::Bitset ***this)
{
  uint64_t v2;
  degas::Bitset **v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  degas::Bitset **v8;
  degas::Bitset **v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  degas::Bitset *v14;
  unint64_t v15;

  v15 = 0;
  if (degas::Bitmap::useV2Encoding((degas::Bitmap *)this, &v15))
    return v15;
  v4 = *this;
  if ((unint64_t)*this < 0x80)
  {
    v7 = 2;
  }
  else
  {
    v5 = -1;
    do
    {
      v6 = (unint64_t)v4 >> 14;
      v4 = (degas::Bitset **)((unint64_t)v4 >> 7);
      ++v5;
    }
    while (v6);
    v7 = v5 + 3;
  }
  v9 = this[2];
  v8 = this[3];
  if ((unint64_t)((char *)v8 - (char *)v9) < 0x7F1)
  {
    v13 = 1;
  }
  else
  {
    v10 = ((char *)v8 - (char *)v9) >> 4;
    v11 = -1;
    do
    {
      v12 = v10 >> 14;
      v10 >>= 7;
      ++v11;
    }
    while (v12);
    v13 = v11 + 2;
  }
  v2 = v13 + v7;
  while (v9 != v8)
  {
    v14 = *v9;
    v9 += 2;
    v2 += degas::Bitset::encodedLength(v14);
  }
  return v2;
}

uint64_t degas::Bitmap::appendToEncodedBuffer(degas::Bitset ***this, unsigned __int8 **a2)
{
  uint64_t result;
  unsigned __int8 *v5;
  degas::Bitset **v6;
  unsigned __int8 *v7;
  degas::Bitset **v8;
  unint64_t v9;
  degas::Bitset **v10;
  degas::Bitset **v11;
  uint64_t v12;
  unint64_t v13;
  unsigned __int8 *v14;
  degas::Bitset **v15;
  unsigned __int8 *v16;
  degas::Bitset **v17;
  unint64_t v18;
  unsigned __int8 *v19;
  degas::Bitset **v20;
  degas::Bitset **v21;
  uint64_t v22;
  degas::Bitset *v23;
  unint64_t v24;
  unint64_t v25;
  unsigned __int8 *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unsigned __int8 *v31;
  unint64_t v32;
  unsigned __int8 *v33;
  unsigned __int8 *v34;
  unint64_t v35;
  unint64_t v36;
  unsigned __int8 *v37;
  unint64_t v38;
  unint64_t v39;
  unsigned __int8 *v40;
  unsigned __int8 *v41;
  unsigned __int8 *v42;
  uint64_t v43;
  unint64_t v44;
  unsigned __int8 *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;

  result = degas::Bitmap::useV2Encoding((degas::Bitmap *)this, &v50);
  if ((_DWORD)result)
  {
    v5 = (*a2)++;
    *v5 = 2;
    v6 = *this;
    if ((unint64_t)*this < 0x80)
    {
      v8 = *this;
    }
    else
    {
      do
      {
        v7 = (*a2)++;
        *v7 = v6 | 0x80;
        v8 = (degas::Bitset **)((unint64_t)v6 >> 7);
        v9 = (unint64_t)v6 >> 14;
        v6 = (degas::Bitset **)((unint64_t)v6 >> 7);
      }
      while (v9);
    }
    v19 = (*a2)++;
    *v19 = v8;
    v20 = this[2];
    v21 = this[3];
    if (v20 != v21)
    {
      v22 = -1;
      while (1)
      {
        v49 = -1;
        v23 = *v20;
        v24 = *((_QWORD *)*v20 + 1);
        if (v24 <= 0xFFFFFFFFFFFFFBFFLL && (*((_BYTE *)v23 + 16) & 1) != 0)
          break;
        result = degas::Bitset::nextBit(v23, &v49, *((_QWORD *)*v20 + 1));
        if ((_DWORD)result)
        {
          v24 = v49;
LABEL_18:
          if (v22 == -1)
          {
            LOBYTE(v29) = v24;
            if (v24 >= 0x80)
            {
              v30 = v24;
              do
              {
                v31 = (*a2)++;
                *v31 = v30 | 0x80;
                v29 = v30 >> 7;
                v32 = v30 >> 14;
                v30 >>= 7;
              }
              while (v32);
            }
            v33 = (*a2)++;
            *v33 = v29;
          }
          else
          {
            v25 = v24 - v22;
            if (v24 - v22 < 0x80)
            {
              LOBYTE(v27) = v24 - v22;
            }
            else
            {
              do
              {
                v26 = (*a2)++;
                *v26 = v25 | 0x80;
                v27 = v25 >> 7;
                v28 = v25 >> 14;
                v25 >>= 7;
              }
              while (v28);
            }
            v34 = (*a2)++;
            *v34 = v27;
          }
          while (1)
          {
            result = degas::Bitset::nextBit(*v20, &v49, v24);
            if (!(_DWORD)result)
              break;
            v35 = v49;
            v36 = v49 - v24;
            if (v49 - v24 < 0x80)
            {
              LOBYTE(v38) = v49 - v24;
            }
            else
            {
              do
              {
                v37 = (*a2)++;
                *v37 = v36 | 0x80;
                v38 = v36 >> 7;
                v39 = v36 >> 14;
                v36 >>= 7;
              }
              while (v39);
            }
            v40 = (*a2)++;
            *v40 = v38;
            v24 = v35;
          }
          v22 = v24;
        }
        v20 += 2;
        if (v20 == v21)
          return result;
      }
      v49 = *((_QWORD *)*v20 + 1);
      goto LABEL_18;
    }
  }
  else
  {
    v10 = this[2];
    v11 = this[3];
    if (v10 == v11)
      *this = 0;
    v12 = (char *)v11 - (char *)v10;
    v13 = v12 >> 4;
    v14 = (*a2)++;
    *v14 = 1;
    v15 = *this;
    if ((unint64_t)*this < 0x80)
    {
      v17 = *this;
    }
    else
    {
      do
      {
        v16 = (*a2)++;
        *v16 = v15 | 0x80;
        v17 = (degas::Bitset **)((unint64_t)v15 >> 7);
        v18 = (unint64_t)v15 >> 14;
        v15 = (degas::Bitset **)((unint64_t)v15 >> 7);
      }
      while (v18);
    }
    v41 = (*a2)++;
    *v41 = v17;
    if ((unint64_t)v12 < 0x7F1)
    {
      v43 = v12 >> 4;
    }
    else
    {
      do
      {
        v42 = (*a2)++;
        *v42 = v13 | 0x80;
        v43 = v13 >> 7;
        v44 = v13 >> 14;
        v13 >>= 7;
      }
      while (v44);
    }
    v45 = (*a2)++;
    *v45 = v43;
    v47 = (uint64_t *)this[2];
    v46 = (uint64_t *)this[3];
    while (v47 != v46)
    {
      v48 = *v47;
      v47 += 2;
      result = degas::Bitset::appendEncodedToBuffer(v48, a2);
    }
  }
  return result;
}

void degas::Bitmap::clearAllBits(degas::Bitmap *this)
{
  uint64_t v2;
  uint64_t i;

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  v2 = *((_QWORD *)this + 2);
  for (i = *((_QWORD *)this + 3); i != v2; i -= 16)
  {
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(i - 16));
    *(_QWORD *)(i - 8) = 0;
  }
  *((_QWORD *)this + 3) = v2;
}

uint64_t degas::Bitmap::rangeCompare(degas::Bitmap *this, unint64_t a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  unsigned int v5;

  v3 = *((_QWORD *)this + 2);
  if (a3 >= (*((_QWORD *)this + 3) - v3) >> 4)
    return 0xFFFFFFFFLL;
  v4 = *(_QWORD *)(*(_QWORD *)(v3 + 16 * a3) + 8);
  if (v4 + 1024 > a2)
    v5 = 0;
  else
    v5 = -1;
  if (v4 > a2)
    return 1;
  else
    return v5;
}

unint64_t degas::Bitmap::findOffset(degas::Bitmap *this, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int v7;

  v2 = *((_QWORD *)this + 2);
  v3 = *((_QWORD *)this + 1);
  v4 = (*((_QWORD *)this + 3) - v2) >> 4;
  if (v3 >= v4)
  {
    v6 = 0;
    return degas::Bitmap::findOffset(this, a2, v6, v4);
  }
  v5 = *(_QWORD *)(*(_QWORD *)(v2 + 16 * v3) + 8);
  if (v5 > a2)
  {
    v6 = 0;
    v4 = *((_QWORD *)this + 1);
    return degas::Bitmap::findOffset(this, a2, v6, v4);
  }
  if (v5 + 1024 > a2)
    v7 = 0;
  else
    v7 = -1;
  if (v7)
  {
    v6 = v3 + 1;
    return degas::Bitmap::findOffset(this, a2, v6, v4);
  }
  return *((_QWORD *)this + 1);
}

unint64_t degas::Bitmap::findOffset(degas::Bitmap *this, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int v7;

  if (a3 != a4)
  {
    v4 = *((_QWORD *)this + 2);
    while (1)
    {
      v5 = (a3 + a4) >> 1;
      if ((*((_QWORD *)this + 3) - v4) >> 4 <= v5)
        goto LABEL_12;
      v6 = *(_QWORD *)(*(_QWORD *)(v4 + 16 * v5) + 8);
      if (v6 <= a2)
        break;
      a4 = (a3 + a4) >> 1;
LABEL_13:
      if (a3 == a4)
        return a4;
    }
    if (v6 + 1024 > a2)
      v7 = 0;
    else
      v7 = -1;
    if (v7 != -1)
    {
      *((_QWORD *)this + 1) = v5;
      return (a3 + a4) >> 1;
    }
LABEL_12:
    a3 = v5 + 1;
    goto LABEL_13;
  }
  return a3;
}

uint64_t degas::Bitmap::isSet(degas::Bitmap *this, unint64_t a2)
{
  unint64_t Offset;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  BOOL v11;

  Offset = degas::Bitmap::findOffset(this, a2);
  v5 = *((_QWORD *)this + 2);
  if (Offset < (*((_QWORD *)this + 3) - v5) >> 4
    && ((v6 = *(_QWORD *)(v5 + 16 * Offset), v7 = *(_QWORD *)(v6 + 8), v8 = v7 + 1024, v9 = a2 >= v7, v10 = a2 - v7, v9)
      ? (v11 = v8 > a2)
      : (v11 = 0),
        v11))
  {
    return (*(_DWORD *)(v6 + 4 * (v10 >> 5) + 16) >> v10) & 1;
  }
  else
  {
    return 0;
  }
}

unint64_t degas::Bitmap::bitAtIndex(degas::Bitmap *this, unint64_t a2)
{
  __int128 *v2;
  __int128 *v3;
  unint64_t v5;
  degas::Bitset *v6;
  unsigned int v7;
  uint64_t v8;
  int32x4_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v13;
  __int128 v14;

  v2 = (__int128 *)*((_QWORD *)this + 2);
  v3 = (__int128 *)*((_QWORD *)this + 3);
  if (v2 == v3)
    return -1;
  v5 = 0;
  while (1)
  {
    v14 = *v2;
    v6 = (degas::Bitset *)v14;
    v7 = *(_DWORD *)(v14 + 4);
    ++*(_DWORD *)v14;
    if (v7 == -1)
    {
      v8 = 0;
      v9 = 0uLL;
      do
      {
        do
        {
          v9 = (int32x4_t)vpadalq_u16((uint32x4_t)v9, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)v6 + 4 * v8 + 16))));
          v8 += 4;
        }
        while (v8 != 32);
        v8 = 0;
        v7 = vaddvq_s32(v9);
        v9 = 0uLL;
      }
      while (v7 == -1);
      *((_DWORD *)v6 + 1) = v7;
    }
    v10 = v5 + v7;
    if (v10 > a2)
      break;
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)&v14);
    ++v2;
    v5 = v10;
    if (v2 == v3)
      return -1;
  }
  v11 = -1;
  v13 = -1;
  do
  {
    degas::Bitset::nextBit(v6, &v13, v11);
    v11 = v13;
    ++v5;
  }
  while (v5 <= a2);
  degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)&v14);
  return v11;
}

void degas::Bitmap::unshadowedBitSetAtIndex(degas::Bitmap *this@<X0>, unint64_t a2@<X1>, degas::BitsetPtr *a3@<X8>)
{
  uint64_t v4;
  const degas::Bitset **v7;
  __int128 v8;
  _DWORD *v9;
  degas::BitsetPtr *v10;
  __int128 v11;

  v4 = *((_QWORD *)this + 2);
  if (a2 >= (*((_QWORD *)this + 3) - v4) >> 4)
  {
    *(_QWORD *)a3 = 0;
    *((_QWORD *)a3 + 1) = 0;
    return;
  }
  v7 = (const degas::Bitset **)(v4 + 16 * a2);
  if (*v7 && *(_DWORD *)*v7 == 1)
  {
    v8 = *(_OWORD *)v7;
    *(_OWORD *)a3 = *(_OWORD *)v7;
    v9 = (_DWORD *)v8;
LABEL_9:
    ++*v9;
    return;
  }
  *(_QWORD *)a3 = 0;
  *((_QWORD *)a3 + 1) = 0;
  if (degas::getBitsetPool(void)::onceToken != -1)
    dispatch_once(&degas::getBitsetPool(void)::onceToken, &__block_literal_global_3736);
  degas::BitsetPool::allocBitset((os_unfair_lock_s *)degas::getBitsetPool(void)::sPool, a3, *v7);
  v10 = (degas::BitsetPtr *)(*((_QWORD *)this + 2) + 16 * a2);
  degas::BitsetPtr::releaseBitset(v10);
  v11 = *(_OWORD *)a3;
  *(_OWORD *)v10 = *(_OWORD *)a3;
  v9 = (_DWORD *)v11;
  if ((_QWORD)v11)
    goto LABEL_9;
}

void sub_1CA1E4F1C(_Unwind_Exception *a1)
{
  degas::BitsetPtr *v1;

  degas::BitsetPtr::releaseBitset(v1);
  *((_QWORD *)v1 + 1) = 0;
  _Unwind_Resume(a1);
}

uint64_t degas::Bitmap::setBit(degas::Bitmap *this, unint64_t a2)
{
  unint64_t Offset;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  int *v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int *v20;
  int v21;
  int v22;
  int v24;
  _QWORD v25[2];
  __int128 v26;

  Offset = degas::Bitmap::findOffset(this, a2);
  if (Offset == (uint64_t)(*((_QWORD *)this + 3) - *((_QWORD *)this + 2)) >> 4)
  {
    v26 = 0uLL;
    if (degas::getBitsetPool(void)::onceToken != -1)
      dispatch_once(&degas::getBitsetPool(void)::onceToken, &__block_literal_global_3736);
    degas::BitsetPool::allocBitset((os_unfair_lock_s *)degas::getBitsetPool(void)::sPool, (degas::BitsetPtr *)&v26, a2 & 0xFFFFFFFFFFFFFC00);
    std::vector<degas::BitsetPtr>::push_back[abi:ne180100]((uint64_t *)this + 2, &v26);
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)&v26);
  }
  degas::Bitmap::unshadowedBitSetAtIndex(this, Offset, (degas::BitsetPtr *)&v26);
  v5 = v26;
  v6 = *(_QWORD *)(v26 + 8);
  v7 = a2 - v6;
  if (a2 >= v6 && v6 + 1024 > a2)
  {
    v18 = 1 << v7;
    v19 = v26 + 4 * (v7 >> 5);
    v22 = *(_DWORD *)(v19 + 16);
    v20 = (int *)(v19 + 16);
    v21 = v22;
    if ((v18 & v22) != 0)
    {
      v17 = 0;
      goto LABEL_20;
    }
    *v20 = v18 | v21;
    v24 = *(_DWORD *)(v5 + 4);
    if (v24 != -1)
      *(_DWORD *)(v5 + 4) = v24 + 1;
    if (*(_QWORD *)this != 0xFFFFFFFFLL)
      ++*(_QWORD *)this;
  }
  else
  {
    v25[0] = 0;
    v25[1] = 0;
    if (degas::getBitsetPool(void)::onceToken != -1)
      dispatch_once(&degas::getBitsetPool(void)::onceToken, &__block_literal_global_3736);
    degas::BitsetPool::allocBitset((os_unfair_lock_s *)degas::getBitsetPool(void)::sPool, (degas::BitsetPtr *)v25, a2 & 0xFFFFFFFFFFFFFC00);
    v9 = v25[0];
    v10 = a2 - *(_QWORD *)(v25[0] + 8);
    v11 = 1 << v10;
    v12 = v25[0] + 4 * (v10 >> 5);
    v15 = *(_DWORD *)(v12 + 16);
    v13 = (int *)(v12 + 16);
    v14 = v15;
    if ((v11 & v15) == 0)
    {
      *v13 = v11 | v14;
      v16 = *(_DWORD *)(v9 + 4);
      if (v16 != -1)
        *(_DWORD *)(v9 + 4) = v16 + 1;
    }
    std::vector<degas::BitsetPtr>::insert((_QWORD *)this + 2, (char *)(*((_QWORD *)this + 2) + 16 * Offset), (degas::BitsetPtr *)v25);
    if (*(_QWORD *)this != 0xFFFFFFFFLL)
      ++*(_QWORD *)this;
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)v25);
  }
  v17 = 1;
LABEL_20:
  *((_BYTE *)this + 40) |= v17;
  degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)&v26);
  return v17;
}

void sub_1CA1E512C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)&a9);
  degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)&a11);
  _Unwind_Resume(a1);
}

void std::vector<degas::BitsetPtr>::insert(_QWORD *a1, char *a2, degas::BitsetPtr *a3)
{
  degas::BitsetPtr *v3;
  unint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  degas::BitsetPtr *v9;
  unint64_t v10;
  _QWORD *v11;
  char *v12;
  degas::BitsetPtr *v13;
  __int128 *v14;
  _OWORD *v15;
  __int128 v16;
  unint64_t v17;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  __int128 v22;
  _OWORD *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  unint64_t v29;
  char *v30;
  uint64_t v31;
  __int128 *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char *v37;
  __int128 v38;
  int64x2_t v39;
  char *v40;
  __int128 v41;
  uint64_t v42;
  degas::BitsetPtr *v43;
  degas::BitsetPtr *v44;
  __int128 v45;
  degas::BitsetPtr *v46;
  _OWORD *v47;
  __int128 v48;
  char *v49;
  char *v50;
  char *v51;
  __int128 v52;
  char *v53;
  _QWORD *v54;
  char *v55;
  int64x2_t v56;
  char *v57;
  _QWORD *v58;

  v3 = a3;
  v6 = (char *)*a1;
  v5 = a1[1];
  v7 = (uint64_t)&a2[-*a1];
  v8 = v7 >> 4;
  v9 = (degas::BitsetPtr *)(*a1 + (v7 & 0xFFFFFFFFFFFFFFF0));
  v11 = a1 + 2;
  v10 = a1[2];
  if (v5 >= v10)
  {
    v17 = ((uint64_t)(v5 - (_QWORD)v6) >> 4) + 1;
    if (v17 >> 60)
      std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
    v19 = v10 - (_QWORD)v6;
    if (v19 >> 3 > v17)
      v17 = v19 >> 3;
    if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0)
      v20 = 0xFFFFFFFFFFFFFFFLL;
    else
      v20 = v17;
    v54 = v11;
    if (v20)
      v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<degas::Predicate>>>(v20);
    else
      v21 = 0;
    v23 = (_OWORD *)(v20 + 16 * v8);
    v51 = (char *)v20;
    *(_QWORD *)&v52 = v23;
    *((_QWORD *)&v52 + 1) = v23;
    v53 = (char *)(v20 + 16 * v21);
    if (v8 == v21)
    {
      if (v7 < 1)
      {
        if (v6 == a2)
          v29 = 1;
        else
          v29 = v7 >> 3;
        v58 = v11;
        v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<degas::Predicate>>>(v29);
        v32 = (__int128 *)v52;
        v33 = *((_QWORD *)&v52 + 1) - v52;
        if (*((_QWORD *)&v52 + 1) == (_QWORD)v52)
        {
          v39 = vdupq_n_s64(v52);
          v35 = (unint64_t)&v30[16 * (v29 >> 2)];
        }
        else
        {
          v34 = v33 >> 4;
          v35 = (unint64_t)&v30[16 * (v29 >> 2) + (v33 & 0xFFFFFFFFFFFFFFF0)];
          v36 = 16 * v34;
          v37 = &v30[16 * (v29 >> 2)];
          do
          {
            v38 = *v32++;
            *(_OWORD *)v37 = v38;
            v37 += 16;
            ++*(_DWORD *)v38;
            v36 -= 16;
          }
          while (v36);
          v39 = (int64x2_t)v52;
        }
        v40 = v53;
        v55 = v51;
        v51 = v30;
        *(_QWORD *)&v52 = &v30[16 * (v29 >> 2)];
        v56 = v39;
        *((_QWORD *)&v52 + 1) = v35;
        v53 = &v30[16 * v31];
        v57 = v40;
        std::__split_buffer<degas::BitsetPtr>::~__split_buffer((uint64_t)&v55);
        v23 = (_OWORD *)*((_QWORD *)&v52 + 1);
      }
      else
      {
        v24 = v8 + 2;
        if (v8 >= -1)
          v24 = v8 + 1;
        v23 -= v24 >> 1;
        *(_QWORD *)&v52 = v23;
        *((_QWORD *)&v52 + 1) = v23;
      }
    }
    v41 = *(_OWORD *)v3;
    *v23 = *(_OWORD *)v3;
    ++*(_DWORD *)v41;
    v42 = v52;
    *((_QWORD *)&v52 + 1) += 16;
    v43 = (degas::BitsetPtr *)*a1;
    v44 = v9;
    while (v44 != v43)
    {
      v45 = *((_OWORD *)v44 - 1);
      v44 = (degas::BitsetPtr *)((char *)v44 - 16);
      *(_OWORD *)(v42 - 16) = v45;
      v42 -= 16;
      ++*(_DWORD *)v45;
    }
    *(_QWORD *)&v52 = v42;
    v46 = (degas::BitsetPtr *)a1[1];
    v47 = (_OWORD *)*((_QWORD *)&v52 + 1);
    if (v9 != v46)
    {
      do
      {
        v48 = *(_OWORD *)v9;
        v9 = (degas::BitsetPtr *)((char *)v9 + 16);
        *v47++ = v48;
        ++*(_DWORD *)v48;
      }
      while (v9 != v46);
      v42 = v52;
      v9 = (degas::BitsetPtr *)a1[1];
    }
    v49 = (char *)*a1;
    *a1 = v42;
    a1[1] = v47;
    v50 = (char *)a1[2];
    a1[2] = v53;
    *((_QWORD *)&v52 + 1) = v9;
    v53 = v50;
    v51 = v49;
    *(_QWORD *)&v52 = v49;
    std::__split_buffer<degas::BitsetPtr>::~__split_buffer((uint64_t)&v51);
  }
  else if (v9 == (degas::BitsetPtr *)v5)
  {
    v22 = *(_OWORD *)a3;
    *(_OWORD *)v9 = *(_OWORD *)a3;
    ++*(_DWORD *)v22;
    a1[1] = (char *)v9 + 16;
  }
  else
  {
    v12 = (char *)v9 + 16;
    v13 = (degas::BitsetPtr *)(v5 - 16);
    if (v5 < 0x10)
    {
      v15 = (_OWORD *)a1[1];
    }
    else
    {
      v14 = (__int128 *)(v5 - 16);
      v15 = (_OWORD *)a1[1];
      do
      {
        v16 = *v14++;
        *v15++ = v16;
        ++*(_DWORD *)v16;
      }
      while ((unint64_t)v14 < v5);
    }
    a1[1] = v15;
    if ((char *)v5 != v12)
    {
      v25 = 16 * ((uint64_t)(v5 - (_QWORD)v12) >> 4);
      v26 = (uint64_t)&v6[16 * v8 - 16];
      do
      {
        degas::BitsetPtr::releaseBitset(v13);
        v27 = *(_OWORD *)(v26 + v25);
        *(_OWORD *)v13 = v27;
        if ((_QWORD)v27)
          ++*(_DWORD *)v27;
        v13 = (degas::BitsetPtr *)((char *)v13 - 16);
        v25 -= 16;
      }
      while (v25);
    }
    if (v9 <= v3)
      v3 = (degas::BitsetPtr *)((char *)v3 + 16 * (a1[1] > (unint64_t)v3));
    degas::BitsetPtr::releaseBitset(v9);
    v28 = *(_OWORD *)v3;
    *(_OWORD *)v9 = *(_OWORD *)v3;
    if ((_QWORD)v28)
      ++*(_DWORD *)v28;
  }
}

void sub_1CA1E5488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__split_buffer<degas::BitsetPtr>::~__split_buffer((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Bitmap::clearBit(degas::BitsetPtr **this, unint64_t a2)
{
  unint64_t Offset;
  unint64_t v5;
  degas::Bitset *v6;
  unint64_t v7;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int32x4_t v12;
  int v13;
  degas::BitsetPtr *v14;
  degas::BitsetPtr *v15;
  degas::BitsetPtr *v16;
  __int128 v17;
  degas::BitsetPtr *v18;
  degas::BitsetPtr *v19;
  char v20;
  degas::Bitset *v22[2];

  Offset = degas::Bitmap::findOffset((degas::Bitmap *)this, a2);
  if (Offset >= (this[3] - this[2]) >> 4)
  {
    v9 = 0;
  }
  else
  {
    v5 = Offset;
    degas::Bitmap::unshadowedBitSetAtIndex((degas::Bitmap *)this, Offset, (degas::BitsetPtr *)v22);
    v6 = v22[0];
    v7 = *((_QWORD *)v22[0] + 1);
    if (v7 <= a2 && v7 + 1024 > a2)
    {
      if (degas::Bitset::clearBit(v22[0], a2))
      {
        if (*this != (degas::BitsetPtr *)0xFFFFFFFFLL)
          *this = (degas::BitsetPtr *)((char *)*this - 1);
        v9 = 1;
      }
      else
      {
        v9 = 0;
      }
      v10 = *((_DWORD *)v6 + 1);
      if (!v10)
        goto LABEL_19;
      if (v10 == -1)
      {
        v11 = 0;
        v12 = 0uLL;
        do
        {
          do
          {
            v12 = (int32x4_t)vpadalq_u16((uint32x4_t)v12, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)v6 + 4 * v11 + 16))));
            v11 += 4;
          }
          while (v11 != 32);
          v11 = 0;
          v13 = vaddvq_s32(v12);
          v12 = 0uLL;
        }
        while (v13 == -1);
        *((_DWORD *)v6 + 1) = v13;
        if (!v13)
        {
LABEL_19:
          v14 = this[3];
          v15 = (degas::BitsetPtr *)((char *)this[2] + 16 * v5);
          v16 = (degas::BitsetPtr *)((char *)v15 + 16);
          if ((degas::BitsetPtr *)((char *)v15 + 16) != v14)
          {
            do
            {
              degas::BitsetPtr::releaseBitset(v15);
              v17 = *((_OWORD *)v15 + 1);
              *(_OWORD *)v15 = v17;
              if ((_QWORD)v17)
                ++*(_DWORD *)v17;
              v18 = (degas::BitsetPtr *)((char *)v15 + 16);
              v19 = (degas::BitsetPtr *)((char *)v15 + 32);
              v15 = (degas::BitsetPtr *)((char *)v15 + 16);
            }
            while (v19 != v14);
            v16 = this[3];
            v15 = v18;
          }
          for (; v16 != v15; v16 = (degas::BitsetPtr *)((char *)v16 - 16))
          {
            degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)((char *)v16 - 16));
            *((_QWORD *)v16 - 1) = 0;
          }
          this[3] = v15;
        }
      }
    }
    else
    {
      v9 = 0;
    }
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)v22);
  }
  if (*((_BYTE *)this + 40))
    v20 = 1;
  else
    v20 = v9;
  *((_BYTE *)this + 40) = v20;
  return v9;
}

void degas::Bitmap::setRange(degas::Bitmap *this, unint64_t a2, unint64_t a3)
{
  unint64_t v4;
  os_unfair_lock_s *v6;
  unint64_t Offset;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  degas::Bitset *v18[2];
  __int128 v19;

  if (a2 <= a3)
  {
    v4 = a2;
    if (degas::getBitsetPool(void)::onceToken != -1)
      dispatch_once(&degas::getBitsetPool(void)::onceToken, &__block_literal_global_3736);
    v6 = (os_unfair_lock_s *)degas::getBitsetPool(void)::sPool;
    while (1)
    {
      Offset = degas::Bitmap::findOffset(this, v4);
      if (Offset >= (uint64_t)(*((_QWORD *)this + 3) - *((_QWORD *)this + 2)) >> 4)
      {
        v19 = 0uLL;
        degas::BitsetPool::allocBitset(v6, (degas::BitsetPtr *)&v19, v4 & 0xFFFFFFFFFFFFFC00);
        v13 = v19;
        if (*(_QWORD *)(v19 + 8) + 1023 >= a3)
          v14 = a3;
        else
          v14 = *(_QWORD *)(v19 + 8) + 1023;
        degas::Bitset::setRange((_QWORD *)v19, v4, v14);
        std::vector<degas::BitsetPtr>::push_back[abi:ne180100]((uint64_t *)this + 2, &v19);
        v15 = *(_QWORD *)(v13 + 8);
      }
      else
      {
        v8 = Offset;
        degas::Bitmap::unshadowedBitSetAtIndex(this, Offset, (degas::BitsetPtr *)&v19);
        v9 = v19;
        v10 = *(_QWORD *)(v19 + 8);
        if (v10 > v4 || v10 + 1024 <= v4)
        {
          if (v4 < v10)
          {
            v18[0] = 0;
            v18[1] = 0;
            degas::BitsetPool::allocBitset(v6, (degas::BitsetPtr *)v18, v4 & 0xFFFFFFFFFFFFFC00);
            if (*((_QWORD *)v18[0] + 1) + 1023 >= a3)
              v12 = a3;
            else
              v12 = *((_QWORD *)v18[0] + 1) + 1023;
            degas::Bitset::setRange((_QWORD *)v18[0], v4, v12);
            std::vector<degas::BitsetPtr>::insert((_QWORD *)this + 2, (char *)(*((_QWORD *)this + 2) + 16 * v8), (degas::BitsetPtr *)v18);
            v4 = *((_QWORD *)v18[0] + 1) + 1024;
            degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)v18);
          }
          goto LABEL_24;
        }
        v16 = v10 + 1023;
        if (v16 >= a3)
          v17 = a3;
        else
          v17 = v16;
        degas::Bitset::setRange((_QWORD *)v19, v4, v17);
        v15 = *(_QWORD *)(v9 + 8);
      }
      v4 = v15 + 1024;
LABEL_24:
      degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)&v19);
      if (v4 > a3)
      {
        *(_QWORD *)this = 0xFFFFFFFFLL;
        *((_BYTE *)this + 40) = 1;
        return;
      }
    }
  }
}

void sub_1CA1E57FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)&a9);
  degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)&a11);
  _Unwind_Resume(a1);
}

void degas::Bitmap::clearRange(degas::BitsetPtr **this, unint64_t a2, unint64_t a3)
{
  unint64_t Offset;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _BOOL8 v10;
  uint64_t v11;
  unint64_t v12;
  degas::Bitset *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  degas::Bitset *v18;
  unint64_t v19;
  int v21;
  uint64_t v22;
  int32x4_t v23;
  int v24;
  degas::BitsetPtr *v25;
  degas::BitsetPtr *v26;
  degas::BitsetPtr *v27;
  __int128 v28;
  degas::BitsetPtr *v29;
  degas::BitsetPtr *v30;
  unint64_t v31;
  degas::BitsetPtr *v32;
  uint64_t v33;
  degas::BitsetPtr *v34;
  __int128 *v35;
  degas::BitsetPtr *v36;
  __int128 v37;
  unint64_t v38;
  int v40;
  uint64_t v41;
  int32x4_t v42;
  int v43;
  degas::BitsetPtr *v44;
  degas::BitsetPtr *v45;
  degas::BitsetPtr *v46;
  __int128 v47;
  degas::BitsetPtr *v48;
  degas::BitsetPtr *v49;
  degas::Bitset *v50[2];
  degas::Bitset *v51[2];

  if (a2 <= a3)
  {
    Offset = degas::Bitmap::findOffset((degas::Bitmap *)this, a2);
    v7 = this[3] - this[2];
    if (Offset < v7 >> 4)
    {
      v8 = Offset;
      v9 = degas::Bitmap::findOffset((degas::Bitmap *)this, a3, Offset, v7 >> 4);
      degas::Bitmap::unshadowedBitSetAtIndex((degas::Bitmap *)this, v8, (degas::BitsetPtr *)v51);
      v10 = v9 >= (this[3] - this[2]) >> 4;
      if (v9 < (this[3] - this[2]) >> 4)
        v11 = 0;
      else
        v11 = -1;
      v12 = v9 - v10;
      if (v8 == v9 - v10)
      {
        v13 = v51[0];
        v14 = *((_QWORD *)v51[0] + 1);
        if (v14 <= a2)
          v15 = a2;
        else
          v15 = *((_QWORD *)v51[0] + 1);
        v16 = v14 + 1023;
        if (v16 >= a3)
          v17 = a3;
        else
          v17 = v16;
        if (v15 <= v17)
          degas::Bitset::clearRange(v51[0], v15, v17);
      }
      else
      {
        degas::Bitmap::unshadowedBitSetAtIndex((degas::Bitmap *)this, v12, (degas::BitsetPtr *)v50);
        v18 = v50[0];
        v19 = *((_QWORD *)v50[0] + 1);
        if (v19 <= a3 && v19 + 1024 > a3)
          degas::Bitset::clearRange(v50[0], v19, a3);
        v21 = *((_DWORD *)v18 + 1);
        if (!v21)
          goto LABEL_27;
        if (v21 == -1)
        {
          v22 = 0;
          v23 = 0uLL;
          do
          {
            do
            {
              v23 = (int32x4_t)vpadalq_u16((uint32x4_t)v23, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)v18 + 4 * v22 + 16))));
              v22 += 4;
            }
            while (v22 != 32);
            v22 = 0;
            v24 = vaddvq_s32(v23);
            v23 = 0uLL;
          }
          while (v24 == -1);
          *((_DWORD *)v18 + 1) = v24;
          if (!v24)
          {
LABEL_27:
            v25 = this[3];
            v26 = (degas::BitsetPtr *)((char *)this[2] + 16 * v12);
            v27 = (degas::BitsetPtr *)((char *)v26 + 16);
            if ((degas::BitsetPtr *)((char *)v26 + 16) != v25)
            {
              do
              {
                degas::BitsetPtr::releaseBitset(v26);
                v28 = *((_OWORD *)v26 + 1);
                *(_OWORD *)v26 = v28;
                if ((_QWORD)v28)
                  ++*(_DWORD *)v28;
                v29 = (degas::BitsetPtr *)((char *)v26 + 16);
                v30 = (degas::BitsetPtr *)((char *)v26 + 32);
                v26 = (degas::BitsetPtr *)((char *)v26 + 16);
              }
              while (v30 != v25);
              v27 = this[3];
              v26 = v29;
            }
            for (; v27 != v26; v27 = (degas::BitsetPtr *)((char *)v27 - 16))
            {
              degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)((char *)v27 - 16));
              *((_QWORD *)v27 - 1) = 0;
            }
            this[3] = v26;
          }
        }
        v31 = v12 - 1;
        if (v12 - 1 > v8)
        {
          v32 = this[3];
          v33 = 16 * v9 + 16 * v11 - 16;
          do
          {
            v34 = this[2];
            v35 = (__int128 *)((char *)v34 + 16 * v12);
            v12 = v31;
            v36 = (degas::BitsetPtr *)((char *)v34 + 16 * v31);
            if (v35 != (__int128 *)v32)
            {
              do
              {
                degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)((char *)v34 + v33));
                v37 = *v35;
                *(_OWORD *)v36 = *v35;
                if ((_QWORD)v37)
                  ++*(_DWORD *)v37;
                ++v35;
                v36 = (degas::BitsetPtr *)((char *)v36 + 16);
                v34 = (degas::BitsetPtr *)((char *)v34 + 16);
              }
              while (v35 != (__int128 *)v32);
              v36 = (degas::BitsetPtr *)((char *)v34 + v33);
              v32 = this[3];
            }
            for (; v32 != v36; v32 = (degas::BitsetPtr *)((char *)v32 - 16))
            {
              degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)((char *)v32 - 16));
              *((_QWORD *)v32 - 1) = 0;
            }
            this[3] = v36;
            v31 = v12 - 1;
            v33 -= 16;
            v32 = v36;
          }
          while (v12 - 1 > v8);
        }
        v13 = v51[0];
        v38 = *((_QWORD *)v51[0] + 1);
        if (v38 <= a2 && v38 + 1024 > a2)
          degas::Bitset::clearRange(v51[0], a2, v38 + 1023);
        degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)v50);
      }
      v40 = *((_DWORD *)v13 + 1);
      if (!v40)
        goto LABEL_58;
      if (v40 == -1)
      {
        v41 = 0;
        v42 = 0uLL;
        do
        {
          do
          {
            v42 = (int32x4_t)vpadalq_u16((uint32x4_t)v42, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)v13 + 4 * v41 + 16))));
            v41 += 4;
          }
          while (v41 != 32);
          v41 = 0;
          v43 = vaddvq_s32(v42);
          v42 = 0uLL;
        }
        while (v43 == -1);
        *((_DWORD *)v13 + 1) = v43;
        if (!v43)
        {
LABEL_58:
          v44 = this[3];
          v45 = (degas::BitsetPtr *)((char *)this[2] + 16 * v8);
          v46 = (degas::BitsetPtr *)((char *)v45 + 16);
          if ((degas::BitsetPtr *)((char *)v45 + 16) != v44)
          {
            do
            {
              degas::BitsetPtr::releaseBitset(v45);
              v47 = *((_OWORD *)v45 + 1);
              *(_OWORD *)v45 = v47;
              if ((_QWORD)v47)
                ++*(_DWORD *)v47;
              v48 = (degas::BitsetPtr *)((char *)v45 + 16);
              v49 = (degas::BitsetPtr *)((char *)v45 + 32);
              v45 = (degas::BitsetPtr *)((char *)v45 + 16);
            }
            while (v49 != v44);
            v46 = this[3];
            v45 = v48;
          }
          for (; v46 != v45; v46 = (degas::BitsetPtr *)((char *)v46 - 16))
          {
            degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)((char *)v46 - 16));
            *((_QWORD *)v46 - 1) = 0;
          }
          this[3] = v45;
        }
      }
      *this = (degas::BitsetPtr *)0xFFFFFFFFLL;
      *((_BYTE *)this + 40) = 1;
      degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)v51);
    }
  }
}

void sub_1CA1E5BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)va);
  _Unwind_Resume(a1);
}

uint64_t degas::Bitmap::countBitsInRange(degas::Bitmap *this, unint64_t a2, unint64_t a3)
{
  unint64_t Offset;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int32x4_t v11;
  unint64_t v12;
  degas::Bitset *v13;
  unint64_t v14;
  uint64_t v16;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unsigned int v23;
  uint64_t v24;
  degas::Bitset *v25;
  unint64_t v26;

  if (a2 > a3)
    return 0;
  Offset = degas::Bitmap::findOffset(this, a2);
  v7 = *((_QWORD *)this + 3) - *((_QWORD *)this + 2);
  if (Offset >= v7 >> 4)
    return 0;
  v8 = Offset;
  v9 = v7 >> 4;
  v10 = degas::Bitmap::findOffset(this, a3, Offset, v7 >> 4);
  v12 = v10 - (v10 >= v9);
  v13 = *(degas::Bitset **)(*((_QWORD *)this + 2) + 16 * v8);
  v14 = *((_QWORD *)v13 + 1);
  if (v14 <= a3 && v14 + 1024 >= a2)
    v16 = degas::Bitset::countBitsInRange(v13, a2, a3, *(int8x8_t *)v11.i8);
  else
    v16 = 0;
  if (v8 != v12)
  {
    v18 = v8 + 1;
    v19 = *((_QWORD *)this + 2);
    if (v8 + 1 < v12)
    {
      do
      {
        v20 = *(_QWORD *)(v19 + 16 * v18);
        v21 = *(_QWORD *)(v20 + 8);
        if (v21 <= a3 && v21 + 1024 >= a2)
        {
          v23 = *(_DWORD *)(v20 + 4);
          if (v23 == -1)
          {
            v24 = 0;
            v11 = 0uLL;
            do
            {
              do
              {
                v11 = (int32x4_t)vpadalq_u16((uint32x4_t)v11, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v20 + 4 * v24 + 16))));
                v24 += 4;
              }
              while (v24 != 32);
              v24 = 0;
              v23 = vaddvq_s32(v11);
              v11 = 0uLL;
            }
            while (v23 == -1);
            *(_DWORD *)(v20 + 4) = v23;
          }
          v16 += v23;
        }
        ++v18;
      }
      while (v18 != v12);
    }
    v25 = *(degas::Bitset **)(v19 + 16 * v12);
    v26 = *((_QWORD *)v25 + 1);
    if (v26 <= a3 && v26 + 1024 >= a2)
      v16 += degas::Bitset::countBitsInRange(v25, a2, a3, *(int8x8_t *)v11.i8);
  }
  return v16;
}

void degas::Bitmap::insertBitset(degas::Bitmap *this, uint64_t a2, const degas::Bitset *a3)
{
  _QWORD v6[2];

  if (degas::getBitsetPool(void)::onceToken != -1)
    dispatch_once(&degas::getBitsetPool(void)::onceToken, &__block_literal_global_3736);
  v6[0] = 0;
  v6[1] = 0;
  degas::BitsetPool::allocBitset((os_unfair_lock_s *)degas::getBitsetPool(void)::sPool, (degas::BitsetPtr *)v6, a3);
  std::vector<degas::BitsetPtr>::insert((_QWORD *)this + 2, (char *)(*((_QWORD *)this + 2) + 16 * a2), (degas::BitsetPtr *)v6);
  degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)v6);
}

void sub_1CA1E5DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)&a9);
  _Unwind_Resume(a1);
}

void degas::Bitmap::mergeBitset(degas::Bitmap *this, unint64_t *a2, degas::Bitset *a3, unint64_t *a4, const degas::Bitset *a5)
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  int32x4_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];

  v7 = *((_QWORD *)a3 + 1);
  v8 = *((_QWORD *)a5 + 1);
  if (v7 >= v8)
  {
    if (v7 > v8)
    {
      v11 = *(_QWORD *)this;
      if (*(_QWORD *)this != 0xFFFFFFFFLL)
      {
        v12 = *((_DWORD *)a5 + 1);
        if (v12 == -1)
        {
          v13 = 0;
          v14 = 0uLL;
          do
          {
            do
            {
              v14 = (int32x4_t)vpadalq_u16((uint32x4_t)v14, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)a5 + 4 * v13 + 16))));
              v13 += 4;
            }
            while (v13 != 32);
            v13 = 0;
            v12 = vaddvq_s32(v14);
            v14 = 0uLL;
          }
          while (v12 == -1);
          *((_DWORD *)a5 + 1) = v12;
        }
        *(_QWORD *)this = v11 + v12;
      }
      degas::Bitmap::insertBitset(this, *a2, a5);
      ++*a2;
      ++*a4;
      *((_BYTE *)this + 40) = 1;
    }
    else
    {
      degas::Bitmap::unshadowedBitSetAtIndex(this, *a2, (degas::BitsetPtr *)v18);
      v15 = 0;
      v16 = v18[0];
      v17 = v18[0] + 16;
      do
      {
        *(_DWORD *)(v17 + v15) |= *(_DWORD *)((char *)a5 + v15 + 16);
        v15 += 4;
      }
      while (v15 != 128);
      *(_DWORD *)(v16 + 4) = -1;
      ++*a2;
      ++*a4;
      *(_QWORD *)this = 0xFFFFFFFFLL;
      *((_BYTE *)this + 40) = 1;
      degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)v18);
    }
  }
  else
  {
    *a2 = degas::Bitmap::findOffset(this, v8, *a2, ((*((_QWORD *)this + 3) - *((_QWORD *)this + 2)) >> 4));
  }
}

void degas::Bitmap::appendBitset(degas::Bitmap *this, const degas::Bitset *a2)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  int32x4_t v7;
  __int128 v8;

  v4 = *(_QWORD *)this;
  if (*(_QWORD *)this != 0xFFFFFFFFLL)
  {
    v5 = *((_DWORD *)a2 + 1);
    if (v5 == -1)
    {
      v6 = 0;
      v7 = 0uLL;
      do
      {
        do
        {
          v7 = (int32x4_t)vpadalq_u16((uint32x4_t)v7, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)a2 + 4 * v6 + 16))));
          v6 += 4;
        }
        while (v6 != 32);
        v6 = 0;
        v5 = vaddvq_s32(v7);
        v7 = 0uLL;
      }
      while (v5 == -1);
      *((_DWORD *)a2 + 1) = v5;
    }
    *(_QWORD *)this = v4 + v5;
  }
  v8 = 0uLL;
  if (degas::getBitsetPool(void)::onceToken != -1)
    dispatch_once(&degas::getBitsetPool(void)::onceToken, &__block_literal_global_3736);
  degas::BitsetPool::allocBitset((os_unfair_lock_s *)degas::getBitsetPool(void)::sPool, (degas::BitsetPtr *)&v8, a2);
  std::vector<degas::BitsetPtr>::push_back[abi:ne180100]((uint64_t *)this + 2, &v8);
  *((_BYTE *)this + 40) = 1;
  degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)&v8);
}

void sub_1CA1E6078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Bitmap::intersectBitset(degas::BitsetPtr **this, unint64_t *a2, degas::Bitset *a3, unint64_t *a4, const degas::Bitset *a5)
{
  unint64_t v7;
  unint64_t v8;
  degas::BitsetPtr *v9;
  unsigned int v10;
  uint64_t v11;
  int32x4_t v12;
  degas::BitsetPtr *v13;
  degas::BitsetPtr *v14;
  degas::BitsetPtr *v15;
  __int128 v16;
  degas::BitsetPtr *v17;
  degas::BitsetPtr *v18;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int32x4_t v26;
  int v27;
  degas::BitsetPtr *v28;
  degas::BitsetPtr *v29;
  degas::BitsetPtr *v30;
  __int128 v31;
  degas::BitsetPtr *v32;
  degas::BitsetPtr *v33;
  _QWORD v34[2];

  v7 = *((_QWORD *)a3 + 1);
  v8 = *((_QWORD *)a5 + 1);
  if (v7 >= v8)
  {
    if (v7 > v8)
    {
      return 1;
    }
    else
    {
      degas::Bitmap::unshadowedBitSetAtIndex((degas::Bitmap *)this, *a2, (degas::BitsetPtr *)v34);
      v22 = 0;
      v23 = v34[0];
      v24 = v34[0] + 16;
      do
      {
        *(_DWORD *)(v24 + v22) &= *(_DWORD *)((char *)a5 + v22 + 16);
        v22 += 4;
      }
      while (v22 != 128);
      v25 = 0;
      *(_DWORD *)(v23 + 4) = -1;
      *this = (degas::BitsetPtr *)0xFFFFFFFFLL;
      *((_BYTE *)this + 40) = 1;
      ++*a4;
      v26 = 0uLL;
      do
      {
        do
        {
          v26 = (int32x4_t)vpadalq_u16((uint32x4_t)v26, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v23 + 4 * v25 + 16))));
          v25 += 4;
        }
        while (v25 != 32);
        v25 = 0;
        v27 = vaddvq_s32(v26);
        v26 = 0uLL;
      }
      while (v27 == -1);
      *(_DWORD *)(v23 + 4) = v27;
      if (v27)
      {
        ++*a2;
      }
      else
      {
        v28 = this[3];
        v29 = (degas::BitsetPtr *)((char *)this[2] + 16 * *a2);
        v30 = (degas::BitsetPtr *)((char *)v29 + 16);
        if ((degas::BitsetPtr *)((char *)v29 + 16) != v28)
        {
          do
          {
            degas::BitsetPtr::releaseBitset(v29);
            v31 = *((_OWORD *)v29 + 1);
            *(_OWORD *)v29 = v31;
            if ((_QWORD)v31)
              ++*(_DWORD *)v31;
            v32 = (degas::BitsetPtr *)((char *)v29 + 16);
            v33 = (degas::BitsetPtr *)((char *)v29 + 32);
            v29 = (degas::BitsetPtr *)((char *)v29 + 16);
          }
          while (v33 != v28);
          v30 = this[3];
          v29 = v32;
        }
        for (; v30 != v29; v30 = (degas::BitsetPtr *)((char *)v30 - 16))
        {
          degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)((char *)v30 - 16));
          *((_QWORD *)v30 - 1) = 0;
        }
        this[3] = v29;
      }
      degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)v34);
      return 0;
    }
  }
  else
  {
    v9 = *this;
    if (*this != (degas::BitsetPtr *)0xFFFFFFFFLL)
    {
      v10 = *((_DWORD *)a3 + 1);
      if (v10 == -1)
      {
        v11 = 0;
        v12 = 0uLL;
        do
        {
          do
          {
            v12 = (int32x4_t)vpadalq_u16((uint32x4_t)v12, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)a3 + 4 * v11 + 16))));
            v11 += 4;
          }
          while (v11 != 32);
          v11 = 0;
          v10 = vaddvq_s32(v12);
          v12 = 0uLL;
        }
        while (v10 == -1);
        *((_DWORD *)a3 + 1) = v10;
      }
      *this = (degas::BitsetPtr *)((char *)v9 - v10);
    }
    v13 = this[3];
    v14 = (degas::BitsetPtr *)((char *)this[2] + 16 * *a2);
    v15 = (degas::BitsetPtr *)((char *)v14 + 16);
    if ((degas::BitsetPtr *)((char *)v14 + 16) != v13)
    {
      do
      {
        degas::BitsetPtr::releaseBitset(v14);
        v16 = *((_OWORD *)v14 + 1);
        *(_OWORD *)v14 = v16;
        if ((_QWORD)v16)
          ++*(_DWORD *)v16;
        v17 = (degas::BitsetPtr *)((char *)v14 + 16);
        v18 = (degas::BitsetPtr *)((char *)v14 + 32);
        v14 = (degas::BitsetPtr *)((char *)v14 + 16);
      }
      while (v18 != v13);
      v15 = this[3];
      v14 = v17;
    }
    for (; v15 != v14; v15 = (degas::BitsetPtr *)((char *)v15 - 16))
    {
      degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)((char *)v15 - 16));
      *((_QWORD *)v15 - 1) = 0;
    }
    result = 0;
    this[3] = v14;
    *((_BYTE *)this + 40) = 1;
  }
  return result;
}

unint64_t *degas::Bitmap::getBatch(unint64_t *this, degas::Bitmap *a2, unint64_t a3)
{
  unint64_t *v5;
  unint64_t **v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v11;
  unint64_t *v15;
  unint64_t v16;
  unint64_t **v17;
  unint64_t v18;

  v5 = this;
  v18 = -1;
  v6 = (unint64_t **)this[2];
  v7 = this[3];
  if (v6 == (unint64_t **)v7)
  {
    v7 = this[2];
    v8 = -1;
  }
  else
  {
    this = *v6;
    v8 = (*v6)[1];
    if (v8 > 0xFFFFFFFFFFFFFBFFLL || (this[2] & 1) == 0)
    {
      this = (unint64_t *)degas::Bitset::nextBit((degas::Bitset *)this, &v18, v8);
      v8 = v18;
    }
  }
  v15 = v5;
  v16 = v8;
  v17 = v6;
  if ((v6 != (unint64_t **)v7 || v8 != -1) && a3 != 0)
  {
    v11 = 1;
    do
    {
      degas::Bitmap::setBit(a2, v8);
      this = degas::Bitmap::iterator::operator++((unint64_t *)&v15);
      v8 = v16;
    }
    while ((v17 != (unint64_t **)v5[3] || v16 != -1 || v15 != v5) && v11++ < a3);
  }
  return this;
}

unint64_t *degas::Bitmap::iterator::operator++(unint64_t *a1)
{
  degas::Bitset **v2;
  unint64_t v3;

  v2 = (degas::Bitset **)a1[2];
  if (v2 != *(degas::Bitset ***)(*a1 + 24))
  {
    v3 = a1[1];
    do
    {
      if ((degas::Bitset::nextBit(*v2, a1 + 1, v3) & 1) != 0)
        break;
      v2 = (degas::Bitset **)(a1[2] + 16);
      v3 = -1;
      a1[1] = -1;
      a1[2] = (unint64_t)v2;
    }
    while (v2 != *(degas::Bitset ***)(*a1 + 24));
  }
  return a1;
}

_QWORD *degas::Bitmap::begin@<X0>(_QWORD *this@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v2 = this;
  v4 = -1;
  v6 = -1;
  v5 = this[2];
  if (v5 != this[3])
  {
    this = *(_QWORD **)v5;
    v4 = *(_QWORD *)(*(_QWORD *)v5 + 8);
    if (v4 > 0xFFFFFFFFFFFFFBFFLL || (this[2] & 1) == 0)
    {
      this = (_QWORD *)degas::Bitset::nextBit((degas::Bitset *)this, &v6, v4);
      v4 = v6;
    }
  }
  *a2 = v2;
  a2[1] = v4;
  a2[2] = v5;
  return this;
}

BOOL degas::Bitmap::iterator::operator!=(_QWORD *a1, _QWORD *a2)
{
  return *a1 != *a2 || a1[1] != a2[1] || a1[2] != a2[2];
}

uint64_t degas::Bitmap::end@<X0>(uint64_t this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *(_QWORD *)(this + 24);
  *a2 = this;
  a2[1] = -1;
  a2[2] = v2;
  return this;
}

_QWORD *degas::Bitmap::firstBitset(degas::Bitmap *this)
{
  _QWORD *result;

  result = (_QWORD *)*((_QWORD *)this + 2);
  if (result == *((_QWORD **)this + 3))
  {
    result = (_QWORD *)degas::emptySharedPtr(void)::s_emptySharedPtr;
    if (!degas::emptySharedPtr(void)::s_emptySharedPtr)
    {
      result = (_QWORD *)operator new();
      *result = 0;
      result[1] = 0;
      degas::emptySharedPtr(void)::s_emptySharedPtr = (uint64_t)result;
    }
  }
  return result;
}

_QWORD *degas::Bitmap::bitsetAtIndex(degas::Bitmap *this, unint64_t a2)
{
  uint64_t v2;
  _QWORD *result;

  v2 = *((_QWORD *)this + 2);
  if (a2 < (*((_QWORD *)this + 3) - v2) >> 4)
    return (_QWORD *)(v2 + 16 * a2);
  result = (_QWORD *)degas::emptySharedPtr(void)::s_emptySharedPtr;
  if (!degas::emptySharedPtr(void)::s_emptySharedPtr)
  {
    result = (_QWORD *)operator new();
    *result = 0;
    result[1] = 0;
    degas::emptySharedPtr(void)::s_emptySharedPtr = (uint64_t)result;
  }
  return result;
}

__int128 *degas::Bitmap::emptyBitmap(degas::Bitmap *this)
{
  unsigned __int8 v1;

  {
    unk_1ED852BC1 = 0u;
    degas::Bitmap::emptyBitmap(void)::bitmap = 0u;
    unk_1ED852BB8 = 0u;
    __cxa_atexit((void (*)(void *))degas::Bitmap::~Bitmap, &degas::Bitmap::emptyBitmap(void)::bitmap, &dword_1CA0A5000);
  }
  return &degas::Bitmap::emptyBitmap(void)::bitmap;
}

void degas::Bitmap::~Bitmap(degas::Bitmap *this)
{
  void **v1;

  v1 = (void **)((char *)this + 16);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
}

uint64_t degas::Bitmap::description(degas::Bitmap *this)
{
  unint64_t v2;
  degas::Bitset **v3;
  degas::Bitset **v4;
  degas::Bitset *v5;
  char v6;
  degas::Bitmap *v7;
  unint64_t v9;
  unint64_t v10;
  degas::Bitset **v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;
  unint64_t v15;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"[", 1);
  v2 = -1;
  v15 = -1;
  v4 = (degas::Bitset **)*((_QWORD *)this + 2);
  v3 = (degas::Bitset **)*((_QWORD *)this + 3);
  if (v4 != v3)
  {
    v5 = *v4;
    v2 = *((_QWORD *)*v4 + 1);
    if (v2 > 0xFFFFFFFFFFFFFBFFLL || (*((_BYTE *)v5 + 16) & 1) == 0)
    {
      degas::Bitset::nextBit(v5, &v15, *((_QWORD *)*v4 + 1));
      v2 = v15;
    }
  }
  v9 = (unint64_t)this;
  v10 = v2;
  v6 = 1;
  v7 = this;
  v11 = v4;
  while (v7 != this || v2 != -1 || v4 != v3)
  {
    if ((v6 & 1) == 0)
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)",", 1);
    std::ostream::operator<<();
    degas::Bitmap::iterator::operator++(&v9);
    v6 = 0;
    v3 = (degas::Bitset **)*((_QWORD *)this + 3);
    v7 = (degas::Bitmap *)v9;
    v2 = v10;
    v4 = v11;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"]", 1);
  std::stringbuf::str();
  v12[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1CAA4AD98](&v14);
}

void sub_1CA1E6800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

unint64_t *degas::Bitmap::iterator::operator++@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *a1;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 1);
  return degas::Bitmap::iterator::operator++(a1);
}

_QWORD *degas::Bitmap::iterator::iterator(_QWORD *result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  *result = a2;
  result[1] = a3;
  result[2] = *a4;
  return result;
}

{
  *result = a2;
  result[1] = a3;
  result[2] = *a4;
  return result;
}

_QWORD *degas::Bitmap::iterator::iterator(_QWORD *this, const degas::Bitmap *a2, uint64_t a3, uint64_t a4)
{
  *this = a2;
  this[1] = a3;
  this[2] = *((_QWORD *)a2 + 2) + 16 * a4;
  return this;
}

{
  *this = a2;
  this[1] = a3;
  this[2] = *((_QWORD *)a2 + 2) + 16 * a4;
  return this;
}

__n128 degas::Bitmap::iterator::iterator(degas::Bitmap::iterator *this, const degas::Bitmap::iterator *a2)
{
  __n128 result;

  *(_QWORD *)this = *(_QWORD *)a2;
  result = *(__n128 *)((char *)a2 + 8);
  *(__n128 *)((char *)this + 8) = result;
  return result;
}

{
  __n128 result;

  *(_QWORD *)this = *(_QWORD *)a2;
  result = *(__n128 *)((char *)a2 + 8);
  *(__n128 *)((char *)this + 8) = result;
  return result;
}

__n128 degas::Bitmap::iterator::operator=(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  result = *(__n128 *)(a2 + 8);
  *(__n128 *)(a1 + 8) = result;
  return result;
}

BOOL degas::Bitmap::iterator::operator==(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

_QWORD *degas::Bitmap::iterator::seek(_QWORD *this, unint64_t a2)
{
  uint64_t v2;
  degas::Bitset **v3;
  _QWORD *v5;
  unint64_t v6;
  degas::Bitset *v7;
  unsigned int v8;
  uint64_t v9;
  int32x4_t v10;
  unint64_t v11;
  unint64_t v12;

  v2 = *this;
  v3 = *(degas::Bitset ***)(*this + 16);
  this[1] = -1;
  this[2] = v3;
  if (v3 != *(degas::Bitset ***)(v2 + 24))
  {
    v5 = this;
    v6 = 0;
    while (1)
    {
      v7 = *v3;
      v8 = *((_DWORD *)*v3 + 1);
      if (v8 == -1)
      {
        v9 = 0;
        v10 = 0uLL;
        do
        {
          do
          {
            v10 = (int32x4_t)vpadalq_u16((uint32x4_t)v10, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)v7 + 4 * v9 + 16))));
            v9 += 4;
          }
          while (v9 != 32);
          v9 = 0;
          v8 = vaddvq_s32(v10);
          v10 = 0uLL;
        }
        while (v8 == -1);
        *((_DWORD *)v7 + 1) = v8;
      }
      if (v6 + v8 > a2)
        break;
      v3 += 2;
      this[2] = v3;
      v6 += v8;
      if (v3 == *(degas::Bitset ***)(v2 + 24))
        return this;
    }
    v11 = -1;
    v12 = -1;
    do
    {
      this = (_QWORD *)degas::Bitset::nextBit(v7, &v12, v11);
      v11 = v12;
      ++v6;
    }
    while (v6 <= a2);
    v5[1] = v12;
  }
  return this;
}

void sub_1CA1E6CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id nodePrintableSchema(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v3 = a1;
  v4 = a2;
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("(%@:%@:%lu)"), v4, v6, objc_msgSend(v3, "domain"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("==== Node: %@ === \n"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "inEdgesCount");
  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    objc_msgSend(v8, "appendString:", CFSTR("inEdges:\n"));
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __nodePrintableSchema_block_invoke;
    v14[3] = &unk_1E83E62B0;
    v15 = v8;
    v16 = v4;
    objc_msgSend(v3, "enumerateInEdgesUsingBlock:", v14);

  }
  if (objc_msgSend(v3, "outEdgesCount"))
  {
    objc_msgSend(v8, "appendString:", CFSTR("outEdges:\n"));
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __nodePrintableSchema_block_invoke_2;
    v12[3] = &unk_1E83E6378;
    v13 = v8;
    objc_msgSend(v3, "enumerateOutEdgesUsingBlock:", v12);

  }
  return v8;
}

void __nodePrintableSchema_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  edgePrintableSchema(a2, 0, 0, *(void **)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("%@\n"), v3);

}

void __nodePrintableSchema_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  edgePrintableSchema(a2, CFSTR("DEFINITION_NODE"), 0, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("%@\n"), v3);

}

id edgePrintableSchema(void *a1, void *a2, void *a3, void *a4)
{
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = a1;
  objc_msgSend(v10, "sourceNode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "targetNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3940];
  if (v8)
    v14 = v8;
  else
    v14 = &stru_1E83E6588;
  objc_msgSend(v10, "label");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v10, "domain");

  objc_msgSend(v13, "stringWithFormat:", CFSTR("[%@:%@:%lu]"), v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CB3940];
  if (v9)
    v19 = v9;
  else
    v19 = &stru_1E83E6588;
  objc_msgSend(v11, "label");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("(%@:%@:%lu)"), v19, v20, objc_msgSend(v11, "domain"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0CB3940];
  if (v7)
    v23 = v7;
  else
    v23 = &stru_1E83E6588;
  objc_msgSend(v12, "label");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("(%@:%@:%lu)"), v23, v24, objc_msgSend(v12, "domain"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@->%@->%@"), v21, v17, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

uint64_t isElementMatchingDefinition(void *a1, void *a2)
{
  id v3;
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "domain");
  if (v5 == objc_msgSend(v4, "domain"))
  {
    objc_msgSend(v3, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("*")) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v3, "label");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "label");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "isEqualToString:", v9);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_1CA1EC69C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1CA1ED1EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5933(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5934(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__6140(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6141(uint64_t a1)
{

}

void degas::AttributeTable::~AttributeTable(degas::AttributeTable *this)
{
  *(_QWORD *)this = off_1E83E43A8;
  *((_QWORD *)this + 4) = 0;
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
}

{
  *(_QWORD *)this = off_1E83E43A8;
  *((_QWORD *)this + 4) = 0;
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
  JUMPOUT(0x1CAA4ADC8);
}

{
  *(_QWORD *)this = off_1E83E43A8;
  *((_QWORD *)this + 4) = 0;
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
}

uint64_t degas::AttributeTable::createTable(degas::AttributeTable *this)
{
  sqlite3 *v1;
  uint64_t v2;
  void *__p[2];
  char v5;
  sqlite3_stmt *ppStmt[3];

  v1 = (sqlite3 *)*((_QWORD *)this + 4);
  std::string::basic_string[abi:ne180100]<0>(__p, "create table Attribute (identifier integer primary key autoincrement, name text)");
  degas::Statement::Statement(ppStmt, v1, (uint64_t)__p);
  if (v5 < 0)
    operator delete(__p[0]);
  v2 = degas::Statement::update(ppStmt);
  degas::Statement::~Statement((degas::Statement *)ppStmt);
  return v2;
}

void sub_1CA1EF204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  degas::Statement::~Statement((degas::Statement *)&a15);
  _Unwind_Resume(a1);
}

uint64_t degas::AttributeTable::deleteEntry(degas::AttributeTable *this, sqlite3_int64 a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t *Statement;
  _QWORD v7[5];

  v3 = (*((unsigned __int8 *)this + 48) << 16) | 0x500;
  v4 = *((_QWORD *)this + 5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___ZNK5degas14AttributeTable15deleteStatementEv_block_invoke;
  v7[3] = &__block_descriptor_tmp_6_6159;
  v7[4] = this;
  Statement = degas::StatementCache::getStatement(v4, v3, (uint64_t)v7);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  return degas::Statement::update((sqlite3_stmt **)*Statement);
}

uint64_t *degas::AttributeTable::deleteStatement(degas::AttributeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x500;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas14AttributeTable15deleteStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_6_6159;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas14AttributeTable15deleteStatementEv_block_invoke(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  sqlite3_stmt **v4;
  sqlite3 *v5;
  void *__p[2];
  char v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = (sqlite3_stmt **)operator new();
  v5 = *(sqlite3 **)(v3 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "delete from Attribute where identifier=?1");
  degas::Statement::Statement(v4, v5, (uint64_t)__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v4);
  if (v7 < 0)
    operator delete(__p[0]);
}

void sub_1CA1EF3B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

degas::AttributeTable *degas::AttributeTable::AttributeTable(degas::AttributeTable *this, sqlite3 *a2, degas::StatementCache *a3)
{
  std::string *v6;
  int v7;
  void *__p[2];
  uint64_t v10;

  std::string::basic_string[abi:ne180100]<0>(__p, "Attribute");
  *(_QWORD *)this = off_1E83E43A8;
  v6 = (std::string *)((char *)this + 8);
  if (SHIBYTE(v10) < 0)
  {
    std::string::__init_copy_ctor_external(v6, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    v7 = SHIBYTE(v10);
    *((_QWORD *)this + 4) = a2;
    *((_QWORD *)this + 5) = a3;
    if (v7 < 0)
      operator delete(__p[0]);
  }
  else
  {
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    *((_QWORD *)this + 3) = v10;
    *((_QWORD *)this + 4) = a2;
    *((_QWORD *)this + 5) = a3;
  }
  *(_QWORD *)this = off_1E83E63D0;
  *((_BYTE *)this + 48) = 1;
  return this;
}

void sub_1CA1EF4A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t *degas::AttributeTable::insertStatement(degas::AttributeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x300;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas14AttributeTable15insertStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_6166;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas14AttributeTable15insertStatementEv_block_invoke(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  sqlite3_stmt **v4;
  sqlite3 *v5;
  void *__p[2];
  char v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = (sqlite3_stmt **)operator new();
  v5 = *(sqlite3 **)(v3 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "insert into Attribute (identifier, name) values(?1, ?2)");
  degas::Statement::Statement(v4, v5, (uint64_t)__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v4);
  if (v7 < 0)
    operator delete(__p[0]);
}

void sub_1CA1EF5F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

uint64_t *degas::AttributeTable::updateStatement(degas::AttributeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x400;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas14AttributeTable15updateStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_4_6168;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas14AttributeTable15updateStatementEv_block_invoke(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  sqlite3_stmt **v4;
  sqlite3 *v5;
  void *__p[2];
  char v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = (sqlite3_stmt **)operator new();
  v5 = *(sqlite3 **)(v3 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "update Attribute set name=?2 where identifier=?1");
  degas::Statement::Statement(v4, v5, (uint64_t)__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v4);
  if (v7 < 0)
    operator delete(__p[0]);
}

void sub_1CA1EF738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

uint64_t *degas::AttributeTable::readByIdentifierStatement(degas::AttributeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x600;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas14AttributeTable25readByIdentifierStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_8_6170;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas14AttributeTable25readByIdentifierStatementEv_block_invoke(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  sqlite3_stmt **v4;
  sqlite3 *v5;
  void *__p[2];
  char v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = (sqlite3_stmt **)operator new();
  v5 = *(sqlite3 **)(v3 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "select identifier, name from Attribute where identifier=?1");
  degas::Statement::Statement(v4, v5, (uint64_t)__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v4);
  if (v7 < 0)
    operator delete(__p[0]);
}

void sub_1CA1EF878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

uint64_t *degas::AttributeTable::readAfterIdentifierStatement(degas::AttributeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x800;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas14AttributeTable28readAfterIdentifierStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_10_6172;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas14AttributeTable28readAfterIdentifierStatementEv_block_invoke(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  sqlite3_stmt **v4;
  sqlite3 *v5;
  void *__p[2];
  char v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = (sqlite3_stmt **)operator new();
  v5 = *(sqlite3 **)(v3 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "select identifier, name from Attribute where identifier > ?1");
  degas::Statement::Statement(v4, v5, (uint64_t)__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v4);
  if (v7 < 0)
    operator delete(__p[0]);
}

void sub_1CA1EF9B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

uint64_t *degas::AttributeTable::readByNameStatement(degas::AttributeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x601;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas14AttributeTable19readByNameStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_12_6174;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas14AttributeTable19readByNameStatementEv_block_invoke(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  sqlite3_stmt **v4;
  sqlite3 *v5;
  void *__p[2];
  char v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = (sqlite3_stmt **)operator new();
  v5 = *(sqlite3 **)(v3 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "select identifier, name from Attribute where name=?1");
  degas::Statement::Statement(v4, v5, (uint64_t)__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v4);
  if (v7 < 0)
    operator delete(__p[0]);
}

void sub_1CA1EFAF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

uint64_t *degas::AttributeTable::readAllStatement(degas::AttributeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x700;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas14AttributeTable16readAllStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_14_6176;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas14AttributeTable16readAllStatementEv_block_invoke(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  sqlite3_stmt **v4;
  sqlite3 *v5;
  void *__p[2];
  char v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = (sqlite3_stmt **)operator new();
  v5 = *(sqlite3 **)(v3 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "select identifier, name from Attribute order by identifier");
  degas::Statement::Statement(v4, v5, (uint64_t)__p);
  std::shared_ptr<degas::Statement>::shared_ptr[abi:ne180100]<degas::Statement,void>(a2, (uint64_t)v4);
  if (v7 < 0)
    operator delete(__p[0]);
}

void sub_1CA1EFC38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x1CAA4ADC8](v15, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

uint64_t degas::AttributeTable::insert(uint64_t a1, sqlite3_int64 *a2, uint64_t *a3)
{
  unsigned int v6;
  uint64_t v7;
  uint64_t *Statement;
  sqlite3_stmt **v9;
  uint64_t v10;
  BOOL v11;
  _QWORD v13[5];

  v6 = (*(unsigned __int8 *)(a1 + 48) << 16) | 0x300;
  v7 = *(_QWORD *)(a1 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 0x40000000;
  v13[2] = ___ZNK5degas14AttributeTable15insertStatementEv_block_invoke;
  v13[3] = &__block_descriptor_tmp_6166;
  v13[4] = a1;
  Statement = degas::StatementCache::getStatement(v7, v6, (uint64_t)v13);
  v9 = (sqlite3_stmt **)*Statement;
  if (*a2)
    degas::Statement::bindInteger(v9, 1, *a2);
  else
    degas::Statement::bindNull(v9, 1);
  degas::Statement::bindString(*Statement, 2, a3);
  v10 = degas::Statement::update((sqlite3_stmt **)*Statement);
  if ((_DWORD)v10)
    v11 = 0;
  else
    v11 = *a2 == 0;
  if (v11)
    *a2 = sqlite3_last_insert_rowid(*(sqlite3 **)(a1 + 32));
  return v10;
}

uint64_t degas::AttributeTable::update(uint64_t a1, sqlite3_int64 a2, uint64_t *a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t *Statement;
  _QWORD v9[5];

  v5 = (*(unsigned __int8 *)(a1 + 48) << 16) | 0x400;
  v6 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = ___ZNK5degas14AttributeTable15updateStatementEv_block_invoke;
  v9[3] = &__block_descriptor_tmp_4_6168;
  v9[4] = a1;
  Statement = degas::StatementCache::getStatement(v6, v5, (uint64_t)v9);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  degas::Statement::bindString(*Statement, 2, a3);
  return degas::Statement::update((sqlite3_stmt **)*Statement);
}

uint64_t *degas::AttributeTable::prepareStatementToReadByIdentifier(degas::AttributeTable *this, sqlite3_int64 a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t *Statement;
  _QWORD v7[5];

  v3 = (*((unsigned __int8 *)this + 48) << 16) | 0x600;
  v4 = *((_QWORD *)this + 5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___ZNK5degas14AttributeTable25readByIdentifierStatementEv_block_invoke;
  v7[3] = &__block_descriptor_tmp_8_6170;
  v7[4] = this;
  Statement = degas::StatementCache::getStatement(v4, v3, (uint64_t)v7);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  return Statement;
}

uint64_t *degas::AttributeTable::prepareStatementToReadAfterIdentifier(degas::AttributeTable *this, sqlite3_int64 a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t *Statement;
  _QWORD v7[5];

  v3 = (*((unsigned __int8 *)this + 48) << 16) | 0x800;
  v4 = *((_QWORD *)this + 5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___ZNK5degas14AttributeTable28readAfterIdentifierStatementEv_block_invoke;
  v7[3] = &__block_descriptor_tmp_10_6172;
  v7[4] = this;
  Statement = degas::StatementCache::getStatement(v4, v3, (uint64_t)v7);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  return Statement;
}

uint64_t *degas::AttributeTable::prepareStatementToReadByName(uint64_t a1, uint64_t *a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t *Statement;
  _QWORD v7[5];

  v3 = (*(unsigned __int8 *)(a1 + 48) << 16) | 0x601;
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___ZNK5degas14AttributeTable19readByNameStatementEv_block_invoke;
  v7[3] = &__block_descriptor_tmp_12_6174;
  v7[4] = a1;
  Statement = degas::StatementCache::getStatement(v4, v3, (uint64_t)v7);
  degas::Statement::bindString(*Statement, 1, a2);
  return Statement;
}

uint64_t *degas::AttributeTable::prepareStatementToReadAll(degas::AttributeTable *this)
{
  unsigned int v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x700;
  v2 = *((_QWORD *)this + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas14AttributeTable16readAllStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_14_6176;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

degas::AttributeCursor *degas::AttributeCursor::AttributeCursor(degas::AttributeCursor *this, const degas::AttributeTable *a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t *Statement;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  _QWORD v10[5];

  v3 = (*((unsigned __int8 *)a2 + 48) << 16) | 0x700;
  v4 = *((_QWORD *)a2 + 5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 0x40000000;
  v10[2] = ___ZNK5degas14AttributeTable16readAllStatementEv_block_invoke;
  v10[3] = &__block_descriptor_tmp_14_6176;
  v10[4] = a2;
  Statement = degas::StatementCache::getStatement(v4, v3, (uint64_t)v10);
  *(_QWORD *)this = *Statement;
  v6 = Statement[1];
  *((_QWORD *)this + 1) = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  return this;
}

{
  unsigned int v3;
  uint64_t v4;
  uint64_t *Statement;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  _QWORD v10[5];

  v3 = (*((unsigned __int8 *)a2 + 48) << 16) | 0x700;
  v4 = *((_QWORD *)a2 + 5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 0x40000000;
  v10[2] = ___ZNK5degas14AttributeTable16readAllStatementEv_block_invoke;
  v10[3] = &__block_descriptor_tmp_14_6176;
  v10[4] = a2;
  Statement = degas::StatementCache::getStatement(v4, v3, (uint64_t)v10);
  *(_QWORD *)this = *Statement;
  v6 = Statement[1];
  *((_QWORD *)this + 1) = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  return this;
}

degas::AttributeCursor *degas::AttributeCursor::AttributeCursor(degas::AttributeCursor *this, sqlite3_int64 a2, const degas::AttributeTable *a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t *Statement;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  _QWORD v12[5];

  v5 = (*((unsigned __int8 *)a3 + 48) << 16) | 0x600;
  v6 = *((_QWORD *)a3 + 5);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 0x40000000;
  v12[2] = ___ZNK5degas14AttributeTable25readByIdentifierStatementEv_block_invoke;
  v12[3] = &__block_descriptor_tmp_8_6170;
  v12[4] = a3;
  Statement = degas::StatementCache::getStatement(v6, v5, (uint64_t)v12);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  *(_QWORD *)this = *Statement;
  v8 = Statement[1];
  *((_QWORD *)this + 1) = v8;
  if (v8)
  {
    v9 = (unint64_t *)(v8 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  return this;
}

uint64_t *degas::AttributeCursor::AttributeCursor(uint64_t *a1, sqlite3_int64 a2, uint64_t a3, int a4)
{
  unsigned int v6;
  uint64_t v7;
  void (*v8)(uint64_t@<X0>, _QWORD *@<X8>);
  void *v9;
  uint64_t *Statement;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t@<X0>, _QWORD *@<X8>);
  void *v18;
  uint64_t v19;

  if (a4 == 5)
  {
    v6 = (*(unsigned __int8 *)(a3 + 48) << 16) | 0x800;
    v7 = *(_QWORD *)(a3 + 40);
    v15 = MEMORY[0x1E0C809B0];
    v8 = ___ZNK5degas14AttributeTable28readAfterIdentifierStatementEv_block_invoke;
    v16 = 0x40000000;
    v9 = &__block_descriptor_tmp_10_6172;
  }
  else
  {
    v6 = (*(unsigned __int8 *)(a3 + 48) << 16) | 0x600;
    v7 = *(_QWORD *)(a3 + 40);
    v15 = MEMORY[0x1E0C809B0];
    v8 = ___ZNK5degas14AttributeTable25readByIdentifierStatementEv_block_invoke;
    v16 = 0x40000000;
    v9 = &__block_descriptor_tmp_8_6170;
  }
  v17 = v8;
  v18 = v9;
  v19 = a3;
  Statement = degas::StatementCache::getStatement(v7, v6, (uint64_t)&v15);
  degas::Statement::bindInteger((sqlite3_stmt **)*Statement, 1, a2);
  *a1 = *Statement;
  v11 = Statement[1];
  a1[1] = v11;
  if (v11)
  {
    v12 = (unint64_t *)(v11 + 8);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  return a1;
}

uint64_t *degas::AttributeCursor::AttributeCursor(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t *Statement;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  _QWORD v12[5];

  v5 = (*(unsigned __int8 *)(a3 + 48) << 16) | 0x601;
  v6 = *(_QWORD *)(a3 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 0x40000000;
  v12[2] = ___ZNK5degas14AttributeTable19readByNameStatementEv_block_invoke;
  v12[3] = &__block_descriptor_tmp_12_6174;
  v12[4] = a3;
  Statement = degas::StatementCache::getStatement(v6, v5, (uint64_t)v12);
  degas::Statement::bindString(*Statement, 1, a2);
  *a1 = *Statement;
  v8 = Statement[1];
  a1[1] = v8;
  if (v8)
  {
    v9 = (unint64_t *)(v8 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  return a1;
}

sqlite3_int64 degas::AttributeCursor::attrId(sqlite3_stmt ***this)
{
  return sqlite3_column_int64(**this, 0);
}

void degas::AttributeCursor::name(sqlite3_stmt ***a1, uint64_t a2)
{
  degas::Statement::stringColumnValue(*a1, 1, a2);
}

uint64_t sub_1CA1F0688()
{
  return MEMORY[0x1E0DE9500]();
}

uint64_t sub_1CA1F0694()
{
  return MEMORY[0x1E0DE9510]();
}

uint64_t sub_1CA1F06A0()
{
  return MEMORY[0x1E0DE9518]();
}

uint64_t sub_1CA1F06AC()
{
  return MEMORY[0x1E0DE9858]();
}

uint64_t sub_1CA1F06B8()
{
  return MEMORY[0x1E0DE9860]();
}

uint64_t sub_1CA1F06C4()
{
  return MEMORY[0x1E0DE98C8]();
}

uint64_t sub_1CA1F06D0()
{
  return MEMORY[0x1E0DE98D0]();
}

uint64_t sub_1CA1F06DC()
{
  return MEMORY[0x1E0DE98E8]();
}

uint64_t sub_1CA1F06E8()
{
  return MEMORY[0x1E0DE98F8]();
}

uint64_t sub_1CA1F06F4()
{
  return MEMORY[0x1E0DE9908]();
}

uint64_t sub_1CA1F0700()
{
  return MEMORY[0x1E0DE9910]();
}

uint64_t sub_1CA1F070C()
{
  return MEMORY[0x1E0DE9918]();
}

uint64_t sub_1CA1F0718()
{
  return MEMORY[0x1E0DE9920]();
}

uint64_t sub_1CA1F0724()
{
  return MEMORY[0x1E0DE9928]();
}

uint64_t sub_1CA1F0730()
{
  return MEMORY[0x1E0DE9930]();
}

uint64_t sub_1CA1F073C()
{
  return MEMORY[0x1E0DE9938]();
}

uint64_t sub_1CA1F0748()
{
  return MEMORY[0x1E0DE9940]();
}

uint64_t sub_1CA1F0754()
{
  return MEMORY[0x1E0DE9948]();
}

uint64_t sub_1CA1F0760()
{
  return MEMORY[0x1E0DE9950]();
}

uint64_t sub_1CA1F076C()
{
  return MEMORY[0x1E0DE9958]();
}

uint64_t sub_1CA1F0778()
{
  return MEMORY[0x1E0DE9960]();
}

uint64_t sub_1CA1F0784()
{
  return MEMORY[0x1E0CADE58]();
}

uint64_t sub_1CA1F0790()
{
  return MEMORY[0x1E0CAE8B8]();
}

uint64_t sub_1CA1F079C()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1CA1F07A8()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1CA1F07B4()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1CA1F07C0()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t sub_1CA1F07CC()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1CA1F07D8()
{
  return MEMORY[0x1E0CAFB00]();
}

uint64_t sub_1CA1F07E4()
{
  return MEMORY[0x1E0CAFC18]();
}

uint64_t sub_1CA1F07F0()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1CA1F07FC()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1CA1F0808()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1CA1F0814()
{
  return MEMORY[0x1E0CB0140]();
}

uint64_t sub_1CA1F0820()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1CA1F082C()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1CA1F0838()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1CA1F0844()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1CA1F0850()
{
  return MEMORY[0x1E0CB12C0]();
}

uint64_t sub_1CA1F085C()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1CA1F0868()
{
  return MEMORY[0x1E0DEF4E8]();
}

uint64_t sub_1CA1F0874()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1CA1F0880()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1CA1F088C()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1CA1F0898()
{
  return MEMORY[0x1E0DE9D60]();
}

uint64_t sub_1CA1F08A4()
{
  return MEMORY[0x1E0DE9D70]();
}

uint64_t sub_1CA1F08B0()
{
  return MEMORY[0x1E0DF05B0]();
}

uint64_t sub_1CA1F08BC()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1CA1F08C8()
{
  return MEMORY[0x1E0CB17E8]();
}

uint64_t sub_1CA1F08D4()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1CA1F08E0()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1CA1F08EC()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1CA1F08F8()
{
  return MEMORY[0x1E0DE9EC0]();
}

uint64_t sub_1CA1F0904()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1CA1F0910()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t sub_1CA1F091C()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t sub_1CA1F0928()
{
  return MEMORY[0x1E0DEA108]();
}

uint64_t sub_1CA1F0934()
{
  return MEMORY[0x1E0DEA110]();
}

uint64_t sub_1CA1F0940()
{
  return MEMORY[0x1E0DEA118]();
}

uint64_t _sSF17KnowledgeGraphKitE23absoluteDifferenceBoundxvgZ_0()
{
  return MEMORY[0x1E0DEA188]();
}

uint64_t sub_1CA1F0958()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1CA1F0964()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1CA1F0970()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1CA1F097C()
{
  return MEMORY[0x1E0DEA3B8]();
}

uint64_t sub_1CA1F0988()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1CA1F0994()
{
  return MEMORY[0x1E0DEA3D0]();
}

uint64_t sub_1CA1F09A0()
{
  return MEMORY[0x1E0DEA3E0]();
}

uint64_t sub_1CA1F09AC()
{
  return MEMORY[0x1E0DEA3E8]();
}

uint64_t sub_1CA1F09B8()
{
  return MEMORY[0x1E0DEA3F0]();
}

uint64_t sub_1CA1F09C4()
{
  return MEMORY[0x1E0DEA468]();
}

uint64_t sub_1CA1F09D0()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1CA1F09DC()
{
  return MEMORY[0x1E0DEA578]();
}

uint64_t sub_1CA1F09E8()
{
  return MEMORY[0x1E0DEA588]();
}

uint64_t sub_1CA1F09F4()
{
  return MEMORY[0x1E0DEA5B8]();
}

uint64_t sub_1CA1F0A00()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1CA1F0A0C()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1CA1F0A18()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1CA1F0A24()
{
  return MEMORY[0x1E0DEA610]();
}

uint64_t sub_1CA1F0A30()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1CA1F0A3C()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1CA1F0A48()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1CA1F0A54()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_1CA1F0A60()
{
  return MEMORY[0x1E0DEAA08]();
}

uint64_t sub_1CA1F0A6C()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t sub_1CA1F0A78()
{
  return MEMORY[0x1E0DEAAA0]();
}

uint64_t sub_1CA1F0A84()
{
  return MEMORY[0x1E0DEAAB0]();
}

uint64_t sub_1CA1F0A90()
{
  return MEMORY[0x1E0DEAAB8]();
}

uint64_t sub_1CA1F0A9C()
{
  return MEMORY[0x1E0DEAAD8]();
}

uint64_t sub_1CA1F0AA8()
{
  return MEMORY[0x1E0DEAAF8]();
}

uint64_t sub_1CA1F0AB4()
{
  return MEMORY[0x1E0DEAB40]();
}

uint64_t sub_1CA1F0AC0()
{
  return MEMORY[0x1E0DEAB88]();
}

uint64_t sub_1CA1F0ACC()
{
  return MEMORY[0x1E0DEABA8]();
}

uint64_t sub_1CA1F0AD8()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1CA1F0AE4()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1CA1F0AF0()
{
  return MEMORY[0x1E0CB1AE0]();
}

uint64_t sub_1CA1F0AFC()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1CA1F0B08()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1CA1F0B14()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1CA1F0B20()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_1CA1F0B2C()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1CA1F0B38()
{
  return MEMORY[0x1E0DEADF0]();
}

uint64_t sub_1CA1F0B44()
{
  return MEMORY[0x1E0DEAE08]();
}

uint64_t sub_1CA1F0B50()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1CA1F0B5C()
{
  return MEMORY[0x1E0DEAE20]();
}

uint64_t sub_1CA1F0B68()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1CA1F0B74()
{
  return MEMORY[0x1E0DEAE30]();
}

uint64_t sub_1CA1F0B80()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_1CA1F0B8C()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1CA1F0B98()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t sub_1CA1F0BA4()
{
  return MEMORY[0x1E0DEAE78]();
}

uint64_t sub_1CA1F0BB0()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_1CA1F0BBC()
{
  return MEMORY[0x1E0DEAE88]();
}

uint64_t sub_1CA1F0BC8()
{
  return MEMORY[0x1E0DEAE90]();
}

uint64_t sub_1CA1F0BD4()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_1CA1F0BE0()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1CA1F0BEC()
{
  return MEMORY[0x1E0DEAEE0]();
}

uint64_t sub_1CA1F0BF8()
{
  return MEMORY[0x1E0DEAEF0]();
}

uint64_t sub_1CA1F0C04()
{
  return MEMORY[0x1E0DEAF00]();
}

uint64_t sub_1CA1F0C10()
{
  return MEMORY[0x1E0DEAF08]();
}

uint64_t sub_1CA1F0C1C()
{
  return MEMORY[0x1E0DEAF70]();
}

uint64_t sub_1CA1F0C28()
{
  return MEMORY[0x1E0DEAF78]();
}

uint64_t sub_1CA1F0C34()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1CA1F0C40()
{
  return MEMORY[0x1E0DF05E0]();
}

uint64_t sub_1CA1F0C4C()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1CA1F0C58()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1CA1F0C64()
{
  return MEMORY[0x1E0DF0860]();
}

uint64_t sub_1CA1F0C70()
{
  return MEMORY[0x1E0DF0890]();
}

uint64_t sub_1CA1F0C7C()
{
  return MEMORY[0x1E0DEB030]();
}

uint64_t sub_1CA1F0C88()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1CA1F0C94()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1CA1F0CA0()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1CA1F0CAC()
{
  return MEMORY[0x1E0DEB2A8]();
}

uint64_t sub_1CA1F0CB8()
{
  return MEMORY[0x1E0DEB2C8]();
}

uint64_t sub_1CA1F0CC4()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1CA1F0CD0()
{
  return MEMORY[0x1E0DEB388]();
}

uint64_t sub_1CA1F0CDC()
{
  return MEMORY[0x1E0DEB3B0]();
}

uint64_t sub_1CA1F0CE8()
{
  return MEMORY[0x1E0DEB498]();
}

uint64_t sub_1CA1F0CF4()
{
  return MEMORY[0x1E0DEB508]();
}

uint64_t sub_1CA1F0D00()
{
  return MEMORY[0x1E0DEB518]();
}

uint64_t sub_1CA1F0D0C()
{
  return MEMORY[0x1E0DEB520]();
}

uint64_t sub_1CA1F0D18()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1CA1F0D24()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_1CA1F0D30()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_1CA1F0D3C()
{
  return MEMORY[0x1E0DEB5E8]();
}

uint64_t sub_1CA1F0D48()
{
  return MEMORY[0x1E0DEB608]();
}

uint64_t sub_1CA1F0D54()
{
  return MEMORY[0x1E0DEB618]();
}

uint64_t sub_1CA1F0D60()
{
  return MEMORY[0x1E0DEB620]();
}

uint64_t sub_1CA1F0D6C()
{
  return MEMORY[0x1E0DEB628]();
}

uint64_t sub_1CA1F0D78()
{
  return MEMORY[0x1E0DEB630]();
}

uint64_t sub_1CA1F0D84()
{
  return MEMORY[0x1E0DEB648]();
}

uint64_t sub_1CA1F0D90()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t sub_1CA1F0D9C()
{
  return MEMORY[0x1E0DEB668]();
}

uint64_t sub_1CA1F0DA8()
{
  return MEMORY[0x1E0DEB698]();
}

uint64_t sub_1CA1F0DB4()
{
  return MEMORY[0x1E0DEB6A0]();
}

uint64_t sub_1CA1F0DC0()
{
  return MEMORY[0x1E0DEB6C0]();
}

uint64_t sub_1CA1F0DCC()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_1CA1F0DD8()
{
  return MEMORY[0x1E0DEB738]();
}

uint64_t sub_1CA1F0DE4()
{
  return MEMORY[0x1E0DEB848]();
}

uint64_t sub_1CA1F0DF0()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1CA1F0DFC()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1CA1F0E08()
{
  return MEMORY[0x1E0DEF800]();
}

uint64_t sub_1CA1F0E14()
{
  return MEMORY[0x1E0DEF808]();
}

uint64_t sub_1CA1F0E20()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1CA1F0E2C()
{
  return MEMORY[0x1E0DEF8C8]();
}

uint64_t sub_1CA1F0E38()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1CA1F0E44()
{
  return MEMORY[0x1E0DEF8F0]();
}

uint64_t sub_1CA1F0E50()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1CA1F0E5C()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1CA1F0E68()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1CA1F0E74()
{
  return MEMORY[0x1E0DEFCE8]();
}

uint64_t sub_1CA1F0E80()
{
  return MEMORY[0x1E0DEFCF0]();
}

uint64_t sub_1CA1F0E8C()
{
  return MEMORY[0x1E0CB2130]();
}

uint64_t sub_1CA1F0E98()
{
  return MEMORY[0x1E0DF22B8]();
}

uint64_t sub_1CA1F0EA4()
{
  return MEMORY[0x1E0DEB8D0]();
}

uint64_t sub_1CA1F0EB0()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1CA1F0EBC()
{
  return MEMORY[0x1E0DEB980]();
}

uint64_t sub_1CA1F0EC8()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1CA1F0ED4()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1CA1F0EE0()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1CA1F0EEC()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t sub_1CA1F0EF8()
{
  return MEMORY[0x1E0DEBE30]();
}

uint64_t sub_1CA1F0F04()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1CA1F0F10()
{
  return MEMORY[0x1E0DEBEB0]();
}

uint64_t sub_1CA1F0F1C()
{
  return MEMORY[0x1E0DEBF30]();
}

uint64_t sub_1CA1F0F28()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1CA1F0F34()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1CA1F0F40()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1CA1F0F4C()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1CA1F0F58()
{
  return MEMORY[0x1E0DEC0A8]();
}

uint64_t sub_1CA1F0F64()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1CA1F0F70()
{
  return MEMORY[0x1E0DEC0B8]();
}

uint64_t sub_1CA1F0F7C()
{
  return MEMORY[0x1E0DEC0C8]();
}

uint64_t sub_1CA1F0F88()
{
  return MEMORY[0x1E0DEC0D0]();
}

uint64_t sub_1CA1F0F94()
{
  return MEMORY[0x1E0DEC0D8]();
}

uint64_t sub_1CA1F0FA0()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1CA1F0FAC()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1CA1F0FB8()
{
  return MEMORY[0x1E0DEC100]();
}

uint64_t sub_1CA1F0FC4()
{
  return MEMORY[0x1E0DEC108]();
}

uint64_t sub_1CA1F0FD0()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1CA1F0FDC()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t sub_1CA1F0FE8()
{
  return MEMORY[0x1E0DEC120]();
}

uint64_t sub_1CA1F0FF4()
{
  return MEMORY[0x1E0DEC128]();
}

uint64_t sub_1CA1F1000()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1CA1F100C()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1CA1F1018()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1CA1F1024()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1CA1F1030()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1CA1F103C()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1CA1F1048()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1CA1F1054()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1CA1F1060()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1CA1F106C()
{
  return MEMORY[0x1E0DEC310]();
}

uint64_t sub_1CA1F1078()
{
  return MEMORY[0x1E0DEC390]();
}

uint64_t sub_1CA1F1084()
{
  return MEMORY[0x1E0DEC3D0]();
}

uint64_t sub_1CA1F1090()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_1CA1F109C()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1CA1F10A8()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1CA1F10B4()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1CA1F10C0()
{
  return MEMORY[0x1E0DEC5F8]();
}

uint64_t sub_1CA1F10CC()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1CA1F10D8()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1CA1F10E4()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_1CA1F10F0()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1CA1F10FC()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1CA1F1108()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1CA1F1114()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_1CA1F1120()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_1CA1F112C()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_1CA1F1138()
{
  return MEMORY[0x1E0DEC798]();
}

uint64_t sub_1CA1F1144()
{
  return MEMORY[0x1E0DEC7E8]();
}

uint64_t sub_1CA1F1150()
{
  return MEMORY[0x1E0DEC7F0]();
}

uint64_t sub_1CA1F115C()
{
  return MEMORY[0x1E0DEC7F8]();
}

uint64_t sub_1CA1F1168()
{
  return MEMORY[0x1E0DEC808]();
}

uint64_t sub_1CA1F1174()
{
  return MEMORY[0x1E0DEC8D8]();
}

uint64_t sub_1CA1F1180()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1CA1F118C()
{
  return MEMORY[0x1E0DEC8F8]();
}

uint64_t sub_1CA1F1198()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_1CA1F11A4()
{
  return MEMORY[0x1E0DECB08]();
}

uint64_t sub_1CA1F11B0()
{
  return MEMORY[0x1E0DECB20]();
}

uint64_t sub_1CA1F11BC()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1CA1F11C8()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1CA1F11D4()
{
  return MEMORY[0x1E0DECC10]();
}

uint64_t sub_1CA1F11E0()
{
  return MEMORY[0x1E0DECC18]();
}

uint64_t sub_1CA1F11EC()
{
  return MEMORY[0x1E0DECC20]();
}

uint64_t sub_1CA1F11F8()
{
  return MEMORY[0x1E0DECC30]();
}

uint64_t sub_1CA1F1204()
{
  return MEMORY[0x1E0DECC38]();
}

uint64_t sub_1CA1F1210()
{
  return MEMORY[0x1E0DECC40]();
}

uint64_t sub_1CA1F121C()
{
  return MEMORY[0x1E0DECC48]();
}

uint64_t sub_1CA1F1228()
{
  return MEMORY[0x1E0DECC58]();
}

uint64_t sub_1CA1F1234()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1CA1F1240()
{
  return MEMORY[0x1E0DECD20]();
}

uint64_t sub_1CA1F124C()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1CA1F1258()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1CA1F1264()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1CA1F1270()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1CA1F127C()
{
  return MEMORY[0x1E0DECE28]();
}

uint64_t sub_1CA1F1288()
{
  return MEMORY[0x1E0DECF18]();
}

uint64_t sub_1CA1F1294()
{
  return MEMORY[0x1E0DED1A0]();
}

uint64_t sub_1CA1F12A0()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1CA1F12AC()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1CA1F12B8()
{
  return MEMORY[0x1E0DED548]();
}

uint64_t sub_1CA1F12C4()
{
  return MEMORY[0x1E0DED550]();
}

uint64_t sub_1CA1F12D0()
{
  return MEMORY[0x1E0DED5C0]();
}

uint64_t sub_1CA1F12DC()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1CA1F12E8()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1CA1F12F4()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_1CA1F1300()
{
  return MEMORY[0x1E0DED9C0]();
}

uint64_t sub_1CA1F130C()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_1CA1F1318()
{
  return MEMORY[0x1E0DED9E8]();
}

uint64_t sub_1CA1F1324()
{
  return MEMORY[0x1E0DEDA00]();
}

uint64_t sub_1CA1F1330()
{
  return MEMORY[0x1E0DEDA10]();
}

uint64_t sub_1CA1F133C()
{
  return MEMORY[0x1E0DEDA20]();
}

uint64_t sub_1CA1F1348()
{
  return MEMORY[0x1E0DEDA30]();
}

uint64_t sub_1CA1F1354()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1CA1F1360()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1CA1F136C()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1CA1F1378()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1CA1F1384()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1CA1F1390()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1CA1F139C()
{
  return MEMORY[0x1E0DEDDE0]();
}

uint64_t sub_1CA1F13A8()
{
  return MEMORY[0x1E0DEDE00]();
}

uint64_t sub_1CA1F13B4()
{
  return MEMORY[0x1E0DEDE08]();
}

uint64_t sub_1CA1F13C0()
{
  return MEMORY[0x1E0DEDE10]();
}

uint64_t sub_1CA1F13CC()
{
  return MEMORY[0x1E0DEDE20]();
}

uint64_t sub_1CA1F13D8()
{
  return MEMORY[0x1E0DEDED8]();
}

uint64_t sub_1CA1F13E4()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1CA1F13F0()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1CA1F13FC()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1CA1F1408()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1CA1F1414()
{
  return MEMORY[0x1E0DEDF20]();
}

uint64_t sub_1CA1F1420()
{
  return MEMORY[0x1E0DEDF28]();
}

uint64_t sub_1CA1F142C()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_1CA1F1438()
{
  return MEMORY[0x1E0DEDF40]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1E0C989D0](number);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

void CFStringFold(CFMutableStringRef theString, CFStringCompareFlags theFlags, CFLocaleRef theLocale)
{
  MEMORY[0x1E0C99078](theString, theFlags, theLocale);
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
  MEMORY[0x1E0C991D8](theString, theForm);
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

void NSEndMapTableEnumeration(NSMapEnumerator *enumerator)
{
  MEMORY[0x1E0CB29A0](enumerator);
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return (NSMapEnumerator *)MEMORY[0x1E0CB29B0](retstr, table);
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return MEMORY[0x1E0CB2F88](enumerator, key, value);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
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

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x1E0DE44B0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1E0DE4698]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1E0DE46A0]();
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
  return MEMORY[0x1E0DE46E8]();
}

{
  return MEMORY[0x1E0DE4700]();
}

{
  return MEMORY[0x1E0DE4708]();
}

{
  return MEMORY[0x1E0DE4730]();
}

{
  return MEMORY[0x1E0DE4738]();
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

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

std::__fs::filesystem::path *__cdecl std::__fs::filesystem::__temp_directory_path(std::__fs::filesystem::path *__return_ptr retstr, std::error_code *__ec)
{
  return (std::__fs::filesystem::path *)MEMORY[0x1E0DE4A08](retstr, __ec);
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

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E83DDB30(__p);
}

uint64_t operator delete()
{
  return off_1E83DDB38();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E83DDB40(__sz);
}

uint64_t operator new()
{
  return off_1E83DDB48();
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

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return (char *)MEMORY[0x1E0DE5090](lpmangled, lpout, lpoutlen, lpstatus);
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

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x1E0DE7960]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x1E0DE7970]();
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

uint64_t _sqlite3_db_copy()
{
  return MEMORY[0x1E0DE8520]();
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x1E0DEE9F8]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x1E0C81500](__x);
  return result;
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1E0C816B8](a1, *(_QWORD *)&a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t cblas_dasum_NEWLAPACK()
{
  return MEMORY[0x1E0C8BB10]();
}

uint64_t cblas_daxpy_NEWLAPACK()
{
  return MEMORY[0x1E0C8BB20]();
}

uint64_t cblas_dcopy_NEWLAPACK()
{
  return MEMORY[0x1E0C8BB30]();
}

uint64_t cblas_dgemm_NEWLAPACK()
{
  return MEMORY[0x1E0C8BB50]();
}

uint64_t cblas_dnrm2_NEWLAPACK()
{
  return MEMORY[0x1E0C8BB68]();
}

uint64_t cblas_dscal_NEWLAPACK()
{
  return MEMORY[0x1E0C8BB88]();
}

uint64_t cblas_scopy_NEWLAPACK()
{
  return MEMORY[0x1E0C8BBD0]();
}

uint64_t cblas_sgemm_NEWLAPACK()
{
  return MEMORY[0x1E0C8BC08]();
}

uint64_t cblas_snrm2_NEWLAPACK()
{
  return MEMORY[0x1E0C8BC50]();
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t dgeev_NEWLAPACK()
{
  return MEMORY[0x1E0C8BCA8]();
}

uint64_t dgesdd_NEWLAPACK()
{
  return MEMORY[0x1E0C8BCE8]();
}

uint64_t dgetrf_NEWLAPACK()
{
  return MEMORY[0x1E0C8BD18]();
}

uint64_t dgetri_NEWLAPACK()
{
  return MEMORY[0x1E0C8BD28]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E20](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
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

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1E0C82EF8]();
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1E0C83028](a1, a2);
}

long double erfc(long double __x)
{
  long double result;

  MEMORY[0x1E0C831F8](__x);
  return result;
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

int flock(int a1, int a2)
{
  return MEMORY[0x1E0C83400](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fsync(int a1)
{
  return MEMORY[0x1E0C83578](*(_QWORD *)&a1);
}

kern_return_t host_info(host_t host, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1E0C838B8](*(_QWORD *)&host, *(_QWORD *)&flavor, host_info_out, host_info_outCnt);
}

kern_return_t host_statistics(host_t host_priv, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1E0C838D8](*(_QWORD *)&host_priv, *(_QWORD *)&flavor, host_info_out, host_info_outCnt);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x1E0C83C00](a1);
  return result;
}

void mach_error(const char *str, mach_error_t error_value)
{
  MEMORY[0x1E0C83C78](str, *(_QWORD *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1E0C83C90]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
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

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
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

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C84BC0](a1, a2);
  return result;
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

sparse_status sparse_commit(void *A)
{
  return MEMORY[0x1E0C8BE20](A);
}

sparse_status sparse_extract_sparse_column_double(sparse_matrix_double A, sparse_index column, sparse_index row_start, sparse_index *row_end, sparse_dimension nz, double *val, sparse_index *indx)
{
  return MEMORY[0x1E0C8BE28](A, column, row_start, row_end, nz, val, indx);
}

sparse_status sparse_extract_sparse_row_double(sparse_matrix_double A, sparse_index row, sparse_index column_start, sparse_index *column_end, sparse_dimension nz, double *val, sparse_index *jndx)
{
  return MEMORY[0x1E0C8BE30](A, row, column_start, column_end, nz, val, jndx);
}

sparse_status sparse_extract_sparse_row_float(sparse_matrix_float A, sparse_index row, sparse_index column_start, sparse_index *column_end, sparse_dimension nz, float *val, sparse_index *jndx)
{
  return MEMORY[0x1E0C8BE38](A, row, column_start, column_end, nz, val, jndx);
}

uint64_t sparse_get_matrix_nonzero_count(void *A)
{
  return MEMORY[0x1E0C8BE40](A);
}

uint64_t sparse_get_matrix_nonzero_count_for_column(void *A, sparse_index j)
{
  return MEMORY[0x1E0C8BE48](A, j);
}

uint64_t sparse_get_matrix_nonzero_count_for_row(void *A, sparse_index i)
{
  return MEMORY[0x1E0C8BE50](A, i);
}

double sparse_inner_product_sparse_double(sparse_dimension nzx, sparse_dimension nzy, const double *x, const sparse_index *indx, const double *y, const sparse_index *indy)
{
  double result;

  MEMORY[0x1E0C8BE68](nzx, nzy, x, indx, y, indy);
  return result;
}

float sparse_inner_product_sparse_float(sparse_dimension nzx, sparse_dimension nzy, const float *x, const sparse_index *indx, const float *y, const sparse_index *indy)
{
  float result;

  MEMORY[0x1E0C8BE70](nzx, nzy, x, indx, y, indy);
  return result;
}

sparse_status sparse_insert_col_double(sparse_matrix_double A, sparse_index j, sparse_dimension nz, const double *val, const sparse_index *indx)
{
  return MEMORY[0x1E0C8BE78](A, j, nz, val, indx);
}

sparse_status sparse_insert_entry_double(sparse_matrix_double A, double val, sparse_index i, sparse_index j)
{
  return MEMORY[0x1E0C8BE88](A, i, j, val);
}

sparse_status sparse_insert_entry_float(sparse_matrix_float A, float val, sparse_index i, sparse_index j)
{
  return MEMORY[0x1E0C8BE90](A, i, j, val);
}

sparse_status sparse_insert_row_double(sparse_matrix_double A, sparse_index i, sparse_dimension nz, const double *val, const sparse_index *jndx)
{
  return MEMORY[0x1E0C8BE98](A, i, nz, val, jndx);
}

sparse_status sparse_insert_row_float(sparse_matrix_float A, sparse_index i, sparse_dimension nz, const float *val, const sparse_index *jndx)
{
  return MEMORY[0x1E0C8BEA0](A, i, nz, val, jndx);
}

sparse_matrix_double sparse_matrix_create_double(sparse_dimension M, sparse_dimension N)
{
  return (sparse_matrix_double)MEMORY[0x1E0C8BEA8](M, N);
}

sparse_matrix_float sparse_matrix_create_float(sparse_dimension M, sparse_dimension N)
{
  return (sparse_matrix_float)MEMORY[0x1E0C8BEB0](M, N);
}

sparse_status sparse_matrix_destroy(void *A)
{
  return MEMORY[0x1E0C8BEB8](A);
}

sparse_status sparse_matrix_product_dense_float(CBLAS_ORDER order, CBLAS_TRANSPOSE transa, sparse_dimension n, float alpha, sparse_matrix_float A, const float *B, sparse_dimension ldb, float *C, sparse_dimension ldc)
{
  return MEMORY[0x1E0C8BEC0](*(_QWORD *)&order, *(_QWORD *)&transa, n, A, B, ldb, C, ldc, alpha);
}

uint64_t sparse_pack_vector_float(sparse_dimension N, sparse_dimension nz, const float *x, sparse_stride incx, float *y, sparse_index *indy)
{
  return MEMORY[0x1E0C8BED8](N, nz, x, incx, y, indy);
}

sparse_status sparse_set_matrix_property(void *A, sparse_matrix_property pname)
{
  return MEMORY[0x1E0C8BEE0](A, *(_QWORD *)&pname);
}

void sparse_unpack_vector_double(sparse_dimension N, sparse_dimension nz, BOOL zero, const double *x, const sparse_index *indx, double *y, sparse_stride incy)
{
  MEMORY[0x1E0C8BEE8](N, nz, zero, x, indx, y, incy);
}

void sparse_unpack_vector_float(sparse_dimension N, sparse_dimension nz, BOOL zero, const float *x, const sparse_index *indx, float *y, sparse_stride incy)
{
  MEMORY[0x1E0C8BEF0](N, nz, zero, x, indx, y, incy);
}

void *__cdecl sqlite3_aggregate_context(sqlite3_context *a1, int nBytes)
{
  return (void *)MEMORY[0x1E0DE8550](a1, *(_QWORD *)&nBytes);
}

int sqlite3_backup_finish(sqlite3_backup *p)
{
  return MEMORY[0x1E0DE8558](p);
}

sqlite3_backup *__cdecl sqlite3_backup_init(sqlite3 *pDest, const char *zDestName, sqlite3 *pSource, const char *zSourceName)
{
  return (sqlite3_backup *)MEMORY[0x1E0DE8560](pDest, zDestName, pSource, zSourceName);
}

int sqlite3_backup_step(sqlite3_backup *p, int nPage)
{
  return MEMORY[0x1E0DE8578](p, *(_QWORD *)&nPage);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1E0DE8598](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1E0DE85A8](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1E0DE85B0](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_pointer(sqlite3_stmt *a1, int a2, void *a3, const char *a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D0](a1, *(_QWORD *)&a2, a3, a4, a5);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_busy_handler(sqlite3 *a1, int (__cdecl *a2)(void *, int), void *a3)
{
  return MEMORY[0x1E0DE8630](a1, a2, a3);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE8678](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE86C8](a1, *(_QWORD *)&iCol);
}

int sqlite3_create_collation(sqlite3 *a1, const char *zName, int eTextRep, void *pArg, int (__cdecl *xCompare)(void *, int, const void *, int, const void *))
{
  return MEMORY[0x1E0DE86F8](a1, zName, *(_QWORD *)&eTextRep, pArg, xCompare);
}

int sqlite3_create_function(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *))
{
  return MEMORY[0x1E0DE8708](db, zFunctionName, *(_QWORD *)&nArg, *(_QWORD *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_create_module(sqlite3 *db, const char *zName, const sqlite3_module *p, void *pClientData)
{
  return MEMORY[0x1E0DE8718](db, zName, p, pClientData);
}

int sqlite3_db_release_memory(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8760](a1);
}

int sqlite3_db_status(sqlite3 *a1, int op, int *pCur, int *pHiwtr, int resetFlg)
{
  return MEMORY[0x1E0DE8768](a1, *(_QWORD *)&op, pCur, pHiwtr, *(_QWORD *)&resetFlg);
}

int sqlite3_declare_vtab(sqlite3 *a1, const char *zSQL)
{
  return MEMORY[0x1E0DE8770](a1, zSQL);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

char *__cdecl sqlite3_expanded_sql(sqlite3_stmt *pStmt)
{
  return (char *)MEMORY[0x1E0DE87A8](pStmt);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x1E0DE87B8](a1, *(_QWORD *)&onoff);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1E0DE87C0](a1, zDbName, *(_QWORD *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x1E0DE87D0](a1);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8820](a1);
}

void *__cdecl sqlite3_malloc(int a1)
{
  return (void *)MEMORY[0x1E0DE8838](*(_QWORD *)&a1);
}

void *__cdecl sqlite3_malloc64(sqlite3_uint64 a1)
{
  return (void *)MEMORY[0x1E0DE8840](a1);
}

char *sqlite3_mprintf(const char *a1, ...)
{
  return (char *)MEMORY[0x1E0DE8848](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE88B0](pStmt);
}

void sqlite3_result_blob(sqlite3_context *a1, const void *a2, int a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x1E0DE88B8](a1, a2, *(_QWORD *)&a3, a4);
}

void sqlite3_result_double(sqlite3_context *a1, double a2)
{
  MEMORY[0x1E0DE88C8](a1, a2);
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
  MEMORY[0x1E0DE88F0](a1, *(_QWORD *)&a2);
}

void sqlite3_result_int64(sqlite3_context *a1, sqlite3_int64 a2)
{
  MEMORY[0x1E0DE88F8](a1, a2);
}

void sqlite3_result_pointer(sqlite3_context *a1, void *a2, const char *a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x1E0DE8908](a1, a2, a3, a4);
}

void sqlite3_result_text(sqlite3_context *a1, const char *a2, int a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x1E0DE8910](a1, a2, *(_QWORD *)&a3, a4);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int sqlite3_stricmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0DE89C8](a1, a2);
}

int sqlite3_table_column_metadata(sqlite3 *db, const char *zDbName, const char *zTableName, const char *zColumnName, const char **pzDataType, const char **pzCollSeq, int *pNotNull, int *pPrimaryKey, int *pAutoinc)
{
  return MEMORY[0x1E0DE89D8](db, zDbName, zTableName, zColumnName, pzDataType, pzCollSeq, pNotNull, pPrimaryKey);
}

int sqlite3_trace_v2(sqlite3 *a1, unsigned int uMask, int (__cdecl *xCallback)(unsigned int, void *, void *, void *), void *pCtx)
{
  return MEMORY[0x1E0DE89F0](a1, *(_QWORD *)&uMask, xCallback, pCtx);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x1E0DE8A18](a1);
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x1E0DE8A50](a1);
}

void *__cdecl sqlite3_value_pointer(sqlite3_value *a1, const char *a2)
{
  return (void *)MEMORY[0x1E0DE8A58](a1, a2);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE8A60](a1);
}

int sqlite3_wal_autocheckpoint(sqlite3 *db, int N)
{
  return MEMORY[0x1E0DE8A90](db, *(_QWORD *)&N);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return MEMORY[0x1E0DE8A98](db, zDb, *(_QWORD *)&eMode, pnLog, pnCkpt);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1E0DEEBB0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1E0DEEE90]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C0D0](__A, __IA, __B, __IB, __C, __N);
}

void vDSP_dotprD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C0E0](__A, __IA, __B, __IB, __C, __N);
}

void vDSP_maxviD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length *__I, vDSP_Length __N)
{
  MEMORY[0x1E0C8C1D0](__A, __IA, __C, __I, __N);
}

void vDSP_meanvD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C1F0](__A, __IA, __C, __N);
}

void vDSP_minviD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length *__I, vDSP_Length __N)
{
  MEMORY[0x1E0C8C240](__A, __IA, __C, __I, __N);
}

void vDSP_mtransD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N)
{
  MEMORY[0x1E0C8C270](__A, __IA, __C, __IC, __M, __N);
}

void vDSP_normalize(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, float *__Mean, float *__StandardDeviation, vDSP_Length __N)
{
  MEMORY[0x1E0C8C280](__A, __IA, __C, __IC, __Mean, __StandardDeviation, __N);
}

void vDSP_normalizeD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, double *__Mean, double *__StandardDeviation, vDSP_Length __N)
{
  MEMORY[0x1E0C8C288](__A, __IA, __C, __IC, __Mean, __StandardDeviation, __N);
}

void vDSP_svdivD(const double *__A, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C2E0](__A, __B, __IB, __C, __IC, __N);
}

void vDSP_sveD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C2F8](__A, __I, __C, __N);
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C368](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vdivD(const double *__B, vDSP_Stride __IB, const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C450](__B, __IB, __A, __IA, __C, __IC, __N);
}

void vDSP_vmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C740](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vmulD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C748](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vnegD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C770](__A, __IA, __C, __IC, __N);
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C800](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsaddD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C810](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsdiv(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C860](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsdivD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C868](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsmsbD(const double *__A, vDSP_Stride __IA, const double *__B, const double *__C, vDSP_Stride __IC, double *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x1E0C8C8B8](__A, __IA, __B, __C, __IC, __D, __ID, __N);
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C8E0](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsmulD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C8E8](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsqD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C928](__A, __IA, __C, __IC, __N);
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C940](__B, __IB, __A, __IA, __C, __IC, __N);
}

void vvfabs(double *a1, const double *a2, const int *a3)
{
  MEMORY[0x1E0C8D9F0](a1, a2, a3);
}

void vvnint(double *a1, const double *a2, const int *a3)
{
  MEMORY[0x1E0C8DAA8](a1, a2, a3);
}

void vvpows(double *a1, const double *a2, const double *a3, const int *a4)
{
  MEMORY[0x1E0C8DAD0](a1, a2, a3, a4);
}

void vvpowsf(float *a1, const float *a2, const float *a3, const int *a4)
{
  MEMORY[0x1E0C8DAE0](a1, a2, a3, a4);
}

void vvsqrt(double *a1, const double *a2, const int *a3)
{
  MEMORY[0x1E0C8DB78](a1, a2, a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

