@implementation HKSharingRecipientIdentifier

- (id)initForInvitationUUID:(id)a3
{
  return -[HKSharingRecipientIdentifier _initWithRecipientIdentifierType:invitationUUID:clinicalAccountIdentifier:](self, "_initWithRecipientIdentifierType:invitationUUID:clinicalAccountIdentifier:", 0, a3, 0);
}

- (id)initForClinicalAccountIdentifier:(id)a3
{
  return -[HKSharingRecipientIdentifier _initWithRecipientIdentifierType:invitationUUID:clinicalAccountIdentifier:](self, "_initWithRecipientIdentifierType:invitationUUID:clinicalAccountIdentifier:", 1, 0, a3);
}

- (id)_initWithRecipientIdentifierType:(unint64_t)a3 invitationUUID:(id)a4 clinicalAccountIdentifier:(id)a5
{
  id v8;
  id v9;
  HKSharingRecipientIdentifier *v10;
  HKSharingRecipientIdentifier *v11;
  uint64_t v12;
  NSUUID *invitationUUID;
  uint64_t v14;
  NSString *clinicalAccountIdentifier;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKSharingRecipientIdentifier;
  v10 = -[HKSharingRecipientIdentifier init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v12 = objc_msgSend(v8, "copy");
    invitationUUID = v11->_invitationUUID;
    v11->_invitationUUID = (NSUUID *)v12;

    v14 = objc_msgSend(v9, "copy");
    clinicalAccountIdentifier = v11->_clinicalAccountIdentifier;
    v11->_clinicalAccountIdentifier = (NSString *)v14;

  }
  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("Clinical Account");
  if (!self->_type)
    v7 = CFSTR("Shared Summary");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ %@ %@>"), v5, self, v7, self->_invitationUUID, self->_clinicalAccountIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  unint64_t type;
  uint64_t v4;

  type = self->_type;
  v4 = -[NSUUID hash](self->_invitationUUID, "hash") ^ type;
  return v4 ^ -[NSString hash](self->_clinicalAccountIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSUUID *invitationUUID;
  NSUUID *v6;
  NSString *clinicalAccountIdentifier;
  NSString *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  if (self->_type != v4[1])
    goto LABEL_9;
  invitationUUID = self->_invitationUUID;
  v6 = (NSUUID *)v4[2];
  if (invitationUUID != v6 && (!v6 || !-[NSUUID isEqual:](invitationUUID, "isEqual:")))
    goto LABEL_9;
  clinicalAccountIdentifier = self->_clinicalAccountIdentifier;
  v8 = (NSString *)v4[3];
  if (clinicalAccountIdentifier == v8)
  {
    v9 = 1;
    goto LABEL_10;
  }
  if (v8)
    v9 = -[NSString isEqual:](clinicalAccountIdentifier, "isEqual:");
  else
LABEL_9:
    v9 = 0;
LABEL_10:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("Type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_invitationUUID, CFSTR("InvitationUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clinicalAccountIdentifier, CFSTR("ClinicalAccountIdentifier"));

}

- (HKSharingRecipientIdentifier)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  HKSharingRecipientIdentifier *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("InvitationUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ClinicalAccountIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HKSharingRecipientIdentifier _initWithRecipientIdentifierType:invitationUUID:clinicalAccountIdentifier:](self, "_initWithRecipientIdentifierType:invitationUUID:clinicalAccountIdentifier:", v5, v6, v7);
  return v8;
}

+ (id)sharingRecipientIdentifierFromStringRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("SharedSummary-")))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("SharedSummary-"), "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);
    v6 = -[HKSharingRecipientIdentifier initForInvitationUUID:]([HKSharingRecipientIdentifier alloc], "initForInvitationUUID:", v5);

  }
  else
  {
    if (!objc_msgSend(v3, "hasPrefix:", CFSTR("ClinicalAccount-")))
    {
      v6 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("ClinicalAccount-"), "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HKSharingRecipientIdentifier initForClinicalAccountIdentifier:]([HKSharingRecipientIdentifier alloc], "initForClinicalAccountIdentifier:", v4);
  }

LABEL_7:
  return v6;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSUUID)invitationUUID
{
  return self->_invitationUUID;
}

- (NSString)clinicalAccountIdentifier
{
  return self->_clinicalAccountIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clinicalAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_invitationUUID, 0);
}

@end
