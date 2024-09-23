@implementation CAFTestControlAsync

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestControlAsync;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_256812388))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFTestControlAsync;
  -[CAFService registerObserver:](&v6, sel_registerObserver_, v5);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_256812388))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFTestControlAsync;
  -[CAFService unregisterObserver:](&v6, sel_unregisterObserver_, v5);

}

- (CAFTestDevRequestNoParamsControl)testDevRequestNoParamsControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x00000000FF000028"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFTestDevRequestNoParamsControl *)v4;
}

- (void)testDevRequestNoParamsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  v4 = a3;
  -[CAFTestControlAsync testDevRequestNoParamsControl](self, "testDevRequestNoParamsControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "testDevRequestNoParamsWithCompletion:", v4);
  }
  else if (v4)
  {
    dispatch_get_global_queue(33, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__CAFTestControlAsync_testDevRequestNoParamsWithCompletion___block_invoke;
    block[3] = &unk_2508FD320;
    v9 = v4;
    dispatch_async(v7, block);

  }
}

void __60__CAFTestControlAsync_testDevRequestNoParamsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)hasTestDevRequestNoParams
{
  void *v2;
  BOOL v3;

  -[CAFTestControlAsync testDevRequestNoParamsControl](self, "testDevRequestNoParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)testDevRequestNoParamsError
{
  void *v2;
  char v3;

  -[CAFTestControlAsync testDevRequestNoParamsControl](self, "testDevRequestNoParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasErrorState");

  return v3;
}

- (BOOL)testDevRequestNoParamsDisabled
{
  void *v2;
  char v3;

  -[CAFTestControlAsync testDevRequestNoParamsControl](self, "testDevRequestNoParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisabled");

  return v3;
}

- (CAFTestDevRequestWithReqParamsControl)testDevRequestWithReqParamsControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x00000000FF000029"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFTestDevRequestWithReqParamsControl *)v4;
}

- (void)testDevRequestWithReqParamsWithTestInput1:(unsigned __int8)a3 testInput2:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  -[CAFTestControlAsync testDevRequestWithReqParamsControl](self, "testDevRequestWithReqParamsControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "testDevRequestWithReqParamsWithTestInput1:testInput2:completion:", v6, v8, v9);
  }
  else if (v9)
  {
    dispatch_get_global_queue(33, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __87__CAFTestControlAsync_testDevRequestWithReqParamsWithTestInput1_testInput2_completion___block_invoke;
    block[3] = &unk_2508FD320;
    v14 = v9;
    dispatch_async(v12, block);

  }
}

void __87__CAFTestControlAsync_testDevRequestWithReqParamsWithTestInput1_testInput2_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)hasTestDevRequestWithReqParams
{
  void *v2;
  BOOL v3;

  -[CAFTestControlAsync testDevRequestWithReqParamsControl](self, "testDevRequestWithReqParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)testDevRequestWithReqParamsError
{
  void *v2;
  char v3;

  -[CAFTestControlAsync testDevRequestWithReqParamsControl](self, "testDevRequestWithReqParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasErrorState");

  return v3;
}

- (BOOL)testDevRequestWithReqParamsDisabled
{
  void *v2;
  char v3;

  -[CAFTestControlAsync testDevRequestWithReqParamsControl](self, "testDevRequestWithReqParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisabled");

  return v3;
}

- (CAFTestDevRequestWithResParamsControl)testDevRequestWithResParamsControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x00000000FF00002A"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFTestDevRequestWithResParamsControl *)v4;
}

- (void)testDevRequestWithResParamsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  v4 = a3;
  -[CAFTestControlAsync testDevRequestWithResParamsControl](self, "testDevRequestWithResParamsControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "testDevRequestWithResParamsWithCompletion:", v4);
  }
  else if (v4)
  {
    dispatch_get_global_queue(33, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__CAFTestControlAsync_testDevRequestWithResParamsWithCompletion___block_invoke;
    block[3] = &unk_2508FD320;
    v9 = v4;
    dispatch_async(v7, block);

  }
}

void __65__CAFTestControlAsync_testDevRequestWithResParamsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, MEMORY[0x24BDBD1A8], v2);

}

