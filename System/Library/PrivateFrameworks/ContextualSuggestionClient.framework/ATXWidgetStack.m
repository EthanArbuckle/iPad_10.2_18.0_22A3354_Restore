@implementation ATXWidgetStack

- (ATXWidgetStack)initWithIdentifier:(id)a3 widgets:(id)a4 family:(int64_t)a5 allowsNewWidget:(BOOL)a6 allowsSmartRotate:(BOOL)a7
{
  return -[ATXWidgetStack initWithIdentifier:widgets:topWidgetIdentifier:family:allowsNewWidget:allowsSmartRotate:](self, "initWithIdentifier:widgets:topWidgetIdentifier:family:allowsNewWidget:allowsSmartRotate:", a3, a4, 0, a5, a6, a7);
}

- (ATXWidgetStack)initWithIdentifier:(id)a3 widgets:(id)a4 topWidgetIdentifier:(id)a5 family:(int64_t)a6 allowsNewWidget:(BOOL)a7 allowsSmartRotate:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  ATXWidgetStack *v17;
  uint64_t v18;
  NSString *identifier;
  uint64_t v20;
  NSArray *widgets;
  uint64_t v22;
  NSString *topWidgetIdentifier;
  objc_super v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v25.receiver = self;
  v25.super_class = (Class)ATXWidgetStack;
  v17 = -[ATXWidgetStack init](&v25, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v14, "copy");
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v18;

    v20 = objc_msgSend(v15, "copy");
    widgets = v17->_widgets;
    v17->_widgets = (NSArray *)v20;

    v22 = objc_msgSend(v16, "copy");
    topWidgetIdentifier = v17->_topWidgetIdentifier;
    v17->_topWidgetIdentifier = (NSString *)v22;

    v17->_family = a6;
    v17->_allowsNewWidget = a7;
    v17->_allowsSmartRotate = a8;
  }

  return v17;
}

- (ATXWidgetStack)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  ATXWidgetStack *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x23B836ABC]();
  v7 = objc_alloc(MEMORY[0x24BDBCF20]);
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("widgets"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("topWidgetIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ATXWidgetStack initWithIdentifier:widgets:topWidgetIdentifier:family:allowsNewWidget:allowsSmartRotate:](self, "initWithIdentifier:widgets:topWidgetIdentifier:family:allowsNewWidget:allowsSmartRotate:", v5, v10, v11, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("family")), objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsNewWidget")), objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsSmartRotate")));

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ATXWidgetStack identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[ATXWidgetStack widgets](self, "widgets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("widgets"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[ATXWidgetStack family](self, "family"), CFSTR("family"));
  -[ATXWidgetStack topWidgetIdentifier](self, "topWidgetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("topWidgetIdentifier"));

  objc_msgSend(v7, "encodeBool:forKey:", -[ATXWidgetStack allowsNewWidget](self, "allowsNewWidget"), CFSTR("allowsNewWidget"));
  objc_msgSend(v7, "encodeBool:forKey:", -[ATXWidgetStack allowsSmartRotate](self, "allowsSmartRotate"), CFSTR("allowsSmartRotate"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  ATXWidgetStack *v4;
  ATXWidgetStack *v5;
  BOOL v6;

  v4 = (ATXWidgetStack *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXWidgetStack isEqualToATXWidgetStack:](self, "isEqualToATXWidgetStack:", v5);

  return v6;
}

- (BOOL)isEqualToATXWidgetStack:(id)a3
{
  id *v4;
  NSString *identifier;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSArray *widgets;
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  char v14;
  NSString *topWidgetIdentifier;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  char v19;
  BOOL v20;

  v4 = (id *)a3;
  identifier = self->_identifier;
  v6 = (NSString *)v4[2];
  if (identifier == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = identifier;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
LABEL_16:
      v20 = 0;
      goto LABEL_17;
    }
  }
  widgets = self->_widgets;
  v11 = (NSArray *)v4[3];
  if (widgets == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = widgets;
    v14 = -[NSArray isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_16;
  }
  topWidgetIdentifier = self->_topWidgetIdentifier;
  v16 = (NSString *)v4[5];
  if (topWidgetIdentifier == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = topWidgetIdentifier;
    v19 = -[NSString isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_16;
  }
  if ((id)self->_family != v4[4] || self->_allowsNewWidget != *((unsigned __int8 *)v4 + 8))
    goto LABEL_16;
  v20 = self->_allowsSmartRotate == *((unsigned __int8 *)v4 + 9);
LABEL_17:

  return v20;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;

  -[ATXWidgetStack identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[ATXWidgetStack widgets](self, "widgets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  -[ATXWidgetStack topWidgetIdentifier](self, "topWidgetIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") - v6 + 32 * v6;

  v9 = 31 * (-[ATXWidgetStack family](self, "family") - v8 + 32 * v8);
  v10 = 31 * (v9 + -[ATXWidgetStack allowsNewWidget](self, "allowsNewWidget"));
  return v10 + -[ATXWidgetStack allowsSmartRotate](self, "allowsSmartRotate");
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[ATXWidgetStack identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXWidgetStack widgets](self, "widgets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXWidgetStack topWidgetIdentifier](self, "topWidgetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXWidgetStack family](self, "family");
  NSStringFromWidgetFamily();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ATXWidgetStack allowsNewWidget](self, "allowsNewWidget"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[ATXWidgetStack allowsSmartRotate](self, "allowsSmartRotate"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<ATXWidgetStack: (identifier: %@, widgets: %@, topWidgetIdentifier: %@, family: %@, allowsNewWidget: %@, allowsSmartRotate: %@)>"), v4, v5, v6, v7, v8, v9);

  return v10;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[7];

  v14[6] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("identifier");
  -[ATXWidgetStack identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = CFSTR("widgets");
  -[ATXWidgetStack widgets](self, "widgets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  v13[2] = CFSTR("topWidgetIdentifier");
  -[ATXWidgetStack topWidgetIdentifier](self, "topWidgetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v7;
  v13[3] = CFSTR("family");
  -[ATXWidgetStack family](self, "family");
  NSStringFromWidgetFamily();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v8;
  v13[4] = CFSTR("allowsNewWidget");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ATXWidgetStack allowsNewWidget](self, "allowsNewWidget"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v9;
  v13[5] = CFSTR("allowsSmartRotate");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ATXWidgetStack allowsSmartRotate](self, "allowsSmartRotate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  return (NSDictionary *)v11;
}

uint64_t __42__ATXWidgetStack_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)widgets
{
  return self->_widgets;
}

- (int64_t)family
{
  return self->_family;
}

- (BOOL)allowsNewWidget
{
  return self->_allowsNewWidget;
}

- (BOOL)allowsSmartRotate
{
  return self->_allowsSmartRotate;
}

- (NSString)topWidgetIdentifier
{
  return self->_topWidgetIdentifier;
}

- (void)setTopWidgetIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setDictionaryRepresentation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
  objc_storeStrong((id *)&self->_topWidgetIdentifier, 0);
  objc_storeStrong((id *)&self->_widgets, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
