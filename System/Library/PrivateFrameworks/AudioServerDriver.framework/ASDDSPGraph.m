@implementation ASDDSPGraph

- (ASDDSPGraph)init
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x24BDBCE88];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[ASDDSPGraph init]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Do not call %@"), v4);

  return 0;
}

- (ASDDSPGraph)initWithDSPGraph:(shared_ptr<DSPGraph::Graph>)a3
{
  uint64_t *ptr;
  ASDDSPGraph *v5;
  void *v7;
  objc_super v8;

  ptr = (uint64_t *)a3.__ptr_;
  v8.receiver = self;
  v8.super_class = (Class)ASDDSPGraph;
  v5 = -[ASDDSPGraph init](&v8, sel_init, a3.__ptr_, a3.__cntrl_);
  if (v5)
  {
    if (!*ptr)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("ASDDSPGraph.mm"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("graph"));

    }
    std::shared_ptr<DSPGraph::Graph>::operator=[abi:ne180100](&v5->_graph.__ptr_, ptr);
  }
  return v5;
}

- (BOOL)setVariableSliceDuration:(int64_t)a3 forSampleRate:(int64_t)a4
{
  char v4;
  uint64_t (***v5)();
  uint64_t v6;
  _QWORD v8[7];
  uint64_t (**v9)();
  char v10;
  uint64_t (***v11)();
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__ASDDSPGraph_setVariableSliceDuration_forSampleRate___block_invoke;
  v8[3] = &unk_24DBCA018;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  v9 = &off_24DBC9E00;
  v10 = 0;
  v11 = &v9;
  v4 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v8);
  v5 = v11;
  if (v11 == &v9)
  {
    v6 = 4;
    v5 = &v9;
    goto LABEL_5;
  }
  if (v11)
  {
    v6 = 5;
LABEL_5:
    (*v5)[v6]();
  }
  return v4;
}

uint64_t __54__ASDDSPGraph_setVariableSliceDuration_forSampleRate___block_invoke(uint64_t a1)
{
  void *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;
  std::__shared_weak_count *v5;

  v1 = *(void **)(a1 + 32);
  if (v1)
    objc_msgSend(v1, "graph");
  else
    v5 = 0;
  DSPGraph::Graph::setSliceDuration();
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v3 = __ldaxr(p_shared_owners);
    while (__stlxr(v3 - 1, p_shared_owners));
    if (!v3)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return 1;
}

- (int64_t)sliceDurationInSamples
{
  unsigned int v2;
  uint64_t (***v3)();
  uint64_t v4;
  _QWORD v6[5];
  uint64_t (**v7)();
  int v8;
  uint64_t (***v9)();
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__ASDDSPGraph_sliceDurationInSamples__block_invoke;
  v6[3] = &unk_24DBCA040;
  v6[4] = self;
  v7 = &off_24DBC9E48;
  v8 = 0;
  v9 = &v7;
  v2 = ASDDSP::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(v6);
  v3 = v9;
  if (v9 == &v7)
  {
    v4 = 4;
    v3 = &v7;
    goto LABEL_5;
  }
  if (v9)
  {
    v4 = 5;
LABEL_5:
    (*v3)[v4]();
  }
  return v2;
}

uint64_t __37__ASDDSPGraph_sliceDurationInSamples__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t v6;
  std::__shared_weak_count *v7;

  v1 = *(void **)(a1 + 32);
  if (!v1)
    return MEMORY[0x2B0];
  objc_msgSend(v1, "graph");
  v2 = *(unsigned int *)(v6 + 688);
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v7->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return v2;
}

- (BOOL)configured
{
  char v2;
  uint64_t (***v3)();
  uint64_t v4;
  _QWORD v6[5];
  uint64_t (**v7)();
  char v8;
  uint64_t (***v9)();
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __25__ASDDSPGraph_configured__block_invoke;
  v6[3] = &unk_24DBCA068;
  v6[4] = self;
  v7 = &off_24DBC9E00;
  v8 = 0;
  v9 = &v7;
  v2 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v6);
  v3 = v9;
  if (v9 == &v7)
  {
    v4 = 4;
    v3 = &v7;
    goto LABEL_5;
  }
  if (v9)
  {
    v4 = 5;
LABEL_5:
    (*v3)[v4]();
  }
  return v2;
}

