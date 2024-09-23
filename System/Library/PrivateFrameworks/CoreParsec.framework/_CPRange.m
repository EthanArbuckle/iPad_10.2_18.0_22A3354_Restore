@implementation _CPRange

- (BOOL)readFrom:(id)a3
{
  return _CPRangeReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_CPRange location](self, "location"))
    PBDataWriterWriteUint64Field();
  if (-[_CPRange length](self, "length"))
    PBDataWriterWriteUint64Field();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t location;
  unint64_t length;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (location = self->_location, location == objc_msgSend(v4, "location")))
  {
    length = self->_length;
    v7 = length == objc_msgSend(v4, "length");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return (2654435761u * self->_length) ^ (2654435761u * self->_location);
}

- (unint64_t)location
{
  return self->_location;
}

- (void)setLocation:(unint64_t)a3
{
  self->_location = a3;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

@end
