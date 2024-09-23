@implementation SGEntityTag

+ (id)contactDetail:(id)a3
{
  return +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("CD"), a3);
}

+ (id)isSent
{
  return (id)isSent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (id)name
{
  void *v3;
  NSString *v4;

  if (self->_value)
  {
    v3 = (void *)MEMORY[0x1A8583A40]();
    v4 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:%@"), self->_label, self->_value);
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    v4 = self->_label;
  }
  return v4;
}

+ (id)interactionContactIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGEntityTag.m"), 742, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contactIdentifier"));

  }
  +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("ICN"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)tagForLabel:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  void *v9;
  unsigned __int8 *v10;
  SGEntityTag *v11;
  void *v13;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGEntityTag.m"), 702, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("label"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGEntityTag.m"), 703, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value"));

LABEL_3:
  objc_msgSend((id)optionsByLabel, "objectForKeyedSubscript:", v7);
  v10 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGEntityTag.m"), 705, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("opts"));

  }
  v11 = -[SGEntityTag initWithLabel:value:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:value:stored:indexed:tracked:", v7, v9, v10[8], v10[9], v10[10]);

  return v11;
}

- (SGEntityTag)initWithLabel:(id)a3 value:(id)a4 stored:(BOOL)a5 indexed:(BOOL)a6 tracked:(BOOL)a7
{
  id v13;
  id v14;
  SGEntityTag *v15;
  uint64_t v16;
  NSString *label;
  uint64_t v18;
  NSString *value;
  void *v21;
  void *v22;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGEntityTag.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("label"));

  }
  if (objc_msgSend(v13, "containsString:", CFSTR(":")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGEntityTag.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![label containsString:@\":\"]"));

  }
  v23.receiver = self;
  v23.super_class = (Class)SGEntityTag;
  v15 = -[SGEntityTag init](&v23, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v13, "copy");
    label = v15->_label;
    v15->_label = (NSString *)v16;

    v18 = objc_msgSend(v14, "copy");
    value = v15->_value;
    v15->_value = (NSString *)v18;

    v15->_stored = a5;
    v15->_indexed = a6;
    v15->_tracked = a7;
  }

  return v15;
}

- (SGEntityTag)initWithLabel:(id)a3 stored:(BOOL)a4 indexed:(BOOL)a5 tracked:(BOOL)a6
{
  return -[SGEntityTag initWithLabel:value:stored:indexed:tracked:](self, "initWithLabel:value:stored:indexed:tracked:", a3, 0, a4, a5, a6);
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_label, "hash");
  return -[NSString hash](self->_value, "hash") - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  SGEntityTag *v4;
  SGEntityTag *v5;
  BOOL v6;

  v4 = (SGEntityTag *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGEntityTag isEqualToEntityTag:](self, "isEqualToEntityTag:", v5);

  return v6;
}

- (BOOL)isEqualToEntityTag:(id)a3
{
  id *v4;
  NSString *label;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  char v10;
  NSString *v11;
  NSString *v12;

  v4 = (id *)a3;
  label = self->_label;
  v6 = (NSString *)v4[2];
  if (label == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = label;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
      v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_value;
  v12 = v11;
  if (v11 == v4[3])
    v10 = 1;
  else
    v10 = -[NSString isEqual:](v11, "isEqual:");

LABEL_9:
  return v10;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1A8583A40](self, a2);
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SGEntityTag name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("SGEntityTag<%@>"), v5);

  objc_autoreleasePoolPop(v3);
  return v6;
}

- (BOOL)isInteractionId
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("IUID"));
}

- (BOOL)isInteractionGroupId
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("IGID"));
}

- (BOOL)isInteractionBundleId
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("IBID"));
}

- (BOOL)isInteractionTeamId
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("ITID"));
}

- (BOOL)isIntentResponseUserActivityString
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("IRUA"));
}

- (BOOL)isUrl
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("U"));
}

- (BOOL)isMailingListId
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("L"));
}

- (BOOL)isContactDetail
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("CD"));
}

- (BOOL)isInteractionContactIdentifier
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("ICN"));
}

- (BOOL)isExtraKey
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("EX"));
}

- (BOOL)isNaturalLanguageEventTypeIdentifier
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("NLET"));
}

- (BOOL)isNaturalLanguageEventAttributes
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("NLEA"));
}

- (BOOL)isNaturalLanguageEventLanguageID
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("NLLI"));
}

- (BOOL)isConfidenceScore
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("NLCS"));
}

- (BOOL)isParticipantCount
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("NLPC"));
}

- (BOOL)isUsedBubblesCount
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("NLBC"));
}

- (BOOL)isCalendarAppUsageLevel
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("CAUL"));
}

- (BOOL)isMailAppUsageLevel
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("MAUL"));
}

- (BOOL)isMessagesAppUsageLevel
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("MEUL"));
}

- (BOOL)isSchemaOrg
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("SO"));
}

- (BOOL)isReservationContainerReference
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("IRCR"));
}

- (BOOL)isReservationItemReferences
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("IRIR"));
}

- (BOOL)isEventMetadata
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("EM"));
}

- (id)eventMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v10;

  if (-[SGEntityTag isEventMetadata](self, "isEventMetadata"))
  {
    v3 = (void *)MEMORY[0x1A8583A40]();
    v4 = (void *)MEMORY[0x1E0CB36D8];
    -[SGEntityTag value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v4, "JSONObjectWithData:options:error:", v6, 0, &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;

    if (v8)
    {

      v7 = 0;
    }
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)isAppleMailMessageId
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("AMSG"));
}

- (BOOL)isMailboxIdentifier
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("MBOX"));
}

- (BOOL)isTemplateShortName
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("TMPL"));
}

- (BOOL)isTemplateName
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("TMPN"));
}

