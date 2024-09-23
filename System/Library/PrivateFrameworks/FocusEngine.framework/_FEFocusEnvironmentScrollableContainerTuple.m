@implementation _FEFocusEnvironmentScrollableContainerTuple

- (_FEFocusEnvironmentScrollableContainerTuple)initWithOwningEnvironment:(id)a3 scrollableContainer:(id)a4
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _FEFocusEnvironmentScrollableContainerTuple *v12;
  _FEFocusEnvironmentScrollableContainerTuple *v13;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusItemContainer.m"), 458, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("owningEnvironment != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusItemContainer.m"), 459, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scrollableContainer != nil"));

LABEL_3:
  objc_msgSend(v8, "_focusItemContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 != v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusItemContainer.m"), 460, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("owningEnvironment._focusItemContainer == scrollableContainer"));

  }
  v18.receiver = self;
  v18.super_class = (Class)_FEFocusEnvironmentScrollableContainerTuple;
  v12 = -[_FEFocusEnvironmentScrollableContainerTuple init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_owningEnvironment, a3);
    objc_storeStrong((id *)&v13->_scrollableContainer, a4);
  }

  return v13;
}

+ (id)tupleWithOwningEnvironment:(id)a3 scrollableContainer:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOwningEnvironment:scrollableContainer:", v7, v6);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  objc_class *v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  uint8_t buf[4];
  __CFString *v38;
  __int16 v39;
  __CFString *v40;
  __int16 v41;
  __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4 || (v5 = objc_opt_class(), v5 != objc_opt_class()))
  {
    v6 = 0;
    goto LABEL_12;
  }
  v7 = v4;
  logger();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    -[_FEFocusEnvironmentScrollableContainerTuple scrollableContainer](self, "scrollableContainer");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scrollableContainer");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v10 == v11)
    {
      -[_FEFocusEnvironmentScrollableContainerTuple owningEnvironment](self, "owningEnvironment");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "owningEnvironment");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 == v18)
        goto LABEL_8;
      logger();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        -[_FEFocusEnvironmentScrollableContainerTuple scrollableContainer](self, "scrollableContainer");
        v19 = objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = (void *)MEMORY[0x24BDD17C8];
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@: %p>"), v22, v19);
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v23 = CFSTR("(nil)");
        }
        v36 = (void *)v19;
        v24 = v23;
        -[_FEFocusEnvironmentScrollableContainerTuple owningEnvironment](self, "owningEnvironment");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v26 = (void *)MEMORY[0x24BDD17C8];
          v27 = (objc_class *)objc_opt_class();
          NSStringFromClass(v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringWithFormat:", CFSTR("<%@: %p>"), v28, v25);
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v29 = CFSTR("(nil)");
        }
        v30 = v29;
        objc_msgSend(v7, "owningEnvironment");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          v32 = (void *)MEMORY[0x24BDD17C8];
          v33 = (objc_class *)objc_opt_class();
          NSStringFromClass(v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "stringWithFormat:", CFSTR("<%@: %p>"), v34, v31);
          v35 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v35 = CFSTR("(nil)");
        }
        *(_DWORD *)buf = 138412802;
        v38 = v24;
        v39 = 2112;
        v40 = v30;
        v41 = 2112;
        v42 = v35;
        _os_log_impl(&dword_23C48C000, v10, OS_LOG_TYPE_INFO, "Warning: encountered a single _FEFocusItemContainer: %@ yielded by two mismatched owning _FEFocusEnvironments: %@ and %@. _FEFocusItemContainer should be 1:1 with its owning environment.", buf, 0x20u);

      }
    }
    else
    {

    }
  }
LABEL_8:
  -[_FEFocusEnvironmentScrollableContainerTuple owningEnvironment](self, "owningEnvironment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "owningEnvironment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == v13)
  {
    -[_FEFocusEnvironmentScrollableContainerTuple scrollableContainer](self, "scrollableContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scrollableContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v14 == v15;

  }
  else
  {
    v6 = 0;
  }

LABEL_12:
  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[_FEFocusEnvironmentScrollableContainerTuple owningEnvironment](self, "owningEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_FEFocusEnvironmentScrollableContainerTuple scrollableContainer](self, "scrollableContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; owningEnvironment: %@; scrollableContainer: %@>"),
    v5,
    self,
    self->_owningEnvironment,
    self->_scrollableContainer);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_FEFocusEnvironment)owningEnvironment
{
  return self->_owningEnvironment;
}

- (_FEFocusItemScrollableContainer)scrollableContainer
{
  return self->_scrollableContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollableContainer, 0);
  objc_storeStrong((id *)&self->_owningEnvironment, 0);
}

@end
