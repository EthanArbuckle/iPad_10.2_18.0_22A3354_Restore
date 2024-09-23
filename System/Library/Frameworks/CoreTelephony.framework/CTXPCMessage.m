@implementation CTXPCMessage

- (CTXPCMessage)init
{
  return -[CTXPCMessage initWithNamedArguments:](self, "initWithNamedArguments:", MEMORY[0x1E0C9AA70]);
}

- (CTXPCMessage)initWithNamedArguments:(id)a3
{
  id v5;
  CTXPCMessage *v6;
  CTXPCMessage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTXPCMessage;
  v6 = -[CTXPCMessage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_namedArguments, a3);

  return v7;
}

+ (NSSet)allowedClassesForArguments
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  return (NSSet *)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

+ (BOOL)isSensitiveMessage
{
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary allKeys](self->_namedArguments, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __27__CTXPCMessage_description__block_invoke;
  v10[3] = &unk_1E1534DC8;
  v10[4] = self;
  v6 = v3;
  v11 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  v7 = v11;
  v8 = v6;

  return v8;
}

void __27__CTXPCMessage_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  const __CFString *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    v6 = CFSTR(", %@=%@");
  else
    v6 = CFSTR(" %@=%@");
  objc_msgSend(*(id *)(a1 + 40), "appendFormat:", v6, v7, v5);

}

- (BOOL)isEqual:(id)a3
{
  CTXPCMessage *v4;
  NSDictionary *namedArguments;
  void *v6;
  char v7;

  v4 = (CTXPCMessage *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      namedArguments = self->_namedArguments;
      -[CTXPCMessage namedArguments](v4, "namedArguments");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSDictionary isEqualToDictionary:](namedArguments, "isEqualToDictionary:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_namedArguments, CFSTR("namedArguments"));
}

- (CTXPCMessage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CTXPCMessage *v7;
  CTXPCMessage *v8;
  CTXPCMessage *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "allowedClassesForArguments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("namedArguments"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)CTXPCMessage;
    v7 = -[CTXPCMessage init](&v11, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_namedArguments, v6);
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)namedArguments
{
  return self->_namedArguments;
}

- (void)setNamedArguments:(id)a3
{
  objc_storeStrong((id *)&self->_namedArguments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedArguments, 0);
}

@end
