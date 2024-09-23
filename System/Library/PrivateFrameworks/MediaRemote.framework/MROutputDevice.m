@implementation MROutputDevice

- (MROutputDevice)initWithActionID:(id)a3
{
  id v5;
  MROutputDevice *v6;
  MROutputDevice *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MROutputDevice;
  v6 = -[MROutputDevice init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_deviceID, a3);
    objc_storeStrong((id *)&v7->_actionID, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_deviceID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  MROutputDevice *v4;
  MROutputDevice *v5;
  NSString *v6;
  NSString *v7;
  char v8;
  BOOL v9;
  NSString *v10;
  NSString *v11;
  char v12;
  char v13;
  NSString *v14;
  NSString *v15;
  char v16;
  char v17;
  NSString *v18;
  NSString *v19;
  char v20;
  char v21;
  NSString *v22;
  NSString *v23;
  char v24;
  char v25;
  NSString *v26;
  NSString *v27;
  char v28;
  char v29;
  MRBatteryLevel *v30;
  MRBatteryLevel *v31;
  char v32;
  char v33;
  BOOL v34;

  v4 = (MROutputDevice *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MROutputDevice deviceID](v5, "deviceID");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6 == self->_deviceID)
        v8 = 1;
      else
        v8 = -[NSString isEqual:](v6, "isEqual:");

      -[MROutputDevice groupID](v5, "groupID");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10 == self->_groupID)
        v12 = 1;
      else
        v12 = -[NSString isEqual:](v10, "isEqual:");
      v13 = v8 & v12;

      -[MROutputDevice actionID](v5, "actionID");
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14 == self->_actionID)
        v16 = 1;
      else
        v16 = -[NSString isEqual:](v14, "isEqual:");
      v17 = v13 & v16;

      -[MROutputDevice title](v5, "title");
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18 == self->_title)
        v20 = 1;
      else
        v20 = -[NSString isEqual:](v18, "isEqual:");
      v21 = v17 & v20;

      -[MROutputDevice subtitle](v5, "subtitle");
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22 == self->_subtitle)
        v24 = 1;
      else
        v24 = -[NSString isEqual:](v22, "isEqual:");
      v25 = v21 & v24;

      -[MROutputDevice symbolName](v5, "symbolName");
      v26 = (NSString *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26 == self->_symbolName)
        v28 = 1;
      else
        v28 = -[NSString isEqual:](v26, "isEqual:");
      v29 = v25 & v28;

      -[MROutputDevice batteryLevel](v5, "batteryLevel");
      v30 = (MRBatteryLevel *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v30 == self->_batteryLevel)
        v32 = 1;
      else
        v32 = -[MRBatteryLevel isEqual:](v30, "isEqual:");
      v33 = v29 & v32;

      if (-[MROutputDevice section](v5, "section") == self->_section)
        v34 = v33;
      else
        v34 = 0;
      if (-[MROutputDevice priority](v5, "priority") != self->_priority)
        v34 = 0;
      v9 = self->_groupable == -[MROutputDevice isGroupable](v5, "isGroupable") && v34;

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceID, a3);
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_groupID, a3);
}

- (NSString)actionID
{
  return self->_actionID;
}

- (void)setActionID:(id)a3
{
  objc_storeStrong((id *)&self->_actionID, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (int64_t)section
{
  return self->_section;
}

- (void)setSection:(int64_t)a3
{
  self->_section = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (MRBatteryLevel)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(id)a3
{
  objc_storeStrong((id *)&self->_batteryLevel, a3);
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
  objc_storeStrong((id *)&self->_symbolName, a3);
}

- (BOOL)isGroupable
{
  return self->_groupable;
}

- (void)setGroupable:(BOOL)a3
{
  self->_groupable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_batteryLevel, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_actionID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

- (MROutputDevice)initWithOutputDevice:(id)a3
{
  id v4;
  MROutputDevice *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MROutputDevice;
  v5 = -[MROutputDevice init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "uid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MROutputDevice setDeviceID:](v5, "setDeviceID:", v6);

    if (objc_msgSend(v4, "deviceType") == 4 || objc_msgSend(v4, "deviceSubtype") == 3)
    {
      v7 = MSVCopyLocalizedModelName();
    }
    else
    {
      objc_msgSend(v4, "localizedName");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v7;
    -[MROutputDevice setTitle:](v5, "setTitle:", v7);

    +[MRAVOutputDeviceSymbolProvider symbolNameForOutputDevice:](MRAVOutputDeviceSymbolProvider, "symbolNameForOutputDevice:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MROutputDevice setSymbolName:](v5, "setSymbolName:", v9);

    v10 = objc_msgSend(v4, "deviceSubtype") - 1;
    if (v10 > 0xE)
      v11 = 2;
    else
      v11 = qword_193AD9B28[v10];
    -[MROutputDevice setSection:](v5, "setSection:", v11);
    v12 = objc_msgSend(v4, "deviceSubtype");
    v13 = 11;
    switch(v12)
    {
      case 1:
      case 2:
      case 9:
        v13 = 12;
        break;
      case 3:
        if (objc_msgSend(v4, "deviceType", 11) == 4)
          v13 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v13 = 0;
        break;
      case 4:
        break;
      case 5:
      case 6:
      case 7:
      case 8:
      case 10:
        v13 = 6;
        break;
      case 11:
      case 12:
      case 13:
      case 15:
      case 16:
      case 17:
        v13 = 10;
        break;
      default:
        v13 = 0;
        break;
    }
    -[MROutputDevice setPriority:](v5, "setPriority:", v13);
  }

  return v5;
}

@end
