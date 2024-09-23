@implementation CKForceLayoutAnimator

- (CKForceLayoutAnimator)init
{
  return -[CKForceLayoutAnimator initWithReferenceView:](self, "initWithReferenceView:", 0);
}

- (CKForceLayoutAnimator)initWithReferenceView:(id)a3
{
  id v6;
  CKForceLayoutAnimator *v7;
  CKForceLayoutAnimator *v8;
  uint64_t v9;
  NSMutableSet *nodes;
  uint64_t v11;
  NSMutableSet *links;
  uint64_t v13;
  NSMapTable *weights;
  uint64_t v15;
  NSMapTable *previousCenters;
  uint64_t v17;
  NSMapTable *fixedNodes;
  uint64_t v19;
  CAShapeLayer *linesLayer;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v27;
  objc_super v28;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKForceLayoutAnimator.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("referenceView"));

  }
  v28.receiver = self;
  v28.super_class = (Class)CKForceLayoutAnimator;
  v7 = -[CKForceLayoutAnimator init](&v28, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_referenceView, a3);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    nodes = v8->_nodes;
    v8->_nodes = (NSMutableSet *)v9;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    links = v8->_links;
    v8->_links = (NSMutableSet *)v11;

    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    weights = v8->_weights;
    v8->_weights = (NSMapTable *)v13;

    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    previousCenters = v8->_previousCenters;
    v8->_previousCenters = (NSMapTable *)v15;

    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v17 = objc_claimAutoreleasedReturnValue();
    fixedNodes = v8->_fixedNodes;
    v8->_fixedNodes = (NSMapTable *)v17;

    *(_OWORD *)&v8->_linkDistance = xmmword_21EBBD0B0;
    *(_OWORD *)&v8->_friction = xmmword_21EBBD0C0;
    *(_OWORD *)&v8->_chargeDistance = xmmword_21EBBD0D0;
    v8->_gravity = 0.100000001;
    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v19 = objc_claimAutoreleasedReturnValue();
    linesLayer = v8->_linesLayer;
    v8->_linesLayer = (CAShapeLayer *)v19;

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithUserInterfaceStyle:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "resolvedColorWithTraitCollection:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "colorWithAlphaComponent:", 0.4);
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v8->_linesLayer, "setStrokeColor:", objc_msgSend(v24, "CGColor"));

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v8->_linesLayer, "setFillColor:", objc_msgSend(v25, "CGColor"));

  }
  return v8;
}

- (void)setLineColor:(id)a3
{
  -[CAShapeLayer setStrokeColor:](self->_linesLayer, "setStrokeColor:", objc_msgSend(objc_retainAutorelease(a3), "CGColor"));
}

- (UIColor)lineColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", -[CAShapeLayer strokeColor](self->_linesLayer, "strokeColor"));
}

- (double)lineWidth
{
  double result;

  -[CAShapeLayer lineWidth](self->_linesLayer, "lineWidth");
  return result;
}

- (void)setLineWidth:(double)a3
{
  -[CAShapeLayer setLineWidth:](self->_linesLayer, "setLineWidth:", a3);
}

- (void)addNode:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKForceLayoutAnimator.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("node"));

    v5 = 0;
  }
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", self->_referenceView);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKForceLayoutAnimator.m"), 81, CFSTR("Nodes must be direct children of the reference view"));

  }
  -[NSMutableSet addObject:](self->_nodes, "addObject:", v10);

}

