id intToBitString(unint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    v5 = 0;
    do
    {
      objc_msgSend(&unk_250C57A28, "objectAtIndex:", ((1 << v5) & a1) != 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "insertString:atIndex:", v6, 0);

      ++v5;
    }
    while (a2 != v5);
  }
  return v4;
}

id bitStringToInt(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v1 = a1;
  if ((unint64_t)objc_msgSend(v1, "length") <= 0x3F)
  {
    v3 = 0;
    if (!objc_msgSend(v1, "length"))
    {
LABEL_7:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v3);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v4 = 0;
    while (1)
    {
      objc_msgSend(v1, "substringWithRange:", v4, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(&unk_250C57A40, "indexOfObject:", v5);

      if (v6 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v3 = v6 + 2 * v3;
      if (++v4 >= (unint64_t)objc_msgSend(v1, "length"))
        goto LABEL_7;
    }
  }
  v2 = 0;
LABEL_8:

  return v2;
}

void sub_23B413060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id getColumnName(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;

  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a1;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("SELECT %@ FROM PRAGMA_TABLE_XINFO('%@') WHERE type == '%@'"), CFSTR("name"), a2, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v8, "runQuery:error:", v9, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v16;
  if (v10)
  {
    objc_msgSend(v10, "next");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "objectForKey:", CFSTR("name"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (a4)
    {
      +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v11, CFSTR("Cannot check query result"));
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

  }
  else if (a4)
  {
    +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v11, CFSTR("Cannot query database"));
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

id getColumnMaxValue(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;

  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a1;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("SELECT MAX(%@) AS %@ FROM '%@'"), a3, CFSTR("maxColumn"), a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v8, "runQuery:error:", v9, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v16;
  if (v10)
  {
    objc_msgSend(v10, "next");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "objectForKey:", CFSTR("maxColumn"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (a4)
    {
      +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v11, CFSTR("Cannot check query result"));
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

  }
  else if (a4)
  {
    +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v11, CFSTR("Cannot query database"));
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

int64_t FedStatsDataTypeFromString(uint64_t a1)
{
  return +[FedStatsDataTypeFactory dataTypeFromString:](FedStatsDataTypeFactory, "dataTypeFromString:", a1);
}

id NSStringFromFedStatsDataType(uint64_t a1)
{
  return +[FedStatsDataTypeFactory stringFromDataType:](FedStatsDataTypeFactory, "stringFromDataType:", a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

_BYTE *OUTLINED_FUNCTION_2(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
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

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x24BEDE018](a1);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE038](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x24BEDE048](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE050](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x24BEDE060](a1, *(_QWORD *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE068](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE078](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x24BEDE108](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x24BEDE110](*(_QWORD *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x24BEDE118](a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x24BEDE1C0](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
}

