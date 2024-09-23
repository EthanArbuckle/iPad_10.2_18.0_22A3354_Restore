@implementation MCMResultFetchPersonaUniqueStrings

- (MCMResultFetchPersonaUniqueStrings)initWithPersonaUniqueStrings:(id)a3
{
  id v5;
  MCMResultFetchPersonaUniqueStrings *v6;
  MCMResultFetchPersonaUniqueStrings *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMResultFetchPersonaUniqueStrings;
  v6 = -[MCMResultBase init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_personaUniqueStrings, a3);

  return v7;
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMResultFetchPersonaUniqueStrings;
  v5 = -[MCMResultBase encodeResultOntoReply:](&v11, sel_encodeResultOntoReply_, v4);
  if (v5)
  {
    -[MCMResultBase error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[MCMResultFetchPersonaUniqueStrings personaUniqueStrings](self, "personaUniqueStrings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();

      if (v9)
        xpc_dictionary_set_value(v4, "ReplyPersonaUniqueStringsArray", v9);

    }
  }

  return v5;
}

- (NSSet)personaUniqueStrings
{
  return self->_personaUniqueStrings;
}

- (void)setPersonaUniqueStrings:(id)a3
{
  objc_storeStrong((id *)&self->_personaUniqueStrings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueStrings, 0);
}

@end
