@implementation ABChangeHistoryEvent

+ (id)personAddEventWithRecordID:(int)a3 identifier:(id)a4
{
  return (id)objc_msgSend((id)objc_opt_class(), "personWithRecordID:identifier:eventType:", *(_QWORD *)&a3, a4, 0);
}

+ (id)personUpdateEventWithRecordID:(int)a3 identifier:(id)a4 imagesChanged:(BOOL)a5 personLink:(int)a6
{
  return (id)objc_msgSend((id)objc_opt_class(), "personWithRecordID:identifier:eventType:imagesChanged:externalID:personLink:", *(_QWORD *)&a3, a4, 1, a5, 0, *(_QWORD *)&a6);
}

+ (id)personDeleteEventWithRecordID:(int)a3 identifier:(id)a4 externalID:(id)a5 personLink:(int)a6
{
  return (id)objc_msgSend((id)objc_opt_class(), "personWithRecordID:identifier:eventType:imagesChanged:externalID:personLink:", *(_QWORD *)&a3, a4, 2, 0, a5, *(_QWORD *)&a6);
}

+ (id)unifiedPersonAddEventWithUnifiedIdentifier:(id)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "unifiedPersonWithIdentifier:eventType:", a3, 3);
}

+ (id)unifiedPersonUpdateEventWithUnifiedIdentifier:(id)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "unifiedPersonWithIdentifier:eventType:", a3, 4);
}

+ (id)unifiedPersonDeleteEventWithUnifiedIdentifier:(id)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "unifiedPersonWithIdentifier:eventType:", a3, 5);
}

+ (id)linkEventWithRecordID:(int)a3 identifier:(id)a4 linkToIdentifier:(id)a5 unifiedIdentifier:(id)a6
{
  uint64_t v7;

  HIDWORD(v7) = -1;
  LOBYTE(v7) = 0;
  return -[ABChangeHistoryEvent initWithEntityType:eventType:sequenceNumber:recordID:recordGUID:externalID:imagesChanged:personLink:personLinkUUID:linkToPersonUUID:]([ABChangeHistoryEvent alloc], "initWithEntityType:eventType:sequenceNumber:recordID:recordGUID:externalID:imagesChanged:personLink:personLinkUUID:linkToPersonUUID:", 0, 6, -2, *(_QWORD *)&a3, a4, 0, v7, a6, a5);
}

+ (id)unlinkEventWithRecordID:(int)a3 identifier:(id)a4
{
  return (id)objc_msgSend((id)objc_opt_class(), "personWithRecordID:identifier:eventType:", *(_QWORD *)&a3, a4, 7);
}

+ (id)setPreferredNameEventWithRecordID:(int)a3 identifier:(id)a4
{
  return (id)objc_msgSend((id)objc_opt_class(), "personWithRecordID:identifier:eventType:", *(_QWORD *)&a3, a4, 8);
}

+ (id)setPreferredImageEventWithRecordID:(int)a3 identifier:(id)a4
{
  return (id)objc_msgSend((id)objc_opt_class(), "personWithRecordID:identifier:eventType:", *(_QWORD *)&a3, a4, 9);
}

+ (id)meCardChangedEventWithRecordID:(int)a3 identifier:(id)a4
{
  return (id)objc_msgSend((id)objc_opt_class(), "personWithRecordID:identifier:eventType:", *(_QWORD *)&a3, a4, 10);
}

+ (id)groupAddEventWithRecordID:(int)a3 identifier:(id)a4
{
  return (id)objc_msgSend((id)objc_opt_class(), "groupWithRecordID:identifier:eventType:externalID:", *(_QWORD *)&a3, a4, 0, 0);
}

+ (id)groupUpdateEventWithRecordID:(int)a3 identifier:(id)a4
{
  return (id)objc_msgSend((id)objc_opt_class(), "groupWithRecordID:identifier:eventType:externalID:", *(_QWORD *)&a3, a4, 1, 0);
}

+ (id)groupDeleteEventWithRecordID:(int)a3 identifier:(id)a4 externalID:(id)a5
{
  return (id)objc_msgSend((id)objc_opt_class(), "groupWithRecordID:identifier:eventType:externalID:", *(_QWORD *)&a3, a4, 2, 0);
}

