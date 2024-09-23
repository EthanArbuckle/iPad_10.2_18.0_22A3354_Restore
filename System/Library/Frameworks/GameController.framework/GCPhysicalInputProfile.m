@implementation GCPhysicalInputProfile

- (GCPhysicalInputProfile)initWithController:(id)a3
{
  id v4;
  GCPhysicalInputProfile *v5;
  GCPhysicalInputProfile *v6;

  v4 = a3;
  v5 = -[GCPhysicalInputProfile init](self, "init");
  v6 = v5;
  if (v5)
    -[GCPhysicalInputProfile setController:](v5, "setController:", v4);

  return v6;
}

- (GCMotion)_motion
{
  return (GCMotion *)objc_getProperty(self, a2, 56, 1);
}

- (void)set_motion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (id)productCategory
{
  return CFSTR("MFi");
}

- (id)valueChangedHandler
{
  return 0;
}

- (unsigned)sampleRate
{
  return 0;
}

- (void)setDpad:(id)a3 x:(double)a4 y:(double)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  double v11;
  char v12;
  void *v13;
  double v14;
  int v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  _QWORD v18[5];
  id v19;

  v8 = a3;
  -[GCPhysicalInputProfile handlerQueue](self, "handlerQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "xAxis");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v11 = a4;
  v12 = objc_msgSend(v10, "_setValue:queue:", v9, v11);

  objc_msgSend(v8, "yAxis");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v14 = a5;
  v15 = objc_msgSend(v13, "_setValue:queue:", v9, v14);

  if ((v12 & 1) != 0 || v15)
  {
    if (v9)
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __46__GCPhysicalInputProfile_Legacy__setDpad_x_y___block_invoke;
      v18[3] = &unk_24D2B2B48;
      v18[4] = self;
      v19 = v8;
      dispatch_async(v9, v18);

    }
    else
    {
      -[GCPhysicalInputProfile valueChangedHandler](self, "valueChangedHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[GCPhysicalInputProfile valueChangedHandler](self, "valueChangedHandler");
        v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, GCPhysicalInputProfile *, id))v17)[2](v17, self, v8);

      }
    }
  }

}

void __46__GCPhysicalInputProfile_Legacy__setDpad_x_y___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "valueChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "valueChangedHandler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)setButton:(id)a3 value:(double)a4
{
  id v6;
  NSObject *v7;
  double v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  _QWORD v11[5];
  id v12;

  v6 = a3;
  -[GCPhysicalInputProfile handlerQueue](self, "handlerQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a4;
  if (objc_msgSend(v6, "_setValue:queue:", v7, v8))
  {
    if (v7)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __50__GCPhysicalInputProfile_Legacy__setButton_value___block_invoke;
      v11[3] = &unk_24D2B2B48;
      v11[4] = self;
      v12 = v6;
      dispatch_async(v7, v11);

    }
    else
    {
      -[GCPhysicalInputProfile valueChangedHandler](self, "valueChangedHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[GCPhysicalInputProfile valueChangedHandler](self, "valueChangedHandler");
        v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, GCPhysicalInputProfile *, id))v10)[2](v10, self, v6);

      }
    }
  }

}

void __50__GCPhysicalInputProfile_Legacy__setButton_value___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "valueChangedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "valueChangedHandler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)setButton:(id)a3 pressed:(BOOL)a4
{
  double v4;

  v4 = 0.0;
  if (a4)
    v4 = 1.0;
  -[GCPhysicalInputProfile setButton:value:](self, "setButton:value:", a3, v4);
}

- (GCPhysicalInputProfile)retain
{
  int64_t *p_inlineRefcount;
  uint64_t v3;

  p_inlineRefcount = &self->_inlineRefcount;
  do
    v3 = __ldaxr((unint64_t *)p_inlineRefcount);
  while (__stlxr(v3 + 2, (unint64_t *)p_inlineRefcount));
  if (v3 <= -3)
    __break(1u);
  return self;
}

- (void)release
{
  int64_t *p_inlineRefcount;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id Weak;
  char v8;
  unint64_t v9;
  _QWORD v10[5];

  p_inlineRefcount = &self->_inlineRefcount;
  do
    v4 = __ldaxr((unint64_t *)p_inlineRefcount);
  while (__stlxr(v4 - 2, (unint64_t *)p_inlineRefcount));
  if (v4 <= 0)
  {
    if (v4 < 0)
    {
LABEL_11:
      __break(1u);
      return;
    }
    objc_removeAssociatedObjects(self);
    v5 = objc_clear_deallocating();
    v6 = (void *)MEMORY[0x2199DE97C](v5);
    Weak = objc_loadWeak((id *)&self->weakPool);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __refcountZeroed_block_invoke;
    v10[3] = &unk_24D2B5FF0;
    v10[4] = self;
    v8 = objc_msgSend(Weak, "addObjectWith:", v10);
    objc_autoreleasePoolPop(v6);
    if ((v8 & 1) == 0)
    {
      while (1)
      {
        v9 = __ldaxr((unint64_t *)p_inlineRefcount);
        if (v9 != -2)
          break;
        if (!__stlxr(1uLL, (unint64_t *)p_inlineRefcount))
        {
          -[GCPhysicalInputProfile dealloc](self, "dealloc");
          return;
        }
      }
      __clrex();
      goto LABEL_11;
    }
  }
}

- (unint64_t)retainCount
{
  return (unint64_t)(self->_inlineRefcount + 2) >> 1;
}

- (BOOL)_tryRetain
{
  unint64_t *p_inlineRefcount;
  uint64_t v3;
  BOOL v4;
  BOOL result;
  unint64_t v6;

  p_inlineRefcount = (unint64_t *)&self->_inlineRefcount;
  while (1)
  {
    v3 = *p_inlineRefcount;
    v4 = (*p_inlineRefcount & 1) != 0 || v3 == -2;
    result = !v4;
    if (v4)
      break;
    if (v3 <= -3)
    {
      __break(1u);
      return result;
    }
    while (1)
    {
      v6 = __ldaxr(p_inlineRefcount);
      if (v6 != v3)
        break;
      if (!__stlxr(v3 + 2, p_inlineRefcount))
        return result;
    }
    __clrex();
  }
  return result;
}

- (BOOL)_isDeallocating
{
  int64_t inlineRefcount;

  inlineRefcount = self->_inlineRefcount;
  if (inlineRefcount == -2)
  {
    LOBYTE(self) = 1;
  }
  else if (inlineRefcount <= -3)
  {
    __break(1u);
  }
  else
  {
    LOBYTE(self) = inlineRefcount & 1;
  }
  return (char)self;
}

- (GCPhysicalInputProfile)init
{
  void *v3;
  GCPhysicalInputProfile *v4;

  +[NSUUID UUID](&off_254DEEE48, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[GCPhysicalInputProfile initWithIdentifier:](self, "initWithIdentifier:", v3);

  return v4;
}

- (GCPhysicalInputProfile)initWithIdentifier:(id)a3
{
  id v4;
  GCPhysicalInputProfile *v5;
  uint64_t v6;
  NSObject *identifier;
  uint64_t v8;
  NSMutableDictionary *elements;
  uint64_t v10;
  NSMutableDictionary *buttons;
  uint64_t v12;
  NSMutableDictionary *axes;
  uint64_t v14;
  NSMutableDictionary *dpads;
  uint64_t v16;
  NSMutableDictionary *touchpads;
  uint64_t v18;
  NSMutableSet *allElements;
  uint64_t v20;
  NSMutableSet *allButtons;
  uint64_t v22;
  NSMutableSet *allAxes;
  uint64_t v24;
  NSMutableSet *allDpads;
  uint64_t v26;
  NSMutableSet *allTouchpads;
  uint64_t v28;
  NSMutableSet *allGestureAwareButtons;
  uint64_t v30;
  NSMutableSet *topLevelElements;
  uint64_t v32;
  NSMutableSet *topLevelButtons;
  uint64_t v34;
  NSMutableSet *topLevelDirectionPads;
  uint64_t v36;
  NSMutableSet *topLevelTouchpads;
  NSDictionary *physicalInputNameToElementAlias;
  NSDictionary *elementAliasToPhysicalInputNames;
  GCObjectPool *v40;
  GCObjectPool *pool;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)GCPhysicalInputProfile;
  v5 = -[GCPhysicalInputProfile init](&v43, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copyWithZone:", 0);
    identifier = v5->_identifier;
    v5->_identifier = v6;

    +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    elements = v5->_elements;
    v5->_elements = (NSMutableDictionary *)v8;

    +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    buttons = v5->_buttons;
    v5->_buttons = (NSMutableDictionary *)v10;

    +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    axes = v5->_axes;
    v5->_axes = (NSMutableDictionary *)v12;

    +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    dpads = v5->_dpads;
    v5->_dpads = (NSMutableDictionary *)v14;

    +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    touchpads = v5->_touchpads;
    v5->_touchpads = (NSMutableDictionary *)v16;

    +[NSMutableSet set](&off_254DEBF30, "set");
    v18 = objc_claimAutoreleasedReturnValue();
    allElements = v5->_allElements;
    v5->_allElements = (NSMutableSet *)v18;

    +[NSMutableSet set](&off_254DEBF30, "set");
    v20 = objc_claimAutoreleasedReturnValue();
    allButtons = v5->_allButtons;
    v5->_allButtons = (NSMutableSet *)v20;

    +[NSMutableSet set](&off_254DEBF30, "set");
    v22 = objc_claimAutoreleasedReturnValue();
    allAxes = v5->_allAxes;
    v5->_allAxes = (NSMutableSet *)v22;

    +[NSMutableSet set](&off_254DEBF30, "set");
    v24 = objc_claimAutoreleasedReturnValue();
    allDpads = v5->_allDpads;
    v5->_allDpads = (NSMutableSet *)v24;

    +[NSMutableSet set](&off_254DEBF30, "set");
    v26 = objc_claimAutoreleasedReturnValue();
    allTouchpads = v5->_allTouchpads;
    v5->_allTouchpads = (NSMutableSet *)v26;

    +[NSMutableSet set](&off_254DEBF30, "set");
    v28 = objc_claimAutoreleasedReturnValue();
    allGestureAwareButtons = v5->_allGestureAwareButtons;
    v5->_allGestureAwareButtons = (NSMutableSet *)v28;

    +[NSMutableSet set](&off_254DEBF30, "set");
    v30 = objc_claimAutoreleasedReturnValue();
    topLevelElements = v5->__topLevelElements;
    v5->__topLevelElements = (NSMutableSet *)v30;

    +[NSMutableSet set](&off_254DEBF30, "set");
    v32 = objc_claimAutoreleasedReturnValue();
    topLevelButtons = v5->__topLevelButtons;
    v5->__topLevelButtons = (NSMutableSet *)v32;

    +[NSMutableSet set](&off_254DEBF30, "set");
    v34 = objc_claimAutoreleasedReturnValue();
    topLevelDirectionPads = v5->__topLevelDirectionPads;
    v5->__topLevelDirectionPads = (NSMutableSet *)v34;

    +[NSMutableSet set](&off_254DEBF30, "set");
    v36 = objc_claimAutoreleasedReturnValue();
    topLevelTouchpads = v5->__topLevelTouchpads;
    v5->__topLevelTouchpads = (NSMutableSet *)v36;

    physicalInputNameToElementAlias = v5->_physicalInputNameToElementAlias;
    v5->_physicalInputNameToElementAlias = 0;

    elementAliasToPhysicalInputNames = v5->_elementAliasToPhysicalInputNames;
    v5->_elementAliasToPhysicalInputNames = 0;

    if (!v5->pooled)
    {
      v40 = objc_alloc_init(GCObjectPool);
      pool = v5->pool;
      v5->pool = v40;

    }
  }

  return v5;
}

- (GCPhysicalInputProfile)initWithIdentifier:(id)a3 andPool:(id)a4
{
  id v6;
  GCPhysicalInputProfile *v7;

  self->pooled = 1;
  v6 = a4;
  v7 = -[GCPhysicalInputProfile initWithIdentifier:](self, "initWithIdentifier:", a3);
  objc_storeWeak((id *)&v7->weakPool, v6);

  return v7;
}

- (NSString)name
{
  return (NSString *)CFSTR("GCNamedProfile");
}

- (id)device
{
  return objc_loadWeakRetained((id *)&self->_device);
}