BOOL __25__ASDDSPGraph_configured__block_invoke(uint64_t a1)
{
  void *v1;
  int v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t v6;
  std::__shared_weak_count *v7;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    objc_msgSend(v1, "graph");
    v2 = *(unsigned __int8 *)(v6 + 761);
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v4 = __ldaxr(p_shared_owners);
      while (__stlxr(v4 - 1, p_shared_owners));
      if (!v4)
      {
        ((void (*)())v7->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
  else
  {
    v2 = MEMORY[0x2F9];
  }
  return v2 != 0;
}

- (BOOL)initialized
{
  char v2;
  uint64_t (***v3)();
  uint64_t v4;
  _QWORD v6[5];
  uint64_t (**v7)();
  char v8;
  uint64_t (***v9)();
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __26__ASDDSPGraph_initialized__block_invoke;
  v6[3] = &unk_24DBCA068;
  v6[4] = self;
  v7 = &off_24DBC9E00;
  v8 = 0;
  v9 = &v7;
  v2 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v6);
  v3 = v9;
  if (v9 == &v7)
  {
    v4 = 4;
    v3 = &v7;
    goto LABEL_5;
  }
  if (v9)
  {
    v4 = 5;
LABEL_5:
    (*v3)[v4]();
  }
  return v2;
}

BOOL __26__ASDDSPGraph_initialized__block_invoke(uint64_t a1)
{
  void *v1;
  int v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t v6;
  std::__shared_weak_count *v7;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    objc_msgSend(v1, "graph");
    v2 = *(unsigned __int8 *)(v6 + 762);
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v4 = __ldaxr(p_shared_owners);
      while (__stlxr(v4 - 1, p_shared_owners));
      if (!v4)
      {
        ((void (*)())v7->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
  else
  {
    v2 = MEMORY[0x2FA];
  }
  return v2 != 0;
}

- (BOOL)configure
{
  char v2;
  uint64_t (***v3)();
  uint64_t v4;
  _QWORD v6[5];
  uint64_t (**v7)();
  char v8;
  uint64_t (***v9)();
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __24__ASDDSPGraph_configure__block_invoke;
  v6[3] = &unk_24DBCA068;
  v6[4] = self;
  v7 = &off_24DBC9E00;
  v8 = 0;
  v9 = &v7;
  v2 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v6);
  v3 = v9;
  if (v9 == &v7)
  {
    v4 = 4;
    v3 = &v7;
    goto LABEL_5;
  }
  if (v9)
  {
    v4 = 5;
LABEL_5:
    (*v3)[v4]();
  }
  return v2;
}

uint64_t __24__ASDDSPGraph_configure__block_invoke(uint64_t a1)
{
  void *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  void *v6;
  std::__shared_weak_count *v7;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    objc_msgSend(v1, "graph");
    v1 = v6;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  DSPGraph::Graph::configure((DSPGraph::Graph *)v1);
  v2 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return 1;
}

- (BOOL)unconfigure
{
  char v2;
  uint64_t (***v3)();
  uint64_t v4;
  _QWORD v6[5];
  uint64_t (**v7)();
  char v8;
  uint64_t (***v9)();
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __26__ASDDSPGraph_unconfigure__block_invoke;
  v6[3] = &unk_24DBCA068;
  v6[4] = self;
  v7 = &off_24DBC9E00;
  v8 = 0;
  v9 = &v7;
  v2 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v6);
  v3 = v9;
  if (v9 == &v7)
  {
    v4 = 4;
    v3 = &v7;
    goto LABEL_5;
  }
  if (v9)
  {
    v4 = 5;
LABEL_5:
    (*v3)[v4]();
  }
  return v2;
}

uint64_t __26__ASDDSPGraph_unconfigure__block_invoke(uint64_t a1)
{
  void *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  void *v6;
  std::__shared_weak_count *v7;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    objc_msgSend(v1, "graph");
    v1 = v6;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  DSPGraph::Graph::unconfigure((DSPGraph::Graph *)v1);
  v2 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return 1;
}

- (BOOL)initialize
{
  char v2;
  uint64_t (***v3)();
  uint64_t v4;
  _QWORD v6[5];
  uint64_t (**v7)();
  char v8;
  uint64_t (***v9)();
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __25__ASDDSPGraph_initialize__block_invoke;
  v6[3] = &unk_24DBCA068;
  v6[4] = self;
  v7 = &off_24DBC9E00;
  v8 = 0;
  v9 = &v7;
  v2 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v6);
  v3 = v9;
  if (v9 == &v7)
  {
    v4 = 4;
    v3 = &v7;
    goto LABEL_5;
  }
  if (v9)
  {
    v4 = 5;
LABEL_5:
    (*v3)[v4]();
  }
  return v2;
}

