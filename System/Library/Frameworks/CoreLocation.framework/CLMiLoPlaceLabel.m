@implementation CLMiLoPlaceLabel

- (CLMiLoPlaceLabel)initWithPlaceIdentifier:(id)a3 placeAdditionalInformation:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  CLMiLoPlaceLabel *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CLMiLoPlaceLabel;
  v9 = -[CLMiLoPlaceLabel init](&v14, sel_init);
  if (v9)
  {
    v9->_placeIdentifier = (NSUUID *)objc_msgSend_copy(a3, v6, v7, v8);
    v9->_placeAdditionalInformation = (NSString *)objc_msgSend_copy(a4, v10, v11, v12);
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMiLoPlaceLabel;
  -[CLMiLoPlaceLabel dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = (void *)objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  return (id)MEMORY[0x1E0DE7D20](v8, sel_initWithPlaceIdentifier_placeAdditionalInformation_, self->_placeIdentifier, self->_placeAdditionalInformation);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoPlaceLabel)initWithCoder:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  v5 = objc_opt_class();
  v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyLocationPlaceIdentifier"));
  v8 = objc_opt_class();
  v10 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyLocationPlaceAdditionalInformation"));
  return (CLMiLoPlaceLabel *)MEMORY[0x1E0DE7D20](self, sel_initWithPlaceIdentifier_placeAdditionalInformation_, v7, v10);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_placeIdentifier, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyLocationPlaceIdentifier"));
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_placeAdditionalInformation, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyLocationPlaceAdditionalInformation"));
}

- (NSUUID)placeIdentifier
{
  return self->_placeIdentifier;
}

- (NSString)placeAdditionalInformation
{
  return self->_placeAdditionalInformation;
}

@end
