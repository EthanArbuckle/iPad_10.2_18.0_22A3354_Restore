@implementation _FPCopyFileStatus

- (_FPCopyFileStatus)init
{
  _FPCopyFileStatus *v2;
  uint64_t v3;
  NSMutableDictionary *lastBytesCopiedByFile;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_FPCopyFileStatus;
  v2 = -[_FPCopyFileStatus init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    lastBytesCopiedByFile = v2->_lastBytesCopiedByFile;
    v2->_lastBytesCopiedByFile = (NSMutableDictionary *)v3;

    *(_WORD *)&v2->_shouldCopyAppleDouble = 1;
  }
  return v2;
}

- (void)beginCopyingFile:(id)a3 state:(_copyfile_state *)a4
{
  id v6;

  v6 = a3;
  copyfile_state_set(a4, 6u, copyfile_status_cb);
  copyfile_state_set(a4, 7u, self);
  -[_FPCopyFileStatus updateCopyingFile:state:](self, "updateCopyingFile:state:", v6, a4);

}

- (void)updateCopyingFile:(id)a3 state:(_copyfile_state *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  uint64_t dst;

  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_lastBytesCopiedByFile, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongLongValue");

  dst = 0;
  copyfile_state_get(a4, 8u, &dst);
  if (v8 != dst)
  {
    v9 = -[NSProgress completedUnitCount](self->_progress, "completedUnitCount");
    -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", v9 - v8 + dst);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", dst);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lastBytesCopiedByFile, "setObject:forKeyedSubscript:", v10, v6);

  }
}

- (void)finishCopyingFile:(id)a3 state:(_copyfile_state *)a4
{
  id v6;

  v6 = a3;
  -[_FPCopyFileStatus updateCopyingFile:state:](self, "updateCopyingFile:state:", v6, a4);
  -[NSMutableDictionary removeObjectForKey:](self->_lastBytesCopiedByFile, "removeObjectForKey:", v6);

}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)lastBytesCopiedByFile
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastBytesCopiedByFile:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)shouldCopyAppleDouble
{
  return self->_shouldCopyAppleDouble;
}

- (void)setShouldCopyAppleDouble:(BOOL)a3
{
  self->_shouldCopyAppleDouble = a3;
}

- (int)copyError
{
  return self->_copyError;
}

- (void)setCopyError:(int)a3
{
  self->_copyError = a3;
}

- (BOOL)rootWasCopied
{
  return self->_rootWasCopied;
}

- (void)setRootWasCopied:(BOOL)a3
{
  self->_rootWasCopied = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastBytesCopiedByFile, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

@end
