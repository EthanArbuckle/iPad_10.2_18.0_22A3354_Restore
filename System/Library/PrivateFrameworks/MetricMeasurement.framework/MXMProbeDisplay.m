@implementation MXMProbeDisplay

+ (MXMDisplayDescriptor)mainDescriptor
{
  void *v2;
  id WeakRetained;
  _QWORD v5[5];
  uint64_t v6;
  id *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = (id *)&v6;
  v8 = 0x3042000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  objc_msgSend(a1, "descriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__MXMProbeDisplay_mainDescriptor__block_invoke;
  v5[3] = &unk_24D193220;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  WeakRetained = objc_loadWeakRetained(v7 + 5);
  _Block_object_dispose(&v6, 8);
  objc_destroyWeak(&v11);
  return (MXMDisplayDescriptor *)WeakRetained;
}

void __33__MXMProbeDisplay_mainDescriptor__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id obj;

  obj = a2;
  if (objc_msgSend(obj, "main"))
  {
    objc_storeWeak((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
    *a4 = 1;
  }

}

+ (NSArray)descriptors
{
  return (NSArray *)objc_msgSend((id)objc_opt_class(), "_allDescriptors");
}

+ (id)probe
{
  return objc_alloc_init((Class)a1);
}

+ (id)probeWithDescriptor:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v4);

  return v5;
}

- (MXMProbeDisplay)init
{
  MXMProbeDisplay *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "mainDescriptor");
  v3 = (MXMProbeDisplay *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "mainDescriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[MXMProbeDisplay initWithDescriptor:](self, "initWithDescriptor:", v4);

    v3 = self;
  }

  return v3;
}

- (MXMProbeDisplay)initWithDescriptor:(id)a3
{
  id v5;
  MXMProbeDisplay *v6;
  MXMDisplayProbe_iphoneOS_Internal *v7;
  void *v8;
  uint64_t v9;
  MXMDisplayProbePlatform *impl;
  MXMDisplayProbePlatform *v11;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MXMProbeDisplay;
  v6 = -[MXMProbe init](&v16, sel_init);
  if (v6)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MXMDisplayProbe.m"), 120, CFSTR("Cannot initialize a screen probe with a nil target!"));

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MXMDisplayProbe.m"), 121, CFSTR("Cannot initialize a screen probe with a non-MXMProbeScreenDescriptor instance target!"));

    }
    v7 = [MXMDisplayProbe_iphoneOS_Internal alloc];
    -[MXMProbe updateQueue](v6, "updateQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MXMDisplayProbe_iphoneOS_Internal initPrivateWithDescriptor:queue:](v7, "initPrivateWithDescriptor:queue:", v5, v8);
    impl = v6->_impl;
    v6->_impl = (MXMDisplayProbePlatform *)v9;

    v11 = v6->_impl;
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MXMDisplayProbe.m"), 133, CFSTR("Failed to initialize platform screen probe."));

      v11 = v6->_impl;
    }
    -[MXMDisplayProbePlatform setDelegate:](v11, "setDelegate:", v6);
  }

  return v6;
}

- (void)_beginUpdates
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MXMProbeDisplay;
  -[MXMProbe _beginUpdates](&v3, sel__beginUpdates);
  -[MXMDisplayProbePlatform _start](self->_impl, "_start");
}

- (void)_stopUpdates
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MXMProbeDisplay;
  -[MXMProbe _stopUpdates](&v3, sel__stopUpdates);
  -[MXMDisplayProbePlatform _stop](self->_impl, "_stop");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
