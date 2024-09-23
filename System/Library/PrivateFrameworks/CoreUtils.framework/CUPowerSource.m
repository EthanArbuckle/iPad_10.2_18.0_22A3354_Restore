@implementation CUPowerSource

- (CUPowerSource)initWithCoder:(id)a3
{
  id v4;
  CUPowerSource *v5;
  CUPowerSource *v6;
  CUPowerSource *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CUPowerSource;
  v5 = -[CUPowerSource init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CUPowerSource _updateWithCoder:](v5, "_updateWithCoder:", v4);
    v7 = v6;
  }

  return v6;
}

- (void)_updateWithCoder:(id)a3
{
  id v4;
  NSString *accessoryCategory;
  id v6;
  uint64_t v7;
  NSString *accessoryID;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  NSString *adapterName;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  double v21;
  id v22;
  NSString *groupID;
  id v24;
  uint64_t v25;
  NSArray *LEDs;
  uint64_t v27;
  id v28;
  double v29;
  NSString *name;
  id v31;
  uint64_t v32;
  NSString *partID;
  id v34;
  uint64_t v35;
  NSString *partName;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  NSString *state;
  id v42;
  uint64_t v43;
  CUPowerSource *subLeft;
  uint64_t v45;
  CUPowerSource *subRight;
  uint64_t v47;
  CUPowerSource *subCase;
  uint64_t v49;
  CUPowerSource *subMain;
  uint64_t v51;
  id v52;
  NSString *transportType;
  id v54;
  uint64_t v55;
  NSString *type;
  id v57;
  uint64_t v58;
  id v59;
  NSDictionary *ioKitDescription;
  id v61;
  uint64_t v62;
  id v63;
  uint64_t v64;

  v4 = a3;
  accessoryCategory = self->_accessoryCategory;
  self->_accessoryCategory = 0;

  v6 = v4;
  v7 = objc_opt_class();
  NSDecodeObjectIfPresent(v6, CFSTR("accessoryCategory"), v7, (void **)&self->_accessoryCategory);

  accessoryID = self->_accessoryID;
  self->_accessoryID = 0;

  v9 = v6;
  v10 = objc_opt_class();
  NSDecodeObjectIfPresent(v9, CFSTR("accessoryID"), v10, (void **)&self->_accessoryID);

  self->_adapterErrorFlags = 0;
  v11 = v9;
  if (objc_msgSend(v11, "containsValueForKey:", CFSTR("adapterErrorFlag")))
    self->_adapterErrorFlags = objc_msgSend(v11, "decodeIntegerForKey:", CFSTR("adapterErrorFlag"));

  self->_adapterFamilyCode = 0;
  v12 = v11;
  if (objc_msgSend(v12, "containsValueForKey:", CFSTR("adapterFamilyCode")))
    self->_adapterFamilyCode = objc_msgSend(v12, "decodeIntegerForKey:", CFSTR("adapterFamilyCode"));

  adapterName = self->_adapterName;
  self->_adapterName = 0;

  v14 = v12;
  v15 = objc_opt_class();
  NSDecodeObjectIfPresent(v14, CFSTR("adapterName"), v15, (void **)&self->_adapterName);

  self->_adapterSharedSource = 0;
  v16 = v14;
  if (objc_msgSend(v16, "containsValueForKey:", CFSTR("adapterSharedSource")))
    self->_adapterSharedSource = objc_msgSend(v16, "decodeBoolForKey:", CFSTR("adapterSharedSource"));

  self->_adapterSourceID = 0;
  v17 = v16;
  if (objc_msgSend(v17, "containsValueForKey:", CFSTR("adapterSourceID")))
    self->_adapterSourceID = objc_msgSend(v17, "decodeIntegerForKey:", CFSTR("adapterSourceID"));

  self->_aggregate = 0;
  v18 = v17;
  if (objc_msgSend(v18, "containsValueForKey:", CFSTR("aggregate")))
    self->_aggregate = objc_msgSend(v18, "decodeBoolForKey:", CFSTR("aggregate"));

  self->_charging = 0;
  v19 = v18;
  if (objc_msgSend(v19, "containsValueForKey:", CFSTR("charging")))
    self->_charging = objc_msgSend(v19, "decodeBoolForKey:", CFSTR("charging"));

  self->_chargeLevel = 0.0;
  v20 = v19;
  if (objc_msgSend(v20, "containsValueForKey:", CFSTR("chargeLevel")))
  {
    objc_msgSend(v20, "decodeDoubleForKey:", CFSTR("chargeLevel"));
    self->_chargeLevel = v21;
  }

  self->_familyCode = 0;
  v22 = v20;
  if (objc_msgSend(v22, "containsValueForKey:", CFSTR("familyCode")))
    self->_familyCode = objc_msgSend(v22, "decodeIntegerForKey:", CFSTR("familyCode"));

  groupID = self->_groupID;
  self->_groupID = 0;

  v24 = v22;
  v25 = objc_opt_class();
  NSDecodeObjectIfPresent(v24, CFSTR("groupID"), v25, (void **)&self->_groupID);

  LEDs = self->_LEDs;
  self->_LEDs = 0;

  v27 = objc_opt_class();
  NSDecodeNSArrayOfClassIfPresent(v24, CFSTR("LEDs"), v27, (void **)&self->_LEDs);
  self->_maxCapacity = 0.0;
  v28 = v24;
  if (objc_msgSend(v28, "containsValueForKey:", CFSTR("maxCapacity")))
  {
    objc_msgSend(v28, "decodeDoubleForKey:", CFSTR("maxCapacity"));
    self->_maxCapacity = v29;
  }

  name = self->_name;
  self->_name = 0;

  v31 = v28;
  v32 = objc_opt_class();
  NSDecodeObjectIfPresent(v31, CFSTR("name"), v32, (void **)&self->_name);

  partID = self->_partID;
  self->_partID = 0;

  v34 = v31;
  v35 = objc_opt_class();
  NSDecodeObjectIfPresent(v34, CFSTR("partID"), v35, (void **)&self->_partID);

  partName = self->_partName;
  self->_partName = 0;

  v37 = v34;
  v38 = objc_opt_class();
  NSDecodeObjectIfPresent(v37, CFSTR("partName"), v38, (void **)&self->_partName);

  self->_powerState = 0;
  v64 = 0;
  if (NSDecodeSInt64RangedIfPresent(v37, CFSTR("powerState"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, &v64))
    self->_powerState = v64;
  self->_productID = 0;
  v39 = v37;
  if (objc_msgSend(v39, "containsValueForKey:", CFSTR("productID")))
    self->_productID = objc_msgSend(v39, "decodeIntegerForKey:", CFSTR("productID"));

  self->_role = 0;
  v64 = 0;
  if (NSDecodeSInt64RangedIfPresent(v39, CFSTR("role"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, &v64))
    self->_role = v64;
  self->_sourceID = 0;
  v40 = v39;
  if (objc_msgSend(v40, "containsValueForKey:", CFSTR("sourceID")))
    self->_sourceID = objc_msgSend(v40, "decodeIntegerForKey:", CFSTR("sourceID"));

  state = self->_state;
  self->_state = 0;

  v42 = v40;
  v43 = objc_opt_class();
  NSDecodeObjectIfPresent(v42, CFSTR("state"), v43, (void **)&self->_state);

  subLeft = self->_subLeft;
  self->_subLeft = 0;

  v45 = objc_opt_class();
  NSDecodeObjectIfPresent(v42, CFSTR("subLeft"), v45, (void **)&self->_subLeft);
  subRight = self->_subRight;
  self->_subRight = 0;

  v47 = objc_opt_class();
  NSDecodeObjectIfPresent(v42, CFSTR("subRight"), v47, (void **)&self->_subRight);
  subCase = self->_subCase;
  self->_subCase = 0;

  v49 = objc_opt_class();
  NSDecodeObjectIfPresent(v42, CFSTR("subCase"), v49, (void **)&self->_subCase);
  subMain = self->_subMain;
  self->_subMain = 0;

  v51 = objc_opt_class();
  NSDecodeObjectIfPresent(v42, CFSTR("subMain"), v51, (void **)&self->_subMain);
  self->_temperature = 0;
  v52 = v42;
  if (objc_msgSend(v52, "containsValueForKey:", CFSTR("temperature")))
    self->_temperature = objc_msgSend(v52, "decodeIntegerForKey:", CFSTR("temperature"));

  transportType = self->_transportType;
  self->_transportType = 0;

  v54 = v52;
  v55 = objc_opt_class();
  NSDecodeObjectIfPresent(v54, CFSTR("transportType"), v55, (void **)&self->_transportType);

  type = self->_type;
  self->_type = 0;

  v57 = v54;
  v58 = objc_opt_class();
  NSDecodeObjectIfPresent(v57, CFSTR("type"), v58, (void **)&self->_type);

  self->_vendorID = 0;
  v59 = v57;
  if (objc_msgSend(v59, "containsValueForKey:", CFSTR("vendorID")))
    self->_vendorID = objc_msgSend(v59, "decodeIntegerForKey:", CFSTR("vendorID"));

  ioKitDescription = self->_ioKitDescription;
  self->_ioKitDescription = 0;

  v61 = v59;
  v62 = objc_opt_class();
  NSDecodeStandardContainerIfPresent(v61, CFSTR("ioKitDictionary"), v62, (void **)&self->_ioKitDescription);

  self->_present = 0;
  v63 = v61;
  if (objc_msgSend(v63, "containsValueForKey:", CFSTR("present")))
    self->_present = objc_msgSend(v63, "decodeBoolForKey:", CFSTR("present"));

}

- (void)encodeWithCoder:(id)a3
{
  NSString *accessoryCategory;
  NSString *accessoryID;
  int64_t adapterErrorFlags;
  int64_t adapterFamilyCode;
  NSString *adapterName;
  int64_t adapterSourceID;
  int64_t familyCode;
  NSString *groupID;
  NSString *name;
  void *v13;
  NSString *partID;
  NSString *partName;
  uint64_t powerState;
  int64_t productID;
  uint64_t role;
  int64_t sourceID;
  NSString *state;
  CUPowerSource *subLeft;
  CUPowerSource *subRight;
  CUPowerSource *subCase;
  CUPowerSource *subMain;
  int64_t temperature;
  NSString *transportType;
  NSString *type;
  int64_t vendorID;
  NSDictionary *ioKitDescription;
  id v30;

  v30 = a3;
  accessoryCategory = self->_accessoryCategory;
  if (accessoryCategory)
    objc_msgSend(v30, "encodeObject:forKey:", accessoryCategory, CFSTR("accessoryCategory"));
  accessoryID = self->_accessoryID;
  if (accessoryID)
    objc_msgSend(v30, "encodeObject:forKey:", accessoryID, CFSTR("accessoryID"));
  adapterErrorFlags = self->_adapterErrorFlags;
  if (adapterErrorFlags)
    objc_msgSend(v30, "encodeInteger:forKey:", adapterErrorFlags, CFSTR("adapterErrorFlag"));
  adapterFamilyCode = self->_adapterFamilyCode;
  if (adapterFamilyCode)
    objc_msgSend(v30, "encodeInteger:forKey:", adapterFamilyCode, CFSTR("adapterFamilyCode"));
  adapterName = self->_adapterName;
  if (adapterName)
    objc_msgSend(v30, "encodeObject:forKey:", adapterName, CFSTR("adapterName"));
  if (self->_adapterSharedSource)
    objc_msgSend(v30, "encodeBool:forKey:", 1, CFSTR("adapterSharedSource"));
  adapterSourceID = self->_adapterSourceID;
  if (adapterSourceID)
    objc_msgSend(v30, "encodeInteger:forKey:", adapterSourceID, CFSTR("adapterSourceID"));
  if (self->_aggregate)
    objc_msgSend(v30, "encodeBool:forKey:", 1, CFSTR("aggregate"));
  if (self->_charging)
    objc_msgSend(v30, "encodeBool:forKey:", 1, CFSTR("charging"));
  if (self->_chargeLevel > 0.0)
    objc_msgSend(v30, "encodeDouble:forKey:", CFSTR("chargeLevel"));
  familyCode = self->_familyCode;
  if (familyCode)
    objc_msgSend(v30, "encodeInteger:forKey:", familyCode, CFSTR("familyCode"));
  groupID = self->_groupID;
  if (groupID)
    objc_msgSend(v30, "encodeObject:forKey:", groupID, CFSTR("groupID"));
  if (-[NSArray count](self->_LEDs, "count"))
    objc_msgSend(v30, "encodeObject:forKey:", self->_LEDs, CFSTR("LEDs"));
  if (self->_maxCapacity > 0.0)
    objc_msgSend(v30, "encodeDouble:forKey:", CFSTR("maxCapacity"));
  name = self->_name;
  v13 = v30;
  if (name)
  {
    objc_msgSend(v30, "encodeObject:forKey:", name, CFSTR("name"));
    v13 = v30;
  }
  partID = self->_partID;
  if (partID)
  {
    objc_msgSend(v30, "encodeObject:forKey:", partID, CFSTR("partID"));
    v13 = v30;
  }
  partName = self->_partName;
  if (partName)
  {
    objc_msgSend(v30, "encodeObject:forKey:", partName, CFSTR("partName"));
    v13 = v30;
  }
  powerState = self->_powerState;
  if ((_DWORD)powerState)
  {
    objc_msgSend(v30, "encodeInteger:forKey:", powerState, CFSTR("powerState"));
    v13 = v30;
  }
  productID = self->_productID;
  if (productID)
  {
    objc_msgSend(v30, "encodeInteger:forKey:", productID, CFSTR("productID"));
    v13 = v30;
  }
  role = self->_role;
  if ((_DWORD)role)
  {
    objc_msgSend(v30, "encodeInteger:forKey:", role, CFSTR("role"));
    v13 = v30;
  }
  sourceID = self->_sourceID;
  if (sourceID)
  {
    objc_msgSend(v30, "encodeInteger:forKey:", sourceID, CFSTR("sourceID"));
    v13 = v30;
  }
  state = self->_state;
  if (state)
  {
    objc_msgSend(v30, "encodeObject:forKey:", state, CFSTR("state"));
    v13 = v30;
  }
  subLeft = self->_subLeft;
  if (subLeft)
  {
    objc_msgSend(v30, "encodeObject:forKey:", subLeft, CFSTR("subLeft"));
    v13 = v30;
  }
  subRight = self->_subRight;
  if (subRight)
  {
    objc_msgSend(v30, "encodeObject:forKey:", subRight, CFSTR("subRight"));
    v13 = v30;
  }
  subCase = self->_subCase;
  if (subCase)
  {
    objc_msgSend(v30, "encodeObject:forKey:", subCase, CFSTR("subCase"));
    v13 = v30;
  }
  subMain = self->_subMain;
  if (subMain)
  {
    objc_msgSend(v30, "encodeObject:forKey:", subMain, CFSTR("subMain"));
    v13 = v30;
  }
  temperature = self->_temperature;
  if (temperature)
  {
    objc_msgSend(v30, "encodeInteger:forKey:", temperature, CFSTR("temperature"));
    v13 = v30;
  }
  transportType = self->_transportType;
  if (transportType)
  {
    objc_msgSend(v30, "encodeObject:forKey:", transportType, CFSTR("transportType"));
    v13 = v30;
  }
  type = self->_type;
  if (type)
  {
    objc_msgSend(v30, "encodeObject:forKey:", type, CFSTR("type"));
    v13 = v30;
  }
  vendorID = self->_vendorID;
  if (vendorID)
  {
    objc_msgSend(v30, "encodeInteger:forKey:", vendorID, CFSTR("vendorID"));
    v13 = v30;
  }
  ioKitDescription = self->_ioKitDescription;
  if (ioKitDescription)
  {
    objc_msgSend(v30, "encodeObject:forKey:", ioKitDescription, CFSTR("ioKitDictionary"));
    v13 = v30;
  }
  if (self->_present)
  {
    objc_msgSend(v30, "encodeBool:forKey:", 1, CFSTR("present"));
    v13 = v30;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[CUPowerSource invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CUPowerSource;
  -[CUPowerSource dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t sourceID;
  int64_t adapterSourceID;
  NSString *accessoryID;
  void *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  int v12;
  char v13;
  NSString *groupID;
  void *v16;
  NSString *v17;
  NSString *v18;
  int v19;
  NSString *accessoryCategory;
  void *v21;
  NSString *v22;
  NSString *v23;
  int v24;
  NSString *partID;
  void *v26;
  NSString *v27;
  NSString *v28;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    sourceID = self->_sourceID;
    if (sourceID == objc_msgSend(v4, "sourceID"))
    {
      adapterSourceID = self->_adapterSourceID;
      if (adapterSourceID == objc_msgSend(v4, "adapterSourceID"))
      {
        accessoryID = self->_accessoryID;
        objc_msgSend(v4, "accessoryID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = accessoryID;
        v10 = v8;
        v11 = v10;
        if (v9 == v10)
        {

        }
        else
        {
          if ((v9 == 0) == (v10 != 0))
          {
            v13 = 0;
            v17 = v10;
LABEL_32:

            goto LABEL_33;
          }
          v12 = -[NSString isEqual:](v9, "isEqual:", v10);

          if (!v12)
          {
            v13 = 0;
LABEL_34:

            goto LABEL_9;
          }
        }
        groupID = self->_groupID;
        objc_msgSend(v4, "groupID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = groupID;
        v18 = v16;
        v9 = v18;
        if (v17 == v18)
        {

        }
        else
        {
          if ((v17 == 0) == (v18 != 0))
          {
            v13 = 0;
            v22 = v18;
LABEL_31:

            goto LABEL_32;
          }
          v19 = -[NSString isEqual:](v17, "isEqual:", v18);

          if (!v19)
          {
            v13 = 0;
LABEL_33:

            goto LABEL_34;
          }
        }
        accessoryCategory = self->_accessoryCategory;
        objc_msgSend(v4, "accessoryCategory");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = accessoryCategory;
        v23 = v21;
        v17 = v23;
        if (v22 == v23)
        {

        }
        else
        {
          if ((v22 == 0) == (v23 != 0))
          {
            v13 = 0;
            v27 = v23;
LABEL_30:

            goto LABEL_31;
          }
          v24 = -[NSString isEqual:](v22, "isEqual:", v23);

          if (!v24)
          {
            v13 = 0;
            goto LABEL_32;
          }
        }
        partID = self->_partID;
        objc_msgSend(v4, "partID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = partID;
        v28 = v26;
        v22 = v28;
        if (v27 == v28)
        {
          v13 = 1;
        }
        else if ((v27 == 0) == (v28 != 0))
        {
          v13 = 0;
        }
        else
        {
          v13 = -[NSString isEqual:](v27, "isEqual:", v28);
        }

        goto LABEL_30;
      }
    }
  }
  v13 = 0;
LABEL_9:

  return v13;
}

- (BOOL)hasAllComponents
{
  unsigned int expectedComponents;
  BOOL result;

  result = 1;
  if (self->_aggregate)
  {
    expectedComponents = self->_expectedComponents;
    if ((expectedComponents & 1) != 0 && !self->_subLeft)
      return 0;
    if ((expectedComponents & 2) != 0 && !self->_subRight || (expectedComponents & 4) != 0 && !self->_subCase)
      return 0;
  }
  return result;
}

- (unint64_t)hash
{
  int64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = self->_adapterSourceID ^ self->_sourceID;
  v4 = v3 ^ -[NSString hash](self->_accessoryID, "hash");
  v5 = -[NSString hash](self->_groupID, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_accessoryCategory, "hash");
  return v6 ^ -[NSString hash](self->_partID, "hash");
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  int64_t sourceID;
  __CFString *v18;
  NSString *accessoryCategory;
  __CFString *v20;
  NSString *accessoryID;
  __CFString *v22;
  int64_t adapterErrorFlags;
  __CFString *v24;
  int64_t adapterFamilyCode;
  __CFString *v26;
  NSString *adapterName;
  __CFString *v28;
  __CFString *v29;
  int64_t adapterSourceID;
  __CFString *v31;
  __CFString *v32;
  int64_t familyCode;
  __CFString *v34;
  NSString *groupID;
  __CFString *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __CFString *v43;
  uint64_t v44;
  __CFString *v45;
  NSString *partID;
  __CFString *v47;
  int64_t productID;
  __CFString *v49;
  int64_t vendorID;
  __CFString *v51;
  int64_t temperature;
  __CFString *v53;
  NSString *type;
  __CFString *v55;
  NSString *transportType;
  __CFString *v57;
  NSString *name;
  __CFString *v59;
  uint64_t v60;
  __CFString *v61;
  unsigned int powerState;
  const char *v63;
  __CFString *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __CFString *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  __CFString *v78;
  __CFString *v79;
  __CFString *v80;
  uint64_t v82;
  uint64_t v83;
  CFMutableStringRef v84;
  CFMutableStringRef v85;
  CFMutableStringRef v86;
  CFMutableStringRef v87;
  CFMutableStringRef v88;
  CFMutableStringRef v89;
  CFMutableStringRef v90;
  CFMutableStringRef v91;
  CFMutableStringRef v92;
  CFMutableStringRef v93;
  CFMutableStringRef v94;
  CFMutableStringRef v95;
  CFMutableStringRef v96;
  CFMutableStringRef v97;
  CFMutableStringRef v98;
  CFMutableStringRef v99;
  CFMutableStringRef v100;
  CFMutableStringRef v101;
  CFMutableStringRef v102;
  CFMutableStringRef v103;
  CFMutableStringRef v104;
  CFMutableStringRef v105;
  CFMutableStringRef v106;
  CFMutableStringRef v107;
  CFMutableStringRef v108;
  CFMutableStringRef v109;
  CFMutableStringRef v110;

  v110 = 0;
  NSAppendPrintF(&v110, (uint64_t)"CUPowerSource %{ptr}", v2, v3, v4, v5, v6, v7, (uint64_t)self);
  v9 = v110;
  v16 = v9;
  sourceID = self->_sourceID;
  if (sourceID)
  {
    v109 = v9;
    NSAppendPrintF(&v109, (uint64_t)", SID %ld", v10, v11, v12, v13, v14, v15, sourceID);
    v18 = v109;

    v16 = v18;
  }
  accessoryCategory = self->_accessoryCategory;
  if (accessoryCategory)
  {
    v108 = v16;
    NSAppendPrintF(&v108, (uint64_t)", AcCa %@", v10, v11, v12, v13, v14, v15, (uint64_t)accessoryCategory);
    v20 = v108;

    v16 = v20;
  }
  accessoryID = self->_accessoryID;
  if (accessoryID)
  {
    v107 = v16;
    NSAppendPrintF(&v107, (uint64_t)", AcID %@", v10, v11, v12, v13, v14, v15, (uint64_t)accessoryID);
    v22 = v107;

    v16 = v22;
  }
  adapterErrorFlags = self->_adapterErrorFlags;
  if (adapterErrorFlags)
  {
    v106 = v16;
    NSAppendPrintF(&v106, (uint64_t)", AdEF %ld", v10, v11, v12, v13, v14, v15, adapterErrorFlags);
    v24 = v106;

    v16 = v24;
  }
  adapterFamilyCode = self->_adapterFamilyCode;
  if (adapterFamilyCode)
  {
    v105 = v16;
    NSAppendPrintF(&v105, (uint64_t)", AdFm %ld", v10, v11, v12, v13, v14, v15, adapterFamilyCode);
    v26 = v105;

    v16 = v26;
  }
  adapterName = self->_adapterName;
  if (adapterName)
  {
    v104 = v16;
    NSAppendPrintF(&v104, (uint64_t)", AdNm '%@'", v10, v11, v12, v13, v14, v15, (uint64_t)adapterName);
    v28 = v104;

    v16 = v28;
  }
  if (self->_adapterSharedSource)
  {
    v103 = v16;
    NSAppendPrintF(&v103, (uint64_t)", AdSS %s", v10, v11, v12, v13, v14, v15, (uint64_t)"yes");
    v29 = v103;

    v16 = v29;
  }
  adapterSourceID = self->_adapterSourceID;
  if (adapterSourceID)
  {
    v102 = v16;
    NSAppendPrintF(&v102, (uint64_t)", AdSI %ld", v10, v11, v12, v13, v14, v15, adapterSourceID);
    v31 = v102;

    v16 = v31;
  }
  if (self->_showChargingUI)
  {
    v101 = v16;
    NSAppendPrintF(&v101, (uint64_t)", ChUI %s", v10, v11, v12, v13, v14, v15, (uint64_t)"yes");
    v32 = v101;

    v16 = v32;
  }
  familyCode = self->_familyCode;
  if (familyCode)
  {
    v100 = v16;
    NSAppendPrintF(&v100, (uint64_t)", Fm %ld", v10, v11, v12, v13, v14, v15, familyCode);
    v34 = v100;

    v16 = v34;
  }
  groupID = self->_groupID;
  if (groupID)
  {
    v99 = v16;
    NSAppendPrintF(&v99, (uint64_t)", GID %@", v10, v11, v12, v13, v14, v15, (uint64_t)groupID);
    v36 = v99;

    v16 = v36;
  }
  if (-[NSArray count](self->_LEDs, "count"))
  {
    v98 = v16;
    NSAppendPrintF(&v98, (uint64_t)", LEDs %##@", v37, v38, v39, v40, v41, v42, (uint64_t)self->_LEDs);
    v43 = v98;

    v16 = v43;
  }
  v44 = *(uint64_t *)&self->_maxCapacity;
  if (*(double *)&v44 > 0.0)
  {
    v97 = v16;
    NSAppendPrintF(&v97, (uint64_t)", MaxC %.2f%%", v37, v38, v39, v40, v41, v42, v44);
    v45 = v97;

    v16 = v45;
  }
  partID = self->_partID;
  if (partID)
  {
    v96 = v16;
    NSAppendPrintF(&v96, (uint64_t)", PaID %@", v37, v38, v39, v40, v41, v42, (uint64_t)partID);
    v47 = v96;

    v16 = v47;
  }
  productID = self->_productID;
  if (productID)
  {
    v95 = v16;
    NSAppendPrintF(&v95, (uint64_t)", PdID %ld", v37, v38, v39, v40, v41, v42, productID);
    v49 = v95;

    v16 = v49;
  }
  vendorID = self->_vendorID;
  if (vendorID)
  {
    v94 = v16;
    NSAppendPrintF(&v94, (uint64_t)", VeID %ld", v37, v38, v39, v40, v41, v42, vendorID);
    v51 = v94;

    v16 = v51;
  }
  temperature = self->_temperature;
  if (temperature)
  {
    v93 = v16;
    NSAppendPrintF(&v93, (uint64_t)", Tmp %ld", v37, v38, v39, v40, v41, v42, temperature);
    v53 = v93;

    v16 = v53;
  }
  type = self->_type;
  if (type)
  {
    v92 = v16;
    NSAppendPrintF(&v92, (uint64_t)", Typ '%@'", v37, v38, v39, v40, v41, v42, (uint64_t)type);
    v55 = v92;

    v16 = v55;
  }
  transportType = self->_transportType;
  if (transportType)
  {
    v91 = v16;
    NSAppendPrintF(&v91, (uint64_t)", TPT '%@'", v37, v38, v39, v40, v41, v42, (uint64_t)transportType);
    v57 = v91;

    v16 = v57;
  }
  name = self->_name;
  if (name)
  {
    v90 = v16;
    NSAppendPrintF(&v90, (uint64_t)", Nm '%@'", v37, v38, v39, v40, v41, v42, (uint64_t)name);
    v59 = v90;

    v16 = v59;
  }
  if (self->_chargeLevel != 0.0)
  {
    v89 = v16;
    v60 = 43;
    if (!self->_charging)
      v60 = 45;
    NSAppendPrintF(&v89, (uint64_t)", L %c%.2f%%", v37, v38, v39, v40, v41, v42, v60);
    v61 = v89;

    v16 = v61;
  }
  powerState = self->_powerState;
  if (powerState)
  {
    v88 = v16;
    if (powerState > 3)
      v63 = "?";
    else
      v63 = off_1E25DD330[powerState - 1];
    NSAppendPrintF(&v88, (uint64_t)", St %s", v37, v38, v39, v40, v41, v42, (uint64_t)v63);
    v64 = v88;

    v16 = v64;
  }
  if ((self->_aggregate || self->_expectedComponents)
    && !-[CUPowerSource isAggregateComponent](self, "isAggregateComponent"))
  {
    v87 = v16;
    NSAppendPrintF(&v87, (uint64_t)", Components: ", v65, v66, v67, v68, v69, v70, v82);
    v71 = v87;

    if (self->_subLeft)
    {
      v86 = v71;
      NSAppendPrintF(&v86, (uint64_t)"L", v72, v73, v74, v75, v76, v77, v83);
      v78 = v86;

      v71 = v78;
    }
    if (self->_subRight)
    {
      v85 = v71;
      NSAppendPrintF(&v85, (uint64_t)"R", v72, v73, v74, v75, v76, v77, v83);
      v79 = v85;

      v71 = v79;
    }
    if (self->_subCase)
    {
      v84 = v71;
      NSAppendPrintF(&v84, (uint64_t)"C", v72, v73, v74, v75, v76, v77, v83);
      v80 = v84;

      return v80;
    }
    v16 = v71;
  }
  return v16;
}

- (id)detailedDescription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (self->_ioKitAdapterDescription)
    NSPrintF((uint64_t)"CUPowerSource %{ptr} %@Adapter %@\n", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self);
  else
    NSPrintF((uint64_t)"CUPowerSource %{ptr} %@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)publish
{
  CUPowerSource *v2;
  NSString *accessoryCategory;
  NSString *accessoryID;
  void *v5;
  void *v6;
  void *v7;
  NSString *groupID;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  unsigned int v15;
  const char *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  const char *v20;
  void *v21;
  void *v22;
  void *v23;
  NSString *name;
  NSString *partID;
  NSString *partName;
  void *v27;
  NSString *state;
  void *v29;
  NSString *transportType;
  NSString *type;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  NSString *adapterName;
  void *v37;
  void *v38;
  NSDictionary *v39;
  NSDictionary *ioKitDescription;
  id *p_ioKitDescription;
  NSDictionary *v42;
  NSDictionary *v43;
  NSDictionary *v44;
  char v45;
  int v46;
  NSDictionary *v48;
  CUPowerSource *v49;
  NSArray *obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[2];
  _QWORD v56[2];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v49 = v2;
  if (v2->_psID || (v46 = IOPSCreatePowerSource()) == 0)
  {
    v48 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    accessoryCategory = v2->_accessoryCategory;
    if (accessoryCategory)
      -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", accessoryCategory, CFSTR("Accessory Category"));
    accessoryID = v2->_accessoryID;
    if (accessoryID)
      -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", accessoryID, CFSTR("Accessory Identifier"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2->_charging, &v2->_psID);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v5, CFSTR("Is Charging"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", fabs(v2->_chargeLevel + -1.0) < 0.00000011920929);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v6, CFSTR("Is Charged"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)(v2->_chargeLevel * 100.0));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v7, CFSTR("Current Capacity"));

    groupID = v2->_groupID;
    if (groupID)
      -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", groupID, CFSTR("Group Identifier"));
    if (-[NSArray count](v2->_LEDs, "count"))
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      obj = v2->_LEDs;
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v52 != v11)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            v14 = (void *)MEMORY[0x1E0CB3940];
            v15 = objc_msgSend(v13, "LEDState");
            v16 = "?";
            if (v15 <= 2)
              v16 = off_1E25DD348[v15];
            objc_msgSend(v14, "stringWithUTF8String:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (void *)MEMORY[0x1E0CB3940];
            v19 = objc_msgSend(v13, "LEDColor");
            v20 = "?";
            if (v19 <= 3)
              v20 = off_1E25DD360[v19];
            objc_msgSend(v18, "stringWithUTF8String:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v55[0] = CFSTR("State");
            v55[1] = CFSTR("Color");
            v56[0] = v17;
            v56[1] = v21;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v22);

          }
          v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
        }
        while (v10);
      }

      -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v9, CFSTR("LEDs"));
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v2->_maxCapacity);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v23, CFSTR("Max Capacity"));

    name = v2->_name;
    if (name)
      -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", name, CFSTR("Name"));
    partID = v2->_partID;
    if (partID)
      -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", partID, CFSTR("Part Identifier"));
    partName = v2->_partName;
    if (partName)
      -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", partName, CFSTR("Part Name"));
    if (v2->_productID)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v27, CFSTR("Product ID"));

    }
    state = v2->_state;
    if (state)
      -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", state, CFSTR("Power Source State"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2->_temperature);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v29, CFSTR("Temperature"));

    transportType = v2->_transportType;
    if (transportType)
      -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", transportType, CFSTR("Transport Type"));
    type = v2->_type;
    if (type)
      -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", type, CFSTR("Type"));
    if (v2->_vendorID)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v32, CFSTR("Vendor ID"));

    }
    if (-[NSString isEqual:](v2->_type, "isEqual:", CFSTR("Accessory Source")))
    {
      v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (v2->_adapterErrorFlags)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v34, CFSTR("ErrorFlags"));

      }
      if (v2->_adapterFamilyCode)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v35, CFSTR("FamilyCode"));

      }
      adapterName = v2->_adapterName;
      if (adapterName)
        objc_msgSend(v33, "setObject:forKeyedSubscript:", adapterName, CFSTR("Name"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2->_adapterSharedSource);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v37, CFSTR("SharedSource"));

      if (v2->_adapterSourceID)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v38, CFSTR("Source"));

      }
      -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v33, CFSTR("AdapterDetails"));

    }
    v39 = v48;
    if (!v48)
      goto LABEL_57;
    p_ioKitDescription = (id *)&v2->_ioKitDescription;
    ioKitDescription = v2->_ioKitDescription;
    v42 = v48;
    v43 = ioKitDescription;
    if (v42 == v43)
    {

      v39 = v48;
    }
    else
    {
      v44 = v43;
      if (v43)
      {
        v45 = -[NSDictionary isEqual:](v42, "isEqual:", v43);

        v39 = v48;
        if ((v45 & 1) != 0)
          goto LABEL_57;
      }
      else
      {

        v39 = v48;
      }
      objc_storeStrong(p_ioKitDescription, v39);
      v46 = IOPSSetPowerSourceDetails();
      v39 = v48;
      if (v46)
        goto LABEL_58;
    }
