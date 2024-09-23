@implementation PHPhotosHighlightDeleteRequest

- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4
{
  BOOL v5;
  id v6;
  void *v7;
  objc_super v9;
  id v10;

  v9.receiver = self;
  v9.super_class = (Class)PHPhotosHighlightDeleteRequest;
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

  v5 = a3;
  objc_msgSend(a4, "managedObjectContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteObject:", v5);

}

@end
