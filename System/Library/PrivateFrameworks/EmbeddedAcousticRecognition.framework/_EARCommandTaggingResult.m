@implementation _EARCommandTaggingResult

- (id)_initWithCommandTaggings:(id)a3
{
  id v4;
  _EARCommandTaggingResult *v5;
  uint64_t v6;
  NSArray *commandTaggings;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EARCommandTaggingResult;
  v5 = -[_EARCommandTaggingResult init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    commandTaggings = v5->_commandTaggings;
    v5->_commandTaggings = (NSArray *)v6;

  }
  return v5;
}

- (NSArray)commandTaggings
{
  return self->_commandTaggings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandTaggings, 0);
}

@end
