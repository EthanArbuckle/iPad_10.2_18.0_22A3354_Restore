@implementation FMMapGestureRecognizer

- (FMMapGestureRecognizer)init
{
  FMMapGestureRecognizer *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMMapGestureRecognizer;
  v2 = -[FMMapGestureRecognizer init](&v5, sel_init);
  -[FMMapGestureRecognizer setTouchRadius:](v2, "setTouchRadius:", 20);
  if (v2)
  {
    -[FMMapGestureRecognizer setCancelsTouchesInView:](v2, "setCancelsTouchesInView:", 0);
    v3 = (void *)objc_opt_new();
    -[FMMapGestureRecognizer setOtherGestures:](v2, "setOtherGestures:", v3);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[FMMapGestureRecognizer doubleTapTimer](self, "doubleTapTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[FMMapGestureRecognizer setDoubleTapTimer:](self, "setDoubleTapTimer:", 0);
  v4.receiver = self;
  v4.super_class = (Class)FMMapGestureRecognizer;
  -[FMMapGestureRecognizer dealloc](&v4, sel_dealloc);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  _BOOL8 v19;
  double v20;
  void *v21;
  id v22;

  v5 = a3;
  v6 = 0.0;
  -[FMMapGestureRecognizer setVelocity:](self, "setVelocity:", 0.0);
  -[FMMapGestureRecognizer setIsTrackingTouches:](self, "setIsTrackingTouches:", 1);
  -[FMMapGestureRecognizer view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  -[FMMapGestureRecognizer setSwipeThreshold:](self, "setSwipeThreshold:", v8 * 0.600000024);

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapGestureRecognizer setIsRTLOrientation:](self, "setIsRTLOrientation:", objc_msgSend(v9, "userInterfaceLayoutDirection") == 1);

  v10 = 30.0;
  if (-[FMMapGestureRecognizer isRTLOrientation](self, "isRTLOrientation"))
  {
    -[FMMapGestureRecognizer view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v6 = v12 + -30.0;

    -[FMMapGestureRecognizer view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v10 = v14;

  }
  -[FMMapGestureRecognizer touchDelegate](self, "touchDelegate");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[FMMapGestureRecognizer view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "locationInView:", v17);
  -[FMMapGestureRecognizer setInitialTouchLocation:](self, "setInitialTouchLocation:");

  if (-[FMMapGestureRecognizer isSwipeEnabled](self, "isSwipeEnabled")
    && (-[FMMapGestureRecognizer initialTouchLocation](self, "initialTouchLocation"), v18 <= v10))
  {
    -[FMMapGestureRecognizer initialTouchLocation](self, "initialTouchLocation");
    v19 = v20 >= v6;
  }
  else
  {
    v19 = 0;
  }
  -[FMMapGestureRecognizer setIsSwipingFromTheEdge:](self, "setIsSwipingFromTheEdge:", v19);
  -[FMMapGestureRecognizer setIsSwipingGestureEnded:](self, "setIsSwipingGestureEnded:", 0);
  if ((unint64_t)-[FMMapGestureRecognizer numberOfTouches](self, "numberOfTouches") >= 2)
    -[FMMapGestureRecognizer setIsSwipingFromTheEdge:](self, "setIsSwipingFromTheEdge:", 0);
  if (-[FMMapGestureRecognizer isSwipingFromTheEdge](self, "isSwipingFromTheEdge")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v22, "mapSwipedBegin:", self);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v22, "mapTouchBegan:", self);
  -[FMMapGestureRecognizer view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "locationInView:", v21);
  -[FMMapGestureRecognizer setLastTouchPoint:](self, "setLastTouchPoint:");

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;

  -[FMMapGestureRecognizer touchDelegate](self, "touchDelegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "mapTouchCancelled:", self);
  -[FMMapGestureRecognizer finishSwipeGesture:](self, "finishSwipeGesture:", 0.0);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  void *v44;
  char isKindOfClass;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  id v62;
  _QWORD v63[4];
  id v64;
  FMMapGestureRecognizer *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  uint64_t v71;
  CGPoint v72;
  CGRect v73;

  v71 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[FMMapGestureRecognizer touchDelegate](self, "touchDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[FMMapGestureRecognizer view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationInView:", v9);
  v11 = v10;
  v13 = v12;

  -[FMMapGestureRecognizer initialTouchLocation](self, "initialTouchLocation");
  -[FMMapGestureRecognizer distanceBetweenPointA:andPointB:](self, "distanceBetweenPointA:andPointB:");
  v15 = v14;
  -[FMMapGestureRecognizer previousTouch](self, "previousTouch");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapGestureRecognizer view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "locationInView:", v17);
  v19 = v18;
  v21 = v20;

  -[FMMapGestureRecognizer distanceBetweenPointA:andPointB:](self, "distanceBetweenPointA:andPointB:", v11, v13, v19, v21);
  v23 = v22;
  objc_msgSend(v5, "anyObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "anyObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "calloutButtonTapped:", v27);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v62 = v5;
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      objc_msgSend(v25, "subviews");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v67;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v67 != v31)
              objc_enumerationMutation(v28);
            v33 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v33, "frame");
              v35 = v34;
              v37 = v36;
              v39 = v38;
              v41 = v40;
              objc_msgSend(v8, "locationInView:", v25);
              v72.x = v42;
              v72.y = v43;
              v73.origin.x = v35;
              v73.origin.y = v37;
              v73.size.width = v39;
              v73.size.height = v41;
              if (CGRectContainsPoint(v73, v72) && (objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v6, "userLocationTapped:", v25);
            }
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
        }
        while (v30);
      }

      v5 = v62;
    }
  }
  if (v15 < (double)-[FMMapGestureRecognizer touchRadius](self, "touchRadius"))
  {
    objc_msgSend(v8, "view");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      -[FMMapGestureRecognizer previousTouch](self, "previousTouch");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
        if (v23 >= (double)-[FMMapGestureRecognizer touchRadius](self, "touchRadius")
          || (unint64_t)objc_msgSend(v8, "tapCount") < 2)
        {
          objc_msgSend(MEMORY[0x24BDBCF40], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_mapTappedTimer, 0, 0, 0.25);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[FMMapGestureRecognizer setDoubleTapTimer:](self, "setDoubleTapTimer:", v48);

          objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[FMMapGestureRecognizer doubleTapTimer](self, "doubleTapTimer");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "addTimer:forMode:", v50, *MEMORY[0x24BDBCB80]);

        }
        else
        {
          -[FMMapGestureRecognizer doubleTapTimer](self, "doubleTapTimer");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "invalidate");

          -[FMMapGestureRecognizer setDoubleTapTimer:](self, "setDoubleTapTimer:", 0);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v6, "mapDoubleTapped:", self);
        }
        -[FMMapGestureRecognizer setPreviousTouch:](self, "setPreviousTouch:", 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCF40], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_mapTappedTimer, 0, 0, 0.25);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[FMMapGestureRecognizer setDoubleTapTimer:](self, "setDoubleTapTimer:", v51);

        objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[FMMapGestureRecognizer doubleTapTimer](self, "doubleTapTimer");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "addTimer:forMode:", v53, *MEMORY[0x24BDBCB80]);

      }
      -[FMMapGestureRecognizer setPreviousTouch:](self, "setPreviousTouch:", v8);
    }
  }
  if (-[FMMapGestureRecognizer isSwipingFromTheEdge](self, "isSwipingFromTheEdge"))
  {
    -[FMMapGestureRecognizer velocity](self, "velocity");
    if (v54 <= 14.0)
    {
      if (-[FMMapGestureRecognizer isRTLOrientation](self, "isRTLOrientation"))
      {
        -[FMMapGestureRecognizer view](self, "view");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "frame");
        v58 = v57 - v11;
        -[FMMapGestureRecognizer swipeThreshold](self, "swipeThreshold");
        -[FMMapGestureRecognizer finishSwipeGesture:](self, "finishSwipeGesture:", v58 / v59);

      }
      else
      {
        -[FMMapGestureRecognizer swipeThreshold](self, "swipeThreshold");
        -[FMMapGestureRecognizer finishSwipeGesture:](self, "finishSwipeGesture:", v11 / v60);
      }
    }
    else
    {
      v55 = (void *)MEMORY[0x24BDF6F90];
      v63[0] = MEMORY[0x24BDAC760];
      v63[1] = 3221225472;
      v63[2] = __49__FMMapGestureRecognizer_touchesEnded_withEvent___block_invoke;
      v63[3] = &unk_24C837090;
      v64 = v6;
      v65 = self;
      objc_msgSend(v55, "animateWithDuration:animations:", v63, 0.3);

    }
  }
  v61 = (void *)objc_opt_new();
  -[FMMapGestureRecognizer setOtherGestures:](self, "setOtherGestures:", v61);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "mapTouchEnded:", self);
  -[FMMapGestureRecognizer setIsTrackingTouches:](self, "setIsTrackingTouches:", 0);

}

