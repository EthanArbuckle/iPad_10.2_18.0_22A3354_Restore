@implementation ANSTSmileEstimate

+ (id)new
{
  id result;

  result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTSmileEstimate)init
{
  ANSTSmileEstimate *result;

  result = (ANSTSmileEstimate *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTSmileEstimate)initWithSmile:(int64_t)a3
{
  ANSTSmileEstimate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ANSTSmileEstimate;
  result = -[ANSTSmileEstimate init](&v5, sel_init);
  result->_smile = a3;
  return result;
}

- (ANSTSmileEstimate)initWithCoder:(id)a3
{
  id v3;
  ANSTSmileEstimate *v4;
  _BOOL4 v5;
  ANSTSmileEstimate *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ANSTSmileEstimate;
  v3 = a3;
  v4 = -[ANSTSmileEstimate init](&v8, sel_init);
  v5 = sub_2358E124C(v3, &v4->_smile, sel_smile);

  if (v5)
    v6 = v4;
  else
    v6 = 0;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  sub_2358E1360(a3, self->_smile, sel_smile);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend_appendFormat_(v3, v4, (uint64_t)CFSTR("<ANSTSmileEstimate %p> {\n"), self);
  objc_msgSend_appendFormat_(v3, v5, (uint64_t)CFSTR("    smile %ld\n"), self->_smile);
  objc_msgSend_appendString_(v3, v6, (uint64_t)CFSTR("}"));
  v9 = (void *)objc_msgSend_copy(v3, v7, v8);

  return v9;
}

- (int64_t)smile
{
  return self->_smile;
}

@end
