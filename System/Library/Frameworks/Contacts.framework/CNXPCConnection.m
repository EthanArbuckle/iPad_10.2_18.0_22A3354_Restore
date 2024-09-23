@implementation CNXPCConnection

- (id)remoteResultForSelector:(SEL)a3 parameters:(id)a4 error:(id *)a5
{
  const char *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD aBlock[7];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v9 = a4;
  if (self && objc_getProperty(self, v8, 16, 1))
  {
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__7;
    v42 = __Block_byref_object_dispose__7;
    v43 = 0;
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__7;
    v36 = __Block_byref_object_dispose__7;
    v37 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__CNXPCConnection_remoteResultForSelector_parameters_error___block_invoke;
    aBlock[3] = &unk_1E29F8E80;
    aBlock[4] = &v38;
    aBlock[5] = &v32;
    aBlock[6] = &v28;
    v10 = _Block_copy(aBlock);
    v11 = objc_msgSend(v9, "count");
    -[CNXPCConnection serviceProxy](self, "serviceProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    switch(v11)
    {
      case 0:
        objc_msgSend(v12, a3, v10);
        break;
      case 1:
        objc_msgSend(v12, a3, objc_msgSend(v9, "pointerAtIndex:", 0), v10);
        break;
      case 2:
        objc_msgSend(v12, a3, objc_msgSend(v9, "pointerAtIndex:", 0), objc_msgSend(v9, "pointerAtIndex:", 1), v10);
        break;
      case 3:
        objc_msgSend(v12, a3, objc_msgSend(v9, "pointerAtIndex:", 0), objc_msgSend(v9, "pointerAtIndex:", 1), objc_msgSend(v9, "pointerAtIndex:", 2), v10);
        break;
      case 4:
        objc_msgSend(v12, a3, objc_msgSend(v9, "pointerAtIndex:", 0), objc_msgSend(v9, "pointerAtIndex:", 1), objc_msgSend(v9, "pointerAtIndex:", 2), objc_msgSend(v9, "pointerAtIndex:", 3), v10);
        break;
      default:
        v14 = (void *)MEMORY[0x1E0C99DA0];
        v15 = (void *)MEMORY[0x1E0CB3940];
        NSStringFromSelector(a3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("Too many arguments to %@"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (id)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", CFSTR("CNXPCVariadicOverflow"), v17, 0);

        break;
    }
    if (!*((_BYTE *)v29 + 24))
    {
      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 1, 0);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v33[5];
      v33[5] = v19;

    }
    v21 = (void *)v33[5];
    v22 = (id)v39[5];
    v23 = v22;
    if (a5 && !v22)
      *a5 = objc_retainAutorelease(v21);

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);

    _Block_object_dispose(&v38, 8);
  }
  else
  {
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 100, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (a5)
      *a5 = objc_retainAutorelease(v24);

    v23 = 0;
  }

  return v23;
}

- (id)remoteResultForSelector:(SEL)a3 error:(id *)a4
{
  return -[CNXPCConnection remoteResultForSelector:parameters:error:](self, "remoteResultForSelector:parameters:error:", a3, 0, a4);
}

- (id)serviceProxy
{
  return self->_serviceProxy;
}

- (CNXPCConnection)initWithConnection:(id)a3 interface:(id)a4 logger:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNXPCConnection *v12;
  NSXPCConnection *connection;
  uint64_t v14;
  id v15;
  id v16;
  NSXPCConnection *v17;
  id v18;
  SEL v19;
  id Property;
  void *v21;
  id serviceProxy;
  CNXPCConnection *v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  objc_super v33;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9
    && (v33.receiver = self,
        v33.super_class = (Class)CNXPCConnection,
        v12 = -[CNXPCConnection init](&v33, sel_init),
        (self = v12) != 0))
  {
    objc_storeStrong((id *)&v12->_logger, a5);
    objc_storeStrong((id *)&self->_connection, a3);
    connection = self->_connection;
    v14 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __55__CNXPCConnection_initWithConnection_interface_logger___block_invoke;
    v30[3] = &unk_1E29F7CE0;
    v15 = v11;
    v31 = v15;
    v16 = v9;
    v32 = v16;
    -[NSXPCConnection setInterruptionHandler:](connection, "setInterruptionHandler:", v30);
    v17 = self->_connection;
    v27[0] = v14;
    v27[1] = 3221225472;
    v27[2] = __55__CNXPCConnection_initWithConnection_interface_logger___block_invoke_2;
    v27[3] = &unk_1E29F7CE0;
    v18 = v15;
    v28 = v18;
    v29 = v16;
    -[NSXPCConnection setInvalidationHandler:](v17, "setInvalidationHandler:", v27);
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v10);
    -[NSXPCConnection resume](self->_connection, "resume");
    Property = objc_getProperty(self, v19, 16, 1);
    v25[0] = v14;
    v25[1] = 3221225472;
    v25[2] = __55__CNXPCConnection_initWithConnection_interface_logger___block_invoke_3;
    v25[3] = &unk_1E29F89E0;
    v26 = v18;
    objc_msgSend(Property, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    serviceProxy = self->_serviceProxy;
    self->_serviceProxy = v21;

    self = self;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

void __60__CNXPCConnection_remoteResultForSelector_parameters_error___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[4] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
}

void __55__CNXPCConnection_initWithConnection_interface_logger___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "serviceName");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "XPCConnectionWasInvalidatedForService:", v2);

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CNXPCConnection;
  -[CNXPCConnection dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_serviceProxy, 0);
}

void __55__CNXPCConnection_initWithConnection_interface_logger___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "serviceName");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "XPCConnectionWasInterruptedForService:", v2);

}

uint64_t __55__CNXPCConnection_initWithConnection_interface_logger___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "serviceError:", a2);
}

- (id)remoteResultForSelector:(SEL)a3 param1:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (void *)MEMORY[0x1E0CB3868];
  v9 = a4;
  objc_msgSend(v8, "weakObjectsPointerArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addPointer:", v9);

  -[CNXPCConnection remoteResultForSelector:parameters:error:](self, "remoteResultForSelector:parameters:error:", a3, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)remoteResultForSelector:(SEL)a3 param1:(id)a4 param2:(id)a5 error:(id *)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = (void *)MEMORY[0x1E0CB3868];
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "weakObjectsPointerArray");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addPointer:", v12);

  objc_msgSend(v13, "addPointer:", v11);
  -[CNXPCConnection remoteResultForSelector:parameters:error:](self, "remoteResultForSelector:parameters:error:", a3, v13, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
