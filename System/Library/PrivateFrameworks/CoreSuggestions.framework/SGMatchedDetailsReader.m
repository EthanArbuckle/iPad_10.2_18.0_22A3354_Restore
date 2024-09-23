@implementation SGMatchedDetailsReader

- (BOOL)matchAtPhraseIndex:(int64_t)a3 columnIndex:(int64_t)a4
{
  _BOOL4 v4;

  if (self->_arrayCount <= a3 || self->_phraseCount <= a3 || self->_columnCount <= a4)
    LOBYTE(v4) = 0;
  else
    return (self->_phraseMatches[a3] >> a4) & 1;
  return v4;
}

- (SGMatchedDetailsReader)initWithMatchedDetails:(id)a3
{
  id v6;
  SGMatchedDetailsReader *v7;
  SGMatchedDetailsReader *v8;
  unsigned int *v9;
  uint64_t arrayCount;
  uint64_t v11;
  uint64_t columnCount;
  void *v14;
  void *v15;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SGMatchedDetailsReader;
  v7 = -[SGMatchedDetailsReader init](&v16, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_matchDetails, a3);
    v8->_arrayCount = (unint64_t)objc_msgSend(v6, "length") >> 2;
    v8->_phraseMatches = 0;
    v8->_phraseCount = 0;
    v8->_columnCount = 0;
    v9 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v6), "bytes");
    arrayCount = v8->_arrayCount;
    v11 = arrayCount - 2;
    if (arrayCount < 2)
    {
      columnCount = v8->_columnCount;
      v11 = v8->_arrayCount;
    }
    else
    {
      columnCount = v9[1];
      v8->_phraseCount = *v9;
      v8->_columnCount = columnCount;
      v8->_arrayCount = v11;
      v8->_phraseMatches = v9 + 2;
    }
    if (columnCount >= 32)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SGMatchedDetails.m"), 73, CFSTR("The code currently assumes the column count will be <32. If you need more columns, adjust this class"));

      v11 = v8->_arrayCount;
    }
    if (v11 != v8->_phraseCount)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SGMatchedDetails.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_arrayCount == _phraseCount"));

    }
  }

  return v8;
}

- (int64_t)phraseCount
{
  return self->_phraseCount;
}

- (int64_t)columnCount
{
  return self->_columnCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchDetails, 0);
}

@end