+ (id)personWithRecordID:(int)a3 identifier:(id)a4 eventType:(int)a5
{
  return (id)objc_msgSend((id)objc_opt_class(), "personWithRecordID:identifier:eventType:imagesChanged:externalID:personLink:", *(_QWORD *)&a3, a4, *(_QWORD *)&a5, 0, 0, 0xFFFFFFFFLL);
}

+ (id)unifiedPersonWithIdentifier:(id)a3 eventType:(int)a4
{
  return (id)objc_msgSend((id)objc_opt_class(), "personWithRecordID:identifier:eventType:imagesChanged:externalID:personLink:", 0xFFFFFFFFLL, a3, *(_QWORD *)&a4, 0, 0, 0xFFFFFFFFLL);
}

+ (id)personWithRecordID:(int)a3 identifier:(id)a4 eventType:(int)a5 imagesChanged:(BOOL)a6 externalID:(id)a7 personLink:(int)a8
{
  uint64_t v9;

  HIDWORD(v9) = a8;
  LOBYTE(v9) = a6;
  return -[ABChangeHistoryEvent initWithEntityType:eventType:sequenceNumber:recordID:recordGUID:externalID:imagesChanged:personLink:personLinkUUID:linkToPersonUUID:]([ABChangeHistoryEvent alloc], "initWithEntityType:eventType:sequenceNumber:recordID:recordGUID:externalID:imagesChanged:personLink:personLinkUUID:linkToPersonUUID:", 0, *(_QWORD *)&a5, -2, *(_QWORD *)&a3, a4, a7, v9, 0, 0);
}

+ (id)groupWithRecordID:(int)a3 identifier:(id)a4 eventType:(int)a5 externalID:(id)a6
{
  uint64_t v7;

  HIDWORD(v7) = -1;
  LOBYTE(v7) = 0;
  return -[ABChangeHistoryEvent initWithEntityType:eventType:sequenceNumber:recordID:recordGUID:externalID:imagesChanged:personLink:personLinkUUID:linkToPersonUUID:]([ABChangeHistoryEvent alloc], "initWithEntityType:eventType:sequenceNumber:recordID:recordGUID:externalID:imagesChanged:personLink:personLinkUUID:linkToPersonUUID:", 1, *(_QWORD *)&a5, -2, *(_QWORD *)&a3, a4, a6, v7, 0, 0);
}

- (ABChangeHistoryEvent)initWithEntityType:(int)a3 eventType:(int)a4 sequenceNumber:(int64_t)a5 recordID:(int)a6 recordGUID:(id)a7 externalID:(id)a8 imagesChanged:(BOOL)a9 personLink:(int)a10 personLinkUUID:(id)a11 linkToPersonUUID:(id)a12
{
  ABChangeHistoryEvent *v18;
  ABChangeHistoryEvent *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)ABChangeHistoryEvent;
  v18 = -[ABChangeHistoryEvent init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_entityType = a3;
    v18->_eventType = a4;
    v18->_sequenceNumber = a5;
    v18->_recordID = a6;
    v18->_recordGUID = (NSString *)objc_msgSend(a7, "copy");
    v19->_externalID = (NSString *)objc_msgSend(a8, "copy");
    v19->_imagesChanged = a9;
    v19->_personLink = a10;
    v19->_personLinkUUID = (NSString *)objc_msgSend(a11, "copy");
    v19->_linkToPersonUUID = (NSString *)objc_msgSend(a12, "copy");
  }
  return v19;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ABChangeHistoryEvent;
  -[ABChangeHistoryEvent dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  objc_msgSend(v3, "appendName:object:", CFSTR("entityType"), -[ABChangeHistoryEvent descriptionForEntityType:](self, "descriptionForEntityType:", self->_entityType));
  objc_msgSend(v3, "appendName:object:", CFSTR("eventType"), -[ABChangeHistoryEvent descriptionForEventType:](self, "descriptionForEventType:", self->_eventType));
  objc_msgSend(v3, "appendName:object:", CFSTR("sequenceNumber"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_sequenceNumber));
  if (self->_recordID != -1)
    objc_msgSend(v3, "appendName:object:", CFSTR("recordID"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"));
  if (self->_recordGUID)
    objc_msgSend(v3, "appendName:object:", CFSTR("recordGUID"));
  if (self->_externalID)
    objc_msgSend(v3, "appendName:object:", CFSTR("externalID"));
  if (self->_imagesChanged)
    objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("imagesChanged"), 1);
  if (self->_personLink >= 1)
    objc_msgSend(v3, "appendName:object:", CFSTR("_personLink"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"));
  if (self->_linkToPersonUUID)
    objc_msgSend(v3, "appendName:object:", CFSTR("linkToPersonUUID"));
  if (self->_personLinkUUID)
    objc_msgSend(v3, "appendName:object:", CFSTR("personLinkUUID"));
  return (id)objc_msgSend(v3, "build");
}

- (id)descriptionForEntityType:(int)a3
{
  uint64_t v3;
  id result;

  v3 = *(_QWORD *)&a3;
  if (descriptionForEntityType__cn_once_token_1 != -1)
    dispatch_once(&descriptionForEntityType__cn_once_token_1, &__block_literal_global_14);
  result = (id)objc_msgSend((id)descriptionForEntityType__cn_once_object_1, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3));
  if (!result)
    return CFSTR("Unknown");
  return result;
}

uint64_t __49__ABChangeHistoryEvent_descriptionForEntityType___block_invoke()
{
  uint64_t result;
  _QWORD v1[3];
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v1[0] = &unk_1E3CB9660;
  v1[1] = &unk_1E3CB9678;
  v2[0] = CFSTR("Person");
  v2[1] = CFSTR("Group");
  v1[2] = &unk_1E3CB9690;
  v2[2] = CFSTR("MultiValue");
  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 3), "copy");
  descriptionForEntityType__cn_once_object_1 = result;
  return result;
}

