@implementation BWFrameStatisticsByPortType

- (void)updateWithFrameMetadata:(id)a3 updateFocusDistance:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  float v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CMTime v22;
  CMTime v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = a4;
    memset(&v23, 0, sizeof(v23));
    CMTimeMakeFromDictionary(&v23, (CFDictionaryRef)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05D00]));
    v7 = -[NSDictionary objectForKeyedSubscript:](self->_portTypeToFrameStatistics, "objectForKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]));
    v22 = v23;
    fs_updateFrameStatisticsWithFrameMetadata(v7, a3, (__int128 *)&v22.value, v4);
    v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D06ED8]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      v12 = *MEMORY[0x1E0D05A40];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((objc_msgSend(v14, "isEqualToString:", v12) & 1) == 0)
          {
            v15 = -[NSDictionary objectForKeyedSubscript:](self->_portTypeToFrameStatistics, "objectForKeyedSubscript:", v14);
            v16 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", v14);
            v22 = v23;
            fs_updateFrameStatisticsWithFrameMetadata(v15, v16, (__int128 *)&v22.value, v4);
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v10);
    }
    if (self->_autoFocusRecommendedMasterPortTypeEnabled)
    {
      if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB8]), "BOOLValue"))-[BWFrameStatisticsByPortType _updateAutoFocusRecommendedMasterPortTypeWithFrameMetadata:]((uint64_t)self, a3);
    }
    ++self->_frameCount;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ADRCExposureRealizedGain")), "floatValue");
    self->_adrcExposureRealizedGain = v17;
  }
}

- (void)copyTo:(id)a3
{
  NSUInteger v5;
  NSArray *portTypes;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = -[NSDictionary count](self->_portTypeToFrameStatistics, "count");
  if (v5 == objc_msgSend(*((id *)a3 + 2), "count"))
  {
    memcpy(*((void **)a3 + 3), self->_frameStatisticsStoragesForPortTypes, 248 * v5);
    *((_QWORD *)a3 + 4) = self->_frameCount;
    *((_BYTE *)a3 + 44) = self->_autoFocusRecommendedMasterPortTypeEnabled;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    portTypes = self->_portTypes;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](portTypes, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(portTypes);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          v12 = -[NSDictionary objectForKeyedSubscript:](self->_portTypeToFrameStatistics, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_msgSend(*((id *)a3 + 2), "objectForKeyedSubscript:", v11);
          objc_msgSend(v13, "_setAEStatistics:", objc_msgSend(v12, "aeStatistics"));
          objc_msgSend(v13, "_setDisplayStrobeRGBEstimate:", objc_msgSend(v12, "displayStrobeRGBEstimate"));
          objc_msgSend(v13, "_setColorCorrectionMatrix:", objc_msgSend(v12, "colorCorrectionMatrix"));
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](portTypes, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }
  }
}

- (uint64_t)_updateAutoFocusRecommendedMasterPortTypeWithFrameMetadata:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D068B8]);
    if (!v4)
      v4 = objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    if ((_NSIsNSCFConstantString() & 1) != 0)
      goto LABEL_17;
    v5 = *MEMORY[0x1E0D05A30];
    v17[0] = *MEMORY[0x1E0D05A18];
    v17[1] = v5;
    v6 = *MEMORY[0x1E0D05A38];
    v17[2] = *MEMORY[0x1E0D05A28];
    v17[3] = v6;
    v17[4] = *MEMORY[0x1E0D05A50];
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 5);
    result = objc_msgSend(v7, "indexOfObject:", v4);
    if (result != 0x7FFFFFFFFFFFFFFFLL)
    {
      result = objc_msgSend(v7, "objectAtIndexedSubscript:", result);
      v4 = result;
      if (result)
      {
LABEL_17:
        result = objc_msgSend(*(id *)(v3 + 16), "objectForKeyedSubscript:", v4);
        if (result)
        {
          v14 = 0u;
          v15 = 0u;
          v12 = 0u;
          v13 = 0u;
          v8 = *(void **)(v3 + 16);
          result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (result)
          {
            v9 = result;
            v10 = *(_QWORD *)v13;
            do
            {
              v11 = 0;
              do
              {
                if (*(_QWORD *)v13 != v10)
                  objc_enumerationMutation(v8);
                *(_QWORD *)(objc_msgSend((id)objc_msgSend(*(id *)(v3 + 16), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++)), "frameStatisticsStorage")+ 200) = v4;
              }
              while (v9 != v11);
              result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
              v9 = result;
            }
            while (result);
          }
        }
      }
    }
  }
  return result;
}

