@implementation AUParameterNode

- (AUParameterNode)initWithID:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  AUParameterNode *v9;
  AUParameterNode *v10;
  void *v12;
  void *v13;
  id v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "containsString:", CFSTR(".")))
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Identifier '%@' contains '.', which is reserved as a delimiter"), v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "exceptionWithName:reason:userInfo:", CFSTR("AUInvalidNodeInfoException"), v13, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v14);
  }
  v15.receiver = self;
  v15.super_class = (Class)AUParameterNode;
  v9 = -[AUParameterNode init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_displayName, a4);
  }

  return v10;
}

- (void)dealloc
{
  _QWORD *observerList;
  _QWORD *v4;
  _QWORD *v5;
  objc_super v6;

  observerList = self->_observerList;
  if (observerList)
  {
    v4 = (_QWORD *)*observerList;
    v5 = (_QWORD *)observerList[1];
    if ((_QWORD *)*observerList != v5)
    {
      do
      {
        if (*v4)
          (*(void (**)(_QWORD, SEL))(*(_QWORD *)*v4 + 8))(*v4, a2);
        ++v4;
      }
      while (v4 != v5);
      v4 = (_QWORD *)*observerList;
    }
    if (v4)
    {
      observerList[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x193FFE460](observerList, 0x80C40D6874129);
  }

  v6.receiver = self;
  v6.super_class = (Class)AUParameterNode;
  -[AUParameterNode dealloc](&v6, sel_dealloc);
}

- (BOOL)isGroup
{
  return 0;
}

- (id)copyNodeWithOffset:(unint64_t)a3
{
  return 0;
}

- (void)_walkTree:(int)a3 callback:(id)a4
{
  uint64_t v4;
  void (**v6)(id, _QWORD, AUParameterNode *);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v4 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, AUParameterNode *))a4;
  v6[2](v6, v4, self);
  if (-[AUParameterNode isGroup](self, "isGroup"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[AUParameterNode children](self, "children", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v13;
      v10 = (v4 + 1);
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "_walkTree:callback:", v10, v6);
        }
        while (v8 != v11);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (NSString)keyPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[AUParameterNode identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUParameterNode parentNode](self, "parentNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  objc_msgSend(v4, "keyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {

LABEL_5:
    v9 = v3;
    goto LABEL_6;
  }
  -[AUParameterNode parentNode](self, "parentNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(".%@"), v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return (NSString *)v9;
}

- (id)_rootParent
{
  uint64_t v3;
  AUParameterNode *v4;
  AUParameterNode *i;
  void *v6;

  -[AUParameterNode parentNode](self, "parentNode");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (AUParameterNode *)v3;
    for (i = 0; ; v4 = i)
    {
      -[AUParameterNode parentNode](v4, "parentNode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        break;
      i = v6;

    }
  }
  else
  {
    v4 = self;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v4 = 0;
  }
  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[AUParameterNode identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUParameterNode displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, \"%@\", \"%@\">"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (AUParameterObserverToken)tokenByAddingParameterObserver:(AUParameterObserver)observer
{
  AUParameterObserver v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = observer;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[AUParameterNode _rootParent](self, "_rootParent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "observationQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__AUParameterNode_tokenByAddingParameterObserver___block_invoke;
    v10[3] = &unk_1E2921018;
    v10[4] = self;
    v11 = v6;
    v13 = &v14;
    v12 = v4;
    dispatch_sync(v7, v10);

  }
  v8 = (void *)v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)_addRecObserver:(id)a3 autoObserver:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[AUParameterNode _rootParent](self, "_rootParent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "observationQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__AUParameterNode__addRecObserver_autoObserver___block_invoke;
    block[3] = &unk_1E2921040;
    block[4] = self;
    v14 = v9;
    v15 = v6;
    v17 = &v18;
    v16 = v7;
    dispatch_sync(v10, block);

  }
  v11 = (void *)v19[3];

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (AUParameterObserverToken)tokenByAddingParameterRecordingObserver:(AUParameterRecordingObserver)observer
{
  return -[AUParameterNode _addRecObserver:autoObserver:](self, "_addRecObserver:autoObserver:", observer, 0);
}

- (AUParameterObserverToken)tokenByAddingParameterAutomationObserver:(AUParameterAutomationObserver)observer
{
  return -[AUParameterNode _addRecObserver:autoObserver:](self, "_addRecObserver:autoObserver:", 0, observer);
}

- (void)removeParameterObserver:(AUParameterObserverToken)token
{
  void *v5;
  char v6;
  NSObject *v7;
  id v8;
  _QWORD block[6];
  char v10;

  if (token)
  {
    -[AUParameterNode _rootParent](self, "_rootParent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = *((_BYTE *)token + 8);
      v8 = v5;
      objc_msgSend(v5, "observationQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __43__AUParameterNode_removeParameterObserver___block_invoke;
      block[3] = &unk_1E2921068;
      block[4] = self;
      block[5] = token;
      v10 = v6;
      dispatch_sync(v7, block);

      v5 = v8;
    }

  }
}

- (NSString)displayNameWithLength:(NSInteger)maximumLength
{
  AUParameterNode *v4;
  AUParameterNode *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = self;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    while (1)
    {
      objc_msgSend(v6, "implementorDisplayNameWithLengthCallback");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v7)
        break;
      objc_msgSend(v6, "parentNode");
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v9;
      if (!v9)
        goto LABEL_5;
    }
    (*(void (**)(uint64_t, AUParameterNode *, NSInteger))(v7 + 16))(v7, v5, maximumLength);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    -[AUParameterNode displayName](v5, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (unint64_t)indexInGroup
{
  return self->_indexInGroup;
}

- (void)setIndexInGroup:(unint64_t)a3
{
  self->_indexInGroup = a3;
}

- (AUParameterGroup)parentNode
{
  return (AUParameterGroup *)objc_loadWeakRetained((id *)&self->_parentNode);
}

- (void)setParentNode:(id)a3
{
  objc_storeWeak((id *)&self->_parentNode, a3);
}

- (void)observerList
{
  return self->_observerList;
}

- (void)setObserverList:(void *)a3
{
  self->_observerList = a3;
}

- (id)impl_implementorValueObserver
{
  return self->_impl_implementorValueObserver;
}

- (void)setImpl_implementorValueObserver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)impl_implementorValueProvider
{
  return self->_impl_implementorValueProvider;
}

- (void)setImpl_implementorValueProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)impl_implementorStringFromValueCallback
{
  return self->_impl_implementorStringFromValueCallback;
}

- (void)setImpl_implementorStringFromValueCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)impl_implementorValueFromStringCallback
{
  return self->_impl_implementorValueFromStringCallback;
}

- (void)setImpl_implementorValueFromStringCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)impl_implementorDisplayNameWithLengthCallback
{
  return self->_impl_implementorDisplayNameWithLengthCallback;
}

- (void)setImpl_implementorDisplayNameWithLengthCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_impl_implementorDisplayNameWithLengthCallback, 0);
  objc_storeStrong(&self->_impl_implementorValueFromStringCallback, 0);
  objc_storeStrong(&self->_impl_implementorStringFromValueCallback, 0);
  objc_storeStrong(&self->_impl_implementorValueProvider, 0);
  objc_storeStrong(&self->_impl_implementorValueObserver, 0);
  objc_destroyWeak((id *)&self->_parentNode);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

uint64_t __43__AUParameterNode_removeParameterObserver___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  if (v1)
  {
    v2 = result;
    v3 = *(_QWORD *)(result + 40);
    v4 = *(_QWORD **)(v1 + 8);
    v5 = *(_QWORD **)v1;
    if (*(_QWORD **)v1 != v4)
    {
      while (*v5 != v3)
      {
        if (++v5 == v4)
        {
          v5 = *(_QWORD **)(v1 + 8);
          break;
        }
      }
    }
    v6 = v5 + 1;
    if (v5 != v4 && v6 != v4)
    {
      do
      {
        if (*v6 != v3)
          *v5++ = *v6;
        ++v6;
      }
      while (v6 != v4);
      v4 = *(_QWORD **)(v1 + 8);
    }
    if (v4 != v5)
      *(_QWORD *)(v1 + 8) = v5;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    return objc_msgSend(*(id *)(v2 + 32), "_observersChanged:deltaCount:", *(unsigned __int8 *)(v2 + 48), 0xFFFFFFFFLL);
  }
  return result;
}

