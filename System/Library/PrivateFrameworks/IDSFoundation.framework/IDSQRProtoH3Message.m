@implementation IDSQRProtoH3Message

- (BOOL)hasAllocbindRequest
{
  return self->_allocbindRequest != 0;
}

- (void)setAllocbindRequest:(id)a3
{
  IDSQRProtoAllocBindRequest *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoAllocBindRequest *allocbindRequest;

  v4 = (IDSQRProtoAllocBindRequest *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 1;
  allocbindRequest = self->_allocbindRequest;
  self->_allocbindRequest = v4;

}

- (BOOL)hasAllocbindResponse
{
  return self->_allocbindResponse != 0;
}

- (void)setAllocbindResponse:(id)a3
{
  IDSQRProtoAllocBindResponse *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoAllocBindResponse *allocbindResponse;

  v4 = (IDSQRProtoAllocBindResponse *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 2;
  allocbindResponse = self->_allocbindResponse;
  self->_allocbindResponse = v4;

}

- (BOOL)hasDiagnosticIndication
{
  return self->_diagnosticIndication != 0;
}

- (void)setDiagnosticIndication:(id)a3
{
  IDSQRProtoDiagnosticIndication *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoDiagnosticIndication *diagnosticIndication;

  v4 = (IDSQRProtoDiagnosticIndication *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 3;
  diagnosticIndication = self->_diagnosticIndication;
  self->_diagnosticIndication = v4;

}

- (BOOL)hasGoawayIndication
{
  return self->_goawayIndication != 0;
}

- (void)setGoawayIndication:(id)a3
{
  IDSQRProtoGoAwayIndication *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoGoAwayIndication *goawayIndication;

  v4 = (IDSQRProtoGoAwayIndication *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 4;
  goawayIndication = self->_goawayIndication;
  self->_goawayIndication = v4;

}

- (BOOL)hasInfoRequest
{
  return self->_infoRequest != 0;
}

- (void)setInfoRequest:(id)a3
{
  IDSQRProtoInfoRequest *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoInfoRequest *infoRequest;

  v4 = (IDSQRProtoInfoRequest *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 5;
  infoRequest = self->_infoRequest;
  self->_infoRequest = v4;

}

- (BOOL)hasInfoResponse
{
  return self->_infoResponse != 0;
}

- (void)setInfoResponse:(id)a3
{
  IDSQRProtoInfoResponse *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoInfoResponse *infoResponse;

  v4 = (IDSQRProtoInfoResponse *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 6;
  infoResponse = self->_infoResponse;
  self->_infoResponse = v4;

}

- (BOOL)hasParticipantupdateRequest
{
  return self->_participantupdateRequest != 0;
}

- (void)setParticipantupdateRequest:(id)a3
{
  IDSQRProtoParticipantUpdateRequest *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoParticipantUpdateRequest *participantupdateRequest;

  v4 = (IDSQRProtoParticipantUpdateRequest *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 7;
  participantupdateRequest = self->_participantupdateRequest;
  self->_participantupdateRequest = v4;

}

- (BOOL)hasParticipantupdateResponse
{
  return self->_participantupdateResponse != 0;
}

- (void)setParticipantupdateResponse:(id)a3
{
  IDSQRProtoParticipantUpdateResponse *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoParticipantUpdateResponse *participantupdateResponse;

  v4 = (IDSQRProtoParticipantUpdateResponse *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 8;
  participantupdateResponse = self->_participantupdateResponse;
  self->_participantupdateResponse = v4;

}

- (BOOL)hasParticipantupdateIndication
{
  return self->_participantupdateIndication != 0;
}

- (void)setParticipantupdateIndication:(id)a3
{
  IDSQRProtoParticipantUpdateIndication *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoParticipantUpdateIndication *participantupdateIndication;

  v4 = (IDSQRProtoParticipantUpdateIndication *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 9;
  participantupdateIndication = self->_participantupdateIndication;
  self->_participantupdateIndication = v4;

}

- (BOOL)hasPlugincontrolRequest
{
  return self->_plugincontrolRequest != 0;
}

- (void)setPlugincontrolRequest:(id)a3
{
  IDSQRProtoPluginControlRequest *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoPluginControlRequest *plugincontrolRequest;

  v4 = (IDSQRProtoPluginControlRequest *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 10;
  plugincontrolRequest = self->_plugincontrolRequest;
  self->_plugincontrolRequest = v4;

}

- (BOOL)hasPlugincontrolResponse
{
  return self->_plugincontrolResponse != 0;
}

- (void)setPlugincontrolResponse:(id)a3
{
  IDSQRProtoPluginControlResponse *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoPluginControlResponse *plugincontrolResponse;

  v4 = (IDSQRProtoPluginControlResponse *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 11;
  plugincontrolResponse = self->_plugincontrolResponse;
  self->_plugincontrolResponse = v4;

}

- (BOOL)hasPlugincontrolIndication
{
  return self->_plugincontrolIndication != 0;
}

- (void)setPlugincontrolIndication:(id)a3
{
  IDSQRProtoPluginControlIndication *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoPluginControlIndication *plugincontrolIndication;

  v4 = (IDSQRProtoPluginControlIndication *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 12;
  plugincontrolIndication = self->_plugincontrolIndication;
  self->_plugincontrolIndication = v4;

}

- (BOOL)hasErrorIndication
{
  return self->_errorIndication != 0;
}

- (void)setErrorIndication:(id)a3
{
  IDSQRProtoErrorIndication *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoErrorIndication *errorIndication;

  v4 = (IDSQRProtoErrorIndication *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 13;
  errorIndication = self->_errorIndication;
  self->_errorIndication = v4;

}

- (BOOL)hasReallocateIndication
{
  return self->_reallocateIndication != 0;
}

- (void)setReallocateIndication:(id)a3
{
  IDSQRProtoReallocateIndication *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoReallocateIndication *reallocateIndication;

  v4 = (IDSQRProtoReallocateIndication *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 14;
  reallocateIndication = self->_reallocateIndication;
  self->_reallocateIndication = v4;

}

- (BOOL)hasSessioninfoRequest
{
  return self->_sessioninfoRequest != 0;
}

- (void)setSessioninfoRequest:(id)a3
{
  IDSQRProtoSessionInfoRequest *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoSessionInfoRequest *sessioninfoRequest;

  v4 = (IDSQRProtoSessionInfoRequest *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 15;
  sessioninfoRequest = self->_sessioninfoRequest;
  self->_sessioninfoRequest = v4;

}

- (BOOL)hasSessioninfoResponse
{
  return self->_sessioninfoResponse != 0;
}

- (void)setSessioninfoResponse:(id)a3
{
  IDSQRProtoSessionInfoResponse *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoSessionInfoResponse *sessioninfoResponse;

  v4 = (IDSQRProtoSessionInfoResponse *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 16;
  sessioninfoResponse = self->_sessioninfoResponse;
  self->_sessioninfoResponse = v4;

}

- (BOOL)hasSessioninfoIndication
{
  return self->_sessioninfoIndication != 0;
}

- (void)setSessioninfoIndication:(id)a3
{
  IDSQRProtoSessionInfoIndication *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoSessionInfoIndication *sessioninfoIndication;

  v4 = (IDSQRProtoSessionInfoIndication *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 17;
  sessioninfoIndication = self->_sessioninfoIndication;
  self->_sessioninfoIndication = v4;

}

- (BOOL)hasStatsRequest
{
  return self->_statsRequest != 0;
}

- (void)setStatsRequest:(id)a3
{
  IDSQRProtoStatsRequest *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoStatsRequest *statsRequest;

  v4 = (IDSQRProtoStatsRequest *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 18;
  statsRequest = self->_statsRequest;
  self->_statsRequest = v4;

}

- (BOOL)hasStatsResponse
{
  return self->_statsResponse != 0;
}

- (void)setStatsResponse:(id)a3
{
  IDSQRProtoStatsResponse *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoStatsResponse *statsResponse;

  v4 = (IDSQRProtoStatsResponse *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 19;
  statsResponse = self->_statsResponse;
  self->_statsResponse = v4;

}

- (BOOL)hasTestRequest
{
  return self->_testRequest != 0;
}

- (void)setTestRequest:(id)a3
{
  IDSQRProtoTestRequest *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoTestRequest *testRequest;

  v4 = (IDSQRProtoTestRequest *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 20;
  testRequest = self->_testRequest;
  self->_testRequest = v4;

}

- (BOOL)hasTestResponse
{
  return self->_testResponse != 0;
}

- (void)setTestResponse:(id)a3
{
  IDSQRProtoTestResponse *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoTestResponse *testResponse;

  v4 = (IDSQRProtoTestResponse *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 21;
  testResponse = self->_testResponse;
  self->_testResponse = v4;

}

- (BOOL)hasUnallocbindRequest
{
  return self->_unallocbindRequest != 0;
}

- (void)setUnallocbindRequest:(id)a3
{
  IDSQRProtoUnAllocBindRequest *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoUnAllocBindRequest *unallocbindRequest;

  v4 = (IDSQRProtoUnAllocBindRequest *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 22;
  unallocbindRequest = self->_unallocbindRequest;
  self->_unallocbindRequest = v4;

}

- (BOOL)hasUnallocbindResponse
{
  return self->_unallocbindResponse != 0;
}

- (void)setUnallocbindResponse:(id)a3
{
  IDSQRProtoUnAllocBindResponse *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoUnAllocBindResponse *unallocbindResponse;

  v4 = (IDSQRProtoUnAllocBindResponse *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 23;
  unallocbindResponse = self->_unallocbindResponse;
  self->_unallocbindResponse = v4;

}

- (BOOL)hasPutmaterialRequest
{
  return self->_putmaterialRequest != 0;
}

- (void)setPutmaterialRequest:(id)a3
{
  IDSQRProtoPutMaterialRequest *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoPutMaterialRequest *putmaterialRequest;

  v4 = (IDSQRProtoPutMaterialRequest *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 24;
  putmaterialRequest = self->_putmaterialRequest;
  self->_putmaterialRequest = v4;

}

- (BOOL)hasPutmaterialResponse
{
  return self->_putmaterialResponse != 0;
}

- (void)setPutmaterialResponse:(id)a3
{
  IDSQRProtoPutMaterialResponse *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoPutMaterialResponse *putmaterialResponse;

  v4 = (IDSQRProtoPutMaterialResponse *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 25;
  putmaterialResponse = self->_putmaterialResponse;
  self->_putmaterialResponse = v4;

}

- (BOOL)hasPutmaterialIndication
{
  return self->_putmaterialIndication != 0;
}

- (void)setPutmaterialIndication:(id)a3
{
  IDSQRProtoPutMaterialIndication *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoPutMaterialIndication *putmaterialIndication;

  v4 = (IDSQRProtoPutMaterialIndication *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 26;
  putmaterialIndication = self->_putmaterialIndication;
  self->_putmaterialIndication = v4;

}

- (BOOL)hasGetmaterialRequest
{
  return self->_getmaterialRequest != 0;
}

- (void)setGetmaterialRequest:(id)a3
{
  IDSQRProtoGetMaterialRequest *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoGetMaterialRequest *getmaterialRequest;

  v4 = (IDSQRProtoGetMaterialRequest *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 27;
  getmaterialRequest = self->_getmaterialRequest;
  self->_getmaterialRequest = v4;

}

- (BOOL)hasGetmaterialResponse
{
  return self->_getmaterialResponse != 0;
}

- (void)setGetmaterialResponse:(id)a3
{
  IDSQRProtoGetMaterialResponse *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoGetMaterialResponse *getmaterialResponse;

  v4 = (IDSQRProtoGetMaterialResponse *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 28;
  getmaterialResponse = self->_getmaterialResponse;
  self->_getmaterialResponse = v4;

}

- (BOOL)hasRegisterRequest
{
  return self->_registerRequest != 0;
}

- (void)setRegisterRequest:(id)a3
{
  IDSQRProtoH3EndToEndChannelRegisterRequest *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoH3EndToEndChannelRegisterRequest *registerRequest;

  v4 = (IDSQRProtoH3EndToEndChannelRegisterRequest *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 29;
  registerRequest = self->_registerRequest;
  self->_registerRequest = v4;

}

- (BOOL)hasRegisterResponse
{
  return self->_registerResponse != 0;
}

- (void)setRegisterResponse:(id)a3
{
  IDSQRProtoH3EndToEndChannelRegisterResponse *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoH3EndToEndChannelRegisterResponse *registerResponse;

  v4 = (IDSQRProtoH3EndToEndChannelRegisterResponse *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 30;
  registerResponse = self->_registerResponse;
  self->_registerResponse = v4;

}

- (BOOL)hasRegisterIndication
{
  return self->_registerIndication != 0;
}

- (void)setRegisterIndication:(id)a3
{
  IDSQRProtoH3EndToEndChannelRegisterIndication *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoH3EndToEndChannelRegisterIndication *registerIndication;

  v4 = (IDSQRProtoH3EndToEndChannelRegisterIndication *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 31;
  registerIndication = self->_registerIndication;
  self->_registerIndication = v4;

}

- (BOOL)hasRegisterAckRequest
{
  return self->_registerAckRequest != 0;
}

- (void)setRegisterAckRequest:(id)a3
{
  IDSQRProtoH3EndToEndChannelRegisterAckRequest *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoH3EndToEndChannelRegisterAckRequest *registerAckRequest;

  v4 = (IDSQRProtoH3EndToEndChannelRegisterAckRequest *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 32;
  registerAckRequest = self->_registerAckRequest;
  self->_registerAckRequest = v4;

}

- (BOOL)hasRegisterAckResponse
{
  return self->_registerAckResponse != 0;
}

- (void)setRegisterAckResponse:(id)a3
{
  IDSQRProtoH3EndToEndChannelRegisterAckResponse *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoH3EndToEndChannelRegisterAckResponse *registerAckResponse;

  v4 = (IDSQRProtoH3EndToEndChannelRegisterAckResponse *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 33;
  registerAckResponse = self->_registerAckResponse;
  self->_registerAckResponse = v4;

}

- (BOOL)hasUnregisterRequest
{
  return self->_unregisterRequest != 0;
}

- (void)setUnregisterRequest:(id)a3
{
  IDSQRProtoH3EndToEndChannelUnRegisterRequest *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoH3EndToEndChannelUnRegisterRequest *unregisterRequest;

  v4 = (IDSQRProtoH3EndToEndChannelUnRegisterRequest *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 34;
  unregisterRequest = self->_unregisterRequest;
  self->_unregisterRequest = v4;

}

- (BOOL)hasUnregisterResponse
{
  return self->_unregisterResponse != 0;
}

- (void)setUnregisterResponse:(id)a3
{
  IDSQRProtoH3EndToEndChannelUnRegisterResponse *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoH3EndToEndChannelUnRegisterResponse *unregisterResponse;

  v4 = (IDSQRProtoH3EndToEndChannelUnRegisterResponse *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 35;
  unregisterResponse = self->_unregisterResponse;
  self->_unregisterResponse = v4;

}

- (BOOL)hasUnregisterIndication
{
  return self->_unregisterIndication != 0;
}

- (void)setUnregisterIndication:(id)a3
{
  IDSQRProtoH3EndToEndChannelUnRegisterIndication *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSQRProtoH3EndToEndChannelUnRegisterIndication *unregisterIndication;

  v4 = (IDSQRProtoH3EndToEndChannelUnRegisterIndication *)a3;
  objc_msgSend_clearOneofValuesForInnerMessage(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = 36;
  unregisterIndication = self->_unregisterIndication;
  self->_unregisterIndication = v4;

}

- (int)innerMessage
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_innerMessage;
  else
    return 0;
}

- (void)setInnerMessage:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_innerMessage = a3;
}

- (void)setHasInnerMessage:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInnerMessage
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)innerMessageAsString:(int)a3
{
  double v3;

  if (a3 < 0x25)
    return off_1E3C20ED0[a3];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), v3, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsInnerMessage:(id)a3
{
  id v3;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  int v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;
  const char *v23;
  double v24;
  const char *v25;
  double v26;
  const char *v27;
  double v28;
  const char *v29;
  double v30;
  const char *v31;
  double v32;
  const char *v33;
  double v34;
  const char *v35;
  double v36;
  const char *v37;
  double v38;
  const char *v39;
  double v40;
  const char *v41;
  double v42;
  const char *v43;
  double v44;
  const char *v45;
  double v46;
  const char *v47;
  double v48;
  const char *v49;
  double v50;
  const char *v51;
  double v52;
  const char *v53;
  double v54;
  const char *v55;
  double v56;
  const char *v57;
  double v58;
  const char *v59;
  double v60;
  const char *v61;
  double v62;
  const char *v63;
  double v64;
  const char *v65;
  double v66;
  const char *v67;
  double v68;
  const char *v69;
  double v70;
  const char *v71;
  double v72;
  const char *v73;
  double v74;
  const char *v75;
  double v76;
  const char *v77;
  double v78;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("PBUNSET"), v5) & 1) != 0)
  {
    v8 = 0;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("allocbind_request"), v7) & 1) != 0)
  {
    v8 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("allocbind_response"), v10) & 1) != 0)
  {
    v8 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v11, (uint64_t)CFSTR("diagnostic_indication"), v12) & 1) != 0)
  {
    v8 = 3;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v13, (uint64_t)CFSTR("goaway_indication"), v14) & 1) != 0)
  {
    v8 = 4;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v15, (uint64_t)CFSTR("info_request"), v16) & 1) != 0)
  {
    v8 = 5;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v17, (uint64_t)CFSTR("info_response"), v18) & 1) != 0)
  {
    v8 = 6;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v19, (uint64_t)CFSTR("participantupdate_request"), v20) & 1) != 0)
  {
    v8 = 7;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v21, (uint64_t)CFSTR("participantupdate_response"), v22) & 1) != 0)
  {
    v8 = 8;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v23, (uint64_t)CFSTR("participantupdate_indication"), v24) & 1) != 0)
  {
    v8 = 9;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v25, (uint64_t)CFSTR("plugincontrol_request"), v26) & 1) != 0)
  {
    v8 = 10;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v27, (uint64_t)CFSTR("plugincontrol_response"), v28) & 1) != 0)
  {
    v8 = 11;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v29, (uint64_t)CFSTR("plugincontrol_indication"), v30) & 1) != 0)
  {
    v8 = 12;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v31, (uint64_t)CFSTR("error_indication"), v32) & 1) != 0)
  {
    v8 = 13;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v33, (uint64_t)CFSTR("reallocate_indication"), v34) & 1) != 0)
  {
    v8 = 14;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v35, (uint64_t)CFSTR("sessioninfo_request"), v36) & 1) != 0)
  {
    v8 = 15;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v37, (uint64_t)CFSTR("sessioninfo_response"), v38) & 1) != 0)
  {
    v8 = 16;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v39, (uint64_t)CFSTR("sessioninfo_indication"), v40) & 1) != 0)
  {
    v8 = 17;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v41, (uint64_t)CFSTR("stats_request"), v42) & 1) != 0)
  {
    v8 = 18;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v43, (uint64_t)CFSTR("stats_response"), v44) & 1) != 0)
  {
    v8 = 19;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v45, (uint64_t)CFSTR("test_request"), v46) & 1) != 0)
  {
    v8 = 20;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v47, (uint64_t)CFSTR("test_response"), v48) & 1) != 0)
  {
    v8 = 21;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v49, (uint64_t)CFSTR("unallocbind_request"), v50) & 1) != 0)
  {
    v8 = 22;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v51, (uint64_t)CFSTR("unallocbind_response"), v52) & 1) != 0)
  {
    v8 = 23;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v53, (uint64_t)CFSTR("putmaterial_request"), v54) & 1) != 0)
  {
    v8 = 24;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v55, (uint64_t)CFSTR("putmaterial_response"), v56) & 1) != 0)
  {
    v8 = 25;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v57, (uint64_t)CFSTR("putmaterial_indication"), v58) & 1) != 0)
  {
    v8 = 26;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v59, (uint64_t)CFSTR("getmaterial_request"), v60) & 1) != 0)
  {
    v8 = 27;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v61, (uint64_t)CFSTR("getmaterial_response"), v62) & 1) != 0)
  {
    v8 = 28;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v63, (uint64_t)CFSTR("register_request"), v64) & 1) != 0)
  {
    v8 = 29;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v65, (uint64_t)CFSTR("register_response"), v66) & 1) != 0)
  {
    v8 = 30;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v67, (uint64_t)CFSTR("register_indication"), v68) & 1) != 0)
  {
    v8 = 31;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v69, (uint64_t)CFSTR("registerAck_request"), v70) & 1) != 0)
  {
    v8 = 32;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v71, (uint64_t)CFSTR("registerAck_response"), v72) & 1) != 0)
  {
    v8 = 33;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v73, (uint64_t)CFSTR("unregister_request"), v74) & 1) != 0)
  {
    v8 = 34;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v75, (uint64_t)CFSTR("unregister_response"), v76) & 1) != 0)
  {
    v8 = 35;
  }
  else if (objc_msgSend_isEqualToString_(v3, v77, (uint64_t)CFSTR("unregister_indication"), v78))
  {
    v8 = 36;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)clearOneofValuesForInnerMessage
{
  IDSQRProtoAllocBindRequest *allocbindRequest;
  IDSQRProtoAllocBindResponse *allocbindResponse;
  IDSQRProtoDiagnosticIndication *diagnosticIndication;
  IDSQRProtoGoAwayIndication *goawayIndication;
  IDSQRProtoInfoRequest *infoRequest;
  IDSQRProtoInfoResponse *infoResponse;
  IDSQRProtoParticipantUpdateRequest *participantupdateRequest;
  IDSQRProtoParticipantUpdateResponse *participantupdateResponse;
  IDSQRProtoParticipantUpdateIndication *participantupdateIndication;
  IDSQRProtoPluginControlRequest *plugincontrolRequest;
  IDSQRProtoPluginControlResponse *plugincontrolResponse;
  IDSQRProtoPluginControlIndication *plugincontrolIndication;
  IDSQRProtoErrorIndication *errorIndication;
  IDSQRProtoReallocateIndication *reallocateIndication;
  IDSQRProtoSessionInfoRequest *sessioninfoRequest;
  IDSQRProtoSessionInfoResponse *sessioninfoResponse;
  IDSQRProtoSessionInfoIndication *sessioninfoIndication;
  IDSQRProtoStatsRequest *statsRequest;
  IDSQRProtoStatsResponse *statsResponse;
  IDSQRProtoTestRequest *testRequest;
  IDSQRProtoTestResponse *testResponse;
  IDSQRProtoUnAllocBindRequest *unallocbindRequest;
  IDSQRProtoUnAllocBindResponse *unallocbindResponse;
  IDSQRProtoPutMaterialRequest *putmaterialRequest;
  IDSQRProtoPutMaterialResponse *putmaterialResponse;
  IDSQRProtoPutMaterialIndication *putmaterialIndication;
  IDSQRProtoGetMaterialRequest *getmaterialRequest;
  IDSQRProtoGetMaterialResponse *getmaterialResponse;
  IDSQRProtoH3EndToEndChannelRegisterRequest *registerRequest;
  IDSQRProtoH3EndToEndChannelRegisterResponse *registerResponse;
  IDSQRProtoH3EndToEndChannelRegisterIndication *registerIndication;
  IDSQRProtoH3EndToEndChannelRegisterAckRequest *registerAckRequest;
  IDSQRProtoH3EndToEndChannelRegisterAckResponse *registerAckResponse;
  IDSQRProtoH3EndToEndChannelUnRegisterRequest *unregisterRequest;
  IDSQRProtoH3EndToEndChannelUnRegisterResponse *unregisterResponse;
  IDSQRProtoH3EndToEndChannelUnRegisterIndication *unregisterIndication;

  *(_BYTE *)&self->_has &= ~1u;
  self->_innerMessage = 0;
  allocbindRequest = self->_allocbindRequest;
  self->_allocbindRequest = 0;

  allocbindResponse = self->_allocbindResponse;
  self->_allocbindResponse = 0;

  diagnosticIndication = self->_diagnosticIndication;
  self->_diagnosticIndication = 0;

  goawayIndication = self->_goawayIndication;
  self->_goawayIndication = 0;

  infoRequest = self->_infoRequest;
  self->_infoRequest = 0;

  infoResponse = self->_infoResponse;
  self->_infoResponse = 0;

  participantupdateRequest = self->_participantupdateRequest;
  self->_participantupdateRequest = 0;

  participantupdateResponse = self->_participantupdateResponse;
  self->_participantupdateResponse = 0;

  participantupdateIndication = self->_participantupdateIndication;
  self->_participantupdateIndication = 0;

  plugincontrolRequest = self->_plugincontrolRequest;
  self->_plugincontrolRequest = 0;

  plugincontrolResponse = self->_plugincontrolResponse;
  self->_plugincontrolResponse = 0;

  plugincontrolIndication = self->_plugincontrolIndication;
  self->_plugincontrolIndication = 0;

  errorIndication = self->_errorIndication;
  self->_errorIndication = 0;

  reallocateIndication = self->_reallocateIndication;
  self->_reallocateIndication = 0;

  sessioninfoRequest = self->_sessioninfoRequest;
  self->_sessioninfoRequest = 0;

  sessioninfoResponse = self->_sessioninfoResponse;
  self->_sessioninfoResponse = 0;

  sessioninfoIndication = self->_sessioninfoIndication;
  self->_sessioninfoIndication = 0;

  statsRequest = self->_statsRequest;
  self->_statsRequest = 0;

  statsResponse = self->_statsResponse;
  self->_statsResponse = 0;

  testRequest = self->_testRequest;
  self->_testRequest = 0;

  testResponse = self->_testResponse;
  self->_testResponse = 0;

  unallocbindRequest = self->_unallocbindRequest;
  self->_unallocbindRequest = 0;

  unallocbindResponse = self->_unallocbindResponse;
  self->_unallocbindResponse = 0;

  putmaterialRequest = self->_putmaterialRequest;
  self->_putmaterialRequest = 0;

  putmaterialResponse = self->_putmaterialResponse;
  self->_putmaterialResponse = 0;

  putmaterialIndication = self->_putmaterialIndication;
  self->_putmaterialIndication = 0;

  getmaterialRequest = self->_getmaterialRequest;
  self->_getmaterialRequest = 0;

  getmaterialResponse = self->_getmaterialResponse;
  self->_getmaterialResponse = 0;

  registerRequest = self->_registerRequest;
  self->_registerRequest = 0;

  registerResponse = self->_registerResponse;
  self->_registerResponse = 0;

  registerIndication = self->_registerIndication;
  self->_registerIndication = 0;

  registerAckRequest = self->_registerAckRequest;
  self->_registerAckRequest = 0;

  registerAckResponse = self->_registerAckResponse;
  self->_registerAckResponse = 0;

  unregisterRequest = self->_unregisterRequest;
  self->_unregisterRequest = 0;

  unregisterResponse = self->_unregisterResponse;
  self->_unregisterResponse = 0;

  unregisterIndication = self->_unregisterIndication;
  self->_unregisterIndication = 0;

}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoH3Message;
  -[IDSQRProtoH3Message description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("%@ %@"), v10, v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  void *v7;
  double v8;
  IDSQRProtoAllocBindRequest *allocbindRequest;
  void *v10;
  const char *v11;
  double v12;
  IDSQRProtoAllocBindResponse *allocbindResponse;
  void *v14;
  const char *v15;
  double v16;
  IDSQRProtoDiagnosticIndication *diagnosticIndication;
  void *v18;
  const char *v19;
  double v20;
  IDSQRProtoGoAwayIndication *goawayIndication;
  void *v22;
  const char *v23;
  double v24;
  IDSQRProtoInfoRequest *infoRequest;
  void *v26;
  const char *v27;
  double v28;
  IDSQRProtoInfoResponse *infoResponse;
  void *v30;
  const char *v31;
  double v32;
  IDSQRProtoParticipantUpdateRequest *participantupdateRequest;
  void *v34;
  const char *v35;
  double v36;
  IDSQRProtoParticipantUpdateResponse *participantupdateResponse;
  void *v38;
  const char *v39;
  double v40;
  IDSQRProtoParticipantUpdateIndication *participantupdateIndication;
  void *v42;
  const char *v43;
  double v44;
  IDSQRProtoPluginControlRequest *plugincontrolRequest;
  void *v46;
  const char *v47;
  double v48;
  IDSQRProtoPluginControlResponse *plugincontrolResponse;
  void *v50;
  const char *v51;
  double v52;
  IDSQRProtoPluginControlIndication *plugincontrolIndication;
  void *v54;
  const char *v55;
  double v56;
  IDSQRProtoErrorIndication *errorIndication;
  void *v58;
  const char *v59;
  double v60;
  IDSQRProtoReallocateIndication *reallocateIndication;
  void *v62;
  const char *v63;
  double v64;
  IDSQRProtoSessionInfoRequest *sessioninfoRequest;
  void *v66;
  const char *v67;
  double v68;
  IDSQRProtoSessionInfoResponse *sessioninfoResponse;
  void *v70;
  const char *v71;
  double v72;
  IDSQRProtoSessionInfoIndication *sessioninfoIndication;
  void *v74;
  const char *v75;
  double v76;
  IDSQRProtoStatsRequest *statsRequest;
  void *v78;
  const char *v79;
  double v80;
  IDSQRProtoStatsResponse *statsResponse;
  void *v82;
  const char *v83;
  double v84;
  IDSQRProtoTestRequest *testRequest;
  void *v86;
  const char *v87;
  double v88;
  IDSQRProtoTestResponse *testResponse;
  void *v90;
  const char *v91;
  double v92;
  IDSQRProtoUnAllocBindRequest *unallocbindRequest;
  void *v94;
  const char *v95;
  double v96;
  IDSQRProtoUnAllocBindResponse *unallocbindResponse;
  void *v98;
  const char *v99;
  double v100;
  IDSQRProtoPutMaterialRequest *putmaterialRequest;
  void *v102;
  const char *v103;
  double v104;
  IDSQRProtoPutMaterialResponse *putmaterialResponse;
  void *v106;
  const char *v107;
  double v108;
  IDSQRProtoPutMaterialIndication *putmaterialIndication;
  void *v110;
  const char *v111;
  double v112;
  IDSQRProtoGetMaterialRequest *getmaterialRequest;
  void *v114;
  const char *v115;
  double v116;
  IDSQRProtoGetMaterialResponse *getmaterialResponse;
  void *v118;
  const char *v119;
  double v120;
  IDSQRProtoH3EndToEndChannelRegisterRequest *registerRequest;
  void *v122;
  const char *v123;
  double v124;
  IDSQRProtoH3EndToEndChannelRegisterResponse *registerResponse;
  void *v126;
  const char *v127;
  double v128;
  IDSQRProtoH3EndToEndChannelRegisterIndication *registerIndication;
  void *v130;
  const char *v131;
  double v132;
  IDSQRProtoH3EndToEndChannelRegisterAckRequest *registerAckRequest;
  void *v134;
  const char *v135;
  double v136;
  IDSQRProtoH3EndToEndChannelRegisterAckResponse *registerAckResponse;
  void *v138;
  const char *v139;
  double v140;
  IDSQRProtoH3EndToEndChannelUnRegisterRequest *unregisterRequest;
  void *v142;
  const char *v143;
  double v144;
  IDSQRProtoH3EndToEndChannelUnRegisterResponse *unregisterResponse;
  void *v146;
  const char *v147;
  double v148;
  IDSQRProtoH3EndToEndChannelUnRegisterIndication *unregisterIndication;
  void *v150;
  const char *v151;
  double v152;
  uint64_t innerMessage;
  __CFString *v154;
  id v155;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  allocbindRequest = self->_allocbindRequest;
  if (allocbindRequest)
  {
    objc_msgSend_dictionaryRepresentation(allocbindRequest, v5, v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v11, (uint64_t)v10, v12, CFSTR("allocbind_request"));

  }
  allocbindResponse = self->_allocbindResponse;
  if (allocbindResponse)
  {
    objc_msgSend_dictionaryRepresentation(allocbindResponse, v5, v6, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v15, (uint64_t)v14, v16, CFSTR("allocbind_response"));

  }
  diagnosticIndication = self->_diagnosticIndication;
  if (diagnosticIndication)
  {
    objc_msgSend_dictionaryRepresentation(diagnosticIndication, v5, v6, v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v19, (uint64_t)v18, v20, CFSTR("diagnostic_indication"));

  }
  goawayIndication = self->_goawayIndication;
  if (goawayIndication)
  {
    objc_msgSend_dictionaryRepresentation(goawayIndication, v5, v6, v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v23, (uint64_t)v22, v24, CFSTR("goaway_indication"));

  }
  infoRequest = self->_infoRequest;
  if (infoRequest)
  {
    objc_msgSend_dictionaryRepresentation(infoRequest, v5, v6, v8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v27, (uint64_t)v26, v28, CFSTR("info_request"));

  }
  infoResponse = self->_infoResponse;
  if (infoResponse)
  {
    objc_msgSend_dictionaryRepresentation(infoResponse, v5, v6, v8);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v31, (uint64_t)v30, v32, CFSTR("info_response"));

  }
  participantupdateRequest = self->_participantupdateRequest;
  if (participantupdateRequest)
  {
    objc_msgSend_dictionaryRepresentation(participantupdateRequest, v5, v6, v8);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v35, (uint64_t)v34, v36, CFSTR("participantupdate_request"));

  }
  participantupdateResponse = self->_participantupdateResponse;
  if (participantupdateResponse)
  {
    objc_msgSend_dictionaryRepresentation(participantupdateResponse, v5, v6, v8);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v39, (uint64_t)v38, v40, CFSTR("participantupdate_response"));

  }
  participantupdateIndication = self->_participantupdateIndication;
  if (participantupdateIndication)
  {
    objc_msgSend_dictionaryRepresentation(participantupdateIndication, v5, v6, v8);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v43, (uint64_t)v42, v44, CFSTR("participantupdate_indication"));

  }
  plugincontrolRequest = self->_plugincontrolRequest;
  if (plugincontrolRequest)
  {
    objc_msgSend_dictionaryRepresentation(plugincontrolRequest, v5, v6, v8);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v47, (uint64_t)v46, v48, CFSTR("plugincontrol_request"));

  }
  plugincontrolResponse = self->_plugincontrolResponse;
  if (plugincontrolResponse)
  {
    objc_msgSend_dictionaryRepresentation(plugincontrolResponse, v5, v6, v8);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v51, (uint64_t)v50, v52, CFSTR("plugincontrol_response"));

  }
  plugincontrolIndication = self->_plugincontrolIndication;
  if (plugincontrolIndication)
  {
    objc_msgSend_dictionaryRepresentation(plugincontrolIndication, v5, v6, v8);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v55, (uint64_t)v54, v56, CFSTR("plugincontrol_indication"));

  }
  errorIndication = self->_errorIndication;
  if (errorIndication)
  {
    objc_msgSend_dictionaryRepresentation(errorIndication, v5, v6, v8);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v59, (uint64_t)v58, v60, CFSTR("error_indication"));

  }
  reallocateIndication = self->_reallocateIndication;
  if (reallocateIndication)
  {
    objc_msgSend_dictionaryRepresentation(reallocateIndication, v5, v6, v8);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v63, (uint64_t)v62, v64, CFSTR("reallocate_indication"));

  }
  sessioninfoRequest = self->_sessioninfoRequest;
  if (sessioninfoRequest)
  {
    objc_msgSend_dictionaryRepresentation(sessioninfoRequest, v5, v6, v8);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v67, (uint64_t)v66, v68, CFSTR("sessioninfo_request"));

  }
  sessioninfoResponse = self->_sessioninfoResponse;
  if (sessioninfoResponse)
  {
    objc_msgSend_dictionaryRepresentation(sessioninfoResponse, v5, v6, v8);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v71, (uint64_t)v70, v72, CFSTR("sessioninfo_response"));

  }
  sessioninfoIndication = self->_sessioninfoIndication;
  if (sessioninfoIndication)
  {
    objc_msgSend_dictionaryRepresentation(sessioninfoIndication, v5, v6, v8);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v75, (uint64_t)v74, v76, CFSTR("sessioninfo_indication"));

  }
  statsRequest = self->_statsRequest;
  if (statsRequest)
  {
    objc_msgSend_dictionaryRepresentation(statsRequest, v5, v6, v8);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v79, (uint64_t)v78, v80, CFSTR("stats_request"));

  }
  statsResponse = self->_statsResponse;
  if (statsResponse)
  {
    objc_msgSend_dictionaryRepresentation(statsResponse, v5, v6, v8);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v83, (uint64_t)v82, v84, CFSTR("stats_response"));

  }
  testRequest = self->_testRequest;
  if (testRequest)
  {
    objc_msgSend_dictionaryRepresentation(testRequest, v5, v6, v8);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v87, (uint64_t)v86, v88, CFSTR("test_request"));

  }
  testResponse = self->_testResponse;
  if (testResponse)
  {
    objc_msgSend_dictionaryRepresentation(testResponse, v5, v6, v8);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v91, (uint64_t)v90, v92, CFSTR("test_response"));

  }
  unallocbindRequest = self->_unallocbindRequest;
  if (unallocbindRequest)
  {
    objc_msgSend_dictionaryRepresentation(unallocbindRequest, v5, v6, v8);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v95, (uint64_t)v94, v96, CFSTR("unallocbind_request"));

  }
  unallocbindResponse = self->_unallocbindResponse;
  if (unallocbindResponse)
  {
    objc_msgSend_dictionaryRepresentation(unallocbindResponse, v5, v6, v8);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v99, (uint64_t)v98, v100, CFSTR("unallocbind_response"));

  }
  putmaterialRequest = self->_putmaterialRequest;
  if (putmaterialRequest)
  {
    objc_msgSend_dictionaryRepresentation(putmaterialRequest, v5, v6, v8);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v103, (uint64_t)v102, v104, CFSTR("putmaterial_request"));

  }
  putmaterialResponse = self->_putmaterialResponse;
  if (putmaterialResponse)
  {
    objc_msgSend_dictionaryRepresentation(putmaterialResponse, v5, v6, v8);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v107, (uint64_t)v106, v108, CFSTR("putmaterial_response"));

  }
  putmaterialIndication = self->_putmaterialIndication;
  if (putmaterialIndication)
  {
    objc_msgSend_dictionaryRepresentation(putmaterialIndication, v5, v6, v8);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v111, (uint64_t)v110, v112, CFSTR("putmaterial_indication"));

  }
  getmaterialRequest = self->_getmaterialRequest;
  if (getmaterialRequest)
  {
    objc_msgSend_dictionaryRepresentation(getmaterialRequest, v5, v6, v8);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v115, (uint64_t)v114, v116, CFSTR("getmaterial_request"));

  }
  getmaterialResponse = self->_getmaterialResponse;
  if (getmaterialResponse)
  {
    objc_msgSend_dictionaryRepresentation(getmaterialResponse, v5, v6, v8);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v119, (uint64_t)v118, v120, CFSTR("getmaterial_response"));

  }
  registerRequest = self->_registerRequest;
  if (registerRequest)
  {
    objc_msgSend_dictionaryRepresentation(registerRequest, v5, v6, v8);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v123, (uint64_t)v122, v124, CFSTR("register_request"));

  }
  registerResponse = self->_registerResponse;
  if (registerResponse)
  {
    objc_msgSend_dictionaryRepresentation(registerResponse, v5, v6, v8);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v127, (uint64_t)v126, v128, CFSTR("register_response"));

  }
  registerIndication = self->_registerIndication;
  if (registerIndication)
  {
    objc_msgSend_dictionaryRepresentation(registerIndication, v5, v6, v8);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v131, (uint64_t)v130, v132, CFSTR("register_indication"));

  }
  registerAckRequest = self->_registerAckRequest;
  if (registerAckRequest)
  {
    objc_msgSend_dictionaryRepresentation(registerAckRequest, v5, v6, v8);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v135, (uint64_t)v134, v136, CFSTR("registerAck_request"));

  }
  registerAckResponse = self->_registerAckResponse;
  if (registerAckResponse)
  {
    objc_msgSend_dictionaryRepresentation(registerAckResponse, v5, v6, v8);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v139, (uint64_t)v138, v140, CFSTR("registerAck_response"));

  }
  unregisterRequest = self->_unregisterRequest;
  if (unregisterRequest)
  {
    objc_msgSend_dictionaryRepresentation(unregisterRequest, v5, v6, v8);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v143, (uint64_t)v142, v144, CFSTR("unregister_request"));

  }
  unregisterResponse = self->_unregisterResponse;
  if (unregisterResponse)
  {
    objc_msgSend_dictionaryRepresentation(unregisterResponse, v5, v6, v8);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v147, (uint64_t)v146, v148, CFSTR("unregister_response"));

  }
  unregisterIndication = self->_unregisterIndication;
  if (unregisterIndication)
  {
    objc_msgSend_dictionaryRepresentation(unregisterIndication, v5, v6, v8);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v151, (uint64_t)v150, v152, CFSTR("unregister_indication"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    innerMessage = self->_innerMessage;
    if (innerMessage >= 0x25)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), v8, self->_innerMessage);
      v154 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v154 = off_1E3C20ED0[innerMessage];
    }
    objc_msgSend_setObject_forKey_(v7, v5, (uint64_t)v154, v8, CFSTR("inner_message"));

  }
  v155 = v7;

  return v155;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return IDSQRProtoH3MessageReadFrom((uint64_t)self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_allocbindRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_allocbindResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_diagnosticIndication)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_goawayIndication)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_infoRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_infoResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_participantupdateRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_participantupdateResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_participantupdateIndication)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_plugincontrolRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_plugincontrolResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_plugincontrolIndication)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_errorIndication)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_reallocateIndication)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_sessioninfoRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_sessioninfoResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_sessioninfoIndication)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_statsRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_statsResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_testRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_testResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_unallocbindRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_unallocbindResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_putmaterialRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_putmaterialResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_putmaterialIndication)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_getmaterialRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_getmaterialResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_registerRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_registerResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_registerIndication)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_registerAckRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_registerAckResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_unregisterRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_unregisterResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_unregisterIndication)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  double v6;
  IDSQRProtoAllocBindRequest *allocbindRequest;
  IDSQRProtoAllocBindResponse *allocbindResponse;
  IDSQRProtoDiagnosticIndication *diagnosticIndication;
  IDSQRProtoGoAwayIndication *goawayIndication;
  IDSQRProtoInfoRequest *infoRequest;
  IDSQRProtoInfoResponse *infoResponse;
  IDSQRProtoParticipantUpdateRequest *participantupdateRequest;
  IDSQRProtoParticipantUpdateResponse *participantupdateResponse;
  IDSQRProtoParticipantUpdateIndication *participantupdateIndication;
  IDSQRProtoPluginControlRequest *plugincontrolRequest;
  IDSQRProtoPluginControlResponse *plugincontrolResponse;
  IDSQRProtoPluginControlIndication *plugincontrolIndication;
  IDSQRProtoErrorIndication *errorIndication;
  IDSQRProtoReallocateIndication *reallocateIndication;
  IDSQRProtoSessionInfoRequest *sessioninfoRequest;
  IDSQRProtoSessionInfoResponse *sessioninfoResponse;
  IDSQRProtoSessionInfoIndication *sessioninfoIndication;
  IDSQRProtoStatsRequest *statsRequest;
  IDSQRProtoStatsResponse *statsResponse;
  IDSQRProtoTestRequest *testRequest;
  IDSQRProtoTestResponse *testResponse;
  IDSQRProtoUnAllocBindRequest *unallocbindRequest;
  IDSQRProtoUnAllocBindResponse *unallocbindResponse;
  IDSQRProtoPutMaterialRequest *putmaterialRequest;
  IDSQRProtoPutMaterialResponse *putmaterialResponse;
  IDSQRProtoPutMaterialIndication *putmaterialIndication;
  IDSQRProtoGetMaterialRequest *getmaterialRequest;
  IDSQRProtoGetMaterialResponse *getmaterialResponse;
  IDSQRProtoH3EndToEndChannelRegisterRequest *registerRequest;
  IDSQRProtoH3EndToEndChannelRegisterResponse *registerResponse;
  IDSQRProtoH3EndToEndChannelRegisterIndication *registerIndication;
  IDSQRProtoH3EndToEndChannelRegisterAckRequest *registerAckRequest;
  IDSQRProtoH3EndToEndChannelRegisterAckResponse *registerAckResponse;
  IDSQRProtoH3EndToEndChannelUnRegisterRequest *unregisterRequest;
  IDSQRProtoH3EndToEndChannelUnRegisterResponse *unregisterResponse;
  IDSQRProtoH3EndToEndChannelUnRegisterIndication *unregisterIndication;
  _DWORD *v43;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[20] = self->_innerMessage;
    *((_BYTE *)v4 + 304) |= 1u;
  }
  allocbindRequest = self->_allocbindRequest;
  v43 = v4;
  if (allocbindRequest)
  {
    objc_msgSend_setAllocbindRequest_(v4, v5, (uint64_t)allocbindRequest, v6);
    v4 = v43;
  }
  allocbindResponse = self->_allocbindResponse;
  if (allocbindResponse)
  {
    objc_msgSend_setAllocbindResponse_(v43, v5, (uint64_t)allocbindResponse, v6);
    v4 = v43;
  }
  diagnosticIndication = self->_diagnosticIndication;
  if (diagnosticIndication)
  {
    objc_msgSend_setDiagnosticIndication_(v43, v5, (uint64_t)diagnosticIndication, v6);
    v4 = v43;
  }
  goawayIndication = self->_goawayIndication;
  if (goawayIndication)
  {
    objc_msgSend_setGoawayIndication_(v43, v5, (uint64_t)goawayIndication, v6);
    v4 = v43;
  }
  infoRequest = self->_infoRequest;
  if (infoRequest)
  {
    objc_msgSend_setInfoRequest_(v43, v5, (uint64_t)infoRequest, v6);
    v4 = v43;
  }
  infoResponse = self->_infoResponse;
  if (infoResponse)
  {
    objc_msgSend_setInfoResponse_(v43, v5, (uint64_t)infoResponse, v6);
    v4 = v43;
  }
  participantupdateRequest = self->_participantupdateRequest;
  if (participantupdateRequest)
  {
    objc_msgSend_setParticipantupdateRequest_(v43, v5, (uint64_t)participantupdateRequest, v6);
    v4 = v43;
  }
  participantupdateResponse = self->_participantupdateResponse;
  if (participantupdateResponse)
  {
    objc_msgSend_setParticipantupdateResponse_(v43, v5, (uint64_t)participantupdateResponse, v6);
    v4 = v43;
  }
  participantupdateIndication = self->_participantupdateIndication;
  if (participantupdateIndication)
  {
    objc_msgSend_setParticipantupdateIndication_(v43, v5, (uint64_t)participantupdateIndication, v6);
    v4 = v43;
  }
  plugincontrolRequest = self->_plugincontrolRequest;
  if (plugincontrolRequest)
  {
    objc_msgSend_setPlugincontrolRequest_(v43, v5, (uint64_t)plugincontrolRequest, v6);
    v4 = v43;
  }
  plugincontrolResponse = self->_plugincontrolResponse;
  if (plugincontrolResponse)
  {
    objc_msgSend_setPlugincontrolResponse_(v43, v5, (uint64_t)plugincontrolResponse, v6);
    v4 = v43;
  }
  plugincontrolIndication = self->_plugincontrolIndication;
  if (plugincontrolIndication)
  {
    objc_msgSend_setPlugincontrolIndication_(v43, v5, (uint64_t)plugincontrolIndication, v6);
    v4 = v43;
  }
  errorIndication = self->_errorIndication;
  if (errorIndication)
  {
    objc_msgSend_setErrorIndication_(v43, v5, (uint64_t)errorIndication, v6);
    v4 = v43;
  }
  reallocateIndication = self->_reallocateIndication;
  if (reallocateIndication)
  {
    objc_msgSend_setReallocateIndication_(v43, v5, (uint64_t)reallocateIndication, v6);
    v4 = v43;
  }
  sessioninfoRequest = self->_sessioninfoRequest;
  if (sessioninfoRequest)
  {
    objc_msgSend_setSessioninfoRequest_(v43, v5, (uint64_t)sessioninfoRequest, v6);
    v4 = v43;
  }
  sessioninfoResponse = self->_sessioninfoResponse;
  if (sessioninfoResponse)
  {
    objc_msgSend_setSessioninfoResponse_(v43, v5, (uint64_t)sessioninfoResponse, v6);
    v4 = v43;
  }
  sessioninfoIndication = self->_sessioninfoIndication;
  if (sessioninfoIndication)
  {
    objc_msgSend_setSessioninfoIndication_(v43, v5, (uint64_t)sessioninfoIndication, v6);
    v4 = v43;
  }
  statsRequest = self->_statsRequest;
  if (statsRequest)
  {
    objc_msgSend_setStatsRequest_(v43, v5, (uint64_t)statsRequest, v6);
    v4 = v43;
  }
  statsResponse = self->_statsResponse;
  if (statsResponse)
  {
    objc_msgSend_setStatsResponse_(v43, v5, (uint64_t)statsResponse, v6);
    v4 = v43;
  }
  testRequest = self->_testRequest;
  if (testRequest)
  {
    objc_msgSend_setTestRequest_(v43, v5, (uint64_t)testRequest, v6);
    v4 = v43;
  }
  testResponse = self->_testResponse;
  if (testResponse)
  {
    objc_msgSend_setTestResponse_(v43, v5, (uint64_t)testResponse, v6);
    v4 = v43;
  }
  unallocbindRequest = self->_unallocbindRequest;
  if (unallocbindRequest)
  {
    objc_msgSend_setUnallocbindRequest_(v43, v5, (uint64_t)unallocbindRequest, v6);
    v4 = v43;
  }
  unallocbindResponse = self->_unallocbindResponse;
  if (unallocbindResponse)
  {
    objc_msgSend_setUnallocbindResponse_(v43, v5, (uint64_t)unallocbindResponse, v6);
    v4 = v43;
  }
  putmaterialRequest = self->_putmaterialRequest;
  if (putmaterialRequest)
  {
    objc_msgSend_setPutmaterialRequest_(v43, v5, (uint64_t)putmaterialRequest, v6);
    v4 = v43;
  }
  putmaterialResponse = self->_putmaterialResponse;
  if (putmaterialResponse)
  {
    objc_msgSend_setPutmaterialResponse_(v43, v5, (uint64_t)putmaterialResponse, v6);
    v4 = v43;
  }
  putmaterialIndication = self->_putmaterialIndication;
  if (putmaterialIndication)
  {
    objc_msgSend_setPutmaterialIndication_(v43, v5, (uint64_t)putmaterialIndication, v6);
    v4 = v43;
  }
  getmaterialRequest = self->_getmaterialRequest;
  if (getmaterialRequest)
  {
    objc_msgSend_setGetmaterialRequest_(v43, v5, (uint64_t)getmaterialRequest, v6);
    v4 = v43;
  }
  getmaterialResponse = self->_getmaterialResponse;
  if (getmaterialResponse)
  {
    objc_msgSend_setGetmaterialResponse_(v43, v5, (uint64_t)getmaterialResponse, v6);
    v4 = v43;
  }
  registerRequest = self->_registerRequest;
  if (registerRequest)
  {
    objc_msgSend_setRegisterRequest_(v43, v5, (uint64_t)registerRequest, v6);
    v4 = v43;
  }
  registerResponse = self->_registerResponse;
  if (registerResponse)
  {
    objc_msgSend_setRegisterResponse_(v43, v5, (uint64_t)registerResponse, v6);
    v4 = v43;
  }
  registerIndication = self->_registerIndication;
  if (registerIndication)
  {
    objc_msgSend_setRegisterIndication_(v43, v5, (uint64_t)registerIndication, v6);
    v4 = v43;
  }
  registerAckRequest = self->_registerAckRequest;
  if (registerAckRequest)
  {
    objc_msgSend_setRegisterAckRequest_(v43, v5, (uint64_t)registerAckRequest, v6);
    v4 = v43;
  }
  registerAckResponse = self->_registerAckResponse;
  if (registerAckResponse)
  {
    objc_msgSend_setRegisterAckResponse_(v43, v5, (uint64_t)registerAckResponse, v6);
    v4 = v43;
  }
  unregisterRequest = self->_unregisterRequest;
  if (unregisterRequest)
  {
    objc_msgSend_setUnregisterRequest_(v43, v5, (uint64_t)unregisterRequest, v6);
    v4 = v43;
  }
  unregisterResponse = self->_unregisterResponse;
  if (unregisterResponse)
  {
    objc_msgSend_setUnregisterResponse_(v43, v5, (uint64_t)unregisterResponse, v6);
    v4 = v43;
  }
  unregisterIndication = self->_unregisterIndication;
  if (unregisterIndication)
  {
    objc_msgSend_setUnregisterIndication_(v43, v5, (uint64_t)unregisterIndication, v6);
    v4 = v43;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  double v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  double v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  double v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  double v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  double v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  double v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  double v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  double v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  double v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  double v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  double v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  double v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  double v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  double v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  double v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  double v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  double v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  double v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  double v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  double v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  double v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  double v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  double v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  double v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  double v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  double v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  double v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  double v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  double v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  double v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  double v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  double v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  double v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  double v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  double v155;
  uint64_t v156;
  void *v157;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = (_QWORD *)v12;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v12 + 80) = self->_innerMessage;
    *(_BYTE *)(v12 + 304) |= 1u;
  }
  v16 = objc_msgSend_copyWithZone_(self->_allocbindRequest, v13, (uint64_t)a3, v14);
  v17 = (void *)v15[1];
  v15[1] = v16;

  v20 = objc_msgSend_copyWithZone_(self->_allocbindResponse, v18, (uint64_t)a3, v19);
  v21 = (void *)v15[2];
  v15[2] = v20;

  v24 = objc_msgSend_copyWithZone_(self->_diagnosticIndication, v22, (uint64_t)a3, v23);
  v25 = (void *)v15[3];
  v15[3] = v24;

  v28 = objc_msgSend_copyWithZone_(self->_goawayIndication, v26, (uint64_t)a3, v27);
  v29 = (void *)v15[7];
  v15[7] = v28;

  v32 = objc_msgSend_copyWithZone_(self->_infoRequest, v30, (uint64_t)a3, v31);
  v33 = (void *)v15[8];
  v15[8] = v32;

  v36 = objc_msgSend_copyWithZone_(self->_infoResponse, v34, (uint64_t)a3, v35);
  v37 = (void *)v15[9];
  v15[9] = v36;

  v40 = objc_msgSend_copyWithZone_(self->_participantupdateRequest, v38, (uint64_t)a3, v39);
  v41 = (void *)v15[12];
  v15[12] = v40;

  v44 = objc_msgSend_copyWithZone_(self->_participantupdateResponse, v42, (uint64_t)a3, v43);
  v45 = (void *)v15[13];
  v15[13] = v44;

  v48 = objc_msgSend_copyWithZone_(self->_participantupdateIndication, v46, (uint64_t)a3, v47);
  v49 = (void *)v15[11];
  v15[11] = v48;

  v52 = objc_msgSend_copyWithZone_(self->_plugincontrolRequest, v50, (uint64_t)a3, v51);
  v53 = (void *)v15[15];
  v15[15] = v52;

  v56 = objc_msgSend_copyWithZone_(self->_plugincontrolResponse, v54, (uint64_t)a3, v55);
  v57 = (void *)v15[16];
  v15[16] = v56;

  v60 = objc_msgSend_copyWithZone_(self->_plugincontrolIndication, v58, (uint64_t)a3, v59);
  v61 = (void *)v15[14];
  v15[14] = v60;

  v64 = objc_msgSend_copyWithZone_(self->_errorIndication, v62, (uint64_t)a3, v63);
  v65 = (void *)v15[4];
  v15[4] = v64;

  v68 = objc_msgSend_copyWithZone_(self->_reallocateIndication, v66, (uint64_t)a3, v67);
  v69 = (void *)v15[20];
  v15[20] = v68;

  v72 = objc_msgSend_copyWithZone_(self->_sessioninfoRequest, v70, (uint64_t)a3, v71);
  v73 = (void *)v15[27];
  v15[27] = v72;

  v76 = objc_msgSend_copyWithZone_(self->_sessioninfoResponse, v74, (uint64_t)a3, v75);
  v77 = (void *)v15[28];
  v15[28] = v76;

  v80 = objc_msgSend_copyWithZone_(self->_sessioninfoIndication, v78, (uint64_t)a3, v79);
  v81 = (void *)v15[26];
  v15[26] = v80;

  v84 = objc_msgSend_copyWithZone_(self->_statsRequest, v82, (uint64_t)a3, v83);
  v85 = (void *)v15[29];
  v15[29] = v84;

  v88 = objc_msgSend_copyWithZone_(self->_statsResponse, v86, (uint64_t)a3, v87);
  v89 = (void *)v15[30];
  v15[30] = v88;

  v92 = objc_msgSend_copyWithZone_(self->_testRequest, v90, (uint64_t)a3, v91);
  v93 = (void *)v15[31];
  v15[31] = v92;

  v96 = objc_msgSend_copyWithZone_(self->_testResponse, v94, (uint64_t)a3, v95);
  v97 = (void *)v15[32];
  v15[32] = v96;

  v100 = objc_msgSend_copyWithZone_(self->_unallocbindRequest, v98, (uint64_t)a3, v99);
  v101 = (void *)v15[33];
  v15[33] = v100;

  v104 = objc_msgSend_copyWithZone_(self->_unallocbindResponse, v102, (uint64_t)a3, v103);
  v105 = (void *)v15[34];
  v15[34] = v104;

  v108 = objc_msgSend_copyWithZone_(self->_putmaterialRequest, v106, (uint64_t)a3, v107);
  v109 = (void *)v15[18];
  v15[18] = v108;

  v112 = objc_msgSend_copyWithZone_(self->_putmaterialResponse, v110, (uint64_t)a3, v111);
  v113 = (void *)v15[19];
  v15[19] = v112;

  v116 = objc_msgSend_copyWithZone_(self->_putmaterialIndication, v114, (uint64_t)a3, v115);
  v117 = (void *)v15[17];
  v15[17] = v116;

  v120 = objc_msgSend_copyWithZone_(self->_getmaterialRequest, v118, (uint64_t)a3, v119);
  v121 = (void *)v15[5];
  v15[5] = v120;

  v124 = objc_msgSend_copyWithZone_(self->_getmaterialResponse, v122, (uint64_t)a3, v123);
  v125 = (void *)v15[6];
  v15[6] = v124;

  v128 = objc_msgSend_copyWithZone_(self->_registerRequest, v126, (uint64_t)a3, v127);
  v129 = (void *)v15[24];
  v15[24] = v128;

  v132 = objc_msgSend_copyWithZone_(self->_registerResponse, v130, (uint64_t)a3, v131);
  v133 = (void *)v15[25];
  v15[25] = v132;

  v136 = objc_msgSend_copyWithZone_(self->_registerIndication, v134, (uint64_t)a3, v135);
  v137 = (void *)v15[23];
  v15[23] = v136;

  v140 = objc_msgSend_copyWithZone_(self->_registerAckRequest, v138, (uint64_t)a3, v139);
  v141 = (void *)v15[21];
  v15[21] = v140;

  v144 = objc_msgSend_copyWithZone_(self->_registerAckResponse, v142, (uint64_t)a3, v143);
  v145 = (void *)v15[22];
  v15[22] = v144;

  v148 = objc_msgSend_copyWithZone_(self->_unregisterRequest, v146, (uint64_t)a3, v147);
  v149 = (void *)v15[36];
  v15[36] = v148;

  v152 = objc_msgSend_copyWithZone_(self->_unregisterResponse, v150, (uint64_t)a3, v151);
  v153 = (void *)v15[37];
  v15[37] = v152;

  v156 = objc_msgSend_copyWithZone_(self->_unregisterIndication, v154, (uint64_t)a3, v155);
  v157 = (void *)v15[35];
  v15[35] = v156;

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  IDSQRProtoAllocBindRequest *allocbindRequest;
  uint64_t v11;
  IDSQRProtoAllocBindResponse *allocbindResponse;
  uint64_t v13;
  IDSQRProtoDiagnosticIndication *diagnosticIndication;
  uint64_t v15;
  IDSQRProtoGoAwayIndication *goawayIndication;
  uint64_t v17;
  IDSQRProtoInfoRequest *infoRequest;
  uint64_t v19;
  IDSQRProtoInfoResponse *infoResponse;
  uint64_t v21;
  IDSQRProtoParticipantUpdateRequest *participantupdateRequest;
  uint64_t v23;
  IDSQRProtoParticipantUpdateResponse *participantupdateResponse;
  uint64_t v25;
  IDSQRProtoParticipantUpdateIndication *participantupdateIndication;
  uint64_t v27;
  IDSQRProtoPluginControlRequest *plugincontrolRequest;
  uint64_t v29;
  IDSQRProtoPluginControlResponse *plugincontrolResponse;
  uint64_t v31;
  IDSQRProtoPluginControlIndication *plugincontrolIndication;
  uint64_t v33;
  IDSQRProtoErrorIndication *errorIndication;
  uint64_t v35;
  IDSQRProtoReallocateIndication *reallocateIndication;
  uint64_t v37;
  IDSQRProtoSessionInfoRequest *sessioninfoRequest;
  uint64_t v39;
  IDSQRProtoSessionInfoResponse *sessioninfoResponse;
  uint64_t v41;
  IDSQRProtoSessionInfoIndication *sessioninfoIndication;
  uint64_t v43;
  IDSQRProtoStatsRequest *statsRequest;
  uint64_t v45;
  IDSQRProtoStatsResponse *statsResponse;
  uint64_t v47;
  IDSQRProtoTestRequest *testRequest;
  uint64_t v49;
  IDSQRProtoTestResponse *testResponse;
  uint64_t v51;
  IDSQRProtoUnAllocBindRequest *unallocbindRequest;
  uint64_t v53;
  IDSQRProtoUnAllocBindResponse *unallocbindResponse;
  uint64_t v55;
  IDSQRProtoPutMaterialRequest *putmaterialRequest;
  uint64_t v57;
  IDSQRProtoPutMaterialResponse *putmaterialResponse;
  uint64_t v59;
  IDSQRProtoPutMaterialIndication *putmaterialIndication;
  uint64_t v61;
  IDSQRProtoGetMaterialRequest *getmaterialRequest;
  uint64_t v63;
  IDSQRProtoGetMaterialResponse *getmaterialResponse;
  uint64_t v65;
  IDSQRProtoH3EndToEndChannelRegisterRequest *registerRequest;
  uint64_t v67;
  IDSQRProtoH3EndToEndChannelRegisterResponse *registerResponse;
  uint64_t v69;
  IDSQRProtoH3EndToEndChannelRegisterIndication *registerIndication;
  uint64_t v71;
  IDSQRProtoH3EndToEndChannelRegisterAckRequest *registerAckRequest;
  uint64_t v73;
  IDSQRProtoH3EndToEndChannelRegisterAckResponse *registerAckResponse;
  uint64_t v75;
  IDSQRProtoH3EndToEndChannelUnRegisterRequest *unregisterRequest;
  uint64_t v77;
  IDSQRProtoH3EndToEndChannelUnRegisterResponse *unregisterResponse;
  uint64_t v79;
  IDSQRProtoH3EndToEndChannelUnRegisterIndication *unregisterIndication;
  uint64_t v81;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_79;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[38] & 1) == 0 || self->_innerMessage != *((_DWORD *)v4 + 20))
      goto LABEL_79;
  }
  else if ((v4[38] & 1) != 0)
  {
LABEL_79:
    isEqual = 0;
    goto LABEL_80;
  }
  allocbindRequest = self->_allocbindRequest;
  v11 = v4[1];
  if ((unint64_t)allocbindRequest | v11 && !objc_msgSend_isEqual_(allocbindRequest, v8, v11, v9))
    goto LABEL_79;
  allocbindResponse = self->_allocbindResponse;
  v13 = v4[2];
  if ((unint64_t)allocbindResponse | v13)
  {
    if (!objc_msgSend_isEqual_(allocbindResponse, v8, v13, v9))
      goto LABEL_79;
  }
  diagnosticIndication = self->_diagnosticIndication;
  v15 = v4[3];
  if ((unint64_t)diagnosticIndication | v15)
  {
    if (!objc_msgSend_isEqual_(diagnosticIndication, v8, v15, v9))
      goto LABEL_79;
  }
  goawayIndication = self->_goawayIndication;
  v17 = v4[7];
  if ((unint64_t)goawayIndication | v17)
  {
    if (!objc_msgSend_isEqual_(goawayIndication, v8, v17, v9))
      goto LABEL_79;
  }
  infoRequest = self->_infoRequest;
  v19 = v4[8];
  if ((unint64_t)infoRequest | v19)
  {
    if (!objc_msgSend_isEqual_(infoRequest, v8, v19, v9))
      goto LABEL_79;
  }
  infoResponse = self->_infoResponse;
  v21 = v4[9];
  if ((unint64_t)infoResponse | v21)
  {
    if (!objc_msgSend_isEqual_(infoResponse, v8, v21, v9))
      goto LABEL_79;
  }
  participantupdateRequest = self->_participantupdateRequest;
  v23 = v4[12];
  if ((unint64_t)participantupdateRequest | v23)
  {
    if (!objc_msgSend_isEqual_(participantupdateRequest, v8, v23, v9))
      goto LABEL_79;
  }
  participantupdateResponse = self->_participantupdateResponse;
  v25 = v4[13];
  if ((unint64_t)participantupdateResponse | v25)
  {
    if (!objc_msgSend_isEqual_(participantupdateResponse, v8, v25, v9))
      goto LABEL_79;
  }
  participantupdateIndication = self->_participantupdateIndication;
  v27 = v4[11];
  if ((unint64_t)participantupdateIndication | v27)
  {
    if (!objc_msgSend_isEqual_(participantupdateIndication, v8, v27, v9))
      goto LABEL_79;
  }
  plugincontrolRequest = self->_plugincontrolRequest;
  v29 = v4[15];
  if ((unint64_t)plugincontrolRequest | v29)
  {
    if (!objc_msgSend_isEqual_(plugincontrolRequest, v8, v29, v9))
      goto LABEL_79;
  }
  plugincontrolResponse = self->_plugincontrolResponse;
  v31 = v4[16];
  if ((unint64_t)plugincontrolResponse | v31)
  {
    if (!objc_msgSend_isEqual_(plugincontrolResponse, v8, v31, v9))
      goto LABEL_79;
  }
  plugincontrolIndication = self->_plugincontrolIndication;
  v33 = v4[14];
  if ((unint64_t)plugincontrolIndication | v33)
  {
    if (!objc_msgSend_isEqual_(plugincontrolIndication, v8, v33, v9))
      goto LABEL_79;
  }
  errorIndication = self->_errorIndication;
  v35 = v4[4];
  if ((unint64_t)errorIndication | v35)
  {
    if (!objc_msgSend_isEqual_(errorIndication, v8, v35, v9))
      goto LABEL_79;
  }
  reallocateIndication = self->_reallocateIndication;
  v37 = v4[20];
  if ((unint64_t)reallocateIndication | v37)
  {
    if (!objc_msgSend_isEqual_(reallocateIndication, v8, v37, v9))
      goto LABEL_79;
  }
  sessioninfoRequest = self->_sessioninfoRequest;
  v39 = v4[27];
  if ((unint64_t)sessioninfoRequest | v39)
  {
    if (!objc_msgSend_isEqual_(sessioninfoRequest, v8, v39, v9))
      goto LABEL_79;
  }
  sessioninfoResponse = self->_sessioninfoResponse;
  v41 = v4[28];
  if ((unint64_t)sessioninfoResponse | v41)
  {
    if (!objc_msgSend_isEqual_(sessioninfoResponse, v8, v41, v9))
      goto LABEL_79;
  }
  sessioninfoIndication = self->_sessioninfoIndication;
  v43 = v4[26];
  if ((unint64_t)sessioninfoIndication | v43)
  {
    if (!objc_msgSend_isEqual_(sessioninfoIndication, v8, v43, v9))
      goto LABEL_79;
  }
  statsRequest = self->_statsRequest;
  v45 = v4[29];
  if ((unint64_t)statsRequest | v45)
  {
    if (!objc_msgSend_isEqual_(statsRequest, v8, v45, v9))
      goto LABEL_79;
  }
  statsResponse = self->_statsResponse;
  v47 = v4[30];
  if ((unint64_t)statsResponse | v47)
  {
    if (!objc_msgSend_isEqual_(statsResponse, v8, v47, v9))
      goto LABEL_79;
  }
  testRequest = self->_testRequest;
  v49 = v4[31];
  if ((unint64_t)testRequest | v49)
  {
    if (!objc_msgSend_isEqual_(testRequest, v8, v49, v9))
      goto LABEL_79;
  }
  testResponse = self->_testResponse;
  v51 = v4[32];
  if ((unint64_t)testResponse | v51)
  {
    if (!objc_msgSend_isEqual_(testResponse, v8, v51, v9))
      goto LABEL_79;
  }
  unallocbindRequest = self->_unallocbindRequest;
  v53 = v4[33];
  if ((unint64_t)unallocbindRequest | v53)
  {
    if (!objc_msgSend_isEqual_(unallocbindRequest, v8, v53, v9))
      goto LABEL_79;
  }
  unallocbindResponse = self->_unallocbindResponse;
  v55 = v4[34];
  if ((unint64_t)unallocbindResponse | v55)
  {
    if (!objc_msgSend_isEqual_(unallocbindResponse, v8, v55, v9))
      goto LABEL_79;
  }
  putmaterialRequest = self->_putmaterialRequest;
  v57 = v4[18];
  if ((unint64_t)putmaterialRequest | v57)
  {
    if (!objc_msgSend_isEqual_(putmaterialRequest, v8, v57, v9))
      goto LABEL_79;
  }
  putmaterialResponse = self->_putmaterialResponse;
  v59 = v4[19];
  if ((unint64_t)putmaterialResponse | v59)
  {
    if (!objc_msgSend_isEqual_(putmaterialResponse, v8, v59, v9))
      goto LABEL_79;
  }
  putmaterialIndication = self->_putmaterialIndication;
  v61 = v4[17];
  if ((unint64_t)putmaterialIndication | v61)
  {
    if (!objc_msgSend_isEqual_(putmaterialIndication, v8, v61, v9))
      goto LABEL_79;
  }
  getmaterialRequest = self->_getmaterialRequest;
  v63 = v4[5];
  if ((unint64_t)getmaterialRequest | v63)
  {
    if (!objc_msgSend_isEqual_(getmaterialRequest, v8, v63, v9))
      goto LABEL_79;
  }
  getmaterialResponse = self->_getmaterialResponse;
  v65 = v4[6];
  if ((unint64_t)getmaterialResponse | v65)
  {
    if (!objc_msgSend_isEqual_(getmaterialResponse, v8, v65, v9))
      goto LABEL_79;
  }
  registerRequest = self->_registerRequest;
  v67 = v4[24];
  if ((unint64_t)registerRequest | v67)
  {
    if (!objc_msgSend_isEqual_(registerRequest, v8, v67, v9))
      goto LABEL_79;
  }
  registerResponse = self->_registerResponse;
  v69 = v4[25];
  if ((unint64_t)registerResponse | v69)
  {
    if (!objc_msgSend_isEqual_(registerResponse, v8, v69, v9))
      goto LABEL_79;
  }
  registerIndication = self->_registerIndication;
  v71 = v4[23];
  if ((unint64_t)registerIndication | v71)
  {
    if (!objc_msgSend_isEqual_(registerIndication, v8, v71, v9))
      goto LABEL_79;
  }
  registerAckRequest = self->_registerAckRequest;
  v73 = v4[21];
  if ((unint64_t)registerAckRequest | v73)
  {
    if (!objc_msgSend_isEqual_(registerAckRequest, v8, v73, v9))
      goto LABEL_79;
  }
  registerAckResponse = self->_registerAckResponse;
  v75 = v4[22];
  if ((unint64_t)registerAckResponse | v75)
  {
    if (!objc_msgSend_isEqual_(registerAckResponse, v8, v75, v9))
      goto LABEL_79;
  }
  unregisterRequest = self->_unregisterRequest;
  v77 = v4[36];
  if ((unint64_t)unregisterRequest | v77)
  {
    if (!objc_msgSend_isEqual_(unregisterRequest, v8, v77, v9))
      goto LABEL_79;
  }
  unregisterResponse = self->_unregisterResponse;
  v79 = v4[37];
  if ((unint64_t)unregisterResponse | v79)
  {
    if (!objc_msgSend_isEqual_(unregisterResponse, v8, v79, v9))
      goto LABEL_79;
  }
  unregisterIndication = self->_unregisterIndication;
  v81 = v4[35];
  if ((unint64_t)unregisterIndication | v81)
    isEqual = objc_msgSend_isEqual_(unregisterIndication, v8, v81, v9);
  else
    isEqual = 1;
