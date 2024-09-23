@implementation FigCaptureFlatPlistEnumerator

- (id)nextObject
{
  unint64_t index;
  const $4FA865112F5229015B8A293C0B690A6B *bplist;
  unint64_t offset;
  unint64_t OffsetForObjectAtIndexInObject;

  index = self->_index;
  if (index >= self->_count)
    return 0;
  bplist = self->_bplist;
  offset = self->_offset;
  self->_index = index + 1;
  OffsetForObjectAtIndexInObject = FigCaptureBinaryPlistGetOffsetForObjectAtIndexInObject((uint64_t)bplist, offset, index);
  return -[FigCaptureFlatPlist objectAtOffset:](&self->_flatPlist->super.isa, OffsetForObjectAtIndexInObject);
}

- (FigCaptureFlatPlistEnumerator)initWithFlatPlist:(id)a3 offset:(unint64_t)a4 count:(unint64_t)a5
{
  FigCaptureFlatPlistEnumerator *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FigCaptureFlatPlistEnumerator;
  v8 = -[FigCaptureFlatPlistEnumerator init](&v10, sel_init);
  if (v8)
  {
    v8->_flatPlist = (FigCaptureFlatPlist *)a3;
    v8->_bplist = (const $4FA865112F5229015B8A293C0B690A6B *)objc_msgSend(a3, "bplist");
    v8->_offset = a4;
    v8->_count = a5;
    v8->_index = 0;
  }
  return v8;
}

- (id)allObjects
{
  unint64_t count;
  unint64_t index;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t OffsetForObjectAtIndexInObject;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  count = self->_count;
  index = self->_index;
  v5 = (char *)v10 - ((8 * (count - index) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = count - index;
  if (count != index)
  {
    v7 = 0;
    do
    {
      OffsetForObjectAtIndexInObject = FigCaptureBinaryPlistGetOffsetForObjectAtIndexInObject((uint64_t)self->_bplist, self->_offset, v7 + self->_index);
      *(_QWORD *)&v5[8 * v7++] = -[FigCaptureFlatPlist objectAtOffset:](&self->_flatPlist->super.isa, OffsetForObjectAtIndexInObject);
    }
    while (v6 != v7);
    count = self->_count;
  }
  self->_index = count;
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, v6);
}

@end
