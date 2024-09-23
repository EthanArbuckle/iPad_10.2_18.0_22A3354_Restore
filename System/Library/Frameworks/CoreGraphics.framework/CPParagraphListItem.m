@implementation CPParagraphListItem

- (CPParagraphListItem)init
{
  CPParagraphListItem *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPParagraphListItem;
  v2 = -[CPParagraphListItem init](&v4, sel_init);
  if (v2)
    v2->paragraphs = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  return v2;
}

- (void)dispose
{
  __CFArray *paragraphs;

  paragraphs = self->paragraphs;
  if (paragraphs)
  {
    CFRelease(paragraphs);
    self->paragraphs = 0;
  }
}

- (void)finalize
{
  objc_super v3;

  -[CPParagraphListItem dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)CPParagraphListItem;
  -[CPParagraphListItem finalize](&v3, sel_finalize);
}

- (void)dealloc
{
  objc_super v3;

  -[CPParagraphListItem dispose](self, "dispose");

  v3.receiver = self;
  v3.super_class = (Class)CPParagraphListItem;
  -[CPParagraphListItem dealloc](&v3, sel_dealloc);
}

- (unsigned)paragraphCount
{
  return CFArrayGetCount(self->paragraphs);
}

- (id)paragraphAtIndex:(unsigned int)a3
{
  return (id)CFArrayGetValueAtIndex(self->paragraphs, a3);
}

- (void)addParagraph:(id)a3
{
  CPParagraphListItem *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CPParagraphListItem *v9;
  BOOL v10;

  CFArrayAppendValue(self->paragraphs, a3);
  v5 = (CPParagraphListItem *)objc_msgSend(a3, "listItem");
  if (v5)
  {
    v6 = v5;
    if (v5 != self)
    {
      do
      {
        v7 = (void *)objc_msgSend(v6, "list");
        v8 = objc_msgSend(v7, "parentItem");
        if ((void *)v8 == v6)
          v9 = 0;
        else
          v9 = (CPParagraphListItem *)v8;
        if (v9)
          v10 = v9 == self;
        else
          v10 = 1;
        v6 = (void *)v8;
      }
      while (!v10);
      if (!v9)
        objc_msgSend(v7, "setParentItem:", self);
    }
  }
  else
  {
    objc_msgSend(a3, "setListItem:", self);
  }
}

- (CPList)list
{
  return self->list;
}

- (void)setList:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (int)number
{
  return self->number;
}

- (void)setNumber:(int)a3
{
  self->number = a3;
}

@end
