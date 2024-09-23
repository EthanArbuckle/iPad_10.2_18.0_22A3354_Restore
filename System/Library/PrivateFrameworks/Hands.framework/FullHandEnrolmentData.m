@implementation FullHandEnrolmentData

- (FullHandEnrolmentData)init
{
  FullHandEnrolmentData *v2;
  SingleHandEnrolmentData *v3;
  SingleHandEnrolmentData *leftHandEnrolmentData;
  SingleHandEnrolmentData *v5;
  SingleHandEnrolmentData *rightHandEnrolmentData;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FullHandEnrolmentData;
  v2 = -[FullHandEnrolmentData init](&v8, sel_init);
  v3 = objc_alloc_init(SingleHandEnrolmentData);
  leftHandEnrolmentData = v2->_leftHandEnrolmentData;
  v2->_leftHandEnrolmentData = v3;

  v5 = objc_alloc_init(SingleHandEnrolmentData);
  rightHandEnrolmentData = v2->_rightHandEnrolmentData;
  v2->_rightHandEnrolmentData = v5;

  v2->_handRadiusEstimated = 0.0;
  return v2;
}

- (FullHandEnrolmentData)initWithJSONData:(id)a3
{
  id v4;
  FullHandEnrolmentData *v5;
  void *v6;
  id v7;
  SingleHandEnrolmentData *v8;
  void *v9;
  uint64_t v10;
  SingleHandEnrolmentData *rightHandEnrolmentData;
  SingleHandEnrolmentData *v12;
  void *v13;
  uint64_t v14;
  SingleHandEnrolmentData *leftHandEnrolmentData;
  void *v16;
  float v17;
  id v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FullHandEnrolmentData;
  v5 = -[FullHandEnrolmentData init](&v20, sel_init);
  v19 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 4, &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;
  if (v7)
    objc_exception_throw(v7);
  v8 = [SingleHandEnrolmentData alloc];
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_rightHandEnrolmentData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SingleHandEnrolmentData initWithBoneLength:](v8, "initWithBoneLength:", v9);
  rightHandEnrolmentData = v5->_rightHandEnrolmentData;
  v5->_rightHandEnrolmentData = (SingleHandEnrolmentData *)v10;

  v12 = [SingleHandEnrolmentData alloc];
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_leftHandEnrolmentData"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SingleHandEnrolmentData initWithBoneLength:](v12, "initWithBoneLength:", v13);
  leftHandEnrolmentData = v5->_leftHandEnrolmentData;
  v5->_leftHandEnrolmentData = (SingleHandEnrolmentData *)v14;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_handRadiusEstimated"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  v5->_handRadiusEstimated = v17;

  return v5;
}

- (FullHandEnrolmentData)initWithLeftHandEnrolmentData:(id)a3 rightHandEnrolmentData:(id)a4 handRadiusEstimated:(float)a5
{
  SingleHandEnrolmentData *v8;
  SingleHandEnrolmentData *v9;
  FullHandEnrolmentData *v10;
  SingleHandEnrolmentData *leftHandEnrolmentData;
  SingleHandEnrolmentData *v12;
  SingleHandEnrolmentData *rightHandEnrolmentData;
  objc_super v15;

  v8 = (SingleHandEnrolmentData *)a3;
  v9 = (SingleHandEnrolmentData *)a4;
  v15.receiver = self;
  v15.super_class = (Class)FullHandEnrolmentData;
  v10 = -[FullHandEnrolmentData init](&v15, sel_init);
  leftHandEnrolmentData = v10->_leftHandEnrolmentData;
  v10->_leftHandEnrolmentData = v8;
  v12 = v8;

  rightHandEnrolmentData = v10->_rightHandEnrolmentData;
  v10->_rightHandEnrolmentData = v9;

  v10->_handRadiusEstimated = a5;
  return v10;
}

- (id)toString
{
  SingleHandEnrolmentData *leftHandEnrolmentData;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SingleHandEnrolmentData *rightHandEnrolmentData;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  leftHandEnrolmentData = self->_leftHandEnrolmentData;
  if (leftHandEnrolmentData)
  {
    v4 = CFSTR("Bone lengthes:\n\n");
    -[SingleHandEnrolmentData boneLengths](leftHandEnrolmentData, "boneLengths");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[SingleHandEnrolmentData boneLengths](self->_leftHandEnrolmentData, "boneLengths");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("Bone lengthes:\n\n"), "stringByAppendingString:", v7);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v4 = CFSTR("Bone lengthes:\n\n");
  }
  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("\n\n"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  rightHandEnrolmentData = self->_rightHandEnrolmentData;
  if (rightHandEnrolmentData)
  {
    -[SingleHandEnrolmentData boneLengths](rightHandEnrolmentData, "boneLengths");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[SingleHandEnrolmentData boneLengths](self->_rightHandEnrolmentData, "boneLengths");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingString:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v13;
    }
  }
  return v8;
}

- (id)toJSONDataWithPrettyFormat:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[SingleHandEnrolmentData boneLengths](self->_rightHandEnrolmentData, "boneLengths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("_rightHandEnrolmentData"));

  -[SingleHandEnrolmentData boneLengths](self->_leftHandEnrolmentData, "boneLengths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("_leftHandEnrolmentData"));

  *(float *)&v8 = self->_handRadiusEstimated;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("_handRadiusEstimated"));

  objc_msgSend(v5, "handsKit_jsonDataWithPrettyPrint:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (SingleHandEnrolmentData)leftHandEnrolmentData
{
  return (SingleHandEnrolmentData *)objc_getProperty(self, a2, 16, 1);
}

- (SingleHandEnrolmentData)rightHandEnrolmentData
{
  return (SingleHandEnrolmentData *)objc_getProperty(self, a2, 24, 1);
}

- (float)handRadiusEstimated
{
  return self->_handRadiusEstimated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightHandEnrolmentData, 0);
  objc_storeStrong((id *)&self->_leftHandEnrolmentData, 0);
}

@end
