@implementation _DPPuzzleBox

- (_DPPuzzleBox)init
{

  return 0;
}

- (_DPPuzzleBox)initWithDimensionality:(unint64_t)a3
{
  _BOOL4 v5;
  _DPPuzzleBox *v6;
  _DPPuzzleBox *v7;
  objc_super v9;

  v5 = isNonZeroPowerOfTwo(a3);
  v6 = 0;
  if (a3 <= 0x100 && v5)
  {
    v9.receiver = self;
    v9.super_class = (Class)_DPPuzzleBox;
    v7 = -[_DPPuzzleBox init](&v9, sel_init);
    if (v7)
      v7->_k = a3;
    self = v7;
    v6 = self;
  }

  return v6;
}

+ (id)puzzleBoxWithDimensionality:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDimensionality:", a3);
}

- (id)puzzlePieceFor:(id)a3
{
  id v4;
  const void *v5;
  void *v6;
  unsigned __int8 md[32];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a3);
  v5 = (const void *)objc_msgSend(v4, "UTF8String");
  if (v5)
  {
    CC_SHA256(v5, objc_msgSend(v4, "length"), md);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%04x"), ((LOBYTE(self->_k) - 1) & md[0]));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)k
{
  return self->_k;
}

@end
