@implementation MXClientBoundFrame

- (BOOL)hasRequestComplete
{
  return self->_requestComplete != 0;
}

- (void)setRequestComplete:(id)a3
{
  MXRequestComplete *v4;
  MXRequestComplete *requestComplete;

  v4 = (MXRequestComplete *)a3;
  -[MXClientBoundFrame clearOneofValuesForPayload](self, "clearOneofValuesForPayload");
  *(_BYTE *)&self->_has |= 1u;
  self->_payload = 1;
  requestComplete = self->_requestComplete;
  self->_requestComplete = v4;

}

- (BOOL)hasProcessingError
{
  return self->_processingError != 0;
}

- (void)setProcessingError:(id)a3
{
  MXProcessingError *v4;
  MXProcessingError *processingError;

  v4 = (MXProcessingError *)a3;
  -[MXClientBoundFrame clearOneofValuesForPayload](self, "clearOneofValuesForPayload");
  *(_BYTE *)&self->_has |= 1u;
  self->_payload = 2;
  processingError = self->_processingError;
  self->_processingError = v4;

}

- (BOOL)hasAsrResult
{
  return self->_asrResult != 0;
}

- (void)setAsrResult:(id)a3
{
  MXASRResult *v4;
  MXASRResult *asrResult;

  v4 = (MXASRResult *)a3;
  -[MXClientBoundFrame clearOneofValuesForPayload](self, "clearOneofValuesForPayload");
  *(_BYTE *)&self->_has |= 1u;
  self->_payload = 3;
  asrResult = self->_asrResult;
  self->_asrResult = v4;

}

- (BOOL)hasSpeechProfileRebuildNeeded
{
  return self->_speechProfileRebuildNeeded != 0;
}

- (void)setSpeechProfileRebuildNeeded:(id)a3
{
  MXSpeechProfileRebuildNeeded *v4;
  MXSpeechProfileRebuildNeeded *speechProfileRebuildNeeded;

  v4 = (MXSpeechProfileRebuildNeeded *)a3;
  -[MXClientBoundFrame clearOneofValuesForPayload](self, "clearOneofValuesForPayload");
  *(_BYTE *)&self->_has |= 1u;
  self->_payload = 4;
  speechProfileRebuildNeeded = self->_speechProfileRebuildNeeded;
  self->_speechProfileRebuildNeeded = v4;

}

- (BOOL)hasRequestMitigated
{
  return self->_requestMitigated != 0;
}

- (void)setRequestMitigated:(id)a3
{
  MXRequestMitigated *v4;
  MXRequestMitigated *requestMitigated;

  v4 = (MXRequestMitigated *)a3;
  -[MXClientBoundFrame clearOneofValuesForPayload](self, "clearOneofValuesForPayload");
  *(_BYTE *)&self->_has |= 1u;
  self->_payload = 5;
  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = v4;

}

- (BOOL)hasSpeechProfileResponse
{
  return self->_speechProfileResponse != 0;
}

