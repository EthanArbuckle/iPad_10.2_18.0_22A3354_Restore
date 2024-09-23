@implementation NSBlockPredicate

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  self->_block = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSBlockPredicate;
  -[NSBlockPredicate dealloc](&v3, sel_dealloc);
}

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id *v13;
  objc_class *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!-[NSPredicate _allowsEvaluation](self, "_allowsEvaluation"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("This predicate has evaluation disabled"), 0));
  v7 = (void *)MEMORY[0x186DA8F78]();
  if (!a4 || (v13 = (id *)a4, object_getClass(a4) != (Class)_NSNestedDictionary))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v14 = (objc_class *)objc_opt_class();
    v13 = (id *)&v17;
    object_setClass(&v17, v14);
    *(_QWORD *)&v18 = a4;
  }
  v15 = (*((uint64_t (**)(id, id, id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))self->_block
         + 2))(self->_block, a3, a4, v8, v9, v10, v11, v12, v17, *((_QWORD *)&v17 + 1), v18, *((_QWORD *)&v18 + 1));
  if (v13 != a4)

  objc_autoreleasePoolPop(v7);
  return v15;
}

- (NSBlockPredicate)initWithBlock:(id)a3
{
  NSBlockPredicate *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSBlockPredicate;
  v4 = -[NSBlockPredicate init](&v6, sel_init);
  if (v4)
    v4->_block = (id)objc_msgSend(a3, "copy");
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSBlockPredicate cannot be encoded or decoded"), 0));
}

- (NSBlockPredicate)initWithCoder:(id)a3
{

  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSBlockPredicate cannot be encoded or decoded"), 0));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBlock:", self->_block);
}

- (id)predicateFormat
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BLOCKPREDICATE(%p)"), self->_block);
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  objc_msgSend(a3, "visitPredicate:", self, a4);
}

- (NSBlockPredicate)predicateWithSubstitutionVariables:(id)a3
{
  return (NSBlockPredicate *)(id)-[NSBlockPredicate copy](self, "copy", a3);
}

- (id)_predicateBlock
{
  return self->_block;
}

@end
