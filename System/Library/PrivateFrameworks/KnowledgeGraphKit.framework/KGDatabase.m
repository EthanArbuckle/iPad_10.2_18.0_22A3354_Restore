@implementation KGDatabase

- (KGDatabase)initWithURL:(id)a3
{
  id v5;
  KGDatabase *v6;
  KGDatabase *v7;
  KGDatabaseNameCache *v8;
  KGDatabaseNameCache *nameCache;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KGDatabase;
  v6 = -[KGDatabase init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = objc_alloc_init(KGDatabaseNameCache);
    nameCache = v7->_nameCache;
    v7->_nameCache = v8;

    v7->_databaseStatus = 1;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v2;

  if (self->_database)
    __assert_rtn("-[KGDatabase dealloc]", "KGDatabase.mm", 449, "_database == NULL");
  v2.receiver = self;
  v2.super_class = (Class)KGDatabase;
  -[KGDatabase dealloc](&v2, sel_dealloc);
}

- (BOOL)noFatalError
{
  return self->_databaseStatus == 1;
}

- (void)setFatalError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BYTE __p[12];
  char v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  self->_databaseStatus = 0;
  if (!*((_BYTE *)self->_database + 32))
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    degas::Database::setDatabaseFatalProblem((uint64_t)self->_database, (uint64_t *)__p);
    if (v8 < 0)
      operator delete(*(void **)__p);
  }
  KGLoggingConnection();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__p = 138412290;
    *(_QWORD *)&__p[4] = v5;
    _os_log_error_impl(&dword_1CA0A5000, v6, OS_LOG_TYPE_ERROR, "fatal error detected: %@", __p, 0xCu);
  }

}

- (id)openModeDescription:(unint64_t)a3
{
  int v3;
  id v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    v6 = CFSTR("read-only");
  }
  else
  {
    if ((v3 & 2) == 0)
      goto LABEL_6;
    v6 = CFSTR("read-write");
  }
  objc_msgSend(v4, "appendString:", v6);
LABEL_6:
  if ((v3 & 4) != 0)
    objc_msgSend(v5, "appendString:", CFSTR(" create"));
  if ((v3 & 0x40) != 0)
  {
    v7 = CFSTR(" protection class A");
  }
  else if ((v3 & 0x20) != 0)
  {
    v7 = CFSTR(" protection class B");
  }
  else
  {
    if ((v3 & 0x10) == 0)
      goto LABEL_15;
    v7 = CFSTR(" protection class C");
  }
  objc_msgSend(v5, "appendString:", v7);
LABEL_15:
  if ((v3 & 0x80) != 0)
    objc_msgSend(v5, "appendString:", CFSTR(" (track changes)"));
  if ((v3 & 0x10000) != 0)
    objc_msgSend(v5, "appendString:", CFSTR(" (test mode - should fail)"));
  return v5;
}

- (BOOL)openWithMode:(unint64_t)a3 error:(id *)a4
{
  degas::Database *v7;
  int v8;
  KGGraphLockFile *lockFile;
  KGGraphLockFile *v10;
  KGGraphLockFile *v11;
  void *v12;
  int Only;
  int v14;
  uint64_t v15;
  void **database;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  BOOL v20;
  NSURL *v21;
  void *v22;
  NSURL *v24;
  NSURL *url;
  void *__p[2];
  char v27;
  uint8_t buf[4];
  NSURL *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = (degas::Database *)operator new();
  degas::Database::Database(v7);
  self->_database = v7;
  if ((a3 & 0x10) != 0)
  {
    v8 = 2;
  }
  else if ((a3 & 0x20) != 0)
  {
    v8 = 1;
  }
  else
  {
    if ((a3 & 0x40) == 0)
      goto LABEL_8;
    v8 = 0;
  }
  degas::Database::setDataProtectionClass((uint64_t)v7, v8);
LABEL_8:
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)-[NSURL fileSystemRepresentation](self->_url, "fileSystemRepresentation"));
  if ((a3 & 0x80) == 0)
  {
    if ((a3 & 0x10000) == 0)
      goto LABEL_10;
LABEL_18:
    *((_WORD *)self->_database + 678) |= 8u;
    if ((a3 & 1) == 0)
      goto LABEL_11;
LABEL_19:
    Only = degas::Database::openReadOnly((std::string::size_type)self->_database, (std::string::size_type)__p);
    goto LABEL_20;
  }
  *((_WORD *)self->_database + 678) |= 0x10u;
  if ((a3 & 0x10000) != 0)
    goto LABEL_18;
LABEL_10:
  if ((a3 & 1) != 0)
    goto LABEL_19;
LABEL_11:
  lockFile = self->_lockFile;
  if (!lockFile)
  {
    v10 = -[KGGraphLockFile initWithDatabaseURL:]([KGGraphLockFile alloc], "initWithDatabaseURL:", self->_url);
    v11 = self->_lockFile;
    self->_lockFile = v10;

    lockFile = self->_lockFile;
  }
  if (-[KGGraphLockFile isLocked](lockFile, "isLocked") || !-[KGGraphLockFile lock](self->_lockFile, "lock"))
  {
    database = (void **)self->_database;
    if (database)
    {
      degas::Database::~Database(database);
      MEMORY[0x1CAA4ADC8]();
    }
    self->_database = 0;
    kg_errorWithCode(5009);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a4)
      *a4 = objc_retainAutorelease(v17);
    KGLoggingConnection();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      url = self->_url;
      *(_DWORD *)buf = 138412290;
      v29 = url;
      _os_log_error_impl(&dword_1CA0A5000, v19, OS_LOG_TYPE_ERROR, "failed to open graph database %@, locked by another process", buf, 0xCu);
    }

    goto LABEL_37;
  }
  -[KGDatabaseNameCache setWritable](self->_nameCache, "setWritable");
  v12 = self->_database;
  if ((a3 & 4) != 0)
    Only = degas::Database::openCreate((std::string::size_type)v12, (std::string::size_type)__p);
  else
    Only = degas::Database::openWrite((std::string::size_type)v12, (std::string::size_type)__p);
LABEL_20:
  v14 = Only;
  if (Only)
  {
    if (a4)
    {
      if ((Only - 2) > 8)
        v15 = -1;
      else
        v15 = qword_1CA1FE588[Only - 2];
      kg_errorWithCode(v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[KGDatabase close](self, "close");
    KGLoggingConnection();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v24 = self->_url;
      *(_DWORD *)buf = 138412546;
      v29 = v24;
      v30 = 1024;
      LODWORD(v31) = v14;
      _os_log_error_impl(&dword_1CA0A5000, v18, OS_LOG_TYPE_ERROR, "database open at path %@ failed rc=%d", buf, 0x12u);
    }
LABEL_37:
    v20 = 0;
    goto LABEL_38;
  }
  KGLoggingConnection();
  v18 = objc_claimAutoreleasedReturnValue();
  v20 = 1;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v21 = self->_url;
    -[KGDatabase openModeDescription:](self, "openModeDescription:", a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v29 = v21;
    v30 = 2112;
    v31 = v22;
    _os_log_impl(&dword_1CA0A5000, v18, OS_LOG_TYPE_INFO, "opened graph database at path %@ mode=%@", buf, 0x16u);

    v20 = 1;
  }
LABEL_38:

  if (v27 < 0)
    operator delete(__p[0]);
  return v20;
}

- (void)close
{
  void **database;
  NSObject *v4;
  NSURL *url;
  int v6;
  NSURL *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[KGGraphLockFile unlock](self->_lockFile, "unlock");
  degas::Database::close((degas::Database *)self->_database);
  database = (void **)self->_database;
  if (database)
  {
    degas::Database::~Database(database);
    MEMORY[0x1CAA4ADC8]();
  }
  KGLoggingConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    url = self->_url;
    v6 = 138412290;
    v7 = url;
    _os_log_impl(&dword_1CA0A5000, v4, OS_LOG_TYPE_INFO, "closing graph database at path %@", (uint8_t *)&v6, 0xCu);
  }

  self->_database = 0;
  +[KGElementIdentifierSet drainBitsetPool](KGElementIdentifierSet, "drainBitsetPool");
}

- (BOOL)copyToURL:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  void *database;
  int v9;
  uint64_t v10;
  void *__p[2];
  char v13;

  v6 = a3;
  if (!objc_msgSend(v6, "isEqual:", self->_url))
  {
    database = self->_database;
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation"));
    v9 = degas::Database::copyDatabase((uint64_t)database, __p);
    if (v13 < 0)
    {
      operator delete(__p[0]);
      if (!a4)
      {
LABEL_14:
        v7 = v9 == 0;
        goto LABEL_15;
      }
    }
    else if (!a4)
    {
      goto LABEL_14;
    }
    if (v9)
    {
      if ((v9 - 2) > 8)
        v10 = -1;
      else
        v10 = qword_1CA1FE588[v9 - 2];
      kg_errorWithCode(v10);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_14;
  }
  if (a4)
  {
    kg_errorWithCode(5003);
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
LABEL_15:

  return v7;
}

- (unint64_t)insertNewLabel:(id)a3
{
  sqlite3_int64 v4;
  void *__p[2];
  char v7;

  stringNSToStd(__p, a3);
  v4 = degas::Database::addLabel((uint64_t)self->_database, (uint64_t)__p);
  if (v7 < 0)
    operator delete(__p[0]);
  return v4;
}

- (unint64_t)upsertLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  KGDatabaseNameCache *nameCache;
  void *v9;

  v4 = a3;
  -[KGDatabaseNameCache labelIdentifierForName:database:](self->_nameCache, "labelIdentifierForName:database:", v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
  }
  else
  {
    v7 = -[KGDatabase insertNewLabel:](self, "insertNewLabel:", v4);
    nameCache = self->_nameCache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[KGDatabaseNameCache addLabelName:identifier:database:](nameCache, "addLabelName:identifier:database:", v4, v9, self);

  }
  return v7;
}

- (Bitmap)upsertLabels:(SEL)a3
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Bitmap *result;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  *(_OWORD *)&retstr->_bitCount = 0u;
  *(_OWORD *)&retstr->_bitSets.__begin_ = 0u;
  *(_OWORD *)((char *)&retstr->_bitSets.__end_ + 1) = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        degas::Bitmap::setBit((degas::Bitmap *)retstr, -[KGDatabase upsertLabel:](self, "upsertLabel:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), (_QWORD)v12));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  return result;
}

- (BOOL)labelIdentifiers:(void *)a3 forLabels:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    v9 = 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        -[KGDatabaseNameCache labelIdentifierForName:database:](self->_nameCache, "labelIdentifierForName:database:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), self, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
          degas::Bitmap::setBit((degas::Bitmap *)a3, objc_msgSend(v11, "unsignedIntegerValue"));
        else
          v9 = 0;

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 1;
  }

  return v9 & 1;
}

- (id)labelNameForLabelIdentifier:(unint64_t)a3
{
  KGDatabaseNameCache *nameCache;
  void *v5;
  void *v6;

  nameCache = self->_nameCache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGDatabaseNameCache labelNameForIdentifier:database:](nameCache, "labelNameForIdentifier:database:", v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)labelIdentifierForLabelName:(id)a3
{
  -[KGDatabaseNameCache labelIdentifierForName:database:](self->_nameCache, "labelIdentifierForName:database:", a3, self);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)nodeLabels
{
  id v3;
  id v4;
  void **v5;
  void *v6;
  void *__p[2];
  uint64_t v9;
  __int128 v10;
  _QWORD v11[4];
  degas::Statement *v12[2];

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  degas::LabelCursor::LabelCursor((degas::LabelCursor *)v12, (const degas::LabelTable *)((char *)self->_database + 80));
  while (degas::Statement::next((sqlite3_stmt **)v12[0]) == 1)
  {
    v10 = 0u;
    memset(v11, 0, 25);
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v12[0], 2, (degas::Bitmap *)&v10);
    if (v11[0] != v11[1])
    {
      __p[0] = 0;
      __p[1] = 0;
      v9 = 0;
      degas::Statement::stringColumnValue((sqlite3_stmt **)v12[0], 1, (uint64_t)__p);
      v4 = objc_alloc(MEMORY[0x1E0CB3940]);
      if (v9 >= 0)
        v5 = __p;
      else
        v5 = (void **)__p[0];
      v6 = (void *)objc_msgSend(v4, "initWithUTF8String:", v5);
      objc_msgSend(v3, "addObject:", v6);

      if (SHIBYTE(v9) < 0)
        operator delete(__p[0]);
    }
    __p[0] = v11;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  }
  degas::Cursor::~Cursor(v12);
  return v3;
}

- (id)edgeLabels
{
  id v3;
  id v4;
  void **v5;
  void *v6;
  void *__p[2];
  uint64_t v9;
  __int128 v10;
  _QWORD v11[4];
  degas::Statement *v12[2];

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  degas::LabelCursor::LabelCursor((degas::LabelCursor *)v12, (const degas::LabelTable *)((char *)self->_database + 80));
  while (degas::Statement::next((sqlite3_stmt **)v12[0]) == 1)
  {
    v10 = 0u;
    memset(v11, 0, 25);
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v12[0], 3, (degas::Bitmap *)&v10);
    if (v11[0] != v11[1])
    {
      __p[0] = 0;
      __p[1] = 0;
      v9 = 0;
      degas::Statement::stringColumnValue((sqlite3_stmt **)v12[0], 1, (uint64_t)__p);
      v4 = objc_alloc(MEMORY[0x1E0CB3940]);
      if (v9 >= 0)
        v5 = __p;
      else
        v5 = (void **)__p[0];
      v6 = (void *)objc_msgSend(v4, "initWithUTF8String:", v5);
      objc_msgSend(v3, "addObject:", v6);

      if (SHIBYTE(v9) < 0)
        operator delete(__p[0]);
    }
    __p[0] = v11;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  }
  degas::Cursor::~Cursor(v12);
  return v3;
}

- (id)labelsOfNodesForIdentifiers:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  void *v7;
  __int128 v9;
  _QWORD v10[4];
  degas::Statement *v11[2];
  __int128 v12;
  _QWORD v13[5];
  void **v14;

  v4 = a3;
  v12 = 0u;
  memset(v13, 0, 25);
  degas::NodeCursor::NodeCursor(v11);
  degas::NodeCursor::setForIdentifiers((degas::NodeCursor *)v11, (Bitmap *)objc_msgSend(v4, "bitmap"), (const degas::NodeTable *)((char *)self->_database + 192));
  while (degas::Statement::next((sqlite3_stmt **)v11[0]) == 1)
  {
    v9 = 0u;
    memset(v10, 0, 25);
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v11[0], 1, (degas::Bitmap *)&v9);
    degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)&v12, (uint64_t)&v9);
    v14 = (void **)v10;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v14);
  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  degas::Bitmap::begin(&v12, &v9);
  while (1)
  {
    v6 = (__int128 *)v9 == &v12 && *((_QWORD *)&v9 + 1) == -1;
    if (v6 && v10[0] == v13[1])
      break;
    -[KGDatabase labelNameForLabelIdentifier:](self, "labelNameForLabelIdentifier:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v5, "addObject:", v7);

    degas::Bitmap::iterator::operator++((unint64_t *)&v9);
  }
  degas::Cursor::~Cursor(v11);
  *(_QWORD *)&v9 = v13;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v9);

  return v5;
}

- (id)labelsOfEdgesForIdentifiers:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  void *v7;
  __int128 v9;
  _QWORD v10[4];
  degas::Statement *v11[2];
  __int128 v12;
  _QWORD v13[5];
  void **v14;

  v4 = a3;
  v12 = 0u;
  memset(v13, 0, 25);
  degas::EdgeCursor::EdgeCursor(v11);
  degas::EdgeCursor::setForIdentifiers((degas::EdgeCursor *)v11, (Bitmap *)objc_msgSend(v4, "bitmap"), (const degas::EdgeTable *)((char *)self->_database + 248));
  while (degas::Statement::next((sqlite3_stmt **)v11[0]) == 1)
  {
    v9 = 0u;
    memset(v10, 0, 25);
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v11[0], 1, (degas::Bitmap *)&v9);
    degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)&v12, (uint64_t)&v9);
    v14 = (void **)v10;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v14);
  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  degas::Bitmap::begin(&v12, &v9);
  while (1)
  {
    v6 = (__int128 *)v9 == &v12 && *((_QWORD *)&v9 + 1) == -1;
    if (v6 && v10[0] == v13[1])
      break;
    -[KGDatabase labelNameForLabelIdentifier:](self, "labelNameForLabelIdentifier:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v5, "addObject:", v7);

    degas::Bitmap::iterator::operator++((unint64_t *)&v9);
  }
  degas::Cursor::~Cursor(v11);
  *(_QWORD *)&v9 = v13;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v9);

  return v5;
}

- (unint64_t)graphVersion
{
  int v2;
  int v3;
  NSObject *v5;
  unint64_t v6;
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v2 = degas::Database::metadataValue((degas::Database *)self->_database, 1, (sqlite3_int64 *)&v6);
  if (v2 != 2)
  {
    v3 = v2;
    if (!v2)
      return v6;
    KGLoggingConnection();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v8 = v3;
      _os_log_error_impl(&dword_1CA0A5000, v5, OS_LOG_TYPE_ERROR, "failed reading graph version metadata rc=%d", buf, 8u);
    }

  }
  return 0;
}

- (void)setGraphVersion:(unint64_t)a3
{
  char *database;

  database = (char *)self->_database;
  if (!database[32])
    degas::MetadataTable::insertOrUpdate((degas::MetadataTable *)(database + 136), 1, a3);
}

- (NSUUID)graphIdentifier
{
  int v3;
  int v4;
  id v5;
  NSObject *v6;
  _BYTE *database;
  void **v8;
  void *v10[2];
  uint64_t v11;
  void *__p[2];
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10[0] = 0;
  v10[1] = 0;
  v11 = 0;
  v3 = degas::Database::metadataValue((uint64_t)self->_database, 2, (uint64_t)v10);
  v4 = v3;
  if (v3)
  {
    if (v3 == 2)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v5, "UUIDString");
      v6 = objc_claimAutoreleasedReturnValue();
      stringNSToStd(__p, v6);
      database = self->_database;
      if (!database[32])
        degas::MetadataTable::insertOrUpdate((uint64_t)(database + 136), 2, (uint64_t *)__p);
      if (v13 < 0)
        operator delete(__p[0]);
    }
    else
    {
      KGLoggingConnection();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        LODWORD(__p[0]) = 67109120;
        HIDWORD(__p[0]) = v4;
        _os_log_error_impl(&dword_1CA0A5000, v6, OS_LOG_TYPE_ERROR, "failed reading graph identifier metadata rc=%d", (uint8_t *)__p, 8u);
      }
      v5 = 0;
    }
  }
  else
  {
    if (v11 >= 0)
      v8 = v10;
    else
      v8 = (void **)v10[0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
    v6 = objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
  }

  if (SHIBYTE(v11) < 0)
    operator delete(v10[0]);
  return (NSUUID *)v5;
}

- (unint64_t)attributeIdentifierForPropertyName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _BYTE *database;
  int v10;
  NSObject *v11;
  void *__p[2];
  char v13;
  _BYTE buf[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[KGDatabaseNameCache attrIdentifierForPropertyName:database:](self->_nameCache, "attrIdentifierForPropertyName:database:", v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
    goto LABEL_7;
  }
  stringNSToStd(__p, v4);
  database = self->_database;
  if (database[32])
    goto LABEL_4;
  *(_QWORD *)buf = 0;
  v10 = degas::AttributeTable::insert((uint64_t)(database + 304), (sqlite3_int64 *)buf, (uint64_t *)__p);
  if (v10)
  {
    if (v10 != 8)
    {
      KGLoggingConnection();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v4;
        _os_log_error_impl(&dword_1CA0A5000, v11, OS_LOG_TYPE_ERROR, "failed to create new attribute %@", buf, 0xCu);
      }

    }
LABEL_4:
    v6 = 0;
    v7 = 0;
    goto LABEL_5;
  }
  v7 = *(_QWORD *)buf;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)buf);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGDatabaseNameCache addPropertyName:identifier:database:](self->_nameCache, "addPropertyName:identifier:database:", v4);
LABEL_5:
  if (v13 < 0)
    operator delete(__p[0]);
LABEL_7:

  return v7;
}

- (id)propertyNameForAttrIdentifier:(unint64_t)a3
{
  KGDatabaseNameCache *nameCache;
  void *v5;
  void *v6;

  nameCache = self->_nameCache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGDatabaseNameCache propertyNameForIdentifier:database:](nameCache, "propertyNameForIdentifier:database:", v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)degasEdgeDirectionFromKG:(unint64_t)a3
{
  int v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a3 - 1 < 3)
    return 3 - a3;
  v4 = a3;
  KGLoggingConnection();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_error_impl(&dword_1CA0A5000, v5, OS_LOG_TYPE_ERROR, "invalid edge direction: %d", (uint8_t *)v6, 8u);
  }

  return 0;
}

- (void)enumerateNodesWithIdentifiers:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  degas::Statement *v8[2];
  degas::Statement *v9[2];

  v6 = a3;
  v7 = a4;
  -[KGDatabase nodeCursorWithIdentifiers:](self, "nodeCursorWithIdentifiers:", v6);
  -[KGDatabase nodeAttributeValueCursorWithIdentifiers:](self, "nodeAttributeValueCursorWithIdentifiers:", v6);
  -[KGDatabase _enumerateNodesWithNodeCursor:propertiesCursor:block:](self, "_enumerateNodesWithNodeCursor:propertiesCursor:block:", v9, v8, v7);
  degas::Cursor::~Cursor(v8);
  degas::Cursor::~Cursor(v9);

}

- (void)enumerateEdgesWithIdentifiers:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  degas::Statement *v8[2];
  degas::Statement *v9[2];

  v6 = a3;
  v7 = a4;
  -[KGDatabase edgeCursorWithIdentifiers:](self, "edgeCursorWithIdentifiers:", v6);
  -[KGDatabase edgeAttributeValueCursorWithIdentifiers:](self, "edgeAttributeValueCursorWithIdentifiers:", v6);
  -[KGDatabase _enumerateEdgesWithEdgeCursor:propertiesCursor:block:](self, "_enumerateEdgesWithEdgeCursor:propertiesCursor:block:", v9, v8, v7);
  degas::Cursor::~Cursor(v8);
  degas::Cursor::~Cursor(v9);

}

- (void)enumerateTombstoneNodesWithIdentifiers:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  degas::Statement *v8[2];
  degas::Statement *v9[2];

  v6 = a3;
  v7 = a4;
  -[KGDatabase tombstoneNodeCursorWithIdentifiers:](self, "tombstoneNodeCursorWithIdentifiers:", v6);
  -[KGDatabase tombstoneNodeAttributeValueCursorWithIdentifiers:](self, "tombstoneNodeAttributeValueCursorWithIdentifiers:", v6);
  -[KGDatabase _enumerateNodesWithNodeCursor:propertiesCursor:block:](self, "_enumerateNodesWithNodeCursor:propertiesCursor:block:", v9, v8, v7);
  degas::Cursor::~Cursor(v8);
  degas::Cursor::~Cursor(v9);

}

- (void)enumerateTombstoneEdgesWithIdentifiers:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  degas::Statement *v8[2];
  degas::Statement *v9[2];

  v6 = a3;
  v7 = a4;
  -[KGDatabase tombstoneEdgeCursorWithIdentifiers:](self, "tombstoneEdgeCursorWithIdentifiers:", v6);
  -[KGDatabase tombstoneEdgeAttributeValueCursorWithIdentifiers:](self, "tombstoneEdgeAttributeValueCursorWithIdentifiers:", v6);
  -[KGDatabase _enumerateEdgesWithEdgeCursor:propertiesCursor:block:](self, "_enumerateEdgesWithEdgeCursor:propertiesCursor:block:", v9, v8, v7);
  degas::Cursor::~Cursor(v8);
  degas::Cursor::~Cursor(v9);

}

- (void)enumerateSourceAndTargetIdentifiersWithEdgeIdentifiers:(id)a3 block:(id)a4
{
  void (**v6)(id, sqlite3_int64, sqlite3_int64, sqlite3_int64, _BYTE *);
  sqlite3_int64 v7;
  sqlite3_int64 v8;
  sqlite3_int64 v9;
  char v10;
  degas::Statement *v11;

  v6 = (void (**)(id, sqlite3_int64, sqlite3_int64, sqlite3_int64, _BYTE *))a4;
  -[KGDatabase edgeCursorWithIdentifiers:](self, "edgeCursorWithIdentifiers:", a3);
  v10 = 0;
  do
  {
    if (degas::Statement::next((sqlite3_stmt **)v11) != 1)
      break;
    v7 = sqlite3_column_int64(*(sqlite3_stmt **)v11, 0);
    v8 = sqlite3_column_int64(*(sqlite3_stmt **)v11, 2);
    v9 = sqlite3_column_int64(*(sqlite3_stmt **)v11, 3);
    v6[2](v6, v7, v8, v9, &v10);
  }
  while (!v10);
  degas::Cursor::~Cursor(&v11);

}

- (NodeCursor)nodeCursorWithIdentifiers:(id)a3
{
  degas::NodeCursor *v3;
  degas::NodeCursor *v5;
  Statement *v6;
  __shared_weak_count *v7;
  id v8;
  NodeCursor result;

  v5 = v3;
  v8 = a3;
  degas::NodeCursor::NodeCursor(v5);
  if (v8)
  {
    if (objc_msgSend(v8, "count") == 1)
      degas::NodeCursor::setForIdentifier(v5, objc_msgSend(v8, "firstElement"), (const degas::NodeTable *)((char *)self->_database + 192));
    else
      degas::NodeCursor::setForIdentifiers(v5, (Bitmap *)objc_msgSend(v8, "bitmap"), (const degas::NodeTable *)((char *)self->_database + 192));
  }
  else
  {
    degas::NodeCursor::setForSelectAll(v5, (const degas::NodeTable *)((char *)self->_database + 192));
  }

  result.var0.var1 = v7;
  result.var0.var0 = v6;
  return result;
}

- (NodeCursor)tombstoneNodeCursorWithIdentifiers:(id)a3
{
  degas::NodeCursor *v3;
  degas::NodeCursor *v5;
  Statement *v6;
  __shared_weak_count *v7;
  id v8;
  NodeCursor result;

  v5 = v3;
  v8 = a3;
  degas::NodeCursor::NodeCursor(v5);
  if (v8)
  {
    if (objc_msgSend(v8, "count") == 1)
      degas::NodeCursor::setForIdentifier(v5, objc_msgSend(v8, "firstElement"), (const degas::NodeTable *)((char *)self->_database + 808));
    else
      degas::NodeCursor::setForIdentifiers(v5, (Bitmap *)objc_msgSend(v8, "bitmap"), (const degas::NodeTable *)((char *)self->_database + 808));
  }
  else
  {
    degas::NodeCursor::setForSelectAll(v5, (const degas::NodeTable *)((char *)self->_database + 808));
  }

  result.var0.var1 = v7;
  result.var0.var0 = v6;
  return result;
}

- (AttributeValueCursor)nodeAttributeValueCursorWithIdentifiers:(id)a3
{
  degas::AttributeValueCursor *v3;
  degas::AttributeValueCursor *v5;
  id v6;
  Statement *v7;
  __shared_weak_count *v8;
  id v9;
  AttributeValueCursor result;

  v5 = v3;
  v6 = a3;
  v9 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "count") == 1)
      degas::AttributeValueCursor::AttributeValueCursor(v5, objc_msgSend(v9, "firstElement"), (const degas::AttributeValueTable *)((char *)self->_database + 360));
    else
      degas::AttributeValueCursor::AttributeValueCursor(v5, (Bitmap *)objc_msgSend(v9, "bitmap"), (const degas::AttributeValueTable *)((char *)self->_database + 360));
  }
  else
  {
    degas::AttributeValueCursor::AttributeValueCursor(v5, (const degas::AttributeValueTable *)((char *)self->_database + 360));
  }

  result.var0.var1 = v8;
  result.var0.var0 = v7;
  return result;
}

