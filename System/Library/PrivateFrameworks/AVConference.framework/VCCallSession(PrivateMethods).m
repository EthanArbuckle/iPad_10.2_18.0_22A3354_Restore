@implementation VCCallSession(PrivateMethods)

- (void)setupIDSConnectionForCallID:()PrivateMethods destination:socket:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d startConnectionWithParticipantID: idsSocket and destination are invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupIDSConnectionForCallID:()PrivateMethods destination:socket:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d startConnectionWithParticipantID: idsSocket and destination are invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setSKEBlobOnTransportSession
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCallSession(PrivateMethods) setSKEBlobOnTransportSession]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d SKEState_CopyBlobSync(1) failed with error %d", v2, *(const char **)v3, (unint64_t)"-[VCCallSession(PrivateMethods) setSKEBlobOnTransportSession]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)configureLegacyTransportWithInviteInfo:()PrivateMethods error:.cold.1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  if (v1)
    objc_msgSend((id)OUTLINED_FUNCTION_43(v0, v1), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d configureLegacyTransportWithInviteInfo failed: remote blob %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)configureLegacyTransportWithInviteInfo:()PrivateMethods error:.cold.2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  if (v1)
    objc_msgSend((id)OUTLINED_FUNCTION_43(v0, v1), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d configureLegacyTransportWithInviteInfo failed: remote blob %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)newSKEBlobWithRemoteSKEBlob:()PrivateMethods .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed retreiving the localIdentity from APS", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newSKEBlobWithRemoteSKEBlob:()PrivateMethods .cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCallSession(PrivateMethods) newSKEBlobWithRemoteSKEBlob:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d SKEState_CopyBlobSync(0) failed with error %d", v2, *(const char **)v3, (unint64_t)"-[VCCallSession(PrivateMethods) newSKEBlobWithRemoteSKEBlob:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)newSKEBlobWithRemoteSKEBlob:()PrivateMethods .cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCallSession(PrivateMethods) newSKEBlobWithRemoteSKEBlob:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d SKEState_Create failed with error %d", v2, *(const char **)v3, (unint64_t)"-[VCCallSession(PrivateMethods) newSKEBlobWithRemoteSKEBlob:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setupEncryptionWithKey:()PrivateMethods confIndex:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d setupEncryptionWithKey: Cancelling audio encryption", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupEncryptionWithKey:()PrivateMethods confIndex:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d setupEncryptionWithKey: Cancelling video encryption", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupEncryptionWithKey:()PrivateMethods confIndex:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d ---- keyex returns bad key", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createSDP:()PrivateMethods audioPayloadCount:secondaryPayloadTypes:secondaryPayloadCount:videoPayloadTypes:videoPayloadCount:localFeatureList:answerBandwidth:maxBandwidth:imageSizesSend:imageSendCount:imageSizesRecv:imageRecvCount:sdp:numSDPBytes:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d createSDP failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createSDP:()PrivateMethods audioPayloadCount:secondaryPayloadTypes:secondaryPayloadCount:videoPayloadTypes:videoPayloadCount:localFeatureList:answerBandwidth:maxBandwidth:imageSizesSend:imageSendCount:imageSizesRecv:imageRecvCount:sdp:numSDPBytes:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d createSDP failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)setRxPayloadList:()PrivateMethods withPayloadTypes:isRedEnabled:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to allocate payload list", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)applyNegotiatedAudioSettings:()PrivateMethods .cold.1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d Failed to apply audio settings!!! error = (%s)", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)applyNegotiatedAudioSettings:()PrivateMethods .cold.2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d Failed to apply audio settings!!! error = (%s)", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)applyNegotiatedAudioSettings:()PrivateMethods .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to set audio remote RTP id", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)applyNegotiatedAudioSettings:()PrivateMethods .cold.4()
{
  NSObject *v0;
  id v1;
  __int16 v2;
  int v3;
  uint64_t v4;
  uint8_t v5[14];
  const char *v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  OUTLINED_FUNCTION_14_2();
  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "primaryPayload");
  OUTLINED_FUNCTION_12_0();
  v6 = "-[VCCallSession(PrivateMethods) applyNegotiatedAudioSettings:]";
  OUTLINED_FUNCTION_4();
  v7 = 6134;
  v8 = v2;
  v9 = v3;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, v4, "VCCallSession [%s] %s:%d Failed to setup audioCodec for primaryPayload=%d", v5);
  OUTLINED_FUNCTION_3_0();
}

