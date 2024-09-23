@implementation ARKeyframeList

- (void)setKeyframeList:(CV3DReconKeyframeList *)a3 updatedAnchors:(id)a4 removedAnchors:(id)a5 timestamp:(double)a6
{
  id v10;
  id v11;

  v11 = a4;
  v10 = a5;
  if (self->_keyframeList)
    CV3DReconKeyframeListRelease();
  self->_timestamp = a6;
  self->_keyframeList = a3;
  -[ARKeyframeList setUpdatedAnchors:](self, "setUpdatedAnchors:", v11);
  -[ARKeyframeList setRemovedAnchors:](self, "setRemovedAnchors:", v10);
  if (self->_keyframeList)
    CV3DReconKeyframeListRetain();

}

- (void)dealloc
{
  objc_super v3;

  CV3DReconKeyframeListRelease();
  v3.receiver = self;
  v3.super_class = (Class)ARKeyframeList;
  -[ARKeyframeList dealloc](&v3, sel_dealloc);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (CV3DReconKeyframeList)keyframeList
{
  return self->_keyframeList;
}

- (NSSet)updatedAnchors
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUpdatedAnchors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSSet)removedAnchors
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRemovedAnchors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedAnchors, 0);
  objc_storeStrong((id *)&self->_updatedAnchors, 0);
}

@end
