@implementation FPMoveInfo

- (FPMoveInfo)initWithOperationID:(id)a3 roots:(id)a4 rootFilenames:(id)a5 targetFolder:(id)a6 lastUsedDatePolicy:(unint64_t)a7 bounce:(BOOL)a8 byCopy:(BOOL)a9
{
  id v16;
  id v17;
  FPMoveInfo *v18;
  FPMoveInfo *v19;
  objc_super v21;

  v16 = a5;
  v17 = a6;
  v21.receiver = self;
  v21.super_class = (Class)FPMoveInfo;
  v18 = -[FPActionOperationInfo initWithOperationID:roots:](&v21, sel_initWithOperationID_roots_, a3, a4);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_targetFolder, a6);
    v19->_lastUsedDatePolicy = a7;
    v19->_shouldBounce = a8;
    v19->_byCopy = a9;
    objc_storeStrong((id *)&v19->_rootFilenames, a5);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FPMoveInfo;
  v4 = a3;
  -[FPActionOperationInfo encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  if (-[FPActionOperationInfo attachSandboxExtensionsOnXPCEncoding](self, "attachSandboxExtensionsOnXPCEncoding", v5.receiver, v5.super_class))
  {
    -[FPActionOperationLocator attachSandboxExtensionOnXPCEncoding](self->_targetFolder, "attachSandboxExtensionOnXPCEncoding");
  }
  objc_msgSend(v4, "encodeObject:forKey:", self->_targetFolder, CFSTR("_targetFolder"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_lastUsedDatePolicy, CFSTR("_lastUsedDatePolicy"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldBounce, CFSTR("_shouldBounce"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_byCopy, CFSTR("_byCopy"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_rootFilenames, CFSTR("_rootFilenames"));

}

- (FPMoveInfo)initWithCoder:(id)a3
{
  id v4;
  FPMoveInfo *v5;
  uint64_t v6;
  FPActionOperationLocator *targetFolder;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *rootFilenames;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FPMoveInfo;
  v5 = -[FPActionOperationInfo initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_targetFolder"));
    v6 = objc_claimAutoreleasedReturnValue();
    targetFolder = v5->_targetFolder;
    v5->_targetFolder = (FPActionOperationLocator *)v6;

    v5->_lastUsedDatePolicy = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_lastUsedDatePolicy"));
    v5->_shouldBounce = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldBounce"));
    v5->_byCopy = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_byCopy"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_rootFilenames"));
    v11 = objc_claimAutoreleasedReturnValue();
    rootFilenames = v5->_rootFilenames;
    v5->_rootFilenames = (NSArray *)v11;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("{ "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_byCopy)
    v5 = CFSTR("copy ");
  else
    v5 = CFSTR("move ");
  objc_msgSend(v3, "appendString:", v5);
  -[FPActionOperationInfo roots](self, "roots");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("roots:%@ "), v6);

  -[FPMoveInfo rootFilenames](self, "rootFilenames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("dst-names:%@ "), v7);

  objc_msgSend(v4, "appendFormat:", CFSTR("target:%@ "), self->_targetFolder);
  v8 = 121;
  if (!self->_shouldBounce)
    v8 = 110;
  objc_msgSend(v4, "appendFormat:", CFSTR("bounce:%c "), v8);
  objc_msgSend(v4, "appendFormat:", CFSTR("qos:%2.0x "), -[FPActionOperationInfo qos](self, "qos"));
  objc_msgSend(v4, "appendString:", CFSTR("}"));
  return v4;
}

- (BOOL)byMoving
{
  return !self->_byCopy;
}

- (FPActionOperationLocator)targetFolder
{
  return self->_targetFolder;
}

- (void)setTargetFolder:(id)a3
{
  objc_storeStrong((id *)&self->_targetFolder, a3);
}

- (NSArray)rootFilenames
{
  return self->_rootFilenames;
}

- (void)setRootFilenames:(id)a3
{
  objc_storeStrong((id *)&self->_rootFilenames, a3);
}

- (unint64_t)lastUsedDatePolicy
{
  return self->_lastUsedDatePolicy;
}

- (void)setLastUsedDatePolicy:(unint64_t)a3
{
  self->_lastUsedDatePolicy = a3;
}

- (BOOL)shouldBounce
{
  return self->_shouldBounce;
}

- (void)setShouldBounce:(BOOL)a3
{
  self->_shouldBounce = a3;
}

- (BOOL)byCopy
{
  return self->_byCopy;
}

- (void)setByCopy:(BOOL)a3
{
  self->_byCopy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootFilenames, 0);
  objc_storeStrong((id *)&self->_targetFolder, 0);
}

@end
