@implementation ANSTEyeBlinkEstimate

+ (id)new
{
  id result;

  result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTEyeBlinkEstimate)init
{
  ANSTEyeBlinkEstimate *result;

  result = (ANSTEyeBlinkEstimate *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTEyeBlinkEstimate)initWithBlinkLeft:(int64_t)a3 blinkRight:(int64_t)a4
{
  ANSTEyeBlinkEstimate *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ANSTEyeBlinkEstimate;
  result = -[ANSTEyeBlinkEstimate init](&v7, sel_init);
  result->_blinkLeft = a3;
  result->_blinkRight = a4;
  return result;
}

- (ANSTEyeBlinkEstimate)initWithCoder:(id)a3
{
  id v4;
  ANSTEyeBlinkEstimate *v5;
  ANSTEyeBlinkEstimate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ANSTEyeBlinkEstimate;
  v5 = -[ANSTEyeBlinkEstimate init](&v8, sel_init);
  if (sub_2358E124C(v4, &v5->_blinkLeft, sel_blinkLeft) && sub_2358E124C(v4, &v5->_blinkRight, sel_blinkRight))
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t blinkLeft;
  id v5;

  blinkLeft = self->_blinkLeft;
  v5 = a3;
  sub_2358E1360(v5, blinkLeft, sel_blinkLeft);
  sub_2358E1360(v5, self->_blinkRight, sel_blinkRight);

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
  const char *v8;
  uint64_t v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend_appendFormat_(v3, v4, (uint64_t)CFSTR("<ANSTEyeBlinkEstimate %p> {\n"), self);
  objc_msgSend_appendFormat_(v3, v5, (uint64_t)CFSTR("    blinkLeft  %ld\n"), self->_blinkLeft);
  objc_msgSend_appendFormat_(v3, v6, (uint64_t)CFSTR("    blinkRight %ld\n"), self->_blinkRight);
  objc_msgSend_appendString_(v3, v7, (uint64_t)CFSTR("}"));
  v10 = (void *)objc_msgSend_copy(v3, v8, v9);

  return v10;
}

- (int64_t)blinkLeft
{
  return self->_blinkLeft;
}

- (int64_t)blinkRight
{
  return self->_blinkRight;
}

@end
