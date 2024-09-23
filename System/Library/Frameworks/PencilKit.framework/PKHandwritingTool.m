@implementation PKHandwritingTool

- (PKHandwritingTool)init
{
  return -[PKHandwritingTool initWithLocaleIdentifier:](self, "initWithLocaleIdentifier:", CFSTR("en"));
}

- (PKHandwritingTool)initWithLocaleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PKHandwritingTool *v7;
  uint64_t v8;
  NSString *localeIdentifier;
  objc_super v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInk inkWithType:color:weight:](PKInk, "inkWithType:color:weight:", CFSTR("com.apple.ink.handwriting"), v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)PKHandwritingTool;
  v7 = -[PKTool _initWithInk:](&v11, sel__initWithInk_, v6);

  if (v7)
  {
    v8 = objc_msgSend(v4, "copy");
    localeIdentifier = v7->_localeIdentifier;
    v7->_localeIdentifier = (NSString *)v8;

  }
  return v7;
}

- (BOOL)_isHandwritingTool
{
  return 1;
}

- (id)_defaultItemIdentifier
{
  return CFSTR("com.apple.tool.scribble");
}

- (Class)_toolPickerItemClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isEqual:(id)a3
{
  PKHandwritingTool *v4;
  PKHandwritingTool *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v4 = (PKHandwritingTool *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PKHandwritingTool;
    if (-[PKTool isEqual:](&v12, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[PKTool ink](self, "ink");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTool ink](v5, "ink");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[PKHandwritingTool localeIdentifier](self, "localeIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKHandwritingTool localeIdentifier](v5, "localeIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[PKTool ink](self, "ink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PKHandwritingTool localeIdentifier](self, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

@end
