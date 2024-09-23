@implementation XRLazyKVOAdapter

+ (id)observeKeyPath:(id)a3 object:(id)a4 observer:(id)a5 lazyUpdateBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v14, (uint64_t)v20, 1, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_observeKeyPathArray_object_observer_lazyUpdateBlock_(a1, v17, (uint64_t)v16, (uint64_t)v11, (uint64_t)v12, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)observeKeyPathArray:(id)a3 object:(id)a4 observer:(id)a5 lazyUpdateBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _XRLazyKVOBlockToken *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  int v47;
  objc_class *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *Name;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  objc_class *v65;
  id v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  id v85;
  int v86;
  _QWORD v87[4];
  id v88;
  id v89;
  id location;
  uint8_t buf[4];
  int v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  const char *v96;
  __int16 v97;
  uint64_t v98;
  _QWORD v99[2];

  v99[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = [_XRLazyKVOBlockToken alloc];
  v18 = (void *)objc_msgSend_initWithObject_observer_(v15, v16, (uint64_t)v12, (uint64_t)v13, v17);
  v19 = objc_alloc((Class)a1);
  v23 = (void *)objc_msgSend_initWithLazyKVOResponder_(v19, v20, (uint64_t)v18, v21, v22);
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  objc_msgSend_fireCallbackContext_whenKeypaths_changeOnClass_(v23, v26, v24, (uint64_t)v11, v25);
  objc_msgSend_observeObject_(v23, v27, (uint64_t)v12, v28, v29);
  v99[0] = *MEMORY[0x24BDBCA90];
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v30, (uint64_t)v99, 1, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRunLoopModes_(v23, v33, (uint64_t)v32, v34, v35);

  objc_msgSend_setStrongBlockAdapterToken_(v23, v36, (uint64_t)v18, v37, v38);
  objc_msgSend_setSuspended_(v23, v39, 0, v40, v41);
  objc_initWeak(&location, v23);
  if (_DVTIURuntimeCheckForBlockCaptureOfObject((uint64_t)v14, v12))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      if ((id)objc_opt_class() == a1)
        v47 = 43;
      else
        v47 = 45;
      v84 = v47;
      v48 = (objc_class *)objc_opt_class();
      NSStringFromClass(v48);
      v85 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v83 = objc_msgSend_UTF8String(v85, v49, v50, v51, v52);
      Name = sel_getName(a2);
      objc_msgSend_description(v12, v54, v55, v56, v57);
      v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v63 = objc_msgSend_UTF8String(v58, v59, v60, v61, v62);
      *(_DWORD *)buf = 67109890;
      v92 = v84;
      v93 = 2080;
      v94 = v83;
      v95 = 2080;
      v96 = Name;
      v97 = 2080;
      v98 = v63;
      _os_log_fault_impl(&dword_22634C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "The block provided to %c[%s %s] captures the observed object (%s) which may extend its lifetime.  Use the 'object' parameter passed to the block instead.\nSet a breakpoint in '_DVTIUInvalidBlockCaptureBreak' to debug", buf, 0x26u);

    }
    _DVTIUInvalidBlockCaptureBreak(v14, v12);
  }
  if (_DVTIURuntimeCheckForBlockCaptureOfObject((uint64_t)v14, v13))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      if ((id)objc_opt_class() == a1)
        v64 = 43;
      else
        v64 = 45;
      v86 = v64;
      v65 = (objc_class *)objc_opt_class();
      NSStringFromClass(v65);
      v66 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v71 = objc_msgSend_UTF8String(v66, v67, v68, v69, v70);
      v72 = sel_getName(a2);
      objc_msgSend_description(v13, v73, v74, v75, v76);
      v77 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v82 = objc_msgSend_UTF8String(v77, v78, v79, v80, v81);
      *(_DWORD *)buf = 67109890;
      v92 = v86;
      v93 = 2080;
      v94 = v71;
      v95 = 2080;
      v96 = v72;
      v97 = 2080;
      v98 = v82;
      _os_log_fault_impl(&dword_22634C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "The block provided to %c[%s %s] captures the observer (%s) which could lead to a retain cycle -- possibly via 'self' or ivar usage.  Use the 'observer' parameter passed to the block instead.\nSet a breakpoint in '_DVTIUInvalidBlockCaptureBreak' to debug", buf, 0x26u);

    }
    _DVTIUInvalidBlockCaptureBreak(v14, v13);
  }
  v87[0] = MEMORY[0x24BDAC760];
  v87[1] = 3221225472;
  v87[2] = sub_2263696F8;
  v87[3] = &unk_24EDC44F8;
  v42 = v14;
  v88 = v42;
  objc_copyWeak(&v89, &location);
  objc_msgSend_setBlock_(v18, v43, (uint64_t)v87, v44, v45);
  objc_destroyWeak(&v89);

  objc_destroyWeak(&location);
  return v23;
}

