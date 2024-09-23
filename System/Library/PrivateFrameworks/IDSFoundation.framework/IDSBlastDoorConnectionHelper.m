@implementation IDSBlastDoorConnectionHelper

+ (id)getBlastDoorSharedConnection
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19B980C7C;
  block[3] = &unk_1E3C1C798;
  block[4] = a1;
  if (qword_1EE40ACA0 != -1)
    dispatch_once(&qword_1EE40ACA0, block);
  return (id)qword_1EE40AC98;
}

- (IDSBlastDoorConnectionHelper)init
{
  IDSBlastDoorConnectionHelper *v2;
  id v3;
  const char *v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IDSBlastDoorConnectionHelper;
  v2 = -[IDSBlastDoorConnectionHelper init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend_setIdsBlastDoor_(v2, v4, (uint64_t)v3, v5);

  }
  return v2;
}

- (void)diffuseAPSUserPayload:(id)a3 topic:(id)a4 withCompletionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  double v14;
  char v15;
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  char v22;
  const char *v23;
  double v24;
  char v25;
  id idsBlastDoor;
  id v27;
  const char *v28;
  double v29;
  NSObject *v30;
  __CFString *v31;
  NSObject *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  IDSBlastDoorConnectionHelper *v36;
  id v37;
  char v38;
  char v39;
  char v40;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    OSLogHandleForIDSCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v30, OS_LOG_TYPE_DEFAULT, "BlastDoor: Disabled for framing messages", buf, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog())
      goto LABEL_16;
    v31 = CFSTR("BlastDoor: Disabled for framing messages");
    goto LABEL_15;
  }
  if (!self->_idsBlastDoor || (objc_opt_respondsToSelector() & 1) == 0)
  {
    OSLogHandleForIDSCategory();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v32, OS_LOG_TYPE_DEFAULT, "BlastDoor: Blastdoor object is null or does not respond to selector", buf, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog())
      goto LABEL_16;
    v31 = CFSTR("BlastDoor: Blastdoor object is null or does not respond to selector");
LABEL_15:
    _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSBlastDoorConnectionHelper"), v31);
LABEL_16:
    (*((void (**)(id, id, _QWORD, _QWORD))v10 + 2))(v10, v8, 0, 0);
    goto LABEL_17;
  }
  v11 = objc_opt_class();
  sub_19B981004(v11, v8, CFSTR("c"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_commandEnabledForBlastDoor_topic_(self, v13, (uint64_t)v12, v14, v9);

  v19 = (void *)objc_msgSend_mutableCopy(v8, v16, v17, v18);
  v22 = objc_msgSend_removeAllowlistedKey_fromPayload_(self, v20, (uint64_t)CFSTR("i"), v21, v19);
  v25 = objc_msgSend_removeAllowlistedKey_fromPayload_(self, v23, (uint64_t)CFSTR("i"), v24, v19);
  idsBlastDoor = self->_idsBlastDoor;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = sub_19B9810AC;
  v33[3] = &unk_1E3C1C7C0;
  v38 = v15;
  v34 = v8;
  v36 = self;
  v37 = v10;
  v39 = v22;
  v35 = v19;
  v40 = v25;
  v27 = v19;
  objc_msgSend_unpackPayloadDictionary_resultHandler_(idsBlastDoor, v28, (uint64_t)v27, v29, v33);

LABEL_17:
}

- (void)diffuseClientMessage:(id)a3 context:(id)a4 withCompletionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  uint64_t v18;
  id idsBlastDoor;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  id v24;
  const char *v25;
  double v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  OSLogHandleForIDSCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_dictionaryRepresentation(v9, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v31 = v15;
    _os_log_impl(&dword_19B949000, v11, OS_LOG_TYPE_DEFAULT, "Sending with context %@", buf, 0xCu);

  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    objc_msgSend_dictionaryRepresentation(v9, v16, v18, v17);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSBlastDoorConnectionHelper"), CFSTR("Sending with context %@"));

  }
  objc_msgSend_writeBlastDoorPayloadToDiskIfNecessary_withContext_(self, v16, (uint64_t)v8, v17, v9, v27);
  idsBlastDoor = self->_idsBlastDoor;
  objc_msgSend_dictionaryRepresentation(v9, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = sub_19B981530;
  v28[3] = &unk_1E3C1C838;
  v29 = v10;
  v24 = v10;
  objc_msgSend_unpackClientMessage_context_resultHandler_(idsBlastDoor, v25, (uint64_t)v8, v26, v23, v28);

}

- (BOOL)removeAllowlistedKey:(id)a3 fromPayload:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  double v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  double v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  double v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  double v29;
  int v30;
  const char *v31;
  double v32;
  uint64_t i;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  double v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  const char *v49;
  double v50;
  const char *v51;
  double v52;
  const char *v53;
  double v54;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_objectForKey_(v7, v8, (uint64_t)v6, v9);
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_9;
  if (objc_msgSend_isEqualToString_(v6, v10, (uint64_t)CFSTR("i"), v12))
  {
    v14 = (void *)objc_opt_class();
    v15 = objc_opt_class();
    if ((objc_msgSend_isSubclassOfClass_(v14, v16, v15, v17) & 1) != 0)
      goto LABEL_8;
    v18 = (void *)objc_opt_class();
    v19 = objc_opt_class();
    if ((objc_msgSend_isSubclassOfClass_(v18, v20, v19, v21) & 1) != 0)
      goto LABEL_8;
  }
  if (objc_msgSend_isEqualToString_(v6, v10, (uint64_t)CFSTR("b"), v13)
    && ((v22 = (void *)objc_opt_class(),
         v23 = objc_opt_class(),
         (objc_msgSend_isSubclassOfClass_(v22, v24, v23, v25) & 1) != 0)
     || (v26 = (void *)objc_opt_class(),
         v27 = objc_opt_class(),
         objc_msgSend_isSubclassOfClass_(v26, v28, v27, v29))))
  {
LABEL_8:
    objc_msgSend_removeObjectForKey_(v7, v10, (uint64_t)v6, v13);
    v30 = 1;
  }
  else
  {
LABEL_9:
    v30 = 0;
  }
  v56 = (void *)v11;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E3C88788, v10, (uint64_t)&v65, 0.0, v70, 16);
  if (v59)
  {
    v57 = v7;
    v58 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v59; ++i)
      {
        if (*(_QWORD *)v66 != v58)
          objc_enumerationMutation(&unk_1E3C88788);
        v34 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        objc_msgSend_objectForKey_(v7, v31, (uint64_t)v34, v32);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v61 = 0u;
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v37 = objc_opt_class();
          v60 = v34;
          sub_19B981004(v37, v7, v34);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v61, v40, v69, 16);
          if (v41)
          {
            v45 = v41;
            v46 = *(_QWORD *)v62;
            do
            {
              for (j = 0; j != v45; ++j)
              {
                if (*(_QWORD *)v62 != v46)
                  objc_enumerationMutation(v38);
                v48 = (void *)objc_msgSend_mutableCopy(*(void **)(*((_QWORD *)&v61 + 1) + 8 * j), v42, v43, v44);
                v30 |= objc_msgSend_removeAllowlistedKey_fromPayload_(self, v49, (uint64_t)v6, v50, v48);
                objc_msgSend_addObject_(v36, v51, (uint64_t)v48, v52);

              }
              v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v42, (uint64_t)&v61, v44, v69, 16);
            }
            while (v45);
          }

          v7 = v57;
          objc_msgSend_setObject_forKey_(v57, v53, (uint64_t)v36, v54, v60);

        }
      }
      v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E3C88788, v31, (uint64_t)&v65, v32, v70, 16);
    }
    while (v59);
  }

  return v30 & 1;
}

- (void)addAllowlistedKey:(id)a3 toValidatedPayload:(id)a4 fromOriginalPayload:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  double v12;
  const char *v13;
  uint64_t v14;
  double v15;
  const char *v16;
  double v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  double v28;
  const char *v29;
  double v30;
  unint64_t v31;
  void *v32;
  const char *v33;
  double v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  double v38;
  void *v39;
  const char *v40;
  double v41;
  void *v42;
  const char *v43;
  double v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_objectForKey_(v10, v11, (uint64_t)v8, v12);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend_setObject_forKey_(v9, v13, v14, v15, v8);
  v45 = (void *)v14;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E3C887A0, v13, (uint64_t)&v48, 0.0, v52, 16);
  if (v47)
  {
    v46 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v49 != v46)
          objc_enumerationMutation(&unk_1E3C887A0);
        v19 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend_objectForKey_(v10, v16, (uint64_t)v19, v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          v21 = objc_opt_class();
          sub_19B981004(v21, v10, v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_opt_class();
          v24 = v9;
          sub_19B981004(v23, v9, v19);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_count(v22, v26, v27, v28))
          {
            v31 = 0;
            do
            {
              objc_msgSend_objectAtIndexedSubscript_(v22, v29, v31, v30);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKey_(v32, v33, (uint64_t)v8, v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              if (v35)
              {
                objc_msgSend_objectAtIndex_(v25, v36, v31, v38);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectAtIndex_(v22, v40, v31, v41);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addAllowlistedKey_toValidatedPayload_fromOriginalPayload_(self, v43, (uint64_t)v8, v44, v39, v42);

              }
              ++v31;
            }
            while (objc_msgSend_count(v22, v36, v37, v38) > v31);
          }

          v9 = v24;
        }
      }
      v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E3C887A0, v16, (uint64_t)&v48, v17, v52, 16);
    }
    while (v47);
  }

}

