@implementation MDPrivateXattrServices

+ (id)defaultServices
{
  if (defaultServices_once != -1)
    dispatch_once(&defaultServices_once, &__block_literal_global_3);
  return (id)gDefaultServices;
}

dispatch_queue_t __41__MDPrivateXattrServices_defaultServices__block_invoke()
{
  dispatch_queue_t result;

  gDefaultServices = objc_alloc_init(MDPrivateXattrServices);
  result = dispatch_queue_create("com.apple.metadata.MDPrivateXattrServices.gImportQueue", 0);
  gImportQueue = (uint64_t)result;
  return result;
}

- (void)_restoreAttributesFromDictionary:(id)a3 intoDictionary:(id)a4
{
  const __CFUUID *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[6];

  v6 = (const __CFUUID *)objc_msgSend(a3, "objectForKey:", CFSTR("uuid"));
  v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("keys"));
  v8 = objc_msgSend(a3, "objectForKey:", CFSTR("values"));
  if (v6 != CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0x71u, 0x9Fu, 0xB8u, 0xCAu, 0x18u, 0x13u, 0x49u, 0xB0u, 0x8Bu, 0x20u, 0x36u, 0x5Eu, 0xEBu, 0xC3u, 0xEDu, 0x57u))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __74__MDPrivateXattrServices__restoreAttributesFromDictionary_intoDictionary___block_invoke;
    v9[3] = &unk_2508E12C8;
    v9[4] = a4;
    v9[5] = v8;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);
  }
}

uint64_t __74__MDPrivateXattrServices__restoreAttributesFromDictionary_intoDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:"), a2);
}

- (void)_restoreAttributesFromPlistBytes:(id)a3 intoDictionary:(id)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __74__MDPrivateXattrServices__restoreAttributesFromPlistBytes_intoDictionary___block_invoke;
  v4[3] = &unk_2508E12C8;
  v4[4] = self;
  v4[5] = a4;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v4);
}

uint64_t __74__MDPrivateXattrServices__restoreAttributesFromPlistBytes_intoDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_restoreAttributesFromDictionary:intoDictionary:", a2, *(_QWORD *)(a1 + 40));
}

- (id)xidDictWithUUIDs:(id)a3 fromKeyRing:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  size_t count;
  size_t v10;
  size_t i;
  const uint8_t *uuid;
  void *v13;
  id obj;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  unint64_t v22;
  unint64_t v23;
  __int128 v24;
  _QWORD v25[3];
  int v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 0);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_msgSend(a4, "allKeyUUIDs");
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
  if (v17)
  {
    v16 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(obj);
        if (a3)
        {
          v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v7);
          count = xpc_array_get_count(a3);
          if (count)
          {
            v10 = count;
            for (i = 0; i != v10; ++i)
            {
              uuid = xpc_array_get_uuid(a3, i);
              if (uuid)
              {
                memset(v25, 0, sizeof(v25));
                v26 = 0;
                v24 = 0uLL;
                v24 = *(_OWORD *)uuid;
                v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", &v24);
                v22 = 0;
                v23 = 0;
                objc_msgSend(a4, "digestUUIDBytesWithKey:forUUID:uuidBytes:", v8, v13, &v22);
                _MDLabelUUIDEncode(v22, v23, (uint64_t)v25);
                objc_msgSend(v6, "setObject:forKey:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.metadata.%s"), v25));

              }
            }
          }
        }
        ++v7;
      }
      while (v7 != v17);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    }
    while (v17);
  }
  return v6;
}