LABEL_80:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  double v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  double v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  double v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  double v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  double v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  double v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  double v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  double v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  double v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  double v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  double v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  double v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  double v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  double v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  double v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  double v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  double v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  double v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  double v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  double v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  double v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  double v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  double v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  double v145;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_innerMessage;
  else
    v5 = 0;
  v6 = objc_msgSend_hash(self->_allocbindRequest, a2, v2, v3) ^ v5;
  v10 = objc_msgSend_hash(self->_allocbindResponse, v7, v8, v9);
  v14 = v6 ^ v10 ^ objc_msgSend_hash(self->_diagnosticIndication, v11, v12, v13);
  v18 = objc_msgSend_hash(self->_goawayIndication, v15, v16, v17);
  v22 = v18 ^ objc_msgSend_hash(self->_infoRequest, v19, v20, v21);
  v26 = v14 ^ v22 ^ objc_msgSend_hash(self->_infoResponse, v23, v24, v25);
  v30 = objc_msgSend_hash(self->_participantupdateRequest, v27, v28, v29);
  v34 = v30 ^ objc_msgSend_hash(self->_participantupdateResponse, v31, v32, v33);
  v38 = v34 ^ objc_msgSend_hash(self->_participantupdateIndication, v35, v36, v37);
  v42 = v26 ^ v38 ^ objc_msgSend_hash(self->_plugincontrolRequest, v39, v40, v41);
  v46 = objc_msgSend_hash(self->_plugincontrolResponse, v43, v44, v45);
  v50 = v46 ^ objc_msgSend_hash(self->_plugincontrolIndication, v47, v48, v49);
  v54 = v50 ^ objc_msgSend_hash(self->_errorIndication, v51, v52, v53);
  v58 = v54 ^ objc_msgSend_hash(self->_reallocateIndication, v55, v56, v57);
  v62 = v42 ^ v58 ^ objc_msgSend_hash(self->_sessioninfoRequest, v59, v60, v61);
  v66 = objc_msgSend_hash(self->_sessioninfoResponse, v63, v64, v65);
  v70 = v66 ^ objc_msgSend_hash(self->_sessioninfoIndication, v67, v68, v69);
  v74 = v70 ^ objc_msgSend_hash(self->_statsRequest, v71, v72, v73);
  v78 = v74 ^ objc_msgSend_hash(self->_statsResponse, v75, v76, v77);
  v82 = v78 ^ objc_msgSend_hash(self->_testRequest, v79, v80, v81);
  v86 = v62 ^ v82 ^ objc_msgSend_hash(self->_testResponse, v83, v84, v85);
  v90 = objc_msgSend_hash(self->_unallocbindRequest, v87, v88, v89);
  v94 = v90 ^ objc_msgSend_hash(self->_unallocbindResponse, v91, v92, v93);
  v98 = v94 ^ objc_msgSend_hash(self->_putmaterialRequest, v95, v96, v97);
  v102 = v98 ^ objc_msgSend_hash(self->_putmaterialResponse, v99, v100, v101);
  v106 = v102 ^ objc_msgSend_hash(self->_putmaterialIndication, v103, v104, v105);
  v110 = v106 ^ objc_msgSend_hash(self->_getmaterialRequest, v107, v108, v109);
  v114 = v86 ^ v110 ^ objc_msgSend_hash(self->_getmaterialResponse, v111, v112, v113);
  v118 = objc_msgSend_hash(self->_registerRequest, v115, v116, v117);
  v122 = v118 ^ objc_msgSend_hash(self->_registerResponse, v119, v120, v121);
  v126 = v122 ^ objc_msgSend_hash(self->_registerIndication, v123, v124, v125);
  v130 = v126 ^ objc_msgSend_hash(self->_registerAckRequest, v127, v128, v129);
  v134 = v130 ^ objc_msgSend_hash(self->_registerAckResponse, v131, v132, v133);
  v138 = v134 ^ objc_msgSend_hash(self->_unregisterRequest, v135, v136, v137);
  v142 = v138 ^ objc_msgSend_hash(self->_unregisterResponse, v139, v140, v141);
  return v114 ^ v142 ^ objc_msgSend_hash(self->_unregisterIndication, v143, v144, v145);
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  double v5;
  _QWORD *v6;
  IDSQRProtoAllocBindRequest *allocbindRequest;
  uint64_t v8;
  IDSQRProtoAllocBindResponse *allocbindResponse;
  uint64_t v10;
  IDSQRProtoDiagnosticIndication *diagnosticIndication;
  uint64_t v12;
  IDSQRProtoGoAwayIndication *goawayIndication;
  uint64_t v14;
  IDSQRProtoInfoRequest *infoRequest;
  uint64_t v16;
  IDSQRProtoInfoResponse *infoResponse;
  uint64_t v18;
  IDSQRProtoParticipantUpdateRequest *participantupdateRequest;
  uint64_t v20;
  IDSQRProtoParticipantUpdateResponse *participantupdateResponse;
  uint64_t v22;
  IDSQRProtoParticipantUpdateIndication *participantupdateIndication;
  uint64_t v24;
  IDSQRProtoPluginControlRequest *plugincontrolRequest;
  uint64_t v26;
  IDSQRProtoPluginControlResponse *plugincontrolResponse;
  uint64_t v28;
  IDSQRProtoPluginControlIndication *plugincontrolIndication;
  uint64_t v30;
  IDSQRProtoErrorIndication *errorIndication;
  uint64_t v32;
  IDSQRProtoReallocateIndication *reallocateIndication;
  uint64_t v34;
  IDSQRProtoSessionInfoRequest *sessioninfoRequest;
  uint64_t v36;
  IDSQRProtoSessionInfoResponse *sessioninfoResponse;
  uint64_t v38;
  IDSQRProtoSessionInfoIndication *sessioninfoIndication;
  uint64_t v40;
  IDSQRProtoStatsRequest *statsRequest;
  uint64_t v42;
  IDSQRProtoStatsResponse *statsResponse;
  uint64_t v44;
  IDSQRProtoTestRequest *testRequest;
  uint64_t v46;
  IDSQRProtoTestResponse *testResponse;
  uint64_t v48;
  IDSQRProtoUnAllocBindRequest *unallocbindRequest;
  uint64_t v50;
  IDSQRProtoUnAllocBindResponse *unallocbindResponse;
  uint64_t v52;
  IDSQRProtoPutMaterialRequest *putmaterialRequest;
  uint64_t v54;
  IDSQRProtoPutMaterialResponse *putmaterialResponse;
  uint64_t v56;
  IDSQRProtoPutMaterialIndication *putmaterialIndication;
  uint64_t v58;
  IDSQRProtoGetMaterialRequest *getmaterialRequest;
  uint64_t v60;
  IDSQRProtoGetMaterialResponse *getmaterialResponse;
  uint64_t v62;
  IDSQRProtoH3EndToEndChannelRegisterRequest *registerRequest;
  uint64_t v64;
  IDSQRProtoH3EndToEndChannelRegisterResponse *registerResponse;
  uint64_t v66;
  IDSQRProtoH3EndToEndChannelRegisterIndication *registerIndication;
  uint64_t v68;
  IDSQRProtoH3EndToEndChannelRegisterAckRequest *registerAckRequest;
  uint64_t v70;
  IDSQRProtoH3EndToEndChannelRegisterAckResponse *registerAckResponse;
  uint64_t v72;
  IDSQRProtoH3EndToEndChannelUnRegisterRequest *unregisterRequest;
  uint64_t v74;
  IDSQRProtoH3EndToEndChannelUnRegisterResponse *unregisterResponse;
  uint64_t v76;
  IDSQRProtoH3EndToEndChannelUnRegisterIndication *unregisterIndication;
  uint64_t v78;
  _QWORD *v79;

  v4 = a3;
  v6 = v4;
  if ((v4[76] & 1) != 0)
  {
    self->_innerMessage = v4[20];
    *(_BYTE *)&self->_has |= 1u;
  }
  allocbindRequest = self->_allocbindRequest;
  v8 = v6[1];
  v79 = v6;
  if (allocbindRequest)
  {
    if (!v8)
      goto LABEL_9;
    objc_msgSend_mergeFrom_(allocbindRequest, (const char *)v6, v8, v5);
  }
  else
  {
    if (!v8)
      goto LABEL_9;
    objc_msgSend_setAllocbindRequest_(self, (const char *)v6, v8, v5);
  }
  v6 = v79;
