@implementation FMMixParameters

- (FMMixParameters)init
{
  FMMixParameters *v2;
  uint64_t v3;
  NSMutableArray *volumeKeyFrames;
  NSMutableArray *v5;
  FMKeyFrame *v6;
  double v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)FMMixParameters;
  v2 = -[FMMixParameters init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    volumeKeyFrames = v2->_volumeKeyFrames;
    v2->_volumeKeyFrames = (NSMutableArray *)v3;

    v5 = v2->_volumeKeyFrames;
    v6 = [FMKeyFrame alloc];
    LODWORD(v7) = 1.0;
    v11 = (void *)objc_msgSend_initWithValue_atTime_(v6, v8, 0, v9, v10, v7);
    objc_msgSend_addObject_(v5, v12, (uint64_t)v11, v13, v14);

  }
  return v2;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend_volumeKeyFrames(self, a2, v2, v3, v4);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v28, (uint64_t)v32, 16);
  if (v6)
  {
    v11 = v6;
    v12 = *(_QWORD *)v29;
    v13 = CFSTR("Keyframes: \n");
    v14 = 1;
    do
    {
      v15 = 0;
      v16 = v13;
      do
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(obj);
        v17 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_description(*(void **)(*((_QWORD *)&v28 + 1) + 8 * v15), v7, v8, v9, v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v17, v19, (uint64_t)CFSTR("\n\t%d) %@"), v20, v21, v14 + v15, v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingString_(v16, v23, (uint64_t)v22, v24, v25);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v15;
        v16 = v13;
      }
      while (v11 != v15);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v28, (uint64_t)v32, 16);
      v14 = (v14 + v15);
    }
    while (v11);
  }
  else
  {
    v13 = CFSTR("Keyframes: \n");
  }

  return v13;
}

- (float)volumeValueAtTime:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  NSMutableArray *volumeKeyFrames;
  const char *v8;
  uint64_t v9;
  float v10;
  _QWORD v12[7];
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  float *v16;
  uint64_t v17;
  int v18;

  v15 = 0;
  v16 = (float *)&v15;
  v17 = 0x2020000000;
  v18 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_20D03F490;
  v13[4] = sub_20D03F4A0;
  objc_msgSend_volumeKeyFrames(self, a2, a3, v3, v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  volumeKeyFrames = self->_volumeKeyFrames;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_20D03F4A8;
  v12[3] = &unk_24C5F09E0;
  v12[5] = v13;
  v12[6] = a3;
  v12[4] = &v15;
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(volumeKeyFrames, v8, 2, (uint64_t)v12, v9);
  v10 = v16[6];
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (id)lastVolumeKeyFrame
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_lastObject(self->_volumeKeyFrames, a2, v2, v3, v4);
}

- (BOOL)appendVolumeKeyframe:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v4 = a3;
  objc_msgSend_lastVolumeKeyFrame(self, v5, v6, v7, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13
    && (v14 = objc_msgSend_sampleTime(v4, v9, v10, v11, v12), v14 < objc_msgSend_sampleTime(v13, v15, v16, v17, v18)))
  {
    v19 = 0;
  }
  else
  {
    v20 = objc_msgSend_sampleTime(v4, v9, v10, v11, v12);
    if (v20 == objc_msgSend_sampleTime(v13, v21, v22, v23, v24))
    {
      objc_msgSend_value(v4, v25, v26, v27, v28);
      objc_msgSend_setValue_(v13, v29, v30, v31, v32);
    }
    else
    {
      objc_msgSend_addObject_(self->_volumeKeyFrames, v25, (uint64_t)v4, v27, v28);
    }
    v19 = 1;
  }

  return v19;
}

- (void)insertVolumeKeyframe:(id)a3
{
  id v4;
  NSMutableArray *volumeKeyFrames;
  id v6;
  const char *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  volumeKeyFrames = self->_volumeKeyFrames;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_20D03F76C;
  v9[3] = &unk_24C5F0A08;
  v6 = v4;
  v10 = v6;
  objc_copyWeak(&v11, &location);
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(volumeKeyFrames, v7, 2, (uint64_t)v9, v8);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

- (BOOL)volumeKeyframesAreValid
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *volumeKeyFrames;
  char v5;
  _QWORD v7[6];
  _QWORD v8[4];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = -1;
  volumeKeyFrames = self->_volumeKeyFrames;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_20D03F900;
  v7[3] = &unk_24C5F0A30;
  v7[4] = v8;
  v7[5] = &v9;
  objc_msgSend_enumerateObjectsUsingBlock_(volumeKeyFrames, a2, (uint64_t)v7, v2, v3);
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (BOOL)removeRedundantVolumeKeyFrames
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  _QWORD v27[7];
  _QWORD v28[3];
  int v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_20D03F490;
  v34 = sub_20D03F4A0;
  v35 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = -1082130432;
  objc_msgSend_volumeKeyFrames(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = sub_20D03FAFC;
  v27[3] = &unk_24C5F0A58;
  v27[4] = self;
  v27[5] = v28;
  v27[6] = &v30;
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v6, v7, 2, (uint64_t)v27, v8);

  if (v31[5])
  {
    v13 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend_volumeKeyFrames(self, v9, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithArray_(v13, v15, (uint64_t)v14, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_removeObjectsInArray_(v18, v19, v31[5], v20, v21);
    objc_msgSend_setVolumeKeyFrames_(self, v22, (uint64_t)v18, v23, v24);

    v25 = v31[5] != 0;
  }
  else
  {
    v25 = 0;
  }
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);

  return v25;
}

- (NSArray)volumeKeyFrames
{
  return &self->_volumeKeyFrames->super;
}

- (void)setVolumeKeyFrames:(id)a3
{
  objc_storeStrong((id *)&self->_volumeKeyFrames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeKeyFrames, 0);
}

@end
