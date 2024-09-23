@implementation IMAbstractDatabaseArchiver

- (IMAbstractDatabaseArchiver)initWithSourceDatabasePath:(id)a3 destinationDatabasePath:(id)a4
{
  uint64_t v7;
  void (*v8)(uint64_t);
  NSObject *v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  NSObject *v12;
  IMAbstractDatabaseArchiver *v13;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v16 = xmmword_1E5AB7228;
    v17 = *(_OWORD *)off_1E5AB7238;
    v18 = 23;
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected nil '%@' in %s at %s:%d. %@"), CFSTR("sourcePath"), "-[IMAbstractDatabaseArchiver initWithSourceDatabasePath:destinationDatabasePath:]", IMFileLocationTrimFileName(), 23, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70));
    v8 = (void (*)(uint64_t))IMGetAssertionFailureHandler();
    if (v8)
    {
      v8(v7);
    }
    else if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v7;
        _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
      }
    }
  }
  if (!a4)
  {
    v16 = xmmword_1E5AB7250;
    v17 = *(_OWORD *)off_1E5AB7260;
    v18 = 24;
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected nil '%@' in %s at %s:%d. %@"), CFSTR("destinationPath"), "-[IMAbstractDatabaseArchiver initWithSourceDatabasePath:destinationDatabasePath:]", IMFileLocationTrimFileName(), 24, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70));
    v11 = (void (*)(uint64_t))IMGetAssertionFailureHandler();
    if (v11)
    {
      v11(v10);
    }
    else if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v10;
        _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)IMAbstractDatabaseArchiver;
  v13 = -[IMAbstractDatabaseArchiver init](&v15, sel_init);
  if (v13)
  {
    v13->_sourcePath = (NSString *)objc_msgSend((id)objc_msgSend(a3, "stringByExpandingTildeInPath"), "copy");
    v13->_destinationPath = (NSString *)objc_msgSend((id)objc_msgSend(a4, "stringByExpandingTildeInPath"), "copy");
  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMAbstractDatabaseArchiver;
  -[IMAbstractDatabaseArchiver dealloc](&v3, sel_dealloc);
}

- (BOOL)copyDatabase:(id)a3
{
  uint64_t v4;
  void (*v5)(uint64_t);
  NSObject *v6;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failure in %s at %s:%d. %@"), "-[IMAbstractDatabaseArchiver copyDatabase:]", IMFileLocationTrimFileName(), 41, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("required override")), 0x1ABC761FALL, 0, "-[IMAbstractDatabaseArchiver copyDatabase:]", "-[IMAbstractDatabaseArchiver copyDatabase:]");
  v5 = (void (*)(uint64_t))IMGetAssertionFailureHandler();
  if (v5)
  {
    v5(v4);
  }
  else if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
    }
  }
  if (a3)
    (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
  return 0;
}

- (BOOL)deleteFailedArchiveAtPath:(id)a3 error:(id *)a4
{
  NSLog(CFSTR("Attempting to delete failed anonymized database..."), a2, a3, a4);
  IMDDatabaseDelete((uint64_t)a3);
  return 1;
}

- (NSString)destinationPath
{
  return self->_destinationPath;
}

- (NSString)sourcePath
{
  return self->_sourcePath;
}

@end
