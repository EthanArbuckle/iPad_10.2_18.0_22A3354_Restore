@implementation DDSTrialExperimentIdentifiers

- (DDSTrialExperimentIdentifiers)initWithExperimentId:(id)a3 treatmentId:(id)a4 deploymentId:(int)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DDSTrialExperimentIdentifiers;
  return -[TRIExperimentIdentifiers initWithExperimentId:deploymentId:treatmentId:](&v6, sel_initWithExperimentId_deploymentId_treatmentId_, a3, *(_QWORD *)&a5, a4);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[TRIExperimentIdentifiers deploymentId](self, "deploymentId"), CFSTR("deploymentId"));
  -[TRIExperimentIdentifiers experimentId](self, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("experimentId"));

  -[TRIExperimentIdentifiers treatmentId](self, "treatmentId");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("treatmentId"));

}

- (DDSTrialExperimentIdentifiers)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  DDSTrialExperimentIdentifiers *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("deploymentId"));
  if ((int)v5 < 1)
  {
    v9 = 0;
  }
  else
  {
    v6 = v5;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("treatmentId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("experimentId"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        self = -[DDSTrialExperimentIdentifiers initWithExperimentId:treatmentId:deploymentId:](self, "initWithExperimentId:treatmentId:deploymentId:", v8, v7, v6);
        v9 = self;
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