- (BOOL)hasTestDevRequestWithResParams
{
  void *v2;
  BOOL v3;

  -[CAFTestControlAsync testDevRequestWithResParamsControl](self, "testDevRequestWithResParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)testDevRequestWithResParamsError
{
  void *v2;
  char v3;

  -[CAFTestControlAsync testDevRequestWithResParamsControl](self, "testDevRequestWithResParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasErrorState");

  return v3;
}

- (BOOL)testDevRequestWithResParamsDisabled
{
  void *v2;
  char v3;

  -[CAFTestControlAsync testDevRequestWithResParamsControl](self, "testDevRequestWithResParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisabled");

  return v3;
}

- (CAFTestDevRequestWithReqAndResParamsControl)testDevRequestWithReqAndResParamsControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x00000000FF00002B"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFTestDevRequestWithReqAndResParamsControl *)v4;
}

- (void)testDevRequestWithReqAndResParamsWithTestInput5:(unsigned __int8)a3 testInput6:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  -[CAFTestControlAsync testDevRequestWithReqAndResParamsControl](self, "testDevRequestWithReqAndResParamsControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "testDevRequestWithReqAndResParamsWithTestInput5:testInput6:completion:", v6, v8, v9);
  }
  else if (v9)
  {
    dispatch_get_global_queue(33, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __93__CAFTestControlAsync_testDevRequestWithReqAndResParamsWithTestInput5_testInput6_completion___block_invoke;
    block[3] = &unk_2508FD320;
    v14 = v9;
    dispatch_async(v12, block);

  }
}

void __93__CAFTestControlAsync_testDevRequestWithReqAndResParamsWithTestInput5_testInput6_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, MEMORY[0x24BDBD1A8], v2);

}

