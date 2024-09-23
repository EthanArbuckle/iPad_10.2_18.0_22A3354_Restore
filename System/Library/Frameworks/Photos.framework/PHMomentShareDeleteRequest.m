@implementation PHMomentShareDeleteRequest

- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4
{
  id v6;
  unsigned int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  objc_super v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHMomentShareDeleteRequest;
  v16 = 0;
  v7 = -[PHObjectDeleteRequest validateForDeleteManagedObject:error:](&v15, sel_validateForDeleteManagedObject_error_, v6, &v16);
  v8 = v16;
  if (v7)
  {
    if (-[PHMomentShareDeleteRequest operation](self, "operation")
      || objc_msgSend(v6, "trashedState") != 1)
    {
      v13 = 1;
      goto LABEL_9;
    }
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Moment share is already in trash state"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v12;
  }
  if (a4)
  {
    v8 = objc_retainAutorelease(v8);
    v13 = 0;
    *a4 = v8;
  }
  else
  {
    v13 = 0;
  }
LABEL_9:

  return v13;
}

- (PHMomentShareDeleteRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  PHMomentShareDeleteRequest *v9;
  objc_super v11;

  v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHMomentShareDeleteRequest;
  v9 = -[PHObjectDeleteRequest initWithXPCDict:request:clientAuthorization:](&v11, sel_initWithXPCDict_request_clientAuthorization_, v8, a4, a5);
  if (v9)
    v9->_operation = xpc_dictionary_get_int64(v8, "deleteOperation");

  return v9;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHMomentShareDeleteRequest;
  v4 = a3;
  -[PHObjectDeleteRequest encodeToXPCDict:](&v5, sel_encodeToXPCDict_, v4);
  xpc_dictionary_set_int64(v4, "deleteOperation", self->_operation);

}

- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = -[PHMomentShareDeleteRequest operation](self, "operation");
  if (v7 == 1)
  {
    objc_msgSend(v6, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteObject:", v9);

  }
  else if (!v7)
  {
    objc_msgSend(v9, "trash");
  }

}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

@end
