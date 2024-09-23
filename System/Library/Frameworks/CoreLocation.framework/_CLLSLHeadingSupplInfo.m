@implementation _CLLSLHeadingSupplInfo

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CLLSLHeadingSupplInfo;
  -[_CLLSLHeadingSupplInfo dealloc](&v3, sel_dealloc);
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
  _QWORD *v12;
  const char *v13;
  uint64_t v14;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = (_QWORD *)objc_msgSend_init(v8, v9, v10, v11);
  v12[1] = objc_msgSend_copyWithZone_(self->_roadSegment, v13, (uint64_t)a3, v14);
  return v12;
}

- (_CLLSLHeadingSupplInfo)initWithCoder:(id)a3
{
  _CLLSLHeadingSupplInfo *v4;
  uint64_t v5;
  const char *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_CLLSLHeadingSupplInfo;
  v4 = -[_CLLSLHeadingSupplInfo init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_roadSegment = (_CLLSLMapRoadSegment *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("roadSegment"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_roadSegment, (uint64_t)CFSTR("roadSegment"));
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
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (void *)objc_msgSend_roadSegment(self, a2, (uint64_t)a3, (uint64_t)a4);
  v11 = objc_msgSend_stringByAppendingString_(a3, v9, (uint64_t)CFSTR("\t"), v10);
  v14 = objc_msgSend_stringByAppendingString_(a4, v12, (uint64_t)CFSTR("\t"), v13);
  v16 = objc_msgSend_descriptionWithMemberIndent_endIndent_(v8, v15, v11, v14);
  return (id)objc_msgSend_stringWithFormat_(v7, v17, (uint64_t)CFSTR("<_CLLSLHeadingSupplInfo: %p> {\n%@.roadSegment = %@\n%@}"), v18, self, a3, v16, a4);
}

- (_CLLSLMapRoadSegment)roadSegment
{
  return self->_roadSegment;
}

- (void)setRoadSegment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
