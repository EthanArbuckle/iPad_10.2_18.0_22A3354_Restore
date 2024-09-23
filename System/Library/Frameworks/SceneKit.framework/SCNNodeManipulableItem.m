@implementation SCNNodeManipulableItem

+ (id)nodeManipulatorItemWithNode:(id)a3 screenSize:(double)a4
{
  SCNNodeManipulableItem *v6;

  v6 = objc_alloc_init(SCNNodeManipulableItem);
  -[SCNManipulableItem setScreenSize:](v6, "setScreenSize:", a4);
  -[SCNManipulableItem setNode:](v6, "setNode:", a3);
  return v6;
}

- (BOOL)isNodeManipulator
{
  return 1;
}

- (SCNMatrix4)transform
{
  SCNMatrix4 *result;

  result = -[SCNManipulableItem node](self, "node");
  if (result)
    return (SCNMatrix4 *)-[SCNMatrix4 transform](result, "transform");
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  return result;
}

- (void)setTransform:(SCNMatrix4 *)a3
{
  __int128 v3;

  -[SCNNode setTransform:](-[SCNManipulableItem node](self, "node", *(_QWORD *)&a3->m11, *(_QWORD *)&a3->m13, *(_QWORD *)&a3->m21, *(_QWORD *)&a3->m23, *(_QWORD *)&a3->m31, *(_QWORD *)&a3->m33, *(_QWORD *)&a3->m41, *(_QWORD *)&a3->m43), "setTransform:", &v3);
}

- (void)setWorldTransform:(SCNMatrix4 *)a3
{
  __int128 v3;

  -[SCNNode setWorldTransform:](-[SCNManipulableItem node](self, "node", *(_QWORD *)&a3->m11, *(_QWORD *)&a3->m13, *(_QWORD *)&a3->m21, *(_QWORD *)&a3->m23, *(_QWORD *)&a3->m31, *(_QWORD *)&a3->m33, *(_QWORD *)&a3->m41, *(_QWORD *)&a3->m43), "setWorldTransform:", &v3);
}

- (SCNMatrix4)worldTransform
{
  SCNMatrix4 *result;

  result = -[SCNManipulableItem node](self, "node");
  if (result)
    return (SCNMatrix4 *)-[SCNMatrix4 worldTransform](result, "worldTransform");
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  return result;
}

- (SCNVector3)scale
{
  float v2;
  float v3;
  float v4;
  SCNVector3 result;

  -[SCNNode scale](-[SCNManipulableItem node](self, "node"), "scale");
  result.z = v4;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPosition:(SCNVector3)a3
{
  float z;
  float y;
  float x;
  SCNNode *v6;
  double v7;
  double v8;
  double v9;

  z = a3.z;
  y = a3.y;
  x = a3.x;
  v6 = -[SCNManipulableItem node](self, "node");
  *(float *)&v7 = x;
  *(float *)&v8 = y;
  *(float *)&v9 = z;
  -[SCNNode setPosition:](v6, "setPosition:", v7, v8, v9);
}

- (id)parentItem
{
  id result;
  SCNNode *v4;

  result = -[SCNNode parentNode](-[SCNManipulableItem node](self, "node"), "parentNode");
  if (result)
  {
    v4 = -[SCNNode parentNode](-[SCNManipulableItem node](self, "node"), "parentNode");
    -[SCNManipulableItem screenSize](self, "screenSize");
    return +[SCNNodeManipulableItem nodeManipulatorItemWithNode:screenSize:](SCNNodeManipulableItem, "nodeManipulatorItemWithNode:screenSize:", v4);
  }
  return result;
}

- (id)cloneForManipulators
{
  SCNNode *v3;
  double v4;
  SCNNode *v5;
  _OWORD v7[4];
  SCNMatrix4 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v3 = -[SCNNode clone](-[SCNManipulableItem node](self, "node"), "clone");
  -[SCNNode opacity](v3, "opacity");
  -[SCNNode setOpacity:](v3, "setOpacity:", v4 * 0.5);
  -[SCNNode setGizmo:](v3, "setGizmo:", 1);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = -[SCNManipulableItem node](self, "node");
  if (v5)
  {
    v8 = SCNMatrix4Identity;
    -[SCNNode convertTransform:toNode:](v5, "convertTransform:toNode:", &v8, 0);
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
  }
  v7[0] = v9;
  v7[1] = v10;
  v7[2] = v11;
  v7[3] = v12;
  -[SCNNode setTransform:](v3, "setTransform:", v7);
  -[SCNManipulableItem screenSize](self, "screenSize");
  return +[SCNNodeManipulableItem nodeManipulatorItemWithNode:screenSize:](SCNNodeManipulableItem, "nodeManipulatorItemWithNode:screenSize:", v3);
}

+ (void)addItems:(id)a3 toScene:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(a3);
        objc_msgSend((id)objc_msgSend(a4, "rootNode"), "addChildNode:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "node"));
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

+ (void)removeItemsFromScene:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(a3);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "node"), "removeFromParentNode");
      }
      while (v5 != v7);
      v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)validateClone
{
  SCNNode *v3;
  double v4;

  -[SCNNode setGizmo:](-[SCNManipulableItem node](self, "node"), "setGizmo:", 0);
  v3 = -[SCNManipulableItem node](self, "node");
  -[SCNNode opacity](v3, "opacity");
  -[SCNNode setOpacity:](v3, "setOpacity:", v4 + v4);
}

@end
