@implementation ENSignature

- (ENSignature)initWithBytes:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  void (**v8)(_QWORD);
  ENSignature *v9;
  ENProtobufCoder *v10;
  uint64_t v11;
  void *v12;
  id *v13;
  BOOL v14;
  ENProtobufCoder *v15;
  id *v16;
  uint64_t v17;
  id *v18;
  BOOL v19;
  int v20;
  id *v21;
  _BOOL4 v22;
  id *v23;
  BOOL v24;
  id *v25;
  BOOL v26;
  id *v27;
  uint64_t v28;
  NSData *signatureData;
  ENSignature *v30;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  id obj;
  uint64_t v41;
  unsigned __int8 v42;
  _QWORD v43[6];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__0;
  v48 = __Block_byref_object_dispose__0;
  v49 = 0;
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __42__ENSignature_initWithBytes_length_error___block_invoke;
  v43[3] = &unk_24C38B3F0;
  v43[4] = &v44;
  v43[5] = a5;
  v8 = (void (**)(_QWORD))MEMORY[0x20BD2F464](v43, a2);
  v9 = -[ENSignature init](self, "init");
  if (v9)
  {
    v10 = objc_alloc_init(ENProtobufCoder);
    v11 = -[ENProtobufCoder setReadMemory:length:](v10, "setReadMemory:length:", a3, a4);
    do
    {
      v12 = (void *)MEMORY[0x20BD2F320](v11);
      v42 = 0;
      v13 = (id *)(v45 + 5);
      obj = (id)v45[5];
      v41 = 0;
      v14 = -[ENProtobufCoder readType:tag:eofOkay:error:](v10, "readType:tag:eofOkay:error:", &v42, &v41, 1, &obj);
      objc_storeStrong(v13, obj);
      if (v14)
      {
        switch(v41)
        {
          case 1:
            v39 = 0;
            v15 = objc_retainAutorelease(v10);
            v16 = (id *)(v45 + 5);
            v38 = (id)v45[5];
            v17 = -[ENProtobufCoder readLengthDelimited:error:](v15, "readLengthDelimited:error:", &v39, &v38);
            objc_storeStrong(v16, v38);
            if (v17)
            {
              v18 = (id *)(v45 + 5);
              v37 = (id)v45[5];
              v19 = -[ENSignature _readSignatureInfoPtr:length:error:](v9, "_readSignatureInfoPtr:length:error:", v17, v39, &v37);
              objc_storeStrong(v18, v37);
              if (v19)
                goto LABEL_19;
            }
            goto LABEL_7;
          case 2:
            LODWORD(v39) = 0;
            v23 = (id *)(v45 + 5);
            v36 = (id)v45[5];
            v24 = -[ENProtobufCoder readVarIntUInt32:error:](v10, "readVarIntUInt32:error:", &v39, &v36);
            objc_storeStrong(v23, v36);
            if (!v24)
              goto LABEL_7;
            v9->_batchNumber = v39;
            goto LABEL_19;
          case 3:
            LODWORD(v39) = 0;
            v25 = (id *)(v45 + 5);
            v35 = (id)v45[5];
            v26 = -[ENProtobufCoder readVarIntUInt32:error:](v10, "readVarIntUInt32:error:", &v39, &v35);
            objc_storeStrong(v25, v35);
            if (!v26)
              goto LABEL_7;
            v9->_batchCount = v39;
            goto LABEL_19;
          case 4:
            v27 = (id *)(v45 + 5);
            v34 = (id)v45[5];
            -[ENProtobufCoder readNSDataAndReturnError:](v10, "readNSDataAndReturnError:", &v34);
            v28 = objc_claimAutoreleasedReturnValue();
            objc_storeStrong(v27, v34);
            if (!v28)
              goto LABEL_7;
            signatureData = v9->_signatureData;
            v9->_signatureData = (NSData *)v28;

            goto LABEL_19;
          default:
            v21 = (id *)(v45 + 5);
            v33 = (id)v45[5];
            v22 = -[ENProtobufCoder skipType:error:](v10, "skipType:error:", v42, &v33);
            objc_storeStrong(v21, v33);
            if (v22)
LABEL_19:
              v20 = 0;
            else
LABEL_7:
              v20 = 1;
            break;
        }
      }
      else if (v45[5])
      {
        v20 = 1;
      }
      else
      {
        v20 = 4;
      }
      objc_autoreleasePoolPop(v12);
    }
    while (!v20);
    if (v20 == 4)
      v30 = v9;
    else
      v30 = 0;
  }
  else
  {
    ENErrorF(1);
    v32 = objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v10 = (ENProtobufCoder *)v45[5];
    v45[5] = v32;
  }

  v8[2](v8);
  _Block_object_dispose(&v44, 8);

  return v30;
}

