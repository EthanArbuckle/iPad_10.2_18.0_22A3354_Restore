@implementation MCMResultInfoValueForKey

- (MCMResultInfoValueForKey)initWithValue:(id)a3
{
  id v5;
  MCMResultInfoValueForKey *v6;
  MCMResultInfoValueForKey *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMResultInfoValueForKey;
  v6 = -[MCMResultBase init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_value, a3);

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
  v10.super_class = (Class)MCMResultInfoValueForKey;
  v5 = -[MCMResultBase encodeResultOntoReply:](&v10, sel_encodeResultOntoReply_, v4);
  if (v5)
  {
    -[MCMResultBase error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
LABEL_5:

      goto LABEL_6;
    }
    -[MCMResultInfoValueForKey value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[MCMResultInfoValueForKey value](self, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      xpc_dictionary_set_value(v4, "ReplyInfoValue", v8);

      goto LABEL_5;
    }
  }
LABEL_6:

  return v5;
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

@end
