@implementation IMCloudKitErrorProgressTest

- (IMCloudKitErrorProgressTest)initWithErrorCode:(int64_t)a3
{
  IMCloudKitErrorProgressTest *v4;
  uint64_t v5;
  NSError *error;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMCloudKitErrorProgressTest;
  v4 = -[IMCloudKitErrorProgressTest init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D37B90], a3, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    error = v4->_error;
    v4->_error = (NSError *)v5;

  }
  return v4;
}

- (void)willUpdateSyncState:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = a3;
  -[IMCloudKitErrorProgressTest error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serializedErrorArrayFromErrorArray_im:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIMCloudKitSyncErrors:", v8);

}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
