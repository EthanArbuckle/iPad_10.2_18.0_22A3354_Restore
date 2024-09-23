@implementation BWStillImageProcessingPlan

- (BWStillImageProcessingPlan)initWithSettings:(id)a3
{
  BWStillImageProcessingPlan *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWStillImageProcessingPlan;
  v4 = -[BWStillImageProcessingPlan init](&v6, sel_init);
  if (v4)
  {
    v4->_settings = (BWStillImageSettings *)a3;
    v4->_inputsByBufferTypeByPortTypeBySequenceNumber = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageProcessingPlan;
  -[BWStillImageProcessingPlan dealloc](&v3, sel_dealloc);
}

- (void)addInput:(id)a3 sequenceNumber:(unsigned int)a4 portType:(id)a5 bufferType:(unint64_t)a6
{
  uint64_t v8;
  void *v11;
  void *v12;
  void *v13;

  if (a3 && a5)
  {
    v8 = *(_QWORD *)&a4;
    v11 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_inputsByBufferTypeByPortTypeBySequenceNumber, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a4));
    if (!v11)
    {
      v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_inputsByBufferTypeByPortTypeBySequenceNumber, "setObject:forKeyedSubscript:", v11, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8));
    }
    v12 = (void *)objc_msgSend(v11, "objectForKeyedSubscript:", a5);
    if (!v12)
    {
      v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, a5);
    }
    v13 = (void *)objc_msgSend(v12, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a6));
    if (!v13)
    {
      v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a6));
    }
    objc_msgSend(v13, "addObject:", a3);
  }
}

- (void)addInput:(id)a3 sequenceNumber:(unsigned int)a4 portType:(id)a5 bufferTypes:(id)a6
{
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v8 = *(_QWORD *)&a4;
  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(a6);
        -[BWStillImageProcessingPlan addInput:sequenceNumber:portType:bufferType:](self, "addInput:sequenceNumber:portType:bufferType:", a3, v8, a5, (int)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "intValue"));
      }
      while (v12 != v14);
      v12 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }
}

- (id)lastAddedInputForSequenceNumber:(unsigned int)a3 portType:(id)a4 bufferType:(unint64_t)a5
{
  void *v6;

  v6 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_inputsByBufferTypeByPortTypeBySequenceNumber, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3)), "objectForKeyedSubscript:", a4);
  return (id)objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5)), "lastObject");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  NSMutableDictionary *obj;
  uint64_t v28;
  BWStillImageProcessingPlan *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = objc_opt_class();
  v5 = -[BWStillImageCaptureSettings settingsID](-[BWStillImageSettings captureSettings](self->_settings, "captureSettings"), "settingsID");
  v6 = BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureSettings captureType](-[BWStillImageSettings captureSettings](self->_settings, "captureSettings"), "captureType"));
  v7 = -[NSMutableDictionary count](self->_inputsByBufferTypeByPortTypeBySequenceNumber, "count");
  v8 = &stru_1E4928818;
  if (!v7)
    v8 = CFSTR(" Empty plan (processing on-demand)");
  v9 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: captureID:%lld, captureType=%@%@"), v4, self, v5, v6, v8);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = self->_inputsByBufferTypeByPortTypeBySequenceNumber;
  v30 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
  if (v30)
  {
    v28 = *(_QWORD *)v50;
    v29 = self;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v50 != v28)
          objc_enumerationMutation(obj);
        v31 = v10;
        v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v10);
        if ((unint64_t)-[NSMutableDictionary count](self->_inputsByBufferTypeByPortTypeBySequenceNumber, "count") >= 2)objc_msgSend(v9, "appendFormat:", CFSTR("\n[SeqNo %d]"), objc_msgSend(v11, "intValue"));
        v12 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_inputsByBufferTypeByPortTypeBySequenceNumber, "objectForKeyedSubscript:", v11);
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v34 = v12;
        v33 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
        if (v33)
        {
          v32 = *(_QWORD *)v46;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v46 != v32)
                objc_enumerationMutation(v34);
              v35 = v13;
              v14 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v13);
              objc_msgSend(v9, "appendFormat:", CFSTR("\n\t[%@]"), v14);
              v15 = (void *)objc_msgSend(v34, "objectForKeyedSubscript:", v14);
              v41 = 0u;
              v42 = 0u;
              v43 = 0u;
              v44 = 0u;
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
              if (v16)
              {
                v17 = v16;
                v36 = *(_QWORD *)v42;
                do
                {
                  for (i = 0; i != v17; ++i)
                  {
                    if (*(_QWORD *)v42 != v36)
                      objc_enumerationMutation(v15);
                    v19 = (int)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "intValue");
                    objc_msgSend(v9, "appendFormat:", CFSTR("\n\t\t[%@]"), BWStillImageProcessorTypeToShortString(v19));
                    v20 = (void *)objc_msgSend(v15, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v19));
                    v37 = 0u;
                    v38 = 0u;
                    v39 = 0u;
                    v40 = 0u;
                    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
                    if (v21)
                    {
                      v22 = v21;
                      v23 = *(_QWORD *)v38;
                      v24 = 1;
                      do
                      {
                        for (j = 0; j != v22; ++j)
                        {
                          if (*(_QWORD *)v38 != v23)
                            objc_enumerationMutation(v20);
                          objc_msgSend(v9, "appendFormat:", CFSTR("\n\t\t\t[%u] %@"), v24 + j, *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
                        }
                        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
                        v24 = (v24 + j);
                      }
                      while (v22);
                    }
                  }
                  v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
                }
                while (v17);
              }
              v13 = v35 + 1;
            }
            while (v35 + 1 != v33);
            v33 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
          }
          while (v33);
        }
        v10 = v31 + 1;
        self = v29;
      }
      while (v31 + 1 != v30);
      v30 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    }
    while (v30);
  }
  return (id)objc_msgSend(v9, "copy");
}

@end
