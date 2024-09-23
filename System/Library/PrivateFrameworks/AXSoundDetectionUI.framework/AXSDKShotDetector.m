@implementation AXSDKShotDetector

- (AXSDKShotDetector)initWithName:(id)a3
{
  id v5;
  AXSDKShotDetector *v6;
  AXSDKShotDetector *v7;
  NSDate *lastAttemptedTrainingDate;
  void *v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AXSDKShotDetector;
  v6 = -[AXSDKShotDetector init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_customName, a3);
    objc_storeStrong((id *)&v7->_kshotCategory, (id)*MEMORY[0x24BDFF158]);
    lastAttemptedTrainingDate = v7->_lastAttemptedTrainingDate;
    v7->_lastAttemptedTrainingDate = 0;

    -[AXSDKShotDetector setName:](v7, "setName:", v7->_customName);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSDDetector setIdentifier:](v7, "setIdentifier:", v10);

    -[AXSDKShotDetector setCategory:](v7, "setCategory:", v7->_kshotCategory);
    -[AXSDKShotDetector setModelFailed:](v7, "setModelFailed:", 0);
    -[AXSDKShotDetector setTrainings:](v7, "setTrainings:", 0);
  }

  return v7;
}

- (AXSDKShotDetector)initWithName:(id)a3 andIdentifier:(id)a4
{
  id v7;
  id v8;
  AXSDKShotDetector *v9;
  AXSDKShotDetector *v10;
  NSDate *lastAttemptedTrainingDate;
  void *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AXSDKShotDetector;
  v9 = -[AXSDKShotDetector init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_customName, a3);
    objc_storeStrong((id *)&v10->_kshotCategory, (id)*MEMORY[0x24BDFF158]);
    lastAttemptedTrainingDate = v10->_lastAttemptedTrainingDate;
    v10->_lastAttemptedTrainingDate = 0;

    -[AXSDKShotDetector setName:](v10, "setName:", v10->_customName);
    objc_msgSend(v8, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSDDetector setIdentifier:](v10, "setIdentifier:", v12);

    -[AXSDKShotDetector setCategory:](v10, "setCategory:", v10->_kshotCategory);
    -[AXSDKShotDetector setModelFailed:](v10, "setModelFailed:", 0);
    -[AXSDKShotDetector setTrainings:](v10, "setTrainings:", 0);
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[AXSDKShotDetector name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[AXSDDetector identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

  -[AXSDKShotDetector category](self, "category");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("category"));

  objc_msgSend(v4, "encodeBool:forKey:", -[AXSDKShotDetector modelFailed](self, "modelFailed"), CFSTR("modelFailed"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[AXSDKShotDetector trainings](self, "trainings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("trainings"));

  -[AXSDKShotDetector lastAttemptedTrainingDate](self, "lastAttemptedTrainingDate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("lastAttemptedTrainingDate"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXSDKShotDetector)initWithCoder:(id)a3
{
  id v4;
  AXSDKShotDetector *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AXSDKShotDetector;
  v5 = -[AXSDKShotDetector init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSDKShotDetector setName:](v5, "setName:", v6);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSDDetector setIdentifier:](v5, "setIdentifier:", v7);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("category"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSDKShotDetector setCategory:](v5, "setCategory:", v8);

    -[AXSDKShotDetector setModelFailed:](v5, "setModelFailed:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("modelFailed")));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("trainings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSDKShotDetector setTrainings:](v5, "setTrainings:", objc_msgSend(v9, "unsignedIntegerValue"));

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("lastAttemptedTrainingDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSDKShotDetector setLastAttemptedTrainingDate:](v5, "setLastAttemptedTrainingDate:", v10);

  }
  return v5;
}

- (NSString)name
{
  return self->_customName;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_customName, a3);
}

- (NSString)category
{
  return self->_kshotCategory;
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_kshotCategory, a3);
}

- (BOOL)isCustom
{
  return 1;
}

- (unint64_t)compatibilityVersion
{
  return 3;
}

- (unint64_t)contentVersion
{
  return 1;
}

- (BOOL)isEqualToKShotDetector:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AXSDDetector identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (id)modelURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF48];
  -[AXSDKShotDetector modelURLString](self, "modelURLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)modelURLString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)*MEMORY[0x24BDFF180];
  -[AXSDDetector identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathExtension:", *MEMORY[0x24BDFF188]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isModelReady
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSDKShotDetector modelURLString](self, "modelURLString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

- (id)recordings
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "kShotSoundRecordingsForDetector:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setRecordings:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x24BDFF278];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "kShotSoundRecordings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v7, "mutableCopy");

  -[AXSDDetector identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v5, v8);

  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setKShotSoundRecordings:", v10);

}

- (void)addRecording:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AXSDKShotDetector recordings](self, "recordings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addObject:", v4);
  -[AXSDKShotDetector setRecordings:](self, "setRecordings:", v6);

}

