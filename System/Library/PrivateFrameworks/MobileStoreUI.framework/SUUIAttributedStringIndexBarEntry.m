@implementation SUUIAttributedStringIndexBarEntry

- (SUUIAttributedStringIndexBarEntry)initWithAttributedString:(id)a3
{
  id v4;
  SUUIAttributedStringIndexBarEntry *v5;
  uint64_t v6;
  NSAttributedString *attributedString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIAttributedStringIndexBarEntry;
  v5 = -[SUUIAttributedStringIndexBarEntry init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    attributedString = v5->_attributedString;
    v5->_attributedString = (NSAttributedString *)v6;

    -[SUUIIndexBarEntry setEntryType:](v5, "setEntryType:", 1);
  }

  return v5;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p attributedString:%@>"), v5, self, self->_attributedString);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIAttributedStringIndexBarEntry;
  v3 = -[SUUIIndexBarEntry hash](&v5, sel_hash);
  return -[NSAttributedString hash](self->_attributedString, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  SUUIAttributedStringIndexBarEntry *v4;
  NSAttributedString *attributedString;
  char v6;
  objc_super v8;

  v4 = (SUUIAttributedStringIndexBarEntry *)a3;
  if (v4 == self)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v8.receiver = self,
        v8.super_class = (Class)SUUIAttributedStringIndexBarEntry,
        !-[SUUIIndexBarEntry isEqual:](&v8, sel_isEqual_, v4)))
  {
    v6 = 0;
    goto LABEL_8;
  }
  attributedString = v4->_attributedString;
  if (attributedString == self->_attributedString)
  {
LABEL_7:
    v6 = 1;
    goto LABEL_8;
  }
  v6 = -[NSAttributedString isEqualToAttributedString:](attributedString, "isEqualToAttributedString:");
LABEL_8:

  return v6;
}

- (CGSize)_calculatedContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[SUUIAttributedStringIndexBarEntry _synthesizedAttributedString](self, "_synthesizedAttributedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)_drawContentInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SUUIAttributedStringIndexBarEntry _synthesizedAttributedString](self, "_synthesizedAttributedString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "drawInRect:", x, y, width, height);

}

- (void)_tintColorDidChange
{
  objc_super v3;

  -[SUUIAttributedStringIndexBarEntry _invalidateSynthesizedAttributedString](self, "_invalidateSynthesizedAttributedString");
  v3.receiver = self;
  v3.super_class = (Class)SUUIAttributedStringIndexBarEntry;
  -[SUUIIndexBarEntry _tintColorDidChange](&v3, sel__tintColorDidChange);
}

- (id)entryAttributedString
{
  return self->_attributedString;
}

- (void)setDefaultTextAttributes:(id)a3
{
  NSDictionary *v4;
  NSDictionary *defaultTextAttributes;
  BOOL v6;
  NSDictionary *v7;
  NSDictionary *v8;
  NSDictionary *v9;

  v4 = (NSDictionary *)a3;
  defaultTextAttributes = self->_defaultTextAttributes;
  if (defaultTextAttributes != v4)
  {
    v9 = v4;
    v6 = -[NSDictionary isEqualToDictionary:](defaultTextAttributes, "isEqualToDictionary:", v4);
    v4 = v9;
    if (!v6)
    {
      v7 = (NSDictionary *)-[NSDictionary copy](v9, "copy");
      v8 = self->_defaultTextAttributes;
      self->_defaultTextAttributes = v7;

      -[SUUIAttributedStringIndexBarEntry _invalidateSynthesizedAttributedString](self, "_invalidateSynthesizedAttributedString");
      v4 = v9;
    }
  }

}

- (void)_invalidateSynthesizedAttributedString
{
  NSAttributedString *synthesizedAttributedString;

  self->_hasValidSynthesizedAttributedString = 0;
  synthesizedAttributedString = self->_synthesizedAttributedString;
  self->_synthesizedAttributedString = 0;

}

- (id)_synthesizedAttributedString
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSAttributedString *attributedString;
  uint64_t v13;
  NSAttributedString *v14;
  NSAttributedString *synthesizedAttributedString;
  NSAttributedString *v16;
  _QWORD v18[4];
  NSAttributedString *v19;

  if (!self->_hasValidSynthesizedAttributedString)
  {
    v3 = (void *)MEMORY[0x24BDBCED8];
    -[SUUIIndexBarEntry tintColor](self, "tintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x24BEBB368];
    objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 11.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, v5, v6, *MEMORY[0x24BEBB360], 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUUIAttributedStringIndexBarEntry defaultTextAttributes](self, "defaultTextAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addEntriesFromDictionary:", v8);

    if (-[NSAttributedString length](self->_attributedString, "length") && objc_msgSend(v7, "count"))
    {
      v9 = objc_alloc(MEMORY[0x24BDD1688]);
      -[NSAttributedString string](self->_attributedString, "string");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithString:attributes:", v10, v7);

      attributedString = self->_attributedString;
      v13 = -[NSAttributedString length](attributedString, "length");
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __65__SUUIAttributedStringIndexBarEntry__synthesizedAttributedString__block_invoke;
      v18[3] = &unk_2511F84D8;
      v14 = v11;
      v19 = v14;
      -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](attributedString, "enumerateAttributesInRange:options:usingBlock:", 0, v13, 0, v18);
      synthesizedAttributedString = self->_synthesizedAttributedString;
      self->_synthesizedAttributedString = v14;
      v16 = v14;

    }
    self->_hasValidSynthesizedAttributedString = 1;

  }
  return self->_synthesizedAttributedString;
}

uint64_t __65__SUUIAttributedStringIndexBarEntry__synthesizedAttributedString__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", a2, a3, a4);
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (NSDictionary)defaultTextAttributes
{
  return self->_defaultTextAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTextAttributes, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_synthesizedAttributedString, 0);
}

@end
