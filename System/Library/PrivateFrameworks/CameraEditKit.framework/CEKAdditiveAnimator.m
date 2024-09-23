@implementation CEKAdditiveAnimator

- (BOOL)isAnimating
{
  void *v2;
  BOOL v3;

  -[CEKAdditiveAnimator _animations](self, "_animations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSMutableDictionary)_animations
{
  return self->__animations;
}

- (void)setValue:(double)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithDouble:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CEKAdditiveAnimator _values](self, "_values");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v7);

}

- (void)setValue:(double)a3 forKey:(id)a4 duration:(double)a5 timingCurve:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a4;
  v10 = a6;
  -[CEKAdditiveAnimator _values](self, "_values");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 == 0.0 || !v12)
  {
    -[CEKAdditiveAnimator setValue:forKey:](self, "setValue:forKey:", v21, a3);
  }
  else
  {
    objc_msgSend(v12, "doubleValue");
    if (v13 != a3)
    {
      -[CEKAdditiveAnimator _animations](self, "_animations");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        +[CAMAdditiveAnimation animationToValue:fromAnimation:duration:curve:](CAMAdditiveAnimation, "animationToValue:fromAnimation:duration:curve:", v15, v10, a3, a5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[CEKAdditiveAnimator valueForKey:](self, "valueForKey:", v21);
        +[CAMAdditiveAnimation animationToValue:fromValue:duration:curve:](CAMAdditiveAnimation, "animationToValue:fromValue:duration:curve:", v10, a3, v17, a5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CEKAdditiveAnimator _values](self, "_values");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v21);

      -[CEKAdditiveAnimator _animations](self, "_animations");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v16, v21);

      -[CEKAdditiveAnimator _updateDisplayLink](self, "_updateDisplayLink");
    }
  }

}

- (NSMutableDictionary)_values
{
  return self->__values;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CEKAdditiveAnimator)init
{
  CEKAdditiveAnimator *v2;
  uint64_t v3;
  NSMutableDictionary *values;
  uint64_t v5;
  NSMutableDictionary *animations;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CEKAdditiveAnimator;
  v2 = -[CEKAdditiveAnimator init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    values = v2->__values;
    v2->__values = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    animations = v2->__animations;
    v2->__animations = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)dealloc
{
  CADisplayLink *displayLink;
  objc_super v4;

  -[CADisplayLink invalidate](self->__displayLink, "invalidate");
  displayLink = self->__displayLink;
  self->__displayLink = 0;

  v4.receiver = self;
  v4.super_class = (Class)CEKAdditiveAnimator;
  -[CEKAdditiveAnimator dealloc](&v4, sel_dealloc);
}

- (BOOL)isAnimatingForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CEKAdditiveAnimator _animations](self, "_animations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (double)valueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;

  v4 = a3;
  -[CEKAdditiveAnimator _values](self, "_values");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "doubleValue");
  v8 = v7;
  if (-[CEKAdditiveAnimator isAnimatingForKey:](self, "isAnimatingForKey:", v4))
  {
    -[CEKAdditiveAnimator _animations](self, "_animations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v8 = v11;

  }
  return v8;
}

- (void)removeAnimationsForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CEKAdditiveAnimator _animations](self, "_animations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CEKAdditiveAnimator _animations](self, "_animations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v4);

    -[CEKAdditiveAnimator _updateDisplayLink](self, "_updateDisplayLink");
    -[CEKAdditiveAnimator delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "animator:didUpdateValuesForKeys:", self, v9);

  }
}

- (void)_updateDisplayLink
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  CEKDisplayLinkTarget *v6;
  CEKDisplayLinkTarget *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;

  v3 = -[CEKAdditiveAnimator isAnimating](self, "isAnimating");
  -[CEKAdditiveAnimator _displayLink](self, "_displayLink");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && !v4)
  {
    objc_initWeak(&location, self);
    v6 = [CEKDisplayLinkTarget alloc];
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __41__CEKAdditiveAnimator__updateDisplayLink__block_invoke;
    v12 = &unk_1E70A5378;
    objc_copyWeak(&v13, &location);
    v7 = -[CEKDisplayLinkTarget initWithHandler:](v6, "initWithHandler:", &v9);
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", v7, sel_displayLinkDidFire_, v9, v10, v11, v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addToRunLoop:forMode:", v8, *MEMORY[0x1E0C99860]);

    -[CEKAdditiveAnimator set_displayLink:](self, "set_displayLink:", v5);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  objc_msgSend(v5, "setPaused:", !v3);

}

void __41__CEKAdditiveAnimator__updateDisplayLink__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleDisplayLinkFired:", v3);

}

- (void)_handleDisplayLinkFired:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CEKAdditiveAnimator _animations](self, "_animations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetTimestamp");
  v7 = v6;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v5, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "updateWithTimestamp:", v7);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }

  objc_msgSend(v5, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j);
        objc_msgSend(v5, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "isFinished"))
          objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v15);
  }
  -[CEKAdditiveAnimator _updateDisplayLink](self, "_updateDisplayLink");
  -[CEKAdditiveAnimator delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "animator:didUpdateValuesForKeys:", self, v13);

}

- (CEKAdditiveAnimatorDelegate)delegate
{
  return (CEKAdditiveAnimatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CADisplayLink)_displayLink
{
  return self->__displayLink;
}

- (void)set_displayLink:(id)a3
{
  objc_storeStrong((id *)&self->__displayLink, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__displayLink, 0);
  objc_storeStrong((id *)&self->__animations, 0);
  objc_storeStrong((id *)&self->__values, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
