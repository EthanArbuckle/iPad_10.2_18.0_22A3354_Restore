@implementation SDPMini

- (id)SDPUsername
{
  id result;
  NSString *v4;
  NSArray *v5;

  result = self->_sdpUsername;
  if (!result)
  {
    v4 = NSUserName();
    if (v4 && (v5 = -[NSString componentsSeparatedByString:](v4, "componentsSeparatedByString:", CFSTR(" "))) != 0)
    {
      result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", 0));
      self->_sdpUsername = (NSString *)result;
      if (result)
        return result;
    }
    else
    {
      result = self->_sdpUsername;
      if (result)
        return result;
    }
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", CFSTR("-"));
    self->_sdpUsername = (NSString *)result;
  }
  return result;
}

- (SDPMini)init
{
  SDPMini *v2;
  SDPMediaLine *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)SDPMini;
  v2 = -[SDPMini init](&v5, sel_init);
  if (v2)
  {
    v2->_audioParameters = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    v2->audioPayloads = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
    v2->secondaryAudioPayloads = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    v2->_mediaLines = (NSMutableDictionary *)objc_opt_new();
    v3 = objc_alloc_init(SDPMediaLine);
    -[SDPMini addMediaLine:mediaType:](v2, "addMediaLine:mediaType:", v3, 2);

  }
  return v2;
}

- (SDPMini)initWithString:(id)a3
{
  SDPMini *v4;
  void *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)SDPMini;
  v4 = -[SDPMini init](&v7, sel_init);
  if (v4)
  {
    v4->_audioParameters = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    v4->audioPayloads = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
    v4->secondaryAudioPayloads = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    v4->_mediaLines = (NSMutableDictionary *)objc_opt_new();
    v5 = (void *)MEMORY[0x1DF088A10]();
    -[SDPMini parseSDPFromString:](v4, "parseSDPFromString:", a3);
    objc_autoreleasePoolPop(v5);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)SDPMini;
  -[SDPMini dealloc](&v3, sel_dealloc);
}

- (id)getMediaLineForType:(int)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", a3);
  v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaLines, "objectForKeyedSubscript:", v4);

  return v5;
}

- (void)addMediaLine:(id)a3 mediaType:(int)a4
{
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", a4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaLines, "setObject:forKeyedSubscript:", a3, v6);

}

- (id)mediaTypeToString:(int)a3
{
  if ((a3 - 1) > 2)
    return 0;
  else
    return off_1E9E54C28[a3 - 1];
}

+ (BOOL)setPayload:(int)a3 mediaLine:(id)a4
{
  if (a3 != 100 && a3 != 126 && a3 != 123)
    return 0;
  objc_msgSend(a4, "addPayload:rtpMap:formatParameters:");
  return 1;
}

- (BOOL)setVideoPayloads:(int *)a3 count:(int)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unsigned int v9;
  int v10;

  if (!a4)
    return 0;
  v6 = -[SDPMini getMediaLineForType:](self, "getMediaLineForType:", 2);
  if (a4 < 1)
  {
    v10 = 1;
  }
  else
  {
    v7 = v6;
    v8 = 0;
    while (1)
    {
      v9 = *a3++;
      if (!+[SDPMini setPayload:mediaLine:](SDPMini, "setPayload:mediaLine:", v9, v7))
        break;
      --v8;
      if (!(a4 + v8))
      {
        v10 = 0;
        return v10 == 0;
      }
    }
    v10 = a4 + v8;
  }
  return v10 == 0;
}

- (id)toStringWithVideoEnabled:(BOOL)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 512);
  objc_msgSend(v5, "appendString:", -[SDPMini composeSessionString](self, "composeSessionString"));
  objc_msgSend(v5, "appendString:", -[SDPMini composeAudioString](self, "composeAudioString"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_msgSend((id)-[NSMutableDictionary allKeys](self->_mediaLines, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (a3 || objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "intValue") != 2)
        {
          v12 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaLines, "objectForKeyedSubscript:", v11);
          objc_msgSend(v5, "appendFormat:", CFSTR("%@=%@ %@ %@ %@%@"), CFSTR("m"), -[SDPMini mediaTypeToString:](self, "mediaTypeToString:", objc_msgSend(v11, "intValue")), CFSTR("%VRTP-PORT%"), CFSTR("RTP/AVP"), objc_msgSend((id)objc_msgSend(v12, "payloads"), "componentsJoinedByString:", CFSTR(" ")), CFSTR("\r\n"));
          objc_msgSend(v5, "appendString:", objc_msgSend(v12, "string"));
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v8);
  }
  return v5;
}