LABEL_57:
    v46 = 0;
    v42 = v39;
    goto LABEL_58;
  }
  v42 = 0;
LABEL_58:

  objc_sync_exit(v49);
  return v46;
}

- (void)invalidate
{
  CUPowerSource *subLeft;
  CUPowerSource *subRight;
  CUPowerSource *subCase;
  CUPowerSource *subMain;
  CUPowerSource *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_psID)
  {
    IOPSReleasePowerSource();
    obj->_psID = 0;
  }
  -[CUPowerSource invalidate](obj->_subLeft, "invalidate");
  subLeft = obj->_subLeft;
  obj->_subLeft = 0;

  -[CUPowerSource invalidate](obj->_subRight, "invalidate");
  subRight = obj->_subRight;
  obj->_subRight = 0;

  -[CUPowerSource invalidate](obj->_subCase, "invalidate");
  subCase = obj->_subCase;
  obj->_subCase = 0;

  -[CUPowerSource invalidate](obj->_subMain, "invalidate");
  subMain = obj->_subMain;
  obj->_subMain = 0;

  objc_sync_exit(obj);
}

- (NSArray)LEDs
{
  if (self->_LEDs)
    return self->_LEDs;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)handleSubComponentsUpdated
{
  -[CUPowerSource handleSubComponentsUpdatedWithBaseSource:](self, "handleSubComponentsUpdatedWithBaseSource:", 0);
}