- (id)descriptionForEventType:(int)a3
{
  uint64_t v3;
  id result;

  v3 = *(_QWORD *)&a3;
  if (descriptionForEventType__cn_once_token_2 != -1)
    dispatch_once(&descriptionForEventType__cn_once_token_2, &__block_literal_global_36);
  result = (id)objc_msgSend((id)descriptionForEventType__cn_once_object_2, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3));
  if (!result)
    return CFSTR("Unknown");
  return result;
}

uint64_t __48__ABChangeHistoryEvent_descriptionForEventType___block_invoke()
{
  uint64_t result;
  _QWORD v1[11];
  _QWORD v2[12];

  v2[11] = *MEMORY[0x1E0C80C00];
  v1[0] = &unk_1E3CB9660;
  v1[1] = &unk_1E3CB9678;
  v2[0] = CFSTR("Add");
  v2[1] = CFSTR("Update");
  v1[2] = &unk_1E3CB9690;
  v1[3] = &unk_1E3CB96A8;
  v2[2] = CFSTR("Delete");
  v2[3] = CFSTR("UnifiedAdd");
  v1[4] = &unk_1E3CB96C0;
  v1[5] = &unk_1E3CB96D8;
  v2[4] = CFSTR("UnifiedUpdate");
  v2[5] = CFSTR("Delete");
  v1[6] = &unk_1E3CB96F0;
  v1[7] = &unk_1E3CB9708;
  v2[6] = CFSTR("Link");
  v2[7] = CFSTR("Unlink");
  v1[8] = &unk_1E3CB9720;
  v1[9] = &unk_1E3CB9738;
  v2[8] = CFSTR("SetPreferredName");
  v2[9] = CFSTR("SetPreferredImage");
  v1[10] = &unk_1E3CB9750;
  v2[10] = CFSTR("MeCardChanged");
  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 11), "copy");
  descriptionForEventType__cn_once_object_2 = result;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD v4[6];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[6];
  _QWORD v12[12];

  v12[5] = a3;
  v12[6] = MEMORY[0x1E0C809B0];
  v12[7] = 3221225472;
  v12[8] = __32__ABChangeHistoryEvent_isEqual___block_invoke;
  v12[9] = &unk_1E3CA4748;
  v12[10] = self;
  v12[11] = a3;
  v11[5] = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __32__ABChangeHistoryEvent_isEqual___block_invoke_2;
  v12[3] = &unk_1E3CA4748;
  v12[4] = self;
  v10[5] = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __32__ABChangeHistoryEvent_isEqual___block_invoke_3;
  v11[3] = &unk_1E3CA4748;
  v11[4] = self;
  v9[5] = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __32__ABChangeHistoryEvent_isEqual___block_invoke_4;
  v10[3] = &unk_1E3CA4748;
  v10[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __32__ABChangeHistoryEvent_isEqual___block_invoke_5;
  v9[3] = &unk_1E3CA4748;
  v9[4] = self;
  v7[5] = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__ABChangeHistoryEvent_isEqual___block_invoke_6;
  v8[3] = &unk_1E3CA4748;
  v8[4] = self;
  v8[5] = a3;
  v6[5] = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__ABChangeHistoryEvent_isEqual___block_invoke_7;
  v7[3] = &unk_1E3CA4748;
  v7[4] = self;
  v5[5] = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__ABChangeHistoryEvent_isEqual___block_invoke_8;
  v6[3] = &unk_1E3CA4748;
  v6[4] = self;
  v4[5] = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__ABChangeHistoryEvent_isEqual___block_invoke_9;
  v5[3] = &unk_1E3CA4748;
  v5[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__ABChangeHistoryEvent_isEqual___block_invoke_10;
  v4[3] = &unk_1E3CA4748;
  v4[4] = self;
  return objc_msgSend(MEMORY[0x1E0D13A40], "isObject:equalToOther:withBlocks:", v12, v11, v10, v9, v8, v7, v6, v5, v4, 0);
}

uint64_t __32__ABChangeHistoryEvent_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A40], "isInteger:equalToOther:", objc_msgSend(*(id *)(a1 + 32), "entityType"), objc_msgSend(*(id *)(a1 + 40), "entityType"));
}