- (void)setBasebandCodecType:(id)a3 sampleRate:(id)a4
{

  self->basebandCodecSampleRate = (NSNumber *)a4;
  self->basebandCodecType = (NSString *)objc_msgSend(a3, "copy");
}

- (BOOL)getBasebandCodecType:(id *)a3 sampleRate:(id *)a4
{
  NSString *basebandCodecType;

  if (!self->basebandCodecSampleRate)
    return 0;
  basebandCodecType = self->basebandCodecType;
  if (!basebandCodecType)
    return 0;
  if (a3)
    *a3 = basebandCodecType;
  if (a4)
    *a4 = self->basebandCodecSampleRate;
  return 1;
}

- (void)createVideoImageAttr:(int)a3 direction:(int)a4 dimensions:(imageTag *)a5 count:(int)a6
{
  objc_msgSend(-[SDPMini getMediaLineForType:](self, "getMediaLineForType:", 2), "createVideoImageAttr:direction:dimensions:count:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6);
}

- (void)getNegotiatedResolutionForPayload:(int)a3 forInterface:(int)a4 withRule:(id)a5 direction:(int)a6 result:(imageTag *)a7 remoteSupportsHD:(BOOL)a8 screenSharing:(BOOL)a9
{
  uint64_t v13;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  float v38;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  uint64_t v46;
  unsigned int v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  id v62;
  SDPMini *v63;
  int v64;
  imageTag *v65;
  void *v66;
  void *v67;
  id obj;
  id obja;
  _QWORD v71[3];
  uint64_t v72;
  int v73;
  _BYTE v74[128];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;

  v13 = *(_QWORD *)&a3;
  v84 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a5, "count"))
  {
    a7->var2 = 0;
    a7->var5 = 0;
    return;
  }
  if (a9)
    v15 = 3;
  else
    v15 = 2;
  v16 = -[SDPMini getMediaLineForType:](self, "getMediaLineForType:", v15);
  v17 = (id)objc_msgSend(v16, "videoImageAttributes:", v13);
  if (v17)
  {
    v18 = v17;
    v62 = a5;
    v63 = self;
    v65 = a7;
    v64 = objc_msgSend(a5, "count");
    v66 = v18;
    v67 = v16;
    if (a6)
    {
      v19 = (id)objc_msgSend(v16, "getVideoRecvImages:", v18);
      v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v75 = 0u;
      v76 = 0u;
      v77 = 0u;
      v78 = 0u;
      obj = v19;
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v75, v74, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v76;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v76 != v23)
              objc_enumerationMutation(obj);
            v25 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i);
            memset(v71, 170, sizeof(v71));
            v72 = -1431655766;
            v73 = -1431655766;
            +[SDPMediaLine fillImageStruct:imageStruct:](SDPMediaLine, "fillImageStruct:imageStruct:", v25, v71);
            if (v73 != a4)
              objc_msgSend(v20, "addObject:", v25);
          }
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v74, 16);
        }
        while (v22);
      }
      v26 = v20;
      v27 = obj;
      objc_msgSend(obj, "removeObjectsInArray:", v26);
      if (obj && objc_msgSend(obj, "count"))
      {
        objc_msgSend(obj, "sortUsingFunction:context:", compareByPref, v63);
        v28 = objc_msgSend(obj, "count");
        if (v28 >= 1)
        {
          v29 = v28;
          while (1)
          {
            v30 = objc_msgSend(obj, "objectAtIndexedSubscript:", (v29 - 1));
            if (v64 >= 1)
              break;
LABEL_26:
            if (v29-- < 2)
              goto LABEL_54;
          }
          v31 = v30;
          v32 = v64 + 1;
          while (1)
          {
            v33 = (void *)objc_msgSend(v62, "objectAtIndexedSubscript:", (v32 - 2));
            v34 = v33;
            if (a8 || (v35 = objc_msgSend(v33, "iWidth"), (int)(objc_msgSend(v34, "iHeight") * v35) <= 407040))
            {
              v36 = objc_msgSend(v34, "iWidth");
              v37 = objc_msgSend(v34, "iHeight");
              objc_msgSend(v34, "fRate");
              if (objc_msgSend(v16, "supportImage:width:height:rate:", v31, v36, v37, (int)v38))break;
            }
            if (--v32 <= 1)
              goto LABEL_26;
          }
          a7->var0 = objc_msgSend(v34, "iWidth");
          a7->var2 = objc_msgSend(v34, "iWidth");
          a7->var3 = objc_msgSend(v34, "iHeight");
          a7->var5 = objc_msgSend(v34, "iHeight");
          objc_msgSend(v34, "fRate");
          a7->var6 = (int)v58;
          objc_msgSend(v34, "fPref");
          a7->var7 = v59;
LABEL_54:
          v48 = v66;
          v27 = obj;
          goto LABEL_51;
        }
LABEL_50:
        v48 = v66;
LABEL_51:

        return;
      }
    }
    else
    {
      v40 = (id)objc_msgSend(v16, "getVideoSendImages:", v18);
      obja = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v41 = v40;
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v80, v79, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v81;
        do
        {
          for (j = 0; j != v43; ++j)
          {
            if (*(_QWORD *)v81 != v44)
              objc_enumerationMutation(v41);
            v46 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * j);
            memset(v71, 170, sizeof(v71));
            v72 = -1431655766;
            v73 = -1431655766;
            +[SDPMediaLine fillImageStruct:imageStruct:](SDPMediaLine, "fillImageStruct:imageStruct:", v46, v71);
            if (v73 != a4)
              objc_msgSend(obja, "addObject:", v46);
          }
          v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v80, v79, 16);
        }
        while (v43);
      }
      v27 = v41;
      objc_msgSend(v41, "removeObjectsInArray:", obja);
      if (v41 && objc_msgSend(v41, "count"))
      {
        objc_msgSend(v41, "sortUsingFunction:context:", compareByPref, v63);
        v47 = objc_msgSend(v41, "count");
        v48 = v66;
        if (v64 >= 1)
        {
          v49 = v47;
          v50 = v64;
          do
          {
            v51 = v50--;
            v52 = (void *)objc_msgSend(v62, "objectAtIndexedSubscript:", v50);
            v53 = v49;
            while ((int)v53 >= 1)
            {
              v54 = objc_msgSend(v27, "objectAtIndexedSubscript:", --v53);
              v55 = objc_msgSend(v52, "iWidth");
              v56 = objc_msgSend(v52, "iHeight");
              objc_msgSend(v52, "fRate");
              if (objc_msgSend(v67, "supportImage:width:height:rate:", v54, v55, v56, (int)v57))
              {
                v65->var0 = objc_msgSend(v52, "iWidth");
                v65->var2 = objc_msgSend(v52, "iWidth");
                v65->var3 = objc_msgSend(v52, "iHeight");
                v65->var5 = objc_msgSend(v52, "iHeight");
                objc_msgSend(v52, "fRate");
                v65->var6 = (int)v60;
                objc_msgSend(v52, "fPref");
                v65->var7 = v61;
                goto LABEL_51;
              }
            }
          }
          while (v51 >= 2);
        }
        goto LABEL_51;
      }
    }
    a7->var2 = 0;
    a7->var5 = 0;
    goto LABEL_50;
  }
}

