@implementation VCCALayerHost

- (VCCALayerHost)initWithRemoteVideoClient:(id)a3
{
  VCCALayerHost *result;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCCALayerHost;
  result = -[CALayerHost init](&v5, sel_init);
  if (result)
    result->remoteVideoClient = (AVCRemoteVideoClient *)a3;
  return result;
}

- (void)layoutSublayers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid AVCRemoteVideoClient instance for the host layer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