- (BOOL)hasTestDevRequestWithReqAndResParams
{
  void *v2;
  BOOL v3;

  -[CAFTestControlAsync testDevRequestWithReqAndResParamsControl](self, "testDevRequestWithReqAndResParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)testDevRequestWithReqAndResParamsError
{
  void *v2;
  char v3;

  -[CAFTestControlAsync testDevRequestWithReqAndResParamsControl](self, "testDevRequestWithReqAndResParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasErrorState");

  return v3;
}

- (BOOL)testDevRequestWithReqAndResParamsDisabled
{
  void *v2;
  char v3;

  -[CAFTestControlAsync testDevRequestWithReqAndResParamsControl](self, "testDevRequestWithReqAndResParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisabled");

  return v3;
}

- (CAFTestAccRequestNoParamsControl)testAccRequestNoParamsControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x00000000FF00002E"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFTestAccRequestNoParamsControl *)v4;
}

- (id)testAccRequestNoParamsHandler
{
  void *v2;
  void *v3;

  -[CAFTestControlAsync testAccRequestNoParamsControl](self, "testAccRequestNoParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setTestAccRequestNoParamsHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTestControlAsync testAccRequestNoParamsControl](self, "testAccRequestNoParamsControl");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandler:", v4);

}

- (BOOL)hasTestAccRequestNoParams
{
  void *v2;
  BOOL v3;

  -[CAFTestControlAsync testAccRequestNoParamsControl](self, "testAccRequestNoParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFTestAccRequestWithReqParamsControl)testAccRequestWithReqParamsControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x00000000FF00002F"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFTestAccRequestWithReqParamsControl *)v4;
}

- (id)testAccRequestWithReqParamsHandler
{
  void *v2;
  void *v3;

  -[CAFTestControlAsync testAccRequestWithReqParamsControl](self, "testAccRequestWithReqParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setTestAccRequestWithReqParamsHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTestControlAsync testAccRequestWithReqParamsControl](self, "testAccRequestWithReqParamsControl");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandler:", v4);

}

- (BOOL)hasTestAccRequestWithReqParams
{
  void *v2;
  BOOL v3;

  -[CAFTestControlAsync testAccRequestWithReqParamsControl](self, "testAccRequestWithReqParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFTestAccRequestWithResParamsControl)testAccRequestWithResParamsControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x00000000FF000030"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFTestAccRequestWithResParamsControl *)v4;
}

- (id)testAccRequestWithResParamsHandler
{
  void *v2;
  void *v3;

  -[CAFTestControlAsync testAccRequestWithResParamsControl](self, "testAccRequestWithResParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setTestAccRequestWithResParamsHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTestControlAsync testAccRequestWithResParamsControl](self, "testAccRequestWithResParamsControl");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandler:", v4);

}

- (BOOL)hasTestAccRequestWithResParams
{
  void *v2;
  BOOL v3;

  -[CAFTestControlAsync testAccRequestWithResParamsControl](self, "testAccRequestWithResParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFTestAccRequestWithReqAndResParamsControl)testAccRequestWithReqAndResParamsControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x00000000FF000031"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFTestAccRequestWithReqAndResParamsControl *)v4;
}

- (id)testAccRequestWithReqAndResParamsHandler
{
  void *v2;
  void *v3;

  -[CAFTestControlAsync testAccRequestWithReqAndResParamsControl](self, "testAccRequestWithReqAndResParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setTestAccRequestWithReqAndResParamsHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTestControlAsync testAccRequestWithReqAndResParamsControl](self, "testAccRequestWithReqAndResParamsControl");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandler:", v4);

}

- (BOOL)hasTestAccRequestWithReqAndResParams
{
  void *v2;
  BOOL v3;

  -[CAFTestControlAsync testAccRequestWithReqAndResParamsControl](self, "testAccRequestWithReqAndResParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return CFSTR("0x00000000FE000009");
}

+ (id)observerProtocol
{
  return &unk_25682C5A0;
}

- (void)_controlDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  objc_super v25;

  v4 = a3;
  objc_msgSend(v4, "controlType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", CFSTR("0x00000000FF000028")) & 1) != 0)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTestControlAsync testDevRequestNoParamsControl](self, "testDevRequestNoParamsControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqual:", v8);

    if (v9)
    {
      -[CAFService observers](self, "observers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "testControlAsyncServiceDidUpdateTestDevRequestNoParams:", self);
LABEL_16:

      goto LABEL_17;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "controlType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqual:", CFSTR("0x00000000FF000029")) & 1) != 0)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTestControlAsync testDevRequestWithReqParamsControl](self, "testDevRequestWithReqParamsControl");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "isEqual:", v14);

    if (v15)
    {
      -[CAFService observers](self, "observers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "testControlAsyncServiceDidUpdateTestDevRequestWithReqParams:", self);
      goto LABEL_16;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "controlType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "isEqual:", CFSTR("0x00000000FF00002A")) & 1) != 0)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTestControlAsync testDevRequestWithResParamsControl](self, "testDevRequestWithResParamsControl");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "uniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "isEqual:", v19);

    if (v20)
    {
      -[CAFService observers](self, "observers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "testControlAsyncServiceDidUpdateTestDevRequestWithResParams:", self);
      goto LABEL_16;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "controlType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isEqual:", CFSTR("0x00000000FF00002B")))
    goto LABEL_16;
  objc_msgSend(v4, "uniqueIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFTestControlAsync testDevRequestWithReqAndResParamsControl](self, "testDevRequestWithReqAndResParamsControl");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "uniqueIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v21, "isEqual:", v23);

  if (v24)
  {
    -[CAFService observers](self, "observers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "testControlAsyncServiceDidUpdateTestDevRequestWithReqAndResParams:", self);
    goto LABEL_16;
  }
LABEL_17:
  v25.receiver = self;
  v25.super_class = (Class)CAFTestControlAsync;
  -[CAFService _controlDidUpdate:](&v25, sel__controlDidUpdate_, v4);

}

- (BOOL)registeredForTestDevRequestNoParams
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x00000000FF000028"));

  return v10;
}

- (BOOL)registeredForTestDevRequestWithReqParams
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x00000000FF000029"));

  return v10;
}

- (BOOL)registeredForTestDevRequestWithResParams
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x00000000FF00002A"));

  return v10;
}

- (BOOL)registeredForTestDevRequestWithReqAndResParams
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x00000000FF00002B"));

  return v10;
}

- (BOOL)registeredForTestAccRequestNoParams
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x00000000FF00002E"));

  return v10;
}

- (BOOL)registeredForTestAccRequestWithReqParams
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x00000000FF00002F"));

  return v10;
}

- (BOOL)registeredForTestAccRequestWithResParams
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x00000000FF000030"));

  return v10;
}

- (BOOL)registeredForTestAccRequestWithReqAndResParams
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x00000000FF000031"));

  return v10;
}

@end
