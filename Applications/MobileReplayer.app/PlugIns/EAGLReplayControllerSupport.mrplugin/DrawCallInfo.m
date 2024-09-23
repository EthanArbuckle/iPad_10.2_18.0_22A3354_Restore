@implementation DrawCallInfo

- (unsigned)footprint
{
  return self->_footprint;
}

- (void)setFootprint:(unsigned int)a3
{
  self->_footprint = a3;
}

- (NSString)vertexShaderKey
{
  return self->_vertexShaderKey;
}

- (void)setVertexShaderKey:(id)a3
{
  objc_storeStrong((id *)&self->_vertexShaderKey, a3);
}

- (NSString)fragmentShaderKey
{
  return self->_fragmentShaderKey;
}

- (void)setFragmentShaderKey:(id)a3
{
  objc_storeStrong((id *)&self->_fragmentShaderKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragmentShaderKey, 0);
  objc_storeStrong((id *)&self->_vertexShaderKey, 0);
}

@end
