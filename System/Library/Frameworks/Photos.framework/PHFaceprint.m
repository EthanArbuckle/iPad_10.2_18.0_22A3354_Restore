@implementation PHFaceprint

- (PHFaceprint)initWithFaceprintData:(id)a3 faceprintVersion:(int64_t)a4
{
  id v8;
  PHFaceprint *v9;
  PHFaceprint *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHFaceprint.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)PHFaceprint;
  v9 = -[PHFaceprint init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_faceprintData, a3);
    v10->_faceprintVersion = a4;
  }

  return v10;
}

- (id)dictionaryRepresentation
{
  int64_t faceprintVersion;
  NSData *faceprintData;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  faceprintVersion = self->_faceprintVersion;
  faceprintData = self->_faceprintData;
  v7[0] = CFSTR("faceprintData");
  v7[1] = CFSTR("faceprintVersion");
  v8[0] = faceprintData;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", faceprintVersion);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PHFaceprint)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PHFaceprint *v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceprintData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceprintVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PHFaceprint initWithFaceprintData:faceprintVersion:](self, "initWithFaceprintData:faceprintVersion:", v5, objc_msgSend(v6, "integerValue"));
  return v7;
}

- (int64_t)faceprintVersion
{
  return self->_faceprintVersion;
}

- (NSData)faceprintData
{
  return self->_faceprintData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceprintData, 0);
}

@end
