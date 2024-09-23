@implementation GTReplayShaderDebugMesh

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayShaderDebugMesh)initWithCoder:(id)a3
{
  id v4;
  GTReplayShaderDebugMesh *v5;
  GTReplayShaderDebugMesh *v6;
  GTPoint3D *p_minThreadPositionInGrid;
  GTReplayShaderDebugMesh *v8;
  __int128 v10;
  unint64_t v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GTReplayShaderDebugMesh;
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
    GTPoint3DDecode(v4, CFSTR("ObjectThreadGroupPosition"), &v10);
    *(_OWORD *)&v6->_objectThreadgroupPositionInGrid.x = v10;
    v6->_objectThreadgroupPositionInGrid.z = v11;
    v6->_amplificationID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("AmplificationID"));
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
  v6.super_class = (Class)GTReplayShaderDebugMesh;
  v4 = a3;
  -[GTReplayShaderDebugRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  minThreadPositionInGrid = self->_minThreadPositionInGrid;
  GTPoint3DEncode(v4, (uint64_t *)&minThreadPositionInGrid, CFSTR("MinThreadPosition"));
  minThreadPositionInGrid = self->_maxThreadPositionInGrid;
  GTPoint3DEncode(v4, (uint64_t *)&minThreadPositionInGrid, CFSTR("MaxThreadPosition"));
  minThreadPositionInGrid = self->_objectThreadgroupPositionInGrid;
  GTPoint3DEncode(v4, (uint64_t *)&minThreadPositionInGrid, CFSTR("ObjectThreadGroupPosition"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_amplificationID, CFSTR("AmplificationID"));

}

- (GTPoint3D)minThreadPositionInGrid
{
  *retstr = *(GTPoint3D *)((char *)self + 56);
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
  *retstr = *(GTPoint3D *)((char *)self + 80);
  return self;
}

- (void)setMaxThreadPositionInGrid:(GTPoint3D *)a3
{
  unint64_t z;

  z = a3->z;
  *(_OWORD *)&self->_maxThreadPositionInGrid.x = *(_OWORD *)&a3->x;
  self->_maxThreadPositionInGrid.z = z;
}

- (GTPoint3D)objectThreadgroupPositionInGrid
{
  *retstr = *(GTPoint3D *)((char *)self + 104);
  return self;
}

- (void)setObjectThreadgroupPositionInGrid:(GTPoint3D *)a3
{
  unint64_t z;

  z = a3->z;
  *(_OWORD *)&self->_objectThreadgroupPositionInGrid.x = *(_OWORD *)&a3->x;
  self->_objectThreadgroupPositionInGrid.z = z;
}

- (unsigned)amplificationID
{
  return self->_amplificationID;
}

- (void)setAmplificationID:(unsigned int)a3
{
  self->_amplificationID = a3;
}

@end
