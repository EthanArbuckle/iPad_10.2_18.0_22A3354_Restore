@implementation DUDefinitionValue

- (DUDefinitionValue)initWithDefinitionDictionary:(id)a3 term:(id)a4
{
  id v6;
  id v7;
  DUDefinitionValue *v8;
  void *v9;
  uint64_t v10;
  NSString *localizedDictionaryName;
  uint64_t v12;
  NSString *term;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DUDefinitionValue;
  v8 = -[DUDefinitionValue init](&v15, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "localizedDictionaryName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    localizedDictionaryName = v8->_localizedDictionaryName;
    v8->_localizedDictionaryName = (NSString *)v10;

    v12 = objc_msgSend(v7, "copy");
    term = v8->_term;
    v8->_term = (NSString *)v12;

    if (objc_msgSend(v6, "dictionaryRef"))
    {
      -[NSString length](v8->_term, "length");
      v8->_foundRecordRefs = (__CFArray *)DCSCopyDefinitionRecords();
    }
  }

  return v8;
}

- (void)dealloc
{
  __CFArray *foundRecordRefs;
  objc_super v4;

  foundRecordRefs = self->_foundRecordRefs;
  if (foundRecordRefs)
  {
    CFRelease(foundRecordRefs);
    self->_foundRecordRefs = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DUDefinitionValue;
  -[DUDefinitionValue dealloc](&v4, sel_dealloc);
}

- (NSAttributedString)definition
{
  NSAttributedString *definition;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSAttributedString *v9;
  NSAttributedString *v10;

  definition = self->_definition;
  if (!definition)
  {
    if (self->_foundRecordRefs)
    {
      -[DUDefinitionValue _HTMLDefinitionForType:](self, "_HTMLDefinitionForType:", 2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dataUsingEncoding:", 10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6738]), "initWithData:options:", v5, 0);
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "attributedString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (NSAttributedString *)objc_msgSend(v8, "copy");
        v10 = self->_definition;
        self->_definition = v9;

      }
      definition = self->_definition;
    }
    else
    {
      definition = 0;
    }
  }
  return definition;
}

- (NSString)longDefinition
{
  NSString *longDefinition;
  void *v4;
  NSString *v5;
  NSString *v6;

  longDefinition = self->_longDefinition;
  if (!longDefinition)
  {
    if (self->_foundRecordRefs)
    {
      -[DUDefinitionValue _HTMLDefinitionForType:](self, "_HTMLDefinitionForType:", 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (NSString *)objc_msgSend(v4, "copy");
      v6 = self->_longDefinition;
      self->_longDefinition = v5;

      longDefinition = self->_longDefinition;
    }
    else
    {
      longDefinition = 0;
    }
  }
  return longDefinition;
}

- (NSDictionary)definitionElements
{
  __CFArray *foundRecordRefs;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  void *v8;
  const void *v9;
  NSDictionary *v10;
  NSDictionary *definitionElements;

  if (!self->_definitionElements)
  {
    foundRecordRefs = self->_foundRecordRefs;
    if (foundRecordRefs)
    {
      Count = CFArrayGetCount(foundRecordRefs);
      if (Count >= 1)
      {
        v6 = Count;
        v7 = 0;
        while (1)
        {
          CFArrayGetValueAtIndex(self->_foundRecordRefs, v7);
          v8 = (void *)DCSRecordCopyTextElements();
          if (v8)
          {
            v9 = v8;
            v10 = (NSDictionary *)objc_msgSend(v8, "copy");
            CFRelease(v9);
          }
          else
          {
            v10 = 0;
          }
          if (-[NSDictionary count](v10, "count"))
            break;

          if (v6 == ++v7)
            return self->_definitionElements;
        }
        definitionElements = self->_definitionElements;
        self->_definitionElements = v10;

      }
    }
  }
  return self->_definitionElements;
}

- (id)_HTMLDefinitionForType:(int64_t)a3
{
  __CFArray *foundRecordRefs;
  CFIndex Count;
  CFIndex v6;
  void *v7;
  CFIndex i;
  uint64_t v9;
  const void *v10;

  foundRecordRefs = self->_foundRecordRefs;
  if (foundRecordRefs && (Count = CFArrayGetCount(foundRecordRefs), Count >= 1))
  {
    v6 = Count;
    v7 = 0;
    for (i = 0; i != v6; ++i)
    {
      CFArrayGetValueAtIndex(self->_foundRecordRefs, i);
      v9 = DCSRecordCopyDefinition();
      if (v9)
      {
        v10 = (const void *)v9;
        if (!v7)
        {
          objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v7, "appendString:", v10);
        CFRelease(v10);
      }
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p>: localizedDictionaryName: %@, term: %@"), v5, self, self->_localizedDictionaryName, self->_term);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)localizedDictionaryName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)term
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (MAAsset)rawAsset
{
  return self->_rawAsset;
}

- (void)setRawAsset:(id)a3
{
  objc_storeStrong((id *)&self->_rawAsset, a3);
}

- (__CFArray)foundRecordRefs
{
  return self->_foundRecordRefs;
}

- (void)setFoundRecordRefs:(__CFArray *)a3
{
  self->_foundRecordRefs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawAsset, 0);
  objc_storeStrong((id *)&self->_term, 0);
  objc_storeStrong((id *)&self->_localizedDictionaryName, 0);
  objc_storeStrong((id *)&self->_definitionElements, 0);
  objc_storeStrong((id *)&self->_longDefinition, 0);
  objc_storeStrong((id *)&self->_definition, 0);
}

@end
