@implementation _CPResultGradingFeedback

- (_CPResultGradingFeedback)init
{
  _CPResultGradingFeedback *v2;
  _CPResultGradingFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPResultGradingFeedback;
  v2 = -[_CPResultGradingFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPResultGradingFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPResultGradingFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[_CPResultGradingFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  -[_CPResultGradingFeedback result](self, "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_CPResultGradingFeedback result](self, "result");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_CPResultGradingFeedback grade](self, "grade"))
    PBDataWriterWriteInt32Field();
  -[_CPResultGradingFeedback textFeedback](self, "textFeedback");
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
  int grade;
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
  -[_CPResultGradingFeedback result](self, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_13;
  -[_CPResultGradingFeedback result](self, "result");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_CPResultGradingFeedback result](self, "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "result");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_14;
  }
  else
  {

  }
  grade = self->_grade;
  if (grade != objc_msgSend(v4, "grade"))
    goto LABEL_14;
  -[_CPResultGradingFeedback textFeedback](self, "textFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textFeedback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_13:

    goto LABEL_14;
  }
  -[_CPResultGradingFeedback textFeedback](self, "textFeedback");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {

LABEL_17:
    v19 = 1;
    goto LABEL_15;
  }
  v15 = (void *)v14;
  -[_CPResultGradingFeedback textFeedback](self, "textFeedback");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textFeedback");
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
  uint64_t v5;

  v3 = 2654435761u * self->_timestamp;
  v4 = -[_CPSearchResultForFeedback hash](self->_result, "hash") ^ v3;
  v5 = 2654435761 * self->_grade;
  return v4 ^ v5 ^ -[NSString hash](self->_textFeedback, "hash");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (_CPSearchResultForFeedback)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (int)grade
{
  return self->_grade;
}

- (void)setGrade:(int)a3
{
  self->_grade = a3;
}

- (NSString)textFeedback
{
  return self->_textFeedback;
}

- (void)setTextFeedback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFeedback, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

- (_CPResultGradingFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPResultGradingFeedback *v5;
  void *v6;
  _CPSearchResultForFeedback *v7;
  void *v8;
  _CPSearchResultForFeedback *v9;
  void *v10;
  void *v11;
  _CPResultGradingFeedback *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_CPResultGradingFeedback;
  v5 = -[_CPResultGradingFeedback init](&v14, sel_init);
  if (v5)
  {
    -[_CPResultGradingFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    objc_msgSend(v4, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_CPSearchResultForFeedback alloc];
      objc_msgSend(v4, "result");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_CPSearchResultForFeedback initWithFacade:](v7, "initWithFacade:", v8);
      -[_CPResultGradingFeedback setResult:](v5, "setResult:", v9);

    }
    -[_CPResultGradingFeedback setGrade:](v5, "setGrade:", objc_msgSend(v4, "grade"));
    objc_msgSend(v4, "textFeedback");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "textFeedback");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPResultGradingFeedback setTextFeedback:](v5, "setTextFeedback:", v11);

    }
    v12 = v5;
  }

  return v5;
}

@end
