@implementation AACodableResponse

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[AAResponse httpResponse](self, "httpResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB36F8];
    -[AAResponse httpResponse](self, "httpResponse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v13, "encodeObject:forKey:", v7, CFSTR("_httpResponse"));

  }
  -[AAResponse data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AAResponse data](self, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v9, CFSTR("_data"));

  }
  -[AAResponse mediaType](self, "mediaType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v13;
  if (v10)
  {
    -[AAResponse mediaType](self, "mediaType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("_mediaType"));

    v11 = v13;
  }

}

- (AACodableResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  AACodableResponse *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_mediaType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_httpResponse"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = 0;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v12);

    v11 = 0;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9 || v5 == 0)
    goto LABEL_11;
  self = -[AAResponse initWithHTTPResponse:data:mediaType:](self, "initWithHTTPResponse:data:mediaType:", v8, v6, v5);
  v11 = self;
LABEL_12:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
