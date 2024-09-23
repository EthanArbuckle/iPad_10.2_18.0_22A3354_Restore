@implementation CRXFAppClipCodeScanningState

- (CRXFAppClipCodeScanningState)init
{
  CRXFAppClipCodeScanningState *v2;
  os_log_t v3;
  OS_os_log *log;
  uint64_t v5;
  CRXFAppClipCodeTranscoder *transcoder;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRXFAppClipCodeScanningState;
  v2 = -[CRXFAppClipCodeScanningState init](&v8, sel_init);
  if (v2)
  {
    v3 = os_log_create(CRXFLoggingSubsystem, CRXFLoggingCategory);
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    +[CRXFAppClipCodeTranscoder sharedInstance](CRXFAppClipCodeTranscoder, "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    transcoder = v2->_transcoder;
    v2->_transcoder = (CRXFAppClipCodeTranscoder *)v5;

  }
  return v2;
}

- (CRXFAppClipCodeScanningState)initWithLeftAppClipCode:(id)a3 leftAppClipCodePayload:(id)a4 rightAppClipCode:(id)a5 rightAppClipCodePayload:(id)a6 dualAppClipCode:(id)a7 dualAppClipCodePayload:(id)a8 allowUnsupportedRX:(BOOL)a9
{
  id v16;
  id v17;
  id v18;
  CRXFAppClipCodeScanningState *v19;
  CRXFAppClipCodeScanningState *v20;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v16 = a3;
  v17 = a4;
  v24 = a5;
  v23 = a6;
  v22 = a7;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)CRXFAppClipCodeScanningState;
  v19 = -[CRXFAppClipCodeScanningState init](&v25, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_leftAppClipCode, a3);
    objc_storeStrong((id *)&v20->_leftAppClipCodePayload, a4);
    objc_storeStrong((id *)&v20->_rightAppClipCode, a5);
    objc_storeStrong((id *)&v20->_rightAppClipCodePayload, a6);
    objc_storeStrong((id *)&v20->_dualAppClipCode, a7);
    objc_storeStrong((id *)&v20->_dualAppClipCodePayload, a8);
    v20->_allowUnsupportedRX = a9;
  }

  return v20;
}

- (void)reset
{
  NSData *leftAppClipCodePayload;
  CRXFAppClipCode *leftAppClipCode;
  NSData *rightAppClipCodePayload;
  CRXFAppClipCode *rightAppClipCode;
  NSData *dualAppClipCodePayload;
  CRXFAppClipCode *dualAppClipCode;

  leftAppClipCodePayload = self->_leftAppClipCodePayload;
  self->_leftAppClipCodePayload = 0;

  leftAppClipCode = self->_leftAppClipCode;
  self->_leftAppClipCode = 0;

  rightAppClipCodePayload = self->_rightAppClipCodePayload;
  self->_rightAppClipCodePayload = 0;

  rightAppClipCode = self->_rightAppClipCode;
  self->_rightAppClipCode = 0;

  dualAppClipCodePayload = self->_dualAppClipCodePayload;
  self->_dualAppClipCodePayload = 0;

  dualAppClipCode = self->_dualAppClipCode;
  self->_dualAppClipCode = 0;

}

- (BOOL)isValid
{
  return self->_leftAppClipCode && self->_rightAppClipCode || self->_dualAppClipCode != 0;
}

- (unint64_t)lensType
{
  unint64_t result;

  result = (unint64_t)self->_dualAppClipCode;
  if (result)
    return objc_msgSend((id)result, "lensType");
  result = (unint64_t)self->_leftAppClipCode;
  if (result)
    return objc_msgSend((id)result, "lensType");
  result = (unint64_t)self->_rightAppClipCode;
  if (result)
    return objc_msgSend((id)result, "lensType");
  return result;
}