- (NSString)origin
{
  return self->origin;
}

- (void)setOrigin:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSMutableArray)audioPayloads
{
  return self->audioPayloads;
}

- (NSMutableArray)secondaryAudioPayloads
{
  return self->secondaryAudioPayloads;
}

- (NSString)sessionIP
{
  return self->sessionIP;
}

- (void)setSessionIP:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSNumber)audioRTPPort
{
  return self->audioRTPPort;
}

- (void)setAudioRTPPort:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSNumber)audioRTCPPort
{
  return self->audioRTCPPort;
}

- (void)setAudioRTCPPort:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSNumber)audioRTPID
{
  return self->audioRTPID;
}

- (void)setAudioRTPID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (BOOL)allowRTCPFB
{
  return self->allowRTCPFB;
}

- (void)setAllowRTCPFB:(BOOL)a3
{
  self->allowRTCPFB = a3;
}

- (NSNumber)answerBandwidth
{
  return self->answerBandwidth;
}

- (void)setAnswerBandwidth:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)maxBandwidth
{
  return self->maxBandwidth;
}

- (void)setMaxBandwidth:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (BOOL)allowsDynamicMaxBitrate
{
  return self->allowsDynamicMaxBitrate;
}

- (void)setAllowsDynamicMaxBitrate:(BOOL)a3
{
  self->allowsDynamicMaxBitrate = a3;
}

- (NSDictionary)featureListDict
{
  return self->featureListDict;
}

- (void)setFeatureListDict:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSNumber)aacBlockSize
{
  return self->aacBlockSize;
}

- (void)setAacBlockSize:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSNumber)audioUnitModel
{
  return self->audioUnitModel;
}

- (void)setAudioUnitModel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (BOOL)allowsContentsChangeWithAspectPreservation
{
  return self->allowsContentsChangeWithAspectPreservation;
}

