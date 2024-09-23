@implementation CAMCaptureCommand

- (CAMCaptureCommand)init
{
  return -[CAMCaptureCommand initWithSubcommands:](self, "initWithSubcommands:", 0);
}

- (CAMCaptureCommand)initWithSubcommands:(id)a3
{
  id v4;
  CAMCaptureCommand *v5;
  uint64_t v6;
  NSArray *subcommands;
  CAMCaptureCommand *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMCaptureCommand;
  v5 = -[CAMCaptureCommand init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    subcommands = v5->_subcommands;
    v5->_subcommands = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init((Class)objc_opt_class());
  -[CAMCaptureCommand reason](self, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[1];
  v4[1] = v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[CAMCaptureCommand subcommands](self, "subcommands", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "copy");
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v15 = objc_msgSend(v8, "copy");
  v16 = (void *)v4[2];
  v4[2] = v15;

  return v4;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSArray)subcommands
{
  return self->_subcommands;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subcommands, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

- (BOOL)requiresSessionModification
{
  return 0;
}

- (void)addSubcommand:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  -[CAMCaptureCommand subcommands](self, "subcommands");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "mutableCopy");

  if (!v5)
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", v6);
  -[CAMCaptureCommand setSubcommands:](self, "setSubcommands:", v5);

}

- (void)setSubcommands:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)userInfo
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  -[CAMCaptureCommand reason](self, "reason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CAMCaptureCommand reason](self, "reason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("CAMCaptureCommandReason"));

  }
  -[CAMCaptureCommand subcommands](self, "subcommands");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[CAMCaptureCommand subcommands](self, "subcommands");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      -[CAMCaptureCommand subcommands](self, "subcommands");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("CAMCaptureCommandSubcommands"));

    }
  }

}

- (CAMCaptureCommand)initWithCoder:(id)a3
{
  id v4;
  CAMCaptureCommand *v5;
  uint64_t v6;
  NSString *reason;
  uint64_t v8;
  NSArray *subcommands;
  CAMCaptureCommand *v10;

  v4 = a3;
  v5 = -[CAMCaptureCommand initWithSubcommands:](self, "initWithSubcommands:", 0);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("CAMCaptureCommandReason"));
    v6 = objc_claimAutoreleasedReturnValue();
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("CAMCaptureCommandSubcommands"));
    v8 = objc_claimAutoreleasedReturnValue();
    subcommands = v5->_subcommands;
    v5->_subcommands = (NSArray *)v8;

    v10 = v5;
  }

  return v5;
}

- (NSString)sessionModificationLogReason
{
  return 0;
}

- (double)sessionModificationMinimumExecutionTime
{
  return 0.0;
}

- (void)removeSubcommand:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CAMCaptureCommand subcommands](self, "subcommands");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "removeObject:", v4);
  -[CAMCaptureCommand setSubcommands:](self, "setSubcommands:", v6);

}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
