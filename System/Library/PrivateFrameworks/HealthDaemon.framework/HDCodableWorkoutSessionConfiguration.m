@implementation HDCodableWorkoutSessionConfiguration

- (BOOL)hasWorkoutConfiguration
{
  return self->_workoutConfiguration != 0;
}

- (BOOL)hasSourceBundleIdentifier
{
  return self->_sourceBundleIdentifier != 0;
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
  v8.super_class = (Class)HDCodableWorkoutSessionConfiguration;
  -[HDCodableWorkoutSessionConfiguration description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableWorkoutSessionConfiguration dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HDCodableWorkoutConfiguration *workoutConfiguration;
  void *v5;
  NSString *sourceBundleIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  workoutConfiguration = self->_workoutConfiguration;
  if (workoutConfiguration)
  {
    -[HDCodableWorkoutConfiguration dictionaryRepresentation](workoutConfiguration, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("workoutConfiguration"));

  }
  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  if (sourceBundleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", sourceBundleIdentifier, CFSTR("sourceBundleIdentifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableWorkoutSessionConfigurationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_workoutConfiguration)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_sourceBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_workoutConfiguration)
  {
    objc_msgSend(v4, "setWorkoutConfiguration:");
    v4 = v5;
  }
  if (self->_sourceBundleIdentifier)
  {
    objc_msgSend(v5, "setSourceBundleIdentifier:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableWorkoutConfiguration copyWithZone:](self->_workoutConfiguration, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_sourceBundleIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  HDCodableWorkoutConfiguration *workoutConfiguration;
  NSString *sourceBundleIdentifier;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((workoutConfiguration = self->_workoutConfiguration, !((unint64_t)workoutConfiguration | v4[2]))
     || -[HDCodableWorkoutConfiguration isEqual:](workoutConfiguration, "isEqual:")))
  {
    sourceBundleIdentifier = self->_sourceBundleIdentifier;
    if ((unint64_t)sourceBundleIdentifier | v4[1])
      v7 = -[NSString isEqual:](sourceBundleIdentifier, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[HDCodableWorkoutConfiguration hash](self->_workoutConfiguration, "hash");
  return -[NSString hash](self->_sourceBundleIdentifier, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HDCodableWorkoutConfiguration *workoutConfiguration;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  workoutConfiguration = self->_workoutConfiguration;
  v6 = v4[2];
  v7 = v4;
  if (workoutConfiguration)
  {
    if (!v6)
      goto LABEL_7;
    -[HDCodableWorkoutConfiguration mergeFrom:](workoutConfiguration, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HDCodableWorkoutSessionConfiguration setWorkoutConfiguration:](self, "setWorkoutConfiguration:");
  }
  v4 = v7;
LABEL_7:
  if (v4[1])
  {
    -[HDCodableWorkoutSessionConfiguration setSourceBundleIdentifier:](self, "setSourceBundleIdentifier:");
    v4 = v7;
  }

}

- (HDCodableWorkoutConfiguration)workoutConfiguration
{
  return self->_workoutConfiguration;
}

- (void)setWorkoutConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_workoutConfiguration, a3);
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (void)setSourceBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
}

@end
