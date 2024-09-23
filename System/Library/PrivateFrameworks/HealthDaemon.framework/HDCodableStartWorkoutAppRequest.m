@implementation HDCodableStartWorkoutAppRequest

- (BOOL)hasRequestIdentifier
{
  return self->_requestIdentifier != 0;
}

- (BOOL)hasApplicationIdentifier
{
  return self->_applicationIdentifier != 0;
}

- (BOOL)hasWorkoutConfiguration
{
  return self->_workoutConfiguration != 0;
}

- (BOOL)hasWorkoutPlanData
{
  return self->_workoutPlanData != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDCodableStartWorkoutAppRequest;
  -[HDCodableStartWorkoutAppRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableStartWorkoutAppRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *requestIdentifier;
  NSString *applicationIdentifier;
  HDCodableWorkoutConfiguration *workoutConfiguration;
  void *v8;
  NSData *workoutPlanData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  requestIdentifier = self->_requestIdentifier;
  if (requestIdentifier)
    objc_msgSend(v3, "setObject:forKey:", requestIdentifier, CFSTR("requestIdentifier"));
  applicationIdentifier = self->_applicationIdentifier;
  if (applicationIdentifier)
    objc_msgSend(v4, "setObject:forKey:", applicationIdentifier, CFSTR("applicationIdentifier"));
  workoutConfiguration = self->_workoutConfiguration;
  if (workoutConfiguration)
  {
    -[HDCodableWorkoutConfiguration dictionaryRepresentation](workoutConfiguration, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("workoutConfiguration"));

  }
  workoutPlanData = self->_workoutPlanData;
  if (workoutPlanData)
    objc_msgSend(v4, "setObject:forKey:", workoutPlanData, CFSTR("workoutPlanData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableStartWorkoutAppRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_requestIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_applicationIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_workoutConfiguration)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_workoutPlanData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_requestIdentifier)
  {
    objc_msgSend(v4, "setRequestIdentifier:");
    v4 = v5;
  }
  if (self->_applicationIdentifier)
  {
    objc_msgSend(v5, "setApplicationIdentifier:");
    v4 = v5;
  }
  if (self->_workoutConfiguration)
  {
    objc_msgSend(v5, "setWorkoutConfiguration:");
    v4 = v5;
  }
  if (self->_workoutPlanData)
  {
    objc_msgSend(v5, "setWorkoutPlanData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_requestIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_applicationIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[HDCodableWorkoutConfiguration copyWithZone:](self->_workoutConfiguration, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSData copyWithZone:](self->_workoutPlanData, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *requestIdentifier;
  NSString *applicationIdentifier;
  HDCodableWorkoutConfiguration *workoutConfiguration;
  NSData *workoutPlanData;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((requestIdentifier = self->_requestIdentifier, !((unint64_t)requestIdentifier | v4[2]))
     || -[NSString isEqual:](requestIdentifier, "isEqual:"))
    && ((applicationIdentifier = self->_applicationIdentifier, !((unint64_t)applicationIdentifier | v4[1]))
     || -[NSString isEqual:](applicationIdentifier, "isEqual:"))
    && ((workoutConfiguration = self->_workoutConfiguration, !((unint64_t)workoutConfiguration | v4[3]))
     || -[HDCodableWorkoutConfiguration isEqual:](workoutConfiguration, "isEqual:")))
  {
    workoutPlanData = self->_workoutPlanData;
    if ((unint64_t)workoutPlanData | v4[4])
      v9 = -[NSData isEqual:](workoutPlanData, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_requestIdentifier, "hash");
  v4 = -[NSString hash](self->_applicationIdentifier, "hash") ^ v3;
  v5 = -[HDCodableWorkoutConfiguration hash](self->_workoutConfiguration, "hash");
  return v4 ^ v5 ^ -[NSData hash](self->_workoutPlanData, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HDCodableWorkoutConfiguration *workoutConfiguration;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[HDCodableStartWorkoutAppRequest setRequestIdentifier:](self, "setRequestIdentifier:");
    v4 = v7;
  }
  if (v4[1])
  {
    -[HDCodableStartWorkoutAppRequest setApplicationIdentifier:](self, "setApplicationIdentifier:");
    v4 = v7;
  }
  workoutConfiguration = self->_workoutConfiguration;
  v6 = v4[3];
  if (workoutConfiguration)
  {
    if (!v6)
      goto LABEL_11;
    -[HDCodableWorkoutConfiguration mergeFrom:](workoutConfiguration, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[HDCodableStartWorkoutAppRequest setWorkoutConfiguration:](self, "setWorkoutConfiguration:");
  }
  v4 = v7;
LABEL_11:
  if (v4[4])
  {
    -[HDCodableStartWorkoutAppRequest setWorkoutPlanData:](self, "setWorkoutPlanData:");
    v4 = v7;
  }

}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_applicationIdentifier, a3);
}

- (HDCodableWorkoutConfiguration)workoutConfiguration
{
  return self->_workoutConfiguration;
}

- (void)setWorkoutConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_workoutConfiguration, a3);
}

- (NSData)workoutPlanData
{
  return self->_workoutPlanData;
}

- (void)setWorkoutPlanData:(id)a3
{
  objc_storeStrong((id *)&self->_workoutPlanData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutPlanData, 0);
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
