@implementation GEORPFeedbackFormFieldAnnotations

- (BOOL)hasKeyString
{
  return self->_keyString != 0;
}

- (NSString)keyString
{
  return self->_keyString;
}

- (void)setKeyString:(id)a3
{
  objc_storeStrong((id *)&self->_keyString, a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackFormFieldAnnotations;
  -[GEORPFeedbackFormFieldAnnotations description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackFormFieldAnnotations dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackFieldOptionAnnotations _dictionaryRepresentation:](self, 0);
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackFieldOptionAnnotations _dictionaryRepresentation:](self, 1);
}

- (GEORPFeedbackFormFieldAnnotations)initWithDictionary:(id)a3
{
  return (GEORPFeedbackFormFieldAnnotations *)-[GEORPFeedbackFieldOptionAnnotations _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEORPFeedbackFormFieldAnnotations)initWithJSON:(id)a3
{
  return (GEORPFeedbackFormFieldAnnotations *)-[GEORPFeedbackFieldOptionAnnotations _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackFormFieldAnnotationsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackFormFieldAnnotationsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (self->_keyString)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPFeedbackFormFieldAnnotations readAll:](self, "readAll:", 0);
  if (self->_keyString)
    objc_msgSend(v4, "setKeyString:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_keyString, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  NSString *keyString;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = 1;
    -[GEORPFeedbackFormFieldAnnotations readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    keyString = self->_keyString;
    if ((unint64_t)keyString | v4[1])
      v5 = -[NSString isEqual:](keyString, "isEqual:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  -[GEORPFeedbackFormFieldAnnotations readAll:](self, "readAll:", 1);
  return -[NSString hash](self->_keyString, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  uint64_t v5;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = v4[1];

  if (v5)
    -[GEORPFeedbackFormFieldAnnotations setKeyString:](self, "setKeyString:", v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyString, 0);
}

@end
