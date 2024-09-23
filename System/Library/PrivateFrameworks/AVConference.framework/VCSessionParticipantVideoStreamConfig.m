@implementation VCSessionParticipantVideoStreamConfig

- (void)setupRxPayloads:(id)a3 featureStrings:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "unsignedIntValue");
        -[VCMediaStreamConfig addRxPayloadType:networkPayload:](self, "addRxPayloadType:networkPayload:", v12, v12);
        if (a4)
          -[VCVideoStreamConfig addRxCodecFeatureListString:codecType:](self, "addRxCodecFeatureListString:codecType:", objc_msgSend(a4, "objectForKeyedSubscript:", v11), +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", v12));
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v8);
  }
}

- (void)setupTxPayloads:(id)a3 featureStrings:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "unsignedIntValue");
        -[VCMediaStreamConfig addTxPayloadType:networkPayload:](self, "addTxPayloadType:networkPayload:", v12, v12);
        if (a4)
          -[VCVideoStreamConfig addTxCodecFeatureListString:codecType:](self, "addTxCodecFeatureListString:codecType:", objc_msgSend(a4, "objectForKeyedSubscript:", v11), +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", v12));
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v8);
  }
}

@end
