@implementation SCNManipulableItem

- (void)setScreenSize:(double)a3
{
  self->_screenSize = a3;
}

- (double)screenSize
{
  return self->_screenSize;
}

- (void)dealloc
{
  objc_super v3;

  -[SCNManipulableItem setNode:](self, "setNode:", 0);
  -[SCNManipulableItem setComponent:](self, "setComponent:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SCNManipulableItem;
  -[SCNManipulableItem dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  SCNNode *v5;
  unint64_t v6;
  uint64_t v7;
  objc_super v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[SCNManipulableItem node](self, "node");
    if (v5 == (SCNNode *)objc_msgSend(a3, "node")
      && (v6 = -[SCNManipulableItem elementIndex](self, "elementIndex"), v6 == objc_msgSend(a3, "elementIndex")))
    {
      v7 = objc_msgSend(a3, "component");
      return v7 == objc_msgSend(a3, "component");
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SCNManipulableItem;
    return -[SCNManipulableItem isEqual:](&v9, sel_isEqual_, a3);
  }
}

- (unint64_t)hash
{
  return -[SCNNode hash](-[SCNManipulableItem node](self, "node"), "hash");
}

- (BOOL)isNodeManipulator
{
  return 0;
}

- (SCNMatrix4)transform
{
  *retstr = SCNMatrix4Identity;
  return self;
}

- (void)setTransform:(SCNMatrix4 *)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = scn_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[SCNManipulableItem setTransform:].cold.1((uint64_t)self, v4, v5, v6, v7, v8, v9, v10);
}

- (void)setWorldTransform:(SCNMatrix4 *)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = scn_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[SCNManipulableItem setWorldTransform:].cold.1((uint64_t)self, v4, v5, v6, v7, v8, v9, v10);
}

- (SCNMatrix4)worldTransform
{
  *retstr = SCNMatrix4Identity;
  return self;
}

- (SCNVector3)scale
{
  float v2;
  float v3;
  float v4;
  SCNVector3 result;

  v2 = 1.0;
  v3 = 1.0;
  v4 = 1.0;
  result.z = v4;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPosition:(SCNVector3)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = scn_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[SCNManipulableItem setPosition:].cold.1((uint64_t)self, v4, v5, v6, v7, v8, v9, v10);
}

- (id)parentItem
{
  return 0;
}

- (SCNVector3)elementPosition
{
  float v2;
  float v3;
  float v4;
  SCNVector3 result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  result.z = v4;
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)cloneForManipulators
{
  return 0;
}

- (SCNNode)node
{
  return self->node;
}

- (void)setNode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (id)component
{
  return self->component;
}

- (void)setComponent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unint64_t)elementIndex
{
  return self->elementIndex;
}

- (void)setElementIndex:(unint64_t)a3
{
  self->elementIndex = a3;
}

- (void)setTransform:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: set transform not implemented on %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setWorldTransform:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: set world transform not implemented on %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setPosition:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: set position not implemented on %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
