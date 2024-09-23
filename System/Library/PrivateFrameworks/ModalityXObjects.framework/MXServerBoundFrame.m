@implementation MXServerBoundFrame

- (BOOL)hasSessionMetadata
{
  return self->_sessionMetadata != 0;
}

- (void)setSessionMetadata:(id)a3
{
  MXSessionMetadata *v4;
  MXSessionMetadata *sessionMetadata;

  v4 = (MXSessionMetadata *)a3;
  -[MXServerBoundFrame clearOneofValuesForPayload](self, "clearOneofValuesForPayload");
  *(_BYTE *)&self->_has |= 1u;
  self->_payload = 1;
  sessionMetadata = self->_sessionMetadata;
  self->_sessionMetadata = v4;

}

- (BOOL)hasBeginRequest
{
  return self->_beginRequest != 0;
}

- (void)setBeginRequest:(id)a3
{
  MXBeginRequest *v4;
  MXBeginRequest *beginRequest;

  v4 = (MXBeginRequest *)a3;
  -[MXServerBoundFrame clearOneofValuesForPayload](self, "clearOneofValuesForPayload");
  *(_BYTE *)&self->_has |= 1u;
  self->_payload = 2;
  beginRequest = self->_beginRequest;
  self->_beginRequest = v4;

}

- (BOOL)hasAudioFrame
{
  return self->_audioFrame != 0;
}

- (void)setAudioFrame:(id)a3
{
  MXAudioFrame *v4;
  MXAudioFrame *audioFrame;

  v4 = (MXAudioFrame *)a3;
  -[MXServerBoundFrame clearOneofValuesForPayload](self, "clearOneofValuesForPayload");
  *(_BYTE *)&self->_has |= 1u;
  self->_payload = 3;
  audioFrame = self->_audioFrame;
  self->_audioFrame = v4;

}

- (BOOL)hasSpeechProfile
{
  return self->_speechProfile != 0;
}

- (void)setSpeechProfile:(id)a3
{
  MXSpeechProfile *v4;
  MXSpeechProfile *speechProfile;

  v4 = (MXSpeechProfile *)a3;
  -[MXServerBoundFrame clearOneofValuesForPayload](self, "clearOneofValuesForPayload");
  *(_BYTE *)&self->_has |= 1u;
  self->_payload = 4;
  speechProfile = self->_speechProfile;
  self->_speechProfile = v4;

}

- (BOOL)hasCancelRequest
{
  return self->_cancelRequest != 0;
}

- (void)setCancelRequest:(id)a3
{
  MXCancelRequest *v4;
  MXCancelRequest *cancelRequest;

  v4 = (MXCancelRequest *)a3;
  -[MXServerBoundFrame clearOneofValuesForPayload](self, "clearOneofValuesForPayload");
  *(_BYTE *)&self->_has |= 1u;
  self->_payload = 5;
  cancelRequest = self->_cancelRequest;
  self->_cancelRequest = v4;

}

- (BOOL)hasBeginDictation
{
  return self->_beginDictation != 0;
}

- (void)setBeginDictation:(id)a3
{
  MXBeginDictation *v4;
  MXBeginDictation *beginDictation;

  v4 = (MXBeginDictation *)a3;
  -[MXServerBoundFrame clearOneofValuesForPayload](self, "clearOneofValuesForPayload");
  *(_BYTE *)&self->_has |= 1u;
  self->_payload = 6;
  beginDictation = self->_beginDictation;
  self->_beginDictation = v4;

}

- (BOOL)hasSpeechProfileRequest
{
  return self->_speechProfileRequest != 0;
}

- (void)setSpeechProfileRequest:(id)a3
{
  MXSpeechProfileBuildRequest *v4;
  MXSpeechProfileBuildRequest *speechProfileRequest;

  v4 = (MXSpeechProfileBuildRequest *)a3;
  -[MXServerBoundFrame clearOneofValuesForPayload](self, "clearOneofValuesForPayload");
  *(_BYTE *)&self->_has |= 1u;
  self->_payload = 7;
  speechProfileRequest = self->_speechProfileRequest;
  self->_speechProfileRequest = v4;

}

