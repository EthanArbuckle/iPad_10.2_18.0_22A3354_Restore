@implementation CRKOrderedOneToManyKVOAccumulatorResults

- (BOOL)isEmpty
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  -[CRKOrderedOneToManyKVOAccumulatorResults insertions](self, "insertions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[CRKOrderedOneToManyKVOAccumulatorResults deletions](self, "deletions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v4 = 0;
    }
    else
    {
      -[CRKOrderedOneToManyKVOAccumulatorResults replacements](self, "replacements");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        v4 = 0;
      }
      else
      {
        -[CRKOrderedOneToManyKVOAccumulatorResults moves](self, "moves");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v7, "count") == 0;

      }
    }

  }
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CRKOrderedOneToManyKVOAccumulatorResults insertions](self, "insertions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKOrderedOneToManyKVOAccumulatorResults deletions](self, "deletions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKOrderedOneToManyKVOAccumulatorResults replacements](self, "replacements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKOrderedOneToManyKVOAccumulatorResults moves](self, "moves");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("insertions: %@\ndeletions: %@\nreplacements: %@\nmoves: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)netCountChange
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t v6;

  -[CRKOrderedOneToManyKVOAccumulatorResults insertions](self, "insertions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[CRKOrderedOneToManyKVOAccumulatorResults deletions](self, "deletions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 - objc_msgSend(v5, "count");

  return v6;
}

- (id)resultsByExcludingLocalDeletions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[CRKOrderedOneToManyKVOAccumulatorResults deletions](self, "deletions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "removeIndexes:", v4);
  -[CRKOrderedOneToManyKVOAccumulatorResults insertions](self, "insertions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInsertions:", v8);

  v9 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v5, "setDeletions:", v9);

  -[CRKOrderedOneToManyKVOAccumulatorResults replacements](self, "replacements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setReplacements:", v10);

  -[CRKOrderedOneToManyKVOAccumulatorResults moves](self, "moves");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMoves:", v11);

  return v5;
}

- (NSIndexSet)insertions
{
  return self->_insertions;
}

- (void)setInsertions:(id)a3
{
  objc_storeStrong((id *)&self->_insertions, a3);
}

- (NSIndexSet)deletions
{
  return self->_deletions;
}

- (void)setDeletions:(id)a3
{
  objc_storeStrong((id *)&self->_deletions, a3);
}

- (NSIndexSet)replacements
{
  return self->_replacements;
}

- (void)setReplacements:(id)a3
{
  objc_storeStrong((id *)&self->_replacements, a3);
}

- (NSArray)moves
{
  return self->_moves;
}

- (void)setMoves:(id)a3
{
  objc_storeStrong((id *)&self->_moves, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moves, 0);
  objc_storeStrong((id *)&self->_replacements, 0);
  objc_storeStrong((id *)&self->_deletions, 0);
  objc_storeStrong((id *)&self->_insertions, 0);
}

@end
