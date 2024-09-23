@implementation BCAnnotationRange

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v15.receiver = self;
  v15.super_class = (Class)BCAnnotationRange;
  -[BCAnnotationRange description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v10, (uint64_t)CFSTR("%@ %@"), v11, v12, v4, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;

  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v7, self->_location, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, (uint64_t)CFSTR("location"), v12);

  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v13, self->_length, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, (uint64_t)CFSTR("length"), v18);

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return BCAnnotationRangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  *((_QWORD *)a3 + 2) = self->_location;
  *((_QWORD *)a3 + 1) = self->_length;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id result;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  result = (id)objc_msgSend_init(v9, v10, v11, v12, v13);
  *((_QWORD *)result + 2) = self->_location;
  *((_QWORD *)result + 1) = self->_length;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  v5 = objc_opt_class();
  v9 = objc_msgSend_isMemberOfClass_(v4, v6, v5, v7, v8)
    && self->_location == v4[2]
    && self->_length == v4[1];

  return v9;
}

- (unint64_t)hash
{
  return (2654435761u * self->_length) ^ (2654435761u * self->_location);
}

- (void)mergeFrom:(id)a3
{
  self->_location = *((_QWORD *)a3 + 2);
  self->_length = *((_QWORD *)a3 + 1);
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