uint64_t __25__ASDDSPGraph_initialize__block_invoke(uint64_t a1)
{
  void *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  void *v6;
  std::__shared_weak_count *v7;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    objc_msgSend(v1, "graph");
    v1 = v6;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  DSPGraph::Graph::initialize((DSPGraph::Graph *)v1);
  v2 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return 1;
}

- (BOOL)uninitialize
{
  char v2;
  uint64_t (***v3)();
  uint64_t v4;
  _QWORD v6[5];
  uint64_t (**v7)();
  char v8;
  uint64_t (***v9)();
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __27__ASDDSPGraph_uninitialize__block_invoke;
  v6[3] = &unk_24DBCA068;
  v6[4] = self;
  v7 = &off_24DBC9E00;
  v8 = 0;
  v9 = &v7;
  v2 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v6);
  v3 = v9;
  if (v9 == &v7)
  {
    v4 = 4;
    v3 = &v7;
    goto LABEL_5;
  }
  if (v9)
  {
    v4 = 5;
LABEL_5:
    (*v3)[v4]();
  }
  return v2;
}

uint64_t __27__ASDDSPGraph_uninitialize__block_invoke(uint64_t a1)
{
  void *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  void *v6;
  std::__shared_weak_count *v7;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    objc_msgSend(v1, "graph");
    v1 = v6;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  DSPGraph::Graph::uninitialize((DSPGraph::Graph *)v1);
  v2 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return 1;
}

- (BOOL)reset
{
  char v2;
  uint64_t (***v3)();
  uint64_t v4;
  _QWORD v6[5];
  uint64_t (**v7)();
  char v8;
  uint64_t (***v9)();
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __20__ASDDSPGraph_reset__block_invoke;
  v6[3] = &unk_24DBCA068;
  v6[4] = self;
  v7 = &off_24DBC9E00;
  v8 = 0;
  v9 = &v7;
  v2 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v6);
  v3 = v9;
  if (v9 == &v7)
  {
    v4 = 4;
    v3 = &v7;
    goto LABEL_5;
  }
  if (v9)
  {
    v4 = 5;
LABEL_5:
    (*v3)[v4]();
  }
  return v2;
}

uint64_t __20__ASDDSPGraph_reset__block_invoke(uint64_t a1)
{
  void *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  void *v6;
  std::__shared_weak_count *v7;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    objc_msgSend(v1, "graph");
    v1 = v6;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  DSPGraph::Graph::reset((DSPGraph::Graph *)v1);
  v2 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return 1;
}

- (BOOL)setAUStrip:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t (***v7)();
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[5];
  id v19;
  uint64_t (**v20)();
  char v21;
  uint64_t (***v22)();
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __26__ASDDSPGraph_setAUStrip___block_invoke;
    v18[3] = &unk_24DBCA090;
    v18[4] = self;
    v19 = v4;
    v20 = &off_24DBC9E00;
    v21 = 0;
    v22 = &v20;
    v6 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v18);
    v7 = v22;
    if (v22 == &v20)
    {
      v8 = 4;
      v7 = &v20;
    }
    else
    {
      if (!v22)
      {
LABEL_10:

        goto LABEL_11;
      }
      v8 = 5;
    }
    (*v7)[v8]();
    goto LABEL_10;
  }
  v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v9)
    -[ASDDSPGraph setAUStrip:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
  v6 = 0;
LABEL_11:

  return v6;
}

