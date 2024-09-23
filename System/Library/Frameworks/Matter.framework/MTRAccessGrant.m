@implementation MTRAccessGrant

+ (id)accessGrantForNodeID:(id)a3 privilege:(unsigned __int8)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  MTRAccessGrant *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  _BYTE *v13;
  NSObject *v14;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v8 = objc_msgSend_unsignedLongLongValue(v5, v6, v7);
  if ((unint64_t)(v8 - 1) >= 0xFFFFFFEFFFFFFFFFLL)
  {
    sub_234117B80(0, "NotSpecified");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v17 = v8;
      _os_log_impl(&dword_233BF3000, v14, OS_LOG_TYPE_ERROR, "MTRAccessGrant provided non-operational node ID: 0x%llx", buf, 0xCu);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    v13 = 0;
  }
  else
  {
    v9 = [MTRAccessGrant alloc];
    v12 = (void *)objc_msgSend_copy(v5, v10, v11);
    v13 = sub_234000104(v9, v12, a4, 2);

  }
  return v13;
}

+ (id)accessGrantForCASEAuthenticatedTag:(id)a3 privilege:(unsigned __int8)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  MTRAccessGrant *v10;
  const char *v11;
  void *v12;
  _BYTE *v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t buf[4];
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v8 = objc_msgSend_unsignedLongLongValue(v5, v6, v7);
  v9 = v8;
  if (HIDWORD(v8))
  {
    sub_234117B80(0, "NotSpecified");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v18 = v9;
      _os_log_impl(&dword_233BF3000, v14, OS_LOG_TYPE_ERROR, "MTRAccessGrant provided too-large CAT value: 0x%llx", buf, 0xCu);
    }

    if (!sub_234114844(1u))
      goto LABEL_12;
LABEL_11:
    sub_2341147D0(0, 1);
LABEL_12:
    v13 = 0;
    goto LABEL_13;
  }
  if (!(_WORD)v8)
  {
    sub_234117B80(0, "NotSpecified");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = v9;
      _os_log_impl(&dword_233BF3000, v15, OS_LOG_TYPE_ERROR, "MTRAccessGrant provided invalid CAT value: 0x%x", buf, 8u);
    }

    if (!sub_234114844(1u))
      goto LABEL_12;
    goto LABEL_11;
  }
  v10 = [MTRAccessGrant alloc];
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v11, v9 | 0xFFFFFFFD00000000);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = sub_234000104(v10, v12, a4, 2);

LABEL_13:
  return v13;
}

+ (id)accessGrantForGroupID:(id)a3 privilege:(unsigned __int8)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  MTRAccessGrant *v10;
  const char *v11;
  void *v12;
  _BYTE *v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t buf[4];
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v8 = objc_msgSend_unsignedLongLongValue(v5, v6, v7);
  v9 = v8;
  if (v8 >= 0x10000)
  {
    sub_234117B80(0, "NotSpecified");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v18 = v9;
      _os_log_impl(&dword_233BF3000, v14, OS_LOG_TYPE_ERROR, "MTRAccessGrant provided too-large group id: 0x%llx", buf, 0xCu);
    }

    if (!sub_234114844(1u))
      goto LABEL_12;
LABEL_11:
    sub_2341147D0(0, 1);
LABEL_12:
    v13 = 0;
    goto LABEL_13;
  }
  if (!v8)
  {
    sub_234117B80(0, "NotSpecified");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = 0;
      _os_log_impl(&dword_233BF3000, v15, OS_LOG_TYPE_ERROR, "MTRAccessGrant provided invalid group id: 0x%x", buf, 8u);
    }

    if (!sub_234114844(1u))
      goto LABEL_12;
    goto LABEL_11;
  }
  v10 = [MTRAccessGrant alloc];
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v11, v9 | 0xFFFFFFFFFFFF0000);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = sub_234000104(v10, v12, a4, 3);

LABEL_13:
  return v13;
}

+ (id)accessGrantForAllNodesWithPrivilege:(unsigned __int8)a3
{
  return sub_234000104([MTRAccessGrant alloc], 0, a3, 2);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  uint64_t v6;
  BOOL v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  NSNumber *subjectID;
  NSNumber *v13;
  void *v14;
  const char *v15;
  int isEqual;
  int grantedPrivilege;
  const char *v18;
  uint64_t v19;
  int authenticationMode;

  v5 = a3;
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    v8 = v5;
    v11 = v8;
    subjectID = self->_subjectID;
    v13 = subjectID;
    if (!subjectID)
    {
      objc_msgSend_subjectID(v8, v9, v10);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
        goto LABEL_10;
      v13 = self->_subjectID;
    }
    objc_msgSend_subjectID(v11, v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v13, v15, (uint64_t)v14);

    if (subjectID)
    {
      if (!isEqual)
        goto LABEL_12;
    }
    else
    {

      if ((isEqual & 1) == 0)
        goto LABEL_12;
    }
LABEL_10:
    grantedPrivilege = self->_grantedPrivilege;
    if (grantedPrivilege == objc_msgSend_grantedPrivilege(v11, v9, v10))
    {
      authenticationMode = self->_authenticationMode;
      v7 = authenticationMode == objc_msgSend_authenticationMode(v11, v18, v19);
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    v7 = 0;
    goto LABEL_13;
  }
  v7 = 0;
LABEL_14:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v2;

  return objc_msgSend_unsignedIntegerValue(self->_subjectID, a2, v2) ^ self->_grantedPrivilege ^ (unint64_t)self->_authenticationMode;
}

- (id)description
{
  uint64_t v2;
  unsigned int v3;
  const __CFString *v4;
  NSNumber *subjectID;
  unint64_t v6;
  void *v7;
  const char *v8;
  const __CFString *v9;
  void *v10;
  const char *v11;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  const __CFString *v16;

  v3 = self->_grantedPrivilege - 1;
  if (v3 > 4)
    v4 = CFSTR("Unknown");
  else
    v4 = off_2505007E8[(char)v3];
  subjectID = self->_subjectID;
  if (subjectID)
  {
    v6 = objc_msgSend_unsignedLongLongValue(subjectID, a2, v2);
    if (v6 < 0xFFFFFFFFFFFF0000)
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      v15 = v6;
      v16 = v4;
      v13 = objc_opt_class();
      if (HIDWORD(v6) == 4294967293)
        v9 = CFSTR("<%@ nodes with CASE Authenticated Tag 0x%08x can %@>");
      else
        v9 = CFSTR("<%@ node 0x%016llx can %@>");
    }
    else
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      v15 = (unsigned __int16)v6;
      v16 = v4;
      v13 = objc_opt_class();
      v9 = CFSTR("<%@ group 0x%x can %@>");
    }
    objc_msgSend_stringWithFormat_(v7, v8, (uint64_t)v9, v13, v15, v16);
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    v14 = objc_opt_class();
    objc_msgSend_stringWithFormat_(v10, v11, (uint64_t)CFSTR("<%@ all nodes can %@>"), v14, v4);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSNumber)subjectID
{
  return self->_subjectID;
}

- (unsigned)grantedPrivilege
{
  return self->_grantedPrivilege;
}

- (unsigned)authenticationMode
{
  return self->_authenticationMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subjectID, 0);
}

@end
