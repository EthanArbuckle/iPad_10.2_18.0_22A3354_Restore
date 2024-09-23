@implementation SHManagedSessionCustomCatalogDriverDaemonDelegate

- (void)matcher:(id)a3 didProduceResponse:(id)a4
{
  void *v5;
  NSUUID *v6;
  NSUUID *matchingSignatureID;
  NSUUID *v8;
  NSUUID *inflightRequestID;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v16 = a4;
  if (objc_msgSend(v16, "result") == 2)
  {
    objc_msgSend(v16, "signature");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_ID");
    v6 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    matchingSignatureID = self->_matchingSignatureID;
    self->_matchingSignatureID = v6;

    objc_msgSend(v16, "runningAssociatedRequestID");
    v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    inflightRequestID = self->_inflightRequestID;
    self->_inflightRequestID = v8;

    -[SHManagedSessionCustomCatalogDriverDaemonDelegate sessionDriverDelegate](self, "sessionDriverDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "signature");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "matchSignature:", v11);
  }
  else
  {
    objc_msgSend(v16, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      +[SHError errorWithCode:underlyingError:](SHError, "errorWithCode:underlyingError:", 500, 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v14;

    -[SHManagedSessionCustomCatalogDriverDaemonDelegate sessionDriverDelegate](self, "sessionDriverDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "signature");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sessionDriverEncounteredUnrecoverableError:forSignature:", v10, v15);

  }
}

- (NSUUID)matchingSignatureID
{
  return self->_matchingSignatureID;
}

- (NSUUID)inflightRequestID
{
  return self->_inflightRequestID;
}

- (SHSessionDriverDelegate)sessionDriverDelegate
{
  return (SHSessionDriverDelegate *)objc_loadWeakRetained((id *)&self->_sessionDriverDelegate);
}

- (void)setSessionDriverDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sessionDriverDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sessionDriverDelegate);
  objc_storeStrong((id *)&self->_inflightRequestID, 0);
  objc_storeStrong((id *)&self->_matchingSignatureID, 0);
}

@end
