@implementation MANode

- (MANode)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MANode;
  return -[MANode init](&v3, sel_init);
}

- (MANode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  id v9;
  id v10;
  id v11;

  v9 = a3;
  v10 = a6;
  KGMethodNotImplentedException(self, a2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v11);
}

- (void)setGraphReference:(id)a3
{
  MAGraphReference *v5;
  void *v6;
  MANodeImplementationProtocol *v7;
  MANodeImplementationProtocol *implementation;
  MAGraphReference *v9;

  v5 = (MAGraphReference *)a3;
  if (self->_graphReference != v5)
  {
    v9 = v5;
    -[MAGraphReference concreteGraph](v5, "concreteGraph");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (MANodeImplementationProtocol *)objc_msgSend(objc_alloc((Class)objc_msgSend(v6, "nodeClass")), "initWithNode:", self);
    implementation = self->_implementation;
    self->_implementation = v7;

    objc_storeStrong((id *)&self->_graphReference, a3);
    v5 = v9;
  }

}

- (MAGraphProxy)graph
{
  return -[MAGraphReference graph](self->_graphReference, "graph");
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MANode shortDescription](self, "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MANode visualString](self, "visualString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  unint64_t identifier;
  float v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)MANode;
  -[MANode description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  -[MANode weight](self, "weight");
  v7 = v6;
  -[MANode label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@] id:[%lu] weight:[%f] label:[%@]"), v4, identifier, *(_QWORD *)&v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ edgesCount:[%ld] inEdgesCount:[%ld] outEdgesCount:[%ld]"), v9, -[MANode edgesCount](self, "edgesCount"), -[MANode inEdgesCount](self, "inEdgesCount"), -[MANode outEdgesCount](self, "outEdgesCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (MANode)initWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5
{
  id v8;
  id v9;
  double v10;
  MANode *v11;
  MANode *v12;
  uint64_t v14;
  int v15;
  id v16;
  unsigned __int16 v17;

  v17 = 1;
  v16 = 0;
  v8 = a5;
  MALabelAndDomainFromKGLabels(a4, &v16, &v17);
  v9 = v16;
  v15 = 0;
  v14 = 0;
  +[MAKGWeightConversion maPropertiesAndWeightForKGProperties:maProperties:maWeight:](MAKGWeightConversion, "maPropertiesAndWeightForKGProperties:maProperties:maWeight:", v8, &v14, &v15);

  LODWORD(v10) = v15;
  v11 = -[MANode initWithLabel:domain:weight:properties:](self, "initWithLabel:domain:weight:properties:", v9, v17, v14, v10);
  v12 = v11;
  if (v11)
    -[MANode setIdentifier:](v11, "setIdentifier:", a3);

  return v12;
}

- (NSSet)labels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MANode graphReference](self, "graphReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "concreteGraph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MANode label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "labelsForLabel:domain:", v5, -[MANode domain](self, "domain"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v6;
}

- (NSDictionary)properties
{
  void *v3;
  float v4;
  void *v5;

  -[MANode propertyDictionary](self, "propertyDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MANode weight](self, "weight");
  +[MAKGWeightConversion kgPropertiesForMAProperties:weight:](v4, (uint64_t)MAKGWeightConversion, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (void)resolveIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (BOOL)isEqual:(id)a3
{
  MANode *v4;
  uint64_t v5;
  BOOL v6;
  MANode *v7;
  MANode *v8;
  unint64_t identifier;
  void *v10;
  void *v11;

  v4 = (MANode *)a3;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_13;
  }
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    v8 = v7;
    identifier = self->_identifier;
    if (identifier == 0x7FFFFFFFFFFFFFFFLL && v7->_identifier == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_9;
    if (self->_graphReference != v7->_graphReference)
    {
      -[MANode graph](self, "graph");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MANode graph](v8, "graph");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 != v11)
      {
LABEL_9:
        v6 = -[MANode isEqualToNode:](self, "isEqualToNode:", v8);
LABEL_12:

        goto LABEL_13;
      }
      identifier = self->_identifier;
    }
    v6 = identifier == v8->_identifier;
    goto LABEL_12;
  }
  v6 = 0;
LABEL_13:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[MAGraphReference hash](self->_graphReference, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_identifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)hasEqualPropertiesToNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MANode propertyDictionary](self, "propertyDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToDictionary:", v6);
  return (char)v4;
}

