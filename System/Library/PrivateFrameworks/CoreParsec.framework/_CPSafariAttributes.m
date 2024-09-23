@implementation _CPSafariAttributes

- (BOOL)readFrom:(id)a3
{
  return _CPSafariAttributesReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_CPSafariAttributes hideReason](self, "hideReason"))
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int hideReason;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    hideReason = self->_hideReason;
    v6 = hideReason == objc_msgSend(v4, "hideReason");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return 2654435761 * self->_hideReason;
}

- (int)hideReason
{
  return self->_hideReason;
}

- (void)setHideReason:(int)a3
{
  self->_hideReason = a3;
}

- (_CPSafariAttributes)initWithFacade:(id)a3
{
  id v4;
  _CPSafariAttributes *v5;
  _CPSafariAttributes *v6;

  v4 = a3;
  v5 = -[_CPSafariAttributes init](self, "init");
  if (v5)
  {
    -[_CPSafariAttributes setHideReason:](v5, "setHideReason:", objc_msgSend(v4, "hideReason"));
    v6 = v5;
  }

  return v5;
}

@end
