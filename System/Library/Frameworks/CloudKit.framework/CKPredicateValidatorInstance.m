@implementation CKPredicateValidatorInstance

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKPredicateValidatorInstance *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  void *v6;
  const char *v7;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, (uint64_t)self, CFSTR("CKObjectValidator.m"), 111, CFSTR("Validate must be called on subclass"));

  return 0;
}

@end
