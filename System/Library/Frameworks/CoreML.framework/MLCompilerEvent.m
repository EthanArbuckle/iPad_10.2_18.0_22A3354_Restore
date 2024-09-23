@implementation MLCompilerEvent

- (MLCompilerEvent)init
{
  MLCompilerEvent *v2;
  MLCompilerEvent *v3;
  NSString *modelName;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MLCompilerEvent;
  v2 = -[MLCompilerEvent init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    modelName = v2->_modelName;
    v2->_modelName = 0;

  }
  return v3;
}

- (NSString)name
{
  __CFString *v2;

  v2 = CFSTR("com.apple.CoreML.MLCompiler");
  return (NSString *)CFSTR("com.apple.CoreML.MLCompiler");
}

- (NSDictionary)dictionaryRepresentation
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCompilerEvent modelName](self, "modelName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("modelName"));

  -[MLCompilerEvent modelHash](self, "modelHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("modelHash"));

  -[MLCompilerEvent modelType](self, "modelType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("modelType"));

  -[MLCompilerEvent modelOrigin](self, "modelOrigin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("modelOrigin"));

  -[MLCompilerEvent modelVersion](self, "modelVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("modelVersion"));

  -[MLCompilerEvent modelCompiledWithVersion](self, "modelCompiledWithVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("modelCompiledWithVersion"));

  -[MLCompilerEvent compilerVersion](self, "compilerVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("compilerVersion"));

  -[MLCompilerEvent milUpgradeStatus](self, "milUpgradeStatus");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("milUpgradeStatus"));

  -[MLCompilerEvent milUpgradeFailureReason](self, "milUpgradeFailureReason");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("milUpgradeFailureReason"));

  return (NSDictionary *)v3;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)modelHash
{
  return self->_modelHash;
}

- (void)setModelHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)modelType
{
  return self->_modelType;
}

- (void)setModelType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)modelOrigin
{
  return self->_modelOrigin;
}

- (void)setModelOrigin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)modelCompiledWithVersion
{
  return self->_modelCompiledWithVersion;
}

- (void)setModelCompiledWithVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)compilerVersion
{
  return self->_compilerVersion;
}

- (void)setCompilerVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)milUpgradeStatus
{
  return self->_milUpgradeStatus;
}

- (void)setMilUpgradeStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)milUpgradeFailureReason
{
  return self->_milUpgradeFailureReason;
}

- (void)setMilUpgradeFailureReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_milUpgradeFailureReason, 0);
  objc_storeStrong((id *)&self->_milUpgradeStatus, 0);
  objc_storeStrong((id *)&self->_compilerVersion, 0);
  objc_storeStrong((id *)&self->_modelCompiledWithVersion, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_modelOrigin, 0);
  objc_storeStrong((id *)&self->_modelType, 0);
  objc_storeStrong((id *)&self->_modelHash, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
}

@end