- (void)handleSubComponentsUpdatedWithBaseSource:(id)a3
{
  CUPowerSource *v4;
  CUPowerSource *subLeft;
  CUPowerSource *v6;
  void *v7;
  void *v8;
  NSString *accessoryID;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  char v13;
  int64_t v14;
  int64_t v15;
  void *v16;
  NSString *adapterName;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  char v21;
  _BOOL4 v22;
  int64_t v23;
  _BOOL4 v24;
  double v25;
  double v26;
  double v27;
  CUPowerSource *v28;
  double v29;
  double v30;
  CUPowerSource *subRight;
  double v32;
  double v33;
  CUPowerSource *subCase;
  double v35;
  double v36;
  unsigned int v37;
  void *v38;
  NSString *groupID;
  NSString *v40;
  NSString *v41;
  NSString *v42;
  char v43;
  double v44;
  double v45;
  double v46;
  CUPowerSource *v47;
  double v48;
  double v49;
  CUPowerSource *v50;
  double v51;
  double v52;
  CUPowerSource *v53;
  double v54;
  double v55;
  void *v56;
  NSString *name;
  NSString *v58;
  NSString *v59;
  NSString *v60;
  char v61;
  int64_t v62;
  int64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  CUPowerSource *v69;
  CUPowerSource *v70;

  v4 = (CUPowerSource *)a3;
  subLeft = v4;
  if (v4 || (subLeft = self->_subLeft) != 0 || (subLeft = self->_subRight) != 0)
  {
    v69 = subLeft;

    v6 = v69;
    goto LABEL_5;
  }
  v6 = self->_subCase;
  if (v6)
  {
LABEL_5:
    v70 = v6;
    -[CUPowerSource accessoryID](v6, "accessoryID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
      goto LABEL_13;
    accessoryID = self->_accessoryID;
    v10 = v7;
    v11 = accessoryID;
    if (v10 == v11)
    {

      goto LABEL_13;
    }
    v12 = v11;
    if (v11)
    {
      v13 = -[NSString isEqual:](v10, "isEqual:", v11);

      if ((v13 & 1) != 0)
      {
LABEL_13:
        v14 = -[CUPowerSource adapterErrorFlags](v70, "adapterErrorFlags");
        if (v14 != self->_adapterErrorFlags)
          self->_adapterErrorFlags = v14;
        v15 = -[CUPowerSource adapterFamilyCode](v70, "adapterFamilyCode");
        if (v15 != self->_adapterFamilyCode)
          self->_adapterFamilyCode = v15;
        -[CUPowerSource adapterName](v70, "adapterName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          adapterName = self->_adapterName;
          v18 = v16;
          v19 = adapterName;
          if (v18 == v19)
          {

            goto LABEL_25;
          }
          v20 = v19;
          if (v19)
          {
            v21 = -[NSString isEqual:](v18, "isEqual:", v19);

            if ((v21 & 1) != 0)
              goto LABEL_25;
          }
          else
          {

          }
          objc_storeStrong((id *)&self->_adapterName, v16);
        }
LABEL_25:
        v22 = -[CUPowerSource adapterSharedSource](v70, "adapterSharedSource");
        if (self->_adapterSharedSource != v22)
          self->_adapterSharedSource = v22;
        v23 = -[CUPowerSource adapterSourceID](v70, "adapterSourceID");
        if (v23 != self->_adapterSourceID)
          self->_adapterSourceID = v23;
        v24 = 1;
        self->_aggregate = 1;
        if (!-[CUPowerSource charging](v70, "charging"))
          v24 = -[CUPowerSource adapterSourceID](v70, "adapterSourceID") >= 1
             && -[CUPowerSource adapterSourceID](v70, "adapterSourceID") != 0xFFFF;
        if (self->_charging != v24)
          self->_charging = v24;
        -[CUPowerSource chargeLevel](v70, "chargeLevel");
        v25 = 1.79769313e308;
        if (v26 < 1.79769313e308)
        {
          -[CUPowerSource chargeLevel](v70, "chargeLevel");
          v25 = v27;
        }
        v28 = self->_subLeft;
        if (v28)
        {
          -[CUPowerSource chargeLevel](v28, "chargeLevel");
          if (v29 < v25)
          {
            -[CUPowerSource chargeLevel](self->_subLeft, "chargeLevel");
            v25 = v30;
          }
        }
        subRight = self->_subRight;
        if (subRight)
        {
          -[CUPowerSource chargeLevel](subRight, "chargeLevel");
          if (v32 < v25)
          {
            -[CUPowerSource chargeLevel](self->_subRight, "chargeLevel");
            v25 = v33;
          }
        }
        subCase = self->_subCase;
        if (subCase)
        {
          -[CUPowerSource chargeLevel](subCase, "chargeLevel");
          if (v35 < v25)
          {
            -[CUPowerSource chargeLevel](self->_subCase, "chargeLevel");
            v25 = v36;
          }
        }
        if (v25 != 1.79769313e308 && v25 != self->_chargeLevel)
          self->_chargeLevel = v25;
        v37 = -[CUPowerSource expectedComponents](v70, "expectedComponents");
        if (v37 != self->_expectedComponents)
          self->_expectedComponents = v37;
        -[CUPowerSource groupID](v70, "groupID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          groupID = self->_groupID;
          v40 = v38;
          v41 = groupID;
          if (v40 == v41)
          {

            goto LABEL_59;
          }
          v42 = v41;
          if (v41)
          {
            v43 = -[NSString isEqual:](v40, "isEqual:", v41);

            if ((v43 & 1) != 0)
              goto LABEL_59;
          }
          else
          {

          }
          objc_storeStrong((id *)&self->_groupID, v38);
        }
LABEL_59:
        -[CUPowerSource chargeLevel](v70, "chargeLevel");
        v44 = 2.22507386e-308;
        if (v45 > 2.22507386e-308)
        {
          -[CUPowerSource maxCapacity](v70, "maxCapacity");
          v44 = v46;
        }
        v47 = self->_subLeft;
        if (v47)
        {
          -[CUPowerSource chargeLevel](v47, "chargeLevel");
          if (v48 > v44)
          {
            -[CUPowerSource maxCapacity](self->_subLeft, "maxCapacity");
            v44 = v49;
          }
        }
        v50 = self->_subRight;
        if (v50)
        {
          -[CUPowerSource chargeLevel](v50, "chargeLevel");
          if (v51 > v44)
          {
            -[CUPowerSource maxCapacity](self->_subRight, "maxCapacity");
            v44 = v52;
          }
        }
        v53 = self->_subCase;
        if (v53)
        {
          -[CUPowerSource chargeLevel](v53, "chargeLevel");
          if (v54 > v44)
          {
            -[CUPowerSource maxCapacity](self->_subCase, "maxCapacity");
            v44 = v55;
          }
        }
        if (v44 != 2.22507386e-308 && v44 != self->_maxCapacity)
          self->_maxCapacity = v44;
        -[CUPowerSource name](v70, "name");
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v56)
          goto LABEL_81;
        name = self->_name;
        v58 = v56;
        v59 = name;
        if (v58 == v59)
        {

        }
        else
        {
          v60 = v59;
          if (v59)
          {
            v61 = -[NSString isEqual:](v58, "isEqual:", v59);

            if ((v61 & 1) != 0)
              goto LABEL_81;
          }
          else
          {

          }
          objc_storeStrong((id *)&self->_name, v56);
        }
LABEL_81:
        v62 = -[CUPowerSource productID](v70, "productID");
        if (v62 != self->_productID)
          self->_productID = v62;
        v63 = -[CUPowerSource vendorID](v70, "vendorID");
        if (v63 != self->_vendorID)
          self->_vendorID = v63;
        goto LABEL_85;
      }
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_accessoryID, v8);
    goto LABEL_13;
  }
  if (gLogCategory_CUPowerSourceMonitor <= 60
    && (gLogCategory_CUPowerSourceMonitor != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x3Cu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPowerSourceMonitor, (uint64_t)"-[CUPowerSource handleSubComponentsUpdatedWithBaseSource:]", 0x3Cu, (uint64_t)"### Updating aggregate without subcomponents?", v64, v65, v66, v67, v68);
  }
  v70 = 0;
  v56 = 0;
LABEL_85:

}

