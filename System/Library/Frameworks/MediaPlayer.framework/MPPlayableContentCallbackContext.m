@implementation MPPlayableContentCallbackContext

- (MPPlayableContentCallbackContext)initWithIndexPath:(id)a3
{
  id v5;
  MPPlayableContentCallbackContext *v6;
  MPPlayableContentCallbackContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPPlayableContentCallbackContext;
  v6 = -[MPPlayableContentCallbackContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_indexPath, a3);
    v7->_serviced = 0;
  }

  return v7;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (BOOL)serviced
{
  return self->_serviced;
}

- (void)setServiced:(BOOL)a3
{
  self->_serviced = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
}

@end
