@implementation CLMiLoExportDatabaseTableResult

- (CLMiLoExportDatabaseTableResult)initWithExportDir:(id)a3 fileName:(id)a4 sandboxExtensionTok:(id)a5
{
  CLMiLoExportDatabaseTableResult *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLMiLoExportDatabaseTableResult;
  v8 = -[CLMiLoExportDatabaseTableResult init](&v10, sel_init);
  if (v8)
  {
    v8->_exportDir = (NSString *)a3;
    v8->_fileName = (NSString *)a4;
    v8->_sandboxExtensionTok = (NSString *)a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMiLoExportDatabaseTableResult;
  -[CLMiLoExportDatabaseTableResult dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = (void *)objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  return (id)MEMORY[0x1E0DE7D20](v8, sel_initWithExportDir_fileName_sandboxExtensionTok_, self->_exportDir, self->_fileName);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoExportDatabaseTableResult)initWithCoder:(id)a3
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
  v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyExportDatabaseTableResultExportDir"));
  v8 = objc_opt_class();
  v10 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyExportDatabaseTableResultFileName"));
  v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyExportDatabaseTableResultsandboxExtensionTok"));
  return (CLMiLoExportDatabaseTableResult *)MEMORY[0x1E0DE7D20](self, sel_initWithExportDir_fileName_sandboxExtensionTok_, v7, v10);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  const char *v6;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_exportDir, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyExportDatabaseTableResultExportDir"));
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_fileName, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyExportDatabaseTableResultFileName"));
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->_sandboxExtensionTok, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyExportDatabaseTableResultsandboxExtensionTok"));
}

- (NSString)exportDir
{
  return self->_exportDir;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (NSString)sandboxExtensionTok
{
  return self->_sandboxExtensionTok;
}

@end