- (id)decryptDataArrayWithCryptoCallback:(id)a3 dataArray:(id)a4 existingXIDArray:(id)a5 uuids:(id)a6 xpc_uuids:(id)a7 xids:(id)a8 decrypted:(id *)a9
{
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  size_t count;
  void *v28;
  size_t j;
  const char *string;
  void *v31;
  id v33;
  id v34;

  v16 = objc_msgSend(a5, "count");
  if (v16 != objc_msgSend(a4, "count"))
    return 0;
  v33 = a3;
  v34 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v17 = +[MDKeyRing defaultKeyRing](MDKeyRing, "defaultKeyRing");
  v18 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v19 = v17;
  if (a7)
  {
    v20 = -[MDPrivateXattrServices xidDictWithXPCUUIDs:allKeyUUIDs:](self, "xidDictWithXPCUUIDs:allKeyUUIDs:", a7, objc_msgSend(v17, "allKeyUUIDs"));
    a7 = v20;
    if (!a6)
    {
LABEL_10:
      if (v16)
        goto LABEL_11;
      goto LABEL_15;
    }
  }
  else
  {
    v20 = 0;
    if (!a6)
      goto LABEL_10;
  }
  v22 = -[MDPrivateXattrServices xidDictWithUUIDs:allKeyUUIDs:](self, "xidDictWithUUIDs:allKeyUUIDs:", a6, objc_msgSend(v19, "allKeyUUIDs"));
  a7 = v22;
  if (!v20)
    goto LABEL_10;
  if (v22)
  {
    v23 = (void *)objc_msgSend(v20, "mutableCopy");
    objc_msgSend(v23, "addEntriesFromDictionary:", a7);
    a7 = v23;
    goto LABEL_10;
  }
  a7 = v20;
  if (v16)
  {
LABEL_11:
    for (i = 0; i != v16; ++i)
    {
      v25 = objc_msgSend(a5, "objectAtIndex:", i);
      if (objc_msgSend(a7, "objectForKey:", v25))
        objc_msgSend(v18, "setObject:forKey:", objc_msgSend(a4, "objectAtIndex:", i), v25);
    }
  }
LABEL_15:
  v21 = v34;
  if (objc_msgSend(v18, "count"))
  {
    if (a9)
      *a9 = (id)objc_msgSend(v18, "allKeys");
    v26 = v19;
    if (a8)
    {
      count = xpc_array_get_count(a8);
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", count);
      if (count)
      {
        for (j = 0; j != count; ++j)
        {
          string = xpc_array_get_string(a8, j);
          if (string)
          {
            v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", string, 4);
            objc_msgSend(v28, "addObject:", v31);

          }
          else
          {
            NSLog(CFSTR("Nil xid_string"));
          }
          v26 = v19;
        }
      }
      v21 = v34;
      -[MDPrivateXattrServices extractDecryptedDataWith:cryptoCallback:decryptableXids:intoDict:keyRing:xid:](self, "extractDecryptedDataWith:cryptoCallback:decryptableXids:intoDict:keyRing:xid:", v18, v33, a7, v34, v26, v28);

    }
    else
    {
      -[MDPrivateXattrServices extractDecryptedDataWith:cryptoCallback:decryptableXids:intoDict:keyRing:xid:](self, "extractDecryptedDataWith:cryptoCallback:decryptableXids:intoDict:keyRing:xid:", v18, v33, a7, v34, v19, a5);
    }
  }

  return v21;
}

- (id)decryptDataArrayWithCryptoCallback:(id)a3 dataArray:(id)a4 existingXIDArray:(id)a5 uuids:(id)a6 xpc_uuids:(id)a7 xids:(id)a8
{
  return -[MDPrivateXattrServices decryptDataArrayWithCryptoCallback:dataArray:existingXIDArray:uuids:xpc_uuids:xids:decrypted:](self, "decryptDataArrayWithCryptoCallback:dataArray:existingXIDArray:uuids:xpc_uuids:xids:decrypted:", a3, a4, a5, a6, a7, a8, 0);
}

