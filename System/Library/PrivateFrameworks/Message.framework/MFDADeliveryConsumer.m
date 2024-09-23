@implementation MFDADeliveryConsumer

- (void)messageDidSendWithContext:(id)a3 sentBytesCount:(unint64_t)a4 receivedBytesCount:(unint64_t)a5
{
  self->_status = 0;
  self->_bytesRead = a5;
  self->_bytesWritten = a4;
  -[MFDAMailAccountConsumer setDone:](self, "setDone:", 1);
}

- (void)actionFailed:(int64_t)a3 forTask:(id)a4 error:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  int v14;
  id v15;
  int64_t v16;

  v16 = a3;
  v6 = a5;
  self->_status = 1;
  v15 = v6;
  MFWalkUpDAErrorChain(&v15, &v16);
  v7 = v15;

  if (v16 > 32)
  {
    if (v16 == 33)
    {
      v8 = 1050;
      goto LABEL_23;
    }
    v8 = 1055;
    if (v16 == 63 || v16 == 79)
      goto LABEL_23;
LABEL_11:
    objc_msgSend(v7, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("ASHTTPConnectionErrorDomain"));

    if (v11)
    {
      if (objc_msgSend(v7, "code") == 413)
      {
        v12 = 1054;
        goto LABEL_21;
      }
      if (objc_msgSend(v7, "code") != 400 && objc_msgSend(v7, "code") != 404 && objc_msgSend(v7, "code") != 500)
        goto LABEL_22;
    }
    else
    {
      objc_msgSend(v7, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

      if (!v14)
        goto LABEL_22;
      if (objc_msgSend(v7, "code") != -1005)
      {
        self->_status = 2;
        goto LABEL_22;
      }
    }
    v12 = 1053;
LABEL_21:
    self->_status = 7;
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), v12, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      goto LABEL_24;
LABEL_22:
    v8 = 1045;
    goto LABEL_23;
  }
  if ((unint64_t)(v16 - 5) < 2)
  {
    self->_status = 7;
    v8 = 1053;
LABEL_23:
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (v16 != -1)
    goto LABEL_11;
  v9 = 0;
  self->_status = 9;
LABEL_24:
  -[MFDADeliveryConsumer setError:](self, "setError:", v9);
  -[MFDAMailAccountConsumer setDone:](self, "setDone:", 1);

}

- (MFError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (int64_t)status
{
  return self->_status;
}

- (unint64_t)bytesRead
{
  return self->_bytesRead;
}

- (unint64_t)bytesWritten
{
  return self->_bytesWritten;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
