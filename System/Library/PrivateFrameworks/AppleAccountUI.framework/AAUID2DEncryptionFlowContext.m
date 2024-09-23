@implementation AAUID2DEncryptionFlowContext

- (AAUID2DEncryptionFlowContext)initWithType:(unint64_t)a3 altDSID:(id)a4
{
  AAUID2DEncryptionFlowContext *v5;
  AAUID2DEncryptionFlowContext *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AAUID2DEncryptionFlowContext;
  v5 = -[CDPUIDeviceToDeviceEncryptionFlowContext initWithAltDSID:](&v8, sel_initWithAltDSID_, a4);
  v6 = v5;
  if (v5)
    -[AAUID2DEncryptionFlowContext setContextType:](v5, "setContextType:", a3);
  return v6;
}

- (AAUID2DEncryptionFlowContext)initWithType:(unint64_t)a3
{
  void *v5;
  void *v6;
  AAUID2DEncryptionFlowContext *v7;

  objc_msgSend(MEMORY[0x1E0D15760], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryAccountAltDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AAUID2DEncryptionFlowContext initWithType:altDSID:](self, "initWithType:altDSID:", a3, v6);

  return v7;
}

+ (id)contextWithType:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", a3);
}

+ (id)contextWithType:(unint64_t)a3 altDSID:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:altDSID:", a3, v6);

  return v7;
}

- (int64_t)deviceToDeviceEncryptionUpgradeUIStyle
{
  unint64_t v2;

  v2 = -[AAUID2DEncryptionFlowContext contextType](self, "contextType");
  if (v2 - 2 > 5)
    return 1;
  else
    return qword_1DB6391A8[v2 - 2];
}

- (BOOL)requiresSynchronousRepair
{
  return -[AAUID2DEncryptionFlowContext contextType](self, "contextType") - 5 < 3;
}

- (int64_t)deviceToDeviceEncryptionUpgradeType
{
  return 2 * (-[AAUID2DEncryptionFlowContext contextType](self, "contextType") == 7);
}

- (unint64_t)contextType
{
  return self->_contextType;
}

- (void)setContextType:(unint64_t)a3
{
  self->_contextType = a3;
}

@end
