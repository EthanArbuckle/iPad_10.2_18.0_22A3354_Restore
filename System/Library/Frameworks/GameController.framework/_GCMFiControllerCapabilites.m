@implementation _GCMFiControllerCapabilites

+ (BOOL)isServiceAuthenticated:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "numberPropertyForKey:", CFSTR("Authenticated"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (objc_msgSend(v4, "BOOLValue") & 1) != 0)
    v5 = 1;
  else
    v5 = isDeviceParentAuthenticated((__IOHIDServiceClient *)objc_msgSend(v3, "service"));

  return v5;
}

- (char)initWithGamepadElements:(void *)a3 keyboardElements:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  char v17;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  char v29;
  char v30;
  char v31;
  _BYTE *v32;
  char v33;
  uint64_t v34;
  id v36;
  id v37;
  id obj;
  id obja;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v48.receiver = a1;
    v48.super_class = (Class)_GCMFiControllerCapabilites;
    a1 = (char *)objc_msgSendSuper2(&v48, sel_init);
    objc_opt_class();
    v36 = v6;
    v37 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      obj = v5;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v45 != v9)
              objc_enumerationMutation(obj);
            v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("UsagePage"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Usage"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v12, "unsignedShortValue");
              v15 = objc_msgSend(v13, "unsignedShortValue");
              if (v14 == 1)
              {
                if (v15 > 0x35 || ((1 << v15) & 0x27000000000000) == 0)
                {
                  v17 = v15 + 112;
                  if ((v15 - 144) < 4)
                  {
                    a1[20] |= 1 << v17;
                    a1[20] |= 16
                            * (__72___GCMFiControllerCapabilites_initWithGamepadElements_keyboardElements___block_invoke(v15, v11) << v17);
                  }
                }
                else
                {
                  a1[21] |= 1 << (v15 - 48);
                  a1[22] |= __72___GCMFiControllerCapabilites_initWithGamepadElements_keyboardElements___block_invoke(v15, v11) << (v15 - 48);
                }
              }
              else if (v14 == 9 && v15 <= 0x10)
              {
                *((_DWORD *)a1 + 3) |= 1 << (v15 - 1);
                *((_DWORD *)a1 + 4) |= __72___GCMFiControllerCapabilites_initWithGamepadElements_keyboardElements___block_invoke(v15, v11) << (v15 - 1);
              }

            }
          }
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
        }
        while (v8);
      }

      v6 = v36;
      v5 = v37;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v19 = v6;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      if (!v20)
        goto LABEL_54;
      v21 = v20;
      v22 = *(_QWORD *)v41;
      obja = v19;
      while (1)
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v41 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v23);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("UsagePage"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Usage"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v25, "unsignedShortValue");
            v28 = objc_msgSend(v26, "unsignedShortValue");
            if (v27 != 12)
              goto LABEL_49;
            if ((int)v28 <= 515)
            {
              if ((_DWORD)v28 != 101)
              {
                if ((_DWORD)v28 != 178)
                  goto LABEL_49;
                v29 = 127;
                v30 = 0x80;
                v31 = 64;
                goto LABEL_44;
              }
              v29 = -3;
              v30 = 2;
              v31 = 1;
              v32 = a1 + 24;
            }
            else
            {
              switch((_DWORD)v28)
              {
                case 0x204:
                  v29 = -9;
                  v30 = 8;
                  v31 = 4;
                  break;
                case 0x223:
                  v29 = -3;
                  v30 = 2;
                  v31 = 1;
                  break;
                case 0x209:
                  v29 = -33;
                  v30 = 32;
                  v31 = 16;
                  break;
                default:
LABEL_49:

                  goto LABEL_50;
              }
LABEL_44:
              v32 = a1 + 23;
            }
            *v32 |= v31;
            if (__72___GCMFiControllerCapabilites_initWithGamepadElements_keyboardElements___block_invoke(v28, v24))
              v33 = v30;
            else
              v33 = 0;
            *v32 = *v32 & v29 | v33;
            v19 = obja;
            goto LABEL_49;
          }
LABEL_50:
          ++v23;
        }
        while (v21 != v23);
        v34 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        v21 = v34;
        if (!v34)
        {
LABEL_54:

          v6 = v36;
          v5 = v37;
          break;
        }
      }
    }
  }

  return a1;
}

