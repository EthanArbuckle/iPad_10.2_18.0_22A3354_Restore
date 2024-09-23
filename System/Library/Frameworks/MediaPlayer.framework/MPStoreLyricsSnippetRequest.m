@implementation MPStoreLyricsSnippetRequest

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[MPStoreLyricsSnippetRequest snippetURL](self, "snippetURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSnippetURL:", v6);

  objc_msgSend(v5, "setResponseHandler:", v4);
  return v5;
}

- (MPStoreLyricsSnippetURLComponents)snippetURL
{
  return self->_snippetURL;
}

- (void)setSnippetURL:(id)a3
{
  objc_storeStrong((id *)&self->_snippetURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snippetURL, 0);
}

@end