- (BOOL)isSameNodeAsNode:(id)a3
{
  MANode *v4;
  MANode *v5;
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v9;

  v4 = (MANode *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    -[MANode graphReference](v4, "graphReference");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MANode graphReference](self, "graphReference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v9 = -[MANode identifier](v5, "identifier");
      v8 = v9 == -[MANode identifier](self, "identifier");
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (BOOL)isEqualToNode:(id)a3
{
  MANode *v4;
  MANode *v5;
  int v6;
  float v7;
  float v8;
  float v9;
  BOOL v10;
  void *v11;
  void *v12;

  v4 = (MANode *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v10 = 1;
    goto LABEL_12;
  }
  v6 = -[MANode domain](self, "domain");
  if (v6 == -[MANode domain](v5, "domain")
    && (-[MANode weight](self, "weight"), v8 = v7, -[MANode weight](v5, "weight"), v8 == v9))
  {
    -[MANode label](self, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MANode label](v5, "label");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (v11 == v12 || objc_msgSend(v11, "isEqualToString:", v12))
       && -[MANode hasEqualPropertiesToNode:](self, "hasEqualPropertiesToNode:", v5);

  }
  else
  {
LABEL_5:
    v10 = 0;
  }
LABEL_12:

  return v10;
}

- (BOOL)matchesNode:(id)a3 includingProperties:(BOOL)a4
{
  void *v4;
  id v7;
  void *v8;
  int v9;
  char v10;
  BOOL v11;
  void *v12;

  v7 = a3;
  objc_msgSend(v7, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "domain");
  v10 = objc_msgSend(v8, "isEqualToString:", CFSTR("*"));
  if ((v10 & 1) == 0)
  {
    -[MANode label](self, "label");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "isEqualToString:", v8))
    {
      v11 = 0;
      goto LABEL_14;
    }
  }
  if (v9)
  {
    v11 = -[MANode domain](self, "domain") == v9;
    if (!v11 || !a4)
    {
LABEL_10:
      if ((v10 & 1) != 0)
        goto LABEL_15;
      goto LABEL_14;
    }
LABEL_9:
    objc_msgSend(v7, "propertyDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MANode hasProperties:](self, "hasProperties:", v12);

    goto LABEL_10;
  }
  if (a4)
    goto LABEL_9;
  v11 = 1;
  if ((v10 & 1) == 0)
LABEL_14:

LABEL_15:
  return v11;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v6 = objc_msgSend(v5, "count");
    if (v6 <= -[MANode propertiesCount](self, "propertiesCount"))
    {
      v10 = 0;
      v11 = &v10;
      v12 = 0x2020000000;
      v13 = 1;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __24__MANode_hasProperties___block_invoke;
      v9[3] = &unk_1E83E4D08;
      v9[4] = self;
      v9[5] = &v10;
      objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);
      v7 = *((_BYTE *)v11 + 24) != 0;
      _Block_object_dispose(&v10, 8);
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)propertyForKey:(id)a3
{
  id v4;
  MANode *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MANode propertyDictionary](v5, "propertyDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  objc_sync_exit(v5);
  return v8;
}

- (id)propertyForKey:(id)a3 kindOfClass:(Class)a4
{
  void *v4;
  id v5;

  -[MANode propertyForKey:](self, "propertyForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)enumeratePropertiesUsingBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MANode propertyDictionary](self, "propertyDictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v4);

}

- (BOOL)hasProperties
{
  id v2;

  KGAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (unint64_t)propertiesCount
{
  id v2;

  KGAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)propertyKeys
{
  id v2;

  KGAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)propertyDictionary
{
  id v2;

  KGAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)changingPropertiesWithProperties:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  -[MANode properties](self, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);
  v7 = (id)MEMORY[0x1E0C9AA70];
  if ((v6 & 1) == 0)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__2618;
    v17 = __Block_byref_object_dispose__2619;
    v18 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __43__MANode_changingPropertiesWithProperties___block_invoke;
    v10[3] = &unk_1E83E43D0;
    v11 = v5;
    v12 = &v13;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);
    v8 = (void *)v14[5];
    if (!v8)
      v8 = v7;
    v7 = v8;

    _Block_object_dispose(&v13, 8);
  }

  return v7;
}

- (BOOL)isOrphan
{
  return -[MANode edgesCount](self, "edgesCount") == 0;
}

- (BOOL)isUnique
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[MAGraphReference concreteGraph](self->_graphReference, "concreteGraph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MANode label](self, "label");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MANode domain](self, "domain");
    -[MANode propertyDictionary](self, "propertyDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nodesForLabel:domain:properties:", v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count") == 1;

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (unint64_t)edgesCount
{
  MANodeImplementationProtocol *implementation;
  void *v3;
  unint64_t v4;

  implementation = self->_implementation;
  +[MAElementFilter any](MAEdgeFilter, "any");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MANodeImplementationProtocol countOfEdgesOfType:matchingFilter:](implementation, "countOfEdgesOfType:matchingFilter:", 3, v3);

  return v4;
}

- (unint64_t)inEdgesCount
{
  MANodeImplementationProtocol *implementation;
  void *v3;
  unint64_t v4;

  implementation = self->_implementation;
  +[MAElementFilter any](MAEdgeFilter, "any");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MANodeImplementationProtocol countOfEdgesOfType:matchingFilter:](implementation, "countOfEdgesOfType:matchingFilter:", 1, v3);

  return v4;
}

- (unint64_t)outEdgesCount
{
  MANodeImplementationProtocol *implementation;
  void *v3;
  unint64_t v4;

  implementation = self->_implementation;
  +[MAElementFilter any](MAEdgeFilter, "any");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MANodeImplementationProtocol countOfEdgesOfType:matchingFilter:](implementation, "countOfEdgesOfType:matchingFilter:", 2, v3);

  return v4;
}

