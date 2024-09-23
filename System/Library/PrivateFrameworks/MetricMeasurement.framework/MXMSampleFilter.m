@implementation MXMSampleFilter

+ (MXMSampleFilter)filterWithTagFilter:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTagFilter:", v4);

  return (MXMSampleFilter *)v5;
}

+ (MXMSampleFilter)filterWithTagFilters:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTagFilters:", v4);

  return (MXMSampleFilter *)v5;
}

+ (MXMSampleFilter)filterWithAttributeFilter:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAttributeFilter:", v4);

  return (MXMSampleFilter *)v5;
}

+ (MXMSampleFilter)filterWithAttributeFilters:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAttributeFilters:", v4);

  return (MXMSampleFilter *)v5;
}

+ (MXMSampleFilter)filterWithAttributeFilter:(id)a3 tagFilter:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAttributeFilter:tagFilter:", v7, v6);

  return (MXMSampleFilter *)v8;
}

- (MXMSampleFilter)initWithTagFilter:(id)a3
{
  void *v4;
  MXMSampleFilter *v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MXMSampleFilter initWithTagFilters:](self, "initWithTagFilters:", v4);

  return v5;
}

- (MXMSampleFilter)initWithTagFilters:(id)a3
{
  return -[MXMSampleFilter initWithAttributeFilters:tagFilters:](self, "initWithAttributeFilters:tagFilters:", 0, a3);
}

- (MXMSampleFilter)initWithAttributeFilter:(id)a3
{
  void *v4;
  MXMSampleFilter *v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MXMSampleFilter initWithAttributeFilters:tagFilters:](self, "initWithAttributeFilters:tagFilters:", v4, 0);

  return v5;
}

- (MXMSampleFilter)initWithAttributeFilters:(id)a3
{
  return -[MXMSampleFilter initWithAttributeFilters:tagFilters:](self, "initWithAttributeFilters:tagFilters:", a3, 0);
}

- (MXMSampleFilter)initWithAttributeFilter:(id)a3 tagFilter:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  MXMSampleFilter *v10;

  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = a4;
  objc_msgSend(v6, "setWithObject:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[MXMSampleFilter initWithAttributeFilters:tagFilters:](self, "initWithAttributeFilters:tagFilters:", v8, v9);
  return v10;
}

- (MXMSampleFilter)initWithAttributeFilters:(id)a3 tagFilters:(id)a4
{
  id v6;
  id v7;
  MXMSampleFilter *v8;
  uint64_t v9;
  NSSet *tagFilters;
  uint64_t v11;
  NSMutableDictionary *attributeFilters;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)MXMSampleFilter;
  v8 = -[MXMSampleFilter init](&v27, sel_init);
  if (v8)
  {
    if (v7)
    {
      v9 = objc_msgSend(v7, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    tagFilters = v8->_tagFilters;
    v8->_tagFilters = (NSSet *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    v11 = objc_claimAutoreleasedReturnValue();
    attributeFilters = v8->_attributeFilters;
    v8->_attributeFilters = (NSMutableDictionary *)v11;

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v19 = (void *)objc_msgSend(v18, "copy", (_QWORD)v23);
          v20 = v8->_attributeFilters;
          objc_msgSend(v18, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v19, v21);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v15);
    }

  }
  return v8;
}

- (void)addAttributeFilters:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSMutableDictionary *attributeFilters;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v10 = (void *)objc_msgSend(v9, "copy");
        attributeFilters = self->_attributeFilters;
        objc_msgSend(v9, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](attributeFilters, "setObject:forKeyedSubscript:", v10, v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (id)attributeFilterWithName:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_attributeFilters, "objectForKeyedSubscript:", a3);
}

- (BOOL)finite
{
  return 1;
}

- (BOOL)matchesSample:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(v4, "tag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MXMSampleFilter matchesSamplesWithTag:](self, "matchesSamplesWithTag:", v5))
  {
    objc_msgSend(v4, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MXMSampleFilter matchesSamplesWithAttributes:](self, "matchesSamplesWithAttributes:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)matchesSampleSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(v4, "tag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MXMSampleFilter matchesSamplesWithTag:](self, "matchesSamplesWithTag:", v5))
  {
    objc_msgSend(v4, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MXMSampleFilter matchesSamplesWithAttributes:](self, "matchesSamplesWithAttributes:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)matchesSamplesWithAttribute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMSampleFilter attributeFilterWithName:](self, "attributeFilterWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "matchesSampleWithAttribute:", v4);
  else
    v7 = 1;

  return v7;
}

- (BOOL)matchesSamplesWithAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (!-[MXMSampleFilter matchesSamplesWithAttribute:](self, "matchesSamplesWithAttribute:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)matchesSamplesWithTag:(id)a3
{
  id v4;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_tagFilters;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "matchesSampleWithTag:", v4, (_QWORD)v12))
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (id)copy
{
  return -[MXMSampleFilter copyWithZone:](self, "copyWithZone:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = (void *)MEMORY[0x24BDBCF20];
  -[NSMutableDictionary allValues](self->_attributeFilters, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)-[NSSet copy](self->_tagFilters, "copy");
  v9 = (void *)objc_msgSend(v4, "initWithAttributeFilters:tagFilters:", v7, v8);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *tagFilters;
  id v5;

  tagFilters = self->_tagFilters;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", tagFilters, CFSTR("_tagFilters"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attributeFilters, CFSTR("_attributeFilters"));

}

- (MXMSampleFilter)initWithCoder:(id)a3
{
  id v4;
  MXMSampleFilter *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSSet *tagFilters;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *attributeFilters;
  void *v17;
  void *v18;
  MXMSampleFilter *v19;
  MXMSampleFilter *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MXMSampleFilter;
  v5 = -[MXMSampleFilter init](&v22, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_tagFilters"));
    v9 = objc_claimAutoreleasedReturnValue();
    tagFilters = v5->_tagFilters;
    v5->_tagFilters = (NSSet *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("_attributeFilters"));
    v15 = objc_claimAutoreleasedReturnValue();
    attributeFilters = v5->_attributeFilters;
    v5->_attributeFilters = (NSMutableDictionary *)v15;

  }
  -[MXMSampleFilter tagFilters](v5, "tagFilters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[MXMSampleFilter attributeFilters](v5, "attributeFilters");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      v19 = v5;
    else
      v19 = 0;
    v20 = v19;

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (NSSet)tagFilters
{
  return self->_tagFilters;
}

- (void)setTagFilters:(id)a3
{
  objc_storeStrong((id *)&self->_tagFilters, a3);
}

- (NSMutableDictionary)attributeFilters
{
  return self->_attributeFilters;
}

- (void)setAttributeFilters:(id)a3
{
  objc_storeStrong((id *)&self->_attributeFilters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeFilters, 0);
  objc_storeStrong((id *)&self->_tagFilters, 0);
}

@end
