@implementation _HKXMLExtractorElement

- (_HKXMLExtractorElement)initWithTagSpecification:(id)a3
{
  id v5;
  _HKXMLExtractorElement *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSString *specificationElement;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSDictionary *specificationAttributes;
  void *v26;
  _HKXMLExtractorElement *v27;
  id v28;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_HKXMLExtractorElement;
  v6 = -[_HKXMLExtractorElement init](&v29, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "hk_percentCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    if (v9 >= 2)
    {
      v10 = v9;
      v26 = v7;
      v28 = v5;
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      specificationElement = v6->_specificationElement;
      v27 = v6;
      v6->_specificationElement = (NSString *)v11;

      objc_msgSend(MEMORY[0x1E0CB3500], "hk_equalCharacterSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v15 = 1;
      while (1)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsSeparatedByCharactersInSet:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");
        if (v18 == 2)
        {
          objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
          v19 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v18 != 1)
          {
            objc_msgSend(v17, "subarrayWithRange:", 1, objc_msgSend(v17, "count") - 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "componentsJoinedByString:", CFSTR("="));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKey:", v21, v22);

            goto LABEL_10;
          }
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v19 = objc_claimAutoreleasedReturnValue();
        }
        v20 = (void *)v19;
        objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v20, v21);
LABEL_10:

        if (v10 == ++v15)
        {
          v23 = objc_msgSend(v14, "copy");
          v6 = v27;
          specificationAttributes = v27->_specificationAttributes;
          v27->_specificationAttributes = (NSDictionary *)v23;

          v5 = v28;
          v7 = v26;
          goto LABEL_13;
        }
      }
    }
    objc_storeStrong((id *)&v6->_specificationElement, a3);
    v13 = v6->_specificationAttributes;
    v6->_specificationAttributes = 0;
LABEL_13:

  }
  return v6;
}

- (_HKXMLExtractorElement)initWithElementName:(id)a3 attributes:(id)a4
{
  id v6;
  id v7;
  _HKXMLExtractorElement *v8;
  uint64_t v9;
  NSString *specificationElement;
  uint64_t v11;
  NSDictionary *specificationAttributes;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_HKXMLExtractorElement;
  v8 = -[_HKXMLExtractorElement init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    specificationElement = v8->_specificationElement;
    v8->_specificationElement = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    specificationAttributes = v8->_specificationAttributes;
    v8->_specificationAttributes = (NSDictionary *)v11;

  }
  return v8;
}

- (BOOL)matchesElement:(id)a3
{
  id v4;
  NSString *specificationElement;
  void *v6;
  void *v7;
  NSDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  specificationElement = self->_specificationElement;
  objc_msgSend(v4, "specificationElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(specificationElement) = -[NSString isEqualToString:](specificationElement, "isEqualToString:", v6);

  if ((_DWORD)specificationElement)
  {
    if (self->_specificationAttributes)
    {
      objc_msgSend(v4, "specificationAttributes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v8 = self->_specificationAttributes;
      v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v9)
      {
        v10 = v9;
        v21 = v4;
        v11 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v23 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_msgSend(v7, "objectForKeyedSubscript:", v13);
            v14 = objc_claimAutoreleasedReturnValue();
            if (!v14)
              goto LABEL_18;
            v15 = (void *)v14;
            -[NSDictionary objectForKeyedSubscript:](self->_specificationAttributes, "objectForKeyedSubscript:", v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v16, "isEqual:", v17);

            if ((v18 & 1) == 0 && !objc_msgSend(v15, "isEqualToString:", v16))
            {

LABEL_18:
              v19 = 0;
              goto LABEL_19;
            }

          }
          v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v10)
            continue;
          break;
        }
        v19 = 1;
LABEL_19:
        v4 = v21;
      }
      else
      {
        v19 = 1;
      }

    }
    else
    {
      v19 = 1;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (NSString)specificationElement
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)specificationAttributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specificationAttributes, 0);
  objc_storeStrong((id *)&self->_specificationElement, 0);
}

@end