- (BOOL)hasEdgeTowardNode:(id)a3
{
  return -[MANodeImplementationProtocol hasEdgeOfType:withNode:](self->_implementation, "hasEdgeOfType:withNode:", 2, a3);
}

- (BOOL)hasEdgeFromNode:(id)a3
{
  return -[MANodeImplementationProtocol hasEdgeOfType:withNode:](self->_implementation, "hasEdgeOfType:withNode:", 1, a3);
}

- (BOOL)hasEdgeWithNode:(id)a3
{
  return -[MANodeImplementationProtocol hasEdgeOfType:withNode:](self->_implementation, "hasEdgeOfType:withNode:", 3, a3);
}

- (void)enumerateEdgesOfType:(unint64_t)a3 withNode:(id)a4 usingBlock:(id)a5
{
  -[MANodeImplementationProtocol enumerateEdgesOfType:withNode:usingBlock:](self->_implementation, "enumerateEdgesOfType:withNode:usingBlock:", a3, a4, a5);
}

- (id)edgesOfType:(unint64_t)a3 withNode:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v6 = (objc_class *)MEMORY[0x1E0C99E20];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __31__MANode_edgesOfType_withNode___block_invoke;
  v11[3] = &unk_1E83E6378;
  v9 = v8;
  v12 = v9;
  -[MANode enumerateEdgesOfType:withNode:usingBlock:](self, "enumerateEdgesOfType:withNode:usingBlock:", a3, v7, v11);

  return v9;
}

- (id)anyEdgeOfType:(unint64_t)a3 withNode:(id)a4
{
  id v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v6 = a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__2618;
  v14 = __Block_byref_object_dispose__2619;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __33__MANode_anyEdgeOfType_withNode___block_invoke;
  v9[3] = &unk_1E83E6328;
  v9[4] = &v10;
  -[MANode enumerateEdgesOfType:withNode:usingBlock:](self, "enumerateEdgesOfType:withNode:usingBlock:", a3, v6, v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)edgesTowardNode:(id)a3
{
  return -[MANode edgesOfType:withNode:](self, "edgesOfType:withNode:", 2, a3);
}

- (id)edgesFromNode:(id)a3
{
  return -[MANode edgesOfType:withNode:](self, "edgesOfType:withNode:", 1, a3);
}

- (id)edgesWithNode:(id)a3
{
  return -[MANode edgesOfType:withNode:](self, "edgesOfType:withNode:", 3, a3);
}

- (id)anyEdgeTowardNode:(id)a3
{
  return -[MANode anyEdgeOfType:withNode:](self, "anyEdgeOfType:withNode:", 2, a3);
}

- (id)anyEdgeFromNode:(id)a3
{
  return -[MANode anyEdgeOfType:withNode:](self, "anyEdgeOfType:withNode:", 1, a3);
}

- (id)anyEdgeWithNode:(id)a3
{
  return -[MANode anyEdgeOfType:withNode:](self, "anyEdgeOfType:withNode:", 3, a3);
}

- (void)enumerateEdgesOfType:(unint64_t)a3 withLabel:(id)a4 domain:(unsigned __int16)a5 usingBlock:(id)a6
{
  uint64_t v6;
  id v10;
  id v11;
  MAEdgeFilter *v12;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = -[MAElementFilter initWithLabel:domain:]([MAEdgeFilter alloc], "initWithLabel:domain:", v11, v6);

  -[MANodeImplementationProtocol enumerateEdgesOfType:matchingFilter:usingBlock:](self->_implementation, "enumerateEdgesOfType:matchingFilter:usingBlock:", a3, v12, v10);
}

- (id)edgesOfType:(unint64_t)a3 withLabel:(id)a4 domain:(unsigned __int16)a5
{
  uint64_t v5;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v5 = a5;
  v8 = (objc_class *)MEMORY[0x1E0C99E20];
  v9 = a4;
  v10 = objc_alloc_init(v8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __39__MANode_edgesOfType_withLabel_domain___block_invoke;
  v13[3] = &unk_1E83E6378;
  v11 = v10;
  v14 = v11;
  -[MANode enumerateEdgesOfType:withLabel:domain:usingBlock:](self, "enumerateEdgesOfType:withLabel:domain:usingBlock:", a3, v9, v5, v13);

  return v11;
}

- (id)anyEdgeOfType:(unint64_t)a3 withLabel:(id)a4 domain:(unsigned __int16)a5
{
  uint64_t v5;
  id v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a5;
  v8 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2618;
  v16 = __Block_byref_object_dispose__2619;
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__MANode_anyEdgeOfType_withLabel_domain___block_invoke;
  v11[3] = &unk_1E83E6328;
  v11[4] = &v12;
  -[MANode enumerateEdgesOfType:withLabel:domain:usingBlock:](self, "enumerateEdgesOfType:withLabel:domain:usingBlock:", a3, v8, v5, v11);
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (id)allEdges
{
  return -[MANode edgesOfType:withLabel:domain:](self, "edgesOfType:withLabel:domain:", 3, 0, 0);
}

- (id)edgesForLabel:(id)a3 domain:(unsigned __int16)a4
{
  return -[MANode edgesOfType:withLabel:domain:](self, "edgesOfType:withLabel:domain:", 3, a3, a4);
}

- (unint64_t)countOfEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  MAEdgeFilter *v7;
  unint64_t v8;

  v4 = a4;
  v6 = a3;
  v7 = -[MAElementFilter initWithLabel:domain:]([MAEdgeFilter alloc], "initWithLabel:domain:", v6, v4);

  v8 = -[MANodeImplementationProtocol countOfEdgesOfType:matchingFilter:](self->_implementation, "countOfEdgesOfType:matchingFilter:", 3, v7);
  return v8;
}

- (id)anyEdgeWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  return -[MANode anyEdgeOfType:withLabel:domain:](self, "anyEdgeOfType:withLabel:domain:", 3, a3, a4);
}

- (BOOL)hasEdgeWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  MAEdgeFilter *v7;

  v4 = a4;
  v6 = a3;
  v7 = -[MAElementFilter initWithLabel:domain:]([MAEdgeFilter alloc], "initWithLabel:domain:", v6, v4);

  LOBYTE(self) = -[MANodeImplementationProtocol hasEdgeOfType:matchingFilter:](self->_implementation, "hasEdgeOfType:matchingFilter:", 3, v7);
  return (char)self;
}