- (void)extractDecryptedDataWith:(id)a3 cryptoCallback:(id)a4 decryptableXids:(id)a5 intoDict:(id)a6 keyRing:(id)a7 xid:(id)a8
{
  id v8;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const void *v14;
  const void *v15;
  unsigned __int8 *v16;
  unint64_t v17;
  int v18;
  const __CFData *v19;
  const __CFData *v20;
  const UInt8 *v21;
  CFIndex v22;
  id v23;
  const __CFData *v24;
  const __CFData *v25;
  const UInt8 *BytePtr;
  unint64_t Length;
  unint64_t v28;
  void *v29;
  __CFArray *v30;
  __CFArray *v31;
  __CFArray *v32;
  __CFArray *v33;
  CFTypeID v34;
  BOOL v35;
  const __CFAllocator *v36;
  CFUUIDRef v37;
  void *v38;
  void *v39;
  unint64_t v40;
  CFUUIDBytes *v41;
  CFUUIDBytes *v42;
  CFUUIDRef v43;
  CFAbsoluteTime v44;
  CFDateRef v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  uint64_t v55;
  id v58;
  id v59;
  void *v60;
  const __CFData *v61;
  const __CFData *v62;
  CFTypeRef v63;
  void *v64;
  const __CFAllocator *alloc;
  uint64_t v67;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  unint64_t v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v8 = a8;
  v82 = *MEMORY[0x24BDAC8D0];
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(a8, "count"));
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v70 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
  if (v70)
  {
    alloc = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v67 = *(_QWORD *)v76;
    v59 = a7;
    v60 = v10;
    v58 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v76 != v67)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * v11);
        v13 = (void *)objc_msgSend(a3, "objectForKey:", v12);
        if (!v13)
          NSLog(CFSTR("Don't know how to decrypt %@"), v12);
        v14 = (const void *)objc_msgSend(a5, "objectForKey:", v12);
        if (v14)
        {
          v15 = v14;
          CFRetain(v14);
          if (!v13)
            goto LABEL_40;
        }
        else
        {
          v15 = (const void *)objc_msgSend(a7, "copyDesignatedKeyUUID");
          if (!v13)
            goto LABEL_40;
        }
        v16 = (unsigned __int8 *)objc_msgSend(v13, "bytes");
        v17 = objc_msgSend(v13, "length");
        if (v17 < 0xA)
        {
          NSLog(CFSTR("Crypted too small to contain header"), v55);
          goto LABEL_39;
        }
        v18 = *v16;
        if (v18 == 242)
        {
          v24 = (const __CFData *)copyDecryptedData((uint64_t)a4, (uint64_t)v16, (uint64_t)v15, (uint64_t)v16, v17);
          if (!v24)
          {
            NSLog(CFSTR("Failed to decrypt private attr with %@"), v15);
LABEL_39:
            NSLog(CFSTR("Bad format? %@"), v12);
LABEL_40:
            if (!v15)
              goto LABEL_42;
LABEL_41:
            CFRelease(v15);
            goto LABEL_42;
          }
          v25 = v24;
          BytePtr = CFDataGetBytePtr(v24);
          Length = CFDataGetLength(v25);
          if (_init_private_attributes_once != -1)
            dispatch_once(&_init_private_attributes_once, &__block_literal_global_97);
          v28 = 0x2567F9000uLL;
          v61 = v25;
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 0);
          v79 = 0;
          if (Length)
          {
            v63 = 0;
            do
            {
              v30 = copyCFTypeFromBuffer((uint64_t)BytePtr, &v79, Length);
              if (v30)
              {
                v31 = v30;
                v32 = copyCFTypeFromBuffer((uint64_t)BytePtr, &v79, Length);
                if (v32)
                {
                  v33 = v32;
                  if (CFGetTypeID(v31) == *(_QWORD *)(v28 + 3208))
                  {
                    if (CFEqual(CFSTR("mod_date"), v31))
                    {
                      v34 = CFGetTypeID(v33);
                      v35 = v34 == CFDateGetTypeID();
                      v28 = 0x2567F9000;
                      if (v35)
                        v63 = CFRetain(v33);
                    }
                    else
                    {
                      objc_msgSend(v29, "setObject:forKey:", v33, v31);
                    }
                  }
                  CFRelease(v33);
                }
                CFRelease(v31);
              }
            }
            while (v79 < Length);
          }
          else
          {
            v63 = 0;
          }
          if (!objc_msgSend(v29, "count"))
          {

            v29 = 0;
          }
          a7 = v59;
          v10 = v60;
          v46 = objc_msgSend(v29, "allKeys");
          v47 = objc_msgSend(v29, "allValues");

          if (v46 && v47)
          {
            v48 = objc_alloc(MEMORY[0x24BDBCED8]);
            v49 = (uint64_t)v63;
            if (!v63)
              v49 = objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
            v29 = (void *)objc_msgSend(v48, "initWithObjectsAndKeys:", v46, CFSTR("keys"), v47, CFSTR("values"), v49, CFSTR("mod_date"), 0);
          }
          v20 = v61;
          v23 = v29;
        }
        else
        {
          if (v18 != 241)
          {
            NSLog(CFSTR("Unexpected head %x"), *v16);
            goto LABEL_39;
          }
          v19 = (const __CFData *)copyDecryptedData((uint64_t)a4, (uint64_t)v16, (uint64_t)v15, (uint64_t)v16, v17);
          if (!v19)
          {
            NSLog(CFSTR("Failed to decrypt private label with %@"), v15);
            goto LABEL_39;
          }
          v20 = v19;
          v21 = CFDataGetBytePtr(v19);
          v22 = CFDataGetLength(v20);
          v23 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          if (v22 >= 2 && (v36 = alloc, (unint64_t)v22 >= 0x14) && *(_DWORD *)v21 == 1279345228)
          {
            v62 = v20;
            v37 = CFUUIDCreateFromUUIDBytes(alloc, *(CFUUIDBytes *)(v21 + 4));
            v64 = v23;
            objc_msgSend(v23, "setValue:forKey:", v37, CFSTR("uuid"));
            CFRelease(v37);
            v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 0);
            v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 0);
            if ((unint64_t)v22 >= 0x24)
            {
              v40 = (unint64_t)&v21[v22];
              v41 = (CFUUIDBytes *)(v21 + 36);
              v42 = (CFUUIDBytes *)(v21 + 20);
              do
              {
                v43 = CFUUIDCreateFromUUIDBytes(v36, *v42);
                v44 = 0.0;
                if ((unint64_t)&v42[1].byte8 <= v40)
                {
                  v44 = *(double *)&v41->byte0;
                  v41 = (CFUUIDBytes *)((char *)v42 + 24);
                }
                v42 = v41;
                v36 = alloc;
                v45 = CFDateCreate(alloc, v44);
                objc_msgSend(v38, "addObject:", v43);
                CFRelease(v43);
                objc_msgSend(v39, "addObject:", v45);
                CFRelease(v45);
                v41 = v42 + 1;
              }
              while ((unint64_t)&v42[1] <= v40);
            }
            objc_msgSend(v64, "setValue:forKey:", v38, CFSTR("keys"));

            objc_msgSend(v64, "setValue:forKey:", v39, CFSTR("values"));
            v23 = v64;
            a7 = v59;
            v10 = v60;
            v8 = v58;
            v20 = v62;
          }
          else
          {
            v8 = v58;
          }
        }
        CFRelease(v20);
        if (!v23)
          goto LABEL_39;
        objc_msgSend(v10, "addObject:", v23);

        if (v15)
          goto LABEL_41;
