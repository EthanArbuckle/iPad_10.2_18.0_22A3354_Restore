@implementation _EDPartitionedObjectIDs

- (NSDictionary)threadObjectIDsByScope
{
  return self->_threadObjectIDsByScope;
}

- (_EDPartitionedObjectIDs)initWithMessageObjectIDs:(id)a3 threadObjectIDsByScope:(id)a4
{
  id v7;
  id v8;
  _EDPartitionedObjectIDs *v9;
  _EDPartitionedObjectIDs *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_EDPartitionedObjectIDs;
  v9 = -[_EDPartitionedObjectIDs init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageObjectIDs, a3);
    objc_storeStrong((id *)&v10->_threadObjectIDsByScope, a4);
  }

  return v10;
}

- (NSArray)messageObjectIDs
{
  return self->_messageObjectIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadObjectIDsByScope, 0);
  objc_storeStrong((id *)&self->_messageObjectIDs, 0);
}

@end
