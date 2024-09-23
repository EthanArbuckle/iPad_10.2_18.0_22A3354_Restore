@implementation ESAtomRanged

- (ESAtomRanged)initWithEditRange:(_NSRange)a3 replacementText:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  ESAtomRanged *v8;
  ESAtomRanged *v9;
  objc_super v11;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ESAtomRanged;
  v8 = -[ESAtomRanged init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ESAtomRanged setEditRange:](v8, "setEditRange:", location, length);
    -[ESAtomRanged setReplacementText:](v9, "setReplacementText:", v7);
  }

  return v9;
}

- (id)description
{
  NSString *p_isa;
  const __CFString *v4;
  void *v5;

  p_isa = self->_replacementText;
  if (!-[NSString length](self->_replacementText, "length"))
  {
    v4 = CFSTR("[blank]");
    goto LABEL_5;
  }
  if (-[NSString isEqualToString:](self->_replacementText, "isEqualToString:", CFSTR(" ")))
  {
    v4 = CFSTR("[space]");
LABEL_5:

    p_isa = &v4->isa;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%lu, %lu):%@\n"), self->_editRange.location, self->_editRange.length, p_isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  ESAtomRanged *v4;
  ESAtomRanged *v5;
  BOOL v6;

  v4 = (ESAtomRanged *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ESAtomRanged isEqualToEditScriptAtomRanged:](self, "isEqualToEditScriptAtomRanged:", v5);

  return v6;
}

- (BOOL)isEqualToEditScriptAtomRanged:(id)a3
{
  ESAtomRanged *v4;
  ESAtomRanged *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v4 = (ESAtomRanged *)a3;
  v5 = v4;
  if (self == v4)
  {
    v15 = 1;
  }
  else if (v4
         && (v6 = -[ESAtomRanged editRange](self, "editRange"), v6 == -[ESAtomRanged editRange](v5, "editRange"))
         && (-[ESAtomRanged editRange](self, "editRange"), v8 = v7, -[ESAtomRanged editRange](v5, "editRange"), v8 == v9))
  {
    -[ESAtomRanged replacementText](self, "replacementText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ESAtomRanged replacementText](v5, "replacementText");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v10 == (void *)v11)
    {
      v15 = 1;
      v12 = v10;
    }
    else
    {
      v12 = (void *)v11;
      -[ESAtomRanged replacementText](self, "replacementText");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ESAtomRanged replacementText](v5, "replacementText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToString:", v14);

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)atomWithEditRange:(_NSRange)a3 replacementText:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  ESAtomRanged *v7;

  length = a3.length;
  location = a3.location;
  v6 = a4;
  v7 = -[ESAtomRanged initWithEditRange:replacementText:]([ESAtomRanged alloc], "initWithEditRange:replacementText:", location, length, v6);

  return v7;
}

- (_NSRange)editRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_editRange.length;
  location = self->_editRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setEditRange:(_NSRange)a3
{
  self->_editRange = a3;
}

- (NSString)replacementText
{
  return self->_replacementText;
}

- (void)setReplacementText:(id)a3
{
  objc_storeStrong((id *)&self->_replacementText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementText, 0);
}

@end
