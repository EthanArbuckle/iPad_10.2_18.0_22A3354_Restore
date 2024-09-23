@implementation _FEFocusUpdateRequest

- (_FEFocusUpdateRequest)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusUpdateRequest.m"), 27, CFSTR("-init is not a valid initializer for this class."));

  return 0;
}

- (_FEFocusUpdateRequest)initWithEnvironment:(id)a3
{
  id v5;
  _FEFocusUpdateRequest *v6;
  _FEFocusUpdateRequest *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusUpdateRequest.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

  }
  v10.receiver = self;
  v10.super_class = (Class)_FEFocusUpdateRequest;
  v6 = -[_FEFocusUpdateRequest init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_focusSystem, 0);
    objc_storeWeak((id *)&v7->_environment, v5);
    objc_storeWeak((id *)&v7->_destinationEnvironment, v5);
    v7->_allowsDeferral = 1;
    v7->_allowsOverridingPreferedFocusEnvironments = 1;
  }

  return v7;
}

- (_FEFocusUpdateRequest)initWithFocusSystem:(id)a3 environment:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _FEFocusUpdateRequest *v10;
  _FEFocusUpdateRequest *v11;
  void *v13;
  void *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusUpdateRequest.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("focusSystem"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusUpdateRequest.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)_FEFocusUpdateRequest;
  v10 = -[_FEFocusUpdateRequest init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_focusSystem, v7);
    objc_storeWeak((id *)&v11->_environment, v9);
    objc_storeWeak((id *)&v11->_destinationEnvironment, v9);
    v11->_allowsDeferral = 1;
    v11->_allowsOverridingPreferedFocusEnvironments = 1;
  }

  return v11;
}

- (_FEFocusUpdateRequest)initWithFocusSystem:(id)a3 environment:(id)a4 destinationEnvironment:(id)a5
{
  id v9;
  id v10;
  id v11;
  _FEFocusUpdateRequest *v12;
  _FEFocusUpdateRequest *v13;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  objc_class *v19;
  void *v20;
  __CFString *v21;
  id v22;
  void *v23;
  objc_class *v24;
  void *v25;
  __CFString *v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusUpdateRequest.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationEnvironment"));

  }
  if (!_FEFocusEnvironmentIsAncestorOfEnvironment(v10, v11))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v11;
    if (v11)
    {
      v18 = (void *)MEMORY[0x24BDD17C8];
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@: %p>"), v20, v17);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = CFSTR("(nil)");
    }

    v22 = v10;
    if (v22)
    {
      v23 = (void *)MEMORY[0x24BDD17C8];
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@: %p>"), v25, v22);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v26 = CFSTR("(nil)");
    }

    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusUpdateRequest.m"), 61, CFSTR("Cannot request a focus update to destinationEnvironment %@ from non-ancestor environment %@"), v21, v26);
  }
  v12 = -[_FEFocusUpdateRequest initWithFocusSystem:environment:](self, "initWithFocusSystem:environment:", v9, v10);
  v13 = v12;
  if (v12)
    objc_storeWeak((id *)&v12->_destinationEnvironment, v11);

  return v13;
}

+ (id)requestForRemovingFocusInFocusSystem:(id)a3
{
  id v3;
  _FEFocusUpdateRequest *v4;

  v3 = a3;
  v4 = -[_FEFocusUpdateRequest initWithFocusSystem:environment:]([_FEFocusUpdateRequest alloc], "initWithFocusSystem:environment:", v3, v3);

  v4->_isFocusRemovalRequest = 1;
  v4->_allowsFocusingCurrentItem = 1;
  return v4;
}

- (id)requestByRedirectingRequestToEnvironment:(id)a3
{
  id v4;
  id *v5;

  v4 = a3;
  v5 = (id *)-[_FEFocusUpdateRequest copy](self, "copy");
  objc_storeWeak(v5 + 4, v4);
  objc_storeWeak(v5 + 2, v4);

  objc_storeWeak(v5 + 3, 0);
  return v5;
}

