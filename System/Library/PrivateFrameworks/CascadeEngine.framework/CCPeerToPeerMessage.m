@implementation CCPeerToPeerMessage

- (CCPeerToPeerMessage)initWithSet:(id)a3 device:(id)a4 protocolVersion:(unint64_t)a5 wallTime:(double)a6 peerPublicKey:(id)a7
{
  id v13;
  id v14;
  id v15;
  CCPeerToPeerMessage *v16;
  CCPeerToPeerMessage *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)CCPeerToPeerMessage;
  v16 = -[CCPeerToPeerMessage init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_set, a3);
    objc_storeStrong((id *)&v17->_device, a4);
    v17->_protocolVersion = a5;
    v17->_walltime = a6;
    objc_storeStrong((id *)&v17->_peerPublicKey, a7);
  }

  return v17;
}

- (id)initFromDictionary:(id)a3
{
  id v4;
  CCPeerToPeerMessage *v5;
  void *v6;
  unsigned __int16 v7;
  id v8;
  void *v9;
  uint64_t v10;
  CCSet *set;
  void *v12;
  void *v13;
  double v14;
  id v15;
  void *v16;
  uint64_t v17;
  CCDevice *device;
  uint64_t v19;
  NSData *peerPublicKey;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CCPeerToPeerMessage;
  v5 = -[CCPeerToPeerMessage init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("itemType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    v8 = objc_alloc(MEMORY[0x24BE156D8]);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("descriptors"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithItemType:encodedDescriptors:error:", v7, v9, 0);
    set = v5->_set;
    v5->_set = (CCSet *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("protocolVersion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_protocolVersion = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("walltime"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v5->_walltime = v14;

    v15 = objc_alloc(MEMORY[0x24BE15668]);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithIdentifier:options:", v16, 0);
    device = v5->_device;
    v5->_device = (CCDevice *)v17;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("peerPublicKey"));
    v19 = objc_claimAutoreleasedReturnValue();
    peerPublicKey = v5->_peerPublicKey;
    v5->_peerPublicKey = (NSData *)v19;

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSData *peerPublicKey;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[6];
  _QWORD v17[7];

  v17[6] = *MEMORY[0x24BDAC8D0];
  v16[0] = CFSTR("itemType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", -[CCSet itemType](self->_set, "itemType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v15;
  v16[1] = CFSTR("descriptors");
  v3 = (void *)MEMORY[0x24BE156F8];
  -[CCSet descriptors](self->_set, "descriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encodedStringFromDescriptors:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v6;
  v16[2] = CFSTR("protocolVersion");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_protocolVersion);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v7;
  v16[3] = CFSTR("walltime");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_walltime);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v8;
  v16[4] = CFSTR("deviceIdentifier");
  -[CCDevice identifier](self->_device, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[4] = v10;
  v16[5] = CFSTR("peerPublicKey");
  peerPublicKey = self->_peerPublicKey;
  v12 = peerPublicKey;
  if (!peerPublicKey)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[5] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (peerPublicKey)
  {
    if (v9)
      goto LABEL_9;
  }
  else
  {

    if (v9)
      goto LABEL_9;
  }

LABEL_9:
  if (!v5)

  return v13;
}

- (CCSet)set
{
  return self->_set;
}

- (CCDevice)device
{
  return self->_device;
}

- (unint64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (double)walltime
{
  return self->_walltime;
}

- (NSData)peerPublicKey
{
  return self->_peerPublicKey;
}

- (void)setPeerPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_peerPublicKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPublicKey, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_set, 0);
}

@end