- (void)setDevice:(id)a3
{
  GCDevice **p_device;
  id WeakRetained;

  p_device = &self->_device;
  objc_storeWeak((id *)&self->_device, a3);
  -[GCPhysicalInputProfile updateElementDeviceReferences](self, "updateElementDeviceReferences");
  WeakRetained = objc_loadWeakRetained((id *)p_device);
  objc_opt_class();
  objc_opt_isKindOfClass();

}

- (GCController)controller
{
  GCDevice **p_device;
  id WeakRetained;
  id v4;

  p_device = &self->_device;
  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_loadWeakRetained((id *)p_device);
  else
    v4 = 0;

  return (GCController *)v4;
}

- (OS_dispatch_queue)handlerQueue
{
  id WeakRetained;
  void *v3;
  id v4;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  objc_msgSend(WeakRetained, "handlerQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    v4 = (id)MEMORY[0x24BDAC9B8];
    v6 = MEMORY[0x24BDAC9B8];
  }

  return (OS_dispatch_queue *)v4;
}

- (BOOL)settingsProfile:(id)a3 differsFrom:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  char v33;
  NSObject *v34;
  id v35;
  int v36;
  int v37;
  int v38;
  NSObject *v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 0;
  }
  else
  {
    v8 = 1;
    if (v5 && v6)
    {
      objc_msgSend(v5, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_25;
      objc_msgSend(v5, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (!v14)
        goto LABEL_25;
      objc_msgSend(v5, "elementMappings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");
      objc_msgSend(v7, "elementMappings");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v16 == v18)
      {
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        objc_msgSend(v5, "elementMappings");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "keyEnumerator");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        obj = v20;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v43;
          while (2)
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v43 != v23)
                objc_enumerationMutation(obj);
              v25 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
              objc_msgSend(v5, "elementMappings");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "objectForKeyedSubscript:", v25);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v7, "elementMappings");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "objectForKeyedSubscript:", v25);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v29)
                goto LABEL_34;
              v30 = objc_msgSend(v27, "remappingOrder");
              if (v30 != objc_msgSend(v29, "remappingOrder")
                || (objc_msgSend(v27, "mappingKey"),
                    v31 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v29, "mappingKey"),
                    v32 = (void *)objc_claimAutoreleasedReturnValue(),
                    v33 = objc_msgSend(v31, "isEqual:", v32),
                    v32,
                    v31,
                    (v33 & 1) == 0))
              {
                if (gc_isInternalBuild())
                {
                  getGCLogger();
                  v34 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                    -[GCPhysicalInputProfile settingsProfile:differsFrom:].cold.2(v27, v29, v34);
LABEL_33:

                }
LABEL_34:

                v8 = 1;
                goto LABEL_35;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v34 = v27;
                  v35 = v29;
                  v36 = -[NSObject invertHorizontally](v34, "invertHorizontally");
                  if (v36 != objc_msgSend(v35, "invertHorizontally")
                    || (v37 = -[NSObject invertVertically](v34, "invertVertically"),
                        v37 != objc_msgSend(v35, "invertVertically"))
                    || (v38 = -[NSObject swapAxes](v34, "swapAxes"), v38 != objc_msgSend(v35, "swapAxes")))
                  {
                    if (gc_isInternalBuild())
                    {
                      getGCLogger();
                      v40 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                        -[GCPhysicalInputProfile settingsProfile:differsFrom:].cold.1(v34);

                    }
                    goto LABEL_33;
                  }

                }
              }

            }
            v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
            v8 = 0;
            if (v22)
              continue;
            break;
          }
        }
        else
        {
          v8 = 0;
        }
LABEL_35:

      }
      else
      {
LABEL_25:
        v8 = 1;
      }
    }
  }

  return v8;
}

- (void)setSettingsProfile:(id)a3
{
  id v5;
  GCSProfile *v6;
  NSObject *v7;
  id v8;
  GCSProfile *v9;
  _QWORD block[5];
  GCSProfile *v11;
  id v12;

  v5 = a3;
  v6 = self->_settingsProfile;
  objc_storeStrong((id *)&self->_settingsProfile, a3);
  -[GCPhysicalInputProfile applySettingsProfile:](self, "applySettingsProfile:", self->_settingsProfile);
  -[GCPhysicalInputProfile handlerQueue](self, "handlerQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__GCPhysicalInputProfile_setSettingsProfile___block_invoke;
  block[3] = &unk_24D2B3D70;
  block[4] = self;
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);

}

void __45__GCPhysicalInputProfile_setSettingsProfile___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "controller");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isPublished"))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "settingsProfile:differsFrom:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

    if (v2)
    {
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(*(id *)(a1 + 32), "controller");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v9 = v6;
          _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_INFO, "Posting GCControllerUserCustomizationsDidChangeNotification: %@", buf, 0xCu);

        }
      }
      +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "controller");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("GCControllerUserCustomizationsDidChangeNotification"), v4, 0);

    }
  }
  else
  {

  }
}

