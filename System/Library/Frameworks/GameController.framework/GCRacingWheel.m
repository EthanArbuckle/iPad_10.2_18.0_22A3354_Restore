@implementation GCRacingWheel

- (GCRacingWheel)initWithIdentifier:(id)a3 components:(id)a4
{
  id v4;
  GCRacingWheel *v5;
  NSArray *components;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GCRacingWheel;
  v4 = a4;
  v5 = -[GCRacingWheel init](&v8, sel_init);
  objc_storeStrong((id *)&v5->_handlerQueue, MEMORY[0x24BDAC9B8]);
  components = v5->_components;
  v5->_components = (NSArray *)MEMORY[0x24BDBD1A8];

  -[GCRacingWheel setComponents:](v5, v4);
  return v5;
}

- (void)setComponents:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  char v21;
  _QWORD *v22;
  char isKindOfClass;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "differenceFromArray:", a1[3]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "differenceFromArray:", a1[3]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removals");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "object");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setDevice:", 0);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v11);
    }
    v25 = v9;

    v26 = v4;
    objc_setProperty(a1, sel_setComponents_, 24, v4, 1, 1);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v15 = v6;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "object");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setDevice:", a1);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v20, "setDispatchQueue:", a1[1]);
          v21 = objc_msgSend(v20, "conformsToProtocol:", &unk_254DD0298);
          v22 = a1 + 4;
          if ((v21 & 1) != 0
            || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v22 = a1 + 5, (isKindOfClass & 1) != 0))
          {
            *v22 = v20;
          }

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v17);
    }

    if (!a1[5])
    {
      unk_254DEC4F8(&off_254DEC660, "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", sel_setComponents_, a1, CFSTR("GCRacingWheel.m"), 92, CFSTR("Missing required <GCDevicePhysicalInput> component."));

    }
    v4 = v26;
  }

}

- (GCRacingWheel)initWithComponents:(id)a3
{
  id v4;
  void *v5;
  GCRacingWheel *v6;

  v4 = a3;
  +[NSUUID UUID](&off_254DEEE48, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GCRacingWheel initWithIdentifier:components:](self, "initWithIdentifier:components:", v5, v4);

  return v6;
}

- (GCRacingWheel)init
{
  -[GCRacingWheel doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)components
{
  if (a1)
  {
    objc_getProperty(a1, sel_components, 24, 1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_componentWithProtocol:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[GCRacingWheel components](a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v8, "conformsToProtocol:", v3, (_QWORD)v10) & 1) != 0)
          {
            v5 = v8;
            goto LABEL_12;
          }
        }
        v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)acquireDeviceWithError:(NSError *)error
{
  return 0;
}

- (BOOL)isAcquired
{
  return 0;
}

- (void)setHandlerQueue:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_handlerQueue, a3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[GCRacingWheel components](self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "setDispatchQueue:", v5, (_QWORD)v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (NSString)vendorName
{
  void *v2;
  void *v3;

  -[GCRacingWheel _componentWithProtocol:](self, &unk_254DD0298);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vendorName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)productCategory
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  -[GCRacingWheel _componentWithProtocol:](self, &unk_254DD0298);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "productCategory");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("Racing Wheel");
  v5 = v3;

  return v5;
}

- (GCPhysicalInputProfile)physicalInputProfile
{
  id v2;

  +[NSException exceptionWithName:reason:userInfo:](&off_254DEE1B8, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("-physicalInputProfile is not supported on GCRacingWheel.  Use -wheelInput instead."), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (GCRacingWheelInput)wheelInput
{
  void *v2;
  void *v3;

  -[_GCDevicePhysicalInputComponent defaultPhysicalInput]((id *)&self->_input->super.isa, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputBase facade]((uint64_t)v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GCRacingWheelInput *)v3;
}

- (GCRacingWheel)capture
{
  void *v2;
  void *v3;
  _BYTE *v4;

  -[GCRacingWheel components](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gc_arrayByTransformingElementsWithOptions:usingBlock:", 1, &__block_literal_global_40);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (_BYTE *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithComponents:", v3);
  v4[48] = 1;

  return (GCRacingWheel *)v4;
}

id __24__GCRacingWheel_capture__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "capture");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (NSSet)connectedRacingWheels
{
  return +[NSSet set](&off_254DEBEC0, "set");
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (BOOL)isSnapshot
{
  return self->_isSnapshot;
}

- (NSCopying)identifier
{
  return (NSCopying *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
}

@end
