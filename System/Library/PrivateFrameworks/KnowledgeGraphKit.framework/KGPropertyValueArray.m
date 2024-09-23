@implementation KGPropertyValueArray

- (KGPropertyValueArray)initWithValues:(id)a3 elementIdentifiers:(id)a4
{
  id v7;
  id v8;
  KGPropertyValueArray *v9;
  KGPropertyValueArray *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)KGPropertyValueArray;
  v9 = -[KGPropertyValueArray init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_values, a3);
    objc_storeStrong((id *)&v10->_elementIdentifiers, a4);
  }

  return v10;
}

- (void)enumerateUsingBlock:(id)a3
{
  id v4;
  KGElementIdentifierSet *elementIdentifiers;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD *v9;
  _QWORD v10[4];

  v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  elementIdentifiers = self->_elementIdentifiers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__KGPropertyValueArray_enumerateUsingBlock___block_invoke;
  v7[3] = &unk_1E83E53B8;
  v7[4] = self;
  v9 = v10;
  v6 = v4;
  v8 = v6;
  -[KGElementIdentifierSet enumerateIdentifiersWithBlock:](elementIdentifiers, "enumerateIdentifiersWithBlock:", v7);

  _Block_object_dispose(v10, 8);
}

- (NSArray)values
{
  return self->_values;
}

- (KGElementIdentifierSet)elementIdentifiers
{
  return self->_elementIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementIdentifiers, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

void __44__KGPropertyValueArray_enumerateUsingBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1[4] + 8);
  ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  objc_msgSend(v2, "objectAtIndexedSubscript:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[5] + 16))();

}

@end
