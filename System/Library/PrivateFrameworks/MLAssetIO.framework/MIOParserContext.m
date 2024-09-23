@implementation MIOParserContext

- (MIOParserContext)initWithModelSpecificationFileURL:(id)a3
{
  id v4;
  MIOParserContext *v5;
  uint64_t v6;
  NSURL *modelSpecificationFileURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MIOParserContext;
  v5 = -[MIOParserContext init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    modelSpecificationFileURL = v5->_modelSpecificationFileURL;
    v5->_modelSpecificationFileURL = (NSURL *)v6;

  }
  return v5;
}

- (NSURL)modelSpecificationFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelSpecificationFileURL, 0);
}

@end
