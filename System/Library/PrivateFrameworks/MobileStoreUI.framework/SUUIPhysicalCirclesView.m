@implementation SUUIPhysicalCirclesView

- (SUUIPhysicalCirclesView)initWithFrame:(CGRect)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SUUIPhysicalCirclesView;
  v3 = -[SUUIPhysicalCirclesView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = SUUIPhysicsKitFramework();
    *((_QWORD *)v3 + 71) = v4;
    v5 = objc_alloc_init((Class)SUUIWeakLinkedClassForString(CFSTR("PKPhysicsWorld"), v4));
    v6 = (void *)*((_QWORD *)v3 + 72);
    *((_QWORD *)v3 + 72) = v5;

    objc_msgSend(*((id *)v3 + 72), "setContactDelegate:", v3);
    objc_msgSend(*((id *)v3 + 72), "setGravity:", 0.0, 0.0);
    v7 = objc_alloc_init((Class)SUUIWeakLinkedClassForString(CFSTR("PKPhysicsBody"), *((_QWORD *)v3 + 71)));
    v8 = (void *)*((_QWORD *)v3 + 65);
    *((_QWORD *)v3 + 65) = v7;

    objc_msgSend(*((id *)v3 + 65), "setPosition:", 0.0, 0.0);
    objc_msgSend(*((id *)v3 + 72), "addBody:", *((_QWORD *)v3 + 65));
    objc_msgSend(*((id *)v3 + 65), "setDynamic:", 0);
    *((_QWORD *)v3 + 66) = 0x7FFFFFFFFFFFFFFFLL;
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", v3, sel__longPressAction_);
    v10 = (void *)*((_QWORD *)v3 + 67);
    *((_QWORD *)v3 + 67) = v9;

    objc_msgSend(v3, "addGestureRecognizer:", *((_QWORD *)v3 + 67));
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD7E0]), "initWithTarget:action:", v3, sel__panGestureAction_);
    v12 = (void *)*((_QWORD *)v3 + 70);
    *((_QWORD *)v3 + 70) = v11;

    objc_msgSend(v3, "addGestureRecognizer:", *((_QWORD *)v3 + 70));
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", v3, sel__tapGestureAction_);
    v14 = (void *)*((_QWORD *)v3 + 74);
    *((_QWORD *)v3 + 74) = v13;

    objc_msgSend(v3, "addGestureRecognizer:", *((_QWORD *)v3 + 74));
    objc_msgSend(v3, "setClipsToBounds:", 1);
  }
  return (SUUIPhysicalCirclesView *)v3;
}

- (void)dealloc
{
  NSObject *circleLoadStepTimer;
  objc_super v4;

  circleLoadStepTimer = self->_circleLoadStepTimer;
  if (circleLoadStepTimer)
    dispatch_source_cancel(circleLoadStepTimer);
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  -[UILongPressGestureRecognizer removeTarget:action:](self->_longPressRecognizer, "removeTarget:action:", self, 0);
  -[SUUIPhysicalCirclesView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_longPressRecognizer);
  -[UIPanGestureRecognizer removeTarget:action:](self->_panRecognizer, "removeTarget:action:", self, 0);
  -[SUUIPhysicalCirclesView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_panRecognizer);
  -[UITapGestureRecognizer removeTarget:action:](self->_tapRecognizer, "removeTarget:action:", self, 0);
  -[SUUIPhysicalCirclesView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_tapRecognizer);
  v4.receiver = self;
  v4.super_class = (Class)SUUIPhysicalCirclesView;
  -[SUUIPhysicalCirclesView dealloc](&v4, sel_dealloc);
}

- (void)addCirclesWithCount:(int64_t)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  NSMutableArray *circleBodies;

  if (self->_circleLoadStepTimer)
  {
    -[SUUIPhysicalCirclesView reloadData](self, "reloadData", a3);
  }
  else
  {
    v5 = -[NSMutableArray count](self->_circleBodies, "count");
    if (!self->_circleBodies)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      circleBodies = self->_circleBodies;
      self->_circleBodies = v6;

    }
    -[SUUIPhysicalCirclesView _loadCirclesWithStartIndex:totalCount:](self, "_loadCirclesWithStartIndex:totalCount:", v5, v5 + a3);
  }
}

