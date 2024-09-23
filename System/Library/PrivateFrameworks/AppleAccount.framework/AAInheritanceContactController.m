@implementation AAInheritanceContactController

- (AAInheritanceContactController)initWithContactInfo:(id)a3 contactType:(int64_t)a4
{
  id v7;
  AAInheritanceContactController *v8;
  AAInheritanceController *v9;
  AAInheritanceController *inheritanceController;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AAInheritanceContactController;
  v8 = -[AAInheritanceContactController init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(AAInheritanceController);
    inheritanceController = v8->_inheritanceController;
    v8->_inheritanceController = v9;

    objc_storeStrong((id *)&v8->_contactInfo, a3);
    v8->_contactType = a4;
  }

  return v8;
}

- (NSString)claimTokenString
{
  void *v2;
  void *v3;

  -[AAInheritanceContactInfo accessKey](self->_contactInfo, "accessKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "claimTokenString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)accessKeyString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AAInheritanceContactInfo accessKey](self->_contactInfo, "accessKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "claimTokenString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAInheritanceContactInfo accessKey](self->_contactInfo, "accessKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wrappingKeyString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)accessKeyQRCodeImageDataWithSize:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  CGAffineTransform v11;
  CGAffineTransform v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  memset(&v12, 0, sizeof(v12));
  CGAffineTransformMakeScale(&v12, a3, a3);
  -[AAInheritanceContactController _accessKeyQRCodeImage](self, "_accessKeyQRCodeImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v12;
  objc_msgSend(v4, "imageByApplyingTransform:", &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v6 = (void *)getCIContextClass_softClass;
  v16 = getCIContextClass_softClass;
  if (!getCIContextClass_softClass)
  {
    *(_QWORD *)&v11.a = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v11.b = 3221225472;
    *(_QWORD *)&v11.c = __getCIContextClass_block_invoke;
    *(_QWORD *)&v11.d = &unk_1E416F0A0;
    *(_QWORD *)&v11.tx = &v13;
    __getCIContextClass_block_invoke((uint64_t)&v11);
    v6 = (void *)v14[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v13, 8);
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "JPEGRepresentationOfImage:colorSpace:options:", v5, CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]), MEMORY[0x1E0C9AA70]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_accessKeyQRCodeImage
{
  CIImage *accessKeyQRCodeImage;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CIImage *v10;
  CIImage *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  accessKeyQRCodeImage = self->_accessKeyQRCodeImage;
  if (!accessKeyQRCodeImage)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v4 = (void *)getCIFilterClass_softClass;
    v17 = getCIFilterClass_softClass;
    if (!getCIFilterClass_softClass)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __getCIFilterClass_block_invoke;
      v13[3] = &unk_1E416F0A0;
      v13[4] = &v14;
      __getCIFilterClass_block_invoke((uint64_t)v13);
      v4 = (void *)v15[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v14, 8);
    objc_msgSend(v5, "filterWithName:", CFSTR("CIQRCodeGenerator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAInheritanceContactInfo accessKey](self->_contactInfo, "accessKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "wrappingKeyString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataUsingEncoding:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setValue:forKey:", v9, CFSTR("inputMessage"));
    objc_msgSend(v6, "outputImage");
    v10 = (CIImage *)objc_claimAutoreleasedReturnValue();
    v11 = self->_accessKeyQRCodeImage;
    self->_accessKeyQRCodeImage = v10;

    accessKeyQRCodeImage = self->_accessKeyQRCodeImage;
  }
  return accessKeyQRCodeImage;
}

- (void)removeContactAsBeneficiaryWithCompletion:(id)a3
{
  id v4;
  int64_t contactType;
  NSObject *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  contactType = self->_contactType;
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((contactType & 4) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, "%@ : Removing Beneficiary...", (uint8_t *)&v10, 0xCu);

    }
    -[AAInheritanceController removeBeneficiary:manifest:completion:](self->_inheritanceController, "removeBeneficiary:manifest:completion:", self->_contactInfo, 0, v4);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AAInheritanceContactController removeContactAsBeneficiaryWithCompletion:].cold.1();

  }
}

- (void)removeContactAsBenefactorWithCompletion:(id)a3
{
  id v4;
  int64_t contactType;
  NSObject *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  contactType = self->_contactType;
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((contactType & 8) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, "%@ : Removing Benefactor...", (uint8_t *)&v10, 0xCu);

    }
    -[AAInheritanceController removeBenefactor:completion:](self->_inheritanceController, "removeBenefactor:completion:", self->_contactInfo, v4);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AAInheritanceContactController removeContactAsBenefactorWithCompletion:].cold.1();

  }
}

- (void)sendInvitationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAInheritanceContactInfo handle](self->_contactInfo, "handle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "%@ : Sending invitation to %@ ...", (uint8_t *)&v9, 0x16u);

  }
  -[AAInheritanceController sendInvitationToContact:completion:](self->_inheritanceController, "sendInvitationToContact:completion:", self->_contactInfo, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessKeyQRCodeImage, 0);
  objc_storeStrong((id *)&self->_contactInfo, 0);
  objc_storeStrong((id *)&self->_inheritanceController, 0);
}

- (void)removeContactAsBeneficiaryWithCompletion:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_19EACA000, v2, v3, "%@ : The contact is not a beneficiary. Aborting removeBeneficiary call!", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_10();
}

- (void)removeContactAsBenefactorWithCompletion:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_19EACA000, v2, v3, "%@ : The contact is not a benefactor. Aborting removeBenefactor call!", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_10();
}

@end
