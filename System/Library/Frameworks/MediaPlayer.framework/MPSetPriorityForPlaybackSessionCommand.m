@implementation MPSetPriorityForPlaybackSessionCommand

- (void)setPreloadedSessions:(id)a3
{
  NSArray *v4;
  NSArray *preloadedSessions;
  id v6;

  v6 = a3;
  if ((-[NSArray isEqual:](self->_preloadedSessions, "isEqual:") & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    preloadedSessions = self->_preloadedSessions;
    self->_preloadedSessions = v4;

    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }

}

- (id)_mediaRemoteCommandInfoOptions
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  NSArray *obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[2];
  _QWORD v27[2];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_preloadedSessions, "count"))
  {
    v20 = v3;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSArray count](self->_preloadedSessions, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = self->_preloadedSessions;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v23;
      v8 = *MEMORY[0x1E0D4C7E8];
      v9 = *MEMORY[0x1E0D4C7E0];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v26[0] = v8;
          objc_msgSend(v11, "revision");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v26[1] = v9;
          v27[0] = v12;
          v13 = (void *)MEMORY[0x1E0CB37E8];
          v14 = objc_msgSend(v11, "priority");
          if (v14 == 2)
            v15 = 1024;
          else
            v15 = (unint64_t)(v14 == 1) << 9;
          objc_msgSend(v13, "numberWithInteger:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v27[1] = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, v18);

        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      }
      while (v6);
    }

    v3 = v20;
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D4C878]);

  }
  return v3;
}

- (NSArray)preloadedSessions
{
  return self->_preloadedSessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preloadedSessions, 0);
}

@end
