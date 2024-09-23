@implementation BKSAssertion

- (void)setInvalidationHandler:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  id invalidationHandler;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (void *)objc_msgSend(v5, "copy");

  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = v6;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)valid
{
  BKSAssertion *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[RBSAssertion isValid](v2->_internalAssertion, "isValid");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)dealloc
{
  objc_super v3;

  -[RBSAssertion invalidate](self->_internalAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BKSAssertion;
  -[BKSAssertion dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[BKSAssertion _invalidateSynchronously:](self, "_invalidateSynchronously:", 0);
}

- (void)_invalidateSynchronously:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  RBSAssertion *internalAssertion;
  id invalidationHandler;
  id acquisitionHandler;
  uint64_t v9;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[RBSAssertion removeObserver:](self->_internalAssertion, "removeObserver:", self);
  internalAssertion = self->_internalAssertion;
  if (v3)
  {
    v9 = 0;
    -[RBSAssertion invalidateWithError:](internalAssertion, "invalidateWithError:", &v9);
  }
  else
  {
    -[RBSAssertion invalidate](internalAssertion, "invalidate");
  }
  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  acquisitionHandler = self->_acquisitionHandler;
  self->_acquisitionHandler = 0;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)acquire
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id acquisitionHandler;
  RBSAssertion *v7;
  RBSAssertion *internalAssertion;
  RBSAssertion *v9;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v16;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_internalAssertion)
  {
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5E0B334](self->_acquisitionHandler);
    acquisitionHandler = self->_acquisitionHandler;
    self->_acquisitionHandler = 0;

    v7 = (RBSAssertion *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87C98]), "initWithExplanation:target:attributes:", self->_name, self->_target, self->_attributes);
    internalAssertion = self->_internalAssertion;
    self->_internalAssertion = v7;

    -[RBSAssertion addObserver:](self->_internalAssertion, "addObserver:", self);
    v9 = self->_internalAssertion;
    v16 = 0;
    v4 = -[RBSAssertion acquireWithError:](v9, "acquireWithError:", &v16);
    v10 = v16;
    os_unfair_lock_unlock(p_lock);
    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = -[BKSAssertion _bksErrorForRBSAssertionError:](self, "_bksErrorForRBSAssertionError:", objc_msgSend(v10, "code"));
      objc_msgSend(v10, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("BKSAssertionError"), v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
LABEL_6:

        return v4;
      }
    }
    else
    {
      v14 = 0;
      if (!v5)
        goto LABEL_6;
    }
    ((void (**)(_QWORD, uint64_t, void *))v5)[2](v5, v4, v14);
    goto LABEL_6;
  }
  os_unfair_lock_unlock(p_lock);
  LOBYTE(v4) = 1;
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_acquisitionHandler, 0);
  objc_storeStrong((id *)&self->_internalAssertion, 0);
}

- (id)_initWithName:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  BKSAssertion *v8;
  BKSAssertion *v9;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  id acquisitionHandler;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BKSAssertion;
  v8 = -[BKSAssertion init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v10 = objc_msgSend(v6, "copy");
    name = v9->_name;
    v9->_name = (NSString *)v10;

    v12 = objc_msgSend(v7, "copy");
    acquisitionHandler = v9->_acquisitionHandler;
    v9->_acquisitionHandler = (id)v12;

  }
  return v9;
}

- (void)_setTarget:(id)a3
{
  RBSTarget *v4;
  RBSTarget *target;

  v4 = (RBSTarget *)a3;
  os_unfair_lock_lock(&self->_lock);
  target = self->_target;
  self->_target = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_setAttributes:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[BKSAssertion _lock_setAttributes:](self, "_lock_setAttributes:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_setAttributes:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *attributes;
  id v9;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  objc_msgSend(MEMORY[0x1E0D87C80], "attributeWithCompletionPolicy:", 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObject:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (NSMutableArray *)objc_msgSend(v6, "copy");
  attributes = self->_attributes;
  self->_attributes = v7;

}

- (void)_acquireAsynchronously
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __38__BKSAssertion__acquireAsynchronously__block_invoke;
  v2[3] = &unk_1E6169688;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0D87E18], "performBackgroundWork:", v2);
}

