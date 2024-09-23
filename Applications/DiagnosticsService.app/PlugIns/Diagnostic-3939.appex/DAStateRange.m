@implementation DAStateRange

- (DAStateRange)initWithDictionary:(id)a3
{
  id v4;
  DAStateRange *v5;
  void *v6;
  void *v7;
  signed int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  signed int v14;
  void *v15;
  unsigned int v16;
  objc_super v18;
  char v19;

  v4 = a3;
  v19 = 0;
  v18.receiver = self;
  v18.super_class = (Class)DAStateRange;
  v5 = -[DASpecification initWithDictionary:](&v18, "initWithDictionary:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_dictionaryFromRequiredKey:failed:", CFSTR("displayAssetRange"), &v19));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("start"), &off_100011120, &off_100011138, &v19));
    v8 = objc_msgSend(v7, "intValue");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("finish"), &off_100011120, &off_100011138, &v19));
    v10 = objc_msgSend(v9, "intValue");

    v5->_displayAssetRange.location = v8;
    v5->_displayAssetRange.length = (int)(v10 - v8 + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_dictionaryFromKey:defaultValue:failed:", CFSTR("transitionAssetRange"), 0, &v19));
    v12 = v11;
    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("start"), &off_100011120, &off_100011138, &v19));
      v14 = objc_msgSend(v13, "intValue");

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("finish"), &off_100011120, &off_100011138, &v19));
      v16 = objc_msgSend(v15, "intValue");

      v5->_transitionAssetRange.location = v14;
      v5->_transitionAssetRange.length = (int)(v16 - v14 + 1);
    }
    else
    {
      v5->_transitionAssetRange.location = 0;
      v5->_transitionAssetRange.length = 0;
    }

    if (v19)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (_NSRange)displayAssetRange
{
  _NSRange *p_displayAssetRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_displayAssetRange = &self->_displayAssetRange;
  location = self->_displayAssetRange.location;
  length = p_displayAssetRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setDisplayAssetRange:(_NSRange)a3
{
  self->_displayAssetRange = a3;
}

- (_NSRange)transitionAssetRange
{
  _NSRange *p_transitionAssetRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_transitionAssetRange = &self->_transitionAssetRange;
  location = self->_transitionAssetRange.location;
  length = p_transitionAssetRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setTransitionAssetRange:(_NSRange)a3
{
  self->_transitionAssetRange = a3;
}

@end