LABEL_9:
  allocbindResponse = self->_allocbindResponse;
  v10 = v6[2];
  if (allocbindResponse)
  {
    if (!v10)
      goto LABEL_15;
    objc_msgSend_mergeFrom_(allocbindResponse, (const char *)v6, v10, v5);
  }
  else
  {
    if (!v10)
      goto LABEL_15;
    objc_msgSend_setAllocbindResponse_(self, (const char *)v6, v10, v5);
  }
  v6 = v79;
LABEL_15:
  diagnosticIndication = self->_diagnosticIndication;
  v12 = v6[3];
  if (diagnosticIndication)
  {
    if (!v12)
      goto LABEL_21;
    objc_msgSend_mergeFrom_(diagnosticIndication, (const char *)v6, v12, v5);
  }
  else
  {
    if (!v12)
      goto LABEL_21;
    objc_msgSend_setDiagnosticIndication_(self, (const char *)v6, v12, v5);
  }
  v6 = v79;
LABEL_21:
  goawayIndication = self->_goawayIndication;
  v14 = v6[7];
  if (goawayIndication)
  {
    if (!v14)
      goto LABEL_27;
    objc_msgSend_mergeFrom_(goawayIndication, (const char *)v6, v14, v5);
  }
  else
  {
    if (!v14)
      goto LABEL_27;
    objc_msgSend_setGoawayIndication_(self, (const char *)v6, v14, v5);
  }
  v6 = v79;
