@implementation _FEFocusEnvironmentContainerTuple

- (_FEFocusEnvironmentContainerTuple)initWithOwningEnvironment:(id)a3 itemContainer:(id)a4
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _FEFocusEnvironmentContainerTuple *v12;
  _FEFocusEnvironmentContainerTuple *v13;
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
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusItemContainer.m"), 394, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("owningEnvironment != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusItemContainer.m"), 395, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemContainer != nil"));

LABEL_3:
  objc_msgSend(v8, "_focusItemContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 != v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusItemContainer.m"), 396, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("owningEnvironment._focusItemContainer == itemContainer"));

  }
  v18.receiver = self;
  v18.super_class = (Class)_FEFocusEnvironmentContainerTuple;
  v12 = -[_FEFocusEnvironmentContainerTuple init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_owningEnvironment, a3);
    objc_storeStrong((id *)&v13->_itemContainer, a4);
    v13->_isScrollableContainer = _FEFocusItemContainerIsScrollableContainer(v10);
  }

  return v13;
}

+ (_FEFocusEnvironmentContainerTuple)tupleWithOwningEnvironment:(id)a3 itemContainer:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOwningEnvironment:itemContainer:", v7, v6);

  return (_FEFocusEnvironmentContainerTuple *)v8;
}

+ (_FEFocusEnvironmentContainerTuple)tupleWithRequiredContainerFromEnvironment:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "_focusItemContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tupleWithOwningEnvironment:itemContainer:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (_FEFocusEnvironmentContainerTuple *)v6;
}

- (BOOL)isEqualToEnvironmentContainerTuple:(id)a3
{
  _QWORD *v4;
  _FEFocusEnvironment *owningEnvironment;
  _FEFocusItemContainer *itemContainer;
  _FEFocusItemContainer *v7;
  _FEFocusEnvironment *v8;
  NSObject *v9;
  _BOOL4 v10;
  BOOL v12;
  NSObject *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  __CFString *v32;
  _FEFocusEnvironment *v33;
  _FEFocusItemContainer *v34;
  _FEFocusItemContainer *v35;
  _FEFocusEnvironment *v36;
  uint8_t buf[4];
  __CFString *v38;
  __int16 v39;
  __CFString *v40;
  __int16 v41;
  __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  owningEnvironment = self->_owningEnvironment;
  itemContainer = self->_itemContainer;
  v8 = (_FEFocusEnvironment *)v4[2];
  v7 = (_FEFocusItemContainer *)v4[3];
  logger();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);

  if (v10 && itemContainer == v7 && owningEnvironment != v8)
  {
    logger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v35 = v7;
      v36 = v8;
      v33 = owningEnvironment;
      v34 = itemContainer;
      -[_FEFocusEnvironmentContainerTuple itemContainer](self, "itemContainer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)MEMORY[0x24BDD17C8];
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@: %p>"), v19, v16);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v20 = CFSTR("(nil)");
      }
      v21 = v20;
      -[_FEFocusEnvironmentContainerTuple owningEnvironment](self, "owningEnvironment");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
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
      v27 = v26;
      objc_msgSend(v4, "owningEnvironment");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v29 = (void *)MEMORY[0x24BDD17C8];
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringWithFormat:", CFSTR("<%@: %p>"), v31, v28);
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v32 = CFSTR("(nil)");
      }
      *(_DWORD *)buf = 138412802;
      v38 = v21;
      v39 = 2112;
      v40 = v27;
      v41 = 2112;
      v42 = v32;
      _os_log_impl(&dword_23C48C000, v15, OS_LOG_TYPE_INFO, "Warning: encountered a single _FEFocusItemContainer: %@ yielded by two mismatched owning _FEFocusEnvironments: %@ and %@. _FEFocusItemContainer should be 1:1 with its owning environment.", buf, 0x20u);

      owningEnvironment = v33;
      itemContainer = v34;
      v7 = v35;
      v8 = v36;
    }

  }
  v12 = owningEnvironment == v8 && itemContainer == v7;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  v6 = v4
    && (v5 = objc_opt_class(), v5 == objc_opt_class())
    && -[_FEFocusEnvironmentContainerTuple isEqualToEnvironmentContainerTuple:](self, "isEqualToEnvironmentContainerTuple:", v4);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[_FEFocusEnvironmentContainerTuple owningEnvironment](self, "owningEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_FEFocusEnvironmentContainerTuple itemContainer](self, "itemContainer");
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; owningEnvironment: %@; itemContainer: %@>"),
    v5,
    self,
    self->_owningEnvironment,
    self->_itemContainer);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_FEFocusEnvironment)owningEnvironment
{
  return self->_owningEnvironment;
}

- (_FEFocusItemContainer)itemContainer
{
  return self->_itemContainer;
}

- (BOOL)isScrollableContainer
{
  return self->_isScrollableContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemContainer, 0);
  objc_storeStrong((id *)&self->_owningEnvironment, 0);
}

@end
