@implementation MAElementCollection

- (MAElementCollection)initWithGraphReference:(id)a3 elementIdentifiers:(id)a4
{
  id v7;
  id v8;
  MAElementCollection *v9;
  MAElementCollection *v10;
  KGElementIdentifierSet *v11;
  KGElementIdentifierSet *elementIdentifiers;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MAElementCollection;
  v9 = -[MAElementCollection init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_graphReference, a3);
    if (v8)
      v11 = (KGElementIdentifierSet *)v8;
    else
      v11 = objc_alloc_init(KGElementIdentifierSet);
    elementIdentifiers = v10->_elementIdentifiers;
    v10->_elementIdentifiers = v11;

  }
  return v10;
}

- (MAElementCollection)initWithGraph:(id)a3 elementIdentifiers:(id)a4
{
  id v6;
  void *v7;
  MAElementCollection *v8;

  v6 = a4;
  objc_msgSend(a3, "graphReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MAElementCollection initWithGraphReference:elementIdentifiers:](self, "initWithGraphReference:elementIdentifiers:", v7, v6);

  return v8;
}

- (MAElementCollection)initWithGraph:(id)a3
{
  void *v4;
  KGElementIdentifierSet *v5;
  MAElementCollection *v6;

  objc_msgSend(a3, "graphReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(KGElementIdentifierSet);
  v6 = -[MAElementCollection initWithGraphReference:elementIdentifiers:](self, "initWithGraphReference:elementIdentifiers:", v4, v5);

  return v6;
}

- (MAElementCollection)initWithArray:(id)a3 graph:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  MAElementCollection *v9;

  v6 = a3;
  objc_msgSend(a4, "graphReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  KGElementIdentifierSetWithArray(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[MAElementCollection initWithGraphReference:elementIdentifiers:](self, "initWithGraphReference:elementIdentifiers:", v7, v8);
  return v9;
}

- (MAElementCollection)initWithSet:(id)a3 graph:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  MAElementCollection *v9;

  v6 = a3;
  objc_msgSend(a4, "graphReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  KGElementIdentifierSetWithSet(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[MAElementCollection initWithGraphReference:elementIdentifiers:](self, "initWithGraphReference:elementIdentifiers:", v7, v8);
  return v9;
}

- (MAGraphProxy)graph
{
  return -[MAGraphReference graph](self->_graphReference, "graph");
}

- (BOOL)isEmpty
{
  return -[KGElementIdentifierSet isEmpty](self->_elementIdentifiers, "isEmpty");
}

- (unint64_t)count
{
  return -[KGElementIdentifierSet count](self->_elementIdentifiers, "count");
}

- (NSSet)labels
{
  id v2;

  KGAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)_enumerateUsingBlock:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  KGAbstractMethodException(self, a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)enumerateIdentifiersAsCollectionsWithBlock:(id)a3
{
  id v4;
  KGElementIdentifierSet *elementIdentifiers;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  elementIdentifiers = self->_elementIdentifiers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__MAElementCollection_enumerateIdentifiersAsCollectionsWithBlock___block_invoke;
  v7[3] = &unk_1E83E33D8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[KGElementIdentifierSet enumerateIdentifiersWithBlock:](elementIdentifiers, "enumerateIdentifiersWithBlock:", v7);

}

- (void)enumerateIntegerPropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  KGAbstractMethodException(self, a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (void)enumerateStringPropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  KGAbstractMethodException(self, a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (void)enumerateDoublePropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  KGAbstractMethodException(self, a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (void)enumerateUnsignedIntegerPropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  KGAbstractMethodException(self, a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (void)enumerateUnsignedLongLongPropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  KGAbstractMethodException(self, a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (id)filteredCollectionUsingBlock:(id)a3
{
  id v4;
  KGElementIdentifierSet *elementIdentifiers;
  id v6;
  KGElementIdentifierSet *v7;
  id v8;
  MAElementCollection *v9;
  MAElementCollection *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  MAElementCollection *v16;
  id v17;

  v4 = a3;
  elementIdentifiers = self->_elementIdentifiers;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __52__MAElementCollection_filteredCollectionUsingBlock___block_invoke;
  v15 = &unk_1E83E3400;
  v16 = self;
  v6 = v4;
  v17 = v6;
  -[KGElementIdentifierSet identifierSetByFilteringUsingBlock:](elementIdentifiers, "identifierSetByFilteringUsingBlock:", &v12);
  v7 = (KGElementIdentifierSet *)objc_claimAutoreleasedReturnValue();
  if (v7 == self->_elementIdentifiers)
  {
    v9 = self;
  }
  else
  {
    v8 = objc_alloc((Class)objc_opt_class());
    v9 = (MAElementCollection *)objc_msgSend(v8, "initWithGraphReference:elementIdentifiers:", self->_graphReference, v7, v12, v13, v14, v15, v16);
  }
  v10 = v9;

  return v10;
}

- (id)array
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__MAElementCollection_array__block_invoke;
  v6[3] = &unk_1E83E3428;
  v4 = v3;
  v7 = v4;
  -[MAElementCollection _enumerateUsingBlock:](self, "_enumerateUsingBlock:", v6);

  return v4;
}

- (id)sortedArrayUsingDescriptors:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MAElementCollection array](self, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)set
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__MAElementCollection_set__block_invoke;
  v6[3] = &unk_1E83E3428;
  v4 = v3;
  v7 = v4;
  -[MAElementCollection _enumerateUsingBlock:](self, "_enumerateUsingBlock:", v6);

  return v4;
}

- (id)_anyElement
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1860;
  v9 = __Block_byref_object_dispose__1861;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__MAElementCollection__anyElement__block_invoke;
  v4[3] = &unk_1E83E3450;
  v4[4] = &v5;
  -[MAElementCollection _enumerateUsingBlock:](self, "_enumerateUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)collectionByFormingUnionWith:(id)a3
{
  KGElementIdentifierSet *elementIdentifiers;
  void *v5;
  void *v6;
  void *v7;

  elementIdentifiers = self->_elementIdentifiers;
  objc_msgSend(a3, "elementIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGElementIdentifierSet identifierSetByFormingUnion:](elementIdentifiers, "identifierSetByFormingUnion:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGraphReference:elementIdentifiers:", self->_graphReference, v6);
  return v7;
}

- (id)collectionByIntersecting:(id)a3
{
  KGElementIdentifierSet *elementIdentifiers;
  void *v5;
  void *v6;
  void *v7;

  elementIdentifiers = self->_elementIdentifiers;
  objc_msgSend(a3, "elementIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGElementIdentifierSet identifierSetByIntersectingIdentifierSet:](elementIdentifiers, "identifierSetByIntersectingIdentifierSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGraphReference:elementIdentifiers:", self->_graphReference, v6);
  return v7;
}

- (id)collectionBySubtracting:(id)a3
{
  KGElementIdentifierSet *elementIdentifiers;
  void *v5;
  void *v6;
  void *v7;

  elementIdentifiers = self->_elementIdentifiers;
  objc_msgSend(a3, "elementIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGElementIdentifierSet identifierSetBySubtractingIdentifierSet:](elementIdentifiers, "identifierSetBySubtractingIdentifierSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGraphReference:elementIdentifiers:", self->_graphReference, v6);
  return v7;
}

- (BOOL)intersectsCollection:(id)a3
{
  return -[KGElementIdentifierSet intersectsIdentifierSet:](self->_elementIdentifiers, "intersectsIdentifierSet:", *((_QWORD *)a3 + 2));
}

- (BOOL)isSubsetOfCollection:(id)a3
{
  return -[KGElementIdentifierSet isSubsetOfIdentifierSet:](self->_elementIdentifiers, "isSubsetOfIdentifierSet:", *((_QWORD *)a3 + 2));
}

- (BOOL)containsCollection:(id)a3
{
  return -[KGElementIdentifierSet containsIdentifierSet:](self->_elementIdentifiers, "containsIdentifierSet:", *((_QWORD *)a3 + 2));
}

- (BOOL)isEqual:(id)a3
{
  MAElementCollection *v4;
  MAElementCollection *v5;
  MAGraphReference *graphReference;
  MAGraphReference *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = (MAElementCollection *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      graphReference = self->_graphReference;
      -[MAElementCollection graphReference](v5, "graphReference");
      v7 = (MAGraphReference *)objc_claimAutoreleasedReturnValue();

      if (graphReference == v7)
      {
        -[MAElementCollection elementIdentifiers](self, "elementIdentifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[MAElementCollection elementIdentifiers](v5, "elementIdentifiers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v9, "isEqualToElementIdentifierSet:", v10);

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[MAGraphReference hash](self->_graphReference, "hash") + 2654435769u;
  return (-[KGElementIdentifierSet hash](self->_elementIdentifiers, "hash") + (v3 << 6) + (v3 >> 2) + 2654435769u) ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  MAGraphReference *graphReference;
  id v7;
  void *v8;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  graphReference = self->_graphReference;
  v7 = -[KGElementIdentifierSet copyWithZone:](self->_elementIdentifiers, "copyWithZone:", a3);
  v8 = (void *)objc_msgSend(v5, "initWithGraphReference:elementIdentifiers:", graphReference, v7);

  return v8;
}

- (MAGraphReference)graphReference
{
  return (MAGraphReference *)objc_getProperty(self, a2, 8, 1);
}

- (KGElementIdentifierSet)elementIdentifiers
{
  return self->_elementIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementIdentifiers, 0);
  objc_storeStrong((id *)&self->_graphReference, 0);
}

void __34__MAElementCollection__anyElement__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

uint64_t __26__MAElementCollection_set__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __28__MAElementCollection_array__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __52__MAElementCollection_filteredCollectionUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  KGElementIdentifierSet *v5;
  void *v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x1CAA4B20C]();
  v5 = -[KGElementIdentifierSet initWithElementIdentifier:]([KGElementIdentifierSet alloc], "initWithElementIdentifier:", a2);
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGraphReference:elementIdentifiers:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v5);
  v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  objc_autoreleasePoolPop(v4);
  return v7;
}

void __66__MAElementCollection_enumerateIdentifiersAsCollectionsWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  KGElementIdentifierSet *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1CAA4B20C]();
  v5 = -[KGElementIdentifierSet initWithElementIdentifier:]([KGElementIdentifierSet alloc], "initWithElementIdentifier:", a2);
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGraphReference:elementIdentifiers:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  objc_autoreleasePoolPop(v4);
}

@end