void __48__AUParameterNode__addRecObserver_autoObserver___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  void **v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  unint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[5])
  {
    v3 = (_QWORD *)operator new();
    v3[1] = 0;
    v3[2] = 0;
    *v3 = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = v3;
    objc_msgSend(*(id *)(a1 + 40), "_checkInitTreeObservation");
    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v2, "_observersChanged:deltaCount:", 1, 1);
  v4 = *(void **)(a1 + 48);
  v5 = *(void ***)(*(_QWORD *)(a1 + 32) + 40);
  if (!v4)
  {
    v6 = *(id *)(a1 + 56);
    v7 = operator new();
    *(_BYTE *)(v7 + 8) = 1;
    *(_QWORD *)v7 = &off_1E2907240;
    *(_QWORD *)(v7 + 16) = 0;
    *(_QWORD *)(v7 + 24) = _Block_copy(v6);
    v9 = (uint64_t *)v5[1];
    v15 = (unint64_t)v5[2];
    if ((unint64_t)v9 >= v15)
    {
      v17 = ((char *)v9 - (_BYTE *)*v5) >> 3;
      if ((unint64_t)(v17 + 1) >> 61)
        std::vector<float>::__throw_length_error[abi:ne180100]();
      v18 = v15 - (_QWORD)*v5;
      v19 = v18 >> 2;
      if (v18 >> 2 <= (unint64_t)(v17 + 1))
        v19 = v17 + 1;
      if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8)
        v20 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v20 = v19;
      if (v20)
        v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned char *>>(v20);
      else
        v21 = 0;
      v22 = (uint64_t *)(v20 + 8 * v17);
      v23 = v20 + 8 * v21;
      *v22 = v7;
      v16 = v22 + 1;
      v27 = (char *)*v5;
      v24 = (char *)v5[1];
      if (v24 == *v5)
        goto LABEL_31;
      do
      {
        v28 = *((_QWORD *)v24 - 1);
        v24 -= 8;
        *--v22 = v28;
      }
      while (v24 != v27);
      goto LABEL_30;
    }