- (BOOL)isFieldReverseMapped
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("RMF"));
}

- (BOOL)isDomain
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("DOM"));
}

- (BOOL)isEventHash
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("EHSH"));
}

- (BOOL)isReminderHash
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("RHSH"));
}

- (BOOL)isPOIFilters
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("POIF"));
}

- (BOOL)isEKEventAvailabilityState
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("EKEA"));
}

- (BOOL)isExtractedEventCategory
{
  return objc_msgSend((id)extractedEventCategoryTags, "containsObject:", self);
}

- (BOOL)isEventSourceMetadata
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("ESM"));
}

- (id)isForwardedMail
{
  void *v3;

  v3 = &unk_1E4781328;
  if (-[SGEntityTag isForwardedMailTag](self, "isForwardedMailTag")
    && -[NSString isEqualToString:](self->_value, "isEqualToString:", CFSTR("1")))
  {
    return &unk_1E4781310;
  }
  return v3;
}

- (BOOL)isForwardedMailTag
{
  return -[NSString isEqualToString:](self->_label, "isEqualToString:", CFSTR("FWDM"));
}

- (BOOL)isAuthorTag
{
  return -[NSString isEqualToString:](self->_label, "isEqualToString:", CFSTR("ATHR"));
}

- (BOOL)isReminderMetadata
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("REM"));
}

- (id)reminderMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v10;

  if (-[SGEntityTag isReminderMetadata](self, "isReminderMetadata"))
  {
    v3 = (void *)MEMORY[0x1A8583A40]();
    v4 = (void *)MEMORY[0x1E0CB36D8];
    -[SGEntityTag value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v4, "JSONObjectWithData:options:error:", v6, 0, &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;

    if (v8)
    {

      v7 = 0;
    }
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)reservationItemReferences
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!-[SGEntityTag isReservationItemReferences](self, "isReservationItemReferences"))
    return 0;
  v3 = (void *)MEMORY[0x1A8583A40]();
  -[SGEntityTag value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v4, 0);
    v6 = (void *)MEMORY[0x1A8583A40]();
    v7 = objc_alloc(MEMORY[0x1E0C99E60]);
    v8 = objc_opt_class();
    v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v6);
    if (v5)
    {
      v16 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v9, v5, &v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v16;
      if (v11)
      {
        sgLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v11;
          _os_log_error_impl(&dword_1A2267000, v12, OS_LOG_TYPE_ERROR, "SGEntityTag Error decoding reservation item references: %@", buf, 0xCu);
        }

      }
      goto LABEL_18;
    }
    sgLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1A2267000, v15, OS_LOG_TYPE_FAULT, "serialized reservation item reference value should not be nil", buf, 2u);
    }

    if (!_PASEvaluateLogFaultAndProbCrashCriteria())
    {
      v10 = 0;
LABEL_18:

      goto LABEL_19;
    }
LABEL_20:
    abort();
  }
  sgLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1A2267000, v14, OS_LOG_TYPE_FAULT, "reservation item reference value should not be nil", buf, 2u);
  }

  if (_PASEvaluateLogFaultAndProbCrashCriteria())
    goto LABEL_20;
  v10 = 0;
LABEL_19:

  objc_autoreleasePoolPop(v3);
  return v10;
}

- (id)reservationContainerReference
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!-[SGEntityTag isReservationContainerReference](self, "isReservationContainerReference"))
    return 0;
  v3 = (void *)MEMORY[0x1A8583A40]();
  -[SGEntityTag value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v4, 0);
    if (v5)
    {
      v12 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v12;
      if (v7)
      {
        sgLogHandle();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v14 = v7;
          _os_log_error_impl(&dword_1A2267000, v8, OS_LOG_TYPE_ERROR, "SGEntityTag Error decoding reservation container reference: %@", buf, 0xCu);
        }

      }
      goto LABEL_18;
    }
    sgLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1A2267000, v11, OS_LOG_TYPE_FAULT, "serialized reservation container reference value should not be nil", buf, 2u);
    }

    if (!_PASEvaluateLogFaultAndProbCrashCriteria())
    {
      v6 = 0;
LABEL_18:

      goto LABEL_19;
    }
LABEL_20:
    abort();
  }
  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1A2267000, v10, OS_LOG_TYPE_FAULT, "reservation container reference value should not be nil", buf, 2u);
  }

  if (_PASEvaluateLogFaultAndProbCrashCriteria())
    goto LABEL_20;
  v6 = 0;
LABEL_19:

  objc_autoreleasePoolPop(v3);
  return v6;
}

- (BOOL)isManagedSourceAccount
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("ICSM"));
}

- (BOOL)isIcsAttachmentData
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("ICSD"));
}

- (id)icsAttachmentData
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  if (-[SGEntityTag isIcsAttachmentData](self, "isIcsAttachmentData"))
  {
    v3 = (void *)MEMORY[0x1A8583A40]();
    v4 = objc_alloc(MEMORY[0x1E0C99D50]);
    -[SGEntityTag value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithBase64EncodedString:options:", v5, 0);

    objc_autoreleasePoolPop(v3);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)isWalletOrderData
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("WOD"));
}

- (id)walletOrderData
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  if (-[SGEntityTag isWalletOrderData](self, "isWalletOrderData"))
  {
    v3 = (void *)MEMORY[0x1A8583A40]();
    v4 = objc_alloc(MEMORY[0x1E0C99D50]);
    -[SGEntityTag value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithBase64EncodedString:options:", v5, 0);

    objc_autoreleasePoolPop(v3);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)isWalletOrderDictionary
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("WODD"));
}