LABEL_27:
  infoRequest = self->_infoRequest;
  v16 = v6[8];
  if (infoRequest)
  {
    if (!v16)
      goto LABEL_33;
    objc_msgSend_mergeFrom_(infoRequest, (const char *)v6, v16, v5);
  }
  else
  {
    if (!v16)
      goto LABEL_33;
    objc_msgSend_setInfoRequest_(self, (const char *)v6, v16, v5);
  }
  v6 = v79;
LABEL_33:
  infoResponse = self->_infoResponse;
  v18 = v6[9];
  if (infoResponse)
  {
    if (!v18)
      goto LABEL_39;
    objc_msgSend_mergeFrom_(infoResponse, (const char *)v6, v18, v5);
  }
  else
  {
    if (!v18)
      goto LABEL_39;
    objc_msgSend_setInfoResponse_(self, (const char *)v6, v18, v5);
  }
  v6 = v79;
LABEL_39:
  participantupdateRequest = self->_participantupdateRequest;
  v20 = v6[12];
  if (participantupdateRequest)
  {
    if (!v20)
      goto LABEL_45;
    objc_msgSend_mergeFrom_(participantupdateRequest, (const char *)v6, v20, v5);
  }
  else
  {
    if (!v20)
      goto LABEL_45;
    objc_msgSend_setParticipantupdateRequest_(self, (const char *)v6, v20, v5);
  }
  v6 = v79;
