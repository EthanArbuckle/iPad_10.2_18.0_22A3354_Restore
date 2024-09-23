@implementation IRRapportDeviceDO

- (IRRapportDeviceDO)initWithRapportEffectiveID:(id)a3 idsID:(id)a4 name:(id)a5 deviceModel:(id)a6 mediaRemoteIdentifier:(id)a7 iCloudId:(id)a8 mediaRouteIdentifier:(id)a9
{
  id v16;
  id v17;
  IRRapportDeviceDO *v18;
  IRRapportDeviceDO *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)IRRapportDeviceDO;
  v18 = -[IRRapportDeviceDO init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_rapportEffectiveID, a3);
    objc_storeStrong((id *)&v19->_idsID, a4);
    objc_storeStrong((id *)&v19->_name, a5);
    objc_storeStrong((id *)&v19->_deviceModel, a6);
    objc_storeStrong((id *)&v19->_mediaRemoteIdentifier, a7);
    objc_storeStrong((id *)&v19->_iCloudId, a8);
    objc_storeStrong((id *)&v19->_mediaRouteIdentifier, a9);
  }

  return v19;
}

+ (IRRapportDeviceDO)rapportDeviceDOWithRapportEffectiveID:(id)a3 idsID:(id)a4 name:(id)a5 deviceModel:(id)a6 mediaRemoteIdentifier:(id)a7 iCloudId:(id)a8 mediaRouteIdentifier:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRapportEffectiveID:idsID:name:deviceModel:mediaRemoteIdentifier:iCloudId:mediaRouteIdentifier:", v22, v21, v20, v19, v18, v17, v16);

  return (IRRapportDeviceDO *)v23;
}

- (id)copyWithReplacementRapportEffectiveID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRapportEffectiveID:idsID:name:deviceModel:mediaRemoteIdentifier:iCloudId:mediaRouteIdentifier:", v4, self->_idsID, self->_name, self->_deviceModel, self->_mediaRemoteIdentifier, self->_iCloudId, self->_mediaRouteIdentifier);

  return v5;
}

- (id)copyWithReplacementIdsID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRapportEffectiveID:idsID:name:deviceModel:mediaRemoteIdentifier:iCloudId:mediaRouteIdentifier:", self->_rapportEffectiveID, v4, self->_name, self->_deviceModel, self->_mediaRemoteIdentifier, self->_iCloudId, self->_mediaRouteIdentifier);

  return v5;
}

- (id)copyWithReplacementName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRapportEffectiveID:idsID:name:deviceModel:mediaRemoteIdentifier:iCloudId:mediaRouteIdentifier:", self->_rapportEffectiveID, self->_idsID, v4, self->_deviceModel, self->_mediaRemoteIdentifier, self->_iCloudId, self->_mediaRouteIdentifier);

  return v5;
}

- (id)copyWithReplacementDeviceModel:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRapportEffectiveID:idsID:name:deviceModel:mediaRemoteIdentifier:iCloudId:mediaRouteIdentifier:", self->_rapportEffectiveID, self->_idsID, self->_name, v4, self->_mediaRemoteIdentifier, self->_iCloudId, self->_mediaRouteIdentifier);

  return v5;
}

- (id)copyWithReplacementMediaRemoteIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRapportEffectiveID:idsID:name:deviceModel:mediaRemoteIdentifier:iCloudId:mediaRouteIdentifier:", self->_rapportEffectiveID, self->_idsID, self->_name, self->_deviceModel, v4, self->_iCloudId, self->_mediaRouteIdentifier);

  return v5;
}

- (id)copyWithReplacementICloudId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRapportEffectiveID:idsID:name:deviceModel:mediaRemoteIdentifier:iCloudId:mediaRouteIdentifier:", self->_rapportEffectiveID, self->_idsID, self->_name, self->_deviceModel, self->_mediaRemoteIdentifier, v4, self->_mediaRouteIdentifier);

  return v5;
}

- (id)copyWithReplacementMediaRouteIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRapportEffectiveID:idsID:name:deviceModel:mediaRemoteIdentifier:iCloudId:mediaRouteIdentifier:", self->_rapportEffectiveID, self->_idsID, self->_name, self->_deviceModel, self->_mediaRemoteIdentifier, self->_iCloudId, v4);

  return v5;
}

- (BOOL)isEqualToRapportDeviceDO:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *rapportEffectiveID;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSString *idsID;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  NSString *name;
  void *v22;
  int v23;
  int v24;
  void *v25;
  int v26;
  NSString *deviceModel;
  void *v28;
  int v29;
  int v30;
  void *v31;
  int v32;
  NSString *mediaRemoteIdentifier;
  void *v34;
  int v35;
  int v36;
  void *v37;
  int v38;
  NSString *iCloudId;
  void *v40;
  int v41;
  int v42;
  void *v43;
  int v44;
  NSString *mediaRouteIdentifier;
  void *v46;
  char v47;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_23;
  v6 = self->_rapportEffectiveID != 0;
  objc_msgSend(v4, "rapportEffectiveID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_23;
  rapportEffectiveID = self->_rapportEffectiveID;
  if (rapportEffectiveID)
  {
    objc_msgSend(v5, "rapportEffectiveID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](rapportEffectiveID, "isEqual:", v10);

    if (!v11)
      goto LABEL_23;
  }
  v12 = self->_idsID != 0;
  objc_msgSend(v5, "idsID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_23;
  idsID = self->_idsID;
  if (idsID)
  {
    objc_msgSend(v5, "idsID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSString isEqual:](idsID, "isEqual:", v16);

    if (!v17)
      goto LABEL_23;
  }
  v18 = self->_name != 0;
  objc_msgSend(v5, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20)
    goto LABEL_23;
  name = self->_name;
  if (name)
  {
    objc_msgSend(v5, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[NSString isEqual:](name, "isEqual:", v22);

    if (!v23)
      goto LABEL_23;
  }
  v24 = self->_deviceModel != 0;
  objc_msgSend(v5, "deviceModel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  if (v24 == v26)
    goto LABEL_23;
  deviceModel = self->_deviceModel;
  if (deviceModel)
  {
    objc_msgSend(v5, "deviceModel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[NSString isEqual:](deviceModel, "isEqual:", v28);

    if (!v29)
      goto LABEL_23;
  }
  v30 = self->_mediaRemoteIdentifier != 0;
  objc_msgSend(v5, "mediaRemoteIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31 == 0;

  if (v30 == v32)
    goto LABEL_23;
  mediaRemoteIdentifier = self->_mediaRemoteIdentifier;
  if (mediaRemoteIdentifier)
  {
    objc_msgSend(v5, "mediaRemoteIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[NSString isEqual:](mediaRemoteIdentifier, "isEqual:", v34);

    if (!v35)
      goto LABEL_23;
  }
  v36 = self->_iCloudId != 0;
  objc_msgSend(v5, "iCloudId");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37 == 0;

  if (v36 == v38)
    goto LABEL_23;
  iCloudId = self->_iCloudId;
  if (iCloudId)
  {
    objc_msgSend(v5, "iCloudId");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[NSString isEqual:](iCloudId, "isEqual:", v40);

    if (!v41)
      goto LABEL_23;
  }
  v42 = self->_mediaRouteIdentifier != 0;
  objc_msgSend(v5, "mediaRouteIdentifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43 == 0;

  if (v42 == v44)
  {
LABEL_23:
    v47 = 0;
  }
  else
  {
    mediaRouteIdentifier = self->_mediaRouteIdentifier;
    if (mediaRouteIdentifier)
    {
      objc_msgSend(v5, "mediaRouteIdentifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = -[NSString isEqual:](mediaRouteIdentifier, "isEqual:", v46);

    }
    else
    {
      v47 = 1;
    }
  }

  return v47;
}

- (BOOL)isEqual:(id)a3
{
  IRRapportDeviceDO *v4;
  IRRapportDeviceDO *v5;
  BOOL v6;

  v4 = (IRRapportDeviceDO *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[IRRapportDeviceDO isEqualToRapportDeviceDO:](self, "isEqualToRapportDeviceDO:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;

  v3 = -[NSString hash](self->_rapportEffectiveID, "hash");
  v4 = -[NSString hash](self->_idsID, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_name, "hash") - v4 + 32 * v4;
  v6 = -[NSString hash](self->_deviceModel, "hash") - v5 + 32 * v5;
  v7 = -[NSString hash](self->_mediaRemoteIdentifier, "hash") - v6 + 32 * v6;
  v8 = -[NSString hash](self->_iCloudId, "hash") - v7 + 32 * v7;
  return -[NSString hash](self->_mediaRouteIdentifier, "hash") - v8 + 32 * v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRRapportDeviceDO)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  IRRapportDeviceDO *v13;
  void *v14;
  objc_class *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  objc_class *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rapportEffectiveID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRRapportDeviceDO key \"rapportEffectiveID\" (expected %@, decoded %@)"), v7, v9, 0);
      v59 = *MEMORY[0x24BDD0FC8];
      v60[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRRapportDeviceDOOCNTErrorDomain"), 3, v11);
      objc_msgSend(v4, "failWithError:", v12);
LABEL_4:
      v13 = 0;
LABEL_39:

      goto LABEL_40;
    }
LABEL_7:
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idsID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRRapportDeviceDO key \"idsID\" (expected %@, decoded %@)"), v9, v10, 0);
        v57 = *MEMORY[0x24BDD0FC8];
        v58 = v11;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRRapportDeviceDOOCNTErrorDomain"), 3, v12);
        objc_msgSend(v4, "failWithError:", v17);
LABEL_37:
        v13 = 0;
LABEL_38:

        goto LABEL_39;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v13 = 0;
LABEL_43:

        goto LABEL_44;
      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRRapportDeviceDO key \"name\" (expected %@, decoded %@)"), v10, v11, 0);
        v55 = *MEMORY[0x24BDD0FC8];
        v56 = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRRapportDeviceDOOCNTErrorDomain"), 3, v17);
        objc_msgSend(v4, "failWithError:", v21);

        goto LABEL_37;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v13 = 0;
LABEL_42:

        goto LABEL_43;
      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceModel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRRapportDeviceDO key \"deviceModel\" (expected %@, decoded %@)"), v11, v12, 0);
        v53 = *MEMORY[0x24BDD0FC8];
        v54 = v17;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRRapportDeviceDOOCNTErrorDomain"), 3, v45);
        objc_msgSend(v4, "failWithError:", v25);

        goto LABEL_37;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v13 = 0;
LABEL_41:

        goto LABEL_42;
      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaRemoteIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRRapportDeviceDO key \"mediaRemoteIdentifier\" (expected %@, decoded %@)"), v12, v17, 0);
        v51 = *MEMORY[0x24BDD0FC8];
        v52 = v46;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRRapportDeviceDOOCNTErrorDomain"), 3, v43);
        objc_msgSend(v4, "failWithError:", v29);

LABEL_36:
        goto LABEL_37;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        v13 = 0;
LABEL_40:

        goto LABEL_41;
      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iCloudId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRRapportDeviceDO key \"iCloudId\" (expected %@, decoded %@)"), v17, v46, 0);
        v49 = *MEMORY[0x24BDD0FC8];
        v50 = v44;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRRapportDeviceDOOCNTErrorDomain"), 3, v41);
        objc_msgSend(v4, "failWithError:", v33);

