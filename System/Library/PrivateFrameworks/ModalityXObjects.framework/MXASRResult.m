@implementation MXASRResult

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (BOOL)hasRecognitionCandidate
{
  return self->_recognitionCandidate != 0;
}

- (void)setRecognitionCandidate:(id)a3
{
  MXRecognitionCandidate *v4;
  MXRecognitionCandidate *recognitionCandidate;

  v4 = (MXRecognitionCandidate *)a3;
  -[MXASRResult clearOneofValuesForPayload](self, "clearOneofValuesForPayload");
  *(_BYTE *)&self->_has |= 1u;
  self->_payload = 1;
  recognitionCandidate = self->_recognitionCandidate;
  self->_recognitionCandidate = v4;

}

- (BOOL)hasFinalSpeechRecognitionResponse
{
  return self->_finalSpeechRecognitionResponse != 0;
}

- (void)setFinalSpeechRecognitionResponse:(id)a3
{
  MXFinalSpeechRecognitionResponse *v4;
  MXFinalSpeechRecognitionResponse *finalSpeechRecognitionResponse;

  v4 = (MXFinalSpeechRecognitionResponse *)a3;
  -[MXASRResult clearOneofValuesForPayload](self, "clearOneofValuesForPayload");
  *(_BYTE *)&self->_has |= 1u;
  self->_payload = 2;
  finalSpeechRecognitionResponse = self->_finalSpeechRecognitionResponse;
  self->_finalSpeechRecognitionResponse = v4;

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
  if (a3 < 3)
    return off_2512EFAC0[a3];
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
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("recognition_candidate")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("final_speech_recognition_response")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForPayload
{
  MXRecognitionCandidate *recognitionCandidate;
  MXFinalSpeechRecognitionResponse *finalSpeechRecognitionResponse;

  *(_BYTE *)&self->_has &= ~1u;
  self->_payload = 0;
  recognitionCandidate = self->_recognitionCandidate;
  self->_recognitionCandidate = 0;

  finalSpeechRecognitionResponse = self->_finalSpeechRecognitionResponse;
  self->_finalSpeechRecognitionResponse = 0;

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
  v8.super_class = (Class)MXASRResult;
  -[MXASRResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXASRResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *requestId;
  MXRecognitionCandidate *recognitionCandidate;
  void *v7;
  MXFinalSpeechRecognitionResponse *finalSpeechRecognitionResponse;
  void *v9;
  uint64_t payload;
  __CFString *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  requestId = self->_requestId;
  if (requestId)
    objc_msgSend(v3, "setObject:forKey:", requestId, CFSTR("request_id"));
  recognitionCandidate = self->_recognitionCandidate;
  if (recognitionCandidate)
  {
    -[MXRecognitionCandidate dictionaryRepresentation](recognitionCandidate, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("recognition_candidate"));

  }
  finalSpeechRecognitionResponse = self->_finalSpeechRecognitionResponse;
  if (finalSpeechRecognitionResponse)
  {
    -[MXFinalSpeechRecognitionResponse dictionaryRepresentation](finalSpeechRecognitionResponse, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("final_speech_recognition_response"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    payload = self->_payload;
    if (payload >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_payload);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_2512EFAC0[payload];
    }
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("payload"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MXASRResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_requestId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_recognitionCandidate)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_finalSpeechRecognitionResponse)
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
    *((_BYTE *)v4 + 40) |= 1u;
  }
  v5 = v4;
  if (self->_requestId)
  {
    objc_msgSend(v4, "setRequestId:");
    v4 = v5;
  }
  if (self->_recognitionCandidate)
  {
    objc_msgSend(v5, "setRecognitionCandidate:");
    v4 = v5;
  }
  if (self->_finalSpeechRecognitionResponse)
  {
    objc_msgSend(v5, "setFinalSpeechRecognitionResponse:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_payload;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_requestId, "copyWithZone:", a3);
  v8 = (void *)v6[4];
  v6[4] = v7;

  v9 = -[MXRecognitionCandidate copyWithZone:](self->_recognitionCandidate, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  v11 = -[MXFinalSpeechRecognitionResponse copyWithZone:](self->_finalSpeechRecognitionResponse, "copyWithZone:", a3);
  v12 = (void *)v6[1];
  v6[1] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *requestId;
  MXRecognitionCandidate *recognitionCandidate;
  MXFinalSpeechRecognitionResponse *finalSpeechRecognitionResponse;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_payload != *((_DWORD *)v4 + 4))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  requestId = self->_requestId;
  if ((unint64_t)requestId | *((_QWORD *)v4 + 4) && !-[NSString isEqual:](requestId, "isEqual:"))
    goto LABEL_13;
  recognitionCandidate = self->_recognitionCandidate;
  if ((unint64_t)recognitionCandidate | *((_QWORD *)v4 + 3))
  {
    if (!-[MXRecognitionCandidate isEqual:](recognitionCandidate, "isEqual:"))
      goto LABEL_13;
  }
  finalSpeechRecognitionResponse = self->_finalSpeechRecognitionResponse;
  if ((unint64_t)finalSpeechRecognitionResponse | *((_QWORD *)v4 + 1))
    v8 = -[MXFinalSpeechRecognitionResponse isEqual:](finalSpeechRecognitionResponse, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_payload;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_requestId, "hash") ^ v3;
  v5 = -[MXRecognitionCandidate hash](self->_recognitionCandidate, "hash");
  return v4 ^ v5 ^ -[MXFinalSpeechRecognitionResponse hash](self->_finalSpeechRecognitionResponse, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  MXRecognitionCandidate *recognitionCandidate;
  uint64_t v7;
  MXFinalSpeechRecognitionResponse *finalSpeechRecognitionResponse;
  uint64_t v9;
  _QWORD *v10;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_payload = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  v10 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[MXASRResult setRequestId:](self, "setRequestId:");
    v5 = v10;
  }
  recognitionCandidate = self->_recognitionCandidate;
  v7 = v5[3];
  if (recognitionCandidate)
  {
    if (!v7)
      goto LABEL_11;
    -[MXRecognitionCandidate mergeFrom:](recognitionCandidate, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_11;
    -[MXASRResult setRecognitionCandidate:](self, "setRecognitionCandidate:");
  }
  v5 = v10;
LABEL_11:
  finalSpeechRecognitionResponse = self->_finalSpeechRecognitionResponse;
  v9 = v5[1];
  if (finalSpeechRecognitionResponse)
  {
    if (v9)
    {
      -[MXFinalSpeechRecognitionResponse mergeFrom:](finalSpeechRecognitionResponse, "mergeFrom:");
LABEL_16:
      v5 = v10;
    }
  }
  else if (v9)
  {
    -[MXASRResult setFinalSpeechRecognitionResponse:](self, "setFinalSpeechRecognitionResponse:");
    goto LABEL_16;
  }

}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (MXRecognitionCandidate)recognitionCandidate
{
  return self->_recognitionCandidate;
}

- (MXFinalSpeechRecognitionResponse)finalSpeechRecognitionResponse
{
  return self->_finalSpeechRecognitionResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_recognitionCandidate, 0);
  objc_storeStrong((id *)&self->_finalSpeechRecognitionResponse, 0);
}

@end
