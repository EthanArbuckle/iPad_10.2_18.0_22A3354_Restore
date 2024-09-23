@implementation AVCaptionConversionAdjustment

+ (AVCaptionConversionAdjustment)captionConversionAdjustmentWithFigDictionary:(__CFDictionary *)a3
{
  if (objc_msgSend((id)-[__CFDictionary objectForKeyedSubscript:](a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CC3F80]), "longValue") == 1)return (AVCaptionConversionAdjustment *)+[AVCaptionConversionTimeRangeAdjustment captionConversionTimeRangeAdjustmentWithFigDictionary:](AVCaptionConversionTimeRangeAdjustment, "captionConversionTimeRangeAdjustmentWithFigDictionary:", a3);
  else
    return 0;
}

- (AVCaptionConversionAdjustmentType)adjustmentType
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

@end
