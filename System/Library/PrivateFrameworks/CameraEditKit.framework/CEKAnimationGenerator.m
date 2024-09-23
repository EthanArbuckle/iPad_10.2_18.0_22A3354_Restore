@implementation CEKAnimationGenerator

- (CEKAnimationGenerator)init
{
  CEKAnimationGenerator *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *animations;
  CEKAnimationGenerator *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CEKAnimationGenerator;
  v2 = -[CEKAnimationGenerator init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    animations = v2->__animations;
    v2->__animations = v3;

    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  CADisplayLink *displayLink;
  objc_super v4;

  -[CADisplayLink setPaused:](self->__displayLink, "setPaused:", 1);
  -[CADisplayLink invalidate](self->__displayLink, "invalidate");
  displayLink = self->__displayLink;
  self->__displayLink = 0;

  v4.receiver = self;
  v4.super_class = (Class)CEKAnimationGenerator;
  -[CEKAnimationGenerator dealloc](&v4, sel_dealloc);
}

- (void)startAnimationForIdentifier:(id)a3 duration:(double)a4 updateHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  CADisplayLink *v13;
  CADisplayLink *displayLink;
  CADisplayLink *v15;
  void *v16;
  CEKAnimationGeneratorAnimation *v17;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[CEKAnimationGenerator stopAnimationForIdentifier:](self, "stopAnimationForIdentifier:", v12);
  v17 = -[CEKAnimationGeneratorAnimation initWithStartTime:duration:updateHandler:completionHandler:]([CEKAnimationGeneratorAnimation alloc], "initWithStartTime:duration:updateHandler:completionHandler:", v11, v10, CACurrentMediaTime(), a4);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->__animations, "setObject:forKeyedSubscript:", v17, v12);
  if (!self->__displayLink)
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__handleDisplayLinkFired_);
    v13 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->__displayLink;
    self->__displayLink = v13;

    v15 = self->__displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v15, "addToRunLoop:forMode:", v16, *MEMORY[0x1E0C99860]);

    -[CADisplayLink setPaused:](self->__displayLink, "setPaused:", 0);
  }

}

- (void)stopAnimationForIdentifier:(id)a3
{
  -[CEKAnimationGenerator _stopAnimationForIdentifier:didComplete:](self, "_stopAnimationForIdentifier:didComplete:", a3, 0);
}

- (void)_stopAnimationForIdentifier:(id)a3 didComplete:(BOOL)a4
{
  _BOOL8 v4;
  NSMutableDictionary *animations;
  id v7;
  uint64_t v8;
  void *v9;
  CADisplayLink *displayLink;
  id v11;

  v4 = a4;
  animations = self->__animations;
  v7 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](animations, "objectForKeyedSubscript:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->__animations, "removeObjectForKey:", v7);

  objc_msgSend(v11, "completionHandler");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    (*(void (**)(uint64_t, _BOOL8))(v8 + 16))(v8, v4);
  if (self->__displayLink && !-[NSMutableDictionary count](self->__animations, "count"))
  {
    -[CADisplayLink setPaused:](self->__displayLink, "setPaused:", 1);
    -[CADisplayLink invalidate](self->__displayLink, "invalidate");
    displayLink = self->__displayLink;
    self->__displayLink = 0;

  }
}

- (void)stopAllAnimations
{
  id v3;
  _QWORD v4[5];

  -[NSMutableDictionary allKeys](self->__animations, "allKeys");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__CEKAnimationGenerator_stopAllAnimations__block_invoke;
  v4[3] = &unk_1E70A56D0;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

uint64_t __42__CEKAnimationGenerator_stopAllAnimations__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopAnimationForIdentifier:", a2);
}

- (BOOL)isAnimating
{
  void *v2;
  BOOL v3;

  -[CEKAnimationGenerator _animations](self, "_animations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)isAnimatingForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CEKAnimationGenerator _animations](self, "_animations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (void)_handleDisplayLinkFired:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NSMutableDictionary allKeys](self->__animations, "allKeys");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__CEKAnimationGenerator__handleDisplayLinkFired___block_invoke;
  v7[3] = &unk_1E70A56F8;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

void __49__CEKAnimationGenerator__handleDisplayLinkFired___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "timestamp");
  objc_msgSend(v2, "_updateAnimationForIdentifer:timestamp:", v4);

}

- (void)_updateAnimationForIdentifer:(id)a3 timestamp:(double)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  _BOOL4 v16;
  char v17;

  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->__animations, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startTime");
  v9 = v8;
  objc_msgSend(v7, "duration");
  v11 = v10;
  objc_msgSend(v7, "updateHandler");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = (a4 - v9) / v11;
  v15 = 0.0;
  if (v14 >= 0.0)
  {
    v15 = v14;
    if (v14 > 1.0)
      v15 = 1.0;
  }
  v17 = 0;
  if (v12)
  {
    (*(void (**)(uint64_t, char *, double))(v12 + 16))(v12, &v17, v15);
    v16 = v17 != 0;
  }
  else
  {
    v16 = 0;
  }
  if (v15 >= 1.0 || v16)
    -[CEKAnimationGenerator _stopAnimationForIdentifier:didComplete:](self, "_stopAnimationForIdentifier:didComplete:", v6, v15 >= 1.0);

}

- (NSMutableDictionary)_animations
{
  return self->__animations;
}

- (void)set_animations:(id)a3
{
  objc_storeStrong((id *)&self->__animations, a3);
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
}

@end
