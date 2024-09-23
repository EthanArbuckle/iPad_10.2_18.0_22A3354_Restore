@implementation MXRecognitionCandidate

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
  *(_BYTE *)&self->_has |= 8u;
  self->_returnCode = a3;
}

- (void)setHasReturnCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasReturnCode
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasReturnStr
{
  return self->_returnStr != 0;
}

- (BOOL)hasRecognitionResult
{
  return self->_recognitionResult != 0;
}

- (BOOL)hasResultId
{
  return self->_resultId != 0;
}

- (void)setSnr:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_snr = a3;
}

- (void)setHasSnr:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSnr
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)fingerprintDetection
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_fingerprintDetection;
  else
    return 0;
}

- (void)setFingerprintDetection:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_fingerprintDetection = a3;
}

- (void)setHasFingerprintDetection:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFingerprintDetection
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)fingerprintDetectionAsString:(int)a3
{
  if (a3 < 4)
    return off_2512EF758[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFingerprintDetection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FP_UNKNOWN_ENUM_VALUE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FP_NOT_CHECKED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FP_NOT_DETECTED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FP_DETECTED")))
  {
    v4 = 3;
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
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_watermarkDetection;
  else
    return 0;
}

- (void)setWatermarkDetection:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_watermarkDetection = a3;
}

- (void)setHasWatermarkDetection:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasWatermarkDetection
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)watermarkDetectionAsString:(int)a3
{
  if (a3 < 4)
    return off_2512EF778[a3];
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
  *(_BYTE *)&self->_has |= 2u;
  self->_watermarkPeakAverage = a3;
}

