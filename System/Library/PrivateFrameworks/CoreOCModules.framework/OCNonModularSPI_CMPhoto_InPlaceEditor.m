@implementation OCNonModularSPI_CMPhoto_InPlaceEditor

- (void)updateModifiedXMP:(id)a3
{
  MEMORY[0x24BEDD108](self, sel_setModifiedXMP_, a3);
}

- (void)updateModifiedCustom:(id)a3
{
  MEMORY[0x24BEDD108](self, sel_setModifiedCustom_, a3);
}

- (void)updateModifiedExtrinsicsPosition:(id)a3 rotation:(id)a4
{
  const char *v6;
  const char *v7;
  id v8;

  v8 = a4;
  objc_msgSend_setModifiedExtrinsicsPosition_(self, v6, (uint64_t)a3);
  objc_msgSend_setModifiedExtrinsicsRotation_(self, v7, (uint64_t)v8);

}

- (BOOL)shouldModifyMetadataForImageIndex:(int64_t)a3 payloadIndex:(int64_t)a4 withType:(unint64_t)a5 customMetadataIdentifier:(id)a6
{
  BOOL result;
  void *v7;
  const char *v8;
  char isEqualToString;

  result = 1;
  if (a5 != 1 && a5 != 4)
  {
    if (a5 == 3)
    {
      objc_msgSend_objectForKeyedSubscript_(a6, a2, *MEMORY[0x24BE120E8], a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v7, v8, (uint64_t)CFSTR("tag:apple.com,2023:ObjectCapture#ObjectBoundingBox"));

      return isEqualToString;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (int)metadataPayload:(id)a3 forImageIndex:(int64_t)a4 payloadIndex:(int64_t)a5 withType:(unint64_t)a6 customMetadataIdentifier:(id)a7 modifiedData:(id *)a8
{
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  const char *v19;
  int isEqualToString;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;

  v12 = a3;
  v13 = a7;
  v16 = v13;
  if (a6 == 3)
  {
    objc_msgSend_objectForKeyedSubscript_(v13, v14, *MEMORY[0x24BE120E8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v18, v19, (uint64_t)CFSTR("tag:apple.com,2023:ObjectCapture#ObjectBoundingBox"));

    if (isEqualToString)
    {
      objc_msgSend_modifiedCustom(self, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v23, v24, *MEMORY[0x24BE120D8]);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      v17 = 0;
      goto LABEL_7;
    }
LABEL_6:
    v17 = -17102;
    goto LABEL_7;
  }
  if (a6 != 1)
    goto LABEL_6;
  objc_msgSend_modifiedXMP(self, v14, v15);
  v17 = 0;
  *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v17;
}

- (int)extrinsics:(id)a3 forIndex:(int64_t)a4 modifiedExtrinsics:(id *)a5
{
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;

  v7 = (void *)objc_msgSend_mutableCopy(a3, a2, (uint64_t)a3, a4);
  objc_msgSend_modifiedExtrinsicsPosition(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v7, v11, (uint64_t)v10, *MEMORY[0x24BE11FD8]);

  objc_msgSend_modifiedExtrinsicsRotation(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v7, v15, (uint64_t)v14, *MEMORY[0x24BE11FE0]);

  v16 = objc_retainAutorelease(v7);
  *a5 = v16;

  return 0;
}

- (NSData)modifiedXMP
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setModifiedXMP:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDictionary)modifiedCustom
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setModifiedCustom:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)modifiedExtrinsicsPosition
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setModifiedExtrinsicsPosition:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)modifiedExtrinsicsRotation
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setModifiedExtrinsicsRotation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedExtrinsicsRotation, 0);
  objc_storeStrong((id *)&self->_modifiedExtrinsicsPosition, 0);
  objc_storeStrong((id *)&self->_modifiedCustom, 0);
  objc_storeStrong((id *)&self->_modifiedXMP, 0);
}

@end
