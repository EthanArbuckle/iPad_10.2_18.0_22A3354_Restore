@implementation SCNRendererViewPoint

- (__n128)simdViewMatrix
{
  return a1[4];
}

- (__n128)setSimdViewMatrix:(__n128)a3
{
  result[4] = a2;
  result[5] = a3;
  result[6] = a4;
  result[7] = a5;
  return result;
}

- (__n128)simdProjectionMatrix
{
  return a1[8];
}

- (__n128)setSimdProjectionMatrix:(__n128)a3
{
  result[8] = a2;
  result[9] = a3;
  result[10] = a4;
  result[11] = a5;
  return result;
}

- ($54B668FA3CFF7C50914A1C899F2834C0)viewport
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var4;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var2;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[1].var0;
  return self;
}

- (void)setViewport:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_viewport.width = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_viewport.znear = v4;
  *(_OWORD *)&self->_viewport.originX = v3;
}

- (MTLRenderPassDescriptor)passDescriptor
{
  return self->_passDescriptor;
}

- (void)setPassDescriptor:(id)a3
{
  self->_passDescriptor = (MTLRenderPassDescriptor *)a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNRendererViewPoint;
  -[SCNRendererViewPoint dealloc](&v3, sel_dealloc);
}

- (SCNMatrix4)viewMatrix
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[1].m21;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[1].m11;
  *(_OWORD *)&retstr->m21 = v3;
  v4 = *(_OWORD *)&self[1].m41;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[1].m31;
  *(_OWORD *)&retstr->m41 = v4;
  return self;
}

- (void)setViewMatrix:(SCNMatrix4 *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->m11;
  v4 = *(_OWORD *)&a3->m21;
  v5 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_viewMatrix.m31 = *(_OWORD *)&a3->m31;
  *(_OWORD *)&self->_viewMatrix.m41 = v5;
  *(_OWORD *)&self->_viewMatrix.m11 = v3;
  *(_OWORD *)&self->_viewMatrix.m21 = v4;
}

- (SCNMatrix4)projectionMatrix
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[2].m21;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[2].m11;
  *(_OWORD *)&retstr->m21 = v3;
  v4 = *(_OWORD *)&self[2].m41;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[2].m31;
  *(_OWORD *)&retstr->m41 = v4;
  return self;
}

- (void)setProjectionMatrix:(SCNMatrix4 *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->m11;
  v4 = *(_OWORD *)&a3->m21;
  v5 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_projectionMatrix.m31 = *(_OWORD *)&a3->m31;
  *(_OWORD *)&self->_projectionMatrix.m41 = v5;
  *(_OWORD *)&self->_projectionMatrix.m11 = v3;
  *(_OWORD *)&self->_projectionMatrix.m21 = v4;
}

@end