- (AttributeValueCursor)tombstoneNodeAttributeValueCursorWithIdentifiers:(id)a3
{
  degas::AttributeValueCursor *v3;
  degas::AttributeValueCursor *v5;
  id v6;
  Statement *v7;
  __shared_weak_count *v8;
  id v9;
  AttributeValueCursor result;

  v5 = v3;
  v6 = a3;
  v9 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "count") == 1)
      degas::AttributeValueCursor::AttributeValueCursor(v5, objc_msgSend(v9, "firstElement"), (const degas::AttributeValueTable *)((char *)self->_database + 920));
    else
      degas::AttributeValueCursor::AttributeValueCursor(v5, (Bitmap *)objc_msgSend(v9, "bitmap"), (const degas::AttributeValueTable *)((char *)self->_database + 920));
  }
  else
  {
    degas::AttributeValueCursor::AttributeValueCursor(v5, (const degas::AttributeValueTable *)((char *)self->_database + 360));
  }

  result.var0.var1 = v8;
  result.var0.var0 = v7;
  return result;
}

- (AttributeValueCursor)nodeAttributeValueCursorWithIdentifiers:(id)a3 propertyName:(id)a4
{
  uint64_t *v4;
  uint64_t *v7;
  id v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  Statement *v13;
  __shared_weak_count *v14;
  id v15;
  AttributeValueCursor result;

  v7 = v4;
  v15 = a3;
  v8 = a4;
  v9 = degas::AttributeValueTable::prepareStatementToReadByBitmapAndAttrIdIdentifier((degas::AttributeValueTable *)((char *)self->_database + 360), (Bitmap *)objc_msgSend(v15, "bitmap"), -[KGDatabase attributeIdentifierForPropertyName:](self, "attributeIdentifierForPropertyName:", v8));
  v10 = v9[1];
  *v7 = *v9;
  v7[1] = v10;
  if (v10)
  {
    v11 = (unint64_t *)(v10 + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }

  result.var0.var1 = v14;
  result.var0.var0 = v13;
  return result;
}

- (void)enumeratePropertyValuesForNodesWithIdentifiers:(id)a3 propertyName:(id)a4 withBlock:(id)a5
{
  id v8;
  degas::Statement *v9[2];

  v8 = a5;
  -[KGDatabase nodeAttributeValueCursorWithIdentifiers:propertyName:](self, "nodeAttributeValueCursorWithIdentifiers:propertyName:", a3, a4);
  -[KGDatabase _enumeratePropertiesWithCursor:withBlock:](self, "_enumeratePropertiesWithCursor:withBlock:", v9, v8);
  degas::Cursor::~Cursor(v9);

}

- (void)_enumerateNodeTableWithNodeCursor:(void *)a3 block:(id)a4
{
  __int128 v6;
  sqlite3_int64 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  KGDatabaseNameCache *nameCache;
  void *v14;
  void *v15;
  NSObject *v16;
  BOOL v17;
  void **v18;
  char *database;
  char *v20;
  const char *v21;
  unint64_t databaseStatus;
  __int128 v23;
  void (**v24)(id, sqlite3_int64, id, char *);
  void *__p[2];
  char v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  _QWORD v31[5];
  char v32;
  _BYTE buf[12];
  __int16 v34;
  sqlite3_int64 v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void **v39;
  __int16 v40;
  char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  unint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v32 = 0;
  v24 = (void (**)(id, sqlite3_int64, id, char *))a4;
  *(_QWORD *)&v6 = 134219522;
  v23 = v6;
  do
  {
    if (degas::Statement::next(*(sqlite3_stmt ***)a3) != 1)
      break;
    v7 = sqlite3_column_int64(**(sqlite3_stmt ***)a3, 0);
    v30 = 0u;
    memset(v31, 0, 25);
    degas::Statement::bitmapColumnValue(*(sqlite3_stmt ***)a3, 1, (degas::Bitmap *)&v30);
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    degas::Bitmap::begin(&v30, &v27);
    v9 = v31[1];
    while (1)
    {
      v10 = v28;
      v11 = (__int128 *)v27 == &v30 && v28 == -1;
      if (v11 && v29 == v9)
        break;
      nameCache = self->_nameCache;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v28);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[KGDatabaseNameCache labelNameForIdentifier:database:](nameCache, "labelNameForIdentifier:database:", v14, self);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        KGLoggingConnection();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          degas::Bitmap::description((uint64_t *)__p, (degas::Bitmap *)&v30);
          v18 = __p;
          if (v26 < 0)
            v18 = (void **)__p[0];
          database = (char *)self->_database;
          v20 = database;
          if (database[23] < 0)
            v20 = *(char **)database;
          v11 = database[32] == 0;
          v21 = "true";
          if (v11)
            v21 = "false";
          databaseStatus = self->_databaseStatus;
          *(_DWORD *)buf = v23;
          *(_QWORD *)&buf[4] = v10;
          v34 = 2048;
          v35 = v7;
          v36 = 2112;
          v37 = v8;
          v38 = 2080;
          v39 = v18;
          v40 = 2080;
          v41 = v20;
          v42 = 2080;
          v43 = v21;
          v44 = 2048;
          v45 = databaseStatus;
          _os_log_fault_impl(&dword_1CA0A5000, v16, OS_LOG_TYPE_FAULT, "reading node with unrecognised label identifier %lld, node identifier %lld, labels %@, labels description %s database url=%s, readonly=%s, database status=%ld", buf, 0x48u);
          if (v26 < 0)
            operator delete(__p[0]);
        }

        -[KGDatabase setFatalError:](self, "setFatalError:", CFSTR("missing label"));
        v32 = 1;
        break;
      }
      objc_msgSend(v8, "addObject:", v15);

      degas::Bitmap::iterator::operator++(&v27);
    }
    if (-[KGDatabase noFatalError](self, "noFatalError", v23))
      v24[2](v24, v7, v8, &v32);
    v17 = v32 == 0;

    *(_QWORD *)buf = v31;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  }
  while (v17);

}

- (EdgeCursor)edgeCursorWithIdentifiers:(id)a3
{
  degas::EdgeCursor *v3;
  degas::EdgeCursor *v5;
  Statement *v6;
  __shared_weak_count *v7;
  id v8;
  EdgeCursor result;

  v5 = v3;
  v8 = a3;
  degas::EdgeCursor::EdgeCursor(v5);
  if (v8)
  {
    if (objc_msgSend(v8, "count") == 1)
      degas::EdgeCursor::setForIdentifier(v5, objc_msgSend(v8, "firstElement"), (const degas::EdgeTable *)((char *)self->_database + 248));
    else
      degas::EdgeCursor::setForIdentifiers(v5, (Bitmap *)objc_msgSend(v8, "bitmap"), (const degas::EdgeTable *)((char *)self->_database + 248));
  }
  else
  {
    degas::EdgeCursor::setForSelectAll(v5, (const degas::EdgeTable *)((char *)self->_database + 248));
  }

  result.var0.var1 = v7;
  result.var0.var0 = v6;
  return result;
}

- (EdgeCursor)tombstoneEdgeCursorWithIdentifiers:(id)a3
{
  degas::EdgeCursor *v3;
  degas::EdgeCursor *v5;
  Statement *v6;
  __shared_weak_count *v7;
  id v8;
  EdgeCursor result;

  v5 = v3;
  v8 = a3;
  degas::EdgeCursor::EdgeCursor(v5);
  if (v8)
  {
    if (objc_msgSend(v8, "count") == 1)
      degas::EdgeCursor::setForIdentifier(v5, objc_msgSend(v8, "firstElement"), (const degas::EdgeTable *)((char *)self->_database + 864));
    else
      degas::EdgeCursor::setForIdentifiers(v5, (Bitmap *)objc_msgSend(v8, "bitmap"), (const degas::EdgeTable *)((char *)self->_database + 864));
  }
  else
  {
    degas::EdgeCursor::setForSelectAll(v5, (const degas::EdgeTable *)((char *)self->_database + 864));
  }

  result.var0.var1 = v7;
  result.var0.var0 = v6;
  return result;
}

- (AttributeValueCursor)edgeAttributeValueCursorWithIdentifiers:(id)a3
{
  degas::AttributeValueCursor *v3;
  degas::AttributeValueCursor *v5;
  id v6;
  Statement *v7;
  __shared_weak_count *v8;
  id v9;
  AttributeValueCursor result;

  v5 = v3;
  v6 = a3;
  v9 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "count") == 1)
      degas::AttributeValueCursor::AttributeValueCursor(v5, objc_msgSend(v9, "firstElement"), (const degas::AttributeValueTable *)((char *)self->_database + 416));
    else
      degas::AttributeValueCursor::AttributeValueCursor(v5, (Bitmap *)objc_msgSend(v9, "bitmap"), (const degas::AttributeValueTable *)((char *)self->_database + 416));
  }
  else
  {
    degas::AttributeValueCursor::AttributeValueCursor(v5, (const degas::AttributeValueTable *)((char *)self->_database + 416));
  }

  result.var0.var1 = v8;
  result.var0.var0 = v7;
  return result;
}

- (AttributeValueCursor)tombstoneEdgeAttributeValueCursorWithIdentifiers:(id)a3
{
  degas::AttributeValueCursor *v3;
  degas::AttributeValueCursor *v5;
  id v6;
  Statement *v7;
  __shared_weak_count *v8;
  id v9;
  AttributeValueCursor result;

  v5 = v3;
  v6 = a3;
  v9 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "count") == 1)
      degas::AttributeValueCursor::AttributeValueCursor(v5, objc_msgSend(v9, "firstElement"), (const degas::AttributeValueTable *)((char *)self->_database + 976));
    else
      degas::AttributeValueCursor::AttributeValueCursor(v5, (Bitmap *)objc_msgSend(v9, "bitmap"), (const degas::AttributeValueTable *)((char *)self->_database + 976));
  }
  else
  {
    degas::AttributeValueCursor::AttributeValueCursor(v5, (const degas::AttributeValueTable *)((char *)self->_database + 976));
  }

  result.var0.var1 = v8;
  result.var0.var0 = v7;
  return result;
}

- (AttributeValueCursor)edgeAttributeValueCursorWithIdentifiers:(id)a3 propertyName:(id)a4
{
  uint64_t *v4;
  uint64_t *v7;
  id v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  Statement *v13;
  __shared_weak_count *v14;
  id v15;
  AttributeValueCursor result;

  v7 = v4;
  v15 = a3;
  v8 = a4;
  v9 = degas::AttributeValueTable::prepareStatementToReadByBitmapAndAttrIdIdentifier((degas::AttributeValueTable *)((char *)self->_database + 416), (Bitmap *)objc_msgSend(v15, "bitmap"), -[KGDatabase attributeIdentifierForPropertyName:](self, "attributeIdentifierForPropertyName:", v8));
  v10 = v9[1];
  *v7 = *v9;
  v7[1] = v10;
  if (v10)
  {
    v11 = (unint64_t *)(v10 + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }

  result.var0.var1 = v14;
  result.var0.var0 = v13;
  return result;
}

- (void)enumeratePropertyValuesForEdgesWithIdentifiers:(id)a3 propertyName:(id)a4 withBlock:(id)a5
{
  id v8;
  degas::Statement *v9[2];

  v8 = a5;
  -[KGDatabase edgeAttributeValueCursorWithIdentifiers:propertyName:](self, "edgeAttributeValueCursorWithIdentifiers:propertyName:", a3, a4);
  -[KGDatabase _enumeratePropertiesWithCursor:withBlock:](self, "_enumeratePropertiesWithCursor:withBlock:", v9, v8);
  degas::Cursor::~Cursor(v9);

}

- (void)_enumerateEdgeTableWithEdgeCursor:(void *)a3 block:(id)a4
{
  sqlite3_int64 v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  KGDatabaseNameCache *nameCache;
  void *v13;
  void *v14;
  NSObject *v15;
  sqlite3_int64 v16;
  sqlite3_int64 v17;
  BOOL v18;
  void **v19;
  char *database;
  char *v21;
  const char *v22;
  unint64_t databaseStatus;
  void (**v24)(id, sqlite3_int64, id, sqlite3_int64, sqlite3_int64, char *);
  void *__p[2];
  char v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  _QWORD v31[5];
  char v32;
  _BYTE buf[12];
  __int16 v34;
  sqlite3_int64 v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void **v39;
  __int16 v40;
  char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  unint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v32 = 0;
  v24 = (void (**)(id, sqlite3_int64, id, sqlite3_int64, sqlite3_int64, char *))a4;
  do
  {
    if (degas::Statement::next(*(sqlite3_stmt ***)a3) != 1)
      break;
    v6 = sqlite3_column_int64(**(sqlite3_stmt ***)a3, 0);
    v30 = 0u;
    memset(v31, 0, 25);
    degas::Statement::bitmapColumnValue(*(sqlite3_stmt ***)a3, 1, (degas::Bitmap *)&v30);
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    degas::Bitmap::begin(&v30, &v27);
    v8 = v31[1];
    while (1)
    {
      v9 = v28;
      v10 = (__int128 *)v27 == &v30 && v28 == -1;
      if (v10 && v29 == v8)
        break;
      nameCache = self->_nameCache;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v28);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[KGDatabaseNameCache labelNameForIdentifier:database:](nameCache, "labelNameForIdentifier:database:", v13, self);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        KGLoggingConnection();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          degas::Bitmap::description((uint64_t *)__p, (degas::Bitmap *)&v30);
          v19 = __p;
          if (v26 < 0)
            v19 = (void **)__p[0];
          database = (char *)self->_database;
          v21 = database;
          if (database[23] < 0)
            v21 = *(char **)database;
          v10 = database[32] == 0;
          v22 = "true";
          if (v10)
            v22 = "false";
          databaseStatus = self->_databaseStatus;
          *(_DWORD *)buf = 134219522;
          *(_QWORD *)&buf[4] = v9;
          v34 = 2048;
          v35 = v6;
          v36 = 2112;
          v37 = v7;
          v38 = 2080;
          v39 = v19;
          v40 = 2080;
          v41 = v21;
          v42 = 2080;
          v43 = v22;
          v44 = 2048;
          v45 = databaseStatus;
          _os_log_fault_impl(&dword_1CA0A5000, v15, OS_LOG_TYPE_FAULT, "reading edge with unrecognised label identifier %lld, edge identifier %lld, labels %@, labels description %s with database url=%s, readonly=%s, database status=%ld", buf, 0x48u);
          if (v26 < 0)
            operator delete(__p[0]);
        }

        -[KGDatabase setFatalError:](self, "setFatalError:", CFSTR("missing label"));
        v32 = 1;
        break;
      }
      objc_msgSend(v7, "addObject:", v14);

      degas::Bitmap::iterator::operator++(&v27);
    }
    v16 = sqlite3_column_int64(**(sqlite3_stmt ***)a3, 2);
    v17 = sqlite3_column_int64(**(sqlite3_stmt ***)a3, 3);
    if (-[KGDatabase noFatalError](self, "noFatalError"))
      v24[2](v24, v6, v7, v16, v17, &v32);
    v18 = v32 == 0;

    *(_QWORD *)buf = v31;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  }
  while (v18);

}

- (void)_enumerateNodesWithNodeCursor:(void *)a3 propertiesCursor:(void *)a4 block:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  _QWORD *v16;
  uint64_t *v17;
  void *v18;
  _QWORD v19[4];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v8 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v27 = MEMORY[0x1CAA4B20C]();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__KGDatabase__enumerateNodesWithNodeCursor_propertiesCursor_block___block_invoke;
  v13[3] = &unk_1E83E37E8;
  v13[4] = self;
  v18 = a3;
  v10 = v8;
  v14 = v10;
  v15 = &v20;
  v16 = v19;
  v17 = &v24;
  -[KGDatabase _enumeratePropertiesForCursor:block:](self, "_enumeratePropertiesForCursor:block:", a4, v13);
  if (!*((_BYTE *)v21 + 24))
  {
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __67__KGDatabase__enumerateNodesWithNodeCursor_propertiesCursor_block___block_invoke_3;
    v11[3] = &unk_1E83E3810;
    v12 = v10;
    -[KGDatabase _enumerateNodeTableWithNodeCursor:block:](self, "_enumerateNodeTableWithNodeCursor:block:", a3, v11);

  }
  objc_autoreleasePoolPop((void *)v25[3]);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

}

- (void)_enumerateEdgesWithEdgeCursor:(void *)a3 propertiesCursor:(void *)a4 block:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  _QWORD *v16;
  uint64_t *v17;
  void *v18;
  _QWORD v19[4];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v8 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v27 = MEMORY[0x1CAA4B20C]();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__KGDatabase__enumerateEdgesWithEdgeCursor_propertiesCursor_block___block_invoke;
  v13[3] = &unk_1E83E37E8;
  v13[4] = self;
  v18 = a3;
  v10 = v8;
  v14 = v10;
  v15 = &v20;
  v16 = v19;
  v17 = &v24;
  -[KGDatabase _enumeratePropertiesForCursor:block:](self, "_enumeratePropertiesForCursor:block:", a4, v13);
  if (!*((_BYTE *)v21 + 24))
  {
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __67__KGDatabase__enumerateEdgesWithEdgeCursor_propertiesCursor_block___block_invoke_3;
    v11[3] = &unk_1E83E3860;
    v12 = v10;
    -[KGDatabase _enumerateEdgeTableWithEdgeCursor:block:](self, "_enumerateEdgeTableWithEdgeCursor:block:", a3, v11);

  }
  objc_autoreleasePoolPop((void *)v25[3]);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

}

- (id)propertyValueForCursor:(void *)a3
{
  NSObject *v4;
  KGStringPropertyValue *v5;
  KGDoublePropertyValue *v6;
  sqlite3_int64 v7;
  __objc2_class *v8;
  id v10;
  void **v11;
  void *v12;
  void *__p[2];
  uint64_t v14;

  switch(sqlite3_column_int64(**(sqlite3_stmt ***)a3, 5))
  {
    case 0u:
      KGLoggingConnection();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        LOWORD(__p[0]) = 0;
        _os_log_error_impl(&dword_1CA0A5000, v4, OS_LOG_TYPE_ERROR, "unsupported data type for attribute value", (uint8_t *)__p, 2u);
      }

      goto LABEL_5;
    case 1u:
      v7 = sqlite3_column_int64(**(sqlite3_stmt ***)a3, 2);
      v8 = KGInt64PropertyValue;
      goto LABEL_9;
    case 2u:
      v6 = -[KGDoublePropertyValue initWithValue:]([KGDoublePropertyValue alloc], "initWithValue:", sqlite3_column_double(**(sqlite3_stmt ***)a3, 3));
      goto LABEL_10;
    case 3u:
      __p[0] = 0;
      __p[1] = 0;
      v14 = 0;
      degas::Statement::stringColumnValue(*(sqlite3_stmt ***)a3, 4, (uint64_t)__p);
      v10 = objc_alloc(MEMORY[0x1E0CB3940]);
      if (v14 >= 0)
        v11 = __p;
      else
        v11 = (void **)__p[0];
      v12 = (void *)objc_msgSend(v10, "initWithUTF8String:", v11);
      v5 = -[KGStringPropertyValue initWithValue:]([KGStringPropertyValue alloc], "initWithValue:", v12);

      if (SHIBYTE(v14) < 0)
        operator delete(__p[0]);
      return v5;
    case 4u:
      v7 = sqlite3_column_int64(**(sqlite3_stmt ***)a3, 2);
      v8 = KGUInt64PropertyValue;
LABEL_9:
      v6 = (KGDoublePropertyValue *)objc_msgSend([v8 alloc], "initWithValue:", v7);
LABEL_10:
      v5 = (KGStringPropertyValue *)v6;
      break;
    default:
LABEL_5:
      v5 = 0;
      break;
  }
  return v5;
}

- (void)_enumeratePropertiesForCursor:(void *)a3 block:(id)a4
{
  void (**v6)(id, sqlite3_int64, void *, _BYTE *);
  void *v7;
  sqlite3_int64 v8;
  sqlite3_int64 v9;
  id v10;
  sqlite3_int64 v11;
  void *v12;
  void *v13;
  char v14;

  v6 = (void (**)(id, sqlite3_int64, void *, _BYTE *))a4;
  v7 = 0;
  v8 = 0;
  v14 = 0;
  while (degas::Statement::next(*(sqlite3_stmt ***)a3) == 1)
  {
    v9 = sqlite3_column_int64(**(sqlite3_stmt ***)a3, 0);
    if (v9 != v8)
    {
      if (v7)
        v6[2](v6, v8, v7, &v14);
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);

      v7 = v10;
      v8 = v9;
    }
    v11 = sqlite3_column_int64(**(sqlite3_stmt ***)a3, 1);
    -[KGDatabase propertyValueForCursor:](self, "propertyValueForCursor:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[KGDatabase propertyNameForAttrIdentifier:](self, "propertyNameForAttrIdentifier:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v13);

    }
  }
  if (v7)
    v6[2](v6, v8, v7, &v14);

}

- (void)_enumeratePropertiesWithCursor:(void *)a3 withBlock:(id)a4
{
  void (**v5)(id, sqlite3_int64, KGInt64PropertyValue *, _BYTE *);
  KGInt64PropertyValue *v6;
  sqlite3_int64 v7;
  sqlite3_int64 v8;
  id v9;
  void **v10;
  void *v11;
  KGStringPropertyValue *v12;
  sqlite3_int64 v13;
  sqlite3_int64 v14;
  void *__p[2];
  uint64_t v16;
  char v17;

  v5 = (void (**)(id, sqlite3_int64, KGInt64PropertyValue *, _BYTE *))a4;
  v17 = 0;
  do
  {
    if (degas::Statement::next(*(sqlite3_stmt ***)a3) != 1)
      break;
    switch(sqlite3_column_int64(**(sqlite3_stmt ***)a3, 5))
    {
      case 1u:
        v6 = -[KGInt64PropertyValue initWithValue:]([KGInt64PropertyValue alloc], "initWithValue:", sqlite3_column_int64(**(sqlite3_stmt ***)a3, 2));
        v7 = sqlite3_column_int64(**(sqlite3_stmt ***)a3, 0);
        v5[2](v5, v7, v6, &v17);
        goto LABEL_12;
      case 2u:
        v6 = -[KGDoublePropertyValue initWithValue:]([KGDoublePropertyValue alloc], "initWithValue:", sqlite3_column_double(**(sqlite3_stmt ***)a3, 3));
        v8 = sqlite3_column_int64(**(sqlite3_stmt ***)a3, 0);
        v5[2](v5, v8, v6, &v17);
        goto LABEL_12;
      case 3u:
        __p[0] = 0;
        __p[1] = 0;
        v16 = 0;
        degas::Statement::stringColumnValue(*(sqlite3_stmt ***)a3, 4, (uint64_t)__p);
        v9 = objc_alloc(MEMORY[0x1E0CB3940]);
        if (v16 >= 0)
          v10 = __p;
        else
          v10 = (void **)__p[0];
        v11 = (void *)objc_msgSend(v9, "initWithUTF8String:", v10);
        v12 = -[KGStringPropertyValue initWithValue:]([KGStringPropertyValue alloc], "initWithValue:", v11);
        v13 = sqlite3_column_int64(**(sqlite3_stmt ***)a3, 0);
        v5[2](v5, v13, (KGInt64PropertyValue *)v12, &v17);

        if (SHIBYTE(v16) < 0)
          operator delete(__p[0]);
        break;
      case 4u:
        v6 = -[KGUInt64PropertyValue initWithValue:]([KGUInt64PropertyValue alloc], "initWithValue:", sqlite3_column_int64(**(sqlite3_stmt ***)a3, 2));
        v14 = sqlite3_column_int64(**(sqlite3_stmt ***)a3, 0);
        v5[2](v5, v14, v6, &v17);
LABEL_12:

        break;
      default:
        break;
    }
  }
  while (!v17);

}

- (BOOL)setNodeProperties:(id)a3 forIdentifier:(unint64_t)a4 error:(id *)a5
{
  id v8;
  int v9;
  uint64_t v10;
  _QWORD v12[8];
  void **v13;
  void ***v14;
  uint64_t v15;
  int v16;
  _QWORD v17[6];
  __int128 v18;
  _BYTE v19[32];

  v8 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x6012000000;
  v17[3] = __Block_byref_object_copy__2138;
  v17[4] = __Block_byref_object_dispose__2139;
  v17[5] = &unk_1CA220A29;
  v18 = 0u;
  memset(v19, 0, 25);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  (*(void (**)(char *, unint64_t))(*((_QWORD *)self->_database + 45) + 24))((char *)self->_database + 360, a4);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__KGDatabase_setNodeProperties_forIdentifier_error___block_invoke;
  v12[3] = &unk_1E83E3888;
  v12[4] = self;
  v12[5] = v17;
  v12[6] = &v13;
  v12[7] = a4;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v12);
  v9 = *((_DWORD *)v14 + 6);
  if (a5 && v9)
  {
    if ((v9 - 2) > 8)
      v10 = -1;
    else
      v10 = qword_1CA1FE588[v9 - 2];
    kg_errorWithCode(v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(v17, 8);
  v13 = (void **)v19;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v13);

  return v9 == 0;
}