- (void)setHasWatermarkPeakAverage:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWatermarkPeakAverage
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)MXRecognitionCandidate;
  -[MXRecognitionCandidate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXRecognitionCandidate dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *resultId;
  char has;
  void *v13;
  uint64_t fingerprintDetection;
  __CFString *v15;
  MXAudioAnalytics *audioAnalytics;
  void *v17;
  char v18;
  uint64_t watermarkDetection;
  __CFString *v20;
  void *v21;
  NSString *language;
  MXLatnnMitigatorResult *latnnMitigatorResult;
  void *v24;
  NSString *requestLocale;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  speechId = self->_speechId;
  if (speechId)
    objc_msgSend(v3, "setObject:forKey:", speechId, CFSTR("speech_id"));
  sessionId = self->_sessionId;
  if (sessionId)
    objc_msgSend(v4, "setObject:forKey:", sessionId, CFSTR("session_id"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
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
  resultId = self->_resultId;
  if (resultId)
    objc_msgSend(v4, "setObject:forKey:", resultId, CFSTR("result_id"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_snr);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("snr"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    fingerprintDetection = self->_fingerprintDetection;
    if (fingerprintDetection >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_fingerprintDetection);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_2512EF758[fingerprintDetection];
    }
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("fingerprint_detection"));

  }
  audioAnalytics = self->_audioAnalytics;
  if (audioAnalytics)
  {
    -[MXAudioAnalytics dictionaryRepresentation](audioAnalytics, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("audio_analytics"));

  }
  v18 = (char)self->_has;
  if ((v18 & 0x10) != 0)
  {
    watermarkDetection = self->_watermarkDetection;
    if (watermarkDetection >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_watermarkDetection);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_2512EF778[watermarkDetection];
    }
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("watermark_detection"));

    v18 = (char)self->_has;
  }
  if ((v18 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_watermarkPeakAverage);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("watermark_peak_average"));

  }
  language = self->_language;
  if (language)
    objc_msgSend(v4, "setObject:forKey:", language, CFSTR("language"));
  latnnMitigatorResult = self->_latnnMitigatorResult;
  if (latnnMitigatorResult)
  {
    -[MXLatnnMitigatorResult dictionaryRepresentation](latnnMitigatorResult, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("latnn_mitigator_result"));

  }
  requestLocale = self->_requestLocale;
  if (requestLocale)
    objc_msgSend(v4, "setObject:forKey:", requestLocale, CFSTR("request_locale"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MXRecognitionCandidateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_speechId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_sessionId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
  if (self->_returnStr)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_recognitionResult)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_resultId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
  if (self->_audioAnalytics)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
    v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v7;
  }
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_latnnMitigatorResult)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_requestLocale)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_speechId)
  {
    objc_msgSend(v4, "setSpeechId:");
    v4 = v7;
  }
  if (self->_sessionId)
  {
    objc_msgSend(v7, "setSessionId:");
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_returnCode;
    *((_BYTE *)v4 + 116) |= 8u;
  }
  if (self->_returnStr)
  {
    objc_msgSend(v7, "setReturnStr:");
    v4 = v7;
  }
  if (self->_recognitionResult)
  {
    objc_msgSend(v7, "setRecognitionResult:");
    v4 = v7;
  }
  if (self->_resultId)
  {
    objc_msgSend(v7, "setResultId:");
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_snr;
    *((_BYTE *)v4 + 116) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_fingerprintDetection;
    *((_BYTE *)v4 + 116) |= 4u;
  }
  if (self->_audioAnalytics)
  {
    objc_msgSend(v7, "setAudioAnalytics:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)v4 + 28) = self->_watermarkDetection;
    *((_BYTE *)v4 + 116) |= 0x10u;
    v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_watermarkPeakAverage;
    *((_BYTE *)v4 + 116) |= 2u;
  }
  if (self->_language)
  {
    objc_msgSend(v7, "setLanguage:");
    v4 = v7;
  }
  if (self->_latnnMitigatorResult)
  {
    objc_msgSend(v7, "setLatnnMitigatorResult:");
    v4 = v7;
  }
  if (self->_requestLocale)
  {
    objc_msgSend(v7, "setRequestLocale:");
    v4 = v7;
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
  uint64_t v14;
  void *v15;
  char has;
  id v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_speechId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v6;

  v8 = -[NSString copyWithZone:](self->_sessionId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v8;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_returnCode;
    *(_BYTE *)(v5 + 116) |= 8u;
  }
  v10 = -[NSString copyWithZone:](self->_returnStr, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v10;

  v12 = -[MXRecognitionResult copyWithZone:](self->_recognitionResult, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  v14 = -[NSString copyWithZone:](self->_resultId, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v14;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_snr;
    *(_BYTE *)(v5 + 116) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_fingerprintDetection;
    *(_BYTE *)(v5 + 116) |= 4u;
  }
  v17 = -[MXAudioAnalytics copyWithZone:](self->_audioAnalytics, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v17;

  v19 = (char)self->_has;
  if ((v19 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 112) = self->_watermarkDetection;
    *(_BYTE *)(v5 + 116) |= 0x10u;
    v19 = (char)self->_has;
  }
  if ((v19 & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_watermarkPeakAverage;
    *(_BYTE *)(v5 + 116) |= 2u;
  }
  v20 = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v20;

  v22 = -[MXLatnnMitigatorResult copyWithZone:](self->_latnnMitigatorResult, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v22;

  v24 = -[NSString copyWithZone:](self->_requestLocale, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v24;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *speechId;
  NSString *sessionId;
  NSString *returnStr;
  MXRecognitionResult *recognitionResult;
  NSString *resultId;
  char has;
  MXAudioAnalytics *audioAnalytics;
  NSString *language;
  MXLatnnMitigatorResult *latnnMitigatorResult;
  NSString *requestLocale;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_46;
  speechId = self->_speechId;
  if ((unint64_t)speechId | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](speechId, "isEqual:"))
      goto LABEL_46;
  }
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](sessionId, "isEqual:"))
      goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 8) == 0 || self->_returnCode != *((_DWORD *)v4 + 20))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 116) & 8) != 0)
  {
    goto LABEL_46;
  }
  returnStr = self->_returnStr;
  if ((unint64_t)returnStr | *((_QWORD *)v4 + 11) && !-[NSString isEqual:](returnStr, "isEqual:"))
    goto LABEL_46;
  recognitionResult = self->_recognitionResult;
  if ((unint64_t)recognitionResult | *((_QWORD *)v4 + 7))
  {
    if (!-[MXRecognitionResult isEqual:](recognitionResult, "isEqual:"))
      goto LABEL_46;
  }
  resultId = self->_resultId;
  if ((unint64_t)resultId | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](resultId, "isEqual:"))
      goto LABEL_46;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 1) == 0 || self->_snr != *((double *)v4 + 1))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 116) & 1) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 4) == 0 || self->_fingerprintDetection != *((_DWORD *)v4 + 8))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 116) & 4) != 0)
  {
    goto LABEL_46;
  }
  audioAnalytics = self->_audioAnalytics;
  if ((unint64_t)audioAnalytics | *((_QWORD *)v4 + 3))
  {
    if (!-[MXAudioAnalytics isEqual:](audioAnalytics, "isEqual:"))
    {
LABEL_46:
      v15 = 0;
      goto LABEL_47;
    }
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 0x10) == 0 || self->_watermarkDetection != *((_DWORD *)v4 + 28))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 116) & 0x10) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 2) == 0 || self->_watermarkPeakAverage != *((double *)v4 + 2))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 116) & 2) != 0)
  {
    goto LABEL_46;
  }
  language = self->_language;
  if ((unint64_t)language | *((_QWORD *)v4 + 5) && !-[NSString isEqual:](language, "isEqual:"))
    goto LABEL_46;
  latnnMitigatorResult = self->_latnnMitigatorResult;
  if ((unint64_t)latnnMitigatorResult | *((_QWORD *)v4 + 6))
  {
    if (!-[MXLatnnMitigatorResult isEqual:](latnnMitigatorResult, "isEqual:"))
      goto LABEL_46;
  }
  requestLocale = self->_requestLocale;
  if ((unint64_t)requestLocale | *((_QWORD *)v4 + 8))
    v15 = -[NSString isEqual:](requestLocale, "isEqual:");
  else
    v15 = 1;
