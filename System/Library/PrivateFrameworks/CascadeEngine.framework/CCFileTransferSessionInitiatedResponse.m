@implementation CCFileTransferSessionInitiatedResponse

+ (id)fileTransferSessionInitiatedResponseFromPeerToPeerMessage:(id)a3 peerPublicKey:(id)a4
{
  id v5;
  id v6;
  CCFileTransferSessionInitiatedResponse *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  CCFileTransferSessionInitiatedResponse *v14;

  v5 = a4;
  v6 = a3;
  v7 = [CCFileTransferSessionInitiatedResponse alloc];
  objc_msgSend(v6, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "protocolVersion");
  objc_msgSend(v6, "walltime");
  v12 = v11;
  objc_msgSend(v6, "peerPublicKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[CCPeerToPeerMessage initWithSet:device:protocolVersion:wallTime:peerPublicKey:](v7, "initWithSet:device:protocolVersion:wallTime:peerPublicKey:", v8, v9, v10, v13, v12);
  -[CCPeerToPeerMessage setPeerPublicKey:](v14, "setPeerPublicKey:", v5);

  return v14;
}

@end