- (void)auditMissingHeaderKeys:(id)a3 target:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  const char *v26;
  uint64_t v27;
  double v28;
  const char *v29;
  uint64_t v30;
  double v31;
  NSObject *v32;

  v5 = (objc_class *)MEMORY[0x1E0C99E60];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  objc_msgSend_allKeys(v6, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend_initWithArray_(v8, v13, (uint64_t)v12, v14);
  v16 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend_allKeys(v7, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)objc_msgSend_initWithArray_(v16, v21, (uint64_t)v20, v22);
  objc_msgSend_minusSet_(v23, v24, (uint64_t)v15, v25);
  if (objc_msgSend_count(v23, v26, v27, v28))
  {
    objc_msgSend_daemon(MEMORY[0x1E0D36A40], v29, v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      sub_19BAEF000((uint64_t)v23, v32);

  }
}

- (BOOL)commandEnabledForBlastDoor:(id)a3 topic:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double v11;
  int v12;
  char v13;
  NSObject *v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend_isEqualToString_(v6, v7, (uint64_t)CFSTR("com.apple.sps.push"), v8))
  {
LABEL_3:
    v13 = _os_feature_enabled_impl();
  }
  else
  {
    v12 = objc_msgSend_intValue(v5, v9, v10, v11);
    switch(v12)
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 32:
      case 34:
      case 64:
      case 66:
      case 90:
      case 91:
      case 92:
      case 96:
      case 97:
      case 109:
      case 110:
      case 111:
      case 112:
      case 113:
      case 115:
      case 116:
      case 117:
      case 118:
      case 119:
      case 120:
      case 121:
      case 122:
      case 128:
      case 129:
      case 130:
      case 131:
      case 132:
      case 133:
      case 134:
      case 139:
      case 140:
      case 141:
      case 142:
      case 143:
      case 144:
      case 145:
      case 146:
      case 147:
      case 148:
      case 149:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 155:
      case 160:
      case 165:
      case 170:
      case 180:
      case 181:
      case 182:
      case 190:
      case 195:
      case 196:
      case 200:
      case 201:
      case 221:
      case 222:
      case 223:
      case 224:
      case 225:
      case 228:
      case 229:
      case 250:
      case 251:
      case 255:
        goto LABEL_3;
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 33:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 47:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
      case 59:
      case 60:
      case 61:
      case 62:
      case 63:
      case 65:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 93:
      case 94:
      case 95:
      case 98:
      case 99:
      case 103:
      case 114:
      case 123:
      case 124:
      case 125:
      case 126:
      case 127:
      case 135:
      case 136:
      case 137:
      case 138:
      case 156:
      case 157:
      case 158:
      case 159:
      case 161:
      case 162:
      case 163:
      case 164:
      case 166:
      case 167:
      case 168:
      case 169:
      case 171:
      case 172:
      case 173:
      case 174:
      case 175:
      case 176:
      case 177:
      case 178:
      case 179:
      case 183:
      case 184:
      case 185:
      case 186:
      case 187:
      case 188:
      case 189:
      case 191:
      case 192:
      case 193:
      case 194:
      case 197:
      case 198:
      case 199:
      case 202:
      case 203:
      case 204:
      case 205:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 220:
      case 226:
      case 230:
      case 231:
      case 240:
      case 241:
      case 252:
      case 253:
        goto LABEL_8;
      case 100:
      case 101:
      case 102:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 206:
      case 207:
      case 208:
      case 209:
      case 210:
      case 211:
      case 227:
      case 232:
      case 233:
      case 234:
      case 235:
      case 236:
      case 237:
      case 238:
      case 239:
      case 242:
      case 243:
      case 244:
      case 245:
      case 246:
      case 247:
      case 248:
      case 249:
      case 254:
        if ((_os_feature_enabled_impl() & 1) == 0)
          goto LABEL_3;
        goto LABEL_6;
      default:
        if (v12 == 315)
          goto LABEL_3;
LABEL_8:
        OSLogHandleForIDSCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v5;
          _os_log_impl(&dword_19B949000, v15, OS_LOG_TYPE_DEFAULT, "BlastDoor: Command {%@} not handled in switch case, defaulting to NO", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("commandEnabledForBlastDoor"), CFSTR("BlastDoor: Command {%@} not handled in switch case, defaulting to NO"));
LABEL_6:
        v13 = 1;
        break;
    }
  }

  return v13;
}