LABEL_45:
  participantupdateResponse = self->_participantupdateResponse;
  v22 = v6[13];
  if (participantupdateResponse)
  {
    if (!v22)
      goto LABEL_51;
    objc_msgSend_mergeFrom_(participantupdateResponse, (const char *)v6, v22, v5);
  }
  else
  {
    if (!v22)
      goto LABEL_51;
    objc_msgSend_setParticipantupdateResponse_(self, (const char *)v6, v22, v5);
  }
  v6 = v79;
LABEL_51:
  participantupdateIndication = self->_participantupdateIndication;
  v24 = v6[11];
  if (participantupdateIndication)
  {
    if (!v24)
      goto LABEL_57;
    objc_msgSend_mergeFrom_(participantupdateIndication, (const char *)v6, v24, v5);
  }
  else
  {
    if (!v24)
      goto LABEL_57;
    objc_msgSend_setParticipantupdateIndication_(self, (const char *)v6, v24, v5);
  }
  v6 = v79;
LABEL_57:
  plugincontrolRequest = self->_plugincontrolRequest;
  v26 = v6[15];
  if (plugincontrolRequest)
  {
    if (!v26)
      goto LABEL_63;
    objc_msgSend_mergeFrom_(plugincontrolRequest, (const char *)v6, v26, v5);
  }
  else
  {
    if (!v26)
      goto LABEL_63;
    objc_msgSend_setPlugincontrolRequest_(self, (const char *)v6, v26, v5);
  }
  v6 = v79;
