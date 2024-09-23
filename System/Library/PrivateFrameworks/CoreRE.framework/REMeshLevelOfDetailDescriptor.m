@implementation REMeshLevelOfDetailDescriptor

- (REMeshLevelOfDetailDescriptor)initWithLodLevelInfo:(const MeshLodLevelInfo *)a3
{
  double v3;
  double v4;

  *(float *)&v3 = a3->var0;
  *(float *)&v4 = a3->var1;
  return -[REMeshLevelOfDetailDescriptor initWithMeshPartEndIndex:minScreenArea:maxViewDepth:](self, "initWithMeshPartEndIndex:minScreenArea:maxViewDepth:", a3->var2, v3, v4);
}

- (MeshLodLevelInfo)lodLevelInfo
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unint64_t v8;
  MeshLodLevelInfo result;

  -[REMeshLevelOfDetailDescriptor minScreenArea](self, "minScreenArea");
  v4 = v3;
  -[REMeshLevelOfDetailDescriptor maxViewDepth](self, "maxViewDepth");
  v6 = v5;
  v7 = -[REMeshLevelOfDetailDescriptor meshPartEndIndex](self, "meshPartEndIndex");
  v8 = v4 | ((unint64_t)v6 << 32);
  result.var0 = *(float *)&v8;
  result.var1 = *((float *)&v8 + 1);
  result.var2 = v7;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMeshLevelOfDetailDescriptor)initWithMeshPartEndIndex:(unsigned int)a3 minScreenArea:(float)a4 maxViewDepth:(float)a5
{
  REMeshLevelOfDetailDescriptor *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)REMeshLevelOfDetailDescriptor;
  result = -[REMeshLevelOfDetailDescriptor init](&v9, sel_init);
  if (result)
  {
    result->_meshPartEndIndex = a3;
    result->_minScreenArea = a4;
    result->_maxViewDepth = a5;
  }
  return result;
}

- (REMeshLevelOfDetailDescriptor)initWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  float v6;
  NSString *v7;
  float v8;
  void *v9;
  REMeshLevelOfDetailDescriptor *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("meshPartEndIndex"));
  self->_meshPartEndIndex = v5;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("minScreenArea"));
  self->_minScreenArea = v6;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("maxViewDepth"));
  self->_maxViewDepth = v8;
  if (HIDWORD(v5))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v9);

    v10 = 0;
  }
  else
  {
    v10 = self;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  double v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", self->_meshPartEndIndex, CFSTR("meshPartEndIndex"));
  *(float *)&v4 = self->_minScreenArea;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("minScreenArea"), v4);
  *(float *)&v5 = self->_maxViewDepth;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("maxViewDepth"), v5);

}

- (BOOL)validateWithPartCount:(unint64_t)a3 error:(id *)a4
{
  unint64_t meshPartEndIndex;

  meshPartEndIndex = self->_meshPartEndIndex;
  if (meshPartEndIndex > a3)
  return meshPartEndIndex <= a3;
}

- (unint64_t)estimateContainerSize
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return class_getInstanceSize(v2);
}

- (unsigned)meshPartEndIndex
{
  return self->_meshPartEndIndex;
}

- (float)minScreenArea
{
  return self->_minScreenArea;
}

- (float)maxViewDepth
{
  return self->_maxViewDepth;
}

@end
