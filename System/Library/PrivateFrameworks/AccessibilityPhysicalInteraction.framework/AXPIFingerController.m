@implementation AXPIFingerController

- (AXPIFingerController)init
{
  return -[AXPIFingerController initWithDisplayUUID:](self, "initWithDisplayUUID:", 0);
}

- (AXPIFingerController)initWithDisplayUUID:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  AXPIFingerEventSender *v8;
  void *v9;
  AXPIFingerContainerView *v10;
  void *v11;
  __int128 v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AXPIFingerController;
  v5 = -[AXPIFingerController init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v6;

    v8 = -[AXPIFingerEventSender initWithDisplayUUID:]([AXPIFingerEventSender alloc], "initWithDisplayUUID:", v4);
    v9 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v8;

    objc_msgSend(*((id *)v5 + 3), "setSenderID:", 0x8000000817319372);
    v10 = objc_alloc_init(AXPIFingerContainerView);
    v11 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v10;

    objc_msgSend(*((id *)v5 + 1), "setUserInteractionEnabled:", 0);
    v12 = *(_OWORD *)(MEMORY[0x24BDBF070] + 16);
    *(_OWORD *)(v5 + 104) = *MEMORY[0x24BDBF070];
    *(_OWORD *)(v5 + 120) = v12;
    AXPIDefaultAppearanceForDevice();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAppearanceDelegate:", v13);

  }
  return (AXPIFingerController *)v5;
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_fingerModels;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "setDelegate:", 0);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)AXPIFingerController;
  -[AXPIFingerController dealloc](&v8, sel_dealloc);
}

- (BOOL)isPinchEnabled
{
  return -[AXPIFingerContainerView isPinchChainVisible](self->_fingerContainerView, "isPinchChainVisible");
}

- (void)setShouldAddRealEventFlag:(BOOL)a3
{
  -[AXPIFingerEventSender setShouldAddRealEventFlag:](self->_eventSender, "setShouldAddRealEventFlag:", a3);
}

- (BOOL)shouldAddRealEventFlag
{
  return -[AXPIFingerEventSender shouldAddRealEventFlag](self->_eventSender, "shouldAddRealEventFlag");
}

- (void)setSenderID:(unint64_t)a3
{
  -[AXPIFingerEventSender setSenderID:](self->_eventSender, "setSenderID:", a3);
}

- (unint64_t)senderID
{
  return -[AXPIFingerEventSender senderID](self->_eventSender, "senderID");
}

- (unint64_t)numberOfFingers
{
  return -[NSMutableArray count](self->_fingerModels, "count");
}

- (void)clearAllFingersAnimated:(BOOL)a3 endPointForAnimation:(CGPoint)a4
{
  double y;
  double x;
  _BOOL8 v6;

  y = a4.y;
  x = a4.x;
  v6 = a3;
  -[AXPIFingerController liftFingersUpAnimated:](self, "liftFingersUpAnimated:");
  -[AXPIFingerController _interruptGestureIfNeeded](self, "_interruptGestureIfNeeded");
  -[AXPIFingerController enumerateFingersUsingBlock:](self, "enumerateFingersUsingBlock:", &__block_literal_global_3);
  -[AXPIFingerContainerView clearAllFingersAnimated:endPointForAnimation:](self->_fingerContainerView, "clearAllFingersAnimated:endPointForAnimation:", v6, x, y);
  -[NSMutableArray removeAllObjects](self->_fingerModels, "removeAllObjects");
}

uint64_t __69__AXPIFingerController_clearAllFingersAnimated_endPointForAnimation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegate:", 0);
}

- (void)showFingerModels:(id)a3 animated:(BOOL)a4 startPointForAnimation:(CGPoint)a5
{
  -[AXPIFingerController _showFingerModels:animated:startPointForAnimation:shouldShowPinchChain:shouldReuseFingers:](self, "_showFingerModels:animated:startPointForAnimation:shouldShowPinchChain:shouldReuseFingers:", a3, a4, 0, 0, a5.x, a5.y);
}

- (void)_showFingerModels:(id)a3 animated:(BOOL)a4 startPointForAnimation:(CGPoint)a5 shouldShowPinchChain:(BOOL)a6 shouldReuseFingers:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL8 v8;
  double y;
  double x;
  _BOOL8 v11;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v7 = a7;
  v8 = a6;
  y = a5.y;
  x = a5.x;
  v11 = a4;
  v28 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  if (v7)
  {
    -[AXPIFingerController _interruptGestureIfNeeded](self, "_interruptGestureIfNeeded");
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __114__AXPIFingerController__showFingerModels_animated_startPointForAnimation_shouldShowPinchChain_shouldReuseFingers___block_invoke;
    v25[3] = &unk_24F478680;
    v25[4] = self;
    v26 = v13;
    v14 = MEMORY[0x22E2DFEB0](v25);
    v15 = (void *)v14;
    if (v11)
      objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v14, 0.25);
    else
      (*(void (**)(uint64_t))(v14 + 16))(v14);

  }
  else
  {
    if (-[NSMutableArray count](self->_fingerModels, "count"))
      -[AXPIFingerController clearAllFingersAnimated:endPointForAnimation:](self, "clearAllFingersAnimated:endPointForAnimation:", v11, x, y);
    -[NSMutableArray addObjectsFromArray:](self->_fingerModels, "addObjectsFromArray:", v13);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v16 = v13;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "setDelegate:", self, (_QWORD)v21);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v18);
    }

    -[AXPIFingerContainerView showFingerModels:animated:startPointForAnimation:shouldShowPinchChain:](self->_fingerContainerView, "showFingerModels:animated:startPointForAnimation:shouldShowPinchChain:", v16, v11, v8, x, y);
  }

}

