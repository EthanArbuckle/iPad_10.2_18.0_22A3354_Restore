@implementation FPActionOperationInfo

- (FPActionOperationInfo)initWithOperationID:(id)a3 roots:(id)a4
{
  id v7;
  id v8;
  FPActionOperationInfo *v9;
  FPActionOperationInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FPActionOperationInfo;
  v9 = -[FPActionOperationInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_operationID, a3);
    objc_storeStrong((id *)&v10->_roots, a4);
    v10->_qos = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[FPActionOperationInfo attachSandboxExtensionsOnXPCEncoding](self, "attachSandboxExtensionsOnXPCEncoding"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_roots;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "attachSandboxExtensionOnXPCEncoding", (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
  objc_msgSend(v4, "encodeObject:forKey:", self->_operationID, CFSTR("_operationID"), (_QWORD)v10);
  objc_msgSend(v4, "encodeObject:forKey:", self->_roots, CFSTR("_roots"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_qos, CFSTR("_qos"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->__t_moveQueueWidth, CFSTR("__t_moveQueueWidth"));
  objc_msgSend(v4, "encodeBool:forKey:", self->__t_clientDrivenReader, CFSTR("__t_clientDrivenReader"));
  objc_msgSend(v4, "encodeBool:forKey:", self->__t_clearItemURLs, CFSTR("__t_clearItemURLs"));

}

- (FPActionOperationInfo)initWithCoder:(id)a3
{
  id v4;
  FPActionOperationInfo *v5;
  uint64_t v6;
  NSString *operationID;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *roots;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FPActionOperationInfo;
  v5 = -[FPActionOperationInfo init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_operationID"));
    v6 = objc_claimAutoreleasedReturnValue();
    operationID = v5->_operationID;
    v5->_operationID = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_roots"));
    v11 = objc_claimAutoreleasedReturnValue();
    roots = v5->_roots;
    v5->_roots = (NSArray *)v11;

    v5->_qos = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_qos"));
    v5->__t_moveQueueWidth = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("__t_moveQueueWidth"));
    v5->__t_clientDrivenReader = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__t_clientDrivenReader"));
    v5->__t_clearItemURLs = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__t_clearItemURLs"));
  }

  return v5;
}

- (NSString)operationID
{
  return self->_operationID;
}

- (void)setOperationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)roots
{
  return self->_roots;
}

- (void)setRoots:(id)a3
{
  objc_storeStrong((id *)&self->_roots, a3);
}

- (BOOL)attachSandboxExtensionsOnXPCEncoding
{
  return self->_attachSandboxExtensionsOnXPCEncoding;
}

- (void)setAttachSandboxExtensionsOnXPCEncoding:(BOOL)a3
{
  self->_attachSandboxExtensionsOnXPCEncoding = a3;
}

- (unsigned)qos
{
  return self->_qos;
}

- (void)setQos:(unsigned int)a3
{
  self->_qos = a3;
}

- (unint64_t)_t_moveQueueWidth
{
  return self->__t_moveQueueWidth;
}

- (void)set_t_moveQueueWidth:(unint64_t)a3
{
  self->__t_moveQueueWidth = a3;
}

- (BOOL)_t_clientDrivenReader
{
  return self->__t_clientDrivenReader;
}

- (void)set_t_clientDrivenReader:(BOOL)a3
{
  self->__t_clientDrivenReader = a3;
}

- (BOOL)_t_clearItemURLs
{
  return self->__t_clearItemURLs;
}

- (void)set_t_clearItemURLs:(BOOL)a3
{
  self->__t_clearItemURLs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roots, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
}

@end