- (id)walletOrderDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  objc_class *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[SGEntityTag isWalletOrderDictionary](self, "isWalletOrderDictionary"))
  {
    v3 = (void *)MEMORY[0x1A8583A40]();
    v4 = (void *)MEMORY[0x1E0CB36D8];
    -[SGEntityTag value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v4, "JSONObjectWithData:options:error:", v6, 0, &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;

    if (v8)
    {
      sgLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v15 = v12;
        v16 = 2112;
        v17 = v8;
        _os_log_error_impl(&dword_1A2267000, v9, OS_LOG_TYPE_ERROR, "%@: Error encountered while creating dict for walletDictionary tag, %@", buf, 0x16u);

      }
      v7 = 0;
    }

    objc_autoreleasePoolPop(v3);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)isWalletPassData
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("WPD"));
}

- (id)walletPassData
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  if (-[SGEntityTag isWalletPassData](self, "isWalletPassData"))
  {
    v3 = (void *)MEMORY[0x1A8583A40]();
    v4 = objc_alloc(MEMORY[0x1E0C99D50]);
    -[SGEntityTag value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithBase64EncodedString:options:", v5, 0);

    objc_autoreleasePoolPop(v3);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)isWalletPassDictionary
{
  return -[NSString isEqual:](self->_label, "isEqual:", CFSTR("WPDD"));
}

- (id)walletPassDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  objc_class *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[SGEntityTag isWalletPassDictionary](self, "isWalletPassDictionary"))
  {
    v3 = (void *)MEMORY[0x1A8583A40]();
    v4 = (void *)MEMORY[0x1E0CB36D8];
    -[SGEntityTag value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v4, "JSONObjectWithData:options:error:", v6, 0, &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;

    if (!v7)
    {
      sgLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v15 = v12;
        v16 = 2112;
        v17 = v8;
        _os_log_error_impl(&dword_1A2267000, v9, OS_LOG_TYPE_ERROR, "%@: Error encountered while creating dict for walletDictionary tag, %@", buf, 0x16u);

      }
      v7 = 0;
    }

    objc_autoreleasePoolPop(v3);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)value
{
  return self->_value;
}

- (BOOL)indexed
{
  return self->_indexed;
}

- (BOOL)stored
{
  return self->_stored;
}

- (BOOL)tracked
{
  return self->_tracked;
}

+ (id)remember:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)byLabel;
  objc_msgSend(v3, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, v5);

  return v3;
}

+ (void)rememberLabel:(id)a3 stored:(BOOL)a4 indexed:(BOOL)a5 tracked:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  id v9;
  SGEntityTag *v10;
  _BYTE *v11;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v11 = (_BYTE *)objc_opt_new();
  v11[8] = v8;
  v11[9] = v7;
  v11[10] = v6;
  objc_msgSend((id)optionsByLabel, "setObject:forKeyedSubscript:", v11, v9);
  v10 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", v9, v8, v7, v6);
  objc_msgSend((id)byLabel, "setObject:forKeyedSubscript:", v10, v9);

}

+ (void)tombstoneLabel:(id)a3
{
  objc_msgSend((id)tombstonedLabels, "addObject:", a3);
}