- (id)addRepellorWithCenter:(CGPoint)a3 radius:(double)a4 bufferSize:(double)a5
{
  double y;
  double x;
  SUUICircleRepellor *v10;
  void *v11;
  double v12;
  NSMutableArray *repellors;
  NSMutableArray *v14;
  NSMutableArray *v15;

  y = a3.y;
  x = a3.x;
  v10 = objc_alloc_init(SUUICircleRepellor);
  -[SUUICircleRepellor setBufferSize:](v10, "setBufferSize:", a5);
  -[SUUICircleRepellor setCenter:](v10, "setCenter:", x, y);
  -[SUUICircleRepellor setRadius:](v10, "setRadius:", a4);
  objc_msgSend(SUUIWeakLinkedClassForString(CFSTR("PKPhysicsBody"), (uint64_t)self->_physicsKitFramework), "bodyWithCircleOfRadius:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCategoryBitMask:", 1);
  objc_msgSend(v11, "setCollisionBitMask:", 1);
  objc_msgSend(v11, "setDensity:", 1.0);
  objc_msgSend(v11, "setFriction:", 0.0);
  objc_msgSend(v11, "setLinearDamping:", 0.2);
  -[SUUIPhysicalCirclesView bounds](self, "bounds");
  objc_msgSend(v11, "setPosition:", x, v12 - y);
  objc_msgSend(v11, "setRestitution:", 0.1);
  -[PKPhysicsWorld addBody:](self->_physicsWorld, "addBody:", v11);
  -[SUUICircleRepellor setPhysicsBody:](v10, "setPhysicsBody:", v11);
  objc_msgSend(v11, "setDynamic:", 0);
  repellors = self->_repellors;
  if (!repellors)
  {
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v15 = self->_repellors;
    self->_repellors = v14;

    repellors = self->_repellors;
  }
  -[NSMutableArray addObject:](repellors, "addObject:", v10);

  return v10;
}

- (id)circleViewAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;

  if (-[NSMutableArray count](self->_circleBodies, "count") <= (unint64_t)a3)
  {
    v6 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_circleBodies, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "representedObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)reloadData
{
  void *v3;
  _BOOL4 v4;
  double v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *circleBodies;
  id WeakRetained;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id location;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[SUUIPhysicalCirclesView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass") == 2;

  v5 = dbl_241EFCF40[v4];
  *(_QWORD *)&self->_maximumFrequencyDistance = qword_241EFCF30[v4];
  self->_minimumFrequencyDistance = v5;
  -[SUUIPhysicalCirclesView _cancelStepTimers](self, "_cancelStepTimers");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_circleBodies;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "representedObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeFromSuperview");
        -[PKPhysicsWorld removeBody:](self->_physicsWorld, "removeBody:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  -[PKPhysicsWorld removeAllJoints](self->_physicsWorld, "removeAllJoints");
  v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  circleBodies = self->_circleBodies;
  self->_circleBodies = v13;

  self->_longPressCircleIndex = 0x7FFFFFFFFFFFFFFFLL;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v16 = objc_msgSend(WeakRetained, "numberOfCirclesInCircleView:", self);

  if (v16 < 1)
  {
    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __37__SUUIPhysicalCirclesView_reloadData__block_invoke;
    v17[3] = &unk_2511F53F8;
    objc_copyWeak(&v18, &location);
    dispatch_async(MEMORY[0x24BDAC9B8], v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    -[SUUIPhysicalCirclesView _loadCirclesWithStartIndex:totalCount:](self, "_loadCirclesWithStartIndex:totalCount:", 0, v16);
  }
}

void __37__SUUIPhysicalCirclesView_reloadData__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reloadDidFinish");

}

- (void)removeAllCirclesAnimated:(BOOL)a3 completionBlock:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  NSMutableArray *obj;
  void *v28;
  _QWORD v29[4];
  id v30;
  SUUIPhysicalCirclesView *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v4 = a3;
  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[SUUIPhysicalCirclesView _cancelStepTimers](self, "_cancelStepTimers");
  v7 = -[NSMutableArray count](self->_circleBodies, "count");
  if (v4 && (v8 = v7) != 0)
  {
    v28 = v6;
    v40 = 0u;
    v41 = 0u;
    v39 = 0u;
    v38 = 0u;
    obj = self->_circleBodies;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v39;
      v13 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v39 != v12)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v15, "representedObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)MEMORY[0x24BEBDB00];
          v36[0] = v13;
          v36[1] = 3221225472;
          v36[2] = __68__SUUIPhysicalCirclesView_removeAllCirclesAnimated_completionBlock___block_invoke;
          v36[3] = &unk_2511F47C0;
          v18 = v16;
          v37 = v18;
          v29[0] = v13;
          v29[1] = 3221225472;
          v29[2] = __68__SUUIPhysicalCirclesView_removeAllCirclesAnimated_completionBlock___block_invoke_2;
          v29[3] = &unk_2511FD680;
          v30 = v18;
          v31 = self;
          v32 = v15;
          v33 = v28;
          v34 = v11 + i;
          v35 = v8;
          v19 = v18;
          objc_msgSend(v17, "animateWithDuration:delay:options:animations:completion:", 0x10000, v36, v29, 0.2, (double)(v11 + i) * 0.04);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        v11 += i;
      }
      while (v10);
    }

    -[NSMutableArray removeAllObjects](self->_circleBodies, "removeAllObjects");
    self->_longPressCircleIndex = 0x7FFFFFFFFFFFFFFFLL;
    v6 = v28;
  }
  else
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v20 = self->_circleBodies;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v43 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
          objc_msgSend(v25, "representedObject");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "removeFromSuperview");
          -[PKPhysicsWorld removeBody:](self->_physicsWorld, "removeBody:", v25);

        }
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v22);
    }

    -[NSMutableArray removeAllObjects](self->_circleBodies, "removeAllObjects");
    self->_longPressCircleIndex = 0x7FFFFFFFFFFFFFFFLL;
    if (v6)
      (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }

}

