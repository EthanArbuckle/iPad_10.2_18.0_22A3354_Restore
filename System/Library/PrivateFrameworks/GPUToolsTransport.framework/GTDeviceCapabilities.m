@implementation GTDeviceCapabilities

- (id)daemonDeviceCapabilities
{
  return DaemonDeviceCapabilities(CFSTR("/"));
}

- (id)deviceCompatibilityCapabilitiesWithHeapDescriptors:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  uint64_t v33;
  id v34;
  apr_pool_t *p;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  apr_pool_t *newpool;
  _QWORD v47[6];
  _QWORD v48[6];
  _BYTE v49[128];
  _QWORD v50[3];

  v50[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  apr_initialize();
  newpool = 0;
  apr_pool_create_ex(&newpool, 0, 0, 0);
  v44 = 0;
  v45 = 0;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("heap-texture-info"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v43 = 0;
  if (v4)
  {
    v44 = GTCapabilitiesHeapTextureInfo_deserialize(v4, newpool, &v43);
    v45 = v6;
  }
  v41 = 0;
  v42 = 0;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("heap-acceleration-structure-info"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v40 = 0;
  if (v7)
  {
    v41 = GTCapabilitiesHeapAccelerationStructureInfo_deserialize(v7, newpool, &v40);
    v42 = v9;
  }
  v30 = v5;
  v10 = MTLCreateSystemDefaultDevice();
  v31 = v3;
  v28 = v10;
  v29 = v8;
  if (v10)
  {
    v50[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 1, v10, v8, v5, v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
  if (v12)
  {
    v13 = v12;
    v33 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v37 != v33)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        p = 0;
        apr_pool_create_ex(&p, 0, 0, 0);
        v16 = GTCapabilitiesRuntime_fromDeviceSafe(v15, p);
        GTCapabilitiesRuntime_serialize((const uint8_t *)v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = GTCapabilitiesRuntime_heapTextureInfoCompatible(&v44, (uint64_t)v16, v15);
        v19 = GTCapabilitiesRuntime_heapAccelerationStructureInfoCompatible((uint64_t)&v41, (uint64_t)v16, v15);
        v47[0] = CFSTR("device-name");
        objc_msgSend(v15, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = v20;
        v48[1] = v17;
        v47[1] = CFSTR("capabilities-runtime");
        v47[2] = CFSTR("heap-texture-compatibility");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v48[2] = v21;
        v47[3] = CFSTR("heap-acceleration-structure-compatibility");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v48[3] = v22;
        v47[4] = CFSTR("heap-texture-info-decoded");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v43 == 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v48[4] = v23;
        v47[5] = CFSTR("heap-acceleration-structure-info-decoded");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v40 == 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v48[5] = v24;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 6);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObject:", v25);

        apr_pool_destroy(p);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
    }
    while (v13);
  }

  apr_pool_destroy(newpool);
  v26 = (void *)objc_msgSend(v34, "copy");

  return v26;
}

- (id)inferiorEnvironment:(id)a3
{
  return DaemonCreateGuestAppTransport(a3);
}

@end