uint64_t __49__FMMapGestureRecognizer_touchesEnded_withEvent___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapSwiped:withPercent:", *(_QWORD *)(a1 + 40), 1.0);
    return objc_msgSend(*(id *)(a1 + 40), "finishSwipeGesture:", 1.0);
  }
  return result;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  FMMapGestureRecognizer *v23;
  double v24;
  double v25;
  void *v26;
  id v27;

  v27 = a3;
  -[FMMapGestureRecognizer touchDelegate](self, "touchDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[FMMapGestureRecognizer view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  -[FMMapGestureRecognizer initialTouchLocation](self, "initialTouchLocation");
  -[FMMapGestureRecognizer distanceBetweenPointA:andPointB:](self, "distanceBetweenPointA:andPointB:");
  v14 = v13;
  if (-[FMMapGestureRecognizer isTrackingTouches](self, "isTrackingTouches")
    && v14 > (double)-[FMMapGestureRecognizer touchRadius](self, "touchRadius")
    && !-[FMMapGestureRecognizer isSwipingGestureEnded](self, "isSwipingGestureEnded"))
  {
    if (-[FMMapGestureRecognizer isSwipingFromTheEdge](self, "isSwipingFromTheEdge"))
    {
      -[FMMapGestureRecognizer swipeThreshold](self, "swipeThreshold");
      v16 = v15;
      if (-[FMMapGestureRecognizer isRTLOrientation](self, "isRTLOrientation"))
      {
        -[FMMapGestureRecognizer view](self, "view");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "frame");
        v19 = v18 - v10;
        -[FMMapGestureRecognizer swipeThreshold](self, "swipeThreshold");
        v21 = v19 / v20;

        v22 = fmin(v21, 1.0);
      }
      else
      {
        v22 = fmin(v10 / v16, 1.0);
      }
      if ((unint64_t)objc_msgSend(v27, "count") > 1)
      {
        v23 = self;
        goto LABEL_16;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "mapSwiped:withPercent:", self, v22);
      if (v22 == 1.0)
      {
        v23 = self;
LABEL_16:
        -[FMMapGestureRecognizer finishSwipeGesture:](v23, "finishSwipeGesture:");
      }
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "mapTouchMoved:", self);
    }
  }
  -[FMMapGestureRecognizer lastTouchPoint](self, "lastTouchPoint");
  -[FMMapGestureRecognizer distanceBetweenPointA:andPointB:](self, "distanceBetweenPointA:andPointB:", v10, v12, v24, v25);
  -[FMMapGestureRecognizer setVelocity:](self, "setVelocity:");
  -[FMMapGestureRecognizer view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationInView:", v26);
  -[FMMapGestureRecognizer setLastTouchPoint:](self, "setLastTouchPoint:");

}