void __114__AXPIFingerController__showFingerModels_animated_startPointForAnimation_shouldShowPinchChain_shouldReuseFingers___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __114__AXPIFingerController__showFingerModels_animated_startPointForAnimation_shouldShowPinchChain_shouldReuseFingers___block_invoke_2;
  v2[3] = &unk_24F4789D8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateFingersUsingBlock:", v2);

}

void __114__AXPIFingerController__showFingerModels_animated_startPointForAnimation_shouldShowPinchChain_shouldReuseFingers___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithPropertiesFromFingerModel:", v6);

}

- (void)showPinchFingersAnimated:(BOOL)a3 midpoint:(CGPoint)a4
{
  double y;
  double x;
  _BOOL8 v6;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  y = a4.y;
  x = a4.x;
  v6 = a3;
  if (-[NSMutableArray count](self->_fingerModels, "count"))
    -[AXPIFingerController clearAllFingersAnimated:endPointForAnimation:](self, "clearAllFingersAnimated:endPointForAnimation:", v6, x, y);
  -[AXPIFingerContainerView bounds](self->_fingerContainerView, "bounds");
  +[AXPIFingerUtilities defaultPinchLocationsAroundPoint:withinBounds:](AXPIFingerUtilities, "defaultPinchLocationsAroundPoint:withinBounds:", x, y, v8, v9, v10, v11);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  +[AXPIFingerUtilities fingerModelsForPointStrings:](AXPIFingerUtilities, "fingerModelsForPointStrings:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPIFingerController _showFingerModels:animated:startPointForAnimation:shouldShowPinchChain:shouldReuseFingers:](self, "_showFingerModels:animated:startPointForAnimation:shouldShowPinchChain:shouldReuseFingers:", v12, v6, 1, 0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

}

- (void)resetPinchFingers
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSString *v11;
  CGPoint v12;
  void *v13;
  NSString *v14;
  CGPoint v15;
  void *v16;
  id v17;

  -[AXPIFingerController midpointForFingers](self, "midpointForFingers");
  v4 = v3;
  v6 = v5;
  -[AXPIFingerContainerView bounds](self->_fingerContainerView, "bounds");
  +[AXPIFingerUtilities defaultPinchLocationsAroundPoint:withinBounds:](AXPIFingerUtilities, "defaultPinchLocationsAroundPoint:withinBounds:", v4, v6, v7, v8, v9, v10);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  v12 = CGPointFromString(v11);
  -[NSMutableArray objectAtIndexedSubscript:](self->_fingerModels, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLocation:", v12.x, v12.y);

  objc_msgSend(v17, "lastObject");
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  v15 = CGPointFromString(v14);
  -[NSMutableArray objectAtIndexedSubscript:](self->_fingerModels, "objectAtIndexedSubscript:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLocation:", v15.x, v15.y);

}

- (CGPoint)_sceneReferencePointFromFingerLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  AXPIFingerContainerView *fingerContainerView;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[AXPIFingerController fixedReferenceWindow](self, "fixedReferenceWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  fingerContainerView = self->_fingerContainerView;
  -[AXPIFingerContainerView window](fingerContainerView, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    -[AXPIFingerContainerView convertPoint:toView:](self->_fingerContainerView, "convertPoint:toView:", 0, x, y);
    v11 = v10;
    v13 = v12;
    -[AXPIFingerController fixedReferenceWindow](self, "fixedReferenceWindow");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertPoint:toWindow:", v14, v11, v13);
    v16 = v15;
    v18 = v17;
  }
  else
  {
    objc_msgSend(v8, "screen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fixedCoordinateSpace");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXPIFingerContainerView convertPoint:toCoordinateSpace:](fingerContainerView, "convertPoint:toCoordinateSpace:", v19, x, y);
    v16 = v20;
    v18 = v21;

  }
  v22 = v16;
  v23 = v18;
  result.y = v23;
  result.x = v22;
  return result;
}