id __42__ENSignature_initWithBytes_length_error___block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (result)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      result = objc_retainAutorelease(result);
      **(_QWORD **)(a1 + 40) = result;
    }
  }
  return result;
}

- (BOOL)_readSignatureInfoPtr:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  void (**v8)(_QWORD);
  ENProtobufCoder *v9;
  uint64_t v10;
  void *v11;
  id *v12;
  BOOL v13;
  id *v14;
  NSString *v15;
  NSString *appleBundleID;
  int v17;
  id *v18;
  BOOL v19;
  id *v20;
  NSString *v21;
  id *v22;
  NSString *v23;
  id *v24;
  NSString *v25;
  id *v26;
  NSString *v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id obj;
  uint64_t v36;
  unsigned __int8 v37;
  _QWORD v38[6];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__0;
  v43 = __Block_byref_object_dispose__0;
  v44 = 0;
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __50__ENSignature__readSignatureInfoPtr_length_error___block_invoke;
  v38[3] = &unk_24C38B3F0;
  v38[4] = &v39;
  v38[5] = a5;
  v8 = (void (**)(_QWORD))MEMORY[0x20BD2F464](v38, a2);
  v9 = objc_alloc_init(ENProtobufCoder);
  v10 = -[ENProtobufCoder setReadMemory:length:](v9, "setReadMemory:length:", a3, a4);
  do
  {
    v11 = (void *)MEMORY[0x20BD2F320](v10);
    v37 = 0;
    v12 = (id *)(v40 + 5);
    obj = (id)v40[5];
    v36 = 0;
    v13 = -[ENProtobufCoder readType:tag:eofOkay:error:](v9, "readType:tag:eofOkay:error:", &v37, &v36, 1, &obj);
    objc_storeStrong(v12, obj);
    if (v13)
    {
      switch(v36)
      {
        case 1:
          v14 = (id *)(v40 + 5);
          v34 = (id)v40[5];
          -[ENProtobufCoder readNSStringAndReturnError:](v9, "readNSStringAndReturnError:", &v34);
          v15 = (NSString *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v14, v34);
          if (!v15)
            goto LABEL_23;
          appleBundleID = self->_appleBundleID;
          self->_appleBundleID = v15;
          goto LABEL_19;
        case 2:
          v20 = (id *)(v40 + 5);
          v33 = (id)v40[5];
          -[ENProtobufCoder readNSStringAndReturnError:](v9, "readNSStringAndReturnError:", &v33);
          v21 = (NSString *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v20, v33);
          if (!v21)
            goto LABEL_23;
          appleBundleID = self->_androidBundleID;
          self->_androidBundleID = v21;
          goto LABEL_19;
        case 3:
          v22 = (id *)(v40 + 5);
          v32 = (id)v40[5];
          -[ENProtobufCoder readNSStringAndReturnError:](v9, "readNSStringAndReturnError:", &v32);
          v23 = (NSString *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v22, v32);
          if (!v23)
            goto LABEL_23;
          appleBundleID = self->_keyVersion;
          self->_keyVersion = v23;
          goto LABEL_19;
        case 4:
          v24 = (id *)(v40 + 5);
          v31 = (id)v40[5];
          -[ENProtobufCoder readNSStringAndReturnError:](v9, "readNSStringAndReturnError:", &v31);
          v25 = (NSString *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v24, v31);
          if (!v25)
            goto LABEL_23;
          appleBundleID = self->_keyID;
          self->_keyID = v25;
          goto LABEL_19;
        case 5:
          v26 = (id *)(v40 + 5);
          v30 = (id)v40[5];
          -[ENProtobufCoder readNSStringAndReturnError:](v9, "readNSStringAndReturnError:", &v30);
          v27 = (NSString *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v26, v30);
          if (!v27)
            goto LABEL_23;
          appleBundleID = self->_signatureAlgorithm;
          self->_signatureAlgorithm = v27;
LABEL_19:

          goto LABEL_20;
        default:
          v18 = (id *)(v40 + 5);
          v29 = (id)v40[5];
          v19 = -[ENProtobufCoder skipType:error:](v9, "skipType:error:", v37, &v29);
          objc_storeStrong(v18, v29);
          if (v19)
LABEL_20:
            v17 = 0;
          else
LABEL_23:
            v17 = 1;
          break;
      }
    }
    else if (v40[5])
    {
      v17 = 1;
    }
    else
    {
      v17 = 2;
    }
    objc_autoreleasePoolPop(v11);
  }
  while (!v17);

  v8[2](v8);
  _Block_object_dispose(&v39, 8);

  return v17 == 2;
}