LABEL_42:
        ++v11;
      }
      while (v11 != v70);
      v50 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
      v70 = v50;
    }
    while (v50);
  }
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "sortUsingComparator:", &__block_literal_global_24);
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v51 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v72 != v53)
            objc_enumerationMutation(v10);
          -[MDPrivateXattrServices _restoreAttributesFromDictionary:intoDictionary:](self, "_restoreAttributesFromDictionary:intoDictionary:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i), a6);
        }
        v52 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
      }
      while (v52);
    }
  }

}

uint64_t __103__MDPrivateXattrServices_extractDecryptedDataWith_cryptoCallback_decryptableXids_intoDict_keyRing_xid___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("mod_date")), "compare:", objc_msgSend(a3, "objectForKey:", CFSTR("mod_date")));
}

- (id)copyPrivateXattrsDictionary:(id)a3 cryptoCallback:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  +[MDKeyRing defaultKeyRing](MDKeyRing, "defaultKeyRing");
  v7 = objc_msgSend(a3, "objectForKey:", CFSTR("xids"));
  v8 = objc_msgSend(a3, "objectForKey:", CFSTR("uuids"));
  v9 = objc_msgSend(a3, "objectForKey:", CFSTR("datas"));
  if (v8 && v9 && v7)
    return -[MDPrivateXattrServices decryptDataArrayWithCryptoCallback:dataArray:existingXIDArray:uuids:xpc_uuids:xids:](self, "decryptDataArrayWithCryptoCallback:dataArray:existingXIDArray:uuids:xpc_uuids:xids:", a4, v9, v7, 0, v8, 0);
  else
    return 0;
}

