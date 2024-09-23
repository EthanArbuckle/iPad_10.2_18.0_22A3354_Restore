@implementation MCMResultRelay

- (MCMResultRelay)initWithXPCReplyFromRelay:(id)a3
{
  id v5;
  MCMResultRelay *v6;
  MCMResultRelay *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMResultRelay;
  v6 = -[MCMResultBase init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_xpcReplyFromRelay, a3);

  return v7;
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMResultRelay;
  v5 = -[MCMResultBase encodeResultOntoReply:](&v11, sel_encodeResultOntoReply_, v4);
  if (v5)
  {
    -[MCMResultBase error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[MCMResultRelay xpcReplyFromRelay](self, "xpcReplyFromRelay");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __40__MCMResultRelay_encodeResultOntoReply___block_invoke;
      v9[3] = &unk_1E8CB6588;
      v10 = v4;
      xpc_dictionary_apply(v7, v9);

    }
  }

  return v5;
}

- (OS_xpc_object)xpcReplyFromRelay
{
  return self->_xpcReplyFromRelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcReplyFromRelay, 0);
}

uint64_t __40__MCMResultRelay_encodeResultOntoReply___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, a3);
  return 1;
}

@end
