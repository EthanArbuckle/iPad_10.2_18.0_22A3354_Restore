@implementation MBSQLitePathExtensions

uint64_t __MBSQLitePathExtensions_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("db"), CFSTR("sqlite"), CFSTR("sqlite3"), CFSTR("sqlitedb"), 0);
  MBSQLitePathExtensions_set = result;
  return result;
}

@end
