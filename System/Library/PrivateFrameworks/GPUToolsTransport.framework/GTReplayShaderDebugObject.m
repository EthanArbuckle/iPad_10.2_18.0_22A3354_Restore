@implementation GTReplayShaderDebugObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayShaderDebugObject)initWithCoder:(id)a3
{
  id v4;
  GTReplayShaderDebugObject *v5;
  GTReplayShaderDebugObject *v6;
  GTPoint3D *p_minThreadPositionInGrid;
  GTReplayShaderDebugObject *v8;
  __int128 v10;
  unint64_t v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GTReplayShaderDebugObject;
  v5 = -[GTReplayShaderDebugRequest initWithCoder:](&v12, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    p_minThreadPositionInGrid = &v5->_minThreadPositionInGrid;
    GTPoint3DDecode(v4, CFSTR("MinThreadPosition"), &v10);
    *(_OWORD *)&p_minThreadPositionInGrid->x = v10;
    v6->_minThreadPositionInGrid.z = v11;
    GTPoint3DDecode(v4, CFSTR("MaxThreadPosition"), &v10);
    *(_OWORD *)&v6->_maxThreadPositionInGrid.x = v10;
    v6->_maxThreadPositionInGrid.z = v11;
    v8 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  GTPoint3D minThreadPositionInGrid;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GTReplayShaderDebugObject;
  v4 = a3;
  -[GTReplayShaderDebugRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  minThreadPositionInGrid = self->_minThreadPositionInGrid;
  GTPoint3DEncode(v4, (uint64_t *)&minThreadPositionInGrid, CFSTR("MinThreadPosition"));
  minThreadPositionInGrid = self->_maxThreadPositionInGrid;
  GTPoint3DEncode(v4, (uint64_t *)&minThreadPositionInGrid, CFSTR("MaxThreadPosition"));

}

- (GTPoint3D)minThreadPositionInGrid
{
  *retstr = self[2];
  return self;
}

- (void)setMinThreadPositionInGrid:(GTPoint3D *)a3
{
  unint64_t z;

  z = a3->z;
  *(_OWORD *)&self->_minThreadPositionInGrid.x = *(_OWORD *)&a3->x;
  self->_minThreadPositionInGrid.z = z;
}

- (GTPoint3D)maxThreadPositionInGrid
{
  *retstr = self[3];
  return self;
}

- (void)setMaxThreadPositionInGrid:(GTPoint3D *)a3
{
  unint64_t z;

  z = a3->z;
  *(_OWORD *)&self->_maxThreadPositionInGrid.x = *(_OWORD *)&a3->x;
  self->_maxThreadPositionInGrid.z = z;
}

@end