- (BOOL)addNodes:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  KGDatabase *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void **v16;
  void **v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  int inserted;
  NSObject *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  BOOL v38;
  id obj;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  char v50;
  uint8_t buf[16];
  __int128 v52;
  __int128 v53;
  char v54;
  uint64_t v55;
  __int128 *v56;
  __int128 *v57;
  char v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[24];
  void **v64;
  _BYTE v65[24];
  _BYTE *v66;
  _QWORD v67[3];
  char v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  memset(v63, 0, sizeof(v63));
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = a3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v60 != v6)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "labels");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[KGDatabase upsertLabels:](self, "upsertLabels:", v8);

        v47 = v55;
        v48 = 0u;
        v49 = 0u;
        std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v48 + 8, v56, v57, v57 - v56);
        v50 = v58;
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = v47;
        v52 = 0u;
        v53 = 0u;
        std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v52 + 8, *((__int128 **)&v48 + 1), (__int128 *)v49, (uint64_t)(v49 - *((_QWORD *)&v48 + 1)) >> 4);
        v54 = v50;
        v64 = (void **)&v48 + 1;
        std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v64);
        v9 = *(_QWORD *)&v63[8];
        if (*(_QWORD *)&v63[8] >= *(_QWORD *)&v63[16])
        {
          v12 = self;
          v13 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(_QWORD *)&v63[8] - *(_QWORD *)v63) >> 3);
          v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) > 0x492492492492492)
            std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
          if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*(_QWORD *)&v63[16] - *(_QWORD *)v63) >> 3) > v14)
            v14 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*(_QWORD *)&v63[16] - *(_QWORD *)v63) >> 3);
          if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(_QWORD *)&v63[16] - *(_QWORD *)v63) >> 3)) >= 0x249249249249249)
            v15 = 0x492492492492492;
          else
            v15 = v14;
          v66 = &v63[16];
          if (v15)
          {
            if (v15 > 0x492492492492492)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v16 = (void **)operator new(56 * v15);
          }
          else
          {
            v16 = 0;
          }
          v17 = &v16[7 * v13];
          v64 = v16;
          *(_QWORD *)v65 = v17;
          *(_QWORD *)&v65[8] = v17;
          *(_QWORD *)&v65[16] = &v16[7 * v15];
          *(_OWORD *)v17 = *(_OWORD *)buf;
          *((_OWORD *)v17 + 1) = 0u;
          *((_OWORD *)v17 + 2) = 0u;
          std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)v17 + 24, *((__int128 **)&v52 + 1), (__int128 *)v53, (uint64_t)(v53 - *((_QWORD *)&v52 + 1)) >> 4);
          LOBYTE(v16[7 * v13 + 6]) = v54;
          v18 = *(_QWORD *)v65;
          *(_QWORD *)&v65[8] += 56;
          v19 = *(_QWORD *)&v63[8];
          v20 = *(_QWORD *)v63;
          *(_QWORD *)&v70 = *(_QWORD *)v65;
          *((_QWORD *)&v70 + 1) = *(_QWORD *)v65;
          v69 = v70;
          v67[0] = &v63[16];
          v67[1] = &v69;
          v67[2] = &v70;
          v68 = 0;
          if (*(_QWORD *)&v63[8] != *(_QWORD *)v63)
          {
            v21 = *(_QWORD *)&v63[8];
            do
            {
              v22 = *(_OWORD *)(v21 - 56);
              v21 -= 56;
              *(_OWORD *)(v18 - 56) = v22;
              *(_OWORD *)(v18 - 40) = 0u;
              *(_OWORD *)(v18 - 24) = 0u;
              std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)(v18 - 32), *(__int128 **)(v21 + 24), *(__int128 **)(v21 + 32), (uint64_t)(*(_QWORD *)(v21 + 32) - *(_QWORD *)(v21 + 24)) >> 4);
              *(_BYTE *)(v18 - 8) = *(_BYTE *)(v19 - 8);
              v18 = *((_QWORD *)&v70 + 1) - 56;
              *((_QWORD *)&v70 + 1) -= 56;
              v19 = v21;
            }
            while (v21 != v20);
          }
          v68 = 1;
          std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<degas::NodeCreationRequest>,std::reverse_iterator<degas::NodeCreationRequest*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v67);
          v23 = *(_QWORD *)&v63[16];
          v42 = *(_QWORD *)&v65[8];
          v24 = *(_OWORD *)&v65[8];
          v25 = *(_OWORD *)v63;
          *(_QWORD *)v63 = v18;
          *(_OWORD *)v65 = v25;
          *(_OWORD *)&v63[8] = v24;
          *(_QWORD *)&v65[16] = v23;
          v64 = (void **)v25;
          std::__split_buffer<degas::NodeCreationRequest>::~__split_buffer((uint64_t)&v64);
          v11 = v42;
          self = v12;
        }
        else
        {
          v10 = (char *)(*(_QWORD *)&v63[8] + 24);
          **(_OWORD **)&v63[8] = *(_OWORD *)buf;
          *(_OWORD *)(v9 + 16) = 0u;
          *(_OWORD *)(v9 + 32) = 0u;
          std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>(v10, *((__int128 **)&v52 + 1), (__int128 *)v53, (uint64_t)(v53 - *((_QWORD *)&v52 + 1)) >> 4);
          *(_BYTE *)(v9 + 48) = v54;
          v11 = v9 + 56;
        }
        *(_QWORD *)&v63[8] = v11;
        v64 = (void **)&v52 + 1;
        std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v64);
        *(_QWORD *)buf = &v56;
        std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
    }
    while (v5);
  }

  inserted = degas::Database::insertNodes((degas::Database *)self->_database, (sqlite3_int64 **)v63);
  if (inserted)
  {
    KGLoggingConnection();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA0A5000, v27, OS_LOG_TYPE_ERROR, "Error adding nodes", buf, 2u);
    }

    if (a4)
    {
      if ((inserted - 2) > 8)
        v28 = -1;
      else
        v28 = qword_1CA1FE588[inserted - 2];
      kg_errorWithCode(v28);
      v38 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = 0;
    }
  }
  else
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v29 = obj;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v43, v71, 16);
    if (v30)
    {
      v31 = 0;
      v32 = *(_QWORD *)v44;
      while (2)
      {
        v33 = 0;
        v34 = 56 * v31;
        do
        {
          if (*(_QWORD *)v44 != v32)
            objc_enumerationMutation(v29);
          v35 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v33);
          v36 = *(_QWORD *)(*(_QWORD *)v63 + v34);
          objc_msgSend(v35, "resolveIdentifier:", v36);
          objc_msgSend(v35, "properties");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v36) = -[KGDatabase setNodeProperties:forIdentifier:error:](self, "setNodeProperties:forIdentifier:error:", v37, v36, a4);

          if ((v36 & 1) == 0)
          {
            v38 = 0;
            goto LABEL_41;
          }
          ++v33;
          v34 += 56;
        }
        while (v30 != v33);
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v43, v71, 16);
        v31 += v33;
        if (v30)
          continue;
        break;
      }
    }
    v38 = 1;
LABEL_41:

  }
  *(_QWORD *)buf = v63;
  std::vector<degas::NodeCreationRequest>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);

  return v38;
}

- (unint64_t)addNodeWithLabels:(id)a3 properties:(id)a4 error:(id *)a5
{
  id v8;
  int inserted;
  NSObject *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v14;
  __int128 v15;
  __int128 v16;
  char v17;
  unint64_t v18[6];
  char v19;
  unint64_t v20;
  __int128 *v21;
  __int128 *v22;
  char v23;
  _BYTE buf[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[KGDatabase upsertLabels:](self, "upsertLabels:", a3);
  v14 = v20;
  v15 = 0u;
  v16 = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v15 + 8, v21, v22, v22 - v21);
  v17 = v23;
  v18[0] = 0;
  v18[1] = v14;
  memset(&v18[2], 0, 32);
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v18[3], *((__int128 **)&v15 + 1), (__int128 *)v16, (uint64_t)(v16 - *((_QWORD *)&v15 + 1)) >> 4);
  v19 = v17;
  *(_QWORD *)buf = (char *)&v15 + 8;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  inserted = degas::Database::insertNode((degas::Database *)self->_database, (sqlite3_int64 *)v18);
  if (inserted)
  {
    KGLoggingConnection();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v18[0];
      _os_log_error_impl(&dword_1CA0A5000, v10, OS_LOG_TYPE_ERROR, "Error adding node for identifier \"%llu\", buf, 0xCu);
    }

    if (a5)
    {
      if ((inserted - 2) > 8)
        v11 = -1;
      else
        v11 = qword_1CA1FE588[inserted - 2];
      kg_errorWithCode(v11);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (-[KGDatabase setNodeProperties:forIdentifier:error:](self, "setNodeProperties:forIdentifier:error:", v8, v18[0], a5))
  {
    v12 = v18[0];
  }
  else
  {
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  *(_QWORD *)buf = &v18[3];
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  v18[0] = (unint64_t)&v21;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v18);

  return v12;
}

- (BOOL)setEdgeProperties:(id)a3 forIdentifier:(unint64_t)a4 error:(id *)a5
{
  id v8;
  int v9;
  int v10;
  uint64_t v11;
  _QWORD v13[8];
  void **v14;
  void ***v15;
  uint64_t v16;
  int v17;
  _QWORD v18[6];
  __int128 v19;
  _BYTE v20[32];

  v8 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x6012000000;
  v18[3] = __Block_byref_object_copy__2138;
  v18[4] = __Block_byref_object_dispose__2139;
  v18[5] = &unk_1CA220A29;
  v19 = 0u;
  memset(v20, 0, 25);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v9 = (*(uint64_t (**)(char *, unint64_t))(*((_QWORD *)self->_database + 52) + 24))((char *)self->_database + 416, a4);
  *((_DWORD *)v15 + 6) = v9;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__KGDatabase_setEdgeProperties_forIdentifier_error___block_invoke;
  v13[3] = &unk_1E83E3888;
  v13[4] = self;
  v13[5] = v18;
  v13[6] = &v14;
  v13[7] = a4;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v13);
  v10 = *((_DWORD *)v15 + 6);
  if (a5 && v10)
  {
    if ((v10 - 2) > 8)
      v11 = -1;
    else
      v11 = qword_1CA1FE588[v10 - 2];
    kg_errorWithCode(v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(v18, 8);
  v14 = (void **)v20;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v14);

  return v10 == 0;
}

- (BOOL)addEdges:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void **v18;
  void **v19;
  void **v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  int inserted;
  NSObject *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  BOOL v42;
  id *v44;
  id obj;
  uint64_t v46;
  uint64_t v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  char v56;
  uint8_t buf[16];
  __int128 v58;
  __int128 v59;
  char v60;
  __int128 v61;
  uint64_t v62;
  __int128 *v63;
  __int128 *v64;
  char v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[24];
  void **v71;
  _BYTE v72[24];
  _BYTE *v73;
  _QWORD v74[3];
  char v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v44 = a4;
  v80 = *MEMORY[0x1E0C80C00];
  memset(v70, 0, sizeof(v70));
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
  if (v4)
  {
    v47 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v67 != v47)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_msgSend(v6, "labels", v44);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[KGDatabase upsertLabels:](self, "upsertLabels:", v7);

        v53 = v62;
        v54 = 0u;
        v55 = 0u;
        std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v54 + 8, v63, v64, v64 - v63);
        v56 = v65;
        objc_msgSend(v6, "sourceNode");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "identifier");
        objc_msgSend(v6, "targetNode");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "identifier");
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = v53;
        v58 = 0u;
        v59 = 0u;
        std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v58 + 8, *((__int128 **)&v54 + 1), (__int128 *)v55, (uint64_t)(v55 - *((_QWORD *)&v54 + 1)) >> 4);
        v60 = v56;
        *(_QWORD *)&v61 = v9;
        *((_QWORD *)&v61 + 1) = v11;

        v71 = (void **)&v54 + 1;
        std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v71);
        v12 = *(_QWORD *)&v70[8];
        if (*(_QWORD *)&v70[8] >= *(_QWORD *)&v70[16])
        {
          v15 = 0x8E38E38E38E38E39 * ((uint64_t)(*(_QWORD *)&v70[8] - *(_QWORD *)v70) >> 3);
          v16 = v15 + 1;
          if (v15 + 1 > 0x38E38E38E38E38ELL)
            std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
          if (0x1C71C71C71C71C72 * ((uint64_t)(*(_QWORD *)&v70[16] - *(_QWORD *)v70) >> 3) > v16)
            v16 = 0x1C71C71C71C71C72 * ((uint64_t)(*(_QWORD *)&v70[16] - *(_QWORD *)v70) >> 3);
          if (0x8E38E38E38E38E39 * ((uint64_t)(*(_QWORD *)&v70[16] - *(_QWORD *)v70) >> 3) >= 0x1C71C71C71C71C7)
            v17 = 0x38E38E38E38E38ELL;
          else
            v17 = v16;
          v73 = &v70[16];
          if (v17)
          {
            if (v17 > 0x38E38E38E38E38ELL)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v18 = (void **)operator new(72 * v17);
          }
          else
          {
            v18 = 0;
          }
          v19 = &v18[9 * v15];
          v71 = v18;
          *(_QWORD *)v72 = v19;
          *(_QWORD *)&v72[8] = v19;
          *(_QWORD *)&v72[16] = &v18[9 * v17];
          *(_OWORD *)v19 = *(_OWORD *)buf;
          *((_OWORD *)v19 + 1) = 0u;
          *((_OWORD *)v19 + 2) = 0u;
          std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)v19 + 24, *((__int128 **)&v58 + 1), (__int128 *)v59, (uint64_t)(v59 - *((_QWORD *)&v58 + 1)) >> 4);
          v20 = &v18[9 * v15];
          *((_BYTE *)v20 + 48) = v60;
          *(_OWORD *)(v20 + 7) = v61;
          v21 = *(_QWORD *)v72;
          *(_QWORD *)&v72[8] += 72;
          v23 = *(_QWORD *)&v70[8];
          v22 = *(_QWORD *)v70;
          *(_QWORD *)&v77 = *(_QWORD *)v72;
          *((_QWORD *)&v77 + 1) = *(_QWORD *)v72;
          v76 = v77;
          v74[0] = &v70[16];
          v74[1] = &v76;
          v74[2] = &v77;
          v75 = 0;
          if (*(_QWORD *)&v70[8] != *(_QWORD *)v70)
          {
            v24 = *(_QWORD *)&v70[8];
            do
            {
              v25 = *(_OWORD *)(v24 - 72);
              v24 -= 72;
              *(_OWORD *)(v21 - 72) = v25;
              *(_OWORD *)(v21 - 56) = 0u;
              *(_OWORD *)(v21 - 40) = 0u;
              std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)(v21 - 48), *(__int128 **)(v24 + 24), *(__int128 **)(v24 + 32), (uint64_t)(*(_QWORD *)(v24 + 32) - *(_QWORD *)(v24 + 24)) >> 4);
              *(_BYTE *)(v21 - 24) = *(_BYTE *)(v23 - 24);
              *(_OWORD *)(v21 - 16) = *(_OWORD *)(v23 - 16);
              v21 = *((_QWORD *)&v77 + 1) - 72;
              *((_QWORD *)&v77 + 1) -= 72;
              v23 = v24;
            }
            while (v24 != v22);
          }
          v75 = 1;
          std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<degas::EdgeCreationRequest>,std::reverse_iterator<degas::EdgeCreationRequest*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v74);
          v26 = *(_QWORD *)&v70[16];
          v46 = *(_QWORD *)&v72[8];
          v27 = *(_OWORD *)&v72[8];
          v28 = *(_OWORD *)v70;
          *(_QWORD *)v70 = v21;
          *(_OWORD *)v72 = v28;
          *(_OWORD *)&v70[8] = v27;
          *(_QWORD *)&v72[16] = v26;
          v71 = (void **)v28;
          std::__split_buffer<degas::EdgeCreationRequest>::~__split_buffer((uint64_t)&v71);
          v14 = v46;
        }
        else
        {
          v13 = (char *)(*(_QWORD *)&v70[8] + 24);
          **(_OWORD **)&v70[8] = *(_OWORD *)buf;
          *(_OWORD *)(v12 + 16) = 0u;
          *(_OWORD *)(v12 + 32) = 0u;
          std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>(v13, *((__int128 **)&v58 + 1), (__int128 *)v59, (uint64_t)(v59 - *((_QWORD *)&v58 + 1)) >> 4);
          *(_BYTE *)(v12 + 48) = v60;
          *(_OWORD *)(v12 + 56) = v61;
          v14 = v12 + 72;
        }
        *(_QWORD *)&v70[8] = v14;
        v71 = (void **)&v58 + 1;
        std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v71);
        *(_QWORD *)buf = &v63;
        std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
    }
    while (v4);
  }

  inserted = degas::Database::insertEdges((degas::Database *)self->_database, (sqlite3_int64 **)v70);
  if (inserted)
  {
    KGLoggingConnection();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA0A5000, v30, OS_LOG_TYPE_ERROR, "Error adding edges", buf, 2u);
    }

    if (v44)
    {
      if ((inserted - 2) > 8)
        v31 = -1;
      else
        v31 = qword_1CA1FE588[inserted - 2];
      kg_errorWithCode(v31);
      v42 = 0;
      *v44 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v42 = 0;
    }
  }
  else
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v32 = obj;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v78, 16);
    if (v33)
    {
      v34 = 0;
      v35 = *(_QWORD *)v50;
      while (2)
      {
        v36 = 0;
        v37 = 72 * v34;
        do
        {
          if (*(_QWORD *)v50 != v35)
            objc_enumerationMutation(v32);
          v38 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v36);
          v39 = *(_QWORD *)(*(_QWORD *)v70 + v37);
          objc_msgSend(v38, "resolveIdentifier:", v39, v44);
          objc_msgSend(v38, "properties");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)objc_msgSend(v40, "mutableCopy");

          objc_msgSend(v41, "setObject:forKeyedSubscript:", 0, CFSTR("__weight"));
          LOBYTE(v39) = -[KGDatabase setEdgeProperties:forIdentifier:error:](self, "setEdgeProperties:forIdentifier:error:", v41, v39, v44);

          if ((v39 & 1) == 0)
          {
            v42 = 0;
            goto LABEL_41;
          }
          ++v36;
          v37 += 72;
        }
        while (v33 != v36);
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v78, 16);
        v34 += v36;
        if (v33)
          continue;
        break;
      }
    }
    v42 = 1;
LABEL_41:

  }
  *(_QWORD *)buf = v70;
  std::vector<degas::EdgeCreationRequest>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);

  return v42;
}

- (unint64_t)addEdgeWithLabels:(id)a3 properties:(id)a4 sourceNodeIdentifier:(unint64_t)a5 targetNodeIdentifier:(unint64_t)a6 error:(id *)a7
{
  id v12;
  int inserted;
  NSObject *v14;
  uint64_t v15;
  unint64_t v16;
  void **v18;
  __int128 v19;
  __int128 v20;
  char v21;
  void **v22[6];
  char v23;
  unint64_t v24;
  unint64_t v25;
  void **v26;
  __int128 *v27;
  __int128 *v28;
  char v29;
  _BYTE buf[24];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  -[KGDatabase upsertLabels:](self, "upsertLabels:", a3);
  v18 = v26;
  v19 = 0u;
  v20 = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v19 + 8, v27, v28, v28 - v27);
  v21 = v29;
  v22[0] = 0;
  v22[1] = v18;
  memset(&v22[2], 0, 32);
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v22[3], *((__int128 **)&v19 + 1), (__int128 *)v20, (uint64_t)(v20 - *((_QWORD *)&v19 + 1)) >> 4);
  v23 = v21;
  v24 = a5;
  v25 = a6;
  *(_QWORD *)buf = (char *)&v19 + 8;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  inserted = degas::Database::insertEdge((uint64_t)self->_database, (sqlite3_int64 *)v22);
  if (inserted)
  {
    KGLoggingConnection();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void ***)&buf[4] = v22[0];
      _os_log_error_impl(&dword_1CA0A5000, v14, OS_LOG_TYPE_ERROR, "Error adding edge for identifier \"%llu\", buf, 0xCu);
    }

    if (a7)
    {
      if ((inserted - 2) > 8)
        v15 = -1;
      else
        v15 = qword_1CA1FE588[inserted - 2];
      kg_errorWithCode(v15);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_12;
  }
  if (v12
    && !-[KGDatabase setEdgeProperties:forIdentifier:error:](self, "setEdgeProperties:forIdentifier:error:", v12, v22[0], a7))
  {
LABEL_12:
    v16 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_13;
  }
  v16 = (unint64_t)v22[0];
LABEL_13:
  *(_QWORD *)buf = &v22[3];
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  v22[0] = (void **)&v27;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v22);

  return v16;
}

- (BOOL)removeNode:(unint64_t)a3 error:(id *)a4
{
  int v5;
  int v6;
  uint64_t v7;

  v5 = degas::Database::removeNode((degas::Database *)self->_database, a3);
  v6 = v5;
  if (a4 && v5)
  {
    if ((v5 - 2) > 8)
      v7 = -1;
    else
      v7 = qword_1CA1FE588[v5 - 2];
    kg_errorWithCode(v7);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 == 0;
}

- (BOOL)removeEdge:(unint64_t)a3 error:(id *)a4
{
  int v5;
  int v6;
  uint64_t v7;

  v5 = degas::Database::removeEdge((degas::Database *)self->_database, a3, 0);
  v6 = v5;
  if (a4 && v5)
  {
    if ((v5 - 2) > 8)
      v7 = -1;
    else
      v7 = qword_1CA1FE588[v5 - 2];
    kg_errorWithCode(v7);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 == 0;
}

- (BOOL)removeNodes:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  int v8;
  uint64_t v9;

  v6 = a3;
  v7 = degas::Database::removeNodes((degas::Database *)self->_database, (Bitmap *)objc_msgSend(v6, "bitmap"));
  v8 = v7;
  if (a4 && v7)
  {
    if ((v7 - 2) > 8)
      v9 = -1;
    else
      v9 = qword_1CA1FE588[v7 - 2];
    kg_errorWithCode(v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8 == 0;
}

- (BOOL)removeEdges:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  int v8;
  uint64_t v9;

  v6 = a3;
  v7 = degas::Database::removeEdges((degas::Database *)self->_database, (Bitmap *)objc_msgSend(v6, "bitmap"));
  v8 = v7;
  if (a4 && v7)
  {
    if ((v7 - 2) > 8)
      v9 = -1;
    else
      v9 = qword_1CA1FE588[v7 - 2];
    kg_errorWithCode(v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8 == 0;
}

- (id)elementIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 valueTable:(const void *)a6 rowCount:(unint64_t)a7 error:(id *)a8
{
  id v14;
  id v15;
  sqlite3_int64 v16;
  uint64_t v17;
  NSObject *v18;
  KGElementIdentifierSet *v19;
  double v20;
  int v21;
  int v22;
  unsigned int v23;
  KGElementIdentifierSet *v24;
  uint64_t v26;
  const void *v27;
  unint64_t v28;
  __int128 v29;
  _BYTE v30[32];
  _BYTE __p[12];
  char v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = -[KGDatabase attributeIdentifierForPropertyName:](self, "attributeIdentifierForPropertyName:", v14);
  if (v16)
  {
    v29 = 0u;
    memset(v30, 0, 25);
    v17 = objc_msgSend(v15, "kgPropertyType");
    if (a5 >= 9)
      LODWORD(a5) = 1;
    v27 = a6;
    v28 = a7;
    switch(v17)
    {
      case 0:
        KGLoggingConnection();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__p = 138412290;
          *(_QWORD *)&__p[4] = v15;
          _os_log_error_impl(&dword_1CA0A5000, v18, OS_LOG_TYPE_ERROR, "unable to interpret value <%@> as valid property value", __p, 0xCu);
        }

        goto LABEL_17;
      case 1:
      case 4:
        v21 = degas::AttributeQuery::elementsForAttributeValue((uint64_t *)&v27, v16, objc_msgSend(v15, "longLongValue", v27, v28), a5, (degas::Bitmap *)&v29);
        goto LABEL_13;
      case 2:
        objc_msgSend(v15, "doubleValue", v27, v28);
        v21 = degas::AttributeQuery::elementsForAttributeValue((uint64_t *)&v27, v16, a5, (degas::Bitmap *)&v29, v20);
LABEL_13:
        v22 = v21;
        goto LABEL_14;
      case 3:
        stringNSToStd((NSString *)__p, v15);
        v22 = degas::AttributeQuery::elementsForAttributeValue((uint64_t *)&v27, v16, (uint64_t)__p, a5, (degas::Bitmap *)&v29);
        if (v32 < 0)
          operator delete(*(void **)__p);
LABEL_14:

        v23 = v22 - 2;
        if (v22 == 2)
          goto LABEL_17;
        if (v22)
        {
          if (a8)
          {
            if (v23 > 8)
              v26 = -1;
            else
              v26 = qword_1CA1FE588[v23];
            kg_errorWithCode(v26);
            v19 = 0;
            *a8 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v19 = 0;
          }
        }
        else
        {
          v24 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v29);
LABEL_18:
          v19 = v24;
        }
        *(_QWORD *)__p = v30;
        std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
        break;
      default:
LABEL_17:
        v24 = objc_alloc_init(KGElementIdentifierSet);
        goto LABEL_18;
    }
  }
  else
  {
    v19 = objc_alloc_init(KGElementIdentifierSet);
  }

  return v19;
}

- (id)nodeIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a3;
  v11 = a4;
  -[KGDatabase elementIdentifiersForPropertyName:value:comparator:valueTable:rowCount:error:](self, "elementIdentifiersForPropertyName:value:comparator:valueTable:rowCount:error:", v10, v11, a5, (char *)self->_database + 472, degas::Database::nodeCount((degas::Database *)self->_database), a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)tombstoneNodeIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 error:(id *)a6
{
  -[KGDatabase elementIdentifiersForPropertyName:value:comparator:valueTable:rowCount:error:](self, "elementIdentifiersForPropertyName:value:comparator:valueTable:rowCount:error:", a3, a4, a5, (char *)self->_database + 1032, 0, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)elementIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 valueTable:(const void *)a7 rowCount:(unint64_t)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  sqlite3_int64 v18;
  uint64_t v19;
  int v20;
  KGElementIdentifierSet *v21;
  id v22;
  id v23;
  id v24;
  int v25;
  NSObject *v26;
  id v27;
  id v28;
  double v29;
  double v30;
  double v31;
  unsigned int v32;
  KGElementIdentifierSet *v33;
  uint64_t v34;
  void *__p[2];
  char v37;
  uint64_t v38[2];
  __int128 v39;
  uint8_t v40[32];
  _BYTE buf[12];
  char v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = -[KGDatabase attributeIdentifierForPropertyName:](self, "attributeIdentifierForPropertyName:", v15);
  if (v18)
  {
    v39 = 0u;
    memset(v40, 0, 25);
    v19 = objc_msgSend(v16, "kgPropertyType");
    if (v19 == objc_msgSend(v17, "kgPropertyType"))
    {
      if (a6 >= 9)
        LODWORD(a6) = 1;
      v38[0] = (uint64_t)a7;
      v38[1] = a8;
      switch(v19)
      {
        case 0:
          KGLoggingConnection();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v16;
            _os_log_error_impl(&dword_1CA0A5000, v26, OS_LOG_TYPE_ERROR, "unable to interpret value <%@> as valid property value", buf, 0xCu);
          }

          goto LABEL_24;
        case 1:
        case 4:
          v20 = degas::AttributeQuery::elementsForAttributeValueRange(v38, v18, objc_msgSend(v16, "longLongValue"), objc_msgSend(v17, "longLongValue"), a6, (degas::Bitmap *)&v39);
          goto LABEL_20;
        case 2:
          v27 = v16;
          v28 = v17;
          objc_msgSend(v27, "doubleValue");
          v30 = v29;
          objc_msgSend(v28, "doubleValue");
          v20 = degas::AttributeQuery::elementsForAttributeValueRange(v38, v18, a6, (degas::Bitmap *)&v39, v30, v31);
LABEL_20:
          v25 = v20;
          goto LABEL_21;
        case 3:
          v23 = v16;
          v24 = v17;
          stringNSToStd((NSString *)buf, v23);
          stringNSToStd(__p, v24);
          v25 = degas::AttributeQuery::elementsForAttributeValueRange(v38, v18, (uint64_t)buf, (uint64_t)__p, a6, (degas::Bitmap *)&v39);
          if (v37 < 0)
            operator delete(__p[0]);
          if (v42 < 0)
            operator delete(*(void **)buf);
LABEL_21:

          v32 = v25 - 2;
          if (v25 == 2)
            goto LABEL_24;
          if (!v25)
          {
            v33 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v39);
LABEL_25:
            v21 = v33;
            goto LABEL_33;
          }
          if (!a9)
            goto LABEL_32;
          if (v32 > 8)
            v34 = -1;
          else
            v34 = qword_1CA1FE588[v32];
          kg_errorWithCode(v34);
          v22 = (id)objc_claimAutoreleasedReturnValue();
          break;
        default:
LABEL_24:
          v33 = objc_alloc_init(KGElementIdentifierSet);
          goto LABEL_25;
      }
      goto LABEL_11;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "selecting in a range with mismatched types", buf, 2u);
      if (a9)
        goto LABEL_10;
    }
    else if (a9)
    {
LABEL_10:
      kg_errorWithCode(5004);
      v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
      v21 = 0;
      *a9 = v22;
LABEL_33:
      *(_QWORD *)buf = v40;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
      goto LABEL_34;
    }
LABEL_32:
    v21 = 0;
    goto LABEL_33;
  }
  v21 = objc_alloc_init(KGElementIdentifierSet);
LABEL_34:

  return v21;
}

