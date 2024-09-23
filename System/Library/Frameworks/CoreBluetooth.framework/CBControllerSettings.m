@implementation CBControllerSettings

- (CBControllerSettings)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  CBControllerSettings *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  CBControllerSettings *v20;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a3;
  v7 = -[CBControllerSettings init](self, "init");
  if (!v7)
  {
    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      CBErrorF(-6756, (uint64_t)"%@ init failed", v23, v24, v25, v26, v27, v28, (uint64_t)v22);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_27;
  }
  if (MEMORY[0x1A85D2194](v6) != MEMORY[0x1E0C812F8])
  {
    if (a4)
    {
      CBErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v29);
      v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    goto LABEL_27;
  }
  v14 = CUXPCDecodeSInt64RangedEx();
  if (v14 == 6)
  {
    v7->_discoverableState = 0;
  }
  else if (v14 == 5)
  {
    goto LABEL_27;
  }
  v15 = CUXPCDecodeSInt64RangedEx();
  if (v15 == 6)
  {
    v7->_hid3ppLELegacyMode = 0;
  }
  else if (v15 == 5)
  {
    goto LABEL_27;
  }
  v16 = CUXPCDecodeSInt64RangedEx();
  if (v16 == 6)
  {
    v7->_bleAdvRSSI = 0;
  }
  else if (v16 == 5)
  {
    goto LABEL_27;
  }
  v17 = CUXPCDecodeSInt64RangedEx();
  if (v17 == 6)
  {
    v7->_setupAssistantIfNoKeyboard = 0;
  }
  else if (v17 == 5)
  {
    goto LABEL_27;
  }
  v18 = CUXPCDecodeSInt64RangedEx();
  if (v18 == 6)
  {
    v7->_setupAssistantIfNoPointingDevice = 0;
  }
  else if (v18 == 5)
  {
    goto LABEL_27;
  }
  v19 = CUXPCDecodeSInt64RangedEx();
  if (v19 != 6)
  {
    if (v19 != 5)
      goto LABEL_21;
LABEL_27:
    v20 = 0;
    goto LABEL_22;
  }
  v7->_spatialSoundProfileAllowed = 0;
LABEL_21:
  v20 = v7;
LABEL_22:

  return v20;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  int64_t discoverableState;
  xpc_object_t xdict;

  v4 = a3;
  discoverableState = self->_discoverableState;
  xdict = v4;
  if ((_DWORD)discoverableState)
  {
    xpc_dictionary_set_int64(v4, "dsSt", discoverableState);
    v4 = xdict;
  }
  if (self->_hid3ppLELegacyMode)
  {
    xpc_dictionary_set_int64(xdict, "hFMs", self->_hid3ppLELegacyMode);
    v4 = xdict;
  }
  if (self->_bleAdvRSSI)
  {
    xpc_dictionary_set_int64(xdict, "rssi", self->_bleAdvRSSI);
    v4 = xdict;
  }
  if (self->_setupAssistantIfNoKeyboard)
  {
    xpc_dictionary_set_int64(xdict, "saKB", self->_setupAssistantIfNoKeyboard);
    v4 = xdict;
  }
  if (self->_setupAssistantIfNoPointingDevice)
  {
    xpc_dictionary_set_int64(xdict, "saPD", self->_setupAssistantIfNoPointingDevice);
    v4 = xdict;
  }
  if (self->_spatialSoundProfileAllowed)
  {
    xpc_dictionary_set_int64(xdict, "spSP", self->_spatialSoundProfileAllowed);
    v4 = xdict;
  }

}

- (id)description
{
  return -[CBControllerSettings descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;

  if (a3 > 0x14u)
  {
    if ((a3 & 0x8000000) != 0)
    {
      v3 = 0;
      v18 = 0;
    }
    else
    {
      v19 = 0;
      NSAppendPrintF_safe();
      v3 = 0;
      v18 = v3;
    }
    NSAppendPrintF_safe();
    v4 = v18;

    v17[4] = v4;
    NSAppendPrintF_safe();
    v7 = v4;

    v17[3] = v7;
    NSAppendPrintF_safe();
    v8 = v7;

    v17[2] = v8;
    NSAppendPrintF_safe();
    v10 = v8;

    v17[1] = v10;
    NSAppendPrintF_safe();
    v11 = v10;

    v17[0] = v11;
    v12 = (id *)v17;
  }
  else
  {
    v22 = 0;
    NSAppendPrintF_safe();
    v21 = 0;
    NSAppendPrintF_safe();
    v5 = v21;

    v20[3] = v5;
    NSAppendPrintF_safe();
    v6 = v5;

    v20[2] = v6;
    NSAppendPrintF_safe();
    v9 = v6;

    v20[1] = v9;
    NSAppendPrintF_safe();
    v11 = v9;

    v20[0] = v11;
    v12 = (id *)v20;
  }
  NSAppendPrintF_safe();
  v13 = (__CFString *)*v12;

  if (v13)
    v14 = v13;
  else
    v14 = &stru_1E5403C08;
  v15 = v14;

  return v15;
}

- (int)discoverableState
{
  return self->_discoverableState;
}

- (void)setDiscoverableState:(int)a3
{
  self->_discoverableState = a3;
}

- (char)hid3ppLELegacyMode
{
  return self->_hid3ppLELegacyMode;
}

- (void)setHid3ppLELegacyMode:(char)a3
{
  self->_hid3ppLELegacyMode = a3;
}

- (char)setupAssistantIfNoKeyboard
{
  return self->_setupAssistantIfNoKeyboard;
}

- (void)setSetupAssistantIfNoKeyboard:(char)a3
{
  self->_setupAssistantIfNoKeyboard = a3;
}

- (char)setupAssistantIfNoPointingDevice
{
  return self->_setupAssistantIfNoPointingDevice;
}

- (void)setSetupAssistantIfNoPointingDevice:(char)a3
{
  self->_setupAssistantIfNoPointingDevice = a3;
}

- (char)spatialSoundProfileAllowed
{
  return self->_spatialSoundProfileAllowed;
}

- (void)setSpatialSoundProfileAllowed:(char)a3
{
  self->_spatialSoundProfileAllowed = a3;
}

- (char)bleAdvRSSI
{
  return self->_bleAdvRSSI;
}

- (void)setBleAdvRSSI:(char)a3
{
  self->_bleAdvRSSI = a3;
}

@end
