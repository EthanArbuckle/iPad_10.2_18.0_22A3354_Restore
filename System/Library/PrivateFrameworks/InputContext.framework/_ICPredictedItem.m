@implementation _ICPredictedItem

- (_ICPredictedItem)initWithIdentifier:(id)a3 score:(double)a4 value:(id)a5 label:(id)a6 name:(id)a7 date:(id)a8 originatingBundleID:(id)a9 originatingWebsiteURL:(id)a10 predictionAge:(unint64_t)a11 shouldAggregate:(BOOL)a12 flags:(unsigned __int8)a13 proactiveTrigger:(id)a14
{
  uint64_t v15;

  LOWORD(v15) = __PAIR16__(a13, a12);
  return -[_ICPredictedItem initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:](self, "initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:", a3, 0, a5, a6, a7, a8, a4, a9, a10, a11, v15, 0, 0, a14);
}

- (_ICPredictedItem)initWithIdentifier:(id)a3 itemType:(unsigned __int8)a4 score:(double)a5 value:(id)a6 label:(id)a7 name:(id)a8 date:(id)a9 originatingBundleID:(id)a10 originatingWebsiteURL:(id)a11 predictionAge:(unint64_t)a12 shouldAggregate:(BOOL)a13 flags:(unsigned __int8)a14 targetBundleID:(id)a15 operationData:(id)a16 proactiveTrigger:(id)a17
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _ICPredictedItem *v29;
  _ICPredictedItem *v30;
  id obj;
  id v34;
  id v35;
  id v37;
  id v38;
  id v39;
  id v40;
  objc_super v41;

  v40 = a3;
  obj = a6;
  v37 = a6;
  v34 = a7;
  v23 = a7;
  v35 = a8;
  v24 = a8;
  v39 = a9;
  v38 = a10;
  v25 = a11;
  v26 = a15;
  v27 = a16;
  v28 = a17;
  v41.receiver = self;
  v41.super_class = (Class)_ICPredictedItem;
  v29 = -[_ICPredictedItem init](&v41, sel_init);
  v30 = v29;
  if (v29)
  {
    objc_storeStrong((id *)&v29->_identifier, a3);
    v30->_itemType = a4;
    v30->_score = a5;
    objc_storeStrong((id *)&v30->_value, obj);
    objc_storeStrong((id *)&v30->_label, v34);
    objc_storeStrong((id *)&v30->_name, v35);
    objc_storeStrong((id *)&v30->_date, a9);
    objc_storeStrong((id *)&v30->_originatingBundleID, a10);
    objc_storeStrong((id *)&v30->_originatingWebsiteURL, a11);
    v30->_predictionAge = a12;
    v30->_shouldAggregate = a13;
    v30->_flags = a14;
    objc_storeStrong((id *)&v30->_targetBundleID, a15);
    objc_storeStrong((id *)&v30->_operationData, a16);
    objc_storeStrong((id *)&v30->_trigger, a17);
    v30->_layoutHint = 0;
  }

  return v30;
}

