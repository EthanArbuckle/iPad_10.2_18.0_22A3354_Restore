@implementation FRCFaceHandLegRectangle

+ (id)faceRectangleWithBoundingBox:(CGRect)a3 roll:(id)a4 yaw:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___FRCFaceHandLegRectangle;
  v13 = (void *)objc_msgSend(objc_msgSendSuper2(&v17, sel_alloc), "init");
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "setCategory:", 0);
    objc_msgSend(v14, "setBoundingBox:", x, y, width, height);
    if (v11)
      objc_msgSend(v14, "setRoll:", v11);
    if (v12)
      objc_msgSend(v14, "setYaw:", v12);
    v15 = v14;
  }

  return v14;
}

+ (id)handRectangleWithObservation:(id)a3
{
  id v3;
  FRCFaceHandLegRectangle *v4;
  FRCFaceHandLegRectangle *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  float v20;
  float v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  FRCFaceHandLegRectangle *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(FRCFaceHandLegRectangle);
  v5 = v4;
  if (v4)
  {
    -[FRCFaceHandLegRectangle setCategory:](v4, "setCategory:", 1);
    v6 = *MEMORY[0x1E0CEE3C0];
    v33 = 0;
    objc_msgSend(v3, "recognizedPointsForGroupKey:error:", v6, &v33);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v33;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
      v13 = 1.79769313e308;
      v14 = 2.22507386e-308;
      v15 = 2.22507386e-308;
      v16 = 1.79769313e308;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          v18 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKeyedSubscript:", v18, (_QWORD)v29);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "confidence");
          v21 = v20;

          if (v21 > 0.0)
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", v18);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "location");
            v24 = v23;
            v26 = v25;

            v16 = fmin(v16, v24);
            v15 = fmax(v15, v24);
            v13 = fmin(v13, v26);
            v14 = fmax(v14, v26);
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v11);
    }
    else
    {
      v13 = 1.79769313e308;
      v14 = 2.22507386e-308;
      v15 = 2.22507386e-308;
      v16 = 1.79769313e308;
    }

    -[FRCFaceHandLegRectangle setBoundingBox:](v5, "setBoundingBox:", v16, v13, v15 - v16, v14 - v13);
    v27 = v5;

  }
  return v5;
}

+ (id)humanRectangleWithBoundingBox:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___FRCFaceHandLegRectangle;
  v7 = (void *)objc_msgSend(objc_msgSendSuper2(&v11, sel_alloc), "init");
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setCategory:", 4);
    objc_msgSend(v8, "setBoundingBox:", x, y, width, height);
    v9 = v8;
  }

  return v8;
}

+ (id)bodyRectangleWithCenter:(CGPoint)a3 tip:(CGPoint)a4 category:(unint64_t)a5 frameAspectRatio:(float)a6
{
  double y;
  double x;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  float v15;
  double v16;
  float v17;
  objc_super v19;

  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  v19.receiver = a1;
  v19.super_class = (Class)&OBJC_METACLASS___FRCFaceHandLegRectangle;
  v12 = (void *)objc_msgSend(objc_msgSendSuper2(&v19, sel_alloc), "init");
  v13 = v12;
  v14 = vabdd_f64(x, v11);
  v15 = v14 + v14;
  v16 = vabdd_f64(y, v10);
  v17 = v16 + v16;
  if ((float)(v15 * a6) >= v17)
  {
    if ((float)(v15 * a6) > v17)
      v17 = fmaxf(v17, (float)(v15 * a6) * 0.5);
  }
  else
  {
    v15 = fmaxf(v15, (float)(v17 / a6) * 0.5);
  }
  objc_msgSend(v12, "setBoundingBox:", v11 - (float)(v15 * 0.5), v10 - (float)(v17 * 0.5), v15, v17);
  objc_msgSend(v13, "setCategory:", a5);
  return v13;
}

+ (id)animalFaceRectangleWithBoundingBox:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___FRCFaceHandLegRectangle;
  v7 = (void *)objc_msgSend(objc_msgSendSuper2(&v11, sel_alloc), "init");
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setCategory:", 5);
    objc_msgSend(v8, "setBoundingBox:", x, y, width, height);
    v9 = v8;
  }

  return v8;
}

- (unint64_t)category
{
  return self->_category;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBoundingBox:(CGRect)a3
{
  self->_boundingBox = a3;
}

- (NSNumber)roll
{
  return self->_roll;
}

- (void)setRoll:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)yaw
{
  return self->_yaw;
}

- (void)setYaw:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yaw, 0);
  objc_storeStrong((id *)&self->_roll, 0);
}

@end
