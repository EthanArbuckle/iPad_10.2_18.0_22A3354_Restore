@implementation _PFChangeInfo

- (unint64_t)hash
{
  return -[NSManagedObjectID hash](-[NSManagedObject objectID](-[_PFChangeInfo object](self, "object"), "objectID"), "hash");
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[NSManagedObjectID isEqual:](-[NSManagedObject objectID](-[_PFChangeInfo object](self, "object"), "objectID"), "isEqual:", objc_msgSend((id)objc_msgSend(a3, "object"), "objectID"));
  else
    return 0;
}

- (NSManagedObject)object
{
  return self->_object;
}

- (_PFChangeInfo)initWithObject:(id)a3
{
  _PFChangeInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PFChangeInfo;
  v4 = -[_PFChangeInfo init](&v6, sel_init);
  if (v4)
  {
    v4->_object = (NSManagedObject *)a3;
    v4->_changeType = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_startIndexPath = 0;
  self->_finalIndexPath = 0;

  self->_startSectionInfo = 0;
  self->_finalSectionInfo = 0;

  self->_object = 0;
  v3.receiver = self;
  v3.super_class = (Class)_PFChangeInfo;
  -[_PFChangeInfo dealloc](&v3, sel_dealloc);
}

- (id)description
{
  unint64_t v3;
  const __CFString *v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  NSManagedObject *object;
  const __CFString *v9;
  const __CFString *v10;

  v3 = self->_changeType - 1;
  if (v3 > 3)
    v4 = CFSTR("Unset");
  else
    v4 = off_1E1EE1EB0[v3];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  object = self->_object;
  if (self->_startIndexPath)
    v9 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", startIndex: %@"), self->_startIndexPath);
  else
    v9 = &stru_1E1EE23F0;
  if (self->_finalIndexPath)
    v10 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", finalIndex: %@"), self->_finalIndexPath);
  else
    v10 = &stru_1E1EE23F0;
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p> { object: %p, type: %@%@%@ }"), v7, self, object, v4, v9, v10);
}

@end
