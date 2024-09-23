@implementation NTKDSyncMessage

+ (id)messageOfType:(int64_t)a3
{
  NTKDSyncMessage *v4;

  v4 = objc_alloc_init(NTKDSyncMessage);
  -[NTKDSyncMessage setMessageType:](v4, "setMessageType:", a3);
  return v4;
}

+ (id)colorSyncMessageWithData:(id)a3 domain:(id)a4
{
  NSData *v5;
  NSString *v6;
  NTKDSyncMessage *v7;
  NSData *payloadData;
  NSData *v9;
  NSString *label;

  v5 = (NSData *)a3;
  v6 = (NSString *)a4;
  v7 = objc_alloc_init(NTKDSyncMessage);
  -[NTKDSyncMessage setMessageType:](v7, "setMessageType:", 11);
  payloadData = v7->_payloadData;
  v7->_payloadData = v5;
  v9 = v5;

  label = v7->_label;
  v7->_label = v6;

  return v7;
}

+ (id)messageOfType:(int64_t)a3 withFaceUUID:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "messageOfType:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFaceUUID:", v6);

  return v7;
}

+ (id)messageOfType:(int64_t)a3 withCollectionIdentifier:(id)a4 clientId:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a1, "messageOfType:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComplicationCollectionIdentifier:", v9);

  objc_msgSend(v10, "setComplicationClientID:", v8);
  return v10;
}

+ (id)messageOfType:(int64_t)a3 withCollectionIdentifier:(id)a4 clientId:(id)a5 descriptor:(id)a6 family:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v12 = a6;
  v13 = a7;
  v14 = a5;
  v15 = a4;
  objc_msgSend(a1, "messageOfType:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setComplicationCollectionIdentifier:", v15);

  objc_msgSend(v16, "setComplicationClientID:", v14);
  if (v12)
  {
    objc_msgSend(v16, "setComplicationDescriptor:", v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C94148], "legacyComplicationDescriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setComplicationDescriptor:", v17);

  }
  objc_msgSend(v16, "setComplicationFamily:", v13);

  return v16;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  NSData *payloadData;
  void *v7;
  NSData *v8;
  void *v9;
  NSUUID *wideLoadId;
  uint64_t v12;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend((id)objc_opt_class(), "messageTypeDescription:", self->_messageType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("MESSAGE[type:%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  switch(self->_messageType)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 9:
      objc_msgSend(v5, "appendFormat:", CFSTR(", faceUUID:%@, payload size:%lu"), self->_faceUUID, -[NSData length](self->_payloadData, "length"));
      break;
    case 4:
      payloadData = self->_payloadData;
      if (payloadData)
      {
        NTKDSelectedUUIDFromPayloadData(payloadData);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR(", selectedUUID:%@"), v7);
        goto LABEL_15;
      }
      break;
    case 5:
      v8 = self->_payloadData;
      if (v8)
      {
        NTKDOrderedUUIDsFromPayloadData(v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "ntk_flatDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR(", orderedUUIDs:%@"), v9);

LABEL_15:
      }
      break;
    case 6:
    case 7:
    case 8:
    case 0xALL:
      if (self->_complicationCollectionIdentifier)
        objc_msgSend(v5, "appendFormat:", CFSTR(", complicationStoreIdentifier:%@"), self->_complicationCollectionIdentifier);
      if (self->_complicationClientID)
        objc_msgSend(v5, "appendFormat:", CFSTR(", complicationClientID:%@"), self->_complicationClientID);
      if (self->_complicationDescriptor)
        objc_msgSend(v5, "appendFormat:", CFSTR(", complicationDescriptor:%@"), self->_complicationDescriptor);
      if (self->_complicationFamily)
        objc_msgSend(v5, "appendFormat:", CFSTR(", complicationFamily:%@"), self->_complicationFamily, v12);
      break;
    case 0xBLL:
      objc_msgSend(v5, "appendFormat:", CFSTR(", domain:%@"), self->_label, v12);
      break;
    default:
      break;
  }
  wideLoadId = self->_wideLoadId;
  if (wideLoadId)
    objc_msgSend(v5, "appendFormat:", CFSTR(", wideLoadId:%@, part %lu/%lu"), wideLoadId, self->_partNumber, self->_numberOfParts);
  objc_msgSend(v5, "appendString:", CFSTR("]"));
  return (NSString *)v5;
}

