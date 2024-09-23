@implementation _EXPersona

- (_EXPersona)initWithPersonaUniqueString:(id)a3
{
  id v5;
  _EXPersona *v6;
  _EXPersona *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EXPersona;
  v6 = -[_EXPersona init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_personaUniqueString, a3);

  return v7;
}

- (_EXPersona)initWithCoder:(id)a3
{
  id v4;
  _EXPersona *v5;
  uint64_t v6;
  NSString *personaUniqueString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EXPersona;
  v5 = -[_EXPersona init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personaUniqueString"));
    v6 = objc_claimAutoreleasedReturnValue();
    personaUniqueString = v5->_personaUniqueString;
    v5->_personaUniqueString = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_personaUniqueString, CFSTR("personaUniqueString"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)currentPersona
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPersona");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userPersonaUniqueString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[_EXPersona personaWithPersonaUniqueString:](_EXPersona, "personaWithPersonaUniqueString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)defaultPersona
{
  return +[_EXPersona personaWithPersonaUniqueString:](_EXPersona, "personaWithPersonaUniqueString:", &stru_1E2CFF9B8);
}

+ (_EXPersona)personaWithPersonaUniqueString:(id)a3
{
  id v3;
  void *v4;
  _EXPersona *v5;
  _EXPersona *result;
  NSObject *v7;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    v5 = -[_EXPersona initWithPersonaUniqueString:]([_EXPersona alloc], "initWithPersonaUniqueString:", v3);

    return v5;
  }
  else
  {
    _EXDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      +[_EXPersona personaWithPersonaUniqueString:].cold.1(v7);

    __break(1u);
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p %@>"), objc_opt_class(), self, self->_personaUniqueString);
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
}

+ (void)personaWithPersonaUniqueString:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = "personaUniqueString != nil";
  v3 = 2080;
  v1 = 136315650;
  v4 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtension/NSExtensionSupport/EXPersona.m";
  v5 = 1024;
  v6 = 63;
  _os_log_fault_impl(&dword_190C25000, log, OS_LOG_TYPE_FAULT, "%s - %s:%d: Persona unique string should not be nil", (uint8_t *)&v1, 0x1Cu);
}

@end
