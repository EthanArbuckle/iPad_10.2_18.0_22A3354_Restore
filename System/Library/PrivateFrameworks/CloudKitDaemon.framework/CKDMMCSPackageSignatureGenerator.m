@implementation CKDMMCSPackageSignatureGenerator

- (CKDMMCSPackageSignatureGenerator)initWithBoundaryKey:(id)a3
{
  id v4;
  CKDMMCSPackageSignatureGenerator *v5;
  uint64_t v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKDMMCSPackageSignatureGenerator;
  v5 = -[CKDMMCSPackageSignatureGenerator init](&v8, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = MMCSPackageSectionSignatureGeneratorCreateWithBoundaryKey();
      v5->_usesMMCSV2 = 1;
    }
    else
    {
      v6 = MMCSPackageSectionSignatureGeneratorCreate();
    }
    v5->_generator = (void *)v6;
    v5->_valid = 1;
  }

  return v5;
}

- (void)dealloc
{
  uint64_t v2;
  id v4;
  objc_super v5;

  v4 = (id)objc_msgSend__finishGenerator(self, a2, v2);
  v5.receiver = self;
  v5.super_class = (Class)CKDMMCSPackageSignatureGenerator;
  -[CKDMMCSPackageSignatureGenerator dealloc](&v5, sel_dealloc);
}

- (id)_finishGenerator
{
  uint64_t v2;
  const char *v4;
  const char *v5;
  uint64_t v6;
  NSDictionary *v7;
  NSDictionary *generatorResults;

  if (objc_msgSend_isValid(self, a2, v2))
  {
    objc_msgSend_setValid_(self, v4, 0);
    objc_msgSend_generator(self, v5, v6);
    v7 = (NSDictionary *)MMCSPackageSectionSignatureGeneratorFinishWithResults();
    if (v7)
    {
      generatorResults = self->_generatorResults;
      self->_generatorResults = v7;

    }
  }
  return self->_generatorResults;
}

- (void)updateWithData:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  id v21;

  v5 = a3;
  if ((objc_msgSend_isValid(self, v6, v7) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, self, CFSTR("CKDMMCSPackageSignatureGenerator.m"), 54, CFSTR("Attempted to update an invalidated signature generator"));

  }
  v21 = v5;
  v12 = objc_msgSend_generator(self, v10, v11);
  v15 = objc_msgSend_bytes(v21, v13, v14);
  v18 = objc_msgSend_length(v21, v16, v17);
  MEMORY[0x1C3B82F48](v12, v15, v18);

}

- (id)dataByFinishingSignature
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend__finishGenerator(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v3, v4, *MEMORY[0x1E0D46918]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dataByFinishingVerificationKey
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  if (self->_usesMMCSV2)
  {
    objc_msgSend__finishGenerator(self, a2, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v3, v4, *MEMORY[0x1E0D46928]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)generator
{
  return self->_generator;
}

- (void)setGenerator:(void *)a3
{
  self->_generator = a3;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatorResults, 0);
}

@end
