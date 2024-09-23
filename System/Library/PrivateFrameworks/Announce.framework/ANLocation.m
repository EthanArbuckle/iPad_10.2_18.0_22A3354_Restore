@implementation ANLocation

- (ANLocation)initWithHomeID:(id)a3
{
  id v5;
  ANLocation *v6;
  ANLocation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ANLocation;
  v6 = -[ANLocation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_homeUUID, a3);

  return v7;
}

- (id)copy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_opt_new();
  -[ANLocation homeUUID](self, "homeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHomeUUID:", v4);

  -[ANLocation roomUUIDs](self, "roomUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v3, "setRoomUUIDs:", v6);

  -[ANLocation zoneUUIDs](self, "zoneUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v3, "setZoneUUIDs:", v8);

  -[ANLocation userUUIDs](self, "userUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v3, "setUserUUIDs:", v10);

  -[ANLocation deviceIDs](self, "deviceIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v3, "setDeviceIDs:", v12);

  objc_msgSend(v3, "setFlags:", -[ANLocation flags](self, "flags"));
  -[ANLocation homeLocationStatus](self, "homeLocationStatus");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHomeLocationStatus:", v13);

  return v3;
}

- (unint64_t)target
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;

  -[ANLocation zoneUUIDs](self, "zoneUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 <= 1)
  {
    -[ANLocation zoneUUIDs](self, "zoneUUIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") == 1;

    v5 = 4 * v7;
  }
  else
  {
    v5 = 8;
  }
  -[ANLocation roomUUIDs](self, "roomUUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 <= 1)
  {
    -[ANLocation roomUUIDs](self, "roomUUIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "count") == 1;

  }
  else
  {
    v10 = 2;
  }
  return v5 | v10;
}

- (ANLocation)initWithMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ANLocation *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  NSArray *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  NSArray *userUUIDs;
  NSArray *v35;
  uint64_t v36;
  NSArray *deviceIDs;
  uint64_t v38;
  NSNumber *homeLocationStatus;
  ANLocation *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  ANLocation *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("home"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v5);
      if (v6)
      {
        v7 = -[ANLocation initWithHomeID:](self, "initWithHomeID:", v6);
        if (v7)
        {
          v44 = v6;
          v45 = v5;
          objc_msgSend(v4, "objectForKey:", CFSTR("flags"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8;
          if (v8)
            v7->_flags = objc_msgSend(v8, "unsignedIntegerValue");
          v43 = v9;
          v47 = v7;
          objc_msgSend(v4, "objectForKey:", CFSTR("zones"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = 0u;
          v57 = 0u;
          v58 = 0u;
          v59 = 0u;
          v12 = v10;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v57;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v57 != v15)
                  objc_enumerationMutation(v12);
                v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i));
                if (v17)
                  objc_msgSend(v11, "addObject:", v17);

              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
            }
            while (v14);
          }
          v42 = v12;

          objc_storeStrong((id *)&v47->_zoneUUIDs, v11);
          objc_msgSend(v4, "objectForKey:", CFSTR("rooms"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v18, "count"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          v20 = v18;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v53;
            do
            {
              for (j = 0; j != v22; ++j)
              {
                if (*(_QWORD *)v53 != v23)
                  objc_enumerationMutation(v20);
                v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j), v42);
                if (v25)
                  objc_msgSend(v19, "addObject:", v25);

              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
            }
            while (v22);
          }

          objc_storeStrong((id *)&v47->_roomUUIDs, v19);
          v46 = v4;
          objc_msgSend(v4, "objectForKey:", CFSTR("users"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v26, "count"));
          v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v28 = v26;
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v49;
            do
            {
              for (k = 0; k != v30; ++k)
              {
                if (*(_QWORD *)v49 != v31)
                  objc_enumerationMutation(v28);
                v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * k));
                if (v33)
                  -[NSArray addObject:](v27, "addObject:", v33);

              }
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
            }
            while (v30);
          }

          v7 = v47;
          userUUIDs = v47->_userUUIDs;
          v47->_userUUIDs = v27;
          v35 = v27;

          v4 = v46;
          objc_msgSend(v46, "objectForKey:", CFSTR("devices"));
          v36 = objc_claimAutoreleasedReturnValue();
          deviceIDs = v47->_deviceIDs;
          v47->_deviceIDs = (NSArray *)v36;

          objc_msgSend(v46, "objectForKey:", CFSTR("homeLocationStatus"));
          v38 = objc_claimAutoreleasedReturnValue();
          homeLocationStatus = v47->_homeLocationStatus;
          v47->_homeLocationStatus = (NSNumber *)v38;

          v6 = v44;
          v5 = v45;
        }
        self = v7;
        v40 = self;
      }
      else
      {
        v40 = 0;
      }

    }
    else
    {
      v40 = 0;
    }

  }
  else
  {
    v40 = 0;
  }

  return v40;
}