LABEL_63:
  plugincontrolResponse = self->_plugincontrolResponse;
  v28 = v6[16];
  if (plugincontrolResponse)
  {
    if (!v28)
      goto LABEL_69;
    objc_msgSend_mergeFrom_(plugincontrolResponse, (const char *)v6, v28, v5);
  }
  else
  {
    if (!v28)
      goto LABEL_69;
    objc_msgSend_setPlugincontrolResponse_(self, (const char *)v6, v28, v5);
  }
  v6 = v79;
LABEL_69:
  plugincontrolIndication = self->_plugincontrolIndication;
  v30 = v6[14];
  if (plugincontrolIndication)
  {
    if (!v30)
      goto LABEL_75;
    objc_msgSend_mergeFrom_(plugincontrolIndication, (const char *)v6, v30, v5);
  }
  else
  {
    if (!v30)
      goto LABEL_75;
    objc_msgSend_setPlugincontrolIndication_(self, (const char *)v6, v30, v5);
  }
  v6 = v79;
LABEL_75:
  errorIndication = self->_errorIndication;
  v32 = v6[4];
  if (errorIndication)
  {
    if (!v32)
      goto LABEL_81;
    objc_msgSend_mergeFrom_(errorIndication, (const char *)v6, v32, v5);
  }
  else
  {
    if (!v32)
      goto LABEL_81;
    objc_msgSend_setErrorIndication_(self, (const char *)v6, v32, v5);
  }
  v6 = v79;
