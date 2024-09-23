@implementation AEAssessmentUIConfiguration

- (AEAssessmentUIConfiguration)init
{
  return -[AEAssessmentUIConfiguration initWithPresentDisplayShields:captureDisplays:](self, "initWithPresentDisplayShields:captureDisplays:", 1, 1);
}

- (AEAssessmentUIConfiguration)initWithPresentDisplayShields:(BOOL)a3 captureDisplays:(BOOL)a4
{
  AEAssessmentUIConfiguration *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AEAssessmentUIConfiguration;
  result = -[AEAssessmentUIConfiguration init](&v7, sel_init);
  if (result)
  {
    result->_presentDisplayShields = a3;
    result->_captureDisplays = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithBool:", -[AEAssessmentUIConfiguration shouldPresentDisplayShields](self, "shouldPresentDisplayShields"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("presentDisplayShields"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentUIConfiguration shouldCaptureDisplays](self, "shouldCaptureDisplays"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("captureDisplays"));

}

- (AEAssessmentUIConfiguration)initWithCoder:(id)a3
{
  id v4;
  AEAssessmentUIConfiguration *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AEAssessmentUIConfiguration;
  v5 = -[AEAssessmentUIConfiguration init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("presentDisplayShields"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_presentDisplayShields = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("captureDisplays"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_captureDisplays = objc_msgSend(v7, "BOOLValue");

  }
  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentUIConfiguration shouldPresentDisplayShields](self, "shouldPresentDisplayShields"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentUIConfiguration shouldCaptureDisplays](self, "shouldCaptureDisplays"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  AEAssessmentUIConfiguration *v4;
  AEAssessmentUIConfiguration *v5;
  unsigned __int8 v6;

  v4 = (AEAssessmentUIConfiguration *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v6 = 1;
    goto LABEL_7;
  }
  if (-[AEAssessmentUIConfiguration isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    v6 = -[AEAssessmentUIConfiguration isEqualToConfiguration:](self, v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (void)isEqualToConfiguration:(void *)a1
{
  id v3;
  int v4;
  int v5;

  v3 = a2;
  if (a1)
  {
    v4 = objc_msgSend(a1, "shouldPresentDisplayShields");
    if (v4 == objc_msgSend(v3, "shouldPresentDisplayShields"))
    {
      v5 = objc_msgSend(a1, "shouldCaptureDisplays");
      a1 = (void *)(v5 ^ objc_msgSend(v3, "shouldCaptureDisplays") ^ 1);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  if (-[AEAssessmentUIConfiguration shouldPresentDisplayShields](self, "shouldPresentDisplayShields"))
    v5 = CFSTR("Yes");
  else
    v5 = CFSTR("No");
  if (-[AEAssessmentUIConfiguration shouldCaptureDisplays](self, "shouldCaptureDisplays"))
    v6 = CFSTR("Yes");
  else
    v6 = CFSTR("No");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { shouldPresentDisplayShields = %@, shouldCaptureDisplays = %@ }>"), v4, self, v5, v6);
}

- (BOOL)shouldPresentDisplayShields
{
  return self->_presentDisplayShields;
}

- (BOOL)shouldCaptureDisplays
{
  return self->_captureDisplays;
}

@end
