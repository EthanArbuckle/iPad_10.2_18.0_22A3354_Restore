@implementation MTRServiceAreaClusterHomeLocationStruct

- (MTRServiceAreaClusterHomeLocationStruct)init
{
  MTRServiceAreaClusterHomeLocationStruct *v2;
  MTRServiceAreaClusterHomeLocationStruct *v3;
  NSString *locationName;
  NSNumber *floorNumber;
  NSNumber *areaType;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRServiceAreaClusterHomeLocationStruct;
  v2 = -[MTRServiceAreaClusterHomeLocationStruct init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    locationName = v2->_locationName;
    v2->_locationName = (NSString *)&stru_2505249E8;

    floorNumber = v3->_floorNumber;
    v3->_floorNumber = 0;

    areaType = v3->_areaType;
    v3->_areaType = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRServiceAreaClusterHomeLocationStruct *v4;
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

  v4 = objc_alloc_init(MTRServiceAreaClusterHomeLocationStruct);
  objc_msgSend_locationName(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocationName_(v4, v8, (uint64_t)v7);

  objc_msgSend_floorNumber(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFloorNumber_(v4, v12, (uint64_t)v11);

  objc_msgSend_areaType(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAreaType_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: locationName:%@; floorNumber:%@; areaType:%@; >"),
    v5,
    self->_locationName,
    self->_floorNumber,
    self->_areaType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)locationName
{
  return self->_locationName;
}

- (void)setLocationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)floorNumber
{
  return self->_floorNumber;
}

- (void)setFloorNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)areaType
{
  return self->_areaType;
}

- (void)setAreaType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_areaType, 0);
  objc_storeStrong((id *)&self->_floorNumber, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
}

@end
