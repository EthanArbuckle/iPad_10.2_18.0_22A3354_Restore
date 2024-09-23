@implementation _LTDisambiguationNode

- (_LTDisambiguationNode)initWithText:(id)a3 links:(id)a4 romanization:(id)a5
{
  id v8;
  id v9;
  id v10;
  _LTDisambiguationNode *v11;
  uint64_t v12;
  NSString *text;
  uint64_t v14;
  NSArray *links;
  uint64_t v16;
  NSString *romanization;
  _LTDisambiguationNode *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_LTDisambiguationNode;
  v11 = -[_LTDisambiguationNode init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    text = v11->_text;
    v11->_text = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    links = v11->_links;
    v11->_links = (NSArray *)v14;

    v16 = objc_msgSend(v10, "copy");
    romanization = v11->_romanization;
    v11->_romanization = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (void)_removeAllLinks
{
  NSArray *links;

  links = self->_links;
  self->_links = (NSArray *)MEMORY[0x24BDBD1A8];

}

- (void)_removeRomanization
{
  NSString *romanization;

  romanization = self->_romanization;
  self->_romanization = 0;

}

- (void)_insertPrefix:(id)a3
{
  id v4;
  NSString *v5;
  NSString *text;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSString *v12;
  NSString *romanization;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[NSString length](self->_text, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v4, self->_text);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    text = self->_text;
    self->_text = v5;

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = self->_links;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11++), "_insertPrefix:", v4);
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    if (-[NSString length](self->_romanization, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v4, self->_romanization, (_QWORD)v14);
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      romanization = self->_romanization;
      self->_romanization = v12;

    }
  }

}

- (void)encodeWithCoder:(id)a3
{
  NSString *text;
  id v5;

  text = self->_text;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", text, CFSTR("text"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_links, CFSTR("links"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_romanization, CFSTR("romanization"));

}

- (_LTDisambiguationNode)initWithCoder:(id)a3
{
  id v4;
  _LTDisambiguationNode *v5;
  uint64_t v6;
  NSString *text;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *links;
  uint64_t v13;
  NSString *romanization;
  _LTDisambiguationNode *v15;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_LTDisambiguationNode;
  v5 = -[_LTDisambiguationNode init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("links"));
    v11 = objc_claimAutoreleasedReturnValue();
    links = v5->_links;
    v5->_links = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("romanization"));
    v13 = objc_claimAutoreleasedReturnValue();
    romanization = v5->_romanization;
    v5->_romanization = (NSString *)v13;

    v15 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE30], "allocWithZone:"), "initWithArray:copyItems:", self->_links, 1);
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v7 = (void *)-[NSString copy](self->_text, "copy");
  v8 = (void *)-[NSString copy](self->_romanization, "copy");
  v9 = (void *)objc_msgSend(v6, "initWithText:links:romanization:", v7, v5, v8);

  return v9;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)romanization
{
  return self->_romanization;
}

- (NSArray)links
{
  return self->_links;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_romanization, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
