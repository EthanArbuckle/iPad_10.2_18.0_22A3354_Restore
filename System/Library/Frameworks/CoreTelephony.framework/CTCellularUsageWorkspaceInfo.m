@implementation CTCellularUsageWorkspaceInfo

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCellularUsageWorkspaceInfo subscriberTag](self, "subscriberTag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", subscriberTag = %@"), v4);

  -[CTCellularUsageWorkspaceInfo metaDataForHomeCountry](self, "metaDataForHomeCountry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", metaDataForHomeCountry = %@"), v5);

  -[CTCellularUsageWorkspaceInfo metaDataForRoaming](self, "metaDataForRoaming");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", metaDataForRoaming = %@"), v6);

  -[CTCellularUsageWorkspaceInfo billingCycleEndDate](self, "billingCycleEndDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", billingCycleEndDate = %@"), v7);

  -[CTCellularUsageWorkspaceInfo previousBillingCycleDate](self, "previousBillingCycleDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", previousBillingCycleDate = %@"), v8);

  -[CTCellularUsageWorkspaceInfo billingCycleSupported](self, "billingCycleSupported");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", billingCycleSupported = %@"), v9);

  -[CTCellularUsageWorkspaceInfo carrierSpaceSupported](self, "carrierSpaceSupported");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", carrierSpaceSupported = %@"), v10);

  -[CTCellularUsageWorkspaceInfo workspaceName](self, "workspaceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", workspaceName = %@"), v11);

  -[CTCellularUsageWorkspaceInfo workspacePath](self, "workspacePath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", workspacePath = %@"), v12);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (CTCellularUsageWorkspaceInfo)initWithSubscriberTag:(id)a3 metaDataForHomeCountry:(id)a4 metaDataForRoaming:(id)a5 billingCycleEndDate:(id)a6 previousBillingCycleDate:(id)a7 billingCycleSupported:(id)a8 carrierSpaceSupported:(id)a9 workspaceName:(id)a10 workspacePath:(id)a11
{
  id v18;
  CTCellularUsageWorkspaceInfo *v19;
  CTCellularUsageWorkspaceInfo *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a6;
  v25 = a7;
  v24 = a8;
  v23 = a9;
  v22 = a10;
  v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)CTCellularUsageWorkspaceInfo;
  v19 = -[CTCellularUsageWorkspaceInfo init](&v30, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_subscriberTag, a3);
    objc_storeStrong((id *)&v20->_metaDataForHomeCountry, a4);
    objc_storeStrong((id *)&v20->_metaDataForRoaming, a5);
    objc_storeStrong((id *)&v20->_billingCycleEndDate, a6);
    objc_storeStrong((id *)&v20->_previousBillingCycleDate, a7);
    objc_storeStrong((id *)&v20->_billingCycleSupported, a8);
    objc_storeStrong((id *)&v20->_carrierSpaceSupported, a9);
    objc_storeStrong((id *)&v20->_workspaceName, a10);
    objc_storeStrong((id *)&v20->_workspacePath, a11);
  }

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[CTCellularUsageWorkspaceInfo subscriberTag](self, "subscriberTag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCellularUsageWorkspaceInfo metaDataForHomeCountry](self, "metaDataForHomeCountry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCellularUsageWorkspaceInfo metaDataForRoaming](self, "metaDataForRoaming");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCellularUsageWorkspaceInfo billingCycleEndDate](self, "billingCycleEndDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCellularUsageWorkspaceInfo previousBillingCycleDate](self, "previousBillingCycleDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCellularUsageWorkspaceInfo billingCycleSupported](self, "billingCycleSupported");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCellularUsageWorkspaceInfo carrierSpaceSupported](self, "carrierSpaceSupported");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCellularUsageWorkspaceInfo workspaceName](self, "workspaceName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCellularUsageWorkspaceInfo workspacePath](self, "workspacePath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v4, "initWithSubscriberTag:metaDataForHomeCountry:metaDataForRoaming:billingCycleEndDate:previousBillingCycleDate:billingCycleSupported:carrierSpaceSupported:workspaceName:workspacePath:", v5, v6, v7, v8, v9, v10, v11, v12, v13);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[CTCellularUsageWorkspaceInfo subscriberTag](self, "subscriberTag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("subscriberTag"));

  -[CTCellularUsageWorkspaceInfo metaDataForHomeCountry](self, "metaDataForHomeCountry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("metaDataForHomeCountry"));

  -[CTCellularUsageWorkspaceInfo metaDataForRoaming](self, "metaDataForRoaming");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("metaDataForRoaming"));

  -[CTCellularUsageWorkspaceInfo billingCycleEndDate](self, "billingCycleEndDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("billingCycleEndDate"));

  -[CTCellularUsageWorkspaceInfo previousBillingCycleDate](self, "previousBillingCycleDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("previousBillingCycleDate"));

  -[CTCellularUsageWorkspaceInfo billingCycleSupported](self, "billingCycleSupported");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("billingCycleSupported"));

  -[CTCellularUsageWorkspaceInfo carrierSpaceSupported](self, "carrierSpaceSupported");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("carrierSpaceSupported"));

  -[CTCellularUsageWorkspaceInfo workspaceName](self, "workspaceName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("workspaceName"));

  -[CTCellularUsageWorkspaceInfo workspacePath](self, "workspacePath");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("workspacePath"));

}