- (id)requestByRedirectingRequestToNextContainerEnvironment
{
  id WeakRetained;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __78___FEFocusUpdateRequest_requestByRedirectingRequestToNextContainerEnvironment__block_invoke;
  v6[3] = &unk_250D3A0E8;
  v6[4] = self;
  v6[5] = &v7;
  _FEFocusEnvironmentEnumerateAncestorEnvironments(WeakRetained, v6);

  if (v8[5])
  {
    -[_FEFocusUpdateRequest requestByRedirectingRequestToEnvironment:](self, "requestByRedirectingRequestToEnvironment:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  id v7;
  id v8;

  v4 = objc_alloc((Class)objc_opt_class());
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6 = objc_msgSend(v4, "initWithEnvironment:", WeakRetained);

  v7 = objc_loadWeakRetained((id *)&self->_focusSystem);
  objc_storeWeak((id *)(v6 + 24), v7);

  v8 = objc_loadWeakRetained((id *)&self->_destinationEnvironment);
  objc_storeWeak((id *)(v6 + 16), v8);

  *(_BYTE *)(v6 + 10) = self->_isFocusRemovalRequest;
  *(_BYTE *)(v6 + 11) = self->_shouldPlayFocusSound;
  *(_BYTE *)(v6 + 12) = self->_allowsFocusingCurrentItem;
  *(_BYTE *)(v6 + 9) = self->_allowsDeferral;
  *(_BYTE *)(v6 + 8) = self->_scrollIfNecessary;
  *(_BYTE *)(v6 + 13) = self->_allowsOverridingPreferedFocusEnvironments;
  *(_BYTE *)(v6 + 14) = self->_resetsUpdateThrottle;
  return (id)v6;
}

- (BOOL)canMergeWithRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  int v10;
  id WeakRetained;
  void *v12;
  id v13;
  id v14;
  _BOOL4 v15;
  id v16;
  id v17;
  int isFocusRemovalRequest;
  BOOL v20;

  v4 = a3;
  -[_FEFocusUpdateRequest focusSystem](self, "focusSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusSystem");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v4)
    v8 = v5 == 0;
  else
    v8 = 1;
  v10 = v8 || v5 == (void *)v6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_destinationEnvironment);
  if (WeakRetained)
  {
    objc_msgSend(v4, "destinationEnvironment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = objc_loadWeakRetained((id *)&self->_destinationEnvironment);
      objc_msgSend(v4, "destinationEnvironment");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = v13 == v14;

    }
    else
    {
      v15 = 1;
    }

  }
  else
  {
    v15 = 1;
  }

  if (v10)
  {
    v16 = objc_loadWeakRetained((id *)&self->_environment);
    objc_msgSend(v4, "environment");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v16 == v17 && v15)
    {
      isFocusRemovalRequest = self->_isFocusRemovalRequest;
      v20 = isFocusRemovalRequest == objc_msgSend(v4, "isFocusRemovalRequest");
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)requestByMergingWithRequest:(id)a3
{
  id *v4;
  _FEFocusUpdateRequest *v5;
  id WeakRetained;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v18;
  uint8_t v19[16];

  v4 = (id *)a3;
  if (!-[_FEFocusUpdateRequest canMergeWithRequest:](self, "canMergeWithRequest:", v4))
  {
    logger();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_fault_impl(&dword_23C48C000, v18, OS_LOG_TYPE_FAULT, "Cannot merge focus update requests that are not allowed to be merged.", v19, 2u);
    }

  }
  v5 = [_FEFocusUpdateRequest alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v7 = -[_FEFocusUpdateRequest initWithEnvironment:](v5, "initWithEnvironment:", WeakRetained);

  v8 = objc_loadWeakRetained((id *)&self->_focusSystem);
  if (v8)
  {
    objc_storeWeak((id *)(v7 + 24), v8);
  }
  else
  {
    v9 = objc_loadWeakRetained(v4 + 3);
    objc_storeWeak((id *)(v7 + 24), v9);

  }
  v10 = objc_loadWeakRetained((id *)&self->_destinationEnvironment);
  if (v10)
  {
    objc_storeWeak((id *)(v7 + 16), v10);
  }
  else
  {
    v11 = objc_loadWeakRetained(v4 + 2);
    objc_storeWeak((id *)(v7 + 16), v11);

  }
  *(_BYTE *)(v7 + 10) = self->_isFocusRemovalRequest;
  if (self->_allowsDeferral)
    v12 = objc_msgSend(v4, "allowsDeferral");
  else
    v12 = 0;
  objc_msgSend((id)v7, "setAllowsDeferral:", v12);
  if (self->_scrollIfNecessary)
    v13 = 1;
  else
    v13 = objc_msgSend(v4, "shouldScrollIfNecessary");
  objc_msgSend((id)v7, "setScrollIfNecessary:", v13);
  if (self->_shouldPlayFocusSound)
    v14 = 1;
  else
    v14 = objc_msgSend(v4, "shouldPlayFocusSound");
  objc_msgSend((id)v7, "setShouldPlayFocusSound:", v14);
  if (self->_allowsFocusingCurrentItem)
    v15 = 1;
  else
    v15 = objc_msgSend(v4, "allowsFocusingCurrentItem");
  objc_msgSend((id)v7, "setAllowsFocusingCurrentItem:", v15);
  if (self->_resetsUpdateThrottle)
    v16 = 1;
  else
    v16 = objc_msgSend(v4, "resetsUpdateThrottle");
  objc_msgSend((id)v7, "setResetsUpdateThrottle:", v16);

  return (id)v7;
}