LABEL_14:
    *v9 = v7;
    v16 = v9 + 1;
    goto LABEL_33;
  }
  v6 = v4;
  v7 = operator new();
  *(_BYTE *)(v7 + 8) = 1;
  *(_QWORD *)v7 = &off_1E2907240;
  *(_QWORD *)(v7 + 16) = _Block_copy(v6);
  *(_QWORD *)(v7 + 24) = 0;
  v9 = (uint64_t *)v5[1];
  v8 = (unint64_t)v5[2];
  if ((unint64_t)v9 < v8)
    goto LABEL_14;
  v10 = ((char *)v9 - (_BYTE *)*v5) >> 3;
  if ((unint64_t)(v10 + 1) >> 61)
    std::vector<float>::__throw_length_error[abi:ne180100]();
  v11 = v8 - (_QWORD)*v5;
  v12 = v11 >> 2;
  if (v11 >> 2 <= (unint64_t)(v10 + 1))
    v12 = v10 + 1;
  if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
    v13 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v13 = v12;
  if (v13)
    v13 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned char *>>(v13);
  else
    v14 = 0;
  v22 = (uint64_t *)(v13 + 8 * v10);
  v23 = v13 + 8 * v14;
  *v22 = v7;
  v16 = v22 + 1;
  v25 = (char *)*v5;
  v24 = (char *)v5[1];
  if (v24 == *v5)
    goto LABEL_31;
  do
  {
    v26 = *((_QWORD *)v24 - 1);
    v24 -= 8;
    *--v22 = v26;
  }
  while (v24 != v25);
LABEL_30:
  v24 = (char *)*v5;
LABEL_31:
  *v5 = v22;
  v5[1] = v16;
  v5[2] = (void *)v23;
  if (v24)
    operator delete(v24);
LABEL_33:
  v5[1] = v16;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v7;
}

void __50__AUParameterNode_tokenByAddingParameterObserver___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void **v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  unint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[5])
  {
    v3 = (_QWORD *)operator new();
    v3[1] = 0;
    v3[2] = 0;
    *v3 = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = v3;
    objc_msgSend(*(id *)(a1 + 40), "_checkInitTreeObservation");
    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v2, "_observersChanged:deltaCount:", 0, 1);
  v4 = *(void ***)(*(_QWORD *)(a1 + 32) + 40);
  v5 = *(id *)(a1 + 48);
  v6 = operator new();
  *(_BYTE *)(v6 + 8) = 0;
  *(_QWORD *)v6 = &off_1E2901050;
  *(_QWORD *)(v6 + 16) = _Block_copy(v5);
  v8 = (uint64_t *)v4[1];
  v7 = (unint64_t)v4[2];
  if ((unint64_t)v8 >= v7)
  {
    v10 = ((char *)v8 - (_BYTE *)*v4) >> 3;
    if ((unint64_t)(v10 + 1) >> 61)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v11 = v7 - (_QWORD)*v4;
    v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1))
      v12 = v10 + 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v12;
    if (v13)
      v13 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned char *>>(v13);
    else
      v14 = 0;
    v15 = (uint64_t *)(v13 + 8 * v10);
    v16 = v13 + 8 * v14;
    *v15 = v6;
    v9 = v15 + 1;
    v18 = (char *)*v4;
    v17 = (char *)v4[1];
    if (v17 != *v4)
    {
      do
      {
        v19 = *((_QWORD *)v17 - 1);
        v17 -= 8;
        *--v15 = v19;
      }
      while (v17 != v18);
      v17 = (char *)*v4;
    }
    *v4 = v15;
    v4[1] = v9;
    v4[2] = (void *)v16;
    if (v17)
      operator delete(v17);
  }
  else
  {
    *v8 = v6;
    v9 = v8 + 1;
  }
  v4[1] = v9;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v6;
}

@end