- (CTCellularUsageWorkspaceInfo)initWithCoder:(id)a3
{
  id v4;
  CTCellularUsageWorkspaceInfo *v5;
  uint64_t v6;
  NSNumber *subscriberTag;
  uint64_t v8;
  NSNumber *metaDataForHomeCountry;
  uint64_t v10;
  NSNumber *metaDataForRoaming;
  uint64_t v12;
  NSDate *billingCycleEndDate;
  uint64_t v14;
  NSDate *previousBillingCycleDate;
  uint64_t v16;
  NSNumber *billingCycleSupported;
  uint64_t v18;
  NSNumber *carrierSpaceSupported;
  uint64_t v20;
  NSString *workspaceName;
  uint64_t v22;
  NSString *workspacePath;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CTCellularUsageWorkspaceInfo;
  v5 = -[CTCellularUsageWorkspaceInfo init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subscriberTag"));
    v6 = objc_claimAutoreleasedReturnValue();
    subscriberTag = v5->_subscriberTag;
    v5->_subscriberTag = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metaDataForHomeCountry"));
    v8 = objc_claimAutoreleasedReturnValue();
    metaDataForHomeCountry = v5->_metaDataForHomeCountry;
    v5->_metaDataForHomeCountry = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metaDataForRoaming"));
    v10 = objc_claimAutoreleasedReturnValue();
    metaDataForRoaming = v5->_metaDataForRoaming;
    v5->_metaDataForRoaming = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("billingCycleEndDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    billingCycleEndDate = v5->_billingCycleEndDate;
    v5->_billingCycleEndDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previousBillingCycleDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    previousBillingCycleDate = v5->_previousBillingCycleDate;
    v5->_previousBillingCycleDate = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("billingCycleSupported"));
    v16 = objc_claimAutoreleasedReturnValue();
    billingCycleSupported = v5->_billingCycleSupported;
    v5->_billingCycleSupported = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("carrierSpaceSupported"));
    v18 = objc_claimAutoreleasedReturnValue();
    carrierSpaceSupported = v5->_carrierSpaceSupported;
    v5->_carrierSpaceSupported = (NSNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workspaceName"));
    v20 = objc_claimAutoreleasedReturnValue();
    workspaceName = v5->_workspaceName;
    v5->_workspaceName = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workspacePath"));
    v22 = objc_claimAutoreleasedReturnValue();
    workspacePath = v5->_workspacePath;
    v5->_workspacePath = (NSString *)v22;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)subscriberTag
{
  return self->_subscriberTag;
}

- (NSNumber)metaDataForHomeCountry
{
  return self->_metaDataForHomeCountry;
}

- (NSNumber)metaDataForRoaming
{
  return self->_metaDataForRoaming;
}

- (NSDate)billingCycleEndDate
{
  return self->_billingCycleEndDate;
}

- (NSDate)previousBillingCycleDate
{
  return self->_previousBillingCycleDate;
}

- (NSNumber)billingCycleSupported
{
  return self->_billingCycleSupported;
}

- (NSNumber)carrierSpaceSupported
{
  return self->_carrierSpaceSupported;
}

- (NSString)workspaceName
{
  return self->_workspaceName;
}

- (NSString)workspacePath
{
  return self->_workspacePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workspacePath, 0);
  objc_storeStrong((id *)&self->_workspaceName, 0);
  objc_storeStrong((id *)&self->_carrierSpaceSupported, 0);
  objc_storeStrong((id *)&self->_billingCycleSupported, 0);
  objc_storeStrong((id *)&self->_previousBillingCycleDate, 0);
  objc_storeStrong((id *)&self->_billingCycleEndDate, 0);
  objc_storeStrong((id *)&self->_metaDataForRoaming, 0);
  objc_storeStrong((id *)&self->_metaDataForHomeCountry, 0);
  objc_storeStrong((id *)&self->_subscriberTag, 0);
}

@end