- (BOOL)isTrainingComplete
{
  void *v2;
  BOOL v3;

  -[AXSDKShotDetector recordings](self, "recordings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 4;

  return v3;
}

- (id)mlModel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v13;
  id v14;

  v3 = (void *)MEMORY[0x24BDBCF48];
  -[AXSDKShotDetector modelURLString](self, "modelURLString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x24BDBFFC8], "compileModelAtURL:error:", v5, &v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    if (v6)
      v8 = v7 == 0;
    else
      v8 = 0;
    if (v8)
    {
      v13 = 0;
      objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", v6, &v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v13;
    }
    else
    {
      v9 = v7;
      AXLogUltron();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[AXSDKShotDetector mlModel].cold.2(self);

      v11 = 0;
    }

  }
  else
  {
    AXLogUltronKShot();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AXSDKShotDetector mlModel].cold.1(self);
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  AXSDKShotDetector *v4;
  BOOL v5;

  v4 = (AXSDKShotDetector *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[AXSDKShotDetector isEqualToKShotDetector:](self, "isEqualToKShotDetector:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AXSDDetector identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)shouldRetrain
{
  return !-[AXSDKShotDetector modelFailed](self, "modelFailed")
      && !-[AXSDKShotDetector isModelReady](self, "isModelReady")
      && -[AXSDKShotDetector isTrainingComplete](self, "isTrainingComplete");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[AXSDDetector identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@] Identifier: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
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
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[AXSDKShotDetector description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSDKShotDetector name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSDKShotDetector category](self, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AXSDKShotDetector isModelReady](self, "isModelReady"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSDKShotDetector modelURLString](self, "modelURLString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSDKShotDetector recordings](self, "recordings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AXSDKShotDetector modelFailed](self, "modelFailed"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[AXSDKShotDetector trainings](self, "trainings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSDKShotDetector lastAttemptedTrainingDate](self, "lastAttemptedTrainingDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, Name: %@, Category: %@, Is Ready: %@, Model URL: %@, Recordings: %@, Model Failed: %@, Trainings: %@, Last Attempted Training Date: %@"), v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)modelFailed
{
  return self->_modelFailed;
}

- (void)setModelFailed:(BOOL)a3
{
  self->_modelFailed = a3;
}

- (unint64_t)trainings
{
  return self->_trainings;
}

- (void)setTrainings:(unint64_t)a3
{
  self->_trainings = a3;
}

- (NSDate)lastAttemptedTrainingDate
{
  return self->_lastAttemptedTrainingDate;
}

- (void)setLastAttemptedTrainingDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastAttemptedTrainingDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAttemptedTrainingDate, 0);
  objc_storeStrong((id *)&self->_kshotCategory, 0);
  objc_storeStrong((id *)&self->_customName, 0);
}

- (void)mlModel
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_21ACD4000, v3, v4, "Unable to compile MLModel for detector %@ %@. error: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2_2();
}

@end
