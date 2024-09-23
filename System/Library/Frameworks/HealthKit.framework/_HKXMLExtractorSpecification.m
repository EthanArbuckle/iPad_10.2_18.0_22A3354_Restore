@implementation _HKXMLExtractorSpecification

- (_HKXMLExtractorSpecification)initWithSpecificationString:(id)a3
{
  id v5;
  _HKXMLExtractorSpecification *v6;
  _HKXMLExtractorSpecification *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _HKXMLExtractorElement *v17;
  _HKXMLExtractorElement *v18;
  uint64_t v19;
  NSArray *specificationElements;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_HKXMLExtractorSpecification;
  v6 = -[_HKXMLExtractorSpecification init](&v26, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_specificationString, a3);
    objc_msgSend(MEMORY[0x1E0CB3500], "hk_forwardSlashCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15);
          v17 = [_HKXMLExtractorElement alloc];
          v18 = -[_HKXMLExtractorElement initWithTagSpecification:](v17, "initWithTagSpecification:", v16, (_QWORD)v22);
          objc_msgSend(v10, "addObject:", v18);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v13);
    }

    v19 = objc_msgSend(v10, "copy");
    specificationElements = v7->_specificationElements;
    v7->_specificationElements = (NSArray *)v19;

  }
  return v7;
}

- (BOOL)matchesElementStack:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5 == -[NSArray count](self->_specificationElements, "count"))
  {
    v6 = v5 - 1;
    if (v5 < 1)
    {
      LOBYTE(v10) = 1;
    }
    else
    {
      v7 = 0;
      do
      {
        -[NSArray objectAtIndexedSubscript:](self->_specificationElements, "objectAtIndexedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "matchesElement:", v9);

        if (v10)
          v11 = v6 == v7;
        else
          v11 = 1;
        ++v7;
      }
      while (!v11);
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (NSString)specificationString
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)specificationElements
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specificationElements, 0);
  objc_storeStrong((id *)&self->_specificationString, 0);
}

@end
