@implementation BKIdentity

+ (id)identity
{
  return objc_alloc_init((Class)a1);
}

- (BKIdentity)initWithServerIdentity:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  BKIdentity *v8;
  BKIdentity *v9;
  uint64_t v10;
  NSUUID *uuid;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  NSDate *creationTime;
  BKAccessory *v16;
  void *v17;
  uint64_t v18;
  BKAccessory *accessory;
  uint64_t v20;
  BKAccessoryGroup *accessoryGroup;
  int v22;
  uint64_t v23;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)BKIdentity;
  v8 = -[BKIdentity init](&v25, sel_init);
  v9 = v8;
  if (v6 && v8)
  {
    objc_msgSend(v6, "uuid");
    v10 = objc_claimAutoreleasedReturnValue();
    uuid = v9->_uuid;
    v9->_uuid = (NSUUID *)v10;

    v9->_userID = objc_msgSend(v6, "userID");
    objc_msgSend(v6, "name");
    v12 = objc_claimAutoreleasedReturnValue();
    name = v9->_name;
    v9->_name = (NSString *)v12;

    objc_msgSend(v6, "creationTime");
    v14 = objc_claimAutoreleasedReturnValue();
    creationTime = v9->_creationTime;
    v9->_creationTime = (NSDate *)v14;

    objc_storeStrong((id *)&v9->_device, a4);
    v16 = [BKAccessory alloc];
    objc_msgSend(v6, "accessory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[BKAccessory initWithServerAccessory:device:](v16, "initWithServerAccessory:device:", v17, v7);
    accessory = v9->_accessory;
    v9->_accessory = (BKAccessory *)v18;

    -[BKAccessory accessoryGroup](v9->_accessory, "accessoryGroup");
    v20 = objc_claimAutoreleasedReturnValue();
    accessoryGroup = v9->_accessoryGroup;
    v9->_accessoryGroup = (BKAccessoryGroup *)v20;

    v9->_placeholderIdentity = objc_msgSend(v6, "flags") & 1;
    if (objc_msgSend(v6, "type") == 4)
    {
      v9->_hasPeriocularEnrollment = (objc_msgSend(v6, "flags") >> 16) & 1;
      v9->_hasPeriocularEnrollmentWithGlasses = (objc_msgSend(v6, "flags") & 0x20000) != 0;
      v9->_canAddPeriocularEnrollment = (objc_msgSend(v6, "flags") & 0x40000) != 0;
      v9->_secondaryPeriocularEnrollments = (objc_msgSend(v6, "flags") >> 19) & 7;
    }
    v22 = objc_msgSend(v6, "type");
    v23 = 2 * (v22 == 4);
    if (v22 == 1)
      v23 = 1;
    v9->_type = v23;
  }

  return v9;
}

- (id)serverIdentity
{
  void *v3;
  int64_t type;
  uint64_t v5;

  +[BiometricKitIdentity biometricKitIdentity](BiometricKitIdentity, "biometricKitIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUuid:", self->_uuid);
  objc_msgSend(v3, "setUserID:", self->_userID);
  objc_msgSend(v3, "setName:", self->_name);
  objc_msgSend(v3, "setCreationTime:", self->_creationTime);
  type = self->_type;
  if (type == 1)
    v5 = 1;
  else
    v5 = 4 * (type == 2);
  objc_msgSend(v3, "setType:", v5);
  return v3;
}

- (BOOL)isEqualToIdentity:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  v5 = v4;
  if (v4 && self->_type == *((_QWORD *)v4 + 3) && self->_userID == *((_DWORD *)v4 + 3))
    v6 = -[NSUUID isEqual:](self->_uuid, "isEqual:", *((_QWORD *)v4 + 2));
  else
    v6 = 0;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  BKIdentity *v4;
  BOOL v5;

  v4 = (BKIdentity *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[BKIdentity isEqualToIdentity:](self, "isEqualToIdentity:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_userID;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (unsigned)userID
{
  return self->_userID;
}

- (void)setUserID:(unsigned int)a3
{
  self->_userID = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)creationTime
{
  return self->_creationTime;
}

- (void)setCreationTime:(id)a3
{
  objc_storeStrong((id *)&self->_creationTime, a3);
}

- (BKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (BKAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (BKAccessoryGroup)accessoryGroup
{
  return self->_accessoryGroup;
}

- (void)setAccessoryGroup:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryGroup, a3);
}

- (BOOL)placeholderIdentity
{
  return self->_placeholderIdentity;
}

- (void)setPlaceholderIdentity:(BOOL)a3
{
  self->_placeholderIdentity = a3;
}

- (BOOL)hasPeriocularEnrollment
{
  return self->_hasPeriocularEnrollment;
}

- (void)setHasPeriocularEnrollment:(BOOL)a3
{
  self->_hasPeriocularEnrollment = a3;
}

- (BOOL)hasPeriocularEnrollmentWithGlasses
{
  return self->_hasPeriocularEnrollmentWithGlasses;
}

- (void)setHasPeriocularEnrollmentWithGlasses:(BOOL)a3
{
  self->_hasPeriocularEnrollmentWithGlasses = a3;
}

- (BOOL)canAddPeriocularEnrollment
{
  return self->_canAddPeriocularEnrollment;
}

- (void)setCanAddPeriocularEnrollment:(BOOL)a3
{
  self->_canAddPeriocularEnrollment = a3;
}

- (int64_t)secondaryPeriocularEnrollments
{
  return self->_secondaryPeriocularEnrollments;
}

- (void)setSecondaryPeriocularEnrollments:(int64_t)a3
{
  self->_secondaryPeriocularEnrollments = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryGroup, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_creationTime, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