- (CGPoint)_fingerLocationFromSceneReferencePoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  AXPIFingerContainerView *fingerContainerView;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[AXPIFingerController fixedReferenceWindow](self, "fixedReferenceWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  fingerContainerView = self->_fingerContainerView;
  -[AXPIFingerContainerView window](fingerContainerView, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    -[AXPIFingerController fixedReferenceWindow](self, "fixedReferenceWindow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertPoint:fromWindow:", v10, x, y);
    -[AXPIFingerContainerView convertPoint:fromView:](fingerContainerView, "convertPoint:fromView:", 0);
    v12 = v11;
    v14 = v13;
  }
  else
  {
    objc_msgSend(v8, "screen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fixedCoordinateSpace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXPIFingerContainerView convertPoint:fromCoordinateSpace:](fingerContainerView, "convertPoint:fromCoordinateSpace:", v15, x, y);
    v12 = v16;
    v14 = v17;

  }
  v18 = v12;
  v19 = v14;
  result.y = v19;
  result.x = v18;
  return result;
}

- (id)_eventTouchInfoForFingerLocation:(CGPoint)a3 force:(double)a4
{
  double y;
  double x;
  AXPIFingerEventTouchInfo *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v25;

  y = a3.y;
  x = a3.x;
  v8 = objc_alloc_init(AXPIFingerEventTouchInfo);
  -[AXPIFingerController _sceneReferencePointFromFingerLocation:](self, "_sceneReferencePointFromFingerLocation:", x, y);
  v10 = v9;
  v12 = v11;
  -[AXPIFingerController fixedReferenceBounds](self, "fixedReferenceBounds");
  if (CGRectIsNull(v25))
  {
    -[AXPIFingerContainerView window](self->_fingerContainerView, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[AXPIFingerContainerView window](self->_fingerContainerView, "window");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "screen");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_referenceBounds");
      v17 = v16;
      v19 = v18;

    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_referenceBounds");
      v17 = v22;
      v19 = v23;
    }

  }
  else
  {
    -[AXPIFingerController fixedReferenceBounds](self, "fixedReferenceBounds");
    v17 = v20;
    v19 = v21;
  }
  -[AXPIFingerEventTouchInfo setNormalizedLocation:](v8, "setNormalizedLocation:", v10 / v17, v12 / v19);
  -[AXPIFingerEventTouchInfo setForce:](v8, "setForce:", a4);
  return v8;
}

- (id)_eventTouchInfoForFinger:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "location");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "force");
  -[AXPIFingerController _eventTouchInfoForFingerLocation:force:](self, "_eventTouchInfoForFingerLocation:force:", v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location3D");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setLocation3D:", v11);
  return v10;
}

- (id)_touchInfosByIdentifierForPressedFingers
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_fingerModels;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = 1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "isPressed", (_QWORD)v14))
        {
          -[AXPIFingerController _eventTouchInfoForFinger:](self, "_eventTouchInfoForFinger:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8 + i);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v12);

        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v8 += i;
    }
    while (v6);
  }

  return v3;
}

- (void)pressFingersDownAnimated:(BOOL)a3 sendTouchEvents:(BOOL)a4
{
  _QWORD v6[5];
  BOOL v7;

  -[AXPIFingerContainerView setShouldAnimatePress:](self->_fingerContainerView, "setShouldAnimatePress:", a3);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__AXPIFingerController_pressFingersDownAnimated_sendTouchEvents___block_invoke;
  v6[3] = &unk_24F478A00;
  v7 = a4;
  v6[4] = self;
  -[AXPIFingerController enumerateFingersUsingBlock:](self, "enumerateFingersUsingBlock:", v6);
  -[AXPIFingerContainerView setShouldAnimatePress:](self->_fingerContainerView, "setShouldAnimatePress:", 0);
}

void __65__AXPIFingerController_pressFingersDownAnimated_sendTouchEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v3, "setPressed:sendDelegateCallback:", 1, 1);
LABEL_5:
    v5 = v6;
    goto LABEL_6;
  }
  objc_msgSend(v3, "setPressed:sendDelegateCallback:", 1, 0);
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "indexOfObject:", v6);
  v5 = v6;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateWithFingerModel:forFingerAtIndex:", v6, v4);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)liftFingersUpAnimated:(BOOL)a3 sendTouchEvents:(BOOL)a4
{
  _QWORD v6[5];
  BOOL v7;

  -[AXPIFingerContainerView setShouldAnimatePress:](self->_fingerContainerView, "setShouldAnimatePress:", a3);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__AXPIFingerController_liftFingersUpAnimated_sendTouchEvents___block_invoke;
  v6[3] = &unk_24F478A00;
  v7 = a4;
  v6[4] = self;
  -[AXPIFingerController enumerateFingersUsingBlock:](self, "enumerateFingersUsingBlock:", v6);
  -[AXPIFingerContainerView setShouldAnimatePress:](self->_fingerContainerView, "setShouldAnimatePress:", 0);
}

void __62__AXPIFingerController_liftFingersUpAnimated_sendTouchEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v3, "setPressed:sendDelegateCallback:", 0, 1);
LABEL_5:
    v5 = v6;
    goto LABEL_6;
  }
  objc_msgSend(v3, "setPressed:sendDelegateCallback:", 0, 0);
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "indexOfObject:", v6);
  v5 = v6;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateWithFingerModel:forFingerAtIndex:", v6, v4);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)pressFingersDownAnimated:(BOOL)a3
{
  -[AXPIFingerController pressFingersDownAnimated:sendTouchEvents:](self, "pressFingersDownAnimated:sendTouchEvents:", a3, 1);
}

- (void)liftFingersUpAnimated:(BOOL)a3
{
  -[AXPIFingerController liftFingersUpAnimated:sendTouchEvents:](self, "liftFingersUpAnimated:sendTouchEvents:", a3, 1);
}

