@implementation MMDocument

- (MMDocument)initWithMarkdown:(id)a3
{
  id v5;
  MMDocument *v6;
  MMDocument *v7;
  uint64_t v8;
  NSMutableArray *elements;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MMDocument;
  v6 = -[MMDocument init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_markdown, a3);
    v8 = objc_opt_new();
    elements = v7->_elements;
    v7->_elements = (NSMutableArray *)v8;

  }
  return v7;
}

- (void)addElement:(id)a3
{
  id v4;

  v4 = a3;
  -[MMDocument willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("elements"));
  -[NSMutableArray addObject:](self->_elements, "addObject:", v4);

  -[MMDocument didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("elements"));
}

- (NSString)markdown
{
  return self->_markdown;
}

- (NSArray)elements
{
  return &self->_elements->super;
}

- (void)setElements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markdown, 0);
  objc_storeStrong((id *)&self->_elements, 0);
}

+ (id)documentWithMarkdown:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMarkdown:", v3);

  return v4;
}

@end