- (void)enumerateEdgesUsingBlock:(id)a3
{
  MANodeImplementationProtocol *implementation;
  id v4;
  id v5;

  implementation = self->_implementation;
  v4 = a3;
  +[MAElementFilter any](MAEdgeFilter, "any");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MANodeImplementationProtocol enumerateEdgesOfType:matchingFilter:usingBlock:](implementation, "enumerateEdgesOfType:matchingFilter:usingBlock:", 3, v5, v4);

}

- (void)enumerateEdgesOfType:(unint64_t)a3 usingBlock:(id)a4
{
  MANodeImplementationProtocol *implementation;
  id v6;
  id v7;

  implementation = self->_implementation;
  v6 = a4;
  +[MAElementFilter any](MAEdgeFilter, "any");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MANodeImplementationProtocol enumerateEdgesOfType:matchingFilter:usingBlock:](implementation, "enumerateEdgesOfType:matchingFilter:usingBlock:", a3, v7, v6);

}

- (void)enumerateInEdgesUsingBlock:(id)a3
{
  MANodeImplementationProtocol *implementation;
  id v4;
  id v5;

  implementation = self->_implementation;
  v4 = a3;
  +[MAElementFilter any](MAEdgeFilter, "any");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MANodeImplementationProtocol enumerateEdgesOfType:matchingFilter:usingBlock:](implementation, "enumerateEdgesOfType:matchingFilter:usingBlock:", 1, v5, v4);

}

- (void)enumerateOutEdgesUsingBlock:(id)a3
{
  MANodeImplementationProtocol *implementation;
  id v4;
  id v5;

  implementation = self->_implementation;
  v4 = a3;
  +[MAElementFilter any](MAEdgeFilter, "any");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MANodeImplementationProtocol enumerateEdgesOfType:matchingFilter:usingBlock:](implementation, "enumerateEdgesOfType:matchingFilter:usingBlock:", 2, v5, v4);

}

- (void)enumerateEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  MAEdgeFilter *v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = -[MAElementFilter initWithLabel:domain:]([MAEdgeFilter alloc], "initWithLabel:domain:", v9, v5);

  -[MANodeImplementationProtocol enumerateEdgesOfType:matchingFilter:usingBlock:](self->_implementation, "enumerateEdgesOfType:matchingFilter:usingBlock:", 3, v10, v8);
}

- (void)enumerateEdgesWithDomains:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v13++), "unsignedIntegerValue"));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __47__MANode_enumerateEdgesWithDomains_usingBlock___block_invoke;
  v16[3] = &unk_1E83E43F8;
  v17 = v8;
  v18 = v7;
  v14 = v7;
  v15 = v8;
  -[MANode enumerateEdgesOfType:withLabel:domain:usingBlock:](self, "enumerateEdgesOfType:withLabel:domain:usingBlock:", 3, 0, 0, v16);

}

- (void)enumerateNeighborNodesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  MANodeFilter *v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = -[MAElementFilter initWithLabel:domain:]([MANodeFilter alloc], "initWithLabel:domain:", v9, v5);

  -[MANodeImplementationProtocol enumerateNeighborNodesMatchingFilter:usingBlock:](self->_implementation, "enumerateNeighborNodesMatchingFilter:usingBlock:", v10, v8);
}

- (void)enumerateNeighborEdgesAndNodesUsingBlock:(id)a3
{
  MANodeImplementationProtocol *implementation;
  id v4;
  id v5;

  implementation = self->_implementation;
  v4 = a3;
  +[MAElementFilter any](MANodeFilter, "any");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MANodeImplementationProtocol enumerateNeighborEdgesAndNodesMatchingFilter:usingBlock:](implementation, "enumerateNeighborEdgesAndNodesMatchingFilter:usingBlock:", v5, v4);

}