- (void)performCircularProgressAnimationOnFingersWithDuration:(double)a3 completion:(id)a4
{
  id v6;

  v6 = a4;
  -[AXPIFingerController cancelCircularProgressAnimation](self, "cancelCircularProgressAnimation");
  -[AXPIFingerContainerView performCircularProgressAnimationOnFingersWithDuration:completion:](self->_fingerContainerView, "performCircularProgressAnimationOnFingersWithDuration:completion:", v6, a3);

}

- (void)cancelCircularProgressAnimation
{
  -[AXPIFingerContainerView cancelCircularProgressAnimation](self->_fingerContainerView, "cancelCircularProgressAnimation");
}

- (void)enumerateFingersUsingBlock:(id)a3
{
  id v4;
  NSMutableArray *fingerModels;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[AXPIFingerController beginUpdates](self, "beginUpdates");
  fingerModels = self->_fingerModels;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__AXPIFingerController_enumerateFingersUsingBlock___block_invoke;
  v7[3] = &unk_24F478A28;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](fingerModels, "enumerateObjectsUsingBlock:", v7);
  -[AXPIFingerController endUpdates](self, "endUpdates");

}

uint64_t __51__AXPIFingerController_enumerateFingersUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CGPoint)midpointForFingers
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  +[AXPIFingerUtilities pointStringsForFingerModels:](AXPIFingerUtilities, "pointStringsForFingerModels:", self->_fingerModels);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AX_CGPointGetMidpointOfAllPoints();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)midpointOfStartingFingersForGesture:(id)a3
{
  id v3;
  double v4;
  double v5;
  __int128 v6;
  CGPoint result;

  v6 = *MEMORY[0x24BDBEFB0];
  v3 = -[AXPIFingerController _handleStartingFingersForGesture:animated:startPointForAnimation:midpoint:showFingers:](self, "_handleStartingFingersForGesture:animated:startPointForAnimation:midpoint:showFingers:", a3, 0, &v6, 0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  v5 = *((double *)&v6 + 1);
  v4 = *(double *)&v6;
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)_showStartingFingersForGesture:(id)a3 animated:(BOOL)a4 startPointForAnimation:(CGPoint)a5
{
  return -[AXPIFingerController _handleStartingFingersForGesture:animated:startPointForAnimation:midpoint:showFingers:](self, "_handleStartingFingersForGesture:animated:startPointForAnimation:midpoint:showFingers:", a3, a4, 0, 1, a5.x, a5.y);
}

- (id)_handleStartingFingersForGesture:(id)a3 animated:(BOOL)a4 startPointForAnimation:(CGPoint)a5 midpoint:(CGPoint *)a6 showFingers:(BOOL)a7
{
  _BOOL4 v7;
  double y;
  double x;
  id v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  unint64_t v31;
  _BOOL4 v33;
  uint64_t v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v7 = a7;
  y = a5.y;
  x = a5.x;
  v33 = a4;
  v42 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v12 = *MEMORY[0x24BDBEFB0];
  v11 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(MEMORY[0x24BE00728], "server");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "activeInterfaceOrientation");

  objc_msgSend(v10, "updateForLandscape:", (unint64_t)(v14 - 3) < 2);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v10, "numberOfEvents");
  if (v35)
  {
    for (i = 0; i != v35; ++i)
    {
      objc_msgSend(v10, "fingerIdentifiersAtEventIndex:", i);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v38;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v38 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
            if ((objc_msgSend(v15, "containsObject:", v23) & 1) == 0)
            {
              objc_msgSend(v15, "addObject:", v23);
              objc_msgSend(v10, "pointForFingerIdentifier:atEventIndex:", v23, i);
              v25 = v24;
              v27 = v26;
              if (objc_msgSend(v10, "arePointsDeviceRelative"))
              {
                -[AXPIFingerController _fingerLocationFromSceneReferencePoint:](self, "_fingerLocationFromSceneReferencePoint:", v25, v27);
                v25 = v28;
                v27 = v29;
              }
              v12 = v12 + v25;
              v11 = v11 + v27;
              if (v7)
              {
                +[AXPIFingerModel fingerModelForLocation:](AXPIFingerModel, "fingerModelForLocation:", v25, v27);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "addObject:", v30);

              }
            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v20);
      }

    }
  }
  v31 = objc_msgSend(v15, "count");
  if (v31)
  {
    v12 = v12 / (double)v31;
    v11 = v11 / (double)v31;
  }
  if (a6)
  {
    a6->x = v12;
    a6->y = v11;
  }
  if (v7)
    -[AXPIFingerController _showFingerModels:animated:startPointForAnimation:shouldShowPinchChain:shouldReuseFingers:](self, "_showFingerModels:animated:startPointForAnimation:shouldShowPinchChain:shouldReuseFingers:", v16, v33, 0, objc_msgSend(v16, "count") == -[NSMutableArray count](self->_fingerModels, "count"), x, y);

  return v15;
}

