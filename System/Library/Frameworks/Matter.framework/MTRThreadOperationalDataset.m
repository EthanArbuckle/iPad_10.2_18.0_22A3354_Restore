@implementation MTRThreadOperationalDataset

- (MTRThreadOperationalDataset)initWithNetworkName:(NSString *)networkName extendedPANID:(NSData *)extendedPANID masterKey:(NSData *)masterKey PSKc:(NSData *)PSKc channelNumber:(NSNumber *)channelNumber panID:(NSData *)panID
{
  NSString *v14;
  NSData *v15;
  NSData *v16;
  NSData *v17;
  NSNumber *v18;
  NSData *v19;
  const char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  MTRThreadOperationalDataset *v47;
  objc_super v49;

  v14 = networkName;
  v15 = extendedPANID;
  v16 = masterKey;
  v17 = PSKc;
  v18 = channelNumber;
  v19 = panID;
  v49.receiver = self;
  v49.super_class = (Class)MTRThreadOperationalDataset;
  v22 = -[MTRThreadOperationalDataset init](&v49, sel_init);
  if (!v22)
    goto LABEL_4;
  v23 = objc_msgSend_copy(v14, v20, v21);
  v24 = (void *)*((_QWORD *)v22 + 33);
  *((_QWORD *)v22 + 33) = v23;

  v27 = objc_msgSend_copy(v15, v25, v26);
  v28 = (void *)*((_QWORD *)v22 + 34);
  *((_QWORD *)v22 + 34) = v27;

  v31 = objc_msgSend_copy(v16, v29, v30);
  v32 = (void *)*((_QWORD *)v22 + 35);
  *((_QWORD *)v22 + 35) = v31;

  v35 = objc_msgSend_copy(v17, v33, v34);
  v36 = (void *)*((_QWORD *)v22 + 36);
  *((_QWORD *)v22 + 36) = v35;

  v39 = objc_msgSend_copy(v18, v37, v38);
  v40 = (void *)*((_QWORD *)v22 + 37);
  *((_QWORD *)v22 + 37) = v39;

  v43 = objc_msgSend_copy(v19, v41, v42);
  v44 = (void *)*((_QWORD *)v22 + 38);
  *((_QWORD *)v22 + 38) = v43;

  *(_OWORD *)(v22 + 247) = 0u;
  *(_OWORD *)(v22 + 232) = 0u;
  *(_OWORD *)(v22 + 216) = 0u;
  *(_OWORD *)(v22 + 200) = 0u;
  *(_OWORD *)(v22 + 184) = 0u;
  *(_OWORD *)(v22 + 168) = 0u;
  *(_OWORD *)(v22 + 152) = 0u;
  *(_OWORD *)(v22 + 136) = 0u;
  *(_OWORD *)(v22 + 120) = 0u;
  *(_OWORD *)(v22 + 104) = 0u;
  *(_OWORD *)(v22 + 88) = 0u;
  *(_OWORD *)(v22 + 72) = 0u;
  *(_OWORD *)(v22 + 56) = 0u;
  *(_OWORD *)(v22 + 40) = 0u;
  *(_OWORD *)(v22 + 24) = 0u;
  *(_OWORD *)(v22 + 8) = 0u;
  if (objc_msgSend__populateCppOperationalDataset(v22, v45, v46))
    v47 = v22;
  else
LABEL_4:
    v47 = 0;

  return v47;
}

