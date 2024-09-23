@implementation PHSocialGroupDeleteRequest

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
  v15.super_class = (Class)PHSocialGroupDeleteRequest;
  v16 = 0;
  v7 = -[PHObjectDeleteRequest validateForDeleteManagedObject:error:](&v15, sel_validateForDeleteManagedObject_error_, v6, &v16);
  v8 = v16;
  if (!v7)
  {
    v13 = 0;
    if (!a4)
      goto LABEL_11;
    goto LABEL_9;
  }
  v9 = (void *)objc_msgSend(MEMORY[0x1E0D71B28], "newNodeContainerWithNode:", v6);
  if (objc_msgSend(v9, "socialGroupVerifiedType") == 2
    || !objc_msgSend(v9, "socialGroupVerifiedType"))
  {
    v13 = 1;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2938];
    v18[0] = CFSTR("Attempt to delete a non graph-verified social group");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = 0;
    v8 = (id)v12;
  }

  if (a4)
  {
LABEL_9:
    if (!v13)
      *a4 = objc_retainAutorelease(v8);
  }
LABEL_11:

  return v13;
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

@end
