@implementation CLMiLoServicePredictionLocationSimilarityList

- (CLMiLoServicePredictionLocationSimilarityList)initWithPlaces:(id)a3
{
  CLMiLoServicePredictionLocationSimilarityList *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLMiLoServicePredictionLocationSimilarityList;
  v4 = -[CLMiLoServicePredictionLocationSimilarityList init](&v6, sel_init);
  if (v4)
    v4->_places = (NSArray *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMiLoServicePredictionLocationSimilarityList;
  -[CLMiLoServicePredictionLocationSimilarityList dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = (void *)objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  return (id)MEMORY[0x1E0DE7D20](v8, sel_initWithPlaces_, self->_places, v9);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoServicePredictionLocationSimilarityList)initWithCoder:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v10 = objc_msgSend_setWithObjects_(v5, v8, v6, v9, v7, 0);
  v12 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v11, v10, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeySimilarityListPlaces"));
  return (CLMiLoServicePredictionLocationSimilarityList *)MEMORY[0x1E0DE7D20](self, sel_initWithPlaces_, v12, v13);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_places, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeySimilarityListPlaces"));
}

- (NSArray)places
{
  return self->_places;
}

@end
