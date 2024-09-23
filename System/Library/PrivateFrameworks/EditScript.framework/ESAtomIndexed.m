@implementation ESAtomIndexed

- (ESAtomIndexed)initWithEditOperation:(int64_t)a3 indexToEdit:(unint64_t)a4 newText:(id)a5 indexInArrayB:(unint64_t)a6
{
  id v10;
  ESAtomIndexed *v11;
  ESAtomIndexed *v12;
  objc_super v14;

  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ESAtomIndexed;
  v11 = -[ESAtomIndexed init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[ESAtomIndexed setEditOperation:](v11, "setEditOperation:", a3);
    -[ESAtomIndexed setIndexToEdit:](v12, "setIndexToEdit:", a4);
    -[ESAtomIndexed setIndexInArrayB:](v12, "setIndexInArrayB:", a6);
    -[ESAtomIndexed setReplacementText:](v12, "setReplacementText:", v10);
  }

  return v12;
}

- (id)description
{
  NSString *p_isa;
  const __CFString *v4;
  unint64_t v5;
  const __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;

  p_isa = self->_replacementText;
  if (-[NSString length](self->_replacementText, "length"))
  {
    if (!-[NSString isEqualToString:](self->_replacementText, "isEqualToString:", CFSTR(" ")))
      goto LABEL_6;
    v4 = CFSTR("[space]");
  }
  else
  {
    v4 = CFSTR("[blank]");
  }

  p_isa = &v4->isa;
LABEL_6:
  v5 = self->_editOperation - 1;
  if (v5 > 2)
    v6 = CFSTR("NO-OP");
  else
    v6 = *(&off_24F475E20 + v5);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), self->_indexToEdit);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self->_indexInArrayB == 0x7FFFFFFFFFFFFFFFLL)
  {

    v8 = CFSTR("N/A");
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("editOpertaion:%@, editIndex:%lu newText:%@ indexInArrayB:%@\n"), v6, self->_indexToEdit, p_isa, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)atomWithEditOperation:(int64_t)a3 indexToEdit:(unint64_t)a4 newText:(id)a5 indexInArrayB:(unint64_t)a6
{
  id v9;
  ESAtomIndexed *v10;

  v9 = a5;
  v10 = -[ESAtomIndexed initWithEditOperation:indexToEdit:newText:indexInArrayB:]([ESAtomIndexed alloc], "initWithEditOperation:indexToEdit:newText:indexInArrayB:", a3, a4, v9, a6);

  return v10;
}

- (int64_t)editOperation
{
  return self->_editOperation;
}

- (void)setEditOperation:(int64_t)a3
{
  self->_editOperation = a3;
}

- (unint64_t)indexToEdit
{
  return self->_indexToEdit;
}

- (void)setIndexToEdit:(unint64_t)a3
{
  self->_indexToEdit = a3;
}

- (unint64_t)indexInArrayB
{
  return self->_indexInArrayB;
}

- (void)setIndexInArrayB:(unint64_t)a3
{
  self->_indexInArrayB = a3;
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
