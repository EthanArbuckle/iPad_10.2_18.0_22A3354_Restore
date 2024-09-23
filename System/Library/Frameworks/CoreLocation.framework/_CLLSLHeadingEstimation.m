@implementation _CLLSLHeadingEstimation

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CLLSLHeadingEstimation;
  -[_CLLSLHeadingEstimation dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  *(_DWORD *)(v12 + 8) = self->_status;
  *(_QWORD *)(v12 + 16) = objc_msgSend_copyWithZone_(self->_headings, v13, (uint64_t)a3, v14);
  return (id)v12;
}

- (_CLLSLHeadingEstimation)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  _CLLSLHeadingEstimation *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_CLLSLHeadingEstimation;
  v6 = -[_CLLSLHeadingEstimation init](&v15, sel_init);
  if (v6)
  {
    v6->_status = objc_msgSend_decodeIntForKey_(a3, v4, (uint64_t)CFSTR("status"), v5);
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v12 = objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    v6->_headings = (NSArray *)(id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v13, v12, (uint64_t)CFSTR("headings"));
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;

  objc_msgSend_encodeInt_forKey_(a3, a2, self->_status, (uint64_t)CFSTR("status"));
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_headings, (uint64_t)CFSTR("headings"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend_descriptionWithMemberIndent_endIndent_(self, a2, (uint64_t)CFSTR("\t"), (uint64_t)&stru_1E2993188);
}

- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v62;

  v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v7 = (void *)MEMORY[0x1E0CB3940];
  v11 = objc_msgSend_headings(self, v8, v9, v10);
  v14 = objc_msgSend_stringWithFormat_(v7, v12, (uint64_t)CFSTR("<NSArray: %p> {\n"), v13, v11);
  objc_msgSend_appendString_(v6, v15, v14, v16);
  v20 = (void *)objc_msgSend_headings(self, v17, v18, v19);
  v24 = objc_msgSend_count(v20, v21, v22, v23);
  if (v24)
  {
    v28 = v24;
    v29 = 0;
    v62 = v24 - 1;
    do
    {
      v30 = (void *)MEMORY[0x1E0CB3940];
      v31 = (void *)objc_msgSend_headings(self, v25, v26, v27);
      v34 = (void *)objc_msgSend_objectAtIndex_(v31, v32, v29, v33);
      v37 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v35, (uint64_t)CFSTR("%@\t\t"), v36, a3);
      v40 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v38, (uint64_t)CFSTR("%@\t\t"), v39, a4);
      v42 = objc_msgSend_descriptionWithMemberIndent_endIndent_(v34, v41, v37, v40);
      v45 = objc_msgSend_stringWithFormat_(v30, v43, (uint64_t)CFSTR("%@%@%@"), v44, a3, CFSTR("\t"), v42);
      objc_msgSend_appendString_(v6, v46, v45, v47);
      v50 = v29 + 1;
      if (v62 == v29)
        objc_msgSend_appendString_(v6, v48, (uint64_t)CFSTR("\n"), v49);
      else
        objc_msgSend_appendString_(v6, v48, (uint64_t)CFSTR(",\n"), v49);
      ++v29;
    }
    while (v28 != v50);
  }
  v51 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v25, (uint64_t)CFSTR("%@}"), v27, a3);
  objc_msgSend_appendString_(v6, v52, v51, v53);
  v54 = (void *)MEMORY[0x1E0CB3940];
  v58 = objc_msgSend_status(self, v55, v56, v57);
  return (id)objc_msgSend_stringWithFormat_(v54, v59, (uint64_t)CFSTR("<_CLLSLHeadingEstimation: %p> {\n%@.status = %d,\n%@.headings = %@\n%@}"), v60, self, a3, v58, a3, v6, a4);
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (NSArray)headings
{
  return self->_headings;
}

- (void)setHeadings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
