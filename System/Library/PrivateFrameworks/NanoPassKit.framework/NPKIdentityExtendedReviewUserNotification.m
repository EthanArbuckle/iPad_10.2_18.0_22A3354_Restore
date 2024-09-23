@implementation NPKIdentityExtendedReviewUserNotification

- (NPKIdentityExtendedReviewUserNotification)initWithNotificationType:(unint64_t)a3 documentType:(unint64_t)a4 issuerName:(id)a5
{
  id v8;
  NPKIdentityExtendedReviewUserNotification *v9;
  NPKIdentityExtendedReviewUserNotification *v10;
  uint64_t v11;
  NSString *issuerName;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NPKIdentityExtendedReviewUserNotification;
  v9 = -[NPKIdentityExtendedReviewUserNotification init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_notificationType = a3;
    v9->_documentType = a4;
    v11 = objc_msgSend(v8, "copy");
    issuerName = v10->_issuerName;
    v10->_issuerName = (NSString *)v11;

  }
  return v10;
}

- (id)title
{
  unint64_t documentType;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;

  switch(self->_notificationType)
  {
    case 0uLL:
      documentType = self->_documentType;
      v3 = CFSTR("EXTENDED_REVIEW_ACTION_REQUIRED_TITLE_STATE_ID");
      v4 = CFSTR("EXTENDED_REVIEW_ACTION_REQUIRED_TITLE_DRIVER_LICENSE");
      goto LABEL_11;
    case 1uLL:
    case 5uLL:
      documentType = self->_documentType;
      v3 = CFSTR("EXTENDED_REVIEW_VERIFICATION_CODE_REQUIRED_TITLE_STATE_ID");
      v4 = CFSTR("EXTENDED_REVIEW_VERIFICATION_CODE_REQUIRED_TITLE_DRIVER_LICENSE");
      goto LABEL_11;
    case 2uLL:
      documentType = self->_documentType;
      v3 = CFSTR("EXTENDED_REVIEW_PROVISIONING_REJECTED_TITLE_STATE_ID");
      v4 = CFSTR("EXTENDED_REVIEW_PROVISIONING_REJECTED_TITLE_DRIVER_LICENSE");
      goto LABEL_11;
    case 3uLL:
      documentType = self->_documentType;
      v3 = CFSTR("EXTENDED_REVIEW_UNABLE_TO_ADD_TITLE_STATE_ID");
      v4 = CFSTR("EXTENDED_REVIEW_UNABLE_TO_ADD_TITLE_DRIVER_LICENSE");
      goto LABEL_11;
    case 4uLL:
      documentType = self->_documentType;
      v3 = CFSTR("EXTENDED_REVIEW_FOLLOW_VERIFICATION_INSTRUCTION_REQUIRED_TITLE_STATE_ID");
      v4 = CFSTR("EXTENDED_REVIEW_FOLLOW_VERIFICATON_INSTRUCTION_REQUIRED_TITLE_DRIVER_LICENSE");
      goto LABEL_11;
    case 6uLL:
      v5 = CFSTR("EXTENDED_REVIEW_VERIFICATION_ETA_TITLE");
      break;
    case 7uLL:
      documentType = self->_documentType;
      v3 = CFSTR("EXTENDED_REVIEW_LIVENESS_STEP_UP_REQUIRED_TITLE_STATE_ID");
      v4 = CFSTR("EXTENDED_REVIEW_LIVENESS_STEP_UP_REQUIRED_TITLE_DRIVER_LICENSE");
      goto LABEL_11;
    case 8uLL:
      documentType = self->_documentType;
      v3 = CFSTR("EXTENDED_REVIEW_PROOFING_EXPIRED_TITLE_STATE_ID");
      v4 = CFSTR("EXTENDED_REVIEW_PROOFING_EXPIRED_TITLE_DRIVER_LICENSE");
LABEL_11:
      NPKSelectStringForDocumentType(documentType, v3, v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.NanoPassKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v5, &stru_24CFF06D8, CFSTR("NanoPassKit-Identity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)body
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t documentType;
  __CFString *v9;
  __CFString *v10;

  v3 = CFSTR("EXTENDED_REVIEW_FOLLOW_VERIFICATION_INSTRUCTION_REQUIRED_BODY");
  switch(self->_notificationType)
  {
    case 0uLL:
      v3 = CFSTR("EXTENDED_REVIEW_ACTION_REQUIRED_BODY");
      goto LABEL_9;
    case 1uLL:
      v3 = CFSTR("EXTENDED_REVIEW_VERIFICATION_CODE_REQUIRED_BODY");
      goto LABEL_9;
    case 2uLL:
      v3 = CFSTR("EXTENDED_REVIEW_PROVISIONING_REJECTED_BODY");
      goto LABEL_9;
    case 3uLL:
      v3 = CFSTR("EXTENDED_REVIEW_UNABLE_TO_ADD_BODY");
      goto LABEL_9;
    case 4uLL:
      goto LABEL_13;
    case 5uLL:
      v3 = CFSTR("EXTENDED_REVIEW_VERIFICATION_CODE_TRY_AGAIN_BODY");
      goto LABEL_13;
    case 6uLL:
      v3 = CFSTR("EXTENDED_REVIEW_VERIFICATION_ETA_BODY");
      goto LABEL_9;
    case 7uLL:
      documentType = self->_documentType;
      v9 = CFSTR("EXTENDED_REVIEW_LIVENESS_STEP_UP_REQUIRED_BODY_STATE_ID");
      v10 = CFSTR("EXTENDED_REVIEW_LIVENESS_STEP_UP_REQUIRED_BODY_DRIVER_LICENSE");
      goto LABEL_12;
    case 8uLL:
      documentType = self->_documentType;
      v9 = CFSTR("EXTENDED_REVIEW_PROOFING_EXPIRED_BODY_STATE_ID");
      v10 = CFSTR("EXTENDED_REVIEW_PROOFING_EXPIRED_BODY_DRIVER_LICENSE");
LABEL_12:
      NPKSelectStringForDocumentType(documentType, v9, v10);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.NanoPassKit"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", v3, &stru_24CFF06D8, CFSTR("NanoPassKit-Identity"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
LABEL_9:
      v4 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.NanoPassKit"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", v3, &stru_24CFF06D8, CFSTR("NanoPassKit-Identity"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", v6, self->_issuerName);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      break;
  }

  return v7;
}

- (id)identifierHashComponents
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NPKIdentityExtendedReviewUserNotification;
  -[NPKUserNotification identifierHashComponents](&v6, sel_identifierHashComponents);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "safelyAddObject:", self->_issuerName);
  return v4;
}

- (unint64_t)notificationType
{
  return self->_notificationType;
}

- (unint64_t)documentType
{
  return self->_documentType;
}

- (NSString)issuerName
{
  return self->_issuerName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issuerName, 0);
}

@end
