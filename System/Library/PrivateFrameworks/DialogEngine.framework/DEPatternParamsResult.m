@implementation DEPatternParamsResult

- (NSString)patternId
{
  return self->_patternId;
}

- (void)setPatternId:(id)a3
{
  objc_storeStrong((id *)&self->_patternId, a3);
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
  objc_storeStrong((id *)&self->_patternId, 0);
}

@end
