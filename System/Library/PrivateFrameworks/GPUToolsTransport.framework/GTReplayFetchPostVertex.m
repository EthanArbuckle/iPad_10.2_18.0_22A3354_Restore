@implementation GTReplayFetchPostVertex

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayFetchPostVertex)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  char *v6;
  __int128 v8;
  uint64_t v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTReplayFetchPostVertex;
  v5 = -[GTReplayRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    v5[16] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("objectShaderThreadgroupBoundsPresent"));
    GTPoint3DDecode(v4, CFSTR("objectShaderThreadgroupBeginBounds"), &v8);
    *((_OWORD *)v5 + 2) = v8;
    *((_QWORD *)v5 + 6) = v9;
    GTPoint3DDecode(v4, CFSTR("objectShaderThreadgroupEndBounds"), &v8);
    *(_OWORD *)(v5 + 56) = v8;
    *((_QWORD *)v5 + 9) = v9;
    *((_QWORD *)v5 + 3) = GTDispatchUIDDecode(v4, CFSTR("dispatchUID"));
    v6 = v5;
  }

  return (GTReplayFetchPostVertex *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  GTPoint3D objectShaderThreadgroupBeginBounds;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GTReplayFetchPostVertex;
  v4 = a3;
  -[GTReplayRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_objectShaderThreadgroupBoundsPresent, CFSTR("objectShaderThreadgroupBoundsPresent"));
  objectShaderThreadgroupBeginBounds = self->_objectShaderThreadgroupBeginBounds;
  GTPoint3DEncode(v4, (uint64_t *)&objectShaderThreadgroupBeginBounds, CFSTR("objectShaderThreadgroupBeginBounds"));
  objectShaderThreadgroupBeginBounds = self->_objectShaderThreadgroupEndBounds;
  GTPoint3DEncode(v4, (uint64_t *)&objectShaderThreadgroupBeginBounds, CFSTR("objectShaderThreadgroupEndBounds"));
  GTDispatchUIDEncode(v4, self->_dispatchUID.uid, CFSTR("dispatchUID"));

}

- ($71565B17A5F3ED2E4525C95CCD99C39E)dispatchUID
{
  return ($71565B17A5F3ED2E4525C95CCD99C39E)self->_dispatchUID.uid;
}

- (void)setDispatchUID:(id)a3
{
  self->_dispatchUID.uid = a3.var1;
}

- (BOOL)objectShaderThreadgroupBoundsPresent
{
  return self->_objectShaderThreadgroupBoundsPresent;
}

- (void)setObjectShaderThreadgroupBoundsPresent:(BOOL)a3
{
  self->_objectShaderThreadgroupBoundsPresent = a3;
}

- (GTPoint3D)objectShaderThreadgroupBeginBounds
{
  *retstr = *(GTPoint3D *)((char *)self + 32);
  return self;
}

- (void)setObjectShaderThreadgroupBeginBounds:(GTPoint3D *)a3
{
  unint64_t z;

  z = a3->z;
  *(_OWORD *)&self->_objectShaderThreadgroupBeginBounds.x = *(_OWORD *)&a3->x;
  self->_objectShaderThreadgroupBeginBounds.z = z;
}

- (GTPoint3D)objectShaderThreadgroupEndBounds
{
  *retstr = *(GTPoint3D *)((char *)self + 56);
  return self;
}

- (void)setObjectShaderThreadgroupEndBounds:(GTPoint3D *)a3
{
  unint64_t z;

  z = a3->z;
  *(_OWORD *)&self->_objectShaderThreadgroupEndBounds.x = *(_OWORD *)&a3->x;
  self->_objectShaderThreadgroupEndBounds.z = z;
}

@end