uint64_t __68__SUUIPhysicalCirclesView_removeAllCirclesAnimated_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.9, 0.9);
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __68__SUUIPhysicalCirclesView_removeAllCirclesAnimated_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 576), "removeBody:", *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 56);
  if (result)
  {
    if (*(_QWORD *)(a1 + 64) == *(_QWORD *)(a1 + 72) - 1)
      return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)removeAllRepellors
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)-[NSMutableArray copy](self->_repellors, "copy");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[SUUIPhysicalCirclesView removeRepellor:](self, "removeRepellor:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)removeCircleAtIndex:(int64_t)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v5;
  objc_class *v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = (objc_class *)MEMORY[0x24BDD15E0];
  v9 = a5;
  v10 = (id)objc_msgSend([v8 alloc], "initWithIndex:", a3);
  -[SUUIPhysicalCirclesView removeCirclesInIndexSet:animated:completionBlock:](self, "removeCirclesInIndexSet:animated:completionBlock:", v10, v5, v9);

}

- (void)removeCirclesInIndexSet:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  id v8;
  int64_t longPressCircleIndex;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  SUUIPhysicalCirclesView *v22;

  v8 = a5;
  longPressCircleIndex = self->_longPressCircleIndex;
  v10 = a3;
  if (objc_msgSend(v10, "containsIndex:", longPressCircleIndex))
    self->_longPressCircleIndex = 0x7FFFFFFFFFFFFFFFLL;
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __76__SUUIPhysicalCirclesView_removeCirclesInIndexSet_animated_completionBlock___block_invoke;
  v20[3] = &unk_2511F5CA8;
  v13 = v11;
  v21 = v13;
  v22 = self;
  objc_msgSend(v10, "enumerateIndexesWithOptions:usingBlock:", 2, v20);

  if (a4)
  {
    v14 = (void *)MEMORY[0x24BEBDB00];
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __76__SUUIPhysicalCirclesView_removeCirclesInIndexSet_animated_completionBlock___block_invoke_2;
    v18[3] = &unk_2511F47C0;
    v19 = v13;
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __76__SUUIPhysicalCirclesView_removeCirclesInIndexSet_animated_completionBlock___block_invoke_3;
    v15[3] = &unk_2511F9D98;
    v15[4] = self;
    v16 = v19;
    v17 = v8;
    objc_msgSend(v14, "animateWithDuration:delay:options:animations:completion:", 0x10000, v18, v15, 0.2, 0.0);

  }
  else
  {
    -[SUUIPhysicalCirclesView _removeCircleBodies:](self, "_removeCircleBodies:", v13);
    if (v8)
      (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }

}

uint64_t __76__SUUIPhysicalCirclesView_removeCirclesInIndexSet_animated_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 424), "objectAtIndex:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 424), "removeObjectAtIndex:", a2);
}

void __76__SUUIPhysicalCirclesView_removeCirclesInIndexSet_animated_completionBlock___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  CGAffineTransform v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v5), "representedObject");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setAlpha:", 0.0);
        CGAffineTransformMakeScale(&v7, 0.9, 0.9);
        objc_msgSend(v6, "setTransform:", &v7);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

}

