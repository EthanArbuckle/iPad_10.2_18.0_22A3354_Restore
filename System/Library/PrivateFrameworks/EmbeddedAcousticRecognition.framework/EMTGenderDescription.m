@implementation EMTGenderDescription

- (EMTGenderDescription)initWithGender:(unint64_t)a3 defaultGender:(unint64_t)a4
{
  EMTGenderDescription *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EMTGenderDescription;
  result = -[EMTGenderDescription init](&v7, sel_init);
  if (result)
  {
    result->_gender = a3;
    result->_defaultGender = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t gender;
  unint64_t defaultGender;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    gender = self->_gender;
    if (gender == objc_msgSend(v5, "gender"))
    {
      defaultGender = self->_defaultGender;
      v8 = defaultGender == objc_msgSend(v5, "defaultGender");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)gender
{
  return self->_gender;
}

- (unint64_t)defaultGender
{
  return self->_defaultGender;
}

@end
