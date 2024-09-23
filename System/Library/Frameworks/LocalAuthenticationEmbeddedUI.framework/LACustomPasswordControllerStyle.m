@implementation LACustomPasswordControllerStyle

- (_QWORD)initWithStyle:(_QWORD *)result
{
  objc_super v3;

  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)LACustomPasswordControllerStyle;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result)
      result[1] = a2;
  }
  return result;
}

+ (LACustomPasswordControllerStyle)sheetStyle
{
  LACustomPasswordControllerStyle *v2;
  objc_super v4;

  v2 = [LACustomPasswordControllerStyle alloc];
  if (v2)
  {
    v4.receiver = v2;
    v4.super_class = (Class)LACustomPasswordControllerStyle;
    v2 = objc_msgSendSuper2(&v4, sel_init);
    if (v2)
      v2->_rawValue = 0;
  }
  return v2;
}

+ (LACustomPasswordControllerStyle)fullScreenStyle
{
  LACustomPasswordControllerStyle *v2;
  objc_super v4;

  v2 = [LACustomPasswordControllerStyle alloc];
  if (v2)
  {
    v4.receiver = v2;
    v4.super_class = (Class)LACustomPasswordControllerStyle;
    v2 = objc_msgSendSuper2(&v4, sel_init);
    if (v2)
      v2->_rawValue = 1;
  }
  return v2;
}

- (unint64_t)rawValue
{
  return self->_rawValue;
}

@end
