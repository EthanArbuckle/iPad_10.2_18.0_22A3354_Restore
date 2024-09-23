@implementation _ECSVGProfileExtractor

- (id)initWithSVGData:(id *)a1
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  v3 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)_ECSVGProfileExtractor;
    a1 = (id *)objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B28]), "initWithData:", v3);
      v5 = a1[1];
      a1[1] = (id)v4;

      objc_msgSend(a1[1], "setShouldResolveExternalEntities:", 0);
      objc_msgSend(a1[1], "setDelegate:", a1);
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
      v7 = a1[6];
      a1[6] = (id)v6;

    }
  }

  return a1;
}

- (id)namespace
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1, "_parseIfNeeded");
    a1 = (id *)v1[2];
  }
  return a1;
}

- (id)version
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1, "_parseIfNeeded");
    a1 = (id *)v1[3];
  }
  return a1;
}

- (id)baseProfile
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1, "_parseIfNeeded");
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)_parseIfNeeded
{
  -[NSConditionLock lock](self->_parseLock, "lock");
  if (!-[NSConditionLock condition](self->_parseLock, "condition"))
    -[NSXMLParser parse](self->_parser, "parse");
  -[NSConditionLock unlockWithCondition:](self->_parseLock, "unlockWithCondition:", 1);
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v10;
  id v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSString *version;
  NSString *v16;
  NSString *baseProfile;
  id v18;

  v18 = a3;
  v10 = a4;
  v11 = a7;
  if (objc_msgSend(v10, "ef_caseInsensitiveIsEqualToString:", CFSTR("svg")))
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("xmlns"));
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v13 = self->_namespace;
    self->_namespace = v12;

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("version"));
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    version = self->_version;
    self->_version = v14;

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("baseProfile"));
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    baseProfile = self->_baseProfile;
    self->_baseProfile = v16;

  }
  objc_msgSend(v18, "abortParsing");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parseLock, 0);
  objc_storeStrong((id *)&self->_baseProfile, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_namespace, 0);
  objc_storeStrong((id *)&self->_parser, 0);
}

@end
