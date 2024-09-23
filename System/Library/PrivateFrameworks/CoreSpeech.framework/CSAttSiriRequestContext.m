@implementation CSAttSiriRequestContext

- (CSAttSiriRequestContext)initWithRequestSource:(unint64_t)a3
{
  CSAttSiriRequestContext *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSAttSiriRequestContext;
  result = -[CSAttSiriRequestContext init](&v5, sel_init);
  if (result)
    result->_reqSrc = a3;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_reqSrc, CFSTR("CSAttSiriRequestSourceKey"));
}

- (CSAttSiriRequestContext)initWithCoder:(id)a3
{
  id v4;
  CSAttSiriRequestContext *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CSAttSiriRequestContext;
  v5 = -[CSAttSiriRequestContext init](&v7, sel_init);
  if (v5)
    v5->_reqSrc = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CSAttSiriRequestSourceKey"));

  return v5;
}

- (id)description
{
  unint64_t v2;

  v2 = self->_reqSrc - 1;
  if (v2 > 2)
    return CFSTR("SiriFollowupforIdleAndQuiet");
  else
    return off_1E7C25D08[v2];
}

- (unint64_t)reqSrc
{
  return self->_reqSrc;
}

- (void)setReqSrc:(unint64_t)a3
{
  self->_reqSrc = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