- (void)writeBlastDoorPayloadToDiskIfNecessary:(id)a3 withContext:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  __CFString *v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  void *v30;
  void *v31;
  const char *v32;
  double v33;
  void *v34;
  const char *v35;
  double v36;
  void *v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  double v41;
  void *v42;
  const char *v43;
  double v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  id v49;
  double v50;
  void *v51;
  const char *v52;
  double v53;
  void *v54;
  const char *v55;
  double v56;
  id v57;
  const char *v58;
  double v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  uint8_t buf[4];
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (CUTIsInternalInstall()
    && objc_msgSend_isWriteBlastDoorPayloadsToDiskEnabled(MEMORY[0x1E0D36AF8], v7, v8, v9))
  {
    objc_msgSend_writePushPayloadsToDiskPath(MEMORY[0x1E0D36AF8], v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend_writePushPayloadsToDiskPath(MEMORY[0x1E0D36AF8], v14, v15, v16);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = CFSTR("/var/mobile/Library/IdentityServices/");
    }
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_command(v6, v14, v15, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v18, v28, (uint64_t)CFSTR("%@-client-payload-%@.data"), v29, v19, v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend_stringByAppendingPathComponent_(v17, v32, (uint64_t)v30, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileURLWithPath_(v31, v35, (uint64_t)v34, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    OSLogHandleForIDSCategory();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_absoluteString(v37, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v68 = v42;
      _os_log_impl(&dword_19B949000, v38, OS_LOG_TYPE_DEFAULT, "Writing BlastDoor payload to disk: {%@}", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_absoluteString(v37, v43, v45, v44);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSPushHandler"), CFSTR("Writing BlastDoor payload to disk: {%@}"));

    }
    v66 = 0;
    objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E0CB38B0], v43, (uint64_t)v5, v44, 200, 0, &v66, v63);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v66;
    if (v46)
    {
      objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v47, v48, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x1E0C99E98], v52, (uint64_t)CFSTR("/var/mobile/Library/IdentityServices/"), v53, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v49;
      objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v51, v55, (uint64_t)v54, v56, 1, 0, &v65);
      v57 = v65;

      v64 = v57;
      LODWORD(v51) = objc_msgSend_writeToURL_options_error_(v46, v58, (uint64_t)v37, v59, 1, &v64);
      v49 = v64;

      if ((_DWORD)v51)
      {
        OSLogHandleForIDSCategory();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v60, OS_LOG_TYPE_DEFAULT, "Write to disk: Successful", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSPushHandler"), CFSTR("Write to disk: Successful"));
      }
      else
      {
        OSLogHandleForIDSCategory();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v68 = v49;
          _os_log_impl(&dword_19B949000, v62, OS_LOG_TYPE_DEFAULT, "Write to disk: Unsuccessful with error: %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSPushHandler"), CFSTR("Write to disk: Unsuccessful with error: %@"));
      }
    }
    else
    {
      OSLogHandleForIDSCategory();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v68 = v49;
        _os_log_impl(&dword_19B949000, v61, OS_LOG_TYPE_DEFAULT, "Error while serializing BlastDoor payload %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSPushHandler"), CFSTR("Error while serializing BlastDoor payload %@"));
    }

  }
}

- (id)idsBlastDoor
{
  return self->_idsBlastDoor;
}

- (void)setIdsBlastDoor:(id)a3
{
  objc_storeStrong(&self->_idsBlastDoor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_idsBlastDoor, 0);
}

@end
