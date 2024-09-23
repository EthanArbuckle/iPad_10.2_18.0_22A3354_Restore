@implementation AKPanGestureRecognizer

- (void)reset
{
  objc_super v3;

  -[AKPanGestureRecognizer setCurrentWeight:](self, "setCurrentWeight:", 0.5);
  -[AKPanGestureRecognizer setCurrentMaxWeight:](self, "setCurrentMaxWeight:", 0.0);
  -[AKPanGestureRecognizer resetAccumulatedTouches](self, "resetAccumulatedTouches");
  -[AKPanGestureRecognizer resetAdditionalTouches](self, "resetAdditionalTouches");
  -[AKPanGestureRecognizer setLocationOfFirstTouch:](self, "setLocationOfFirstTouch:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  -[AKPanGestureRecognizer setPenGestureDetected:](self, "setPenGestureDetected:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AKPanGestureRecognizer;
  -[AKPanGestureRecognizer reset](&v3, sel_reset);
}

- (void)_checkTouchForStylus:(id)a3
{
  if (objc_msgSend(a3, "type") == 2)
    -[AKPanGestureRecognizer setPenGestureDetected:](self, "setPenGestureDetected:", 1);
}

- (id)accumulatedTouches
{
  void *v3;
  void *v4;
  void *v5;

  -[AKPanGestureRecognizer currentAccumulatedTouches](self, "currentAccumulatedTouches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AKPanGestureRecognizer currentAccumulatedTouches](self, "currentAccumulatedTouches");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v5;
}

- (void)resetAccumulatedTouches
{
  id v2;

  -[AKPanGestureRecognizer currentAccumulatedTouches](self, "currentAccumulatedTouches");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)resetAdditionalTouches
{
  id v2;

  -[AKPanGestureRecognizer additionalTouches](self, "additionalTouches");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPanGestureRecognizer _checkTouchForStylus:](self, "_checkTouchForStylus:", v8);
  objc_msgSend(v8, "force");
  -[AKPanGestureRecognizer setCurrentWeight:](self, "setCurrentWeight:");
  objc_msgSend(v8, "maximumPossibleForce");
  -[AKPanGestureRecognizer setCurrentMaxWeight:](self, "setCurrentMaxWeight:");
  -[AKPanGestureRecognizer view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationInView:", v9);
  -[AKPanGestureRecognizer setLocationOfFirstTouch:](self, "setLocationOfFirstTouch:");

  -[AKPanGestureRecognizer currentAccumulatedTouches](self, "currentAccumulatedTouches");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 100);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKPanGestureRecognizer setCurrentAccumulatedTouches:](self, "setCurrentAccumulatedTouches:", v11);

  }
  -[AKPanGestureRecognizer currentAccumulatedTouches](self, "currentAccumulatedTouches");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coalescedTouchesForTouch:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v13);

  if (-[AKPanGestureRecognizer state](self, "state") == 2)
  {
    -[AKPanGestureRecognizer additionalTouches](self, "additionalTouches");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v15 = (void *)objc_opt_new();
      -[AKPanGestureRecognizer setAdditionalTouches:](self, "setAdditionalTouches:", v15);

    }
    -[AKPanGestureRecognizer additionalTouches](self, "additionalTouches");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "unionSet:", v6);

  }
  v17.receiver = self;
  v17.super_class = (Class)AKPanGestureRecognizer;
  -[AKPanGestureRecognizer touchesBegan:withEvent:](&v17, sel_touchesBegan_withEvent_, v6, v7);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPanGestureRecognizer _checkTouchForStylus:](self, "_checkTouchForStylus:", v8);
  objc_msgSend(v8, "force");
  -[AKPanGestureRecognizer setCurrentWeight:](self, "setCurrentWeight:");
  objc_msgSend(v8, "maximumPossibleForce");
  -[AKPanGestureRecognizer setCurrentMaxWeight:](self, "setCurrentMaxWeight:");
  -[AKPanGestureRecognizer currentAccumulatedTouches](self, "currentAccumulatedTouches");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coalescedTouchesForTouch:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v10);

  v11.receiver = self;
  v11.super_class = (Class)AKPanGestureRecognizer;
  -[AKPanGestureRecognizer touchesMoved:withEvent:](&v11, sel_touchesMoved_withEvent_, v7, v6);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "force");
  -[AKPanGestureRecognizer setCurrentWeight:](self, "setCurrentWeight:");
  objc_msgSend(v8, "maximumPossibleForce");
  -[AKPanGestureRecognizer setCurrentMaxWeight:](self, "setCurrentMaxWeight:");
  -[AKPanGestureRecognizer currentAccumulatedTouches](self, "currentAccumulatedTouches");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coalescedTouchesForTouch:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v10);

  -[AKPanGestureRecognizer additionalTouches](self, "additionalTouches");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v7);

  v12.receiver = self;
  v12.super_class = (Class)AKPanGestureRecognizer;
  -[AKPanGestureRecognizer touchesEnded:withEvent:](&v12, sel_touchesEnded_withEvent_, v7, v6);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPanGestureRecognizer setPenGestureDetected:](self, "setPenGestureDetected:", 0);
  objc_msgSend(v8, "force");
  -[AKPanGestureRecognizer setCurrentWeight:](self, "setCurrentWeight:");
  objc_msgSend(v8, "maximumPossibleForce");
  -[AKPanGestureRecognizer setCurrentMaxWeight:](self, "setCurrentMaxWeight:");
  -[AKPanGestureRecognizer currentAccumulatedTouches](self, "currentAccumulatedTouches");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coalescedTouchesForTouch:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v10);

  -[AKPanGestureRecognizer additionalTouches](self, "additionalTouches");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v7);

  v12.receiver = self;
  v12.super_class = (Class)AKPanGestureRecognizer;
  -[AKPanGestureRecognizer touchesCancelled:withEvent:](&v12, sel_touchesCancelled_withEvent_, v7, v6);

}

- (unint64_t)additionalNumberOfTouches
{
  void *v2;
  unint64_t v3;

  -[AKPanGestureRecognizer additionalTouches](self, "additionalTouches");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
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
  -[AKPanGestureRecognizer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPanGestureRecognizer locationOfFirstTouch](self, "locationOfFirstTouch");
  objc_msgSend(v5, "convertPoint:toView:", v4);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (double)currentWeight
{
  return self->_currentWeight;
}

- (void)setCurrentWeight:(double)a3
{
  self->_currentWeight = a3;
}

- (double)currentMaxWeight
{
  return self->_currentMaxWeight;
}

- (void)setCurrentMaxWeight:(double)a3
{
  self->_currentMaxWeight = a3;
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

- (BOOL)penGestureDetected
{
  return self->_penGestureDetected;
}

- (void)setPenGestureDetected:(BOOL)a3
{
  self->_penGestureDetected = a3;
}

- (NSMutableArray)currentAccumulatedTouches
{
  return self->_currentAccumulatedTouches;
}

- (void)setCurrentAccumulatedTouches:(id)a3
{
  objc_storeStrong((id *)&self->_currentAccumulatedTouches, a3);
}

- (NSMutableSet)additionalTouches
{
  return self->_additionalTouches;
}

- (void)setAdditionalTouches:(id)a3
{
  objc_storeStrong((id *)&self->_additionalTouches, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalTouches, 0);
  objc_storeStrong((id *)&self->_currentAccumulatedTouches, 0);
}

@end
