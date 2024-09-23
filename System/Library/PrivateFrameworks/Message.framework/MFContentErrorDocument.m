@implementation MFContentErrorDocument

- (MFContentErrorDocument)initWithMimePart:(id)a3
{
  id v5;
  MFContentErrorDocument *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSError *error;
  void *v17;
  objc_super v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFContentErrorDocument.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mimePart"));

  }
  v18.receiver = self;
  v18.super_class = (Class)MFContentErrorDocument;
  v6 = -[MFContentErrorDocument init](&v18, sel_init);
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    MFLookupLocalizedString(CFSTR("CANNOT_DECODE_MULTIPART_MESSAGE"), CFSTR("This message cannot be displayed because of the way it is formatted. Ask the sender to send it again using a different format or email program.\n\n%@/%@"), CFSTR("Delayed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "type");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subtype");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D50];
    v20[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mf_decodeFailedErrorWithUserInfo:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    error = v6->_error;
    v6->_error = (NSError *)v14;

  }
  return v6;
}

- (NSString)content
{
  void *v2;
  void *v3;

  -[MFContentErrorDocument error](self, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