- (void)applySettingsProfile:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  GCPhysicalInputProfile *v11;
  NSDictionary *physicalInputNameToElementAlias;
  NSDictionary *elementAliasToPhysicalInputNames;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  GCReplayKitGestureSettings *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  int v60;
  GCControllerElement *v61;
  uint64_t v62;
  void *v63;
  int v64;
  GCControllerElement *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  int v69;
  GCControllerElement *v70;
  uint64_t v71;
  void *v72;
  int v73;
  GCControllerElement *v74;
  uint64_t v75;
  void *v76;
  int v77;
  GCControllerElement *v78;
  uint64_t v79;
  void *v80;
  int v81;
  GCControllerElement *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  int v86;
  GCControllerElement *v87;
  uint64_t v88;
  void *v89;
  int v90;
  GCControllerElement *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  int v95;
  GCControllerElement *v96;
  uint64_t v97;
  void *v98;
  int v99;
  GCControllerElement *v100;
  uint64_t v101;
  void *v102;
  int v103;
  GCControllerElement *v104;
  uint64_t v105;
  void *v106;
  int v107;
  GCControllerElement *v108;
  uint64_t v109;
  void *v110;
  int v111;
  GCControllerElement *v112;
  uint64_t v113;
  void *v114;
  int v115;
  GCControllerElement *v116;
  uint64_t v117;
  void *v118;
  int v119;
  GCControllerElement *v120;
  uint64_t v121;
  void *v122;
  int v123;
  GCControllerElement *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  char v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  char v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t k;
  void *v195;
  void *v196;
  int v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  NSDictionary *v206;
  NSDictionary *v207;
  NSDictionary *v208;
  NSDictionary *v209;
  __CFString *v210;
  uint64_t v211;
  uint64_t v212;
  GCReplayKitGestureSettings *v213;
  NSMutableSet *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  id v221;
  void *v222;
  void *v223;
  NSDictionary *v224;
  NSDictionary *v225;
  id obj;
  GCControllerElement **obja;
  GCPhysicalInputProfile *v228;
  void *v229;
  id v230;
  id v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  _BYTE v248[128];
  _BYTE v249[128];
  _BYTE v250[128];
  _BYTE v251[128];
  uint64_t v252;

  v252 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    self->_hasRemappedElements = 0;
    v244 = 0u;
    v245 = 0u;
    v246 = 0u;
    v247 = 0u;
    v228 = self;
    -[GCPhysicalInputProfile allButtons](self, "allButtons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v244, v251, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v245;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v245 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v244 + 1) + 8 * i);
          if ((objc_msgSend(v10, "remappingKey") & 0x80000000) == 0)
            objc_storeStrong((id *)&v228->_remappedElements[(int)objc_msgSend(v10, "remappingKey")], v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v244, v251, 16);
      }
      while (v7);
    }

    v11 = v228;
    physicalInputNameToElementAlias = v228->_physicalInputNameToElementAlias;
    v228->_physicalInputNameToElementAlias = 0;

    elementAliasToPhysicalInputNames = v228->_elementAliasToPhysicalInputNames;
    v228->_elementAliasToPhysicalInputNames = 0;

    v225 = (NSDictionary *)objc_opt_new();
    v224 = (NSDictionary *)objc_opt_new();
    v14 = (void *)objc_opt_new();
    v229 = (void *)objc_opt_new();
    -[NSMutableDictionary objectForKeyedSubscript:](v228->_elements, "objectForKeyedSubscript:", CFSTR("Button Share"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = CFSTR("Button Options");
    if (v15)
      v16 = CFSTR("Button Share");
    v17 = v16;
    v18 = objc_alloc_init(GCReplayKitGestureSettings);
    v210 = v17;
    -[GCReplayKitGestureSettings setControllerElementMappingKey:](v18, "setControllerElementMappingKey:", v17);
    -[GCReplayKitGestureSettings setSinglePressGesture:](v18, "setSinglePressGesture:", -1);
    -[GCReplayKitGestureSettings setDoublePressGesture:](v18, "setDoublePressGesture:", objc_msgSend(v4, "doublePressShareGesture") - 1);
    -[GCReplayKitGestureSettings setLongPressGesture:](v18, "setLongPressGesture:", objc_msgSend(v4, "longPressShareGesture") - 1);
    v242 = 0u;
    v243 = 0u;
    v240 = 0u;
    v241 = 0u;
    -[GCPhysicalInputProfile _topLevelButtons](v228, "_topLevelButtons");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v240, v250, 16);
    v221 = v4;
    v230 = v14;
    v213 = v18;
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v241;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v241 != v21)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v240 + 1) + 8 * j);
          if (objc_msgSend(v23, "remappable"))
          {
            objc_msgSend(v4, "elementMappingForPhysicalPress:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              objc_msgSend(v4, "logicalButtonForPhysicalPressOf:onPhysicalInputProfile:", v23, v11);
              v25 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v25 = v23;
            }
            v26 = v25;
            if (v25)
            {
              objc_storeStrong((id *)&v228->_remappedElements[(int)objc_msgSend(v23, "remappingKey")], v25);
              objc_msgSend(v23, "primaryAlias");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "primaryAlias");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[GCPhysicalInputProfile registerPhysicalInputName:toElementAlias:withPhysicalToElementMapping:withElementToPhysicalMapping:](v228, "registerPhysicalInputName:toElementAlias:withPhysicalToElementMapping:withElementToPhysicalMapping:", v27, v28, v225, v224);

              objc_msgSend(v26, "unmappedSfSymbolsName");
              v29 = objc_claimAutoreleasedReturnValue();
              if (!v29)
                goto LABEL_25;
              v30 = (void *)v29;
              objc_msgSend(v26, "primaryAlias");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v230, "objectForKeyedSubscript:", v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "unmappedSfSymbolsName");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v32, "isEqualToString:", v33);

              if ((v34 & 1) == 0)
              {
LABEL_25:
                objc_msgSend(v23, "unmappedSfSymbolsName");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "primaryAlias");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v230, "setObject:forKeyedSubscript:", v35, v36);

              }
              objc_msgSend(v26, "unmappedNameLocalizationKey");
              v37 = objc_claimAutoreleasedReturnValue();
              if (!v37)
                goto LABEL_28;
              v38 = (void *)v37;
              objc_msgSend(v26, "primaryAlias");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v229, "objectForKeyedSubscript:", v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "unmappedNameLocalizationKey");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v40, "isEqualToString:", v41);

              if ((v42 & 1) == 0)
              {
LABEL_28:
                objc_msgSend(v23, "unmappedNameLocalizationKey");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "primaryAlias");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v229, "setObject:forKeyedSubscript:", v43, v44);

              }
            }

            v4 = v221;
            v11 = v228;
            v14 = v230;
            v18 = v213;
          }
          -[GCPhysicalInputProfile applyGestureSettingsToButton:withSettings:](v11, "applyGestureSettingsToButton:withSettings:", v23, v18);
        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v240, v250, 16);
      }
      while (v20);
    }

    v238 = 0u;
    v239 = 0u;
    v236 = 0u;
    v237 = 0u;
    v214 = v11->__topLevelDirectionPads;
    v45 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v214, "countByEnumeratingWithState:objects:count:", &v236, v249, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v237;
      obja = v11->_remappedElements;
      v211 = *(_QWORD *)v237;
      do
      {
        v48 = 0;
        v212 = v46;
        do
        {
          if (*(_QWORD *)v237 != v47)
            objc_enumerationMutation(v214);
          v49 = *(void **)(*((_QWORD *)&v236 + 1) + 8 * v48);
          if (objc_msgSend(v49, "remappable"))
          {
            objc_msgSend(v4, "directionPadMappingForPhysicalPress:", v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            if (v50)
            {
              objc_msgSend(v4, "logicalDirectionPadForPhysicalPressOf:onPhysicalInputProfile:", v49, v11);
              v51 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v51 = v49;
            }
            v52 = v51;
            if (v51)
            {
              objc_msgSend(v49, "primaryAlias");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "primaryAlias");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              -[GCPhysicalInputProfile registerPhysicalInputName:toElementAlias:withPhysicalToElementMapping:withElementToPhysicalMapping:](v11, "registerPhysicalInputName:toElementAlias:withPhysicalToElementMapping:withElementToPhysicalMapping:", v53, v54, v225, v224);

              LODWORD(v53) = objc_msgSend(v50, "swapAxes");
              v55 = objc_msgSend(v50, "invertHorizontally");
              v56 = objc_msgSend(v50, "invertVertically");
              v218 = v50;
              if ((_DWORD)v53)
              {
                objc_msgSend(v52, "yAxis");
                v220 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "xAxis");
                v219 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "yAxis");
                v223 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "xAxis");
                v57 = objc_claimAutoreleasedReturnValue();
                if (v55)
                {
                  objc_msgSend(v52, "left");
                  v58 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "up");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  v60 = objc_msgSend(v59, "remappingKey");
                  v61 = obja[v60];
                  obja[v60] = (GCControllerElement *)v58;

                  objc_msgSend(v49, "left");
                  v222 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "right");
                  v62 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "down");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  v64 = objc_msgSend(v63, "remappingKey");
                  v65 = obja[v64];
                  obja[v64] = (GCControllerElement *)v62;

                  objc_msgSend(v49, "right");
                }
                else
                {
                  objc_msgSend(v52, "right");
                  v75 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "up");
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  v77 = objc_msgSend(v76, "remappingKey");
                  v78 = obja[v77];
                  obja[v77] = (GCControllerElement *)v75;

                  objc_msgSend(v49, "right");
                  v222 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "left");
                  v79 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "down");
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  v81 = objc_msgSend(v80, "remappingKey");
                  v82 = obja[v81];
                  obja[v81] = (GCControllerElement *)v79;

                  objc_msgSend(v49, "left");
                }
                v217 = (void *)objc_claimAutoreleasedReturnValue();
                v83 = (void *)v57;
                if (v56)
                {
                  objc_msgSend(v52, "up");
                  v84 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "left");
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  v86 = objc_msgSend(v85, "remappingKey");
                  v87 = obja[v86];
                  obja[v86] = (GCControllerElement *)v84;

                  objc_msgSend(v49, "up");
                  v216 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "down");
                  v88 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "right");
                  v89 = (void *)objc_claimAutoreleasedReturnValue();
                  v90 = objc_msgSend(v89, "remappingKey");
                  v91 = obja[v90];
                  obja[v90] = (GCControllerElement *)v88;

                  objc_msgSend(v49, "down");
                }
                else
                {
                  objc_msgSend(v52, "down");
                  v109 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "left");
                  v110 = (void *)objc_claimAutoreleasedReturnValue();
                  v111 = objc_msgSend(v110, "remappingKey");
                  v112 = obja[v111];
                  obja[v111] = (GCControllerElement *)v109;

                  objc_msgSend(v49, "down");
                  v216 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "up");
                  v113 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "right");
                  v114 = (void *)objc_claimAutoreleasedReturnValue();
                  v115 = objc_msgSend(v114, "remappingKey");
                  v116 = obja[v115];
                  obja[v115] = (GCControllerElement *)v113;

                  objc_msgSend(v49, "up");
                }
              }
              else
              {
                objc_msgSend(v52, "xAxis");
                v220 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "yAxis");
                v219 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "xAxis");
                v223 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "yAxis");
                v66 = objc_claimAutoreleasedReturnValue();
                if (v56)
                {
                  objc_msgSend(v52, "down");
                  v67 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "up");
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  v69 = objc_msgSend(v68, "remappingKey");
                  v70 = obja[v69];
                  obja[v69] = (GCControllerElement *)v67;

                  objc_msgSend(v49, "down");
                  v222 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "up");
                  v71 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "down");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  v73 = objc_msgSend(v72, "remappingKey");
                  v74 = obja[v73];
                  obja[v73] = (GCControllerElement *)v71;

                  objc_msgSend(v49, "up");
                }
                else
                {
                  objc_msgSend(v52, "up");
                  v93 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "up");
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  v95 = objc_msgSend(v94, "remappingKey");
                  v96 = obja[v95];
                  obja[v95] = (GCControllerElement *)v93;

                  objc_msgSend(v49, "up");
                  v222 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "down");
                  v97 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "down");
                  v98 = (void *)objc_claimAutoreleasedReturnValue();
                  v99 = objc_msgSend(v98, "remappingKey");
                  v100 = obja[v99];
                  obja[v99] = (GCControllerElement *)v97;

                  objc_msgSend(v49, "down");
                }
                v217 = (void *)objc_claimAutoreleasedReturnValue();
                v83 = (void *)v66;
                if (v55)
                {
                  objc_msgSend(v52, "right");
                  v101 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "left");
                  v102 = (void *)objc_claimAutoreleasedReturnValue();
                  v103 = objc_msgSend(v102, "remappingKey");
                  v104 = obja[v103];
                  obja[v103] = (GCControllerElement *)v101;

                  objc_msgSend(v49, "right");
                  v216 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "left");
                  v105 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "right");
                  v106 = (void *)objc_claimAutoreleasedReturnValue();
                  v107 = objc_msgSend(v106, "remappingKey");
                  v108 = obja[v107];
                  obja[v107] = (GCControllerElement *)v105;

                  objc_msgSend(v49, "left");
                }
                else
                {
                  objc_msgSend(v52, "left");
                  v117 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "left");
                  v118 = (void *)objc_claimAutoreleasedReturnValue();
                  v119 = objc_msgSend(v118, "remappingKey");
                  v120 = obja[v119];
                  obja[v119] = (GCControllerElement *)v117;

                  objc_msgSend(v49, "left");
                  v216 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "right");
                  v121 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "right");
                  v122 = (void *)objc_claimAutoreleasedReturnValue();
                  v123 = objc_msgSend(v122, "remappingKey");
                  v124 = obja[v123];
                  obja[v123] = (GCControllerElement *)v121;

                  objc_msgSend(v49, "right");
                }
              }
              v92 = objc_claimAutoreleasedReturnValue();
              v215 = (void *)v92;
              objc_msgSend(v52, "unmappedSfSymbolsName");
              v125 = objc_claimAutoreleasedReturnValue();
              if (!v125)
                goto LABEL_58;
              v126 = (void *)v125;
              objc_msgSend(v52, "primaryAlias");
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v230, "objectForKeyedSubscript:", v127);
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "unmappedSfSymbolsName");
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              v130 = objc_msgSend(v128, "isEqualToString:", v129);

              if ((v130 & 1) == 0)
              {
LABEL_58:
                objc_msgSend(v49, "unmappedSfSymbolsName");
                v131 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "primaryAlias");
                v132 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v230, "setObject:forKeyedSubscript:", v131, v132);

                objc_msgSend(v49, "up");
                v133 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v133, "unmappedSfSymbolsName");
                v134 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "up");
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                -[GCControllerElement primaryAlias](obja[(int)objc_msgSend(v135, "remappingKey")], "primaryAlias");
                v136 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v230, "setObject:forKeyedSubscript:", v134, v136);

                objc_msgSend(v49, "down");
                v137 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v137, "unmappedSfSymbolsName");
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "down");
                v139 = (void *)objc_claimAutoreleasedReturnValue();
                -[GCControllerElement primaryAlias](obja[(int)objc_msgSend(v139, "remappingKey")], "primaryAlias");
                v140 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v230, "setObject:forKeyedSubscript:", v138, v140);

                objc_msgSend(v49, "left");
                v141 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v141, "unmappedSfSymbolsName");
                v142 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "left");
                v143 = (void *)objc_claimAutoreleasedReturnValue();
                -[GCControllerElement primaryAlias](obja[(int)objc_msgSend(v143, "remappingKey")], "primaryAlias");
                v144 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v230, "setObject:forKeyedSubscript:", v142, v144);

                objc_msgSend(v49, "right");
                v145 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v145, "unmappedSfSymbolsName");
                v146 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "right");
                v147 = (void *)objc_claimAutoreleasedReturnValue();
                -[GCControllerElement primaryAlias](obja[(int)objc_msgSend(v147, "remappingKey")], "primaryAlias");
                v148 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v230, "setObject:forKeyedSubscript:", v146, v148);

              }
              objc_msgSend(v52, "unmappedNameLocalizationKey");
              v149 = objc_claimAutoreleasedReturnValue();
              if (!v149)
                goto LABEL_61;
              v150 = (void *)v149;
              objc_msgSend(v52, "primaryAlias");
              v151 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v229, "objectForKeyedSubscript:", v151);
              v152 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "unmappedNameLocalizationKey");
              v153 = (void *)objc_claimAutoreleasedReturnValue();
              v154 = objc_msgSend(v152, "isEqualToString:", v153);

              if ((v154 & 1) == 0)
              {
LABEL_61:
                objc_msgSend(v49, "unmappedNameLocalizationKey");
                v155 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "primaryAlias");
                v156 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v229, "setObject:forKeyedSubscript:", v155, v156);

                objc_msgSend(v52, "primaryAlias");
                v157 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v229, "objectForKeyedSubscript:", v157);
                v158 = (void *)objc_claimAutoreleasedReturnValue();

                if (v158)
                {
                  objc_msgSend(v49, "up");
                  v159 = (void *)objc_claimAutoreleasedReturnValue();
                  -[GCControllerElement primaryAlias](obja[(int)objc_msgSend(v159, "remappingKey")], "primaryAlias");
                  v160 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v229, "setObject:forKeyedSubscript:", CFSTR("DIRECTION_PAD_UP"), v160);

                  objc_msgSend(v49, "down");
                  v161 = (void *)objc_claimAutoreleasedReturnValue();
                  -[GCControllerElement primaryAlias](obja[(int)objc_msgSend(v161, "remappingKey")], "primaryAlias");
                  v162 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v229, "setObject:forKeyedSubscript:", CFSTR("DIRECTION_PAD_DOWN"), v162);

                  objc_msgSend(v49, "left");
                  v163 = (void *)objc_claimAutoreleasedReturnValue();
                  -[GCControllerElement primaryAlias](obja[(int)objc_msgSend(v163, "remappingKey")], "primaryAlias");
                  v164 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v229, "setObject:forKeyedSubscript:", CFSTR("DIRECTION_PAD_LEFT"), v164);

                  objc_msgSend(v49, "right");
                  v165 = (void *)objc_claimAutoreleasedReturnValue();
                  -[GCControllerElement primaryAlias](obja[(int)objc_msgSend(v165, "remappingKey")], "primaryAlias");
                  v166 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v229, "setObject:forKeyedSubscript:", CFSTR("DIRECTION_PAD_RIGHT"), v166);

                  _GCFConvertStringToLocalizedString();
                  v167 = (void *)objc_claimAutoreleasedReturnValue();
                  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", v167, v158);
                  v168 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v220, "primaryAlias");
                  v169 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v229, "setObject:forKeyedSubscript:", v168, v169);

                  _GCFConvertStringToLocalizedString();
                  v170 = (void *)objc_claimAutoreleasedReturnValue();
                  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", v170, v158);
                  v171 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v219, "primaryAlias");
                  v172 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v229, "setObject:forKeyedSubscript:", v171, v172);

                }
              }
              objc_msgSend(v223, "primaryAlias");
              v173 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "xAxis");
              v174 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v174, "primaryAlias");
              v175 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = v228;
              -[GCPhysicalInputProfile registerPhysicalInputName:toElementAlias:withPhysicalToElementMapping:withElementToPhysicalMapping:](v228, "registerPhysicalInputName:toElementAlias:withPhysicalToElementMapping:withElementToPhysicalMapping:", v173, v175, v225, v224);

              objc_msgSend(v83, "primaryAlias");
              v176 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "yAxis");
              v177 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v177, "primaryAlias");
              v178 = (void *)objc_claimAutoreleasedReturnValue();
              -[GCPhysicalInputProfile registerPhysicalInputName:toElementAlias:withPhysicalToElementMapping:withElementToPhysicalMapping:](v228, "registerPhysicalInputName:toElementAlias:withPhysicalToElementMapping:withElementToPhysicalMapping:", v176, v178, v225, v224);

              objc_msgSend(v222, "primaryAlias");
              v179 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "up");
              v180 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v180, "primaryAlias");
              v181 = (void *)objc_claimAutoreleasedReturnValue();
              -[GCPhysicalInputProfile registerPhysicalInputName:toElementAlias:withPhysicalToElementMapping:withElementToPhysicalMapping:](v228, "registerPhysicalInputName:toElementAlias:withPhysicalToElementMapping:withElementToPhysicalMapping:", v179, v181, v225, v224);

              objc_msgSend(v217, "primaryAlias");
              v182 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "down");
              v183 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v183, "primaryAlias");
              v184 = (void *)objc_claimAutoreleasedReturnValue();
              -[GCPhysicalInputProfile registerPhysicalInputName:toElementAlias:withPhysicalToElementMapping:withElementToPhysicalMapping:](v228, "registerPhysicalInputName:toElementAlias:withPhysicalToElementMapping:withElementToPhysicalMapping:", v182, v184, v225, v224);

              objc_msgSend(v216, "primaryAlias");
              v185 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "left");
              v186 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v186, "primaryAlias");
              v187 = (void *)objc_claimAutoreleasedReturnValue();
              -[GCPhysicalInputProfile registerPhysicalInputName:toElementAlias:withPhysicalToElementMapping:withElementToPhysicalMapping:](v228, "registerPhysicalInputName:toElementAlias:withPhysicalToElementMapping:withElementToPhysicalMapping:", v185, v187, v225, v224);

              objc_msgSend(v215, "primaryAlias");
              v188 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "right");
              v189 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v189, "primaryAlias");
              v190 = (void *)objc_claimAutoreleasedReturnValue();
              -[GCPhysicalInputProfile registerPhysicalInputName:toElementAlias:withPhysicalToElementMapping:withElementToPhysicalMapping:](v228, "registerPhysicalInputName:toElementAlias:withPhysicalToElementMapping:withElementToPhysicalMapping:", v188, v190, v225, v224);

              v4 = v221;
              v47 = v211;
              v46 = v212;
              v50 = v218;
            }

            v14 = v230;
          }
          ++v48;
        }
        while (v46 != v48);
        v46 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v214, "countByEnumeratingWithState:objects:count:", &v236, v249, 16);
      }
      while (v46);
    }

    v234 = 0u;
    v235 = 0u;
    v232 = 0u;
    v233 = 0u;
    -[GCPhysicalInputProfile allElements](v11, "allElements");
    v231 = (id)objc_claimAutoreleasedReturnValue();
    v191 = objc_msgSend(v231, "countByEnumeratingWithState:objects:count:", &v232, v248, 16);
    if (v191)
    {
      v192 = v191;
      v193 = *(_QWORD *)v233;
      do
      {
        for (k = 0; k != v192; ++k)
        {
          if (*(_QWORD *)v233 != v193)
            objc_enumerationMutation(v231);
          v195 = *(void **)(*((_QWORD *)&v232 + 1) + 8 * k);
          if ((objc_msgSend(v195, "remappable") & 1) == 0)
          {
            objc_msgSend(v195, "collection");
            v196 = (void *)objc_claimAutoreleasedReturnValue();
            v197 = objc_msgSend(v196, "remappable");

            if (!v197)
              continue;
          }
          objc_msgSend(v195, "primaryAlias");
          v198 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v229, "objectForKeyedSubscript:", v198);
          v199 = (void *)objc_claimAutoreleasedReturnValue();

          if (v199)
          {
            objc_msgSend(v195, "primaryAlias");
            v200 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v229, "objectForKeyedSubscript:", v200);
            v201 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v195, "setNameLocalizationKey:", v201);

          }
          else
          {
            objc_msgSend(v195, "setNameLocalizationKey:", 0);
          }
          objc_msgSend(v195, "primaryAlias");
          v202 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v202);
          v203 = (void *)objc_claimAutoreleasedReturnValue();

          if (v203)
          {
            objc_msgSend(v195, "primaryAlias");
            v204 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", v204);
            v205 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v195, "setSfSymbolsName:", v205);

          }
          else
          {
            objc_msgSend(v195, "setSfSymbolsName:", 0);
          }
        }
        v192 = objc_msgSend(v231, "countByEnumeratingWithState:objects:count:", &v232, v248, 16);
      }
      while (v192);
    }

    v206 = v11->_elementAliasToPhysicalInputNames;
    v11->_elementAliasToPhysicalInputNames = v224;
    v207 = v224;

    v208 = v11->_physicalInputNameToElementAlias;
    v11->_physicalInputNameToElementAlias = v225;
    v209 = v225;

  }
}

