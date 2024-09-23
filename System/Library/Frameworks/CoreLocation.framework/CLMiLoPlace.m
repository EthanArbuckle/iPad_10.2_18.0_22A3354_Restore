@implementation CLMiLoPlace

- (CLMiLoPlace)initWithPlaceIdentifier:(id)a3 score:(id)a4 confidence:(unint64_t)a5 placeMetadata:(id)a6
{
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CLMiLoPlace *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CLMiLoPlace;
  v13 = -[CLMiLoPlace init](&v18, sel_init);
  if (v13)
  {
    v13->_identifier = (NSUUID *)objc_msgSend_copy(a3, v10, v11, v12);
    v13->_score = (NSNumber *)objc_msgSend_copy(a4, v14, v15, v16);
    v13->_confidence = a5;
    v13->_metadata = (CLMiLoPlaceMetadata *)a6;
  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMiLoPlace;
  -[CLMiLoPlace dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = (void *)objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  return (id)MEMORY[0x1E0DE7D20](v8, sel_initWithPlaceIdentifier_score_confidence_placeMetadata_, self->_identifier, self->_score);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoPlace)initWithCoder:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;

  v5 = objc_opt_class();
  v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyMiLoPlaceIdenfifier"));
  v8 = objc_opt_class();
  v10 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPlaceScore"));
  objc_msgSend_decodeIntegerForKey_(a3, v11, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPlaceConfidenceEnum"), v12);
  v13 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPlaceMetadata"));
  return (CLMiLoPlace *)MEMORY[0x1E0DE7D20](self, sel_initWithPlaceIdentifier_score_confidence_placeMetadata_, v7, v10);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  const char *v6;
  const char *v7;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_identifier, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyMiLoPlaceIdenfifier"));
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_score, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPlaceScore"));
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->_confidence, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPlaceConfidenceEnum"));
  objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->_metadata, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPlaceMetadata"));
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSNumber)score
{
  return self->_score;
}

- (unint64_t)confidence
{
  return self->_confidence;
}

- (CLMiLoPlaceMetadata)metadata
{
  return self->_metadata;
}

@end
