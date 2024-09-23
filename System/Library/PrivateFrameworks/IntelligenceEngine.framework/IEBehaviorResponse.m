@implementation IEBehaviorResponse

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (IEBehaviorResponseUndo)undo
{
  return self->_undo;
}

- (void)setUndo:(id)a3
{
  objc_storeStrong((id *)&self->_undo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undo, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
