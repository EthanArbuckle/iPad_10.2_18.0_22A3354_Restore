@implementation GEOSQLiteVirtualTable

- (GEOSQLiteVirtualTable)init
{
  GEOSQLiteVirtualTable *result;

  result = (GEOSQLiteVirtualTable *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOSQLiteVirtualTable)initWithName:(id)a3
{
  id v4;
  GEOSQLiteVirtualTable *v5;
  uint64_t v6;
  NSString *name;
  GEOSQLiteVirtualTable *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOSQLiteVirtualTable;
  v5 = -[GEOSQLiteVirtualTable init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (sqlite3_module)module
{
  return (sqlite3_module *)&__GEOSQLiteVirtualTableModule;
}

- (NSString)columnDefinitions
{
  return (NSString *)&stru_1E1C241D0;
}

- (unint64_t)rowCount
{
  return 0;
}

- (void)fetchValueForContext:(sqlite3_context *)a3 row:(unint64_t)a4 column:(unint64_t)a5
{
  sqlite3_result_error(a3, "Not implemented", 1);
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
