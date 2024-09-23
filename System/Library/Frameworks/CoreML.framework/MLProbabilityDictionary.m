@implementation MLProbabilityDictionary

- (MLProbabilityDictionary)initWithLabelIndexMap:(id)a3 storage:(id)a4
{
  id v7;
  id v8;
  MLProbabilityDictionary *v9;
  MLProbabilityDictionary *v10;
  id *p_labelIndexMap;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MLProbabilityDictionary;
  v9 = -[MLProbabilityDictionary init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    p_labelIndexMap = (id *)&v9->_labelIndexMap;
    objc_storeStrong((id *)&v9->_labelIndexMap, a3);
    objc_storeStrong((id *)&v10->_storage, a4);
    v12 = -[MLProbabilityDictionaryStorage count](v10->_storage, "count");
    if (v12 != objc_msgSend(*p_labelIndexMap, "count"))
    {
      v13 = (void *)MEMORY[0x1E0C99DA0];
      v14 = objc_msgSend(*p_labelIndexMap, "count");
      v15 = -[MLProbabilityDictionaryStorage count](v10->_storage, "count");
      objc_msgSend(v13, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The number of labels (%tu) doesn't match the number of probabilities (%tu)."), v14, v15);
    }
  }

  return v10;
}

- (MLProbabilityDictionary)initWithSharedKeySet:(id)a3 probabilityMultiArray:(id)a4
{
  objc_object *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  MLProbabilityDictionaryMultiArrayStorage *v12;
  MLProbabilityDictionary *v13;

  v6 = (objc_object *)a3;
  v7 = a4;
  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("probabilities is nil."));
  LabelIndexMapFromSharedKeySet(v6);
  objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (v8 != -[objc_object count](v6, "count"))
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = -[objc_object count](v6, "count");
    v11 = objc_msgSend(v7, "count");
    objc_msgSend(v9, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("There are %tu class labels but class probability multiArray has %tu entries."), v10, v11);
  }
  v12 = -[MLProbabilityDictionaryMultiArrayStorage initWithMultiArray:]([MLProbabilityDictionaryMultiArrayStorage alloc], "initWithMultiArray:", v7);
  v13 = -[MLProbabilityDictionary initWithLabelIndexMap:storage:](self, "initWithLabelIndexMap:storage:", v6, v12);

  return v13;
}

- (MLProbabilityDictionary)initWithSharedKeySet:(id)a3 probabilities:(const double *)a4
{
  objc_object *v6;
  MLProbabilityDictionaryFloat64Storage *v7;
  MLProbabilityDictionary *v8;

  v6 = (objc_object *)a3;
  if (!a4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("probabilities is nil."));
  LabelIndexMapFromSharedKeySet(v6);
  objc_claimAutoreleasedReturnValue();
  v7 = -[MLProbabilityDictionaryFloat64Storage initWithFloat64CArray:count:]([MLProbabilityDictionaryFloat64Storage alloc], "initWithFloat64CArray:count:", a4, -[objc_object count](v6, "count"));
  v8 = -[MLProbabilityDictionary initWithLabelIndexMap:storage:](self, "initWithLabelIndexMap:storage:", v6, v7);

  return v8;
}

- (MLProbabilityDictionary)initWithSharedKeySet:(id)a3 probabilityArray:(id)a4
{
  objc_object *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  MLProbabilityDictionaryArrayStorage *v12;
  MLProbabilityDictionary *v13;

  v6 = (objc_object *)a3;
  v7 = a4;
  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("probabilities is nil."));
  LabelIndexMapFromSharedKeySet(v6);
  objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (v8 != -[objc_object count](v6, "count"))
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = -[objc_object count](v6, "count");
    v11 = objc_msgSend(v7, "count");
    objc_msgSend(v9, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("There are %tu class labels but class probability array has %tu entries."), v10, v11);
  }
  v12 = -[MLProbabilityDictionaryArrayStorage initWithArray:]([MLProbabilityDictionaryArrayStorage alloc], "initWithArray:", v7);
  v13 = -[MLProbabilityDictionary initWithLabelIndexMap:storage:](self, "initWithLabelIndexMap:storage:", v6, v12);

  return v13;
}

- (MLProbabilityDictionary)initWithLabels:(id)a3 probabilityArray:(id)a4
{
  id v6;
  void *v7;
  MLProbabilityDictionary *v8;

  v6 = a4;
  +[MLProbabilityDictionary sharedKeySetForLabels:](MLProbabilityDictionary, "sharedKeySetForLabels:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MLProbabilityDictionary initWithSharedKeySet:probabilityArray:](self, "initWithSharedKeySet:probabilityArray:", v7, v6);

  return v8;
}

- (MLProbabilityDictionary)initWithLabels:(id)a3 probabilities:(const double *)a4
{
  void *v6;
  MLProbabilityDictionary *v7;

  +[MLProbabilityDictionary sharedKeySetForLabels:](MLProbabilityDictionary, "sharedKeySetForLabels:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MLProbabilityDictionary initWithSharedKeySet:probabilities:](self, "initWithSharedKeySet:probabilities:", v6, a4);

  return v7;
}

- (MLProbabilityDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  void *v8;
  void *v9;
  MLProbabilityDictionary *v10;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", a3, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MLProbabilityDictionary initWithLabels:probabilityArray:](self, "initWithLabels:probabilityArray:", v8, v9);

  return v10;
}

- (id)classLabelOfMaxProbability
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[MLProbabilityDictionary storage](self, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (v5 = objc_msgSend(v3, "maxElementIndex"), v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    -[MLProbabilityDictionary labelIndexMap](self, "labelIndexMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "labelAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[MLProbabilityDictionary labelIndexMap](self, "labelIndexMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "uniqueLabelCount");

  return v3;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[MLProbabilityDictionary labelIndexMap](self, "labelIndexMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfLabel:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    -[MLProbabilityDictionary storage](self, "storage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "probabilityAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)keyEnumerator
{
  void *v2;
  void *v3;

  -[MLProbabilityDictionary labelIndexMap](self, "labelIndexMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "labelEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (MLProbabilityDictionarySharedKeySet)labelIndexMap
{
  return (MLProbabilityDictionarySharedKeySet *)objc_getProperty(self, a2, 8, 1);
}

- (MLProbabilityDictionaryStorage)storage
{
  return (MLProbabilityDictionaryStorage *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_labelIndexMap, 0);
}

+ (id)sharedKeySetForLabels:(id)a3
{
  id v3;
  MLProbabilityDictionarySharedKeySet *v4;

  v3 = a3;
  v4 = -[MLProbabilityDictionarySharedKeySet initWithLabels:]([MLProbabilityDictionarySharedKeySet alloc], "initWithLabels:", v3);

  return v4;
}

@end
