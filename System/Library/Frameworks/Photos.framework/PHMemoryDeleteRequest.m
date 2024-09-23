@implementation PHMemoryDeleteRequest

- (PHMemoryDeleteRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  PHMemoryDeleteRequest *v9;
  objc_super v11;

  v8 = a5;
  v11.receiver = self;
  v11.super_class = (Class)PHMemoryDeleteRequest;
  v9 = -[PHObjectDeleteRequest initWithXPCDict:request:clientAuthorization:](&v11, sel_initWithXPCDict_request_clientAuthorization_, a3, a4, v8);
  if (v9)
    v9->_clientEntitledToMemoryMutation = objc_msgSend(v8, "photoKitEntitledFor:", *MEMORY[0x1E0D749E0]);

  return v9;
}

- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  id v8;
  objc_super v10;
  id v11;

  v6 = a3;
  if (-[PHMemoryDeleteRequest clientEntitledToMemoryMutation](self, "clientEntitledToMemoryMutation"))
  {
    v10.receiver = self;
    v10.super_class = (Class)PHMemoryDeleteRequest;
    v11 = 0;
    v7 = -[PHObjectDeleteRequest validateForDeleteManagedObject:error:](&v10, sel_validateForDeleteManagedObject_error_, v6, &v11);
    v8 = v11;
    if (!a4)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericEntitlementError");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    if (!a4)
      goto LABEL_7;
  }
  if (!v7)
    *a4 = objc_retainAutorelease(v8);
LABEL_7:

  return v7;
}

- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a4, "managedObjectContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteObject:", v5);

}

- (BOOL)clientEntitledToMemoryMutation
{
  return self->_clientEntitledToMemoryMutation;
}

@end
