@implementation _CPCardViewAppearFeedback

- (_CPCardViewAppearFeedback)init
{
  _CPCardViewAppearFeedback *v2;
  _CPCardViewAppearFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPCardViewAppearFeedback;
  v2 = -[_CPCardViewAppearFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPCardViewAppearFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPCardViewAppearFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[_CPCardViewAppearFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  -[_CPCardViewAppearFeedback card](self, "card");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_CPCardViewAppearFeedback card](self, "card");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_CPCardViewAppearFeedback level](self, "level"))
    PBDataWriterWriteUint32Field();
  -[_CPCardViewAppearFeedback fbr](self, "fbr");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t timestamp;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  unsigned int level;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_14;
  -[_CPCardViewAppearFeedback card](self, "card");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "card");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_13;
  -[_CPCardViewAppearFeedback card](self, "card");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_CPCardViewAppearFeedback card](self, "card");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "card");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_14;
  }
  else
  {

  }
  level = self->_level;
  if (level != objc_msgSend(v4, "level"))
    goto LABEL_14;
  -[_CPCardViewAppearFeedback fbr](self, "fbr");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fbr");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_13:

    goto LABEL_14;
  }
  -[_CPCardViewAppearFeedback fbr](self, "fbr");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {

LABEL_17:
    v19 = 1;
    goto LABEL_15;
  }
  v15 = (void *)v14;
  -[_CPCardViewAppearFeedback fbr](self, "fbr");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fbr");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqual:", v17);

  if ((v18 & 1) != 0)
    goto LABEL_17;
LABEL_14:
  v19 = 0;
LABEL_15:

  return v19;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = 2654435761u * self->_timestamp;
  v4 = -[_CPCardForFeedback hash](self->_card, "hash") ^ (2654435761 * self->_level) ^ v3;
  return v4 ^ -[NSString hash](self->_fbr, "hash");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (_CPCardForFeedback)card
{
  return self->_card;
}

- (void)setCard:(id)a3
{
  objc_storeStrong((id *)&self->_card, a3);
}

- (unsigned)level
{
  return self->_level;
}

- (void)setLevel:(unsigned int)a3
{
  self->_level = a3;
}

- (NSString)fbr
{
  return self->_fbr;
}

- (void)setFbr:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fbr, 0);
  objc_storeStrong((id *)&self->_card, 0);
}

- (_CPCardViewAppearFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPCardViewAppearFeedback *v5;
  void *v6;
  _CPCardForFeedback *v7;
  void *v8;
  _CPCardForFeedback *v9;
  void *v10;
  void *v11;
  _CPCardViewAppearFeedback *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_CPCardViewAppearFeedback;
  v5 = -[_CPCardViewAppearFeedback init](&v14, sel_init);
  if (v5)
  {
    -[_CPCardViewAppearFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    objc_msgSend(v4, "card");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_CPCardForFeedback alloc];
      objc_msgSend(v4, "card");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_CPCardForFeedback initWithFacade:](v7, "initWithFacade:", v8);
      -[_CPCardViewAppearFeedback setCard:](v5, "setCard:", v9);

    }
    -[_CPCardViewAppearFeedback setLevel:](v5, "setLevel:", objc_msgSend(v4, "level"));
    objc_msgSend(v4, "fbr");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "fbr");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPCardViewAppearFeedback setFbr:](v5, "setFbr:", v11);

    }
    v12 = v5;
  }

  return v5;
}

@end