- (_FEFocusSystem)focusSystem
{
  id WeakRetained;
  id v4;
  id v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  if (WeakRetained)
  {
    v4 = WeakRetained;
  }
  else
  {
    v5 = objc_loadWeakRetained((id *)&self->_environment);
    if (v5
      && (+[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", v5),
          (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v4 = v6;
    }
    else
    {
      v4 = 0;
    }

  }
  return (_FEFocusSystem *)v4;
}

- (void)cacheCurrentFocusSystem
{
  id v3;

  -[_FEFocusUpdateRequest focusSystem](self, "focusSystem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_focusSystem, v3);

}

- (BOOL)isValidInFocusSystem:(id)a3
{
  id v5;
  id WeakRetained;
  id v7;
  BOOL v8;
  id v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusUpdateRequest.m"), 206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("focusSystem"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  if (WeakRetained
    && (-[_FEFocusUpdateRequest focusSystem](self, "focusSystem"),
        v7 = (id)objc_claimAutoreleasedReturnValue(),
        v7,
        v7 == v5))
  {
    +[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", WeakRetained);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v9 == v5;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isMovementRequest
{
  return 0;
}

- (BOOL)requiresNextFocusedItem
{
  return 0;
}

- (BOOL)requiresEnvironmentValidation
{
  return 0;
}

- (BOOL)shouldPerformHapticFeedback
{
  return 0;
}

- (_FEFocusInputDeviceInfo)inputDeviceInfo
{
  return 0;
}

- (BOOL)shouldScrollIfNecessary
{
  return self->_scrollIfNecessary;
}

- (void)setScrollIfNecessary:(BOOL)a3
{
  self->_scrollIfNecessary = a3;
}

- (_FEFocusEnvironment)destinationEnvironment
{
  return (_FEFocusEnvironment *)objc_loadWeakRetained((id *)&self->_destinationEnvironment);
}

- (_FEFocusEnvironment)environment
{
  return (_FEFocusEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (BOOL)allowsDeferral
{
  return self->_allowsDeferral;
}

- (void)setAllowsDeferral:(BOOL)a3
{
  self->_allowsDeferral = a3;
}

- (BOOL)isFocusRemovalRequest
{
  return self->_isFocusRemovalRequest;
}

- (BOOL)shouldPlayFocusSound
{
  return self->_shouldPlayFocusSound;
}

- (void)setShouldPlayFocusSound:(BOOL)a3
{
  self->_shouldPlayFocusSound = a3;
}

- (BOOL)allowsFocusingCurrentItem
{
  return self->_allowsFocusingCurrentItem;
}

- (void)setAllowsFocusingCurrentItem:(BOOL)a3
{
  self->_allowsFocusingCurrentItem = a3;
}

- (BOOL)allowsOverridingPreferedFocusEnvironments
{
  return self->_allowsOverridingPreferedFocusEnvironments;
}

- (void)setAllowsOverridingPreferedFocusEnvironments:(BOOL)a3
{
  self->_allowsOverridingPreferedFocusEnvironments = a3;
}

- (BOOL)resetsUpdateThrottle
{
  return self->_resetsUpdateThrottle;
}

- (void)setResetsUpdateThrottle:(BOOL)a3
{
  self->_resetsUpdateThrottle = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_environment);
  objc_destroyWeak((id *)&self->_focusSystem);
  objc_destroyWeak((id *)&self->_destinationEnvironment);
}

@end
