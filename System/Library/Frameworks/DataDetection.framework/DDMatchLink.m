@implementation DDMatchLink

- (DDMatchLink)initWithDDScannerResult:(id)a3
{
  id v4;
  DDMatchLink *v5;
  uint64_t v6;
  NSURL *URL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DDMatchLink;
  v5 = -[DDMatch initWithDDScannerResult:](&v9, sel_initWithDDScannerResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "url");
    v6 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

  }
  return v5;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