- (void)setAllowsContentsChangeWithAspectPreservation:(BOOL)a3
{
  self->allowsContentsChangeWithAspectPreservation = a3;
}

- (BOOL)allowAudioRecording
{
  return self->allowAudioRecording;
}

- (void)setAllowAudioRecording:(BOOL)a3
{
  self->allowAudioRecording = a3;
}

- (id)composeBandwidthString
{
  uint64_t v4;

  if (-[NSNumber intValue](self->maxBandwidth, "intValue") < 1)
    return 0;
  if (-[NSNumber intValue](self->answerBandwidth, "intValue") < 1)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AS:%@"), self->maxBandwidth, v4);
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AS:%@:%@"), self->answerBandwidth, self->maxBandwidth);
}

- (id)composeSessionString
{
  void *v3;
  id v4;
  NSString *basebandCodecType;
  NSNumber *basebandCodecSampleRate;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 128);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=0\r\n"), CFSTR("v"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@ 0 0 IN %@ %@\r\n"), CFSTR("o"), self->origin, CFSTR("%RTP-IP-AF%"), CFSTR("%RTP-IP%"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@\r\n"), CFSTR("s"), -[SDPMini SDPUsername](self, "SDPUsername"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=IN %@ %@\r\n"), CFSTR("c"), CFSTR("%RTP-IP-AF%"), CFSTR("%RTP-IP%"));
  v4 = -[SDPMini composeBandwidthString](self, "composeBandwidthString");
  if (v4)
    objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@\r\n"), CFSTR("b"), v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=0 0\r\n"), CFSTR("t"));
  objc_msgSend(v3, "appendString:", -[SDPMini composeFLSString](self, "composeFLSString"));
  if (self->allowsDynamicMaxBitrate)
    objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@\r\n"), CFSTR("a"), CFSTR("DMBR"));
  if (self->allowsContentsChangeWithAspectPreservation)
    objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@\r\n"), CFSTR("a"), CFSTR("CAP"));
  basebandCodecType = self->basebandCodecType;
  if (basebandCodecType)
  {
    basebandCodecSampleRate = self->basebandCodecSampleRate;
    if (basebandCodecSampleRate)
      objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@:%@:%u\r\n"), CFSTR("a"), CFSTR("BBCODEC"), basebandCodecType, -[NSNumber unsignedIntValue](basebandCodecSampleRate, "unsignedIntValue"));
  }
  return v3;
}

- (id)composeFLSString
{
  void *v3;
  NSDictionary *featureListDict;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E9E58EE0);
  featureListDict = self->featureListDict;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__SDPMini_SDPComposing__composeFLSString__block_invoke;
  v6[3] = &unk_1E9E54C08;
  v6[4] = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](featureListDict, "enumerateKeysAndObjectsUsingBlock:", v6);
  return v3;
}

uint64_t __41__SDPMini_SDPComposing__composeFLSString__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;

  v5 = objc_msgSend(a2, "intValue");
  v6 = *(void **)(a1 + 32);
  if ((_DWORD)v5 == 126)
    return objc_msgSend(v6, "appendFormat:", CFSTR("%@=%@\r\n"), CFSTR("a"), a3, v8, v9);
  else
    return objc_msgSend(v6, "appendFormat:", CFSTR("%@=%@:%d %@\r\n"), CFSTR("a"), CFSTR("X_FLS"), v5, a3);
}

- (id)composeAudioFMTPForPayload:(id)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  if (-[NSMutableArray containsObject:](self->secondaryAudioPayloads, "containsObject:", a3))
    objc_msgSend(v5, "addObject:", CFSTR("sec"));
  objc_msgSend(v5, "addObjectsFromArray:", -[NSMutableDictionary objectForKeyedSubscript:](self->_audioParameters, "objectForKeyedSubscript:", a3));
  v6 = (void *)objc_msgSend(v5, "componentsJoinedByString:", CFSTR(";"));

  return v6;
}