LABEL_47:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  NSUInteger v6;
  char has;
  unint64_t v8;
  double snr;
  double v10;
  long double v11;
  double v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  double watermarkPeakAverage;
  double v17;
  long double v18;
  double v19;
  unint64_t v20;
  NSUInteger v21;
  NSUInteger v22;
  unint64_t v23;
  NSUInteger v25;
  uint64_t v26;
  NSUInteger v27;

  v27 = -[NSString hash](self->_speechId, "hash");
  v25 = -[NSString hash](self->_sessionId, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v3 = 2654435761 * self->_returnCode;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_returnStr, "hash", v25);
  v5 = -[MXRecognitionResult hash](self->_recognitionResult, "hash");
  v6 = -[NSString hash](self->_resultId, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    snr = self->_snr;
    v10 = -snr;
    if (snr >= 0.0)
      v10 = self->_snr;
    v11 = floor(v10 + 0.5);
    v12 = (v10 - v11) * 1.84467441e19;
    v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0)
        v8 += (unint64_t)v12;
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    v8 = 0;
  }
  if ((has & 4) != 0)
    v13 = 2654435761 * self->_fingerprintDetection;
  else
    v13 = 0;
  v14 = -[MXAudioAnalytics hash](self->_audioAnalytics, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v15 = 2654435761 * self->_watermarkDetection;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_17;
LABEL_22:
    v20 = 0;
    goto LABEL_25;
  }
  v15 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_22;
LABEL_17:
  watermarkPeakAverage = self->_watermarkPeakAverage;
  v17 = -watermarkPeakAverage;
  if (watermarkPeakAverage >= 0.0)
    v17 = self->_watermarkPeakAverage;
  v18 = floor(v17 + 0.5);
  v19 = (v17 - v18) * 1.84467441e19;
  v20 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
  if (v19 >= 0.0)
  {
    if (v19 > 0.0)
      v20 += (unint64_t)v19;
  }
  else
  {
    v20 -= (unint64_t)fabs(v19);
  }