BOOL __26__ASDDSPGraph_setAUStrip___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  void *v8;
  std::__shared_weak_count *v9;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "graph");
    v2 = v8;
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  v3 = DSPGraph::Graph::setAUStrip((DSPGraph::Graph *)v2, *(const __CFDictionary **)(a1 + 40));
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return v3 == 0;
}

- (BOOL)setPropertyStrip:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t (***v7)();
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[5];
  id v19;
  uint64_t (**v20)();
  char v21;
  uint64_t (***v22)();
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __32__ASDDSPGraph_setPropertyStrip___block_invoke;
    v18[3] = &unk_24DBCA090;
    v18[4] = self;
    v19 = v4;
    v20 = &off_24DBC9E00;
    v21 = 0;
    v22 = &v20;
    v6 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v18);
    v7 = v22;
    if (v22 == &v20)
    {
      v8 = 4;
      v7 = &v20;
    }
    else
    {
      if (!v22)
      {
LABEL_10:

        goto LABEL_11;
      }
      v8 = 5;
    }
    (*v7)[v8]();
    goto LABEL_10;
  }
  v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v9)
    -[ASDDSPGraph setPropertyStrip:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
  v6 = 0;
LABEL_11:

  return v6;
}

uint64_t __32__ASDDSPGraph_setPropertyStrip___block_invoke(uint64_t a1)
{
  void *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  void *v7;
  std::__shared_weak_count *v8;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "graph");
    v2 = v7;
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  DSPGraph::Graph::setPropertyStrip((DSPGraph::Graph *)v2, *(const __CFDictionary **)(a1 + 40));
  v3 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  return 1;
}

- (BOOL)getParameter:(float *)a3 forID:(unsigned int)a4
{
  char v4;
  uint64_t (***v5)();
  uint64_t v6;
  _QWORD v8[6];
  unsigned int v9;
  uint64_t (**v10)();
  char v11;
  uint64_t (***v12)();
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __34__ASDDSPGraph_getParameter_forID___block_invoke;
  v8[3] = &unk_24DBCA0B8;
  v8[4] = self;
  v8[5] = a3;
  v9 = a4;
  v10 = &off_24DBC9E00;
  v11 = 0;
  v12 = &v10;
  v4 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v8);
  v5 = v12;
  if (v12 == &v10)
  {
    v6 = 4;
    v5 = &v10;
    goto LABEL_5;
  }
  if (v12)
  {
    v6 = 5;
LABEL_5:
    (*v5)[v6]();
  }
  return v4;
}

uint64_t __34__ASDDSPGraph_getParameter_forID___block_invoke(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t v6;
  std::__shared_weak_count *v7;

  objc_msgSend(*(id *)(a1 + 32), "graph");
  **(float **)(a1 + 40) = (*(float (**)(uint64_t, _QWORD))(*(_QWORD *)v6 + 48))(v6, *(unsigned int *)(a1 + 48));
  v2 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return 1;
}

- (BOOL)hasParameter:(unsigned int)a3
{
  char hasParameter;
  unint64_t *p_shared_owners;
  unint64_t v5;
  DSPGraph::Graph *v7;
  std::__shared_weak_count *v8;

  -[ASDDSPGraph graph](self, "graph");
  hasParameter = DSPGraph::Graph::hasParameter(v7);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  return hasParameter;
}