- (BWFrameStatisticsByPortType)initWithPortTypes:(id)a3 autoFocusRecommendedMasterPortTypeEnabled:(BOOL)a4
{
  BWFrameStatisticsByPortType *v6;
  void *v7;
  $CDAAB53AF0D0843407507AB6EB17E647 *v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BWFrameStatisticsByPortType;
  v6 = -[BWFrameStatisticsByPortType init](&v13, sel_init);
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a3, "count"));
    v8 = ($CDAAB53AF0D0843407507AB6EB17E647 *)malloc_type_calloc(objc_msgSend(a3, "count"), 0xF8uLL, 0x1080040A456596DuLL);
    if (objc_msgSend(a3, "count"))
    {
      v9 = 0;
      v10 = (uint64_t)v8;
      do
      {
        v11 = -[BWFrameStatistics initWthPortType:storage:]([BWFrameStatistics alloc], (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v9), v10);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, objc_msgSend(a3, "objectAtIndexedSubscript:", v9));

        ++v9;
        v10 += 248;
      }
      while (objc_msgSend(a3, "count") > v9);
    }
    v6->_portTypes = (NSArray *)a3;
    v6->_portTypeToFrameStatistics = (NSDictionary *)objc_msgSend(v7, "copy");
    v6->_frameStatisticsStoragesForPortTypes = v8;
    v6->_autoFocusRecommendedMasterPortTypeEnabled = a4;

  }
  return v6;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_portTypeToFrameStatistics, "objectForKeyedSubscript:", a3);
}

