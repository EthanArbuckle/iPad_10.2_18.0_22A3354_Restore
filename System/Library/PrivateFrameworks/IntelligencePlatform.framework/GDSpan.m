@implementation GDSpan

- (GDSpan)initWithText:(id)a3 start:(int64_t)a4 end:(int64_t)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  GDSpan *v11;
  uint64_t v12;
  NSString *text;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GDSpan;
  v11 = -[GDSpan init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend_copy(v8, v9, v10);
    text = v11->_text;
    v11->_text = (NSString *)v12;

    v11->_range.location = a4;
    v11->_range.length = a5 - a4;
  }

  return v11;
}

- (GDSpan)initWithText:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  const char *v8;
  uint64_t v9;
  GDSpan *v10;
  uint64_t v11;
  NSString *text;
  objc_super v14;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GDSpan;
  v10 = -[GDSpan init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend_copy(v7, v8, v9);
    text = v10->_text;
    v10->_text = (NSString *)v11;

    v10->_range.location = location;
    v10->_range.length = length;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *text;
  id v5;
  void *v6;
  const char *v7;
  const char *v8;
  void *v9;
  const char *v10;
  id v11;

  text = self->_text;
  v5 = a3;
  NSStringFromSelector(sel_text);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)text, v6);

  objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], v8, self->_range.location, self->_range.length);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_range);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)v11, v9);

}

- (GDSpan)initWithCoder:(id)a3
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
  uint64_t v17;
  const char *v18;
  GDSpan *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_text);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v11 = objc_opt_class();
    NSStringFromSelector(sel_range);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v17 = objc_msgSend_rangeValue(v14, v15, v16);
      self = (GDSpan *)(id)objc_msgSend_initWithText_range_(self, v18, (uint64_t)v8, v17, v18);
      v19 = self;
LABEL_11:

      goto LABEL_12;
    }
    objc_msgSend_error(v4, v15, v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v34 = *MEMORY[0x1E0CB2D50];
      v35 = CFSTR("GDSpan range is nil");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v23, (uint64_t)&v35, &v34, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v24, v26, (uint64_t)CFSTR("GDErrorDomain"), 9, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v28, (uint64_t)v27);

    }
    v14 = 0;
LABEL_10:
    v19 = 0;
    goto LABEL_11;
  }
  objc_msgSend_error(v4, v9, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v36 = *MEMORY[0x1E0CB2D50];
    v37[0] = CFSTR("GDSpan text is nil");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v21, (uint64_t)v37, &v36, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v29, v30, (uint64_t)CFSTR("GDErrorDomain"), 9, v14);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v32, (uint64_t)v31);

    goto LABEL_10;
  }
  v19 = 0;
LABEL_12:

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  return (id)objc_msgSend_initWithText_range_(v7, v8, (uint64_t)self->_text, self->_range.location, self->_range.length);
}

- (id)description
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;

  v4 = objc_msgSend_range(self, a2, v2);
  objc_msgSend_range(self, v5, v6);
  v8 = &v7[v4];
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_text(self, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_text(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_range(self, v15, v16);
  objc_msgSend_substringWithRange_(v14, v18, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_range(self, v20, v21);
  objc_msgSend_stringWithFormat_(v9, v23, (uint64_t)CFSTR("<GDSpan: text: %@, range: %@ [%tu, %tu)>"), v11, v19, v22, v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (NSString)text
{
  return self->_text;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