- (void)registerPhysicalInputName:(id)a3 toElementAlias:(id)a4 withPhysicalToElementMapping:(id)a5 withElementToPhysicalMapping:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a6;
  v12 = a5;
  if ((objc_msgSend(v16, "isEqualToString:", v10) & 1) == 0)
    self->_hasRemappedElements = 1;
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v16);

  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = (void *)objc_opt_new();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, v10);

  }
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v16);

}

- (void)applyGestureSettingsToButton:(id)a3 withSettings:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t);
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  uint8_t v46[8];
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  uint8_t buf[4];
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    getGCSettingsLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v8;
      _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_INFO, "applyGestureSettingsToButton: %@", buf, 0xCu);
    }

    getGCSettingsLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v7;
      _os_log_impl(&dword_215181000, v10, OS_LOG_TYPE_INFO, "replayKitSettings: %@", buf, 0xCu);
    }

    objc_msgSend(v8, "setLongPressHandler:", 0);
    objc_msgSend(v8, "setDoublePressHandler:", 0);
    objc_msgSend(v8, "primaryAlias");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("Button Home"));

    if (v12)
    {
      objc_initWeak((id *)buf, self);
      +[UIDevice currentDevice](&off_254DFB288, "currentDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "userInterfaceIdiom") == 1;

      if (v14)
      {
        v51[0] = MEMORY[0x24BDAC760];
        v51[1] = 3221225472;
        v51[2] = __68__GCPhysicalInputProfile_applyGestureSettingsToButton_withSettings___block_invoke;
        v51[3] = &unk_24D2B6778;
        objc_copyWeak(&v52, (id *)buf);
        objc_msgSend(v8, "setLongPressHandler:", v51);
        objc_destroyWeak(&v52);
      }
      v49[0] = MEMORY[0x24BDAC760];
      v49[1] = 3221225472;
      v49[2] = __68__GCPhysicalInputProfile_applyGestureSettingsToButton_withSettings___block_invoke_2;
      v49[3] = &unk_24D2B6778;
      objc_copyWeak(&v50, (id *)buf);
      objc_msgSend(v8, "setSinglePressHandler:", v49);
      objc_destroyWeak(&v50);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      objc_msgSend(v8, "setSinglePressHandler:", 0);
    }
    objc_msgSend(v7, "controllerElementMappingKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "primaryAlias");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", v15);

    if (v17)
    {
      v18 = objc_msgSend(v7, "gestureTypeForGestureMode:", 0);
      v19 = objc_msgSend(v7, "gestureTypeForGestureMode:", 1);
      v20 = objc_msgSend(v7, "gestureTypeForGestureMode:", 2);
      if (v18 != -1)
      {
        getGCSettingsLogger();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v54 = v8;
          _os_log_impl(&dword_215181000, v21, OS_LOG_TYPE_INFO, "Configuring screenshot button: %@", buf, 0xCu);
        }

        objc_initWeak((id *)buf, self);
        v47[0] = MEMORY[0x24BDAC760];
        v47[1] = 3221225472;
        v47[2] = __68__GCPhysicalInputProfile_applyGestureSettingsToButton_withSettings___block_invoke_91;
        v47[3] = &unk_24D2B6778;
        objc_copyWeak(&v48, (id *)buf);
        v22 = (void *)MEMORY[0x2199DEBB0](v47);
        switch(v18)
        {
          case 2:
            getGCSettingsLogger();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v46 = 0;
              _os_log_impl(&dword_215181000, v24, OS_LOG_TYPE_INFO, "Double press for screenshot", v46, 2u);
            }

            objc_msgSend(v8, "setDoublePressHandler:", v22);
            break;
          case 1:
            getGCSettingsLogger();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v46 = 0;
              _os_log_impl(&dword_215181000, v25, OS_LOG_TYPE_INFO, "Long press for screenshot", v46, 2u);
            }

            objc_msgSend(v8, "setLongPressHandler:", v22);
            break;
          case 0:
            getGCSettingsLogger();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v46 = 0;
              _os_log_impl(&dword_215181000, v23, OS_LOG_TYPE_INFO, "Single press for screenshot", v46, 2u);
            }

            objc_msgSend(v8, "setSinglePressHandler:", v22);
            break;
        }

        objc_destroyWeak(&v48);
        objc_destroyWeak((id *)buf);
      }
      if (v19 != -1)
      {
        getGCSettingsLogger();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v54 = v8;
          _os_log_impl(&dword_215181000, v26, OS_LOG_TYPE_INFO, "Configuring video recording button: %@", buf, 0xCu);
        }

        objc_initWeak((id *)buf, self);
        v44[0] = MEMORY[0x24BDAC760];
        v44[1] = 3221225472;
        v44[2] = __68__GCPhysicalInputProfile_applyGestureSettingsToButton_withSettings___block_invoke_93;
        v44[3] = &unk_24D2B6778;
        objc_copyWeak(&v45, (id *)buf);
        v27 = (void *)MEMORY[0x2199DEBB0](v44);
        switch(v19)
        {
          case 2:
            getGCSettingsLogger();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v46 = 0;
              _os_log_impl(&dword_215181000, v29, OS_LOG_TYPE_INFO, "Double press for video", v46, 2u);
            }

            objc_msgSend(v8, "setDoublePressHandler:", v27);
            break;
          case 1:
            getGCSettingsLogger();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v46 = 0;
              _os_log_impl(&dword_215181000, v30, OS_LOG_TYPE_INFO, "Long press for video", v46, 2u);
            }

            objc_msgSend(v8, "setLongPressHandler:", v27);
            break;
          case 0:
            getGCSettingsLogger();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v46 = 0;
              _os_log_impl(&dword_215181000, v28, OS_LOG_TYPE_INFO, "Single press for video", v46, 2u);
            }

            objc_msgSend(v8, "setSinglePressHandler:", v27);
            break;
        }

        objc_destroyWeak(&v45);
        objc_destroyWeak((id *)buf);
      }
      if (v20 != -1)
      {
        getGCSettingsLogger();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v54 = v8;
          _os_log_impl(&dword_215181000, v31, OS_LOG_TYPE_INFO, "Configuring replay capture button: %@", buf, 0xCu);
        }

        currentProcessBundleIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("com.apple.Preferences"));

        if ((v33 & 1) == 0)
        {
          +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "startVideoRecordingBuffering");

        }
        objc_initWeak((id *)buf, self);
        v39 = MEMORY[0x24BDAC760];
        v40 = 3221225472;
        v41 = __68__GCPhysicalInputProfile_applyGestureSettingsToButton_withSettings___block_invoke_96;
        v42 = &unk_24D2B6778;
        objc_copyWeak(&v43, (id *)buf);
        v35 = (void *)MEMORY[0x2199DEBB0](&v39);
        switch(v20)
        {
          case 2:
            getGCSettingsLogger();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v46 = 0;
              _os_log_impl(&dword_215181000, v37, OS_LOG_TYPE_INFO, "Double press for replay capture", v46, 2u);
            }

            objc_msgSend(v8, "setDoublePressHandler:", v35, v39, v40, v41, v42);
            break;
          case 1:
            getGCSettingsLogger();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v46 = 0;
              _os_log_impl(&dword_215181000, v38, OS_LOG_TYPE_INFO, "Long press for replay capture", v46, 2u);
            }

            objc_msgSend(v8, "setLongPressHandler:", v35, v39, v40, v41, v42);
            break;
          case 0:
            getGCSettingsLogger();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v46 = 0;
              _os_log_impl(&dword_215181000, v36, OS_LOG_TYPE_INFO, "Single press for replay capture", v46, 2u);
            }

            objc_msgSend(v8, "setSinglePressHandler:", v35, v39, v40, v41, v42);
            break;
        }

        objc_destroyWeak(&v43);
        objc_destroyWeak((id *)buf);
      }
    }

  }
}