id __50__ENSignature__readSignatureInfoPtr_length_error___block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (result)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      result = objc_retainAutorelease(result);
      **(_QWORD **)(a1 + 40) = result;
    }
  }
  return result;
}

- (BOOL)encodeWithProtobufCoder:(id)a3 error:(id *)a4
{
  id v6;
  ENProtobufCoder *v7;
  id v8;
  uint64_t v9;
  NSData *signatureData;
  BOOL v11;

  v6 = a3;
  v7 = objc_alloc_init(ENProtobufCoder);
  v8 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  -[ENProtobufCoder setWriteMutableData:](v7, "setWriteMutableData:", v8);
  v11 = 0;
  if (-[ENSignature _encodeInfoWithProtobufCoder:error:](self, "_encodeInfoWithProtobufCoder:error:", v7, a4))
  {
    v9 = objc_msgSend(v8, "length");
    if (!v9
      || objc_msgSend(v6, "writeLengthDelimitedPtr:length:tag:error:", objc_msgSend(objc_retainAutorelease(v8), "bytes"), v9, 1, a4))
    {
      if (objc_msgSend(v6, "writeVarIntUInt32:tag:error:", self->_batchNumber, 2, a4))
      {
        if (objc_msgSend(v6, "writeVarIntUInt32:tag:error:", self->_batchCount, 3, a4))
        {
          signatureData = self->_signatureData;
          if (!signatureData || objc_msgSend(v6, "writeNSData:tag:error:", signatureData, 4, a4))
            v11 = 1;
        }
      }
    }
  }

  return v11;
}

- (BOOL)_encodeInfoWithProtobufCoder:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSString *appleBundleID;
  NSString *androidBundleID;
  NSString *keyVersion;
  NSString *keyID;
  NSString *signatureAlgorithm;
  BOOL v13;

  v6 = a3;
  v7 = v6;
  appleBundleID = self->_appleBundleID;
  v13 = 0;
  if (!appleBundleID || objc_msgSend(v6, "writeNSString:tag:error:", appleBundleID, 1, a4))
  {
    androidBundleID = self->_androidBundleID;
    if (!androidBundleID || objc_msgSend(v7, "writeNSString:tag:error:", androidBundleID, 2, a4))
    {
      keyVersion = self->_keyVersion;
      if (!keyVersion || objc_msgSend(v7, "writeNSString:tag:error:", keyVersion, 3, a4))
      {
        keyID = self->_keyID;
        if (!keyID || objc_msgSend(v7, "writeNSString:tag:error:", keyID, 4, a4))
        {
          signatureAlgorithm = self->_signatureAlgorithm;
          if (!signatureAlgorithm
            || objc_msgSend(v7, "writeNSString:tag:error:", signatureAlgorithm, 5, a4))
          {
            v13 = 1;
          }
        }
      }
    }
  }

  return v13;
}