+ (void)initialize
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  SGEntityTag *v7;
  uint64_t v8;
  void *v9;
  SGEntityTag *v10;
  uint64_t v11;
  void *v12;
  SGEntityTag *v13;
  uint64_t v14;
  void *v15;
  SGEntityTag *v16;
  uint64_t v17;
  void *v18;
  SGEntityTag *v19;
  uint64_t v20;
  void *v21;
  SGEntityTag *v22;
  uint64_t v23;
  void *v24;
  SGEntityTag *v25;
  uint64_t v26;
  void *v27;
  SGEntityTag *v28;
  uint64_t v29;
  void *v30;
  SGEntityTag *v31;
  uint64_t v32;
  void *v33;
  SGEntityTag *v34;
  uint64_t v35;
  void *v36;
  SGEntityTag *v37;
  uint64_t v38;
  void *v39;
  SGEntityTag *v40;
  uint64_t v41;
  void *v42;
  SGEntityTag *v43;
  uint64_t v44;
  void *v45;
  SGEntityTag *v46;
  uint64_t v47;
  void *v48;
  SGEntityTag *v49;
  uint64_t v50;
  void *v51;
  SGEntityTag *v52;
  uint64_t v53;
  void *v54;
  SGEntityTag *v55;
  uint64_t v56;
  void *v57;
  SGEntityTag *v58;
  uint64_t v59;
  void *v60;
  SGEntityTag *v61;
  uint64_t v62;
  void *v63;
  SGEntityTag *v64;
  uint64_t v65;
  void *v66;
  SGEntityTag *v67;
  uint64_t v68;
  void *v69;
  SGEntityTag *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  id v74;
  uint64_t v75;
  void *v76;
  SGEntityTag *v77;
  uint64_t v78;
  void *v79;
  SGEntityTag *v80;
  uint64_t v81;
  void *v82;
  SGEntityTag *v83;
  uint64_t v84;
  void *v85;
  SGEntityTag *v86;
  uint64_t v87;
  void *v88;
  SGEntityTag *v89;
  uint64_t v90;
  void *v91;
  SGEntityTag *v92;
  uint64_t v93;
  void *v94;
  SGEntityTag *v95;
  uint64_t v96;
  void *v97;
  SGEntityTag *v98;
  uint64_t v99;
  void *v100;
  SGEntityTag *v101;
  uint64_t v102;
  void *v103;
  SGEntityTag *v104;
  uint64_t v105;
  void *v106;
  SGEntityTag *v107;
  uint64_t v108;
  void *v109;
  SGEntityTag *v110;
  uint64_t v111;
  void *v112;
  SGEntityTag *v113;
  uint64_t v114;
  void *v115;
  SGEntityTag *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  id v120;
  uint64_t v121;
  void *v122;
  SGEntityTag *v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  void *v129;

  if ((id)objc_opt_class() == a1)
  {
    v3 = objc_opt_new();
    v4 = (void *)yyyymmdd;
    yyyymmdd = v3;

    objc_msgSend((id)yyyymmdd, "setDateFormat:", CFSTR("yyyyMMdd"));
    v5 = objc_opt_new();
    v6 = (void *)byLabel;
    byLabel = v5;

    v7 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("ex"), 1, 0, 0);
    objc_msgSend(a1, "remember:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)extracted;
    extracted = v8;

    v10 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("cancel"), 1, 0, 0);
    objc_msgSend(a1, "remember:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)cancelled;
    cancelled = v11;

    v13 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("fromEx"), 1, 0, 0);
    objc_msgSend(a1, "remember:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)fromExtractedDomain;
    fromExtractedDomain = v14;

    v16 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("allDay"), 1, 0, 0);
    objc_msgSend(a1, "remember:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)allDay;
    allDay = v17;

    v19 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("inhuman"), 1, 1, 0);
    objc_msgSend(a1, "remember:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)inhuman;
    inhuman = v20;

    v22 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("human"), 1, 0, 0);
    objc_msgSend(a1, "remember:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)human;
    human = v23;

    v25 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("defaultDuration"), 1, 0, 0);
    objc_msgSend(a1, "remember:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)defaultDuration;
    defaultDuration = v26;

    v28 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("fwd"), 1, 0, 0);
    objc_msgSend(a1, "remember:", v28);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)fromForwardedMessage;
    fromForwardedMessage = v29;

    v31 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("re"), 1, 0, 0);
    objc_msgSend(a1, "remember:", v31);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)fromReply;
    fromReply = v32;

    v34 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("nl"), 1, 0, 1);
    objc_msgSend(a1, "remember:", v34);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)naturalLanguageEvent;
    naturalLanguageEvent = v35;

    v37 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("ics"), 1, 0, 1);
    objc_msgSend(a1, "remember:", v37);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)fromCalendarAttachment;
    fromCalendarAttachment = v38;

    v40 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("partial"), 1, 0, 0);
    objc_msgSend(a1, "remember:", v40);
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)isPartiallyDownloaded;
    isPartiallyDownloaded = v41;

    v43 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("exFlight"), 1, 0, 1);
    objc_msgSend(a1, "remember:", v43);
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)extractedFlight;
    extractedFlight = v44;

    v46 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("exBus"), 1, 0, 1);
    objc_msgSend(a1, "remember:", v46);
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = (void *)extractedBus;
    extractedBus = v47;

    v49 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("exTrain"), 1, 0, 1);
    objc_msgSend(a1, "remember:", v49);
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = (void *)extractedTrain;
    extractedTrain = v50;

    v52 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("exBoat"), 1, 0, 1);
    objc_msgSend(a1, "remember:", v52);
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = (void *)extractedBoat;
    extractedBoat = v53;

    v55 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("exHotel"), 1, 0, 1);
    objc_msgSend(a1, "remember:", v55);
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = (void *)extractedHotel;
    extractedHotel = v56;

    v58 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("exCarRental"), 1, 0, 1);
    objc_msgSend(a1, "remember:", v58);
    v59 = objc_claimAutoreleasedReturnValue();
    v60 = (void *)extractedCarRental;
    extractedCarRental = v59;

    v61 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("exTicket"), 1, 0, 1);
    objc_msgSend(a1, "remember:", v61);
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = (void *)extractedTicket;
    extractedTicket = v62;

    v64 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("exMovie"), 1, 0, 1);
    objc_msgSend(a1, "remember:", v64);
    v65 = objc_claimAutoreleasedReturnValue();
    v66 = (void *)extractedMovie;
    extractedMovie = v65;

    v67 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("exFood"), 1, 0, 1);
    objc_msgSend(a1, "remember:", v67);
    v68 = objc_claimAutoreleasedReturnValue();
    v69 = (void *)extractedFood;
    extractedFood = v68;

    v70 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("exSocial"), 1, 0, 1);
    objc_msgSend(a1, "remember:", v70);
    v71 = objc_claimAutoreleasedReturnValue();
    v72 = (void *)extractedSocial;
    extractedSocial = v71;

    v73 = (void *)MEMORY[0x1A8583A40]();
    v74 = objc_alloc(MEMORY[0x1E0C99E60]);
    v75 = objc_msgSend(v74, "initWithObjects:", extractedFlight, extractedBus, extractedTrain, extractedBoat, extractedHotel, extractedCarRental, extractedTicket, extractedMovie, extractedFood, extractedSocial, 0);
    objc_autoreleasePoolPop(v73);
    v76 = (void *)extractedEventCategoryTags;
    extractedEventCategoryTags = v75;

    v77 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("hardName"), 1, 0, 0);
    objc_msgSend(a1, "remember:", v77);
    v78 = objc_claimAutoreleasedReturnValue();
    v79 = (void *)hardName;
    hardName = v78;

    v80 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("fullyDissected"), 1, 0, 0);
    objc_msgSend(a1, "remember:", v80);
    v81 = objc_claimAutoreleasedReturnValue();
    v82 = (void *)fullyDissected;
    fullyDissected = v81;

    v83 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("fromInteraction"), 1, 0, 0);
    objc_msgSend(a1, "remember:", v83);
    v84 = objc_claimAutoreleasedReturnValue();
    v85 = (void *)fromInteraction;
    fromInteraction = v84;

    v86 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("fromTextMessage"), 1, 0, 0);
    objc_msgSend(a1, "remember:", v86);
    v87 = objc_claimAutoreleasedReturnValue();
    v88 = (void *)fromTextMessage;
    fromTextMessage = v87;

    v89 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("fromSync"), 1, 1, 0);
    objc_msgSend(a1, "remember:", v89);
    v90 = objc_claimAutoreleasedReturnValue();
    v91 = (void *)fromSync;
    fromSync = v90;

    v92 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("isSent"), 1, 0, 0);
    objc_msgSend(a1, "remember:", v92);
    v93 = objc_claimAutoreleasedReturnValue();
    v94 = (void *)isSent;
    isSent = v93;

    v95 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("significantSender"), 1, 0, 0);
    objc_msgSend(a1, "remember:", v95);
    v96 = objc_claimAutoreleasedReturnValue();
    v97 = (void *)significantSender;
    significantSender = v96;

    v98 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("titleGeneratedFromTemplate"), 1, 0, 0);
    objc_msgSend(a1, "remember:", v98);
    v99 = objc_claimAutoreleasedReturnValue();
    v100 = (void *)titleGeneratedFromTemplate;
    titleGeneratedFromTemplate = v99;

    v101 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("titleGeneratedFromSubject"), 1, 0, 0);
    objc_msgSend(a1, "remember:", v101);
    v102 = objc_claimAutoreleasedReturnValue();
    v103 = (void *)titleGeneratedFromSubject;
    titleGeneratedFromSubject = v102;

    v104 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("templateException"), 1, 0, 0);
    objc_msgSend(a1, "remember:", v104);
    v105 = objc_claimAutoreleasedReturnValue();
    v106 = (void *)templateException;
    templateException = v105;

    v107 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("geocodingModeAddressOnly"), 1, 0, 0);
    objc_msgSend(a1, "remember:", v107);
    v108 = objc_claimAutoreleasedReturnValue();
    v109 = (void *)geocodingModeAddressOnly;
    geocodingModeAddressOnly = v108;

    v110 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("geocodingModePOIOnly"), 1, 0, 0);
    objc_msgSend(a1, "remember:", v110);
    v111 = objc_claimAutoreleasedReturnValue();
    v112 = (void *)geocodingModePOIOnly;
    geocodingModePOIOnly = v111;

    v113 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("geocodingModeAddressThenPOI"), 1, 0, 0);
    objc_msgSend(a1, "remember:", v113);
    v114 = objc_claimAutoreleasedReturnValue();
    v115 = (void *)geocodingModeAddressThenPOI;
    geocodingModeAddressThenPOI = v114;

    v116 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("geocodingModeAddressWithCanonicalSearch"), 1, 0, 0);
    objc_msgSend(a1, "remember:", v116);
    v117 = objc_claimAutoreleasedReturnValue();
    v118 = (void *)geocodingModeAddressWithCanonicalSearch;
    geocodingModeAddressWithCanonicalSearch = v117;

    v119 = (void *)MEMORY[0x1A8583A40]();
    v120 = objc_alloc(MEMORY[0x1E0C99E60]);
    v121 = objc_msgSend(v120, "initWithObjects:", geocodingModeAddressOnly, geocodingModePOIOnly, geocodingModeAddressThenPOI, geocodingModeAddressWithCanonicalSearch, 0);
    objc_autoreleasePoolPop(v119);
    v122 = (void *)geocodingModeTags;
    geocodingModeTags = v121;

    v123 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("requiresDeferredDissection"), 1, 0, 0);
    objc_msgSend(a1, "remember:", v123);
    v124 = objc_claimAutoreleasedReturnValue();
    v125 = (void *)requiresDeferredDissection;
    requiresDeferredDissection = v124;

    v126 = objc_opt_new();
    v127 = (void *)optionsByLabel;
    optionsByLabel = v126;

    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("U"), 1, 0, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("CD"), 1, 1, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("ID"), 1, 1, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("EX"), 1, 1, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("MSG"), 0, 1, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("AMSG"), 1, 1, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("MBOX"), 1, 1, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("ICST"), 1, 0, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("TZID"), 1, 0, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("ET"), 1, 1, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("TMPL"), 1, 0, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("TMPN"), 1, 0, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("RMF"), 1, 0, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("EHSH"), 1, 1, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("L"), 1, 0, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("ICN"), 1, 1, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("IUID"), 1, 1, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("IGID"), 1, 1, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("IBID"), 1, 1, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("ITID"), 1, 1, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("NLET"), 1, 0, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("NLLI"), 1, 0, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("NLEA"), 1, 0, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("NLCS"), 1, 0, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("NLPC"), 1, 0, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("NLBC"), 1, 0, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("SO"), 1, 0, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("EM"), 1, 0, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("DOM"), 1, 0, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("CAUL"), 1, 0, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("MAUL"), 1, 0, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("MEUL"), 1, 0, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("REM"), 1, 0, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("RHSH"), 1, 1, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("IRCR"), 1, 0, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("IRIR"), 1, 0, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("POIF"), 1, 1, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("IRUA"), 1, 0, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("EKEA"), 1, 1, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("ICSM"), 1, 1, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("ICSD"), 1, 1, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("WOD"), 1, 1, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("WODD"), 1, 1, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("WPD"), 1, 1, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("WPDD"), 1, 1, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("ESM"), 0, 0, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("FWDM"), 0, 0, 0);
    objc_msgSend(a1, "rememberLabel:stored:indexed:tracked:", CFSTR("ATHR"), 0, 0, 0);
    v128 = objc_opt_new();
    v129 = (void *)tombstonedLabels;
    tombstonedLabels = v128;

    objc_msgSend(a1, "tombstoneLabel:", CFSTR("HHSH"));
    objc_msgSend(a1, "tombstoneLabel:", CFSTR("INTE"));
    objc_msgSend(a1, "tombstoneLabel:", CFSTR("nonUserFacingUpdate"));
    objc_msgSend(a1, "tombstoneLabel:", CFSTR("FBU"));
  }
}

