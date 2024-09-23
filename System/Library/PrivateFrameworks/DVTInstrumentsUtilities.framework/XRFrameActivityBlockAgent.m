@implementation XRFrameActivityBlockAgent

- (XRFrameActivityBlockAgent)initWithBlock:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  XRFrameActivityBlockAgent *v9;
  uint64_t v10;
  id block;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)XRFrameActivityBlockAgent;
  v9 = -[XRFrameActivityBlockAgent init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend_copy(v4, v5, v6, v7, v8);
    block = v9->_block;
    v9->_block = (id)v10;

  }
  return v9;
}

- (XRFrameActivityBlockAgent)init
{
  uint64_t v2;
  uint64_t v3;

  return (XRFrameActivityBlockAgent *)objc_msgSend_initWithBlock_(self, a2, (uint64_t)&unk_24EDC2C30, v2, v3);
}

- (void)dealloc
{
  unint64_t *p_opPtr;
  void *v4;
  unint64_t v5;
  int v6;
  objc_super v7;

  p_opPtr = &self->_opPtr;
  while (1)
  {
    v4 = (void *)__ldaxr(p_opPtr);
    if (v4 != (void *)-1)
      break;
    if (!__stlxr(0xFFFFFFFFFFFFFFFFLL, p_opPtr))
      goto LABEL_14;
  }
  __clrex();
  do
  {
    if (v4)
    {
      if (v4 == (void *)-1)
        sub_22637054C();

    }
    while (1)
    {
      v5 = __ldaxr(p_opPtr);
      if ((void *)v5 != v4)
        break;
      if (!__stlxr(0xFFFFFFFFFFFFFFFFLL, p_opPtr))
      {
        v6 = 1;
        goto LABEL_13;
      }
    }
    v6 = 0;
    __clrex();
LABEL_13:
    v4 = (void *)v5;
  }
  while (!v6);
LABEL_14:
  v7.receiver = self;
  v7.super_class = (Class)XRFrameActivityBlockAgent;
  -[XRFrameActivityBlockAgent dealloc](&v7, sel_dealloc);
}

- (id)agentDiagnosticsName
{
  return CFSTR("Frame Activity Block");
}

- (void)executeStopOnItinerary:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t *p_opPtr;
  void *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  objc_super v29;
  objc_super v30;

  v4 = a3;
  objc_msgSend_mode(self, v5, v6, v7, v8);
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v13 == CFSTR("Activating"))
  {
    if (objc_msgSend_movementType(self, v9, v10, v11, v12) == 1)
    {
      v30.receiver = self;
      v30.super_class = (Class)XRFrameActivityBlockAgent;
      -[XRMobileAgent executeStopOnItinerary:](&v30, sel_executeStopOnItinerary_, v4);
    }
    v18 = atomic_load((unsigned __int8 *)self->_yieldNow);
    if ((v18 & 1) != 0)
    {
      objc_msgSend_revisit(v4, v14, v15, v16, v17);
    }
    else
    {
      (*((void (**)(void))self->_block + 2))();
      p_opPtr = &self->_opPtr;
      while (1)
      {
        v23 = (void *)__ldaxr(p_opPtr);
        if (v23)
          break;
        if (!__stlxr(0xFFFFFFFFFFFFFFFFLL, p_opPtr))
          goto LABEL_13;
      }
      __clrex();
      if (v23 == (void *)-1)
        __assert_rtn("-[XRFrameActivityBlockAgent executeStopOnItinerary:]", "XRFrameActivityBlockAgent.m", 81, "current != FINISHED_OPERATION");
      v24 = v23;
      objc_msgSend_start(v24, v25, v26, v27, v28);

LABEL_13:
      objc_msgSend_finishedWithMode_(v4, v19, (uint64_t)CFSTR("Finished"), v20, v21);
    }
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)XRFrameActivityBlockAgent;
    -[XRMobileAgent executeStopOnItinerary:](&v29, sel_executeStopOnItinerary_, v4);
  }

}

- (id)operationRepresentation
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t *p_opPtr;
  void *v10;
  id v11;

  v3 = (void *)objc_opt_new();
  v8 = v3;
  p_opPtr = &self->_opPtr;
  while (1)
  {
    v10 = (void *)__ldaxr(p_opPtr);
    if (v10)
      break;
    if (!__stlxr((unint64_t)v3, p_opPtr))
    {
      v8 = v3;
      return v8;
    }
  }
  __clrex();
  if (v10 == (void *)-1)
  {
    objc_msgSend_start(v3, v4, v5, v6, v7);
  }
  else
  {
    v11 = v10;

    v8 = v11;
  }
  return v8;
}

- (BOOL)yieldNow
{
  return self->_yieldNow;
}

- (void)setYieldNow:(BOOL *)a3
{
  self->_yieldNow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
