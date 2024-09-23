@implementation VSJSAppScriptEvaluatorResult

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (BOOL)loaded
{
  return self->_loaded;
}

- (void)setLoaded:(BOOL)a3
{
  self->_loaded = a3;
}

- (NSError)loadError
{
  return self->_loadError;
}

- (void)setLoadError:(id)a3
{
  objc_storeStrong((id *)&self->_loadError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadError, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
