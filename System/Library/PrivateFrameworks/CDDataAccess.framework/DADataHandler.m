@implementation DADataHandler

- (DADataHandler)initWithContainer:(void *)a3 changeTrackingID:(id)a4
{
  id v7;
  DADataHandler *v8;
  uint64_t v9;
  NSString *changeTrackingID;
  void *v12;
  objc_super v13;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DADataHandlers.m"), 20, CFSTR("Can't initialize a DADataHandler with a nil changeTrackingID"));

  }
  v13.receiver = self;
  v13.super_class = (Class)DADataHandler;
  v8 = -[DADataHandler init](&v13, sel_init);
  if (v8)
  {
    if (a3)
      v8->_container = (void *)CFRetain(a3);
    v9 = objc_msgSend(v7, "copy");
    changeTrackingID = v8->_changeTrackingID;
    v8->_changeTrackingID = (NSString *)v9;

  }
  return v8;
}

- (void)setContainer:(void *)a3
{
  void *container;

  container = self->_container;
  if (container != a3)
  {
    if (container)
    {
      CFRelease(container);
      self->_container = 0;
    }
    if (a3)
      CFRetain(a3);
    self->_container = a3;
  }
}

- (void)dealloc
{
  void *container;
  objc_super v4;

  container = self->_container;
  if (container)
  {
    CFRelease(container);
    self->_container = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DADataHandler;
  -[DADataHandler dealloc](&v4, sel_dealloc);
}

- (int64_t)dataclass
{
  NSObject *v3;
  os_log_type_t v4;
  int v6;
  const char *Name;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    v6 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1C1CD1000, v3, v4, "%s to be implemented by subclass", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (int)getIdFromLocalObject:(void *)a3
{
  NSObject *v4;
  os_log_type_t v5;
  int v7;
  const char *Name;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v4, v5))
  {
    v7 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1C1CD1000, v4, v5, "%s to be implemented by subclass", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (void)copyLocalObjectFromId:(int)a3
{
  NSObject *v4;
  os_log_type_t v5;
  int v7;
  const char *Name;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v4, v5))
  {
    v7 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1C1CD1000, v4, v5, "%s to be implemented by subclass", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (BOOL)saveContainer
{
  NSObject *v3;
  os_log_type_t v4;
  int v6;
  const char *Name;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    v6 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1C1CD1000, v3, v4, "%s to be implemented by subclass", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (id)copyOfAllLocalObjectsInContainer
{
  NSObject *v3;
  os_log_type_t v4;
  int v6;
  const char *Name;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    v6 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1C1CD1000, v3, v4, "%s to be implemented by subclass", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (void)drainContainer
{
  NSObject *v3;
  os_log_type_t v4;
  int v5;
  const char *Name;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    v5 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1C1CD1000, v3, v4, "%s to be implemented by subclass", (uint8_t *)&v5, 0xCu);
  }

}

- (BOOL)wipeServerIds
{
  NSObject *v3;
  os_log_type_t v4;
  int v6;
  const char *Name;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    v6 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1C1CD1000, v3, v4, "%s to be implemented by subclass", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (void)drainSuperfluousChanges
{
  NSObject *v3;
  os_log_type_t v4;
  int v5;
  const char *Name;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    v5 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1C1CD1000, v3, v4, "%s to be implemented by subclass", (uint8_t *)&v5, 0xCu);
  }

}

- (void)openDB
{
  NSObject *v3;
  os_log_type_t v4;
  int v5;
  const char *Name;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    v5 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1C1CD1000, v3, v4, "%s to be implemented by subclass", (uint8_t *)&v5, 0xCu);
  }

}

- (BOOL)closeDBAndSave:(BOOL)a3
{
  NSObject *v4;
  os_log_type_t v5;
  int v7;
  const char *Name;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v4, v5))
  {
    v7 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1C1CD1000, v4, v5, "%s to be implemented by subclass", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

+ (id)newDataHandlerForDataclass:(int64_t)a3 container:(void *)a4 changeTrackingID:(id)a5
{
  NSObject *v6;
  os_log_type_t v7;
  int v9;
  const char *Name;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v6, v7))
  {
    v9 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1C1CD1000, v6, v7, "%s to be implemented by subclass", (uint8_t *)&v9, 0xCu);
  }

  return 0;
}

- (id)getDAObjectWithLocalItem:(void *)a3 serverId:(id)a4 account:(id)a5
{
  NSObject *v6;
  os_log_type_t v7;
  int v9;
  const char *Name;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v6, v7))
  {
    v9 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1C1CD1000, v6, v7, "%s to be implemented by subclass", (uint8_t *)&v9, 0xCu);
  }

  return 0;
}

- (id)getDAExceptionObjectWithLocalItem:(void *)a3 originalEvent:(id)a4 account:(id)a5
{
  NSObject *v6;
  os_log_type_t v7;
  int v9;
  const char *Name;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v6, v7))
  {
    v9 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1C1CD1000, v6, v7, "%s to be implemented by subclass", (uint8_t *)&v9, 0xCu);
  }

  return 0;
}

- (void)container
{
  return self->_container;
}

- (NSString)changeTrackingID
{
  return self->_changeTrackingID;
}

- (void)setChangeTrackingID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeTrackingID, 0);
}

@end
