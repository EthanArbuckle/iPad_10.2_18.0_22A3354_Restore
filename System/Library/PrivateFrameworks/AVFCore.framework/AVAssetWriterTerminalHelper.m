@implementation AVAssetWriterTerminalHelper

- (AVAssetWriterTerminalHelper)initWithConfigurationState:(id)a3
{
  AVAssetWriterTerminalHelper *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVAssetWriterTerminalHelper;
  v4 = -[AVAssetWriterHelper initWithConfigurationState:](&v7, sel_initWithConfigurationState_, a3);
  v5 = objc_opt_class();
  AVRequireConcreteObject(v4, a2, v5);
  return v4;
}

- (BOOL)_isDefunct
{
  return 0;
}

@end