uint64_t __76__SUUIPhysicalCirclesView_removeCirclesInIndexSet_animated_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_removeCircleBodies:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)removeCirclesInIndexSet:(id)a3 byAnimatingToPoint:(CGPoint)a4 delay:(double)a5 completionBlock:(id)a6
{
  double y;
  double x;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[5];
  id v49;
  _QWORD v50[3];
  _BYTE v51[128];
  uint64_t v52;

  y = a4.y;
  x = a4.x;
  v52 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a6;
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = MEMORY[0x24BDAC760];
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = __92__SUUIPhysicalCirclesView_removeCirclesInIndexSet_byAnimatingToPoint_delay_completionBlock___block_invoke;
  v48[3] = &unk_2511F5CA8;
  v48[4] = self;
  v15 = v13;
  v49 = v15;
  v36 = v11;
  objc_msgSend(v11, "enumerateIndexesWithOptions:usingBlock:", 2, v48);
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v16 = (void *)MEMORY[0x24BDE57D8];
  v45[0] = v14;
  v45[1] = 3221225472;
  v45[2] = __92__SUUIPhysicalCirclesView_removeCirclesInIndexSet_byAnimatingToPoint_delay_completionBlock___block_invoke_2;
  v45[3] = &unk_2511F4C08;
  v17 = v15;
  v46 = v17;
  v35 = v12;
  v47 = v35;
  objc_msgSend(v16, "setCompletionBlock:", v45);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v17;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v40)
  {
    v39 = *(_QWORD *)v42;
    v38 = *MEMORY[0x24BDE5978];
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v42 != v39)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v18), "layer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("position.x"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUUISimpleAnimationFactory easeQuadOutTimingFunction](SUUISimpleAnimationFactory, "easeQuadOutTimingFunction");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setTimingFunction:", v21);

        v22 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v19, "position");
        objc_msgSend(v22, "numberWithDouble:");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setFromValue:", v23);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", x);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setToValue:", v24);

        objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("position.y"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUUISimpleAnimationFactory easeQuadInTimingFunction](SUUISimpleAnimationFactory, "easeQuadInTimingFunction");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setTimingFunction:", v26);

        v27 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v19, "position");
        objc_msgSend(v27, "numberWithDouble:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setFromValue:", v29);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", y);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setToValue:", v30);

        objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUUISimpleAnimationFactory easeQuadInOutTimingFunction](SUUISimpleAnimationFactory, "easeQuadInOutTimingFunction");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setTimingFunction:", v32);

        objc_msgSend(v31, "setFromValue:", &unk_2512EEE38);
        objc_msgSend(v31, "setToValue:", &unk_2512EE7F8);
        objc_msgSend(MEMORY[0x24BDE5638], "animation");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v50[0] = v20;
        v50[1] = v25;
        v50[2] = v31;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 3);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setAnimations:", v34);

        objc_msgSend(v33, "setDuration:", 0.5);
        objc_msgSend(v33, "setFillMode:", v38);
        objc_msgSend(v33, "setRemovedOnCompletion:", 0);
        a5 = a5 + 0.075;
        objc_msgSend(v33, "setBeginTime:", a5 + CACurrentMediaTime());
        objc_msgSend(v19, "addAnimation:forKey:", v33, CFSTR("groupAnimation"));

        ++v18;
      }
      while (v40 != v18);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    }
    while (v40);
  }

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

void __92__SUUIPhysicalCirclesView_removeCirclesInIndexSet_byAnimatingToPoint_delay_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "objectAtIndex:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "representedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  objc_msgSend(*(id *)(a1 + 32), "bringSubviewToFront:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "removeBody:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "removeObjectAtIndex:", a2);

}

uint64_t __92__SUUIPhysicalCirclesView_removeCirclesInIndexSet_byAnimatingToPoint_delay_completionBlock___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "removeFromSuperview", (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)removeRepellor:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  PKPhysicsWorld *physicsWorld;
  void *v7;
  id v8;

  v8 = a3;
  v4 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_repellors, "indexOfObjectIdenticalTo:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    physicsWorld = self->_physicsWorld;
    objc_msgSend(v8, "physicsBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPhysicsWorld removeBody:](physicsWorld, "removeBody:", v7);

    -[NSMutableArray removeObjectAtIndex:](self->_repellors, "removeObjectAtIndex:", v5);
  }

}

- (void)setSize:(CGSize)a3 forCircleAtIndex:(int64_t)a4
{
  double width;
  float (*v6)(void);
  id v7;

  width = a3.width;
  -[NSMutableArray objectAtIndex:](self->_circleBodies, "objectAtIndex:", a4, a3.width, a3.height);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (float (*)(void))SUUIWeakLinkedSymbolForString("PKGet_INV_PTM_RATIO", self->_physicsKitFramework);
  if (v6)
    objc_msgSend(v7, "setRadius:", width * 0.5 * v6());
  -[SUUIPhysicalCirclesView _calculateFrequencyScaling](self, "_calculateFrequencyScaling");

}

- (void)startPhysics
{
  CADisplayLink *displayLink;
  CADisplayLink *v4;
  CADisplayLink *v5;
  CADisplayLink *v6;
  id v7;

  displayLink = self->_displayLink;
  if (displayLink)
    -[CADisplayLink invalidate](displayLink, "invalidate");
  objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", self, sel__displayLinkTick_);
  v4 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
  v5 = self->_displayLink;
  self->_displayLink = v4;

  v6 = self->_displayLink;
  objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CADisplayLink addToRunLoop:forMode:](v6, "addToRunLoop:forMode:", v7, *MEMORY[0x24BDBCB80]);

}

