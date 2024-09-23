@implementation KSXMLAttributes

- (void)writeAttributes:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[NSMutableArray count](self->_attributes, "count"))
  {
    v4 = 0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_attributes, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndex:](self->_attributes, "objectAtIndex:", v4 + 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "writeAttribute:value:", v5, v6);

      v4 += 2;
    }
    while (v4 < -[NSMutableArray count](self->_attributes, "count"));
  }

}

- (KSXMLAttributes)init
{
  KSXMLAttributes *v2;
  uint64_t v3;
  NSMutableArray *attributes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KSXMLAttributes;
  v2 = -[KSXMLAttributes init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
    attributes = v2->_attributes;
    v2->_attributes = (NSMutableArray *)v3;

  }
  return v2;
}

- (KSXMLAttributes)initWithXMLAttributes:(id)a3
{
  _QWORD *v3;
  KSXMLAttributes *v4;
  void *v5;
  uint64_t v6;
  NSMutableArray *attributes;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)KSXMLAttributes;
  v3 = a3;
  v4 = -[KSXMLAttributes init](&v9, sel_init);
  v5 = (void *)v3[1];

  v6 = objc_msgSend(v5, "mutableCopy", v9.receiver, v9.super_class);
  attributes = v4->_attributes;
  v4->_attributes = (NSMutableArray *)v6;

  return v4;
}

- (NSDictionary)attributesAsDictionary
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_attributes, "count"))
  {
    v4 = 0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_attributes, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndex:](self->_attributes, "objectAtIndex:", v4 + 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v6, v5);

      v4 += 2;
    }
    while (v4 < -[NSMutableArray count](self->_attributes, "count"));
  }
  return (NSDictionary *)v3;
}

- (void)setAttributesAsDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[KSXMLAttributes addAttribute:value:](self, "addAttribute:value:", v9, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (BOOL)hasAttributes
{
  return -[NSMutableArray count](self->_attributes, "count") != 0;
}

- (void)addAttribute:(id)a3 value:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KSXMLAttributes.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value"));

  }
  -[NSMutableArray addObject:](self->_attributes, "addObject:", v9);
  -[NSMutableArray addObject:](self->_attributes, "addObject:", v7);

}

- (void)close
{
  -[NSMutableArray removeAllObjects](self->_attributes, "removeAllObjects");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithXMLAttributes:", self);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  KSXMLWriter *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v9.receiver = self;
  v9.super_class = (Class)KSXMLAttributes;
  -[KSXMLAttributes description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[KSXMLWriter initWithOutputWriter:]([KSXMLWriter alloc], "initWithOutputWriter:", v5);
  -[KSXMLWriter writeString:](v6, "writeString:", CFSTR(" "));
  -[KSXMLAttributes attributesAsDictionary](self, "attributesAsDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[KSXMLWriter startElement:attributes:](v6, "startElement:attributes:", &stru_24F8BBA48, v7);

  -[KSXMLWriter endElement](v6, "endElement");
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
