@implementation _HKFitnessFriendAchievement

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKFitnessFriendAchievement;
  v4 = a3;
  -[HKSample encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_friendUUID, CFSTR("FriendUUID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_templateUniqueName, CFSTR("TemplateUniqueName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_completedDate, CFSTR("CompletedDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_value, CFSTR("Value"));

}

- (NSUUID)friendUUID
{
  return self->_friendUUID;
}

- (NSDate)completedDate
{
  return self->_completedDate;
}

- (NSNumber)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_completedDate, 0);
  objc_storeStrong((id *)&self->_templateUniqueName, 0);
  objc_storeStrong((id *)&self->_friendUUID, 0);
}

- (void)setFriendUUID:(id)a3
{
  objc_storeStrong((id *)&self->_friendUUID, a3);
}

- (void)setCompletedDate:(id)a3
{
  objc_storeStrong((id *)&self->_completedDate, a3);
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FitnessFriendAchievement(%@ friend: %@, completion date: %@, value: %@)"), self->_templateUniqueName, self->_friendUUID, self->_completedDate, self->_value);
}

+ (id)achievementWithTemplateUniqueName:(id)a3 completedDate:(id)a4 value:(id)a5 friendUUID:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v26;
  void *v27;
  objc_super v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKFitnessFriendAchievement.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("templateUniqueName != nil"));

    if (v12)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKFitnessFriendAchievement.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completedDate != nil"));

    goto LABEL_3;
  }
  if (!v12)
    goto LABEL_5;
LABEL_3:
  +[HKObjectType fitnessFriendAchievementType](HKObjectType, "fitnessFriendAchievementType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v17 = v16;
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v19 = v18;
  v29[1] = 3221225472;
  v29[2] = __96___HKFitnessFriendAchievement_achievementWithTemplateUniqueName_completedDate_value_friendUUID___block_invoke;
  v29[3] = &unk_1E37F3170;
  v30 = v14;
  v31 = v11;
  v32 = v12;
  v33 = v13;
  v28.receiver = a1;
  v28.super_class = (Class)&OBJC_METACLASS____HKFitnessFriendAchievement;
  v29[0] = MEMORY[0x1E0C809B0];
  v20 = v13;
  v21 = v12;
  v22 = v11;
  v23 = v14;
  v24 = objc_msgSendSuper2(&v28, sel__newSampleWithType_startDate_endDate_device_metadata_config_, v15, 0, 0, v29, v17, v19);

  return v24;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (_HKFitnessFriendAchievement)initWithCoder:(id)a3
{
  id v4;
  _HKFitnessFriendAchievement *v5;
  uint64_t v6;
  NSUUID *friendUUID;
  uint64_t v8;
  NSString *templateUniqueName;
  uint64_t v10;
  NSDate *completedDate;
  uint64_t v12;
  NSNumber *value;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_HKFitnessFriendAchievement;
  v5 = -[HKSample initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FriendUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    friendUUID = v5->_friendUUID;
    v5->_friendUUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TemplateUniqueName"));
    v8 = objc_claimAutoreleasedReturnValue();
    templateUniqueName = v5->_templateUniqueName;
    v5->_templateUniqueName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CompletedDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    completedDate = v5->_completedDate;
    v5->_completedDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Value"));
    v12 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSNumber *)v12;

  }
  return v5;
}

- (NSString)templateUniqueName
{
  return self->_templateUniqueName;
}

- (void)setTemplateUniqueName:(id)a3
{
  objc_storeStrong((id *)&self->_templateUniqueName, a3);
}

@end
