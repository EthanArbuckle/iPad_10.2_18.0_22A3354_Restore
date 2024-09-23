@implementation SCNPhysicsContact

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNPhysicsContact;
  -[SCNPhysicsContact dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  v5 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), NSStringFromClass(v4), self);
  objc_msgSend(v5, "appendFormat:", CFSTR(" '%@'"), self->_nodeA);
  objc_msgSend(v5, "appendFormat:", CFSTR(" '%@'"), self->_nodeB);
  objc_msgSend(v5, "appendFormat:", CFSTR(" point(%f %f %f)"), self->_contactPoint.x, self->_contactPoint.y, self->_contactPoint.z);
  objc_msgSend(v5, "appendFormat:", CFSTR(" normal(%f %f %f)"), self->_contactNormal.x, self->_contactNormal.y, self->_contactNormal.z);
  objc_msgSend(v5, "appendFormat:", CFSTR(" impulse(%f)"), *(_QWORD *)&self->_collisionImpulse);
  objc_msgSend(v5, "appendFormat:", CFSTR(" distance:%f"), *(_QWORD *)&self->_distance);
  objc_msgSend(v5, "appendString:", CFSTR(">"));
  return v5;
}

- (void)_fillNodeA:(id)a3 nodeB:(id)a4 contactPoint:(SCNVector3)a5 collisionImpulse:(SCNVector3)a6 distance:(double)a7 hitFraction:(double)a8
{
  float z;
  float y;
  float x;
  float v13;
  float v14;
  float v15;
  SCNNode *nodeA;
  SCNNode *v20;
  SCNNode *nodeB;
  SCNNode *v22;

  z = a6.z;
  y = a6.y;
  x = a6.x;
  v13 = a5.z;
  v14 = a5.y;
  v15 = a5.x;
  nodeA = self->_nodeA;
  if (nodeA != a3)
  {
    if (nodeA)
    {
      CFRelease(nodeA);
      self->_nodeA = 0;
    }
    if (a3)
      v20 = (SCNNode *)CFRetain(a3);
    else
      v20 = 0;
    self->_nodeA = v20;
  }
  nodeB = self->_nodeB;
  if (nodeB != a4)
  {
    if (nodeB)
    {
      CFRelease(nodeB);
      self->_nodeB = 0;
    }
    if (a4)
      v22 = (SCNNode *)CFRetain(a4);
    else
      v22 = 0;
    self->_nodeB = v22;
  }
  self->_contactPoint.x = v15;
  self->_contactPoint.y = v14;
  self->_contactPoint.z = v13;
  self->_contactNormal.x = x;
  self->_contactNormal.y = y;
  self->_contactNormal.z = z;
  self->_collisionImpulse = 0.0;
  self->_distance = a7;
  self->_fraction = a8;
}

- (void)_fillNodeA:(id)a3 nodeB:(id)a4
{
  SCNNode *nodeA;
  SCNNode *v8;
  SCNNode *nodeB;
  SCNNode *v10;

  nodeA = self->_nodeA;
  if (nodeA != a3)
  {
    if (nodeA)
    {
      CFRelease(nodeA);
      self->_nodeA = 0;
    }
    if (a3)
      v8 = (SCNNode *)CFRetain(a3);
    else
      v8 = 0;
    self->_nodeA = v8;
  }
  nodeB = self->_nodeB;
  if (nodeB != a4)
  {
    if (nodeB)
    {
      CFRelease(nodeB);
      self->_nodeB = 0;
    }
    if (a4)
      v10 = (SCNNode *)CFRetain(a4);
    else
      v10 = 0;
    self->_nodeB = v10;
  }
}

- (void)_updateWithManifold:(const btPersistentManifold *)a3 index:(int64_t)a4 point:(const btManifoldPoint *)a5
{
  btCollisionObject *var3;
  uint64_t v9;
  id *ObjCWrapper;
  uint64_t v11;
  uint64_t v12;
  id *v13;
  SCNNode *nodeA;
  SCNNode *v15;
  SCNNode *nodeB;
  SCNNode *v17;
  float v18;
  float v19;
  double v20;

  var3 = a3->var3;
  if (var3 && (*((_BYTE *)var3 + 264) & 2) != 0 && (v9 = *((_QWORD *)var3 + 67)) != 0)
    ObjCWrapper = C3DEntityGetObjCWrapper(*(id **)(v9 + 72));
  else
    ObjCWrapper = 0;
  v11 = *(_QWORD *)&a3->var4;
  if (v11 && (*(_BYTE *)(v11 + 264) & 2) != 0 && (v12 = *(_QWORD *)(v11 + 536)) != 0)
    v13 = C3DEntityGetObjCWrapper(*(id **)(v12 + 72));
  else
    v13 = 0;
  nodeA = self->_nodeA;
  if (nodeA != (SCNNode *)ObjCWrapper)
  {
    if (nodeA)
    {
      CFRelease(nodeA);
      self->_nodeA = 0;
    }
    if (ObjCWrapper)
      v15 = (SCNNode *)CFRetain(ObjCWrapper);
    else
      v15 = 0;
    self->_nodeA = v15;
  }
  nodeB = self->_nodeB;
  if (nodeB != (SCNNode *)v13)
  {
    if (nodeB)
    {
      CFRelease(nodeB);
      self->_nodeB = 0;
    }
    if (v13)
      v17 = (SCNNode *)CFRetain(v13);
    else
      v17 = 0;
    self->_nodeB = v17;
  }
  v18 = a5->var2.var0.var0[2];
  *(_QWORD *)&self->_contactPoint.x = *(_QWORD *)a5->var2.var0.var0;
  self->_contactPoint.z = v18;
  v19 = a5->var4.var0.var0[2];
  *(_QWORD *)&self->_contactNormal.x = *(_QWORD *)a5->var4.var0.var0;
  self->_contactNormal.z = v19;
  v20 = (float)-a5->var5;
  self->_collisionImpulse = a5->var15;
  self->_distance = v20;
}

+ (id)_contactWithManifold:(const btPersistentManifold *)a3 index:(int64_t)a4
{
  void *v4;

  v4 = *(void **)&a3->var1[(int)a4].var14;
  objc_msgSend(v4, "_updateWithManifold:index:point:");
  return v4;
}

- (SCNNode)nodeA
{
  return self->_nodeA;
}

- (SCNNode)nodeB
{
  return self->_nodeB;
}

- (SCNVector3)contactPoint
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_contactPoint.x;
  y = self->_contactPoint.y;
  z = self->_contactPoint.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (SCNVector3)contactNormal
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_contactNormal.x;
  y = self->_contactNormal.y;
  z = self->_contactNormal.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (CGFloat)collisionImpulse
{
  return self->_collisionImpulse;
}

- (CGFloat)penetrationDistance
{
  return self->_distance;
}

- (CGFloat)sweepTestFraction
{
  return self->_fraction;
}

- (void)_prepareUpdate
{
  ++self->_updateCount;
}

- (BOOL)_shouldPostUpdate
{
  int64_t v2;

  v2 = self->_updateCount - 1;
  self->_updateCount = v2;
  return v2 == 0;
}

@end