void __68__GCPhysicalInputProfile_applyGestureSettingsToButton_withSettings___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "controller");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_triggerGameIntentLongPress");

}

void __68__GCPhysicalInputProfile_applyGestureSettingsToButton_withSettings___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "controller");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_triggerGameIntentShortPress");

}

void __68__GCPhysicalInputProfile_applyGestureSettingsToButton_withSettings___block_invoke_91(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "onScreenshotTriggeredWithController:", v3);

}

void __68__GCPhysicalInputProfile_applyGestureSettingsToButton_withSettings___block_invoke_93(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "onVideoRecordingToggledWithController:mode:", v3, 0);

}

void __68__GCPhysicalInputProfile_applyGestureSettingsToButton_withSettings___block_invoke_96(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "onVideoRecordingToggledWithController:mode:", v3, 1);

}

- (id)remappedElementForIndex:(int64_t)a3
{
  GCControllerElement *v3;

  if ((unint64_t)a3 <= 0x2E)
    v3 = self->_remappedElements[a3];
  else
    v3 = 0;
  return v3;
}

- (BOOL)hasRemappedElements
{
  return self->_hasRemappedElements;
}

- (NSString)mappedElementAliasForPhysicalInputName:(NSString *)inputName
{
  NSString *v4;
  void *v5;
  void *v6;
  int v7;
  NSString *v8;
  NSString *v9;

  v4 = inputName;
  if (-[GCPhysicalInputProfile hasRemappedElements](self, "hasRemappedElements"))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_elements, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "remappable") & 1) != 0
      || (objc_msgSend(v5, "collection"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "remappable"),
          v6,
          v7))
    {
      -[NSDictionary objectForKeyedSubscript:](self->_physicalInputNameToElementAlias, "objectForKeyedSubscript:", v4);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v4;
    }
    v9 = v8;

  }
  else
  {
    v9 = v4;
  }

  return v9;
}

- (NSSet)mappedPhysicalInputNamesForElementAlias:(NSString *)elementAlias
{
  NSString *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;

  v4 = elementAlias;
  if (-[GCPhysicalInputProfile hasRemappedElements](self, "hasRemappedElements"))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_elements, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "remappable") & 1) != 0
      || (objc_msgSend(v5, "collection"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "remappable"),
          v6,
          v7))
    {
      -[NSDictionary objectForKeyedSubscript:](self->_elementAliasToPhysicalInputNames, "objectForKeyedSubscript:", v4);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = objc_msgSend(objc_alloc((Class)&off_254DEBF30), "initWithObjects:", v4, 0);
    }
    v9 = (void *)v8;

  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc((Class)&off_254DEBEC0), "initWithObjects:", v4, 0);
  }

  return (NSSet *)v9;
}

- (GCControllerElement)objectForKeyedSubscript:(NSString *)key
{
  return (GCControllerElement *)-[NSMutableDictionary objectForKeyedSubscript:](self->_elements, "objectForKeyedSubscript:", key);
}

