@implementation _PFCKInsertedMetadataLink

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PFCKInsertedMetadataLink;
  -[_PFCKInsertedMetadataLink dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;

  v3 = (void *)-[NSCKRecordMetadata createRecordID](self->_recordMetadata);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  v6 = (void *)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p> %@ -> %@"), NSStringFromClass(v5), self, -[NSManagedObject objectID](self->_insertedObject, "objectID"), v3);

  return v6;
}

@end
