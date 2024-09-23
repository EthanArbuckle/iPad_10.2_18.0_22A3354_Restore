@implementation MCMResultGetCodeSignMapping

- (MCMResultGetCodeSignMapping)initWithInfo:(id)a3
{
  id v5;
  MCMResultGetCodeSignMapping *v6;
  MCMResultGetCodeSignMapping *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMResultGetCodeSignMapping;
  v6 = -[MCMResultBase init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_info, a3);

  return v7;
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MCMResultGetCodeSignMapping;
  v5 = -[MCMResultBase encodeResultOntoReply:](&v10, sel_encodeResultOntoReply_, v4);
  if (v5)
  {
    -[MCMResultBase error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[MCMResultGetCodeSignMapping info](self, "info");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();

      if (v8)
        xpc_dictionary_set_value(v4, "ReplyInfoDictionary", v8);

    }
  }

  return v5;
}

- (NSDictionary)info
{
  return self->_info;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
}

@end
