@implementation MRProtobufSerialization

- (void)setDictionaryKeyToProtobufKeyMapping:(id)a3
{
  NSDictionary *v4;
  NSDictionary *dictionaryKeyToProtobufKeyMapping;
  void *v6;
  NSDictionary *v7;
  NSDictionary *v8;
  NSDictionary *protobufKeyToDictionaryKeyMapping;
  NSDictionary *v10;
  _QWORD v11[4];
  NSDictionary *v12;

  if (self->_dictionaryKeyToProtobufKeyMapping != a3)
  {
    v4 = (NSDictionary *)objc_msgSend(a3, "copy");
    dictionaryKeyToProtobufKeyMapping = self->_dictionaryKeyToProtobufKeyMapping;
    self->_dictionaryKeyToProtobufKeyMapping = v4;

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSDictionary count](self->_dictionaryKeyToProtobufKeyMapping, "count"));
    v7 = self->_dictionaryKeyToProtobufKeyMapping;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__MRProtobufSerialization_setDictionaryKeyToProtobufKeyMapping___block_invoke;
    v11[3] = &unk_1E30C8698;
    v8 = v6;
    v12 = v8;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v7, "enumerateKeysAndObjectsUsingBlock:", v11);
    protobufKeyToDictionaryKeyMapping = self->_protobufKeyToDictionaryKeyMapping;
    self->_protobufKeyToDictionaryKeyMapping = v8;
    v10 = v8;

  }
}

uint64_t __64__MRProtobufSerialization_setDictionaryKeyToProtobufKeyMapping___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

- (id)createDictionaryFromProtobuf:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *protobufKeyToDictionaryKeyMapping;
  id v7;
  id v8;
  void (**protobufValueToDictionaryPostTransformer)(id, id, id);
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  MRProtobufSerialization *v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSDictionary count](self->_dictionaryKeyToProtobufKeyMapping, "count"));
  protobufKeyToDictionaryKeyMapping = self->_protobufKeyToDictionaryKeyMapping;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__MRProtobufSerialization_createDictionaryFromProtobuf___block_invoke;
  v13[3] = &unk_1E30C86C0;
  v7 = v4;
  v14 = v7;
  v15 = self;
  v8 = v5;
  v16 = v8;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](protobufKeyToDictionaryKeyMapping, "enumerateKeysAndObjectsUsingBlock:", v13);
  protobufValueToDictionaryPostTransformer = (void (**)(id, id, id))self->_protobufValueToDictionaryPostTransformer;
  if (protobufValueToDictionaryPostTransformer)
    protobufValueToDictionaryPostTransformer[2](protobufValueToDictionaryPostTransformer, v7, v8);
  v10 = v16;
  v11 = v8;

  return v11;
}

void __56__MRProtobufSerialization_createDictionaryFromProtobuf___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "mr_valueForPotentiallyUndefinedKey:", v10);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
    if (!v8
      || ((*(void (**)(uint64_t, _QWORD, id, void *))(v8 + 16))(v8, *(_QWORD *)(a1 + 32), v10, v7),
          v9 = objc_claimAutoreleasedReturnValue(),
          v7,
          (v7 = (void *)v9) != 0))
    {
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v7, v5);

    }
  }

}

- (id)createProtobufFromDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void (**dictionaryValueToProtobufPostTransformer)(id, id, id);
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__MRProtobufSerialization_createProtobufFromDictionary___block_invoke;
  v12[3] = &unk_1E30C86E8;
  v12[4] = self;
  v6 = v4;
  v13 = v6;
  v7 = v5;
  v14 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);
  dictionaryValueToProtobufPostTransformer = (void (**)(id, id, id))self->_dictionaryValueToProtobufPostTransformer;
  if (dictionaryValueToProtobufPostTransformer)
    dictionaryValueToProtobufPostTransformer[2](dictionaryValueToProtobufPostTransformer, v6, v7);
  v9 = v14;
  v10 = v7;

  return v10;
}

void __56__MRProtobufSerialization_createProtobufFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v7;
  if (v6)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    v8 = v7;
    if (v9)
    {
      (*(void (**)(uint64_t, _QWORD, id, id))(v9 + 16))(v9, *(_QWORD *)(a1 + 40), v10, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(*(id *)(a1 + 48), "setValue:forKey:", v8, v6);
  }

}

- (NSDictionary)dictionaryKeyToProtobufKeyMapping
{
  return self->_dictionaryKeyToProtobufKeyMapping;
}

- (Class)protobufClass
{
  return self->_protobufClass;
}

- (void)setProtobufClass:(Class)a3
{
  objc_storeStrong((id *)&self->_protobufClass, a3);
}

- (id)dictionaryValueToProtobufValueTransformer
{
  return self->_dictionaryValueToProtobufValueTransformer;
}

- (void)setDictionaryValueToProtobufValueTransformer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)protobufValueToDictionaryValueTransformer
{
  return self->_protobufValueToDictionaryValueTransformer;
}

- (void)setProtobufValueToDictionaryValueTransformer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)dictionaryValueToProtobufPostTransformer
{
  return self->_dictionaryValueToProtobufPostTransformer;
}

- (void)setDictionaryValueToProtobufPostTransformer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)protobufValueToDictionaryPostTransformer
{
  return self->_protobufValueToDictionaryPostTransformer;
}

- (void)setProtobufValueToDictionaryPostTransformer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_protobufValueToDictionaryPostTransformer, 0);
  objc_storeStrong(&self->_dictionaryValueToProtobufPostTransformer, 0);
  objc_storeStrong(&self->_protobufValueToDictionaryValueTransformer, 0);
  objc_storeStrong(&self->_dictionaryValueToProtobufValueTransformer, 0);
  objc_storeStrong((id *)&self->_protobufClass, 0);
  objc_storeStrong((id *)&self->_dictionaryKeyToProtobufKeyMapping, 0);
  objc_storeStrong((id *)&self->_protobufKeyToDictionaryKeyMapping, 0);
}

@end