- (BOOL)isAggregateComponent
{
  return -[NSString isEqualToString:](self->_accessoryCategory, "isEqualToString:", CFSTR("Audio Battery Case"))
      || -[NSString isEqualToString:](self->_accessoryCategory, "isEqualToString:", CFSTR("Headphone"));
}

- (unsigned)updateWithPowerAdapterDetails:(id)a3
{
  const __CFDictionary *v5;
  int Int64Ranged;
  unsigned int v7;
  CFTypeID TypeID;
  void *v9;
  NSString *adapterName;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  NSString *v15;
  NSString *v16;
  _BOOL4 v17;
  int v18;
  int v19;

  v5 = (const __CFDictionary *)a3;
  objc_storeStrong((id *)&self->_ioKitAdapterDescription, a3);
  Int64Ranged = CFDictionaryGetInt64Ranged(v5, CFSTR("FamilyCode"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  if (Int64Ranged == self->_adapterFamilyCode)
  {
    v7 = 0;
  }
  else
  {
    self->_adapterFamilyCode = Int64Ranged;
    v7 = 256;
  }
  TypeID = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v5, CFSTR("Name"), TypeID, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  adapterName = self->_adapterName;
  v11 = v9;
  v12 = adapterName;
  if (v11 == v12)
  {

    v15 = v11;
LABEL_11:

    goto LABEL_12;
  }
  v13 = v12;
  if ((v11 == 0) == (v12 != 0))
  {

    goto LABEL_10;
  }
  v14 = -[NSString isEqual:](v11, "isEqual:", v12);

  if ((v14 & 1) == 0)
  {
LABEL_10:
    v16 = v11;
    v15 = self->_adapterName;
    self->_adapterName = v16;
    v7 = 256;
    goto LABEL_11;
  }
LABEL_12:
  v17 = CFDictionaryGetInt64(v5, CFSTR("SharedSource"), 0) != 0;
  if (self->_adapterSharedSource != v17)
  {
    self->_adapterSharedSource = v17;
    v7 = 256;
  }
  v18 = CFDictionaryGetInt64Ranged(v5, CFSTR("Source"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  if (v18 != self->_adapterSourceID)
  {
    self->_adapterSourceID = v18;
    v7 = 256;
  }
  v19 = CFDictionaryGetInt64Ranged(v5, CFSTR("ErrorFlags"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  if (v19 != self->_adapterErrorFlags)
  {
    self->_adapterErrorFlags = v19;
    v7 |= 0x100u;
  }

  return v7;
}

- (void)updateWithPowerSource:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0CB36F8];
  v5 = a3;
  v9 = (id)objc_msgSend([v4 alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(v5, "encodeWithCoder:", v9);

  v6 = objc_alloc(MEMORY[0x1E0CB3710]);
  objc_msgSend(v9, "encodedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initForReadingFromData:error:", v7, 0);

  -[CUPowerSource _updateWithCoder:](self, "_updateWithCoder:", v8);
  objc_msgSend(v8, "finishDecoding");

}

- (unsigned)updateWithPowerSourceDescription:(id)a3
{
  const __CFDictionary *v5;
  CFTypeID TypeID;
  void *v7;
  void *v8;
  NSString *accessoryCategory;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  char v13;
  unsigned int v14;
  CFTypeID v15;
  void *v16;
  NSString *accessoryID;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  char v21;
  unint64_t Int64;
  unint64_t v23;
  _BOOL4 v24;
  _BOOL4 v25;
  double Double;
  double v27;
  double v28;
  CFTypeID v29;
  void *v30;
  NSString *groupID;
  NSString *v32;
  NSString *v33;
  NSString *v34;
  char v35;
  NSString *v36;
  const char *v37;
  const char *v38;
  unsigned int v39;
  CFTypeID v40;
  void *v41;
  NSArray *LEDs;
  NSArray *v43;
  NSArray *v44;
  NSArray *v45;
  char v46;
  id v47;
  NSArray *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  const __CFDictionary *v53;
  CUPowerSourceLEDInfo *v54;
  CFTypeID v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  CFTypeID v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  NSArray *v64;
  CFTypeID v65;
  void *v66;
  NSString *name;
  NSString *v68;
  NSString *v69;
  NSString *v70;
  char v71;
  CFTypeID v72;
  void *v73;
  NSString *partID;
  NSString *v75;
  NSString *v76;
  NSString *v77;
  char v78;
  CFTypeID v79;
  void *v80;
  NSString *partName;
  NSString *v82;
  NSString *v83;
  NSString *v84;
  char v85;
  CFTypeID v86;
  void *v87;
  int v88;
  int Int64Ranged;
  CFTypeID v90;
  void *v91;
  NSString *state;
  NSString *v93;
  NSString *v94;
  NSString *v95;
  char v96;
  int v97;
  CFTypeID v98;
  void *v99;
  NSString *transportType;
  NSString *v101;
  NSString *v102;
  NSString *v103;
  char v104;
  CFTypeID v105;
  void *v106;
  NSString *type;
  NSString *v108;
  NSString *v109;
  NSString *v110;
  char v111;
  int v112;
  CFTypeID v113;
  void *v114;
  void *v115;
  NSDictionary *ioKitAdapterDescription;
  NSDictionary *v117;
  NSDictionary *v118;
  NSDictionary *v119;
  char v120;
  void *v122;
  unsigned int v123;
  CUPowerSource *v124;
  const __CFDictionary *v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _BYTE v130[128];
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v5 = (const __CFDictionary *)a3;
  objc_storeStrong((id *)&self->_ioKitDescription, a3);
  self->_present = 1;
  TypeID = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v5, CFSTR("Accessory Category"), TypeID, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    goto LABEL_7;
  accessoryCategory = self->_accessoryCategory;
  v10 = v7;
  v11 = accessoryCategory;
  if (v10 == v11)
  {

    goto LABEL_7;
  }
  v12 = v11;
  if (v11)
  {
    v13 = -[NSString isEqual:](v10, "isEqual:", v11);

    if ((v13 & 1) == 0)
      goto LABEL_9;
LABEL_7:
    v14 = 0;
    goto LABEL_10;
  }

LABEL_9:
  objc_storeStrong((id *)&self->_accessoryCategory, v8);
  v14 = 1;
LABEL_10:
  v15 = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v5, CFSTR("Accessory Identifier"), v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    goto LABEL_18;
  accessoryID = self->_accessoryID;
  v18 = v16;
  v19 = accessoryID;
  if (v18 == v19)
  {

    goto LABEL_18;
  }
  v20 = v19;
  if (!v19)
  {

    goto LABEL_17;
  }
  v21 = -[NSString isEqual:](v18, "isEqual:", v19);

  if ((v21 & 1) == 0)
  {
LABEL_17:
    objc_storeStrong((id *)&self->_accessoryID, v16);
    v14 = 1;
  }
LABEL_18:
  Int64 = CFDictionaryGetInt64(v5, CFSTR("Is Charging"), 0);
  v23 = CFDictionaryGetInt64(v5, CFSTR("Show Charging UI"), 0);
  v24 = v23 != 0;
  v25 = (Int64 | v23) != 0;
  if (self->_charging != v25)
  {
    self->_charging = v25;
    v14 |= 4u;
  }
  if (self->_showChargingUI != v24)
  {
    self->_showChargingUI = v24;
    v14 |= 4u;
  }
  Double = CFDictionaryGetDouble(v5, CFSTR("Current Capacity"), 0);
  v27 = CFDictionaryGetDouble(v5, CFSTR("Max Capacity"), 0);
  v28 = Double / v27;
  if (v27 <= 0.0)
    v28 = 1.0;
  if (v28 > 1.0)
    v28 = 1.0;
  if (v28 < 0.0)
    v28 = 0.0;
  if (v28 != self->_chargeLevel)
  {
    self->_chargeLevel = v28;
    v14 |= 2u;
  }
  v29 = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v5, CFSTR("Group Identifier"), v29, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    groupID = self->_groupID;
    v32 = v30;
    v33 = groupID;
    if (v32 == v33)
    {

    }
    else
    {
      v34 = v33;
      if (v33)
      {
        v35 = -[NSString isEqual:](v32, "isEqual:", v33);

        if ((v35 & 1) != 0)
          goto LABEL_38;
      }
      else
      {

      }
      objc_storeStrong((id *)&self->_groupID, v30);
      v14 |= 1u;
    }
  }
LABEL_38:
  v36 = self->_groupID;
  if (v36)
  {
    v37 = -[NSString UTF8String](v36, "UTF8String");
    if (v37)
    {
      v38 = v37;
      if (!strcasecmp(v37, "left"))
      {
        v39 = 1;
      }
      else if (!strcasecmp(v38, "right"))
      {
        v39 = 2;
      }
      else if (!strcasecmp(v38, "case"))
      {
        v39 = 4;
      }
      else if (!strcasecmp(v38, "leftRight"))
      {
        v39 = 3;
      }
      else if (!strcasecmp(v38, "leftCase"))
      {
        v39 = 5;
      }
      else if (!strcasecmp(v38, "rightCase"))
      {
        v39 = 6;
      }
      else
      {
        v39 = !strcasecmp(v38, "leftRightCase") ? 7 : 0;
      }
    }
    else
    {
      v39 = 0;
    }
    if (v39 != self->_expectedComponents)
    {
      self->_expectedComponents = v39;
      self->_aggregate = v39 != 0;
      v14 |= 1u;
    }
  }
  v40 = CFArrayGetTypeID();
  CFDictionaryGetTypedValue(v5, CFSTR("LEDs"), v40, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v41, "count"))
  {
    LEDs = self->_LEDs;
    v43 = v41;
    v44 = LEDs;
    if (v43 == v44)
    {

      goto LABEL_91;
    }
    v45 = v44;
    if ((v43 == 0) != (v44 != 0))
    {
      v46 = -[NSArray isEqual:](v43, "isEqual:", v44);

      if ((v46 & 1) != 0)
        goto LABEL_91;
    }
    else
    {

    }
    v122 = v30;
    v123 = v14;
    v124 = self;
    v125 = v5;
    v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    v129 = 0u;
    v48 = v43;
    v49 = -[NSArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v126, v130, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v127;
      do
      {
        for (i = 0; i != v50; ++i)
        {
          if (*(_QWORD *)v127 != v51)
            objc_enumerationMutation(v48);
          v53 = *(const __CFDictionary **)(*((_QWORD *)&v126 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v54 = objc_alloc_init(CUPowerSourceLEDInfo);
            v55 = CFStringGetTypeID();
            v56 = (const char *)-[__CFDictionary UTF8String](objc_retainAutorelease(CFDictionaryGetTypedValue(v53, CFSTR("Color"), v55, 0)), "UTF8String");
            if (v56)
            {
              v57 = v56;
              if (!strcmp(v56, "Green"))
              {
                v58 = 1;
              }
              else if (!strcmp(v57, "Orange"))
              {
                v58 = 2;
              }
              else if (!strcmp(v57, "White"))
              {
                v58 = 3;
              }
              else
              {
                v58 = 0;
              }
              -[CUPowerSourceLEDInfo setLEDColor:](v54, "setLEDColor:", v58);
            }
            v59 = CFStringGetTypeID();
            v60 = (const char *)-[__CFDictionary UTF8String](objc_retainAutorelease(CFDictionaryGetTypedValue(v53, CFSTR("State"), v59, 0)), "UTF8String");
            if (v60)
            {
              v61 = v60;
              if (!strcmp(v60, "Off"))
              {
                v62 = 0;
              }
              else if (!strcmp(v61, "Solid"))
              {
                v62 = 1;
              }
              else
              {
                v62 = 2 * (strcmp(v61, "Blinking") == 0);
              }
              -[CUPowerSourceLEDInfo setLEDState:](v54, "setLEDState:", v62);
            }
            objc_msgSend(v47, "addObject:", v54);

          }
        }
        v50 = -[NSArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v126, v130, 16);
      }
      while (v50);
    }

    v63 = objc_msgSend(v47, "copy");
    self = v124;
    v64 = v124->_LEDs;
    v124->_LEDs = (NSArray *)v63;

    v14 = v123 | 1;
    v5 = v125;
    v30 = v122;
  }
LABEL_91:
  if (v27 != self->_maxCapacity)
  {
    self->_maxCapacity = v27;
    v14 |= 4u;
  }
  v65 = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v5, CFSTR("Name"), v65, 0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    name = self->_name;
    v68 = v66;
    v69 = name;
    if (v68 == v69)
    {

      goto LABEL_101;
    }
    v70 = v69;
    if (v69)
    {
      v71 = -[NSString isEqual:](v68, "isEqual:", v69);

      if ((v71 & 1) != 0)
        goto LABEL_101;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_name, v66);
    v14 |= 1u;
  }
LABEL_101:
  v72 = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v5, CFSTR("Part Identifier"), v72, 0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v73)
    goto LABEL_109;
  partID = self->_partID;
  v75 = v73;
  v76 = partID;
  if (v75 == v76)
  {

    goto LABEL_109;
  }
  v77 = v76;
  if (!v76)
  {

    goto LABEL_108;
  }
  v78 = -[NSString isEqual:](v75, "isEqual:", v76);

  if ((v78 & 1) == 0)
  {
LABEL_108:
    objc_storeStrong((id *)&self->_partID, v73);
    v14 |= 1u;
  }
LABEL_109:
  v79 = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v5, CFSTR("Part Name"), v79, 0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  if (v80)
  {
    partName = self->_partName;
    v82 = v80;
    v83 = partName;
    if (v82 == v83)
    {

    }
    else
    {
      v84 = v83;
      if (v83)
      {
        v85 = -[NSString isEqual:](v82, "isEqual:", v83);

        if ((v85 & 1) != 0)
          goto LABEL_117;
      }
      else
      {

      }
      objc_storeStrong((id *)&self->_partName, v80);
      v14 |= 1u;
    }
  }
LABEL_117:
  v86 = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v5, CFSTR("Power Source State"), v86, 0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v87, "isEqual:", CFSTR("AC Power")) & 1) != 0
    || objc_msgSend(v87, "isEqual:", CFSTR("UPS Power")))
  {
    if (CFDictionaryGetInt64(v5, CFSTR("Is Charged"), 0)
      || CFDictionaryGetInt64(v5, CFSTR("Is Finishing Charge"), 0))
    {
      v88 = 3;
    }
    else
    {
      v88 = 2;
    }
  }
  else
  {
    v88 = 1;
  }
  if (v88 != self->_powerState)
  {
    self->_powerState = v88;
    v14 |= 4u;
  }
  Int64Ranged = CFDictionaryGetInt64Ranged(v5, CFSTR("Product ID"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  if (Int64Ranged != self->_productID)
  {
    self->_productID = Int64Ranged;
    v14 |= 1u;
  }
  v90 = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v5, CFSTR("Power Source State"), v90, 0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  if (v91)
  {
    state = self->_state;
    v93 = v91;
    v94 = state;
    if (v93 == v94)
    {

      goto LABEL_136;
    }
    v95 = v94;
    if (v94)
    {
      v96 = -[NSString isEqual:](v93, "isEqual:", v94);

      if ((v96 & 1) != 0)
        goto LABEL_136;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_state, v91);
    v14 |= 4u;
  }
LABEL_136:
  v97 = CFDictionaryGetInt64Ranged(v5, CFSTR("Temperature"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  if (v97 != self->_temperature)
  {
    self->_temperature = v97;
    v14 |= 1u;
  }
  v98 = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v5, CFSTR("Transport Type"), v98, 0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  if (v99)
  {
    transportType = self->_transportType;
    v101 = v99;
    v102 = transportType;
    if (v101 == v102)
    {

      goto LABEL_146;
    }
    v103 = v102;
    if (v102)
    {
      v104 = -[NSString isEqual:](v101, "isEqual:", v102);

      if ((v104 & 1) != 0)
        goto LABEL_146;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_transportType, v99);
    v14 |= 1u;
  }
LABEL_146:
  v105 = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v5, CFSTR("Type"), v105, 0);
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v106)
    goto LABEL_154;
  type = self->_type;
  v108 = v106;
  v109 = type;
  if (v108 == v109)
  {

    goto LABEL_154;
  }
  v110 = v109;
  if (!v109)
  {

    goto LABEL_153;
  }
  v111 = -[NSString isEqual:](v108, "isEqual:", v109);

  if ((v111 & 1) == 0)
  {
LABEL_153:
    objc_storeStrong((id *)&self->_type, v106);
    v14 |= 1u;
  }
LABEL_154:
  v112 = CFDictionaryGetInt64Ranged(v5, CFSTR("Vendor ID"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  if (v112 != self->_vendorID)
  {
    self->_vendorID = v112;
    v14 |= 1u;
  }
  if (-[NSString isEqual:](self->_type, "isEqual:", CFSTR("Accessory Source")))
  {
    v113 = CFDictionaryGetTypeID();
    CFDictionaryGetTypedValue(v5, CFSTR("AdapterDetails"), v113, 0);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = v114;
    if (v114)
    {
      ioKitAdapterDescription = self->_ioKitAdapterDescription;
      v117 = v114;
      v118 = ioKitAdapterDescription;
      if (v117 == v118)
      {

      }
      else
      {
        v119 = v118;
        if (v118)
        {
          v120 = -[NSDictionary isEqual:](v117, "isEqual:", v118);

          if ((v120 & 1) != 0)
            goto LABEL_165;
        }
        else
        {

        }
        v14 |= -[CUPowerSource updateWithPowerAdapterDetails:](self, "updateWithPowerAdapterDetails:", v117);
      }
    }
LABEL_165:

  }
  return v14;
}

- (NSString)accessoryCategory
{
  return self->_accessoryCategory;
}

- (void)setAccessoryCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)accessoryID
{
  return self->_accessoryID;
}

- (void)setAccessoryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)aggregate
{
  return self->_aggregate;
}

- (void)setAggregate:(BOOL)a3
{
  self->_aggregate = a3;
}

- (BOOL)charging
{
  return self->_charging;
}

- (void)setCharging:(BOOL)a3
{
  self->_charging = a3;
}

- (double)chargeLevel
{
  return self->_chargeLevel;
}

- (void)setChargeLevel:(double)a3
{
  self->_chargeLevel = a3;
}

- (unsigned)expectedComponents
{
  return self->_expectedComponents;
}

- (void)setExpectedComponents:(unsigned int)a3
{
  self->_expectedComponents = a3;
}

- (int64_t)familyCode
{
  return self->_familyCode;
}

- (void)setFamilyCode:(int64_t)a3
{
  self->_familyCode = a3;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setLEDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (double)maxCapacity
{
  return self->_maxCapacity;
}

- (void)setMaxCapacity:(double)a3
{
  self->_maxCapacity = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)partID
{
  return self->_partID;
}

- (void)setPartID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)partName
{
  return self->_partName;
}

- (void)setPartName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (int)powerState
{
  return self->_powerState;
}

- (void)setPowerState:(int)a3
{
  self->_powerState = a3;
}

- (int64_t)productID
{
  return self->_productID;
}

- (void)setProductID:(int64_t)a3
{
  self->_productID = a3;
}

- (int)role
{
  return self->_role;
}

- (void)setRole:(int)a3
{
  self->_role = a3;
}

- (BOOL)showChargingUI
{
  return self->_showChargingUI;
}

- (void)setShowChargingUI:(BOOL)a3
{
  self->_showChargingUI = a3;
}

- (int64_t)sourceID
{
  return self->_sourceID;
}

- (void)setSourceID:(int64_t)a3
{
  self->_sourceID = a3;
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (CUPowerSource)subLeft
{
  return self->_subLeft;
}

- (void)setSubLeft:(id)a3
{
  objc_storeStrong((id *)&self->_subLeft, a3);
}

- (CUPowerSource)subRight
{
  return self->_subRight;
}

- (void)setSubRight:(id)a3
{
  objc_storeStrong((id *)&self->_subRight, a3);
}

- (CUPowerSource)subCase
{
  return self->_subCase;
}

- (void)setSubCase:(id)a3
{
  objc_storeStrong((id *)&self->_subCase, a3);
}

- (CUPowerSource)subMain
{
  return self->_subMain;
}

- (void)setSubMain:(id)a3
{
  objc_storeStrong((id *)&self->_subMain, a3);
}

- (int64_t)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(int64_t)a3
{
  self->_temperature = a3;
}

- (NSString)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (int64_t)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(int64_t)a3
{
  self->_vendorID = a3;
}

- (int64_t)adapterErrorFlags
{
  return self->_adapterErrorFlags;
}

- (void)setAdapterErrorFlags:(int64_t)a3
{
  self->_adapterErrorFlags = a3;
}

- (int64_t)adapterFamilyCode
{
  return self->_adapterFamilyCode;
}

- (void)setAdapterFamilyCode:(int64_t)a3
{
  self->_adapterFamilyCode = a3;
}

- (NSString)adapterName
{
  return self->_adapterName;
}

- (void)setAdapterName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (BOOL)adapterSharedSource
{
  return self->_adapterSharedSource;
}

- (void)setAdapterSharedSource:(BOOL)a3
{
  self->_adapterSharedSource = a3;
}

- (int64_t)adapterSourceID
{
  return self->_adapterSourceID;
}

- (void)setAdapterSourceID:(int64_t)a3
{
  self->_adapterSourceID = a3;
}

- (NSDictionary)ioKitAdapterDescription
{
  return self->_ioKitAdapterDescription;
}

- (void)setIoKitAdapterDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSDictionary)ioKitDescription
{
  return self->_ioKitDescription;
}

- (void)setIoKitDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (BOOL)present
{
  return self->_present;
}

- (void)setPresent:(BOOL)a3
{
  self->_present = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ioKitDescription, 0);
  objc_storeStrong((id *)&self->_ioKitAdapterDescription, 0);
  objc_storeStrong((id *)&self->_adapterName, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_transportType, 0);
  objc_storeStrong((id *)&self->_subMain, 0);
  objc_storeStrong((id *)&self->_subCase, 0);
  objc_storeStrong((id *)&self->_subRight, 0);
  objc_storeStrong((id *)&self->_subLeft, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_partName, 0);
  objc_storeStrong((id *)&self->_partID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_LEDs, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_accessoryID, 0);
  objc_storeStrong((id *)&self->_accessoryCategory, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
