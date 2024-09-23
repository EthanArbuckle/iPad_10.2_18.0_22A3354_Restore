@implementation _CopyfileCallbackCtx

- (_CopyfileCallbackCtx)initWithPath:(const char *)a3 error:(id *)a4
{
  _CopyfileCallbackCtx *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSProgress *progress;
  NSProgress *v11;
  void *v12;
  void *v13;
  void *v14;
  _CopyfileCallbackCtx *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_CopyfileCallbackCtx;
  v6 = -[_CopyfileCallbackCtx init](&v17, sel_init);
  if (!v6)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0CB38A8], "currentProgress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = GSComputeTreeSize((char *)a3, a4);
    if ((v8 & 0x8000000000000000) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      progress = v6->_progress;
      v6->_progress = (NSProgress *)v9;

      -[NSProgress setUserInfoObject:forKey:](v6->_progress, "setUserInfoObject:forKey:", *MEMORY[0x1E0CB30B0], *MEMORY[0x1E0CB30C8]);
      v11 = v6->_progress;
      v12 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(MEMORY[0x1E0CB3940], "gs_stringWithFileSystemRepresentation:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fileURLWithPath:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSProgress setUserInfoObject:forKey:](v11, "setUserInfoObject:forKey:", v14, *MEMORY[0x1E0CB30F0]);

      -[NSProgress setCancellable:](v6->_progress, "setCancellable:", 1);
      -[NSProgress setKind:](v6->_progress, "setKind:", *MEMORY[0x1E0CB30F8]);
      goto LABEL_5;
    }
LABEL_6:
    v15 = 0;
    goto LABEL_7;
  }
LABEL_5:
  v15 = v6;
LABEL_7:

  return v15;
}

- (BOOL)doArchive
{
  return self->_doArchive;
}

- (void)setDoArchive:(BOOL)a3
{
  self->_doArchive = a3;
}

- (BOOL)doUnarchive
{
  return self->_doUnarchive;
}

- (void)setDoUnarchive:(BOOL)a3
{
  self->_doUnarchive = a3;
}

- (unint64_t)generationSize
{
  return self->_generationSize;
}

- (void)setGenerationSize:(unint64_t)a3
{
  self->_generationSize = a3;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
}

@end
