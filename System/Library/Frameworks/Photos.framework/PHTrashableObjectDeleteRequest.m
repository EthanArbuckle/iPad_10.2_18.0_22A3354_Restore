@implementation PHTrashableObjectDeleteRequest

- (PHTrashableObjectDeleteRequest)initWithUUID:(id)a3 objectID:(id)a4 operation:(int64_t)a5
{
  PHTrashableObjectDeleteRequest *v6;
  PHTrashableObjectDeleteRequest *v7;
  PHTrashableObjectDeleteRequest *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PHTrashableObjectDeleteRequest;
  v6 = -[PHObjectDeleteRequest initWithUUID:objectID:](&v10, sel_initWithUUID_objectID_, a3, a4);
  v7 = v6;
  if (v6)
  {
    v6->_operation = a5;
    v8 = v6;
  }

  return v7;
}

- (PHTrashableObjectDeleteRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  id v9;
  PHTrashableObjectDeleteRequest *v10;
  PHTrashableObjectDeleteRequest *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PHTrashableObjectDeleteRequest;
  v10 = -[PHObjectDeleteRequest initWithXPCDict:request:clientAuthorization:](&v13, sel_initWithXPCDict_request_clientAuthorization_, v8, a4, v9);
  if (v10)
  {
    v10->_clientEntitledToExpunge = objc_msgSend(v9, "photoKitEntitledFor:", *MEMORY[0x1E0D749C8]);
    v10->_operation = xpc_dictionary_get_int64(v8, "deleteOperation");
    v11 = v10;
  }

  return v10;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHTrashableObjectDeleteRequest;
  v4 = a3;
  -[PHObjectDeleteRequest encodeToXPCDict:](&v5, sel_encodeToXPCDict_, v4);
  xpc_dictionary_set_int64(v4, "deleteOperation", self->_operation);

}

- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PHTrashableObjectDeleteRequest;
  v15 = 0;
  LODWORD(v7) = -[PHObjectDeleteRequest validateForDeleteManagedObject:error:](&v14, sel_validateForDeleteManagedObject_error_, v6, &v15);
  v8 = v15;
  if ((_DWORD)v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v6, "canPerformDeleteOperation") & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid delete"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v10);
      v11 = objc_claimAutoreleasedReturnValue();

      LOBYTE(v7) = 0;
      v8 = (id)v11;
    }
    else
    {
      LOBYTE(v7) = 1;
    }
  }
  if (-[PHTrashableObjectDeleteRequest operation](self, "operation") == 1 && !self->_clientEntitledToExpunge)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericEntitlementError");
    v12 = objc_claimAutoreleasedReturnValue();

    LOBYTE(v7) = 0;
    v8 = (id)v12;
  }
  if (a4 && (v7 & 1) == 0)
    *a4 = objc_retainAutorelease(v8);

  return (char)v7;
}

- (int64_t)operation
{
  return self->_operation;
}

- (BOOL)isClientEntitledToExpunge
{
  return self->_clientEntitledToExpunge;
}

+ (id)deleteRequestForObject:(id)a3
{
  return (id)objc_msgSend(a1, "deleteRequestForObject:operation:", a3, 0);
}

+ (id)deleteRequestForObject:(id)a3 operation:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = objc_alloc((Class)a1);
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v7, "initWithUUID:objectID:operation:", v8, v9, a4);
  return v10;
}

@end