- (void)applyNegotiatedVideoSettings:()PrivateMethods .cold.1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d Failed to apply video settings!!! error = (%s)", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)applyNegotiatedVideoSettings:()PrivateMethods .cold.2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d Failed to apply video settings!!! error = (%s)", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)applyNegotiatedVideoSettings:()PrivateMethods .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d No valid video rules found for the current connection settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)applyNegotiatedVideoSettings:()PrivateMethods .cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Video settings not found in pre-negotiated settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startMediaWithPreNegotiatedSettings:()PrivateMethods .cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;

  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_19_0(4.8153e-34, v0, v1, v2);
  *(_QWORD *)(v3 + 14) = "-[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:]";
  *(_WORD *)(v3 + 22) = 1024;
  OUTLINED_FUNCTION_21(v4, v3);
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v7, v5, "VCCallSession [%s] %s:%d Failed to start media!!! error = (%s)", v6);
}

- (void)startMediaWithPreNegotiatedSettings:()PrivateMethods .cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  os_log_t v6;

  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_19_0(4.8153e-34, v0, v1, v2);
  *(_QWORD *)(v3 + 14) = "-[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:]";
  *(_WORD *)(v3 + 22) = 1024;
  OUTLINED_FUNCTION_21(v4, v3);
  _os_log_fault_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_FAULT, "VCCallSession [%s] %s:%d Failed to start media!!! error = (%s)", v5, 0x26u);
}

- (void)startMediaWithPreNegotiatedSettings:()PrivateMethods .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to start video", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startMediaWithPreNegotiatedSettings:()PrivateMethods .cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d SIP started, no secret key yet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startMediaWithPreNegotiatedSettings:()PrivateMethods .cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to start media queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startMediaWithPreNegotiatedSettings:()PrivateMethods .cold.6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  NSObject *v9;

  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_19_0(4.8153e-34, v0, v1, v2);
  OUTLINED_FUNCTION_23(v3, v4);
  OUTLINED_FUNCTION_21(v5, v6);
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v9, v7, "VCCallSession [%s] %s:%d failed: Couldn't create the audio rtp handles!!! error = (%s)", v8);
}

- (void)startMediaWithPreNegotiatedSettings:()PrivateMethods .cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to start rate controller", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startMediaWithPreNegotiatedSettings:()PrivateMethods .cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Callee: setMediaQueueStreamSettings returned NO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startMediaWithPreNegotiatedSettings:()PrivateMethods .cold.9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  NSObject *v9;

  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_19_0(4.8153e-34, v0, v1, v2);
  OUTLINED_FUNCTION_23(v3, v4);
  OUTLINED_FUNCTION_21(v5, v6);
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v9, v7, "VCCallSession [%s] %s:%d failed: Couldn't create the media queue handle! error = (%s)", v8);
}

- (void)startMediaWithPreNegotiatedSettings:()PrivateMethods .cold.10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  NSObject *v9;

  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_19_0(4.8153e-34, v0, v1, v2);
  OUTLINED_FUNCTION_23(v3, v4);
  OUTLINED_FUNCTION_21(v5, v6);
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v9, v7, "VCCallSession [%s] %s:%d failed: Couldn't prepare SRTP for the rtp handles!!! error = (%s)", v8);
}

- (void)startMediaWithPreNegotiatedSettings:()PrivateMethods .cold.11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  NSObject *v9;

  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_19_0(4.8153e-34, v0, v1, v2);
  OUTLINED_FUNCTION_23(v3, v4);
  OUTLINED_FUNCTION_21(v5, v6);
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v9, v7, "VCCallSession [%s] %s:%d failed: Couldn't create the rtp handles!!! error = (%s)", v8);
}