- (void)removeNode:(id)a3
{
  id v4;
  NSMutableSet *links;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  links = self->_links;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __36__CKForceLayoutAnimator_removeNode___block_invoke;
  v8[3] = &unk_24E3425B8;
  v9 = v4;
  v7 = v4;
  -[NSMutableSet objectsPassingTest:](links, "objectsPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet minusSet:](links, "minusSet:", v6);

  -[NSMutableSet removeObject:](self->_nodes, "removeObject:", v7);
}

- (void)removeAllNodes
{
  -[NSMutableSet removeAllObjects](self->_links, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_nodes, "removeAllObjects");
}

- (void)linkNode:(id)a3 toNode:(id)a4
{
  id v7;
  NSMutableSet *links;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKForceLayoutAnimator.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firstNode"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKForceLayoutAnimator.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("secondNode"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  links = self->_links;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v12, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](links, "addObject:", v9);

}

- (void)unlinkNode:(id)a3 fromNode:(id)a4
{
  NSMutableSet *links;
  id v5;

  links = self->_links;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", a3, a4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](links, "removeObject:", v5);

}

- (void)fixNode:(id)a3 atPosition:(CGPoint)a4
{
  double y;
  double x;
  NSMapTable *fixedNodes;
  id v8;
  NSMapTable *previousCenters;
  id v10;

  y = a4.y;
  x = a4.x;
  fixedNodes = self->_fixedNodes;
  v8 = a3;
  -[NSMapTable setObject:forKey:](fixedNodes, "setObject:forKey:", MEMORY[0x24BDBD1C8], v8);
  previousCenters = self->_previousCenters;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", x, y);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](previousCenters, "setObject:forKey:", v10, v8);

}

- (void)releaseNode:(id)a3
{
  -[NSMapTable removeObjectForKey:](self->_fixedNodes, "removeObjectForKey:", a3);
}

- (void)setAlpha:(double)a3
{
  if (self->_alpha == 0.0)
  {
    if (a3 > 0.0)
    {
      self->_alpha = a3;
      -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 0);
    }
  }
  else
  {
    self->_alpha = fmax(a3, 0.0);
  }
}

- (void)start
{
  uint64_t v3;
  NSMutableSet *links;
  NSMutableSet *nodes;
  void *v6;
  CADisplayLink *displayLink;
  CADisplayLink *v8;
  CADisplayLink *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];

  -[NSMapTable removeAllObjects](self->_weights, "removeAllObjects");
  v3 = MEMORY[0x24BDAC760];
  links = self->_links;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __30__CKForceLayoutAnimator_start__block_invoke;
  v12[3] = &unk_24E3425E0;
  v12[4] = self;
  -[NSMutableSet enumerateObjectsUsingBlock:](links, "enumerateObjectsUsingBlock:", v12);
  -[NSMapTable removeAllObjects](self->_previousCenters, "removeAllObjects");
  nodes = self->_nodes;
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __30__CKForceLayoutAnimator_start__block_invoke_2;
  v11[3] = &unk_24E342608;
  v11[4] = self;
  -[NSMutableSet enumerateObjectsUsingBlock:](nodes, "enumerateObjectsUsingBlock:", v11);
  self->_alpha = fmax(self->_alpha, 0.100000001);
  -[UIView layer](self->_referenceView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertSublayer:atIndex:", self->_linesLayer, 0);

  displayLink = self->_displayLink;
  if (!displayLink)
  {
    objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", self, sel_tick);
    v8 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    v9 = self->_displayLink;
    self->_displayLink = v8;

    displayLink = self->_displayLink;
  }
  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CADisplayLink addToRunLoop:forMode:](displayLink, "addToRunLoop:forMode:", v10, *MEMORY[0x24BDBCB80]);

}

- (void)stop
{
  CADisplayLink *displayLink;

  self->_alpha = 0.0;
  -[CAShapeLayer removeFromSuperlayer](self->_linesLayer, "removeFromSuperlayer");
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

}

