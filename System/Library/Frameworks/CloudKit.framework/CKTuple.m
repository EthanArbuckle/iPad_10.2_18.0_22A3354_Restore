@implementation CKTuple

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  id v3;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("Subclass must implement"), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, (uint64_t)self, CFSTR("CKUtils.m"), 2900, CFSTR("Expected to be overridden in subclass"));

  return 0;
}

@end