LABEL_81:
  reallocateIndication = self->_reallocateIndication;
  v34 = v6[20];
  if (reallocateIndication)
  {
    if (!v34)
      goto LABEL_87;
    objc_msgSend_mergeFrom_(reallocateIndication, (const char *)v6, v34, v5);
  }
  else
  {
    if (!v34)
      goto LABEL_87;
    objc_msgSend_setReallocateIndication_(self, (const char *)v6, v34, v5);
  }
  v6 = v79;
LABEL_87:
  sessioninfoRequest = self->_sessioninfoRequest;
  v36 = v6[27];
  if (sessioninfoRequest)
  {
    if (!v36)
      goto LABEL_93;
    objc_msgSend_mergeFrom_(sessioninfoRequest, (const char *)v6, v36, v5);
  }
  else
  {
    if (!v36)
      goto LABEL_93;
    objc_msgSend_setSessioninfoRequest_(self, (const char *)v6, v36, v5);
  }
  v6 = v79;
LABEL_93:
  sessioninfoResponse = self->_sessioninfoResponse;
  v38 = v6[28];
  if (sessioninfoResponse)
  {
    if (!v38)
      goto LABEL_99;
    objc_msgSend_mergeFrom_(sessioninfoResponse, (const char *)v6, v38, v5);
  }
  else
  {
    if (!v38)
      goto LABEL_99;
    objc_msgSend_setSessioninfoResponse_(self, (const char *)v6, v38, v5);
  }
  v6 = v79;
LABEL_99:
  sessioninfoIndication = self->_sessioninfoIndication;
  v40 = v6[26];
  if (sessioninfoIndication)
  {
    if (!v40)
      goto LABEL_105;
    objc_msgSend_mergeFrom_(sessioninfoIndication, (const char *)v6, v40, v5);
  }
  else
  {
    if (!v40)
      goto LABEL_105;
    objc_msgSend_setSessioninfoIndication_(self, (const char *)v6, v40, v5);
  }
  v6 = v79;
LABEL_105:
  statsRequest = self->_statsRequest;
  v42 = v6[29];
  if (statsRequest)
  {
    if (!v42)
      goto LABEL_111;
    objc_msgSend_mergeFrom_(statsRequest, (const char *)v6, v42, v5);
  }
  else
  {
    if (!v42)
      goto LABEL_111;
    objc_msgSend_setStatsRequest_(self, (const char *)v6, v42, v5);
  }
  v6 = v79;
LABEL_111:
  statsResponse = self->_statsResponse;
  v44 = v6[30];
  if (statsResponse)
  {
    if (!v44)
      goto LABEL_117;
    objc_msgSend_mergeFrom_(statsResponse, (const char *)v6, v44, v5);
  }
  else
  {
    if (!v44)
      goto LABEL_117;
    objc_msgSend_setStatsResponse_(self, (const char *)v6, v44, v5);
  }
  v6 = v79;
LABEL_117:
  testRequest = self->_testRequest;
  v46 = v6[31];
  if (testRequest)
  {
    if (!v46)
      goto LABEL_123;
    objc_msgSend_mergeFrom_(testRequest, (const char *)v6, v46, v5);
  }
  else
  {
    if (!v46)
      goto LABEL_123;
    objc_msgSend_setTestRequest_(self, (const char *)v6, v46, v5);
  }
  v6 = v79;
LABEL_123:
  testResponse = self->_testResponse;
  v48 = v6[32];
  if (testResponse)
  {
    if (!v48)
      goto LABEL_129;
    objc_msgSend_mergeFrom_(testResponse, (const char *)v6, v48, v5);
  }
  else
  {
    if (!v48)
      goto LABEL_129;
    objc_msgSend_setTestResponse_(self, (const char *)v6, v48, v5);
  }
  v6 = v79;
LABEL_129:
  unallocbindRequest = self->_unallocbindRequest;
  v50 = v6[33];
  if (unallocbindRequest)
  {
    if (!v50)
      goto LABEL_135;
    objc_msgSend_mergeFrom_(unallocbindRequest, (const char *)v6, v50, v5);
  }
  else
  {
    if (!v50)
      goto LABEL_135;
    objc_msgSend_setUnallocbindRequest_(self, (const char *)v6, v50, v5);
  }
  v6 = v79;