- (XRLazyKVOAdapter)init
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;

  v5 = (void *)MEMORY[0x24BDBCE88];
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], a2, (uint64_t)"-[XRLazyKVOAdapter init]", v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_raise_format_(v5, v7, *MEMORY[0x24BDBCAB8], (uint64_t)CFSTR("Don't call %@."), v8, v6);

  return 0;
}

- (XRLazyKVOAdapter)initWithLazyKVOResponder:(id)a3
{
  id v4;
  XRLazyKVOAdapter *v5;
  XRLazyKVOAdapter *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMapTable *keyPathsByContextByClz;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSMapTable *keyPathsByContextByObj;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSArray *runLoopModes;
  id WeakRetained;
  objc_super v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)XRLazyKVOAdapter;
  v5 = -[XRLazyKVOAdapter init](&v25, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_responder, v4);
    objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x24BDD1650], v7, v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    keyPathsByContextByClz = v6->_keyPathsByContextByClz;
    v6->_keyPathsByContextByClz = (NSMapTable *)v11;

    objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x24BDD1650], v13, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    keyPathsByContextByObj = v6->_keyPathsByContextByObj;
    v6->_keyPathsByContextByObj = (NSMapTable *)v17;

    v26[0] = *MEMORY[0x24BDBCA90];
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v19, (uint64_t)v26, 1, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    runLoopModes = v6->_runLoopModes;
    v6->_runLoopModes = (NSArray *)v21;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_responder);
    v6->_implementsWillChangeHandler = objc_opt_respondsToSelector() & 1;

  }
  return v6;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  objc_msgSend_mainRunLoop(MEMORY[0x24BDBCF18], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancelPerformSelectorsWithTarget_(v6, v7, (uint64_t)self, v8, v9);

  sub_226369968(self);
  v10.receiver = self;
  v10.super_class = (Class)XRLazyKVOAdapter;
  -[XRLazyKVOAdapter dealloc](&v10, sel_dealloc);
}

- (void)setSuspended:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  if (self->_suspended != a3)
  {
    self->_suspended = a3;
    if (a3)
    {
      objc_msgSend_mainRunLoop(MEMORY[0x24BDBCF18], a2, a3, v3, v4);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_cancelPerformSelectorsWithTarget_(v9, v6, (uint64_t)self, v7, v8);

    }
    else if (self->_updatedContexts.__table_.__p2_.__value_)
    {
      objc_msgSend__callbackHandler(self, a2, a3, v3, v4);
    }
  }
}

- (void)fireCallbackContext:(const void *)a3 whenKeypaths:(id)a4 changeOnClass:(Class)a5
{
  id v8;
  NSMapTable *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  id v18;

  v8 = a4;
  v9 = self->_keyPathsByContextByClz;
  v18 = v8;
  objc_msgSend_objectForKey_(v9, v10, (uint64_t)a5, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v15 = (void *)objc_opt_new();
    objc_msgSend_setObject_forKey_(v9, v16, (uint64_t)v15, (uint64_t)a5, v17);
  }
  objc_msgSend_setObject_forIntegerKey_(v15, v13, (uint64_t)v18, (uint64_t)a3, v14);

}

- (void)observeObject:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  objc_class *Superclass;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  XRLazyKVOAdapter *v23;
  id v24;
  uint64_t v25;

  v7 = a3;
  if (v7)
  {
    objc_msgSend_objectForKey_(self->_keyPathsByContextByObj, v4, (uint64_t)v7, v5, v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend_setObject_forKey_(self->_keyPathsByContextByObj, v10, (uint64_t)v9, (uint64_t)v7, v11);
      Superclass = (objc_class *)objc_opt_class();
      v16 = 0;
      while (Superclass && !v16)
      {
        objc_msgSend_objectForKey_(self->_keyPathsByContextByClz, v12, (uint64_t)Superclass, v13, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        Superclass = class_getSuperclass(Superclass);
      }
      if (self->_implementsWillChangeHandler)
        v17 = 13;
      else
        v17 = 5;
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = sub_226369E78;
      v21[3] = &unk_24EDC4520;
      v22 = v7;
      v23 = self;
      v25 = v17;
      v8 = v9;
      v24 = v8;
      objc_msgSend_enumerateObjectsAndIntegerKeys_(v16, v18, (uint64_t)v21, v19, v20);

    }
  }

}

