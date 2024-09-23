@implementation MMElement

- (MMElement)init
{
  MMElement *v2;
  uint64_t v3;
  NSMutableArray *innerRanges;
  uint64_t v5;
  NSMutableArray *children;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MMElement;
  v2 = -[MMElement init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    innerRanges = v2->_innerRanges;
    v2->_innerRanges = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    children = v2->_children;
    v2->_children = (NSMutableArray *)v5;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[MMElement children](self, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:withObject:", sel_setParent_, 0);

  v4.receiver = self;
  v4.super_class = (Class)MMElement;
  -[MMElement dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  NSRange v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MMElement type](self, "type");
  if (v6 > 0x13)
    v7 = CFSTR("unknown");
  else
    v7 = off_24F8B9848[v6];
  v11.location = -[MMElement range](self, "range");
  NSStringFromRange(v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; type=%@; range=%@>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)addInnerRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSMutableArray *innerRanges;
  void *v7;

  length = a3.length;
  location = a3.location;
  -[MMElement willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("innerRanges"));
  innerRanges = self->_innerRanges;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", location, length);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](innerRanges, "addObject:", v7);

  -[MMElement didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("innerRanges"));
}

- (void)removeLastInnerRange
{
  -[MMElement willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("innerRanges"));
  -[NSMutableArray removeLastObject](self->_innerRanges, "removeLastObject");
  -[MMElement didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("innerRanges"));
}

- (void)addChild:(id)a3
{
  id v4;

  v4 = a3;
  -[MMElement willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("children"));
  -[NSMutableArray addObject:](self->_children, "addObject:", v4);
  objc_msgSend(v4, "setParent:", self);

  -[MMElement didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("children"));
}

- (void)removeChild:(id)a3
{
  id v4;

  v4 = a3;
  -[MMElement willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("children"));
  -[NSMutableArray removeObjectIdenticalTo:](self->_children, "removeObjectIdenticalTo:", v4);
  objc_msgSend(v4, "setParent:", 0);

  -[MMElement didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("children"));
}

- (id)removeLastChild
{
  void *v3;
  void *v4;

  -[MMElement children](self, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray removeLastObject](self->_children, "removeLastObject");
  return v4;
}

- (void)setInnerRanges:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *innerRanges;

  v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  innerRanges = self->_innerRanges;
  self->_innerRanges = v4;

}

- (void)setChildren:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  NSMutableArray *children;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_children;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v9++), "setParent:", 0);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v10 = (NSMutableArray *)objc_msgSend(v4, "mutableCopy");
  children = self->_children;
  self->_children = v10;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = self->_children;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "setParent:", self, (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSArray)innerRanges
{
  return &self->_innerRanges->super;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (unint64_t)level
{
  return self->_level;
}

- (void)setLevel:(unint64_t)a3
{
  self->_level = a3;
}

- (NSString)href
{
  return self->_href;
}

- (void)setHref:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (MMElement)parent
{
  return (MMElement *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (NSArray)children
{
  return &self->_children->super;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_href, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_innerRanges, 0);
}

@end