- (void)enumerateNeighborNodesUsingBlock:(id)a3
{
  MANodeImplementationProtocol *implementation;
  id v4;
  id v5;

  implementation = self->_implementation;
  v4 = a3;
  +[MAElementFilter any](MANodeFilter, "any");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MANodeImplementationProtocol enumerateNeighborNodesMatchingFilter:usingBlock:](implementation, "enumerateNeighborNodesMatchingFilter:usingBlock:", v5, v4);

}

- (void)enumerateNeighborEdgesAndNodesThroughEdgesOfType:(unint64_t)a3 withLabel:(id)a4 inDomain:(unsigned __int16)a5 usingBlock:(id)a6
{
  uint64_t v6;
  id v10;
  id v11;
  MAEdgeFilter *v12;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = -[MAElementFilter initWithLabel:domain:]([MAEdgeFilter alloc], "initWithLabel:domain:", v11, v6);

  -[MANodeImplementationProtocol enumerateNeighborEdgesAndNodesThroughEdgesOfType:matchingFilter:usingBlock:](self->_implementation, "enumerateNeighborEdgesAndNodesThroughEdgesOfType:matchingFilter:usingBlock:", a3, v12, v10);
}

- (void)enumerateNeighborNodesThroughEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4 usingBlock:(id)a5
{
  -[MANodeImplementationProtocol enumerateNeighborNodesThroughEdgesOfType:matchingFilter:usingBlock:](self->_implementation, "enumerateNeighborNodesThroughEdgesOfType:matchingFilter:usingBlock:", a3, a4, a5);
}

- (void)enumerateNeighborNodesThroughEdgesOfType:(unint64_t)a3 withLabel:(id)a4 inDomain:(unsigned __int16)a5 usingBlock:(id)a6
{
  uint64_t v6;
  id v10;
  id v11;
  MAEdgeFilter *v12;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = -[MAElementFilter initWithLabel:domain:]([MAEdgeFilter alloc], "initWithLabel:domain:", v11, v6);

  -[MANodeImplementationProtocol enumerateNeighborNodesThroughEdgesOfType:matchingFilter:usingBlock:](self->_implementation, "enumerateNeighborNodesThroughEdgesOfType:matchingFilter:usingBlock:", a3, v12, v10);
}

- (void)enumerateNeighborNodesThroughEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  MAEdgeFilter *v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = -[MAElementFilter initWithLabel:domain:]([MAEdgeFilter alloc], "initWithLabel:domain:", v9, v5);

  -[MANodeImplementationProtocol enumerateNeighborNodesThroughEdgesOfType:matchingFilter:usingBlock:](self->_implementation, "enumerateNeighborNodesThroughEdgesOfType:matchingFilter:usingBlock:", 3, v10, v8);
}

- (void)enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  MAEdgeFilter *v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = -[MAElementFilter initWithLabel:domain:]([MAEdgeFilter alloc], "initWithLabel:domain:", v9, v5);

  -[MANodeImplementationProtocol enumerateNeighborEdgesAndNodesThroughEdgesOfType:matchingFilter:usingBlock:](self->_implementation, "enumerateNeighborEdgesAndNodesThroughEdgesOfType:matchingFilter:usingBlock:", 3, v10, v8);
}

- (void)enumerateEdgesInDomains:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v13++), "unsignedIntegerValue"));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __45__MANode_enumerateEdgesInDomains_usingBlock___block_invoke;
  v16[3] = &unk_1E83E43F8;
  v17 = v8;
  v18 = v7;
  v14 = v7;
  v15 = v8;
  -[MANode enumerateEdgesOfType:withLabel:domain:usingBlock:](self, "enumerateEdgesOfType:withLabel:domain:usingBlock:", 3, 0, 0, v16);

}

- (void)enumerateNeighborEdgesAndNodesThroughOutEdgesUsingBlock:(id)a3
{
  MANodeImplementationProtocol *implementation;
  id v4;
  id v5;

  implementation = self->_implementation;
  v4 = a3;
  +[MAElementFilter any](MAEdgeFilter, "any");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MANodeImplementationProtocol enumerateNeighborEdgesAndNodesThroughEdgesOfType:matchingFilter:usingBlock:](implementation, "enumerateNeighborEdgesAndNodesThroughEdgesOfType:matchingFilter:usingBlock:", 2, v5, v4);

}

- (void)enumerateNeighborNodesThroughOutEdgesUsingBlock:(id)a3
{
  MANodeImplementationProtocol *implementation;
  id v4;
  id v5;

  implementation = self->_implementation;
  v4 = a3;
  +[MAElementFilter any](MAEdgeFilter, "any");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MANodeImplementationProtocol enumerateNeighborNodesThroughEdgesOfType:matchingFilter:usingBlock:](implementation, "enumerateNeighborNodesThroughEdgesOfType:matchingFilter:usingBlock:", 2, v5, v4);

}

- (void)enumerateNeighborEdgesAndNodesThroughInEdgesUsingBlock:(id)a3
{
  MANodeImplementationProtocol *implementation;
  id v4;
  id v5;

  implementation = self->_implementation;
  v4 = a3;
  +[MAElementFilter any](MAEdgeFilter, "any");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MANodeImplementationProtocol enumerateNeighborEdgesAndNodesThroughEdgesOfType:matchingFilter:usingBlock:](implementation, "enumerateNeighborEdgesAndNodesThroughEdgesOfType:matchingFilter:usingBlock:", 1, v5, v4);

}

