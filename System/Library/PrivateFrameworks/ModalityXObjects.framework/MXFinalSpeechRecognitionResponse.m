@implementation MXFinalSpeechRecognitionResponse

- (BOOL)hasSpeechId
{
  return self->_speechId != 0;
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (void)setReturnCode:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_returnCode = a3;
}

- (void)setHasReturnCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasReturnCode
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasReturnStr
{
  return self->_returnStr != 0;
}

- (BOOL)hasRecognitionResult
{
  return self->_recognitionResult != 0;
}

- (int)langProfileRecreateCodes
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_langProfileRecreateCodes;
  else
    return 0;
}

- (void)setLangProfileRecreateCodes:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_langProfileRecreateCodes = a3;
}

- (void)setHasLangProfileRecreateCodes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLangProfileRecreateCodes
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)langProfileRecreateCodesAsString:(int)a3
{
  if (a3 < 5)
    return off_2512EF6F0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLangProfileRecreateCodes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LANGUAGE_PROFILE_RECREATE_CODES_UNDEF")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LANGUAGE_PROFILE_OK")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LANGUAGE_PROFILE_REFRESH")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LANGUAGE_PROFILE_INCOMPATIBLE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LANGUAGE_PROFILE_CORRUPT")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasAudioAnalytics
{
  return self->_audioAnalytics != 0;
}

- (int)watermarkDetection
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_watermarkDetection;
  else
    return 0;
}

- (void)setWatermarkDetection:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_watermarkDetection = a3;
}

- (void)setHasWatermarkDetection:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWatermarkDetection
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)watermarkDetectionAsString:(int)a3
{
  if (a3 < 4)
    return off_2512EF718[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWatermarkDetection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WM_UNKNOWN_ENUM_VALUE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WM_NOT_CHECKED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WM_NOT_DETECTED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WM_DETECTED")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setWatermarkPeakAverage:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_watermarkPeakAverage = a3;
}

- (void)setHasWatermarkPeakAverage:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasWatermarkPeakAverage
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (BOOL)hasLatnnMitigatorResult
{
  return self->_latnnMitigatorResult != 0;
}

- (BOOL)hasRequestLocale
{
  return self->_requestLocale != 0;
}

- (void)setHasResult:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_hasResult = a3;
}