- (id)composeAudioString
{
  void *v3;
  NSNumber *aacBlockSize;
  NSNumber *audioRTPID;
  NSNumber *audioUnitModel;
  NSMutableArray *audioPayloads;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 256);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=audio %@ %@ %@\r\n"), CFSTR("m"), CFSTR("%ARTP-PORT%"), CFSTR("RTP/AVP"), -[NSMutableArray componentsJoinedByString:](self->audioPayloads, "componentsJoinedByString:", CFSTR(" ")));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=rtcp:%@\r\n"), CFSTR("a"), CFSTR("%ARTCP-PORT%"));
  aacBlockSize = self->aacBlockSize;
  if (aacBlockSize)
    objc_msgSend(v3, "appendFormat:", CFSTR("%@=fmtp:AAC SamplesPerBlock %@\r\n"), CFSTR("a"), aacBlockSize);
  if (-[VCDefaults audioRecordingEnabled](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "audioRecordingEnabled")&& self->allowAudioRecording)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("%@=allowrecording\r\n"), CFSTR("a"));
  }
  audioRTPID = self->audioRTPID;
  if (audioRTPID)
    objc_msgSend(v3, "appendFormat:", CFSTR("%@=rtpID:%@\r\n"), CFSTR("a"), audioRTPID);
  audioUnitModel = self->audioUnitModel;
  if (audioUnitModel)
    objc_msgSend(v3, "appendFormat:", CFSTR("%@=au:%@\r\n"), CFSTR("a"), audioUnitModel);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  audioPayloads = self->audioPayloads;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](audioPayloads, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(audioPayloads);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v13 = -[SDPMini composeAudioFMTPForPayload:](self, "composeAudioFMTPForPayload:", v12);
        if (objc_msgSend(v13, "length"))
          objc_msgSend(v3, "appendFormat:", CFSTR("%@=fmtp:%@ %@\r\n"), CFSTR("a"), v12, v13);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](audioPayloads, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    }
    while (v9);
  }
  return v3;
}

- (id)parseIP:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(" "));
  if ((unint64_t)objc_msgSend(v3, "count") < 3)
    return 0;
  else
    return (id)objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
}

- (void)parseBandwidth:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(":"));
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", 1), "intValue"));
    -[SDPMini setAnswerBandwidth:](self, "setAnswerBandwidth:", v5);
    -[SDPMini setMaxBandwidth:](self, "setMaxBandwidth:", v5);
  }
  if ((unint64_t)objc_msgSend(v4, "count") >= 3)
    -[SDPMini setMaxBandwidth:](self, "setMaxBandwidth:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", 2), "intValue")));
}

- (void)parseMediaLine:(id)a3
{
  void *v5;
  SDPMediaLine *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  char v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = -1;
  v5 = (void *)objc_opt_new();
  v20 = -1;
  objc_msgSend(a3, "parseMediaLineHeader:mediaType:supportedPayloads:rtpPort:", objc_msgSend(a3, "fieldValue"), &v21, v5, &v20);
  objc_msgSend(a3, "nextLine");
  if (v21 - 2 < 2)
  {
    v6 = [SDPMediaLine alloc];
    v7 = -[SDPMediaLine initWithParser:rtpPort:payloads:](v6, "initWithParser:rtpPort:payloads:", a3, v20, v5);
    if (v7)
    {
      v8 = (void *)v7;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v24 != v11)
              objc_enumerationMutation(v5);
            v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            v19 = -1431655766;
            v19 = objc_msgSend(v13, "intValue");
            -[SDPMini setVideoPayloads:count:](self, "setVideoPayloads:count:", &v19, 1);
          }
          v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
        }
        while (v10);
      }
      -[SDPMini addMediaLine:mediaType:](self, "addMediaLine:mediaType:", v8, v21);

    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[SDPMini(SDPParsing) parseMediaLine:].cold.2();
    }
LABEL_23:
    v14 = 0;
    goto LABEL_24;
  }
  if (v21 != 1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[SDPMini(SDPParsing) parseMediaLine:].cold.1();
    }
    goto LABEL_23;
  }
  -[SDPMini setAudioRTPPort:](self, "setAudioRTPPort:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20));

  self->audioPayloads = (NSMutableArray *)v5;
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0;
  do
  {
    if ((objc_msgSend(a3, "parsingDone") & 1) != 0)
      break;
    v16 = objc_msgSend(a3, "fieldType");
    v17 = v15;
    if ((v16 - 1) >= 4)
    {
      if (v16 != 5)
        break;
      objc_msgSend(v14, "addObject:", objc_msgSend(a3, "fieldValue"));
      LOBYTE(v15) = 0;
      v17 = 1;
    }
    v18 = v15;
    objc_msgSend(a3, "nextLine");
    v15 = v17;
  }
  while ((v18 & 1) == 0);
  if (v21 == 1)
    -[SDPMini parseAudioMediaAttributes:](self, "parseAudioMediaAttributes:", v14);
LABEL_24:

}

