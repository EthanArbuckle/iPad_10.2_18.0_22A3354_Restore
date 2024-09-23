@implementation KmlVersions

- (uint64_t)initWithEndpoint:(uint64_t)a1
{
  id v4;
  char *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v33;

  v4 = a2;
  if (a1)
  {
    v33.receiver = (id)a1;
    v33.super_class = (Class)KmlVersions;
    v5 = (char *)objc_msgSendSuper2(&v33, sel_init);
    a1 = (uint64_t)v5;
    if (v5)
    {
      *((_WORD *)v5 + 8) = 0;
      v6 = (id *)(v5 + 8);
      objc_storeStrong((id *)v5 + 1, a2);
      v7 = *(void **)(a1 + 8);
      if (v7)
      {
        objc_msgSend(v7, "readerInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BED8CE0]), "initWithReaderInformation:", v8);
        v10 = (void *)objc_opt_new();
        objc_msgSend(v9, "manufacturer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "brand");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*v6, "readerConfigID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "BOOLValueForSetting:manufacturer:brand:uuid:error:", 1, v11, v12, v13, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          *(_BYTE *)(a1 + 17) = objc_msgSend(v14, "BOOLValue");
        objc_msgSend(v9, "manufacturer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "brand");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*v6, "readerConfigID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "BOOLValueForSetting:manufacturer:brand:uuid:error:", 3, v15, v16, v17, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
          *(_BYTE *)(a1 + 16) = objc_msgSend(v18, "BOOLValue");

      }
      +[KmlVersionOverride sharedVersionsOverrides](KmlVersionOverride, "sharedVersionsOverrides");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_WORD *)(a1 + 32) = objc_msgSend(v19, "keyRoleToShare");
      v20 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = &unk_24C32F598;

      *(_WORD *)(a1 + 22) = 256;
      if (objc_msgSend(v19, "kmlOverrideVersion") == 768 && !*(_BYTE *)(a1 + 17))
      {
        v28 = *(void **)(a1 + 96);
        *(_QWORD *)(a1 + 96) = &unk_24C32F5B0;

        v29 = *(void **)(a1 + 104);
        *(_QWORD *)(a1 + 104) = &unk_24C32F5C8;

        *(_WORD *)(a1 + 18) = 768;
        v30 = *(void **)(a1 + 120);
        *(_QWORD *)(a1 + 120) = &unk_24C32F5E0;

        v31 = *(void **)(a1 + 128);
        *(_QWORD *)(a1 + 128) = &unk_24C32F5F8;

        *(_WORD *)(a1 + 26) = 768;
      }
      else
      {
        -[KmlVersions downgradePreferredVersion_internal](a1);
      }
      -[KmlVersions generateAllData](a1, v21, v22, v23, v24, v25, v26, v27, (uint64_t)v33.receiver);

    }
  }

  return a1;
}

- (void)downgradePreferredVersion_internal
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    v2 = *(void **)(a1 + 96);
    *(_QWORD *)(a1 + 96) = &unk_24C32F610;

    v3 = *(void **)(a1 + 104);
    *(_QWORD *)(a1 + 104) = &unk_24C32F628;

    *(_WORD *)(a1 + 18) = 256;
    v4 = *(void **)(a1 + 120);
    *(_QWORD *)(a1 + 120) = &unk_24C32F640;

    v5 = *(void **)(a1 + 128);
    *(_QWORD *)(a1 + 128) = &unk_24C32F658;

    *(_WORD *)(a1 + 26) = 256;
  }
}

- (void)generateAllData
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (a1)
  {
    -[KmlVersions generateFrameworkSupportedPairingVersions](a1);
    -[KmlVersions generateFrameworkSupportedSharingVersions](a1);
    -[KmlVersions generateAppletSupportedVersions](a1);
    -[KmlVersions parseVehicleSupportedVersions](a1, v10, v11, v12, v13, v14, v15, v16, a9);
  }
}