- (void)tick
{
  double v3;
  uint64_t v4;
  NSMutableSet *links;
  double v6;
  CGFloat MidX;
  CGFloat MidY;
  NSMutableSet *nodes;
  CKQuadTree *v10;
  void *v11;
  void *v12;
  CKQuadTree *v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  NSMutableSet *v16;
  CKQuadTree *v17;
  NSMutableSet *v18;
  const CGPath *Mutable;
  NSMutableSet *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  CKQuadTree *v24;
  _QWORD v25[6];
  uint64_t v26;
  id *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[7];
  _QWORD v33[5];
  CGRect v34;
  CGRect v35;

  v3 = self->_alpha * 0.99000001;
  self->_alpha = v3;
  if (v3 >= 0.00499999989)
  {
    v4 = MEMORY[0x24BDAC760];
    links = self->_links;
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __29__CKForceLayoutAnimator_tick__block_invoke;
    v33[3] = &unk_24E3425E0;
    v33[4] = self;
    -[NSMutableSet enumerateObjectsUsingBlock:](links, "enumerateObjectsUsingBlock:", v33);
    v6 = self->_alpha * self->_gravity;
    if (v6 != 0.0)
    {
      -[UIView bounds](self->_referenceView, "bounds");
      MidX = CGRectGetMidX(v34);
      -[UIView bounds](self->_referenceView, "bounds");
      MidY = CGRectGetMidY(v35);
      nodes = self->_nodes;
      v32[0] = v4;
      v32[1] = 3221225472;
      v32[2] = __29__CKForceLayoutAnimator_tick__block_invoke_2;
      v32[3] = &__block_descriptor_56_e20_v24__0__UIView_8_B16l;
      *(CGFloat *)&v32[4] = MidX;
      *(CGFloat *)&v32[5] = MidY;
      *(double *)&v32[6] = v6;
      -[NSMutableSet enumerateObjectsUsingBlock:](nodes, "enumerateObjectsUsingBlock:", v32);
    }
    v10 = [CKQuadTree alloc];
    -[NSMutableSet allObjects](self->_nodes, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForKey:", CFSTR("center"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CKQuadTree initWithPoints:](v10, "initWithPoints:", v12);

    v26 = 0;
    v27 = (id *)&v26;
    v28 = 0x3042000000;
    v29 = __Block_byref_object_copy_;
    v30 = __Block_byref_object_dispose_;
    v31 = 0;
    v25[0] = v4;
    v25[1] = 3221225472;
    v25[2] = __29__CKForceLayoutAnimator_tick__block_invoke_37;
    v25[3] = &unk_24E342650;
    v25[4] = self;
    v25[5] = &v26;
    v14 = (void (**)(_QWORD, _QWORD))objc_msgSend(v25, "copy");
    objc_storeWeak(v27 + 5, v14);
    -[CKQuadTree rootNode](v13, "rootNode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v14)[2](v14, v15);

    v16 = self->_nodes;
    v23[0] = v4;
    v23[1] = 3221225472;
    v23[2] = __29__CKForceLayoutAnimator_tick__block_invoke_2_39;
    v23[3] = &unk_24E3426A0;
    v23[4] = self;
    v17 = v13;
    v24 = v17;
    -[NSMutableSet enumerateObjectsUsingBlock:](v16, "enumerateObjectsUsingBlock:", v23);
    v18 = self->_nodes;
    v22[0] = v4;
    v22[1] = 3221225472;
    v22[2] = __29__CKForceLayoutAnimator_tick__block_invoke_4;
    v22[3] = &unk_24E342608;
    v22[4] = self;
    -[NSMutableSet enumerateObjectsUsingBlock:](v18, "enumerateObjectsUsingBlock:", v22);
    Mutable = CGPathCreateMutable();
    v20 = self->_links;
    v21[0] = v4;
    v21[1] = 3221225472;
    v21[2] = __29__CKForceLayoutAnimator_tick__block_invoke_5;
    v21[3] = &__block_descriptor_40_e19_v24__0__NSSet_8_B16l;
    v21[4] = Mutable;
    -[NSMutableSet enumerateObjectsUsingBlock:](v20, "enumerateObjectsUsingBlock:", v21);
    -[CAShapeLayer setPath:](self->_linesLayer, "setPath:", Mutable);
    CGPathRelease(Mutable);

    _Block_object_dispose(&v26, 8);
    objc_destroyWeak(&v31);

  }
  else
  {
    self->_alpha = 0.0;
    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 1);
  }
}

- (UIView)referenceView
{
  return self->_referenceView;
}

- (NSSet)nodes
{
  return &self->_nodes->super;
}

- (NSSet)links
{
  return &self->_links->super;
}

- (double)linkDistance
{
  return self->_linkDistance;
}

- (void)setLinkDistance:(double)a3
{
  self->_linkDistance = a3;
}

- (double)linkStrength
{
  return self->_linkStrength;
}

- (void)setLinkStrength:(double)a3
{
  self->_linkStrength = a3;
}

- (double)friction
{
  return self->_friction;
}

- (void)setFriction:(double)a3
{
  self->_friction = a3;
}

- (double)charge
{
  return self->_charge;
}

- (void)setCharge:(double)a3
{
  self->_charge = a3;
}

- (double)chargeDistance
{
  return self->_chargeDistance;
}

- (void)setChargeDistance:(double)a3
{
  self->_chargeDistance = a3;
}

- (double)theta
{
  return self->_theta;
}

- (void)setTheta:(double)a3
{
  self->_theta = a3;
}

- (double)gravity
{
  return self->_gravity;
}

- (void)setGravity:(double)a3
{
  self->_gravity = a3;
}

- (double)alpha
{
  return self->_alpha;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceView, 0);
  objc_storeStrong((id *)&self->_linesLayer, 0);
  objc_storeStrong((id *)&self->_fixedNodes, 0);
  objc_storeStrong((id *)&self->_previousCenters, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

void __29__CKForceLayoutAnimator_tick__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;

  objc_msgSend(a2, "allObjects");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "center");
  v6 = v5;
  objc_msgSend(v3, "center");
  v8 = v6 - v7;
  objc_msgSend(v4, "center");
  v10 = v9;
  objc_msgSend(v3, "center");
  v12 = v10 - v11;
  v13 = sqrt(v12 * v12 + v8 * v8);
  if (v13 != 0.0)
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(double *)(v14 + 128) * *(double *)(v14 + 80) * (v13 - *(double *)(v14 + 72)) / v13;
    v16 = v8 * v15;
    v17 = v12 * v15;
    objc_msgSend(*(id *)(v14 + 32), "objectForKey:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", v3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v22;

    v24 = v23 / (v20 + v23);
    objc_msgSend(v4, "center");
    v26 = v25 - v16 * v24;
    objc_msgSend(v4, "center");
    objc_msgSend(v4, "setCenter:", v26, v27 - v17 * v24);
    objc_msgSend(v3, "center");
    v29 = v28 + v16 * (1.0 - v24);
    objc_msgSend(v3, "center");
    objc_msgSend(v3, "setCenter:", v29, v30 + v17 * (1.0 - v24));
  }

}