- (void)stopPhysics
{
  CADisplayLink *displayLink;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

}

- (void)_longPressAction:(id)a3
{
  void *v4;
  uint64_t v5;
  int64_t longPressCircleIndex;
  void *v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  -[SUUIPhysicalCirclesView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v12, "state");
  if ((unint64_t)(v5 - 3) >= 2)
  {
    if (v5 == 1)
    {
      objc_msgSend(v12, "locationInView:", self);
      v9 = -[SUUIPhysicalCirclesView _circleIndexForPoint:](self, "_circleIndexForPoint:");
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v10 = v9;
        self->_longPressCircleIndex = v9;
        -[NSMutableArray objectAtIndex:](self->_circleBodies, "objectAtIndex:", v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setDynamic:", 0);
        objc_msgSend(v7, "representedObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIPhysicalCirclesView _startFluctuationForCircleView:](self, "_startFluctuationForCircleView:", v11);

        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v4, "circleView:didBeginLongPressForCircleAtIndex:", self, v10);
        goto LABEL_9;
      }
    }
  }
  else
  {
    longPressCircleIndex = self->_longPressCircleIndex;
    self->_longPressCircleIndex = 0x7FFFFFFFFFFFFFFFLL;
    if (longPressCircleIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray objectAtIndex:](self->_circleBodies, "objectAtIndex:", longPressCircleIndex);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDynamic:", 1);
      objc_msgSend(v7, "representedObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIPhysicalCirclesView _stopFluctuationForCircleView:](self, "_stopFluctuationForCircleView:", v8);

      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v4, "circleView:didEndLongPressForCircleAtIndex:", self, longPressCircleIndex);
LABEL_9:

    }
  }

}

- (void)_panGestureAction:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  void *v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "state") == 2)
  {
    objc_msgSend(v4, "translationInView:", self);
    v6 = v5;
    v8 = v7;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = self->_circleBodies;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      v13 = -v8;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v15, "representedObject", (_QWORD)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "bounds");
          objc_msgSend(v15, "applyForce:", v6 * self->_constants.translationForceMultiplier * (v17 / self->_constants.circleMinimumDiameter * 1.5), self->_constants.translationForceMultiplier * v13 * (v17 / self->_constants.circleMinimumDiameter * 1.5));

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setTranslation:inView:", self, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  }

}

- (void)_tapGestureAction:(id)a3
{
  void *v4;
  int64_t v5;
  id v6;

  v6 = a3;
  -[SUUIPhysicalCirclesView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v6, "state") == 3)
  {
    objc_msgSend(v6, "locationInView:", self);
    v5 = -[SUUIPhysicalCirclesView _circleIndexForPoint:](self, "_circleIndexForPoint:");
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v4, "circleView:didTapCircleAtIndex:", self, v5);
  }

}

- (void)_displayLinkTick:(id)a3
{
  uint64_t i;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  PKPhysicsWorld *physicsWorld;
  id v33;
  NSMutableArray *obj;
  uint64_t v35;
  SUUIPhysicalCirclesView *v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v33 = a3;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = self->_circleBodies;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v37)
  {
    v35 = *(_QWORD *)v44;
    v36 = self;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v44 != v35)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v5, "position", v33);
        v7 = v6;
        v9 = v8;
        objc_msgSend(v5, "representedObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIPhysicalCirclesView bounds](self, "bounds");
        v12 = v11 - v9;
        objc_msgSend(v10, "setCenter:", v7, v12);
        objc_msgSend(v5, "joints");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[PKPhysicsWorld removeJoint:](self->_physicsWorld, "removeJoint:", v14);
          -[SUUIPhysicalCirclesView _calculateFrequencyScaling](self, "_calculateFrequencyScaling");
          -[SUUIPhysicalCirclesView _addSpringForCircleBody:](self, "_addSpringForCircleBody:", v5);
        }
        v38 = (void *)v14;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v15 = self->_repellors;
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v40;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v40 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
              objc_msgSend(v20, "center");
              v23 = v12 - v22;
              *(float *)&v21 = (v7 - v21) * (v7 - v21) + v23 * v23;
              v24 = sqrtf(*(float *)&v21);
              objc_msgSend(v10, "bounds");
              v26 = v25 * 0.5;
              objc_msgSend(v20, "bufferSize");
              v28 = v27;
              objc_msgSend(v20, "radius");
              if (v24 - v29 - v28 - v26 < 0.0)
              {
                v30 = v24 - v26;
                if (v24 - v26 <= v29)
                {
                  v31 = 50.0;
                }
                else
                {
                  v31 = 0.0;
                  if (v30 < v28 + v29)
                    v31 = (v30 - v29) / (v28 + v29 - v29) * -50.0 + 50.0;
                }
                objc_msgSend(v5, "applyForce:", 0.0, -v23 / v24 * v31);
              }
            }
            v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          }
          while (v17);
        }

        self = v36;
      }
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v37);
  }

  physicsWorld = self->_physicsWorld;
  objc_msgSend(v33, "duration");
  -[PKPhysicsWorld stepWithTime:velocityIterations:positionIterations:](physicsWorld, "stepWithTime:velocityIterations:positionIterations:", 8, 2);

}

