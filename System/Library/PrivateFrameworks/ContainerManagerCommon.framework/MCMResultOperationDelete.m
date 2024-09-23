@implementation MCMResultOperationDelete

- (void)mergeWithXPCResult:(id)a3
{
  -[MCMResultOperationDelete setXpcToMerge:](self, "setXpcToMerge:", a3);
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MCMResultOperationDelete;
  v5 = -[MCMResultWithContainersArrayBase encodeResultOntoReply:](&v14, sel_encodeResultOntoReply_, v4);
  if (v5)
  {
    -[MCMResultBase error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      -[MCMResultOperationDelete xpcToMerge](self, "xpcToMerge");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        goto LABEL_4;
      -[MCMResultOperationDelete xpcToMerge](self, "xpcToMerge");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_get_array(v9, "ReplyContainersArray");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 && MEMORY[0x1D17D7838](v6) == MEMORY[0x1E0C812C8])
      {
        xpc_dictionary_get_array(v4, "ReplyContainersArray");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __50__MCMResultOperationDelete_encodeResultOntoReply___block_invoke;
        v12[3] = &unk_1E8CB5F28;
        v13 = v10;
        v11 = v10;
        xpc_array_apply(v6, v12);

      }
    }

  }
LABEL_4:

  return v5;
}

- (OS_xpc_object)xpcToMerge
{
  return self->_xpcToMerge;
}

- (void)setXpcToMerge:(id)a3
{
  objc_storeStrong((id *)&self->_xpcToMerge, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcToMerge, 0);
}

uint64_t __50__MCMResultOperationDelete_encodeResultOntoReply___block_invoke(uint64_t a1, int a2, xpc_object_t value)
{
  xpc_array_append_value(*(xpc_object_t *)(a1 + 32), value);
  return 1;
}

@end
