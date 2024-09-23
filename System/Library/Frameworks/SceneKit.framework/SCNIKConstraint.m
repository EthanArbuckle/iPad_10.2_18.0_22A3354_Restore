@implementation SCNIKConstraint

- (SCNIKConstraint)init
{
  SCNIKConstraint *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCNIKConstraint;
  v2 = -[SCNConstraint init](&v4, sel_init);
  if (v2)
  {
    v2->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateIK();
    v2->_jointsPerNode = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_chainRootNode = 0;

  v3.receiver = self;
  v3.super_class = (Class)SCNIKConstraint;
  -[SCNConstraint dealloc](&v3, sel_dealloc);
}

+ (SCNIKConstraint)inverseKinematicsConstraintWithChainRootNode:(SCNNode *)chainRootNode
{
  return (SCNIKConstraint *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithChainRootNode:", chainRootNode);
}

- (SCNIKConstraint)initWithChainRootNode:(SCNNode *)chainRootNode
{
  SCNIKConstraint *v4;
  SCNIKConstraint *v5;

  v4 = -[SCNIKConstraint init](self, "init");
  v5 = v4;
  if (v4)
    -[SCNIKConstraint setChainRootNode:](v4, "setChainRootNode:", chainRootNode);
  return v5;
}

- (SCNNode)chainRootNode
{
  return self->_chainRootNode;
}

- (void)setChainRootNode:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_chainRootNode != a3)
  {
    self->_chainRootNode = (SCNNode *)a3;
    v5 = -[SCNConstraint sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __36__SCNIKConstraint_setChainRootNode___block_invoke;
    v6[3] = &unk_1EA59F740;
    v6[4] = self;
    v6[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

void __36__SCNIKConstraint_setChainRootNode___block_invoke(uint64_t a1)
{
  C3DConstraintIKSetChainRoot(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), objc_msgSend(*(id *)(a1 + 40), "nodeRef"));
}

- (SCNVector3)targetPosition
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->_ikTarget.x;
  y = self->_ikTarget.y;
  z = self->_ikTarget.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTargetPosition:(SCNVector3)targetPosition
{
  float z;
  float y;
  float x;
  __C3DScene *v7;
  _QWORD v8[5];
  float v9;
  float v10;
  float v11;

  z = targetPosition.z;
  y = targetPosition.y;
  x = targetPosition.x;
  self->_ikTarget = targetPosition;
  v7 = -[SCNConstraint sceneRef](self, "sceneRef");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__SCNIKConstraint_setTargetPosition___block_invoke;
  v8[3] = &unk_1EA59E4C8;
  v8[4] = self;
  v9 = x;
  v10 = y;
  v11 = z;
  +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v7, self, CFSTR("targetPosition"), v8);
}

void __37__SCNIKConstraint_setTargetPosition___block_invoke(uint64_t a1, __n128 a2)
{
  a2.n128_u64[0] = *(_QWORD *)(a1 + 40);
  a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
  C3DConstraintIKSetTarget(*(__n128 **)(*(_QWORD *)(a1 + 32) + 8), a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[SCNIKConstraint targetPosition](self, "targetPosition");
  objc_msgSend(v4, "setTargetPosition:");
  objc_msgSend(v4, "setChainRootNode:", -[SCNIKConstraint chainRootNode](self, "chainRootNode"));
  -[SCNConstraint copyTo:](self, "copyTo:", v4);
  return v4;
}

- (id)jointForNode:(id)a3
{
  uint64_t v5;
  SCNIKJoint *v6;

  v5 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:");
  v6 = (SCNIKJoint *)-[NSMutableDictionary objectForKey:](self->_jointsPerNode, "objectForKey:", v5);
  if (!v6)
  {
    v6 = objc_alloc_init(SCNIKJoint);
    -[SCNIKJoint setJoint:](v6, "setJoint:", a3);
    -[SCNIKJoint setMaxAllowedRotationAngle:](v6, "setMaxAllowedRotationAngle:", 180.0);
    -[NSMutableDictionary setObject:forKey:](self->_jointsPerNode, "setObject:forKey:", v6, v5);
  }
  return v6;
}

- (void)setMaxAllowedRotationAngle:(CGFloat)angle forJoint:(SCNNode *)node
{
  __C3DScene *v7;
  _QWORD v8[7];

  objc_msgSend(-[SCNIKConstraint jointForNode:](self, "jointForNode:"), "setMaxAllowedRotationAngle:", angle);
  v7 = -[SCNConstraint sceneRef](self, "sceneRef");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__SCNIKConstraint_setMaxAllowedRotationAngle_forJoint___block_invoke;
  v8[3] = &unk_1EA59E2B0;
  *(CGFloat *)&v8[6] = angle;
  v8[4] = self;
  v8[5] = node;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v8);
}

void __55__SCNIKConstraint_setMaxAllowedRotationAngle_forJoint___block_invoke(uint64_t a1)
{
  float v1;

  v1 = *(double *)(a1 + 48) / 180.0 * 3.14159265;
  C3DConstraintIKSetMaxRotationForNode(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), (void *)objc_msgSend(*(id *)(a1 + 40), "nodeRef"), v1);
}

- (CGFloat)maxAllowedRotationAngleForJoint:(SCNNode *)node
{
  id v3;
  CGFloat result;

  v3 = -[SCNIKConstraint jointForNode:](self, "jointForNode:", node);
  if (!v3)
    return 180.0;
  objc_msgSend(v3, "maxAllowedRotationAngle");
  return result;
}

- (void)_didDecodeSCNIKConstraint:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  float v7;

  v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("node%d"), 0));
  if (v5)
  {
    v6 = v5;
    do
    {
      objc_msgSend(a3, "decodeFloatForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("angle%d"), 0));
      -[SCNIKConstraint setMaxAllowedRotationAngle:forJoint:](self, "setMaxAllowedRotationAngle:forJoint:", v6, v7);
      v6 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("node%d"), 0));
    }
    while (v6);
  }
}

