@implementation ATCIOA2Stream

- (ATCIOA2Stream)initWithService:(id)a3 connection:(id)a4 index:(unint64_t)a5 input:(BOOL)a6 description:(id)a7
{
  id v13;
  id v14;
  id v15;
  ATCIOA2Stream *v16;
  ATCIOA2Stream *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  ATCIOA2StreamFormat *currentFormat;
  NSArray *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSArray *availableFormats;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a7;
  v37.receiver = self;
  v37.super_class = (Class)ATCIOA2Stream;
  v16 = -[ATCIOA2Stream init](&v37, sel_init);
  v17 = v16;
  if (v16)
  {
    v32 = v13;
    objc_storeStrong((id *)&v16->_service, a3);
    objc_storeStrong((id *)&v17->_connection, a4);
    v17->_index = a5;
    v17->_input = a6;
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("stream ID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_physicalID = objc_msgSend(v18, "unsignedIntValue");

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("starting channel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_startingChannel = objc_msgSend(v19, "unsignedIntValue");

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("current format"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATCIOA2StreamFormat aeaStreamFormatWithDictionary:](ATCIOA2StreamFormat, "aeaStreamFormatWithDictionary:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    currentFormat = v17->_currentFormat;
    v17->_currentFormat = (ATCIOA2StreamFormat *)v21;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("available formats"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v34;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v34 != v27)
            objc_enumerationMutation(v24);
          +[ATCIOA2StreamFormat aeaStreamFormatsWithRangedDictionary:](ATCIOA2StreamFormat, "aeaStreamFormatsWithRangedDictionary:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v28));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
            -[NSArray addObjectsFromArray:](v23, "addObjectsFromArray:", v29);

          ++v28;
        }
        while (v26 != v28);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v26);
    }

    availableFormats = v17->_availableFormats;
    v17->_availableFormats = v23;

    v13 = v32;
  }

  return v17;
}

- (BOOL)isInput
{
  return self->_input;
}

- (ATCIOA2StreamFormat)currentFormat
{
  return self->_currentFormat;
}

- (NSArray)availableFormats
{
  return self->_availableFormats;
}

- (unsigned)startingChannel
{
  return self->_startingChannel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableFormats, 0);
  objc_storeStrong((id *)&self->_currentFormat, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
