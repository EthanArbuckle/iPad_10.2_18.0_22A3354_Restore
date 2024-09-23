@implementation CKPredicateValidator

+ (id)sharedValidator
{
  if (qword_1ECD96F10 != -1)
    dispatch_once(&qword_1ECD96F10, &unk_1E1F58AD8);
  return (id)qword_1ECD96F08;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  CKException *v6;
  const char *v7;
  id v8;
  objc_super v9;

  if ((id)objc_opt_class() == a1)
  {
    v6 = [CKException alloc];
    v8 = (id)objc_msgSend_initWithCode_format_(v6, v7, 12, (uint64_t)CFSTR("This is an abstract class. Use +sharedValidator instead"));
    objc_exception_throw(v8);
  }
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___CKPredicateValidator;
  return objc_msgSendSuper2(&v9, sel_allocWithZone_, a3);
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  id v4;
  CKException *v5;
  const char *v6;
  id v7;

  v4 = a3;
  v5 = [CKException alloc];
  v7 = (id)objc_msgSend_initWithCode_format_(v5, v6, 12, (uint64_t)CFSTR("This method must be overridden"));
  objc_exception_throw(v7);
}

@end