LABEL_135:
  unallocbindResponse = self->_unallocbindResponse;
  v52 = v6[34];
  if (unallocbindResponse)
  {
    if (!v52)
      goto LABEL_141;
    objc_msgSend_mergeFrom_(unallocbindResponse, (const char *)v6, v52, v5);
  }
  else
  {
    if (!v52)
      goto LABEL_141;
    objc_msgSend_setUnallocbindResponse_(self, (const char *)v6, v52, v5);
  }
  v6 = v79;
LABEL_141:
  putmaterialRequest = self->_putmaterialRequest;
  v54 = v6[18];
  if (putmaterialRequest)
  {
    if (!v54)
      goto LABEL_147;
    objc_msgSend_mergeFrom_(putmaterialRequest, (const char *)v6, v54, v5);
  }
  else
  {
    if (!v54)
      goto LABEL_147;
    objc_msgSend_setPutmaterialRequest_(self, (const char *)v6, v54, v5);
  }
  v6 = v79;
LABEL_147:
  putmaterialResponse = self->_putmaterialResponse;
  v56 = v6[19];
  if (putmaterialResponse)
  {
    if (!v56)
      goto LABEL_153;
    objc_msgSend_mergeFrom_(putmaterialResponse, (const char *)v6, v56, v5);
  }
  else
  {
    if (!v56)
      goto LABEL_153;
    objc_msgSend_setPutmaterialResponse_(self, (const char *)v6, v56, v5);
  }
  v6 = v79;
LABEL_153:
  putmaterialIndication = self->_putmaterialIndication;
  v58 = v6[17];
  if (putmaterialIndication)
  {
    if (!v58)
      goto LABEL_159;
    objc_msgSend_mergeFrom_(putmaterialIndication, (const char *)v6, v58, v5);
  }
  else
  {
    if (!v58)
      goto LABEL_159;
    objc_msgSend_setPutmaterialIndication_(self, (const char *)v6, v58, v5);
  }
  v6 = v79;
LABEL_159:
  getmaterialRequest = self->_getmaterialRequest;
  v60 = v6[5];
  if (getmaterialRequest)
  {
    if (!v60)
      goto LABEL_165;
    objc_msgSend_mergeFrom_(getmaterialRequest, (const char *)v6, v60, v5);
  }
  else
  {
    if (!v60)
      goto LABEL_165;
    objc_msgSend_setGetmaterialRequest_(self, (const char *)v6, v60, v5);
  }
  v6 = v79;
LABEL_165:
  getmaterialResponse = self->_getmaterialResponse;
  v62 = v6[6];
  if (getmaterialResponse)
  {
    if (!v62)
      goto LABEL_171;
    objc_msgSend_mergeFrom_(getmaterialResponse, (const char *)v6, v62, v5);
  }
  else
  {
    if (!v62)
      goto LABEL_171;
    objc_msgSend_setGetmaterialResponse_(self, (const char *)v6, v62, v5);
  }
  v6 = v79;
LABEL_171:
  registerRequest = self->_registerRequest;
  v64 = v6[24];
  if (registerRequest)
  {
    if (!v64)
      goto LABEL_177;
    objc_msgSend_mergeFrom_(registerRequest, (const char *)v6, v64, v5);
  }
  else
  {
    if (!v64)
      goto LABEL_177;
    objc_msgSend_setRegisterRequest_(self, (const char *)v6, v64, v5);
  }
  v6 = v79;
LABEL_177:
  registerResponse = self->_registerResponse;
  v66 = v6[25];
  if (registerResponse)
  {
    if (!v66)
      goto LABEL_183;
    objc_msgSend_mergeFrom_(registerResponse, (const char *)v6, v66, v5);
  }
  else
  {
    if (!v66)
      goto LABEL_183;
    objc_msgSend_setRegisterResponse_(self, (const char *)v6, v66, v5);
  }
  v6 = v79;
LABEL_183:
  registerIndication = self->_registerIndication;
  v68 = v6[23];
  if (registerIndication)
  {
    if (!v68)
      goto LABEL_189;
    objc_msgSend_mergeFrom_(registerIndication, (const char *)v6, v68, v5);
  }
  else
  {
    if (!v68)
      goto LABEL_189;
    objc_msgSend_setRegisterIndication_(self, (const char *)v6, v68, v5);
  }
  v6 = v79;
LABEL_189:
  registerAckRequest = self->_registerAckRequest;
  v70 = v6[21];
  if (registerAckRequest)
  {
    if (!v70)
      goto LABEL_195;
    objc_msgSend_mergeFrom_(registerAckRequest, (const char *)v6, v70, v5);
  }
  else
  {
    if (!v70)
      goto LABEL_195;
    objc_msgSend_setRegisterAckRequest_(self, (const char *)v6, v70, v5);
  }
  v6 = v79;
LABEL_195:
  registerAckResponse = self->_registerAckResponse;
  v72 = v6[22];
  if (registerAckResponse)
  {
    if (!v72)
      goto LABEL_201;
    objc_msgSend_mergeFrom_(registerAckResponse, (const char *)v6, v72, v5);
  }
  else
  {
    if (!v72)
      goto LABEL_201;
    objc_msgSend_setRegisterAckResponse_(self, (const char *)v6, v72, v5);
  }
  v6 = v79;
LABEL_201:
  unregisterRequest = self->_unregisterRequest;
  v74 = v6[36];
  if (unregisterRequest)
  {
    if (!v74)
      goto LABEL_207;
    objc_msgSend_mergeFrom_(unregisterRequest, (const char *)v6, v74, v5);
  }
  else
  {
    if (!v74)
      goto LABEL_207;
    objc_msgSend_setUnregisterRequest_(self, (const char *)v6, v74, v5);
  }
  v6 = v79;
LABEL_207:
  unregisterResponse = self->_unregisterResponse;
  v76 = v6[37];
  if (unregisterResponse)
  {
    if (!v76)
      goto LABEL_213;
    objc_msgSend_mergeFrom_(unregisterResponse, (const char *)v6, v76, v5);
  }
  else
  {
    if (!v76)
      goto LABEL_213;
    objc_msgSend_setUnregisterResponse_(self, (const char *)v6, v76, v5);
  }
  v6 = v79;
LABEL_213:
  unregisterIndication = self->_unregisterIndication;
  v78 = v6[35];
  if (unregisterIndication)
  {
    if (v78)
    {
      objc_msgSend_mergeFrom_(unregisterIndication, (const char *)v6, v78, v5);
LABEL_218:
      v6 = v79;
    }
  }
  else if (v78)
  {
    objc_msgSend_setUnregisterIndication_(self, (const char *)v6, v78, v5);
    goto LABEL_218;
  }

}

- (IDSQRProtoAllocBindRequest)allocbindRequest
{
  return self->_allocbindRequest;
}

- (IDSQRProtoAllocBindResponse)allocbindResponse
{
  return self->_allocbindResponse;
}

- (IDSQRProtoDiagnosticIndication)diagnosticIndication
{
  return self->_diagnosticIndication;
}

- (IDSQRProtoGoAwayIndication)goawayIndication
{
  return self->_goawayIndication;
}

- (IDSQRProtoInfoRequest)infoRequest
{
  return self->_infoRequest;
}

- (IDSQRProtoInfoResponse)infoResponse
{
  return self->_infoResponse;
}

- (IDSQRProtoParticipantUpdateRequest)participantupdateRequest
{
  return self->_participantupdateRequest;
}

- (IDSQRProtoParticipantUpdateResponse)participantupdateResponse
{
  return self->_participantupdateResponse;
}

- (IDSQRProtoParticipantUpdateIndication)participantupdateIndication
{
  return self->_participantupdateIndication;
}

- (IDSQRProtoPluginControlRequest)plugincontrolRequest
{
  return self->_plugincontrolRequest;
}

- (IDSQRProtoPluginControlResponse)plugincontrolResponse
{
  return self->_plugincontrolResponse;
}

- (IDSQRProtoPluginControlIndication)plugincontrolIndication
{
  return self->_plugincontrolIndication;
}

- (IDSQRProtoErrorIndication)errorIndication
{
  return self->_errorIndication;
}

- (IDSQRProtoReallocateIndication)reallocateIndication
{
  return self->_reallocateIndication;
}

- (IDSQRProtoSessionInfoRequest)sessioninfoRequest
{
  return self->_sessioninfoRequest;
}

- (IDSQRProtoSessionInfoResponse)sessioninfoResponse
{
  return self->_sessioninfoResponse;
}

- (IDSQRProtoSessionInfoIndication)sessioninfoIndication
{
  return self->_sessioninfoIndication;
}

- (IDSQRProtoStatsRequest)statsRequest
{
  return self->_statsRequest;
}

- (IDSQRProtoStatsResponse)statsResponse
{
  return self->_statsResponse;
}

- (IDSQRProtoTestRequest)testRequest
{
  return self->_testRequest;
}

- (IDSQRProtoTestResponse)testResponse
{
  return self->_testResponse;
}

- (IDSQRProtoUnAllocBindRequest)unallocbindRequest
{
  return self->_unallocbindRequest;
}

- (IDSQRProtoUnAllocBindResponse)unallocbindResponse
{
  return self->_unallocbindResponse;
}

- (IDSQRProtoPutMaterialRequest)putmaterialRequest
{
  return self->_putmaterialRequest;
}

- (IDSQRProtoPutMaterialResponse)putmaterialResponse
{
  return self->_putmaterialResponse;
}

- (IDSQRProtoPutMaterialIndication)putmaterialIndication
{
  return self->_putmaterialIndication;
}

- (IDSQRProtoGetMaterialRequest)getmaterialRequest
{
  return self->_getmaterialRequest;
}

- (IDSQRProtoGetMaterialResponse)getmaterialResponse
{
  return self->_getmaterialResponse;
}

- (IDSQRProtoH3EndToEndChannelRegisterRequest)registerRequest
{
  return self->_registerRequest;
}

- (IDSQRProtoH3EndToEndChannelRegisterResponse)registerResponse
{
  return self->_registerResponse;
}

- (IDSQRProtoH3EndToEndChannelRegisterIndication)registerIndication
{
  return self->_registerIndication;
}

- (IDSQRProtoH3EndToEndChannelRegisterAckRequest)registerAckRequest
{
  return self->_registerAckRequest;
}

- (IDSQRProtoH3EndToEndChannelRegisterAckResponse)registerAckResponse
{
  return self->_registerAckResponse;
}

- (IDSQRProtoH3EndToEndChannelUnRegisterRequest)unregisterRequest
{
  return self->_unregisterRequest;
}

- (IDSQRProtoH3EndToEndChannelUnRegisterResponse)unregisterResponse
{
  return self->_unregisterResponse;
}

- (IDSQRProtoH3EndToEndChannelUnRegisterIndication)unregisterIndication
{
  return self->_unregisterIndication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unregisterResponse, 0);
  objc_storeStrong((id *)&self->_unregisterRequest, 0);
  objc_storeStrong((id *)&self->_unregisterIndication, 0);
  objc_storeStrong((id *)&self->_unallocbindResponse, 0);
  objc_storeStrong((id *)&self->_unallocbindRequest, 0);
  objc_storeStrong((id *)&self->_testResponse, 0);
  objc_storeStrong((id *)&self->_testRequest, 0);
  objc_storeStrong((id *)&self->_statsResponse, 0);
  objc_storeStrong((id *)&self->_statsRequest, 0);
  objc_storeStrong((id *)&self->_sessioninfoResponse, 0);
  objc_storeStrong((id *)&self->_sessioninfoRequest, 0);
  objc_storeStrong((id *)&self->_sessioninfoIndication, 0);
  objc_storeStrong((id *)&self->_registerResponse, 0);
  objc_storeStrong((id *)&self->_registerRequest, 0);
  objc_storeStrong((id *)&self->_registerIndication, 0);
  objc_storeStrong((id *)&self->_registerAckResponse, 0);
  objc_storeStrong((id *)&self->_registerAckRequest, 0);
  objc_storeStrong((id *)&self->_reallocateIndication, 0);
  objc_storeStrong((id *)&self->_putmaterialResponse, 0);
  objc_storeStrong((id *)&self->_putmaterialRequest, 0);
  objc_storeStrong((id *)&self->_putmaterialIndication, 0);
  objc_storeStrong((id *)&self->_plugincontrolResponse, 0);
  objc_storeStrong((id *)&self->_plugincontrolRequest, 0);
  objc_storeStrong((id *)&self->_plugincontrolIndication, 0);
  objc_storeStrong((id *)&self->_participantupdateResponse, 0);
  objc_storeStrong((id *)&self->_participantupdateRequest, 0);
  objc_storeStrong((id *)&self->_participantupdateIndication, 0);
  objc_storeStrong((id *)&self->_infoResponse, 0);
  objc_storeStrong((id *)&self->_infoRequest, 0);
  objc_storeStrong((id *)&self->_goawayIndication, 0);
  objc_storeStrong((id *)&self->_getmaterialResponse, 0);
  objc_storeStrong((id *)&self->_getmaterialRequest, 0);
  objc_storeStrong((id *)&self->_errorIndication, 0);
  objc_storeStrong((id *)&self->_diagnosticIndication, 0);
  objc_storeStrong((id *)&self->_allocbindResponse, 0);
  objc_storeStrong((id *)&self->_allocbindRequest, 0);
}

@end
