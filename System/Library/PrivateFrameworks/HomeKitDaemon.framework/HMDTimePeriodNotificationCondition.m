@implementation HMDTimePeriodNotificationCondition

- (HMDTimePeriodNotificationCondition)initWithStartElement:(id)a3 endElement:(id)a4
{
  id v7;
  id v8;
  HMDTimePeriodNotificationCondition *v9;
  HMDTimePeriodNotificationCondition *v10;
  HMDTimePeriodNotificationCondition *v12;
  SEL v13;
  id v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v15.receiver = self;
    v15.super_class = (Class)HMDTimePeriodNotificationCondition;
    v9 = -[HMDTimePeriodNotificationCondition init](&v15, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_startElement, a3);
      objc_storeStrong((id *)&v10->_endElement, a4);
    }

    return v10;
  }
  else
  {
    v12 = (HMDTimePeriodNotificationCondition *)_HMFPreconditionFailure();
    return -[HMDTimePeriodNotificationCondition initWithDictionary:](v12, v13, v14);
  }
}

- (HMDTimePeriodNotificationCondition)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDTimePeriodNotificationCondition *v11;
  HMDTimePeriodNotificationCondition *v13;
  SEL v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "doesTypeMatch:against:", v4, v6);

  if (!(_DWORD)v5)
  {
    v11 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDTPSC.ck.se"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimePeriodNotificationCondition timePeriodElementFromDictionary:](self, "timePeriodElementFromDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDTPSC.ck.ee"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimePeriodNotificationCondition timePeriodElementFromDictionary:](self, "timePeriodElementFromDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v10)
    {
      self = -[HMDTimePeriodNotificationCondition initWithStartElement:endElement:](self, "initWithStartElement:endElement:", v8, v10);

      v11 = self;
LABEL_6:

      return v11;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v13 = (HMDTimePeriodNotificationCondition *)_HMFPreconditionFailure();
  return (HMDTimePeriodNotificationCondition *)-[HMDTimePeriodNotificationCondition timePeriodElementFromDictionary:](v13, v14, v15);
}

- (id)timePeriodElementFromDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __objc2_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDTimePeriodNotificationCondition *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "doesTypeMatch:against:", v4, v6);

  if ((_DWORD)v5)
  {
    v7 = HMDTimeOfDayTimePeriodElement;
LABEL_5:
    v10 = (void *)objc_msgSend([v7 alloc], "initWithDictionary:", v4);
    goto LABEL_9;
  }
  v8 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "doesTypeMatch:against:", v4, v9);

  if ((_DWORD)v8)
  {
    v7 = HMDSunriseSunsetTimePeriodElement;
    goto LABEL_5;
  }
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v14;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Unknown time period element found : %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  v10 = 0;
LABEL_9:

  return v10;
}

- (id)serializedRegistrationForRemoteMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HMDTimePeriodNotificationCondition;
  -[HMDNotificationCondition serializedRegistrationForRemoteMessage](&v10, sel_serializedRegistrationForRemoteMessage);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMDTimePeriodNotificationCondition startElement](self, "startElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serializedRegistrationForRemoteMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("HMDTPSC.ck.se"));

  -[HMDTimePeriodNotificationCondition endElement](self, "endElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serializedRegistrationForRemoteMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("HMDTPSC.ck.ee"));

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMDTimePeriodNotificationCondition startElement](self, "startElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMDTimePeriodNotificationCondition endElement](self, "endElement");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "endElement");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMDTimePeriodNotificationCondition startElement](self, "startElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMDTimePeriodNotificationCondition endElement](self, "endElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDTimePeriodNotificationCondition startElement](self, "startElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMDTPSC.ck.se"));

  -[HMDTimePeriodNotificationCondition endElement](self, "endElement");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMDTPSC.ck.ee"));

}

- (HMDTimePeriodNotificationCondition)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDTimePeriodNotificationCondition *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDTPSC.ck.se"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDTPSC.ck.ee"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HMDTimePeriodNotificationCondition initWithStartElement:endElement:](self, "initWithStartElement:endElement:", v5, v6);
  return v7;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDTimePeriodNotificationCondition startElement](self, "startElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Start"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDTimePeriodNotificationCondition endElement](self, "endElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("End"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HMDTimePeriodElement)startElement
{
  return (HMDTimePeriodElement *)objc_getProperty(self, a2, 8, 1);
}

- (HMDTimePeriodElement)endElement
{
  return (HMDTimePeriodElement *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endElement, 0);
  objc_storeStrong((id *)&self->_startElement, 0);
}

+ (id)type
{
  return CFSTR("HMDTPSC.type");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