- (void)handleIncomingWithCallID:()PrivateMethods msgIn:msgOut:optional:confIndex:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d input SDP was NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleIncomingWithCallID:()PrivateMethods msgIn:msgOut:optional:confIndex:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d imageAttrForAnswer returned an error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleIncomingWithCallID:()PrivateMethods msgIn:msgOut:optional:confIndex:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "imageAttrForAnswer";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d *pReceiveCount is zero (payload=%d)", v2, *(const char **)v3, (unint64_t)"imageAttrForAnswer" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)handleIncomingWithCallID:()PrivateMethods msgIn:msgOut:optional:confIndex:error:.cold.4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d Couldn't create the audio transmitter!!! error = (%s)", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)handleIncomingWithCallID:()PrivateMethods msgIn:msgOut:optional:confIndex:error:.cold.5()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d Callee: createSDP failed with error %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)handleIncomingWithCallID:()PrivateMethods msgIn:msgOut:optional:confIndex:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Callee: setMediaQueueStreamSettings returned NO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleIncomingWithCallID:()PrivateMethods msgIn:msgOut:optional:confIndex:error:.cold.7()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d Callee: setRTPPayloadWithError returned NO with error %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)handleIncomingWithCallID:()PrivateMethods msgIn:msgOut:optional:confIndex:error:.cold.8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d Callee: negotiatePayloadWithError returned NO with error %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)handleIncomingWithCallID:()PrivateMethods msgIn:msgOut:optional:confIndex:error:.cold.9()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d Couldn't create the media queue handle! error = (%s)", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)handleIncomingWithCallID:()PrivateMethods msgIn:msgOut:optional:confIndex:error:.cold.10()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d Couldn't prepare SRTP for the rtp handles!!! error = (%s)", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)handleIncomingWithCallID:()PrivateMethods msgIn:msgOut:optional:confIndex:error:.cold.11()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d Couldn't create the rtp handles!!! error = (%s)", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)getAllPayloadsForVideo:()PrivateMethods count:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Override unrecognized payload", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createInviteSDPWithError:()PrivateMethods .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to allocate image attributes memory for image send", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createInviteSDPWithError:()PrivateMethods .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to allocate image attributes memory for image receive", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createInviteSDPWithError:()PrivateMethods .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to allocate image attributes memory for image send count", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createInviteSDPWithError:()PrivateMethods .cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to allocate image attributes memory for image receive count", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createInviteSDPWithError:()PrivateMethods .cold.5()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d sendSIPInviteWithError: createSDP failed with error %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)sendSIPInviteWithError:()PrivateMethods .cold.1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d sendSIPInviteWithError failed: couldn't establish connection with SDP! error = (%s)", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)sendSIPInviteWithError:()PrivateMethods .cold.2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d sendSIPInviteWithError failed: SDP string is empty! error = (%s)", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)sendSIPInviteWithError:()PrivateMethods .cold.3()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d sendSIPInviteWithError failed: Couldn't create the media queue handle! error = (%s)", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)sendSIPInviteWithError:()PrivateMethods .cold.4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d sendSIPInviteWithError failed: Couldn't prepare SRTP for the rtp handles!!! error = (%s)", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)sendSIPInviteWithError:()PrivateMethods .cold.5()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d sendSIPInviteWithError failed: Couldn't create the rtp handles!!! error = (%s)", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)prepareSRTPWithError:()PrivateMethods .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d VCCallSession: FAILED TO PREPARE ENCRYPTION FOR VIDEO...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)prepareSRTPWithError:()PrivateMethods .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d VCCallSession: FAILED TO PREPARE ENCRYPTION FOR VIDEO...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)prepareSRTPWithError:()PrivateMethods .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d VCCallSession: FAILED TO PREPARE ENCRYPTION FOR AUDIO...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)prepareSRTPWithError:()PrivateMethods .cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d VCCallSession: FAILED TO PREPARE ENCRYPTION FOR AUDIO...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createMediaQueueHandle:()PrivateMethods .cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCallSession(PrivateMethods) createMediaQueueHandle:]";
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_2(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m:%d: MediaQueue_CreateHandle failed (%08X)", v2, *(const char **)v3, (unint64_t)"-[VCCallSession(PrivateMethods) createMediaQueueHandle:]" >> 16, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)createMediaQueueHandle:()PrivateMethods .cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCallSession(PrivateMethods) createMediaQueueHandle:]";
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_11_8(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m:%d: MediaQueue_CreateHandle failed (%08X)", v2, *(const char **)v3, (unint64_t)"-[VCCallSession(PrivateMethods) createMediaQueueHandle:]" >> 16, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)negotiatePayloads:()PrivateMethods withError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d parseSDP failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiatePayloads:()PrivateMethods withError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d SetBWEstMode critical failure.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiatePayloads:()PrivateMethods withError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d SetBWEstMode critical failure.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiatePayloads:()PrivateMethods withError:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Could not find matching video codec", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiatePayloads:()PrivateMethods withError:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Could not find matching video codec", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiatePayloads:()PrivateMethods withError:.cold.6()
{
  os_log_t v0;
  uint8_t v1[24];
  int v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  v2 = 7508;
  _os_log_debug_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_DEBUG, "VCCallSession [%s] %s:%d Not using secondary audio, no codecs found", v1, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

- (void)negotiatePayloads:()PrivateMethods withError:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Could not find matching codec", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiatePayloads:()PrivateMethods withError:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Could not find matching codec", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)getAllCompatibleVideoPayloads:()PrivateMethods forMediaType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Override unrecognized payload", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)getCompatibleLocalFeatureListForPayloads:()PrivateMethods count:.cold.1(uint64_t a1, NSObject *a2)
{
  __int16 v3;
  uint64_t v4;
  __int16 v5;
  uint8_t v6[24];
  int v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(&unk_1E9EF52D0, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  v7 = 7929;
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v11 = 0;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, "VCCallSession [%s] %s:%d filterFeatureListForPayloads: Unexpected for %s count: %d", v6, 0x2Cu);
}

- (void)setMediaQueueStreamSettings
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCallSession(PrivateMethods) setMediaQueueStreamSettings]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d RTPSetThrottlingAudioInterval returned %d", v2, *(const char **)v3, (unint64_t)"-[VCCallSession(PrivateMethods) setMediaQueueStreamSettings]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setupCallerRTPChannelWithError:()PrivateMethods .cold.1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d createAudioTransmitter returned NO with error %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)setupCallerRTPChannelWithError:()PrivateMethods .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d VCAudioReceiver_Start returned NO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupCallerRTPChannelWithError:()PrivateMethods .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d setMediaQueueStreamSettings returned NO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupCallerRTPChannelWithError:()PrivateMethods .cold.4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d setRTPPayloadWithError returned NO with error %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)setupCallerRTPChannelWithError:()PrivateMethods .cold.5()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d negotiatePayloadWithError returned NO with error %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)updateDeviceRole:()PrivateMethods .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d updateDeviceRole: start audio timed out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateDeviceRole:()PrivateMethods .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d updateDeviceRole: start audio timed out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateDeviceRole:()PrivateMethods .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d stop audio timed out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateDeviceRole:()PrivateMethods .cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d stop audio timed out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startVideoSend:()PrivateMethods error:.cold.1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d VCCallSession: startVideo FAILED: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)startVideoSend:()PrivateMethods error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Could not initialize video transmitter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startVideoSend:()PrivateMethods error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d VCCALLSESSION: call is not ready for startVideoIO, returning error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startVideoReceive:()PrivateMethods .cold.1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d VCCallSession: startVideo FAILED: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)startVideoReceive:()PrivateMethods .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d VCCALLSESSION: call is not ready for startVideoIO, returning error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stopVideoSend:()PrivateMethods error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d stopVideoIO:FALSE FAILED:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startAFRC:()PrivateMethods .cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCallSession(PrivateMethods) startAFRC:]";
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_2(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m:%d: AFRCCreateHandle failed (%08X)", v2, *(const char **)v3, (unint64_t)"-[VCCallSession(PrivateMethods) startAFRC:]" >> 16, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)startAFRC:()PrivateMethods .cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCallSession(PrivateMethods) startAFRC:]";
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_11_8(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m:%d: AFRCCreateHandle failed (%08X)", v2, *(const char **)v3, (unint64_t)"-[VCCallSession(PrivateMethods) startAFRC:]" >> 16, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)startRateControl:()PrivateMethods .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to start VCRC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startRateControl:()PrivateMethods .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to start AFRC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sipConnectThreadProc:()PrivateMethods .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d SIP started, no secret key yet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)videoRTPID
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCallSession(PrivateMethods) videoRTPID]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_2(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m:%d: RTPGetLocalSSRC for video failed (%08X)", v2, *(const char **)v3, (unint64_t)"-[VCCallSession(PrivateMethods) videoRTPID]" >> 16, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)handleDuplicationEnabled:()PrivateMethods activeConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d got a nil connection to use", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)mapPacketMultiplexModeToRTPMode:()PrivateMethods .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Invalid VCCallSession packet multiplex mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)mapPacketMultiplexModeToSIPMode:()PrivateMethods .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Invalid VCCallSession packet multiplex mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)disconnectInternal:()PrivateMethods disconnectError:didRemoteCancel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to send disconnect message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
