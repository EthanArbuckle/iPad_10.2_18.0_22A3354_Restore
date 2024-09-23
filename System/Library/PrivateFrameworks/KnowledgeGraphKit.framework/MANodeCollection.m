@implementation MANodeCollection

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MANodeCollection;
  -[MANodeCollection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAElementCollection array](self, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (MANodeCollection)initWithNode:(id)a3
{
  id v4;
  void *v5;
  KGElementIdentifierSet *v6;
  uint64_t v7;
  KGElementIdentifierSet *v8;
  MANodeCollection *v9;

  v4 = a3;
  objc_msgSend(v4, "graphReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [KGElementIdentifierSet alloc];
  v7 = objc_msgSend(v4, "identifier");

  v8 = -[KGElementIdentifierSet initWithElementIdentifier:](v6, "initWithElementIdentifier:", v7);
  v9 = -[MAElementCollection initWithGraphReference:elementIdentifiers:](self, "initWithGraphReference:elementIdentifiers:", v5, v8);

  return v9;
}

- (void)_enumerateUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MAElementCollection graphReference](self, "graphReference");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "concreteGraph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAElementCollection elementIdentifiers](self, "elementIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateNodesWithIdentifiers:usingBlock:", v6, v4);

}

- (void)enumerateNodesUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MAElementCollection graphReference](self, "graphReference");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "concreteGraph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAElementCollection elementIdentifiers](self, "elementIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateNodesWithIdentifiers:usingBlock:", v6, v4);

}

- (void)enumerateNodesSortedByStringPropertyForName:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[MAElementCollection graphReference](self, "graphReference");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "concreteGraph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAElementCollection elementIdentifiers](self, "elementIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumerateNodesWithIdentifiers:sortedByStringPropertyForName:usingBlock:", v9, v7, v6);

}

- (void)enumerateNodesSortedByIntegerPropertyForName:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[MAElementCollection graphReference](self, "graphReference");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "concreteGraph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAElementCollection elementIdentifiers](self, "elementIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumerateNodesWithIdentifiers:sortedByIntegerPropertyForName:usingBlock:", v9, v7, v6);

}

- (void)enumerateNodesSortedByFloatPropertyForName:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[MAElementCollection graphReference](self, "graphReference");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "concreteGraph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAElementCollection elementIdentifiers](self, "elementIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumerateNodesWithIdentifiers:sortedByFloatPropertyForName:usingBlock:", v9, v7, v6);

}

- (void)enumerateIntegerPropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[MAElementCollection graphReference](self, "graphReference");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "concreteGraph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAElementCollection elementIdentifiers](self, "elementIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumerateIntegerPropertyValuesForKey:ofNodesWithIdentifiers:usingBlock:", v7, v9, v6);

}

- (void)enumerateStringPropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[MAElementCollection graphReference](self, "graphReference");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "concreteGraph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAElementCollection elementIdentifiers](self, "elementIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumerateStringPropertyValuesForKey:ofNodesWithIdentifiers:usingBlock:", v7, v9, v6);

}

- (void)enumerateDoublePropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[MAElementCollection graphReference](self, "graphReference");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "concreteGraph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAElementCollection elementIdentifiers](self, "elementIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumerateDoublePropertyValuesForKey:ofNodesWithIdentifiers:usingBlock:", v7, v9, v6);

}

- (void)enumerateUnsignedIntegerPropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[MAElementCollection graphReference](self, "graphReference");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "concreteGraph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAElementCollection elementIdentifiers](self, "elementIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumerateUnsignedIntegerPropertyValuesForKey:ofNodesWithIdentifiers:usingBlock:", v7, v9, v6);

}

- (void)enumerateUnsignedLongLongPropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[MAElementCollection graphReference](self, "graphReference");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "concreteGraph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAElementCollection elementIdentifiers](self, "elementIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumerateUnsignedLongLongPropertyValuesForKey:ofNodesWithIdentifiers:usingBlock:", v7, v9, v6);

}

- (void)enumerateNodesAsCollectionsSortedByStringPropertyForName:(id)a3 ascending:(BOOL)a4 usingBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[MAElementCollection graphReference](self, "graphReference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "concreteGraph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAElementCollection elementIdentifiers](self, "elementIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __98__MANodeCollection_enumerateNodesAsCollectionsSortedByStringPropertyForName_ascending_usingBlock___block_invoke;
  v14[3] = &unk_1E83E33D8;
  v14[4] = self;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v11, "enumerateNodeIdentifiers:sortedByStringPropertyForName:ascending:usingBlock:", v12, v9, v5, v14);

}

- (void)enumerateNodesAsCollectionsSortedByIntegerPropertyForName:(id)a3 ascending:(BOOL)a4 usingBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[MAElementCollection graphReference](self, "graphReference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "concreteGraph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAElementCollection elementIdentifiers](self, "elementIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __99__MANodeCollection_enumerateNodesAsCollectionsSortedByIntegerPropertyForName_ascending_usingBlock___block_invoke;
  v14[3] = &unk_1E83E33D8;
  v14[4] = self;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v11, "enumerateNodeIdentifiers:sortedByIntegerPropertyForName:ascending:usingBlock:", v12, v9, v5, v14);

}

- (void)enumerateNodesAsCollectionsSortedByDoublePropertyForName:(id)a3 ascending:(BOOL)a4 usingBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[MAElementCollection graphReference](self, "graphReference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "concreteGraph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAElementCollection elementIdentifiers](self, "elementIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __98__MANodeCollection_enumerateNodesAsCollectionsSortedByDoublePropertyForName_ascending_usingBlock___block_invoke;
  v14[3] = &unk_1E83E33D8;
  v14[4] = self;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v11, "enumerateNodeIdentifiers:sortedByDoublePropertyForName:ascending:usingBlock:", v12, v9, v5, v14);

}

