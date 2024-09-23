@implementation CEKAnimationSequence

- (CEKAnimationSequence)initWithAnimations:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  CEKAnimationSequence *v8;
  uint64_t v9;
  NSMutableArray *animations;
  uint64_t v11;
  id completionHandler;
  CEKAnimationGenerator *v13;
  CEKAnimationGenerator *animationGenerator;
  CEKAnimationSequence *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CEKAnimationSequence;
  v8 = -[CEKAnimationSequence init](&v17, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "mutableCopy");
    animations = v8->__animations;
    v8->__animations = (NSMutableArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    completionHandler = v8->__completionHandler;
    v8->__completionHandler = (id)v11;

    v13 = objc_alloc_init(CEKAnimationGenerator);
    animationGenerator = v8->__animationGenerator;
    v8->__animationGenerator = v13;

    v15 = v8;
  }

  return v8;
}

- (void)_startNextAnimation
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  CEKAnimationSequence *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[CEKAnimationSequence _animations](self, "_animations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CEKAnimationSequence _animations](self, "_animations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectAtIndex:", 0);

    v6 = os_log_create("com.apple.camera", "CameraEditKit");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v7;
      _os_log_impl(&dword_1B9835000, v6, OS_LOG_TYPE_DEFAULT, "Starting animation %{public}@", buf, 0xCu);

    }
    -[CEKAnimationSequence _animationGenerator](self, "_animationGenerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "duration");
    v11 = v10;
    objc_msgSend(v4, "updateHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __43__CEKAnimationSequence__startNextAnimation__block_invoke;
    v13[3] = &unk_1E70A4BD0;
    v14 = v4;
    v15 = self;
    objc_msgSend(v8, "startAnimationForIdentifier:duration:updateHandler:completionHandler:", v9, v12, v13, v11);

  }
  else
  {
    -[CEKAnimationSequence _notifyCompletionWithSuccess:](self, "_notifyCompletionWithSuccess:", 1);
  }

}

uint64_t __43__CEKAnimationSequence__startNextAnimation__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.camera", "CameraEditKit");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v5;
    v14 = 1024;
    v15 = a2;
    _os_log_impl(&dword_1B9835000, v4, OS_LOG_TYPE_DEFAULT, "Finished animation %{public}@ with completed=%d", (uint8_t *)&v12, 0x12u);

  }
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, a2);

  }
  v8 = *(void **)(a1 + 40);
  if ((_DWORD)a2)
    return objc_msgSend(v8, "_startNextAnimation");
  objc_msgSend(v8, "_animations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &__block_literal_global);

  objc_msgSend(*(id *)(a1 + 40), "_animations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 40), "set_animationGenerator:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "_notifyCompletionWithSuccess:", 0);
}

void __43__CEKAnimationSequence__startNextAnimation__block_invoke_29(uint64_t a1, void *a2)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  id v4;

  v4 = a2;
  objc_msgSend(v4, "completionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v4, "completionHandler");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, 0);

  }
}

- (void)stopAllAnimations
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.camera", "CameraEditKit");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[CEKAnimationSequence _animationGenerator](self, "_animationGenerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAnimating");
    -[CEKAnimationSequence _animations](self, "_animations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = 67109376;
    v9[1] = v5;
    v10 = 2048;
    v11 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1B9835000, v3, OS_LOG_TYPE_DEFAULT, "Stopping animations (%d in progress, %ld pending)", (uint8_t *)v9, 0x12u);

  }
  -[CEKAnimationSequence _animationGenerator](self, "_animationGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopAllAnimations");

  -[CEKAnimationSequence set_animationGenerator:](self, "set_animationGenerator:", 0);
  -[CEKAnimationSequence _animations](self, "_animations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

}

- (void)_notifyCompletionWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  void (**v5)(_QWORD, _QWORD);
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  -[CEKAnimationSequence _completionHandler](self, "_completionHandler");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[CEKAnimationSequence set_completionHandler:](self, "set_completionHandler:", 0);
  if (v5)
  {
    v6 = os_log_create("com.apple.camera", "CameraEditKit");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_1B9835000, v6, OS_LOG_TYPE_DEFAULT, "Animations completed with success=%d", (uint8_t *)v7, 8u);
    }

    v5[2](v5, v3);
  }

}

- (NSMutableArray)_animations
{
  return self->__animations;
}

- (id)_completionHandler
{
  return self->__completionHandler;
}

- (void)set_completionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CEKAnimationGenerator)_animationGenerator
{
  return self->__animationGenerator;
}

- (void)set_animationGenerator:(id)a3
{
  objc_storeStrong((id *)&self->__animationGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__animationGenerator, 0);
  objc_storeStrong(&self->__completionHandler, 0);
  objc_storeStrong((id *)&self->__animations, 0);
}

@end