- (BOOL)setParameter:(float)a3 forID:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v7;
  signed int v8;
  BOOL v9;
  uint64_t v10;
  signed int v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v15;
  void *v16;
  char v17;
  double v18;
  uint64_t v19;
  id v21;
  _QWORD v22[6];
  float v23;
  int v24;
  _BYTE buf[12];
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v4 = *(_QWORD *)&a4;
  v30 = *MEMORY[0x24BDAC8D0];
  LODWORD(v7) = HIBYTE(a4);
  if ((a4 - 0x20000000) >> 24 >= 0x5F)
    v7 = 32;
  else
    v7 = v7;
  v8 = (a4 << 8) & 0xFF000000;
  v9 = v8 == 2130706432 || v8 < 520093697;
  LODWORD(v10) = a4 << 8 >> 24;
  if (v9)
    v10 = 32;
  else
    v10 = v10;
  v11 = (a4 << 16) & 0xFF000000;
  v12 = v11 == 2130706432 || v11 < 520093697;
  LODWORD(v13) = BYTE1(a4);
  if (v12)
    v13 = 32;
  else
    v13 = v13;
  if (a4 << 24 == 2130706432 || (int)(a4 << 24) < 520093697)
    v15 = 32;
  else
    v15 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c%c%c%c"), v7, v10, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ASDDSPGraph hasParameter:](self, "hasParameter:", v4))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __34__ASDDSPGraph_setParameter_forID___block_invoke;
    v22[3] = &unk_24DBCA0E0;
    v22[4] = v16;
    v22[5] = self;
    v23 = a3;
    v24 = v4;
    *(_QWORD *)buf = &off_24DBC9E00;
    buf[8] = 0;
    v29 = COERCE_DOUBLE(buf);
    v17 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v22);
    v18 = v29;
    if (*(_BYTE **)&v29 == buf)
    {
      v19 = 4;
      v18 = COERCE_DOUBLE(buf);
      goto LABEL_30;
    }
    if (v29 != 0.0)
    {
      v19 = 5;
LABEL_30:
      (*(void (**)(void))(**(_QWORD **)&v18 + 8 * v19))();
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDDSPGraph name](self, "name");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = objc_msgSend(v21, "UTF8String");
      v26 = 2080;
      v27 = objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
      v28 = 2048;
      v29 = a3;
      _os_log_error_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "DSP graph: %s has no graph level parameter: %s, failed to set value: %f", buf, 0x20u);

    }
    v17 = 0;
  }

  return v17;
}

