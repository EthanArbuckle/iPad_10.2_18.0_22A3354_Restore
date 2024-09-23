@implementation CTLazuliSuggestedActionOpenUrlInWebView

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  int64_t v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTLazuliSuggestedActionOpenUrlInWebView mode](self, "mode");
  v8 = -[CTLazuliSuggestedActionOpenUrlInWebView mode](self, "mode");
  objc_msgSend(v3, "appendFormat:", CFSTR(", mode = [%ld - %s]"), v4, print_CTLazuliViewModeType(&v8));
  -[CTLazuliSuggestedActionOpenUrlInWebView url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", url = %@"), v5);

  -[CTLazuliSuggestedActionOpenUrlInWebView parameters](self, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", parameters = %@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliSuggestedActionOpenUrlInWebView:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  v5 = -[CTLazuliSuggestedActionOpenUrlInWebView mode](self, "mode");
  if (v5 == objc_msgSend(v4, "mode"))
  {
    -[CTLazuliSuggestedActionOpenUrlInWebView url](self, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[CTLazuliSuggestedActionOpenUrlInWebView parameters](self, "parameters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "parameters");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliSuggestedActionOpenUrlInWebView *v4;
  CTLazuliSuggestedActionOpenUrlInWebView *v5;
  BOOL v6;

  v4 = (CTLazuliSuggestedActionOpenUrlInWebView *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliSuggestedActionOpenUrlInWebView isEqualToCTLazuliSuggestedActionOpenUrlInWebView:](self, "isEqualToCTLazuliSuggestedActionOpenUrlInWebView:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliSuggestedActionOpenUrlInWebView *v4;

  v4 = +[CTLazuliSuggestedActionOpenUrlInWebView allocWithZone:](CTLazuliSuggestedActionOpenUrlInWebView, "allocWithZone:", a3);
  -[CTLazuliSuggestedActionOpenUrlInWebView setMode:](v4, "setMode:", self->_mode);
  -[CTLazuliSuggestedActionOpenUrlInWebView setUrl:](v4, "setUrl:", self->_url);
  -[CTLazuliSuggestedActionOpenUrlInWebView setParameters:](v4, "setParameters:", self->_parameters);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_mode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kModeKey"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_url, CFSTR("kUrlKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parameters, CFSTR("kParametersKey"));

}

- (CTLazuliSuggestedActionOpenUrlInWebView)initWithCoder:(id)a3
{
  id v4;
  CTLazuliSuggestedActionOpenUrlInWebView *v5;
  void *v6;
  uint64_t v7;
  NSURL *url;
  uint64_t v9;
  NSString *parameters;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTLazuliSuggestedActionOpenUrlInWebView;
  v5 = -[CTLazuliSuggestedActionOpenUrlInWebView init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kModeKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mode = objc_msgSend(v6, "longValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kUrlKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kParametersKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    parameters = v5->_parameters;
    v5->_parameters = (NSString *)v9;

  }
  return v5;
}

- (CTLazuliSuggestedActionOpenUrlInWebView)initWithReflection:(const void *)a3
{
  CTLazuliSuggestedActionOpenUrlInWebView *v4;
  void *v5;
  void *v6;
  char *v7;
  int v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  NSURL *url;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  NSString *parameters;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CTLazuliSuggestedActionOpenUrlInWebView;
  v4 = -[CTLazuliSuggestedActionOpenUrlInWebView init](&v21, sel_init);
  if (v4)
  {
    v4->_mode = encode_CTLazuliChatBotCardMediaHeightType((unsigned int *)a3);
    v5 = (void *)MEMORY[0x1E0C99E98];
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = (char *)*((_QWORD *)a3 + 1);
    v8 = *((char *)a3 + 31);
    v9 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
    if (v8 >= 0)
      v10 = (char *)a3 + 8;
    else
      v10 = v7;
    objc_msgSend(v6, "stringWithCString:encoding:", v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLWithString:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    url = v4->_url;
    v4->_url = (NSURL *)v12;

    v16 = (char *)*((_QWORD *)a3 + 4);
    v15 = (char *)a3 + 32;
    v14 = v16;
    if (v15[23] >= 0)
      v17 = v15;
    else
      v17 = v14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    parameters = v4->_parameters;
    v4->_parameters = (NSString *)v18;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
