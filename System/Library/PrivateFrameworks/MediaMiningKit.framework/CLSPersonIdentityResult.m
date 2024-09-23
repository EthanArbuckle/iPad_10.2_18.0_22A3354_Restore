@implementation CLSPersonIdentityResult

- (BOOL)isSamePersonAsResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CLSPersonIdentityResult person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isSamePersonAs:", v6);
  return (char)v4;
}

- (void)mergeWithResult:(id)a3
{
  void *v4;
  void *v5;
  float v6;
  float v7;
  id v8;

  v8 = a3;
  -[CLSPersonIdentityResult person](self, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mergeWithPerson:", v5);

  objc_msgSend(v8, "confidence");
  if (v6 > self->_confidence)
  {
    objc_msgSend(v8, "confidence");
    self->_confidence = v7;
  }

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%f)"), self->_person, self->_confidence);
}

- (CLSPersonIdentity)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
}

+ (id)personResultWithPerson:(id)a3 andConfidence:(float)a4
{
  id v5;
  CLSPersonIdentityResult *v6;
  double v7;

  v5 = a3;
  v6 = objc_alloc_init(CLSPersonIdentityResult);
  -[CLSPersonIdentityResult setPerson:](v6, "setPerson:", v5);

  *(float *)&v7 = a4;
  -[CLSPersonIdentityResult setConfidence:](v6, "setConfidence:", v7);
  return v6;
}

@end