- (id)description
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

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("VehicleSupportedFrameworkVersions   : %@\n"), self->_vehicleSupportedFrameworkVersionsTlvAsData);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("VehicleSupportedAppletVersions      : %@\n"), self->_vehicleSupportedAppletVersionsTlvAsData);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("VehicleSupportedBTVersions          : %@\n"), self->_vehicleSupportedBluetoothVersionsTlvAsData);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v6);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PreferredFrameworkVersion           : 0x%02X\n"), self->_ourPreferredKmlVersion);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v7);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AgreedFrameworkVersion              : 0x%02X\n"), self->_agreedKmlVehicleVersion);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v8);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AgreedAppletVersion                 : 0x%02X\n"), self->_agreedAppletVehicleVersion);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v9);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AgreedSharingFrameworkVersion       : 0x%02X\n"), self->_agreedKmlSharingVersion);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v10);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AgreedVehicleServerVersion          : 0x%02X\n"), self->_agreedKmlVehicleServerVersion);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v11);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AgreedBluetoothVersion              : 0x%02X\n"), self->_agreedKmlBluetoothVersion);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v12);

  return v3;
}

- (id)updateVehicleServerSupportedVersions:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (!a1)
  {
    v14 = 0;
    goto LABEL_19;
  }
  if (objc_msgSend(v3, "length"))
  {
    +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, v4);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v5);
          v9 = *(id **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          if (-[KmlTlv tag]((uint64_t)v9) == 93)
          {
            -[KmlTlv value](v9);
            v6 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

    if ((unint64_t)objc_msgSend(v6, "length", (_QWORD)v17) > 1)
    {
      v6 = objc_retainAutorelease(v6);
      v14 = 0;
      *(_WORD *)(a1 + 28) = -[KmlVersions getVehicleServerSupportedVersionForValue:](a1, bswap32(*(unsigned __int16 *)objc_msgSend(v6, "bytes")) >> 16);
      goto LABEL_18;
    }
    v10 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "com.apple.sesd.kml.pairing");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", KmlErrorString(22));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 22, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "com.apple.sesd.kml.pairing");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", KmlErrorString(22));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v25[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v5, 22, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_18:
LABEL_19:

  return v14;
}

- (uint64_t)getVehicleServerSupportedVersionForValue:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(id *)(a1 + 120);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
LABEL_4:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v3);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "unsignedShortValue", (_QWORD)v9) == (_DWORD)a2)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          goto LABEL_4;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    a2 = 768;
  }

  return a2;
}

- (id)updateVehicleSupportedAppletVersions:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  id *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (!a1)
  {
    v17 = 0;
    goto LABEL_19;
  }
  if (objc_msgSend(v3, "length"))
  {
    +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, v4);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(v5);
          v9 = *(id **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          if (-[KmlTlv tag]((uint64_t)v9) == 92)
          {
            -[KmlTlv value](v9);
            v6 = (id)objc_claimAutoreleasedReturnValue();
            -[KmlTlv asData]((uint64_t)v9);
            v10 = objc_claimAutoreleasedReturnValue();
            v11 = *(void **)(a1 + 80);
            *(_QWORD *)(a1 + 80) = v10;

            goto LABEL_13;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

    if ((unint64_t)objc_msgSend(v6, "length", (_QWORD)v20) > 1)
    {
      v6 = objc_retainAutorelease(v6);
      v17 = 0;
      *(_WORD *)(a1 + 24) = -[KmlVersions getAppletSupportedVersionForValue:](a1, bswap32(*(unsigned __int16 *)objc_msgSend(v6, "bytes")) >> 16);
      goto LABEL_18;
    }
    v12 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = 0;

    v13 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "com.apple.sesd.kml.pairing");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", KmlErrorString(22));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 22, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "com.apple.sesd.kml.pairing");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v27 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", KmlErrorString(22));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v28[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v5, 22, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_18:
LABEL_19:

  return v17;
}

- (uint64_t)getAppletSupportedVersionForValue:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(id *)(a1 + 112);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
LABEL_4:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v3);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "unsignedShortValue", (_QWORD)v9) == (_DWORD)a2)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          goto LABEL_4;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    a2 = 0;
  }

  return a2;
}