- (BOOL)_addNextMissingSpringJoint
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = self->_circleBodies;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "joints", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (!v10)
        {
          -[SUUIPhysicalCirclesView _calculateFrequencyScaling](self, "_calculateFrequencyScaling");
          -[SUUIPhysicalCirclesView _addSpringForCircleBody:](self, "_addSpringForCircleBody:", v8);
          v11 = 1;
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)_addSpringForCircleBody:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  double v14;
  double minimumFrequencyDistance;
  double springMinimumFrequency;
  double maximumFrequencyDistance;
  id v18;

  v4 = a3;
  -[SUUIPhysicalCirclesView bounds](self, "bounds");
  v6 = v5 * 0.5;
  v8 = v7 * 0.5;
  objc_msgSend(v4, "position");
  v10 = v9;
  v12 = v11;
  objc_msgSend(SUUIWeakLinkedClassForString(CFSTR("PKPhysicsJointDistance"), (uint64_t)self->_physicsKitFramework), "jointWithBodyA:bodyB:localAnchorA:localAnchorB:", self->_groundBody, v4, v6, v8, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setCollideConnected:", 1);
  objc_msgSend(v18, "setDamping:", self->_constants.springDamping);
  v13 = (v8 - v12) * (v8 - v12) + (v6 - v10) * (v6 - v10);
  v14 = fabsf(sqrtf(v13));
  minimumFrequencyDistance = self->_minimumFrequencyDistance;
  springMinimumFrequency = self->_constants.springMinimumFrequency;
  if (minimumFrequencyDistance < v14)
  {
    maximumFrequencyDistance = self->_maximumFrequencyDistance;
    if (maximumFrequencyDistance <= v14)
      springMinimumFrequency = self->_constants.springMaximumFrequency;
    else
      springMinimumFrequency = springMinimumFrequency
                             + (v14 - minimumFrequencyDistance)
                             / (maximumFrequencyDistance - minimumFrequencyDistance)
                             * (self->_constants.springMaximumFrequency - springMinimumFrequency);
  }
  objc_msgSend(v18, "setFrequency:", springMinimumFrequency);
  -[PKPhysicsWorld addJoint:](self->_physicsWorld, "addJoint:", v18);
  objc_msgSend(v18, "setLength:", 0.0);

}

- (void)_cancelStepTimers
{
  NSObject *circleLoadStepTimer;
  OS_dispatch_source *v4;

  circleLoadStepTimer = self->_circleLoadStepTimer;
  if (circleLoadStepTimer)
  {
    dispatch_source_cancel(circleLoadStepTimer);
    v4 = self->_circleLoadStepTimer;
    self->_circleLoadStepTimer = 0;

  }
}

- (void)_calculateFrequencyScaling
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  float v15;
  float v16;
  uint64_t v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = self->_circleBodies;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v20;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "joints", (_QWORD)v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v12)
        {
          objc_msgSend(v10, "representedObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "bounds");
          v8 = v8 + v14;
          ++v6;

        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);

    if (v6 >= 1)
    {
      v15 = v8 / (double)v6;
      v16 = sqrtf(v15);
      v17 = 16;
      if (v6 > 16)
        v17 = v6;
      v18 = (float)(v16 * (float)v17);
      self->_maximumFrequencyDistance = v18 * 4.0 * v18 * 0.00715;
      self->_minimumFrequencyDistance = v18 * 1.89999998 * v18 * 0.00715;
    }
  }
  else
  {

  }
}

