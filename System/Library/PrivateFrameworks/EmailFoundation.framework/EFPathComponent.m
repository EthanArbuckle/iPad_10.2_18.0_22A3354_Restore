@implementation EFPathComponent

+ (EFPathComponent)pathComponentWithString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithString:", v3);

  return (EFPathComponent *)v4;
}

- (EFPathComponent)initWithString:(id)a3
{
  id v4;
  EFPathComponent *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EFPathComponent;
  v5 = -[EFPathComponent init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[EFPathComponent _setSanitizedString:]((uint64_t)v5, v6);

    if ((v7 & 1) == 0)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (uint64_t)_setSanitizedString:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (objc_msgSend(v3, "length"))
    {
      v5 = objc_msgSend(v4, "copy");
      v6 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v5;

      a1 = 1;
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (void)_initWithSanitizedString:(void *)a1
{
  id v3;
  id v4;
  objc_super v6;

  v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)EFPathComponent;
    v4 = objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4)
    {
      if ((-[EFPathComponent _setSanitizedString:]((uint64_t)v4, v3) & 1) == 0)
      {

        a1 = 0;
      }
    }
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sanitizedString;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    sanitizedString = self->_sanitizedString;
    objc_msgSend(v4, "sanitizedString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSString isEqual:](sanitizedString, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_sanitizedString, "hash");
}

- (id)description
{
  return -[NSString description](self->_sanitizedString, "description");
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSString debugDescription](self->_sanitizedString, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<EFPathComponent %p %@>"), self, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)length
{
  return -[NSString length](self->_sanitizedString, "length");
}

- (id)subpathToIndex:(unint64_t)a3
{
  EFPathComponent *v5;
  void *v6;
  void *v7;

  v5 = [EFPathComponent alloc];
  -[NSString substringToIndex:](self->_sanitizedString, "substringToIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EFPathComponent _initWithSanitizedString:](v5, v6);

  return v7;
}

- (NSString)pathExtension
{
  return -[NSString pathExtension](self->_sanitizedString, "pathExtension");
}

- (EFPathComponent)pathComponentByDeletingPathExtension
{
  EFPathComponent *v3;
  void *v4;
  void *v5;

  v3 = [EFPathComponent alloc];
  -[NSString stringByDeletingPathExtension](self->_sanitizedString, "stringByDeletingPathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[EFPathComponent _initWithSanitizedString:](v3, v4);

  return (EFPathComponent *)v5;
}

- (NSString)sanitizedString
{
  return self->_sanitizedString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sanitizedString, 0);
}

@end