+ (id)resolveName:(id)a3
{
  __CFString *v3;
  char *CStringPtr;
  const UInt8 *v5;
  _BYTE *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  SGEntityTag *v11;
  void *v12;
  SGEntityTag *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  CStringPtr = (char *)CFStringGetCStringPtr(v3, 0x600u);
  if (CStringPtr)
  {
    v5 = (const UInt8 *)CStringPtr;
    v6 = memchr(CStringPtr, 58, -[__CFString length](v3, "length"));
    if (!v6)
    {

      goto LABEL_12;
    }
    v7 = (__CFString *)CFStringCreateWithBytesNoCopy(0, v5, v6 - v5, 0x600u, 0, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  }
  else
  {
    v8 = (void *)MEMORY[0x1A8583A40]();
    v9 = -[__CFString rangeOfString:options:](v3, "rangeOfString:options:", CFSTR(":"), 2);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = 0;
    }
    else
    {
      -[__CFString substringToIndex:](v3, "substringToIndex:", v9);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_autoreleasePoolPop(v8);
  }

  if (v7)
  {
    objc_msgSend((id)byLabel, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = [SGEntityTag alloc];
      objc_msgSend(v10, "label");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    if (objc_msgSend((id)tombstonedLabels, "containsObject:", v7))
    {
      v11 = [SGEntityTag alloc];
      v12 = v7;
LABEL_20:
      v15 = (void *)MEMORY[0x1A8583A40]();
      -[__CFString substringFromIndex:](v3, "substringFromIndex:", -[__CFString length](v7, "length") + 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v15);
      v13 = -[SGEntityTag initWithLabel:value:stored:indexed:tracked:](v11, "initWithLabel:value:stored:indexed:tracked:", v12, v16, objc_msgSend(v10, "stored"), objc_msgSend(v10, "indexed"), objc_msgSend(v10, "tracked"));

      if (v10)
      goto LABEL_26;
    }
    sgLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      v19 = 138412290;
      v20 = v7;
      _os_log_fault_impl(&dword_1A2267000, v17, OS_LOG_TYPE_FAULT, "Unable to resolve tag label: %@", (uint8_t *)&v19, 0xCu);
    }

    if (!_PASEvaluateLogFaultAndProbCrashCriteria())
    {
      v13 = 0;
LABEL_26:

      goto LABEL_27;
    }
LABEL_28:
    abort();
  }
LABEL_12:
  objc_msgSend((id)byLabel, "objectForKeyedSubscript:", v3);
  v13 = (SGEntityTag *)objc_claimAutoreleasedReturnValue();
  if (!v13 && (objc_msgSend((id)tombstonedLabels, "containsObject:", 0) & 1) == 0)
  {
    sgLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      v19 = 138412290;
      v20 = v3;
      _os_log_fault_impl(&dword_1A2267000, v14, OS_LOG_TYPE_FAULT, "Unable to resolve tag name: %@", (uint8_t *)&v19, 0xCu);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria())
      goto LABEL_28;
    v13 = 0;
  }
LABEL_27:

  return v13;
}

