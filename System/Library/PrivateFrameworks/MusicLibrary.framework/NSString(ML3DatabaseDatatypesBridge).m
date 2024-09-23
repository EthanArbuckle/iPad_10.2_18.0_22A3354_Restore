@implementation NSString(ML3DatabaseDatatypesBridge)

- (uint64_t)ml_bindToSQLiteStatement:()ML3DatabaseDatatypesBridge atPosition:
{
  CFStringEncoding FastestEncoding;
  const char *CStringPtr;
  const char *v9;
  sqlite3_stmt *v10;
  int v11;
  uint64_t v12;
  const UniChar *CharactersPtr;
  const UniChar *v14;
  int v15;
  uint64_t v17;

  FastestEncoding = CFStringGetFastestEncoding(a1);
  if (FastestEncoding == 256)
  {
    CharactersPtr = CFStringGetCharactersPtr(a1);
    if (CharactersPtr)
    {
      v14 = CharactersPtr;
      v15 = 2 * CFStringGetLength(a1);
      return sqlite3_bind_text16(a3, a4, v14, v15, 0);
    }
    goto LABEL_7;
  }
  if (FastestEncoding != 134217984 || (CStringPtr = CFStringGetCStringPtr(a1, 0x8000100u)) == 0)
  {
LABEL_7:
    v17 = -[__CFString UTF8String](objc_retainAutorelease(a1), "UTF8String");
    if (v17)
      v9 = (const char *)v17;
    else
      v9 = "";
    v10 = a3;
    v11 = a4;
    v12 = -1;
    return sqlite3_bind_text(v10, v11, v9, -1, (void (__cdecl *)(void *))v12);
  }
  v9 = CStringPtr;
  v10 = a3;
  v11 = a4;
  v12 = 0;
  return sqlite3_bind_text(v10, v11, v9, -1, (void (__cdecl *)(void *))v12);
}

- (uint64_t)ml_stringValueForSQL
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@'"), a1);
}

@end
