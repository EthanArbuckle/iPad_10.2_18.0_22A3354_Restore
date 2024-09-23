@implementation PatternResultGroup

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)dialogId
{
  return self->_dialogId;
}

- (void)setDialogId:(id)a3
{
  objc_storeStrong((id *)&self->_dialogId, a3);
}

- (NSString)visualId
{
  return self->_visualId;
}

- (void)setVisualId:(id)a3
{
  objc_storeStrong((id *)&self->_visualId, a3);
}

- (NSString)patternId
{
  return self->_patternId;
}

- (void)setPatternId:(id)a3
{
  objc_storeStrong((id *)&self->_patternId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patternId, 0);
  objc_storeStrong((id *)&self->_visualId, 0);
  objc_storeStrong((id *)&self->_dialogId, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
