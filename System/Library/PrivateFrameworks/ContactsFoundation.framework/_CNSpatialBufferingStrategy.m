@implementation _CNSpatialBufferingStrategy

- (_CNSpatialBufferingStrategy)initWithCapacity:(unint64_t)a3
{
  _CNSpatialBufferingStrategy *v4;
  _CNSpatialBufferingStrategy *v5;
  _CNSpatialBufferingStrategy *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_CNSpatialBufferingStrategy;
  v4 = -[_CNSpatialBufferingStrategy init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_capacity = a3;
    v6 = v4;
  }

  return v5;
}

- (void)buffer:(id)a3 didReceiveResults:(id)a4 forObserver:(id)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a5;
  if (objc_msgSend(a4, "count") >= self->_capacity)
    objc_msgSend(v9, "sendBufferedResultsToObserver:", v8);

}

@end
