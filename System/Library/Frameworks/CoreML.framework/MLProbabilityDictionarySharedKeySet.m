@implementation MLProbabilityDictionarySharedKeySet

- (MLProbabilityDictionarySharedKeySet)initWithLabels:(id)a3
{
  MLProbabilityDictionarySharedKeySet *v4;
  NSDictionary *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSDictionary *labelToIndex;
  id obj;
  id obja;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  obj = a3;
  v17 = a3;
  if (!v17)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("labels is nil"), obj);
  v22.receiver = self;
  v22.super_class = (Class)MLProbabilityDictionarySharedKeySet;
  v4 = -[MLProbabilityDictionarySharedKeySet init](&v22, sel_init, obj);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v17;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v7)
    {
      v8 = 0;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8 + i);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v12, v11);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        v8 += i;
      }
      while (v7);
    }

    objc_storeStrong((id *)&v4->_labels, obja);
    labelToIndex = v4->_labelToIndex;
    v4->_labelToIndex = v5;

  }
  return v4;
}

- (unint64_t)indexOfLabel:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[NSDictionary objectForKeyedSubscript:](self->_labelToIndex, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (unint64_t)count
{
  return -[NSArray count](self->_labels, "count");
}

- (unint64_t)uniqueLabelCount
{
  return -[NSDictionary count](self->_labelToIndex, "count");
}

- (id)labelAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_labels, "objectAtIndexedSubscript:", a3);
}

- (NSEnumerator)labelEnumerator
{
  return -[NSDictionary keyEnumerator](self->_labelToIndex, "keyEnumerator");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_labelToIndex, 0);
}

@end