- (void)updateElementDeviceReferences
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  GCDevice **p_device;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_allElements;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    p_device = &self->_device;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        WeakRetained = objc_loadWeakRetained((id *)p_device);
        objc_msgSend(v9, "setDevice:", WeakRetained, (_QWORD)v11);

        ++v8;
      }
      while (v5 != v8);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (id)_directionPadWithInfo:(id *)a3
{
  GCControllerDirectionPad *v5;
  _BOOL4 var6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t var0;
  void *v15;
  uint64_t var1;
  void *v17;
  uint64_t var2;
  void *v19;
  uint64_t var3;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  GCControllerElement *v30;
  void *v31;
  int v32;
  GCControllerElement *v33;
  void *v34;
  int v35;
  GCControllerElement *v36;
  void *v37;
  int v38;
  GCControllerElement *v39;
  void *v40;
  int v41;
  GCControllerElement *v42;
  void *v43;
  int v44;
  GCControllerElement *v45;
  void *v46;
  int v47;
  GCControllerElement *v48;
  void *v49;
  int v50;
  GCControllerElement *v51;
  int v52;
  id var8;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;

  if (a3->var1)
  {
    v5 = -[GCControllerDirectionPad initWithDigital:descriptionName:]([GCControllerDirectionPad alloc], "initWithDigital:descriptionName:", a3->var2, a3->var0);
    -[GCControllerElement setRemappable:](v5, "setRemappable:", a3->var5);
    -[GCControllerElement setMappableToSystemGestures:](v5, "setMappableToSystemGestures:", a3->var7);
    -[GCControllerElement setBoundToSystemGesture:](v5, "setBoundToSystemGesture:", a3->var6);
    -[GCControllerDirectionPad setUnmappedNameLocalizationKey:](v5, "setUnmappedNameLocalizationKey:", a3->var9);
    -[GCControllerElement setUnmappedSfSymbolsName:](v5, "setUnmappedSfSymbolsName:", a3->var8);
    -[GCControllerElement setAliases:](v5, "setAliases:", a3->var10);
    if (-[GCControllerElement isBoundToSystemGesture](v5, "isBoundToSystemGesture"))
    {
      var6 = a3->var6;
      -[GCControllerDirectionPad up](v5, "up");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBoundToSystemGesture:", var6);

      v8 = a3->var6;
      -[GCControllerDirectionPad down](v5, "down");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBoundToSystemGesture:", v8);

      v10 = a3->var6;
      -[GCControllerDirectionPad left](v5, "left");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBoundToSystemGesture:", v10);

      v12 = a3->var6;
      -[GCControllerDirectionPad right](v5, "right");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBoundToSystemGesture:", v12);

    }
    if (a3->var4 <= 0)
    {
      -[GCControllerDirectionPad up](v5, "up");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setRemappingKey:", 0xFFFFFFFFLL);

      -[GCControllerDirectionPad down](v5, "down");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setRemappingKey:", 0xFFFFFFFFLL);

      -[GCControllerDirectionPad left](v5, "left");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setRemappingKey:", 0xFFFFFFFFLL);

      -[GCControllerDirectionPad right](v5, "right");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setRemappingKey:", 0xFFFFFFFFLL);

      -[GCControllerElement setRemappingKey:](v5, "setRemappingKey:", 0xFFFFFFFFLL);
      -[GCControllerDirectionPad xAxis](v5, "xAxis");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setRemappingKey:", 0xFFFFFFFFLL);

      -[GCControllerDirectionPad yAxis](v5, "yAxis");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setRemappingKey:", 0xFFFFFFFFLL);
    }
    else
    {
      var0 = a3->var3.var0.var0;
      -[GCControllerDirectionPad up](v5, "up");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setRemappingKey:", var0);

      var1 = a3->var3.var1.var1;
      -[GCControllerDirectionPad down](v5, "down");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setRemappingKey:", var1);

      var2 = a3->var3.var1.var2;
      -[GCControllerDirectionPad left](v5, "left");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setRemappingKey:", var2);

      var3 = a3->var3.var1.var3;
      -[GCControllerDirectionPad right](v5, "right");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setRemappingKey:", var3);

      -[GCControllerDirectionPad up](v5, "up");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[GCControllerElement setRemappingKey:](v5, "setRemappingKey:", objc_msgSend(v22, "remappingKey"));

      -[GCControllerDirectionPad up](v5, "up");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "remappingKey");
      -[GCControllerDirectionPad xAxis](v5, "xAxis");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setRemappingKey:", v24);

      -[GCControllerDirectionPad up](v5, "up");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "remappingKey");
      -[GCControllerDirectionPad yAxis](v5, "yAxis");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setRemappingKey:", v27);

      -[GCControllerDirectionPad up](v5, "up");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v27) = objc_msgSend(v29, "remappingKey");

      if ((v27 & 0x80000000) == 0)
      {
        -[GCControllerDirectionPad up](v5, "up");
        v30 = (GCControllerElement *)objc_claimAutoreleasedReturnValue();
        -[GCControllerDirectionPad up](v5, "up");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "remappingKey");
        v33 = self->_remappedElements[v32];
        self->_remappedElements[v32] = v30;

      }
      -[GCControllerDirectionPad down](v5, "down");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "remappingKey");

      if ((v35 & 0x80000000) == 0)
      {
        -[GCControllerDirectionPad down](v5, "down");
        v36 = (GCControllerElement *)objc_claimAutoreleasedReturnValue();
        -[GCControllerDirectionPad down](v5, "down");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "remappingKey");
        v39 = self->_remappedElements[v38];
        self->_remappedElements[v38] = v36;

      }
      -[GCControllerDirectionPad left](v5, "left");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "remappingKey");

      if ((v41 & 0x80000000) == 0)
      {
        -[GCControllerDirectionPad left](v5, "left");
        v42 = (GCControllerElement *)objc_claimAutoreleasedReturnValue();
        -[GCControllerDirectionPad left](v5, "left");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "remappingKey");
        v45 = self->_remappedElements[v44];
        self->_remappedElements[v44] = v42;

      }
      -[GCControllerDirectionPad right](v5, "right");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "remappingKey");

      if ((v47 & 0x80000000) == 0)
      {
        -[GCControllerDirectionPad right](v5, "right");
        v48 = (GCControllerElement *)objc_claimAutoreleasedReturnValue();
        -[GCControllerDirectionPad right](v5, "right");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "remappingKey");
        v51 = self->_remappedElements[v50];
        self->_remappedElements[v50] = v48;

      }
      v52 = objc_msgSend(a3->var8, "isEqualToString:", CFSTR("dpad"));
      var8 = a3->var8;
      if (v52)
      {
        objc_msgSend(var8, "stringByAppendingString:", CFSTR(".up.fill"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[GCControllerDirectionPad up](v5, "up");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setUnmappedSfSymbolsName:", v54);

        objc_msgSend(a3->var8, "stringByAppendingString:", CFSTR(".down.fill"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[GCControllerDirectionPad down](v5, "down");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setUnmappedSfSymbolsName:", v56);

        objc_msgSend(a3->var8, "stringByAppendingString:", CFSTR(".left.fill"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[GCControllerDirectionPad left](v5, "left");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setUnmappedSfSymbolsName:", v58);

        objc_msgSend(a3->var8, "stringByAppendingString:", CFSTR(".right.fill"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[GCControllerDirectionPad right](v5, "right");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setUnmappedSfSymbolsName:", v60);
      }
      else
      {
        if ((objc_msgSend(var8, "isEqualToString:", CFSTR("l.joystick")) & 1) == 0
          && !objc_msgSend(a3->var8, "isEqualToString:", CFSTR("r.joystick")))
        {
          goto LABEL_22;
        }
        objc_msgSend(a3->var8, "stringByAppendingString:", CFSTR(".tilt.up"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[GCControllerDirectionPad up](v5, "up");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "setUnmappedSfSymbolsName:", v67);

        objc_msgSend(a3->var8, "stringByAppendingString:", CFSTR(".tilt.down"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[GCControllerDirectionPad down](v5, "down");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "setUnmappedSfSymbolsName:", v69);

        objc_msgSend(a3->var8, "stringByAppendingString:", CFSTR(".tilt.left"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[GCControllerDirectionPad left](v5, "left");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setUnmappedSfSymbolsName:", v71);

        objc_msgSend(a3->var8, "stringByAppendingString:", CFSTR(".tilt.right"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[GCControllerDirectionPad right](v5, "right");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setUnmappedSfSymbolsName:", v60);
      }

    }
LABEL_22:
    -[GCPhysicalInputProfile _registerTopLevelDirectionPad:](self, "_registerTopLevelDirectionPad:", v5);
    goto LABEL_23;
  }
  v5 = 0;
LABEL_23:
  __destructor_8_s0_s48_s56_s64(&a3->var0);
  return v5;
}

- (id)_directionPadWithDescription:(id)a3
{
  id v4;
  id v6[9];
  uint64_t v7;
  char v8;
  char v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  char v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  objc_msgSend(v4, "name");
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = 1;
  v9 = objc_msgSend(v4, "isDigital");
  v10 = objc_msgSend(v4, "sourceUpExtendedEventFieldIndex");
  v11 = objc_msgSend(v4, "sourceDownExtendedEventFieldIndex");
  v12 = objc_msgSend(v4, "sourceLeftExtendedEventFieldIndex");
  v13 = objc_msgSend(v4, "sourceRightExtendedEventFieldIndex");
  v14 = 1;
  v15 = objc_msgSend(v4, "isRemappable");
  v16 = objc_msgSend(v4, "isBoundToSystemGesture");
  v17 = objc_msgSend(v4, "isMappableToSystemGestures");
  objc_msgSend(v4, "symbolName");
  v18 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "nameLocalizationKey");
  v19 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "additionalAliases");
  v20 = objc_claimAutoreleasedReturnValue();

  __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v6, (uint64_t)&v7);
  if (self)
  {
    -[GCPhysicalInputProfile _directionPadWithInfo:](self, "_directionPadWithInfo:", v6);
    self = (GCPhysicalInputProfile *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __destructor_8_s0_s48_s56_s64(v6);
  }
  __destructor_8_s0_s48_s56_s64((id *)&v7);

  return self;
}

- (id)_cursorWithInfo:(id *)a3
{
  GCDeviceCursor *v5;

  if (a3->var1)
  {
    v5 = -[GCDeviceCursor initWithDigital:descriptionName:]([GCDeviceCursor alloc], "initWithDigital:descriptionName:", a3->var2, a3->var0);
    -[GCPhysicalInputProfile _registerTopLevelDirectionPad:](self, "_registerTopLevelDirectionPad:", v5);
  }
  else
  {
    v5 = 0;
  }
  __destructor_8_s0_s48_s56_s64(&a3->var0);
  return v5;
}

- (id)_buttonWithInfo:(id *)a3
{
  _GCControllerGestureAwareButtonInput *v5;
  __objc2_class **v6;
  double v7;

  if (a3->var1)
  {
    if (a3->var7)
    {
      v5 = -[_GCControllerGestureAwareButtonInput initWithDescriptionName:]([_GCControllerGestureAwareButtonInput alloc], "initWithDescriptionName:", a3->var0);
      -[NSMutableSet addObject:](self->_allGestureAwareButtons, "addObject:", v5);

    }
    else
    {
      v6 = &classRef_GCDualSenseAdaptiveTrigger;
      if (a3->var3.var0.var3 != 1)
        v6 = &classRef_GCControllerButtonInput;
      v5 = (_GCControllerGestureAwareButtonInput *)objc_msgSend(objc_alloc(*v6), "initWithDescriptionName:", a3->var0);
    }
    -[GCControllerButtonInput setNonAnalog:](v5, "setNonAnalog:", a3->var2);
    -[GCControllerButtonInput setTouchedAndValueDistinct:](v5, "setTouchedAndValueDistinct:", a3->var3.var0.var1);
    LODWORD(v7) = a3->var3.var1.var2;
    -[GCControllerButtonInput setDeadzone:](v5, "setDeadzone:", v7);
    -[GCControllerElement setRemappable:](v5, "setRemappable:", a3->var5);
    -[GCControllerElement setUnmappedNameLocalizationKey:](v5, "setUnmappedNameLocalizationKey:", a3->var9);
    -[GCControllerElement setUnmappedSfSymbolsName:](v5, "setUnmappedSfSymbolsName:", a3->var8);
    -[GCControllerElement setMappableToSystemGestures:](v5, "setMappableToSystemGestures:", a3->var7);
    -[GCControllerElement setBoundToSystemGesture:](v5, "setBoundToSystemGesture:", a3->var6);
    -[GCControllerElement setAliases:](v5, "setAliases:", a3->var10);
    if (a3->var4 <= 0)
    {
      -[GCControllerElement setRemappingKey:](v5, "setRemappingKey:", 0xFFFFFFFFLL);
    }
    else
    {
      -[GCControllerElement setRemappingKey:](v5, "setRemappingKey:", a3->var3.var0.var0);
      if ((-[GCControllerElement remappingKey](v5, "remappingKey") & 0x80000000) == 0)
        objc_storeStrong((id *)&self->_remappedElements[-[GCControllerElement remappingKey](v5, "remappingKey")], v5);
    }
    -[GCPhysicalInputProfile _registerTopLevelButton:](self, "_registerTopLevelButton:", v5);
  }
  else
  {
    v5 = 0;
  }
  __destructor_8_s0_s48_s56_s64(&a3->var0);
  return v5;
}

- (id)_buttonWithDescription:(id)a3
{
  id v4;
  unint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v15[9];
  uint64_t v16;
  char v17;
  char v18;
  int v19;
  char v20;
  int v21;
  uint64_t v22;
  int v23;
  char v24;
  char v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  v5 = objc_msgSend(v4, "sourceExtendedEventFieldIndex");
  objc_msgSend(v4, "name");
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = 1;
  v18 = objc_msgSend(v4, "isDigital");
  if (v5 > 0x7FFFFFFFFFFFFFFELL)
    v6 = -1;
  else
    v6 = v5;
  v19 = v6;
  v20 = objc_msgSend(v4, "supportsTouch");
  objc_msgSend(v4, "sourcePressedThreshold");
  v21 = v7;
  v22 = 0;
  v23 = 1;
  v24 = objc_msgSend(v4, "isRemappable");
  v25 = objc_msgSend(v4, "isBoundToSystemGesture");
  v26 = objc_msgSend(v4, "isMappableToSystemGestures");
  objc_msgSend(v4, "symbolName");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v27;
  v27 = (void *)v8;

  objc_msgSend(v4, "nameLocalizationKey");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v28;
  v28 = (void *)v10;

  objc_msgSend(v4, "additionalAliases");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v29;
  v29 = (void *)v12;

  __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v15, (uint64_t)&v16);
  if (self)
  {
    -[GCPhysicalInputProfile _buttonWithInfo:](self, "_buttonWithInfo:", v15);
    self = (GCPhysicalInputProfile *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __destructor_8_s0_s48_s56_s64(v15);
  }
  __destructor_8_s0_s48_s56_s64((id *)&v16);

  return self;
}

- (id)_keyboardButtonWithInfo:(id *)a3
{
  GCKeyboardButtonElement *v5;
  double v6;

  v5 = -[GCControllerButtonInput initWithDescriptionName:]([GCKeyboardButtonElement alloc], "initWithDescriptionName:", a3->var0);
  -[GCControllerButtonInput setNonAnalog:](v5, "setNonAnalog:", a3->var2);
  -[GCControllerButtonInput setTouchedAndValueDistinct:](v5, "setTouchedAndValueDistinct:", a3->var3.var0.var1);
  LODWORD(v6) = a3->var3.var1.var2;
  -[GCControllerButtonInput setDeadzone:](v5, "setDeadzone:", v6);
  -[GCControllerElement setRemappable:](v5, "setRemappable:", a3->var5);
  -[GCControllerElement setUnmappedNameLocalizationKey:](v5, "setUnmappedNameLocalizationKey:", a3->var9);
  -[GCControllerElement setUnmappedSfSymbolsName:](v5, "setUnmappedSfSymbolsName:", a3->var8);
  -[GCControllerElement setMappableToSystemGestures:](v5, "setMappableToSystemGestures:", a3->var7);
  -[GCControllerElement setBoundToSystemGesture:](v5, "setBoundToSystemGesture:", a3->var6);
  -[GCControllerElement setAliases:](v5, "setAliases:", a3->var10);
  if (a3->var4 <= 0)
  {
    -[GCControllerElement setRemappingKey:](v5, "setRemappingKey:", 0xFFFFFFFFLL);
  }
  else
  {
    -[GCControllerElement setRemappingKey:](v5, "setRemappingKey:", a3->var3.var0.var0);
    if ((-[GCControllerElement remappingKey](v5, "remappingKey") & 0x80000000) == 0)
      objc_storeStrong((id *)&self->_remappedElements[-[GCControllerElement remappingKey](v5, "remappingKey")], v5);
  }
  -[GCPhysicalInputProfile _registerTopLevelButton:](self, "_registerTopLevelButton:", v5);
  __destructor_8_s0_s48_s56_s64(&a3->var0);
  return v5;
}

- (id)_touchpadWithInfo:(id *)a3
{
  GCControllerTouchpad *v5;

  if (a3->var1)
  {
    v5 = -[GCControllerTouchpad initWithDescriptionName:]([GCControllerTouchpad alloc], "initWithDescriptionName:", a3->var0);
    -[GCControllerElement setRemappable:](v5, "setRemappable:", a3->var5);
    -[GCControllerElement setMappableToSystemGestures:](v5, "setMappableToSystemGestures:", a3->var7);
    -[GCControllerElement setBoundToSystemGesture:](v5, "setBoundToSystemGesture:", a3->var6);
    -[GCControllerElement setUnmappedNameLocalizationKey:](v5, "setUnmappedNameLocalizationKey:", a3->var9);
    -[GCControllerElement setUnmappedSfSymbolsName:](v5, "setUnmappedSfSymbolsName:", a3->var8);
    -[GCControllerElement setAliases:](v5, "setAliases:", a3->var10);
    -[GCPhysicalInputProfile _registerTopLevelTouchpad:](self, "_registerTopLevelTouchpad:", v5);
  }
  else
  {
    v5 = 0;
  }
  __destructor_8_s0_s48_s56_s64(&a3->var0);
  return v5;
}

- (void)_registerTopLevelButton:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_allButtons, "containsObject:") & 1) == 0)
  {
    -[NSMutableSet addObject:](self->__topLevelElements, "addObject:", v4);
    -[NSMutableSet addObject:](self->__topLevelButtons, "addObject:", v4);
    -[GCPhysicalInputProfile _registerButton:](self, "_registerButton:", v4);
  }

}

- (void)_registerTopLevelDirectionPad:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_allDpads, "containsObject:") & 1) == 0)
  {
    -[NSMutableSet addObject:](self->__topLevelElements, "addObject:", v4);
    -[NSMutableSet addObject:](self->__topLevelDirectionPads, "addObject:", v4);
    -[GCPhysicalInputProfile _registerDirectionPad:](self, "_registerDirectionPad:", v4);
  }

}

- (void)_registerTopLevelTouchpad:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->__topLevelElements, "containsObject:") & 1) == 0)
  {
    -[NSMutableSet addObject:](self->__topLevelElements, "addObject:", v4);
    -[NSMutableSet addObject:](self->__topLevelTouchpads, "addObject:", v4);
    -[GCPhysicalInputProfile _registerTouchpad:](self, "_registerTouchpad:", v4);
  }

}

- (void)_registerDirectionPad:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "aliases", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_elements, "setObject:forKeyedSubscript:", v4, v10);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dpads, "setObject:forKeyedSubscript:", v4, v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[NSMutableSet addObject:](self->_allElements, "addObject:", v4);
  -[NSMutableSet addObject:](self->_allDpads, "addObject:", v4);
  objc_msgSend(v4, "xAxis");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCPhysicalInputProfile _registerAxis:](self, "_registerAxis:", v11);

  objc_msgSend(v4, "yAxis");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCPhysicalInputProfile _registerAxis:](self, "_registerAxis:", v12);

}

- (void)_registerAxis:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "aliases", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_elements, "setObject:forKeyedSubscript:", v4, v10);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_axes, "setObject:forKeyedSubscript:", v4, v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[NSMutableSet addObject:](self->_allElements, "addObject:", v4);
  -[NSMutableSet addObject:](self->_allAxes, "addObject:", v4);
  objc_msgSend(v4, "positive");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCPhysicalInputProfile _registerButton:](self, "_registerButton:", v11);

  objc_msgSend(v4, "negative");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCPhysicalInputProfile _registerButton:](self, "_registerButton:", v12);

}

- (void)_registerButton:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "aliases", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_elements, "setObject:forKeyedSubscript:", v4, v10);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_buttons, "setObject:forKeyedSubscript:", v4, v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[NSMutableSet addObject:](self->_allElements, "addObject:", v4);
  -[NSMutableSet addObject:](self->_allButtons, "addObject:", v4);

}

- (void)_registerTouchpad:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "aliases", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_elements, "setObject:forKeyedSubscript:", v4, v10);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_touchpads, "setObject:forKeyedSubscript:", v4, v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[NSMutableSet addObject:](self->_allElements, "addObject:", v4);
  -[NSMutableSet addObject:](self->_allTouchpads, "addObject:", v4);
  objc_msgSend(v4, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCPhysicalInputProfile _registerButton:](self, "_registerButton:", v11);

  objc_msgSend(v4, "touchSurface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCPhysicalInputProfile _registerDirectionPad:](self, "_registerDirectionPad:", v12);

}

