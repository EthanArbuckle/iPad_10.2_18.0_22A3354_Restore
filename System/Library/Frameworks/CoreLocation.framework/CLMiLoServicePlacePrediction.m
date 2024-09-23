@implementation CLMiLoServicePlacePrediction

- (CLMiLoServicePlacePrediction)initWithPlaces:(id)a3 serviceType:(unint64_t)a4
{
  CLMiLoServicePlacePrediction *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLMiLoServicePlacePrediction;
  v6 = -[CLMiLoServicePlacePrediction init](&v8, sel_init);
  if (v6)
  {
    v6->_places = (NSArray *)a3;
    v6->_serviceType = a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMiLoServicePlacePrediction;
  -[CLMiLoServicePlacePrediction dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = (void *)objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  return (id)MEMORY[0x1E0DE7D20](v8, sel_initWithPlaces_serviceType_, self->_places, self->_serviceType);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoServicePlacePrediction)initWithCoder:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v10 = objc_msgSend_setWithObjects_(v5, v8, v6, v9, v7, 0);
  v12 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v11, v10, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPlacePredictionPlaces"));
  v15 = objc_msgSend_decodeIntegerForKey_(a3, v13, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPlacePredictionServiceType"), v14);
  return (CLMiLoServicePlacePrediction *)MEMORY[0x1E0DE7D20](self, sel_initWithPlaces_serviceType_, v12, v15);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_places, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPlacePredictionPlaces"));
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->_serviceType, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyPlacePredictionServiceType"));
}

- (NSArray)places
{
  return self->_places;
}

- (unint64_t)serviceType
{
  return self->_serviceType;
}

@end