uint64_t __34__ASDDSPGraph_setParameter_forID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  double v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  _BYTE v10[22];
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v2 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
    objc_msgSend(*(id *)(a1 + 40), "name");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = objc_msgSend(v3, "UTF8String");
    v5 = *(float *)(a1 + 48);
    *(_DWORD *)v10 = 136315650;
    *(_QWORD *)&v10[4] = v2;
    *(_WORD *)&v10[12] = 2080;
    *(_QWORD *)&v10[14] = v4;
    v11 = 2048;
    v12 = v5;
    _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Setting dsp graph level parameter %s on graph: %s to %f", v10, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "graph");
  (*(void (**)(_QWORD, _QWORD, float))(**(_QWORD **)v10 + 40))(*(_QWORD *)v10, *(unsigned int *)(a1 + 52), *(float *)(a1 + 48));
  v6 = *(std::__shared_weak_count **)&v10[8];
  if (*(_QWORD *)&v10[8])
  {
    v7 = (unint64_t *)(*(_QWORD *)&v10[8] + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return 1;
}

- (BOOL)getPropertySize:(unsigned int *)a3 isWritable:(BOOL *)a4 forID:(unsigned int)a5
{
  BOOL result;
  uint64_t v8;
  uint64_t v10;
  char v11;
  char v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;

  result = 0;
  if (a3 && a4)
  {
    v8 = *(_QWORD *)&a5;
    -[ASDDSPGraph graph](self, "graph");
    v10 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v16 + 64))(v16, v8);
    v12 = v11;
    v13 = v17;
    if (v17)
    {
      p_shared_owners = (unint64_t *)&v17->__shared_owners_;
      do
        v15 = __ldaxr(p_shared_owners);
      while (__stlxr(v15 - 1, p_shared_owners));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    if (v12)
    {
      *a3 = v10;
      *a4 = BYTE4(v10);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)getProperty:(void *)a3 withSize:(unsigned int *)a4 forID:(unsigned int)a5
{
  char v5;
  uint64_t (***v6)();
  uint64_t v7;
  _QWORD v9[7];
  unsigned int v10;
  uint64_t (**v11)();
  char v12;
  uint64_t (***v13)();
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __42__ASDDSPGraph_getProperty_withSize_forID___block_invoke;
  v9[3] = &unk_24DBCA108;
  v9[5] = a4;
  v9[6] = a3;
  v9[4] = self;
  v10 = a5;
  v11 = &off_24DBC9E00;
  v12 = 0;
  v13 = &v11;
  v5 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v9);
  v6 = v13;
  if (v13 == &v11)
  {
    v7 = 4;
    v6 = &v11;
    goto LABEL_5;
  }
  if (v13)
  {
    v7 = 5;
LABEL_5:
    (*v6)[v7]();
  }
  return v5;
}

uint64_t __42__ASDDSPGraph_getProperty_withSize_forID___block_invoke(uint64_t a1)
{
  unint64_t *p_shared_owners;
  unint64_t v3;
  uint64_t v5;
  std::__shared_weak_count *v6;

  if (!*(_QWORD *)(a1 + 40) || !*(_QWORD *)(a1 + 48))
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "graph");
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(*(_QWORD *)v5 + 72))(v5, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v3 = __ldaxr(p_shared_owners);
    while (__stlxr(v3 - 1, p_shared_owners));
    if (!v3)
    {
      ((void (*)())v6->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return 1;
}

- (BOOL)setProperty:(const void *)a3 withSize:(unsigned int)a4 forID:(unsigned int)a5
{
  char v5;
  uint64_t (***v6)();
  uint64_t v7;
  _QWORD v9[6];
  unsigned int v10;
  unsigned int v11;
  uint64_t (**v12)();
  char v13;
  uint64_t (***v14)();
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __42__ASDDSPGraph_setProperty_withSize_forID___block_invoke;
  v9[3] = &unk_24DBCA018;
  v10 = a5;
  v11 = a4;
  v9[4] = self;
  v9[5] = a3;
  v12 = &off_24DBC9E00;
  v13 = 0;
  v14 = &v12;
  v5 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v9);
  v6 = v14;
  if (v14 == &v12)
  {
    v7 = 4;
    v6 = &v12;
    goto LABEL_5;
  }
  if (v14)
  {
    v7 = 5;
LABEL_5:
    (*v6)[v7]();
  }
  return v5;
}

uint64_t __42__ASDDSPGraph_setProperty_withSize_forID___block_invoke(uint64_t a1)
{
  unint64_t *p_shared_owners;
  unint64_t v3;
  uint64_t v5;
  std::__shared_weak_count *v6;

  objc_msgSend(*(id *)(a1 + 32), "graph");
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(*(_QWORD *)v5 + 56))(v5, *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(_QWORD *)(a1 + 40));
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v3 = __ldaxr(p_shared_owners);
    while (__stlxr(v3 - 1, p_shared_owners));
    if (!v3)
    {
      ((void (*)())v6->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return 1;
}

- (id)boxWithName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __27__ASDDSPGraph_boxWithName___block_invoke;
  v8[3] = &unk_24DBCA130;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(v8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

ASDDSPGraphBox *__27__ASDDSPGraph_boxWithName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  ASDDSPGraphBox *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  ASDDSPGraphBox *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v15;
  std::__shared_weak_count *v16;
  void *__p;
  char v18;

  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"));
  v2 = DSPGraph::Graph::box();
  v3 = v2;
  if (v18 < 0)
  {
    operator delete(__p);
    if (v3)
      goto LABEL_3;
LABEL_12:
    v10 = 0;
    return v10;
  }
  if (!v2)
    goto LABEL_12;
LABEL_3:
  v4 = [ASDDSPGraphBox alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(v5 + 8);
  v6 = *(std::__shared_weak_count **)(v5 + 16);
  v15 = v7;
  v16 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  v10 = -[ASDDSPGraphBox initWithBox:fromGraph:](v4, "initWithBox:fromGraph:", v3, &v15);
  v11 = v16;
  if (v16)
  {
    v12 = (unint64_t *)&v16->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  return v10;
}

- (NSSet)boxes
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __20__ASDDSPGraph_boxes__block_invoke;
  v3[3] = &unk_24DBCA158;
  v3[4] = self;
  ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(v3, 0);
  return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
}

id __20__ASDDSPGraph_boxes__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *i;
  ASDDSPGraphBox *v4;
  uint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  ASDDSPGraphBox *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v16;
  std::__shared_weak_count *v17;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24); i; i = (_QWORD *)*i)
  {
    v4 = [ASDDSPGraphBox alloc];
    v5 = i[2];
    v6 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(v6 + 8);
    v7 = *(std::__shared_weak_count **)(v6 + 16);
    v16 = v8;
    v17 = v7;
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    v11 = -[ASDDSPGraphBox initWithBox:fromGraph:](v4, "initWithBox:fromGraph:", v5, &v16);
    v12 = v17;
    if (v17)
    {
      v13 = (unint64_t *)&v17->__shared_owners_;
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    objc_msgSend(v2, "addObject:", v11, v16);

  }
  return v2;
}

- (NSSet)inputs
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __21__ASDDSPGraph_inputs__block_invoke;
  v3[3] = &unk_24DBCA158;
  v3[4] = self;
  ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(v3, 0);
  return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
}

