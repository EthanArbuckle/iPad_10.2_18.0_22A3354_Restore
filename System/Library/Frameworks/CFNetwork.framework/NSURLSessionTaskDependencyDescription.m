@implementation NSURLSessionTaskDependencyDescription

- (void)dealloc
{
  SEL v3;
  objc_super v4;

  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 16);
    objc_setProperty_nonatomic(self, v3, 0, 24);
  }
  v4.receiver = self;
  v4.super_class = (Class)NSURLSessionTaskDependencyDescription;
  -[NSURLSessionTaskDependencyDescription dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Dependent: %@, Parent: %@, priority: %f, exclusive: %hhd"), self->_dependent, self->_parent, self->_priority, self->_exclusive);
}

- (float)priority
{
  return self->_priority;
}

- (void)setPriority:(float)a3
{
  self->_priority = a3;
}

- (BOOL)exclusive
{
  return self->_exclusive;
}

- (void)setExclusive:(BOOL)a3
{
  self->_exclusive = a3;
}

- (NSString)dependentURLPath
{
  return self->_dependentURLPath;
}

- (NSString)dependentMimeType
{
  return self->_dependentMimeType;
}

- (NSString)parentURLPath
{
  return self->_parentURLPath;
}

- (NSString)parentMimeType
{
  return self->_parentMimeType;
}

+ (id)taskDependencyDescriptionWithURLPath:(id)a3 parentURLPath:(id)a4
{
  return -[NSURLSessionTaskDependencyDescription initWithURLPath:mimeType:parentURLPath:parentMimeType:priority:exclusive:]([NSURLSessionTaskDependencyDescription alloc], a3, 0, a4, 0);
}

+ (id)taskDependencyDescriptionWithURLPath:(id)a3 parentMimeType:(id)a4
{
  return -[NSURLSessionTaskDependencyDescription initWithURLPath:mimeType:parentURLPath:parentMimeType:priority:exclusive:]([NSURLSessionTaskDependencyDescription alloc], a3, 0, 0, a4);
}

+ (id)taskDependencyDescriptionWithMimeType:(id)a3 parentURLPath:(id)a4
{
  return -[NSURLSessionTaskDependencyDescription initWithURLPath:mimeType:parentURLPath:parentMimeType:priority:exclusive:]([NSURLSessionTaskDependencyDescription alloc], 0, a3, a4, 0);
}

+ (id)taskDependencyDescriptionWithMimeType:(id)a3 parentMimeType:(id)a4
{
  return -[NSURLSessionTaskDependencyDescription initWithURLPath:mimeType:parentURLPath:parentMimeType:priority:exclusive:]([NSURLSessionTaskDependencyDescription alloc], 0, a3, 0, a4);
}

+ (id)taskDependencyDescriptionWithParentURLPath:(id)a3
{
  return -[NSURLSessionTaskDependencyDescription initWithURLPath:mimeType:parentURLPath:parentMimeType:priority:exclusive:]([NSURLSessionTaskDependencyDescription alloc], 0, 0, a3, 0);
}

+ (id)taskDependencyDescriptionWithParentMimeType:(id)a3
{
  return -[NSURLSessionTaskDependencyDescription initWithURLPath:mimeType:parentURLPath:parentMimeType:priority:exclusive:]([NSURLSessionTaskDependencyDescription alloc], 0, 0, 0, a3);
}

- (id)initWithURLPath:(void *)a3 mimeType:(void *)a4 parentURLPath:(void *)a5 parentMimeType:priority:exclusive:
{
  id v9;
  id v10;
  SEL v11;
  id v12;
  SEL v13;
  objc_super v15;

  if (!a1)
    return 0;
  v15.receiver = a1;
  v15.super_class = (Class)NSURLSessionTaskDependencyDescription;
  v9 = objc_msgSendSuper2(&v15, sel_init);
  if (v9)
  {
    v10 = -[__NSURLSessionTaskDependencyResourceIdentifier initWitURLPath:mimeType:]([__NSURLSessionTaskDependencyResourceIdentifier alloc], a2, a3);
    objc_setProperty_nonatomic(v9, v11, v10, 16);
    v12 = -[__NSURLSessionTaskDependencyResourceIdentifier initWitURLPath:mimeType:]([__NSURLSessionTaskDependencyResourceIdentifier alloc], a4, a5);
    objc_setProperty_nonatomic(v9, v13, v12, 24);
    *((_DWORD *)v9 + 3) = 1056964608;
    *((_BYTE *)v9 + 8) = 0;
  }
  return v9;
}

@end
