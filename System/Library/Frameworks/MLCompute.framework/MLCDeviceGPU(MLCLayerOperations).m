@implementation MLCDeviceGPU(MLCLayerOperations)

- (void)weightsGradients:()MLCLayerOperations .cold.1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[MLCDeviceGPU(MLCLayerOperations) weightsGradients:]";
  _os_log_error_impl(&dword_1D4999000, log, OS_LOG_TYPE_ERROR, "%s: failed to convert weight gradient layout for a convolution layer", buf, 0xCu);
}

@end