- (BOOL)_populateCppOperationalDataset
{
  uint64_t v2;
  id v4;
  const char *v5;
  uint64_t v6;
  char *v7;
  OperationalDataset *p_cppThreadOperationalDataset;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  char v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  char v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  char v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  __int16 v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  char v46;
  const char *v47;
  uint64_t v48;
  id v49;
  const char *v50;
  uint64_t v51;
  unsigned int v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v57;
  uint8_t v58[32];
  __int128 v59;
  __int128 v60;
  _QWORD v61[2];

  v61[1] = *MEMORY[0x24BDAC8D0];
  self->_cppThreadOperationalDataset.mLength = 0;
  objc_msgSend_networkName(self, a2, v2);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (char *)objc_msgSend_UTF8String(v4, v5, v6);
  p_cppThreadOperationalDataset = &self->_cppThreadOperationalDataset;
  sub_2341167C4(v7, self->_cppThreadOperationalDataset.mData, (uint64_t)v58);

  objc_msgSend_extendedPANID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend__checkDataLength_expectedLength_(self, v12, (uint64_t)v11, 8);

  if ((v13 & 1) == 0)
  {
    sub_234117B80(0, "NotSpecified");
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v58 = 0;
      _os_log_impl(&dword_233BF3000, v53, OS_LOG_TYPE_ERROR, "Invalid ExtendedPANID", v58, 2u);
    }

    if (!sub_234114844(1u))
      return 0;
LABEL_17:
    sub_2341147D0(0, 1);
    return 0;
  }
  objc_msgSend_extendedPANID(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getBytes_length_(v16, v17, (uint64_t)v61, 8);

  sub_234116490(self->_cppThreadOperationalDataset.mData, v61, (uint64_t)v58);
  objc_msgSend_masterKey(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend__checkDataLength_expectedLength_(self, v21, (uint64_t)v20, 16);

  if ((v22 & 1) == 0)
  {
    sub_234117B80(0, "NotSpecified");
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v58 = 0;
      _os_log_impl(&dword_233BF3000, v54, OS_LOG_TYPE_ERROR, "Invalid MasterKey", v58, 2u);
    }

    if (!sub_234114844(1u))
      return 0;
    goto LABEL_17;
  }
  objc_msgSend_masterKey(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getBytes_length_(v25, v26, (uint64_t)&v60, 16);

  sub_234116590(self->_cppThreadOperationalDataset.mData, &v60, (uint64_t)v58);
  objc_msgSend_PSKc(self, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend__checkDataLength_expectedLength_(self, v30, (uint64_t)v29, 16);

  if ((v31 & 1) == 0)
  {
    sub_234117B80(0, "NotSpecified");
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v58 = 0;
      _os_log_impl(&dword_233BF3000, v55, OS_LOG_TYPE_ERROR, "Invalid PKSc", v58, 2u);
    }

    if (!sub_234114844(1u))
      return 0;
    goto LABEL_17;
  }
  objc_msgSend_PSKc(self, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getBytes_length_(v34, v35, (uint64_t)&v59, 16);

  sub_234116A0C(self->_cppThreadOperationalDataset.mData, &v59, (uint64_t)v58);
  objc_msgSend_channelNumber(self, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend_unsignedShortValue(v38, v39, v40);
  sub_234116244(self->_cppThreadOperationalDataset.mData, v41, (uint64_t)v58);

  objc_msgSend_panID(self, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend__checkDataLength_expectedLength_(self, v45, (uint64_t)v44, 2);

  if ((v46 & 1) != 0)
  {
    objc_msgSend_panID(self, v47, v48);
    v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v52 = *(unsigned __int16 *)objc_msgSend_bytes(v49, v50, v51);

    sub_23411690C(p_cppThreadOperationalDataset->mData, __rev16(v52), (uint64_t)v58);
  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v58 = 0;
      _os_log_impl(&dword_233BF3000, v57, OS_LOG_TYPE_ERROR, "Invalid PAN ID", v58, 2u);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
  }
  return v46;
}

- (BOOL)_checkDataLength:(id)a3 expectedLength:(unint64_t)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v8 = objc_msgSend_length(v5, v6, v7);
  if (v8 != a4)
  {
    sub_234117B80(0, "NotSpecified");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v16 = objc_msgSend_length(v5, v10, v11);
      v17 = 2048;
      v18 = a4;
      _os_log_impl(&dword_233BF3000, v9, OS_LOG_TYPE_ERROR, "Length Check Failed. Length:%lu is incorrect, must be %tu", buf, 0x16u);
    }

    if (sub_234114844(1u))
    {
      objc_msgSend_length(v5, v12, v13);
      sub_2341147D0(0, 1);
    }
  }

  return v8 == a4;
}

- (MTRThreadOperationalDataset)initWithData:(NSData *)data
{
  NSData *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  char *v12;
  MTRThreadOperationalDataset *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  int v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  unsigned __int8 *v35[2];
  uint8_t buf[4];
  char *v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  _BYTE v41[17];
  _BYTE __dst[264];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = objc_retainAutorelease(data);
  v7 = objc_msgSend_bytes(v4, v5, v6);
  v10 = objc_msgSend_length(v4, v8, v9);
  sub_233BF7114(v35, v7, v10);
  memset(__dst, 0, 255);
  v33 = 0uLL;
  v34 = 0;
  sub_234115F2C(__dst, (size_t)v35[1], v35[0], (uint64_t)&v33);
  if ((_DWORD)v33)
  {
    sub_234117B80(0, "NotSpecified");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v31 = v33;
      v32 = v34;
      v12 = sub_2341083CC((const char **)&v31, 1);
      *(_DWORD *)buf = 136315138;
      v37 = v12;
      _os_log_impl(&dword_233BF3000, v11, OS_LOG_TYPE_ERROR, "Failed to parse data, cannot construct Operational Dataset. %s", buf, 0xCu);
    }

    if (sub_234114844(1u))
    {
      v29 = v33;
      v30 = v34;
      sub_2341083CC((const char **)&v29, 1);
      sub_2341147D0(0, 1);
    }
    v13 = 0;
  }
  else
  {
    v28 = 0;
    sub_234116710(v41, __dst, (uint64_t)buf);
    sub_2341162C8((unint64_t)__dst, &v39, buf);
    sub_234116510((unint64_t)__dst, &v38, (uint64_t)buf);
    sub_23411698C((unint64_t)__dst, &v40, (uint64_t)buf);
    sub_234116884((unint64_t)__dst, (_WORD *)&v28 + 1, (uint64_t)buf);
    sub_2341161C0((unint64_t)__dst, &v28, (uint64_t)buf);
    HIWORD(v28) = bswap32(HIWORD(v28)) >> 16;
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v14, (uint64_t)v41);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v16, (uint64_t)&v39, 8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v18, (uint64_t)&v38, 16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v20, (uint64_t)&v40, 16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v22, (unsigned __int16)v28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v24, (uint64_t)&v28 + 2, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    self = (MTRThreadOperationalDataset *)(id)objc_msgSend_initWithNetworkName_extendedPANID_masterKey_PSKc_channelNumber_panID_(self, v26, (uint64_t)v15, v17, v19, v21, v23, v25);

    v13 = self;
  }

  return v13;
}

