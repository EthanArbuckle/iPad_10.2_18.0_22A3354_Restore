@implementation _LTDisambiguationLinkConfiguration

- (_LTDisambiguationLinkConfiguration)initWithSourceRange:(_NSRange)a3 targetRange:(_NSRange)a4 adjacencyList:(id)a5 gender:(id)a6 defaultGender:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v10;
  NSUInteger v11;
  id v13;
  id v14;
  id v15;
  _LTDisambiguationLinkConfiguration *v16;
  _LTDisambiguationLinkConfiguration *v17;
  uint64_t v18;
  NSArray *adjacencyList;
  _LTDisambiguationLinkConfiguration *v20;
  objc_super v22;

  length = a4.length;
  location = a4.location;
  v10 = a3.length;
  v11 = a3.location;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)_LTDisambiguationLinkConfiguration;
  v16 = -[_LTDisambiguationLinkConfiguration init](&v22, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_sourceRange.location = v11;
    v16->_sourceRange.length = v10;
    v16->_targetRange.location = location;
    v16->_targetRange.length = length;
    v18 = objc_msgSend(v13, "copy");
    adjacencyList = v17->_adjacencyList;
    v17->_adjacencyList = (NSArray *)v18;

    objc_storeStrong((id *)&v17->_gender, a6);
    objc_storeStrong((id *)&v17->_defaultGender, a7);
    v20 = v17;
  }

  return v17;
}

- (_LTDisambiguationLinkConfiguration)initWithSourceText:(id)a3 sourceSnippet:(id)a4 targetText:(id)a5 targetSnippet:(id)a6 adjacencyList:(id)a7 gender:(id)a8 defaultGender:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _LTDisambiguationLinkConfiguration *v26;

  v15 = a7;
  v16 = a8;
  v17 = a9;
  v18 = a6;
  v19 = a5;
  v20 = objc_msgSend(a3, "rangeOfString:", a4);
  v22 = v21;
  v23 = objc_msgSend(v19, "rangeOfString:", v18);
  v25 = v24;

  v26 = 0;
  if (v20 != 0x7FFFFFFFFFFFFFFFLL && v23 != 0x7FFFFFFFFFFFFFFFLL)
  {
    self = -[_LTDisambiguationLinkConfiguration initWithSourceRange:targetRange:adjacencyList:gender:defaultGender:](self, "initWithSourceRange:targetRange:adjacencyList:gender:defaultGender:", v20, v22, v23, v25, v15, v16, v17);
    v26 = self;
  }

  return v26;
}

- (_LTDisambiguationLinkConfiguration)initWithSourceRange:(_NSRange)a3 targetRange:(_NSRange)a4 unvalidatedAdjacencyList:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  NSUInteger v8;
  id v10;
  _LTDisambiguationLinkConfiguration *v11;
  _LTDisambiguationLinkConfiguration *v12;
  uint64_t v13;
  NSArray *unvalidatedAdjacencyList;
  NSArray *adjacencyList;
  NSNumber *gender;
  NSNumber *defaultGender;
  _LTDisambiguationLinkConfiguration *v18;
  objc_super v20;

  length = a4.length;
  location = a4.location;
  v7 = a3.length;
  v8 = a3.location;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_LTDisambiguationLinkConfiguration;
  v11 = -[_LTDisambiguationLinkConfiguration init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_sourceRange.location = v8;
    v11->_sourceRange.length = v7;
    v11->_targetRange.location = location;
    v11->_targetRange.length = length;
    v13 = objc_msgSend(v10, "copy");
    unvalidatedAdjacencyList = v12->_unvalidatedAdjacencyList;
    v12->_unvalidatedAdjacencyList = (NSArray *)v13;

    adjacencyList = v12->_adjacencyList;
    v12->_adjacencyList = (NSArray *)MEMORY[0x24BDBD1A8];

    gender = v12->_gender;
    v12->_gender = 0;

    defaultGender = v12->_defaultGender;
    v12->_defaultGender = 0;

    v18 = v12;
  }

  return v12;
}

- (_LTDisambiguationLinkConfiguration)initWithSourceText:(id)a3 sourceSnippet:(id)a4 targetText:(id)a5 targetSnippet:(id)a6 unvalidatedAdjacencyList:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _LTDisambiguationLinkConfiguration *v21;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = objc_msgSend(a3, "rangeOfString:", a4);
  v17 = v16;
  v18 = objc_msgSend(v14, "rangeOfString:", v13);
  v20 = v19;

  v21 = 0;
  if (v15 != 0x7FFFFFFFFFFFFFFFLL && v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    self = -[_LTDisambiguationLinkConfiguration initWithSourceRange:targetRange:unvalidatedAdjacencyList:](self, "initWithSourceRange:targetRange:unvalidatedAdjacencyList:", v15, v17, v18, v20, v12);
    v21 = self;
  }

  return v21;
}

- (NSSet)edgeTypes
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[NSArray _ltCompactMap:](self->_adjacencyList, "_ltCompactMap:", &__block_literal_global_2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = (void *)MEMORY[0x24BDBD1A8];
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v6;
}

