@implementation GDEntitySimilarityResult

- (GDEntitySimilarityResult)initWithRequest:(id)a3 similarityScore:(double)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  GDEntitySimilarityResult *v9;
  uint64_t v10;
  GDEntitySimilarityRequest *request;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GDEntitySimilarityResult;
  v9 = -[GDEntitySimilarityResult init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend_copy(v6, v7, v8);
    request = v9->_request;
    v9->_request = (GDEntitySimilarityRequest *)v10;

    v9->_similarityScore = a4;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  double similarityScore;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  GDEntitySimilarityRequest *request;
  const char *v13;
  id v14;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  similarityScore = self->_similarityScore;
  v6 = a3;
  objc_msgSend_numberWithDouble_(v4, v7, v8, similarityScore);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_similarityScore);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v11, (uint64_t)v9, v10);

  request = self->_request;
  NSStringFromSelector(sel_request);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v13, (uint64_t)request, v14);

}

- (GDEntitySimilarityResult)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  double v18;
  const char *v19;
  GDEntitySimilarityResult *v20;
  void *v21;
  const char *v22;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_request);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v11 = objc_opt_class();
    NSStringFromSelector(sel_similarityScore);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v14, v15, v16);
    v18 = v17;

    self = (GDEntitySimilarityResult *)(id)objc_msgSend_initWithRequest_similarityScore_(self, v19, (uint64_t)v8, v18);
    v20 = self;
  }
  else
  {
    objc_msgSend_error(v4, v9, v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2D50];
      v30[0] = CFSTR("GDEntitySimilarityRequest is nil");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v22, (uint64_t)v30, &v29, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v23, v25, (uint64_t)CFSTR("GDErrorDomain"), 9, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v27, (uint64_t)v26);

    }
    v20 = 0;
  }

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  return (id)objc_msgSend_initWithRequest_similarityScore_(v7, v8, (uint64_t)self->_request, self->_similarityScore);
}

- (id)description
{
  id v3;
  const char *v4;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  return (id)objc_msgSend_initWithFormat_(v3, v4, (uint64_t)CFSTR("GDEntitySimilarityResult<similarityScore: %f, request: %@>"), *(_QWORD *)&self->_similarityScore, self->_request);
}

- (GDEntitySimilarityRequest)request
{
  return self->_request;
}

- (double)similarityScore
{
  return self->_similarityScore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