id __21__ASDDSPGraph_inputs__block_invoke(uint64_t a1)
{
  void *v2;
  unsigned int i;
  ASDDSPGraphBox *v4;
  uint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  ASDDSPGraphBox *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v16;
  std::__shared_weak_count *v17;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < DSPGraph::Graph::numInputs(*(DSPGraph::Graph **)(*(_QWORD *)(a1 + 32) + 8)); ++i)
  {
    v4 = [ASDDSPGraphBox alloc];
    v5 = DSPGraph::Graph::in(*(DSPGraph::Graph **)(*(_QWORD *)(a1 + 32) + 8));
    v6 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(v6 + 8);
    v7 = *(std::__shared_weak_count **)(v6 + 16);
    v16 = v8;
    v17 = v7;
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    v11 = -[ASDDSPGraphBox initWithBox:fromGraph:](v4, "initWithBox:fromGraph:", v5, &v16);
    v12 = v17;
    if (v17)
    {
      v13 = (unint64_t *)&v17->__shared_owners_;
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    objc_msgSend(v2, "addObject:", v11, v16);

  }
  return v2;
}

- (NSSet)outputs
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __22__ASDDSPGraph_outputs__block_invoke;
  v3[3] = &unk_24DBCA158;
  v3[4] = self;
  ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(v3, 0);
  return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
}

id __22__ASDDSPGraph_outputs__block_invoke(uint64_t a1)
{
  void *v2;
  unsigned int i;
  ASDDSPGraphBox *v4;
  uint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  ASDDSPGraphBox *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v16;
  std::__shared_weak_count *v17;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < DSPGraph::Graph::numOutputs(*(DSPGraph::Graph **)(*(_QWORD *)(a1 + 32) + 8)); ++i)
  {
    v4 = [ASDDSPGraphBox alloc];
    v5 = DSPGraph::Graph::out(*(DSPGraph::Graph **)(*(_QWORD *)(a1 + 32) + 8));
    v6 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(v6 + 8);
    v7 = *(std::__shared_weak_count **)(v6 + 16);
    v16 = v8;
    v17 = v7;
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    v11 = -[ASDDSPGraphBox initWithBox:fromGraph:](v4, "initWithBox:fromGraph:", v5, &v16);
    v12 = v17;
    if (v17)
    {
      v13 = (unint64_t *)&v17->__shared_owners_;
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    objc_msgSend(v2, "addObject:", v11, v16);

  }
  return v2;
}

