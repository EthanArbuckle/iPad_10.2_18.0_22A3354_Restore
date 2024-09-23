@implementation _CLVLLocalizationDebugInfo

- (_CLVLLocalizationDebugInfo)initWithVLLocalizationDebugInfo:(id)a3
{
  _CLVLLocalizationDebugInfo *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CLVLLocalizationDebugInfo;
  result = -[_CLVLLocalizationDebugInfo init](&v5, sel_init);
  if (result)
  {
    if (a3)
    {
      result->_maps488Details = 0;
    }
    else
    {

      return 0;
    }
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CLVLLocalizationDebugInfo;
  -[_CLVLLocalizationDebugInfo dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  const char *v13;
  uint64_t v14;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = (_QWORD *)objc_msgSend_init(v8, v9, v10, v11);
  v12[1] = objc_msgSend_copyWithZone_(self->_maps488Details, v13, (uint64_t)a3, v14);
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CLVLLocalizationDebugInfo)initWithCoder:(id)a3
{
  _CLVLLocalizationDebugInfo *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_CLVLLocalizationDebugInfo;
  result = -[_CLVLLocalizationDebugInfo init](&v4, sel_init, a3);
  if (result)
    result->_maps488Details = 0;
  return result;
}

- (id)description
{
  return (id)objc_msgSend_descriptionWithMemberIndent_endIndent_(self, a2, (uint64_t)CFSTR("\t"), (uint64_t)&stru_1E2993188);
}

- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4
{
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;

  v7 = objc_msgSend_stringByAppendingString_(a3, a2, (uint64_t)CFSTR("\t"), (uint64_t)a4);
  v10 = objc_msgSend_stringByAppendingString_(a4, v8, (uint64_t)CFSTR("\t"), v9);
  v11 = (void *)MEMORY[0x1E0CB3940];
  v15 = (void *)objc_msgSend_maps488Details(self, v12, v13, v14);
  v17 = objc_msgSend_descriptionWithMemberIndent_endIndent_(v15, v16, v7, v10);
  return (id)objc_msgSend_stringWithFormat_(v11, v18, (uint64_t)CFSTR("<_CLVLLocalizationDebugInfo: %p> {\n%@.maps488Details = %@\n%@}"), v19, self, a3, v17, a4);
}

- (_CLVLLocalizationMaps488Details)maps488Details
{
  return self->_maps488Details;
}

- (void)setMaps488Details:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
