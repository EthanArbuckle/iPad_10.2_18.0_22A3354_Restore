@implementation MOEventLifeEvents

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t lifeEventCategory;
  double confidenceScore;
  id v6;

  lifeEventCategory = self->_lifeEventCategory;
  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", lifeEventCategory, CFSTR("lifeEventCategory"));
  confidenceScore = self->_confidenceScore;
  *(float *)&confidenceScore = confidenceScore;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("confidenceScore"), confidenceScore);

}

- (MOEventLifeEvents)initWithCoder:(id)a3
{
  id v4;
  MOEventLifeEvents *v5;
  float v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MOEventLifeEvents;
  v5 = -[MOEventLifeEvents init](&v8, sel_init);
  if (v5)
  {
    v5->_lifeEventCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lifeEventCategory"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("confidenceScore"));
    v5->_confidenceScore = v6;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init(MOEventLifeEvents);
  *((_QWORD *)result + 1) = self->_lifeEventCategory;
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_confidenceScore;
  return result;
}

+ (id)descriptionOfLifeEventCategory:(unint64_t)a3
{
  if (a3 > 4)
    return CFSTR("Invalid");
  else
    return off_1E8541FE0[a3];
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  +[MOEventLifeEvents descriptionOfLifeEventCategory:](MOEventLifeEvents, "descriptionOfLifeEventCategory:", self->_lifeEventCategory);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("life event category, %@, confidence score, %f"), v4, *(_QWORD *)&self->_confidenceScore);

  return v5;
}

- (unint64_t)lifeEventCategory
{
  return self->_lifeEventCategory;
}

- (void)setLifeEventCategory:(unint64_t)a3
{
  self->_lifeEventCategory = a3;
}

- (double)confidenceScore
{
  return self->_confidenceScore;
}

- (void)setConfidenceScore:(double)a3
{
  self->_confidenceScore = a3;
}

@end