- (id)updateVehicleSupportedFrameworkVersions:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  id *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int16 *v19;
  unsigned int v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (objc_msgSend(v3, "length"))
    {
      +[KmlTlv TLVsWithData:]((uint64_t)KmlTlv, v4);
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(_QWORD *)v24 != v7)
              objc_enumerationMutation(v5);
            v9 = *(id **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
            if (-[KmlTlv tag]((uint64_t)v9) == 91)
            {
              -[KmlTlv value](v9);
              v6 = (id)objc_claimAutoreleasedReturnValue();
              -[KmlTlv asData]((uint64_t)v9);
              v10 = objc_claimAutoreleasedReturnValue();
              v11 = *(void **)(a1 + 64);
              *(_QWORD *)(a1 + 64) = v10;

              goto LABEL_13;
            }
          }
          v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_13:

      if ((unint64_t)objc_msgSend(v6, "length") > 1)
      {
        objc_msgSend(MEMORY[0x24BDD16A8], "string");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_retainAutorelease(v6);
        v19 = (unsigned __int16 *)objc_msgSend(v6, "bytes");
        v20 = -[KmlVersions getKmlSupportedVersionForValue:](a1, bswap32(*v19) >> 16);
        *(_WORD *)(a1 + 20) = v20;
        objc_msgSend(v18, "appendFormat:", CFSTR("%04X"), v20);
        if ((unint64_t)objc_msgSend(v6, "length") >= 4)
          objc_msgSend(v18, "appendFormat:", CFSTR(",%04X"), __rev16(v19[1]));
        v21 = *(void **)(a1 + 72);
        *(_QWORD *)(a1 + 72) = v18;

        if (*(_WORD *)(a1 + 20) == 768)
          *(_WORD *)(a1 + 28) = 768;
        -[KmlVersions generateFrameworkSupportedSharingVersions](a1);
        a1 = 0;
        goto LABEL_22;
      }
      v12 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = 0;

      v13 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "com.apple.sesd.kml.pairing");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", KmlErrorString(22));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 22, v16);
      a1 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "com.apple.sesd.kml.pairing");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v30 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", KmlErrorString(22));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v31[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", v5, 22, v14);
      a1 = objc_claimAutoreleasedReturnValue();
    }

LABEL_22:
  }

  return (id)a1;
}

- (uint64_t)getKmlSupportedVersionForValue:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(id *)(a1 + 96);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
LABEL_4:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v3);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "unsignedShortValue", (_QWORD)v9) == (_DWORD)a2)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          goto LABEL_4;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    a2 = 0;
  }

  return a2;
}

- (void)generateFrameworkSupportedSharingVersions
{
  uint64_t v2;
  void *v3;

  if (a1)
  {
    +[KmlTlv TLVWithTag:unsignedShort:]((uint64_t)KmlTlv, 84, *(unsigned __int16 *)(a1 + 20));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v2;

  }
}

- (void)parseVehicleSupportedVersions
{
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;

  if (a1)
  {
    *(_WORD *)(a1 + 20) = 256;
    *(_WORD *)(a1 + 24) = 256;
    *(_DWORD *)(a1 + 28) = 256;
    v10 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = 0;

    v11 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = 0;

    v12 = *(void **)(a1 + 136);
    *(_QWORD *)(a1 + 136) = 0;

    v17 = *(void **)(a1 + 8);
    if (v17
      && (objc_msgSend(v17, "revocationAttestation"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v18,
          !v18))
    {
      objc_msgSend(*(id *)(a1 + 8), "vehicleSupportedVersionsData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v19;
      if (v19 && objc_msgSend(v19, "length"))
      {
        v24 = -[KmlVersions updateVehicleSupportedFrameworkVersions:](a1, v28);
        v25 = -[KmlVersions updateVehicleSupportedAppletVersions:](a1, v28);
        v26 = -[KmlVersions updateVehicleServerSupportedVersions:](a1, v28);
      }
      else
      {
        KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlVersions parseVehicleSupportedVersions]", 543, CFSTR("No vehicle supported versions data"), v20, v21, v22, v23, v27);
      }

    }
    else
    {
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlVersions parseVehicleSupportedVersions]", 536, CFSTR("Valid endpoint not set"), v13, v14, v15, v16, a9);
    }
  }
}