LABEL_25:
  v21 = v26 ^ v27 ^ v3 ^ v4 ^ v5 ^ v6 ^ v8 ^ v13 ^ v14 ^ v15 ^ v20;
  v22 = -[NSString hash](self->_language, "hash");
  v23 = v22 ^ -[MXLatnnMitigatorResult hash](self->_latnnMitigatorResult, "hash");
  return v21 ^ v23 ^ -[NSString hash](self->_requestLocale, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  MXRecognitionResult *recognitionResult;
  uint64_t v6;
  char v7;
  MXAudioAnalytics *audioAnalytics;
  uint64_t v9;
  char v10;
  MXLatnnMitigatorResult *latnnMitigatorResult;
  uint64_t v12;
  id v13;

  v4 = a3;
  v13 = v4;
  if (*((_QWORD *)v4 + 13))
  {
    -[MXRecognitionCandidate setSpeechId:](self, "setSpeechId:");
    v4 = v13;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[MXRecognitionCandidate setSessionId:](self, "setSessionId:");
    v4 = v13;
  }
  if ((*((_BYTE *)v4 + 116) & 8) != 0)
  {
    self->_returnCode = *((_DWORD *)v4 + 20);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[MXRecognitionCandidate setReturnStr:](self, "setReturnStr:");
    v4 = v13;
  }
  recognitionResult = self->_recognitionResult;
  v6 = *((_QWORD *)v4 + 7);
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
    -[MXRecognitionCandidate setRecognitionResult:](self, "setRecognitionResult:");
  }
  v4 = v13;
LABEL_15:
  if (*((_QWORD *)v4 + 9))
  {
    -[MXRecognitionCandidate setResultId:](self, "setResultId:");
    v4 = v13;
  }
  v7 = *((_BYTE *)v4 + 116);
  if ((v7 & 1) != 0)
  {
    self->_snr = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 116);
  }
  if ((v7 & 4) != 0)
  {
    self->_fingerprintDetection = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 4u;
  }
  audioAnalytics = self->_audioAnalytics;
  v9 = *((_QWORD *)v4 + 3);
  if (audioAnalytics)
  {
    if (!v9)
      goto LABEL_27;
    -[MXAudioAnalytics mergeFrom:](audioAnalytics, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_27;
    -[MXRecognitionCandidate setAudioAnalytics:](self, "setAudioAnalytics:");
  }
  v4 = v13;
LABEL_27:
  v10 = *((_BYTE *)v4 + 116);
  if ((v10 & 0x10) != 0)
  {
    self->_watermarkDetection = *((_DWORD *)v4 + 28);
    *(_BYTE *)&self->_has |= 0x10u;
    v10 = *((_BYTE *)v4 + 116);
  }
  if ((v10 & 2) != 0)
  {
    self->_watermarkPeakAverage = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[MXRecognitionCandidate setLanguage:](self, "setLanguage:");
    v4 = v13;
  }
  latnnMitigatorResult = self->_latnnMitigatorResult;
  v12 = *((_QWORD *)v4 + 6);
  if (latnnMitigatorResult)
  {
    if (!v12)
      goto LABEL_39;
    -[MXLatnnMitigatorResult mergeFrom:](latnnMitigatorResult, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_39;
    -[MXRecognitionCandidate setLatnnMitigatorResult:](self, "setLatnnMitigatorResult:");
  }
  v4 = v13;
LABEL_39:
  if (*((_QWORD *)v4 + 8))
  {
    -[MXRecognitionCandidate setRequestLocale:](self, "setRequestLocale:");
    v4 = v13;
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

- (NSString)resultId
{
  return self->_resultId;
}

- (void)setResultId:(id)a3
{
  objc_storeStrong((id *)&self->_resultId, a3);
}

- (double)snr
{
  return self->_snr;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechId, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_returnStr, 0);
  objc_storeStrong((id *)&self->_resultId, 0);
  objc_storeStrong((id *)&self->_requestLocale, 0);
  objc_storeStrong((id *)&self->_recognitionResult, 0);
  objc_storeStrong((id *)&self->_latnnMitigatorResult, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_audioAnalytics, 0);
}

@end