- (id)nodeIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  -[KGDatabase elementIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:valueTable:rowCount:error:](self, "elementIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:valueTable:rowCount:error:", v12, v13, v14, a6, (char *)self->_database + 472, degas::Database::nodeCount((degas::Database *)self->_database), a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)tombstoneNodeIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 error:(id *)a7
{
  -[KGDatabase elementIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:valueTable:rowCount:error:](self, "elementIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:valueTable:rowCount:error:", a3, a4, a5, a6, (char *)self->_database + 1032, 0, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)distributeValuesByType:(id)a3 toIntegerValues:(id)a4 floatValues:(id)a5 stringValues:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v14)
  {
    v16 = *(_QWORD *)v22;
    *(_QWORD *)&v15 = 138412290;
    v20 = v15;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        switch(objc_msgSend(v18, "kgPropertyType", v20, (_QWORD)v21))
        {
          case 0:
            KGLoggingConnection();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v20;
              v26 = v18;
              _os_log_error_impl(&dword_1CA0A5000, v19, OS_LOG_TYPE_ERROR, "unable to interpret value <%@> as valid property value", buf, 0xCu);
            }
            goto LABEL_12;
          case 1:
          case 4:
            v19 = v18;
            objc_msgSend(v10, "addObject:", v19);
            goto LABEL_12;
          case 2:
            v19 = v18;
            objc_msgSend(v11, "addObject:", v19);
            goto LABEL_12;
          case 3:
            v19 = v18;
            objc_msgSend(v12, "addObject:", v19);
LABEL_12:

            break;
          default:
            continue;
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v14);
  }

}

- (id)elementIdentifiersForPropertyName:(id)a3 values:(id)a4 valueTable:(const void *)a5 rowCount:(unint64_t)a6 error:(id *)a7
{
  id v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void **v17;
  size_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  size_t v25;
  void *v26;
  unint64_t v27;
  int v28;
  uint64_t v29;
  KGElementIdentifierSet *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  id *v34;
  uint64_t v35;
  char *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  int v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  id *v46;
  uint64_t v47;
  char *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  uint64_t v54;
  int v55;
  uint64_t v57;
  const void *v58;
  id *v59;
  sqlite3_int64 v60;
  uint64_t *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  void **v79[2];
  __int128 v80;
  _BYTE v81[32];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v66 = a4;
  v63 = v12;
  v13 = -[KGDatabase attributeIdentifierForPropertyName:](self, "attributeIdentifierForPropertyName:", v12);
  if (v13)
  {
    v80 = 0u;
    memset(v81, 0, 25);
    v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v65 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v62 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[KGDatabase distributeValuesByType:toIntegerValues:floatValues:stringValues:](self, "distributeValuesByType:toIntegerValues:floatValues:stringValues:", v66, v65);
    v79[0] = (void **)a5;
    v79[1] = (void **)a6;
    v14 = objc_msgSend(v64, "count");
    v60 = v13;
    if (!v14)
      goto LABEL_21;
    v58 = a5;
    v59 = a7;
    v61 = &v57;
    v57 = v14;
    MEMORY[0x1E0C80A78](v14, v15);
    v17 = (void **)((char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (v16 >= 0x200)
      v18 = 512;
    else
      v18 = v16;
    bzero((char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v18);
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v19 = v64;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
    if (v20)
    {
      v21 = 0;
      v22 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v76 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
          v25 = objc_msgSend(v24, "lengthOfBytesUsingEncoding:", 4) + 1;
          v26 = malloc_type_malloc(v25, 0x8A3B8D30uLL);
          *(&v17[v21] + i) = v26;
          objc_msgSend(v24, "getCString:maxLength:encoding:", v26, v25, 4);
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
        v21 += i;
      }
      while (v20);
    }

    a7 = v59;
    v27 = v57;
    v28 = degas::implElementsForAttributeValues<char const*>(v60, v17, v57, 1, (degas::Bitmap *)&v80, (uint64_t)v58);
    if (v27 <= 1)
      v27 = 1;
    do
    {
      free(*v17);
      *v17++ = 0;
      --v27;
    }
    while (v27);
    if ((v28 & 0xFFFFFFFD) != 0)
    {
      if (a7)
      {
        if ((v28 - 2) > 8)
          v29 = -1;
        else
          v29 = qword_1CA1FE588[v28 - 2];
LABEL_49:
        kg_errorWithCode(v29);
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
LABEL_21:
      v31 = objc_msgSend(v65, "count");
      v33 = v31;
      if (!v31)
        goto LABEL_33;
      v34 = a7;
      v61 = &v57;
      MEMORY[0x1E0C80A78](v31, v32);
      v36 = (char *)&v57 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v37 = v65;
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
      if (v38)
      {
        v39 = 0;
        v40 = *(_QWORD *)v72;
        do
        {
          for (j = 0; j != v38; ++j)
          {
            if (*(_QWORD *)v72 != v40)
              objc_enumerationMutation(v37);
            *(_QWORD *)&v36[8 * v39 + 8 * j] = objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * j), "longLongValue");
          }
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
          v39 += j;
        }
        while (v38);
      }

      a7 = v34;
      v42 = degas::AttributeQuery::elementsForAttributeValues((uint64_t *)v79, v60, v36, v33, 1, (degas::Bitmap *)&v80);
      if ((v42 & 0xFFFFFFFD) != 0)
      {
        if (v34)
        {
          if ((v42 - 2) > 8)
            v29 = -1;
          else
            v29 = qword_1CA1FE588[v42 - 2];
          goto LABEL_49;
        }
      }
      else
      {
LABEL_33:
        v43 = objc_msgSend(v62, "count");
        v45 = v43;
        if (!v43)
          goto LABEL_46;
        v46 = a7;
        v61 = &v57;
        MEMORY[0x1E0C80A78](v43, v44);
        v48 = (char *)&v57 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v49 = v62;
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
        if (v50)
        {
          v51 = 0;
          v52 = *(_QWORD *)v68;
          do
          {
            for (k = 0; k != v50; ++k)
            {
              if (*(_QWORD *)v68 != v52)
                objc_enumerationMutation(v49);
              objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * k), "doubleValue");
              *(_QWORD *)&v48[8 * v51 + 8 * k] = v54;
            }
            v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
            v51 += k;
          }
          while (v50);
        }

        a7 = v46;
        v55 = degas::AttributeQuery::elementsForAttributeValues((uint64_t *)v79, v60, v48, v45, 1, (degas::Bitmap *)&v80);
        if ((v55 & 0xFFFFFFFD) == 0)
        {
LABEL_46:
          v30 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v80);
LABEL_51:

          v79[0] = (void **)v81;
          std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v79);
          goto LABEL_52;
        }
        if (v46)
        {
          if ((v55 - 2) > 8)
            v29 = -1;
          else
            v29 = qword_1CA1FE588[v55 - 2];
          goto LABEL_49;
        }
      }
    }
    v30 = 0;
    goto LABEL_51;
  }
  v30 = objc_alloc_init(KGElementIdentifierSet);
LABEL_52:

  return v30;
}

- (id)nodeIdentifiersForPropertyName:(id)a3 values:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  -[KGDatabase elementIdentifiersForPropertyName:values:valueTable:rowCount:error:](self, "elementIdentifiersForPropertyName:values:valueTable:rowCount:error:", v8, v9, (char *)self->_database + 472, degas::Database::nodeCount((degas::Database *)self->_database), a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)tombstoneNodeIdentifiersForPropertyName:(id)a3 values:(id)a4 error:(id *)a5
{
  -[KGDatabase elementIdentifiersForPropertyName:values:valueTable:rowCount:error:](self, "elementIdentifiersForPropertyName:values:valueTable:rowCount:error:", a3, a4, (char *)self->_database + 1032, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)filterElementIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 elementIdentifiers:(id)a6 valueTable:(const void *)a7 rowCount:(unint64_t)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  KGElementIdentifierSet *v18;
  sqlite3_int64 v19;
  uint64_t v20;
  id v21;
  int v22;
  NSObject *v23;
  KGElementIdentifierSet *v24;
  NSObject *v25;
  double v26;
  int v27;
  int v28;
  unsigned int v29;
  KGElementIdentifierSet *v30;
  uint64_t v32;
  const void *v33;
  unint64_t v34;
  _BYTE __p[12];
  char v36;
  uint8_t buf[16];
  _BYTE v38[40];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a6;
  if (a5 == 8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[KGDatabase filterNodeIdentifiersForPropertyName:values:comparator:nodeIdentifiers:error:](self, "filterNodeIdentifiersForPropertyName:values:comparator:nodeIdentifiers:error:", v15, v16, 8, v17, a9);
      v18 = (KGElementIdentifierSet *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      KGLoggingConnection();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v16;
        _os_log_error_impl(&dword_1CA0A5000, v23, OS_LOG_TYPE_ERROR, "Case insensitive In expects an array of values, not %@", buf, 0xCu);
      }

      v18 = objc_alloc_init(KGElementIdentifierSet);
    }
    goto LABEL_14;
  }
  v19 = -[KGDatabase attributeIdentifierForPropertyName:](self, "attributeIdentifierForPropertyName:", v15);
  if (!v19)
  {
    v18 = objc_alloc_init(KGElementIdentifierSet);
LABEL_14:
    v24 = v18;
    goto LABEL_31;
  }
  *(_OWORD *)buf = 0u;
  memset(v38, 0, 25);
  v20 = objc_msgSend(v16, "kgPropertyType");
  if (a5 >= 8)
    LODWORD(a5) = 1;
  v33 = a7;
  v34 = a8;
  switch(v20)
  {
    case 0:
      KGLoggingConnection();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__p = 138412290;
        *(_QWORD *)&__p[4] = v16;
        _os_log_error_impl(&dword_1CA0A5000, v25, OS_LOG_TYPE_ERROR, "unable to interpret value <%@> as valid property value", __p, 0xCu);
      }

      goto LABEL_28;
    case 1:
    case 4:
      v21 = v16;
      if (v17)
        v22 = degas::AttributeQuery::filterElementsForAttributeValue((uint64_t *)&v33, v19, objc_msgSend(v21, "longLongValue", v33, v34), a5, (Bitmap *)objc_msgSend(v17, "bitmap"), (degas::AggregateValueCursor *)buf);
      else
        v22 = degas::AttributeQuery::elementsForAttributeValue((uint64_t *)&v33, v19, objc_msgSend(v21, "longLongValue", v33, v34), a5, (degas::Bitmap *)buf);
      goto LABEL_24;
    case 2:
      objc_msgSend(v16, "doubleValue", v33, v34);
      if (v17)
        v22 = degas::AttributeQuery::filterElementsForAttributeValue((uint64_t *)&v33, v19, a5, (Bitmap *)objc_msgSend(v17, "bitmap"), (degas::AggregateValueCursor *)buf, v26);
      else
        v22 = degas::AttributeQuery::elementsForAttributeValue((uint64_t *)&v33, v19, a5, (degas::Bitmap *)buf, v26);
LABEL_24:
      v28 = v22;
      goto LABEL_25;
    case 3:
      stringNSToStd((NSString *)__p, v16);
      if (v17)
        v27 = degas::AttributeQuery::filterElementsForAttributeValue((uint64_t *)&v33, v19, (uint64_t)__p, a5, (Bitmap *)objc_msgSend(v17, "bitmap", v33, v34), (degas::AggregateValueCursor *)buf);
      else
        v27 = degas::AttributeQuery::elementsForAttributeValue((uint64_t *)&v33, v19, (uint64_t)__p, a5, (degas::Bitmap *)buf);
      v28 = v27;
      if (v36 < 0)
        operator delete(*(void **)__p);
LABEL_25:

      v29 = v28 - 2;
      if (v28 == 2)
        goto LABEL_28;
      if (v28)
      {
        if (a9)
        {
          if (v29 > 8)
            v32 = -1;
          else
            v32 = qword_1CA1FE588[v29];
          kg_errorWithCode(v32);
          v24 = 0;
          *a9 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v24 = 0;
        }
      }
      else
      {
        v30 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", buf);
LABEL_29:
        v24 = v30;
      }
      *(_QWORD *)__p = v38;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
      break;
    default:
LABEL_28:
      v30 = objc_alloc_init(KGElementIdentifierSet);
      goto LABEL_29;
  }
LABEL_31:

  return v24;
}

- (id)filterNodeIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 nodeIdentifiers:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  -[KGDatabase filterElementIdentifiersForPropertyName:value:comparator:elementIdentifiers:valueTable:rowCount:error:](self, "filterElementIdentifiersForPropertyName:value:comparator:elementIdentifiers:valueTable:rowCount:error:", v12, v13, a5, v14, (char *)self->_database + 472, degas::Database::nodeCount((degas::Database *)self->_database), a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)filterTombstoneNodeIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 nodeIdentifiers:(id)a6 error:(id *)a7
{
  -[KGDatabase filterElementIdentifiersForPropertyName:value:comparator:elementIdentifiers:valueTable:rowCount:error:](self, "filterElementIdentifiersForPropertyName:value:comparator:elementIdentifiers:valueTable:rowCount:error:", a3, a4, a5, a6, (char *)self->_database + 1032, 1000, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)filterElementIdentifiersForPropertyName:(id)a3 values:(id)a4 comparator:(unint64_t)a5 elementIdentifiers:(id)a6 valueTable:(const void *)a7 rowCount:(unint64_t)a8 error:(id *)a9
{
  id v15;
  sqlite3_int64 v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  size_t v26;
  void *v27;
  int v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  char *v40;
  int v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  uint64_t v50;
  char *v51;
  int v52;
  uint64_t v53;
  KGElementIdentifierSet *v54;
  id v55;
  unint64_t v57;
  const void *v58;
  unint64_t v59;
  sqlite3_int64 v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  void **v79[2];
  __int128 v80;
  _BYTE v81[32];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v63 = a4;
  v64 = a6;
  v61 = v15;
  v16 = -[KGDatabase attributeIdentifierForPropertyName:](self, "attributeIdentifierForPropertyName:", v15);
  v80 = 0u;
  memset(v81, 0, 25);
  v65 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v66 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v62 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[KGDatabase distributeValuesByType:toIntegerValues:floatValues:stringValues:](self, "distributeValuesByType:toIntegerValues:floatValues:stringValues:", v63, v66);
  v79[0] = (void **)a7;
  v79[1] = (void **)a8;
  v17 = objc_msgSend(v65, "count");
  v18 = v17;
  if (v17)
  {
    v58 = a7;
    v59 = a5;
    v57 = a8;
    if (v17 >> 61)
      std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
    v60 = v16;
    v19 = (char *)operator new(8 * v17);
    bzero(v19, 8 * v18);
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v20 = v65;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
    if (v21)
    {
      v22 = 0;
      v23 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v76 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
          v26 = objc_msgSend(v25, "lengthOfBytesUsingEncoding:", 4) + 1;
          v27 = malloc_type_malloc(v26, 0xAFA670D0uLL);
          *(_QWORD *)&v19[8 * v22 + 8 * i] = v27;
          objc_msgSend(v25, "getCString:maxLength:encoding:", v27, v26, 4);
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
        v22 += i;
      }
      while (v21);
    }

    v16 = v60;
    if (v59 >= 9)
      v28 = 1;
    else
      v28 = v59;
    if (v64)
      v29 = degas::implFilterElementsForAttributeValues<char const*>(v60, v19, v18, v28, (Bitmap *)objc_msgSend(v64, "bitmap"), (degas::AggregateValueCursor *)&v80, (uint64_t)v58, v57);
    else
      v29 = degas::implElementsForAttributeValues<char const*>(v60, v19, v18, v28, (degas::Bitmap *)&v80, (uint64_t)v58);
    v30 = v29;
    v31 = 0;
    if (v18 <= 1)
      v18 = 1;
    do
    {
      free(*(void **)&v19[8 * v31]);
      *(_QWORD *)&v19[8 * v31++] = 0;
    }
    while (v18 != v31);
    if ((v30 & 0xFFFFFFFD) != 0)
    {
      if (a9)
      {
        if ((v30 - 2) > 8)
          v32 = -1;
        else
          v32 = qword_1CA1FE588[v30 - 2];
        kg_errorWithCode(v32);
        *a9 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_69;
    }
    operator delete(v19);
  }
  v33 = objc_msgSend(v66, "count");
  v34 = v33;
  if (v33)
  {
    if (v33 >> 61)
      std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
    v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(v33);
    bzero(v19, 8 * v34);
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v35 = v66;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
    if (v36)
    {
      v37 = 0;
      v38 = *(_QWORD *)v72;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v72 != v38)
            objc_enumerationMutation(v35);
          *(_QWORD *)&v19[8 * v37 + 8 * j] = objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * j), "longLongValue");
        }
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
        v37 += j;
      }
      while (v36);
    }

    v40 = &v19[8 * v34];
    if (v64)
      v41 = degas::AttributeQuery::filterElementsForAttributeValues((uint64_t *)v79, v16, v19, (unint64_t)(v40 - v19) >> 3, 1, (Bitmap *)objc_msgSend(v64, "bitmap"), (degas::AggregateValueCursor *)&v80);
    else
      v41 = degas::AttributeQuery::elementsForAttributeValues((uint64_t *)v79, v16, v19, (unint64_t)(v40 - v19) >> 3, 1, (degas::Bitmap *)&v80);
    if ((v41 & 0xFFFFFFFD) != 0)
    {
      if (!a9)
        goto LABEL_68;
      if ((v41 - 2) > 8)
        v42 = -1;
      else
        v42 = qword_1CA1FE588[v41 - 2];
      kg_errorWithCode(v42);
      v55 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    }
    if (v19)
      operator delete(v19);
  }
  v43 = objc_msgSend(v62, "count");
  v44 = v43;
  if (v43)
  {
    if (v43 >> 61)
      std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
    v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(v43);
    bzero(v19, 8 * v44);
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v45 = v62;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
    if (v46)
    {
      v47 = 0;
      v48 = *(_QWORD *)v68;
      do
      {
        for (k = 0; k != v46; ++k)
        {
          if (*(_QWORD *)v68 != v48)
            objc_enumerationMutation(v45);
          objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * k), "doubleValue");
          *(_QWORD *)&v19[8 * v47 + 8 * k] = v50;
        }
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
        v47 += k;
      }
      while (v46);
    }

    v51 = &v19[8 * v44];
    if (v64)
      v52 = degas::AttributeQuery::filterElementsForAttributeValues((uint64_t *)v79, v16, v19, (unint64_t)(v51 - v19) >> 3, 1, (Bitmap *)objc_msgSend(v64, "bitmap"), (degas::AggregateValueCursor *)&v80);
    else
      v52 = degas::AttributeQuery::elementsForAttributeValues((uint64_t *)v79, v16, v19, (unint64_t)(v51 - v19) >> 3, 1, (degas::Bitmap *)&v80);
    if ((v52 & 0xFFFFFFFD) != 0)
    {
      if (!a9)
        goto LABEL_68;
      if ((v52 - 2) > 8)
        v53 = -1;
      else
        v53 = qword_1CA1FE588[v52 - 2];
      kg_errorWithCode(v53);
      v55 = (id)objc_claimAutoreleasedReturnValue();
LABEL_67:
      *a9 = v55;
LABEL_68:
      if (!v19)
      {
LABEL_70:
        v54 = 0;
        goto LABEL_71;
      }
LABEL_69:
      operator delete(v19);
      goto LABEL_70;
    }
    if (v19)
      operator delete(v19);
  }
  v54 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v80);
LABEL_71:

  v79[0] = (void **)v81;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v79);

  return v54;
}

- (id)filterNodeIdentifiersForPropertyName:(id)a3 values:(id)a4 comparator:(unint64_t)a5 nodeIdentifiers:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  -[KGDatabase filterElementIdentifiersForPropertyName:values:comparator:elementIdentifiers:valueTable:rowCount:error:](self, "filterElementIdentifiersForPropertyName:values:comparator:elementIdentifiers:valueTable:rowCount:error:", v12, v13, a5, v14, (char *)self->_database + 472, degas::Database::nodeCount((degas::Database *)self->_database), a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)filterTombstoneNodeIdentifiersForPropertyName:(id)a3 values:(id)a4 comparator:(unint64_t)a5 nodeIdentifiers:(id)a6 error:(id *)a7
{
  -[KGDatabase filterElementIdentifiersForPropertyName:values:comparator:elementIdentifiers:valueTable:rowCount:error:](self, "filterElementIdentifiersForPropertyName:values:comparator:elementIdentifiers:valueTable:rowCount:error:", a3, a4, a5, a6, (char *)self->_database + 1032, 1000, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)filterElementIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 elementIdentifiers:(id)a7 valueTable:(const void *)a8 rowCount:(unint64_t)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  sqlite3_int64 v20;
  uint64_t v21;
  id v22;
  id v23;
  int v24;
  KGElementIdentifierSet *v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  double v30;
  double v31;
  double v32;
  id v33;
  id v34;
  int v35;
  int v36;
  unsigned int v37;
  KGElementIdentifierSet *v38;
  uint64_t v39;
  void *__p[2];
  char v42;
  uint64_t v43[2];
  __int128 v44;
  uint8_t v45[32];
  _BYTE buf[12];
  char v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v20 = -[KGDatabase attributeIdentifierForPropertyName:](self, "attributeIdentifierForPropertyName:", v16);
  if (v20)
  {
    v44 = 0u;
    memset(v45, 0, 25);
    v21 = objc_msgSend(v17, "kgPropertyType");
    if (v21 == objc_msgSend(v18, "kgPropertyType"))
    {
      if (a6 >= 9)
        LODWORD(a6) = 1;
      v43[0] = (uint64_t)a8;
      v43[1] = a9;
      switch(v21)
      {
        case 0:
          KGLoggingConnection();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v17;
            _os_log_error_impl(&dword_1CA0A5000, v27, OS_LOG_TYPE_ERROR, "unable to interpret value <%@> as valid property value", buf, 0xCu);
          }

          goto LABEL_26;
        case 1:
        case 4:
          v22 = v17;
          v23 = v18;
          if (v19)
            v24 = degas::AttributeQuery::filterElementsForAttributeValueRange(v43, v20, objc_msgSend(v22, "longLongValue", v22), objc_msgSend(v23, "longLongValue"), a6, (Bitmap *)objc_msgSend(v19, "bitmap"), (degas::AggregateValueCursor *)&v44);
          else
            v24 = degas::AttributeQuery::elementsForAttributeValueRange(v43, v20, objc_msgSend(v22, "longLongValue", v22), objc_msgSend(v23, "longLongValue"), a6, (degas::Bitmap *)&v44);
          goto LABEL_22;
        case 2:
          v28 = v17;
          v29 = v18;
          objc_msgSend(v28, "doubleValue");
          v31 = v30;
          objc_msgSend(v29, "doubleValue");
          if (v19)
            v24 = degas::AttributeQuery::filterElementsForAttributeValueRange(v43, v20, a6, (Bitmap *)objc_msgSend(v19, "bitmap"), (degas::AggregateValueCursor *)&v44, v31, v32);
          else
            v24 = degas::AttributeQuery::elementsForAttributeValueRange(v43, v20, a6, (degas::Bitmap *)&v44, v31, v32);
LABEL_22:
          v36 = v24;
          goto LABEL_23;
        case 3:
          v33 = v17;
          v34 = v18;
          stringNSToStd((NSString *)buf, v33);
          stringNSToStd(__p, v34);
          if (v19)
            v35 = degas::AttributeQuery::filterElementsForAttributeValueRange(v43, v20, (uint64_t)buf, (uint64_t)__p, a6, (Bitmap *)objc_msgSend(v19, "bitmap"), (degas::AggregateValueCursor *)&v44);
          else
            v35 = degas::AttributeQuery::elementsForAttributeValueRange(v43, v20, (uint64_t)buf, (uint64_t)__p, a6, (degas::Bitmap *)&v44);
          v36 = v35;
          if (v42 < 0)
            operator delete(__p[0]);
          if (v47 < 0)
            operator delete(*(void **)buf);
LABEL_23:

          v37 = v36 - 2;
          if (v36 == 2)
            goto LABEL_26;
          if (!v36)
          {
            v38 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v44);
LABEL_27:
            v25 = v38;
            goto LABEL_40;
          }
          if (!a10)
            goto LABEL_39;
          if (v37 > 8)
            v39 = -1;
          else
            v39 = qword_1CA1FE588[v37];
          kg_errorWithCode(v39);
          v26 = (id)objc_claimAutoreleasedReturnValue();
          break;
        default:
LABEL_26:
          v38 = objc_alloc_init(KGElementIdentifierSet);
          goto LABEL_27;
      }
      goto LABEL_12;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "selecting in a range with mismatched types", buf, 2u);
      if (a10)
        goto LABEL_11;
    }
    else if (a10)
    {
LABEL_11:
      kg_errorWithCode(5004);
      v26 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
      v25 = 0;
      *a10 = v26;
LABEL_40:
      *(_QWORD *)buf = v45;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
      goto LABEL_41;
    }
LABEL_39:
    v25 = 0;
    goto LABEL_40;
  }
  v25 = objc_alloc_init(KGElementIdentifierSet);
LABEL_41:

  return v25;
}

- (id)filterNodeIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 nodeIdentifiers:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  -[KGDatabase filterElementIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:elementIdentifiers:valueTable:rowCount:error:](self, "filterElementIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:elementIdentifiers:valueTable:rowCount:error:", v14, v15, v16, a6, v17, (char *)self->_database + 472, degas::Database::nodeCount((degas::Database *)self->_database), a8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)filterTombstoneNodeIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 nodeIdentifiers:(id)a7 error:(id *)a8
{
  -[KGDatabase filterElementIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:elementIdentifiers:valueTable:rowCount:error:](self, "filterElementIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:elementIdentifiers:valueTable:rowCount:error:", a3, a4, a5, a6, a7, (char *)self->_database + 1032, 1000, a8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)nodeIdentifiersSortedByPropertyForName:(id)a3 dataType:(int64_t)a4 ascending:(BOOL)a5 limit:(int64_t)a6 nodeIdentifiers:(id)a7 error:(id *)a8
{
  _BOOL4 v11;
  id v14;
  id v15;
  id v16;
  sqlite3_int64 v17;
  int v18;
  void *database;
  Bitmap *v20;
  _QWORD *v21;
  void *v22;
  Bitmap *v23;
  void *v24;
  Bitmap *v25;
  uint64_t v26;
  id v27;
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];

  v11 = a5;
  v14 = a3;
  v15 = a7;
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = -[KGDatabase attributeIdentifierForPropertyName:](self, "attributeIdentifierForPropertyName:", v14);
  v18 = 6;
  switch(a4)
  {
    case 0:
      goto LABEL_6;
    case 1:
    case 4:
      database = self->_database;
      v20 = (Bitmap *)objc_msgSend(v15, "bitmap");
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __100__KGDatabase_nodeIdentifiersSortedByPropertyForName_dataType_ascending_limit_nodeIdentifiers_error___block_invoke;
      v31[3] = &unk_1E83E38B0;
      v31[4] = v16;
      v18 = degas::Database::sortNodesByIntAttribute((uint64_t)database, v17, v11, a6, v20, (uint64_t)v31);
      v21 = v31;
      goto LABEL_5;
    case 2:
      v22 = self->_database;
      v23 = (Bitmap *)objc_msgSend(v15, "bitmap");
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __100__KGDatabase_nodeIdentifiersSortedByPropertyForName_dataType_ascending_limit_nodeIdentifiers_error___block_invoke_2;
      v30[3] = &unk_1E83E38D8;
      v30[4] = v16;
      v18 = degas::Database::sortNodesByRealAttribute((uint64_t)v22, v17, v11, a6, v23, (uint64_t)v30);
      v21 = v30;
      goto LABEL_5;
    case 3:
      v24 = self->_database;
      v25 = (Bitmap *)objc_msgSend(v15, "bitmap");
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __100__KGDatabase_nodeIdentifiersSortedByPropertyForName_dataType_ascending_limit_nodeIdentifiers_error___block_invoke_3;
      v29[3] = &unk_1E83E3900;
      v29[4] = v16;
      v18 = degas::Database::sortNodesByStringAttribute((uint64_t)v24, v17, v11, a6, v25, (uint64_t)v29);
      v21 = v29;
LABEL_5:

      if (!v18)
        goto LABEL_9;
LABEL_6:
      if (a8)
      {
        if ((v18 - 2) > 8)
          v26 = -1;
        else
          v26 = qword_1CA1FE588[v18 - 2];
        kg_errorWithCode(v26);
        v27 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v27 = 0;
      }
      break;
    default:
LABEL_9:
      v27 = v16;
      break;
  }

  return v27;
}