- (unint64_t)frameCount
{
  return self->_frameCount;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSDictionary countByEnumeratingWithState:objects:count:](self->_portTypeToFrameStatistics, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

+ (void)initialize
{
  objc_opt_class();
}

- (BWFrameStatisticsByPortType)init
{
  -[BWFrameStatisticsByPortType doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BWFrameStatisticsByPortType)initWithPortTypes:(id)a3
{
  return -[BWFrameStatisticsByPortType initWithPortTypes:autoFocusRecommendedMasterPortTypeEnabled:](self, "initWithPortTypes:autoFocusRecommendedMasterPortTypeEnabled:", a3, 0);
}

- (void)dealloc
{
  objc_super v3;

  free(self->_frameStatisticsStoragesForPortTypes);
  v3.receiver = self;
  v3.super_class = (Class)BWFrameStatisticsByPortType;
  -[BWFrameStatisticsByPortType dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  size_t v5;
  NSDictionary *portTypeToFrameStatistics;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && self->_frameCount == *((_QWORD *)a3 + 4)
      && self->_adrcExposureRealizedGain == *((float *)a3 + 10)
      && self->_autoFocusRecommendedMasterPortTypeEnabled == *((unsigned __int8 *)a3 + 44)
      && (v5 = 248 * -[NSDictionary count](self->_portTypeToFrameStatistics, "count"),
          v5 == 248 * objc_msgSend(*((id *)a3 + 2), "count")))
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      portTypeToFrameStatistics = self->_portTypeToFrameStatistics;
      v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](portTypeToFrameStatistics, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v19;
LABEL_9:
        v10 = 0;
        while (1)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(portTypeToFrameStatistics);
          v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
          v12 = objc_msgSend(*((id *)a3 + 2), "objectForKeyedSubscript:", v11);
          if (!v12)
            break;
          v13 = (void *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_portTypeToFrameStatistics, "objectForKeyedSubscript:", v11), "aeStatistics");
          v14 = objc_msgSend((id)objc_msgSend(*((id *)a3 + 2), "objectForKeyedSubscript:", v11), "aeStatistics");
          if (v13 != (void *)v14)
          {
            LODWORD(v12) = objc_msgSend(v13, "isEqualToDictionary:", v14);
            if (!(_DWORD)v12)
              break;
          }
          v15 = (void *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_portTypeToFrameStatistics, "objectForKeyedSubscript:", v11), "displayStrobeRGBEstimate");
          v16 = objc_msgSend((id)objc_msgSend(*((id *)a3 + 2), "objectForKeyedSubscript:", v11), "displayStrobeRGBEstimate");
          if (v15 != (void *)v16)
          {
            LODWORD(v12) = objc_msgSend(v15, "isEqualToArray:", v16);
            if (!(_DWORD)v12)
              break;
          }
          if (v8 == ++v10)
          {
            v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](portTypeToFrameStatistics, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
            if (v8)
              goto LABEL_9;
            goto LABEL_19;
          }
        }
      }
      else
      {
LABEL_19:
        LOBYTE(v12) = memcmp(self->_frameStatisticsStoragesForPortTypes, *((const void **)a3 + 3), v5) == 0;
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_portTypeToFrameStatistics, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWFrameStatisticsByPortType)initWithCoder:(id)a3
{
  void *v5;
  void *v6;
  const void *v7;
  size_t v8;
  BWFrameStatisticsByPortType *v9;
  BWFrameStatisticsByPortType *v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSDictionary *portTypeToFrameStatistics;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  size_t __n;
  _BYTE v30[128];
  _QWORD v31[3];
  _QWORD v32[4];
  _QWORD v33[5];
  _QWORD v34[4];

  v34[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99E60];
  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  v6 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2)), CFSTR("portTypes"));
  __n = 0;
  v7 = (const void *)objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("frameStatisticsStoragesForPortTypes"), &__n);
  v8 = __n;
  if (v8 == 248 * objc_msgSend(v6, "count"))
  {
    v9 = -[BWFrameStatisticsByPortType initWithPortTypes:](self, "initWithPortTypes:", v6);
    v10 = v9;
    if (v9)
    {
      memcpy(v9->_frameStatisticsStoragesForPortTypes, v7, __n);
      v10->_frameCount = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("frameCount"));
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("adrcExposureRealizedGain"));
      v10->_adrcExposureRealizedGain = v11;
      v10->_autoFocusRecommendedMasterPortTypeEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("AFRecommendedMasterPortTypeEnabled"));
      v12 = (void *)MEMORY[0x1E0C99E60];
      v33[0] = objc_opt_class();
      v33[1] = objc_opt_class();
      v33[2] = objc_opt_class();
      v33[3] = objc_opt_class();
      v33[4] = objc_opt_class();
      v13 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v12, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 5)), CFSTR("AEStatisticsByPortType"));
      v14 = (void *)MEMORY[0x1E0C99E60];
      v32[0] = objc_opt_class();
      v32[1] = objc_opt_class();
      v32[2] = objc_opt_class();
      v32[3] = objc_opt_class();
      v15 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4)), CFSTR("DisplayStrobeRGBEstimateByPortType"));
      v16 = (void *)MEMORY[0x1E0C99E60];
      v31[0] = objc_opt_class();
      v31[1] = objc_opt_class();
      v31[2] = objc_opt_class();
      v17 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v16, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3)), CFSTR("ColorCorrectionMatrixByPortType"));
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      portTypeToFrameStatistics = v10->_portTypeToFrameStatistics;
      v19 = -[NSDictionary countByEnumeratingWithState:objects:count:](portTypeToFrameStatistics, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v26 != v21)
              objc_enumerationMutation(portTypeToFrameStatistics);
            v23 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
            objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v10->_portTypeToFrameStatistics, "objectForKeyedSubscript:", v23), "_setAEStatistics:", objc_msgSend(v13, "objectForKeyedSubscript:", v23));
            objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v10->_portTypeToFrameStatistics, "objectForKeyedSubscript:", v23), "_setDisplayStrobeRGBEstimate:", objc_msgSend(v15, "objectForKeyedSubscript:", v23));
            objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v10->_portTypeToFrameStatistics, "objectForKeyedSubscript:", v23), "_setColorCorrectionMatrix:", objc_msgSend(v17, "objectForKeyedSubscript:", v23));
          }
          v20 = -[NSDictionary countByEnumeratingWithState:objects:count:](portTypeToFrameStatistics, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v20);
      }
    }
  }
  else
  {

    return 0;
  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  void *v6;
  void *v7;
  void *v8;
  NSDictionary *portTypeToFrameStatistics;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "encodeObject:forKey:", self->_portTypes, CFSTR("portTypes"));
  objc_msgSend(a3, "encodeBytes:length:forKey:", self->_frameStatisticsStoragesForPortTypes, 248 * -[NSDictionary count](self->_portTypeToFrameStatistics, "count"), CFSTR("frameStatisticsStoragesForPortTypes"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_frameCount, CFSTR("frameCount"));
  *(float *)&v5 = self->_adrcExposureRealizedGain;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("adrcExposureRealizedGain"), v5);
  objc_msgSend(a3, "encodeBool:forKey:", self->_autoFocusRecommendedMasterPortTypeEnabled, CFSTR("AFRecommendedMasterPortTypeEnabled"));
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  portTypeToFrameStatistics = self->_portTypeToFrameStatistics;
  v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](portTypeToFrameStatistics, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(portTypeToFrameStatistics);
        v14 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_portTypeToFrameStatistics, "objectForKeyedSubscript:", v14), "aeStatistics"), v14);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_portTypeToFrameStatistics, "objectForKeyedSubscript:", v14), "displayStrobeRGBEstimate"), v14);
        objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_portTypeToFrameStatistics, "objectForKeyedSubscript:", v14), "colorCorrectionMatrix"), v14);
      }
      v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](portTypeToFrameStatistics, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }
  if (objc_msgSend(v6, "count"))
    objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("AEStatisticsByPortType"));
  if (objc_msgSend(v7, "count"))
    objc_msgSend(a3, "encodeObject:forKey:", v7, CFSTR("DisplayStrobeRGBEstimateByPortType"));
  if (objc_msgSend(v8, "count"))
    objc_msgSend(a3, "encodeObject:forKey:", v8, CFSTR("ColorCorrectionMatrixByPortType"));
}

