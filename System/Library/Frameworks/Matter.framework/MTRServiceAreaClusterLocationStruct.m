@implementation MTRServiceAreaClusterLocationStruct

- (MTRServiceAreaClusterLocationStruct)init
{
  MTRServiceAreaClusterLocationStruct *v2;
  MTRServiceAreaClusterLocationStruct *v3;
  NSNumber *locationID;
  NSNumber *mapID;
  uint64_t v6;
  MTRServiceAreaClusterLocationInfoStruct *locationInfo;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTRServiceAreaClusterLocationStruct;
  v2 = -[MTRServiceAreaClusterLocationStruct init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    locationID = v2->_locationID;
    v2->_locationID = (NSNumber *)&unk_250591B18;

    mapID = v3->_mapID;
    v3->_mapID = 0;

    v6 = objc_opt_new();
    locationInfo = v3->_locationInfo;
    v3->_locationInfo = (MTRServiceAreaClusterLocationInfoStruct *)v6;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRServiceAreaClusterLocationStruct *v4;
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

  v4 = objc_alloc_init(MTRServiceAreaClusterLocationStruct);
  objc_msgSend_locationID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocationID_(v4, v8, (uint64_t)v7);

  objc_msgSend_mapID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMapID_(v4, v12, (uint64_t)v11);

  objc_msgSend_locationInfo(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocationInfo_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: locationID:%@; mapID:%@; locationInfo:%@; >"),
    v5,
    self->_locationID,
    self->_mapID,
    self->_locationInfo);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)locationID
{
  return self->_locationID;
}

- (void)setLocationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)mapID
{
  return self->_mapID;
}

- (void)setMapID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MTRServiceAreaClusterLocationInfoStruct)locationInfo
{
  return self->_locationInfo;
}

- (void)setLocationInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationInfo, 0);
  objc_storeStrong((id *)&self->_mapID, 0);
  objc_storeStrong((id *)&self->_locationID, 0);
}

@end