- (void)parseSDPFromString:(id)a3
{
  id v4;
  int v5;
  SDPParser *v6;
  NSString *v7;
  SDPParser *v8;

  v8 = -[SDPParser initWithString:]([SDPParser alloc], "initWithString:", a3);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  while (!-[SDPParser parsingDone](v8, "parsingDone"))
  {
    v5 = -[SDPParser fieldType](v8, "fieldType");
    if (v5 > 4)
    {
      if (v5 == 5)
      {
        objc_msgSend(v4, "addObject:", -[SDPParser fieldValue](v8, "fieldValue"));
        goto LABEL_12;
      }
      v6 = v8;
      if (v5 != 15)
        goto LABEL_13;
      -[SDPMini parseMediaLine:](self, "parseMediaLine:", v8);
    }
    else
    {
      if (v5 == 2)
      {
        v7 = (NSString *)-[SDPMini parseIP:](self, "parseIP:", -[SDPParser fieldValue](v8, "fieldValue"));
        v6 = v8;
        self->sessionIP = v7;
        goto LABEL_13;
      }
      v6 = v8;
      if (v5 != 3)
        goto LABEL_13;
      -[SDPMini parseBandwidth:](self, "parseBandwidth:", -[SDPParser fieldValue](v8, "fieldValue"));
LABEL_12:
      v6 = v8;
LABEL_13:
      -[SDPParser nextLine](v6, "nextLine");
    }
  }
  -[SDPMini parseSessionAttributes:](self, "parseSessionAttributes:", v4);

}

- (id)parseRTPID:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(":"));
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
    return 0;
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", strtoul((const char *)objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", 1), "UTF8String"), 0, 10));
}

- (id)parseRTCPPort:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(":"));
  if ((unint64_t)objc_msgSend(v3, "count") >= 2
    && (v4 = (void *)objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", 1), "componentsSeparatedByString:", CFSTR(" ")), objc_msgSend(v4, "count")))
  {
    return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", 0), "intValue"));
  }
  else
  {
    return 0;
  }
}

- (void)parseSessionAttributes:(id)a3
{
  NSDictionary *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSDictionary *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  NSObject *v32;
  __int128 v33;
  _BYTE buf[24];
  __int128 v35;
  _BYTE v36[128];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v38;
    *(_QWORD *)&v7 = 136315906;
    v33 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (!self->allowsDynamicMaxBitrate
          && objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "hasPrefix:", CFSTR("DMBR")))
        {
          self->allowsDynamicMaxBitrate = 1;
          continue;
        }
        if (objc_msgSend(v11, "hasPrefix:", CFSTR("FLS"), v33, *(_OWORD *)buf, *(_QWORD *)&buf[16], v35))
        {
          if (-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", &unk_1E9EF4B38))
            continue;
          v12 = v5;
          v13 = v11;
          v14 = &unk_1E9EF4B38;
          goto LABEL_12;
        }
        if (!self->allowsContentsChangeWithAspectPreservation
          && objc_msgSend(v11, "hasPrefix:", CFSTR("CAP")))
        {
          self->allowsContentsChangeWithAspectPreservation = 1;
          continue;
        }
        if (objc_msgSend(v11, "hasPrefix:", CFSTR("X_FLS")))
        {
          v15 = (void *)objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(" "));
          v16 = (void *)objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
          v17 = objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
          v18 = objc_msgSend(v16, "rangeOfString:", CFSTR(":"));
          if (v16)
            v19 = v17 == 0;
          else
            v19 = 1;
          if (v19 || v18 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
            {
              v21 = VRTraceErrorLogLevelToCSTR();
              v22 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                if (v11)
                  v23 = (const char *)objc_msgSend((id)objc_msgSend(v11, "description"), "UTF8String");
                else
                  v23 = "<nil>";
                *(_DWORD *)buf = v33;
                *(_QWORD *)&buf[4] = v21;
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "-[SDPMini(SDPParsing) parseSessionAttributes:]";
                *(_WORD *)&buf[22] = 1024;
                LODWORD(v35) = 822;
                WORD2(v35) = 2080;
                *(_QWORD *)((char *)&v35 + 6) = v23;
                v32 = v22;
LABEL_42:
                _os_log_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Can't parse attribute: %s", buf, 0x26u);
                continue;
              }
            }
          }
          else
          {
            v27 = (void *)objc_msgSend(v16, "substringFromIndex:", v18 + 1);
            v28 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v27, "intValue"));
            if (!-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v28))
            {
              v12 = v5;
              v13 = (void *)v17;
              v14 = (void *)v28;
LABEL_12:
              -[NSDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v13, v14);
              continue;
            }
          }
        }
        else
        {
          if (!objc_msgSend(v11, "hasPrefix:", CFSTR("BBCODEC")))
            continue;
          v24 = (void *)objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(":"));
          if (objc_msgSend(v24, "count") == 3)
          {
            v25 = (void *)objc_msgSend(v24, "objectAtIndexedSubscript:", 1);
            v26 = (void *)objc_msgSend(v24, "objectAtIndexedSubscript:", 2);

            self->basebandCodecType = (NSString *)v25;
            self->basebandCodecSampleRate = (NSNumber *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", objc_msgSend(v26, "intValue"));
            continue;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
          {
            v29 = VRTraceErrorLogLevelToCSTR();
            v30 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              if (v11)
                v31 = (const char *)objc_msgSend((id)objc_msgSend(v11, "description"), "UTF8String");
              else
                v31 = "<nil>";
              *(_DWORD *)buf = v33;
              *(_QWORD *)&buf[4] = v29;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "-[SDPMini(SDPParsing) parseSessionAttributes:]";
              *(_WORD *)&buf[22] = 1024;
              LODWORD(v35) = 838;
              WORD2(v35) = 2080;
              *(_QWORD *)((char *)&v35 + 6) = v31;
              v32 = v30;
              goto LABEL_42;
            }
          }
        }
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
    }
    while (v8);
  }
  self->featureListDict = v5;
}