- (void)enumerateNeighborNodesThroughInEdgesUsingBlock:(id)a3
{
  MANodeImplementationProtocol *implementation;
  id v4;
  id v5;

  implementation = self->_implementation;
  v4 = a3;
  +[MAElementFilter any](MAEdgeFilter, "any");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MANodeImplementationProtocol enumerateNeighborNodesThroughEdgesOfType:matchingFilter:usingBlock:](implementation, "enumerateNeighborNodesThroughEdgesOfType:matchingFilter:usingBlock:", 1, v5, v4);

}

- (BOOL)hasEdge:(id)a3 isIn:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  MAEdgeFilter *v9;
  void *v10;
  MAEdgeFilter *v11;
  void *v12;
  MANodeImplementationProtocol *implementation;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  MANode *v22;
  uint64_t *v23;
  BOOL *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  objc_msgSend(v6, "sourceNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [MAEdgeFilter alloc];
  objc_msgSend(v6, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MAElementFilter initWithLabel:domain:](v9, "initWithLabel:domain:", v10, objc_msgSend(v6, "domain"));

  objc_msgSend(v6, "propertyDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  implementation = self->_implementation;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __23__MANode_hasEdge_isIn___block_invoke;
  v18[3] = &unk_1E83E4420;
  v14 = v7;
  v19 = v14;
  v15 = v8;
  v20 = v15;
  v16 = v12;
  v23 = &v25;
  v24 = a4;
  v21 = v16;
  v22 = self;
  -[MANodeImplementationProtocol enumerateEdgesOfType:matchingFilter:usingBlock:](implementation, "enumerateEdgesOfType:matchingFilter:usingBlock:", 3, v11, v18);
  LOBYTE(a4) = *((_BYTE *)v26 + 24);

  _Block_object_dispose(&v25, 8);
  return (char)a4;
}

- (id)neighborNodesWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  uint64_t v4;
  objc_class *v6;
  id v7;
  id v8;
  MANodeFilter *v9;
  MANodeImplementationProtocol *implementation;
  id v11;
  _QWORD v13[4];
  id v14;

  v4 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99E20];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  v9 = -[MAElementFilter initWithLabel:domain:]([MANodeFilter alloc], "initWithLabel:domain:", v7, v4);

  implementation = self->_implementation;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __40__MANode_neighborNodesWithLabel_domain___block_invoke;
  v13[3] = &unk_1E83E5178;
  v11 = v8;
  v14 = v11;
  -[MANodeImplementationProtocol enumerateNeighborNodesMatchingFilter:usingBlock:](implementation, "enumerateNeighborNodesMatchingFilter:usingBlock:", v9, v13);

  return v11;
}

- (id)neighborNodesThroughEdgesOfType:(unint64_t)a3 withLabel:(id)a4 domain:(unsigned __int16)a5
{
  uint64_t v5;
  objc_class *v8;
  id v9;
  id v10;
  MAEdgeFilter *v11;
  MANodeImplementationProtocol *implementation;
  id v13;
  _QWORD v15[4];
  id v16;

  v5 = a5;
  v8 = (objc_class *)MEMORY[0x1E0C99E20];
  v9 = a4;
  v10 = objc_alloc_init(v8);
  v11 = -[MAElementFilter initWithLabel:domain:]([MAEdgeFilter alloc], "initWithLabel:domain:", v9, v5);

  implementation = self->_implementation;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__MANode_neighborNodesThroughEdgesOfType_withLabel_domain___block_invoke;
  v15[3] = &unk_1E83E5178;
  v13 = v10;
  v16 = v13;
  -[MANodeImplementationProtocol enumerateNeighborNodesThroughEdgesOfType:matchingFilter:usingBlock:](implementation, "enumerateNeighborNodesThroughEdgesOfType:matchingFilter:usingBlock:", a3, v11, v15);

  return v13;
}

- (id)anyNeighborNodeThroughEdgesOfType:(unint64_t)a3 withLabel:(id)a4 domain:(unsigned __int16)a5
{
  uint64_t v5;
  id v8;
  MAEdgeFilter *v9;
  MANodeImplementationProtocol *implementation;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a5;
  v8 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2618;
  v18 = __Block_byref_object_dispose__2619;
  v19 = 0;
  v9 = -[MAElementFilter initWithLabel:domain:]([MAEdgeFilter alloc], "initWithLabel:domain:", v8, v5);
  implementation = self->_implementation;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__MANode_anyNeighborNodeThroughEdgesOfType_withLabel_domain___block_invoke;
  v13[3] = &unk_1E83E4448;
  v13[4] = &v14;
  -[MANodeImplementationProtocol enumerateNeighborNodesThroughEdgesOfType:matchingFilter:usingBlock:](implementation, "enumerateNeighborNodesThroughEdgesOfType:matchingFilter:usingBlock:", a3, v9, v13);
  v11 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v11;
}