- (NSString)name
{
  Graph *ptr;
  _QWORD *v3;

  ptr = self->_graph.__ptr_;
  v3 = (_QWORD *)((char *)ptr + 408);
  if (*((char *)ptr + 431) < 0)
    v3 = (_QWORD *)*v3;
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3);
}

- (void)setName:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[3];
  _QWORD *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __23__ASDDSPGraph_setName___block_invoke;
  v8[3] = &unk_24DBCA180;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10[0] = &off_24DBC9D70;
  v11 = v10;
  ASDDSP::exceptionBarrier<void({block_pointer} {__strong})(void)>(v8);
  v6 = v11;
  if (v11 == v10)
  {
    v7 = 4;
    v6 = v10;
    goto LABEL_5;
  }
  if (v11)
  {
    v7 = 5;
LABEL_5:
    (*(void (**)(void))(*v6 + 8 * v7))();
  }

}

void __23__ASDDSPGraph_setName___block_invoke(uint64_t a1)
{
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
  JUMPOUT(0x220732FB8);
}

- (unint64_t)numberOfInputs
{
  unsigned int v2;
  uint64_t (***v3)();
  uint64_t v4;
  _QWORD v6[5];
  uint64_t (**v7)();
  int v8;
  uint64_t (***v9)();
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __29__ASDDSPGraph_numberOfInputs__block_invoke;
  v6[3] = &unk_24DBCA040;
  v6[4] = self;
  v7 = &off_24DBC9E48;
  v8 = 0;
  v9 = &v7;
  v2 = ASDDSP::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(v6);
  v3 = v9;
  if (v9 == &v7)
  {
    v4 = 4;
    v3 = &v7;
    goto LABEL_5;
  }
  if (v9)
  {
    v4 = 5;
LABEL_5:
    (*v3)[v4]();
  }
  return v2;
}

uint64_t __29__ASDDSPGraph_numberOfInputs__block_invoke(uint64_t a1)
{
  return DSPGraph::Graph::numInputs(*(DSPGraph::Graph **)(*(_QWORD *)(a1 + 32) + 8));
}

- (unint64_t)numberOfOutputs
{
  unsigned int v2;
  uint64_t (***v3)();
  uint64_t v4;
  _QWORD v6[5];
  uint64_t (**v7)();
  int v8;
  uint64_t (***v9)();
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __30__ASDDSPGraph_numberOfOutputs__block_invoke;
  v6[3] = &unk_24DBCA040;
  v6[4] = self;
  v7 = &off_24DBC9E48;
  v8 = 0;
  v9 = &v7;
  v2 = ASDDSP::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(v6);
  v3 = v9;
  if (v9 == &v7)
  {
    v4 = 4;
    v3 = &v7;
    goto LABEL_5;
  }
  if (v9)
  {
    v4 = 5;
LABEL_5:
    (*v3)[v4]();
  }
  return v2;
}

uint64_t __30__ASDDSPGraph_numberOfOutputs__block_invoke(uint64_t a1)
{
  return DSPGraph::Graph::numOutputs(*(DSPGraph::Graph **)(*(_QWORD *)(a1 + 32) + 8));
}

- (shared_ptr<DSPGraph::Graph>)graph
{
  Graph **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<DSPGraph::Graph> result;

  cntrl = self->_graph.__cntrl_;
  *v2 = self->_graph.__ptr_;
  v2[1] = (Graph *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Graph *)self;
  return result;
}

- (void).cxx_destruct
{
  std::shared_ptr<DSPGraph::Graph>::~shared_ptr[abi:ne180100]((uint64_t)&self->_graph);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void)setAUStrip:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_219C60000, MEMORY[0x24BDACB70], a3, "AUStrip is nil", a5, a6, a7, a8, 0);
}

- (void)setPropertyStrip:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_219C60000, MEMORY[0x24BDACB70], a3, "PropertyStrip is nil", a5, a6, a7, a8, 0);
}

@end
