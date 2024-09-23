@implementation HAP2CancelableObject

- (HAP2CancelableObject)init
{
  HAP2CancelableObject *v2;
  uint64_t v3;
  HAP2PropertyLock *propertyLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HAP2CancelableObject;
  v2 = -[HAP2CancelableObject init](&v6, sel_init);
  if (v2)
  {
    +[HAP2PropertyLock lockWithName:](HAP2PropertyLock, "lockWithName:", CFSTR("HAP2CancelableObject.propertyLock"));
    v3 = objc_claimAutoreleasedReturnValue();
    propertyLock = v2->_propertyLock;
    v2->_propertyLock = (HAP2PropertyLock *)v3;

  }
  return v2;
}

- (void)cancelWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAP2CancelableObject propertyLock](self, "propertyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__HAP2CancelableObject_cancelWithError___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWritingBlock:", v7);

}

- (NSError)cancelError
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__8897;
  v11 = __Block_byref_object_dispose__8898;
  v12 = 0;
  -[HAP2CancelableObject propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__HAP2CancelableObject_cancelError__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performReadingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSError *)v4;
}

- (void)setCancelError:(id)a3
{
  objc_storeStrong((id *)&self->_cancelError, a3);
}

- (HAP2PropertyLock)propertyLock
{
  return self->_propertyLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_storeStrong((id *)&self->_cancelError, 0);
}

void __35__HAP2CancelableObject_cancelError__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

void __40__HAP2CancelableObject_cancelWithError___block_invoke(uint64_t a1)
{
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

@end