- (void)generateFrameworkSupportedPairingVersions
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = *(id *)(a1 + 96);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (objc_msgSend(v8, "unsignedShortValue", (_QWORD)v11) != 257)
            objc_msgSend(v2, "appendU16BE:", objc_msgSend(v8, "unsignedShortValue"));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }

    +[KmlTlv TLVWithTag:value:]((uint64_t)KmlTlv, 90, v2);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v9;

  }
}

- (void)generateAppletSupportedVersions
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = *(id *)(a1 + 112);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(v2, "appendU16BE:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "unsignedShortValue", (_QWORD)v10));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

    +[KmlTlv TLVWithTag:value:]((uint64_t)KmlTlv, 92, v2);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v8;

  }
}

- (KmlTlv)kmlSupportedVersionsTlvForPairing
{
  return self->_kmlSupportedVersionsTlvForPairing;
}

- (KmlTlv)kmlSupportedVersionsTlvForShareInitiator
{
  return self->_kmlSupportedVersionsTlvForShareInitiator;
}

- (KmlTlv)appletSupportedVersionsTlvForPairing
{
  return self->_appletSupportedVersionsTlvForPairing;
}

- (NSData)vehicleSupportedFrameworkVersionsTlvAsData
{
  return self->_vehicleSupportedFrameworkVersionsTlvAsData;
}

- (NSString)vehicleSupportedFrameworkVersionsForCA
{
  return self->_vehicleSupportedFrameworkVersionsForCA;
}

- (NSData)vehicleSupportedAppletVersionsTlvAsData
{
  return self->_vehicleSupportedAppletVersionsTlvAsData;
}

- (NSData)vehicleSupportedBluetoothtVersionsTlvAsData
{
  return self->_vehicleSupportedBluetoothtVersionsTlvAsData;
}

- (unsigned)ourPreferredKmlVersion
{
  return self->_ourPreferredKmlVersion;
}

- (unsigned)agreedKmlVehicleVersion
{
  return self->_agreedKmlVehicleVersion;
}

- (unsigned)agreedKmlSharingVersion
{
  return self->_agreedKmlSharingVersion;
}

- (unsigned)agreedAppletVehicleVersion
{
  return self->_agreedAppletVehicleVersion;
}

- (unsigned)ourPreferredVehicleServerVersion
{
  return self->_ourPreferredVehicleServerVersion;
}

- (unsigned)agreedKmlVehicleServerVersion
{
  return self->_agreedKmlVehicleServerVersion;
}

- (unsigned)agreedKmlBluetoothVersion
{
  return self->_agreedKmlBluetoothVersion;
}

- (unsigned)keyRoleToShare
{
  return self->_keyRoleToShare;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleSupportedBluetoothVersionsTlvAsData, 0);
  objc_storeStrong((id *)&self->_vehicleServerVersionsUpgradeReadyList, 0);
  objc_storeStrong((id *)&self->_kmlSupportedVehicleServerVersionsList, 0);
  objc_storeStrong((id *)&self->_appletSupportedVersionsList, 0);
  objc_storeStrong((id *)&self->_kmlUpgradeReadyVersionsList, 0);
  objc_storeStrong((id *)&self->_kmlSupportedVersionsList, 0);
  objc_storeStrong((id *)&self->_vehicleSupportedBluetoothtVersionsTlvAsData, 0);
  objc_storeStrong((id *)&self->_vehicleSupportedAppletVersionsTlvAsData, 0);
  objc_storeStrong((id *)&self->_vehicleSupportedFrameworkVersionsForCA, 0);
  objc_storeStrong((id *)&self->_vehicleSupportedFrameworkVersionsTlvAsData, 0);
  objc_storeStrong((id *)&self->_appletSupportedVersionsTlvForPairing, 0);
  objc_storeStrong((id *)&self->_kmlSupportedVersionsTlvForShareInitiator, 0);
  objc_storeStrong((id *)&self->_kmlSupportedVersionsTlvForPairing, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
