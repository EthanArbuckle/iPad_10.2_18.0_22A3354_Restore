@implementation FINodeIterator

- (id)next
{
  void *v2;
  OpaqueNodeRef *v4;

  v4 = NodeIteratorNext((TNodeIterator *)self->_iterator);
  +[FINode nodeFromNodeRef:](FINode, "nodeFromNodeRef:", v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TRef<OpaqueNodeRef *,TRetainReleasePolicy<OpaqueNodeRef *>>::~TRef((const void **)&v4);
  return v2;
}

- (FINodeIterator)initWithIterator:(OpaqueNodeIterator *)a3
{
  FINodeIterator *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FINodeIterator;
  result = -[FINodeIterator init](&v5, sel_init);
  result->_iterator = a3;
  return result;
}

- (BOOL)fullyPopulated
{
  return NodeIteratorFullyPopulated((uint64_t)self->_iterator);
}

- (id)first
{
  void *v2;
  TNodeIterator *v4;

  v4 = NodeIteratorFirst((TNodeIterator *)self->_iterator);
  +[FINode nodeFromNodeRef:](FINode, "nodeFromNodeRef:", v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TRef<OpaqueNodeRef *,TRetainReleasePolicy<OpaqueNodeRef *>>::~TRef((const void **)&v4);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  NodeDisposeIterator((uint64_t)self->_iterator);
  v3.receiver = self;
  v3.super_class = (Class)FINodeIterator;
  -[FINodeIterator dealloc](&v3, sel_dealloc);
}

- (unint64_t)estimatedSize
{
  return NodeIteratorSize((uint64_t)self->_iterator);
}

@end
