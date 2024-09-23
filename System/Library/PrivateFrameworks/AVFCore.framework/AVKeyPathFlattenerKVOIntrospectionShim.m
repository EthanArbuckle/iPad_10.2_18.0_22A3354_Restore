@implementation AVKeyPathFlattenerKVOIntrospectionShim

- (AVKeyPathFlattenerKVOIntrospectionShim)initWithObservedObject:(id)a3 realNotifier:(id)a4
{
  AVKeyPathFlattenerKVOIntrospectionShim *v6;
  AVKeyPathFlattenerKVOIntrospectionShim *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVKeyPathFlattenerKVOIntrospectionShim;
  v6 = -[AVKeyPathFlattenerKVOIntrospectionShim init](&v9, sel_init);
  if (v6)
  {
    v6->_observedObject = a3;
    v6->_realNotifier = (AVKVOIntrospection *)a4;
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVKeyPathFlattenerKVOIntrospectionShim;
  -[AVKeyPathFlattenerKVOIntrospectionShim dealloc](&v3, sel_dealloc);
}

- (NSObject)observedObject
{
  return self->_observedObject;
}

- (void)cancelCallbacks
{
  -[AVKVOIntrospection cancelCallbacks](self->_realNotifier, "cancelCallbacks");
}

@end