- (void)setHasHasResult:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasHasResult
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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
  v8.super_class = (Class)MXFinalSpeechRecognitionResponse;
  -[MXFinalSpeechRecognitionResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXFinalSpeechRecognitionResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *speechId;
  NSString *sessionId;
  void *v7;
  NSString *returnStr;
  MXRecognitionResult *recognitionResult;
  void *v10;
  uint64_t langProfileRecreateCodes;
  __CFString *v12;
  MXAudioAnalytics *audioAnalytics;
  void *v14;
  char has;
  uint64_t watermarkDetection;
  __CFString *v17;
  void *v18;
  NSString *language;
  MXLatnnMitigatorResult *latnnMitigatorResult;
  void *v21;
  NSString *requestLocale;
  void *v23;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  speechId = self->_speechId;
  if (speechId)
    objc_msgSend(v3, "setObject:forKey:", speechId, CFSTR("speech_id"));
  sessionId = self->_sessionId;
  if (sessionId)
    objc_msgSend(v4, "setObject:forKey:", sessionId, CFSTR("session_id"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_returnCode);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("return_code"));

  }
  returnStr = self->_returnStr;
  if (returnStr)
    objc_msgSend(v4, "setObject:forKey:", returnStr, CFSTR("return_str"));
  recognitionResult = self->_recognitionResult;
  if (recognitionResult)
  {
    -[MXRecognitionResult dictionaryRepresentation](recognitionResult, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("recognition_result"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    langProfileRecreateCodes = self->_langProfileRecreateCodes;
    if (langProfileRecreateCodes >= 5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_langProfileRecreateCodes);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_2512EF6F0[langProfileRecreateCodes];
    }
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("lang_profile_recreate_codes"));

  }
  audioAnalytics = self->_audioAnalytics;
  if (audioAnalytics)
  {
    -[MXAudioAnalytics dictionaryRepresentation](audioAnalytics, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("audio_analytics"));

  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    watermarkDetection = self->_watermarkDetection;
    if (watermarkDetection >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_watermarkDetection);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_2512EF718[watermarkDetection];
    }
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("watermark_detection"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_watermarkPeakAverage);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("watermark_peak_average"));

  }
  language = self->_language;
  if (language)
    objc_msgSend(v4, "setObject:forKey:", language, CFSTR("language"));
  latnnMitigatorResult = self->_latnnMitigatorResult;
  if (latnnMitigatorResult)
  {
    -[MXLatnnMitigatorResult dictionaryRepresentation](latnnMitigatorResult, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("latnn_mitigator_result"));

  }
  requestLocale = self->_requestLocale;
  if (requestLocale)
    objc_msgSend(v4, "setObject:forKey:", requestLocale, CFSTR("request_locale"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasResult);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("has_result"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MXFinalSpeechRecognitionResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_speechId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_sessionId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_returnStr)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_recognitionResult)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_audioAnalytics)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_latnnMitigatorResult)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_requestLocale)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_speechId)
  {
    objc_msgSend(v4, "setSpeechId:");
    v4 = v6;
  }
  if (self->_sessionId)
  {
    objc_msgSend(v6, "setSessionId:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_returnCode;
    *((_BYTE *)v4 + 104) |= 4u;
  }
  if (self->_returnStr)
  {
    objc_msgSend(v6, "setReturnStr:");
    v4 = v6;
  }
  if (self->_recognitionResult)
  {
    objc_msgSend(v6, "setRecognitionResult:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_langProfileRecreateCodes;
    *((_BYTE *)v4 + 104) |= 2u;
  }
  if (self->_audioAnalytics)
  {
    objc_msgSend(v6, "setAudioAnalytics:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v4 + 24) = self->_watermarkDetection;
    *((_BYTE *)v4 + 104) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_watermarkPeakAverage;
    *((_BYTE *)v4 + 104) |= 1u;
  }
  if (self->_language)
  {
    objc_msgSend(v6, "setLanguage:");
    v4 = v6;
  }
  if (self->_latnnMitigatorResult)
  {
    objc_msgSend(v6, "setLatnnMitigatorResult:");
    v4 = v6;
  }
  if (self->_requestLocale)
  {
    objc_msgSend(v6, "setRequestLocale:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_BYTE *)v4 + 100) = self->_hasResult;
    *((_BYTE *)v4 + 104) |= 0x10u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  char has;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_speechId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v6;

  v8 = -[NSString copyWithZone:](self->_sessionId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v8;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_returnCode;
    *(_BYTE *)(v5 + 104) |= 4u;
  }
  v10 = -[NSString copyWithZone:](self->_returnStr, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v10;

  v12 = -[MXRecognitionResult copyWithZone:](self->_recognitionResult, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_langProfileRecreateCodes;
    *(_BYTE *)(v5 + 104) |= 2u;
  }
  v14 = -[MXAudioAnalytics copyWithZone:](self->_audioAnalytics, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_watermarkDetection;
    *(_BYTE *)(v5 + 104) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_watermarkPeakAverage;
    *(_BYTE *)(v5 + 104) |= 1u;
  }
  v17 = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v17;

  v19 = -[MXLatnnMitigatorResult copyWithZone:](self->_latnnMitigatorResult, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v19;

  v21 = -[NSString copyWithZone:](self->_requestLocale, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v21;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 100) = self->_hasResult;
    *(_BYTE *)(v5 + 104) |= 0x10u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *speechId;
  NSString *sessionId;
  NSString *returnStr;
  MXRecognitionResult *recognitionResult;
  char has;
  MXAudioAnalytics *audioAnalytics;
  NSString *language;
  MXLatnnMitigatorResult *latnnMitigatorResult;
  NSString *requestLocale;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_41;
  speechId = self->_speechId;
  if ((unint64_t)speechId | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](speechId, "isEqual:"))
      goto LABEL_41;
  }
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](sessionId, "isEqual:"))
      goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 4) == 0 || self->_returnCode != *((_DWORD *)v4 + 16))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 104) & 4) != 0)
  {
    goto LABEL_41;
  }
  returnStr = self->_returnStr;
  if ((unint64_t)returnStr | *((_QWORD *)v4 + 9) && !-[NSString isEqual:](returnStr, "isEqual:"))
    goto LABEL_41;
  recognitionResult = self->_recognitionResult;
  if ((unint64_t)recognitionResult | *((_QWORD *)v4 + 6))
  {
    if (!-[MXRecognitionResult isEqual:](recognitionResult, "isEqual:"))
      goto LABEL_41;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 2) == 0 || self->_langProfileRecreateCodes != *((_DWORD *)v4 + 6))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 104) & 2) != 0)
  {
    goto LABEL_41;
  }
  audioAnalytics = self->_audioAnalytics;
  if ((unint64_t)audioAnalytics | *((_QWORD *)v4 + 2))
  {
    if (!-[MXAudioAnalytics isEqual:](audioAnalytics, "isEqual:"))
      goto LABEL_41;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 8) == 0 || self->_watermarkDetection != *((_DWORD *)v4 + 24))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 104) & 8) != 0)
  {
    goto LABEL_41;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 1) == 0 || self->_watermarkPeakAverage != *((double *)v4 + 1))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 104) & 1) != 0)
  {
    goto LABEL_41;
  }
  language = self->_language;
  if ((unint64_t)language | *((_QWORD *)v4 + 4) && !-[NSString isEqual:](language, "isEqual:"))
    goto LABEL_41;
  latnnMitigatorResult = self->_latnnMitigatorResult;
  if ((unint64_t)latnnMitigatorResult | *((_QWORD *)v4 + 5))
  {
    if (!-[MXLatnnMitigatorResult isEqual:](latnnMitigatorResult, "isEqual:"))
      goto LABEL_41;
  }
  requestLocale = self->_requestLocale;
  if ((unint64_t)requestLocale | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](requestLocale, "isEqual:"))
      goto LABEL_41;
  }
  v14 = (*((_BYTE *)v4 + 104) & 0x10) == 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 0x10) != 0)
    {
      if (self->_hasResult)
      {
        if (!*((_BYTE *)v4 + 100))
          goto LABEL_41;
      }
      else if (*((_BYTE *)v4 + 100))
      {
        goto LABEL_41;
      }
      v14 = 1;
      goto LABEL_42;
    }
