@implementation NTPBUserOnboardingResume

- (BOOL)hasOnboardResumeStage
{
  return self->_onboardResumeStage != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBUserOnboardingResume;
  -[NTPBUserOnboardingResume description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBUserOnboardingResume dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *onboardResumeStage;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  onboardResumeStage = self->_onboardResumeStage;
  if (onboardResumeStage)
    objc_msgSend(v3, "setObject:forKey:", onboardResumeStage, CFSTR("onboard_resume_stage"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBUserOnboardingResumeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_onboardResumeStage)
    PBDataWriterWriteStringField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_onboardResumeStage, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *onboardResumeStage;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    onboardResumeStage = self->_onboardResumeStage;
    if ((unint64_t)onboardResumeStage | v4[1])
      v6 = -[NSString isEqual:](onboardResumeStage, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_onboardResumeStage, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[NTPBUserOnboardingResume setOnboardResumeStage:](self, "setOnboardResumeStage:");
}

- (NSString)onboardResumeStage
{
  return self->_onboardResumeStage;
}

- (void)setOnboardResumeStage:(id)a3
{
  objc_storeStrong((id *)&self->_onboardResumeStage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardResumeStage, 0);
}

@end