void __29__CKForceLayoutAnimator_tick__block_invoke_2(double *a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "center");
  v4 = v3;
  v5 = a1[4];
  objc_msgSend(v12, "center");
  v7 = v4 + (v5 - v6) * a1[6];
  objc_msgSend(v12, "center");
  v9 = v8;
  v10 = a1[5];
  objc_msgSend(v12, "center");
  objc_msgSend(v12, "setCenter:", v7, v9 + (v10 - v11) * a1[6]);

}

void __29__CKForceLayoutAnimator_tick__block_invoke_37(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  uint64_t i;
  void *v11;
  void (**WeakRetained)(id, void *);
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v30 = a2;
  objc_msgSend(v30, "nodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v32;
    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        WeakRetained = (void (**)(id, void *))objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40)
                                                                                                + 8)
                                                                                    + 40));
        WeakRetained[2](WeakRetained, v11);

        objc_msgSend(v11, "objectForKey:", CFSTR("charge"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        v15 = v14;

        v9 = v9 + v15;
        objc_msgSend(v11, "objectForKey:", CFSTR("chargeX"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v8 = v8 + v15 * v17;

        objc_msgSend(v11, "objectForKey:", CFSTR("chargeY"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "doubleValue");
        v7 = v7 + v15 * v19;

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
  }

  objc_msgSend(v30, "point");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v30, "point");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "CGPointValue");
    v23 = v22;
    v25 = v24;

    v26 = *(double *)(*(_QWORD *)(a1 + 32) + 128) * *(double *)(*(_QWORD *)(a1 + 32) + 96);
    v9 = v9 + v26;
    v8 = v8 + v26 * v23;
    v7 = v7 + v26 * v25;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKey:", v27, CFSTR("charge"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8 / v9);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKey:", v28, CFSTR("chargeX"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7 / v9);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKey:", v29, CFSTR("chargeY"));

}

void __29__CKForceLayoutAnimator_tick__block_invoke_2_39(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) == 0)
  {
    v6 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __29__CKForceLayoutAnimator_tick__block_invoke_3;
    v9[3] = &unk_24E342678;
    v7 = v3;
    v8 = *(_QWORD *)(a1 + 32);
    v10 = v7;
    v11 = v8;
    objc_msgSend(v6, "visit:", v9);

  }
}

