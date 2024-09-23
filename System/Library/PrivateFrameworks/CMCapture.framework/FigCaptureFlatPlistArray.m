@implementation FigCaptureFlatPlistArray

- (id)objectAtIndex:(unint64_t)a3
{
  unint64_t OffsetForObjectAtIndexInObject;

  OffsetForObjectAtIndexInObject = FigCaptureBinaryPlistGetOffsetForObjectAtIndexInObject((uint64_t)self->_bplist, self->_offset, a3);
  return -[FigCaptureFlatPlist objectAtOffset:](&self->_flatPlist->super.isa, OffsetForObjectAtIndexInObject);
}

- (unint64_t)count
{
  return self->_count;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureFlatPlistArray;
  -[FigCaptureFlatPlistArray dealloc](&v3, sel_dealloc);
}

- (FigCaptureFlatPlistArray)initWithFlatPlist:(id)a3 offset:(unint64_t)a4
{
  FigCaptureFlatPlistArray *v6;
  $4FA865112F5229015B8A293C0B690A6B *v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FigCaptureFlatPlistArray;
  v6 = -[FigCaptureFlatPlistArray init](&v10, sel_init);
  if (v6)
  {
    v6->_flatPlist = (FigCaptureFlatPlist *)a3;
    v7 = ($4FA865112F5229015B8A293C0B690A6B *)objc_msgSend(a3, "bplist");
    v6->_bplist = v7;
    v6->_offset = a4;
    FigCaptureBinaryPlistGetDataAndCountForObjectAtOffset(v7, a4);
    v6->_count = v8;
  }
  return v6;
}

@end
