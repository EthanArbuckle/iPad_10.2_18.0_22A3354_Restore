@implementation APFrequencyCapData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APFrequencyCapData)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  APFrequencyCapData *v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)APFrequencyCapData;
  v8 = -[APFrequencyCapData init](&v22, sel_init);
  if (v8)
  {
    v8->_relevantIdentifier = (int)objc_msgSend_decodeIntForKey_(v4, v5, (uint64_t)CFSTR("relevantIdentifier"), v6, v7, v9, v10);
    v8->_value = (int)objc_msgSend_decodeIntForKey_(v4, v11, (uint64_t)CFSTR("frequencyValue"), v12, v13, v14, v15);
    v8->_duration = (int)objc_msgSend_decodeIntForKey_(v4, v16, (uint64_t)CFSTR("frequencyDuration"), v17, v18, v19, v20);
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t relevantIdentifier_low;
  const char *v5;
  uint64_t v6;
  double v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;
  double v15;
  double v16;
  id v17;

  relevantIdentifier_low = LODWORD(self->_relevantIdentifier);
  v17 = a3;
  objc_msgSend_encodeInt_forKey_(v17, v5, relevantIdentifier_low, (uint64_t)CFSTR("relevantIdentifier"), v6, v7, v8);
  objc_msgSend_encodeInt_forKey_(v17, v9, LODWORD(self->_value), (uint64_t)CFSTR("frequencyValue"), v10, v11, v12);
  objc_msgSend_encodeInt_forKey_(v17, v13, LODWORD(self->_duration), (uint64_t)CFSTR("frequencyDuration"), v14, v15, v16);

}

- (int64_t)relevantIdentifier
{
  return self->_relevantIdentifier;
}

- (void)setRelevantIdentifier:(int64_t)a3
{
  self->_relevantIdentifier = a3;
}

- (unint64_t)value
{
  return self->_value;
}

- (void)setValue:(unint64_t)a3
{
  self->_value = a3;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

@end