- (void)_validateWithAdjacencyList:(id)a3 gender:(id)a4 defaultGender:(id)a5
{
  NSNumber *v8;
  NSNumber *v9;
  NSArray *v10;
  NSArray *adjacencyList;
  NSNumber *gender;
  NSNumber *defaultGender;
  NSNumber *v14;

  v8 = (NSNumber *)a4;
  v9 = (NSNumber *)a5;
  v10 = (NSArray *)objc_msgSend(a3, "copy");
  adjacencyList = self->_adjacencyList;
  self->_adjacencyList = v10;

  gender = self->_gender;
  self->_gender = v8;
  v14 = v8;

  defaultGender = self->_defaultGender;
  self->_defaultGender = v9;

}

- (void)_finishValidating
{
  NSArray *unvalidatedAdjacencyList;

  unvalidatedAdjacencyList = self->_unvalidatedAdjacencyList;
  self->_unvalidatedAdjacencyList = 0;

}

- (id)_unvalidatedEdgeFromAdjacencyListMatchingTargetNodeIndex:(unint64_t)a3
{
  NSArray *unvalidatedAdjacencyList;
  _QWORD v5[5];

  unvalidatedAdjacencyList = self->_unvalidatedAdjacencyList;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __95___LTDisambiguationLinkConfiguration__unvalidatedEdgeFromAdjacencyListMatchingTargetNodeIndex___block_invoke;
  v5[3] = &__block_descriptor_40_e32_B16__0___LTUnvalidatedEdgeInfo_8l;
  v5[4] = a3;
  -[NSArray lt_firstObjectPassingTest:](unvalidatedAdjacencyList, "lt_firstObjectPassingTest:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_insertPrefix:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "length");
  if (v4)
  {
    self->_sourceRange.location += v4;
    self->_targetRange.location += v4;
  }
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  NSUInteger location;
  NSUInteger length;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BDD1968];
  location = self->_sourceRange.location;
  length = self->_sourceRange.length;
  v9 = a3;
  objc_msgSend(v4, "valueWithRange:", location, length);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("sourceRange"));

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", self->_targetRange.location, self->_targetRange.length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("targetRange"));

  objc_msgSend(v9, "encodeObject:forKey:", self->_adjacencyList, CFSTR("adjacencyList"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_gender, CFSTR("gender"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_defaultGender, CFSTR("defaultGender"));

}

- (_LTDisambiguationLinkConfiguration)initWithCoder:(id)a3
{
  id v4;
  _LTDisambiguationLinkConfiguration *v5;
  void *v6;
  NSUInteger v7;
  void *v8;
  NSUInteger v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *adjacencyList;
  uint64_t v15;
  NSNumber *gender;
  uint64_t v17;
  NSNumber *defaultGender;
  _LTDisambiguationLinkConfiguration *v19;
  objc_super v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_LTDisambiguationLinkConfiguration;
  v5 = -[_LTDisambiguationLinkConfiguration init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceRange"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sourceRange.location = objc_msgSend(v6, "rangeValue");
    v5->_sourceRange.length = v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetRange"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_targetRange.location = objc_msgSend(v8, "rangeValue");
    v5->_targetRange.length = v9;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("adjacencyList"));
    v13 = objc_claimAutoreleasedReturnValue();
    adjacencyList = v5->_adjacencyList;
    v5->_adjacencyList = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gender"));
    v15 = objc_claimAutoreleasedReturnValue();
    gender = v5->_gender;
    v5->_gender = (NSNumber *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultGender"));
    v17 = objc_claimAutoreleasedReturnValue();
    defaultGender = v5->_defaultGender;
    v5->_defaultGender = (NSNumber *)v17;

    v19 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSArray *unvalidatedAdjacencyList;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  unvalidatedAdjacencyList = self->_unvalidatedAdjacencyList;
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "allocWithZone:");
  if (unvalidatedAdjacencyList)
  {
    v7 = (void *)objc_msgSend(v6, "initWithArray:copyItems:", self->_unvalidatedAdjacencyList, 1);
    v8 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSourceRange:targetRange:unvalidatedAdjacencyList:", self->_sourceRange.location, self->_sourceRange.length, self->_targetRange.location, self->_targetRange.length, v7);
  }
  else
  {
    v7 = (void *)objc_msgSend(v6, "initWithArray:copyItems:", self->_adjacencyList, 1);
    v9 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
    v10 = (void *)-[NSNumber copy](self->_gender, "copy");
    v11 = (void *)-[NSNumber copy](self->_defaultGender, "copy");
    v8 = (void *)objc_msgSend(v9, "initWithSourceRange:targetRange:adjacencyList:gender:defaultGender:", self->_sourceRange.location, self->_sourceRange.length, self->_targetRange.location, self->_targetRange.length, v7, v10, v11);

  }
  return v8;
}

- (_NSRange)sourceRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_sourceRange.length;
  location = self->_sourceRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)targetRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_targetRange.length;
  location = self->_targetRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSArray)adjacencyList
{
  return self->_adjacencyList;
}

- (NSNumber)gender
{
  return self->_gender;
}

- (NSNumber)defaultGender
{
  return self->_defaultGender;
}

- (NSArray)unvalidatedAdjacencyList
{
  return self->_unvalidatedAdjacencyList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultGender, 0);
  objc_storeStrong((id *)&self->_gender, 0);
  objc_storeStrong((id *)&self->_adjacencyList, 0);
  objc_storeStrong((id *)&self->_unvalidatedAdjacencyList, 0);
}

@end
