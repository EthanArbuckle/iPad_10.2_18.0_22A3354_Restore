@implementation PHCollectionDeleteRequest

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
  v15.super_class = (Class)PHCollectionDeleteRequest;
  v16 = 0;
  v7 = -[PHTrashableObjectDeleteRequest validateForDeleteManagedObject:error:](&v15, sel_validateForDeleteManagedObject_error_, v6, &v16);
  v8 = v16;
  if (v7)
  {
    if (-[PHObjectDeleteRequest isClientEntitled](self, "isClientEntitled")
      || (objc_opt_respondsToSelector() & 1) == 0
      || !objc_msgSend(v6, "isCloudSharedAlbum"))
    {
      v13 = 1;
      goto LABEL_10;
    }
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot modify iCloud Shared Streams"));
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
LABEL_10:

  return v13;
}

- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[PHTrashableObjectDeleteRequest operation](self, "operation");
  switch(v8)
  {
    case 2:
      v10 = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "userUntrashAlbums:", v9);
      goto LABEL_7;
    case 1:
      v11 = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "userExpungeAlbums:", v9);
      goto LABEL_7;
    case 0:
      v12[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "userTrashAlbums:", v9);
LABEL_7:

      break;
  }

}

@end