- (void)_triggerValueChangedHandlerForElement:(id)a3 queue:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[GCPhysicalInputProfile valueDidChangeHandler](self, "valueDidChangeHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__GCPhysicalInputProfile__triggerValueChangedHandlerForElement_queue___block_invoke;
    block[3] = &unk_24D2B67A0;
    v12 = v8;
    block[4] = self;
    v11 = v6;
    dispatch_async(v7, block);

  }
}

uint64_t __70__GCPhysicalInputProfile__triggerValueChangedHandlerForElement_queue___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_triggerValueChangedHandlerForElements:(id)a3 queue:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD block[4];
  id v10;
  GCPhysicalInputProfile *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[GCPhysicalInputProfile valueDidChangeHandler](self, "valueDidChangeHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__GCPhysicalInputProfile__triggerValueChangedHandlerForElements_queue___block_invoke;
    block[3] = &unk_24D2B5008;
    v10 = v6;
    v11 = self;
    v12 = v8;
    dispatch_async(v7, block);

  }
}

void __71__GCPhysicalInputProfile__triggerValueChangedHandlerForElements_queue___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_receivedEventWithTimestamp:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;
  id WeakRetained;
  char v8;
  id v9;

  +[NSDate date](&off_254DF6DA0, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = v5;

  kdebug_trace();
  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_device);
    objc_msgSend(v9, "_becomeCurrent");

  }
  -[GCPhysicalInputProfile setLastEventTimestamp:](self, "setLastEventTimestamp:", v6);
}

- (void)_receivedEvent
{
  -[GCPhysicalInputProfile _receivedEventWithTimestamp:](self, "_receivedEventWithTimestamp:", mach_absolute_time());
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GCPhysicalInputProfile allElements](self, "allElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[GCPhysicalInputProfile allButtons](self, "allButtons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  -[GCPhysicalInputProfile allAxes](self, "allAxes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  -[GCPhysicalInputProfile allDpads](self, "allDpads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("%lu elements (%lu buttons, %lu axes, %lu dpads)"), v4, v6, v8, objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSString)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCPhysicalInputProfile description](self, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (GCPhysicalInputProfile)capture
{
  GCObjectPool *WeakRetained;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  float v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  int v25;
  void *v27;
  char v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  int v61;
  void *v62;
  int v63;
  int v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  double v69;
  char v70;
  void *v71;
  double v72;
  int v73;
  uint64_t k;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  int v83;
  int v84;
  void *v85;
  int v86;
  int v87;
  uint64_t v88;
  void *v89;
  float v90;
  float v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  double v99;
  void *v100;
  _BOOL4 v101;
  char v102;
  int v103;
  double v104;
  double v105;
  GCObjectPool *v107;
  void *v108;
  NSMutableSet *v109;
  uint64_t v110;
  uint64_t v111;
  GCPhysicalInputProfile *v112;
  NSMutableSet *obj;
  id obja;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _QWORD v132[5];
  GCObjectPool *v133;
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  uint64_t v137;

  v137 = *MEMORY[0x24BDAC8D0];
  if (self->pooled)
    WeakRetained = (GCObjectPool *)objc_loadWeakRetained((id *)&self->weakPool);
  else
    WeakRetained = self->pool;
  v107 = WeakRetained;
  if (WeakRetained)
  {
    v132[0] = MEMORY[0x24BDAC760];
    v132[1] = 3221225472;
    v132[2] = __33__GCPhysicalInputProfile_capture__block_invoke;
    v132[3] = &unk_24D2B67C8;
    v132[4] = self;
    v133 = WeakRetained;
    -[GCObjectPool takeObjectOrCreateWith:](v133, "takeObjectOrCreateWith:", v132, v107);
    v119 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v119 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:", self->_identifier, 0);
  }
  +[NSMutableArray array](&off_254DEBB20, "array");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCPhysicalInputProfile handlerQueue](self, "handlerQueue");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v112 = self;
  v4 = self->__topLevelButtons;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v128, v136, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v129;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v129 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * i);
        objc_msgSend(v119, "buttons");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "primaryAlias");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "sfSymbolsName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setSfSymbolsName:", v13);

        objc_msgSend(v9, "localizedName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setLocalizedName:", v14);

        objc_msgSend(v9, "value");
        v16 = v15;
        objc_msgSend(v9, "value");
        if (v17 <= 0.0)
          v18 = objc_msgSend(v9, "isTouched");
        else
          v18 = 1;
        v19 = v12;
        v20 = v117;
        v21 = v118;
        v25 = v18 ^ 1;
        if (v16 <= 0.0)
          v25 = 1;
        if (v16 != 0.0 && v25 != 0)
          -[GCPhysicalInputProfile capture].cold.2((uint64_t)v21, v22, v23);
        v27 = v21;
        *(float *)&v24 = v16;
        v28 = objc_msgSend(v19, "_setValue:queue:", v20, v24);
        v29 = objc_msgSend(v19, "_setTouched:queue:", v18, v20);
        if ((v28 & 1) != 0 || v29)
          objc_msgSend(v27, "addObject:", v19);

      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v128, v136, 16);
    }
    while (v6);
  }

  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  obj = v112->__topLevelDirectionPads;
  v30 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v124, v135, 16);
  if (v30)
  {
    v31 = v30;
    v115 = *(_QWORD *)v125;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v125 != v115)
          objc_enumerationMutation(obj);
        v33 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * j);
        objc_msgSend(v119, "dpads");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "primaryAlias");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKeyedSubscript:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v33, "sfSymbolsName");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setSfSymbolsName:", v37);

        objc_msgSend(v33, "localizedName");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setLocalizedName:", v38);

        objc_msgSend(v33, "up");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "sfSymbolsName");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          objc_msgSend(v33, "up");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "sfSymbolsName");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "up");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setSfSymbolsName:", v42);

        }
        objc_msgSend(v33, "down");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "sfSymbolsName");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (v45)
        {
          objc_msgSend(v33, "down");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "sfSymbolsName");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "down");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setSfSymbolsName:", v47);

        }
        objc_msgSend(v33, "left");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "sfSymbolsName");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (v50)
        {
          objc_msgSend(v33, "left");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "sfSymbolsName");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "left");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setSfSymbolsName:", v52);

        }
        objc_msgSend(v33, "right");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "sfSymbolsName");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (v55)
        {
          objc_msgSend(v33, "right");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "sfSymbolsName");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "right");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "setSfSymbolsName:", v57);

        }
        objc_msgSend(v33, "xAxis");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "value");
        v61 = v60;
        objc_msgSend(v33, "yAxis");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "value");
        v64 = v63;
        v65 = v36;
        v66 = v117;
        v67 = v118;
        objc_msgSend(v65, "xAxis");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v69) = v61;
        v70 = objc_msgSend(v68, "_setValue:queue:", v66, v69);

        objc_msgSend(v65, "yAxis");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v72) = v64;
        v73 = objc_msgSend(v71, "_setValue:queue:", v66, v72);

        if ((v70 & 1) != 0 || v73)
          objc_msgSend(v67, "addObject:", v65);

      }
      v31 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v124, v135, 16);
    }
    while (v31);
  }

  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v109 = v112->__topLevelTouchpads;
  v111 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v109, "countByEnumeratingWithState:objects:count:", &v120, v134, 16);
  if (v111)
  {
    v110 = *(_QWORD *)v121;
    do
    {
      for (k = 0; k != v111; ++k)
      {
        if (*(_QWORD *)v121 != v110)
          objc_enumerationMutation(v109);
        v75 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * k);
        objc_msgSend(v119, "touchpads");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "primaryAlias");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "objectForKeyedSubscript:", v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v75, "sfSymbolsName");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "setSfSymbolsName:", v79);

        objc_msgSend(v75, "localizedName");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "setLocalizedName:", v80);

        objc_msgSend(v75, "touchSurface");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "xAxis");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "value");
        v84 = v83;
        objc_msgSend(v75, "touchSurface");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "yAxis");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "value");
        v87 = v86;
        v88 = objc_msgSend(v75, "touchState");
        objc_msgSend(v75, "button");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "value");
        v91 = v90;
        v92 = v78;
        v93 = v117;
        v94 = v118;
        objc_msgSend(v92, "button");
        v95 = (id)objc_claimAutoreleasedReturnValue();
        v96 = v93;
        v100 = v96;
        v101 = v91 <= 0.0;
        if (!v88)
          v101 = 1;
        if (v91 != 0.0 && v101)
          -[GCPhysicalInputProfile capture].cold.1((uint64_t)v96, v97, v98);
        obja = v82;
        *(float *)&v99 = v91;
        v102 = objc_msgSend(v95, "_setValue:queue:", v96, v99);
        v103 = objc_msgSend(v95, "_setTouched:queue:", v88 != 0, v100);
        if ((v102 & 1) != 0 || v103)
          objc_msgSend(0, "addObject:", v95);

        LODWORD(v104) = v84;
        LODWORD(v105) = v87;
        if (objc_msgSend(v92, "setDigitizerX:digitizerY:touchDown:queue:", v88 != 0, v100, v104, v105))
          objc_msgSend(v94, "addObject:", v92);

      }
      v111 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v109, "countByEnumeratingWithState:objects:count:", &v120, v134, 16);
    }
    while (v111);
  }

  return (GCPhysicalInputProfile *)v119;
}

id __33__GCPhysicalInputProfile_capture__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:andPool:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 616), *(_QWORD *)(a1 + 40));
}

- (void)setStateFromPhysicalInput:(GCPhysicalInputProfile *)physicalInput
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableDictionary *buttons;
  void *v15;
  void *v16;
  int v17;
  int v18;
  id v19;
  id v20;
  double v21;
  uint64_t j;
  void *v23;
  NSMutableDictionary *dpads;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  int v31;
  int v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  double v37;
  char v38;
  void *v39;
  double v40;
  int v41;
  uint64_t k;
  void *v43;
  NSMutableDictionary *touchpads;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  int v49;
  void *v50;
  int v51;
  int v52;
  uint64_t v53;
  void *v54;
  float v55;
  float v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  _BOOL4 v65;
  void *v67;
  char v68;
  int v69;
  double v70;
  double v71;
  GCPhysicalInputProfile *v72;
  NSMutableSet *v73;
  uint64_t v74;
  uint64_t v75;
  NSMutableSet *obj;
  id obja;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  GCPhysicalInputProfile *v82;
  void *v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v72 = physicalInput;
  -[GCPhysicalInputProfile device](self, "device");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = (void *)v4,
        -[GCPhysicalInputProfile controller](self, "controller"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isSnapshot"),
        v6,
        v5,
        v7))
  {
    +[NSMutableArray array](&off_254DEBB20, "array");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile handlerQueue](self, "handlerQueue");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v8 = v72->__topLevelButtons;
    v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v93, v99, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v94;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v94 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
          buttons = self->_buttons;
          objc_msgSend(v13, "primaryAlias");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](buttons, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v13, "value");
            v18 = v17;
            v19 = v16;
            v20 = v84;
            LODWORD(v21) = v18;
            if (objc_msgSend(v19, "_setValue:queue:", v83, v21))
              objc_msgSend(v20, "addObject:", v19);

          }
        }
        v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v93, v99, 16);
      }
      while (v10);
    }

    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    obj = v72->__topLevelDirectionPads;
    v80 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
    v82 = self;
    if (v80)
    {
      v78 = *(_QWORD *)v90;
      do
      {
        for (j = 0; j != v80; ++j)
        {
          if (*(_QWORD *)v90 != v78)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * j);
          dpads = self->_dpads;
          objc_msgSend(v23, "primaryAlias");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](dpads, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            objc_msgSend(v23, "xAxis");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "value");
            v29 = v28;
            objc_msgSend(v23, "yAxis");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "value");
            v32 = v31;
            v33 = v26;
            v34 = v83;
            v35 = v84;
            objc_msgSend(v33, "xAxis");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v37) = v29;
            v38 = objc_msgSend(v36, "_setValue:queue:", v34, v37);

            objc_msgSend(v33, "yAxis");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v40) = v32;
            v41 = objc_msgSend(v39, "_setValue:queue:", v34, v40);

            if ((v38 & 1) != 0 || v41)
              objc_msgSend(v35, "addObject:", v33);

            self = v82;
          }

        }
        v80 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
      }
      while (v80);
    }

    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v73 = v72->__topLevelTouchpads;
    v75 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
    if (v75)
    {
      v74 = *(_QWORD *)v86;
      do
      {
        for (k = 0; k != v75; ++k)
        {
          if (*(_QWORD *)v86 != v74)
            objc_enumerationMutation(v73);
          v43 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * k);
          touchpads = self->_touchpads;
          objc_msgSend(v43, "primaryAlias");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](touchpads, "objectForKeyedSubscript:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if (v46)
          {
            objc_msgSend(v43, "touchSurface");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "xAxis");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "value");
            v49 = v48;
            objc_msgSend(v43, "touchSurface");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "yAxis");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "value");
            v52 = v51;
            v53 = objc_msgSend(v43, "touchState");
            objc_msgSend(v43, "button");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "value");
            v56 = v55;
            v57 = v46;
            v58 = v83;
            v59 = v84;
            objc_msgSend(v57, "button");
            v60 = (id)objc_claimAutoreleasedReturnValue();
            v61 = v58;
            v65 = v56 <= 0.0;
            if (!v53)
              v65 = 1;
            if (v56 != 0.0 && v65)
              -[GCPhysicalInputProfile setStateFromPhysicalInput:].cold.1((uint64_t)v61, v62, v63);
            v67 = v61;
            obja = v46;
            *(float *)&v64 = v56;
            v68 = objc_msgSend(v60, "_setValue:queue:", v61, v64);
            v69 = objc_msgSend(v60, "_setTouched:queue:", v53 != 0, v67);
            if ((v68 & 1) != 0 || v69)
              objc_msgSend(0, "addObject:", v60);

            LODWORD(v70) = v49;
            LODWORD(v71) = v52;
            self = v82;
            if (objc_msgSend(v57, "setDigitizerX:digitizerY:touchDown:queue:", v53 != 0, v67, v70, v71))
              objc_msgSend(v59, "addObject:", v57);

            v46 = obja;
          }

        }
        v75 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
      }
      while (v75);
    }

  }
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 616, 1);
}

