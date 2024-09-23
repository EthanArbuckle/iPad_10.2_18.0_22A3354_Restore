@implementation _CPError

- (BOOL)readFrom:(id)a3
{
  return _CPErrorReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  unint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_CPError domain](self, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_CPError reason](self, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[_CPError code](self, "code");
  if (v6 != 0.0)
    PBDataWriterWriteDoubleField();
  v7 = -[_CPError errorCode](self, "errorCode");
  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteUint64Field();
    v8 = v9;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  double code;
  double v20;
  unint64_t errorCode;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_CPError domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_CPError domain](self, "domain");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_CPError domain](self, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_CPError reason](self, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[_CPError reason](self, "reason");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_CPError reason](self, "reason");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reason");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  code = self->_code;
  objc_msgSend(v4, "code");
  if (code == v20)
  {
    errorCode = self->_errorCode;
    v17 = errorCode == objc_msgSend(v4, "errorCode");
    goto LABEL_13;
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  double code;
  NSUInteger v6;
  double v7;
  long double v8;

  v3 = -[NSString hash](self->_domain, "hash");
  v4 = -[NSString hash](self->_reason, "hash");
  code = self->_code;
  v6 = v4 ^ v3;
  v7 = -code;
  if (code >= 0.0)
    v7 = self->_code;
  v8 = round(v7);
  return v6 ^ (2654435761u * self->_errorCode) ^ ((unint64_t)(fmod(v8, 1.84467441e19) * 2654435760.0)
                                                + vcvtd_n_u64_f64(v7 - v8, 0x40uLL));
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)code
{
  return self->_code;
}

- (void)setCode:(double)a3
{
  self->_code = a3;
}

- (unint64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(unint64_t)a3
{
  self->_errorCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

- (_CPError)initWithFacade:(id)a3
{
  id v4;
  _CPError *v5;
  void *v6;
  void *v7;
  void *v8;
  _CPError *v9;

  v4 = a3;
  v5 = -[_CPError init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("reason"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPError setReason:](v5, "setReason:", v7);

    -[_CPError setCode:](v5, "setCode:", (double)(int)objc_msgSend(v4, "code"));
    objc_msgSend(v4, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPError setDomain:](v5, "setDomain:", v8);

    v9 = v5;
  }

  return v5;
}

@end