- (id)copyPrivateXattrsFromData:(id)a3 decryptedXids:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  MDPrivateXattrServices *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v28 = 0uLL;
  v29 = 0;
  objc_msgSend(a3, "bytes");
  objc_msgSend(a3, "length");
  _MDPlistGetRootPlistObjectFromBytes();
  v26 = 0uLL;
  v27 = 0;
  v24 = 0uLL;
  v25 = 0;
  if (!_MDPlistDictionaryGetPlistObjectForKey())
  {
    v7 = 0;
LABEL_9:
    v9 = 0;
    v8 = 0;
LABEL_25:
    v17 = 0;
    goto LABEL_26;
  }
  v24 = v26;
  v25 = v27;
  if (_MDPlistGetPlistObjectType() == 240)
  {
    v24 = v26;
    v25 = v27;
    v7 = (void *)_MDPlistContainerCopyObject();
  }
  else
  {
    v7 = 0;
  }
  v26 = 0uLL;
  v27 = 0;
  v24 = v28;
  v25 = v29;
  if (!_MDPlistDictionaryGetPlistObjectForKey())
    goto LABEL_9;
  v24 = v26;
  v25 = v27;
  if (_MDPlistGetPlistObjectType() == 240)
  {
    v24 = v26;
    v25 = v27;
    v8 = (void *)_MDPlistContainerCopyObject();
  }
  else
  {
    v8 = 0;
  }
  v26 = 0uLL;
  v27 = 0;
  v24 = v28;
  v25 = v29;
  if (!_MDPlistDictionaryGetPlistObjectForKey()
    || (v24 = v26, v25 = v27, _MDPlistGetPlistObjectType() != 240))
  {
    v9 = 0;
    goto LABEL_25;
  }
  v19 = self;
  v24 = v26;
  v25 = v27;
  v10 = (void *)_MDPlistContainerCopyObject();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v10);
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15));
        objc_msgSend(v11, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v13);
  }
  v9 = (void *)objc_msgSend(v11, "copy");

  v17 = 0;
  if (v9 && v8 && v7)
    v17 = -[MDPrivateXattrServices decryptDataArrayWithCryptoCallback:dataArray:existingXIDArray:uuids:xpc_uuids:xids:decrypted:](v19, "decryptDataArrayWithCryptoCallback:dataArray:existingXIDArray:uuids:xpc_uuids:xids:decrypted:", &__block_literal_global_37, v8, v7, v9, 0, 0, a4);
LABEL_26:

  return v17;
}

uint64_t __66__MDPrivateXattrServices_copyPrivateXattrsFromData_decryptedXids___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  id v11;

  v11 = +[MDKeyRing defaultKeyRing](MDKeyRing, "defaultKeyRing");
  if (a6 == 1)
    return objc_msgSend(v11, "copyEncryptedData:withKeyUUID:iv1:iv2:", a5, a2, a3, a4);
  else
    return objc_msgSend(v11, "copyDecryptedData:withKeyUUID:iv1:iv2:", a5, a2, a3, a4);
}

- (id)copyPrivateXattrsFromData:(id)a3
{
  return -[MDPrivateXattrServices copyPrivateXattrsFromData:decryptedXids:](self, "copyPrivateXattrsFromData:decryptedXids:", a3, 0);
}

- (void)digestUUIDBytesWithKey:(id)a3 forUUID:(id)a4 uuidBytes:(unsigned __int8)a5[16]
{
  CC_MD5_CTX v8;
  __int128 data;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  data = 0uLL;
  memset(&v8, 0, sizeof(v8));
  CC_MD5_Init(&v8);
  objc_msgSend(a4, "getUUIDBytes:", &data);
  CC_MD5_Update(&v8, &data, 0x10u);
  objc_msgSend(a3, "getUUIDBytes:", &data);
  CC_MD5_Update(&v8, &data, 0x10u);
  CC_MD5_Final((unsigned __int8 *)&data, &v8);
  *(_OWORD *)a5 = data;
}

- (id)xidDictWithUUIDs:(id)a3 allKeyUUIDs:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id obj;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 0);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = a4;
  v18 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v18)
  {
    v17 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v8);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v20;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v20 != v12)
                objc_enumerationMutation(a3);
              v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                digestOneInternal(self, v9, v14, v7);
              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v11);
        }
        digestOneInternal(self, v9, v9, v7);
        ++v8;
      }
      while (v8 != v18);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v18);
  }
  return v7;
}

- (void)digestUUIDBytesWithKey:(id)a3 forXPCUUID:(id)a4 uuidBytes:(unsigned __int8)a5[16]
{
  const uint8_t *bytes;
  CC_MD5_CTX v9;
  __int128 data;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  data = 0uLL;
  memset(&v9, 0, sizeof(v9));
  CC_MD5_Init(&v9);
  bytes = xpc_uuid_get_bytes(a4);
  CC_MD5_Update(&v9, bytes, 0x10u);
  objc_msgSend(a3, "getUUIDBytes:", &data);
  CC_MD5_Update(&v9, &data, 0x10u);
  CC_MD5_Final((unsigned __int8 *)&data, &v9);
  *(_OWORD *)a5 = data;
}