uint64_t __32__ABChangeHistoryEvent_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A40], "isInteger:equalToOther:", objc_msgSend(*(id *)(a1 + 32), "eventType"), objc_msgSend(*(id *)(a1 + 40), "eventType"));
}

uint64_t __32__ABChangeHistoryEvent_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isSequenceNumber:equalToOther:", objc_msgSend(*(id *)(a1 + 32), "sequenceNumber"), objc_msgSend(*(id *)(a1 + 40), "sequenceNumber"));
}

uint64_t __32__ABChangeHistoryEvent_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A40], "isInteger:equalToOther:", (int)objc_msgSend(*(id *)(a1 + 32), "recordID"), (int)objc_msgSend(*(id *)(a1 + 40), "recordID"));
}

uint64_t __32__ABChangeHistoryEvent_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A40], "isObject:equalToOther:", objc_msgSend(*(id *)(a1 + 32), "recordGUID"), objc_msgSend(*(id *)(a1 + 40), "recordGUID"));
}

uint64_t __32__ABChangeHistoryEvent_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A40], "isObject:equalToOther:", objc_msgSend(*(id *)(a1 + 32), "externalID"), objc_msgSend(*(id *)(a1 + 40), "externalID"));
}

uint64_t __32__ABChangeHistoryEvent_isEqual___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A40], "isBool:equalToOther:", objc_msgSend(*(id *)(a1 + 32), "imagesChanged"), objc_msgSend(*(id *)(a1 + 40), "imagesChanged"));
}

uint64_t __32__ABChangeHistoryEvent_isEqual___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A40], "isInteger:equalToOther:", (int)objc_msgSend(*(id *)(a1 + 32), "personLink"), (int)objc_msgSend(*(id *)(a1 + 40), "personLink"));
}

uint64_t __32__ABChangeHistoryEvent_isEqual___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A40], "isObject:equalToOther:", objc_msgSend(*(id *)(a1 + 32), "personLinkUUID"), objc_msgSend(*(id *)(a1 + 40), "personLinkUUID"));
}

uint64_t __32__ABChangeHistoryEvent_isEqual___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A40], "isObject:equalToOther:", objc_msgSend(*(id *)(a1 + 32), "linkToPersonUUID"), objc_msgSend(*(id *)(a1 + 40), "linkToPersonUUID"));
}

- (BOOL)isSequenceNumber:(int64_t)a3 equalToOther:(int64_t)a4
{
  return a3 == -2 || a4 == -2 || a3 == a4;
}

- (int)entityType
{
  return self->_entityType;
}

- (int)eventType
{
  return self->_eventType;
}

- (int64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (int)recordID
{
  return self->_recordID;
}

- (NSString)recordGUID
{
  return self->_recordGUID;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (BOOL)imagesChanged
{
  return self->_imagesChanged;
}

- (int)personLink
{
  return self->_personLink;
}

- (NSString)personLinkUUID
{
  return self->_personLinkUUID;
}

- (NSString)linkToPersonUUID
{
  return self->_linkToPersonUUID;
}

@end
