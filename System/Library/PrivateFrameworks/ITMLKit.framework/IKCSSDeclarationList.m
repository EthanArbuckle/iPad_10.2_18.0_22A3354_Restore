@implementation IKCSSDeclarationList

- (IKCSSDeclarationList)init
{
  IKCSSDeclarationList *v2;
  uint64_t v3;
  IKMutableArray *declarations;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IKCSSDeclarationList;
  v2 = -[IKCSSDeclarationList init](&v6, sel_init);
  if (v2)
  {
    +[IKArray array](IKMutableArray, "array");
    v3 = objc_claimAutoreleasedReturnValue();
    declarations = v2->_declarations;
    v2->_declarations = (IKMutableArray *)v3;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[IKCSSDeclarationList declarations](self, "declarations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mutableCopy");
  v7 = (void *)v4[1];
  v4[1] = v6;

  v8 = -[IKCSSDeclarationList range](self, "range");
  objc_msgSend(v4, "setRange:", v8, v9);
  return v4;
}

- (void)addDeclaration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IKCSSDeclarationList declarations](self, "declarations");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (id)declarationAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[IKCSSDeclarationList declarations](self, "declarations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)firstDeclaration
{
  void *v2;
  void *v3;

  -[IKCSSDeclarationList declarations](self, "declarations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)lastDeclaration
{
  void *v2;
  void *v3;

  -[IKCSSDeclarationList declarations](self, "declarations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[IKCSSDeclarationList declarations](self, "declarations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)description
{
  int64_t v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSRange v18;
  NSRange v19;

  v3 = -[IKCSSDeclarationList count](self, "count") - 1;
  if (v3 < 1)
  {
    v10 = &stru_1E9F50578;
  }
  else
  {
    v4 = 0;
    v5 = &stru_1E9F50578;
    do
    {
      -[IKCSSDeclarationList declarationAtIndex:](self, "declarationAtIndex:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18.location = objc_msgSend(v6, "range");
      NSStringFromRange(v18);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKCSSDeclarationList declarationAtIndex:](self, "declarationAtIndex:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", CFSTR("(%@) %@, "), v7, v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      ++v4;
      v5 = v10;
    }
    while (v3 != v4);
  }
  if (-[IKCSSDeclarationList count](self, "count"))
  {
    -[IKCSSDeclarationList declarationAtIndex:](self, "declarationAtIndex:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19.location = objc_msgSend(v11, "range");
    NSStringFromRange(v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKCSSDeclarationList declarationAtIndex:](self, "declarationAtIndex:", v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v10, "stringByAppendingFormat:", CFSTR("(%@) %@, "), v12, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v10 = (__CFString *)v15;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]"), v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (IKMutableArray)declarations
{
  return self->_declarations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declarations, 0);
}

@end