- (void)setSpeechProfileResponse:(id)a3
{
  MXSpeechProfileBuildResponse *v4;
  MXSpeechProfileBuildResponse *speechProfileResponse;

  v4 = (MXSpeechProfileBuildResponse *)a3;
  -[MXClientBoundFrame clearOneofValuesForPayload](self, "clearOneofValuesForPayload");
  *(_BYTE *)&self->_has |= 1u;
  self->_payload = 6;
  speechProfileResponse = self->_speechProfileResponse;
  self->_speechProfileResponse = v4;

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
  if (a3 < 7)
    return off_2512EF990[a3];
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
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("request_complete")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("processing_error")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("asr_result")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("speech_profile_rebuild_needed")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("request_mitigated")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("speech_profile_response")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForPayload
{
  MXRequestComplete *requestComplete;
  MXProcessingError *processingError;
  MXASRResult *asrResult;
  MXSpeechProfileRebuildNeeded *speechProfileRebuildNeeded;
  MXRequestMitigated *requestMitigated;
  MXSpeechProfileBuildResponse *speechProfileResponse;

  *(_BYTE *)&self->_has &= ~1u;
  self->_payload = 0;
  requestComplete = self->_requestComplete;
  self->_requestComplete = 0;

  processingError = self->_processingError;
  self->_processingError = 0;

  asrResult = self->_asrResult;
  self->_asrResult = 0;

  speechProfileRebuildNeeded = self->_speechProfileRebuildNeeded;
  self->_speechProfileRebuildNeeded = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  speechProfileResponse = self->_speechProfileResponse;
  self->_speechProfileResponse = 0;

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
  v8.super_class = (Class)MXClientBoundFrame;
  -[MXClientBoundFrame description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXClientBoundFrame dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  MXRequestComplete *requestComplete;
  void *v5;
  MXProcessingError *processingError;
  void *v7;
  MXASRResult *asrResult;
  void *v9;
  MXSpeechProfileRebuildNeeded *speechProfileRebuildNeeded;
  void *v11;
  MXRequestMitigated *requestMitigated;
  void *v13;
  MXSpeechProfileBuildResponse *speechProfileResponse;
  void *v15;
  uint64_t payload;
  __CFString *v17;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  requestComplete = self->_requestComplete;
  if (requestComplete)
  {
    -[MXRequestComplete dictionaryRepresentation](requestComplete, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("request_complete"));

  }
  processingError = self->_processingError;
  if (processingError)
  {
    -[MXProcessingError dictionaryRepresentation](processingError, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("processing_error"));

  }
  asrResult = self->_asrResult;
  if (asrResult)
  {
    -[MXASRResult dictionaryRepresentation](asrResult, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("asr_result"));

  }
  speechProfileRebuildNeeded = self->_speechProfileRebuildNeeded;
  if (speechProfileRebuildNeeded)
  {
    -[MXSpeechProfileRebuildNeeded dictionaryRepresentation](speechProfileRebuildNeeded, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("speech_profile_rebuild_needed"));

  }
  requestMitigated = self->_requestMitigated;
  if (requestMitigated)
  {
    -[MXRequestMitigated dictionaryRepresentation](requestMitigated, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("request_mitigated"));

  }
  speechProfileResponse = self->_speechProfileResponse;
  if (speechProfileResponse)
  {
    -[MXSpeechProfileBuildResponse dictionaryRepresentation](speechProfileResponse, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("speech_profile_response"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    payload = self->_payload;
    if (payload >= 7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_payload);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_2512EF990[payload];
    }
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("payload"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXClientBoundFrameReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_requestComplete)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_processingError)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_asrResult)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_speechProfileRebuildNeeded)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_requestMitigated)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_speechProfileResponse)
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
    v4[4] = self->_payload;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  v5 = v4;
  if (self->_requestComplete)
  {
    objc_msgSend(v4, "setRequestComplete:");
    v4 = v5;
  }
  if (self->_processingError)
  {
    objc_msgSend(v5, "setProcessingError:");
    v4 = v5;
  }
  if (self->_asrResult)
  {
    objc_msgSend(v5, "setAsrResult:");
    v4 = v5;
  }
  if (self->_speechProfileRebuildNeeded)
  {
    objc_msgSend(v5, "setSpeechProfileRebuildNeeded:");
    v4 = v5;
  }
  if (self->_requestMitigated)
  {
    objc_msgSend(v5, "setRequestMitigated:");
    v4 = v5;
  }
  if (self->_speechProfileResponse)
  {
    objc_msgSend(v5, "setSpeechProfileResponse:");
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_payload;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v7 = -[MXRequestComplete copyWithZone:](self->_requestComplete, "copyWithZone:", a3);
  v8 = (void *)v6[4];
  v6[4] = v7;

  v9 = -[MXProcessingError copyWithZone:](self->_processingError, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  v11 = -[MXASRResult copyWithZone:](self->_asrResult, "copyWithZone:", a3);
  v12 = (void *)v6[1];
  v6[1] = v11;

  v13 = -[MXSpeechProfileRebuildNeeded copyWithZone:](self->_speechProfileRebuildNeeded, "copyWithZone:", a3);
  v14 = (void *)v6[6];
  v6[6] = v13;

  v15 = -[MXRequestMitigated copyWithZone:](self->_requestMitigated, "copyWithZone:", a3);
  v16 = (void *)v6[5];
  v6[5] = v15;

  v17 = -[MXSpeechProfileBuildResponse copyWithZone:](self->_speechProfileResponse, "copyWithZone:", a3);
  v18 = (void *)v6[7];
  v6[7] = v17;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  MXRequestComplete *requestComplete;
  MXProcessingError *processingError;
  MXASRResult *asrResult;
  MXSpeechProfileRebuildNeeded *speechProfileRebuildNeeded;
  MXRequestMitigated *requestMitigated;
  MXSpeechProfileBuildResponse *speechProfileResponse;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_payload != *((_DWORD *)v4 + 4))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  requestComplete = self->_requestComplete;
  if ((unint64_t)requestComplete | *((_QWORD *)v4 + 4)
    && !-[MXRequestComplete isEqual:](requestComplete, "isEqual:"))
  {
    goto LABEL_19;
  }
  processingError = self->_processingError;
  if ((unint64_t)processingError | *((_QWORD *)v4 + 3))
  {
    if (!-[MXProcessingError isEqual:](processingError, "isEqual:"))
      goto LABEL_19;
  }
  asrResult = self->_asrResult;
  if ((unint64_t)asrResult | *((_QWORD *)v4 + 1))
  {
    if (!-[MXASRResult isEqual:](asrResult, "isEqual:"))
      goto LABEL_19;
  }
  speechProfileRebuildNeeded = self->_speechProfileRebuildNeeded;
  if ((unint64_t)speechProfileRebuildNeeded | *((_QWORD *)v4 + 6))
  {
    if (!-[MXSpeechProfileRebuildNeeded isEqual:](speechProfileRebuildNeeded, "isEqual:"))
      goto LABEL_19;
  }
  requestMitigated = self->_requestMitigated;
  if ((unint64_t)requestMitigated | *((_QWORD *)v4 + 5))
  {
    if (!-[MXRequestMitigated isEqual:](requestMitigated, "isEqual:"))
      goto LABEL_19;
  }
  speechProfileResponse = self->_speechProfileResponse;
  if ((unint64_t)speechProfileResponse | *((_QWORD *)v4 + 7))
    v11 = -[MXSpeechProfileBuildResponse isEqual:](speechProfileResponse, "isEqual:");
  else
    v11 = 1;
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_payload;
  else
    v3 = 0;
  v4 = -[MXRequestComplete hash](self->_requestComplete, "hash") ^ v3;
  v5 = -[MXProcessingError hash](self->_processingError, "hash");
  v6 = v4 ^ v5 ^ -[MXASRResult hash](self->_asrResult, "hash");
  v7 = -[MXSpeechProfileRebuildNeeded hash](self->_speechProfileRebuildNeeded, "hash");
  v8 = v7 ^ -[MXRequestMitigated hash](self->_requestMitigated, "hash");
  return v6 ^ v8 ^ -[MXSpeechProfileBuildResponse hash](self->_speechProfileResponse, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  MXRequestComplete *requestComplete;
  uint64_t v7;
  MXProcessingError *processingError;
  uint64_t v9;
  MXASRResult *asrResult;
  uint64_t v11;
  MXSpeechProfileRebuildNeeded *speechProfileRebuildNeeded;
  uint64_t v13;
  MXRequestMitigated *requestMitigated;
  uint64_t v15;
  MXSpeechProfileBuildResponse *speechProfileResponse;
  uint64_t v17;
  _QWORD *v18;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    self->_payload = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  requestComplete = self->_requestComplete;
  v7 = v5[4];
  v18 = v5;
  if (requestComplete)
  {
    if (!v7)
      goto LABEL_9;
    -[MXRequestComplete mergeFrom:](requestComplete, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[MXClientBoundFrame setRequestComplete:](self, "setRequestComplete:");
  }
  v5 = v18;
LABEL_9:
  processingError = self->_processingError;
  v9 = v5[3];
  if (processingError)
  {
    if (!v9)
      goto LABEL_15;
    -[MXProcessingError mergeFrom:](processingError, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    -[MXClientBoundFrame setProcessingError:](self, "setProcessingError:");
  }
  v5 = v18;
LABEL_15:
  asrResult = self->_asrResult;
  v11 = v5[1];
  if (asrResult)
  {
    if (!v11)
      goto LABEL_21;
    -[MXASRResult mergeFrom:](asrResult, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_21;
    -[MXClientBoundFrame setAsrResult:](self, "setAsrResult:");
  }
  v5 = v18;
LABEL_21:
  speechProfileRebuildNeeded = self->_speechProfileRebuildNeeded;
  v13 = v5[6];
  if (speechProfileRebuildNeeded)
  {
    if (!v13)
      goto LABEL_27;
    -[MXSpeechProfileRebuildNeeded mergeFrom:](speechProfileRebuildNeeded, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_27;
    -[MXClientBoundFrame setSpeechProfileRebuildNeeded:](self, "setSpeechProfileRebuildNeeded:");
  }
  v5 = v18;
LABEL_27:
  requestMitigated = self->_requestMitigated;
  v15 = v5[5];
  if (requestMitigated)
  {
    if (!v15)
      goto LABEL_33;
    -[MXRequestMitigated mergeFrom:](requestMitigated, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_33;
    -[MXClientBoundFrame setRequestMitigated:](self, "setRequestMitigated:");
  }
  v5 = v18;
LABEL_33:
  speechProfileResponse = self->_speechProfileResponse;
  v17 = v5[7];
  if (speechProfileResponse)
  {
    if (v17)
    {
      -[MXSpeechProfileBuildResponse mergeFrom:](speechProfileResponse, "mergeFrom:");
LABEL_38:
      v5 = v18;
    }
  }
  else if (v17)
  {
    -[MXClientBoundFrame setSpeechProfileResponse:](self, "setSpeechProfileResponse:");
    goto LABEL_38;
  }

}

- (MXRequestComplete)requestComplete
{
  return self->_requestComplete;
}

- (MXProcessingError)processingError
{
  return self->_processingError;
}

- (MXASRResult)asrResult
{
  return self->_asrResult;
}

- (MXSpeechProfileRebuildNeeded)speechProfileRebuildNeeded
{
  return self->_speechProfileRebuildNeeded;
}

- (MXRequestMitigated)requestMitigated
{
  return self->_requestMitigated;
}

- (MXSpeechProfileBuildResponse)speechProfileResponse
{
  return self->_speechProfileResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechProfileResponse, 0);
  objc_storeStrong((id *)&self->_speechProfileRebuildNeeded, 0);
  objc_storeStrong((id *)&self->_requestMitigated, 0);
  objc_storeStrong((id *)&self->_requestComplete, 0);
  objc_storeStrong((id *)&self->_processingError, 0);
  objc_storeStrong((id *)&self->_asrResult, 0);
}

@end