- (id)allNodesForTable:(const void *)a3 error:(id *)a4
{
  void **database;
  int v6;
  uint64_t v7;
  KGElementIdentifierSet *v8;
  void **v10[2];
  __int128 v11;
  _BYTE v12[32];

  v11 = 0u;
  memset(v12, 0, 25);
  database = (void **)self->_database;
  v10[0] = (void **)a3;
  v10[1] = database;
  v6 = degas::NodeLabelQuery::allNodes((const degas::NodeTable **)v10, (degas::Bitmap *)&v11);
  if (v6)
  {
    if (a4)
    {
      if ((v6 - 2) > 8)
        v7 = -1;
      else
        v7 = qword_1CA1FE588[v6 - 2];
      kg_errorWithCode(v7);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v11);
  }
  v10[0] = (void **)v12;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v10);
  return v8;
}

- (id)allNodesWithError:(id *)a3
{
  return -[KGDatabase allNodesForTable:error:](self, "allNodesForTable:error:", (char *)self->_database + 192, a3);
}

- (id)nodeIdentifiersWhereNoEdgesWithError:(id *)a3
{
  degas::NodeCursor *v5;
  int v6;
  sqlite3_int64 v7;
  unsigned int v8;
  KGElementIdentifierSet *v9;
  uint64_t v10;
  __int128 v12;
  _BYTE v13[40];
  degas::Statement *v14[2];
  void **v15;

  v5 = (degas::NodeCursor *)degas::NodeCursor::NodeCursor(v14);
  degas::NodeCursor::setForNoEdges(v5, (const degas::NodeTable *)((char *)self->_database + 192));
  v12 = 0u;
  memset(v13, 0, 25);
  while (1)
  {
    v6 = degas::Statement::next((sqlite3_stmt **)v14[0]);
    if (v6 != 1)
      break;
    v7 = sqlite3_column_int64(*(sqlite3_stmt **)v14[0], 0);
    degas::Bitmap::setBit((degas::Bitmap *)&v12, v7);
  }
  v8 = v6 - 2;
  if (v6 == 2)
  {
    v9 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v12);
  }
  else if (a3)
  {
    if (v8 > 8)
      v10 = -1;
    else
      v10 = qword_1CA1FE588[v8];
    kg_errorWithCode(v10);
    v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v15 = (void **)v13;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v15);
  degas::Cursor::~Cursor(v14);
  return v9;
}

- (id)nodeIdentifiersWhereNoInEdgesWithError:(id *)a3
{
  degas::NodeCursor *v5;
  int v6;
  sqlite3_int64 v7;
  unsigned int v8;
  KGElementIdentifierSet *v9;
  uint64_t v10;
  __int128 v12;
  _BYTE v13[40];
  degas::Statement *v14[2];
  void **v15;

  v5 = (degas::NodeCursor *)degas::NodeCursor::NodeCursor(v14);
  degas::NodeCursor::setForNoInEdges(v5, (const degas::NodeTable *)((char *)self->_database + 192));
  v12 = 0u;
  memset(v13, 0, 25);
  while (1)
  {
    v6 = degas::Statement::next((sqlite3_stmt **)v14[0]);
    if (v6 != 1)
      break;
    v7 = sqlite3_column_int64(*(sqlite3_stmt **)v14[0], 0);
    degas::Bitmap::setBit((degas::Bitmap *)&v12, v7);
  }
  v8 = v6 - 2;
  if (v6 == 2)
  {
    v9 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v12);
  }
  else if (a3)
  {
    if (v8 > 8)
      v10 = -1;
    else
      v10 = qword_1CA1FE588[v8];
    kg_errorWithCode(v10);
    v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v15 = (void **)v13;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v15);
  degas::Cursor::~Cursor(v14);
  return v9;
}

- (id)nodeIdentifiersWhereNoOutEdgesWithError:(id *)a3
{
  degas::NodeCursor *v5;
  int v6;
  sqlite3_int64 v7;
  unsigned int v8;
  KGElementIdentifierSet *v9;
  uint64_t v10;
  __int128 v12;
  _BYTE v13[40];
  degas::Statement *v14[2];
  void **v15;

  v5 = (degas::NodeCursor *)degas::NodeCursor::NodeCursor(v14);
  degas::NodeCursor::setForNoOutEdges(v5, (const degas::NodeTable *)((char *)self->_database + 192));
  v12 = 0u;
  memset(v13, 0, 25);
  while (1)
  {
    v6 = degas::Statement::next((sqlite3_stmt **)v14[0]);
    if (v6 != 1)
      break;
    v7 = sqlite3_column_int64(*(sqlite3_stmt **)v14[0], 0);
    degas::Bitmap::setBit((degas::Bitmap *)&v12, v7);
  }
  v8 = v6 - 2;
  if (v6 == 2)
  {
    v9 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v12);
  }
  else if (a3)
  {
    if (v8 > 8)
      v10 = -1;
    else
      v10 = qword_1CA1FE588[v8];
    kg_errorWithCode(v10);
    v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v15 = (void **)v13;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v15);
  degas::Cursor::~Cursor(v14);
  return v9;
}

- (id)allTombstoneNodesWithError:(id *)a3
{
  return -[KGDatabase allNodesForTable:error:](self, "allNodesForTable:error:", (char *)self->_database + 808, a3);
}

- (id)intersectionOfNodesForNodeTable:(const void *)a3 withLabels:(id)a4 filterNodeIdentifiers:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  int32x4_t v12;
  void **database;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  KGElementIdentifierSet *v22;
  void **v24[2];
  Bitmap v25;
  __int128 v26;
  _QWORD v27[4];

  v10 = a4;
  v11 = a5;
  v26 = 0u;
  memset(v27, 0, 25);
  memset(&v25, 0, 41);
  if (-[KGDatabase labelIdentifiers:forLabels:](self, "labelIdentifiers:forLabels:", &v25, v10)
    && (database = (void **)self->_database,
        v24[0] = (void **)a3,
        v24[1] = database,
        (v14 = degas::NodeLabelQuery::nodesForAllLabels((const degas::NodeTable **)v24, &v25, (degas::Bitmap *)&v26)) != 0))
  {
    if (a6)
    {
      if ((v14 - 2) > 8)
        v15 = -1;
      else
        v15 = qword_1CA1FE588[v14 - 2];
      kg_errorWithCode(v15);
      v22 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    if (v11)
    {
      v16 = v26;
      if ((_QWORD)v26 == 0xFFFFFFFFLL)
      {
        v17 = (uint64_t *)v27[0];
        v18 = (uint64_t *)v27[1];
        if (v27[0] == v27[1])
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
              v12 = 0uLL;
              do
              {
                do
                {
                  v12 = (int32x4_t)vpadalq_u16((uint32x4_t)v12, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v19 + 4 * v21 + 16))));
                  v21 += 4;
                }
                while (v21 != 32);
                v21 = 0;
                v20 = vaddvq_s32(v12);
                v12 = 0uLL;
              }
              while (v20 == -1);
              *(_DWORD *)(v19 + 4) = v20;
            }
            v16 += v20;
            v17 += 2;
          }
          while (v17 != v18);
        }
        *(_QWORD *)&v26 = v16;
      }
      if (v16)
        degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)&v26, (degas::Bitmap *)objc_msgSend(v11, "bitmap", *(double *)v12.i64));
    }
    v22 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v26);
  }
  v24[0] = (void **)&v25._bitSets.__begin_;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v24);
  v25._bitCount = (unint64_t)v27;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v25);

  return v22;
}

- (id)intersectionOfNodesWithLabels:(id)a3 error:(id *)a4
{
  -[KGDatabase intersectionOfNodesForNodeTable:withLabels:filterNodeIdentifiers:error:](self, "intersectionOfNodesForNodeTable:withLabels:filterNodeIdentifiers:error:", (char *)self->_database + 192, a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)intersectionOfNodesWithLabels:(id)a3 filterNodeIdentifiers:(id)a4 error:(id *)a5
{
  -[KGDatabase intersectionOfNodesForNodeTable:withLabels:filterNodeIdentifiers:error:](self, "intersectionOfNodesForNodeTable:withLabels:filterNodeIdentifiers:error:", (char *)self->_database + 192, a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)intersectionOfTombstoneNodesWithLabels:(id)a3 error:(id *)a4
{
  -[KGDatabase intersectionOfNodesForNodeTable:withLabels:filterNodeIdentifiers:error:](self, "intersectionOfNodesForNodeTable:withLabels:filterNodeIdentifiers:error:", (char *)self->_database + 808, a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)intersectionOfTombstoneNodesWithLabels:(id)a3 filterNodeIdentifiers:(id)a4 error:(id *)a5
{
  -[KGDatabase intersectionOfNodesForNodeTable:withLabels:filterNodeIdentifiers:error:](self, "intersectionOfNodesForNodeTable:withLabels:filterNodeIdentifiers:error:", (char *)self->_database + 808, a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)unionOfNodesForNodeTable:(const void *)a3 withLabels:(id)a4 filterNodeIdentifiers:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  int32x4_t v12;
  void **database;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  KGElementIdentifierSet *v22;
  void **v24[2];
  Bitmap v25;
  __int128 v26;
  _QWORD v27[4];

  v10 = a4;
  v11 = a5;
  v26 = 0u;
  memset(v27, 0, 25);
  memset(&v25, 0, 41);
  -[KGDatabase labelIdentifiers:forLabels:](self, "labelIdentifiers:forLabels:", &v25, v10);
  if (v25._bitSets.__begin_ == v25._bitSets.__end_
    || (database = (void **)self->_database,
        v24[0] = (void **)a3,
        v24[1] = database,
        (v14 = degas::NodeLabelQuery::nodesForAnyLabels((const degas::NodeTable **)v24, &v25, (degas::Bitmap *)&v26)) == 0))
  {
    if (v11)
    {
      v16 = v26;
      if ((_QWORD)v26 == 0xFFFFFFFFLL)
      {
        v17 = (uint64_t *)v27[0];
        v18 = (uint64_t *)v27[1];
        if (v27[0] == v27[1])
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
              v12 = 0uLL;
              do
              {
                do
                {
                  v12 = (int32x4_t)vpadalq_u16((uint32x4_t)v12, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v19 + 4 * v21 + 16))));
                  v21 += 4;
                }
                while (v21 != 32);
                v21 = 0;
                v20 = vaddvq_s32(v12);
                v12 = 0uLL;
              }
              while (v20 == -1);
              *(_DWORD *)(v19 + 4) = v20;
            }
            v16 += v20;
            v17 += 2;
          }
          while (v17 != v18);
        }
        *(_QWORD *)&v26 = v16;
      }
      if (v16)
        degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)&v26, (degas::Bitmap *)objc_msgSend(v11, "bitmap", *(double *)v12.i64));
    }
    v22 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v26);
  }
  else if (a6)
  {
    if ((v14 - 2) > 8)
      v15 = -1;
    else
      v15 = qword_1CA1FE588[v14 - 2];
    kg_errorWithCode(v15);
    v22 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  v24[0] = (void **)&v25._bitSets.__begin_;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v24);
  v25._bitCount = (unint64_t)v27;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v25);

  return v22;
}

- (id)unionOfNodesWithLabels:(id)a3 error:(id *)a4
{
  -[KGDatabase unionOfNodesForNodeTable:withLabels:filterNodeIdentifiers:error:](self, "unionOfNodesForNodeTable:withLabels:filterNodeIdentifiers:error:", (char *)self->_database + 192, a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)unionOfNodesWithLabels:(id)a3 filterNodeIdentifiers:(id)a4 error:(id *)a5
{
  -[KGDatabase unionOfNodesForNodeTable:withLabels:filterNodeIdentifiers:error:](self, "unionOfNodesForNodeTable:withLabels:filterNodeIdentifiers:error:", (char *)self->_database + 192, a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)unionOfTombstoneNodesWithLabels:(id)a3 error:(id *)a4
{
  -[KGDatabase unionOfNodesForNodeTable:withLabels:filterNodeIdentifiers:error:](self, "unionOfNodesForNodeTable:withLabels:filterNodeIdentifiers:error:", (char *)self->_database + 808, a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)unionOfTombstoneNodesWithLabels:(id)a3 filterNodeIdentifiers:(id)a4 error:(id *)a5
{
  -[KGDatabase unionOfNodesForNodeTable:withLabels:filterNodeIdentifiers:error:](self, "unionOfNodesForNodeTable:withLabels:filterNodeIdentifiers:error:", (char *)self->_database + 808, a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)edgeIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a3;
  v11 = a4;
  -[KGDatabase elementIdentifiersForPropertyName:value:comparator:valueTable:rowCount:error:](self, "elementIdentifiersForPropertyName:value:comparator:valueTable:rowCount:error:", v10, v11, a5, (char *)self->_database + 528, degas::Database::edgeCount((degas::Database *)self->_database), a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)tombstoneEdgeIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 error:(id *)a6
{
  -[KGDatabase elementIdentifiersForPropertyName:value:comparator:valueTable:rowCount:error:](self, "elementIdentifiersForPropertyName:value:comparator:valueTable:rowCount:error:", a3, a4, a5, (char *)self->_database + 1088, 1000, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)edgeIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  -[KGDatabase elementIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:valueTable:rowCount:error:](self, "elementIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:valueTable:rowCount:error:", v12, v13, v14, a6, (char *)self->_database + 528, degas::Database::edgeCount((degas::Database *)self->_database), a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)tombstoneEdgeIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 error:(id *)a7
{
  -[KGDatabase elementIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:valueTable:rowCount:error:](self, "elementIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:valueTable:rowCount:error:", a3, a4, a5, a6, (char *)self->_database + 1088, 1000, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)edgeIdentifiersForPropertyName:(id)a3 values:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  -[KGDatabase elementIdentifiersForPropertyName:values:valueTable:rowCount:error:](self, "elementIdentifiersForPropertyName:values:valueTable:rowCount:error:", v8, v9, (char *)self->_database + 528, degas::Database::edgeCount((degas::Database *)self->_database), a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)tombstoneEdgeIdentifiersForPropertyName:(id)a3 values:(id)a4 error:(id *)a5
{
  -[KGDatabase elementIdentifiersForPropertyName:values:valueTable:rowCount:error:](self, "elementIdentifiersForPropertyName:values:valueTable:rowCount:error:", a3, a4, (char *)self->_database + 1088, 1000, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)filterEdgeIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 edgeIdentifiers:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  -[KGDatabase filterElementIdentifiersForPropertyName:value:comparator:elementIdentifiers:valueTable:rowCount:error:](self, "filterElementIdentifiersForPropertyName:value:comparator:elementIdentifiers:valueTable:rowCount:error:", v12, v13, a5, v14, (char *)self->_database + 528, degas::Database::edgeCount((degas::Database *)self->_database), a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)filterTombstoneEdgeIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 edgeIdentifiers:(id)a6 error:(id *)a7
{
  -[KGDatabase filterElementIdentifiersForPropertyName:value:comparator:elementIdentifiers:valueTable:rowCount:error:](self, "filterElementIdentifiersForPropertyName:value:comparator:elementIdentifiers:valueTable:rowCount:error:", a3, a4, a5, a6, (char *)self->_database + 1088, 1000, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)filterEdgeIdentifiersForPropertyName:(id)a3 values:(id)a4 comparator:(unint64_t)a5 edgeIdentifiers:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  -[KGDatabase filterElementIdentifiersForPropertyName:values:comparator:elementIdentifiers:valueTable:rowCount:error:](self, "filterElementIdentifiersForPropertyName:values:comparator:elementIdentifiers:valueTable:rowCount:error:", v12, v13, a5, v14, (char *)self->_database + 528, degas::Database::edgeCount((degas::Database *)self->_database), a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)filterTombstoneEdgeIdentifiersForPropertyName:(id)a3 values:(id)a4 comparator:(unint64_t)a5 edgeIdentifiers:(id)a6 error:(id *)a7
{
  -[KGDatabase filterElementIdentifiersForPropertyName:values:comparator:elementIdentifiers:valueTable:rowCount:error:](self, "filterElementIdentifiersForPropertyName:values:comparator:elementIdentifiers:valueTable:rowCount:error:", a3, a4, a5, a6, (char *)self->_database + 1088, 1000, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)filterEdgeIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 edgeIdentifiers:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  -[KGDatabase filterElementIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:elementIdentifiers:valueTable:rowCount:error:](self, "filterElementIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:elementIdentifiers:valueTable:rowCount:error:", v14, v15, v16, a6, v17, (char *)self->_database + 528, degas::Database::edgeCount((degas::Database *)self->_database), a8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)filterTombstoneEdgeIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 edgeIdentifiers:(id)a7 error:(id *)a8
{
  -[KGDatabase filterElementIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:elementIdentifiers:valueTable:rowCount:error:](self, "filterElementIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:elementIdentifiers:valueTable:rowCount:error:", a3, a4, a5, a6, a7, (char *)self->_database + 1088, 1000, a8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)edgeIdentifiersSortedByPropertyForName:(id)a3 dataType:(int64_t)a4 ascending:(BOOL)a5 limit:(int64_t)a6 edgeIdentifiers:(id)a7 error:(id *)a8
{
  _BOOL4 v11;
  id v14;
  id v15;
  id v16;
  sqlite3_int64 v17;
  int v18;
  void *database;
  Bitmap *v20;
  _QWORD *v21;
  void *v22;
  Bitmap *v23;
  void *v24;
  Bitmap *v25;
  uint64_t v26;
  id v27;
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];

  v11 = a5;
  v14 = a3;
  v15 = a7;
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = -[KGDatabase attributeIdentifierForPropertyName:](self, "attributeIdentifierForPropertyName:", v14);
  v18 = 6;
  switch(a4)
  {
    case 0:
      goto LABEL_6;
    case 1:
    case 4:
      database = self->_database;
      v20 = (Bitmap *)objc_msgSend(v15, "bitmap");
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __100__KGDatabase_edgeIdentifiersSortedByPropertyForName_dataType_ascending_limit_edgeIdentifiers_error___block_invoke;
      v31[3] = &unk_1E83E38B0;
      v31[4] = v16;
      v18 = degas::Database::sortEdgesByIntAttribute((uint64_t)database, v17, v11, a6, v20, (uint64_t)v31);
      v21 = v31;
      goto LABEL_5;
    case 2:
      v22 = self->_database;
      v23 = (Bitmap *)objc_msgSend(v15, "bitmap");
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __100__KGDatabase_edgeIdentifiersSortedByPropertyForName_dataType_ascending_limit_edgeIdentifiers_error___block_invoke_2;
      v30[3] = &unk_1E83E38D8;
      v30[4] = v16;
      v18 = degas::Database::sortEdgesByRealAttribute((uint64_t)v22, v17, v11, a6, v23, (uint64_t)v30);
      v21 = v30;
      goto LABEL_5;
    case 3:
      v24 = self->_database;
      v25 = (Bitmap *)objc_msgSend(v15, "bitmap");
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __100__KGDatabase_edgeIdentifiersSortedByPropertyForName_dataType_ascending_limit_edgeIdentifiers_error___block_invoke_3;
      v29[3] = &unk_1E83E3900;
      v29[4] = v16;
      v18 = degas::Database::sortEdgesByStringAttribute((uint64_t)v24, v17, v11, a6, v25, (uint64_t)v29);
      v21 = v29;
LABEL_5:

      if (!v18)
        goto LABEL_9;
LABEL_6:
      if (a8)
      {
        if ((v18 - 2) > 8)
          v26 = -1;
        else
          v26 = qword_1CA1FE588[v18 - 2];
        kg_errorWithCode(v26);
        v27 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v27 = 0;
      }
      break;
    default:
LABEL_9:
      v27 = v16;
      break;
  }

  return v27;
}

- (id)allEdgesForEdgeTable:(const void *)a3 withError:(id *)a4
{
  void **database;
  int v6;
  uint64_t v7;
  KGElementIdentifierSet *v8;
  void **v10[2];
  __int128 v11;
  _BYTE v12[32];

  v11 = 0u;
  memset(v12, 0, 25);
  database = (void **)self->_database;
  v10[0] = (void **)a3;
  v10[1] = database;
  v6 = degas::EdgeLabelQuery::allEdges((const degas::EdgeTable **)v10, (degas::Bitmap *)&v11);
  if (v6)
  {
    if (a4)
    {
      if ((v6 - 2) > 8)
        v7 = -1;
      else
        v7 = qword_1CA1FE588[v6 - 2];
      kg_errorWithCode(v7);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v11);
  }
  v10[0] = (void **)v12;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v10);
  return v8;
}

- (id)allEdgesWithError:(id *)a3
{
  return -[KGDatabase allEdgesForEdgeTable:withError:](self, "allEdgesForEdgeTable:withError:", (char *)self->_database + 248, a3);
}

- (id)allTombstoneEdgesWithError:(id *)a3
{
  return -[KGDatabase allEdgesForEdgeTable:withError:](self, "allEdgesForEdgeTable:withError:", (char *)self->_database + 864, a3);
}

- (id)intersectionOfEdgesForEdgeTable:(const void *)a3 withLabels:(id)a4 filterEdgeIdentifiers:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  int32x4_t v12;
  void **database;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  KGElementIdentifierSet *v22;
  void **v24[2];
  Bitmap v25;
  __int128 v26;
  _QWORD v27[4];

  v10 = a4;
  v11 = a5;
  v26 = 0u;
  memset(v27, 0, 25);
  memset(&v25, 0, 41);
  if (-[KGDatabase labelIdentifiers:forLabels:](self, "labelIdentifiers:forLabels:", &v25, v10)
    && (database = (void **)self->_database,
        v24[0] = (void **)a3,
        v24[1] = database,
        (v14 = degas::EdgeLabelQuery::edgesForAllLabels((const degas::EdgeTable **)v24, &v25, (degas::Bitmap *)&v26)) != 0))
  {
    if (a6)
    {
      if ((v14 - 2) > 8)
        v15 = -1;
      else
        v15 = qword_1CA1FE588[v14 - 2];
      kg_errorWithCode(v15);
      v22 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    if (v11)
    {
      v16 = v26;
      if ((_QWORD)v26 == 0xFFFFFFFFLL)
      {
        v17 = (uint64_t *)v27[0];
        v18 = (uint64_t *)v27[1];
        if (v27[0] == v27[1])
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
              v12 = 0uLL;
              do
              {
                do
                {
                  v12 = (int32x4_t)vpadalq_u16((uint32x4_t)v12, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v19 + 4 * v21 + 16))));
                  v21 += 4;
                }
                while (v21 != 32);
                v21 = 0;
                v20 = vaddvq_s32(v12);
                v12 = 0uLL;
              }
              while (v20 == -1);
              *(_DWORD *)(v19 + 4) = v20;
            }
            v16 += v20;
            v17 += 2;
          }
          while (v17 != v18);
        }
        *(_QWORD *)&v26 = v16;
      }
      if (v16)
        degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)&v26, (degas::Bitmap *)objc_msgSend(v11, "bitmap", *(double *)v12.i64));
    }
    v22 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v26);
  }
  v24[0] = (void **)&v25._bitSets.__begin_;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v24);
  v25._bitCount = (unint64_t)v27;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v25);

  return v22;
}

- (id)intersectionOfEdgesWithLabels:(id)a3 error:(id *)a4
{
  -[KGDatabase intersectionOfEdgesForEdgeTable:withLabels:filterEdgeIdentifiers:error:](self, "intersectionOfEdgesForEdgeTable:withLabels:filterEdgeIdentifiers:error:", (char *)self->_database + 248, a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)intersectionOfEdgesWithLabels:(id)a3 filterEdgeIdentifiers:(id)a4 error:(id *)a5
{
  -[KGDatabase intersectionOfEdgesForEdgeTable:withLabels:filterEdgeIdentifiers:error:](self, "intersectionOfEdgesForEdgeTable:withLabels:filterEdgeIdentifiers:error:", (char *)self->_database + 248, a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)intersectionOfTombstoneEdgesWithLabels:(id)a3 error:(id *)a4
{
  -[KGDatabase intersectionOfEdgesForEdgeTable:withLabels:filterEdgeIdentifiers:error:](self, "intersectionOfEdgesForEdgeTable:withLabels:filterEdgeIdentifiers:error:", (char *)self->_database + 864, a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)intersectionOfTombstoneEdgesWithLabels:(id)a3 filterEdgeIdentifiers:(id)a4 error:(id *)a5
{
  -[KGDatabase intersectionOfEdgesForEdgeTable:withLabels:filterEdgeIdentifiers:error:](self, "intersectionOfEdgesForEdgeTable:withLabels:filterEdgeIdentifiers:error:", (char *)self->_database + 864, a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)unionOfEdgesForEdgeTable:(const void *)a3 withLabels:(id)a4 filterEdgeIdentifiers:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  int32x4_t v12;
  void **database;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  KGElementIdentifierSet *v22;
  void **v24[2];
  Bitmap v25;
  __int128 v26;
  _QWORD v27[4];

  v10 = a4;
  v11 = a5;
  v26 = 0u;
  memset(v27, 0, 25);
  memset(&v25, 0, 41);
  -[KGDatabase labelIdentifiers:forLabels:](self, "labelIdentifiers:forLabels:", &v25, v10);
  if (v25._bitSets.__begin_ == v25._bitSets.__end_
    || (database = (void **)self->_database,
        v24[0] = (void **)a3,
        v24[1] = database,
        (v14 = degas::EdgeLabelQuery::edgesForAnyLabels((const degas::EdgeTable **)v24, &v25, (degas::Bitmap *)&v26)) == 0))
  {
    if (v11)
    {
      v16 = v26;
      if ((_QWORD)v26 == 0xFFFFFFFFLL)
      {
        v17 = (uint64_t *)v27[0];
        v18 = (uint64_t *)v27[1];
        if (v27[0] == v27[1])
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
              v12 = 0uLL;
              do
              {
                do
                {
                  v12 = (int32x4_t)vpadalq_u16((uint32x4_t)v12, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v19 + 4 * v21 + 16))));
                  v21 += 4;
                }
                while (v21 != 32);
                v21 = 0;
                v20 = vaddvq_s32(v12);
                v12 = 0uLL;
              }
              while (v20 == -1);
              *(_DWORD *)(v19 + 4) = v20;
            }
            v16 += v20;
            v17 += 2;
          }
          while (v17 != v18);
        }
        *(_QWORD *)&v26 = v16;
      }
      if (v16)
        degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)&v26, (degas::Bitmap *)objc_msgSend(v11, "bitmap", *(double *)v12.i64));
    }
    v22 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v26);
  }
  else if (a6)
  {
    if ((v14 - 2) > 8)
      v15 = -1;
    else
      v15 = qword_1CA1FE588[v14 - 2];
    kg_errorWithCode(v15);
    v22 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  v24[0] = (void **)&v25._bitSets.__begin_;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v24);
  v25._bitCount = (unint64_t)v27;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v25);

  return v22;
}