+ (id)messageTypeDescription:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 0xC)
    return 0;
  else
    return off_1E6BD4288[a3 + 1];
}

- (NSString)objectIdentifier
{
  void *v3;
  NSString *complicationCollectionIdentifier;
  NSString *complicationClientID;
  void *v6;
  void *v7;
  void *v8;
  NSNumber *complicationFamily;
  void *v10;
  void *v11;
  NSUUID *wideLoadId;
  __CFString *v13;
  __int128 v15;

  switch(self->_messageType)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 9:
      -[NSUUID UUIDString](self->_faceUUID, "UUIDString");

      goto LABEL_3;
    case 4:
    case 5:
    case 6:
    case 7:
LABEL_3:
      v3 = (void *)MEMORY[0x1E0CB3940];
      complicationCollectionIdentifier = self->_complicationCollectionIdentifier;
      complicationClientID = self->_complicationClientID;
      -[CLKComplicationDescriptor identifier](self->_complicationDescriptor, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@-%@"), complicationCollectionIdentifier, complicationClientID, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_4;
    case 8:
      goto LABEL_5;
    case 0xALL:
LABEL_4:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), self->_complicationCollectionIdentifier, self->_complicationClientID);

LABEL_5:
      v8 = (void *)MEMORY[0x1E0CB3940];
      v15 = *(_OWORD *)&self->_complicationCollectionIdentifier;
      complicationFamily = self->_complicationFamily;
      -[CLKComplicationDescriptor identifier](self->_complicationDescriptor, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-%@-%@-%@"), v15, complicationFamily, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      break;
  }
  wideLoadId = self->_wideLoadId;
  if (wideLoadId)
  {
    objc_msgSend(CFSTR("unknown"), "stringByAppendingFormat:", CFSTR("%@-%lu-%lu"), wideLoadId, self->_partNumber, self->_numberOfParts);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = CFSTR("unknown");
  }
  return (NSString *)v13;
}

- (NSString)sequencer
{
  return 0;
}

