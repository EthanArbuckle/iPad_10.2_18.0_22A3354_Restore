@implementation MTRServiceAreaClusterLocationInfoStruct

- (MTRServiceAreaClusterLocationInfoStruct)init
{
  MTRServiceAreaClusterLocationInfoStruct *v2;
  MTRServiceAreaClusterLocationInfoStruct *v3;
  MTRServiceAreaClusterHomeLocationStruct *locationInfo;
  NSNumber *landmarkTag;
  NSNumber *positionTag;
  NSNumber *surfaceTag;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTRServiceAreaClusterLocationInfoStruct;
  v2 = -[MTRServiceAreaClusterLocationInfoStruct init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    locationInfo = v2->_locationInfo;
    v2->_locationInfo = 0;

    landmarkTag = v3->_landmarkTag;
    v3->_landmarkTag = 0;

    positionTag = v3->_positionTag;
    v3->_positionTag = 0;

    surfaceTag = v3->_surfaceTag;
    v3->_surfaceTag = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRServiceAreaClusterLocationInfoStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;

  v4 = objc_alloc_init(MTRServiceAreaClusterLocationInfoStruct);
  objc_msgSend_locationInfo(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocationInfo_(v4, v8, (uint64_t)v7);

  objc_msgSend_landmarkTag(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLandmarkTag_(v4, v12, (uint64_t)v11);

  objc_msgSend_positionTag(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPositionTag_(v4, v16, (uint64_t)v15);

  objc_msgSend_surfaceTag(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSurfaceTag_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: locationInfo:%@; landmarkTag:%@; positionTag:%@; surfaceTag:%@; >"),
    v5,
    self->_locationInfo,
    self->_landmarkTag,
    self->_positionTag,
    self->_surfaceTag);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRServiceAreaClusterHomeLocationStruct)locationInfo
{
  return self->_locationInfo;
}

- (void)setLocationInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)landmarkTag
{
  return self->_landmarkTag;
}

- (void)setLandmarkTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)positionTag
{
  return self->_positionTag;
}

- (void)setPositionTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)surfaceTag
{
  return self->_surfaceTag;
}

- (void)setSurfaceTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_surfaceTag, 0);
  objc_storeStrong((id *)&self->_positionTag, 0);
  objc_storeStrong((id *)&self->_landmarkTag, 0);
  objc_storeStrong((id *)&self->_locationInfo, 0);
}

@end