- (id)message
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 4);
  -[NSUUID UUIDString](self->_homeUUID, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("home"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_flags);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("flags"));

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](self->_zoneUUIDs, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v7 = self->_zoneUUIDs;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v37;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v11), "UUIDString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v9);
  }

  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("zones"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](self->_roomUUIDs, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v14 = self->_roomUUIDs;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v33;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v18), "UUIDString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v16);
  }

  objc_msgSend(v3, "setValue:forKey:", v13, CFSTR("rooms"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](self->_userUUIDs, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v21 = self->_userUUIDs;
  v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v29;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v25), "UUIDString", (_QWORD)v28);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v26);

        ++v25;
      }
      while (v23 != v25);
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v23);
  }

  objc_msgSend(v3, "setValue:forKey:", v20, CFSTR("users"));
  objc_msgSend(v3, "setValue:forKey:", self->_deviceIDs, CFSTR("devices"));
  objc_msgSend(v3, "setValue:forKey:", self->_homeLocationStatus, CFSTR("homeLocationStatus"));

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[ANLocation homeUUID](self, "homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("home"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[ANLocation flags](self, "flags"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("flags"));

  -[ANLocation zoneUUIDs](self, "zoneUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("zones"));

  -[ANLocation roomUUIDs](self, "roomUUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("rooms"));

  -[ANLocation userUUIDs](self, "userUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("users"));

  -[ANLocation deviceIDs](self, "deviceIDs");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("devices"));

}

- (ANLocation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ANLocation *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *zoneUUIDs;
  uint64_t v14;
  NSArray *roomUUIDs;
  uint64_t v16;
  NSArray *userUUIDs;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *deviceIDs;
  ANLocation *v23;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("home"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[ANLocation initWithHomeID:](self, "initWithHomeID:", v5);
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("flags"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
        v6->_flags = objc_msgSend(v7, "unsignedIntegerValue");
      v9 = (void *)MEMORY[0x24BDBCF20];
      v10 = objc_opt_class();
      objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("zones"));
      v12 = objc_claimAutoreleasedReturnValue();
      zoneUUIDs = v6->_zoneUUIDs;
      v6->_zoneUUIDs = (NSArray *)v12;

      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("rooms"));
      v14 = objc_claimAutoreleasedReturnValue();
      roomUUIDs = v6->_roomUUIDs;
      v6->_roomUUIDs = (NSArray *)v14;

      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("users"));
      v16 = objc_claimAutoreleasedReturnValue();
      userUUIDs = v6->_userUUIDs;
      v6->_userUUIDs = (NSArray *)v16;

      v18 = (void *)MEMORY[0x24BDBCF20];
      v19 = objc_opt_class();
      objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("devices"));
      v21 = objc_claimAutoreleasedReturnValue();
      deviceIDs = v6->_deviceIDs;
      v6->_deviceIDs = (NSArray *)v21;

    }
    self = v6;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (void)setHomeUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)roomUUIDs
{
  return self->_roomUUIDs;
}

- (void)setRoomUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_roomUUIDs, a3);
}

- (NSArray)zoneUUIDs
{
  return self->_zoneUUIDs;
}

- (void)setZoneUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_zoneUUIDs, a3);
}

- (NSArray)userUUIDs
{
  return self->_userUUIDs;
}

- (void)setUserUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_userUUIDs, a3);
}

- (NSArray)deviceIDs
{
  return self->_deviceIDs;
}

- (void)setDeviceIDs:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIDs, a3);
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (NSNumber)homeLocationStatus
{
  return self->_homeLocationStatus;
}

- (void)setHomeLocationStatus:(id)a3
{
  objc_storeStrong((id *)&self->_homeLocationStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeLocationStatus, 0);
  objc_storeStrong((id *)&self->_deviceIDs, 0);
  objc_storeStrong((id *)&self->_userUUIDs, 0);
  objc_storeStrong((id *)&self->_zoneUUIDs, 0);
  objc_storeStrong((id *)&self->_roomUUIDs, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
}

@end
