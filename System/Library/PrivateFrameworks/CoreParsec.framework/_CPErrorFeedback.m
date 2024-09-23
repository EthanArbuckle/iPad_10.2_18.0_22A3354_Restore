@implementation _CPErrorFeedback

- (_CPErrorFeedback)init
{
  _CPErrorFeedback *v2;
  _CPErrorFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPErrorFeedback;
  v2 = -[_CPErrorFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPErrorFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPErrorFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[_CPErrorFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  -[_CPErrorFeedback error](self, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_CPErrorFeedback error](self, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPErrorFeedback underlyingError](self, "underlyingError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_CPErrorFeedback underlyingError](self, "underlyingError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPErrorFeedback relatedStartNetworkSearchFeedbackId](self, "relatedStartNetworkSearchFeedbackId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  if (v8)
  {
    PBDataWriterWriteStringField();
    v9 = v10;
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
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_18;
  -[_CPErrorFeedback error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[_CPErrorFeedback error](self, "error");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_CPErrorFeedback error](self, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_18;
  }
  else
  {

  }
  -[_CPErrorFeedback underlyingError](self, "underlyingError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "underlyingError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[_CPErrorFeedback underlyingError](self, "underlyingError");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_CPErrorFeedback underlyingError](self, "underlyingError");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "underlyingError");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_18;
  }
  else
  {

  }
  -[_CPErrorFeedback relatedStartNetworkSearchFeedbackId](self, "relatedStartNetworkSearchFeedbackId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relatedStartNetworkSearchFeedbackId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[_CPErrorFeedback relatedStartNetworkSearchFeedbackId](self, "relatedStartNetworkSearchFeedbackId");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_21:
      v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    -[_CPErrorFeedback relatedStartNetworkSearchFeedbackId](self, "relatedStartNetworkSearchFeedbackId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "relatedStartNetworkSearchFeedbackId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if ((v22 & 1) != 0)
      goto LABEL_21;
  }
  else
  {
LABEL_17:

  }
LABEL_18:
  v23 = 0;
LABEL_19:

  return v23;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = 2654435761u * self->_timestamp;
  v4 = -[_CPError hash](self->_error, "hash");
  v5 = v4 ^ -[_CPError hash](self->_underlyingError, "hash");
  return v5 ^ -[NSString hash](self->_relatedStartNetworkSearchFeedbackId, "hash") ^ v3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (_CPError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (_CPError)underlyingError
{
  return self->_underlyingError;
}

- (void)setUnderlyingError:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingError, a3);
}

- (NSString)relatedStartNetworkSearchFeedbackId
{
  return self->_relatedStartNetworkSearchFeedbackId;
}

- (void)setRelatedStartNetworkSearchFeedbackId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedStartNetworkSearchFeedbackId, 0);
  objc_storeStrong((id *)&self->_underlyingError, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (_CPErrorFeedback)initWithFacade:(id)a3
{
  id v4;
  void *v5;
  _CPErrorFeedback *v6;
  _CPErrorFeedback *v7;

  v4 = a3;
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_CPErrorFeedback initWithError:](self, "initWithError:", v5);

  if (v6)
  {
    -[_CPErrorFeedback setTimestamp:](v6, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    v7 = v6;
  }

  return v6;
}

- (_CPErrorFeedback)initWithError:(id)a3
{
  id v4;
  _CPErrorFeedback *v5;
  _CPError *v6;
  void *v7;
  void *v8;
  _CPError *v9;
  _CPErrorFeedback *v10;

  v4 = a3;
  v5 = -[_CPErrorFeedback init](self, "init");
  if (v5)
  {
    -[_CPErrorFeedback setTimestamp:](v5, "setTimestamp:", mach_absolute_time());
    if (v4)
    {
      v6 = -[_CPError initWithFacade:]([_CPError alloc], "initWithFacade:", v4);
      -[_CPErrorFeedback setError:](v5, "setError:", v6);

    }
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = -[_CPError initWithFacade:]([_CPError alloc], "initWithFacade:", v8);
      -[_CPErrorFeedback setUnderlyingError:](v5, "setUnderlyingError:", v9);

    }
    v10 = v5;

  }
  return v5;
}

@end
