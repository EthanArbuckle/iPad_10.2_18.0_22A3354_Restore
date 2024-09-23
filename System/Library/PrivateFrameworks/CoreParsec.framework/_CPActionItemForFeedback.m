@implementation _CPActionItemForFeedback

- (BOOL)readFrom:(id)a3
{
  return _CPActionItemForFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_CPActionItemForFeedback punchout](self, "punchout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_CPActionItemForFeedback punchout](self, "punchout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[_CPActionItemForFeedback punchout](self, "punchout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_CPActionItemForFeedback punchout](self, "punchout");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_CPActionItemForFeedback punchout](self, "punchout");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "punchout");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  return -[_CPPunchoutForFeedback hash](self->_punchout, "hash");
}

- (_CPPunchoutForFeedback)punchout
{
  return self->_punchout;
}

- (void)setPunchout:(id)a3
{
  objc_storeStrong((id *)&self->_punchout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punchout, 0);
}

- (_CPActionItemForFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPActionItemForFeedback *v5;
  void *v6;
  _CPPunchoutForFeedback *v7;
  void *v8;
  _CPPunchoutForFeedback *v9;
  _CPActionItemForFeedback *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CPActionItemForFeedback;
  v5 = -[_CPActionItemForFeedback init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "punchout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_CPPunchoutForFeedback alloc];
      objc_msgSend(v4, "punchout");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_CPPunchoutForFeedback initWithFacade:](v7, "initWithFacade:", v8);
      -[_CPActionItemForFeedback setPunchout:](v5, "setPunchout:", v9);

    }
    v10 = v5;
  }

  return v5;
}

@end