- (void)showStartingFingersForGesture:(id)a3
{
  -[AXPIFingerController showStartingFingersForGesture:animated:startPointForAnimation:](self, "showStartingFingersForGesture:animated:startPointForAnimation:", a3, 1, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
}

- (void)showStartingFingersForGesture:(id)a3 animated:(BOOL)a4 startPointForAnimation:(CGPoint)a5
{
  id v5;

  v5 = -[AXPIFingerController _showStartingFingersForGesture:animated:startPointForAnimation:](self, "_showStartingFingersForGesture:animated:startPointForAnimation:", a3, a4, a5.x, a5.y);
}

- (void)_replayEventAtIndex:(unint64_t)a3 inGesture:(id)a4 allFingerIdentifiers:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  unint64_t v23;

  v8 = a4;
  v9 = a5;
  -[AXPIFingerController beginUpdates](self, "beginUpdates");
  v10 = objc_msgSend(v8, "numberOfEvents");
  objc_msgSend(v8, "fingerIdentifiersAtEventIndex:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __75__AXPIFingerController__replayEventAtIndex_inGesture_allFingerIdentifiers___block_invoke;
  v20[3] = &unk_24F478A50;
  v20[4] = self;
  v12 = v11;
  v21 = v12;
  v19 = v8;
  v22 = v19;
  v23 = a3;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v20);

  -[AXPIFingerController endUpdates](self, "endUpdates");
  objc_msgSend(v19, "timeAtEventIndex:", a3);
  if (v10 - 1 > a3)
  {
    v14 = v13;
    objc_msgSend(v19, "timeAtEventIndex:", a3 + 1);
    v16 = v15 - v14;
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "runUntilDate:", v18);

  }
}

void __75__AXPIFingerController__replayEventAtIndex_inGesture_allFingerIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v12))
  {
    objc_msgSend(*(id *)(a1 + 48), "pointForFingerIdentifier:atEventIndex:", v12, *(_QWORD *)(a1 + 56));
    v7 = v6;
    v9 = v8;
    if (objc_msgSend(*(id *)(a1 + 48), "arePointsDeviceRelative"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_fingerLocationFromSceneReferencePoint:", v7, v9);
      v7 = v10;
      v9 = v11;
    }
    objc_msgSend(v5, "setLocation:", v7, v9);
    objc_msgSend(v5, "setPressed:", 1);
    objc_msgSend(*(id *)(a1 + 48), "forceForFingerIdentifier:atEventIndex:", v12, *(_QWORD *)(a1 + 56));
    objc_msgSend(v5, "setForce:");
  }
  else
  {
    objc_msgSend(v5, "setPressed:", 0);
  }

}

- (void)performGesture:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __39__AXPIFingerController_performGesture___block_invoke;
  v3[3] = &unk_24F478A78;
  v3[4] = self;
  -[AXPIFingerController performGesture:completion:](self, "performGesture:completion:", a3, v3);
}

uint64_t __39__AXPIFingerController_performGesture___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearAllFingersAnimated:endPointForAnimation:", 1, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
}

- (void)performGesture:(id)a3 completion:(id)a4
{
  -[AXPIFingerController _performGesture:shouldShowFingers:completion:](self, "_performGesture:shouldShowFingers:completion:", a3, 1, a4);
}

- (void)performWithoutPreparingGesture:(id)a3 completion:(id)a4
{
  -[AXPIFingerController _performGesture:shouldShowFingers:completion:](self, "_performGesture:shouldShowFingers:completion:", a3, 0, a4);
}

- (void)_performGesture:(id)a3 shouldShowFingers:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  unint64_t v10;
  _BOOL8 v11;
  void *v12;
  id gestureCompletion;
  uint64_t v14;
  unint64_t v15;
  id v16;

  v6 = a4;
  v16 = a3;
  v8 = a5;
  -[AXPIFingerEventSender startNewGeneration](self->_eventSender, "startNewGeneration");
  -[AXPIFingerController _handleStartingFingersForGesture:animated:startPointForAnimation:midpoint:showFingers:](self, "_handleStartingFingersForGesture:animated:startPointForAnimation:midpoint:showFingers:", v16, 0, 0, v6, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v16, "numberOfEvents");
  v11 = 1;
  self->_isPerformingGesture = 1;
  v12 = (void *)MEMORY[0x22E2DFEB0](v8);
  gestureCompletion = self->_gestureCompletion;
  self->_gestureCompletion = v12;

  if (v10)
  {
    -[AXPIFingerController _replayEventAtIndex:inGesture:allFingerIdentifiers:](self, "_replayEventAtIndex:inGesture:allFingerIdentifiers:", 0, v16, v9);
    if (self->_isPerformingGesture)
    {
      v14 = 1;
      do
      {
        v15 = v14;
        if (v10 == v14)
          break;
        -[AXPIFingerController _replayEventAtIndex:inGesture:allFingerIdentifiers:](self, "_replayEventAtIndex:inGesture:allFingerIdentifiers:", v14, v16, v9);
        v14 = v15 + 1;
      }
      while (self->_isPerformingGesture);
      v11 = v15 >= v10;
    }
    else
    {
      v11 = 0;
    }
  }
  -[AXPIFingerController _endGestureWithSuccess:](self, "_endGestureWithSuccess:", v11);

}