- (id)xidDictWithXPCUUIDs:(id)a3 allKeyUUIDs:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id obj;
  _QWORD applier[7];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 0);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = a4;
  v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    v11 = MEMORY[0x24BDAC760];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        applier[0] = v11;
        applier[1] = 3221225472;
        applier[2] = __58__MDPrivateXattrServices_xidDictWithXPCUUIDs_allKeyUUIDs___block_invoke;
        applier[3] = &unk_2508E1370;
        applier[4] = self;
        applier[5] = v13;
        applier[6] = v7;
        xpc_array_apply(a3, applier);
        digestOneInternal(self, v13, v13, v7);
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
  return v7;
}

uint64_t __58__MDPrivateXattrServices_xidDictWithXPCUUIDs_allKeyUUIDs___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v7;
  unint64_t v8;
  _QWORD v9[3];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = (void *)a1[6];
  memset(v9, 0, sizeof(v9));
  v10 = 0;
  v7 = 0;
  v8 = 0;
  objc_msgSend(v3, "digestUUIDBytesWithKey:forXPCUUID:uuidBytes:", v4, a3, &v7);
  _MDLabelUUIDEncode(v7, v8, (uint64_t)v9);
  objc_msgSend(v5, "setObject:forKey:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.metadata.%s"), v9));
  return 1;
}

- (void)updatePrivateXattrParams:(id)a3 flags:(unint64_t)a4 forFileDescriptor:(int)a5 mergeCallback:(id)a6 completionHandler:(id)a7
{
  char v10;
  uint64_t v12;
  const __CFUUID *v13;
  const __CFUUID *v14;
  CFTypeID v15;
  const __CFUUID *v16;
  const __CFUUID *v17;
  uint64_t v18;
  const __CFDictionary *v19;
  const void *v20;
  _QWORD v21[7];
  int v22;
  CFUUIDBytes v23;

  v10 = a4;
  if (updatePrivateXattrParams_flags_forFileDescriptor_mergeCallback_completionHandler__once != -1)
    dispatch_once(&updatePrivateXattrParams_flags_forFileDescriptor_mergeCallback_completionHandler__once, &__block_literal_global_50);
  v12 = dup(a5);
  v13 = (const __CFUUID *)objc_msgSend(a3, "objectForKey:", CFSTR("uuid"));
  v14 = v13;
  if (v13 && (v15 = CFGetTypeID(v13), v15 == CFUUIDGetTypeID()))
  {
    v23 = CFUUIDGetUUIDBytes(v14);
    v16 = (const __CFUUID *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", &v23);
  }
  else
  {
    v16 = v14;
  }
  v17 = v16;
  v18 = objc_msgSend((id)updatePrivateXattrParams_flags_forFileDescriptor_mergeCallback_completionHandler__sMDPrivateMDAttributesXattrNSUUID, "isEqual:", v16);
  v19 = MDFSOnlyMDCopyXattrsDictionaryForFD(v12);
  v20 = (id)CFDictionaryGetValue(v19, CFSTR("_kMDItemEncryptedData"));
  CFRelease(v19);
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __107__MDPrivateXattrServices_updatePrivateXattrParams_flags_forFileDescriptor_mergeCallback_completionHandler___block_invoke_2;
  v21[3] = &unk_2508E1398;
  v22 = v12;
  v21[5] = v20;
  v21[6] = a7;
  v21[4] = v17;
  (*((void (**)(id, const void *, id, uint64_t, _QWORD, _QWORD *))a6 + 2))(a6, v20, a3, v18, v10 & 1, v21);
}

uint64_t __107__MDPrivateXattrServices_updatePrivateXattrParams_flags_forFileDescriptor_mergeCallback_completionHandler___block_invoke()
{
  const __CFUUID *v0;
  uint64_t result;
  CFUUIDBytes v2;

  v0 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0xFEu, 0x65u, 0x61u, 0x5Bu, 0xFu, 0xF3u, 0x4Eu, 0x3Du, 0xBBu, 0x10u, 0xA7u, 0xACu, 0x81u, 0x62u, 0x22u, 0x6Eu);
  v2 = CFUUIDGetUUIDBytes(v0);
  result = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", &v2);
  updatePrivateXattrParams_flags_forFileDescriptor_mergeCallback_completionHandler__sMDPrivateMDAttributesXattrNSUUID = result;
  return result;
}