- (void)_customEncodingOfSCNIKConstraint:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  float v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)-[NSMutableDictionary allKeys](self->_jointsPerNode, "allKeys");
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v10 = (void *)-[NSMutableDictionary objectForKey:](self->_jointsPerNode, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9));
        objc_msgSend(v10, "maxAllowedRotationAngle");
        v12 = v11;
        v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("angle%d"), v7 + v9);
        *(float *)&v14 = v12;
        objc_msgSend(a3, "encodeFloat:forKey:", v13, v14);
        v15 = objc_msgSend(v10, "joint");
        objc_msgSend(a3, "encodeObject:forKey:", v15, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("node%d"), v7 + v9++));
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v7 = (v7 + v9);
    }
    while (v6);
  }
  SCNEncodeVector3(a3, (uint64_t)CFSTR("ikTarget"), self->_ikTarget.x, self->_ikTarget.y, self->_ikTarget.z);
}

- (void)_customDecodingOfSCNIKConstraint:(id)a3
{
  double v5;

  self->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateIK();
  *(float *)&v5 = SCNDecodeVector3(a3, (uint64_t)CFSTR("ikTarget"));
  -[SCNIKConstraint setTargetPosition:](self, "setTargetPosition:", v5);
  -[SCNConstraint finalizeDecodeConstraint:](self, "finalizeDecodeConstraint:", a3);
}

- (void)encodeWithCoder:(id)a3
{
  SCNNode *chainRootNode;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNIKConstraint;
  -[SCNConstraint encodeWithCoder:](&v6, sel_encodeWithCoder_);
  -[SCNIKConstraint _customEncodingOfSCNIKConstraint:](self, "_customEncodingOfSCNIKConstraint:", a3);
  chainRootNode = self->_chainRootNode;
  if (chainRootNode)
    objc_msgSend(a3, "encodeObject:forKey:", chainRootNode, CFSTR("chainRootNode"));
}

- (SCNIKConstraint)initWithCoder:(id)a3
{
  SCNIKConstraint *v4;
  _BOOL8 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNIKConstraint;
  v4 = -[SCNConstraint initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    -[SCNIKConstraint _customDecodingOfSCNIKConstraint:](v4, "_customDecodingOfSCNIKConstraint:", a3);
    -[SCNIKConstraint setChainRootNode:](v4, "setChainRootNode:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("chainRootNode")));
    -[SCNIKConstraint _didDecodeSCNIKConstraint:](v4, "_didDecodeSCNIKConstraint:", a3);
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