- (void)parseAudioFormatAttribute:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "rangeOfString:", CFSTR(" "));
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    v7 = (void *)objc_msgSend((id)objc_msgSend(a3, "substringToIndex:", v5), "componentsSeparatedByString:", CFSTR(":"));
    if ((unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", 1), "intValue"));
      if (-[NSMutableArray containsObject:](self->audioPayloads, "containsObject:", v8))
      {
        v9 = (void *)objc_msgSend((id)objc_msgSend(a3, "substringFromIndex:", v6), "componentsSeparatedByString:", CFSTR(";"));
        if (objc_msgSend(v9, "count"))
        {
          v17 = 0u;
          v18 = 0u;
          v15 = 0u;
          v16 = 0u;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v16;
            while (2)
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v16 != v12)
                  objc_enumerationMutation(v9);
                if (!objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet")), "caseInsensitiveCompare:", CFSTR("sec")))
                {
                  -[NSMutableArray addObject:](self->secondaryAudioPayloads, "addObject:", v8);
                  goto LABEL_15;
                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
              if (v11)
                continue;
              break;
            }
          }
LABEL_15:
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_audioParameters, "setObject:forKeyedSubscript:", v9, v8);
        }
      }
    }
  }
}

- (void)parseAudioMediaAttributes:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = CFSTR(" ");
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        if (objc_msgSend(v10, "hasPrefix:", CFSTR("fmtp:AAC SamplesPerBlock")))
        {
          v11 = (void *)objc_msgSend((id)objc_msgSend(v10, "componentsSeparatedByString:", v7), "lastObject");
          -[SDPMini setAacBlockSize:](self, "setAacBlockSize:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "intValue")));
        }
        else if (objc_msgSend(v10, "hasPrefix:", CFSTR("au:")))
        {
          v12 = (void *)objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(":"));
          if ((unint64_t)objc_msgSend(v12, "count") >= 2)
          {
            v13 = v7;
            v14 = (void *)MEMORY[0x1E0CB37E8];
            v15 = objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", 1), "integerValue");
            v16 = v14;
            v7 = v13;
            -[SDPMini setAudioUnitModel:](self, "setAudioUnitModel:", objc_msgSend(v16, "numberWithInteger:", v15));
          }
        }
        else if (objc_msgSend(v10, "hasPrefix:", CFSTR("rtpID")))
        {
          -[SDPMini setAudioRTPID:](self, "setAudioRTPID:", -[SDPMini parseRTPID:](self, "parseRTPID:", v10));
        }
        else if (objc_msgSend(v10, "hasPrefix:", CFSTR("rtcp:")))
        {
          -[SDPMini setAudioRTCPPort:](self, "setAudioRTCPPort:", -[SDPMini parseRTCPPort:](self, "parseRTCPPort:", v10));
        }
        else if (objc_msgSend(v10, "hasPrefix:", CFSTR("fmtp:")))
        {
          -[SDPMini parseAudioFormatAttribute:](self, "parseAudioFormatAttribute:", v10);
        }
        else if (!self->allowAudioRecording
               && objc_msgSend(v10, "isEqualToString:", CFSTR("allowrecording")))
        {
          self->allowAudioRecording = 1;
        }
        ++v9;
      }
      while (v6 != v9);
      v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
      v6 = v17;
    }
    while (v17);
  }
}