- (BOOL)hasStreamingSpeechProfileRequest
{
  return self->_streamingSpeechProfileRequest != 0;
}

- (void)setStreamingSpeechProfileRequest:(id)a3
{
  MXStreamingSpeechProfileBegin *v4;
  MXStreamingSpeechProfileBegin *streamingSpeechProfileRequest;

  v4 = (MXStreamingSpeechProfileBegin *)a3;
  -[MXServerBoundFrame clearOneofValuesForPayload](self, "clearOneofValuesForPayload");
  *(_BYTE *)&self->_has |= 1u;
  self->_payload = 8;
  streamingSpeechProfileRequest = self->_streamingSpeechProfileRequest;
  self->_streamingSpeechProfileRequest = v4;

}

- (BOOL)hasStreamingSpeechProfileData
{
  return self->_streamingSpeechProfileData != 0;
}

- (void)setStreamingSpeechProfileData:(id)a3
{
  MXStreamingSpeechProfileAddData *v4;
  MXStreamingSpeechProfileAddData *streamingSpeechProfileData;

  v4 = (MXStreamingSpeechProfileAddData *)a3;
  -[MXServerBoundFrame clearOneofValuesForPayload](self, "clearOneofValuesForPayload");
  *(_BYTE *)&self->_has |= 1u;
  self->_payload = 9;
  streamingSpeechProfileData = self->_streamingSpeechProfileData;
  self->_streamingSpeechProfileData = v4;

}

- (BOOL)hasStreamingSpeechProfileCommit
{
  return self->_streamingSpeechProfileCommit != 0;
}

- (void)setStreamingSpeechProfileCommit:(id)a3
{
  MXStreamingSpeechProfileCommit *v4;
  MXStreamingSpeechProfileCommit *streamingSpeechProfileCommit;

  v4 = (MXStreamingSpeechProfileCommit *)a3;
  -[MXServerBoundFrame clearOneofValuesForPayload](self, "clearOneofValuesForPayload");
  *(_BYTE *)&self->_has |= 1u;
  self->_payload = 10;
  streamingSpeechProfileCommit = self->_streamingSpeechProfileCommit;
  self->_streamingSpeechProfileCommit = v4;

}

- (int)payload
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_payload;
  else
    return 0;
}

- (void)setPayload:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_payload = a3;
}

