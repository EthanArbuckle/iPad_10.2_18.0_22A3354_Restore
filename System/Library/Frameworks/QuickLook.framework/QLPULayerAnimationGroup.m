@implementation QLPULayerAnimationGroup

- (QLPULayerAnimationGroup)init
{
  return -[QLPULayerAnimationGroup initWithReferenceLayer:](self, "initWithReferenceLayer:", 0);
}

- (QLPULayerAnimationGroup)initWithReferenceLayer:(id)a3
{
  id v5;
  QLPULayerAnimationGroup *v6;
  QLPULayerAnimationGroup *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLPULayerAnimationGroup;
  v6 = -[QLPUTimedAnimationGroup init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_referenceLayer, a3);
    -[QLPULayerAnimationGroup currentTime](v7, "currentTime");
    -[QLPUTimedAnimationGroup setBeginTime:](v7, "setBeginTime:");
  }

  return v7;
}

- (double)currentTime
{
  void *v2;
  double v3;
  double v4;

  -[QLPULayerAnimationGroup referenceLayer](self, "referenceLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "convertTime:fromLayer:", 0, CACurrentMediaTime());
  v4 = v3;

  return v4;
}

- (void)updateAnimations
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)QLPULayerAnimationGroup;
  -[QLPUTimedAnimationGroup updateAnimations](&v22, sel_updateAnimations);
  v3 = -[QLPUAnimationGroup isPaused](self, "isPaused");
  -[QLPUTimedAnimationGroup elapsedTime](self, "elapsedTime");
  v5 = v4;
  -[QLPUTimedAnimationGroup beginTime](self, "beginTime");
  v7 = v6;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[QLPUAnimationGroup subAnimationGroups](self, "subAnimationGroups", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v3)
          {
            LODWORD(v14) = 0;
            v15 = 0.0;
            v16 = v13;
            v17 = v5;
          }
          else
          {
            LODWORD(v14) = 1.0;
            v17 = 0.0;
            v16 = v13;
            v15 = v7;
          }
          objc_msgSend(v16, "setSpeed:timeOffset:beginTime:", v14, v17, v15);
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v10);
  }

}

- (CALayer)referenceLayer
{
  return self->_referenceLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceLayer, 0);
}

@end
