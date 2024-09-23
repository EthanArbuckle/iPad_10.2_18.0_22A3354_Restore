@implementation PDFPanGestureRecognizer

- (void)reset
{
  objc_super v3;

  -[PDFPanGestureRecognizer setLocationOfFirstTouch:](self, "setLocationOfFirstTouch:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  v3.receiver = self;
  v3.super_class = (Class)PDFPanGestureRecognizer;
  -[PDFPanGestureRecognizer reset](&v3, sel_reset);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFPanGestureRecognizer view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationInView:", v9);
  v11 = v10;
  v13 = v12;

  -[PDFPanGestureRecognizer setLocationOfFirstTouch:](self, "setLocationOfFirstTouch:", v11, v13);
  v28.receiver = self;
  v28.super_class = (Class)PDFPanGestureRecognizer;
  -[PDFPanGestureRecognizer touchesBegan:withEvent:](&v28, sel_touchesBegan_withEvent_, v6, v7);
  -[PDFPanGestureRecognizer setDidForcePress:](self, "setDidForcePress:", 0);
  -[PDFPanGestureRecognizer setTouchesDidHavePressure:](self, "setTouchesDidHavePressure:", 0);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v19, "force", (_QWORD)v24);
        v21 = v20;
        objc_msgSend(v19, "maximumPossibleForce");
        if (v21 / v22 >= 0.75)
          -[PDFPanGestureRecognizer setDidForcePress:](self, "setDidForcePress:", 1);
        objc_msgSend(v19, "_pressure");
        if (v23 > 0.0)
          -[PDFPanGestureRecognizer setTouchesDidHavePressure:](self, "setTouchesDidHavePressure:", 1);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v16);
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PDFPanGestureRecognizer;
  -[PDFPanGestureRecognizer touchesMoved:withEvent:](&v17, sel_touchesMoved_withEvent_, v6, a4);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "_pressure", (_QWORD)v13);
        if (v12 > 0.0)
          -[PDFPanGestureRecognizer setTouchesDidHavePressure:](self, "setTouchesDidHavePressure:", 1);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v9);
  }

}

- (CGPoint)locationOfFirstTouchInView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v4 = a3;
  -[PDFPanGestureRecognizer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFPanGestureRecognizer locationOfFirstTouch](self, "locationOfFirstTouch");
  objc_msgSend(v5, "convertPoint:toView:", v4);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)locationOfFirstTouch
{
  double x;
  double y;
  CGPoint result;

  x = self->_locationOfFirstTouch.x;
  y = self->_locationOfFirstTouch.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLocationOfFirstTouch:(CGPoint)a3
{
  self->_locationOfFirstTouch = a3;
}

- (BOOL)didForcePress
{
  return self->_didForcePress;
}

- (void)setDidForcePress:(BOOL)a3
{
  self->_didForcePress = a3;
}

- (BOOL)touchesDidHavePressure
{
  return self->_touchesDidHavePressure;
}

- (void)setTouchesDidHavePressure:(BOOL)a3
{
  self->_touchesDidHavePressure = a3;
}

@end