- (void)setHasPayload:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPayload
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)payloadAsString:(int)a3
{
  if (a3 < 0xB)
    return off_2512EFA68[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPayload:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PBUNSET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("session_metadata")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("begin_request")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("audio_frame")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("speech_profile")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("cancel_request")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("begin_dictation")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("speech_profile_request")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("streaming_speech_profile_request")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("streaming_speech_profile_data")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("streaming_speech_profile_commit")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForPayload
{
  MXSessionMetadata *sessionMetadata;
  MXBeginRequest *beginRequest;
  MXAudioFrame *audioFrame;
  MXSpeechProfile *speechProfile;
  MXCancelRequest *cancelRequest;
  MXBeginDictation *beginDictation;
  MXSpeechProfileBuildRequest *speechProfileRequest;
  MXStreamingSpeechProfileBegin *streamingSpeechProfileRequest;
  MXStreamingSpeechProfileAddData *streamingSpeechProfileData;
  MXStreamingSpeechProfileCommit *streamingSpeechProfileCommit;

  *(_BYTE *)&self->_has &= ~1u;
  self->_payload = 0;
  sessionMetadata = self->_sessionMetadata;
  self->_sessionMetadata = 0;

  beginRequest = self->_beginRequest;
  self->_beginRequest = 0;

  audioFrame = self->_audioFrame;
  self->_audioFrame = 0;

  speechProfile = self->_speechProfile;
  self->_speechProfile = 0;

  cancelRequest = self->_cancelRequest;
  self->_cancelRequest = 0;

  beginDictation = self->_beginDictation;
  self->_beginDictation = 0;

  speechProfileRequest = self->_speechProfileRequest;
  self->_speechProfileRequest = 0;

  streamingSpeechProfileRequest = self->_streamingSpeechProfileRequest;
  self->_streamingSpeechProfileRequest = 0;

  streamingSpeechProfileData = self->_streamingSpeechProfileData;
  self->_streamingSpeechProfileData = 0;

  streamingSpeechProfileCommit = self->_streamingSpeechProfileCommit;
  self->_streamingSpeechProfileCommit = 0;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)MXServerBoundFrame;
  -[MXServerBoundFrame description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXServerBoundFrame dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  MXSessionMetadata *sessionMetadata;
  void *v5;
  MXBeginRequest *beginRequest;
  void *v7;
  MXAudioFrame *audioFrame;
  void *v9;
  MXSpeechProfile *speechProfile;
  void *v11;
  MXCancelRequest *cancelRequest;
  void *v13;
  MXBeginDictation *beginDictation;
  void *v15;
  MXSpeechProfileBuildRequest *speechProfileRequest;
  void *v17;
  MXStreamingSpeechProfileBegin *streamingSpeechProfileRequest;
  void *v19;
  MXStreamingSpeechProfileAddData *streamingSpeechProfileData;
  void *v21;
  MXStreamingSpeechProfileCommit *streamingSpeechProfileCommit;
  void *v23;
  uint64_t payload;
  __CFString *v25;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sessionMetadata = self->_sessionMetadata;
  if (sessionMetadata)
  {
    -[MXSessionMetadata dictionaryRepresentation](sessionMetadata, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("session_metadata"));

  }
  beginRequest = self->_beginRequest;
  if (beginRequest)
  {
    -[MXBeginRequest dictionaryRepresentation](beginRequest, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("begin_request"));

  }
  audioFrame = self->_audioFrame;
  if (audioFrame)
  {
    -[MXAudioFrame dictionaryRepresentation](audioFrame, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("audio_frame"));

  }
  speechProfile = self->_speechProfile;
  if (speechProfile)
  {
    -[MXSpeechProfile dictionaryRepresentation](speechProfile, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("speech_profile"));

  }
  cancelRequest = self->_cancelRequest;
  if (cancelRequest)
  {
    -[MXCancelRequest dictionaryRepresentation](cancelRequest, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("cancel_request"));

  }
  beginDictation = self->_beginDictation;
  if (beginDictation)
  {
    -[MXBeginDictation dictionaryRepresentation](beginDictation, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("begin_dictation"));

  }
  speechProfileRequest = self->_speechProfileRequest;
  if (speechProfileRequest)
  {
    -[MXSpeechProfileBuildRequest dictionaryRepresentation](speechProfileRequest, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("speech_profile_request"));

  }
  streamingSpeechProfileRequest = self->_streamingSpeechProfileRequest;
  if (streamingSpeechProfileRequest)
  {
    -[MXStreamingSpeechProfileBegin dictionaryRepresentation](streamingSpeechProfileRequest, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("streaming_speech_profile_request"));

  }
  streamingSpeechProfileData = self->_streamingSpeechProfileData;
  if (streamingSpeechProfileData)
  {
    -[MXStreamingSpeechProfileAddData dictionaryRepresentation](streamingSpeechProfileData, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("streaming_speech_profile_data"));

  }
  streamingSpeechProfileCommit = self->_streamingSpeechProfileCommit;
  if (streamingSpeechProfileCommit)
  {
    -[MXStreamingSpeechProfileCommit dictionaryRepresentation](streamingSpeechProfileCommit, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("streaming_speech_profile_commit"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    payload = self->_payload;
    if (payload >= 0xB)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_payload);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = off_2512EFA68[payload];
    }
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("payload"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXServerBoundFrameReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_sessionMetadata)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_beginRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_audioFrame)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_speechProfile)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_cancelRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_beginDictation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_speechProfileRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_streamingSpeechProfileRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_streamingSpeechProfileData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_streamingSpeechProfileCommit)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[10] = self->_payload;
    *((_BYTE *)v4 + 96) |= 1u;
  }
  v5 = v4;
  if (self->_sessionMetadata)
  {
    objc_msgSend(v4, "setSessionMetadata:");
    v4 = v5;
  }
  if (self->_beginRequest)
  {
    objc_msgSend(v5, "setBeginRequest:");
    v4 = v5;
  }
  if (self->_audioFrame)
  {
    objc_msgSend(v5, "setAudioFrame:");
    v4 = v5;
  }
  if (self->_speechProfile)
  {
    objc_msgSend(v5, "setSpeechProfile:");
    v4 = v5;
  }
  if (self->_cancelRequest)
  {
    objc_msgSend(v5, "setCancelRequest:");
    v4 = v5;
  }
  if (self->_beginDictation)
  {
    objc_msgSend(v5, "setBeginDictation:");
    v4 = v5;
  }
  if (self->_speechProfileRequest)
  {
    objc_msgSend(v5, "setSpeechProfileRequest:");
    v4 = v5;
  }
  if (self->_streamingSpeechProfileRequest)
  {
    objc_msgSend(v5, "setStreamingSpeechProfileRequest:");
    v4 = v5;
  }
  if (self->_streamingSpeechProfileData)
  {
    objc_msgSend(v5, "setStreamingSpeechProfileData:");
    v4 = v5;
  }
  if (self->_streamingSpeechProfileCommit)
  {
    objc_msgSend(v5, "setStreamingSpeechProfileCommit:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_payload;
    *(_BYTE *)(v5 + 96) |= 1u;
  }
  v7 = -[MXSessionMetadata copyWithZone:](self->_sessionMetadata, "copyWithZone:", a3);
  v8 = (void *)v6[6];
  v6[6] = v7;

  v9 = -[MXBeginRequest copyWithZone:](self->_beginRequest, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  v11 = -[MXAudioFrame copyWithZone:](self->_audioFrame, "copyWithZone:", a3);
  v12 = (void *)v6[1];
  v6[1] = v11;

  v13 = -[MXSpeechProfile copyWithZone:](self->_speechProfile, "copyWithZone:", a3);
  v14 = (void *)v6[7];
  v6[7] = v13;

  v15 = -[MXCancelRequest copyWithZone:](self->_cancelRequest, "copyWithZone:", a3);
  v16 = (void *)v6[4];
  v6[4] = v15;

  v17 = -[MXBeginDictation copyWithZone:](self->_beginDictation, "copyWithZone:", a3);
  v18 = (void *)v6[2];
  v6[2] = v17;

  v19 = -[MXSpeechProfileBuildRequest copyWithZone:](self->_speechProfileRequest, "copyWithZone:", a3);
  v20 = (void *)v6[8];
  v6[8] = v19;

  v21 = -[MXStreamingSpeechProfileBegin copyWithZone:](self->_streamingSpeechProfileRequest, "copyWithZone:", a3);
  v22 = (void *)v6[11];
  v6[11] = v21;

  v23 = -[MXStreamingSpeechProfileAddData copyWithZone:](self->_streamingSpeechProfileData, "copyWithZone:", a3);
  v24 = (void *)v6[10];
  v6[10] = v23;

  v25 = -[MXStreamingSpeechProfileCommit copyWithZone:](self->_streamingSpeechProfileCommit, "copyWithZone:", a3);
  v26 = (void *)v6[9];
  v6[9] = v25;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  MXSessionMetadata *sessionMetadata;
  MXBeginRequest *beginRequest;
  MXAudioFrame *audioFrame;
  MXSpeechProfile *speechProfile;
  MXCancelRequest *cancelRequest;
  MXBeginDictation *beginDictation;
  MXSpeechProfileBuildRequest *speechProfileRequest;
  MXStreamingSpeechProfileBegin *streamingSpeechProfileRequest;
  MXStreamingSpeechProfileAddData *streamingSpeechProfileData;
  MXStreamingSpeechProfileCommit *streamingSpeechProfileCommit;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 1) == 0 || self->_payload != *((_DWORD *)v4 + 10))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 96) & 1) != 0)
  {
LABEL_27:
    v15 = 0;
    goto LABEL_28;
  }
  sessionMetadata = self->_sessionMetadata;
  if ((unint64_t)sessionMetadata | *((_QWORD *)v4 + 6)
    && !-[MXSessionMetadata isEqual:](sessionMetadata, "isEqual:"))
  {
    goto LABEL_27;
  }
  beginRequest = self->_beginRequest;
  if ((unint64_t)beginRequest | *((_QWORD *)v4 + 3))
  {
    if (!-[MXBeginRequest isEqual:](beginRequest, "isEqual:"))
      goto LABEL_27;
  }
  audioFrame = self->_audioFrame;
  if ((unint64_t)audioFrame | *((_QWORD *)v4 + 1))
  {
    if (!-[MXAudioFrame isEqual:](audioFrame, "isEqual:"))
      goto LABEL_27;
  }
  speechProfile = self->_speechProfile;
  if ((unint64_t)speechProfile | *((_QWORD *)v4 + 7))
  {
    if (!-[MXSpeechProfile isEqual:](speechProfile, "isEqual:"))
      goto LABEL_27;
  }
  cancelRequest = self->_cancelRequest;
  if ((unint64_t)cancelRequest | *((_QWORD *)v4 + 4))
  {
    if (!-[MXCancelRequest isEqual:](cancelRequest, "isEqual:"))
      goto LABEL_27;
  }
  beginDictation = self->_beginDictation;
  if ((unint64_t)beginDictation | *((_QWORD *)v4 + 2))
  {
    if (!-[MXBeginDictation isEqual:](beginDictation, "isEqual:"))
      goto LABEL_27;
  }
  speechProfileRequest = self->_speechProfileRequest;
  if ((unint64_t)speechProfileRequest | *((_QWORD *)v4 + 8))
  {
    if (!-[MXSpeechProfileBuildRequest isEqual:](speechProfileRequest, "isEqual:"))
      goto LABEL_27;
  }
  streamingSpeechProfileRequest = self->_streamingSpeechProfileRequest;
  if ((unint64_t)streamingSpeechProfileRequest | *((_QWORD *)v4 + 11))
  {
    if (!-[MXStreamingSpeechProfileBegin isEqual:](streamingSpeechProfileRequest, "isEqual:"))
      goto LABEL_27;
  }
  streamingSpeechProfileData = self->_streamingSpeechProfileData;
  if ((unint64_t)streamingSpeechProfileData | *((_QWORD *)v4 + 10))
  {
    if (!-[MXStreamingSpeechProfileAddData isEqual:](streamingSpeechProfileData, "isEqual:"))
      goto LABEL_27;
  }
  streamingSpeechProfileCommit = self->_streamingSpeechProfileCommit;
  if ((unint64_t)streamingSpeechProfileCommit | *((_QWORD *)v4 + 9))
    v15 = -[MXStreamingSpeechProfileCommit isEqual:](streamingSpeechProfileCommit, "isEqual:");
  else
    v15 = 1;