- (NSData)data
{
  const char *v2;
  uint64_t v4[2];

  sub_233BF7114(v4, (uint64_t)&self->_cppThreadOperationalDataset, self->_cppThreadOperationalDataset.mLength);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v2, v4[0], v4[1]);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)networkName
{
  return self->_networkName;
}

- (NSData)extendedPANID
{
  return self->_extendedPANID;
}

- (NSData)masterKey
{
  return self->_masterKey;
}

- (NSData)PSKc
{
  return self->_PSKc;
}

- (NSNumber)channelNumber
{
  return self->_channelNumber;
}

- (NSData)panID
{
  return self->_panID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_panID, 0);
  objc_storeStrong((id *)&self->_channelNumber, 0);
  objc_storeStrong((id *)&self->_PSKc, 0);
  objc_storeStrong((id *)&self->_masterKey, 0);
  objc_storeStrong((id *)&self->_extendedPANID, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 262) = 0;
  return self;
}

- (void)setChannel:(uint16_t)channel
{
  NSNumber *v4;
  NSNumber *channelNumber;

  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], a2, channel);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  channelNumber = self->_channelNumber;
  self->_channelNumber = v4;

}

- (uint16_t)channel
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint16_t v6;

  objc_msgSend_channelNumber(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_unsignedShortValue(v3, v4, v5);

  return v6;
}

- (MTRThreadOperationalDataset)initWithNetworkName:(NSString *)networkName extendedPANID:(NSData *)extendedPANID masterKey:(NSData *)masterKey PSKc:(NSData *)PSKc channel:(uint16_t)channel panID:(NSData *)panID
{
  uint64_t v9;
  NSString *v14;
  NSData *v15;
  NSData *v16;
  NSData *v17;
  NSData *v18;
  const char *v19;
  void *v20;
  const char *v21;
  MTRThreadOperationalDataset *v22;

  v9 = channel;
  v14 = networkName;
  v15 = extendedPANID;
  v16 = masterKey;
  v17 = PSKc;
  v18 = panID;
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v19, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (MTRThreadOperationalDataset *)objc_msgSend_initWithNetworkName_extendedPANID_masterKey_PSKc_channelNumber_panID_(self, v21, (uint64_t)v14, v15, v16, v17, v20, v18);

  return v22;
}

@end
