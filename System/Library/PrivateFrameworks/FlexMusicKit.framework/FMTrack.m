@implementation FMTrack

- (FMTrack)initWithClips:(id)a3 mixParameters:(id)a4
{
  id v7;
  id v8;
  FMTrack *v9;
  FMTrack *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FMTrack;
  v9 = -[FMTrack init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clips, a3);
    objc_storeStrong((id *)&v10->_mixParameters, a4);
  }

  return v10;
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
  objc_msgSend_clips(self, a2, v2, v3, v4);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v28, (uint64_t)v32, 16);
  if (v6)
  {
    v11 = v6;
    v12 = *(_QWORD *)v29;
    v13 = CFSTR("\nFMClips:");
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
        objc_msgSend_stringWithFormat_(v17, v19, (uint64_t)CFSTR("\n%d) %@"), v20, v21, v14 + v15, v18);
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
    v13 = CFSTR("\nFMClips:");
  }

  return v13;
}

- (NSArray)clips
{
  return self->_clips;
}

- (void)setClips:(id)a3
{
  objc_storeStrong((id *)&self->_clips, a3);
}

- (FMMixParameters)mixParameters
{
  return self->_mixParameters;
}

- (void)setMixParameters:(id)a3
{
  objc_storeStrong((id *)&self->_mixParameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mixParameters, 0);
  objc_storeStrong((id *)&self->_clips, 0);
}

@end
