@implementation NPComponentSequence

- (NPComponentSequence)initWithObservationSequence:(id)a3 hiddenSequence:(id)a4 oovIndices:(id)a5 emissionModelScore:(double)a6 stateModelScore:(double)a7 boost:(double)a8
{
  id v14;
  id v15;
  id v16;
  NPComponentSequence *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v22.receiver = self;
  v22.super_class = (Class)NPComponentSequence;
  v17 = -[NPComponentSequence init](&v22, sel_init);
  if (v17)
  {
    v18 = (void *)objc_msgSend(v14, "copy");
    -[NPComponentSequence setObservation:](v17, "setObservation:", v18);

    v19 = (void *)objc_msgSend(v15, "copy");
    -[NPComponentSequence setSequence:](v17, "setSequence:", v19);

    v20 = (void *)objc_msgSend(v16, "copy");
    -[NPComponentSequence setOovIndices:](v17, "setOovIndices:", v20);

    -[NPComponentSequence setEmissionModelScore:](v17, "setEmissionModelScore:", a6);
    -[NPComponentSequence setStateModelScore:](v17, "setStateModelScore:", a7);
    -[NPComponentSequence setScore:](v17, "setScore:", floor((a6 + a7 + a8) * 1000000.0) / 1000000.0);
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3 || -[NPComponentSequence isEqualToComponentSequence:](self, "isEqualToComponentSequence:");
}

- (BOOL)isEqualToComponentSequence:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  -[NPComponentSequence score](self, "score");
  v6 = v5;
  objc_msgSend(v4, "score");
  if (v6 == v7)
  {
    -[NPComponentSequence sequence](self, "sequence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sequence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToArray:", v9))
    {
      -[NPComponentSequence oovIndices](self, "oovIndices");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "oovIndices");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToArray:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NPComponentSequence sequence](self, "sequence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPComponentSequence observation](self, "observation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPComponentSequence oovTokens](self, "oovTokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPComponentSequence emissionModelScore](self, "emissionModelScore");
  v8 = v7;
  -[NPComponentSequence stateModelScore](self, "stateModelScore");
  v10 = v9;
  -[NPComponentSequence score](self, "score");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<sequence = %@, observations = %@, oovTokens = %@, emission = %f, state = %f, score = %f>"), v4, v5, v6, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsSeparatedByCharactersInSet:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsJoinedByString:", &stru_1EA0BC8D8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _NPCollapseWhitespaceAndStrip(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)setValue:(id)a3 atSequenceIndex:(unint64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[NPComponentSequence sequence](self, "sequence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 > a4)
  {
    v8 = (void *)MEMORY[0x1E0C99DE8];
    -[NPComponentSequence sequence](self, "sequence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setObject:atIndexedSubscript:", v11, a4);
    -[NPComponentSequence setSequence:](self, "setSequence:", v10);

  }
}

- (id)oovTokens
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[NPComponentSequence oovIndices](self, "oovIndices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NPComponentSequence oovIndices](self, "oovIndices", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        -[NPComponentSequence observation](self, "observation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v11, "integerValue"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (NSArray)observation
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setObservation:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSArray)sequence
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSequence:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSArray)oovIndices
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOovIndices:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)emissionModelScore
{
  return self->_emissionModelScore;
}

- (void)setEmissionModelScore:(double)a3
{
  self->_emissionModelScore = a3;
}

- (double)stateModelScore
{
  return self->_stateModelScore;
}

- (void)setStateModelScore:(double)a3
{
  self->_stateModelScore = a3;
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

- (void)setFavorite:(BOOL)a3
{
  self->_favorite = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oovIndices, 0);
  objc_storeStrong((id *)&self->_sequence, 0);
  objc_storeStrong((id *)&self->_observation, 0);
}

@end