- (id)unionOfEdgesWithLabels:(id)a3 error:(id *)a4
{
  -[KGDatabase unionOfEdgesForEdgeTable:withLabels:filterEdgeIdentifiers:error:](self, "unionOfEdgesForEdgeTable:withLabels:filterEdgeIdentifiers:error:", (char *)self->_database + 248, a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)unionOfEdgesWithLabels:(id)a3 filterEdgeIdentifiers:(id)a4 error:(id *)a5
{
  -[KGDatabase unionOfEdgesForEdgeTable:withLabels:filterEdgeIdentifiers:error:](self, "unionOfEdgesForEdgeTable:withLabels:filterEdgeIdentifiers:error:", (char *)self->_database + 248, a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)unionOfTombstoneEdgesWithLabels:(id)a3 error:(id *)a4
{
  -[KGDatabase unionOfEdgesForEdgeTable:withLabels:filterEdgeIdentifiers:error:](self, "unionOfEdgesForEdgeTable:withLabels:filterEdgeIdentifiers:error:", (char *)self->_database + 864, a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)unionOfTombstoneEdgesWithLabels:(id)a3 filterEdgeIdentifiers:(id)a4 error:(id *)a5
{
  -[KGDatabase unionOfEdgesForEdgeTable:withLabels:filterEdgeIdentifiers:error:](self, "unionOfEdgesForEdgeTable:withLabels:filterEdgeIdentifiers:error:", (char *)self->_database + 864, a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)transactionChangesAfterTransactionId:(unint64_t)a3 limit:(int64_t)a4 block:(id)a5
{
  void *database;
  unsigned int v8;
  _QWORD *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[3];
  _QWORD *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  database = self->_database;
  v12[0] = &off_1E83E3958;
  v12[1] = &v11;
  v13 = v12;
  degas::Database::enumerateTransactionChangesAfterTransactionId((uint64_t)database, a3, v8, (uint64_t)v12);
  v9 = v13;
  if (v13 == v12)
  {
    v10 = 4;
    v9 = v12;
    goto LABEL_5;
  }
  if (v13)
  {
    v10 = 5;
LABEL_5:
    (*(void (**)(void))(*v9 + 8 * v10))();
  }

}

- (id)outEdgeIdentifiersOfNodesWithIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  uint64_t v8;
  KGElementIdentifierSet *v9;
  __int128 v11;
  _BYTE v12[32];
  void **v13;

  v6 = a3;
  v11 = 0u;
  memset(v12, 0, 25);
  v7 = degas::Database::edgesOfNodes((uint64_t)self->_database, (Bitmap *)objc_msgSend(v6, "bitmap", 0, 0, 0, 0, 0, *(_QWORD *)&v12[24]), &v11, 1u);
  if (v7)
  {
    if (a4)
    {
      if ((v7 - 2) > 8)
        v8 = -1;
      else
        v8 = qword_1CA1FE588[v7 - 2];
      kg_errorWithCode(v8);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v11);
  }
  v13 = (void **)v12;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v13);

  return v9;
}

- (id)inEdgeIdentifiersOfNodesWithIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  uint64_t v8;
  KGElementIdentifierSet *v9;
  __int128 v11;
  _BYTE v12[32];
  void **v13;

  v6 = a3;
  v11 = 0u;
  memset(v12, 0, 25);
  v7 = degas::Database::edgesOfNodes((uint64_t)self->_database, (Bitmap *)objc_msgSend(v6, "bitmap", 0, 0, 0, 0, 0, *(_QWORD *)&v12[24]), &v11, 2u);
  if (v7)
  {
    if (a4)
    {
      if ((v7 - 2) > 8)
        v8 = -1;
      else
        v8 = qword_1CA1FE588[v7 - 2];
      kg_errorWithCode(v8);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v11);
  }
  v13 = (void **)v12;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v13);

  return v9;
}

- (id)filterOutEdgeIdentifiersOfNodesWithIdentifiers:(id)a3 filterEdgeIdentifiers:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  int v10;
  uint64_t v11;
  KGElementIdentifierSet *v12;
  __int128 v14;
  _BYTE v15[32];
  void **v16;

  v8 = a3;
  v9 = a4;
  v14 = 0u;
  memset(v15, 0, 25);
  v10 = degas::Database::filterEdgesOfNodes((uint64_t)self->_database, (Bitmap *)objc_msgSend(v8, "bitmap", 0, 0, 0, 0, 0, *(_QWORD *)&v15[24]), (degas::Bitmap *)objc_msgSend(v9, "bitmap"), &v14, 1u);
  if (v10)
  {
    if (a5)
    {
      if ((v10 - 2) > 8)
        v11 = -1;
      else
        v11 = qword_1CA1FE588[v10 - 2];
      kg_errorWithCode(v11);
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v14);
  }
  v16 = (void **)v15;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v16);

  return v12;
}

- (id)filterInEdgeIdentifiersOfNodesWithIdentifiers:(id)a3 filterEdgeIdentifiers:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  int v10;
  uint64_t v11;
  KGElementIdentifierSet *v12;
  __int128 v14;
  _BYTE v15[32];
  void **v16;

  v8 = a3;
  v9 = a4;
  v14 = 0u;
  memset(v15, 0, 25);
  v10 = degas::Database::filterEdgesOfNodes((uint64_t)self->_database, (Bitmap *)objc_msgSend(v8, "bitmap", 0, 0, 0, 0, 0, *(_QWORD *)&v15[24]), (degas::Bitmap *)objc_msgSend(v9, "bitmap"), &v14, 2u);
  if (v10)
  {
    if (a5)
    {
      if ((v10 - 2) > 8)
        v11 = -1;
      else
        v11 = qword_1CA1FE588[v10 - 2];
      kg_errorWithCode(v11);
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v14);
  }
  v16 = (void **)v15;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v16);

  return v12;
}

- (id)filterEdgeIdentifiersBetween:(id)a3 targetNodeIdentifiers:(id)a4 filterEdgeIdentifiers:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  degas::Database *database;
  int v14;
  uint64_t v15;
  KGElementIdentifierSet *v16;
  __int128 v18;
  _BYTE v19[32];
  void **v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v18 = 0u;
  memset(v19, 0, 25);
  database = (degas::Database *)self->_database;
  if (v12)
    v14 = degas::Database::filterEdgesBetweenNodes(database, (const degas::Bitmap *)objc_msgSend(v10, "bitmap", v18, *(_QWORD *)v19, *(_OWORD *)&v19[8], *(_QWORD *)&v19[24]), (Bitmap *)objc_msgSend(v11, "bitmap"), (const degas::Bitmap *)objc_msgSend(v12, "bitmap"), (degas::Bitmap *)&v18);
  else
    v14 = degas::Database::edgesBetweenNodes(database, (const degas::Bitmap *)objc_msgSend(v10, "bitmap", v18, *(_QWORD *)v19, *(_OWORD *)&v19[8], *(_QWORD *)&v19[24]), (Bitmap *)objc_msgSend(v11, "bitmap"), (degas::Bitmap *)&v18);
  if (v14)
  {
    if (a6)
    {
      if ((v14 - 2) > 8)
        v15 = -1;
      else
        v15 = qword_1CA1FE588[v14 - 2];
      kg_errorWithCode(v15);
      v16 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v18);
  }
  v20 = (void **)v19;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v20);

  return v16;
}

- (BOOL)appendNodeIdentifiersOfEdgesWithIdentifiers:(id)a3 sourceNodeIdentifiers:(id)a4 targetNodeIdentifiers:(id)a5 error:(id *)a6
{
  id v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  degas::Database *database;

  v9 = a3;
  v10 = (unint64_t)a4;
  v11 = (unint64_t)a5;
  v12 = (void *)v11;
  if (v10 | v11)
  {
    database = (degas::Database *)self->_database;
    if (v10)
    {
      if (v11)
        degas::Database::appendSourceAndTargetNodesForEdges(database, (Bitmap *)objc_msgSend(v9, "bitmap"), (degas::Bitmap *)objc_msgSend((id)v10, "mutableBitmap"), (degas::Bitmap *)objc_msgSend((id)v11, "mutableBitmap"));
      else
        degas::Database::appendSourceNodesForEdges(database, (Bitmap *)objc_msgSend(v9, "bitmap"), (degas::Bitmap *)objc_msgSend((id)v10, "mutableBitmap"));
    }
    else
    {
      degas::Database::appendTargetNodesForEdges(database, (Bitmap *)objc_msgSend(v9, "bitmap"), (degas::Bitmap *)objc_msgSend((id)v11, "mutableBitmap"));
    }
  }

  return 1;
}

- (id)allNodeIdentifiersOfEdgesWithIdentifiers:(id)a3 error:(id *)a4
{
  id v5;
  KGElementIdentifierSet *v6;
  __int128 v8;
  _BYTE v9[32];
  void **v10;

  v5 = a3;
  v8 = 0u;
  memset(v9, 0, 25);
  degas::Database::appendAllNodesForEdges((degas::Database *)self->_database, (Bitmap *)objc_msgSend(v5, "bitmap", 0, 0, 0, 0, 0, *(_QWORD *)&v9[24]), (degas::Bitmap *)&v8);
  v6 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v8);
  v10 = (void **)v9;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v10);

  return v6;
}

- (id)edgeIdentifiersForNodeIdentifier:(unint64_t)a3 error:(id *)a4
{
  int v5;
  uint64_t v6;
  KGElementIdentifierSet *v7;
  __int128 v9;
  _BYTE v10[40];
  void **v11;

  v9 = 0u;
  memset(v10, 0, 25);
  v5 = degas::Database::edgesOfNode((uint64_t)self->_database, a3, &v9, 0);
  if (v5)
  {
    if (a4)
    {
      if ((v5 - 2) > 8)
        v6 = -1;
      else
        v6 = qword_1CA1FE588[v5 - 2];
      kg_errorWithCode(v6);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v9);
  }
  v11 = (void **)v10;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v11);
  return v7;
}

- (id)edgeIdentifiersWithLabels:(id)a3 direction:(unint64_t)a4 forNodeIdentifier:(unint64_t)a5 error:(id *)a6
{
  void *v10;
  int v11;
  uint64_t v12;
  KGElementIdentifierSet *v13;
  __int128 v15;
  _BYTE v16[40];
  void **v17;

  -[KGDatabase intersectionOfEdgesWithLabels:error:](self, "intersectionOfEdgesWithLabels:error:", a3, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v15 = 0u;
    memset(v16, 0, 25);
    v11 = degas::Database::edgesOfNode((uint64_t)self->_database, a5, &v15, -[KGDatabase degasEdgeDirectionFromKG:](self, "degasEdgeDirectionFromKG:", a4));
    if (v11)
    {
      if (a6)
      {
        if ((v11 - 2) > 8)
          v12 = -1;
        else
          v12 = qword_1CA1FE588[v11 - 2];
        kg_errorWithCode(v12);
        v13 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
    }
    else
    {
      degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)&v15, (degas::Bitmap *)objc_msgSend(v10, "bitmap"));
      v13 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v15);
    }
    v17 = (void **)v16;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v17);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)neighborNodesOfNodesForIdentifiers:(id)a3 throughEdgesWithLabels:(id)a4 direction:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  KGElementIdentifierSet *v15;
  __int128 v17;
  _BYTE v18[32];
  __int128 v19;
  _BYTE v20[40];
  void **v21;

  v10 = a3;
  v11 = a4;
  v12 = -[KGDatabase degasEdgeDirectionFromKG:](self, "degasEdgeDirectionFromKG:", a5);
  v19 = 0u;
  memset(v20, 0, 25);
  if (-[KGDatabase labelIdentifiers:forLabels:](self, "labelIdentifiers:forLabels:", &v19, v11))
  {
    v17 = 0u;
    memset(v18, 0, 25);
    v13 = degas::Database::nodeNeighbors((uint64_t)self->_database, (Bitmap *)objc_msgSend(v10, "bitmap", 0, 0, 0, 0, 0, *(_QWORD *)&v18[24]), (degas::Bitmap *)&v17, (const degas::Bitmap *)&v19, v12);
    if (v13)
    {
      if (a6)
      {
        if ((v13 - 2) > 8)
          v14 = -1;
        else
          v14 = qword_1CA1FE588[v13 - 2];
        kg_errorWithCode(v14);
        v15 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
    }
    else
    {
      v15 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v17);
    }
    v21 = (void **)v18;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v21);
  }
  else
  {
    v15 = objc_alloc_init(KGElementIdentifierSet);
  }
  *(_QWORD *)&v17 = v20;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v17);

  return v15;
}

- (id)neighborNodesOfNodesForIdentifiers:(id)a3 throughEdgesForIdentifiers:(id)a4 direction:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  int v12;
  uint64_t v13;
  KGElementIdentifierSet *v14;
  __int128 v16;
  _BYTE v17[32];
  void **v18;

  v10 = a3;
  v11 = a4;
  v16 = 0u;
  memset(v17, 0, 25);
  v12 = degas::Database::nodeNeighborsViaEdges((uint64_t)self->_database, (Bitmap *)objc_msgSend(v10, "bitmap", 0, 0, 0, 0, 0, *(_QWORD *)&v17[24]), (Bitmap *)objc_msgSend(v11, "bitmap"), (degas::Bitmap *)&v16, -[KGDatabase degasEdgeDirectionFromKG:](self, "degasEdgeDirectionFromKG:", a5));
  if (v12)
  {
    if (a6)
    {
      if ((v12 - 2) > 8)
        v13 = -1;
      else
        v13 = qword_1CA1FE588[v12 - 2];
      kg_errorWithCode(v13);
      v14 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v16);
  }
  v18 = (void **)v17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v18);

  return v14;
}

- (shared_ptr<degas::Predicate>)degasPredicateFromValueArray:(id)a3 attrId:(unint64_t)a4 elementType:(int)a5
{
  _QWORD *v5;
  _QWORD *v8;
  degas::Database *database;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 *v14;
  __int128 v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  __int128 v21;
  __int128 *v22;
  void **v23;
  void **v24;
  __int128 v25;
  void **v26;
  uint64_t v27;
  __int128 *v28;
  __int128 *v29;
  unint64_t v30;
  std::string *v31;
  uint64_t v32;
  std::string *v33;
  __int128 v34;
  std::__shared_weak_count *v35;
  unint64_t *p_shared_owners;
  unint64_t v37;
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t j;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  std::__shared_weak_count_vtbl *v55;
  uint64_t v56;
  void (__cdecl *v57)(std::__shared_weak_count *__hidden);
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  id v61;
  char *v62;
  char *v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t k;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  std::__shared_weak_count_vtbl *v78;
  uint64_t v79;
  void (__cdecl *v80)(std::__shared_weak_count *__hidden);
  std::__shared_weak_count *v81;
  unint64_t *v82;
  unint64_t v83;
  _QWORD *v84;
  _QWORD *v85;
  uint64_t v86;
  unint64_t *v87;
  unint64_t v88;
  Predicate *v89;
  __shared_weak_count *v90;
  unint64_t v91;
  char *v92;
  id v94;
  id v95;
  id v96;
  id v97;
  _QWORD *v98;
  id obj;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  void **v113;
  __int128 *v114;
  unint64_t v115;
  char *v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  char v120;
  __int128 __p;
  std::string **v122;
  char v123;
  std::string *v124;
  std::string *v125;
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  uint64_t v129;
  shared_ptr<degas::Predicate> result;

  v8 = v5;
  v129 = *MEMORY[0x1E0C80C00];
  v94 = a3;
  v97 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v96 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v95 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[KGDatabase distributeValuesByType:toIntegerValues:floatValues:stringValues:](self, "distributeValuesByType:toIntegerValues:floatValues:stringValues:", v94, v96);
  database = (degas::Database *)self->_database;
  switch(a5)
  {
    case 1:
      v10 = (char *)database + 472;
      break;
    case 2:
      v10 = (char *)database + 528;
      break;
    case 3:
      v10 = (char *)database + 1032;
      break;
    case 4:
      v10 = (char *)database + 1088;
      break;
    default:
      abort();
  }
  v92 = v10;
  v91 = rowCountForElementType(a5, database);
  v116 = 0;
  v117 = 0;
  v118 = 0;
  v98 = v8;
  if (objc_msgSend(v97, "count"))
  {
    v113 = 0;
    v114 = 0;
    v115 = 0;
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    v112 = 0u;
    obj = v97;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v128, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v110;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v110 != v12)
            objc_enumerationMutation(obj);
          std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v109 + 1) + 8 * i)), "UTF8String"));
          v14 = v114;
          if ((unint64_t)v114 >= v115)
          {
            v16 = 0xAAAAAAAAAAAAAAABLL * (((char *)v114 - (char *)v113) >> 3);
            v17 = v16 + 1;
            if (v16 + 1 > 0xAAAAAAAAAAAAAAALL)
              std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
            if (0x5555555555555556 * ((uint64_t)(v115 - (_QWORD)v113) >> 3) > v17)
              v17 = 0x5555555555555556 * ((uint64_t)(v115 - (_QWORD)v113) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v115 - (_QWORD)v113) >> 3) >= 0x555555555555555)
              v18 = 0xAAAAAAAAAAAAAAALL;
            else
              v18 = v17;
            if (v18)
              v18 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v18);
            else
              v19 = 0;
            v20 = v18 + 24 * v16;
            v21 = __p;
            *(_QWORD *)(v20 + 16) = v122;
            *(_OWORD *)v20 = v21;
            v122 = 0;
            __p = 0uLL;
            v22 = (__int128 *)(v20 + 24);
            v23 = v113;
            v24 = (void **)v114;
            if (v114 == (__int128 *)v113)
            {
              v113 = (void **)v20;
              v114 = (__int128 *)(v20 + 24);
              v115 = v18 + 24 * v19;
            }
            else
            {
              do
              {
                v25 = *(_OWORD *)(v24 - 3);
                *(_QWORD *)(v20 - 8) = *(v24 - 1);
                *(_OWORD *)(v20 - 24) = v25;
                v20 -= 24;
                *(v24 - 2) = 0;
                *(v24 - 1) = 0;
                *(v24 - 3) = 0;
                v24 -= 3;
              }
              while (v24 != v23);
              v24 = v113;
              v26 = (void **)v114;
              v113 = (void **)v20;
              v114 = v22;
              v115 = v18 + 24 * v19;
              while (v26 != v24)
              {
                if (*((char *)v26 - 1) < 0)
                  operator delete(*(v26 - 3));
                v26 -= 3;
              }
            }
            if (v24)
              operator delete(v24);
            v114 = v22;
            v8 = v98;
            if (SHIBYTE(v122) < 0)
              operator delete((void *)__p);
          }
          else
          {
            v15 = __p;
            *((_QWORD *)v114 + 2) = v122;
            *v14 = v15;
            v114 = (__int128 *)((char *)v14 + 24);
          }
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v128, 16);
      }
      while (v11);
    }

    v27 = operator new();
    *(_QWORD *)v27 = &off_1E83E39E8;
    *(_QWORD *)(v27 + 8) = v92;
    *(_DWORD *)(v27 + 16) = 1;
    *(_QWORD *)(v27 + 24) = a4;
    *(_QWORD *)(v27 + 32) = 0;
    *(_QWORD *)(v27 + 40) = 0;
    *(_QWORD *)(v27 + 48) = 0;
    v28 = (__int128 *)v113;
    v29 = v114;
    v119 = v27 + 32;
    v120 = 0;
    if (v114 != (__int128 *)v113)
    {
      v30 = 0xAAAAAAAAAAAAAAABLL * (((char *)v114 - (char *)v113) >> 3);
      if (v30 > 0xAAAAAAAAAAAAAAALL)
        std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
      v31 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v30);
      *(_QWORD *)(v27 + 48) = &v31[v32];
      *(_QWORD *)(v27 + 32) = v31;
      *(_QWORD *)(v27 + 40) = v31;
      v124 = v31;
      v125 = v31;
      *(_QWORD *)&__p = v27 + 48;
      *((_QWORD *)&__p + 1) = &v124;
      v122 = &v125;
      v123 = 0;
      v33 = v31;
      do
      {
        if (*((char *)v28 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(v33, *(const std::string::value_type **)v28, *((_QWORD *)v28 + 1));
          v33 = v125;
        }
        else
        {
          v34 = *v28;
          v33->__r_.__value_.__r.__words[2] = *((_QWORD *)v28 + 2);
          *(_OWORD *)&v33->__r_.__value_.__l.__data_ = v34;
        }
        v28 = (__int128 *)((char *)v28 + 24);
        v125 = ++v33;
      }
      while (v28 != v29);
      v123 = 1;
      std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&__p);
      *(_QWORD *)(v27 + 40) = v33;
    }
    *(_QWORD *)(v27 + 56) = v91;
    *(_QWORD *)&v108 = v27;
    v35 = (std::__shared_weak_count *)operator new();
    v35->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v35->__shared_owners_;
    v35->__vftable = (std::__shared_weak_count_vtbl *)&off_1E83E3A58;
    v35->__shared_weak_owners_ = 0;
    v35[1].__vftable = (std::__shared_weak_count_vtbl *)v27;
    *((_QWORD *)&v108 + 1) = v35;
    std::vector<std::shared_ptr<degas::Predicate>>::push_back[abi:ne180100](&v116, &v108);
    do
      v37 = __ldaxr(p_shared_owners);
    while (__stlxr(v37 - 1, p_shared_owners));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
    *(_QWORD *)&__p = &v113;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  }
  if (objc_msgSend(v96, "count"))
  {
    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v38 = v96;
    v39 = 0;
    v40 = 0;
    v41 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v104, v127, 16);
    if (v41)
    {
      v42 = 0;
      v43 = *(_QWORD *)v105;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v105 != v43)
            objc_enumerationMutation(v38);
          v45 = objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * j), "longLongValue");
          v46 = v45;
          if ((unint64_t)v40 >= v42)
          {
            v47 = v40 - v39;
            v48 = v47 + 1;
            if ((unint64_t)(v47 + 1) >> 61)
              std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
            if ((uint64_t)(v42 - (_QWORD)v39) >> 2 > v48)
              v48 = (uint64_t)(v42 - (_QWORD)v39) >> 2;
            if (v42 - (unint64_t)v39 >= 0x7FFFFFFFFFFFFFF8)
              v49 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v49 = v48;
            if (v49)
              v49 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(v49);
            else
              v50 = 0;
            v51 = (uint64_t *)(v49 + 8 * v47);
            *v51 = v46;
            v52 = v51 + 1;
            while (v40 != v39)
            {
              v53 = *--v40;
              *--v51 = v53;
            }
            v42 = v49 + 8 * v50;
            if (v39)
              operator delete(v39);
            v39 = v51;
            v40 = v52;
          }
          else
          {
            *v40++ = v45;
          }
        }
        v41 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v104, v127, 16);
      }
      while (v41);
    }

    v54 = operator new();
    v55 = (std::__shared_weak_count_vtbl *)v54;
    *(_QWORD *)v54 = &off_1E83E3AA8;
    *(_QWORD *)(v54 + 8) = v92;
    *(_DWORD *)(v54 + 16) = 1;
    *(_QWORD *)(v54 + 24) = a4;
    *(_QWORD *)(v54 + 32) = 0;
    *(_QWORD *)(v54 + 40) = 0;
    *(_QWORD *)(v54 + 48) = 0;
    v56 = (char *)v40 - (char *)v39;
    if (v40 != v39)
    {
      std::vector<double>::__vallocate[abi:ne180100]((_QWORD *)(v54 + 32), v56 >> 3);
      v57 = v55[1].~__shared_weak_count;
      memmove(v57, v39, (char *)v40 - (char *)v39);
      v55[1].~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))((char *)v57 + 8 * (v56 >> 3));
    }
    v55[1].__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v91;
    *(_QWORD *)&__p = v55;
    v8 = v98;
    v58 = (std::__shared_weak_count *)operator new();
    v58->__shared_owners_ = 0;
    v59 = (unint64_t *)&v58->__shared_owners_;
    v58->__vftable = (std::__shared_weak_count_vtbl *)&off_1E83E3B18;
    v58->__shared_weak_owners_ = 0;
    v58[1].__vftable = v55;
    *((_QWORD *)&__p + 1) = v58;
    std::vector<std::shared_ptr<degas::Predicate>>::push_back[abi:ne180100](&v116, &__p);
    do
      v60 = __ldaxr(v59);
    while (__stlxr(v60 - 1, v59));
    if (!v60)
    {
      ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
      std::__shared_weak_count::__release_weak(v58);
    }
    if (v39)
      operator delete(v39);
  }
  if (objc_msgSend(v95, "count"))
  {
    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    v61 = v95;
    v62 = 0;
    v63 = 0;
    v64 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v100, v126, 16);
    if (v64)
    {
      v65 = 0;
      v66 = *(_QWORD *)v101;
      do
      {
        for (k = 0; k != v64; ++k)
        {
          if (*(_QWORD *)v101 != v66)
            objc_enumerationMutation(v61);
          objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * k), "doubleValue");
          v69 = v68;
          if ((unint64_t)v63 >= v65)
          {
            v70 = (v63 - v62) >> 3;
            v71 = v70 + 1;
            if ((unint64_t)(v70 + 1) >> 61)
              std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
            if ((uint64_t)(v65 - (_QWORD)v62) >> 2 > v71)
              v71 = (uint64_t)(v65 - (_QWORD)v62) >> 2;
            if (v65 - (unint64_t)v62 >= 0x7FFFFFFFFFFFFFF8)
              v72 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v72 = v71;
            if (v72)
              v72 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(v72);
            else
              v73 = 0;
            v74 = (char *)(v72 + 8 * v70);
            *(_QWORD *)v74 = v69;
            v75 = v74 + 8;
            while (v63 != v62)
            {
              v76 = *((_QWORD *)v63 - 1);
              v63 -= 8;
              *((_QWORD *)v74 - 1) = v76;
              v74 -= 8;
            }
            v65 = v72 + 8 * v73;
            if (v62)
              operator delete(v62);
            v62 = v74;
            v63 = v75;
          }
          else
          {
            *(_QWORD *)v63 = v68;
            v63 += 8;
          }
        }
        v64 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v100, v126, 16);
      }
      while (v64);
    }

    v8 = v98;
    v77 = operator new();
    v78 = (std::__shared_weak_count_vtbl *)v77;
    *(_QWORD *)v77 = &off_1E83E3B68;
    *(_QWORD *)(v77 + 8) = v92;
    *(_DWORD *)(v77 + 16) = 1;
    *(_QWORD *)(v77 + 24) = a4;
    *(_QWORD *)(v77 + 32) = 0;
    *(_QWORD *)(v77 + 40) = 0;
    *(_QWORD *)(v77 + 48) = 0;
    v79 = v63 - v62;
    if (v63 != v62)
    {
      std::vector<double>::__vallocate[abi:ne180100]((_QWORD *)(v77 + 32), v79 >> 3);
      v80 = v78[1].~__shared_weak_count;
      memmove(v80, v62, v63 - v62);
      v78[1].~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))((char *)v80 + 8 * (v79 >> 3));
    }
    v78[1].__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v91;
    *(_QWORD *)&__p = v78;
    v81 = (std::__shared_weak_count *)operator new();
    v81->__shared_owners_ = 0;
    v82 = (unint64_t *)&v81->__shared_owners_;
    v81->__vftable = (std::__shared_weak_count_vtbl *)&off_1E83E3BD8;
    v81->__shared_weak_owners_ = 0;
    v81[1].__vftable = v78;
    *((_QWORD *)&__p + 1) = v81;
    std::vector<std::shared_ptr<degas::Predicate>>::push_back[abi:ne180100](&v116, &__p);
    do
      v83 = __ldaxr(v82);
    while (__stlxr(v83 - 1, v82));
    if (!v83)
    {
      ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
      std::__shared_weak_count::__release_weak(v81);
    }
    if (v62)
      operator delete(v62);
  }
  if ((unint64_t)(v117 - v116) < 0x11)
  {
    if (v117 - v116 == 16)
    {
      v86 = *((_QWORD *)v116 + 1);
      *v8 = *(_QWORD *)v116;
      v8[1] = v86;
      if (v86)
      {
        v87 = (unint64_t *)(v86 + 8);
        do
          v88 = __ldxr(v87);
        while (__stxr(v88 + 1, v87));
      }
    }
    else
    {
      *v8 = 0;
      v8[1] = 0;
    }
  }
  else
  {
    v84 = (_QWORD *)operator new();
    *v84 = &off_1E83E56F0;
    v84[2] = 0;
    v84[3] = 0;
    v84[1] = 0;
    std::vector<std::shared_ptr<degas::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::Predicate>*,std::shared_ptr<degas::Predicate>*>(v84 + 1, v116, v117, (v117 - v116) >> 4);
    *v8 = v84;
    v85 = (_QWORD *)operator new();
    *v85 = &off_1E83E3C28;
    v85[1] = 0;
    v85[2] = 0;
    v85[3] = v84;
    v8[1] = v85;
  }
  *(_QWORD *)&__p = &v116;
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

  result.var1 = v90;
  result.var0 = v89;
  return result;
}

