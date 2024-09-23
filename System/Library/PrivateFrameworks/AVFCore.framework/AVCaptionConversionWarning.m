@implementation AVCaptionConversionWarning

+ (AVCaptionConversionWarning)captionConversionWarningWithFigDictionary:(__CFDictionary *)a3
{
  return (AVCaptionConversionWarning *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFigDictionary:", a3);
}

- (AVCaptionConversionWarning)initWithFigDictionary:(__CFDictionary *)a3
{
  AVCaptionConversionWarning *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVCaptionConversionWarning;
  v4 = -[AVCaptionConversionWarning init](&v6, sel_init);
  if (v4)
    v4->_warningInternal = (void *)-[__CFDictionary copy](a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptionConversionWarning;
  -[AVCaptionConversionWarning dealloc](&v3, sel_dealloc);
}

- (AVCaptionConversionWarningType)warningType
{
  if (objc_msgSend((id)objc_msgSend(self->_warningInternal, "objectForKeyedSubscript:", *MEMORY[0x1E0CC3FC0]), "longValue") == 1)return (AVCaptionConversionWarningType)CFSTR("AVCaptionConversionWarningTypeExcessMediaData");
  else
    return 0;
}

- (NSRange)rangeOfCaptions
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSRange result;

  v2 = (void *)objc_msgSend(self->_warningInternal, "objectForKeyedSubscript:", *MEMORY[0x1E0CC3FB8]);
  v3 = objc_msgSend((id)objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CC3F90]), "integerValue");
  v4 = objc_msgSend((id)objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CC3F88]), "integerValue");
  v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (AVCaptionConversionAdjustment)adjustment
{
  return +[AVCaptionConversionAdjustment captionConversionAdjustmentWithFigDictionary:](AVCaptionConversionAdjustment, "captionConversionAdjustmentWithFigDictionary:", objc_msgSend(self->_warningInternal, "objectForKeyedSubscript:", *MEMORY[0x1E0CC3FB0]));
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  AVCaptionConversionAdjustment *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  objc_class *v12;
  uint64_t v14;

  if (description_createWarningTypeMappingOnce != -1)
    dispatch_once(&description_createWarningTypeMappingOnce, &__block_literal_global_0);
  v3 = objc_msgSend((id)description_warningMapping, "objectForKeyedSubscript:", -[AVCaptionConversionWarning warningType](self, "warningType"));
  v4 = -[AVCaptionConversionWarning rangeOfCaptions](self, "rangeOfCaptions");
  v6 = v5;
  v7 = -[AVCaptionConversionWarning adjustment](self, "adjustment");
  if (v6 < 2)
    v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" = %lu"), v4, v14);
  else
    v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("es = (%lu-%lu)"), v4, v6 + v4 - 1);
  v9 = v8;
  if (v7)
    v10 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("adjustment = %@"), v7);
  else
    v10 = CFSTR("no remedial adjusment available; caption must be omitted during conversion");
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p, warning = \"%@\", caption index%@, %@"), NSStringFromClass(v12), self, v3, v9, v10);
}

id __41__AVCaptionConversionWarning_description__block_invoke()
{
  id result;
  const __CFString *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v1 = CFSTR("AVCaptionConversionWarningTypeExcessMediaData");
  v2[0] = CFSTR("excess media data");
  result = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, &v1, 1);
  description_warningMapping = (uint64_t)result;
  return result;
}

@end