LABEL_35:
        goto LABEL_36;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
        goto LABEL_4;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaRouteIdentifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (objc_class *)objc_opt_class();
        NSStringFromClass(v36);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRRapportDeviceDO key \"mediaRouteIdentifier\" (expected %@, decoded %@)"), v46, v44, 0);
        v47 = *MEMORY[0x24BDD0FC8];
        v48 = v42;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRRapportDeviceDOOCNTErrorDomain"), 3, v40);
        objc_msgSend(v4, "failWithError:", v37);

        goto LABEL_35;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
        goto LABEL_37;
    }
    self = -[IRRapportDeviceDO initWithRapportEffectiveID:idsID:name:deviceModel:mediaRemoteIdentifier:iCloudId:mediaRouteIdentifier:](self, "initWithRapportEffectiveID:idsID:name:deviceModel:mediaRemoteIdentifier:iCloudId:mediaRouteIdentifier:", v5, v7, v9, v10, v11, v12, v17);
    v13 = self;
    goto LABEL_38;
  }
  objc_msgSend(v4, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_7;
  v13 = 0;
LABEL_44:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *rapportEffectiveID;
  NSString *idsID;
  NSString *name;
  NSString *deviceModel;
  NSString *mediaRemoteIdentifier;
  NSString *iCloudId;
  NSString *mediaRouteIdentifier;
  id v12;

  v4 = a3;
  rapportEffectiveID = self->_rapportEffectiveID;
  v12 = v4;
  if (rapportEffectiveID)
  {
    objc_msgSend(v4, "encodeObject:forKey:", rapportEffectiveID, CFSTR("rapportEffectiveID"));
    v4 = v12;
  }
  idsID = self->_idsID;
  if (idsID)
  {
    objc_msgSend(v12, "encodeObject:forKey:", idsID, CFSTR("idsID"));
    v4 = v12;
  }
  name = self->_name;
  if (name)
  {
    objc_msgSend(v12, "encodeObject:forKey:", name, CFSTR("name"));
    v4 = v12;
  }
  deviceModel = self->_deviceModel;
  if (deviceModel)
  {
    objc_msgSend(v12, "encodeObject:forKey:", deviceModel, CFSTR("deviceModel"));
    v4 = v12;
  }
  mediaRemoteIdentifier = self->_mediaRemoteIdentifier;
  if (mediaRemoteIdentifier)
  {
    objc_msgSend(v12, "encodeObject:forKey:", mediaRemoteIdentifier, CFSTR("mediaRemoteIdentifier"));
    v4 = v12;
  }
  iCloudId = self->_iCloudId;
  if (iCloudId)
  {
    objc_msgSend(v12, "encodeObject:forKey:", iCloudId, CFSTR("iCloudId"));
    v4 = v12;
  }
  mediaRouteIdentifier = self->_mediaRouteIdentifier;
  if (mediaRouteIdentifier)
  {
    objc_msgSend(v12, "encodeObject:forKey:", mediaRouteIdentifier, CFSTR("mediaRouteIdentifier"));
    v4 = v12;
  }

}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<IRRapportDeviceDO | rapportEffectiveID:%@ idsID:%@ name:%@ deviceModel:%@ mediaRemoteIdentifier:%@ iCloudId:%@ mediaRouteIdentifier:%@>"), self->_rapportEffectiveID, self->_idsID, self->_name, self->_deviceModel, self->_mediaRemoteIdentifier, self->_iCloudId, self->_mediaRouteIdentifier);
}

- (NSString)rapportEffectiveID
{
  return self->_rapportEffectiveID;
}

- (NSString)idsID
{
  return self->_idsID;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (NSString)mediaRemoteIdentifier
{
  return self->_mediaRemoteIdentifier;
}

- (NSString)iCloudId
{
  return self->_iCloudId;
}

- (NSString)mediaRouteIdentifier
{
  return self->_mediaRouteIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_iCloudId, 0);
  objc_storeStrong((id *)&self->_mediaRemoteIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_idsID, 0);
  objc_storeStrong((id *)&self->_rapportEffectiveID, 0);
}

- (id)exportAsDictionary
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MMM-dd HH:mm:ss.SSSSSS"));
  -[IRRapportDeviceDO rapportEffectiveID](self, "rapportEffectiveID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("rapportEffectiveID"));

  -[IRRapportDeviceDO idsID](self, "idsID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("idsID"));

  -[IRRapportDeviceDO name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("name"));

  -[IRRapportDeviceDO mediaRemoteIdentifier](self, "mediaRemoteIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("mediaRemoteIdentifier"));

  -[IRRapportDeviceDO iCloudId](self, "iCloudId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("iCloudId"));

  return v3;
}

@end
