@implementation MFMessageLoadingContextEvent

- (NSError)smimeError
{
  void *v2;
  void *v3;
  void *v4;

  -[MFMessageLoadingContextEvent loadedBody](self, "loadedBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topLevelPart");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "SMIMEError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSError *)v4;
}

- (id)_descriptionForDebugging:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v3 = a3;
  -[MFMessageLoadingContextEvent context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB37A0];
  v8 = objc_opt_class();
  v9 = v6;
  if (!v3)
  {
    objc_msgSend(v6, "messageID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p> message %@"), v8, self, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)

  -[MFMessageLoadingContextEvent hasLoadedCompleteBody](self, "hasLoadedCompleteBody");
  NSStringFromBOOL();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageLoadingContextEvent hasLoadedBestAlternativePart](self, "hasLoadedBestAlternativePart");
  NSStringFromBOOL();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendFormat:", CFSTR(" hLCB=%@ hLBAP=%@ remainingBytes=%lu"), v11, v12, -[MFMessageLoadingContextEvent remainingBytes](self, "remainingBytes"));

  if (v3)
  {
    -[MFMessageLoadingContextEvent error](self, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[MFMessageLoadingContextEvent error](self, "error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendFormat:", CFSTR(" error: %@"), v14);

    }
    -[MFMessageLoadingContextEvent smimeError](self, "smimeError");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[MFMessageLoadingContextEvent smimeError](self, "smimeError");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendFormat:", CFSTR(" SMIME error: %@"), v16);

    }
    -[MFMessageLoadingContextEvent content](self, "content");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18)
    {
      -[MFMessageLoadingContextEvent content](self, "content");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendFormat:", CFSTR(" content: %@"), v19);
LABEL_18:

      goto LABEL_19;
    }
  }
  else
  {
    -[MFMessageLoadingContextEvent error](self, "error");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[MFMessageLoadingContextEvent error](self, "error");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "domain");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageLoadingContextEvent error](self, "error");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendFormat:", CFSTR(" error: %@/%ld"), v22, objc_msgSend(v23, "code"));

    }
    -[MFMessageLoadingContextEvent smimeError](self, "smimeError");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[MFMessageLoadingContextEvent smimeError](self, "smimeError");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "domain");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageLoadingContextEvent smimeError](self, "smimeError");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendFormat:", CFSTR(" SMIME error: %@/%ld"), v26, objc_msgSend(v27, "code"));

    }
  }
  -[MFMessageLoadingContextEvent content](self, "content");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[MFMessageLoadingContextEvent content](self, "content");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendFormat:", CFSTR(" %lu content items"), objc_msgSend(v19, "count"));
    goto LABEL_18;
  }
LABEL_19:

  return v10;
}

- (id)description
{
  return -[MFMessageLoadingContextEvent _descriptionForDebugging:](self, "_descriptionForDebugging:", 0);
}

- (id)debugDescription
{
  return -[MFMessageLoadingContextEvent _descriptionForDebugging:](self, "_descriptionForDebugging:", 1);
}

- (MFMailMessage)message
{
  void *v2;
  void *v3;

  -[MFMessageLoadingContextEvent context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MFMailMessage *)v3;
}

- (MFMessageLoadingContext)context
{
  return (MFMessageLoadingContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (NSArray)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)hasLoadedCompleteBody
{
  return self->_hasLoadedCompleteBody;
}

- (void)setHasLoadedCompleteBody:(BOOL)a3
{
  self->_hasLoadedCompleteBody = a3;
}

- (BOOL)hasLoadedBestAlternativePart
{
  return self->_hasLoadedBestAlternativePart;
}

- (void)setHasLoadedBestAlternativePart:(BOOL)a3
{
  self->_hasLoadedBestAlternativePart = a3;
}

- (unint64_t)remainingBytes
{
  return self->_remainingBytes;
}

- (void)setRemainingBytes:(unint64_t)a3
{
  self->_remainingBytes = a3;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (MFMimePart)loadedPart
{
  return self->_loadedPart;
}

- (void)setLoadedPart:(id)a3
{
  objc_storeStrong((id *)&self->_loadedPart, a3);
}

- (MFMimeBody)loadedBody
{
  return self->_loadedBody;
}

- (void)setLoadedBody:(id)a3
{
  objc_storeStrong((id *)&self->_loadedBody, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedBody, 0);
  objc_storeStrong((id *)&self->_loadedPart, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_destroyWeak((id *)&self->_context);
}

@end
