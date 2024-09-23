@implementation _SCNSnapshotWindow

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_SCNSnapshotWindow;
  -[_SCNSnapshotWindow dealloc](&v2, sel_dealloc);
}

- (BOOL)_isSettingFirstResponder
{
  return 0;
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

- (id)scnView
{
  return (id)gCurrentSCNViewEvent;
}

- (id)_hitTest:(CGPoint)a3 withEvent:(id)a4 windowServerHitTestWindow:(id)a5
{
  double y;
  double x;
  id result;
  _SCNSnapshotWindow *i;
  objc_super v11;
  objc_super v12;
  char v13;

  y = a3.y;
  x = a3.x;
  if (-[_SCNSnapshotWindow scnView](self, "scnView", a4, a5))
  {
    objc_msgSend((id)-[_SCNSnapshotWindow layer](self, "layer"), "convertPoint:toLayer:", 0, x, y);
    v13 = 0;
    -[_SCNSnapshotWindow _warpPoint:outOfBounds:](self, "_warpPoint:outOfBounds:", &v13);
    result = 0;
    if (!v13)
    {
      v12.receiver = self;
      v12.super_class = (Class)_SCNSnapshotWindow;
      for (i = (_SCNSnapshotWindow *)-[_SCNSnapshotWindow hitTest:withEvent:](&v12, sel_hitTest_withEvent_, a4);
            i;
            i = (_SCNSnapshotWindow *)-[_SCNSnapshotWindow superview](i, "superview"))
      {
        if (objc_msgSend((id)-[_SCNSnapshotWindow gestureRecognizers](i, "gestureRecognizers"), "count"))
          break;
        if ((-[_SCNSnapshotWindow isMultipleTouchEnabled](i, "isMultipleTouchEnabled") & 1) != 0)
          break;
        if ((-[_SCNSnapshotWindow canBecomeFirstResponder](i, "canBecomeFirstResponder") & 1) != 0)
          break;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
      }
      if (i == self)
        return 0;
      else
        return i;
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_SCNSnapshotWindow;
    return -[_SCNSnapshotWindow hitTest:withEvent:](&v11, sel_hitTest_withEvent_, a4, x, y);
  }
  return result;
}

- (CGPoint)_warpPoint:(CGPoint)a3 outOfBounds:(BOOL *)a4
{
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  float v20;
  float v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  SCNMatrix4 v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v8 = -[_SCNSnapshotWindow scnView](self, "scnView");
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "convertPoint:fromView:", 0, x, y);
    v10 = (void *)objc_msgSend(v9, "hitTest:options:", 0);
    if (objc_msgSend(v10, "count")
      && ((v11 = (void *)objc_msgSend(v10, "objectAtIndexedSubscript:", 0),
           v12 = (void *)objc_msgSend((id)objc_msgSend(v11, "node"), "geometry"),
           !objc_msgSend((id)objc_msgSend(v12, "materials"), "count"))
        ? (v13 = 0)
        : (v13 = (void *)objc_msgSend((id)objc_msgSend(v12, "materials"), "objectAtIndexedSubscript:", objc_msgSend(v11, "geometryIndex")% (unint64_t)objc_msgSend((id)objc_msgSend(v12, "materials"), "count"))), objc_msgSend((id)-[_SCNSnapshotWindow subviews](self, "subviews"), "count")&& (v14 = objc_msgSend((id)objc_msgSend(v13, "diffuse"), "contents"), v14 == objc_msgSend((id)-[_SCNSnapshotWindow subviews](self, "subviews"), "objectAtIndexedSubscript:", 0))))
    {
      objc_msgSend(v11, "textureCoordinatesWithMappingChannel:", 0);
      v16 = v15;
      v18 = v17;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v19 = (void *)objc_msgSend(v13, "diffuse");
      if (v19)
      {
        objc_msgSend(v19, "contentsTransform");
      }
      else
      {
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
      }
      *(float32x4_t *)&v27.m11 = v28;
      *(float32x4_t *)&v27.m21 = v29;
      *(float32x4_t *)&v27.m31 = v30;
      *(float32x4_t *)&v27.m41 = v31;
      if (!SCNMatrix4IsIdentity(&v27))
      {
        v20 = v16;
        v21 = v18;
        v22 = vaddq_f32(vmlaq_f32(vmlaq_n_f32(vmulq_n_f32(v28, v20), v29, v21), (float32x4_t)0, v30), v31).u64[0];
        v16 = *(float *)&v22;
        v18 = *((float *)&v22 + 1);
      }
      -[_SCNSnapshotWindow bounds](self, "bounds");
      x = v16 * v23;
      -[_SCNSnapshotWindow bounds](self, "bounds");
      y = v18 * v24;
    }
    else if (a4)
    {
      *a4 = 1;
    }
  }
  v25 = x;
  v26 = y;
  result.y = v26;
  result.x = v25;
  return result;
}

- (CGPoint)warpPoint:(CGPoint)a3
{
  double v4;
  double v5;
  CGPoint result;

  objc_msgSend((id)-[_SCNSnapshotWindow layer](self, "layer"), "convertPoint:toLayer:", 0, a3.x, a3.y);
  -[_SCNSnapshotWindow _warpPoint:outOfBounds:](self, "_warpPoint:outOfBounds:", 0);
  result.y = v5;
  result.x = v4;
  return result;
}

@end