LABEL_41:
    v14 = 0;
  }
LABEL_42:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  double watermarkPeakAverage;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  NSUInteger v12;
  unint64_t v13;
  NSUInteger v14;
  uint64_t v15;
  NSUInteger v17;
  uint64_t v18;
  NSUInteger v19;
  NSUInteger v20;

  v20 = -[NSString hash](self->_speechId, "hash");
  v19 = -[NSString hash](self->_sessionId, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v18 = 2654435761 * self->_returnCode;
  else
    v18 = 0;
  v17 = -[NSString hash](self->_returnStr, "hash");
  v3 = -[MXRecognitionResult hash](self->_recognitionResult, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_langProfileRecreateCodes;
  else
    v4 = 0;
  v5 = -[MXAudioAnalytics hash](self->_audioAnalytics, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v6 = 2654435761 * self->_watermarkDetection;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_9;
LABEL_14:
    v11 = 0;
    goto LABEL_17;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_14;
LABEL_9:
  watermarkPeakAverage = self->_watermarkPeakAverage;
  v8 = -watermarkPeakAverage;
  if (watermarkPeakAverage >= 0.0)
    v8 = self->_watermarkPeakAverage;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_17:
  v12 = -[NSString hash](self->_language, "hash");
  v13 = -[MXLatnnMitigatorResult hash](self->_latnnMitigatorResult, "hash");
  v14 = -[NSString hash](self->_requestLocale, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v15 = 2654435761 * self->_hasResult;
  else
    v15 = 0;
  return v19 ^ v20 ^ v18 ^ v17 ^ v3 ^ v4 ^ v5 ^ v6 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  MXRecognitionResult *recognitionResult;
  uint64_t v6;
  MXAudioAnalytics *audioAnalytics;
  uint64_t v8;
  char v9;
  MXLatnnMitigatorResult *latnnMitigatorResult;
  uint64_t v11;
  id v12;

  v4 = a3;
  v12 = v4;
  if (*((_QWORD *)v4 + 11))
  {
    -[MXFinalSpeechRecognitionResponse setSpeechId:](self, "setSpeechId:");
    v4 = v12;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[MXFinalSpeechRecognitionResponse setSessionId:](self, "setSessionId:");
    v4 = v12;
  }
  if ((*((_BYTE *)v4 + 104) & 4) != 0)
  {
    self->_returnCode = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[MXFinalSpeechRecognitionResponse setReturnStr:](self, "setReturnStr:");
    v4 = v12;
  }
  recognitionResult = self->_recognitionResult;
  v6 = *((_QWORD *)v4 + 6);
  if (recognitionResult)
  {
    if (!v6)
      goto LABEL_15;
    -[MXRecognitionResult mergeFrom:](recognitionResult, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_15;
    -[MXFinalSpeechRecognitionResponse setRecognitionResult:](self, "setRecognitionResult:");
  }
  v4 = v12;
LABEL_15:
  if ((*((_BYTE *)v4 + 104) & 2) != 0)
  {
    self->_langProfileRecreateCodes = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
  audioAnalytics = self->_audioAnalytics;
  v8 = *((_QWORD *)v4 + 2);
  if (audioAnalytics)
  {
    if (!v8)
      goto LABEL_23;
    -[MXAudioAnalytics mergeFrom:](audioAnalytics, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_23;
    -[MXFinalSpeechRecognitionResponse setAudioAnalytics:](self, "setAudioAnalytics:");
  }
  v4 = v12;
LABEL_23:
  v9 = *((_BYTE *)v4 + 104);
  if ((v9 & 8) != 0)
  {
    self->_watermarkDetection = *((_DWORD *)v4 + 24);
    *(_BYTE *)&self->_has |= 8u;
    v9 = *((_BYTE *)v4 + 104);
  }
  if ((v9 & 1) != 0)
  {
    self->_watermarkPeakAverage = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[MXFinalSpeechRecognitionResponse setLanguage:](self, "setLanguage:");
    v4 = v12;
  }
  latnnMitigatorResult = self->_latnnMitigatorResult;
  v11 = *((_QWORD *)v4 + 5);
  if (latnnMitigatorResult)
  {
    if (!v11)
      goto LABEL_35;
    -[MXLatnnMitigatorResult mergeFrom:](latnnMitigatorResult, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_35;
    -[MXFinalSpeechRecognitionResponse setLatnnMitigatorResult:](self, "setLatnnMitigatorResult:");
  }
  v4 = v12;
LABEL_35:
  if (*((_QWORD *)v4 + 7))
  {
    -[MXFinalSpeechRecognitionResponse setRequestLocale:](self, "setRequestLocale:");
    v4 = v12;
  }
  if ((*((_BYTE *)v4 + 104) & 0x10) != 0)
  {
    self->_hasResult = *((_BYTE *)v4 + 100);
    *(_BYTE *)&self->_has |= 0x10u;
  }

}

- (NSString)speechId
{
  return self->_speechId;
}

- (void)setSpeechId:(id)a3
{
  objc_storeStrong((id *)&self->_speechId, a3);
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionId, a3);
}

- (int)returnCode
{
  return self->_returnCode;
}

- (NSString)returnStr
{
  return self->_returnStr;
}

- (void)setReturnStr:(id)a3
{
  objc_storeStrong((id *)&self->_returnStr, a3);
}

- (MXRecognitionResult)recognitionResult
{
  return self->_recognitionResult;
}

- (void)setRecognitionResult:(id)a3
{
  objc_storeStrong((id *)&self->_recognitionResult, a3);
}

- (MXAudioAnalytics)audioAnalytics
{
  return self->_audioAnalytics;
}

- (void)setAudioAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_audioAnalytics, a3);
}

- (double)watermarkPeakAverage
{
  return self->_watermarkPeakAverage;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (MXLatnnMitigatorResult)latnnMitigatorResult
{
  return self->_latnnMitigatorResult;
}

- (void)setLatnnMitigatorResult:(id)a3
{
  objc_storeStrong((id *)&self->_latnnMitigatorResult, a3);
}

- (NSString)requestLocale
{
  return self->_requestLocale;
}

- (void)setRequestLocale:(id)a3
{
  objc_storeStrong((id *)&self->_requestLocale, a3);
}

- (BOOL)hasResult
{
  return self->_hasResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechId, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_returnStr, 0);
  objc_storeStrong((id *)&self->_requestLocale, 0);
  objc_storeStrong((id *)&self->_recognitionResult, 0);
  objc_storeStrong((id *)&self->_latnnMitigatorResult, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_audioAnalytics, 0);
}

@end