+ (id)extractedEvent
{
  return (id)extracted;
}

+ (id)extractedFlight
{
  return (id)extractedFlight;
}

+ (id)extractedBus
{
  return (id)extractedBus;
}

+ (id)extractedTrain
{
  return (id)extractedTrain;
}

+ (id)extractedHotel
{
  return (id)extractedHotel;
}

+ (id)extractedCarRental
{
  return (id)extractedCarRental;
}

+ (id)extractedTicket
{
  return (id)extractedTicket;
}

+ (id)extractedMovie
{
  return (id)extractedMovie;
}

+ (id)extractedFood
{
  return (id)extractedFood;
}

+ (id)extractedSocial
{
  return (id)extractedSocial;
}

+ (id)extractedBoat
{
  return (id)extractedBoat;
}

+ (id)categoryTagWithCategoryType:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 1:
      +[SGEntityTag extractedFlight](SGEntityTag, "extractedFlight", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      +[SGEntityTag extractedBus](SGEntityTag, "extractedBus", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      +[SGEntityTag extractedTrain](SGEntityTag, "extractedTrain", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      +[SGEntityTag extractedHotel](SGEntityTag, "extractedHotel", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      +[SGEntityTag extractedCarRental](SGEntityTag, "extractedCarRental", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      +[SGEntityTag extractedTicket](SGEntityTag, "extractedTicket", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      +[SGEntityTag extractedMovie](SGEntityTag, "extractedMovie", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      +[SGEntityTag extractedFood](SGEntityTag, "extractedFood", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      +[SGEntityTag extractedSocial](SGEntityTag, "extractedSocial", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      +[SGEntityTag extractedBoat](SGEntityTag, "extractedBoat", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

+ (id)eventCategoryToEntityTagMapping
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_opt_new();
  v4 = 1;
  do
  {
    v5 = (void *)MEMORY[0x1A8583A40]();
    objc_msgSend(a1, "categoryTagWithCategoryType:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "label");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "rangeOfString:options:", CFSTR("^ex[A-Z][a-zA-Z]*$"), 1026) == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGEntityTag.m"), 384, CFSTR("expected exSomething, got %@ for tag %@"), v8, v7);

      }
      objc_msgSend(v7, "label");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "substringFromIndex:", objc_msgSend(CFSTR("ex"), "length"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, v10);
    }

    objc_autoreleasePoolPop(v5);
    v4 = (v4 + 1);
  }
  while ((_DWORD)v4 != 11);
  return v3;
}

+ (id)entityTagToEventCategoryMapping
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = (void *)MEMORY[0x1A8583A40](a1, a2);
  objc_msgSend(a1, "eventCategoryToEntityTagMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0C99D80]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__SGEntityTag_entityTagToEventCategoryMapping__block_invoke;
  v11[3] = &unk_1E475FEE0;
  v12 = v4;
  v7 = v4;
  objc_msgSend(v5, "_pas_mappedArrayWithTransform:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithObjects:forKeys:", v5, v8);

  objc_autoreleasePoolPop(v3);
  return v9;
}

+ (id)allExtractedEventTags
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1A8583A40](a1, a2);
  objc_msgSend(a1, "eventCategoryToEntityTagMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

+ (id)geocodingModeAddressOnly
{
  return (id)geocodingModeAddressOnly;
}

+ (id)geocodingModePOIOnly
{
  return (id)geocodingModePOIOnly;
}

+ (id)geocodingModeAddressThenPOI
{
  return (id)geocodingModeAddressThenPOI;
}

+ (id)geocodingModeAddressWithCanonicalSearch
{
  return (id)geocodingModeAddressWithCanonicalSearch;
}

+ (id)fromExtractedDomain
{
  return (id)fromExtractedDomain;
}

+ (id)extractedEventCancellation
{
  return (id)cancelled;
}

+ (id)allDay
{
  return (id)allDay;
}

+ (id)inhuman
{
  return (id)inhuman;
}

+ (id)human
{
  return (id)human;
}

+ (id)hardName
{
  return (id)hardName;
}

+ (id)naturalLanguageEvent
{
  return (id)naturalLanguageEvent;
}

+ (id)fromCalendarAttachment
{
  return (id)fromCalendarAttachment;
}

+ (id)textCalendarAttachment:(id)a3
{
  return +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("ICST"), a3);
}

+ (id)timezoneIdentifier:(id)a3
{
  return +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("TZID"), a3);
}

+ (id)fromInteraction
{
  return (id)fromInteraction;
}

+ (id)interactionId:(id)a3
{
  return +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("IUID"), a3);
}

+ (id)interactionGroupId:(id)a3
{
  return +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("IGID"), a3);
}

+ (id)interactionBundleId:(id)a3
{
  return +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("IBID"), a3);
}

+ (id)interactionTeamId:(id)a3
{
  return +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("ITID"), a3);
}

