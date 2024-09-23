@implementation AMLPhotosShareMetrics

+ (id)logger
{
  if (logger_onceToken != -1)
    dispatch_once(&logger_onceToken, &__block_literal_global);
  return (id)logger_logger;
}

void __31__AMLPhotosShareMetrics_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.aeroml.AMLFramework", "AMLPhotosShareMetricsLogging");
  v1 = (void *)logger_logger;
  logger_logger = (uint64_t)v0;

  if (!logger_logger && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __31__AMLPhotosShareMetrics_logger__block_invoke_cold_1();
}

+ (double)shareInformationForPhotoId:(id)a3 startTime:(id)a4 endTime:(id)a5 interactionStorePath:(id)a6
{
  id v6;
  NSObject *v7;

  v6 = a3;
  +[AMLPhotosShareMetrics logger](AMLPhotosShareMetrics, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    +[AMLPhotosShareMetrics shareInformationForPhotoId:startTime:endTime:interactionStorePath:].cold.1((uint64_t)v6, v7);

  return -1.0;
}

void __31__AMLPhotosShareMetrics_logger__block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_235F59000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Couldn't create os_log_t logger", v0, 2u);
}

+ (void)shareInformationForPhotoId:(uint64_t)a1 startTime:(NSObject *)a2 endTime:interactionStorePath:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_235F59000, a2, OS_LOG_TYPE_ERROR, "shareInformationForPhotoId: %@ is: -1", (uint8_t *)&v2, 0xCu);
}

@end