- (void)removeObservationsForObject:(id)a3
{
  sub_226369FCC(self->_keyPathsByContextByObj, a3, self);
}

- (BOOL)hasContextChanged:(const void *)a3
{
  const void *v4;

  v4 = a3;
  return sub_22636A59C(&self->_presentedContexts.__table_.__bucket_list_.__ptr_.__value_, &v4) != 0;
}

- (void)_callbackHandler
{
  XRLazyKVOResponder **p_responder;
  id WeakRetained;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id obj;

  p_responder = &self->_responder;
  obj = objc_loadWeakRetained((id *)&self->_responder);
  objc_sync_enter(obj);
  while (self->_updatedContexts.__table_.__p2_.__value_)
  {
    self->_presentedContexts.__table_.__p3_.__value_ = self->_updatedContexts.__table_.__p3_.__value_;
    sub_22636A688(&self->_presentedContexts.__table_.__bucket_list_.__ptr_.__value_, (_QWORD *)self->_updatedContexts.__table_.__p1_.__value_.__next_, 0);
    sub_22636A8D0(&self->_updatedContexts.__table_.__bucket_list_.__ptr_.__value_);
    WeakRetained = objc_loadWeakRetained((id *)p_responder);
    objc_msgSend_handleLazyKVOUpdate_(WeakRetained, v5, (uint64_t)self, v6, v7);

    sub_22636A8D0(&self->_presentedContexts.__table_.__bucket_list_.__ptr_.__value_);
  }
  objc_sync_exit(obj);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  id WeakRetained;
  const char *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v16 = v12;
  v38 = a6;
  if (self->_implementsWillChangeHandler
    && (objc_msgSend_objectForKeyedSubscript_(v12, v13, *MEMORY[0x24BDD0E78], v14, v15),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend_BOOLValue(v17, v18, v19, v20, v21),
        v17,
        v22))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_responder);
    objc_msgSend_prepareForLazyKVOUpdate_object_keyPath_context_(WeakRetained, v24, (uint64_t)self, (uint64_t)v11, (uint64_t)v10, a6);

  }
  else if (self->_runLoopModes)
  {
    v25 = objc_loadWeakRetained((id *)&self->_responder);
    objc_sync_enter(v25);
    if (!self->_updatedContexts.__table_.__p2_.__value_ && !self->_suspended)
    {
      objc_msgSend_mainRunLoop(MEMORY[0x24BDBCF18], v26, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_performSelector_target_argument_order_modes_(v30, v31, (uint64_t)sel__callbackHandler, (uint64_t)self, 0, 0, self->_runLoopModes);

    }
    objc_msgSend_objectForKey_(self->_keyPathsByContextByObj, v26, (uint64_t)v11, v28, v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
      sub_22636A934((uint64_t)&self->_updatedContexts, &v38, &v38);
    objc_sync_exit(v25);

  }
  else
  {
    objc_msgSend_objectForKey_(self->_keyPathsByContextByObj, v13, (uint64_t)v11, v14, v15);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
      sub_22636A934((uint64_t)&self->_updatedContexts, &v38, &v38);
    objc_msgSend__callbackHandler(self, v34, v35, v36, v37);
  }

}

- (NSArray)runLoopModes
{
  return self->_runLoopModes;
}

- (void)setRunLoopModes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (_XRLazyKVOBlockToken)strongBlockAdapterToken
{
  return self->_strongBlockAdapterToken;
}

- (void)setStrongBlockAdapterToken:(id)a3
{
  objc_storeStrong((id *)&self->_strongBlockAdapterToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongBlockAdapterToken, 0);
  objc_storeStrong((id *)&self->_runLoopModes, 0);
  objc_destroyWeak((id *)&self->_responder);
  sub_22636AB84((uint64_t)&self->_presentedContexts);
  sub_22636AB84((uint64_t)&self->_updatedContexts);
  objc_storeStrong((id *)&self->_keyPathsByContextByObj, 0);
  objc_storeStrong((id *)&self->_keyPathsByContextByClz, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((_DWORD *)self + 14) = 1065353216;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_DWORD *)self + 24) = 1065353216;
  return self;
}

@end
