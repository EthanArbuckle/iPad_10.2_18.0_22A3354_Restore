@implementation MAEdgeCollection

+ (id)edgesOfType:(unint64_t)a3 onNodes:(id)a4 matchingFilter:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "graphReference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "concreteGraph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "elementIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "edgeIdentifiersOfType:onNodesForIdentifiers:matchingFilter:", a3, v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGraphReference:elementIdentifiers:", v10, v13);
  return v14;
}

+ (id)edgesFromNodes:(id)a3 matchingFilter:(id)a4
{
  return (id)objc_msgSend(a1, "edgesOfType:onNodes:matchingFilter:", 2, a3, a4);
}

+ (id)edgesToNodes:(id)a3 matchingFilter:(id)a4
{
  return (id)objc_msgSend(a1, "edgesOfType:onNodes:matchingFilter:", 1, a3, a4);
}

+ (id)edgesOfType:(unint64_t)a3 betweenNodes:(id)a4 andNodes:(id)a5 matchingFilter:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(v12, "graphReference");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "concreteGraph");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "elementIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "elementIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "edgeIdentifiersOfType:betweenNodesForIdentifiers:andNodesForIdentifiers:matchingFilter:", a3, v15, v16, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGraphReference:elementIdentifiers:", v13, v17);
  return v18;
}

+ (id)edgesFromNodes:(id)a3 toNodes:(id)a4 matchingFilter:(id)a5
{
  return (id)objc_msgSend(a1, "edgesOfType:betweenNodes:andNodes:matchingFilter:", 2, a3, a4, a5);
}

+ (id)edgesMatchingFilter:(id)a3 inGraph:(id)a4
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
  objc_msgSend(v8, "edgeIdentifiersMatchingFilter:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGraphReference:elementIdentifiers:", v7, v9);
  return v10;
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
  objc_msgSend(v5, "enumerateEdgesWithIdentifiers:usingBlock:", v6, v4);

}

- (MAEdgeCollection)initWithEdge:(id)a3
{
  id v4;
  void *v5;
  KGElementIdentifierSet *v6;
  uint64_t v7;
  KGElementIdentifierSet *v8;
  MAEdgeCollection *v9;

  v4 = a3;
  objc_msgSend(v4, "graphReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [KGElementIdentifierSet alloc];
  v7 = objc_msgSend(v4, "identifier");

  v8 = -[KGElementIdentifierSet initWithElementIdentifier:](v6, "initWithElementIdentifier:", v7);
  v9 = -[MAElementCollection initWithGraphReference:elementIdentifiers:](self, "initWithGraphReference:elementIdentifiers:", v5, v8);

  return v9;
}

- (void)enumerateEdgesUsingBlock:(id)a3
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
  objc_msgSend(v5, "enumerateEdgesWithIdentifiers:usingBlock:", v6, v4);

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
  objc_msgSend(v8, "enumerateIntegerPropertyValuesForKey:ofEdgesWithIdentifiers:usingBlock:", v7, v9, v6);

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
  objc_msgSend(v8, "enumerateStringPropertyValuesForKey:ofEdgesWithIdentifiers:usingBlock:", v7, v9, v6);

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
  objc_msgSend(v8, "enumerateDoublePropertyValuesForKey:ofEdgesWithIdentifiers:usingBlock:", v7, v9, v6);

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
  objc_msgSend(v8, "enumerateUnsignedIntegerPropertyValuesForKey:ofEdgesWithIdentifiers:usingBlock:", v7, v9, v6);

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
  objc_msgSend(v8, "enumerateUnsignedLongLongPropertyValuesForKey:ofEdgesWithIdentifiers:usingBlock:", v7, v9, v6);

}

- (id)firstEdge
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
  v13 = __Block_byref_object_copy__833;
  v14 = __Block_byref_object_dispose__834;
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
  v9[2] = __29__MAEdgeCollection_firstEdge__block_invoke;
  v9[3] = &unk_1E83E6328;
  v9[4] = &v10;
  objc_msgSend(v6, "enumerateEdgesWithIdentifiers:usingBlock:", v4, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)randomEdge
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
    objc_msgSend(v7, "edgeForIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)containsEdge:(id)a3
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
  objc_msgSend(v4, "labelsAndDomainsOfEdgesForIdentifiers:labels:domains:", v5, &v8, 0);
  v6 = v8;

  return v6;
}

- (id)edgesMatchingFilter:(id)a3
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
  objc_msgSend(v6, "edgeIdentifiersMatchingFilter:intersectingIdentifiers:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGraphReference:elementIdentifiers:", v5, v8);
  return v9;
}

void __29__MAEdgeCollection_firstEdge__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

@end
