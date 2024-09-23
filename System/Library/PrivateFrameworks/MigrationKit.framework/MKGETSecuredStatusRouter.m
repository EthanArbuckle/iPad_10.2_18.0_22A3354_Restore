@implementation MKGETSecuredStatusRouter

- (MKGETSecuredStatusRouter)init
{
  MKGETSecuredStatusRouter *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  MKStorage *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MKGETSecuredStatusRouter;
  v2 = -[MKGETSecuredStatusRouter init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("uuid"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUIDString");
      v6 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("uuid"));
      objc_msgSend(v3, "synchronize");
      v4 = (void *)v6;
    }
    -[MKGETSecuredStatusRouter setUuid:](v2, "setUuid:", v4);
    v7 = objc_alloc_init(MKStorage);
    -[MKGETSecuredStatusRouter setStorage:](v2, "setStorage:", v7);

  }
  return v2;
}

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  id v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  MKDevice *v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  MKWiFiDevice *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t n;
  uint64_t v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id *location;
  void *v83;
  id v84;
  NSDictionary *obj;
  id obja;
  id v87;
  MKGETSecuredStatusRouter *v88;
  void *v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x24BDAC8D0];
  v84 = a5;
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v7 = (void *)MEMORY[0x24BDD16E0];
  location = (id *)&self->_getStatusRouter;
  WeakRetained = objc_loadWeakRetained((id *)&self->_getStatusRouter);
  objc_msgSend(v7, "numberWithInteger:", objc_msgSend(WeakRetained, "state"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v6;
  objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("state"));

  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v88 = self;
  v11 = self->_supportedContentTypes;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v107, v115, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v108;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v108 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v17, v16);

      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v107, v115, 16);
    }
    while (v13);
  }

  objc_msgSend(v89, "setObject:forKey:", v10, CFSTR("supported_content_types"));
  v18 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v19 = v88->_supportedTransferEncodings;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v103, v114, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v104;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v104 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v25, v24);

      }
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v103, v114, 16);
    }
    while (v21);
  }
  v83 = v10;

  v81 = v18;
  objc_msgSend(v89, "setObject:forKey:", v18, CFSTR("supported_transfer_encodings"));
  v87 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  obj = v88->_signatures;
  v26 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v99, v113, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v100;
    v29 = MEMORY[0x24BDBD1C8];
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v100 != v28)
          objc_enumerationMutation(obj);
        v31 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * k);
        -[NSDictionary objectForKeyedSubscript:](v88->_signatures, "objectForKeyedSubscript:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v95 = 0u;
        v96 = 0u;
        v97 = 0u;
        v98 = 0u;
        v34 = v32;
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v95, v112, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v96;
          do
          {
            for (m = 0; m != v36; ++m)
            {
              if (*(_QWORD *)v96 != v37)
                objc_enumerationMutation(v34);
              objc_msgSend(v33, "setObject:forKeyedSubscript:", v29, *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * m));
            }
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v95, v112, 16);
          }
          while (v36);
        }

        objc_msgSend(v87, "setObject:forKeyedSubscript:", v33, v31);
      }
      v27 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v99, v113, 16);
    }
    while (v27);
  }

  objc_msgSend(v89, "setObject:forKey:", v87, CFSTR("signatures"));
  v39 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "localeIdentifier");
  v41 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "languageCode");
  v42 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "countryCode");
  v43 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "scriptCode");
  v44 = objc_claimAutoreleasedReturnValue();
  v80 = v40;
  objc_msgSend(v40, "variantCode");
  v45 = objc_claimAutoreleasedReturnValue();
  v79 = (void *)v41;
  objc_msgSend(v39, "setObject:forKey:", v41, CFSTR("identifier"));
  v78 = (void *)v42;
  objc_msgSend(v39, "setObject:forKey:", v42, CFSTR("language_code"));
  if (v43)
    objc_msgSend(v39, "setObject:forKey:", v43, CFSTR("country_code"));
  if (v44)
    objc_msgSend(v39, "setObject:forKey:", v44, CFSTR("script_code"));
  v76 = (void *)v44;
  v77 = (void *)v43;
  if (v45)
    objc_msgSend(v39, "setObject:forKey:", v45, CFSTR("variant_code"));
  v75 = (void *)v45;
  obja = v39;
  objc_msgSend(v89, "setObject:forKey:", v39, CFSTR("locale"));
  v46 = objc_alloc_init(MKDevice);
  v47 = (void *)MEMORY[0x24BDD16E0];
  *(float *)&v48 = (float)-[MKDevice iconSize](v46, "iconSize");
  objc_msgSend(v47, "numberWithFloat:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setObject:forKey:", v49, CFSTR("icon_size"));

  -[MKDevice systemName](v46, "systemName");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setObject:forKey:", v50, CFSTR("system_name"));

  -[MKDevice systemVersion](v46, "systemVersion");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setObject:forKey:", v51, CFSTR("system_version"));

  -[MKDevice deviceFamily](v46, "deviceFamily");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setObject:forKey:", v52, CFSTR("device_family"));

  -[MKDevice deviceName](v46, "deviceName");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setObject:forKey:", v53, CFSTR("device_name"));

  -[MKGETSecuredStatusRouter uuid](v88, "uuid");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setObject:forKey:", v54, CFSTR("id"));

  v55 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[MKStorage availableSpaceInBytes](v88->_storage, "availableSpaceInBytes"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setObject:forKey:", v56, CFSTR("available_space_in_bytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[MKStorage availableSpaceInMegabytes](v88->_storage, "availableSpaceInMegabytes"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setObject:forKey:", v57, CFSTR("available_space_in_megabytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[MKStorage availableSpaceInGigabytes](v88->_storage, "availableSpaceInGigabytes"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setObject:forKey:", v58, CFSTR("available_space_in_gigabytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[MKStorage availableSpaceInTerabytes](v88->_storage, "availableSpaceInTerabytes"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setObject:forKey:", v59, CFSTR("available_space_in_terabytes"));

  objc_msgSend(v89, "setObject:forKey:", v55, CFSTR("storage"));
  v60 = objc_alloc_init(MKWiFiDevice);
  -[MKWiFiDevice currentNetwork](v60, "currentNetwork");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  objc_msgSend(v61, "allKeys");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v91, v111, 16);
  if (v63)
  {
    v64 = v63;
    v65 = *(_QWORD *)v92;
    do
    {
      for (n = 0; n != v64; ++n)
      {
        if (*(_QWORD *)v92 != v65)
          objc_enumerationMutation(v62);
        v67 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * n);
        objc_msgSend(v61, "objectForKeyedSubscript:", v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "setObject:forKey:", v68, v67);

      }
      v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v91, v111, 16);
    }
    while (v64);
  }

  v69 = (void *)MEMORY[0x24BDD16E0];
  v70 = objc_loadWeakRetained(location);
  objc_msgSend(v69, "numberWithInteger:", objc_msgSend(v70, "preferredChannel"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setObject:forKey:", v71, CFSTR("ap1"));

  v90 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v89, 0, &v90);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v90;
  if (v73)
  {
    +[MKLog log](MKLog, "log");
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      -[MKGETStatusRouter server:didReceiveRequest:response:].cold.1((uint64_t)v73, v74);

  }
  objc_msgSend(v84, "setBody:", v72);

}

- (MKGETStatusRouter)getStatusRouter
{
  return (MKGETStatusRouter *)objc_loadWeakRetained((id *)&self->_getStatusRouter);
}

- (void)setGetStatusRouter:(id)a3
{
  objc_storeWeak((id *)&self->_getStatusRouter, a3);
}

- (NSArray)supportedContentTypes
{
  return self->_supportedContentTypes;
}

- (void)setSupportedContentTypes:(id)a3
{
  objc_storeStrong((id *)&self->_supportedContentTypes, a3);
}

- (NSArray)supportedTransferEncodings
{
  return self->_supportedTransferEncodings;
}

- (void)setSupportedTransferEncodings:(id)a3
{
  objc_storeStrong((id *)&self->_supportedTransferEncodings, a3);
}

- (NSDictionary)signatures
{
  return self->_signatures;
}

- (void)setSignatures:(id)a3
{
  objc_storeStrong((id *)&self->_signatures, a3);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (MKStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_signatures, 0);
  objc_storeStrong((id *)&self->_supportedTransferEncodings, 0);
  objc_storeStrong((id *)&self->_supportedContentTypes, 0);
  objc_destroyWeak((id *)&self->_getStatusRouter);
}

@end
