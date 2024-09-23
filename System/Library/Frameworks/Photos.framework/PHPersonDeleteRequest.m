@implementation PHPersonDeleteRequest

- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4
{
  id v6;
  unsigned int v7;
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_super v15;
  id v16;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHPersonDeleteRequest;
  v16 = 0;
  v7 = -[PHObjectDeleteRequest validateForDeleteManagedObject:error:](&v15, sel_validateForDeleteManagedObject_error_, v6, &v16);
  v8 = v16;
  if (!v7)
  {
    v10 = 0;
    if (!a4)
      goto LABEL_11;
    goto LABEL_9;
  }
  v9 = v6;
  if (-[PHPersonDeleteRequest force](self, "force") || objc_msgSend(v9, "verifiedType"))
  {
    v10 = 1;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v9, "personUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ph_errorWithCode:localizedDescription:", 3300, CFSTR("Deleting an unverified person (uuid = %@) is not permitted"), v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = 0;
    v8 = (id)v13;
  }

  if (a4)
  {
LABEL_9:
    if (!v10)
      *a4 = objc_retainAutorelease(v8);
  }
LABEL_11:

  return v10;
}

- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4
{
  objc_msgSend(a3, "deletePersonWithReason:", 3, a4);
}

- (PHPersonDeleteRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  PHPersonDeleteRequest *v9;
  objc_super v11;

  v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHPersonDeleteRequest;
  v9 = -[PHObjectDeleteRequest initWithXPCDict:request:clientAuthorization:](&v11, sel_initWithXPCDict_request_clientAuthorization_, v8, a4, a5);
  if (v9)
    v9->_force = xpc_dictionary_get_BOOL(v8, "force");

  return v9;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHPersonDeleteRequest;
  v4 = a3;
  -[PHObjectDeleteRequest encodeToXPCDict:](&v5, sel_encodeToXPCDict_, v4);
  xpc_dictionary_set_BOOL(v4, "force", self->_force);

}

- (BOOL)force
{
  return self->_force;
}

- (void)setForce:(BOOL)a3
{
  self->_force = a3;
}

@end
