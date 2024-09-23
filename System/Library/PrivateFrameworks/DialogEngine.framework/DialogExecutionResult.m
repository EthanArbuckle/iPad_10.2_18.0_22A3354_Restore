@implementation DialogExecutionResult

- (NSString)catId
{
  return self->_catId;
}

- (void)setCatId:(id)a3
{
  objc_storeStrong((id *)&self->_catId, a3);
}

- (NSDictionary)meta
{
  return self->_meta;
}

- (void)setMeta:(id)a3
{
  objc_storeStrong((id *)&self->_meta, a3);
}

- (NSArray)dialog
{
  return self->_dialog;
}

- (void)setDialog:(id)a3
{
  objc_storeStrong((id *)&self->_dialog, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_meta, 0);
  objc_storeStrong((id *)&self->_catId, 0);
}

@end
