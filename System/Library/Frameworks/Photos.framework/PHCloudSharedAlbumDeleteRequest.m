@implementation PHCloudSharedAlbumDeleteRequest

- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4
{
  BOOL v5;
  id v6;
  void *v7;
  objc_super v9;
  id v10;

  v9.receiver = self;
  v9.super_class = (Class)PHCloudSharedAlbumDeleteRequest;
  v10 = 0;
  v5 = -[PHObjectDeleteRequest validateForDeleteManagedObject:error:](&v9, sel_validateForDeleteManagedObject_error_, a3, &v10);
  v6 = v10;
  v7 = v6;
  if (a4 && !v5)
    *a4 = objc_retainAutorelease(v6);

  return v5;
}

- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userTrashAlbums:", v7);

  }
}

@end
