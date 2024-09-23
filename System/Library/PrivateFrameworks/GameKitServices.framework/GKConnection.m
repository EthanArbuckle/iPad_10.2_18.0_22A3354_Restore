@implementation GKConnection

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_class *v4;

  v4 = (objc_class *)a1;
  if ((id)objc_opt_self() == a1)
    v4 = (objc_class *)objc_opt_self();
  return NSAllocateObject(v4, 0, a3);
}

- (GKConnection)initWithParticipantID:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v4, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (void)preRelease
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v2, sel_doesNotRecognizeSelector_, a2);
}

- (OpaqueGCKSession)gckSession
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (opaqueRTCReporting)reportingAgent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (void)setReportingAgent:(opaqueRTCReporting *)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
}

- (void)setEventDelegate:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
}

- (id)eventDelegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (unsigned)gckPID
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (void)connect
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v2, sel_doesNotRecognizeSelector_, a2);
}

- (void)getLocalConnectionDataWithCompletionHandler:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
}

- (BOOL)convertParticipantID:(id)a3 toPeerID:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v5, sel_doesNotRecognizeSelector_, a2, a4);
  return 0;
}

- (BOOL)convertPeerID:(id)a3 toParticipantID:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v5, sel_doesNotRecognizeSelector_, a2, a4);
  return 0;
}

- (void)setParticipantID:(id)a3 forPeerID:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v4, sel_doesNotRecognizeSelector_, a2, a4);
}

- (void)connectParticipantsWithConnectionData:(id)a3 withSessionInfo:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v4, sel_doesNotRecognizeSelector_, a2, a4);
}

- (void)initiateRelayWithParticipant:(id)a3 withConnectionData:(id)a4 withRelayInfo:(id)a5 didInitiate:(BOOL)a6
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v6, sel_doesNotRecognizeSelector_, a2, a4, a5, a6);
}

- (void)updateRelayWithParticipant:(id)a3 withConnectionData:(id)a4 withRelayInfo:(id)a5 didInitiate:(BOOL)a6
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v6, sel_doesNotRecognizeSelector_, a2, a4, a5, a6);
}

- (void)cancelConnectParticipant:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
}

- (id)networkStatisticsDictionaryForGCKStats:(void *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v4, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (id)networkStatistics
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (id)getLocalConnectionDataForLocalGaming
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

+ (id)externalAddressForSelfConnectionData:(id)a3
{
  return (id)objc_msgSend(a3, "subdataWithRange:", 5, 4);
}

+ (id)externalAddressForCDXSelfConnectionData:(id)a3
{
  return (id)objc_msgSend(a3, "subdataWithRange:", 1, 4);
}

+ (BOOL)isRelayEnabled
{
  if ((isRelayEnabled_relayEnabledCached & 1) == 0)
  {
    isRelayEnabled_relayEnabled = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "objectForKey:", CFSTR("GeckoDisableRelay")), "BOOLValue") ^ 1;
    isRelayEnabled_relayEnabledCached = 1;
    if ((int)*MEMORY[0x24BDFDC10] > 6 || *MEMORY[0x24BDFDC20] != 0)
      VRTraceVariable_();
  }
  return isRelayEnabled_relayEnabled;
}

@end