- (shared_ptr<degas::Predicate>)degasPredicateFromValue:(id)a3 comparator:(unint64_t)a4 attrId:(unint64_t)a5 elementType:(int)a6
{
  uint64_t *v6;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  degas::Database *database;
  char *v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t (**v23)();
  id v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  std::string *v29;
  int v30;
  _QWORD *v31;
  Predicate *v32;
  __shared_weak_count *v33;
  std::string __p;
  std::string buf;
  uint64_t v36;
  shared_ptr<degas::Predicate> result;

  v11 = v6;
  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = objc_msgSend(v12, "kgPropertyType");
  if (a4 >= 9)
    v14 = 1;
  else
    v14 = a4;
  v15 = v13;
  database = (degas::Database *)self->_database;
  switch(a6)
  {
    case 1:
      v17 = (char *)database + 472;
      break;
    case 2:
      v17 = (char *)database + 528;
      break;
    case 3:
      v17 = (char *)database + 1032;
      break;
    case 4:
      v17 = (char *)database + 1088;
      break;
    default:
      abort();
  }
  v18 = rowCountForElementType(a6, database);
  switch(v15)
  {
    case 0:
      KGLoggingConnection();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.__r_.__value_.__l.__data_) = 138412290;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v12;
        _os_log_error_impl(&dword_1CA0A5000, v26, OS_LOG_TYPE_ERROR, "unable to interpret value <%@> as valid property value", (uint8_t *)&buf, 0xCu);
      }

      goto LABEL_16;
    case 1:
    case 4:
      v19 = v12;
      v20 = objc_msgSend(v19, "longLongValue");
      v21 = operator new();
      *(_QWORD *)v21 = &off_1E83E3C78;
      *(_QWORD *)(v21 + 8) = v17;
      *(_DWORD *)(v21 + 16) = v14;
      *(_QWORD *)(v21 + 24) = a5;
      *(_QWORD *)(v21 + 32) = v20;
      *(_QWORD *)(v21 + 40) = v18;
      *v11 = v21;
      v22 = (_QWORD *)operator new();
      v23 = &off_1E83E3CE8;
      goto LABEL_18;
    case 2:
      v19 = v12;
      objc_msgSend(v19, "doubleValue");
      v28 = v27;
      v21 = operator new();
      *(_QWORD *)v21 = &off_1E83E3D38;
      *(_QWORD *)(v21 + 8) = v17;
      *(_DWORD *)(v21 + 16) = v14;
      *(_QWORD *)(v21 + 24) = a5;
      *(_QWORD *)(v21 + 32) = v28;
      *(_QWORD *)(v21 + 40) = v18;
      *v11 = v21;
      v22 = (_QWORD *)operator new();
      v23 = &off_1E83E3DA8;
LABEL_18:
      *v22 = v23;
      v22[1] = 0;
      v22[2] = 0;
      v22[3] = v21;
      v11[1] = (uint64_t)v22;

      break;
    case 3:
      v24 = v12;
      stringNSToStd((NSString *)&buf.__r_.__value_.__l.__data_, v24);
      v25 = operator new();
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&__p, buf.__r_.__value_.__l.__data_, buf.__r_.__value_.__l.__size_);
      else
        __p = buf;
      *(_QWORD *)v25 = off_1E83E3DF8;
      *(_QWORD *)(v25 + 8) = v17;
      *(_DWORD *)(v25 + 16) = v14;
      *(_QWORD *)(v25 + 24) = a5;
      v29 = (std::string *)(v25 + 32);
      v30 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external(v29, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      }
      else
      {
        *(_OWORD *)&v29->__r_.__value_.__l.__data_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        *(_QWORD *)(v25 + 48) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
      }
      *(_QWORD *)(v25 + 56) = v18;
      *v11 = v25;
      v31 = (_QWORD *)operator new();
      *v31 = &off_1E83E3E68;
      v31[1] = 0;
      v31[2] = 0;
      v31[3] = v25;
      v11[1] = (uint64_t)v31;
      if (v30 < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf.__r_.__value_.__l.__data_);

      break;
    default:
LABEL_16:
      *v11 = 0;
      v11[1] = 0;
      break;
  }

  result.var1 = v33;
  result.var0 = v32;
  return result;
}

- (shared_ptr<degas::Predicate>)degasRangePredicateFromValue1:(id)a3 value2:(id)a4 comparator:(unint64_t)a5 attrId:(unint64_t)a6 elementType:(int)a7
{
  uint64_t *v7;
  uint64_t *v13;
  id v14;
  id v15;
  uint64_t v16;
  int v17;
  degas::Database *database;
  char *v19;
  Predicate *v20;
  __shared_weak_count *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  int v31;
  unint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  NSObject *v36;
  unint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  int v45;
  std::string *v46;
  int v47;
  _QWORD *v48;
  void *v49;
  std::string v50;
  std::string v51;
  std::string __p;
  __int128 v53;
  _BYTE v54[32];
  std::string buf;
  uint64_t v56;
  shared_ptr<degas::Predicate> result;

  v13 = v7;
  v56 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v53 = 0u;
  memset(v54, 0, 25);
  v16 = objc_msgSend(v14, "kgPropertyType");
  if (v16 == objc_msgSend(v15, "kgPropertyType"))
  {
    if (a5 >= 9)
      v17 = 1;
    else
      v17 = a5;
    database = (degas::Database *)self->_database;
    switch(a7)
    {
      case 1:
        v19 = (char *)database + 472;
        break;
      case 2:
        v19 = (char *)database + 528;
        break;
      case 3:
        v19 = (char *)database + 1032;
        break;
      case 4:
        v19 = (char *)database + 1088;
        break;
      default:
        abort();
    }
    v22 = rowCountForElementType(a7, database);
    switch(v16)
    {
      case 0:
        KGLoggingConnection();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.__r_.__value_.__l.__data_) = 138412290;
          *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v14;
          _os_log_error_impl(&dword_1CA0A5000, v36, OS_LOG_TYPE_ERROR, "unable to interpret value <%@> as valid property value", (uint8_t *)&buf, 0xCu);
        }

        goto LABEL_9;
      case 1:
      case 4:
        v23 = v14;
        v24 = v22;
        v49 = v23;
        v25 = v23;
        v26 = v15;
        v27 = operator new();
        v28 = objc_msgSend(v25, "longLongValue");
        v29 = objc_msgSend(v26, "longLongValue");
        *(_QWORD *)v27 = &off_1E83E3EB8;
        *(_QWORD *)(v27 + 8) = v19;
        *(_DWORD *)(v27 + 16) = v17;
        *(_QWORD *)(v27 + 24) = a6;
        *(_QWORD *)(v27 + 32) = v28;
        *(_QWORD *)(v27 + 40) = v29;
        *(_QWORD *)(v27 + 48) = v24;
        *v13 = v27;
        v30 = (_QWORD *)operator new();
        *v30 = &off_1E83E3F28;
        v30[1] = 0;
        v30[2] = 0;
        v30[3] = v27;
        v13[1] = (uint64_t)v30;

        v14 = v49;
        break;
      case 2:
        v37 = v22;
        v38 = v14;
        v39 = v15;
        v40 = operator new();
        objc_msgSend(v38, "doubleValue");
        v42 = v41;
        objc_msgSend(v39, "doubleValue");
        *(_QWORD *)v40 = &off_1E83E3F78;
        *(_QWORD *)(v40 + 8) = v19;
        *(_DWORD *)(v40 + 16) = v17;
        *(_QWORD *)(v40 + 24) = a6;
        *(_QWORD *)(v40 + 32) = v42;
        *(_QWORD *)(v40 + 40) = v43;
        *(_QWORD *)(v40 + 48) = v37;
        *v13 = v40;
        v44 = (_QWORD *)operator new();
        *v44 = &off_1E83E3FE8;
        v44[1] = 0;
        v44[2] = 0;
        v44[3] = v40;
        v13[1] = (uint64_t)v44;

        break;
      case 3:
        v31 = v17;
        v32 = v22;
        v33 = v14;
        v34 = v15;
        stringNSToStd((NSString *)&buf.__r_.__value_.__l.__data_, v33);
        stringNSToStd((NSString *)&__p.__r_.__value_.__l.__data_, v34);
        v35 = operator new();
        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external(&v51, buf.__r_.__value_.__l.__data_, buf.__r_.__value_.__l.__size_);
        else
          v51 = buf;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external(&v50, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
        else
          v50 = __p;
        *(_QWORD *)v35 = off_1E83E4038;
        *(_QWORD *)(v35 + 8) = v19;
        *(_DWORD *)(v35 + 16) = v31;
        *(_QWORD *)(v35 + 24) = a6;
        v45 = SHIBYTE(v51.__r_.__value_.__r.__words[2]);
        if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external((std::string *)(v35 + 32), v51.__r_.__value_.__l.__data_, v51.__r_.__value_.__l.__size_);
        else
          *(std::string *)(v35 + 32) = v51;
        v46 = (std::string *)(v35 + 56);
        v47 = SHIBYTE(v50.__r_.__value_.__r.__words[2]);
        if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__init_copy_ctor_external(v46, v50.__r_.__value_.__l.__data_, v50.__r_.__value_.__l.__size_);
        }
        else
        {
          *(_OWORD *)&v46->__r_.__value_.__l.__data_ = *(_OWORD *)&v50.__r_.__value_.__l.__data_;
          *(_QWORD *)(v35 + 72) = *((_QWORD *)&v50.__r_.__value_.__l + 2);
        }
        *(_QWORD *)(v35 + 80) = v32;
        *v13 = v35;
        v48 = (_QWORD *)operator new();
        *v48 = &off_1E83E40A8;
        v48[1] = 0;
        v48[2] = 0;
        v48[3] = v35;
        v13[1] = (uint64_t)v48;
        if (v47 < 0)
          operator delete(v50.__r_.__value_.__l.__data_);
        if (v45 < 0)
          operator delete(v51.__r_.__value_.__l.__data_);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
          operator delete(buf.__r_.__value_.__l.__data_);

        break;
      default:
        goto LABEL_9;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "selecting in a range with mismatched types", (uint8_t *)&buf, 2u);
    }
LABEL_9:
    *v13 = 0;
    v13[1] = 0;
  }
  buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v54;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);

  result.var1 = v21;
  result.var0 = v20;
  return result;
}

- (shared_ptr<degas::Predicate>)degasPredicateForAllLabels:(void *)a3 elementType:(int)a4
{
  _QWORD *v4;
  _QWORD *v5;
  KGDatabase *v7;
  NSObject *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *database;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  __int16 v19[8];
  shared_ptr<degas::Predicate> result;

  v5 = v4;
  v7 = self;
  switch(a4)
  {
    case 0:
      KGLoggingConnection();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v19[0] = 0;
        _os_log_error_impl(&dword_1CA0A5000, v8, OS_LOG_TYPE_ERROR, "unable to provide useful predicate for None element type", (uint8_t *)v19, 2u);
      }

      goto LABEL_5;
    case 1:
      v13 = operator new();
      database = (char *)v7->_database;
      v18 = *(_QWORD *)a3;
      *(_QWORD *)v13 = &off_1E83E5538;
      *(_QWORD *)(v13 + 8) = v18;
      *(_OWORD *)(v13 + 16) = 0u;
      *(_OWORD *)(v13 + 32) = 0u;
      std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)(v13 + 24), *((__int128 **)a3 + 2), *((__int128 **)a3 + 3), (uint64_t)(*((_QWORD *)a3 + 3) - *((_QWORD *)a3 + 2)) >> 4);
      v16 = database + 192;
      goto LABEL_11;
    case 2:
      v9 = operator new();
      v10 = (char *)v7->_database;
      v11 = *(_QWORD *)a3;
      *(_QWORD *)v9 = &off_1E83E55E8;
      *(_QWORD *)(v9 + 8) = v11;
      *(_OWORD *)(v9 + 16) = 0u;
      *(_OWORD *)(v9 + 32) = 0u;
      std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)(v9 + 24), *((__int128 **)a3 + 2), *((__int128 **)a3 + 3), (uint64_t)(*((_QWORD *)a3 + 3) - *((_QWORD *)a3 + 2)) >> 4);
      v12 = v10 + 248;
      goto LABEL_9;
    case 3:
      v13 = operator new();
      database = (char *)v7->_database;
      v15 = *(_QWORD *)a3;
      *(_QWORD *)v13 = &off_1E83E5538;
      *(_QWORD *)(v13 + 8) = v15;
      *(_OWORD *)(v13 + 16) = 0u;
      *(_OWORD *)(v13 + 32) = 0u;
      std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)(v13 + 24), *((__int128 **)a3 + 2), *((__int128 **)a3 + 3), (uint64_t)(*((_QWORD *)a3 + 3) - *((_QWORD *)a3 + 2)) >> 4);
      v16 = database + 808;
LABEL_11:
      *(_BYTE *)(v13 + 48) = *((_BYTE *)a3 + 40);
      *(_QWORD *)(v13 + 56) = v16;
      *(_QWORD *)(v13 + 64) = database;
      self = (KGDatabase *)std::shared_ptr<degas::Predicate>::shared_ptr[abi:ne180100]<degas::AllLabelsNodePredicate,void>(v5, v13);
      break;
    case 4:
      v9 = operator new();
      v10 = (char *)v7->_database;
      v17 = *(_QWORD *)a3;
      *(_QWORD *)v9 = &off_1E83E55E8;
      *(_QWORD *)(v9 + 8) = v17;
      *(_OWORD *)(v9 + 16) = 0u;
      *(_OWORD *)(v9 + 32) = 0u;
      std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)(v9 + 24), *((__int128 **)a3 + 2), *((__int128 **)a3 + 3), (uint64_t)(*((_QWORD *)a3 + 3) - *((_QWORD *)a3 + 2)) >> 4);
      v12 = v10 + 864;
LABEL_9:
      *(_BYTE *)(v9 + 48) = *((_BYTE *)a3 + 40);
      *(_QWORD *)(v9 + 56) = v12;
      *(_QWORD *)(v9 + 64) = v10;
      self = (KGDatabase *)std::shared_ptr<degas::Predicate>::shared_ptr[abi:ne180100]<degas::AllLabelsEdgePredicate,void>(v5, v9);
      break;
    default:
LABEL_5:
      *v5 = 0;
      v5[1] = 0;
      break;
  }
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (Predicate *)self;
  return result;
}

- (shared_ptr<degas::Predicate>)degasPredicateForAnyLabels:(void *)a3 elementType:(int)a4
{
  _QWORD *v4;
  _QWORD *v5;
  KGDatabase *v7;
  NSObject *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *database;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  __int16 v19[8];
  shared_ptr<degas::Predicate> result;

  v5 = v4;
  v7 = self;
  switch(a4)
  {
    case 0:
      KGLoggingConnection();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v19[0] = 0;
        _os_log_error_impl(&dword_1CA0A5000, v8, OS_LOG_TYPE_ERROR, "unable to provide useful predicate for None element type", (uint8_t *)v19, 2u);
      }

      goto LABEL_5;
    case 1:
      v13 = operator new();
      database = (char *)v7->_database;
      v18 = *(_QWORD *)a3;
      *(_QWORD *)v13 = &off_1E83E5590;
      *(_QWORD *)(v13 + 8) = v18;
      *(_OWORD *)(v13 + 16) = 0u;
      *(_OWORD *)(v13 + 32) = 0u;
      std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)(v13 + 24), *((__int128 **)a3 + 2), *((__int128 **)a3 + 3), (uint64_t)(*((_QWORD *)a3 + 3) - *((_QWORD *)a3 + 2)) >> 4);
      v16 = database + 192;
      goto LABEL_11;
    case 2:
      v9 = operator new();
      v10 = (char *)v7->_database;
      v11 = *(_QWORD *)a3;
      *(_QWORD *)v9 = &off_1E83E5640;
      *(_QWORD *)(v9 + 8) = v11;
      *(_OWORD *)(v9 + 16) = 0u;
      *(_OWORD *)(v9 + 32) = 0u;
      std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)(v9 + 24), *((__int128 **)a3 + 2), *((__int128 **)a3 + 3), (uint64_t)(*((_QWORD *)a3 + 3) - *((_QWORD *)a3 + 2)) >> 4);
      v12 = v10 + 248;
      goto LABEL_9;
    case 3:
      v13 = operator new();
      database = (char *)v7->_database;
      v15 = *(_QWORD *)a3;
      *(_QWORD *)v13 = &off_1E83E5590;
      *(_QWORD *)(v13 + 8) = v15;
      *(_OWORD *)(v13 + 16) = 0u;
      *(_OWORD *)(v13 + 32) = 0u;
      std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)(v13 + 24), *((__int128 **)a3 + 2), *((__int128 **)a3 + 3), (uint64_t)(*((_QWORD *)a3 + 3) - *((_QWORD *)a3 + 2)) >> 4);
      v16 = database + 808;
LABEL_11:
      *(_BYTE *)(v13 + 48) = *((_BYTE *)a3 + 40);
      *(_QWORD *)(v13 + 56) = v16;
      *(_QWORD *)(v13 + 64) = database;
      self = (KGDatabase *)std::shared_ptr<degas::Predicate>::shared_ptr[abi:ne180100]<degas::AnyLabelsNodePredicate,void>(v5, v13);
      break;
    case 4:
      v9 = operator new();
      v10 = (char *)v7->_database;
      v17 = *(_QWORD *)a3;
      *(_QWORD *)v9 = &off_1E83E5640;
      *(_QWORD *)(v9 + 8) = v17;
      *(_OWORD *)(v9 + 16) = 0u;
      *(_OWORD *)(v9 + 32) = 0u;
      std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)(v9 + 24), *((__int128 **)a3 + 2), *((__int128 **)a3 + 3), (uint64_t)(*((_QWORD *)a3 + 3) - *((_QWORD *)a3 + 2)) >> 4);
      v12 = v10 + 864;
LABEL_9:
      *(_BYTE *)(v9 + 48) = *((_BYTE *)a3 + 40);
      *(_QWORD *)(v9 + 56) = v12;
      *(_QWORD *)(v9 + 64) = v10;
      self = (KGDatabase *)std::shared_ptr<degas::Predicate>::shared_ptr[abi:ne180100]<degas::AnyLabelsEdgePredicate,void>(v5, v9);
      break;
    default:
LABEL_5:
      *v5 = 0;
      v5[1] = 0;
      break;
  }
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (Predicate *)self;
  return result;
}

- (shared_ptr<degas::Predicate>)degasPredicateFromKGFilter:(id)a3 elementType:(int)a4
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  int32x4_t v15;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t i;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  unsigned int v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *p_shared_owners;
  unint64_t v40;
  unint64_t *v41;
  unint64_t v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  unsigned int v48;
  uint64_t v49;
  __int128 v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  unint64_t *v54;
  unint64_t v55;
  void *v56;
  uint64_t *v57;
  unint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  std::__shared_weak_count *v65;
  unint64_t *v66;
  unint64_t v67;
  std::__shared_weak_count *v68;
  unint64_t *v69;
  unint64_t v70;
  std::__shared_weak_count *v71;
  unint64_t *v72;
  unint64_t v73;
  Predicate *v74;
  __shared_weak_count *v75;
  char *v76;
  char *v77;
  uint64_t v78;
  _QWORD v79[6];
  int v80;
  __int128 v81;
  uint64_t v82;
  __n128 (*v83)(__n128 *, __n128 *);
  void (*v84)(uint64_t);
  void *v85;
  _QWORD v86[4];
  __int128 v87;
  _QWORD v88[4];
  __int128 v89;
  _QWORD v90[4];
  __int128 v91;
  __int128 v92;
  int32x4_t v93;
  char **v94;
  shared_ptr<degas::Predicate> result;

  v5 = *(_QWORD *)&a4;
  v7 = v4;
  v8 = a3;
  v93 = 0uLL;
  v92 = 0uLL;
  v91 = 0uLL;
  v89 = 0u;
  memset(v90, 0, 25);
  v87 = 0u;
  memset(v88, 0, 25);
  objc_msgSend(v8, "requiredLabels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    objc_msgSend(v8, "requiredLabels");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[KGDatabase labelIdentifiers:forLabels:](self, "labelIdentifiers:forLabels:", &v89, v11);

    if (!v12)
    {
      v23 = (_QWORD *)operator new();
      *v23 = &off_1E83E54E0;
      std::shared_ptr<degas::Predicate>::shared_ptr[abi:ne180100]<degas::NoPredicate,void>(v7, (uint64_t)v23);
      goto LABEL_106;
    }
  }
  objc_msgSend(v8, "optionalLabels");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    objc_msgSend(v8, "optionalLabels");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[KGDatabase labelIdentifiers:forLabels:](self, "labelIdentifiers:forLabels:", &v87, v16);

    v17 = v87;
    if ((_QWORD)v87 == 0xFFFFFFFFLL)
    {
      v19 = (uint64_t *)v88[1];
      v18 = (uint64_t *)v88[0];
      if (v88[0] == v88[1])
      {
        v17 = 0;
      }
      else
      {
        v17 = 0;
        do
        {
          v20 = *v18;
          v21 = *(_DWORD *)(*v18 + 4);
          if (v21 == -1)
          {
            v22 = 0;
            v15 = 0uLL;
            do
            {
              do
              {
                v15 = (int32x4_t)vpadalq_u16((uint32x4_t)v15, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v20 + 4 * v22 + 16))));
                v22 += 4;
              }
              while (v22 != 32);
              v22 = 0;
              v21 = vaddvq_s32(v15);
              v15 = 0uLL;
            }
            while (v21 == -1);
            *(_DWORD *)(v20 + 4) = v21;
          }
          v17 += v21;
          v18 += 2;
        }
        while (v18 != v19);
      }
      *(_QWORD *)&v87 = v17;
    }
    if (!v17)
    {
      v29 = (_QWORD *)operator new();
      *v29 = &off_1E83E54E0;
      std::shared_ptr<degas::Predicate>::shared_ptr[abi:ne180100]<degas::NoPredicate,void>(v7, (uint64_t)v29);
      goto LABEL_106;
    }
  }
  else
  {
    v17 = v87;
  }
  if (v17 == 0xFFFFFFFFLL)
  {
    v25 = (uint64_t *)v88[1];
    v24 = (uint64_t *)v88[0];
    if (v88[0] == v88[1])
    {
      v17 = 0;
    }
    else
    {
      v17 = 0;
      do
      {
        v26 = *v24;
        v27 = *(_DWORD *)(*v24 + 4);
        if (v27 == -1)
        {
          v28 = 0;
          v15 = 0uLL;
          do
          {
            do
            {
              v15 = (int32x4_t)vpadalq_u16((uint32x4_t)v15, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v26 + 4 * v28 + 16))));
              v28 += 4;
            }
            while (v28 != 32);
            v28 = 0;
            v27 = vaddvq_s32(v15);
            v15 = 0uLL;
          }
          while (v27 == -1);
          *(_DWORD *)(v26 + 4) = v27;
        }
        v17 += v27;
        v24 += 2;
      }
      while (v24 != v25);
    }
    *(_QWORD *)&v87 = v17;
  }
  if (v17 == 1)
  {
    degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)&v89, (uint64_t)&v87);
    v87 = 0uLL;
    v31 = v88[1];
    for (i = v88[0]; v31 != i; v31 -= 16)
    {
      degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(v31 - 16));
      *(_QWORD *)(v31 - 8) = 0;
    }
    v88[1] = i;
  }
  v32 = v89;
  if ((_QWORD)v89 == 0xFFFFFFFFLL)
  {
    v34 = (uint64_t *)v90[1];
    v33 = (uint64_t *)v90[0];
    if (v90[0] == v90[1])
    {
      v32 = 0;
    }
    else
    {
      v32 = 0;
      do
      {
        v35 = *v33;
        v36 = *(_DWORD *)(*v33 + 4);
        if (v36 == -1)
        {
          v37 = 0;
          v15 = 0uLL;
          do
          {
            do
            {
              v15 = (int32x4_t)vpadalq_u16((uint32x4_t)v15, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v35 + 4 * v37 + 16))));
              v37 += 4;
            }
            while (v37 != 32);
            v37 = 0;
            v36 = vaddvq_s32(v15);
            v15 = 0uLL;
          }
          while (v36 == -1);
          *(_DWORD *)(v35 + 4) = v36;
        }
        v32 += v36;
        v33 += 2;
      }
      while (v33 != v34);
    }
    *(_QWORD *)&v89 = v32;
  }
  if (v32)
  {
    -[KGDatabase degasPredicateForAllLabels:elementType:](self, "degasPredicateForAllLabels:elementType:", &v89, v5, *(double *)v15.i64);
    v15 = (int32x4_t)v81;
    v81 = 0uLL;
    v38 = (std::__shared_weak_count *)v93.i64[1];
    v93 = v15;
    if (v38)
    {
      p_shared_owners = (unint64_t *)&v38->__shared_owners_;
      do
        v40 = __ldaxr(p_shared_owners);
      while (__stlxr(v40 - 1, p_shared_owners));
      if (!v40)
      {
        ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
        std::__shared_weak_count::__release_weak(v38);
      }
    }
    if (*((_QWORD *)&v81 + 1))
    {
      v41 = (unint64_t *)(*((_QWORD *)&v81 + 1) + 8);
      do
        v42 = __ldaxr(v41);
      while (__stlxr(v42 - 1, v41));
      if (!v42)
      {
        (*(void (**)(_QWORD))(**((_QWORD **)&v81 + 1) + 16))(*((_QWORD *)&v81 + 1));
        std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v81 + 1));
      }
    }
    v43 = 1;
  }
  else
  {
    v43 = 0;
  }
  v44 = v87;
  if ((_QWORD)v87 == 0xFFFFFFFFLL)
  {
    v46 = (uint64_t *)v88[1];
    v45 = (uint64_t *)v88[0];
    if (v88[0] == v88[1])
    {
      v44 = 0;
    }
    else
    {
      v44 = 0;
      do
      {
        v47 = *v45;
        v48 = *(_DWORD *)(*v45 + 4);
        if (v48 == -1)
        {
          v49 = 0;
          v15 = 0uLL;
          do
          {
            do
            {
              v15 = (int32x4_t)vpadalq_u16((uint32x4_t)v15, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v47 + 4 * v49 + 16))));
              v49 += 4;
            }
            while (v49 != 32);
            v49 = 0;
            v48 = vaddvq_s32(v15);
            v15 = 0uLL;
          }
          while (v48 == -1);
          *(_DWORD *)(v47 + 4) = v48;
        }
        v44 += v48;
        v45 += 2;
      }
      while (v45 != v46);
    }
    *(_QWORD *)&v87 = v44;
  }
  if (v44)
  {
    -[KGDatabase degasPredicateForAnyLabels:elementType:](self, "degasPredicateForAnyLabels:elementType:", &v87, v5, *(double *)v15.i64);
    v50 = v81;
    v81 = 0uLL;
    v51 = (std::__shared_weak_count *)*((_QWORD *)&v92 + 1);
    v92 = v50;
    if (v51)
    {
      v52 = (unint64_t *)&v51->__shared_owners_;
      do
        v53 = __ldaxr(v52);
      while (__stlxr(v53 - 1, v52));
      if (!v53)
      {
        ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
        std::__shared_weak_count::__release_weak(v51);
      }
    }
    if (*((_QWORD *)&v81 + 1))
    {
      v54 = (unint64_t *)(*((_QWORD *)&v81 + 1) + 8);
      do
        v55 = __ldaxr(v54);
      while (__stlxr(v55 - 1, v54));
      if (!v55)
      {
        (*(void (**)(_QWORD))(**((_QWORD **)&v81 + 1) + 16))(*((_QWORD *)&v81 + 1));
        std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v81 + 1));
      }
    }
    ++v43;
  }
  *(_QWORD *)&v81 = 0;
  *((_QWORD *)&v81 + 1) = &v81;
  v82 = 0x4812000000;
  v83 = __Block_byref_object_copy__106;
  v84 = __Block_byref_object_dispose__107;
  v85 = &unk_1CA220A29;
  memset(v86, 0, 24);
  objc_msgSend(v8, "properties");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __53__KGDatabase_degasPredicateFromKGFilter_elementType___block_invoke;
  v79[3] = &unk_1E83E3928;
  v80 = v5;
  v79[4] = self;
  v79[5] = &v81;
  objc_msgSend(v56, "enumerateKeysAndObjectsUsingBlock:", v79);

  v57 = *(uint64_t **)(*((_QWORD *)&v81 + 1) + 48);
  v58 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 56) - (_QWORD)v57;
  if (v58 >= 0x11)
  {
    v59 = (_QWORD *)operator new();
    v60 = *((_QWORD *)&v81 + 1);
    *v59 = &off_1E83E5698;
    v59[2] = 0;
    v59[3] = 0;
    v59[1] = 0;
    std::vector<std::shared_ptr<degas::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::Predicate>*,std::shared_ptr<degas::Predicate>*>(v59 + 1, *(_QWORD **)(v60 + 48), *(_QWORD **)(v60 + 56), (uint64_t)(*(_QWORD *)(v60 + 56) - *(_QWORD *)(v60 + 48)) >> 4);
    std::shared_ptr<degas::Predicate>::reset[abi:ne180100]<degas::IntersectPredicate,void>(&v91, (uint64_t)v59);
LABEL_89:
    ++v43;
    goto LABEL_90;
  }
  if (v58 == 16)
  {
    std::shared_ptr<degas::Statement>::operator=[abi:ne180100](&v91, *v57, v57[1]);
    goto LABEL_89;
  }