- (char)initWithServiceInfo:(char *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "numberPropertyForKey:", CFSTR("PrimaryUsagePage"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberPropertyForKey:", CFSTR("PrimaryUsage"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = 0;
    if (v5)
    {
      if (v6)
      {
        v9 = objc_msgSend(v5, "unsignedShortValue");
        v10 = objc_msgSend(v7, "unsignedShortValue");
        v8 = 0;
        if (v9 == 1 && v10 == 5)
        {
          objc_msgSend(v4, "numberPropertyForKey:", CFSTR("GameControllerType"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
            v13 = objc_msgSend(v11, "unsignedIntValue");
          else
            v13 = -1;
          *((_DWORD *)a1 + 2) = v13;
          objc_msgSend(v4, "dictionaryPropertyForKey:", CFSTR("GameControllerPointer"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "dictionaryPropertyForKey:", CFSTR("Keyboard"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Elements"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Elements"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          a1 = -[_GCMFiControllerCapabilites initWithGamepadElements:keyboardElements:](a1, v16, v17);

          v8 = a1;
        }
      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isExtendedGamepad
{
  uint64_t v1;

  if (!a1)
    return 0;
  if (*(_DWORD *)(a1 + 8) == 1 && (*(_BYTE *)(a1 + 23) & 1) != 0)
    return 1;
  if ((~*(unsigned __int8 *)(a1 + 20) & 0xF) != 0 || (~*(_DWORD *)(a1 + 12) & 0x3F) != 0)
    return 0;
  v1 = 0;
  if ((*(_BYTE *)(a1 + 23) & 1) != 0 && (*(_DWORD *)(a1 + 12) & 0xC0) == 0xC0)
    return (~*(unsigned __int8 *)(a1 + 21) & 0x27) == 0;
  return v1;
}

- (uint64_t)home
{
  unsigned int v1;
  int v2;
  int v3;

  if (a1)
  {
    v1 = *(unsigned __int8 *)(a1 + 23);
    v2 = v1 & 1;
    v3 = (v1 >> 1) & 1;
  }
  else
  {
    v3 = 0;
    v2 = 0;
  }
  return v2 | (v3 << 8);
}

- (uint64_t)isStandardGamepad
{
  if (result)
  {
    if ((~*(unsigned __int8 *)(result + 20) & 0xF) != 0 || (~*(_DWORD *)(result + 12) & 0x3F) != 0)
      return 0;
    else
      return *(_BYTE *)(result + 23) & 1;
  }
  return result;
}

- (uint64_t)l2
{
  int v1;
  int v2;

  if (a1)
  {
    v1 = (*(unsigned __int8 *)(a1 + 12) >> 6) & 1;
    v2 = (*(unsigned __int8 *)(a1 + 16) >> 6) & 1;
  }
  else
  {
    v2 = 0;
    v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)r2
{
  int v1;
  int v2;

  if (a1)
  {
    v1 = *(unsigned __int8 *)(a1 + 12) >> 7;
    v2 = *(unsigned __int8 *)(a1 + 16) >> 7;
  }
  else
  {
    v2 = 0;
    v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)leftThumbstick
{
  _BOOL4 v1;
  int v2;

  if (a1)
  {
    v1 = (~*(unsigned __int8 *)(a1 + 21) & 3) == 0;
    v2 = (~*(unsigned __int8 *)(a1 + 22) & 3) == 0;
  }
  else
  {
    v2 = 0;
    v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)rightThumbstick
{
  _BOOL4 v1;
  int v2;

  if (a1)
  {
    v1 = (~*(unsigned __int8 *)(a1 + 21) & 0x24) == 0;
    v2 = (~*(unsigned __int8 *)(a1 + 22) & 0x24) == 0;
  }
  else
  {
    v2 = 0;
    v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)dpad
{
  unsigned int v1;
  _BOOL4 v2;
  int v3;

  if (a1)
  {
    v1 = *(unsigned __int8 *)(a1 + 20);
    v2 = (~v1 & 0xF) == 0;
    v3 = v1 > 0xEF;
  }
  else
  {
    v3 = 0;
    v2 = 0;
  }
  return v2 | (v3 << 8);
}

- (uint64_t)a
{
  int v1;
  int v2;

  if (a1)
  {
    v1 = *(_BYTE *)(a1 + 12) & 1;
    v2 = *(_BYTE *)(a1 + 16) & 1;
  }
  else
  {
    v2 = 0;
    v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)b
{
  int v1;
  int v2;

  if (a1)
  {
    v1 = (*(unsigned __int8 *)(a1 + 12) >> 1) & 1;
    v2 = (*(unsigned __int8 *)(a1 + 16) >> 1) & 1;
  }
  else
  {
    v2 = 0;
    v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)x
{
  int v1;
  int v2;

  if (a1)
  {
    v1 = (*(unsigned __int8 *)(a1 + 12) >> 2) & 1;
    v2 = (*(unsigned __int8 *)(a1 + 16) >> 2) & 1;
  }
  else
  {
    v2 = 0;
    v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)y
{
  int v1;
  int v2;

  if (a1)
  {
    v1 = (*(unsigned __int8 *)(a1 + 12) >> 3) & 1;
    v2 = (*(unsigned __int8 *)(a1 + 16) >> 3) & 1;
  }
  else
  {
    v2 = 0;
    v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)l1
{
  int v1;
  int v2;

  if (a1)
  {
    v1 = (*(unsigned __int8 *)(a1 + 12) >> 4) & 1;
    v2 = (*(unsigned __int8 *)(a1 + 16) >> 4) & 1;
  }
  else
  {
    v2 = 0;
    v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)r1
{
  int v1;
  int v2;

  if (a1)
  {
    v1 = (*(unsigned __int8 *)(a1 + 12) >> 5) & 1;
    v2 = (*(unsigned __int8 *)(a1 + 16) >> 5) & 1;
  }
  else
  {
    v2 = 0;
    v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)menu
{
  unsigned int v1;
  int v2;
  int v3;

  if (a1)
  {
    v1 = *(unsigned __int8 *)(a1 + 23);
    v2 = (v1 >> 2) & 1;
    v3 = (v1 >> 3) & 1;
  }
  else
  {
    v3 = 0;
    v2 = 0;
  }
  return v2 | (v3 << 8);
}

- (uint64_t)options
{
  unsigned int v1;
  int v2;
  int v3;

  if (a1)
  {
    v1 = *(unsigned __int8 *)(a1 + 23);
    v2 = (v1 >> 4) & 1;
    v3 = (v1 >> 5) & 1;
  }
  else
  {
    v3 = 0;
    v2 = 0;
  }
  return v2 | (v3 << 8);
}

- (uint64_t)record
{
  unsigned int v1;
  int v2;
  unsigned int v3;

  if (a1)
  {
    v1 = *(unsigned __int8 *)(a1 + 23);
    v2 = (v1 >> 6) & 1;
    v3 = v1 >> 7;
  }
  else
  {
    v3 = 0;
    v2 = 0;
  }
  return v2 | (v3 << 8);
}

- (uint64_t)snapshot
{
  unsigned int v1;
  int v2;
  int v3;

  if (a1)
  {
    v1 = *(unsigned __int8 *)(a1 + 24);
    v2 = v1 & 1;
    v3 = (v1 >> 1) & 1;
  }
  else
  {
    v3 = 0;
    v2 = 0;
  }
  return v2 | (v3 << 8);
}

- (uint64_t)l3
{
  int v1;
  int v2;

  if (a1)
  {
    v1 = *(_BYTE *)(a1 + 13) & 1;
    v2 = *(_BYTE *)(a1 + 17) & 1;
  }
  else
  {
    v2 = 0;
    v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)r3
{
  int v1;
  int v2;

  if (a1)
  {
    v1 = (*(_DWORD *)(a1 + 12) >> 9) & 1;
    v2 = (*(_DWORD *)(a1 + 16) >> 9) & 1;
  }
  else
  {
    v2 = 0;
    v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)l4
{
  int v1;
  int v2;

  if (a1)
  {
    v1 = (*(_DWORD *)(a1 + 12) >> 10) & 1;
    v2 = (*(_DWORD *)(a1 + 16) >> 10) & 1;
  }
  else
  {
    v2 = 0;
    v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)r4
{
  int v1;
  int v2;

  if (a1)
  {
    v1 = (*(_DWORD *)(a1 + 12) >> 11) & 1;
    v2 = (*(_DWORD *)(a1 + 16) >> 11) & 1;
  }
  else
  {
    v2 = 0;
    v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)m1
{
  int v1;
  int v2;

  if (a1)
  {
    v1 = (*(_DWORD *)(a1 + 12) >> 12) & 1;
    v2 = (*(_DWORD *)(a1 + 16) >> 12) & 1;
  }
  else
  {
    v2 = 0;
    v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)m2
{
  int v1;
  int v2;

  if (a1)
  {
    v1 = (*(_DWORD *)(a1 + 12) >> 13) & 1;
    v2 = (*(_DWORD *)(a1 + 16) >> 13) & 1;
  }
  else
  {
    v2 = 0;
    v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)m3
{
  int v1;
  int v2;

  if (a1)
  {
    v1 = (*(_DWORD *)(a1 + 12) >> 14) & 1;
    v2 = (*(_DWORD *)(a1 + 16) >> 14) & 1;
  }
  else
  {
    v2 = 0;
    v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (uint64_t)m4
{
  int v1;
  int v2;

  if (a1)
  {
    v1 = (*(_DWORD *)(a1 + 12) >> 15) & 1;
    v2 = (*(_DWORD *)(a1 + 16) >> 15) & 1;
  }
  else
  {
    v2 = 0;
    v1 = 0;
  }
  return v1 | (v2 << 8);
}

- (id)description
{
  _GCMFiControllerCapabilites *v2;
  uint64_t v3;
  int v4;
  unsigned int buttonPresent;
  _BOOL8 v6;
  _BOOL4 v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int thumbstickPresent;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v2 = self;
  if (self)
  {
    v3 = 0;
    v4 = *((_BYTE *)self + 20) & 0xF;
    buttonPresent = self->_buttonPresent;
    if (v4 == 15 && (self->_buttonPresent & 0x3F) == 0x3F)
      v3 = *((_BYTE *)self + 23) & 1;
    v6 = v4 == 15;
    v7 = -[_GCMFiControllerCapabilites isExtendedGamepad]((uint64_t)self);
    v8 = *((unsigned __int8 *)v2 + 23);
    v9 = (v8 >> 2) & 1;
    v10 = (v8 >> 4) & 1;
    v11 = v8 & 1;
    v12 = (v8 >> 6) & 1;
    v13 = *((_BYTE *)v2 + 24) & 1;
    thumbstickPresent = v2->_thumbstickPresent;
    v15 = (buttonPresent >> 1) & 1;
    v16 = (buttonPresent >> 2) & 1;
    v17 = (buttonPresent >> 3) & 1;
    v18 = (~thumbstickPresent & 3) == 0;
    v19 = (buttonPresent >> 4) & 1;
    v20 = (buttonPresent >> 5) & 1;
    v21 = (buttonPresent >> 6) & 1;
    v22 = (~thumbstickPresent & 0x24) == 0;
    v2 = (_GCMFiControllerCapabilites *)((buttonPresent >> 7) & 1);
    v23 = buttonPresent & 1;
    v24 = (buttonPresent >> 8) & 1;
    v25 = (buttonPresent >> 9) & 1;
    v26 = (buttonPresent >> 10) & 1;
    v27 = (buttonPresent >> 11) & 1;
    v28 = (buttonPresent >> 12) & 1;
    v29 = (buttonPresent >> 13) & 1;
    v30 = (buttonPresent >> 14) & 1;
    v31 = (buttonPresent >> 15) & 1;
  }
  else
  {
    v7 = -[_GCMFiControllerCapabilites isExtendedGamepad](0);
    v30 = 0;
    v28 = 0;
    v26 = 0;
    v24 = 0;
    v21 = 0;
    v19 = 0;
    v16 = 0;
    v23 = 0;
    v18 = 0;
    v13 = 0;
    v10 = 0;
    v11 = 0;
    v3 = 0;
    v9 = 0;
    v12 = 0;
    v6 = 0;
    v22 = 0;
    v15 = 0;
    v17 = 0;
    v20 = 0;
    v25 = 0;
    v27 = 0;
    v29 = 0;
    v31 = 0;
  }
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("{\n\tisStandard:%d\n\tisExtended:%d\n\tHOME present:%d\n\tMENU present:%d\n\tOPTIONS present:%d\n\tRECORD present:%d\n\tSNAPSHOT present:%d\n\tdpad present:%d\n\tleftThumbstick present:%d\n\trightThumbstick present:%d\n\tA present:%d\n\tB present:%d\n\tX present:%d\n\tY present:%d\n\tL1 present:%d\n\tR1 present:%d\n\tL2 present:%d\n\tR2 present:%d\n\tL3 present:%d\n\tR3 present:%d\n\tL4 present:%d\n\tR4 present:%d\n\tM1 present:%d\n\tM2 present:%d\n\tM3 present:%d\n\tM4 present:%d\n}"), v3, v7, v11, v9, v10, v12, v13, v6, v18, v22, v23, v15, v16, v17, v19, v20,
           v21,
           v2,
           v24,
           v25,
           v26,
           v27,
           v28,
           v29,
           v30,
           v31);
}

@end