- (void)finishSwipeGesture:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[FMMapGestureRecognizer touchDelegate](self, "touchDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FMMapGestureRecognizer isSwipingFromTheEdge](self, "isSwipingFromTheEdge"))
  {
    -[FMMapGestureRecognizer setIsSwipingFromTheEdge:](self, "setIsSwipingFromTheEdge:", 0);
    -[FMMapGestureRecognizer doubleTapTimer](self, "doubleTapTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "mapSwipedEnd:withPercent:", self, a3);
    -[FMMapGestureRecognizer setEnabled:](self, "setEnabled:", 0);
    -[FMMapGestureRecognizer setEnabled:](self, "setEnabled:", 1);
    -[FMMapGestureRecognizer setIsSwipingGestureEnded:](self, "setIsSwipingGestureEnded:", 1);
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[FMMapGestureRecognizer otherGestures](self, "otherGestures", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setEnabled:", 1);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)mapTappedTimer
{
  id v3;

  -[FMMapGestureRecognizer touchDelegate](self, "touchDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "mapTapped:", self);

}

- (void)invalidateGesture
{
  -[FMMapGestureRecognizer setIsTrackingTouches:](self, "setIsTrackingTouches:", 0);
}

- (double)distanceBetweenPointA:(CGPoint)a3 andPointB:(CGPoint)a4
{
  return sqrt((a4.y - a3.y) * (a4.y - a3.y) + (a4.x - a3.x) * (a4.x - a3.x));
}

- (void)reset
{
  id v3;

  v3 = (id)objc_opt_new();
  -[FMMapGestureRecognizer setOtherGestures:](self, "setOtherGestures:", v3);

}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[FMMapGestureRecognizer otherGestures](self, "otherGestures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  objc_msgSend(v4, "setEnabled:", -[FMMapGestureRecognizer isSwipingFromTheEdge](self, "isSwipingFromTheEdge") ^ 1);
  return 0;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (FMMapGestureRecognizerDelegate)touchDelegate
{
  return (FMMapGestureRecognizerDelegate *)objc_loadWeakRetained((id *)&self->_touchDelegate);
}

- (void)setTouchDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_touchDelegate, a3);
}

- (int)touchRadius
{
  return self->_touchRadius;
}

- (void)setTouchRadius:(int)a3
{
  self->_touchRadius = a3;
}

- (BOOL)isSwipeEnabled
{
  return self->_isSwipeEnabled;
}

- (void)setIsSwipeEnabled:(BOOL)a3
{
  self->_isSwipeEnabled = a3;
}

- (CGPoint)initialTouchLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialTouchLocation.x;
  y = self->_initialTouchLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialTouchLocation:(CGPoint)a3
{
  self->_initialTouchLocation = a3;
}

- (UITouch)previousTouch
{
  return self->_previousTouch;
}

- (void)setPreviousTouch:(id)a3
{
  objc_storeStrong((id *)&self->_previousTouch, a3);
}

- (CGPoint)lastTouchPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastTouchPoint.x;
  y = self->_lastTouchPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastTouchPoint:(CGPoint)a3
{
  self->_lastTouchPoint = a3;
}

- (double)swipeThreshold
{
  return self->_swipeThreshold;
}

- (void)setSwipeThreshold:(double)a3
{
  self->_swipeThreshold = a3;
}

- (double)velocity
{
  return self->_velocity;
}

- (void)setVelocity:(double)a3
{
  self->_velocity = a3;
}

- (BOOL)isTrackingTouches
{
  return self->_isTrackingTouches;
}

- (void)setIsTrackingTouches:(BOOL)a3
{
  self->_isTrackingTouches = a3;
}

- (BOOL)isSwipingFromTheEdge
{
  return self->_isSwipingFromTheEdge;
}

- (void)setIsSwipingFromTheEdge:(BOOL)a3
{
  self->_isSwipingFromTheEdge = a3;
}

- (BOOL)isSwipingGestureEnded
{
  return self->_isSwipingGestureEnded;
}

- (void)setIsSwipingGestureEnded:(BOOL)a3
{
  self->_isSwipingGestureEnded = a3;
}

- (BOOL)isRTLOrientation
{
  return self->_isRTLOrientation;
}

- (void)setIsRTLOrientation:(BOOL)a3
{
  self->_isRTLOrientation = a3;
}

- (NSMutableArray)otherGestures
{
  return self->_otherGestures;
}

- (void)setOtherGestures:(id)a3
{
  objc_storeStrong((id *)&self->_otherGestures, a3);
}

- (NSTimer)doubleTapTimer
{
  return self->_doubleTapTimer;
}

- (void)setDoubleTapTimer:(id)a3
{
  objc_storeStrong((id *)&self->_doubleTapTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleTapTimer, 0);
  objc_storeStrong((id *)&self->_otherGestures, 0);
  objc_storeStrong((id *)&self->_previousTouch, 0);
  objc_destroyWeak((id *)&self->_touchDelegate);
}

@end