- (NSArray)portTypes
{
  return self->_portTypes;
}

- (void)_setFrameCount:(unint64_t)a3
{
  self->_frameCount = a3;
}

- (float)adrcExposureRealizedGain
{
  return self->_adrcExposureRealizedGain;
}

- (void)reset
{
  NSDictionary *portTypeToFrameStatistics;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  bzero(self->_frameStatisticsStoragesForPortTypes, 248 * -[NSDictionary count](self->_portTypeToFrameStatistics, "count"));
  self->_frameCount = 0;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  portTypeToFrameStatistics = self->_portTypeToFrameStatistics;
  v4 = -[NSDictionary countByEnumeratingWithState:objects:count:](portTypeToFrameStatistics, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(portTypeToFrameStatistics);
        -[BWFrameStatistics reset]((id *)-[NSDictionary objectForKeyedSubscript:](self->_portTypeToFrameStatistics, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i)));
      }
      v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](portTypeToFrameStatistics, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSDictionary *portTypeToFrameStatistics;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  v5 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p> Frame count: %lld\n"), NSStringFromClass(v4), self, self->_frameCount);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  portTypeToFrameStatistics = self->_portTypeToFrameStatistics;
  v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](portTypeToFrameStatistics, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(portTypeToFrameStatistics);
        objc_msgSend(v5, "appendFormat:", CFSTR("%@\n"), objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_portTypeToFrameStatistics, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i)), "description"));
      }
      v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](portTypeToFrameStatistics, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  return v5;
}

@end