void __107__MDPrivateXattrServices_updatePrivateXattrParams_flags_forFileDescriptor_mergeCallback_completionHandler___block_invoke_2(uint64_t a1, void *a2, unint64_t a3, unint64_t a4)
{
  int v8;
  const char *v9;
  const void *v10;
  size_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (!(a3 | a4))
  {
    v14 = *(_QWORD *)(a1 + 48);
    v15 = objc_alloc(MEMORY[0x24BDD1540]);
    (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, objc_msgSend(v15, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 32, 0));
    goto LABEL_24;
  }
  if (objc_msgSend((id)a3, "length") && objc_msgSend(a2, "length"))
  {
    v8 = *(_DWORD *)(a1 + 56);
    v9 = (const char *)objc_msgSend(a2, "UTF8String");
    if (objc_msgSend((id)a3, "length"))
    {
      v10 = (const void *)objc_msgSend((id)a3, "bytes");
      v11 = objc_msgSend((id)a3, "length");
      if (!strcmp(v9, "com.apple.metadata:kMDItemIsShared"))
      {
        v13 = "com.apple.metadata:kMDItemIsShared#PS";
      }
      else
      {
        if (strcmp(v9, "com.apple.metadata:kMDItemSharedItemCurrentUserRole"))
        {
          v12 = v8;
          v13 = v9;
LABEL_13:
          fsetxattr(v12, v13, v10, v11, 0, 0);
          goto LABEL_14;
        }
        v13 = "com.apple.metadata:kMDItemSharedItemCurrentUserRole#PS";
      }
      v12 = v8;
      goto LABEL_13;
    }
    fremovexattr(v8, v9, 0);
  }
LABEL_14:
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = objc_msgSend((id)a4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation((id)a4);
        v20 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(a2, "isEqual:", v20) & 1) == 0)
          fremovexattr(*(_DWORD *)(a1 + 56), (const char *)objc_msgSend(v20, "UTF8String"), 0);
      }
      v17 = objc_msgSend((id)a4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v17);
  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
LABEL_24:
  close(*(_DWORD *)(a1 + 56));

}

- (void)updatePrivateXattrParams:(id)a3 flags:(unint64_t)a4 forFileDescriptor:(int)a5 completionHandler:(id)a6
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __93__MDPrivateXattrServices_updatePrivateXattrParams_flags_forFileDescriptor_completionHandler___block_invoke;
  v6[3] = &unk_2508E13E0;
  v6[4] = self;
  -[MDPrivateXattrServices updatePrivateXattrParams:flags:forFileDescriptor:mergeCallback:completionHandler:](self, "updatePrivateXattrParams:flags:forFileDescriptor:mergeCallback:completionHandler:", a3, a4, *(_QWORD *)&a5, v6, a6);
}

void __93__MDPrivateXattrServices_updatePrivateXattrParams_flags_forFileDescriptor_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v7;

  v7 = (void *)copyUpdatedData(*(_QWORD *)(a1 + 32));
  (*(void (**)(uint64_t, _QWORD, void *))(a6 + 16))(a6, 0, v7);

}

uint64_t __93__MDPrivateXattrServices_updatePrivateXattrParams_flags_forFileDescriptor_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  id v11;

  v11 = +[MDKeyRing defaultKeyRing](MDKeyRing, "defaultKeyRing");
  if (a6 == 1)
    return objc_msgSend(v11, "copyEncryptedData:withKeyUUID:iv1:iv2:", a5, a2, a3, a4);
  else
    return objc_msgSend(v11, "copyDecryptedData:withKeyUUID:iv1:iv2:", a5, a2, a3, a4);
}

- (void)updatePrivateXattrParams:(id)a3 flags:(unint64_t)a4 forFileDescriptor:(int)a5
{
  -[MDPrivateXattrServices updatePrivateXattrParams:flags:forFileDescriptor:completionHandler:](self, "updatePrivateXattrParams:flags:forFileDescriptor:completionHandler:", a3, a4, *(_QWORD *)&a5, &__block_literal_global_58);
}

@end