- (void)cancelGesture
{
  self->_isPerformingGesture = 0;
}

- (void)_interruptGestureIfNeeded
{
  if (self->_isPerformingGesture)
    -[AXPIFingerController _endGestureWithSuccess:](self, "_endGestureWithSuccess:", 0);
}

- (void)_endGestureWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  id gestureCompletion;
  void (**v6)(id, _BOOL8);

  v3 = a3;
  -[AXPIFingerController liftFingersUpAnimated:](self, "liftFingersUpAnimated:", 1);
  self->_isPerformingGesture = 0;
  if (self->_gestureCompletion)
  {
    v6 = (void (**)(id, _BOOL8))MEMORY[0x22E2DFEB0]();
    gestureCompletion = self->_gestureCompletion;
    self->_gestureCompletion = 0;

    v6[2](v6, v3);
  }
}

- (id)fingerModelAtPoint:(CGPoint)a3
{
  unint64_t v4;
  void *v5;

  v4 = -[AXPIFingerContainerView indexOfFingerAtPoint:](self->_fingerContainerView, "indexOfFingerAtPoint:", a3.x, a3.y);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_fingerModels, "objectAtIndexedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (AXAssertionCoordinator)suppressVisualsAssertionCoodinator
{
  AXAssertionCoordinator *suppressVisualsAssertionCoodinator;
  AXAssertionCoordinator *v4;
  AXAssertionCoordinator *v5;

  suppressVisualsAssertionCoodinator = self->_suppressVisualsAssertionCoodinator;
  if (!suppressVisualsAssertionCoodinator)
  {
    v4 = (AXAssertionCoordinator *)objc_msgSend(objc_alloc(MEMORY[0x24BE005B8]), "initWithIdentifier:delegate:", CFSTR("SuppressVisualsAssertion"), self);
    v5 = self->_suppressVisualsAssertionCoodinator;
    self->_suppressVisualsAssertionCoodinator = v4;

    suppressVisualsAssertionCoodinator = self->_suppressVisualsAssertionCoodinator;
  }
  return suppressVisualsAssertionCoodinator;
}

- (id)acquireAssertionToSuppressVisualsWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AXPIFingerController suppressVisualsAssertionCoodinator](self, "suppressVisualsAssertionCoodinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "acquireAssertionWithReason:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)assertionCoordinator:(id)a3 assertionsDidBecomeActive:(BOOL)a4
{
  AXPerformBlockOnMainThread();
}

uint64_t __71__AXPIFingerController_assertionCoordinator_assertionsDidBecomeActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setShouldSuppressFingerVisuals:", *(unsigned __int8 *)(a1 + 40));
}

- (id)_pointStringsFromFingers
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;
  CGPoint v17;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_fingerModels;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "location", (_QWORD)v11);
        NSStringFromCGPoint(v17);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)legacyPressFingersDown
{
  -[AXPIFingerController pressFingersDownAnimated:](self, "pressFingersDownAnimated:", 1);
  return -[AXPIFingerController _pointStringsFromFingers](self, "_pointStringsFromFingers");
}

- (id)legacyLiftFingersUp
{
  -[AXPIFingerController liftFingersUpAnimated:](self, "liftFingersUpAnimated:", 1);
  return -[AXPIFingerController _pointStringsFromFingers](self, "_pointStringsFromFingers");
}

- (BOOL)moveFingersToPoints:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  BOOL v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGPoint v30;
  CGRect v31;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AXPIFingerContainerView bounds](self->_fingerContainerView, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v30 = CGPointFromString((NSString *)*(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
        v31.origin.x = v6;
        v31.origin.y = v8;
        v31.size.width = v10;
        v31.size.height = v12;
        if (!CGRectContainsPoint(v31, v30))
        {
          v19 = 0;
          v20 = v13;
          goto LABEL_12;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v15)
        continue;
      break;
    }
  }

  v18 = -[NSMutableArray count](self->_fingerModels, "count");
  if (v18 == objc_msgSend(v13, "count"))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __44__AXPIFingerController_moveFingersToPoints___block_invoke;
    v22[3] = &unk_24F4789D8;
    v23 = v13;
    -[AXPIFingerController enumerateFingersUsingBlock:](self, "enumerateFingersUsingBlock:", v22);
    v19 = 1;
    v20 = v23;
LABEL_12:

  }
  else
  {
    v19 = 1;
  }

  return v19;
}

void __44__AXPIFingerController_moveFingersToPoints___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  NSString *v5;
  CGPoint v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = CGPointFromString(v5);

  objc_msgSend(v7, "setLocation:", v6.x, v6.y);
}

- (BOOL)moveFingersTo3DPoints:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = -[NSMutableArray count](self->_fingerModels, "count");
  if (v5 == objc_msgSend(v4, "count"))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __46__AXPIFingerController_moveFingersTo3DPoints___block_invoke;
    v7[3] = &unk_24F4789D8;
    v8 = v4;
    -[AXPIFingerController enumerateFingersUsingBlock:](self, "enumerateFingersUsingBlock:", v7);

  }
  return 1;
}

