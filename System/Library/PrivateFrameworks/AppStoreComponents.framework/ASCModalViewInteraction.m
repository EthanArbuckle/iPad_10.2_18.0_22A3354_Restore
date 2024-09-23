@implementation ASCModalViewInteraction

- (ASCModalViewInteraction)initWithView:(id)a3
{
  id v4;
  ASCModalViewInteraction *v5;
  ASCModalViewInteraction *v6;
  NSMutableArray *v7;
  NSMutableArray *observers;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASCModalViewInteraction;
  v5 = -[ASCModalViewInteraction init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_view, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    observers = v6->_observers;
    v6->_observers = v7;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[ASCModalViewInteraction invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ASCModalViewInteraction;
  -[ASCModalViewInteraction dealloc](&v3, sel_dealloc);
}

- (void)installWithCancelBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ASCModalViewGestureRecognizer *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
  void *v36;
  id v37;
  id v38;
  uint8_t buf[4];
  ASCModalViewInteraction *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ASCModalViewInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[ASCModalViewInteraction cancelGestureRecognizer](self, "cancelGestureRecognizer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v32 = objc_alloc(MEMORY[0x1E0C99DA0]);
        objc_exception_throw((id)objc_msgSend(v32, "initWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Modal view interaction cannot be installed more than once"), 0));
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v40 = self;
        _os_log_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Installing %{public}@", buf, 0xCu);
      }
      v9 = -[ASCModalViewGestureRecognizer initWithTargetView:target:action:]([ASCModalViewGestureRecognizer alloc], "initWithTargetView:target:action:", v6, self, sel_cancelGestureDidChange_);
      -[ASCModalViewInteraction setCancelGestureRecognizer:](self, "setCancelGestureRecognizer:", v9);

      -[ASCModalViewInteraction setCancelBlock:](self, "setCancelBlock:", v4);
      objc_msgSend(v6, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCModalViewInteraction cancelGestureRecognizer](self, "cancelGestureRecognizer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addGestureRecognizer:", v11);

      objc_initWeak((id *)buf, self);
      v33 = MEMORY[0x1E0C809B0];
      v34 = 3221225472;
      v35 = __50__ASCModalViewInteraction_installWithCancelBlock___block_invoke;
      v36 = &unk_1E75613B0;
      objc_copyWeak(&v38, (id *)buf);
      v37 = v4;
      v12 = (void *)MEMORY[0x1BCCFE944](&v33);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v33, v34, v35, v36);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCModalViewInteraction observers](self, "observers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0DC4868], 0, 0, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v15);

      -[ASCModalViewInteraction observers](self, "observers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0CB29F0], 0, 0, v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v17);

      objc_destroyWeak(&v38);
      objc_destroyWeak((id *)buf);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[ASCModalViewInteraction installWithCancelBlock:].cold.2((uint64_t)self, v25, v26, v27, v28, v29, v30, v31);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[ASCModalViewInteraction installWithCancelBlock:].cold.1((uint64_t)self, v18, v19, v20, v21, v22, v23, v24);
  }

}

uint64_t __50__ASCModalViewInteraction_installWithCancelBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = 138543362;
    v5 = WeakRetained;
    _os_log_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Canceling %{public}@ for application entering background", (uint8_t *)&v4, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  ASCModalViewInteraction *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v21 = self;
    _os_log_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Invalidating %{public}@", buf, 0xCu);
  }
  -[ASCModalViewInteraction cancelGestureRecognizer](self, "cancelGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ASCModalViewInteraction cancelGestureRecognizer](self, "cancelGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCModalViewInteraction cancelGestureRecognizer](self, "cancelGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeGestureRecognizer:", v6);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[ASCModalViewInteraction observers](self, "observers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v7, "removeObserver:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  -[ASCModalViewInteraction observers](self, "observers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeAllObjects");

}

- (void)cancelGestureDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(void);

  if (objc_msgSend(a3, "state") == 3)
  {
    -[ASCModalViewInteraction cancelBlock](self, "cancelBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[ASCModalViewInteraction cancelBlock](self, "cancelBlock");
      v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v12[2]();

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[ASCModalViewInteraction cancelGestureDidChange:].cold.1((uint64_t)self, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (ASCModalViewGestureRecognizer)cancelGestureRecognizer
{
  return self->_cancelGestureRecognizer;
}

- (void)setCancelGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_cancelGestureRecognizer, a3);
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong((id *)&self->_cancelGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_view);
}

- (void)installWithCancelBlock:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Cannot install %{public}@ because its view is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_2();
}

- (void)installWithCancelBlock:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Cannot install %{public}@ because its view does not have a window", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_2();
}

- (void)cancelGestureDidChange:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Cancel block of %{public}@ is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_2();
}

@end
