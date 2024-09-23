@implementation _LSPersonaWithAttributes

- (_QWORD)initWithPersonaType:(void *)a3 personaUniqueString:
{
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v5 = a3;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)_LSPersonaWithAttributes;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      v6 = objc_msgSend(v5, "copy");
      v7 = (void *)a1[1];
      a1[1] = v6;

      a1[2] = a2;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
}

- (unint64_t)hash
{
  return self->_personaType ^ -[NSString hash](self->_personaUniqueString, "hash");
}

- (_LSPersonaWithAttributes)initWithCoder:(id)a3
{
  id v4;
  _LSPersonaWithAttributes *v5;
  uint64_t v6;
  NSString *personaUniqueString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_LSPersonaWithAttributes;
  v5 = -[_LSPersonaWithAttributes init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personaUniqueString"));
    v6 = objc_claimAutoreleasedReturnValue();
    personaUniqueString = v5->_personaUniqueString;
    v5->_personaUniqueString = (NSString *)v6;

    v5->_personaType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("personaType"));
  }

  return v5;
}

- (uint64_t)personaType
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_personaUniqueString, CFSTR("personaUniqueString"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_personaType, CFSTR("personaType"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %@ (type %d)>"), objc_opt_class(), self->_personaUniqueString, self->_personaType);
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  char v5;

  v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v4[2] == (id)self->_personaType)
    v5 = objc_msgSend(v4[1], "isEqualToString:", self->_personaUniqueString);
  else
    v5 = 0;

  return v5;
}

@end
