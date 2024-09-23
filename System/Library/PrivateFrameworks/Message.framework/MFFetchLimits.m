@implementation MFFetchLimits

- (MFFetchLimits)init
{
  MFFetchLimits *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFFetchLimits;
  result = -[MFFetchLimits init](&v3, sel_init);
  if (result)
  {
    *(int64x2_t *)&result->_fetchMinBytes = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    result->_minBytesLeft = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> min=%lu, max=%lu, remaining=%lu"), objc_opt_class(), self, self->_fetchMinBytes, self->_fetchMaxBytes, self->_minBytesLeft);
}

- (unint64_t)fetchMinBytes
{
  return self->_fetchMinBytes;
}

- (void)setFetchMinBytes:(unint64_t)a3
{
  self->_fetchMinBytes = a3;
}

- (unint64_t)fetchMaxBytes
{
  return self->_fetchMaxBytes;
}

- (void)setFetchMaxBytes:(unint64_t)a3
{
  self->_fetchMaxBytes = a3;
}

- (unint64_t)minBytesLeft
{
  return self->_minBytesLeft;
}

- (void)setMinBytesLeft:(unint64_t)a3
{
  self->_minBytesLeft = a3;
}

@end
