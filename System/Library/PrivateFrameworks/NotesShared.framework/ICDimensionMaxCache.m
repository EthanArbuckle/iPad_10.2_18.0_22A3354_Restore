@implementation ICDimensionMaxCache

- (double)max
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[ICDimensionMaxCache sortedDimensions](self, "sortedDimensions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[ICDimensionMaxCache dimensions](self, "dimensions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (ICDimensionMaxCache)init
{
  -[ICDimensionMaxCache doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICDimensionMaxCache)initWithComparator:(id)a3
{
  id v4;
  ICDimensionMaxCache *v5;
  uint64_t v6;
  NSMutableDictionary *dimensions;
  uint64_t v8;
  NSMutableArray *sortedDimensions;
  void *v10;
  id comparator;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICDimensionMaxCache;
  v5 = -[ICDimensionMaxCache init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    dimensions = v5->_dimensions;
    v5->_dimensions = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    sortedDimensions = v5->_sortedDimensions;
    v5->_sortedDimensions = (NSMutableArray *)v8;

    v10 = _Block_copy(v4);
    comparator = v5->_comparator;
    v5->_comparator = v10;

  }
  return v5;
}

- (double)dimensionForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  -[ICDimensionMaxCache dimensions](self, "dimensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  return v8;
}

- (void)setDimension:(double)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a4;
  -[ICDimensionMaxCache dimensions](self, "dimensions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if ((objc_msgSend(v8, "isEqual:", v9) & 1) != 0)
      goto LABEL_9;
    -[ICDimensionMaxCache sortedDimensions](self, "sortedDimensions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDimensionMaxCache comparator](self, "comparator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "ic_indexOfSortedObject:insertionIndex:usingComparator:", v8, 0, v11);

    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "prevIndex != NSNotFound", "-[ICDimensionMaxCache setDimension:forKey:]", 1, 0, CFSTR("index of existing dimension should exist"));
    -[ICDimensionMaxCache sortedDimensions](self, "sortedDimensions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectAtIndex:", v12);

  }
  v22 = 0;
  -[ICDimensionMaxCache sortedDimensions](self, "sortedDimensions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDimensionMaxCache comparator](self, "comparator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ic_indexOfSortedObject:insertionIndex:usingComparator:", v9, &v22, v15);

  if (v22 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "index != NSNotFound", "-[ICDimensionMaxCache setDimension:forKey:]", 1, 0, CFSTR("insertion index should be found"));
  -[ICDimensionMaxCache sortedDimensions](self, "sortedDimensions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "insertObject:atIndex:", v9, v22);

  -[ICDimensionMaxCache dimensions](self, "dimensions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v9, v6);

LABEL_9:
  -[ICDimensionMaxCache dimensions](self, "dimensions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");
  -[ICDimensionMaxCache sortedDimensions](self, "sortedDimensions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v19 != v21)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.dimensions.count == self.sortedDimensions.count", "-[ICDimensionMaxCache setDimension:forKey:]", 1, 0, CFSTR("counts should match"));

}

- (void)removeDimensionForKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[ICDimensionMaxCache dimensions](self, "dimensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICDimensionMaxCache sortedDimensions](self, "sortedDimensions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDimensionMaxCache comparator](self, "comparator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "ic_indexOfSortedObject:insertionIndex:usingComparator:", v5, 0, v7);

    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "index != NSNotFound", "-[ICDimensionMaxCache removeDimensionForKey:]", 1, 0, CFSTR("index of existing dimension should exist"));
    -[ICDimensionMaxCache sortedDimensions](self, "sortedDimensions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectAtIndex:", v8);

    -[ICDimensionMaxCache dimensions](self, "dimensions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v11);

  }
}

- (NSMutableDictionary)dimensions
{
  return self->_dimensions;
}

- (NSMutableArray)sortedDimensions
{
  return self->_sortedDimensions;
}

- (id)comparator
{
  return self->_comparator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong((id *)&self->_sortedDimensions, 0);
  objc_storeStrong((id *)&self->_dimensions, 0);
}

@end
