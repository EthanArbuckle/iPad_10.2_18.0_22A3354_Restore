@implementation ECEmailAddressFormatter

- (id)stringFromEmailAddress:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECEmailAddressFormatter.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("emailAddress"));

  }
  -[ECEmailAddressFormatter _stringFromEmailAddress:includeDisplayName:](self, "_stringFromEmailAddress:includeDisplayName:", v5, -[ECEmailAddressFormatter shouldIncludeDisplayName](self, "shouldIncludeDisplayName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)shouldIncludeDisplayName
{
  return self->_shouldIncludeDisplayName;
}

- (void)setShouldIncludeDisplayName:(BOOL)a3
{
  self->_shouldIncludeDisplayName = a3;
}

- (ECEmailAddressFormatter)init
{
  return -[ECEmailAddressFormatter initWithStyle:](self, "initWithStyle:", 0);
}

- (ECEmailAddressFormatter)initWithStyle:(int64_t)a3
{
  ECEmailAddressFormatter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ECEmailAddressFormatter;
  result = -[ECEmailAddressFormatter init](&v5, sel_init);
  if (result)
    result->_style = a3;
  return result;
}

- (id)_stringFromEmailAddress:(id)a3 includeDisplayName:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "groupList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[ECEmailAddressFormatter _stringFromGroupEmailAddress:](self, "_stringFromGroupEmailAddress:", v6);
  else
    -[ECEmailAddressFormatter _stringFromMailboxAddress:includeDisplayName:](self, "_stringFromMailboxAddress:includeDisplayName:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_stringFromMailboxAddress:(id)a3 includeDisplayName:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int64_t style;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  style = self->_style;
  if (style == 1)
  {
    objc_msgSend(v6, "idnaAddress");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (style != 2)
  {
    objc_msgSend(v6, "simpleAddress");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v11 = (void *)v10;
    if (v4)
    {
      objc_msgSend(v7, "displayName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ecemailaddress_trimmedAndQuotedDisplayName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <%@>"), v13, v11);
        v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
        goto LABEL_12;
      }

    }
    v9 = v11;
    goto LABEL_11;
  }
  objc_msgSend(v6, "ef_publicDescription");
  v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v9;
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ECEmailAddressFormatter stringFromEmailAddress:](self, "stringFromEmailAddress:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EF241E20))
  {
    -[ECEmailAddressFormatter stringFromEmailAddressConvertible:](self, "stringFromEmailAddressConvertible:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v4, "ef_all:", &__block_literal_global_6))
    {
      v6 = 0;
      goto LABEL_6;
    }
    -[ECEmailAddressFormatter stringFromEmailAddressList:](self, "stringFromEmailAddressList:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_6:

  return v6;
}

uint64_t __48__ECEmailAddressFormatter_stringForObjectValue___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_1EF241E20);
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  -[ECEmailAddressFormatter emailAddressFromString:](self, "emailAddressFromString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v9);
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to parse: %@"), v8);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10 != 0;
}

- (id)emailAddressFromString:(id)a3
{
  +[ECEmailAddress emailAddressWithString:](ECEmailAddress, "emailAddressWithString:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)stringFromEmailAddressConvertible:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECEmailAddressFormatter.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("emailAddressConvertible"));

  }
  -[ECEmailAddressFormatter _stringFromEmailAddressConvertible:includeDisplayName:](self, "_stringFromEmailAddressConvertible:includeDisplayName:", v5, -[ECEmailAddressFormatter shouldIncludeDisplayName](self, "shouldIncludeDisplayName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)stringFromEmailAddressList:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ECEmailAddressFormatter _stringFromEmailAddressList:includeDisplayName:](self, "_stringFromEmailAddressList:includeDisplayName:", v4, -[ECEmailAddressFormatter shouldIncludeDisplayName](self, "shouldIncludeDisplayName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_stringFromEmailAddressConvertible:(id)a3 includeDisplayName:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "emailAddressValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[ECEmailAddressFormatter _stringFromEmailAddress:includeDisplayName:](self, "_stringFromEmailAddress:includeDisplayName:", v7, v4);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v11 = (void *)v8;
    goto LABEL_7;
  }
  if (self->_style != 2)
  {
    objc_msgSend(v6, "stringValue");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v9 = (void *)MEMORY[0x1E0D1EF48];
  objc_msgSend(v6, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fullyOrPartiallyRedactedStringForString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v11;
}

- (id)_stringFromEmailAddressList:(id)a3 includeDisplayName:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  ECEmailAddressFormatter *v13;
  BOOL v14;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__ECEmailAddressFormatter__stringFromEmailAddressList_includeDisplayName___block_invoke;
  v11[3] = &unk_1E7120FC8;
  v8 = v7;
  v12 = v8;
  v13 = self;
  v14 = a4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

void __74__ECEmailAddressFormatter__stringFromEmailAddressList_includeDisplayName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_stringFromEmailAddressConvertible:includeDisplayName:", a2, *(unsigned __int8 *)(a1 + 48));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = CFSTR(", ");
  if (!a3)
    v6 = &stru_1E7123500;
  v7 = (id)v5;
  objc_msgSend(v4, "appendFormat:", CFSTR("%@%@"), v6, v5);

}

- (id)_groupListString:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "groupList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECEmailAddressFormatter _stringFromEmailAddressList:includeDisplayName:](self, "_stringFromEmailAddressList:includeDisplayName:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_stringFromGroupEmailAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (self->_style == 2)
  {
    objc_msgSend(v4, "ef_publicDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ecemailaddress_trimmedAndQuotedDisplayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ECEmailAddressFormatter _groupListString:](self, "_groupListString:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@:%@;"), v9, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

@end
