@implementation EMFQueryResultOverride

- (EMFQueryResultOverride)initWithOverridesArray:(id)a3 searchType:(unint64_t)a4 behavior:(unint64_t)a5
{
  id v9;
  EMFQueryResultOverride *v10;
  EMFQueryResultOverride *v11;
  EMFQueryResultOverride *v12;
  objc_super v14;

  v9 = a3;
  if (v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)EMFQueryResultOverride;
    v10 = -[EMFQueryResultOverride init](&v14, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_results, a3);
      v11->_overrideSearchType = a4;
      v11->_overrideBehavior = a5;
    }
    self = v11;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; results=\"%@\"; behavior=%lu; searchType=%lu>"),
               objc_opt_class(),
               self,
               self->_results,
               self->_overrideBehavior,
               self->_overrideSearchType);
}

- (unint64_t)overrideSearchType
{
  return self->_overrideSearchType;
}

- (unint64_t)overrideBehavior
{
  return self->_overrideBehavior;
}

- (NSArray)results
{
  return self->_results;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
}

@end
