@implementation SKTransition

- (SKTransition)init
{
  SKTransition *v2;
  SKCTransitionNode *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKTransition;
  v2 = -[SKTransition init](&v5, sel_init);
  if (v2)
  {
    v3 = (SKCTransitionNode *)operator new();
    SKCTransitionNode::SKCTransitionNode(v3);
    v2->_skcTransitionNode = v3;
  }
  return v2;
}

+ (SKTransition)revealWithDirection:(SKTransitionDirection)direction duration:(NSTimeInterval)sec
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  switch(direction)
  {
    case SKTransitionDirectionUp:
      objc_msgSend(a1, "revealUpWithDuration:", sec, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case SKTransitionDirectionDown:
      objc_msgSend(a1, "revealDownWithDuration:", sec, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case SKTransitionDirectionRight:
      objc_msgSend(a1, "revealRightWithDuration:", sec, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case SKTransitionDirectionLeft:
      objc_msgSend(a1, "revealLeftWithDuration:", sec, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v6 = 0;
      break;
  }
  return (SKTransition *)v6;
}

+ (SKTransition)moveInWithDirection:(SKTransitionDirection)direction duration:(NSTimeInterval)sec
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  switch(direction)
  {
    case SKTransitionDirectionUp:
      objc_msgSend(a1, "moveInUpWithDuration:", sec, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case SKTransitionDirectionDown:
      objc_msgSend(a1, "moveInDownWithDuration:", sec, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case SKTransitionDirectionRight:
      objc_msgSend(a1, "moveInRightWithDuration:", sec, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case SKTransitionDirectionLeft:
      objc_msgSend(a1, "moveInLeftWithDuration:", sec, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v6 = 0;
      break;
  }
  return (SKTransition *)v6;
}

+ (SKTransition)pushWithDirection:(SKTransitionDirection)direction duration:(NSTimeInterval)sec
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  switch(direction)
  {
    case SKTransitionDirectionUp:
      objc_msgSend(a1, "pushUpWithDuration:", sec, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case SKTransitionDirectionDown:
      objc_msgSend(a1, "pushDownWithDuration:", sec, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case SKTransitionDirectionRight:
      objc_msgSend(a1, "pushRightWithDuration:", sec, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case SKTransitionDirectionLeft:
      objc_msgSend(a1, "pushLeftWithDuration:", sec, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v6 = 0;
      break;
  }
  return (SKTransition *)v6;
}

+ (SKTransition)fadeWithDuration:(NSTimeInterval)sec
{
  SKTransition *v4;
  float *skcTransitionNode;
  float v6;
  __int128 v8;

  v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 1;
  v6 = sec;
  skcTransitionNode[145] = v6;
  v8 = xmmword_1DC9217E0;
  (*(void (**)(float *, __int128 *))(*(_QWORD *)skcTransitionNode + 184))(skcTransitionNode, &v8);
  return v4;
}

+ (SKTransition)fadeWithColor:(UIColor *)color duration:(NSTimeInterval)sec
{
  UIColor *v5;
  SKTransition *v6;
  float *skcTransitionNode;
  float v8;
  __int128 v9;
  __int128 v11;

  v5 = color;
  v6 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v6->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 1;
  v8 = sec;
  skcTransitionNode[145] = v8;
  -[UIColor vectorRGBA](v5, "vectorRGBA");
  v11 = v9;
  (*(void (**)(float *, __int128 *))(*(_QWORD *)skcTransitionNode + 184))(skcTransitionNode, &v11);

  return v6;
}

+ (SKTransition)crossFadeWithDuration:(NSTimeInterval)sec
{
  SKTransition *v4;
  float *skcTransitionNode;
  float v6;

  v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  skcTransitionNode[140] = 0.0;
  v6 = sec;
  skcTransitionNode[145] = v6;
  return v4;
}

+ (SKTransition)flipHorizontalWithDuration:(NSTimeInterval)sec
{
  SKTransition *v4;
  float *skcTransitionNode;
  float v6;

  v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 3;
  v6 = sec;
  skcTransitionNode[145] = v6;
  return v4;
}

+ (SKTransition)flipVerticalWithDuration:(NSTimeInterval)sec
{
  SKTransition *v4;
  float *skcTransitionNode;
  float v6;

  v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 2;
  v6 = sec;
  skcTransitionNode[145] = v6;
  return v4;
}

+ (id)revealUpWithDuration:(double)a3
{
  SKTransition *v4;
  float *skcTransitionNode;
  float v6;

  v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 4;
  v6 = a3;
  skcTransitionNode[145] = v6;
  return v4;
}

+ (id)revealDownWithDuration:(double)a3
{
  SKTransition *v4;
  float *skcTransitionNode;
  float v6;

  v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 5;
  v6 = a3;
  skcTransitionNode[145] = v6;
  return v4;
}

+ (id)revealLeftWithDuration:(double)a3
{
  SKTransition *v4;
  float *skcTransitionNode;
  float v6;

  v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 7;
  v6 = a3;
  skcTransitionNode[145] = v6;
  return v4;
}

+ (id)revealRightWithDuration:(double)a3
{
  SKTransition *v4;
  float *skcTransitionNode;
  float v6;

  v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 6;
  v6 = a3;
  skcTransitionNode[145] = v6;
  return v4;
}

+ (id)moveInUpWithDuration:(double)a3
{
  SKTransition *v4;
  float *skcTransitionNode;
  float v6;

  v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 8;
  v6 = a3;
  skcTransitionNode[145] = v6;
  return v4;
}

+ (id)moveInDownWithDuration:(double)a3
{
  SKTransition *v4;
  float *skcTransitionNode;
  float v6;

  v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 9;
  v6 = a3;
  skcTransitionNode[145] = v6;
  return v4;
}

+ (id)moveInLeftWithDuration:(double)a3
{
  SKTransition *v4;
  float *skcTransitionNode;
  float v6;

  v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 11;
  v6 = a3;
  skcTransitionNode[145] = v6;
  return v4;
}

+ (id)moveInRightWithDuration:(double)a3
{
  SKTransition *v4;
  float *skcTransitionNode;
  float v6;

  v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 10;
  v6 = a3;
  skcTransitionNode[145] = v6;
  return v4;
}

+ (id)pushUpWithDuration:(double)a3
{
  SKTransition *v4;
  float *skcTransitionNode;
  float v6;

  v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 12;
  v6 = a3;
  skcTransitionNode[145] = v6;
  return v4;
}

+ (id)pushDownWithDuration:(double)a3
{
  SKTransition *v4;
  float *skcTransitionNode;
  float v6;

  v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 13;
  v6 = a3;
  skcTransitionNode[145] = v6;
  return v4;
}

+ (id)pushLeftWithDuration:(double)a3
{
  SKTransition *v4;
  float *skcTransitionNode;
  float v6;

  v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 15;
  v6 = a3;
  skcTransitionNode[145] = v6;
  return v4;
}

+ (id)pushRightWithDuration:(double)a3
{
  SKTransition *v4;
  float *skcTransitionNode;
  float v6;

  v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 14;
  v6 = a3;
  skcTransitionNode[145] = v6;
  return v4;
}

+ (SKTransition)doorsOpenHorizontalWithDuration:(NSTimeInterval)sec
{
  SKTransition *v4;
  float *skcTransitionNode;
  float v6;

  v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 17;
  v6 = sec;
  skcTransitionNode[145] = v6;
  return v4;
}

+ (SKTransition)doorsOpenVerticalWithDuration:(NSTimeInterval)sec
{
  SKTransition *v4;
  float *skcTransitionNode;
  float v6;

  v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 16;
  v6 = sec;
  skcTransitionNode[145] = v6;
  return v4;
}

+ (SKTransition)doorsCloseHorizontalWithDuration:(NSTimeInterval)sec
{
  SKTransition *v4;
  float *skcTransitionNode;
  float v6;

  v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 19;
  v6 = sec;
  skcTransitionNode[145] = v6;
  return v4;
}

+ (SKTransition)doorsCloseVerticalWithDuration:(NSTimeInterval)sec
{
  SKTransition *v4;
  float *skcTransitionNode;
  float v6;

  v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 18;
  v6 = sec;
  skcTransitionNode[145] = v6;
  return v4;
}

+ (SKTransition)doorwayWithDuration:(NSTimeInterval)sec
{
  SKTransition *v4;
  float *skcTransitionNode;
  float v6;

  v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 20;
  v6 = sec;
  skcTransitionNode[145] = v6;
  return v4;
}

+ (SKTransition)transitionWithCIFilter:(CIFilter *)filter duration:(NSTimeInterval)sec
{
  CIFilter *v5;
  SKTransition *v6;
  float *skcTransitionNode;
  float v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;

  v5 = filter;
  v6 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v6->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 21;
  v8 = sec;
  skcTransitionNode[145] = v8;
  v9 = -[CIFilter copy](v5, "copy");
  v10 = v6->_skcTransitionNode;
  v11 = (void *)v10[71];
  v10[71] = v9;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SKTransition *v4;
  void *skcTransitionNode;
  void *v6;
  void *v7;
  __int128 v9;

  v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = self->_skcTransitionNode;
  v6 = v4->_skcTransitionNode;
  *((_DWORD *)v6 + 140) = *((_DWORD *)skcTransitionNode + 140);
  *((_DWORD *)v6 + 145) = *((_DWORD *)skcTransitionNode + 145);
  objc_storeStrong((id *)v6 + 71, *((id *)skcTransitionNode + 71));
  v7 = v4->_skcTransitionNode;
  v9 = *((_OWORD *)self->_skcTransitionNode + 19);
  (*(void (**)(void *, __int128 *))(*(_QWORD *)v7 + 184))(v7, &v9);
  *((_WORD *)v4->_skcTransitionNode + 288) = *((_WORD *)self->_skcTransitionNode + 288);
  return v4;
}

- (void)setPausesIncomingScene:(BOOL)pausesIncomingScene
{
  *((_BYTE *)self->_skcTransitionNode + 577) = pausesIncomingScene;
}

- (BOOL)pausesIncomingScene
{
  return *((_BYTE *)self->_skcTransitionNode + 577);
}

- (void)setPausesOutgoingScene:(BOOL)pausesOutgoingScene
{
  *((_BYTE *)self->_skcTransitionNode + 576) = pausesOutgoingScene;
}

- (BOOL)pausesOutgoingScene
{
  return *((_BYTE *)self->_skcTransitionNode + 576);
}

- (double)_duration
{
  float *skcTransitionNode;

  skcTransitionNode = (float *)self->_skcTransitionNode;
  if (skcTransitionNode)
    return skcTransitionNode[145];
  else
    return 0.0;
}

- (void)_backingNode
{
  return self->_skcTransitionNode;
}

- (id)_filter
{
  return *((id *)self->_skcTransitionNode + 71);
}

- (void)dealloc
{
  void *skcTransitionNode;
  objc_super v4;

  skcTransitionNode = self->_skcTransitionNode;
  if (skcTransitionNode)
  {
    (*(void (**)(void *, SEL))(*(_QWORD *)skcTransitionNode + 88))(skcTransitionNode, a2);
    self->_skcTransitionNode = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SKTransition;
  -[SKTransition dealloc](&v4, sel_dealloc);
}

@end