- (int)rulesFramerate:(int)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v3 = *(_QWORD *)&a3;
  v22 = *MEMORY[0x1E0C80C00];
  v4 = -[SDPMini getMediaLineForType:](self, "getMediaLineForType:", 2);
  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fmtp:%d"), v3);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = (void *)objc_msgSend(v4, "attributes");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
      if (objc_msgSend(v11, "hasPrefix:", v5))
      {
        v12 = (void *)objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(" "));
        if (v12)
        {
          v13 = v12;
          if ((unint64_t)objc_msgSend(v12, "count") >= 5)
            break;
        }
      }
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
        if (v8)
          goto LABEL_3;
        return 10;
      }
    }
    v14 = (void *)objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", 4), "componentsSeparatedByString:", CFSTR(":"));
    if (v14)
    {
      v15 = v14;
      if ((unint64_t)objc_msgSend(v14, "count") >= 3)
        return objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", 0), "intValue");
    }
  }
  return 10;
}

- (void)rulesImageSizeForExternalPayload:(int)a3 pWidth:(int *)a4 pHeight:(int *)a5
{
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v7 = *(_QWORD *)&a3;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = -[SDPMini getMediaLineForType:](self, "getMediaLineForType:", 2);
  v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fmtp:%d"), v7);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = (void *)objc_msgSend(v8, "attributes");
  v11 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v14);
      if (objc_msgSend(v15, "hasPrefix:", v9))
      {
        v16 = (void *)objc_msgSend(v15, "componentsSeparatedByString:", CFSTR(" "));
        if (v16)
        {
          v17 = v16;
          if ((unint64_t)objc_msgSend(v16, "count") >= 5)
            break;
        }
      }
      if (v12 == (void *)++v14)
      {
        v11 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
        v12 = v11;
        if (v11)
          goto LABEL_3;
        goto LABEL_17;
      }
    }
    v11 = (void *)objc_msgSend((id)objc_msgSend(v17, "objectAtIndexedSubscript:", 4), "componentsSeparatedByString:", CFSTR(":"));
    if (!v11)
      goto LABEL_17;
    v18 = v11;
    if ((unint64_t)objc_msgSend(v11, "count") < 3)
    {
      LODWORD(v11) = 0;
      goto LABEL_17;
    }
    v19 = objc_msgSend((id)objc_msgSend(v18, "objectAtIndexedSubscript:", 1), "intValue");
    LODWORD(v11) = objc_msgSend((id)objc_msgSend(v18, "objectAtIndexedSubscript:", 2), "intValue");
    if (a4)
      goto LABEL_18;
  }
  else
  {
LABEL_17:
    v19 = 0;
    if (a4)
LABEL_18:
      *a4 = v19;
  }
  if (a5)
    *a5 = (int)v11;
}

- (void)setUseSbr:(BOOL)a3 blockSize:(int)a4 forAACFormat:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v9;
  id v10;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  if (v7)
    objc_msgSend(v10, "addObject:", CFSTR("sbr"));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("block %u"), v6);
  objc_msgSend(v10, "addObject:", v9);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_audioParameters, "setObject:forKeyedSubscript:", v10, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5));
}

- (BOOL)getUseSbr:(BOOL *)a3 blockSize:(int *)a4 forAACFormat:(int)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_audioParameters, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a5));
  v8 = v7;
  if (v7)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet"));
          v14 = v13;
          if (a4 && objc_msgSend(v13, "hasPrefix:", CFSTR("block ")))
          {
            v15 = (void *)objc_msgSend(v14, "substringFromIndex:", objc_msgSend(CFSTR("block "), "length"));
            if (v15)
            {
              v16 = objc_msgSend(v15, "integerValue");
              if ((unint64_t)(v16 - 1) <= 0x3FF)
                *a4 = v16;
            }
          }
          else if (a3 && !objc_msgSend(v14, "caseInsensitiveCompare:", CFSTR("sbr")))
          {
            *a3 = 1;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
      }
      while (v10);
    }
  }
  return v8 != 0;
}

- (void)setVideoRTCPFB:(BOOL)a3 useNACK:(BOOL)a4
{
  _BOOL4 v4;
  const char *v5;
  id v6;
  const char *v7;

  v4 = a4;
  if (a3 || a4)
  {
    if (a3)
      v5 = " rpsi";
    else
      v5 = "";
    v6 = -[SDPMini getMediaLineForType:](self, "getMediaLineForType:", 2);
    v7 = " nack";
    if (!v4)
      v7 = "";
    objc_msgSend(v6, "addAttribute:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rtcp-fb:*%s%s"), v5, v7));
  }
}

@end