- (id)_circleBodyWithView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  float v12;
  void *v13;
  double v14;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  v6 = v5;
  objc_msgSend(v4, "center");
  v8 = v7;
  v10 = v9;
  v11 = SUUIWeakLinkedClassForString(CFSTR("PKPhysicsBody"), (uint64_t)self->_physicsKitFramework);
  v12 = v6 * 0.5;
  objc_msgSend(v11, "bodyWithCircleOfRadius:", floorf(v12));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCategoryBitMask:", 1);
  objc_msgSend(v13, "setCollisionBitMask:", 1);
  objc_msgSend(v13, "setDensity:", self->_constants.circleDensity);
  objc_msgSend(v13, "setDynamic:", 1);
  objc_msgSend(v13, "setFriction:", 0.0);
  objc_msgSend(v13, "setLinearDamping:", self->_constants.circleLinearDamping);
  -[SUUIPhysicalCirclesView bounds](self, "bounds");
  objc_msgSend(v13, "setPosition:", v8, v14 - v10);
  objc_msgSend(v13, "setRepresentedObject:", v4);

  objc_msgSend(v13, "setRestitution:", 0.0);
  return v13;
}

- (int64_t)_circleIndexForPoint:(CGPoint)a3
{
  NSMutableArray *circleBodies;
  int64_t v4;
  _QWORD v6[5];
  CGPoint v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  circleBodies = self->_circleBodies;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__SUUIPhysicalCirclesView__circleIndexForPoint___block_invoke;
  v6[3] = &unk_2511FD6A8;
  v7 = a3;
  v6[4] = &v8;
  -[NSMutableArray enumerateObjectsUsingBlock:](circleBodies, "enumerateObjectsUsingBlock:", v6);
  v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __48__SUUIPhysicalCirclesView__circleIndexForPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  CGRect v8;

  objc_msgSend(a2, "representedObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  if (CGRectContainsPoint(v8, *(CGPoint *)(a1 + 40)))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }

}

- (CGPoint)_initialPositionForCircleIndex:(int64_t)a3 view:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int64_t v15;
  unint64_t v16;
  SUUIPhysicalCircleConstants *p_constants;
  double circleMinimumDiameter;
  int v19;
  double v20;
  float v21;
  float v22;
  double v23;
  float v24;
  double v25;
  CGPoint result;

  v6 = a4;
  -[SUUIPhysicalCirclesView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "bounds");
  v12 = v11;
  v14 = v13;

  if (a3 >= 0)
    v15 = a3;
  else
    v15 = a3 + 1;
  v16 = v15 >> 1;
  p_constants = &self->_constants;
  circleMinimumDiameter = p_constants->circleMinimumDiameter;
  v19 = rand();
  v20 = v12 + p_constants->circleMaximumDiameter + v12 * (double)(v16 >> 1) * 2.0;
  v21 = v8 + v20;
  *(float *)&v20 = v20;
  v22 = -*(float *)&v20;
  if ((a3 & 1) != 0)
    v22 = v21;
  v23 = floorf(v22);
  v24 = v10 * 0.5 + (double)(uint64_t)(2 * (v16 & 1)) * v14 - v14;
  v25 = (double)v19 / 2147483650.0 * (circleMinimumDiameter * 0.200000003) + 0.0 + roundf(v24);
  result.y = v25;
  result.x = v23;
  return result;
}

- (void)_loadCirclesWithStartIndex:(int64_t)a3 totalCount:(int64_t)a4
{
  int64_t v6;
  id WeakRetained;
  void *v8;
  void *v9;
  OS_dispatch_source *v10;
  OS_dispatch_source *circleLoadStepTimer;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id location;

  if (a3 < a4)
  {
    v6 = a3;
    do
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      objc_msgSend(WeakRetained, "circlesView:circleForIndex:", self, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUUIPhysicalCirclesView _initialPositionForCircleIndex:view:](self, "_initialPositionForCircleIndex:view:", v6, v8);
      objc_msgSend(v8, "setCenter:");
      objc_msgSend(v8, "setUserInteractionEnabled:", 0);
      -[SUUIPhysicalCirclesView _circleBodyWithView:](self, "_circleBodyWithView:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->_circleBodies, "addObject:", v9);
      -[PKPhysicsWorld addBody:](self->_physicsWorld, "addBody:", v9);
      -[SUUIPhysicalCirclesView addSubview:](self, "addSubview:", v8);

      ++v6;
    }
    while (a4 != v6);
  }
  v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
  circleLoadStepTimer = self->_circleLoadStepTimer;
  self->_circleLoadStepTimer = v10;

  dispatch_source_set_timer((dispatch_source_t)self->_circleLoadStepTimer, 0, 0x4C4B400uLL, 0);
  objc_initWeak(&location, self);
  v12 = self->_circleLoadStepTimer;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __65__SUUIPhysicalCirclesView__loadCirclesWithStartIndex_totalCount___block_invoke;
  v13[3] = &unk_2511F53F8;
  objc_copyWeak(&v14, &location);
  dispatch_source_set_event_handler(v12, v13);
  dispatch_resume((dispatch_object_t)self->_circleLoadStepTimer);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __65__SUUIPhysicalCirclesView__loadCirclesWithStartIndex_totalCount___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  char v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "_addNextMissingSpringJoint");
    v2 = v4;
    if ((v3 & 1) == 0)
    {
      objc_msgSend(v4, "_reloadDidFinish");
      v2 = v4;
    }
  }

}