- (int64_t)changeType
{
  int64_t messageType;
  BOOL v3;
  int64_t v4;

  messageType = self->_messageType;
  v3 = messageType == 7 || messageType == 3;
  v4 = 2;
  if (v3)
    v4 = 3;
  if (messageType)
    return v4;
  else
    return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKDSyncMessage)initWithCoder:(id)a3
{
  id v4;
  NTKDSyncMessage *v5;
  uint64_t v6;
  NSUUID *faceUUID;
  uint64_t v8;
  NSData *payloadData;
  uint64_t v10;
  NSString *label;
  void *v12;
  double v13;
  uint64_t v14;
  NSString *complicationClientID;
  uint64_t v16;
  CLKComplicationDescriptor *complicationDescriptor;
  uint64_t v18;
  CLKComplicationDescriptor *v19;
  uint64_t v20;
  NSNumber *complicationFamily;
  uint64_t v22;
  NSString *complicationCollectionIdentifier;
  uint64_t v24;
  NSUUID *wideLoadId;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)NTKDSyncMessage;
  v5 = -[NTKDSyncMessage init](&v30, sel_init);
  if (v5)
  {
    v5->_messageType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("messageType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("faceUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    faceUUID = v5->_faceUUID;
    v5->_faceUUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payload"));
    v8 = objc_claimAutoreleasedReturnValue();
    payloadData = v5->_payloadData;
    v5->_payloadData = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v10 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("progress"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v5->_progress = v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("complicationClientID"));
    v14 = objc_claimAutoreleasedReturnValue();
    complicationClientID = v5->_complicationClientID;
    v5->_complicationClientID = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("complicationDescriptor"));
    v16 = objc_claimAutoreleasedReturnValue();
    complicationDescriptor = v5->_complicationDescriptor;
    v5->_complicationDescriptor = (CLKComplicationDescriptor *)v16;

    if (!v5->_complicationDescriptor && (unint64_t)(v5->_messageType - 6) <= 2)
    {
      objc_msgSend(MEMORY[0x1E0C94148], "legacyComplicationDescriptor");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v5->_complicationDescriptor;
      v5->_complicationDescriptor = (CLKComplicationDescriptor *)v18;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("complicationFamily"));
    v20 = objc_claimAutoreleasedReturnValue();
    complicationFamily = v5->_complicationFamily;
    v5->_complicationFamily = (NSNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("complicationCollectionIdentifier"));
    v22 = objc_claimAutoreleasedReturnValue();
    complicationCollectionIdentifier = v5->_complicationCollectionIdentifier;
    v5->_complicationCollectionIdentifier = (NSString *)v22;

    if (!v5->_complicationCollectionIdentifier && (unint64_t)(v5->_messageType - 6) <= 2)
      objc_storeStrong((id *)&v5->_complicationCollectionIdentifier, CFSTR("RemoteComplicationsV2"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("wideLoadId")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wideLoadId"));
      v24 = objc_claimAutoreleasedReturnValue();
      wideLoadId = v5->_wideLoadId;
      v5->_wideLoadId = (NSUUID *)v24;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberOfParts"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_numberOfParts = objc_msgSend(v26, "unsignedLongValue");

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("partNumber"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_partNumber = objc_msgSend(v27, "unsignedLongValue");

      v5->_maxPartSize = 0;
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("maxPartSize")))
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxPartSize"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_maxPartSize = objc_msgSend(v28, "unsignedLongValue");

      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", self->_messageType, CFSTR("messageType"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_faceUUID, CFSTR("faceUUID"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_payloadData, CFSTR("payload"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_label, CFSTR("label"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_progress);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("progress"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_complicationClientID, CFSTR("complicationClientID"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_complicationDescriptor, CFSTR("complicationDescriptor"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_complicationFamily, CFSTR("complicationFamily"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_complicationCollectionIdentifier, CFSTR("complicationCollectionIdentifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_wideLoadId, CFSTR("wideLoadId"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_numberOfParts);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("numberOfParts"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_partNumber);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("partNumber"));

  if (self->_maxPartSize)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("maxPartSize"));

  }
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(int64_t)a3
{
  self->_messageType = a3;
}

- (NSUUID)faceUUID
{
  return self->_faceUUID;
}

- (void)setFaceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_faceUUID, a3);
}

- (NSData)payloadData
{
  return self->_payloadData;
}

- (void)setPayloadData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (NSString)complicationCollectionIdentifier
{
  return self->_complicationCollectionIdentifier;
}

- (void)setComplicationCollectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)complicationClientID
{
  return self->_complicationClientID;
}

- (void)setComplicationClientID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (CLKComplicationDescriptor)complicationDescriptor
{
  return self->_complicationDescriptor;
}

- (void)setComplicationDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)complicationFamily
{
  return self->_complicationFamily;
}

- (void)setComplicationFamily:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSUUID)wideLoadId
{
  return self->_wideLoadId;
}

- (void)setWideLoadId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (unint64_t)numberOfParts
{
  return self->_numberOfParts;
}

- (void)setNumberOfParts:(unint64_t)a3
{
  self->_numberOfParts = a3;
}

- (unint64_t)partNumber
{
  return self->_partNumber;
}

- (void)setPartNumber:(unint64_t)a3
{
  self->_partNumber = a3;
}

- (unint64_t)maxPartSize
{
  return self->_maxPartSize;
}

- (void)setMaxPartSize:(unint64_t)a3
{
  self->_maxPartSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wideLoadId, 0);
  objc_storeStrong((id *)&self->_complicationFamily, 0);
  objc_storeStrong((id *)&self->_complicationDescriptor, 0);
  objc_storeStrong((id *)&self->_complicationClientID, 0);
  objc_storeStrong((id *)&self->_complicationCollectionIdentifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_payloadData, 0);
  objc_storeStrong((id *)&self->_faceUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
