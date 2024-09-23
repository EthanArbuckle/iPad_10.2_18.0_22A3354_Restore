@implementation MLProbabilityDictionaryArrayStorage

- (MLProbabilityDictionaryArrayStorage)initWithArray:(id)a3
{
  id v5;
  MLProbabilityDictionaryArrayStorage *v6;
  MLProbabilityDictionaryArrayStorage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLProbabilityDictionaryArrayStorage;
  v6 = -[MLProbabilityDictionaryArrayStorage init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_array, a3);
    v7->_count = objc_msgSend(v5, "count");
  }

  return v7;
}

- (id)probabilityAtIndex:(unint64_t)a3
{
  if (-[MLProbabilityDictionaryArrayStorage count](self, "count") <= a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("Probability index %tu is out of range because there are only %tu classes."), a3, -[MLProbabilityDictionaryArrayStorage count](self, "count"));
  return -[NSArray objectAtIndexedSubscript:](self->_array, "objectAtIndexedSubscript:", a3);
}

- (unint64_t)maxElementIndex
{
  NSArray *array;
  unint64_t v3;
  _QWORD v5[6];
  _QWORD v6[5];
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__25768;
  v6[4] = __Block_byref_object_dispose__25769;
  v7 = &unk_1E3DA2B70;
  array = self->_array;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__MLProbabilityDictionaryArrayStorage_maxElementIndex__block_invoke;
  v5[3] = &unk_1E3D66F40;
  v5[4] = v6;
  v5[5] = &v8;
  -[NSArray enumerateObjectsUsingBlock:](array, "enumerateObjectsUsingBlock:", v5);
  v3 = v9[3];
  _Block_object_dispose(v6, 8);

  _Block_object_dispose(&v8, 8);
  return v3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
}

void __54__MLProbabilityDictionaryArrayStorage_maxElementIndex__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "compare:") == -1)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

@end
