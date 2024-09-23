@implementation WKWebExtensionSQLiteStatement

uint64_t __41___WKWebExtensionSQLiteStatement_dealloc__block_invoke(uint64_t a1)
{
  return sqlite3_finalize(*(sqlite3_stmt **)(a1 + 32));
}

@end