- (unint64_t)glyphFlags
{
  return self->_glyphFlags;
}

- (void)setGlyphFlags:(unint64_t)a3
{
  self->_glyphFlags = a3;
}

- (NSTimeInterval)lastEventTimestamp
{
  return self->_lastEventTimestamp;
}

- (void)setLastEventTimestamp:(double)a3
{
  self->_lastEventTimestamp = a3;
}

- (void)setHasRemappedElements:(BOOL)a3
{
  self->_hasRemappedElements = a3;
}

- (void)valueDidChangeHandler
{
  return self->_valueDidChangeHandler;
}

- (void)setValueDidChangeHandler:(void *)valueDidChangeHandler
{
  objc_setProperty_nonatomic_copy(self, a2, valueDidChangeHandler, 640);
}

- (NSDictionary)elements
{
  return &self->_elements->super;
}

- (NSDictionary)buttons
{
  return &self->_buttons->super;
}

- (NSDictionary)axes
{
  return &self->_axes->super;
}

- (NSDictionary)dpads
{
  return &self->_dpads->super;
}

- (NSDictionary)touchpads
{
  return &self->_touchpads->super;
}

- (NSSet)allElements
{
  return &self->_allElements->super;
}

- (NSSet)allButtons
{
  return &self->_allButtons->super;
}

- (NSSet)allAxes
{
  return &self->_allAxes->super;
}

- (NSSet)allDpads
{
  return &self->_allDpads->super;
}

- (NSSet)allTouchpads
{
  return &self->_allTouchpads->super;
}

- (GCSProfile)settingsProfile
{
  return self->_settingsProfile;
}

- (NSMutableSet)_topLevelElements
{
  return self->__topLevelElements;
}

- (NSMutableSet)_topLevelButtons
{
  return self->__topLevelButtons;
}

- (NSMutableSet)_topLevelDirectionPads
{
  return self->__topLevelDirectionPads;
}

- (NSMutableSet)_topLevelTouchpads
{
  return self->__topLevelTouchpads;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_settingsProfile, 0);
  objc_storeStrong(&self->_valueDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_syntheticDeviceElementValueChangedHandler, 0);
  objc_storeStrong((id *)&self->_syntheticDeviceHandlerQueue, 0);
  objc_storeStrong((id *)&self->_systemGestureComponent, 0);
  objc_storeStrong((id *)&self->_elementAliasToPhysicalInputNames, 0);
  objc_storeStrong((id *)&self->_physicalInputNameToElementAlias, 0);
  objc_storeStrong((id *)&self->_allGestureAwareButtons, 0);
  for (i = 552; i != 176; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong(&self->_valueDidChangedHandler, 0);
  objc_storeStrong((id *)&self->_touchpads, 0);
  objc_storeStrong((id *)&self->_dpads, 0);
  objc_storeStrong((id *)&self->_axes, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->__topLevelTouchpads, 0);
  objc_storeStrong((id *)&self->__topLevelDirectionPads, 0);
  objc_storeStrong((id *)&self->__topLevelButtons, 0);
  objc_storeStrong((id *)&self->__topLevelElements, 0);
  objc_storeStrong((id *)&self->_allTouchpads, 0);
  objc_storeStrong((id *)&self->_allDpads, 0);
  objc_storeStrong((id *)&self->_allAxes, 0);
  objc_storeStrong((id *)&self->_allButtons, 0);
  objc_storeStrong((id *)&self->_allElements, 0);
  objc_storeStrong((id *)&self->_motion, 0);
  objc_storeStrong(&self->_gamepadEventObservation, 0);
  objc_destroyWeak((id *)&self->_device);
  objc_destroyWeak((id *)&self->weakPool);
  objc_storeStrong((id *)&self->pool, 0);
}

- (OS_dispatch_queue)syntheticDeviceHandlerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 592, 1);
}

- (void)setSyntheticDeviceHandlerQueue:(id)a3
{
  objc_setProperty(self, a2, 592, a3, 1, 0);
}

- (id)syntheticDeviceElementValueChangedHandler
{
  return objc_getProperty(self, a2, 600, 1);
}

- (void)setSyntheticDeviceElementValueChangedHandler:(id)a3
{
  id v5;

  v5 = (id)MEMORY[0x2199DEBB0](a3);
  objc_setProperty(self, a2, 600, v5, 1, 1);

}

- (void)applySystemGestureComponent:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      if (objc_msgSend(v6, "isSystemGestureObserver"))
      {
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            v8 = 138412290;
            v9 = v6;
            _os_log_impl(&dword_215181000, v7, OS_LOG_TYPE_INFO, "applySystemGestureComponent: %@", (uint8_t *)&v8, 0xCu);
          }

        }
        objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("systemGesturesState"), 5, kGCSystemGestureContext);
        objc_storeStrong((id *)&self->_systemGestureComponent, a3);
      }

    }
  }

}

- (void)updateSystemGesturesState:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint8_t v41[128];
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v4;
      _os_log_impl(&dword_215181000, v26, OS_LOG_TYPE_INFO, "updateSystemGesturesState - %@", buf, 0xCu);
    }

  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = self->_allGestureAwareButtons;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v9++), "setInputDisabledBySystem:", 0);
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "disabledSystemGestureInputNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v32;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v14);
        -[GCPhysicalInputProfile elements](self, "elements");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v17, "setInputDisabledBySystem:", 1);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v12);
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v4, "enabledSystemGestureInputNames", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v22);
        -[GCPhysicalInputProfile elements](self, "elements");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v25, "setInputDisabledBySystem:", 0);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v20);
  }

}

- (void)setGamepadEventSource:(id)a3
{
  id gamepadEventObservation;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  gamepadEventObservation = self->_gamepadEventObservation;
  self->_gamepadEventObservation = 0;
  v5 = a3;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__GCPhysicalInputProfile_PubSub__setGamepadEventSource___block_invoke;
  v8[3] = &__block_descriptor_40_e27_v16__0____GCGamepadEvent__8lu32l8;
  v8[4] = self;
  objc_msgSend(v5, "observeGamepadEvents:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self->_gamepadEventObservation;
  self->_gamepadEventObservation = v6;

}

void __56__GCPhysicalInputProfile_PubSub__setGamepadEventSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  float v14;
  float v15;
  void *v16;
  double v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void (**v28)(_QWORD);
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD block[4];
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "timestamp");
  objc_msgSend(*(id *)(a1 + 32), "_receivedEventWithTimestamp:", v4);
  objc_msgSend(*(id *)(a1 + 32), "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v31 = v4;
    +[NSMutableSet set](&off_254DEBF30, "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handlerQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 47; ++i)
    {
      if (i != 23 && objc_msgSend(v3, "hasValidValueForElement:", i))
      {
        objc_msgSend(*(id *)(a1 + 32), "remappedElementForIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v3, "floatValueForElement:", i);
          objc_msgSend(v9, "_setPendingValue:");
          objc_msgSend(v9, "collection");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            objc_msgSend(v9, "collection");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v11);

          }
          else
          {
            objc_msgSend(v6, "addObject:", v9);
          }
        }

      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "objectForKeyedSubscript:", CFSTR("Button Menu"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = objc_msgSend(v3, "hasValidValueForElement:", 23);

      if (v13)
      {
        objc_msgSend(v3, "floatValueForElement:", 23);
        v15 = v14;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "objectForKeyedSubscript:", CFSTR("Button Menu"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "objectForKeyedSubscript:", CFSTR("Button Menu"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v17 = v15;
        objc_msgSend(v16, "_setPendingValue:", v17);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "objectForKeyedSubscript:", CFSTR("Button Menu"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v18);

        if (v15 > 0.0 && (objc_msgSend(v12, "isPressed") & 1) == 0)
        {
          objc_msgSend(v5, "handlerQueue");
          v19 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __56__GCPhysicalInputProfile_PubSub__setGamepadEventSource___block_invoke_2;
          block[3] = &unk_24D2B2B20;
          v41 = v5;
          dispatch_async(v19, block);

        }
      }
      else
      {
        v12 = 0;
      }
    }

    +[NSMutableSet set](&off_254DEBF30, "set");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v21 = v6;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v37 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          if (objc_msgSend(v26, "_commitPendingValueOnQueue:", v7))
            objc_msgSend(v20, "addObject:", v26);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v23);
    }

    if (objc_msgSend(v20, "count"))
      objc_msgSend(*(id *)(a1 + 32), "_triggerValueChangedHandlerForElements:queue:", v20, v7);
    objc_msgSend(*(id *)(a1 + 32), "syntheticDeviceElementValueChangedHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __56__GCPhysicalInputProfile_PubSub__setGamepadEventSource___block_invoke_374;
      v32[3] = &unk_24D2B53D0;
      v33 = v20;
      v34 = v27;
      v35 = v31;
      v28 = (void (**)(_QWORD))MEMORY[0x2199DEBB0](v32);
      objc_msgSend(*(id *)(a1 + 32), "syntheticDeviceHandlerQueue");
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
        dispatch_async(v29, v28);
      else
        v28[2](v28);

    }
  }

}

void __56__GCPhysicalInputProfile_PubSub__setGamepadEventSource___block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  NSObject *v4;

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __56__GCPhysicalInputProfile_PubSub__setGamepadEventSource___block_invoke_2_cold_1(a1);

  }
  objc_msgSend(*(id *)(a1 + 32), "__deprecated_controllerPausedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "__deprecated_controllerPausedHandler");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 32));

  }
}

void __56__GCPhysicalInputProfile_PubSub__setGamepadEventSource___block_invoke_374(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)thumbstickUserIntentHandler
{
  return 0;
}

- (void)settingsProfile:(void *)a1 differsFrom:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "elementKey");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_32(&dword_215181000, v2, v3, "%@ dpad axis mappings are different!", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_26();
}

- (void)settingsProfile:(NSObject *)a3 differsFrom:.cold.2(void *a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "elementKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mappingKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "mappingKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  v13 = 2112;
  v14 = v8;
  _os_log_debug_impl(&dword_215181000, a3, OS_LOG_TYPE_DEBUG, "%@ was mapped to %@, is now mapped to %@. They're different!", (uint8_t *)&v9, 0x20u);

}

- (void)capture
{
  OUTLINED_FUNCTION_1_29("setButtonValueAndTouched", "GCControllerButtonInput_Private.h", a3, "(value > 0 && touched) || value == 0");
}

- (void)setStateFromPhysicalInput:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_1_29("setButtonValueAndTouched", "GCControllerButtonInput_Private.h", a3, "(value > 0 && touched) || value == 0");
}

void __56__GCPhysicalInputProfile_PubSub__setGamepadEventSource___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "debugName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_32(&dword_215181000, v2, v3, "%@ pause event", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_26();
}

@end
