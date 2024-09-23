@implementation AEAssessmentModeGestalt

- (AEAssessmentModeGestalt)initWithQueue:(id)a3
{
  id v4;
  AEAssessmentModeGestalt *v5;
  uint64_t v6;
  AEAssessmentStateReading *assessmentStateReader;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AEAssessmentModeGestalt;
  v5 = -[AEAssessmentModeGestalt init](&v9, sel_init);
  if (v5)
  {
    +[AEAssessmentModeGestalt makeAssessmentStateReaderWithQueue:](AEAssessmentModeGestalt, "makeAssessmentStateReaderWithQueue:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    assessmentStateReader = v5->_assessmentStateReader;
    v5->_assessmentStateReader = (AEAssessmentStateReading *)v6;

  }
  return v5;
}

- (AEAssessmentModeGestalt)init
{
  return -[AEAssessmentModeGestalt initWithQueue:](self, "initWithQueue:", MEMORY[0x24BDAC9B8]);
}

+ (id)makeAssessmentStateReaderWithQueue:(id)a3
{
  id v3;
  void *v4;
  AEFileBackedAssessmentStateReader *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  AEFileBackedAssessmentStateReader *v9;
  AEAccessibilityServerBackedAssessmentStateReader *v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (AEIsMultiAppAvailableForDeviceType(objc_msgSend(v4, "deviceType")))
  {
    v5 = [AEFileBackedAssessmentStateReader alloc];
    v6 = (void *)objc_opt_new();
    v7 = objc_opt_new();
    +[AEFileSystem assessmentModeFileURL](AEFileSystem, "assessmentModeFileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AEFileBackedAssessmentStateReader initWithSystemNotificationPrimitives:fileSystemPrimitives:assessmentFileURL:queue:](v5, "initWithSystemNotificationPrimitives:fileSystemPrimitives:assessmentFileURL:queue:", v6, v7, v8, v3);

    v3 = (id)v7;
  }
  else
  {
    v10 = [AEAccessibilityServerBackedAssessmentStateReader alloc];
    v6 = (void *)objc_opt_new();
    v9 = -[AEAccessibilityServerBackedAssessmentStateReader initWithAccessibilityServerPrimitives:queue:](v10, "initWithAccessibilityServerPrimitives:queue:", v6, v3);
  }

  return v9;
}

+ (id)keyPathsForValuesAffectingActive
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("assessmentStateReader.active"));
}

- (BOOL)isActive
{
  void *v2;
  char v3;

  -[AEAssessmentModeGestalt assessmentStateReader](self, "assessmentStateReader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActive");

  return v3;
}

- (AEAssessmentStateReading)assessmentStateReader
{
  return self->_assessmentStateReader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assessmentStateReader, 0);
}

@end