- (ENSignature)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  ENSignature *v7;
  int v8;
  int v9;
  ENSignature *v10;

  v6 = a3;
  v7 = -[ENSignature init](self, "init");
  if (!v7)
  {
    if (!a4)
      goto LABEL_21;
LABEL_20:
    ENErrorF(2);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (MEMORY[0x20BD2F7B8](v6) != MEMORY[0x24BDACFA0])
  {
    if (!a4)
      goto LABEL_21;
    goto LABEL_20;
  }
  if (!CUXPCDecodeNSString() || !CUXPCDecodeNSString())
    goto LABEL_21;
  v8 = CUXPCDecodeUInt64RangedEx();
  if (v8 == 6)
  {
    v7->_batchCount = 0;
  }
  else if (v8 == 5)
  {
    goto LABEL_21;
  }
  v9 = CUXPCDecodeUInt64RangedEx();
  if (v9 != 6)
  {
    if (v9 != 5)
      goto LABEL_11;
LABEL_21:
    v10 = 0;
    goto LABEL_16;
  }
  v7->_batchNumber = 0;
LABEL_11:
  if (!CUXPCDecodeNSString()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSData())
  {
    goto LABEL_21;
  }
  v10 = v7;
LABEL_16:

  return v10;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  const char *v5;
  NSString *androidBundleID;
  id v7;
  const char *v8;
  uint64_t batchCount;
  uint64_t batchNumber;
  NSString *keyID;
  id v12;
  const char *v13;
  NSString *keyVersion;
  id v15;
  const char *v16;
  NSString *signatureAlgorithm;
  const char *v18;
  NSData *signatureData;
  NSData *v20;
  id v21;
  uint64_t v22;
  const char *v23;
  size_t v24;
  xpc_object_t xdict;

  v4 = a3;
  v5 = -[NSString UTF8String](objc_retainAutorelease(self->_appleBundleID), "UTF8String");
  if (v5)
    xpc_dictionary_set_string(v4, "aBid", v5);
  androidBundleID = self->_androidBundleID;
  v7 = v4;
  v8 = -[NSString UTF8String](objc_retainAutorelease(androidBundleID), "UTF8String");
  if (v8)
    xpc_dictionary_set_string(v7, "andBid", v8);

  batchCount = self->_batchCount;
  if ((_DWORD)batchCount)
    xpc_dictionary_set_uint64(v7, "btCnt", batchCount);
  batchNumber = self->_batchNumber;
  if ((_DWORD)batchNumber)
    xpc_dictionary_set_uint64(v7, "btNum", batchNumber);
  keyID = self->_keyID;
  v12 = v7;
  v13 = -[NSString UTF8String](objc_retainAutorelease(keyID), "UTF8String");
  if (v13)
    xpc_dictionary_set_string(v12, "keyID", v13);

  keyVersion = self->_keyVersion;
  v15 = v12;
  v16 = -[NSString UTF8String](objc_retainAutorelease(keyVersion), "UTF8String");
  if (v16)
    xpc_dictionary_set_string(v15, "keyV", v16);

  signatureAlgorithm = self->_signatureAlgorithm;
  xdict = v15;
  v18 = -[NSString UTF8String](objc_retainAutorelease(signatureAlgorithm), "UTF8String");
  if (v18)
    xpc_dictionary_set_string(xdict, "sigAlg", v18);

  signatureData = self->_signatureData;
  if (signatureData)
  {
    v20 = objc_retainAutorelease(signatureData);
    v21 = xdict;
    v22 = -[NSData bytes](v20, "bytes");
    if (v22)
      v23 = (const char *)v22;
    else
      v23 = "";
    v24 = -[NSData length](v20, "length");

    xpc_dictionary_set_data(v21, "sigD", v23, v24);
  }

}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  NSString *appleBundleID;
  void *v10;

  NSAppendPrintF_safe();
  v3 = 0;
  v4 = v3;
  if (self->_appleBundleID)
  {
    v10 = v3;
    appleBundleID = self->_appleBundleID;
    NSAppendPrintF_safe();
    v5 = v10;

    v4 = v5;
  }
  if (self->_androidBundleID)
  {
    appleBundleID = self->_androidBundleID;
    NSAppendPrintF_safe();
    v6 = v4;

    v4 = v6;
  }
  -[NSData length](self->_signatureData, "length", appleBundleID);
  NSAppendPrintF_safe();
  v7 = v4;

  return v7;
}

- (NSString)appleBundleID
{
  return self->_appleBundleID;
}

- (void)setAppleBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)androidBundleID
{
  return self->_androidBundleID;
}

- (void)setAndroidBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)batchNumber
{
  return self->_batchNumber;
}

- (void)setBatchNumber:(unsigned int)a3
{
  self->_batchNumber = a3;
}

- (unsigned)batchCount
{
  return self->_batchCount;
}

- (void)setBatchCount:(unsigned int)a3
{
  self->_batchCount = a3;
}

- (NSString)keyID
{
  return self->_keyID;
}

- (void)setKeyID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)keyVersion
{
  return self->_keyVersion;
}

- (void)setKeyVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)signatureAlgorithm
{
  return self->_signatureAlgorithm;
}

- (void)setSignatureAlgorithm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)signatureData
{
  return self->_signatureData;
}

- (void)setSignatureData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureData, 0);
  objc_storeStrong((id *)&self->_signatureAlgorithm, 0);
  objc_storeStrong((id *)&self->_keyVersion, 0);
  objc_storeStrong((id *)&self->_keyID, 0);
  objc_storeStrong((id *)&self->_androidBundleID, 0);
  objc_storeStrong((id *)&self->_appleBundleID, 0);
}

@end
