@implementation GTDiagnosticsIssue

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTDiagnosticsIssue)initWithCoder:(id)a3
{
  id v4;
  GTDiagnosticsIssue *v5;
  uint64_t v6;
  NSArray *callstack;
  uint64_t v8;
  NSData *cpuCallstackData;
  uint64_t v10;
  NSString *libraryOnlineSource;
  uint64_t v12;
  NSData *libraryOfflineSource;
  uint64_t v14;
  NSString *libraryHash;
  uint64_t v16;
  NSString *metalFunctionName;
  uint64_t v18;
  NSURL *metalFunctionFile;
  uint64_t v20;
  NSString *metalLogMessage;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)GTDiagnosticsIssue;
  v5 = -[GTDiagnosticsIssue init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("callstack"));
    v6 = objc_claimAutoreleasedReturnValue();
    callstack = v5->_callstack;
    v5->_callstack = (NSArray *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cpuCallstackData"));
    v8 = objc_claimAutoreleasedReturnValue();
    cpuCallstackData = v5->_cpuCallstackData;
    v5->_cpuCallstackData = (NSData *)v8;

    v5->_cpuCallstackFramesNum = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("cpuCallstackFramesNum"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("libraryOnlineSource"));
    v10 = objc_claimAutoreleasedReturnValue();
    libraryOnlineSource = v5->_libraryOnlineSource;
    v5->_libraryOnlineSource = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("libraryOfflineSource"));
    v12 = objc_claimAutoreleasedReturnValue();
    libraryOfflineSource = v5->_libraryOfflineSource;
    v5->_libraryOfflineSource = (NSData *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("libraryHash"));
    v14 = objc_claimAutoreleasedReturnValue();
    libraryHash = v5->_libraryHash;
    v5->_libraryHash = (NSString *)v14;

    v5->_isDefaultLibrary = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDefaultLibrary"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metalFunctionName"));
    v16 = objc_claimAutoreleasedReturnValue();
    metalFunctionName = v5->_metalFunctionName;
    v5->_metalFunctionName = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metalFunctionFile"));
    v18 = objc_claimAutoreleasedReturnValue();
    metalFunctionFile = v5->_metalFunctionFile;
    v5->_metalFunctionFile = (NSURL *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metalLogMessage"));
    v20 = objc_claimAutoreleasedReturnValue();
    metalLogMessage = v5->_metalLogMessage;
    v5->_metalLogMessage = (NSString *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *callstack;
  id v5;

  callstack = self->_callstack;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", callstack, CFSTR("callstack"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cpuCallstackData, CFSTR("cpuCallstackData"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_cpuCallstackFramesNum, CFSTR("cpuCallstackFramesNum"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_libraryOnlineSource, CFSTR("libraryOnlineSource"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_libraryOfflineSource, CFSTR("libraryOfflineSource"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_libraryHash, CFSTR("libraryHash"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isDefaultLibrary, CFSTR("isDefaultLibrary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metalFunctionName, CFSTR("metalFunctionName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metalFunctionFile, CFSTR("metalFunctionFile"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metalLogMessage, CFSTR("metalLogMessage"));

}

- (NSArray)callstack
{
  return self->_callstack;
}

- (void)setCallstack:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)cpuCallstackData
{
  return self->_cpuCallstackData;
}

- (void)setCpuCallstackData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)cpuCallstackFramesNum
{
  return self->_cpuCallstackFramesNum;
}

- (void)setCpuCallstackFramesNum:(unsigned int)a3
{
  self->_cpuCallstackFramesNum = a3;
}

- (NSString)libraryOnlineSource
{
  return self->_libraryOnlineSource;
}

- (void)setLibraryOnlineSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)libraryOfflineSource
{
  return self->_libraryOfflineSource;
}

- (void)setLibraryOfflineSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)libraryHash
{
  return self->_libraryHash;
}

- (void)setLibraryHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isDefaultLibrary
{
  return self->_isDefaultLibrary;
}

- (void)setIsDefaultLibrary:(BOOL)a3
{
  self->_isDefaultLibrary = a3;
}

- (NSString)metalFunctionName
{
  return self->_metalFunctionName;
}

- (void)setMetalFunctionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSURL)metalFunctionFile
{
  return self->_metalFunctionFile;
}

- (void)setMetalFunctionFile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)metalLogMessage
{
  return self->_metalLogMessage;
}

- (void)setMetalLogMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalLogMessage, 0);
  objc_storeStrong((id *)&self->_metalFunctionFile, 0);
  objc_storeStrong((id *)&self->_metalFunctionName, 0);
  objc_storeStrong((id *)&self->_libraryHash, 0);
  objc_storeStrong((id *)&self->_libraryOfflineSource, 0);
  objc_storeStrong((id *)&self->_libraryOnlineSource, 0);
  objc_storeStrong((id *)&self->_cpuCallstackData, 0);
  objc_storeStrong((id *)&self->_callstack, 0);
}

@end
