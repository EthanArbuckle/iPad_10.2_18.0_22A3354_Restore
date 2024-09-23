@implementation CRAccNavComponent

- (CRAccNavComponent)initWithAccessoryUID:(id)a3 component:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  CRAccNavComponent *v10;

  v6 = (void *)MEMORY[0x24BDD1880];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CRAccNavComponent initWithUUID:accessoryUID:component:](self, "initWithUUID:accessoryUID:component:", v9, v8, v7);

  return v10;
}

- (CRAccNavComponent)initWithUUID:(id)a3 accessoryUID:(id)a4 component:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRAccNavComponent *v12;
  CRAccNavComponent *v13;
  uint64_t v14;
  NSNumber *componentIdentifier;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRAccNavComponent;
  v12 = -[CRAccNavComponent init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uuid, a3);
    objc_storeStrong((id *)&v13->_accessoryUID, a4);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v11, "identifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    componentIdentifier = v13->_componentIdentifier;
    v13->_componentIdentifier = (NSNumber *)v14;

    objc_storeStrong((id *)&v13->_component, a5);
  }

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CRAccNavComponent uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAccNavComponent componentIdentifier](self, "componentIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAccNavComponent accessoryUID](self, "accessoryUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@ identifier=%@ accessory=%@>"), v4, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)configDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[14];

  v49[12] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CRAccNavComponent component](self, "component");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\tmaxLength_CurrentRoadName: %lu"), objc_msgSend(v48, "maxLength_CurrentRoadName"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v47;
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[CRAccNavComponent component](self, "component");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("\tmaxLength_DestinationRoadName: %lu"), objc_msgSend(v46, "maxLength_DestinationRoadName"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v45;
  v5 = (void *)MEMORY[0x24BDD17C8];
  -[CRAccNavComponent component](self, "component");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("\tmaxLength_PostManeuverRoadName: %lu"), objc_msgSend(v44, "maxLength_PostManeuverRoadName"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v43;
  v6 = (void *)MEMORY[0x24BDD17C8];
  -[CRAccNavComponent component](self, "component");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("\tmaxLength_ManeuverDescription: %lu"), objc_msgSend(v42, "maxLength_ManeuverDescription"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v41;
  v7 = (void *)MEMORY[0x24BDD17C8];
  -[CRAccNavComponent component](self, "component");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("\tmaxLength_LaneGuidanceDescription: %lu"), objc_msgSend(v40, "maxLength_LaneGuidanceDescription"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v39;
  v8 = (void *)MEMORY[0x24BDD17C8];
  -[CRAccNavComponent component](self, "component");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v38, "requestSourceName"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v8, "stringWithFormat:", CFSTR("\trequestSourceName: %@"), v9);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v49[5] = v37;
  v10 = (void *)MEMORY[0x24BDD17C8];
  -[CRAccNavComponent component](self, "component");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v36, "requestSourceSupportsRouteGuidance"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v10, "stringWithFormat:", CFSTR("\trequestSourceSupportsRouteGuidance: %@"), v11);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v49[6] = v35;
  v12 = (void *)MEMORY[0x24BDD17C8];
  -[CRAccNavComponent component](self, "component");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "supportsExitInfo"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(v12, "stringWithFormat:", CFSTR("\tsupportsExitInfo: %@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v49[7] = v14;
  v15 = (void *)MEMORY[0x24BDD17C8];
  -[CRAccNavComponent component](self, "component");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "supportsLaneGuidance"))
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  objc_msgSend(v15, "stringWithFormat:", CFSTR("\tsupportsLaneGuidance: %@"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v49[8] = v18;
  v19 = (void *)MEMORY[0x24BDD17C8];
  -[CRAccNavComponent component](self, "component");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "supportsTimeZoneOffset"))
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  objc_msgSend(v19, "stringWithFormat:", CFSTR("\tsupportsTimeZoneOffset: %@"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v49[9] = v22;
  v23 = (void *)MEMORY[0x24BDD17C8];
  -[CRAccNavComponent component](self, "component");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("\tmaxCapacity_GuidanceManeuver: %lu"), objc_msgSend(v24, "maxCapacity_GuidanceManeuver"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v49[10] = v25;
  v26 = (void *)MEMORY[0x24BDD17C8];
  -[CRAccNavComponent component](self, "component");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("\tmaxCapacity_LaneGuidance: %lu"), objc_msgSend(v27, "maxCapacity_LaneGuidance"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v49[11] = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 12);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v29, "componentsJoinedByString:", CFSTR(",\n"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithFormat:", CFSTR("{\n%@\n}"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v32;
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
  -[CRAccNavComponent uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_uuid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[CRAccNavComponent accessoryUID](self, "accessoryUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_accessoryUID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[CRAccNavComponent component](self, "component");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_component);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v9);

}

- (CRAccNavComponent)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CRAccNavComponent *v14;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_uuid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_accessoryUID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  NSStringFromSelector(sel_component);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[CRAccNavComponent initWithUUID:accessoryUID:component:](self, "initWithUUID:accessoryUID:component:", v7, v10, v13);
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRAccNavComponent *v4;
  void *v5;
  void *v6;
  void *v7;
  CRAccNavComponent *v8;

  v4 = [CRAccNavComponent alloc];
  -[CRAccNavComponent uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAccNavComponent accessoryUID](self, "accessoryUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAccNavComponent component](self, "component");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CRAccNavComponent initWithUUID:accessoryUID:component:](v4, "initWithUUID:accessoryUID:component:", v5, v6, v7);

  return v8;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (NSNumber)componentIdentifier
{
  return self->_componentIdentifier;
}

- (ACCNavigationAccessoryComponent)component
{
  return self->_component;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_component, 0);
  objc_storeStrong((id *)&self->_componentIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
