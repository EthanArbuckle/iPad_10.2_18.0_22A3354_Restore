@implementation HKContributor

- (id)_initWithUUID:(id)a3 appleID:(id)a4 callerID:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKContributor *v11;
  uint64_t v12;
  NSUUID *UUID;
  uint64_t v14;
  NSString *appleID;
  uint64_t v16;
  NSString *callerID;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKContributor;
  v11 = -[HKContributor init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    UUID = v11->_UUID;
    v11->_UUID = (NSUUID *)v12;

    v14 = objc_msgSend(v9, "copy");
    appleID = v11->_appleID;
    v11->_appleID = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    callerID = v11->_callerID;
    v11->_callerID = (NSString *)v16;

  }
  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const __CFString *appleID;
  const __CFString *callerID;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  appleID = (const __CFString *)self->_appleID;
  if (!appleID)
    appleID = CFSTR("(no appleID)");
  callerID = (const __CFString *)self->_callerID;
  if (!callerID)
    callerID = CFSTR("(no callerID)");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@ %@ %@>"), v5, self->_UUID, appleID, callerID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  v3 = -[NSUUID hash](self->_UUID, "hash");
  v4 = -[NSString hash](self->_appleID, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_callerID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSUUID *UUID;
  NSUUID *v6;
  NSString *appleID;
  NSString *v8;
  NSString *callerID;
  NSString *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  UUID = self->_UUID;
  v6 = (NSUUID *)v4[1];
  if (UUID != v6 && (!v6 || !-[NSUUID isEqual:](UUID, "isEqual:")))
    goto LABEL_11;
  appleID = self->_appleID;
  v8 = (NSString *)v4[2];
  if (appleID != v8 && (!v8 || !-[NSString isEqual:](appleID, "isEqual:")))
    goto LABEL_11;
  callerID = self->_callerID;
  v10 = (NSString *)v4[3];
  if (callerID == v10)
  {
    v11 = 1;
    goto LABEL_12;
  }
  if (v10)
    v11 = -[NSString isEqual:](callerID, "isEqual:");
  else
LABEL_11:
    v11 = 0;
LABEL_12:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  id v5;

  UUID = self->_UUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", UUID, CFSTR("uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appleID, CFSTR("appleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_callerID, CFSTR("callerID"));

}

- (HKContributor)initWithCoder:(id)a3
{
  id v4;
  HKContributor *v5;
  uint64_t v6;
  NSUUID *UUID;
  uint64_t v8;
  NSString *appleID;
  uint64_t v10;
  NSString *callerID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKContributor;
  v5 = -[HKContributor init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appleID"));
    v8 = objc_claimAutoreleasedReturnValue();
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callerID"));
    v10 = objc_claimAutoreleasedReturnValue();
    callerID = v5->_callerID;
    v5->_callerID = (NSString *)v10;

  }
  return v5;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSString)callerID
{
  return self->_callerID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callerID, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
