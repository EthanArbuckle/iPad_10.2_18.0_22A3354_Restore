@implementation MAEdge

- (MAEdge)initWithSourceNode:(id)a3 targetNode:(id)a4
{
  id v7;
  id v8;
  MAEdge *v9;
  MAEdge *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MAEdge;
  v9 = -[MAEdge init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceNode, a3);
    objc_storeStrong((id *)&v10->_targetNode, a4);
  }

  return v10;
}

- (MAEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a8;
  KGMethodNotImplentedException(self, a2);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v17);
}

- (MAGraphProxy)graph
{
  return -[MAGraphReference graph](self->_graphReference, "graph");
}

- (void)setGraphReference:(id)a3
{
  MAGraphReference *v5;
  void *v6;
  void *v7;
  MAGraphReference *v8;

  v5 = (MAGraphReference *)a3;
  if (self->_graphReference != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_graphReference, a3);
    v5 = v8;
    if (v8)
    {
      -[MAEdge sourceNode](self, "sourceNode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setGraphReference:", v8);

      -[MAEdge targetNode](self, "targetNode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setGraphReference:", v8);

      v5 = v8;
    }
  }

}

- (NSString)description
{
  void *v3;
  void *v4;
  unint64_t identifier;
  float v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v16.receiver = self;
  v16.super_class = (Class)MAEdge;
  -[MAEdge description](&v16, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  -[MAEdge weight](self, "weight");
  v7 = v6;
  -[MAEdge label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@] id:[%lu] weight:[%f] label:[%@]"), v4, identifier, *(_QWORD *)&v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  -[MAEdge visualString](self, "visualString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAEdge sourceNode](self, "sourceNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAEdge targetNode](self, "targetNode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ %@\n\t\tsourceNode:%@\n\t\ttargetNode:%@"), v9, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v17.receiver = self;
  v17.super_class = (Class)MAEdge;
  -[MAEdge description](&v17, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  -[MAEdge weight](self, "weight");
  v7 = v6;
  -[MAEdge label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@] id:[%lu] weight:[%f] label:[%@]"), v4, identifier, *(_QWORD *)&v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  -[MAEdge sourceNode](self, "sourceNode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "shortDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAEdge targetNode](self, "targetNode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "shortDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@\n\t\tsourceNode:%@\n\t\ttargetNode:%@"), v9, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (MAEdge)initWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5 sourceNode:(id)a6 targetNode:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  MAEdge *v17;
  uint64_t v19;
  int v20;
  id v21;
  unsigned __int16 v22;

  v22 = 1;
  v21 = 0;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  MALabelAndDomainFromKGLabels(a4, &v21, &v22);
  v15 = v21;
  v20 = 0;
  v19 = 0;
  +[MAKGWeightConversion maPropertiesAndWeightForKGProperties:maProperties:maWeight:](MAKGWeightConversion, "maPropertiesAndWeightForKGProperties:maProperties:maWeight:", v14, &v19, &v20);

  LODWORD(v16) = v20;
  v17 = -[MAEdge initWithLabel:sourceNode:targetNode:domain:weight:properties:](self, "initWithLabel:sourceNode:targetNode:domain:weight:properties:", v15, v13, v12, v22, v19, v16);

  if (v17)
    -[MAEdge setIdentifier:](v17, "setIdentifier:", a3);

  return v17;
}

- (NSSet)labels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MAEdge graphReference](self, "graphReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "concreteGraph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAEdge label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "labelsForLabel:domain:", v5, -[MAEdge domain](self, "domain"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v6;
}

- (NSDictionary)properties
{
  void *v3;
  float v4;
  void *v5;

  -[MAEdge propertyDictionary](self, "propertyDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAEdge weight](self, "weight");
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
  MAEdge *v4;
  uint64_t v5;
  BOOL v6;
  MAEdge *v7;
  MAEdge *v8;
  unint64_t identifier;
  void *v10;
  void *v11;

  v4 = (MAEdge *)a3;
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
      -[MAEdge graph](self, "graph");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAEdge graph](v8, "graph");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 != v11)
      {
LABEL_9:
        v6 = -[MAEdge isEqualToEdge:](self, "isEqualToEdge:", v8);
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

- (BOOL)isSameEdgeAsEdge:(id)a3
{
  MAEdge *v4;
  MAEdge *v5;
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v9;

  v4 = (MAEdge *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    -[MAEdge graphReference](v4, "graphReference");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAEdge graphReference](self, "graphReference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v9 = -[MAEdge identifier](v5, "identifier");
      v8 = v9 == -[MAEdge identifier](self, "identifier");
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (BOOL)hasEqualPropertiesToEdge:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MAEdge propertyDictionary](self, "propertyDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToDictionary:", v6);
  return (char)v4;
}

- (BOOL)isEqualToEdge:(id)a3
{
  id v4;
  int v5;
  float v6;
  float v7;
  float v8;
  BOOL v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  if (v4
    && (v5 = -[MAEdge domain](self, "domain"), v5 == objc_msgSend(v4, "domain"))
    && (-[MAEdge weight](self, "weight"), v7 = v6, objc_msgSend(v4, "weight"), v7 == v8))
  {
    -[MAEdge label](self, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "label");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v11 == v12 || objc_msgSend(v11, "isEqualToString:", v12))
      && -[MAEdge hasEqualPropertiesToEdge:](self, "hasEqualPropertiesToEdge:", v4))
    {
      -[MAEdge sourceNode](self, "sourceNode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAEdge targetNode](self, "targetNode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sourceNode");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "targetNode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (v13 == v15 || objc_msgSend(v13, "isEqualToNode:", v15))
        && (v14 == v16 || (objc_msgSend(v14, "isEqualToNode:", v16) & 1) != 0);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isUnique
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  -[MAGraphReference concreteGraph](self->_graphReference, "concreteGraph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MAEdge sourceNode](self, "sourceNode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAEdge label](self, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __18__MAEdge_isUnique__block_invoke;
    v8[3] = &unk_1E83E4CE0;
    v8[4] = self;
    v8[5] = &v9;
    objc_msgSend(v4, "enumerateEdgesWithLabel:domain:usingBlock:", v5, 0, v8);

  }
  v6 = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v6;
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
    if (v6 <= -[MAEdge propertiesCount](self, "propertiesCount"))
    {
      v10 = 0;
      v11 = &v10;
      v12 = 0x2020000000;
      v13 = 1;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __24__MAEdge_hasProperties___block_invoke;
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
  MAEdge *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MAEdge propertyDictionary](v5, "propertyDictionary");
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

  -[MAEdge propertyForKey:](self, "propertyForKey:", a3);
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
  -[MAEdge propertyDictionary](self, "propertyDictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v4);

}

- (BOOL)hasProperties
{
  id v2;

  KGMethodNotImplentedException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (unint64_t)propertiesCount
{
  id v2;

  KGMethodNotImplentedException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)propertyKeys
{
  id v2;

  KGMethodNotImplentedException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)propertyDictionary
{
  id v2;

  KGMethodNotImplentedException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)oppositeNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  id v10;

  v4 = a3;
  -[MAEdge sourceNode](self, "sourceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAEdge targetNode](self, "targetNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isSameNodeAsNode:", v5);
  v8 = v6;
  if ((v7 & 1) != 0 || (v9 = objc_msgSend(v4, "isSameNodeAsNode:", v6), v8 = v5, v9))
    v10 = v8;
  else
    v10 = 0;

  return v10;
}

- (id)commonNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  char v12;
  int v13;
  id v14;

  v4 = a3;
  -[MAEdge sourceNode](self, "sourceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAEdge targetNode](self, "targetNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "isEqual:", v7);
  v10 = v5;
  if ((v9 & 1) != 0
    || (v11 = objc_msgSend(v5, "isEqual:", v8), v10 = v5, (v11 & 1) != 0)
    || (v12 = objc_msgSend(v6, "isEqual:", v7), v10 = v6, (v12 & 1) != 0)
    || (v13 = objc_msgSend(v6, "isEqual:", v8), v10 = v6, v13))
  {
    v14 = v10;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)isLoop
{
  MAEdge *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[MAEdge sourceNode](self, "sourceNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAEdge targetNode](v2, "targetNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
}

- (id)visualString
{
  return -[MAEdge visualStringWithName:](self, "visualStringWithName:", 0);
}

- (id)visualStringWithName:(id)a3
{
  return -[MAEdge visualStringWithName:andPropertyKeys:](self, "visualStringWithName:andPropertyKeys:", a3, 0);
}

- (id)visualStringWithName:(id)a3 andPropertyKeys:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB37A0];
  v8 = a4;
  objc_msgSend(v7, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", CFSTR("["));
  if (v6)
    objc_msgSend(v9, "appendString:", v6);
  -[MAEdge label](self, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MAEdge label](self, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR(":%@"), v11);

  }
  else
  {
    objc_msgSend(v9, "appendFormat:", CFSTR(":"));
  }
  if (-[MAEdge domain](self, "domain") && -[MAEdge domain](self, "domain") != 1)
    objc_msgSend(v9, "appendFormat:", CFSTR(":%lu"), -[MAEdge domain](self, "domain"));
  -[MAEdge propertyDictionary](self, "propertyDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PropertiesVisualStringForKeys(v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v13, "length") >= 3)
    objc_msgSend(v9, "appendFormat:", CFSTR(" %@"), v13);
  objc_msgSend(v9, "appendString:", CFSTR("]"));

  return v9;
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

- (MANode)sourceNode
{
  return self->_sourceNode;
}

- (MANode)targetNode
{
  return self->_targetNode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetNode, 0);
  objc_storeStrong((id *)&self->_sourceNode, 0);
  objc_storeStrong((id *)&self->_graphReference, 0);
}

void __24__MAEdge_hasProperties___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
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

void __18__MAEdge_isUnique__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;

  v5 = a2;
  if ((objc_msgSend(v5, "isSameEdgeAsEdge:", *(_QWORD *)(a1 + 32)) & 1) == 0
    && objc_msgSend(v5, "isEqualToEdge:", *(_QWORD *)(a1 + 32)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }

}

- (BOOL)conformsToEdgeSchema:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = elementMatchesDefinition(v4, self);
  objc_msgSend(v4, "sourceNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAEdge sourceNode](self, "sourceNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5 & elementMatchesDefinition(v6, v7);

  objc_msgSend(v4, "targetNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAEdge targetNode](self, "targetNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v8 & elementMatchesDefinition(v9, v10);

  return (char)v4;
}

@end
