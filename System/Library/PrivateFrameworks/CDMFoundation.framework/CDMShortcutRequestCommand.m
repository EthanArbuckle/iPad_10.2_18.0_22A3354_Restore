@implementation CDMShortcutRequestCommand

- (CDMShortcutRequestCommand)initWithMatchingSpans:(id)a3 tokenChain:(id)a4 currentTurnContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  CDMShortcutRequestCommand *v11;
  uint64_t v12;
  NSArray *matchingSpans;
  uint64_t v14;
  SIRINLUINTERNALTokenChain *tokenChain;
  uint64_t v16;
  SIRINLUEXTERNALTurnContext *currentTurnContext;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CDMShortcutRequestCommand;
  v11 = -[CDMBaseCommand init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    matchingSpans = v11->_matchingSpans;
    v11->_matchingSpans = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    tokenChain = v11->_tokenChain;
    v11->_tokenChain = (SIRINLUINTERNALTokenChain *)v14;

    v16 = objc_msgSend(v10, "copy");
    currentTurnContext = v11->_currentTurnContext;
    v11->_currentTurnContext = (SIRINLUEXTERNALTurnContext *)v16;

  }
  return v11;
}

- (SIRINLUINTERNALTokenChain)tokenChain
{
  return self->_tokenChain;
}

- (NSArray)matchingSpans
{
  return self->_matchingSpans;
}

- (SIRINLUEXTERNALTurnContext)currentTurnContext
{
  return self->_currentTurnContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTurnContext, 0);
  objc_storeStrong((id *)&self->_matchingSpans, 0);
  objc_storeStrong((id *)&self->_tokenChain, 0);
}

@end
