@implementation DECatParamsResult

- (NSString)catId
{
  return self->_catId;
}

- (void)setCatId:(id)a3
{
  objc_storeStrong((id *)&self->_catId, a3);
}

- (NSDictionary)params
{
  return self->_params;
}

- (void)setParams:(id)a3
{
  objc_storeStrong((id *)&self->_params, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_catId, 0);
}

@end
