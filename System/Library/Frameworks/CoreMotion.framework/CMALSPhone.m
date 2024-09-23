@implementation CMALSPhone

- (CMALSPhone)initWithTimestamp:(double)a3 illumination:(float)a4
{
  CMALSPhone *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CMALSPhone;
  v6 = -[CMALSPhone init](&v19, sel_init);
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v6->fTimestamp = (NSNumber *)objc_msgSend_initWithDouble_(v7, v8, v9, v10, v11, a3);
    v12 = objc_alloc(MEMORY[0x1E0CB37E8]);
    *(float *)&v13 = a4;
    v6->fIllumination = (NSNumber *)objc_msgSend_initWithFloat_(v12, v14, v15, v16, v17, v13);
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMALSPhone)initWithCoder:(id)a3
{
  CMALSPhone *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMALSPhone;
  v4 = -[CMALSPhone init](&v12, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->fTimestamp = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCMALSPhoneTimestamp"), v7);
    v8 = objc_opt_class();
    v4->fIllumination = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMALSPhoneIllumination"), v10);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->fTimestamp, (uint64_t)CFSTR("kCMALSPhoneTimestamp"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fIllumination, (uint64_t)CFSTR("kCMALSPhoneIllumination"), v7);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v18 = (_QWORD *)objc_msgSend_init(v9, v10, v11, v12, v13);
  if (v18)
  {
    v18[1] = objc_msgSend_copy(self->fTimestamp, v14, v15, v16, v17);
    v18[2] = objc_msgSend_copy(self->fIllumination, v19, v20, v21, v22);
  }
  return v18;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMALSPhone;
  -[CMALSPhone dealloc](&v3, sel_dealloc);
}

- (NSNumber)timestamp
{
  return self->fTimestamp;
}

- (NSNumber)illumination
{
  return self->fIllumination;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_timestamp(self, v6, v7, v8, v9);
  v15 = objc_msgSend_illumination(self, v11, v12, v13, v14);
  return (id)objc_msgSend_stringWithFormat_(v3, v16, (uint64_t)CFSTR("%@, <timestamp %@, illumination %@>"), v17, v18, v5, v10, v15);
}

@end
