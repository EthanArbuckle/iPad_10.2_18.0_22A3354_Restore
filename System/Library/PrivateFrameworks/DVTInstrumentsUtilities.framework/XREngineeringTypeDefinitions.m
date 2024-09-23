@implementation XREngineeringTypeDefinitions

+ (id)descriptionForImplClass:(unsigned __int8)a3
{
  if ((a3 - 1) > 5)
    return CFSTR("invalid");
  else
    return off_24EDC4290[(char)(a3 - 1)];
}

+ (id)implementationClassByEngineeringTypeMnemonic
{
  void *v2;
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;

  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_22635D468;
  v9[3] = &unk_24EDC3EF8;
  v4 = v2;
  v10 = v4;
  objc_msgSend_enumerateEngineeringTypeDefs_(v3, v5, (uint64_t)v9, v6, v7);

  return v4;
}

- (NSDate)lastModificationDate
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  sub_22635D5A0();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v2, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_attributesOfItemAtPath_error_(v7, v13, (uint64_t)v12, 0, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v15, v16, *MEMORY[0x24BDD0C98], v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend_copy(v19, v20, v21, v22, v23);

  return (NSDate *)v24;
}

- (id)checksum
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CC_LONG v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned __int8 *v39;
  CC_MD5_CTX v41;

  sub_22635D5A0();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileHandleForReadingFromURL_error_(MEMORY[0x24BDD1578], v3, (uint64_t)v2, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v41, 0, sizeof(v41));
  CC_MD5_Init(&v41);
  v9 = 0;
  do
  {
    v10 = v9;
    objc_msgSend_readDataOfLength_(v5, v6, 4096, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      break;
    if (objc_msgSend_length(v9, v11, v12, v13, v14))
    {
      if ((unint64_t)objc_msgSend_length(v9, v15, v16, v17, v18) > 0x1000)
        sub_22636FD94();
      v19 = objc_retainAutorelease(v9);
      v24 = (const void *)objc_msgSend_bytes(v19, v20, v21, v22, v23);
      v29 = objc_msgSend_length(v19, v25, v26, v27, v28);
      CC_MD5_Update(&v41, v24, v29);
    }
  }
  while (objc_msgSend_length(v9, v15, v16, v17, v18) == 4096);
  v30 = objc_alloc(MEMORY[0x24BDBCEC8]);
  v34 = objc_retainAutorelease((id)objc_msgSend_initWithLength_(v30, v31, 16, v32, v33));
  v39 = (unsigned __int8 *)objc_msgSend_mutableBytes(v34, v35, v36, v37, v38);
  CC_MD5_Final(v39, &v41);

  return v34;
}

- (void)enumerateEngineeringTypeDefs:(id)a3
{
  id v4;
  void *v5;
  id etypeDefHandler;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _XREngineeringTypeDefTopLevel *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;
  id v17;

  v4 = a3;
  sub_22635D5A0();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x227696724](v4);

  etypeDefHandler = self->_etypeDefHandler;
  self->_etypeDefHandler = v5;

  objc_msgSend_inputStreamWithURL_(MEMORY[0x24BDBCE90], v7, (uint64_t)v17, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [_XREngineeringTypeDefTopLevel alloc];
  v14 = (void *)objc_msgSend_initWithElementName_context_(v11, v12, (uint64_t)CFSTR("engineering-types"), (uint64_t)self, v13);
  objc_msgSend_parseStream_topLevelParser_delegate_(XRXMLParser, v15, (uint64_t)v10, (uint64_t)v14, (uint64_t)self);
  v16 = self->_etypeDefHandler;
  self->_etypeDefHandler = 0;

}

- (void)parser:(id)a3 didFinishParsingElement:(id)a4
{
  id v5;

  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    (*((void (**)(void))self->_etypeDefHandler + 2))();

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_etypeDefHandler, 0);
}

+ (BOOL)registerEngineeringTypes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_226361730;
  v10[3] = &unk_24EDC3EF8;
  v11 = v3;
  v5 = v3;
  objc_msgSend_enumerateEngineeringTypeDefs_(v4, v6, (uint64_t)v10, v7, v8);

  return 1;
}

+ (void)announceUsageOfEnumString:(id)a3 context:(id)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  __objc2_class *v11;
  __objc2_class *v12;

  v12 = (__objc2_class *)a4;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v5, (uint64_t)CFSTR("com.apple.dt.etype.%@"), v6, v7, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v12;
  if (!v12)
    v11 = XRCapabilityContext;
  objc_msgSend_announceUsedCapability_version_(v11, v8, (uint64_t)v10, 1, v9);

}

@end
