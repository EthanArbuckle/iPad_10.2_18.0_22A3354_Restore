@implementation CLMiLoDebugResponse

- (CLMiLoDebugResponse)initWithExportDatabaseTablesResult:(id)a3 requestIdentifier:(id)a4 error:(id)a5
{
  CLMiLoDebugResponse *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLMiLoDebugResponse;
  v8 = -[CLMiLoDebugResponse init](&v10, sel_init);
  if (v8)
  {
    v8->_exportDatabaseTablesResult = (CLMiLoExportDatabaseTableResult *)a3;
    v8->_requestIdentifier = (NSUUID *)a4;
    v8->_error = (NSError *)a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMiLoDebugResponse;
  -[CLMiLoDebugResponse dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = (void *)objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  return (id)MEMORY[0x1E0DE7D20](v8, sel_initWithExportDatabaseTablesResult_requestIdentifier_error_, self->_exportDatabaseTablesResult, self->_requestIdentifier);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoDebugResponse)initWithCoder:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;

  v5 = objc_opt_class();
  v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyExportDatabaseTableResult"));
  v8 = objc_opt_class();
  v10 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyDebugRequestIdentifier"));
  v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyDebugRequestError"));
  return (CLMiLoDebugResponse *)MEMORY[0x1E0DE7D20](self, sel_initWithExportDatabaseTablesResult_requestIdentifier_error_, v7, v10);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  const char *v6;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_exportDatabaseTablesResult, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyExportDatabaseTableResult"));
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_requestIdentifier, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyDebugRequestIdentifier"));
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->_error, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyDebugRequestError"));
}

- (CLMiLoExportDatabaseTableResult)exportDatabaseTablesResult
{
  return self->_exportDatabaseTablesResult;
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSError)error
{
  return self->_error;
}

@end
