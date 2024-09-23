@implementation ML3DatabaseBlob

- (ML3DatabaseBlob)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-init is unsupported. Use -initWithSQLiteHandle: instead."));

  return 0;
}

- (ML3DatabaseBlob)initWithSQLiteHandle:(sqlite3_blob *)a3
{
  ML3DatabaseBlob *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ML3DatabaseBlob;
  result = -[ML3DatabaseBlob init](&v5, sel_init);
  if (result)
    result->_sqliteHandle = a3;
  return result;
}

- (void)dealloc
{
  sqlite3_blob *sqliteHandle;
  objc_super v4;

  sqliteHandle = self->_sqliteHandle;
  if (sqliteHandle)
    sqlite3_blob_close(sqliteHandle);
  v4.receiver = self;
  v4.super_class = (Class)ML3DatabaseBlob;
  -[ML3DatabaseBlob dealloc](&v4, sel_dealloc);
}

- (unint64_t)length
{
  unint64_t result;

  result = (unint64_t)self->_sqliteHandle;
  if (result)
    return sqlite3_blob_bytes((sqlite3_blob *)result);
  return result;
}

- (int)readData:(id)a3 numberOfBytes:(unint64_t)a4 offset:(unint64_t)a5
{
  int v5;
  id v8;
  sqlite3_blob *sqliteHandle;
  id v10;
  void *v11;

  v5 = a5;
  v8 = a3;
  objc_msgSend(v8, "setLength:", a4);
  sqliteHandle = self->_sqliteHandle;
  v10 = objc_retainAutorelease(v8);
  v11 = (void *)objc_msgSend(v10, "mutableBytes");

  return sqlite3_blob_read(sqliteHandle, v11, a4, v5);
}

- (int)writeData:(id)a3 numberOfBytes:(unint64_t)a4 offset:(unint64_t)a5
{
  return sqlite3_blob_write(self->_sqliteHandle, (const void *)objc_msgSend(objc_retainAutorelease(a3), "bytes"), a4, a5);
}

- (id)data
{
  unint64_t v3;
  void *v4;
  int v5;
  id v6;

  v3 = -[ML3DatabaseBlob length](self, "length");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v3);
  v5 = -[ML3DatabaseBlob readData:numberOfBytes:offset:](self, "readData:numberOfBytes:offset:", v4, v3, 0);
  v6 = 0;
  if (!v5)
    v6 = v4;

  return v6;
}

@end