- (void)_reloadDidFinish
{
  NSObject *circleLoadStepTimer;
  OS_dispatch_source *v4;
  id v5;

  circleLoadStepTimer = self->_circleLoadStepTimer;
  if (circleLoadStepTimer)
  {
    dispatch_source_cancel(circleLoadStepTimer);
    v4 = self->_circleLoadStepTimer;
    self->_circleLoadStepTimer = 0;

  }
  -[SUUIPhysicalCirclesView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "circleViewReloadDidFinish:", self);

}

- (void)_removeCircleBodies:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "representedObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeFromSuperview");
        -[PKPhysicsWorld removeBody:](self->_physicsWorld, "removeBody:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)_startFluctuationForCircleView:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BEBDB00];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__SUUIPhysicalCirclesView__startFluctuationForCircleView___block_invoke;
  v6[3] = &unk_2511F47C0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "animateKeyframesWithDuration:delay:options:animations:completion:", 8, v6, 0, 0.2, 0.0);

}

void __58__SUUIPhysicalCirclesView__startFluctuationForCircleView___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v2 = MEMORY[0x24BDAC760];
  v3 = (void *)MEMORY[0x24BEBDB00];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__SUUIPhysicalCirclesView__startFluctuationForCircleView___block_invoke_2;
  v10[3] = &unk_2511F47C0;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v3, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v10, 0.0, 0.33);
  v4 = (void *)MEMORY[0x24BEBDB00];
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __58__SUUIPhysicalCirclesView__startFluctuationForCircleView___block_invoke_3;
  v8[3] = &unk_2511F47C0;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v4, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v8, 0.33, 0.33);
  v5 = (void *)MEMORY[0x24BEBDB00];
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __58__SUUIPhysicalCirclesView__startFluctuationForCircleView___block_invoke_4;
  v6[3] = &unk_2511F47C0;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v5, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v6, 0.66, 0.33);

}

uint64_t __58__SUUIPhysicalCirclesView__startFluctuationForCircleView___block_invoke_2(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v4[0] = *MEMORY[0x24BDBD8B8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __58__SUUIPhysicalCirclesView__startFluctuationForCircleView___block_invoke_3(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;

  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, 1.05, 1.05);
  return objc_msgSend(v1, "setTransform:", &v3);
}

uint64_t __58__SUUIPhysicalCirclesView__startFluctuationForCircleView___block_invoke_4(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v4[0] = *MEMORY[0x24BDBD8B8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

- (void)_stopFluctuationForCircleView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimations");

  v5 = (void *)MEMORY[0x24BEBDB00];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__SUUIPhysicalCirclesView__stopFluctuationForCircleView___block_invoke;
  v7[3] = &unk_2511F47C0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "animateWithDuration:animations:", v7, 0.2);

}

uint64_t __57__SUUIPhysicalCirclesView__stopFluctuationForCircleView___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v4[0] = *MEMORY[0x24BDBD8B8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

- (SUUIPhysicalCircleConstants)constants
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[7].circleDensity;
  *(_OWORD *)&retstr->circleDensity = *(_OWORD *)&self[6].springDamping;
  *(_OWORD *)&retstr->circleMaximumDiameter = v3;
  v4 = *(_OWORD *)&self[7].springMaximumFrequency;
  *(_OWORD *)&retstr->springMaximumFrequency = *(_OWORD *)&self[7].circleMaximumDiameter;
  *(_OWORD *)&retstr->springDamping = v4;
  return self;
}

- (void)setConstants:(SUUIPhysicalCircleConstants *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->springDamping;
  v5 = *(_OWORD *)&a3->circleDensity;
  v4 = *(_OWORD *)&a3->circleMaximumDiameter;
  *(_OWORD *)&self->_constants.springMaximumFrequency = *(_OWORD *)&a3->springMaximumFrequency;
  *(_OWORD *)&self->_constants.springDamping = v3;
  *(_OWORD *)&self->_constants.circleDensity = v5;
  *(_OWORD *)&self->_constants.circleMaximumDiameter = v4;
}

- (SUUIPhysicalCirclesDataSource)dataSource
{
  return (SUUIPhysicalCirclesDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (SUUIPhysicalCirclesDelegate)delegate
{
  return (SUUIPhysicalCirclesDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_repellors, 0);
  objc_storeStrong((id *)&self->_physicsWorld, 0);
  objc_storeStrong((id *)&self->_panRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_groundBody, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_circleBodies, 0);
  objc_storeStrong((id *)&self->_circleLoadStepTimer, 0);
}

@end
