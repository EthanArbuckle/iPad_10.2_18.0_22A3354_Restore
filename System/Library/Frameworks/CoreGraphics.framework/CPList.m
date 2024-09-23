@implementation CPList

- (CPList)init
{
  CPList *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPList;
  v2 = -[CPList init](&v4, sel_init);
  if (v2)
    v2->items = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  return v2;
}

- (void)dispose
{
  __CFArray *items;

  items = self->items;
  if (items)
  {
    CFRelease(items);
    self->items = 0;
  }
}

- (void)finalize
{
  objc_super v3;

  -[CPList dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)CPList;
  -[CPList finalize](&v3, sel_finalize);
}

- (void)dealloc
{
  objc_super v3;

  -[CPList dispose](self, "dispose");

  v3.receiver = self;
  v3.super_class = (Class)CPList;
  -[CPList dealloc](&v3, sel_dealloc);
}

- (unsigned)itemCount
{
  return CFArrayGetCount(self->items);
}

- (id)itemAtIndex:(unsigned int)a3
{
  return (id)CFArrayGetValueAtIndex(self->items, a3);
}

- (void)addItem:(id)a3
{
  CFArrayAppendValue(self->items, a3);
  objc_msgSend(a3, "setList:", self);
}

- (BOOL)containsParagraph:(id)a3
{
  uint64_t v4;
  void *v5;
  CPList *v6;
  uint64_t v7;
  BOOL v8;

  v4 = objc_msgSend(a3, "listItem");
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      v6 = (CPList *)objc_msgSend(v5, "list");
      LOBYTE(v4) = v6 == self;
      if (v6 == self)
        break;
      v7 = -[CPList parentItem](v6, "parentItem");
      LOBYTE(v4) = 0;
      if (!v7)
        break;
      v8 = v7 == (_QWORD)v5;
      v5 = (void *)v7;
    }
    while (!v8);
  }
  return v4;
}

- (BOOL)isMultilevel
{
  return 0;
}

- (CGRect)spacer
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->spacer.origin.x;
  y = self->spacer.origin.y;
  width = self->spacer.size.width;
  height = self->spacer.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSpacer:(CGRect)a3
{
  self->spacer = a3;
}

- (int)type
{
  return self->type;
}

- (void)setType:(int)a3
{
  self->type = a3;
}

- (unsigned)ordinalPrefixLength
{
  return self->ordinalPrefixLength;
}

- (void)setOrdinalPrefixLength:(unsigned int)a3
{
  self->ordinalPrefixLength = a3;
}

- (unsigned)ordinalSuffixLength
{
  return self->ordinalSuffixLength;
}

- (void)setOrdinalSuffixLength:(unsigned int)a3
{
  self->ordinalSuffixLength = a3;
}

- (CPParagraphListItem)parentItem
{
  return self->parentItem;
}

- (void)setParentItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

@end
