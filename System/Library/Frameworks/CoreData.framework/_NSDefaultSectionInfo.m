@implementation _NSDefaultSectionInfo

- (NSString)name
{
  return self->_name;
}

- (uint64_t)sectionNumber
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (result)
  {
    v1 = (void *)result;
    v2 = *(_QWORD *)(result + 8);
    if (!v2
      || (v3 = *(void **)(v2 + 104)) == 0
      || (result = objc_msgSend(v3, "indexOfObject:", v1), result == 0x7FFFFFFFFFFFFFFFLL))
    {
      v4 = objc_msgSend(v1, "name");
      _NSCoreDataLog(1, (uint64_t)CFSTR("(NSFetchedResultsController) section '%@' not found in controller"), v5, v6, v7, v8, v9, v10, v4);
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (unint64_t)numberOfObjects
{
  return self->_numberOfObjects;
}

- (NSArray)objects
{
  NSArray *result;
  NSArray *sectionObjects;
  NSArray *v5;
  void *v6;
  void *v7;
  unint64_t sectionOffset;
  unint64_t numberOfObjects;
  uint64_t v10;
  NSArray *v11;
  NSArray *v12;

  result = (NSArray *)self->_controller;
  if (result)
  {
    sectionObjects = self->_sectionObjects;
    if (sectionObjects)
    {
      v5 = sectionObjects;
      return v5;
    }
    v6 = (void *)-[NSArray _fetchedObjects](result, "_fetchedObjects");
    v7 = v6;
    sectionOffset = self->_sectionOffset;
    if (sectionOffset)
    {
      numberOfObjects = self->_numberOfObjects;
    }
    else
    {
      v10 = objc_msgSend(v6, "count");
      numberOfObjects = self->_numberOfObjects;
      if (v10 == numberOfObjects)
      {
        v11 = -[NSFetchedResultsController fetchedObjects](self->_controller, "fetchedObjects");
LABEL_11:
        v12 = v11;
        self->_sectionObjects = v12;
        v5 = v12;
        return v5;
      }
      sectionOffset = self->_sectionOffset;
    }
    v11 = (NSArray *)objc_msgSend(v7, "subarrayWithRange:", sectionOffset, numberOfObjects);
    goto LABEL_11;
  }
  return result;
}

- (_QWORD)initWithController:(void *)a3 name:(void *)a4 sectionId:(void *)a5 indexTitle:(uint64_t)a6 sectionOffset:
{
  _QWORD *v11;
  _QWORD *v12;
  objc_super v14;

  if (!a1)
    return 0;
  v14.receiver = a1;
  v14.super_class = (Class)_NSDefaultSectionInfo;
  v11 = objc_msgSendSuper2(&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11[1] = a2;
    v11[2] = objc_msgSend(a3, "copy");
    v12[3] = objc_msgSend(a5, "copy");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v12[8] = a4;
    v12[7] = 0;
    v12[4] = a6;
    v12[5] = 0;
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSDefaultSectionInfo;
  -[_NSDefaultSectionInfo dealloc](&v3, sel_dealloc);
}

- (id)sectionId
{
  id result;

  if (!self->_controller)
    return 0;
  result = self->_sectionId;
  if (!result)
  {
    result = (id)objc_msgSend(-[NSArray firstObject](-[_NSDefaultSectionInfo objects](self, "objects"), "firstObject"), "valueForKeyPath:", -[NSFetchedResultsController sectionNameKeyPath](self->_controller, "sectionNameKeyPath"));
    self->_sectionId = result;
  }
  return result;
}

- (NSString)indexTitle
{
  return self->_indexTitle;
}

@end
