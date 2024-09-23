@implementation SKUniformShaderReference

- (SKShader)targetShader
{
  return (SKShader *)objc_loadWeakRetained((id *)&self->_targetShader);
}

- (void)setTargetShader:(id)a3
{
  objc_storeWeak((id *)&self->_targetShader, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_targetShader);
}

@end
