@implementation MTRDeviceTypeRevision

- (MTRDeviceTypeRevision)initWithDeviceTypeID:(id)a3 revision:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  MTRDeviceTypeRevision *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v10 = objc_msgSend_unsignedLongLongValue(v6, v8, v9);
  v13 = v10;
  if (HIDWORD(v10))
  {
    sub_234117B80(0, "NotSpecified");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v27 = v13;
      _os_log_impl(&dword_233BF3000, v22, OS_LOG_TYPE_ERROR, "MTRDeviceTypeRevision provided too-large device type ID: 0x%llx", buf, 0xCu);
    }

    if (!sub_234114844(1u))
      goto LABEL_18;
LABEL_17:
    sub_2341147D0(0, 1);
LABEL_18:
    v21 = 0;
    goto LABEL_19;
  }
  if ((v10 & 0xFFFF0000) > 0xFFFE0000 || (v10 & 0xC000) == 0xC000)
  {
    sub_234117B80(0, "NotSpecified");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v27) = v13;
      _os_log_impl(&dword_233BF3000, v23, OS_LOG_TYPE_ERROR, "MTRDeviceTypeRevision provided invalid device type ID: 0x%x", buf, 8u);
    }

    if (!sub_234114844(1u))
      goto LABEL_18;
    goto LABEL_17;
  }
  v16 = objc_msgSend_unsignedLongLongValue(v7, v11, v12);
  if ((unint64_t)(v16 - 1) >= 0xFFFF)
  {
    sub_234117B80(0, "NotSpecified");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v27 = v16;
      _os_log_impl(&dword_233BF3000, v24, OS_LOG_TYPE_ERROR, "MTRDeviceTypeRevision provided invalid device type revision: 0x%llx", buf, 0xCu);
    }

    if (!sub_234114844(1u))
      goto LABEL_18;
    goto LABEL_17;
  }
  v17 = (void *)objc_msgSend_copy(v6, v14, v15);
  v20 = (void *)objc_msgSend_copy(v7, v18, v19);
  self = sub_233D564DC((id *)&self->super.isa, v17, v20);

  v21 = self;
LABEL_19:

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char isEqual;
  id v7;
  NSNumber *deviceTypeID;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  NSNumber *deviceTypeRevision;
  void *v16;
  const char *v17;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    deviceTypeID = self->_deviceTypeID;
    objc_msgSend_deviceTypeID(v7, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqual_(deviceTypeID, v12, (uint64_t)v11))
    {
      deviceTypeRevision = self->_deviceTypeRevision;
      objc_msgSend_deviceTypeRevision(v7, v13, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(deviceTypeRevision, v17, (uint64_t)v16);

    }
    else
    {
      isEqual = 0;
    }

  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_unsignedLongValue(self->_deviceTypeID, a2, v2);
  return v4 ^ objc_msgSend_unsignedShortValue(self->_deviceTypeRevision, v5, v6);
}

- (NSNumber)deviceTypeID
{
  return self->_deviceTypeID;
}

- (NSNumber)deviceTypeRevision
{
  return self->_deviceTypeRevision;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceTypeRevision, 0);
  objc_storeStrong((id *)&self->_deviceTypeID, 0);
}

@end
