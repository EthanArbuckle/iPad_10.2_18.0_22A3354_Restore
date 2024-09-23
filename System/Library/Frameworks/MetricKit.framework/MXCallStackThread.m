@implementation MXCallStackThread

- (MXCallStackThread)initWithTopCallStackFrames:(id)a3 isAttributedThread:(BOOL)a4
{
  id v7;
  MXCallStackThread *v8;
  MXCallStackThread *v9;
  MXCallStackThread *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MXCallStackThread;
  v8 = -[MXCallStackThread init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    if (!v7)
    {
      v10 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v8->_topFrames, a3);
    v9->_attributedThread = a4;
  }
  v10 = v9;
LABEL_6:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *topFrames;
  id v5;

  topFrames = self->_topFrames;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", topFrames, CFSTR("callStackRootFrames"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_attributedThread, CFSTR("threadAttributed"));

}

- (MXCallStackThread)initWithCoder:(id)a3
{
  id v4;
  MXCallStackThread *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *topFrames;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MXCallStackThread;
  v5 = -[MXCallStackThread init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("callStackRootFrames"));
    v9 = objc_claimAutoreleasedReturnValue();
    topFrames = v5->_topFrames;
    v5->_topFrames = (NSArray *)v9;

    v5->_attributedThread = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("threadAttributed"));
  }

  return v5;
}

- (id)toDictionary
{
  id v3;
  void *v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_attributedThread);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("threadAttributed"));

  if (self->_topFrames)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = self->_topFrames;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "toDictionary", (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("callStackRootFrames"));
  }
  return v3;
}

- (BOOL)attributedThread
{
  return self->_attributedThread;
}

- (NSArray)topFrames
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topFrames, 0);
}

@end
