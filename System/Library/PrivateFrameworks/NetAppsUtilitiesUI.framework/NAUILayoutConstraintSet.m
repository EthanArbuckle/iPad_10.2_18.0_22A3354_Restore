@implementation NAUILayoutConstraintSet

- (NAUILayoutConstraintSet)initWithOwningView:(id)a3 constraintBuilder:(id)a4
{
  id v6;
  NAUILayoutConstraintSet *v7;
  id v8;
  uint64_t v9;
  id builder;
  objc_super v12;
  id location;

  objc_initWeak(&location, a3);
  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NAUILayoutConstraintSet;
  v7 = -[NAUILayoutConstraintSet init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v7->_owningView, v8);

    v9 = MEMORY[0x219A0070C](v6);
    builder = v7->_builder;
    v7->_builder = (id)v9;

  }
  objc_destroyWeak(&location);
  return v7;
}

- (BOOL)isActive
{
  void *v2;
  BOOL v3;

  -[NAUILayoutConstraintSet constraints](self, "constraints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)activateIfNeeded
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (!-[NAUILayoutConstraintSet isActive](self, "isActive"))
  {
    -[NAUILayoutConstraintSet owningView](self, "owningView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[NAUILayoutConstraintSet builder](self, "builder");
      v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[NAUILayoutConstraintSet owningView](self, "owningView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v4)[2](v4, v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (v6)
        v8 = v6;
      else
        v8 = MEMORY[0x24BDBD1A8];
      -[NAUILayoutConstraintSet setConstraints:](self, "setConstraints:", v8);

      v9 = (void *)MEMORY[0x24BE1A2C8];
      -[NAUILayoutConstraintSet constraints](self, "constraints");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "activateConstraints:", v10);

    }
  }
}

- (void)invalidate
{
  void *v3;
  void *v4;
  id v5;

  if (-[NAUILayoutConstraintSet isActive](self, "isActive"))
  {
    v3 = (void *)MEMORY[0x24BE1A2C8];
    -[NAUILayoutConstraintSet constraints](self, "constraints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deactivateConstraints:", v4);

    -[NAUILayoutConstraintSet setConstraints:](self, "setConstraints:", 0);
    -[NAUILayoutConstraintSet owningView](self, "owningView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsUpdateConstraints");

  }
}

- (void)updateConstraintConstants
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[NAUILayoutConstraintSet owningView](self, "owningView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[NAUILayoutConstraintSet isActive](self, "isActive");

    if (v5)
    {
      -[NAUILayoutConstraintSet builder](self, "builder");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[NAUILayoutConstraintSet owningView](self, "owningView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v6)[2](v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = (void *)MEMORY[0x24BDBD1A8];
      if (v8)
        v10 = (void *)v8;
      v11 = v10;

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      obj = v11;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v24;
        v15 = MEMORY[0x24BDAC760];
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v16);
            -[NAUILayoutConstraintSet constraints](self, "constraints");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v22[0] = v15;
            v22[1] = 3221225472;
            v22[2] = __52__NAUILayoutConstraintSet_updateConstraintConstants__block_invoke;
            v22[3] = &unk_24D612718;
            v22[4] = v17;
            objc_msgSend(v18, "na_firstObjectPassingTest:", v22);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              objc_msgSend(v17, "constant");
              objc_msgSend(v19, "setConstant:");
            }
            else
            {
              -[NAUILayoutConstraintSet constraints](self, "constraints");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              NSLog(CFSTR("Found new constraint %@ that does not have a matching constraint in the existing set of constraints. This means that %s was invoked without first invalidating the constraints in response to a state change. Existing constraints: %@"), v17, "-[NAUILayoutConstraintSet updateConstraintConstants]", v20);

            }
            ++v16;
          }
          while (v13 != v16);
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v13);
      }

    }
  }
}

BOOL __52__NAUILayoutConstraintSet_updateConstraintConstants__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  _BOOL8 v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  float v17;
  float v18;
  float v19;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "firstAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "secondAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "secondAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {

    }
    else
    {
      if (!v8)
      {

        goto LABEL_12;
      }
      v11 = objc_msgSend(v8, "isEqual:", v9);

      if (!v11)
        goto LABEL_12;
    }
    v13 = objc_msgSend(*(id *)(a1 + 32), "relation");
    if (v13 == objc_msgSend(v3, "relation"))
    {
      objc_msgSend(*(id *)(a1 + 32), "multiplier");
      v15 = v14;
      objc_msgSend(v3, "multiplier");
      if (NACGFloatEqualToFloat(v15, v16))
      {
        objc_msgSend(*(id *)(a1 + 32), "priority");
        v18 = v17;
        objc_msgSend(v3, "priority");
        v12 = v18 == v19;
LABEL_13:

        goto LABEL_14;
      }
    }
LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (UIView)owningView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_owningView);
}

- (id)builder
{
  return self->_builder;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong(&self->_builder, 0);
  objc_destroyWeak((id *)&self->_owningView);
}

@end
