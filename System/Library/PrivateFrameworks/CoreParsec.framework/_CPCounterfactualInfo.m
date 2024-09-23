@implementation _CPCounterfactualInfo

- (BOOL)readFrom:(id)a3
{
  return _CPCounterfactualInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  int v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[_CPCounterfactualInfo cfDiffered](self, "cfDiffered"))
    PBDataWriterWriteBOOLField();
  if (-[_CPCounterfactualInfo cfUsed](self, "cfUsed"))
    PBDataWriterWriteBOOLField();
  v4 = -[_CPCounterfactualInfo cfError](self, "cfError");
  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteInt32Field();
    v5 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int cfDiffered;
  int cfUsed;
  int cfError;
  BOOL v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (cfDiffered = self->_cfDiffered, cfDiffered == objc_msgSend(v4, "cfDiffered"))
    && (cfUsed = self->_cfUsed, cfUsed == objc_msgSend(v4, "cfUsed")))
  {
    cfError = self->_cfError;
    v8 = cfError == objc_msgSend(v4, "cfError");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return (2654435761 * self->_cfUsed) ^ (2654435761 * self->_cfDiffered) ^ (2654435761 * self->_cfError);
}

- (BOOL)cfDiffered
{
  return self->_cfDiffered;
}

- (void)setCfDiffered:(BOOL)a3
{
  self->_cfDiffered = a3;
}

- (BOOL)cfUsed
{
  return self->_cfUsed;
}

- (void)setCfUsed:(BOOL)a3
{
  self->_cfUsed = a3;
}

- (int)cfError
{
  return self->_cfError;
}

- (void)setCfError:(int)a3
{
  self->_cfError = a3;
}

@end