- (id)neighborNodes
{
  return -[MANode neighborNodesWithLabel:domain:](self, "neighborNodesWithLabel:domain:", 0, 0);
}

- (id)neighborNodesThroughOutEdges
{
  return -[MANode neighborNodesThroughEdgesOfType:withLabel:domain:](self, "neighborNodesThroughEdgesOfType:withLabel:domain:", 2, 0, 0);
}

- (id)neighborNodesThroughInEdges
{
  return -[MANode neighborNodesThroughEdgesOfType:withLabel:domain:](self, "neighborNodesThroughEdgesOfType:withLabel:domain:", 1, 0, 0);
}

- (id)neighborNodesThroughEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  return -[MANode neighborNodesThroughEdgesOfType:withLabel:domain:](self, "neighborNodesThroughEdgesOfType:withLabel:domain:", 3, a3, a4);
}

- (id)anyNeighborNodeThroughEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  return -[MANode anyNeighborNodeThroughEdgesOfType:withLabel:domain:](self, "anyNeighborNodeThroughEdgesOfType:withLabel:domain:", 3, a3, a4);
}

- (id)siblingNodesThroughEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  uint64_t v4;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v4 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99E20];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__MANode_siblingNodesThroughEdgesWithLabel_domain___block_invoke;
  v11[3] = &unk_1E83E4470;
  v9 = v8;
  v12 = v9;
  -[MANode enumerateSiblingNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateSiblingNodesThroughEdgesWithLabel:domain:usingBlock:", v7, v4, v11);

  return v9;
}

- (void)enumerateNeighborNodesThroughEdgesWithDomains:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__MANode_enumerateNeighborNodesThroughEdgesWithDomains_usingBlock___block_invoke;
  v8[3] = &unk_1E83E43F8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[MANode enumerateEdgesInDomains:usingBlock:](self, "enumerateEdgesInDomains:usingBlock:", a3, v8);

}

- (void)enumerateNeighborEdgesAndNodesThroughEdgesWithDomains:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__MANode_enumerateNeighborEdgesAndNodesThroughEdgesWithDomains_usingBlock___block_invoke;
  v8[3] = &unk_1E83E43F8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[MANode enumerateEdgesInDomains:usingBlock:](self, "enumerateEdgesInDomains:usingBlock:", a3, v8);

}

- (void)enumerateSiblingNodesThroughEdgesWithDomains:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__MANode_enumerateSiblingNodesThroughEdgesWithDomains_usingBlock___block_invoke;
  v10[3] = &unk_1E83E44C0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithDomains:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithDomains:usingBlock:", v9, v10);

}

- (void)enumerateSiblingNodesThroughEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  MANodeImplementationProtocol *implementation;
  id v11;
  id v12;
  MAEdgeFilter *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  __int16 v17;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v13 = -[MAElementFilter initWithLabel:domain:]([MAEdgeFilter alloc], "initWithLabel:domain:", v8, v6);
  implementation = self->_implementation;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__MANode_enumerateSiblingNodesThroughEdgesWithLabel_domain_usingBlock___block_invoke;
  v14[3] = &unk_1E83E44E8;
  v14[4] = self;
  v15 = v8;
  v17 = v6;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  -[MANodeImplementationProtocol enumerateNeighborEdgesAndNodesThroughEdgesOfType:matchingFilter:usingBlock:](implementation, "enumerateNeighborEdgesAndNodesThroughEdgesOfType:matchingFilter:usingBlock:", 3, v13, v14);

}

- (id)shortestPathToNode:(id)a3 directed:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[MANode graph](self, "graph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shortestPathFromNode:toNode:directed:", self, v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)visualString
{
  return -[MANode visualStringWithName:](self, "visualStringWithName:", 0);
}

- (id)visualStringWithName:(id)a3
{
  return -[MANode visualStringWithName:andPropertyKeys:](self, "visualStringWithName:andPropertyKeys:", a3, 0);
}

- (id)visualStringWithName:(id)a3 andPropertyKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1CAA4B20C]();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", CFSTR("("));
  if (v6)
    objc_msgSend(v9, "appendString:", v6);
  -[MANode label](self, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MANode label](self, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR(":%@"), v11);

  }
  else
  {
    objc_msgSend(v9, "appendFormat:", CFSTR(":"));
  }
  if (-[MANode domain](self, "domain") && -[MANode domain](self, "domain") != 1)
    objc_msgSend(v9, "appendFormat:", CFSTR(":%lu"), -[MANode domain](self, "domain"));
  -[MANode propertyDictionary](self, "propertyDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PropertiesVisualStringForKeys(v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v13, "length") >= 3)
    objc_msgSend(v9, "appendFormat:", CFSTR(" %@"), v13);
  objc_msgSend(v9, "appendString:", CFSTR(")"));

  objc_autoreleasePoolPop(v8);
  return v9;
}

- (id)associatedNodesForRemoval
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (MAGraphReference)graphReference
{
  return self->_graphReference;
}

- (MANodeImplementationProtocol)implementation
{
  return self->_implementation;
}