- (void)enumerateNodesAsCollectionsSortedByUnsignedIntegerPropertyForName:(id)a3 ascending:(BOOL)a4 usingBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[MAElementCollection graphReference](self, "graphReference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "concreteGraph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAElementCollection elementIdentifiers](self, "elementIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __107__MANodeCollection_enumerateNodesAsCollectionsSortedByUnsignedIntegerPropertyForName_ascending_usingBlock___block_invoke;
  v14[3] = &unk_1E83E33D8;
  v14[4] = self;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v11, "enumerateNodeIdentifiers:sortedByUnsignedIntegerPropertyForName:ascending:usingBlock:", v12, v9, v5, v14);

}

- (id)firstNode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__781;
  v14 = __Block_byref_object_dispose__782;
  v15 = 0;
  -[MAElementCollection elementIdentifiers](self, "elementIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prefix:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAElementCollection graphReference](self, "graphReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "concreteGraph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __29__MANodeCollection_firstNode__block_invoke;
  v9[3] = &unk_1E83E4448;
  v9[4] = &v10;
  objc_msgSend(v6, "enumerateNodesWithIdentifiers:usingBlock:", v4, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)randomNode
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[MAElementCollection elementIdentifiers](self, "elementIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "randomElement");

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    -[MAElementCollection graphReference](self, "graphReference");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "concreteGraph");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nodeForIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)containsNode:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[MAElementCollection elementIdentifiers](self, "elementIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "identifier");

  LOBYTE(v4) = objc_msgSend(v5, "containsIdentifier:", v6);
  return (char)v4;
}

- (id)labels
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v8;

  -[MAElementCollection graphReference](self, "graphReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "concreteGraph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAElementCollection elementIdentifiers](self, "elementIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v4, "labelsAndDomainsOfNodesForIdentifiers:labels:domains:", v5, &v8, 0);
  v6 = v8;

  return v6;
}

- (id)nodesMatchingFilter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[MAElementCollection graphReference](self, "graphReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "concreteGraph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAElementCollection elementIdentifiers](self, "elementIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nodeIdentifiersMatchingFilter:intersectingIdentifiers:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGraphReference:elementIdentifiers:", v5, v8);
  return v9;
}

void __29__MANodeCollection_firstNode__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

void __107__MANodeCollection_enumerateNodesAsCollectionsSortedByUnsignedIntegerPropertyForName_ascending_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  KGElementIdentifierSet *v6;

  v6 = -[KGElementIdentifierSet initWithElementIdentifier:]([KGElementIdentifierSet alloc], "initWithElementIdentifier:", a2);
  v3 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(*(id *)(a1 + 32), "graphReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithGraphReference:elementIdentifiers:", v4, v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __98__MANodeCollection_enumerateNodesAsCollectionsSortedByDoublePropertyForName_ascending_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  KGElementIdentifierSet *v6;

  v6 = -[KGElementIdentifierSet initWithElementIdentifier:]([KGElementIdentifierSet alloc], "initWithElementIdentifier:", a2);
  v3 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(*(id *)(a1 + 32), "graphReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithGraphReference:elementIdentifiers:", v4, v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __99__MANodeCollection_enumerateNodesAsCollectionsSortedByIntegerPropertyForName_ascending_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  KGElementIdentifierSet *v6;

  v6 = -[KGElementIdentifierSet initWithElementIdentifier:]([KGElementIdentifierSet alloc], "initWithElementIdentifier:", a2);
  v3 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(*(id *)(a1 + 32), "graphReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithGraphReference:elementIdentifiers:", v4, v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __98__MANodeCollection_enumerateNodesAsCollectionsSortedByStringPropertyForName_ascending_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  KGElementIdentifierSet *v6;

  v6 = -[KGElementIdentifierSet initWithElementIdentifier:]([KGElementIdentifierSet alloc], "initWithElementIdentifier:", a2);
  v3 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(*(id *)(a1 + 32), "graphReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithGraphReference:elementIdentifiers:", v4, v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)nodesMatchingFilter:(id)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(a4, "graphReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "concreteGraph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nodeIdentifiersMatchingFilter:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGraphReference:elementIdentifiers:", v7, v9);
  return v10;
}

+ (id)nodesRelatedToNodes:(id)a3 withRelation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "graphReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "concreteGraph");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "elementIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "nodeIdentifiersRelatedToSourceNodeIdentifiers:relation:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGraphReference:elementIdentifiers:", v8, v11);
  return v12;
}

+ (id)nodesOfEdges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "graphReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "concreteGraph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elementIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "nodeIdentifiersOfEdgeIdentifiers:ofType:", v7, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGraphReference:elementIdentifiers:", v5, v8);
  return v9;
}

+ (id)sourceNodesOfEdges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "graphReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "concreteGraph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elementIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "nodeIdentifiersOfEdgeIdentifiers:ofType:", v7, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGraphReference:elementIdentifiers:", v5, v8);
  return v9;
}

+ (id)targetNodesOfEdges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "graphReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "concreteGraph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elementIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "nodeIdentifiersOfEdgeIdentifiers:ofType:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGraphReference:elementIdentifiers:", v5, v8);
  return v9;
}

+ (unint64_t)numberOfNodesRelatedToNodes:(id)a3 withRelation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "graphReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "concreteGraph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "elementIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "nodeIdentifiersRelatedToSourceNodeIdentifiers:relation:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "count");
  return v11;
}

@end