void __29__CKForceLayoutAnimator_tick__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  char v13;
  double v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", v17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGPointValue");
  v5 = v4;
  v7 = v6;

  objc_msgSend(v17, "center");
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if ((v13 & 1) == 0)
  {
    v14 = *(double *)(*(_QWORD *)(a1 + 32) + 88);
    v5 = v9 - (v5 - v9) * v14;
    v7 = v11 - (v7 - v11) * v14;
  }
  objc_msgSend(v17, "setCenter:", v5, v7);
  v15 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v5, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v16, v17);

}

void __29__CKForceLayoutAnimator_tick__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  CGPath *v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGPath *v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  id v13;

  objc_msgSend(a2, "allObjects");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(CGPath **)(a1 + 32);
  objc_msgSend(v3, "center");
  v7 = v6;
  objc_msgSend(v3, "center");
  CGPathMoveToPoint(v5, 0, v7, v8);
  v9 = *(CGPath **)(a1 + 32);
  objc_msgSend(v4, "center");
  v11 = v10;
  objc_msgSend(v4, "center");
  CGPathAddLineToPoint(v9, 0, v11, v12);

}

BOOL __29__CKForceLayoutAnimator_tick__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
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
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat Width;
  uint64_t v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  double v41;
  void *v42;
  _BOOL8 v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  CGRect v52;

  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("charge"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  objc_msgSend(v3, "objectForKey:", CFSTR("chargeX"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(v3, "objectForKey:", CFSTR("chargeY"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  objc_msgSend(v3, "point");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(*(id *)(a1 + 32), "center");
    v16 = v15;
    v18 = v17;
    objc_msgSend(v3, "point");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "CGPointValue");
    v21 = v20;
    v23 = v22;

    if (v16 == v21 && v18 == v23)
      goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "center");
  v25 = v9 - v24;
  objc_msgSend(*(id *)(a1 + 32), "center");
  v27 = v12 - v26;
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v52);
  v29 = *(_QWORD *)(a1 + 40);
  v30 = *(double *)(v29 + 104) * *(double *)(v29 + 104);
  v31 = v27 * v27 + v25 * v25;
  if (Width * Width / (*(double *)(v29 + 112) * *(double *)(v29 + 112)) >= v31)
  {
    objc_msgSend(v3, "point");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v31 != 0.0 && v32 != 0)
    {

      if (v31 >= v30)
      {
LABEL_12:
        v43 = v6 == 0.0;
        goto LABEL_16;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectForKey:", *(_QWORD *)(a1 + 32));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "CGPointValue");
      v37 = v36;
      v39 = v38;

      v40 = *(_QWORD *)(a1 + 40);
      v41 = *(double *)(v40 + 128) * *(double *)(v40 + 96) / v31;
      v42 = *(void **)(v40 + 40);
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v37 - v25 * v41, v39 - v27 * v41);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setObject:forKey:", v33, *(_QWORD *)(a1 + 32));
    }

    goto LABEL_12;
  }
  if (v31 < v30)
  {
    objc_msgSend(*(id *)(v29 + 40), "objectForKey:", *(_QWORD *)(a1 + 32));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "CGPointValue");
    v46 = v45;
    v48 = v47;

    v49 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v46 - v25 * (v6 / v31), v48 - v27 * (v6 / v31));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setObject:forKey:", v50, *(_QWORD *)(a1 + 32));

  }
  v43 = 1;
LABEL_16:

  return v43;
}

void __30__CKForceLayoutAnimator_start__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(a2, "allObjects");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "objectForKey:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "integerValue") + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, v3);

  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v10 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v9, "objectForKey:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "integerValue") + 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v12, v4);

}

void __30__CKForceLayoutAnimator_start__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v3 = (void *)MEMORY[0x24BDD1968];
  v4 = a2;
  objc_msgSend(v4, "center");
  objc_msgSend(v3, "valueWithCGPoint:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v5, v4);

}

uint64_t __36__CKForceLayoutAnimator_removeNode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsObject:", *(_QWORD *)(a1 + 32));
}

@end