- (unint64_t)_bksErrorForRBSAssertionError:(unint64_t)a3
{
  if (a3 - 1 > 7)
    return 0;
  else
    return qword_1B079A9D8[a3 - 1];
}

uint64_t __38__BKSAssertion__acquireAsynchronously__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "acquire");
}

- (BKSAssertion)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSAssertion.m"), 38, CFSTR("Don't instantiate instances of this abstract base class"));

  return 0;
}

- (id)invalidationHandler
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)MEMORY[0x1B5E0B334](self->_invalidationHandler);
  os_unfair_lock_unlock(p_lock);
  v5 = (void *)MEMORY[0x1B5E0B334](v4);

  return v5;
}

- (NSString)name
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSString copy](self->_name, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (void)setName:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSString *v6;
  NSString *name;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (NSString *)objc_msgSend(v5, "copy");

  name = self->_name;
  self->_name = v6;

  -[BKSAssertion _lock_reaquireAssertion](self, "_lock_reaquireAssertion");
  os_unfair_lock_unlock(p_lock);
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  os_unfair_lock_s *p_lock;
  id invalidationHandler;
  void *v7;
  id v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = (id)MEMORY[0x1B5E0B334](self->_invalidationHandler);
  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  os_unfair_lock_unlock(p_lock);
  v7 = v8;
  if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
    v7 = v8;
  }

}

- (id)_target
{
  os_unfair_lock_s *p_lock;
  RBSTarget *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_target;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_attributes
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_attributes, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_internalAssertion
{
  os_unfair_lock_s *p_lock;
  RBSAssertion *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_internalAssertion;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_acquisitionHandler
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)MEMORY[0x1B5E0B334](self->_acquisitionHandler);
  os_unfair_lock_unlock(p_lock);
  v5 = (void *)MEMORY[0x1B5E0B334](v4);

  return v5;
}

- (void)_lock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_reaquireAssertion
{
  void *v3;
  RBSAssertion *internalAssertion;

  os_unfair_lock_assert_owner(&self->_lock);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87C98]), "initWithExplanation:target:attributes:", self->_name, self->_target, self->_attributes);
  objc_msgSend(v3, "addObserver:", self);
  objc_msgSend(v3, "acquireWithError:", 0);
  -[RBSAssertion removeObserver:](self->_internalAssertion, "removeObserver:", self);
  -[RBSAssertion invalidate](self->_internalAssertion, "invalidate");
  internalAssertion = self->_internalAssertion;
  self->_internalAssertion = (RBSAssertion *)v3;

}

- (id)_lock_name
{
  os_unfair_lock_assert_owner(&self->_lock);
  return (id)-[NSString copy](self->_name, "copy");
}

- (void)_lock_setName:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSString *v6;
  NSString *name;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  v6 = (NSString *)objc_msgSend(v5, "copy");

  name = self->_name;
  self->_name = v6;

}

- (id)_lock_internalAssertion
{
  os_unfair_lock_assert_owner(&self->_lock);
  return self->_internalAssertion;
}

- (void)_lock_setInternalAssertion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_internalAssertion)
  {
    v5 = (void *)MEMORY[0x1E0D87E18];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__BKSAssertion__lock_setInternalAssertion___block_invoke;
    v8[3] = &unk_1E6169688;
    v9 = v4;
    v6 = v4;
    objc_msgSend(v5, "performBackgroundWork:", v8);

  }
  else
  {
    self->_internalAssertion = (RBSAssertion *)v4;
    v7 = v4;

    -[RBSAssertion addObserver:](self->_internalAssertion, "addObserver:", self);
  }

}

uint64_t __43__BKSAssertion__lock_setInternalAssertion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (id)_lock_acquisitionHandler
{
  void *v3;
  id acquisitionHandler;
  void *v5;

  os_unfair_lock_assert_owner(&self->_lock);
  v3 = (void *)objc_msgSend(self->_acquisitionHandler, "copy");
  acquisitionHandler = self->_acquisitionHandler;
  self->_acquisitionHandler = 0;

  v5 = (void *)MEMORY[0x1B5E0B334](v3);
  return v5;
}

- (id)_lock_attributes
{
  os_unfair_lock_assert_owner(&self->_lock);
  return (id)-[NSMutableArray copy](self->_attributes, "copy");
}

@end
