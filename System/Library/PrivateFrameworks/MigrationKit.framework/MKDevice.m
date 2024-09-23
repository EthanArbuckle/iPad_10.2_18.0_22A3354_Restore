@implementation MKDevice

- (MKDevice)init
{
  MKDevice *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __CFString *v26;
  uint64_t i;
  void *v28;
  void *v29;
  char v30;
  uint64_t v31;
  void *v32;
  char v33;
  void *v34;
  int v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v41.receiver = self;
  v41.super_class = (Class)MKDevice;
  v2 = -[MKDevice init](&v41, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");
    if (v4)
    {
      if (v4 != 1)
        goto LABEL_13;
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bounds");
      v7 = v6;

      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      v10 = v9;

      if (v7 >= v10)
        v11 = v7;
      else
        v11 = v10;
      v12 = v11 < 1366.0;
      v13 = 167;
      v14 = 152;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "scale");
      v17 = v16;

      v12 = v17 < 3.0;
      v13 = 180;
      v14 = 120;
    }
    if (v12)
      v18 = v14;
    else
      v18 = v13;
    -[MKDevice setIconSize:](v2, "setIconSize:", v18);
LABEL_13:
    objc_msgSend(v3, "systemName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKDevice setSystemName:](v2, "setSystemName:", v19);

    objc_msgSend(v3, "systemVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKDevice setSystemVersion:](v2, "setSystemVersion:", v20);

    objc_msgSend(v3, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKDevice setDeviceName:](v2, "setDeviceName:", v21);

    objc_msgSend(v3, "model");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v23 = objc_msgSend(&unk_24E36C6B0, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v38;
      v26 = CFSTR("Unknown");
      while (2)
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v38 != v25)
            objc_enumerationMutation(&unk_24E36C6B0);
          v28 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if (objc_msgSend(v22, "rangeOfString:", v28) != 0x7FFFFFFFFFFFFFFFLL)
          {
            v26 = v28;
            goto LABEL_24;
          }
        }
        v24 = objc_msgSend(&unk_24E36C6B0, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        if (v24)
          continue;
        break;
      }
    }
    else
    {
      v26 = CFSTR("Unknown");
    }
LABEL_24:
    -[MKDevice setDeviceFamily:](v2, "setDeviceFamily:", v26);
    objc_msgSend(&unk_24E36C6B0, "objectAtIndexedSubscript:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[__CFString isEqualToString:](v26, "isEqualToString:", v29);

    if ((v30 & 1) != 0)
    {
      v31 = 1;
    }
    else
    {
      objc_msgSend(&unk_24E36C6B0, "objectAtIndexedSubscript:", 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[__CFString isEqualToString:](v26, "isEqualToString:", v32);

      if ((v33 & 1) != 0)
      {
        v31 = 2;
      }
      else
      {
        objc_msgSend(&unk_24E36C6B0, "objectAtIndexedSubscript:", 2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = -[__CFString isEqualToString:](v26, "isEqualToString:", v34);

        if (!v35)
        {
LABEL_31:

          return v2;
        }
        v31 = 3;
      }
    }
    -[MKDevice setType:](v2, "setType:", v31);
    goto LABEL_31;
  }
  return v2;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)iconSize
{
  return self->_iconSize;
}

- (void)setIconSize:(int64_t)a3
{
  self->_iconSize = a3;
}

- (NSString)systemName
{
  return self->_systemName;
}

- (void)setSystemName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)deviceFamily
{
  return self->_deviceFamily;
}

- (void)setDeviceFamily:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceFamily, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_systemName, 0);
}

@end
