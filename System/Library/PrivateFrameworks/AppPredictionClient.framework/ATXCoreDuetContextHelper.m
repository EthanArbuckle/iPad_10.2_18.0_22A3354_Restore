@implementation ATXCoreDuetContextHelper

- (ATXCoreDuetContextHelper)init
{
  ATXCoreDuetContextHelper *v2;
  uint64_t v3;
  id context;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXCoreDuetContextHelper;
  v2 = -[ATXCoreDuetContextHelper init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
    v3 = objc_claimAutoreleasedReturnValue();
    context = v2->_context;
    v2->_context = (id)v3;

  }
  return v2;
}

- (id)fetchDataDictionaryForKeyPath:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(self->_context, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)lastModifiedDateForKeyPath:(id)a3
{
  return (id)objc_msgSend(self->_context, "lastModifiedDateForContextualKeyPath:", a3);
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
}

@end
