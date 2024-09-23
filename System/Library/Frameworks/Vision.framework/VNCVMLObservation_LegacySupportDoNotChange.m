@implementation VNCVMLObservation_LegacySupportDoNotChange

- (VNCVMLObservation_LegacySupportDoNotChange)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  VNCVMLObservation_LegacySupportDoNotChange *v7;
  void *v8;
  float v9;
  objc_super v11;

  v4 = a3;
  if (!v4)
    goto LABEL_6;
  v11.receiver = self;
  v11.super_class = (Class)VNCVMLObservation_LegacySupportDoNotChange;
  self = -[VNCVMLObservation_LegacySupportDoNotChange init](&v11, sel_init);
  if (!self)
  {
LABEL_8:
    self = self;
    v7 = self;
    goto LABEL_9;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CVMLObservation_CodingVersionCodingKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && !objc_msgSend(v5, "unsignedIntegerValue"))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CVMLObservation_ConfidenceCodingKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    self->_confidence = v9;

    goto LABEL_8;
  }

LABEL_6:
  v7 = 0;
LABEL_9:

  return v7;
}

- (VNCVMLObservation_LegacySupportDoNotChange)initWithData:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  VNCVMLObservation_LegacySupportDoNotChange *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  VNCVMLObservation_LegacySupportDoNotChange *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v29;
  objc_super v30;

  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)VNCVMLObservation_LegacySupportDoNotChange;
  v8 = -[VNCVMLObservation_LegacySupportDoNotChange init](&v30, sel_init);
  if (v8)
  {
    v29 = 0;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v6, &v29);
    v10 = v29;
    v11 = v10;
    if (v9)
    {
      v12 = objc_opt_class();
      objc_msgSend(v9, "setClass:forClassName:", v12, CFSTR("CVMLObservation"));
      objc_msgSend(v9, "setClass:forClassName:", objc_opt_class(), CFSTR("MPImageDescriptor"));
      objc_msgSend(v9, "setClass:forClassName:", objc_opt_class(), CFSTR("CVMLImageprintObservation"));
      objc_msgSend(v9, "decodeObjectOfClass:forKey:", v12, v7);
      v13 = (VNCVMLObservation_LegacySupportDoNotChange *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v9, "finishDecoding");
LABEL_9:

        goto LABEL_10;
      }
      objc_msgSend(v9, "error");
      v21 = objc_claimAutoreleasedReturnValue();
      VNValidatedLog(4, (uint64_t)CFSTR("[CVMLObservation initWithData:forKey:] failed with error: %@"), v22, v23, v24, v25, v26, v27, v21);
      v8 = (VNCVMLObservation_LegacySupportDoNotChange *)v21;
    }
    else
    {
      objc_msgSend(v10, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      VNValidatedLog(4, (uint64_t)CFSTR("Creating NSKeyedUnarchiver object failed with error: %@"), v15, v16, v17, v18, v19, v20, (uint64_t)v14);

    }
    v13 = 0;
    goto LABEL_9;
  }
  v13 = 0;
LABEL_10:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", 0, CFSTR("Exporting of VNCVMLObservation_LegacySupportDoNotChange is not allowed.  Please use VNObservation instead."));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
