@implementation HKCloudSyncZoneDescription

- (HKCloudSyncZoneDescription)initWithZoneIDDescription:(id)a3 type:(id)a4 ownerParticipantDescription:(id)a5 otherParticipantsDescription:(id)a6 recordDescriptions:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HKCloudSyncZoneDescription *v17;
  uint64_t v18;
  HKCloudSyncRecordZoneIDDescription *zoneIDDescription;
  uint64_t v20;
  NSString *type;
  uint64_t v22;
  HKCloudSyncShareParticipantDescription *ownerParticipantDescription;
  uint64_t v24;
  NSArray *otherParticipantsDescription;
  uint64_t v26;
  NSArray *recordDescriptions;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HKCloudSyncZoneDescription;
  v17 = -[HKCloudSyncZoneDescription init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    zoneIDDescription = v17->_zoneIDDescription;
    v17->_zoneIDDescription = (HKCloudSyncRecordZoneIDDescription *)v18;

    v20 = objc_msgSend(v13, "copy");
    type = v17->_type;
    v17->_type = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    ownerParticipantDescription = v17->_ownerParticipantDescription;
    v17->_ownerParticipantDescription = (HKCloudSyncShareParticipantDescription *)v22;

    v24 = objc_msgSend(v15, "copy");
    otherParticipantsDescription = v17->_otherParticipantsDescription;
    v17->_otherParticipantsDescription = (NSArray *)v24;

    v26 = objc_msgSend(v16, "copy");
    recordDescriptions = v17->_recordDescriptions;
    v17->_recordDescriptions = (NSArray *)v26;

  }
  return v17;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Zone ID: %@,Type: %@,Owner Participant: %@ \nOther Participants: %@ \nRecord Descriptions: %@"), self->_zoneIDDescription, self->_type, self->_ownerParticipantDescription, self->_otherParticipantsDescription, self->_recordDescriptions);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKCloudSyncRecordZoneIDDescription *zoneIDDescription;
  id v5;

  zoneIDDescription = self->_zoneIDDescription;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", zoneIDDescription, CFSTR("ZoneIDDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_type, CFSTR("Type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ownerParticipantDescription, CFSTR("OwnerParticipantDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_otherParticipantsDescription, CFSTR("OtherParticipantsDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordDescriptions, CFSTR("RecordDescriptions"));

}

- (HKCloudSyncZoneDescription)initWithCoder:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  HKCloudSyncZoneDescription *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ZoneIDDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OwnerParticipantDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("OtherParticipantsDescription"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C99E60];
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("RecordDescriptions"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[HKCloudSyncZoneDescription initWithZoneIDDescription:type:ownerParticipantDescription:otherParticipantsDescription:recordDescriptions:](self, "initWithZoneIDDescription:type:ownerParticipantDescription:otherParticipantsDescription:recordDescriptions:", v5, v6, v7, v11, v15);
  return v16;
}

- (HKCloudSyncRecordZoneIDDescription)zoneIDDescription
{
  return self->_zoneIDDescription;
}

- (NSString)type
{
  return self->_type;
}

- (HKCloudSyncShareParticipantDescription)ownerParticipantDescription
{
  return self->_ownerParticipantDescription;
}

- (NSArray)otherParticipantsDescription
{
  return self->_otherParticipantsDescription;
}

- (NSArray)recordDescriptions
{
  return self->_recordDescriptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordDescriptions, 0);
  objc_storeStrong((id *)&self->_otherParticipantsDescription, 0);
  objc_storeStrong((id *)&self->_ownerParticipantDescription, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_zoneIDDescription, 0);
}

@end