LABEL_28:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_payload;
  else
    v3 = 0;
  v4 = -[MXSessionMetadata hash](self->_sessionMetadata, "hash") ^ v3;
  v5 = -[MXBeginRequest hash](self->_beginRequest, "hash");
  v6 = v4 ^ v5 ^ -[MXAudioFrame hash](self->_audioFrame, "hash");
  v7 = -[MXSpeechProfile hash](self->_speechProfile, "hash");
  v8 = v7 ^ -[MXCancelRequest hash](self->_cancelRequest, "hash");
  v9 = v6 ^ v8 ^ -[MXBeginDictation hash](self->_beginDictation, "hash");
  v10 = -[MXSpeechProfileBuildRequest hash](self->_speechProfileRequest, "hash");
  v11 = v10 ^ -[MXStreamingSpeechProfileBegin hash](self->_streamingSpeechProfileRequest, "hash");
  v12 = v11 ^ -[MXStreamingSpeechProfileAddData hash](self->_streamingSpeechProfileData, "hash");
  return v9 ^ v12 ^ -[MXStreamingSpeechProfileCommit hash](self->_streamingSpeechProfileCommit, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  MXSessionMetadata *sessionMetadata;
  uint64_t v7;
  MXBeginRequest *beginRequest;
  uint64_t v9;
  MXAudioFrame *audioFrame;
  uint64_t v11;
  MXSpeechProfile *speechProfile;
  uint64_t v13;
  MXCancelRequest *cancelRequest;
  uint64_t v15;
  MXBeginDictation *beginDictation;
  uint64_t v17;
  MXSpeechProfileBuildRequest *speechProfileRequest;
  uint64_t v19;
  MXStreamingSpeechProfileBegin *streamingSpeechProfileRequest;
  uint64_t v21;
  MXStreamingSpeechProfileAddData *streamingSpeechProfileData;
  uint64_t v23;
  MXStreamingSpeechProfileCommit *streamingSpeechProfileCommit;
  uint64_t v25;
  _QWORD *v26;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 96) & 1) != 0)
  {
    self->_payload = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 1u;
  }
  sessionMetadata = self->_sessionMetadata;
  v7 = v5[6];
  v26 = v5;
  if (sessionMetadata)
  {
    if (!v7)
      goto LABEL_9;
    -[MXSessionMetadata mergeFrom:](sessionMetadata, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[MXServerBoundFrame setSessionMetadata:](self, "setSessionMetadata:");
  }
  v5 = v26;
LABEL_9:
  beginRequest = self->_beginRequest;
  v9 = v5[3];
  if (beginRequest)
  {
    if (!v9)
      goto LABEL_15;
    -[MXBeginRequest mergeFrom:](beginRequest, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    -[MXServerBoundFrame setBeginRequest:](self, "setBeginRequest:");
  }
  v5 = v26;
LABEL_15:
  audioFrame = self->_audioFrame;
  v11 = v5[1];
  if (audioFrame)
  {
    if (!v11)
      goto LABEL_21;
    -[MXAudioFrame mergeFrom:](audioFrame, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_21;
    -[MXServerBoundFrame setAudioFrame:](self, "setAudioFrame:");
  }
  v5 = v26;
LABEL_21:
  speechProfile = self->_speechProfile;
  v13 = v5[7];
  if (speechProfile)
  {
    if (!v13)
      goto LABEL_27;
    -[MXSpeechProfile mergeFrom:](speechProfile, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_27;
    -[MXServerBoundFrame setSpeechProfile:](self, "setSpeechProfile:");
  }
  v5 = v26;
LABEL_27:
  cancelRequest = self->_cancelRequest;
  v15 = v5[4];
  if (cancelRequest)
  {
    if (!v15)
      goto LABEL_33;
    -[MXCancelRequest mergeFrom:](cancelRequest, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_33;
    -[MXServerBoundFrame setCancelRequest:](self, "setCancelRequest:");
  }
  v5 = v26;
LABEL_33:
  beginDictation = self->_beginDictation;
  v17 = v5[2];
  if (beginDictation)
  {
    if (!v17)
      goto LABEL_39;
    -[MXBeginDictation mergeFrom:](beginDictation, "mergeFrom:");
  }
  else
  {
    if (!v17)
      goto LABEL_39;
    -[MXServerBoundFrame setBeginDictation:](self, "setBeginDictation:");
  }
  v5 = v26;
LABEL_39:
  speechProfileRequest = self->_speechProfileRequest;
  v19 = v5[8];
  if (speechProfileRequest)
  {
    if (!v19)
      goto LABEL_45;
    -[MXSpeechProfileBuildRequest mergeFrom:](speechProfileRequest, "mergeFrom:");
  }
  else
  {
    if (!v19)
      goto LABEL_45;
    -[MXServerBoundFrame setSpeechProfileRequest:](self, "setSpeechProfileRequest:");
  }
  v5 = v26;
LABEL_45:
  streamingSpeechProfileRequest = self->_streamingSpeechProfileRequest;
  v21 = v5[11];
  if (streamingSpeechProfileRequest)
  {
    if (!v21)
      goto LABEL_51;
    -[MXStreamingSpeechProfileBegin mergeFrom:](streamingSpeechProfileRequest, "mergeFrom:");
  }
  else
  {
    if (!v21)
      goto LABEL_51;
    -[MXServerBoundFrame setStreamingSpeechProfileRequest:](self, "setStreamingSpeechProfileRequest:");
  }
  v5 = v26;
LABEL_51:
  streamingSpeechProfileData = self->_streamingSpeechProfileData;
  v23 = v5[10];
  if (streamingSpeechProfileData)
  {
    if (!v23)
      goto LABEL_57;
    -[MXStreamingSpeechProfileAddData mergeFrom:](streamingSpeechProfileData, "mergeFrom:");
  }
  else
  {
    if (!v23)
      goto LABEL_57;
    -[MXServerBoundFrame setStreamingSpeechProfileData:](self, "setStreamingSpeechProfileData:");
  }
  v5 = v26;
LABEL_57:
  streamingSpeechProfileCommit = self->_streamingSpeechProfileCommit;
  v25 = v5[9];
  if (streamingSpeechProfileCommit)
  {
    if (v25)
    {
      -[MXStreamingSpeechProfileCommit mergeFrom:](streamingSpeechProfileCommit, "mergeFrom:");
LABEL_62:
      v5 = v26;
    }
  }
  else if (v25)
  {
    -[MXServerBoundFrame setStreamingSpeechProfileCommit:](self, "setStreamingSpeechProfileCommit:");
    goto LABEL_62;
  }

}

- (MXSessionMetadata)sessionMetadata
{
  return self->_sessionMetadata;
}

- (MXBeginRequest)beginRequest
{
  return self->_beginRequest;
}

- (MXAudioFrame)audioFrame
{
  return self->_audioFrame;
}

- (MXSpeechProfile)speechProfile
{
  return self->_speechProfile;
}

- (MXCancelRequest)cancelRequest
{
  return self->_cancelRequest;
}

- (MXBeginDictation)beginDictation
{
  return self->_beginDictation;
}

- (MXSpeechProfileBuildRequest)speechProfileRequest
{
  return self->_speechProfileRequest;
}

- (MXStreamingSpeechProfileBegin)streamingSpeechProfileRequest
{
  return self->_streamingSpeechProfileRequest;
}

- (MXStreamingSpeechProfileAddData)streamingSpeechProfileData
{
  return self->_streamingSpeechProfileData;
}

- (MXStreamingSpeechProfileCommit)streamingSpeechProfileCommit
{
  return self->_streamingSpeechProfileCommit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamingSpeechProfileRequest, 0);
  objc_storeStrong((id *)&self->_streamingSpeechProfileData, 0);
  objc_storeStrong((id *)&self->_streamingSpeechProfileCommit, 0);
  objc_storeStrong((id *)&self->_speechProfileRequest, 0);
  objc_storeStrong((id *)&self->_speechProfile, 0);
  objc_storeStrong((id *)&self->_sessionMetadata, 0);
  objc_storeStrong((id *)&self->_cancelRequest, 0);
  objc_storeStrong((id *)&self->_beginRequest, 0);
  objc_storeStrong((id *)&self->_beginDictation, 0);
  objc_storeStrong((id *)&self->_audioFrame, 0);
}

@end