+ (id)naturalLanguageEventTypeIdentifier:(id)a3
{
  return +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("NLET"), a3);
}

+ (id)naturalLanguageEventLanguageID:(id)a3
{
  return +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("NLLI"), a3);
}

+ (id)naturalLanguageEventAttributes:(unint64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lu"), a3);
  +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("NLEA"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)confidenceScore:(float)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%f"), a3);
  +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("NLCS"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)participantCount:(unsigned __int8)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%hhu"), a3);
  +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("NLPC"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)usedBubblesCount:(unsigned __int8)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%hhu"), a3);
  +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("NLBC"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)calendarAppUsageLevel:(float)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%f"), a3);
  +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("CAUL"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)mailAppUsageLevel:(unsigned __int8)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%hhu"), a3);
  +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("MAUL"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)messagesAppUsageLevel:(unsigned __int8)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%hhu"), a3);
  +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("MEUL"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)schemaOrg:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v5 = (void *)MEMORY[0x1A8583A40]();
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v4, 0, &v11);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
      +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("SO"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)reservationContainerReferenceWithData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x1A8583A40]();
  objc_msgSend(v3, "base64EncodedStringWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);
  +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("IRCR"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)reservationContainerReference:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1A8583A40]();
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  objc_autoreleasePoolPop(v4);
  if (v5)
  {
    +[SGEntityTag reservationContainerReferenceWithData:](SGEntityTag, "reservationContainerReferenceWithData:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)reservationItemReferencesWithData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x1A8583A40]();
  objc_msgSend(v3, "base64EncodedStringWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);
  +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("IRIR"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)reservationItemReferences:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1A8583A40]();
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  objc_autoreleasePoolPop(v4);
  if (v5)
  {
    +[SGEntityTag reservationItemReferencesWithData:](SGEntityTag, "reservationItemReferencesWithData:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)intentResponseUserActivityString:(id)a3
{
  return +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("IRUA"), a3);
}

+ (id)eventMetadata:(id)a3
{
  return +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("EM"), a3);
}

+ (id)fromTextMessage
{
  return (id)fromTextMessage;
}

+ (id)fromSync
{
  return (id)fromSync;
}

+ (id)significantSender
{
  return (id)significantSender;
}

+ (id)titleGeneratedFromTemplate
{
  return (id)titleGeneratedFromTemplate;
}

+ (id)titleGeneratedFromSubject
{
  return (id)titleGeneratedFromSubject;
}

+ (id)templateException
{
  return (id)templateException;
}

+ (id)defaultDuration
{
  return (id)defaultDuration;
}

+ (id)fromForwardedMessage
{
  return (id)fromForwardedMessage;
}

+ (id)fromReply
{
  return (id)fromReply;
}

+ (id)isPartiallyDownloaded
{
  return (id)isPartiallyDownloaded;
}

+ (id)requiresDeferredDissection
{
  return (id)requiresDeferredDissection;
}

+ (id)fullyDissected
{
  return (id)fullyDissected;
}

+ (id)url:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("U"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)mailingListId:(id)a3
{
  return +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("L"), a3);
}

+ (id)extraKey:(id)a3
{
  return +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("EX"), a3);
}

+ (id)containsEntityExtraction:(int64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), a3);
  +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("ET"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)messageWithMessageId:(id)a3 fromSource:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  SGDelimitedStringsSerialize(a4, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, (uint64_t)a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("MSG"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)appleMailMessageId:(id)a3 fromSource:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  SGDelimitedStringsSerialize(a4, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, (uint64_t)a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("AMSG"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)mailboxIdentifier:(id)a3
{
  return +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("MBOX"), a3);
}

+ (id)messageWithMailMessageKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "messageId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "messageWithMessageId:fromSource:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)extractedFromTemplateWithShortName:(id)a3
{
  return +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("TMPL"), a3);
}