+ (id)predictedItemFromQuickTypeItem:(id)a3 trigger:(id)a4
{
  id v6;
  char v7;
  char v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;

  v6 = a3;
  v23 = a4;
  v7 = objc_msgSend(v6, "flags");
  v8 = objc_msgSend(v6, "flags") & 2 | v7 & 1;
  if ((objc_msgSend(v6, "source") & 0xA) != 0)
    v8 |= objc_msgSend(v6, "flags") & 4;
  v22 = objc_alloc((Class)a1);
  objc_msgSend(v6, "sourceIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "score");
  v10 = v9;
  objc_msgSend(v6, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "originatingBundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "originatingWebsiteURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v6, "predictionAge");
  BYTE1(v20) = v8;
  LOBYTE(v20) = objc_msgSend(v6, "shouldAggregate");
  v18 = (void *)objc_msgSend(v22, "initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:", v21, 0, v11, v12, v13, v14, v10, v15, v16, v17, v20, 0, 0, v23);

  return v18;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (self->_itemType)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<_ICPredictedItem  '%@' %@>"), self->_targetBundleID, self->_operationData, v3, v4, v5, v6);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<_ICPredictedItem '%@' %@=%@ [%@] s:%f f:%lu>"), self->_name, self->_label, self->_value, self->_date, *(_QWORD *)&self->_score, self->_flags);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  NSUInteger v16;

  v3 = -[_ICProactiveTrigger hash](self->_trigger, "hash");
  v4 = -[NSString hash](self->_name, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_label, "hash") - v4 + 32 * v4;
  v6 = -[NSString hash](self->_value, "hash") - v5 + 32 * v5;
  v7 = -[NSString hash](self->_name, "hash") - v6 + 32 * v6;
  v8 = -[NSDate hash](self->_date, "hash") - v7 + 32 * v7;
  v9 = -[NSString hash](self->_originatingBundleID, "hash") - v8 + 32 * v8;
  v10 = -[NSURL hash](self->_originatingWebsiteURL, "hash");
  v11 = self->_predictionAge - (v10 - v9 + 32 * v9) + 32 * (v10 - v9 + 32 * v9);
  v12 = self->_shouldAggregate - v11 + 32 * v11;
  v13 = self->_flags - v12 + 32 * v12;
  v14 = (unint64_t)self->_score - v13 + 32 * v13;
  v15 = self->_itemType - v14 + 32 * v14;
  v16 = -[NSString hash](self->_targetBundleID, "hash") - v15 + 32 * v15;
  return -[NSDictionary hash](self->_operationData, "hash") - v16 + 32 * v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_ICPredictedItem)initWithCoder:(id)a3
{
  id v4;
  _ICPredictedItem *v5;
  uint64_t v6;
  NSString *identifier;
  double v8;
  uint64_t v9;
  NSString *value;
  uint64_t v11;
  NSString *label;
  uint64_t v13;
  NSString *name;
  uint64_t v15;
  NSDate *date;
  uint64_t v17;
  NSString *originatingBundleID;
  uint64_t v19;
  NSURL *originatingWebsiteURL;
  uint64_t v21;
  _ICProactiveTrigger *trigger;
  uint64_t v23;
  NSString *targetBundleID;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSDictionary *operationData;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)_ICPredictedItem;
  v5 = -[_ICPredictedItem init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("score"));
    v5->_score = v8;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v9 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v11 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v13 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v15 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originatingBundleID"));
    v17 = objc_claimAutoreleasedReturnValue();
    originatingBundleID = v5->_originatingBundleID;
    v5->_originatingBundleID = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originatingWebsiteURL"));
    v19 = objc_claimAutoreleasedReturnValue();
    originatingWebsiteURL = v5->_originatingWebsiteURL;
    v5->_originatingWebsiteURL = (NSURL *)v19;

    v5->_predictionAge = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("predictionAge"));
    v5->_shouldAggregate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldAggregate"));
    v5->_flags = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("flags"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trigger"));
    v21 = objc_claimAutoreleasedReturnValue();
    trigger = v5->_trigger;
    v5->_trigger = (_ICProactiveTrigger *)v21;

    v5->_itemType = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("itemType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetBundleID"));
    v23 = objc_claimAutoreleasedReturnValue();
    targetBundleID = v5->_targetBundleID;
    v5->_targetBundleID = (NSString *)v23;

    v25 = (void *)MEMORY[0x24BDBCF20];
    v26 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("operationData"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "copy");
    operationData = v5->_operationData;
    v5->_operationData = (NSDictionary *)v29;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("score"), self->_score);
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("value"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("label"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originatingBundleID, CFSTR("originatingBundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originatingWebsiteURL, CFSTR("originatingWebsiteURL"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_predictionAge, CFSTR("predictionAge"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldAggregate, CFSTR("shouldAggregate"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_flags, CFSTR("flags"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trigger, CFSTR("trigger"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_itemType, CFSTR("itemType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_targetBundleID, CFSTR("targetBundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_operationData, CFSTR("operationData"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v5 = objc_alloc_init((Class)objc_opt_class());
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
    v7 = (void *)v5[2];
    v5[2] = v6;

    v5[11] = *(_QWORD *)&self->_score;
    v8 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
    v9 = (void *)v5[4];
    v5[4] = v8;

    v10 = -[NSString copyWithZone:](self->_value, "copyWithZone:", a3);
    v11 = (void *)v5[5];
    v5[5] = v10;

    v12 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
    v13 = (void *)v5[6];
    v5[6] = v12;

    v14 = -[NSDate copyWithZone:](self->_date, "copyWithZone:", a3);
    v15 = (void *)v5[7];
    v5[7] = v14;

    v16 = -[NSString copyWithZone:](self->_originatingBundleID, "copyWithZone:", a3);
    v17 = (void *)v5[8];
    v5[8] = v16;

    v18 = -[NSURL copyWithZone:](self->_originatingWebsiteURL, "copyWithZone:", a3);
    v19 = (void *)v5[9];
    v5[9] = v18;

    v5[10] = self->_predictionAge;
    *((_BYTE *)v5 + 9) = self->_shouldAggregate;
    *((_BYTE *)v5 + 10) = self->_flags;
    v20 = -[_ICProactiveTrigger copyWithZone:](self->_trigger, "copyWithZone:", a3);
    v21 = (void *)v5[3];
    v5[3] = v20;

    *((_BYTE *)v5 + 8) = self->_itemType;
    v22 = -[NSString copyWithZone:](self->_targetBundleID, "copyWithZone:", a3);
    v23 = (void *)v5[12];
    v5[12] = v22;

    v24 = -[NSDictionary copyWithZone:](self->_operationData, "copyWithZone:", a3);
    v25 = (void *)v5[13];
    v5[13] = v24;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _ICPredictedItem *v4;
  _ICPredictedItem *v5;
  BOOL v6;

  v4 = (_ICPredictedItem *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[_ICPredictedItem isEqualToPredictedItem:](self, "isEqualToPredictedItem:", v5);

  return v6;
}

- (BOOL)hasScoreSimilarToItem:(id)a3
{
  return vabdd_f64(self->_score, *((double *)a3 + 11)) < 0.000001;
}

- (BOOL)isEqualToPredictedItem:(id)a3
{
  NSString **v4;
  NSString *identifier;
  NSString *label;
  NSString *value;
  NSString *name;
  NSDate *date;
  NSString *originatingBundleID;
  NSURL *originatingWebsiteURL;
  _ICProactiveTrigger *trigger;
  NSString *targetBundleID;
  NSDictionary *operationData;
  char v15;

  v4 = (NSString **)a3;
  if (!v4)
    goto LABEL_27;
  identifier = self->_identifier;
  if (identifier != v4[2] && !-[NSString isEqual:](identifier, "isEqual:"))
    goto LABEL_27;
  label = self->_label;
  if (label != v4[4] && !-[NSString isEqual:](label, "isEqual:"))
    goto LABEL_27;
  if (((value = self->_value, value == v4[5]) || -[NSString isEqual:](value, "isEqual:"))
    && ((name = self->_name, name == v4[6]) || -[NSString isEqual:](name, "isEqual:"))
    && ((date = self->_date, date == (NSDate *)v4[7]) || -[NSDate isEqual:](date, "isEqual:"))
    && ((originatingBundleID = self->_originatingBundleID, originatingBundleID == v4[8])
     || -[NSString isEqual:](originatingBundleID, "isEqual:"))
    && ((originatingWebsiteURL = self->_originatingWebsiteURL, originatingWebsiteURL == (NSURL *)v4[9])
     || -[NSURL isEqual:](originatingWebsiteURL, "isEqual:"))
    && (NSString *)self->_predictionAge == v4[10]
    && -[_ICPredictedItem hasScoreSimilarToItem:](self, "hasScoreSimilarToItem:", v4)
    && ((trigger = self->_trigger, trigger == (_ICProactiveTrigger *)v4[3])
     || -[_ICProactiveTrigger isEqual:](trigger, "isEqual:"))
    && self->_flags == *((unsigned __int8 *)v4 + 10)
    && self->_shouldAggregate == *((unsigned __int8 *)v4 + 9)
    && self->_itemType == *((unsigned __int8 *)v4 + 8)
    && ((targetBundleID = self->_targetBundleID, targetBundleID == v4[12])
     || -[NSString isEqual:](targetBundleID, "isEqual:")))
  {
    operationData = self->_operationData;
    if (operationData == (NSDictionary *)v4[13])
      v15 = 1;
    else
      v15 = -[NSDictionary isEqual:](operationData, "isEqual:");
  }
  else
  {
LABEL_27:
    v15 = 0;
  }

  return v15;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_ICProactiveTrigger)trigger
{
  return self->_trigger;
}

- (unsigned)itemType
{
  return self->_itemType;
}

- (void)setItemType:(unsigned __int8)a3
{
  self->_itemType = a3;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)value
{
  return self->_value;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)originatingBundleID
{
  return self->_originatingBundleID;
}

- (NSURL)originatingWebsiteURL
{
  return self->_originatingWebsiteURL;
}

- (unint64_t)predictionAge
{
  return self->_predictionAge;
}

- (void)setPredictionAge:(unint64_t)a3
{
  self->_predictionAge = a3;
}

- (BOOL)shouldAggregate
{
  return self->_shouldAggregate;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned __int8)a3
{
  self->_flags = a3;
}

- (unsigned)layoutHint
{
  return self->_layoutHint;
}

- (void)setLayoutHint:(unsigned __int8)a3
{
  self->_layoutHint = a3;
}

- (double)score
{
  return self->_score;
}

- (NSString)targetBundleID
{
  return self->_targetBundleID;
}

- (NSDictionary)operationData
{
  return self->_operationData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationData, 0);
  objc_storeStrong((id *)&self->_targetBundleID, 0);
  objc_storeStrong((id *)&self->_originatingWebsiteURL, 0);
  objc_storeStrong((id *)&self->_originatingBundleID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