void __46__AXPIFingerController_moveFingersTo3DPoints___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocation3D:", v6);

}

- (CGRect)rectForFingersAtPoints:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[AXPIFingerContainerView rectForFingersAtPoints:](self->_fingerContainerView, "rectForFingersAtPoints:", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)animateToTapWithDuration:(double)a3
{
  -[AXPIFingerContainerView animateToTapWithDuration:](self->_fingerContainerView, "animateToTapWithDuration:", a3);
}

- (void)performDownAtPoint:(CGPoint)a3
{
  AXPIFingerEventSender *eventSender;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  eventSender = self->_eventSender;
  -[AXPIFingerController _eventTouchInfoForFingerLocation:force:](self, "_eventTouchInfoForFingerLocation:force:", a3.x, a3.y, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPIFingerEventSender performDownWithTouches:](eventSender, "performDownWithTouches:", v5);

}

- (void)performMoveToPoint:(CGPoint)a3
{
  AXPIFingerEventSender *eventSender;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  eventSender = self->_eventSender;
  -[AXPIFingerController _eventTouchInfoForFingerLocation:force:](self, "_eventTouchInfoForFingerLocation:force:", a3.x, a3.y, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPIFingerEventSender performMoveWithTouches:](eventSender, "performMoveWithTouches:", v5);

}

- (void)performUpAtPoint:(CGPoint)a3
{
  AXPIFingerEventSender *eventSender;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  eventSender = self->_eventSender;
  -[AXPIFingerController _eventTouchInfoForFingerLocation:force:](self, "_eventTouchInfoForFingerLocation:force:", a3.x, a3.y, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPIFingerEventSender performUpWithTouches:](eventSender, "performUpWithTouches:", v5);

}

- (void)_sendMoveEventIfNeededForFingerModel:(id)a3 atIndex:(unint64_t)a4
{
  AXPIFingerEventSender *eventSender;
  id v6;

  if (objc_msgSend(a3, "isPressed"))
  {
    if (-[AXPIFingerController _isInUpdateBlock](self, "_isInUpdateBlock"))
    {
      self->_didMoveFingersDuringUpdate = 1;
    }
    else
    {
      eventSender = self->_eventSender;
      -[AXPIFingerController _touchInfosByIdentifierForPressedFingers](self, "_touchInfosByIdentifierForPressedFingers");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[AXPIFingerEventSender performMoveWithTouchesByFingerIdentifier:](eventSender, "performMoveWithTouchesByFingerIdentifier:", v6);

    }
  }
}

- (void)didUpdateForceForFingerModel:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = -[NSMutableArray indexOfObject:](self->_fingerModels, "indexOfObject:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    -[AXPIFingerController updateWithFingerModel:forFingerAtIndex:](self, "updateWithFingerModel:forFingerAtIndex:", v6, v4);
    -[AXPIFingerController _sendMoveEventIfNeededForFingerModel:atIndex:](self, "_sendMoveEventIfNeededForFingerModel:atIndex:", v6, v5);
  }

}

- (void)didUpdateLocationForFingerModel:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = -[NSMutableArray indexOfObject:](self->_fingerModels, "indexOfObject:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    -[AXPIFingerController updateWithFingerModel:forFingerAtIndex:](self, "updateWithFingerModel:forFingerAtIndex:", v6, v4);
    -[AXPIFingerController _sendMoveEventIfNeededForFingerModel:atIndex:](self, "_sendMoveEventIfNeededForFingerModel:atIndex:", v6, v5);
  }

}

- (void)updateWithFingerModel:(id)a3 forFingerAtIndex:(unint64_t)a4
{
  -[AXPIFingerContainerView updateWithFingerModel:forFingerAtIndex:](self->_fingerContainerView, "updateWithFingerModel:forFingerAtIndex:", a3, a4);
}

- (void)didUpdatePressStateForFingerModel:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  NSMutableDictionary *downInfosByIdentifier;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  int v14;
  AXPIFingerEventSender *eventSender;
  NSMutableDictionary *v16;
  NSMutableDictionary *upInfosByIdentifier;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[NSMutableArray indexOfObject:](self->_fingerModels, "indexOfObject:", v4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    -[AXPIFingerController updateWithFingerModel:forFingerAtIndex:](self, "updateWithFingerModel:forFingerAtIndex:", v4, v5);
    v7 = -[AXPIFingerController _fingerIdentifierForIndex:](self, "_fingerIdentifierForIndex:", v6);
    -[AXPIFingerController _eventTouchInfoForFinger:](self, "_eventTouchInfoForFinger:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[AXPIFingerController _isInUpdateBlock](self, "_isInUpdateBlock"))
    {
      if (objc_msgSend(v4, "isPressed"))
      {
        downInfosByIdentifier = self->_downInfosByIdentifier;
        if (!downInfosByIdentifier)
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
          v11 = self->_downInfosByIdentifier;
          self->_downInfosByIdentifier = v10;

          downInfosByIdentifier = self->_downInfosByIdentifier;
        }
      }
      else
      {
        downInfosByIdentifier = self->_upInfosByIdentifier;
        if (!downInfosByIdentifier)
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
          upInfosByIdentifier = self->_upInfosByIdentifier;
          self->_upInfosByIdentifier = v16;

          downInfosByIdentifier = self->_upInfosByIdentifier;
        }
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](downInfosByIdentifier, "setObject:forKeyedSubscript:", v8, v18);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v12;
      v20[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v4, "isPressed");
      eventSender = self->_eventSender;
      if (v14)
        -[AXPIFingerEventSender performDownWithTouchesByFingerIdentifier:](eventSender, "performDownWithTouchesByFingerIdentifier:", v13);
      else
        -[AXPIFingerEventSender performUpWithTouchesByFingerIdentifier:](eventSender, "performUpWithTouchesByFingerIdentifier:", v13);

    }
  }

}