LABEL_90:
  if (v43 < 2)
  {
    if (v93.i64[0])
    {
      v62 = v93.i64[1];
      *v7 = v93.i64[0];
      v7[1] = v62;
      v93 = 0uLL;
    }
    else if ((_QWORD)v92)
    {
      v63 = *((_QWORD *)&v92 + 1);
      *v7 = v92;
      v7[1] = v63;
      v92 = 0uLL;
    }
    else if ((_QWORD)v91)
    {
      v64 = *((_QWORD *)&v91 + 1);
      *v7 = v91;
      v7[1] = v64;
      v91 = 0uLL;
    }
    else
    {
      *v7 = 0;
      v7[1] = 0;
    }
  }
  else
  {
    v76 = 0;
    v77 = 0;
    v78 = 0;
    if (v93.i64[0])
      std::vector<std::shared_ptr<degas::Predicate>>::push_back[abi:ne180100](&v76, (__int128 *)v93.i8);
    if ((_QWORD)v92)
      std::vector<std::shared_ptr<degas::Predicate>>::push_back[abi:ne180100](&v76, &v92);
    if ((_QWORD)v91)
      std::vector<std::shared_ptr<degas::Predicate>>::push_back[abi:ne180100](&v76, &v91);
    v61 = (_QWORD *)operator new();
    *v61 = &off_1E83E5698;
    v61[2] = 0;
    v61[3] = 0;
    v61[1] = 0;
    std::vector<std::shared_ptr<degas::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::Predicate>*,std::shared_ptr<degas::Predicate>*>(v61 + 1, v76, v77, (v77 - v76) >> 4);
    std::shared_ptr<degas::Predicate>::shared_ptr[abi:ne180100]<degas::IntersectPredicate,void>(v7, (uint64_t)v61);
    v94 = &v76;
    std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v94);
  }
  _Block_object_dispose(&v81, 8);
  v76 = (char *)v86;
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v76);
LABEL_106:
  *(_QWORD *)&v81 = v88;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v81);
  *(_QWORD *)&v81 = v90;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v81);
  v65 = (std::__shared_weak_count *)*((_QWORD *)&v91 + 1);
  if (*((_QWORD *)&v91 + 1))
  {
    v66 = (unint64_t *)(*((_QWORD *)&v91 + 1) + 8);
    do
      v67 = __ldaxr(v66);
    while (__stlxr(v67 - 1, v66));
    if (!v67)
    {
      ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
      std::__shared_weak_count::__release_weak(v65);
    }
  }
  v68 = (std::__shared_weak_count *)*((_QWORD *)&v92 + 1);
  if (*((_QWORD *)&v92 + 1))
  {
    v69 = (unint64_t *)(*((_QWORD *)&v92 + 1) + 8);
    do
      v70 = __ldaxr(v69);
    while (__stlxr(v70 - 1, v69));
    if (!v70)
    {
      ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
      std::__shared_weak_count::__release_weak(v68);
    }
  }
  v71 = (std::__shared_weak_count *)v93.i64[1];
  if (v93.i64[1])
  {
    v72 = (unint64_t *)(v93.i64[1] + 8);
    do
      v73 = __ldaxr(v72);
    while (__stlxr(v73 - 1, v72));
    if (!v73)
    {
      ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
      std::__shared_weak_count::__release_weak(v71);
    }
  }

  result.var1 = v75;
  result.var0 = v74;
  return result;
}

- (id)neighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 edgeFilter:(id)a5 error:(id *)a6
{
  id v10;
  int v11;
  uint64_t v12;
  KGElementIdentifierSet *v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  __int128 v21;
  uint64_t v22;
  _BYTE v23[23];
  degas::Database *v24;
  std::__shared_weak_count *v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  void **v28;

  v10 = a3;
  -[KGDatabase degasPredicateFromKGFilter:elementType:](self, "degasPredicateFromKGFilter:elementType:", a5, 2);
  degas::NeighborQuery::NeighborQuery((uint64_t)&v24, &v26, (uint64_t)self->_database);
  *(_OWORD *)v23 = 0u;
  v11 = degas::NeighborQuery::neighbors(&v24, (degas::Bitmap *)objc_msgSend(v10, "bitmap", 0, 0, 0, 0, 0, *(_QWORD *)&v23[15]), -[KGDatabase degasEdgeDirectionFromKG:](self, "degasEdgeDirectionFromKG:", a4), (degas::Bitmap *)&v21);
  if (v11)
  {
    if (a6)
    {
      if ((v11 - 2) > 8)
        v12 = -1;
      else
        v12 = qword_1CA1FE588[v11 - 2];
      kg_errorWithCode(v12);
      v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v21);
  }
  v28 = (void **)&v22;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v28);
  v14 = v25;
  if (v25)
  {
    p_shared_owners = (unint64_t *)&v25->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  v17 = v27;
  if (v27)
  {
    v18 = (unint64_t *)&v27->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }

  return v13;
}

- (id)transitiveClosureNeighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 edgeFilter:(id)a5 error:(id *)a6
{
  id v10;
  int v11;
  uint64_t v12;
  KGElementIdentifierSet *v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  __int128 v21;
  uint64_t v22;
  _BYTE v23[23];
  _BYTE v24[8];
  std::__shared_weak_count *v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  void **v28;

  v10 = a3;
  -[KGDatabase degasPredicateFromKGFilter:elementType:](self, "degasPredicateFromKGFilter:elementType:", a5, 2);
  degas::NeighborQuery::NeighborQuery((uint64_t)v24, &v26, (uint64_t)self->_database);
  *(_OWORD *)v23 = 0u;
  v11 = degas::NeighborQuery::transitiveClosureNeighbors((degas::NeighborQuery *)v24, (degas::Bitmap *)objc_msgSend(v10, "bitmap", 0, 0, 0, 0, 0, *(_QWORD *)&v23[15]), -[KGDatabase degasEdgeDirectionFromKG:](self, "degasEdgeDirectionFromKG:", a4), &v21);
  if (v11)
  {
    if (a6)
    {
      if ((v11 - 2) > 8)
        v12 = -1;
      else
        v12 = qword_1CA1FE588[v11 - 2];
      kg_errorWithCode(v12);
      v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v21);
  }
  v28 = (void **)&v22;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v28);
  v14 = v25;
  if (v25)
  {
    p_shared_owners = (unint64_t *)&v25->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  v17 = v27;
  if (v27)
  {
    v18 = (unint64_t *)&v27->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }

  return v13;
}

- (BOOL)beginTransactionWithError:(id *)a3
{
  int v5;
  int v6;
  uint64_t v7;

  v5 = degas::Database::beginTransaction((sqlite3 **)self->_database);
  v6 = v5;
  if (a3 && v5)
  {
    if ((v5 - 2) > 8)
      v7 = -1;
    else
      v7 = qword_1CA1FE588[v5 - 2];
    kg_errorWithCode(v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[KGDatabaseNameCache transactionBegin](self->_nameCache, "transactionBegin");
  return v6 == 0;
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  int v5;
  uint64_t v6;

  v5 = degas::Database::commitTransaction((degas::Database *)self->_database);
  if (v5)
  {
    -[KGDatabaseNameCache unloadCache](self->_nameCache, "unloadCache");
    if (a3)
    {
      if ((v5 - 2) > 8)
        v6 = -1;
      else
        v6 = qword_1CA1FE588[v5 - 2];
      kg_errorWithCode(v6);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  -[KGDatabaseNameCache transactionEnd](self->_nameCache, "transactionEnd");
  return v5 == 0;
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  int v5;
  uint64_t v6;

  v5 = degas::Database::rollbackTransaction((degas::Database *)self->_database);
  -[KGDatabaseNameCache unloadCache](self->_nameCache, "unloadCache");
  if (a3 && v5)
  {
    if ((v5 - 2) > 8)
      v6 = -1;
    else
      v6 = qword_1CA1FE588[v5 - 2];
    kg_errorWithCode(v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[KGDatabaseNameCache transactionEnd](self->_nameCache, "transactionEnd");
  return v5 == 0;
}

- (void)database
{
  return self->_database;
}

- (BOOL)validateLabelReferencesWithError:(id *)a3
{
  int v4;
  int v5;
  uint64_t v6;

  v4 = degas::Database::validateLabelReferences((degas::Database *)self->_database);
  v5 = v4;
  if (a3 && v4)
  {
    if ((v4 - 2) > 8)
      v6 = -1;
    else
      v6 = qword_1CA1FE588[v4 - 2];
    kg_errorWithCode(v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5 == 0;
}

- (NSURL)url
{
  return self->_url;
}

- (unint64_t)databaseStatus
{
  return self->_databaseStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_lockFile, 0);
  objc_storeStrong((id *)&self->_nameCache, 0);
}

void __53__KGDatabase_degasPredicateFromKGFilter_elementType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  __int128 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  void *v19;
  __int128 v20;
  NSObject *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  __int128 v24;
  std::__shared_weak_count *v25;
  uint8_t buf[16];
  __int128 v27;

  v5 = a3;
  v6 = objc_msgSend(*(id *)(a1 + 32), "attributeIdentifierForPropertyName:", a2);
  v27 = 0uLL;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "allObjects");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v5;
    if (objc_msgSend(v8, "count"))
    {
      v9 = *(void **)(a1 + 32);
      if (v9)
      {
        objc_msgSend(v9, "degasPredicateFromValueArray:attrId:elementType:", v8, v6, *(unsigned int *)(a1 + 48));
        v10 = *(_OWORD *)buf;
      }
      else
      {
        v10 = 0uLL;
      }
      v24 = v10;
      v27 = v10;
    }
    else
    {
      v24 = 0u;
    }
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v5;
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v8, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "comparator");
    if (v11)
    {
      objc_msgSend(v11, "degasPredicateFromValue:comparator:attrId:elementType:", v12, v13, v6, *(unsigned int *)(a1 + 48));
      v14 = *(_OWORD *)buf;
    }
    else
    {
      v14 = 0uLL;
    }
    v24 = v14;
    memset(buf, 0, sizeof(buf));
    v27 = v14;
LABEL_24:

LABEL_25:
    v20 = v24;
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v5;
    v15 = *(void **)(a1 + 32);
    objc_msgSend(v8, "value1");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value2");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v8, "comparator");
    if (v15)
    {
      objc_msgSend(v15, "degasRangePredicateFromValue1:value2:comparator:attrId:elementType:", v12, v16, v17, v6, *(unsigned int *)(a1 + 48));
      v18 = *(_OWORD *)buf;
    }
    else
    {
      v18 = 0uLL;
    }
    v24 = v18;
    memset(buf, 0, sizeof(buf));
    v27 = v18;

    goto LABEL_24;
  }
  v19 = *(void **)(a1 + 32);
  if (v19)
  {
    objc_msgSend(v19, "degasPredicateFromValue:comparator:attrId:elementType:", v5, 1, v6, *(unsigned int *)(a1 + 48));
    v20 = *(_OWORD *)buf;
  }
  else
  {
    v20 = 0uLL;
  }
  v27 = v20;
LABEL_26:
  v25 = (std::__shared_weak_count *)*((_QWORD *)&v20 + 1);
  if ((_QWORD)v20)
  {
    std::vector<std::shared_ptr<degas::Predicate>>::push_back[abi:ne180100]((char **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), &v27);
  }
  else
  {
    KGLoggingConnection();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA0A5000, v21, OS_LOG_TYPE_ERROR, "unexpected null predicate", buf, 2u);
    }

  }
  if (v25)
  {
    p_shared_owners = (unint64_t *)&v25->__shared_owners_;
    do
      v23 = __ldaxr(p_shared_owners);
    while (__stlxr(v23 - 1, p_shared_owners));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }

}

- (void)transactionChangesAfterTransactionId:limit:block:
{
}

- (_QWORD)transactionChangesAfterTransactionId:limit:block:
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E83E3958;
  result[1] = v3;
  return result;
}

- (uint64_t)transactionChangesAfterTransactionId:limit:block:
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"Z63-[KGDatabase transactionChangesAfterTransactionId:limit:block:]E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void __100__KGDatabase_edgeIdentifiersSortedByPropertyForName_dataType_ascending_limit_edgeIdentifiers_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

void __100__KGDatabase_edgeIdentifiersSortedByPropertyForName_dataType_ascending_limit_edgeIdentifiers_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

void __100__KGDatabase_edgeIdentifiersSortedByPropertyForName_dataType_ascending_limit_edgeIdentifiers_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

void __100__KGDatabase_nodeIdentifiersSortedByPropertyForName_dataType_ascending_limit_nodeIdentifiers_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

void __100__KGDatabase_nodeIdentifiersSortedByPropertyForName_dataType_ascending_limit_nodeIdentifiers_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

void __100__KGDatabase_nodeIdentifiersSortedByPropertyForName_dataType_ascending_limit_nodeIdentifiers_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

void __52__KGDatabase_setEdgeProperties_forIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  int v12;
  degas::Database *v13;
  unint64_t v14;
  double v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  void *__p[2];
  char v20;

  v7 = a2;
  v8 = a3;
  v9 = objc_msgSend(v8, "dataType");
  v10 = objc_msgSend(*(id *)(a1 + 32), "attributeIdentifierForPropertyName:", v7);
  degas::Bitmap::setBit((degas::Bitmap *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), v10);
  switch(v9)
  {
    case 0:
      v11 = v8;
      v12 = degas::Database::setEdgeAttributeValue(*(degas::Database **)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 56), v10, objc_msgSend(v11, "value"));
      goto LABEL_8;
    case 1:
      v11 = v8;
      v12 = degas::Database::setEdgeAttributeValueUnsigned(*(degas::Database **)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 56), v10, objc_msgSend(v11, "value"));
      goto LABEL_8;
    case 2:
      v11 = v8;
      v13 = *(degas::Database **)(*(_QWORD *)(a1 + 32) + 8);
      v14 = *(_QWORD *)(a1 + 56);
      objc_msgSend(v11, "value");
      v12 = degas::Database::setEdgeAttributeValue(v13, v14, v10, v15);
LABEL_8:
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v12;
      goto LABEL_9;
    case 3:
      v11 = v8;
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v17 = *(_QWORD *)(a1 + 56);
      objc_msgSend(v11, "value");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v18, "cStringUsingEncoding:", 4));
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = degas::Database::setEdgeAttributeValue(v16, v17, v10, (uint64_t *)__p);
      if (v20 < 0)
        operator delete(__p[0]);

LABEL_9:
      break;
    default:
      break;
  }
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a4 = 1;

}

void __52__KGDatabase_setNodeProperties_forIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  int v12;
  degas::Database *v13;
  unint64_t v14;
  double v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  void *__p[2];
  char v20;

  v7 = a2;
  v8 = a3;
  v9 = objc_msgSend(v8, "dataType");
  v10 = objc_msgSend(*(id *)(a1 + 32), "attributeIdentifierForPropertyName:", v7);
  degas::Bitmap::setBit((degas::Bitmap *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), v10);
  switch(v9)
  {
    case 0:
      v11 = v8;
      v12 = degas::Database::setNodeAttributeValue(*(degas::Database **)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 56), v10, objc_msgSend(v11, "value"));
      goto LABEL_8;
    case 1:
      v11 = v8;
      v12 = degas::Database::setNodeAttributeValueUnsigned(*(degas::Database **)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 56), v10, objc_msgSend(v11, "value"));
      goto LABEL_8;
    case 2:
      v11 = v8;
      v13 = *(degas::Database **)(*(_QWORD *)(a1 + 32) + 8);
      v14 = *(_QWORD *)(a1 + 56);
      objc_msgSend(v11, "value");
      v12 = degas::Database::setNodeAttributeValue(v13, v14, v10, v15);
LABEL_8:
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v12;
      goto LABEL_9;
    case 3:
      v11 = v8;
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v17 = *(_QWORD *)(a1 + 56);
      objc_msgSend(v11, "value");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v18, "cStringUsingEncoding:", 4));
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = degas::Database::setNodeAttributeValue(v16, v17, v10, (uint64_t *)__p);
      if (v20 < 0)
        operator delete(__p[0]);

LABEL_9:
      break;
    default:
      break;
  }
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a4 = 1;

}

void __67__KGDatabase__enumerateEdgesWithEdgeCursor_propertiesCursor_block___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  v7 = a3;
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 72);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__KGDatabase__enumerateEdgesWithEdgeCursor_propertiesCursor_block___block_invoke_2;
  v15[3] = &unk_1E83E3838;
  v19 = a2;
  v14 = v7;
  v16 = v14;
  v10 = *(id *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v17 = v10;
  v18 = v11;
  objc_msgSend(v8, "_enumerateEdgeTableWithEdgeCursor:block:", v9, v15);
  if ((objc_msgSend(*(id *)(a1 + 32), "noFatalError") & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(_QWORD *)(v12 + 24) + 1;
  *(_QWORD *)(v12 + 24) = v13;
  if (__ROR8__(0x8F5C28F5C28F5C29 * v13, 2) <= 0x28F5C28F5C28F5CuLL)
  {
    objc_autoreleasePoolPop(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = MEMORY[0x1CAA4B20C]();
  }

}

uint64_t __67__KGDatabase__enumerateEdgesWithEdgeCursor_propertiesCursor_block___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__KGDatabase__enumerateEdgesWithEdgeCursor_propertiesCursor_block___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, BOOL *a6)
{
  id v9;
  BOOL v10;
  id v11;

  v11 = a3;
  if (*(_QWORD *)(a1 + 56) == a2)
    v9 = *(id *)(a1 + 32);
  else
    v9 = (id)MEMORY[0x1E0C9AA70];
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    v10 = 1;
  else
    v10 = *(_QWORD *)(a1 + 56) == a2;
  *a6 = v10;

}

void __67__KGDatabase__enumerateNodesWithNodeCursor_propertiesCursor_block___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  v7 = a3;
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 72);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__KGDatabase__enumerateNodesWithNodeCursor_propertiesCursor_block___block_invoke_2;
  v15[3] = &unk_1E83E37C0;
  v19 = a2;
  v14 = v7;
  v16 = v14;
  v10 = *(id *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v17 = v10;
  v18 = v11;
  objc_msgSend(v8, "_enumerateNodeTableWithNodeCursor:block:", v9, v15);
  if ((objc_msgSend(*(id *)(a1 + 32), "noFatalError") & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(_QWORD *)(v12 + 24) + 1;
  *(_QWORD *)(v12 + 24) = v13;
  if (__ROR8__(0x8F5C28F5C28F5C29 * v13, 2) <= 0x28F5C28F5C28F5CuLL)
  {
    objc_autoreleasePoolPop(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = MEMORY[0x1CAA4B20C]();
  }

}

uint64_t __67__KGDatabase__enumerateNodesWithNodeCursor_propertiesCursor_block___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__KGDatabase__enumerateNodesWithNodeCursor_propertiesCursor_block___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, BOOL *a4)
{
  id v7;
  BOOL v8;
  id v9;

  v9 = a3;
  if (*(_QWORD *)(a1 + 56) == a2)
    v7 = *(id *)(a1 + 32);
  else
    v7 = (id)MEMORY[0x1E0C9AA70];
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    v8 = 1;
  else
    v8 = *(_QWORD *)(a1 + 56) == a2;
  *a4 = v8;

}

+ (void)initialize
{
  void *v2;
  uint64_t v3;
  char *v4;
  char *v5;
  void *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("com.apple.knowledgegraph.explainmode"));

  if (v3 == 1)
  {
    v4 = &degas::sExplainQuery;
    v5 = &degas::sExplainQueryPlan;
  }
  else
  {
    if (v3 != 2)
      goto LABEL_6;
    v4 = &degas::sExplainQueryPlan;
    v5 = &degas::sExplainQuery;
  }
  *v5 = 1;
  *v4 = 0;
LABEL_6:
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerForKey:", CFSTR("com.apple.knowledgegraph.querylogging"));

  if (v7 == 1)
  {
    v8 = &degas::sQueryLogging;
  }
  else
  {
    if (v7 != 2)
      goto LABEL_11;
    v8 = &degas::sQueryProfiling;
  }
  *v8 = 1;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLForKey:", CFSTR("com.apple.knowledgegraph.instrumentedtraversal"));

  if (v10)
    degas::sInstrumentTraversal = 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("com.apple.knowledgegraph.insertlabeltracking"));

  if (v12)
    degas::sDatabaseInsertLabelTracking = 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("com.apple.knowledgegraph.labelreferencechecking"));

  if (v14)
    degas::sDatabaseLabelReferenceChecking = 1;
}

+ (BOOL)destroyAtURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  int v10;
  void *__p[2];
  char v13;

  v5 = a3;
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "fileExistsAtPath:", v6))
  {
    v8 = objc_retainAutorelease(v5);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v8, "fileSystemRepresentation"));
    v9 = degas::Database::truncateDatabaseAtPath((uint64_t *)__p);
    v10 = v9;
    if ((v13 & 0x80000000) == 0)
    {
      if (!v9)
        goto LABEL_7;
      goto LABEL_6;
    }
    operator delete(__p[0]);
    if (v10)
LABEL_6:
      objc_msgSend(a1, "deleteClosedDatabaseFilesAtStoreURL:", v8);
  }
LABEL_7:

  return 1;
}

+ (BOOL)emptyDatabaseExistsAtURL:(id)a3 error:(id *)a4
{
  id v5;
  int isEmptyDatabaseAtPath;
  unsigned int v7;
  uint64_t v8;
  void *__p[2];
  char v11;

  v5 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v5, "fileSystemRepresentation"));
  isEmptyDatabaseAtPath = degas::Database::isEmptyDatabaseAtPath((const char *)__p);
  if (v11 < 0)
    operator delete(__p[0]);
  v7 = isEmptyDatabaseAtPath - 2;
  if (isEmptyDatabaseAtPath != 2 && a4 && isEmptyDatabaseAtPath != 1)
  {
    if (v7 > 8)
      v8 = -1;
    else
      v8 = qword_1CA1FE588[v7];
    kg_errorWithCode(v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return isEmptyDatabaseAtPath == 2;
}

+ (BOOL)copyFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  int Only;
  int v11;
  uint64_t v12;
  int v13;
  BOOL v14;
  uint64_t v15;
  void *__p[2];
  char v18;
  void *v19[212];

  v7 = a3;
  v8 = a4;
  degas::Database::Database((degas::Database *)v19);
  v9 = objc_retainAutorelease(v7);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v9, "fileSystemRepresentation"));
  Only = degas::Database::openReadOnly((std::string::size_type)v19, (std::string::size_type)__p);
  v11 = Only;
  if ((v18 & 0x80000000) == 0)
  {
    if (Only)
      goto LABEL_3;
LABEL_7:
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation"));
    v13 = degas::Database::backupDatabase((uint64_t)v19, (uint64_t)__p);
    if (v18 < 0)
    {
      operator delete(__p[0]);
      if (!a5)
      {
LABEL_19:
        degas::Database::close((degas::Database *)v19);
        v14 = v13 == 0;
        goto LABEL_20;
      }
    }
    else if (!a5)
    {
      goto LABEL_19;
    }
    if (v13)
    {
      if ((v13 - 2) > 8)
        v15 = -1;
      else
        v15 = qword_1CA1FE588[v13 - 2];
      kg_errorWithCode(v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_19;
  }
  operator delete(__p[0]);
  if (!v11)
    goto LABEL_7;
LABEL_3:
  if (a5)
  {
    if ((v11 - 2) > 8)
      v12 = -1;
    else
      v12 = qword_1CA1FE588[v11 - 2];
    kg_errorWithCode(v12);
    v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
LABEL_20:
  degas::Database::~Database(v19);

  return v14;
}

+ (BOOL)migrateFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  int v12;
  uint64_t v13;
  void *__p[2];
  char v16;
  void *v17[2];
  char v18;

  v8 = a3;
  v9 = a4;
  v10 = objc_retainAutorelease(v8);
  std::string::basic_string[abi:ne180100]<0>(v17, (char *)objc_msgSend(v10, "fileSystemRepresentation"));
  v11 = objc_retainAutorelease(v9);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v11, "fileSystemRepresentation"));
  v12 = degas::Database::copyDatabaseFromTo((const char *)v17, __p);
  if (v16 < 0)
    operator delete(__p[0]);
  if ((v18 & 0x80000000) == 0)
  {
    if (v12)
      goto LABEL_5;
LABEL_9:
    objc_msgSend(a1, "destroyAtURL:error:", v10, a5);
    goto LABEL_12;
  }
  operator delete(v17[0]);
  if (!v12)
    goto LABEL_9;
LABEL_5:
  if (a5)
  {
    if ((v12 - 2) > 8)
      v13 = -1;
    else
      v13 = qword_1CA1FE588[v12 - 2];
    kg_errorWithCode(v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:

  return v12 == 0;
}

+ (void)deleteClosedDatabaseFilesAtStoreURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  char v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fileExistsAtPath:", v5))
  {
    v16 = 0;
    v6 = objc_msgSend(v4, "removeItemAtPath:error:", v5, &v16);
    v7 = v16;
    if (v6)
    {
      objc_msgSend(v5, "stringByAppendingString:", CFSTR("-wal"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v7;
      v9 = objc_msgSend(v4, "removeItemAtPath:error:", v8, &v15);
      v10 = v15;

      if (v9)
      {
        objc_msgSend(v5, "stringByAppendingString:", CFSTR("-shm"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v10;
        v12 = objc_msgSend(v4, "removeItemAtPath:error:", v11, &v14);
        v7 = v14;

        if ((v12 & 1) != 0)
          goto LABEL_11;
      }
      else
      {
        v7 = v10;
      }
    }
    KGLoggingConnection();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v7;
      _os_log_error_impl(&dword_1CA0A5000, v13, OS_LOG_TYPE_ERROR, "failed deleting database files: %@", buf, 0xCu);
    }

  }
  else
  {
    v7 = 0;
  }
LABEL_11:

}

@end