- (BOOL)updateWithScannedAppClipCodePayload:(id)a3 error:(id *)a4
{
  id v7;
  NSData **p_leftAppClipCodePayload;
  NSData **p_rightAppClipCodePayload;
  NSData **p_dualAppClipCodePayload;
  BOOL v11;
  CRXFAppClipCodeTranscoder *transcoder;
  void *v14;
  CRXFAppClipCode *v15;
  CRXFAppClipCode *v16;
  CRXFAppClipCode *v17;
  CRXFAppClipCode **p_dualAppClipCode;
  CRXFAppClipCode *dualAppClipCode;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CRXFAppClipCode *rightAppClipCode;
  uint64_t v25;
  CRXFAppClipCode *leftAppClipCode;
  CRXFAppClipCode *v27;
  uint64_t v28;
  CRXFAppClipCode *v29;
  id v30;

  v7 = a3;
  p_leftAppClipCodePayload = &self->_leftAppClipCodePayload;
  if ((objc_msgSend(v7, "isEqual:", self->_leftAppClipCodePayload) & 1) == 0)
  {
    p_rightAppClipCodePayload = &self->_rightAppClipCodePayload;
    if ((objc_msgSend(v7, "isEqual:", self->_rightAppClipCodePayload) & 1) == 0)
    {
      p_dualAppClipCodePayload = &self->_dualAppClipCodePayload;
      if ((objc_msgSend(v7, "isEqual:", self->_dualAppClipCodePayload) & 1) == 0)
      {
        transcoder = self->_transcoder;
        v30 = 0;
        -[CRXFAppClipCodeTranscoder decodeAppClipCodeFromData:allowUnsupportedRX:error:](transcoder, "decodeAppClipCodeFromData:allowUnsupportedRX:error:", v7, -[CRXFAppClipCodeScanningState allowUnsupportedRX](self, "allowUnsupportedRX"), &v30);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (CRXFAppClipCode *)v30;
        v16 = v15;
        if (v15)
        {
          v17 = objc_retainAutorelease(v15);
LABEL_26:
          v11 = 0;
          *a4 = v17;
LABEL_27:

          v14 = v16;
          goto LABEL_28;
        }
        if (objc_msgSend(v14, "hasLeftAndRightRX"))
        {
          dualAppClipCode = self->_dualAppClipCode;
          p_dualAppClipCode = &self->_dualAppClipCode;
          if (dualAppClipCode)
          {
            v20 = (void *)MEMORY[0x24BDD1540];
            v21 = MEMORY[0x24BDBD1B8];
            v22 = 33;
            v23 = 102;
LABEL_25:
            objc_msgSend(v20, "crxf_errorWithCode:file:line:userInfo:", v22, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeScanningState.m", v23, v21);
            v17 = (CRXFAppClipCode *)(id)objc_claimAutoreleasedReturnValue();
            goto LABEL_26;
          }
        }
        else if (objc_msgSend(v14, "hasLeftRX"))
        {
          rightAppClipCode = self->_rightAppClipCode;
          if (rightAppClipCode)
          {
            v25 = -[CRXFAppClipCode lensType](rightAppClipCode, "lensType");
            if (v25 != objc_msgSend(v14, "lensType"))
            {
              v20 = (void *)MEMORY[0x24BDD1540];
              v21 = MEMORY[0x24BDBD1B8];
              v22 = 31;
              v23 = 107;
              goto LABEL_25;
            }
          }
          leftAppClipCode = self->_leftAppClipCode;
          p_dualAppClipCode = &self->_leftAppClipCode;
          if (leftAppClipCode)
          {
            v20 = (void *)MEMORY[0x24BDD1540];
            v21 = MEMORY[0x24BDBD1B8];
            v22 = 40;
            v23 = 116;
            goto LABEL_25;
          }
          p_dualAppClipCodePayload = p_leftAppClipCodePayload;
        }
        else
        {
          if (!objc_msgSend(v14, "hasRightRX"))
          {
            v11 = 1;
LABEL_28:

            goto LABEL_5;
          }
          v27 = self->_leftAppClipCode;
          if (v27)
          {
            v28 = -[CRXFAppClipCode lensType](v27, "lensType");
            if (v28 != objc_msgSend(v14, "lensType"))
            {
              v20 = (void *)MEMORY[0x24BDD1540];
              v21 = MEMORY[0x24BDBD1B8];
              v22 = 31;
              v23 = 121;
              goto LABEL_25;
            }
          }
          v29 = self->_rightAppClipCode;
          p_dualAppClipCode = &self->_rightAppClipCode;
          if (v29)
          {
            v20 = (void *)MEMORY[0x24BDD1540];
            v21 = MEMORY[0x24BDBD1B8];
            v22 = 40;
            v23 = 130;
            goto LABEL_25;
          }
          p_dualAppClipCodePayload = p_rightAppClipCodePayload;
        }
        objc_storeStrong((id *)p_dualAppClipCodePayload, a3);
        v16 = v14;
        v14 = *p_dualAppClipCode;
        *p_dualAppClipCode = v16;
        v11 = 1;
        goto LABEL_27;
      }
    }
  }
  v11 = 1;
LABEL_5:

  return v11;
}

- (id)asDictionary
{
  void *v3;
  void *v4;
  CRXFAppClipCode *dualAppClipCode;
  NSData *dualAppClipCodePayload;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  dualAppClipCode = self->_dualAppClipCode;
  if (dualAppClipCode)
  {
    dualAppClipCodePayload = self->_dualAppClipCodePayload;
LABEL_6:
    objc_msgSend(v4, "setObject:forKeyedSubscript:", dualAppClipCode, dualAppClipCodePayload);
    return v4;
  }
  if (self->_leftAppClipCode && self->_rightAppClipCode)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:");
    dualAppClipCode = self->_rightAppClipCode;
    dualAppClipCodePayload = self->_rightAppClipCodePayload;
    goto LABEL_6;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRXFAppClipCodeScanningState *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  CRXFAppClipCodeScanningState *v12;
  uint64_t v14;

  v5 = +[CRXFAppClipCodeScanningState allocWithZone:](CRXFAppClipCodeScanningState, "allocWithZone:");
  v6 = -[CRXFAppClipCode copyWithZone:](self->_leftAppClipCode, "copyWithZone:", a3);
  v7 = (void *)-[NSData copyWithZone:](self->_leftAppClipCodePayload, "copyWithZone:", a3);
  v8 = -[CRXFAppClipCode copyWithZone:](self->_rightAppClipCode, "copyWithZone:", a3);
  v9 = (void *)-[NSData copyWithZone:](self->_rightAppClipCodePayload, "copyWithZone:", a3);
  v10 = -[CRXFAppClipCode copyWithZone:](self->_dualAppClipCode, "copyWithZone:", a3);
  v11 = (void *)-[NSData copyWithZone:](self->_dualAppClipCodePayload, "copyWithZone:", a3);
  LOBYTE(v14) = self->_allowUnsupportedRX;
  v12 = -[CRXFAppClipCodeScanningState initWithLeftAppClipCode:leftAppClipCodePayload:rightAppClipCode:rightAppClipCodePayload:dualAppClipCode:dualAppClipCodePayload:allowUnsupportedRX:](v5, "initWithLeftAppClipCode:leftAppClipCodePayload:rightAppClipCode:rightAppClipCodePayload:dualAppClipCode:dualAppClipCodePayload:allowUnsupportedRX:", v6, v7, v8, v9, v10, v11, v14);

  return v12;
}

- (CRXFAppClipCode)leftAppClipCode
{
  return self->_leftAppClipCode;
}

- (NSData)leftAppClipCodePayload
{
  return self->_leftAppClipCodePayload;
}

- (CRXFAppClipCode)rightAppClipCode
{
  return self->_rightAppClipCode;
}

- (NSData)rightAppClipCodePayload
{
  return self->_rightAppClipCodePayload;
}

- (CRXFAppClipCode)dualAppClipCode
{
  return self->_dualAppClipCode;
}

- (NSData)dualAppClipCodePayload
{
  return self->_dualAppClipCodePayload;
}

- (BOOL)allowUnsupportedRX
{
  return self->_allowUnsupportedRX;
}

- (void)setAllowUnsupportedRX:(BOOL)a3
{
  self->_allowUnsupportedRX = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dualAppClipCodePayload, 0);
  objc_storeStrong((id *)&self->_dualAppClipCode, 0);
  objc_storeStrong((id *)&self->_rightAppClipCodePayload, 0);
  objc_storeStrong((id *)&self->_rightAppClipCode, 0);
  objc_storeStrong((id *)&self->_leftAppClipCodePayload, 0);
  objc_storeStrong((id *)&self->_leftAppClipCode, 0);
  objc_storeStrong((id *)&self->_transcoder, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
