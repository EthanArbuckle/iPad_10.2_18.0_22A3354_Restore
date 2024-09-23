@implementation CDMOverridesProtoResponseCommand

- (CDMOverridesProtoResponseCommand)initWithParsesForReplacement:(id)a3 parsesForAppending:(id)a4
{
  id v6;
  id v7;
  CDMOverridesProtoResponseCommand *v8;
  uint64_t v9;
  NSArray *parsesForReplacement;
  uint64_t v11;
  NSArray *parsesForAppending;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CDMOverridesProtoResponseCommand;
  v8 = -[CDMBaseCommand init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    parsesForReplacement = v8->_parsesForReplacement;
    v8->_parsesForReplacement = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    parsesForAppending = v8->_parsesForAppending;
    v8->_parsesForAppending = (NSArray *)v11;

  }
  return v8;
}

- (NSArray)parsesForReplacement
{
  return self->_parsesForReplacement;
}

- (void)setParsesForReplacement:(id)a3
{
  objc_storeStrong((id *)&self->_parsesForReplacement, a3);
}

- (NSArray)parsesForAppending
{
  return self->_parsesForAppending;
}

- (void)setParsesForAppending:(id)a3
{
  objc_storeStrong((id *)&self->_parsesForAppending, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsesForAppending, 0);
  objc_storeStrong((id *)&self->_parsesForReplacement, 0);
}

@end
