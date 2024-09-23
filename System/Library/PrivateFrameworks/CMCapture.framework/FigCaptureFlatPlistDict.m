@implementation FigCaptureFlatPlistDict

- (unint64_t)count
{
  return self->_count;
}

- (id)objectForKey:(id)a3
{
  unint64_t IndexForStringInObject;
  unint64_t OffsetForValueAtIndexInObject;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  IndexForStringInObject = FigCaptureBinaryPlistFindIndexForStringInObject((uint64_t)self->_bplist, self->_offset, (const char *)objc_msgSend(a3, "UTF8String"), objc_msgSend(a3, "length"));
  if ((IndexForStringInObject & 0x8000000000000000) != 0)
    return 0;
  OffsetForValueAtIndexInObject = FigCaptureBinaryPlistGetOffsetForValueAtIndexInObject((uint64_t)self->_bplist, self->_offset, IndexForStringInObject);
  return -[FigCaptureFlatPlist objectAtOffset:](&self->_flatPlist->super.isa, OffsetForValueAtIndexInObject);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureFlatPlistDict;
  -[FigCaptureFlatPlistDict dealloc](&v3, sel_dealloc);
}

- (id)keyEnumerator
{
  return -[FigCaptureFlatPlistEnumerator initWithFlatPlist:offset:count:]([FigCaptureFlatPlistEnumerator alloc], "initWithFlatPlist:offset:count:", self->_flatPlist, self->_offset, self->_count);
}

- (FigCaptureFlatPlistDict)initWithFlatPlist:(id)a3 offset:(unint64_t)a4
{
  FigCaptureFlatPlistDict *v6;
  $4FA865112F5229015B8A293C0B690A6B *v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FigCaptureFlatPlistDict;
  v6 = -[FigCaptureFlatPlistDict init](&v10, sel_init);
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
