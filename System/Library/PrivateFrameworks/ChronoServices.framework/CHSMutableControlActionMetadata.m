@implementation CHSMutableControlActionMetadata

- (void)setIntentType:(id)a3
{
  NSString *v4;
  NSString *intentType;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  intentType = self->super._intentType;
  self->super._intentType = v4;

}

- (void)setIsLauncher:(BOOL)a3
{
  self->super._isLauncher = a3;
}

- (void)setIsCameraCapture:(BOOL)a3
{
  self->super._isCameraCapture = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CHSControlActionMetadata _initWithMetadata:]([CHSControlActionMetadata alloc], "_initWithMetadata:", self);
}

@end
