@implementation NSURLSessionTaskDependency

- (NSURLSessionTaskDependency)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLSessionTaskDependency;
  return -[NSURLSessionTaskDependency init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLSessionTaskDependency;
  -[NSURLSessionTaskDependency dealloc](&v3, sel_dealloc);
}

- (NSURLSessionTaskDependencyDescription)taskDependencyDescription
{
  return self->_taskDependencyDescription;
}

- (void)setTaskDependencyDescription:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSURLSessionTask)parentTask
{
  return self->_parentTask;
}

- (NSURLSessionTask)mainDocumentTask
{
  return self->_mainDocumentTask;
}

+ (NSURLSessionTaskDependency)taskDependencyWithParentTask:(id)a3 priority:(float)a4 exclusive:(BOOL)a5
{
  NSURLSessionTaskDependency *v8;
  NSURLSessionTaskDependencyDescription *v9;
  objc_super v11;

  v8 = objc_alloc_init(NSURLSessionTaskDependency);
  v8->_parentTask = (NSURLSessionTask *)a3;
  v9 = [NSURLSessionTaskDependencyDescription alloc];
  if (v9)
  {
    v11.receiver = v9;
    v11.super_class = (Class)NSURLSessionTaskDependencyDescription;
    v9 = objc_msgSendSuper2(&v11, sel_init);
    if (v9)
    {
      v9->_priority = a4;
      v9->_exclusive = a5;
    }
  }
  v8->_taskDependencyDescription = v9;
  return v8;
}

+ (NSURLSessionTaskDependency)taskDependencyWithMainDocumentTask:(id)a3
{
  NSURLSessionTaskDependency *v4;

  v4 = objc_alloc_init(NSURLSessionTaskDependency);
  v4->_mainDocumentTask = (NSURLSessionTask *)a3;
  return v4;
}

+ (NSURLSessionTaskDependency)taskDependencyWithMainDocumentTask:(id)a3 taskDependencyDescription:(id)a4
{
  NSURLSessionTaskDependency *v6;

  v6 = objc_alloc_init(NSURLSessionTaskDependency);
  v6->_mainDocumentTask = (NSURLSessionTask *)a3;
  v6->_taskDependencyDescription = (NSURLSessionTaskDependencyDescription *)a4;
  return v6;
}

id ____NSURLSessionTaskDependency_FindParentStreamID_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
  result = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

@end
