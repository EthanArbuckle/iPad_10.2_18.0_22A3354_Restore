@implementation NSSQLFetchDictionaryCountIntermediate

- (NSSQLFetchDictionaryCountIntermediate)initWithFetchIntermediate:(id)a3 inScope:(id)a4
{
  NSSQLFetchDictionaryCountIntermediate *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSSQLFetchDictionaryCountIntermediate;
  v5 = -[NSSQLIntermediate initWithScope:](&v7, sel_initWithScope_, a4);
  if (v5)
    v5->_realFetch = (NSSQLFetchIntermediate *)a3;
  return v5;
}

- (id)generateSQLStringInContext:(id)a3
{
  id v6;
  void *v7;
  void *v8;

  if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
    return 0;
  v6 = -[NSSQLFetchIntermediate generateSQLStringInContext:](self->_realFetch, "generateSQLStringInContext:", a3);
  if (!v6)
  {
    if (!objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
      objc_msgSend(a3, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Unable to generate SQL for fetch"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(a3, "objectForKey:", CFSTR("outerFetch")), CFSTR("Bad request"))), CFSTR("NSUnderlyingException"));
    return 0;
  }
  v7 = v6;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("SELECT COUNT(*) from (%@)"), v6);

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_realFetch = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLFetchDictionaryCountIntermediate;
  -[NSSQLStatementIntermediate dealloc](&v3, sel_dealloc);
}

@end