- (void)setImplementation:(id)a3
{
  objc_storeStrong((id *)&self->_implementation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_implementation, 0);
  objc_storeStrong((id *)&self->_graphReference, 0);
}

void __71__MANode_enumerateSiblingNodesThroughEdgesWithLabel_domain_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v10 = a2;
  v7 = a3;
  if ((objc_msgSend(v7, "isSameNodeAsNode:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    v8 = *(unsigned __int16 *)(a1 + 56);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71__MANode_enumerateSiblingNodesThroughEdgesWithLabel_domain_usingBlock___block_invoke_2;
    v11[3] = &unk_1E83E4498;
    v9 = *(_QWORD *)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v14 = *(id *)(a1 + 48);
    v12 = v7;
    v13 = v10;
    v15 = a4;
    objc_msgSend(v12, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", v9, v8, v11);

  }
}

void __71__MANode_enumerateSiblingNodesThroughEdgesWithLabel_domain_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a3;
  if ((objc_msgSend(v7, "isSameNodeAsNode:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    **(_BYTE **)(a1 + 64) = *a4;
  }

}

void __66__MANode_enumerateSiblingNodesThroughEdgesWithDomains_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v9 = a2;
  v7 = a3;
  if ((objc_msgSend(v7, "isSameNodeAsNode:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__MANode_enumerateSiblingNodesThroughEdgesWithDomains_usingBlock___block_invoke_2;
    v10[3] = &unk_1E83E4498;
    v8 = *(_QWORD *)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v13 = *(id *)(a1 + 48);
    v11 = v7;
    v12 = v9;
    v14 = a4;
    objc_msgSend(v11, "enumerateNeighborEdgesAndNodesThroughEdgesWithDomains:usingBlock:", v8, v10);

  }
}

void __66__MANode_enumerateSiblingNodesThroughEdgesWithDomains_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a3;
  if ((objc_msgSend(v7, "isSameNodeAsNode:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    **(_BYTE **)(a1 + 64) = *a4;
  }

}

void __75__MANode_enumerateNeighborEdgesAndNodesThroughEdgesWithDomains_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "oppositeNode:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __67__MANode_enumerateNeighborNodesThroughEdgesWithDomains_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "oppositeNode:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __51__MANode_siblingNodesThroughEdgesWithLabel_domain___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __61__MANode_anyNeighborNodeThroughEdgesOfType_withLabel_domain___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

uint64_t __59__MANode_neighborNodesThroughEdgesOfType_withLabel_domain___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __40__MANode_neighborNodesWithLabel_domain___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __23__MANode_hasEdge_isIn___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "sourceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isSameNodeAsNode:", *(_QWORD *)(a1 + 32)))
  {
LABEL_8:

    v8 = v11;
    goto LABEL_9;
  }
  objc_msgSend(v11, "targetNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSameNodeAsNode:", *(_QWORD *)(a1 + 40));

  v8 = v11;
  if (v7)
  {
    objc_msgSend(v11, "propertyDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 48);
    if (v9 == v5 || objc_msgSend(v9, "isEqualToDictionary:", v5))
    {
      v10 = *(_QWORD *)(a1 + 72);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      if (v10)
        **(_BYTE **)(a1 + 72) = objc_msgSend(*(id *)(a1 + 56), "isEqualToNode:", *(_QWORD *)(a1 + 40));
      *a3 = 1;
    }
    goto LABEL_8;
  }
LABEL_9:

}

void __45__MANode_enumerateEdgesInDomains_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(v3, "domain")))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __47__MANode_enumerateEdgesWithDomains_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(v3, "domain")))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __41__MANode_anyEdgeOfType_withLabel_domain___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

uint64_t __39__MANode_edgesOfType_withLabel_domain___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __33__MANode_anyEdgeOfType_withNode___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

uint64_t __31__MANode_edgesOfType_withNode___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __43__MANode_changingPropertiesWithProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "isEqual:", v5) & 1) == 0)
  {
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v8)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, v12);
  }

}

void __24__MANode_hasProperties___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;

  v7 = *(void **)(a1 + 32);
  v8 = a3;
  objc_msgSend(v7, "propertyForKey:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v9, "isEqual:", v8);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v7;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;
}

- (BOOL)conformsToNodeSchema:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__MANode_Schema__conformsToNodeSchema___block_invoke;
  v7[3] = &unk_1E83E4CE0;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[MANode enumerateEdgesUsingBlock:](self, "enumerateEdgesUsingBlock:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __39__MANode_Schema__conformsToNodeSchema___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v5 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__MANode_Schema__conformsToNodeSchema___block_invoke_2;
  v8[3] = &unk_1E83E4CE0;
  v7 = v5;
  v9 = v7;
  v10 = &v11;
  objc_msgSend(v6, "enumerateEdgesUsingBlock:", v8);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *((_BYTE *)v12 + 24);
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;

  _Block_object_dispose(&v11, 8);
}

void __39__MANode_Schema__conformsToNodeSchema___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;

  v5 = a2;
  if (elementMatchesDefinition(v5, *(void **)(a1 + 32)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "conformsToEdgeSchema:", v5);
    *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }

}

@end
