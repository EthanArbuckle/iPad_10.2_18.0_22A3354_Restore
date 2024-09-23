@implementation MFCategoryPersistence_iOS

- (MFCategoryPersistence_iOS)initWithLibrary:(id)a3 database:(id)a4 hookResponder:(id)a5
{
  id v10;
  id v11;
  id v12;
  MFCategoryPersistence_iOS *v13;
  MFCategoryPersistence_iOS *v14;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFCategoryPersistence_iOS-BlackPearl.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library != nil"));

  }
  v17.receiver = self;
  v17.super_class = (Class)MFCategoryPersistence_iOS;
  v13 = -[EDCategoryPersistence initWithDatabase:hookResponder:](&v17, sel_initWithDatabase_hookResponder_, v11, v12);
  v14 = v13;
  if (v13)
    objc_storeStrong((id *)&v13->_library, a3);

  return v14;
}

- (BOOL)persistCategorizationResultMap:(id)a3
{
  id v4;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFCategoryPersistence_iOS;
  LOBYTE(self) = -[EDCategoryPersistence persistCategorizationResultMap:](&v6, sel_persistCategorizationResultMap_, v4);
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_27);

  return (char)self;
}

- (MFMailMessageLibrary)library
{
  return self->_library;
}

- (void)setLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_library, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
}

@end
