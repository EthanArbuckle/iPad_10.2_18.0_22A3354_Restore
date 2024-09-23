@implementation IEDialogResponse

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (NSString)catId
{
  return self->_catId;
}

- (void)setCatId:(id)a3
{
  objc_storeStrong((id *)&self->_catId, a3);
}

- (NSDictionary)catParameters
{
  return self->_catParameters;
}

- (void)setCatParameters:(id)a3
{
  objc_storeStrong((id *)&self->_catParameters, a3);
}

- (NSDictionary)visualParameters
{
  return self->_visualParameters;
}

- (void)setVisualParameters:(id)a3
{
  objc_storeStrong((id *)&self->_visualParameters, a3);
}

- (NSString)patternId
{
  return self->_patternId;
}

- (void)setPatternId:(id)a3
{
  objc_storeStrong((id *)&self->_patternId, a3);
}

- (NSDictionary)patternParameters
{
  return self->_patternParameters;
}

- (void)setPatternParameters:(id)a3
{
  objc_storeStrong((id *)&self->_patternParameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patternParameters, 0);
  objc_storeStrong((id *)&self->_patternId, 0);
  objc_storeStrong((id *)&self->_visualParameters, 0);
  objc_storeStrong((id *)&self->_catParameters, 0);
  objc_storeStrong((id *)&self->_catId, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
