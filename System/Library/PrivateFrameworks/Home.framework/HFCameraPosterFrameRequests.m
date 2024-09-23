@implementation HFCameraPosterFrameRequests

- (HFCameraPosterFrameRequests)init
{
  HFCameraPosterFrameRequests *v2;
  uint64_t v3;
  NSMutableDictionary *timelapseRequests;
  uint64_t v5;
  NSMutableDictionary *generationRequests;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFCameraPosterFrameRequests;
  v2 = -[HFCameraPosterFrameRequests init](&v8, sel_init);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = objc_claimAutoreleasedReturnValue();
  timelapseRequests = v2->_timelapseRequests;
  v2->_timelapseRequests = (NSMutableDictionary *)v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = objc_claimAutoreleasedReturnValue();
  generationRequests = v2->_generationRequests;
  v2->_generationRequests = (NSMutableDictionary *)v5;

  return v2;
}

- (void)addRequestForTimelapseFileForDelegate:(id)a3 forHighQualityClip:(id)a4 andTimelapseClip:(id)a5 atOffset:(double)a6
{
  id v10;
  id v11;
  id v12;
  HFCameraPosterFrameDelegateRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(HFCameraPosterFrameDelegateRequest);
  -[HFCameraPosterFrameDelegateRequest setHighQualityClip:](v13, "setHighQualityClip:", v11);

  -[HFCameraPosterFrameDelegateRequest setTimelapseClip:](v13, "setTimelapseClip:", v10);
  -[HFCameraPosterFrameDelegateRequest setDelegate:](v13, "setDelegate:", v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraPosterFrameDelegateRequest setOffsetNumber:](v13, "setOffsetNumber:", v14);

  objc_msgSend(v10, "uniqueIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCameraPosterFrameRequests timelapseRequests](self, "timelapseRequests");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraPosterFrameRequests timelapseRequests](self, "timelapseRequests");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v16);

  }
  HFLogForCategory(0x19uLL);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "uniqueIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412290;
    v24 = v22;
    _os_log_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_DEFAULT, "REQUEST: Adding request for timelapse clip %@", (uint8_t *)&v23, 0xCu);

  }
  objc_msgSend(v18, "addObject:", v13);

}

- (id)fulfillRequestsForTimelapseFileForTimelapseClip:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x19uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v7;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "REQUEST: Fulfilling all requests for timelapse clip %@", (uint8_t *)&v14, 0xCu);

  }
  objc_msgSend(v4, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCameraPosterFrameRequests timelapseRequests](self, "timelapseRequests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCameraPosterFrameRequests timelapseRequests](self, "timelapseRequests");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v9);

  return v11;
}

- (void)addRequestsForPosterFrameGeneration:(id)a3 forHighQualityClip:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCameraPosterFrameRequests generationRequests](self, "generationRequests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v17, "offsetNumber", (_QWORD)v23);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v14);
  }

  -[HFCameraPosterFrameRequests generationRequests](self, "generationRequests");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v11, v9);

  HFLogForCategory(0x19uLL);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "uniqueIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v22;
    _os_log_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_DEFAULT, "REQUEST: Adding request for high quality clip %@", buf, 0xCu);

  }
}

- (id)fulfillRequestForPosterFrameGenerationForHighQualityClip:(id)a3 atOffset:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCameraPosterFrameRequests generationRequests](self, "generationRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v10, "removeObjectForKey:", v11);
      if (!objc_msgSend(v10, "count"))
      {
        -[HFCameraPosterFrameRequests generationRequests](self, "generationRequests");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, v8);

      }
    }
    HFLogForCategory(0x19uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v16;
      v20 = 2048;
      v21 = a4;
      _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "REQUEST: Fulfill generation request for high quality clip %@ for offset %f", (uint8_t *)&v18, 0x16u);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)fulfillAllRequestsForPosterFrameGenerationForHighQualityClip:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCameraPosterFrameRequests generationRequests](self, "generationRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x19uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v11;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "REQUEST: Fulfil all generation requesst for high quality clip %@", (uint8_t *)&v15, 0xCu);

  }
  if (v8)
  {
    -[HFCameraPosterFrameRequests generationRequests](self, "generationRequests");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v6);

    objc_msgSend(v8, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

- (NSMutableDictionary)timelapseRequests
{
  return self->_timelapseRequests;
}

- (void)setTimelapseRequests:(id)a3
{
  objc_storeStrong((id *)&self->_timelapseRequests, a3);
}

- (NSMutableDictionary)generationRequests
{
  return self->_generationRequests;
}

- (void)setGenerationRequests:(id)a3
{
  objc_storeStrong((id *)&self->_generationRequests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generationRequests, 0);
  objc_storeStrong((id *)&self->_timelapseRequests, 0);
}

@end
