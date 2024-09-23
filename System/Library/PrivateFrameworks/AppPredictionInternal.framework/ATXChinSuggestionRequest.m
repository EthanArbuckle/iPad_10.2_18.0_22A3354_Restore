@implementation ATXChinSuggestionRequest

- (ATXChinSuggestionRequest)initWithAcceptedBlock:(id)a3 rejectedBlock:(id)a4
{
  id v6;
  id v7;
  ATXChinSuggestionRequest *v8;
  ATXChinSuggestionRequest *v9;
  void *v10;
  id acceptedBlock;
  void *v12;
  id rejectedBlock;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ATXChinSuggestionRequest;
  v8 = -[ATXChinSuggestionRequest init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_debugIdentifier = 0;
    v10 = _Block_copy(v6);
    acceptedBlock = v9->_acceptedBlock;
    v9->_acceptedBlock = v10;

    v12 = _Block_copy(v7);
    rejectedBlock = v9->_rejectedBlock;
    v9->_rejectedBlock = v12;

  }
  return v9;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Request #%llu>"), -[ATXChinSuggestionRequest debugIdentifier](self, "debugIdentifier"));
}

- (unint64_t)debugIdentifier
{
  return self->_debugIdentifier;
}

- (void)setDebugIdentifier:(unint64_t)a3
{
  self->_debugIdentifier = a3;
}

- (id)acceptedBlock
{
  return self->_acceptedBlock;
}

- (id)rejectedBlock
{
  return self->_rejectedBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rejectedBlock, 0);
  objc_storeStrong(&self->_acceptedBlock, 0);
}

@end
