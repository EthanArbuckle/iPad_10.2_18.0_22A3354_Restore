@implementation ARMeshList

- (void)setMeshList:(CV3DReconMeshList *)a3 updatedAnchors:(id)a4 removedAnchors:(id)a5 timestamp:(double)a6
{
  id v10;
  id v11;

  v11 = a4;
  v10 = a5;
  if (self->_meshList)
    CV3DReconMeshListRelease();
  self->_timestamp = a6;
  self->_meshList = a3;
  -[ARMeshList setUpdatedAnchors:](self, "setUpdatedAnchors:", v11);
  -[ARMeshList setRemovedAnchors:](self, "setRemovedAnchors:", v10);
  if (self->_meshList)
    CV3DReconMeshListRetain();

}

- (void)dealloc
{
  objc_super v3;

  CV3DReconMeshListRelease();
  v3.receiver = self;
  v3.super_class = (Class)ARMeshList;
  -[ARMeshList dealloc](&v3, sel_dealloc);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (CV3DReconMeshList)meshList
{
  return self->_meshList;
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
