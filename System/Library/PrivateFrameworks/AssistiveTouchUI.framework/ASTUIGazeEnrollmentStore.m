@implementation ASTUIGazeEnrollmentStore

- (NSArray)calibratedArray
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assistiveTouchMouseOnDeviceEyeTrackingCalibratedValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)enrollmentComplete
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "assistiveTouchMouseOnDeviceEyeTrackingEnrollmentCompleted");

  return v3;
}

- (void)saveEnrollmentPoint:(CGPoint)a3 withGazePoint:(CGPoint)a4
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  y = a4.y;
  x = a4.x;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", a3.x, a3.y);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", x, y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assistiveTouchMouseOnDeviceEyeTrackingEnrollmentPointToGazePointMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v13, v12);
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAssistiveTouchMouseOnDeviceEyeTrackingEnrollmentPointToGazePointMap:", v9);

}

- (void)saveCalibratedArray:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BE006C0];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAssistiveTouchMouseOnDeviceEyeTrackingCalibratedValues:", v4);

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAssistiveTouchMouseOnDeviceEyeTrackingEnrollmentPointToGazePointMap:", 0);

}

- (void)saveEnrollmentCompleted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssistiveTouchMouseOnDeviceEyeTrackingEnrollmentCompleted:", v3);

}

- (void)clearStore
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAssistiveTouchMouseOnDeviceEyeTrackingEnrollmentCompleted:", 0);

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAssistiveTouchMouseOnDeviceEyeTrackingCalibratedValues:", 0);

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssistiveTouchMouseOnDeviceEyeTrackingEnrollmentPointToGazePointMap:", 0);

}

- (id)_retrieveDictionary
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  id v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assistiveTouchMouseOnDeviceEyeTrackingEnrollmentPointToGazePointMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v19 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v19)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v8, 0);
        v10 = objc_alloc(MEMORY[0x24BDBCE50]);
        objc_msgSend(v4, "objectForKeyedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v10, "initWithBase64EncodedString:options:", v11, 0);

        objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v12, 0);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v13)
          v16 = v14 == 0;
        else
          v16 = 1;
        if (!v16)
          objc_msgSend(v18, "setObject:forKey:", v14, v13);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  return v18;
}

@end
