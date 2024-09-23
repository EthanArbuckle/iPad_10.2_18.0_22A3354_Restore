@implementation CLMiLoServiceDescriptor

- (CLMiLoServiceDescriptor)initWithServiceIdentifier:(id)a3 serviceType:(unint64_t)a4 locationTypes:(id)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CLMiLoServiceDescriptor *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CLMiLoServiceDescriptor;
  v11 = -[CLMiLoServiceDescriptor init](&v13, sel_init);
  if (v11)
  {
    v11->_serviceIdentifier = (NSUUID *)objc_msgSend_copy(a3, v8, v9, v10);
    v11->_serviceType = a4;
    v11->_locationTypes = (NSArray *)a5;
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMiLoServiceDescriptor;
  -[CLMiLoServiceDescriptor dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = (void *)objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  return (id)MEMORY[0x1E0DE7D20](v8, sel_initWithServiceIdentifier_serviceType_locationTypes_, self->_serviceIdentifier, self->_serviceType);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoServiceDescriptor)initWithCoder:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;

  v5 = objc_opt_class();
  v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyServiceIdentifier"));
  v10 = objc_msgSend_decodeIntegerForKey_(a3, v8, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyServiceType"), v9);
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v16 = objc_msgSend_setWithObjects_(v11, v14, v12, v15, v13, 0);
  objc_msgSend_decodeObjectOfClasses_forKey_(a3, v17, v16, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyLocationTypeArray"));
  return (CLMiLoServiceDescriptor *)MEMORY[0x1E0DE7D20](self, sel_initWithServiceIdentifier_serviceType_locationTypes_, v7, v10);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  const char *v6;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_serviceIdentifier, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyServiceIdentifier"));
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->_serviceType, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyServiceType"));
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->_locationTypes, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyLocationTypeArray"));
}

- (NSUUID)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (unint64_t)serviceType
{
  return self->_serviceType;
}

- (NSArray)locationTypes
{
  return self->_locationTypes;
}

@end