+ (id)extractedFromTemplateWithName:(id)a3
{
  return +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("TMPN"), a3);
}

+ (id)fieldReverseMapped:(id)a3
{
  return +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("RMF"), a3);
}

+ (id)domain:(id)a3
{
  return +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("DOM"), a3);
}

+ (id)eventHash:(id)a3
{
  return +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("EHSH"), a3);
}

+ (id)reminderHash:(id)a3
{
  return +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("RHSH"), a3);
}

+ (id)poiFilters:(id)a3
{
  return +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("POIF"), a3);
}

+ (id)ekEventAvailabilityState:(id)a3
{
  return +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("EKEA"), a3);
}

+ (id)allTags
{
  return (id)objc_msgSend((id)extractedEventCategoryTags, "copy");
}

+ (id)testTag:(int)a3
{
  uint64_t v3;
  void *v5;
  SGEntityTag *v6;
  id v7;
  SGEntityTag *v8;
  void *v9;
  SGEntityTag *v10;

  v3 = *(_QWORD *)&a3;
  objc_msgSend((id)byLabel, "objectForKeyedSubscript:", CFSTR("TEST"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = -[SGEntityTag initWithLabel:stored:indexed:tracked:]([SGEntityTag alloc], "initWithLabel:stored:indexed:tracked:", CFSTR("TEST"), 1, 1, 1);
    v7 = (id)objc_msgSend(a1, "remember:", v6);

  }
  v8 = [SGEntityTag alloc];
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%d"), v3);
  v10 = -[SGEntityTag initWithLabel:value:stored:indexed:tracked:](v8, "initWithLabel:value:stored:indexed:tracked:", CFSTR("TEST"), v9, 1, 1, 1);

  return v10;
}

+ (id)eventSourceMetadata:(id)a3
{
  return +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("ESM"), a3);
}

+ (id)isForwardedMail:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("1");
  else
    v3 = CFSTR("0");
  +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("FWDM"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)author:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, 1, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);
    +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("ATHR"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)reminderMetadata:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v5 = (void *)MEMORY[0x1A8583A40]();
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v4, 0, &v11);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
      +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("REM"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)managedSourceAccount:(id)a3
{
  return +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("ICSM"), a3);
}

+ (id)icsAttachmentData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  v4 = (void *)MEMORY[0x1A8583A40]();
  v5 = (void *)MEMORY[0x1A8583A40]();
  objc_msgSend(v3, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v5);
  if (!v6)
  {
    sgLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v11;
      _os_log_error_impl(&dword_1A2267000, v8, OS_LOG_TYPE_ERROR, "%@: Error encountered while creating tag for ics attachment data", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    goto LABEL_7;
  }
  +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("ICSD"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
LABEL_8:

  return v7;
}

+ (id)walletOrderData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  v4 = (void *)MEMORY[0x1A8583A40]();
  v5 = (void *)MEMORY[0x1A8583A40]();
  objc_msgSend(v3, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v5);
  if (!v6)
  {
    sgLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v11;
      _os_log_error_impl(&dword_1A2267000, v8, OS_LOG_TYPE_ERROR, "%@: Error encountered while creating tag for walletOrderData", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    goto LABEL_7;
  }
  +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("WOD"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
LABEL_8:

  return v7;
}

+ (id)walletOrderDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v5 = (void *)MEMORY[0x1A8583A40]();
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v4, 0, &v13);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v13;
    if (v6)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
      +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("WODD"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      sgLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v15 = v12;
        v16 = 2112;
        v17 = v7;
        _os_log_error_impl(&dword_1A2267000, v6, OS_LOG_TYPE_ERROR, "%@: Error encountered while creating tag for walletOrderDictionary, %@", buf, 0x16u);

      }
      v9 = 0;
    }

    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)walletPassData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  v4 = (void *)MEMORY[0x1A8583A40]();
  v5 = (void *)MEMORY[0x1A8583A40]();
  objc_msgSend(v3, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v5);
  if (!v6)
  {
    sgLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v11;
      _os_log_error_impl(&dword_1A2267000, v8, OS_LOG_TYPE_ERROR, "%@: Error encountered while creating tag for walletPassData", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    goto LABEL_7;
  }
  +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("WPD"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
LABEL_8:

  return v7;
}

+ (id)walletPassDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v5 = (void *)MEMORY[0x1A8583A40]();
    if ((objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v4) & 1) == 0)
    {
      sgLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138739971;
        v20 = v4;
        _os_log_error_impl(&dword_1A2267000, v10, OS_LOG_TYPE_ERROR, "Cannot serialize pass dictionary: %{sensitive}@", buf, 0xCu);
      }

      objc_autoreleasePoolPop(v5);
      goto LABEL_15;
    }
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v4, 0, &v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v18;
    if (v7)
    {
      sgLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v20 = v17;
        v21 = 2112;
        v22 = v7;
        _os_log_error_impl(&dword_1A2267000, v8, OS_LOG_TYPE_ERROR, "%@: Error encountered while creating tag for walletPassDictionary, %@", buf, 0x16u);

      }
    }
    else if (v6)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
      +[SGEntityTag tagForLabel:value:](SGEntityTag, "tagForLabel:value:", CFSTR("WPDD"), v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v5);
      goto LABEL_16;
    }

    objc_autoreleasePoolPop(v5);
  }
  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v15;
    _os_log_debug_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEBUG, "%@: Couldnt create a entity tag from walletPassDictionary", buf, 0xCu);

  }
LABEL_15:
  v11 = 0;
LABEL_16:

  return v11;
}

uint64_t __46__SGEntityTag_entityTagToEventCategoryMapping__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

@end