- (void)didUpdateSelectedStateForFingerModel:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = -[NSMutableArray indexOfObject:](self->_fingerModels, "indexOfObject:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    -[AXPIFingerController updateWithFingerModel:forFingerAtIndex:](self, "updateWithFingerModel:forFingerAtIndex:", v5, v4);

}

- (void)didUpdateShapeForFingerModel:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = -[NSMutableArray indexOfObject:](self->_fingerModels, "indexOfObject:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    -[AXPIFingerController updateWithFingerModel:forFingerAtIndex:](self, "updateWithFingerModel:forFingerAtIndex:", v5, v4);

}

- (unint64_t)_fingerIdentifierForIndex:(unint64_t)a3
{
  return a3 + 1;
}

- (BOOL)_isInUpdateBlock
{
  return self->_updateCount != 0;
}

- (void)beginUpdates
{
  ++self->_updateCount;
}

- (void)endUpdates
{
  unint64_t updateCount;
  unint64_t v4;
  AXPIFingerEventSender *eventSender;
  void *v6;
  NSMutableDictionary *downInfosByIdentifier;
  NSMutableDictionary *upInfosByIdentifier;

  updateCount = self->_updateCount;
  if (updateCount)
  {
    v4 = updateCount - 1;
    self->_updateCount = v4;
    if (!v4)
    {
      -[AXPIFingerEventSender performDownWithTouchesByFingerIdentifier:](self->_eventSender, "performDownWithTouchesByFingerIdentifier:", self->_downInfosByIdentifier);
      if (self->_didMoveFingersDuringUpdate)
      {
        eventSender = self->_eventSender;
        -[AXPIFingerController _touchInfosByIdentifierForPressedFingers](self, "_touchInfosByIdentifierForPressedFingers");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXPIFingerEventSender performMoveWithTouchesByFingerIdentifier:](eventSender, "performMoveWithTouchesByFingerIdentifier:", v6);

      }
      -[AXPIFingerEventSender performUpWithTouchesByFingerIdentifier:](self->_eventSender, "performUpWithTouchesByFingerIdentifier:", self->_upInfosByIdentifier);
      downInfosByIdentifier = self->_downInfosByIdentifier;
      self->_downInfosByIdentifier = 0;

      upInfosByIdentifier = self->_upInfosByIdentifier;
      self->_upInfosByIdentifier = 0;

      self->_didMoveFingersDuringUpdate = 0;
    }
  }
}

- (void)setAppearanceDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!v4)
  {
    AXPIDefaultAppearanceForDevice();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  objc_storeWeak((id *)&self->_appearanceDelegate, v4);
  -[AXPIFingerContainerView setAppearanceDelegate:](self->_fingerContainerView, "setAppearanceDelegate:", v5);

}

- (UIView)fingerContainerView
{
  return &self->_fingerContainerView->super;
}

- (NSArray)fingerModels
{
  return &self->_fingerModels->super;
}

- (BOOL)isPerformingGesture
{
  return self->_isPerformingGesture;
}

- (AXPIFingerAppearanceDelegate)appearanceDelegate
{
  return (AXPIFingerAppearanceDelegate *)objc_loadWeakRetained((id *)&self->_appearanceDelegate);
}

- (UIWindow)fixedReferenceWindow
{
  return self->_fixedReferenceWindow;
}

- (void)setFixedReferenceWindow:(id)a3
{
  objc_storeStrong((id *)&self->_fixedReferenceWindow, a3);
}

- (CGRect)fixedReferenceBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_fixedReferenceBounds.origin.x;
  y = self->_fixedReferenceBounds.origin.y;
  width = self->_fixedReferenceBounds.size.width;
  height = self->_fixedReferenceBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFixedReferenceBounds:(CGRect)a3
{
  self->_fixedReferenceBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fixedReferenceWindow, 0);
  objc_destroyWeak((id *)&self->_appearanceDelegate);
  objc_storeStrong((id *)&self->_suppressVisualsAssertionCoodinator, 0);
  objc_storeStrong(&self->_gestureCompletion, 0);
  objc_storeStrong((id *)&self->_upInfosByIdentifier, 0);
  objc_storeStrong((id *)&self->_downInfosByIdentifier, 0);
  objc_storeStrong((id *)&self->_eventSender, 0);
  objc_storeStrong((id *)&self->_fingerModels, 0);
  objc_storeStrong((id *)&self->_fingerContainerView, 0);
}

@end
